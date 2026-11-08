gameplay_restart_song = 0
gameplay_loading_transition = 0

script ui_create_gameplay 
	show_highway
	if ($gameplay_restart_song = 1)
		loading_transition = ($gameplay_loading_transition)
		change \{gameplay_loading_transition = 0}
		spawnscriptnow restart_song params = {loading_transition = <loading_transition>}
		change \{gameplay_restart_song = 0}
	endif
	vocals_mute_all_mics \{mute = false}
	if GotParam \{from_pause}
		spawnscriptnow \{ui_create_gameplay_spawned
			params = {
				from_pause = from_pause
			}}
		ui_event_remove_params \{param = from_pause}
	else
		spawnscriptnow \{ui_create_gameplay_spawned}
	endif
endscript

script ui_destroy_gameplay 
	destroy_player_drop_events
endscript

script ui_create_gameplay_spawned 
	SetScriptCannotPause
	spawn_player_drop_listeners \{drop_player_script = gameplay_drop_player
		end_game_script = gameplay_end_game}
	ui_event_wait_for_safe
	Wait \{5
		gameframes}
	disable_pause
	begin
	if NOT ScriptIsRunning \{restart_song}
		if NOT ScriptIsRunning \{restart_gem_scroller}
			if ($is_changing_levels = 0)
				break
			endif
		endif
	endif
	Wait \{1
		gameframe}
	disable_pause \{nospam}
	repeat
	if NOT ScreenElementExists \{id = HandsOfGod}
		if NOT GotParam \{from_pause}
			enable_pause
		endif
	endif
	if GotParam \{from_pause}
		ui_event_remove_params \{param = from_pause}
	endif
	ResumeControllerChecking
	change \{sysnotify_paused_controllers = [
		]}
endscript

script ui_deinit_gameplay 
	printf \{'ui_deinit_gameplay'}
	KillSpawnedScript \{name = ui_create_gameplay_spawned}
	spawnscriptnow \{kill_gem_scroller
		params = {
			no_render = 1
		}}
	hide_glitch \{num_frames = 10}
	if ScreenElementExists \{id = HandsOfGod}
		KillSpawnedScript \{name = Anim_HandsOfGod}
		DestroyScreenElement \{id = HandsOfGod}
	endif
	UnPauseGame
	if NOT ui_event_exists_in_stack \{name = 'select_song_section'}
		SD_Unload_Song
	endif
	disable_pause
	if NOT ui_event_exists_in_stack \{name = 'jam'}
		if ($game_mode = p1_career || $game_mode = p2_career || $band_mode_mode = career)
			band_builder_clear_random_appearances \{cpu_only}
		else
			if ($game_mode = p1_quickplay)
				band_builder_clear_random_appearances \{cpu_only}
			endif
		endif
	endif
	PopVideoVenues
endscript

script animate_drop_player_msg 
	RequireParams \{[
			drop_msg
		]
		all}
	Obj_GetID
	<ObjID> :SE_SetProps {GamerTag_alpha = 1.0 gamertag_name_text = <drop_msg> GamerTag_scale = (3.0, 1.1) time = 0.1 motion = ease_out}
	<ObjID> :SE_WaitProps
	<ObjID> :SE_SetProps {GamerTag_scale = (1.3, 1.1) time = 0.1 motion = ease_out}
	<ObjID> :SE_WaitProps
endscript

