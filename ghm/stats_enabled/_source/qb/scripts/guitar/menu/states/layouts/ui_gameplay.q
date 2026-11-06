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
	if gotparam \{from_pause}
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
	setscriptcannotpause
	spawn_player_drop_listeners \{drop_player_script = gameplay_drop_player
		end_game_script = gameplay_end_game}
	wait \{5
		gameframes}
	disable_pause
	begin
	if NOT scriptisrunning \{restart_song}
		if NOT scriptisrunning \{restart_gem_scroller}
			if ($is_changing_levels = 0)
				break
			endif
		endif
	endif
	wait \{1
		gameframe}
	disable_pause \{nospam}
	repeat
	if NOT scriptisrunning \{guitarevent_songfailed}
		if NOT scriptisrunning \{guitarevent_songwon}
			if NOT scriptisrunning \{guitarevent_songfailed_spawned}
				if NOT scriptisrunning \{guitarevent_songwon_spawned}
					if NOT scriptisrunning \{finish_practice_song}
						if NOT screenelementexists \{id = you_rock}
							if NOT gotparam \{from_pause}
								enable_pause
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	if gotparam \{from_pause}
		ui_event_remove_params \{param = from_pause}
	endif
	gamemode_gettype
	if (<type> = career)
		if NOT progression_check_intro_complete
			if ($transition_playing = true)
				if ($current_playing_transition = careerintro)
					disable_pause
				endif
			endif
		endif
	endif
	resumecontrollerchecking
	change \{sysnotify_paused_controllers = [
		]}
	change \{unknown_drum_type = 0}
	if ($songtime_paused = 1)
		change \{songtime_paused = 0}
		startrendering
	endif
	if gameispaused
		do_gh3_unpause
	endif
endscript

script ui_deinit_gameplay 
	change menu_flow_locked = ($menu_flow_locked + 1)
	printf \{'ui_deinit_gameplay'}
	killspawnedscript \{name = ui_create_gameplay_spawned}
	spawnscriptnow \{kill_gem_scroller
		params = {
			no_render = 1
		}}
	hide_glitch \{num_frames = 10}
	if screenelementexists \{id = handsofgod}
		killspawnedscript \{name = anim_handsofgod}
		destroyscreenelement \{id = handsofgod}
	endif
	unpausegame
	if NOT ui_event_exists_in_stack \{name = 'select_song_section'}
		sd_unload_song
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
	0x136c76bb
	if 0x2e51d96c
		0x29472091
	endif
	change menu_flow_locked = ($menu_flow_locked - 1)
	killspawnedscript \{name = sysnotify_handle_pause_controller}
	killspawnedscript \{name = sysnotify_handle_pause_controller_spawned}
endscript

script animate_drop_player_msg 
	requireparams \{[
			drop_msg
		]
		all}
	obj_getid
	<objid> :se_setprops {gamertag_alpha = 1.0 gamertag_name_text = <drop_msg> gamertag_scale = (3.0, 1.1) time = 0.1 motion = ease_out}
	<objid> :se_waitprops
	<objid> :se_setprops {gamertag_scale = (1.3, 1.1) time = 0.1 motion = ease_out}
	<objid> :se_waitprops
endscript

script gameplay_drop_player 
	printf \{qs(0xbbbe3929)}
	gamemode_gettype
	if (<is_game_over> = 0)
		if (<type> = career)
			setplayerinfo <dropped_player_num> is_local_client = 0
			setplayerinfo <dropped_player_num> net_id_first = 0
			setplayerinfo <dropped_player_num> net_id_second = 0
			setplayerinfo <dropped_player_num> net_obj_id = -1
			setplayerinfo <dropped_player_num> team = 0
			setplayerinfo <dropped_player_num> party_id = -1
			change net_num_players = (($net_num_players) - 1)
			change current_num_players = (($current_num_players) - 1)
			change num_players_in_band = (($num_players_in_band) - 1)
			change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		else
			printf \{qs(0x0fdb1295)}
		endif
		switch <drop_reason>
			case net_message_player_quit
			formattext textname = drop_msg qs(0x567f10d8) s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			formattext textname = drop_msg qs(0xd4b272d7) s = <name_string>
			default
			drop_msg = qs(0x00000000)
		endswitch
		if screenelementexists \{id = hud_root}
			getplayerinfo <dropped_player_num> hud_parent
			if hud_root :desc_resolvealias name = <hud_parent> param = parent_id
				if screenelementexists id = {<parent_id> child = gamertag}
					resolvescreenelementid id = [
						{id = <parent_id>}
						{local_id = gamertag}
					]
				endif
			endif
			if gotparam \{resolved_id}
				<resolved_id> :obj_spawnscriptnow animate_drop_player_msg params = {drop_msg = <drop_msg>}
			endif
		endif
	else
		if ((<type> = faceoff) || (<type> = pro_faceoff))
			if ($current_num_players = 2)
				printf \{qs(0x3efb5626)}
				change \{structurename = player2_status
					score = 0.0}
			endif
		endif
	endif
endscript

script gameplay_end_game 
	printf \{qs(0x743ca546)}
	printstruct <...>
	begin
	if ui_event_exists_in_stack \{name = 'gameplay'}
		if NOT scriptisrunning \{ui_create_gameplay_spawned}
			break
		endif
	endif
	waitonegameframe
	repeat
	wait_for_safe_shutdown
	ui_event_wait_for_safe
	destroy_popup_warning_menu
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		net_disable_pause
		printf \{qs(0x0c5a0998)}
		0x248b5892
		switch <drop_reason>
			case net_message_player_quit
			formattext \{textname = first_msg
				qs(0x6c11dd96)}
			case net_message_player_dropped
			case net_message_player_timed_out
			formattext \{textname = first_msg
				qs(0x059fc06d)}
			default
			first_msg = qs(0x00000000)
		endswitch
		formattext textname = msg qs(0x78bb855f) s = <first_msg>
		ui_event_get_stack
		if ((<stack> [0].base_name) = 'controller_disconnect')
			ui_event \{event = menu_back}
			ui_event_wait_for_safe
		endif
		create_net_popup title = qs(0x5ca2c535) popup_text = <msg>
		wait \{3
			seconds}
		destroy_net_popup
		quit_network_game
		gamemode_gettype
		if (<type> = career)
			if ($playing_song = 1)
				kill_gem_scroller
			endif
			getglobaltags \{user_options}
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
			if NOT (gameisover)
				change \{structurename = player1_status
					current_health = 1.0}
				change \{structurename = player2_status
					current_health = 0.0}
				guitarevent_songwon \{battle_win = 1}
			endif
		else
			if NOT (gameisover)
				extendcrc \{song_won
					'p1'
					out = type}
				broadcastevent type = <type> data = {song_complete = 0}
			endif
		endif
	endif
endscript

script 0x248b5892 
	i = 1
	begin
	printf qs(0x4e31bfba) d = <i>
	getplayerinfo <i> is_local_client
	if NOT (<is_local_client>)
		setplayerinfo <i> score = 0
	endif
	i = (<i> + 1)
	repeat 8
endscript