script gameplay_drop_player 
	printf \{qs("\Lgameplay_drop_player")}
	GameMode_GetType
	if (<is_game_over> = 0)
		if (<type> = career)
			SetPlayerInfo <dropped_player_num> is_local_client = 0
			SetPlayerInfo <dropped_player_num> net_id_first = 0
			SetPlayerInfo <dropped_player_num> net_id_second = 0
			SetPlayerInfo <dropped_player_num> net_obj_id = -1
			SetPlayerInfo <dropped_player_num> team = 0
			SetPlayerInfo <dropped_player_num> party_id = -1
			change net_num_players = (($net_num_players) - 1)
			change current_num_players = (($current_num_players) - 1)
			change num_players_in_band = (($num_players_in_band) - 1)
			FormatText checksumname = mode 'p%d_career' d = ($current_num_players)
			change game_mode = <mode>
			change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		else
			printf \{qs("\Li'll let you decide what you want in here")}
		endif
		switch <drop_reason>
			case net_message_player_quit
			FormatText TextName = drop_msg qs("%s has quit.") s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			FormatText TextName = drop_msg qs("Lost connection to %s.") s = <name_string>
			default
			drop_msg = qs("")
		endswitch
		if ScreenElementExists \{id = hud_root}
			GetPlayerInfo <dropped_player_num> hud_parent
			if hud_root :Desc_ResolveAlias name = <hud_parent> param = parent_id
				if ScreenElementExists id = {<parent_id> child = gamertag}
					ResolveScreenElementId id = [
						{id = <parent_id>}
						{local_id = gamertag}
					]
				endif
			endif
			if GotParam \{resolved_id}
				<resolved_id> :Obj_SpawnScriptNow animate_drop_player_msg params = {drop_msg = <drop_msg>}
			endif
		endif
	else
		if ((<type> = faceoff) || (<type> = pro_faceoff))
			if ($current_num_players = 2)
				printf \{qs("\LZero quitting player's score")}
				change \{structurename = player2_status
					score = 0.0}
			endif
		endif
	endif
endscript

script gameplay_end_game 
	printf \{qs("\L---gameplay_end_game")}
	printstruct <...>
	destroy_popup_warning_menu
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		net_disable_pause
		printf \{qs(0x0c5a0998)}
		reset_remote_scores
		switch <drop_reason>
			case net_message_player_quit
			FormatText TextName = first_msg qs("%s has quit.") s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			FormatText TextName = first_msg qs("Lost connection to %s.") s = <name_string>
			default
			first_msg = qs("")
		endswitch
		FormatText TextName = msg qs("%s\nThere are not enough players to continue.") s = <first_msg>
		create_net_popup title = qs("GAME OVER") popup_text = <msg>
		Wait \{3
			seconds}
		destroy_net_popup
		quit_network_game
		GameMode_GetType
		if (<type> = career)
			if ($playing_song = 1)
				kill_gem_scroller
			endif
			GetGlobalTags \{user_options}
			if (<autosave> = 1)
				if ui_event_exists_in_stack \{name = 'group_play'}
					printf \{qs(0x26ffae70)}
					change \{is_network_game = 0}
					ui_event_get_top
					if (<base_name> = 'controller_disconnect')
						ui_event_block \{event = menu_back
							data = {
								state = uistate_group_play
							}}
					else
						ui_memcard_autosave \{event = menu_back
							state = uistate_group_play
							data = {
								all_active_players = true
							}}
					endif
				else
					printf \{qs(0x7a510fef)}
					ui_event_get_top
					if (<base_name> = 'controller_disconnect')
						ui_event_block \{event = menu_back
							data = {
								state = uistate_online
							}}
					else
						ui_memcard_autosave \{event = menu_back
							state = uistate_online
							data = {
								all_active_players = true
							}}
					endif
				endif
			else
				if ui_event_exists_in_stack \{name = 'group_play'}
					printf \{qs(0x26ffae70)}
					change \{is_network_game = 0}
					ui_event_block \{event = menu_back
						state = uistate_group_play}
				else
					printf \{qs(0x7a510fef)}
					ui_event_block \{event = menu_back
						state = uistate_online}
				endif
			endif
		elseif ($game_mode = p2_battle)
			if NOT (GameIsOver)
				change \{structurename = player1_status
					current_health = 1.0}
				change \{structurename = player2_status
					current_health = 0.0}
				GuitarEvent_SongWon \{battle_win = 1}
			endif
		else
			if NOT (GameIsOver)
				ExtendCRC \{song_won
					'p1'
					out = type}
				BroadcastEvent type = <type>
			endif
		endif
	endif
endscript

script reset_remote_scores 
	i = 1
	begin
	printf qs(0x4e31bfba) d = <i>
	GetPlayerInfo <i> is_local_client
	if NOT (<is_local_client>)
		SetPlayerInfo <i> score = 0
	endif
	i = (<i> + 1)
	repeat 8
endscript
