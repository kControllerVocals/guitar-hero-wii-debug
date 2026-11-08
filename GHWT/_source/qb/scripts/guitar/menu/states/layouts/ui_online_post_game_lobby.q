network_game_postgame_lobby = 0

script ui_init_online_post_game_lobby 
	change \{playing_song = 0}
	next_id = ($online_song_choice_id + 1)
	getnumplayers
	if (<next_id> > (<num_players> - 1))
		<next_id> = 0
	endif
	change online_song_choice_id = <next_id>
	disable_pause
endscript

script ui_deinit_online_post_game_lobby 
endscript

script kill_idle_for_post_game_lobby 
	hide_crowd_models
	destroy_crowd_models
	destroy_bg_viewport
	destroy_cameracuts
	Transition_KillAll
	change \{current_transition = none}
endscript

script idle_for_post_game_lobby 
	ResetYieldInfo \{Yield = true}
	printf \{qs("\Lloading_transition")}
	KillSpawnedScript \{name = YieldMonitor}
	spawnscriptnow \{YieldMonitor}
	Yield
	Band_PlayTransitionIdles
	BandManager_StopAllAnimIterators
	kill_gem_scroller \{type = Normal}
	Yield \{'kill_gem_scroller'}
	create_crowd_models
	setup_bg_viewport
	Yield \{'setup_bg_viewport'}
	create_cameracuts
	change \{current_transition = intro}
	Transition_Play \{type = loading}
	Yield
	UnPauseGame
	Yield
	startrendering
endscript

script ui_create_online_post_game_lobby 
	NetSessionFunc \{obj = voice
		func = TurnTeamTalkOff}
	create_menu_backdrop \{texture = PostGameMenuBG}
	GetActiveControllers
	GetArraySize <active_controllers>
	ingame_controllers = []
	i = 0
	begin
	if NetSessionFunc func = IsControllerInGame params = {controller = <i>}
		AddArrayElement array = <ingame_controllers> element = <i>
		<ingame_controllers> = <array>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	CreateScreenElement {
		parent = root_window
		id = OnlineLobbyInterface
		type = DescInterface
		desc = 'online_postgame_lobby'
		pos = (0.0, -1000.0)
		exclusive_device = <ingame_controllers>
		tags = {
			menu_index = 0
			Menu_items = 0
			loser_index = 0
			loser_items = 0
			loser_menu_id = null
			winner_index = 0
			winner_items = 0
			winner_menu_id = null
			postgame_menu_id = null
			locked_to_players = 0
			setlist_enabled = 0
			toggle_allowed = 1
		}
	}
	spawn_player_drop_listeners \{drop_player_script = lobby_drop_player_scr
		end_game_script = lobby_end_game_scr}
	spawnscriptnow \{menu_music_on}
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	OnlineLobbyInterface :Desc_CheckVersion \{desired = 3
		AssertIf = Mismatch}
	change \{network_game_postgame_lobby = 1}
	create_postgame_lobby_menu
	create_player_scores_postgame_container
	OnlineLobbyInterface :Obj_SpawnScriptNow \{online_post_game_lobby_animate_in}
	menu_finish
	NetOptions :Pref_Get \{name = game_modes}
	if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
		GetActiveControllers
		GetArraySize <active_controllers>
		i = 0
		begin
		if (<active_controllers> [<i>] = 1)
			if NetSessionFunc func = IsControllerInGame params = {controller = <i>}
				get_controller_type controller_index = <i>
				if (<controller_type> = guitar)
					add_user_control_helper text = qs("GUITAR/BASS") button = Orange z = 100000 controller = <i> use_guitar_button = 1
					break
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script online_post_game_lobby_animate_in 
	Wait \{0.5
		second}
	SoundEvent \{event = Online_Main_Panel_In}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :SE_SetProps \{pos = (0.0, 30.0)
			time = 0.2
			Anim = gentle}
	else
		return
	endif
	Wait \{0.22
		second}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :SE_SetProps \{pos = (0.0, 0.0)
			time = 0.1
			Anim = gentle}
	else
		return
	endif
	ui_event_get_top
	if (<base_name> = 'online_post_game_lobby')
		LaunchEvent \{type = focus
			target = current_menu}
	endif
endscript

script ui_destroy_online_post_game_lobby 
	destroy_menu_backdrop
	destroy_player_drop_events
	if ScreenElementExists \{id = OnlineLobbyInterface}
		DestroyScreenElement \{id = OnlineLobbyInterface}
	endif
	change \{network_game_postgame_lobby = 0}
	generic_ui_destroy
endscript

script ui_return_online_post_game_lobby 
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	clean_up_user_control_helpers
	menu_finish
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :GetTags
		if (<locked_to_players> = 0)
			NetOptions :Pref_Get \{name = game_modes}
			if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
				GetActiveControllers
				GetArraySize <active_controllers>
				i = 0
				begin
				if (<active_controllers> [<i>] = 1)
					if NetSessionFunc func = IsControllerInGame params = {controller = <i>}
						get_controller_type controller_index = <i>
						if (<controller_type> = guitar)
							add_user_control_helper text = qs("GUITAR/BASS") button = Orange z = 100000 controller = <i> use_guitar_button = 1
							break
						endif
					endif
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
	endif
endscript

script postgame_lobby_transition_in 
	if ScreenElementExists \{id = OnlineLobbyInterface}
		if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_left_side
				param = left_side}
			<left_side> :SE_SetProps pos = {(0.0, 1000.0) relative} time = 0.15 Anim = gentle
		endif
	else
		return
	endif
	OnlineLobbyInterface :GetTags
	if (<locked_to_players> = 0)
		ui_return_online_post_game_lobby
		Wait \{0.15
			second}
		LaunchEvent \{type = focus
			target = current_menu}
	endif
endscript

script postgame_lobby_transition_out 
	if ScreenElementExists \{id = OnlineLobbyInterface}
		if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_left_side
				param = left_side}
			<left_side> :SE_SetProps pos = {(0.0, -1000.0) relative} time = 0.15 Anim = gentle
		endif
	else
		return
	endif
	Wait \{0.15
		second}
endscript

script create_postgame_lobby_menu 
	if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_left_side
			param = left_side}
		if <left_side> :Desc_ResolveAlias name = alias_online_lobby_scrollbar param = scrollbar_id
			<scrollbar_id> :Die
		endif
		if <left_side> :Desc_ResolveAlias name = alias_left_side_vmenu param = left_side_menu
			AssignAlias id = <left_side_menu> alias = current_menu
			NetOptions :Pref_Get \{name = game_modes}
			if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
				current_menu :SE_SetProps \{event_handlers = [
						{
							pad_back
							postgame_lobby_quit
						}
						{
							pad_up
							postgame_lobby_up_down_action
							params = {
								action = up
							}
						}
						{
							pad_down
							postgame_lobby_up_down_action
							params = {
								action = down
							}
						}
						{
							pad_l1
							post_game_toggle_guitar_part
						}
					]}
			else
				current_menu :SE_SetProps \{event_handlers = [
						{
							pad_back
							postgame_lobby_quit
						}
						{
							pad_up
							postgame_lobby_up_down_action
							params = {
								action = up
							}
						}
						{
							pad_down
							postgame_lobby_up_down_action
							params = {
								action = down
							}
						}
					]}
			endif
			<left_side> :SE_SetProps title_text = qs("POST GAME")
			getnumplayers
			current_num_players = <num_players>
			GameMode_GetNumPlayers
			if (<current_num_players> = <num_players>)
				add_matchmaking_item {
					vmenu_id = <left_side_menu>
					msg_checksum = postgame_play_again
					text = qs("CONTINUE TO SETLIST")
					choose_script = postgame_lobby_to_setlist
					focus_script = postgame_item_change_focus
				}
				OnlineLobbyInterface :SetTags \{setlist_enabled = 1}
			endif
			add_matchmaking_item {
				vmenu_id = <left_side_menu>
				msg_checksum = preferences
				text = qs("PREFERENCES")
				choose_script = postgame_net_preferences
				focus_script = postgame_item_change_focus
			}
			add_matchmaking_item {
				vmenu_id = <left_side_menu>
				msg_checksum = postgame_quit
				text = qs("QUIT")
				choose_script = postgame_lobby_quit
				focus_script = postgame_item_change_focus
			}
			OnlineLobbyInterface :SetTags postgame_menu_id = <left_side_menu>
		endif
	endif
endscript

script local_player_is_choosing_song 
	player_idx = 1
	GameMode_GetNumPlayers
	begin
	GetPlayerInfo <player_idx> is_local_client
	if (<is_local_client> = 1)
		GetPlayerInfo <player_idx> net_obj_id
		if ($online_song_choice_id = <net_obj_id>)
			printf qs("\LLocal player id = %d is Choosing song") d = ($online_song_choice_id)
			return \{true}
		endif
	endif
	<player_idx> = (<player_idx> + 1)
	repeat <num_players>
	return \{false}
endscript

script create_player_scores_postgame_container 
	if NOT GameMode_IsCooperative
		determine_game_scores_and_winner
		GameMode_GetNumPlayers
		if (<opponent_team_score> > <team_score>)
			setup_slot_menu menu = alias_winner_vmenu checksum = winner color = ($online_player_slot_bg_team1) score = <opponent_team_score> start_index = ((<num_players> / 2) + 1) num_players = (<num_players> / 2)
			OnlineLobbyInterface :SetTags winner_menu_id = <menu_id>
			setup_slot_menu menu = alias_loser_vmenu checksum = loser color = ($online_player_slot_bg_team2) score = <team_score> start_index = 1 num_players = (<num_players> / 2)
			OnlineLobbyInterface :SetTags loser_menu_id = <menu_id>
			OnlineLobbyInterface :SetTags {
				winner_items = (<num_players> / 2)
				loser_items = (<num_players> / 2)
			}
			FormatText TextName = winner_score qs("%d") d = <opponent_team_score>
			FormatText TextName = loser_score qs("%d") d = <team_score>
			OnlineLobbyInterface :SE_SetProps {
				winner_score = <winner_score>
				loser_score = <loser_score>
			}
		else
			setup_slot_menu menu = alias_winner_vmenu checksum = winner color = ($online_player_slot_bg_team1) score = <team_score> start_index = 1 num_players = (<num_players> / 2)
			OnlineLobbyInterface :SetTags winner_menu_id = <menu_id>
			setup_slot_menu menu = alias_loser_vmenu checksum = loser color = ($online_player_slot_bg_team2) score = <opponent_team_score> start_index = ((<num_players> / 2) + 1) num_players = (<num_players> / 2)
			OnlineLobbyInterface :SetTags loser_menu_id = <menu_id>
			OnlineLobbyInterface :SetTags {
				winner_items = (<num_players> / 2)
				loser_items = (<num_players> / 2)
			}
			FormatText TextName = winner_score qs("%d") d = <team_score>
			FormatText TextName = loser_score qs("%d") d = <opponent_team_score>
			OnlineLobbyInterface :SE_SetProps {
				winner_score = <winner_score>
				loser_score = <loser_score>
			}
		endif
		if (<tie> = true)
			stamp_texture = stamp_tie
			if French
				<stamp_texture> = stamp_tie_french
			elseif Spanish
				<stamp_texture> = stamp_tie_spanish
			elseif German
				<stamp_texture> = stamp_tie_german
			elseif Italian
				<stamp_texture> = stamp_tie_italian
			endif
			OnlineLobbyInterface :SE_SetProps {
				menu_loser_texture = tie_bg_lowerpart
				counter_winner_texture = counter_loser
				counter_winner_dims = (256.0, 64.0)
				counter_winner_pos = (660.0, 122.0)
				stamp_rot_angle = 0
				loser_stamp_alpha = 1
				menu_loser_pos = (690.0, 295.0)
				winner_stamp_texture = <stamp_texture>
				loser_stamp_texture = <stamp_texture>
			}
			if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_hand_devil_horn
					param = winner_hand}
				<winner_hand> :Die
			endif
			if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_hand_thumb_down
					param = loser_hand}
				<loser_hand> :Die
			endif
		else
			stamp_texture = stamp
			if French
				<stamp_texture> = stamp_winner_french
			elseif Spanish
				<stamp_texture> = stamp_winner_spanish
			elseif German
				<stamp_texture> = stamp_winner_german
			elseif Italian
				<stamp_texture> = stamp_winner_italian
			endif
			OnlineLobbyInterface :SE_SetProps {
				winner_stamp_texture = <stamp_texture>
				loser_stamp_texture = <stamp_texture>
			}
		endif
	else
		GameMode_GetNumPlayers
		<team_score> = ($band1_status.score)
		CastToInteger \{team_score}
		setup_slot_menu menu = alias_winner_vmenu checksum = winner color = ($online_player_slot_bg_team1) score = <team_score> start_index = 1 num_players = <num_players>
		OnlineLobbyInterface :SetTags winner_menu_id = <menu_id>
		FormatText TextName = winner_score qs("%d") d = <team_score>
		OnlineLobbyInterface :SE_SetProps {
			winner_score = <winner_score>
		}
		OnlineLobbyInterface :SetTags {
			winner_items = <num_players>
			loser_items = 0
		}
		ResolveScreenElementId \{param = loser_container
			id = [
				{
					id = OnlineLobbyInterface
				}
				{
					local_id = winner_vs_loser_menu
				}
				{
					local_id = loser
				}
			]}
		if ScreenElementExists id = <loser_container>
			DestroyScreenElement id = <loser_container>
		endif
		ResolveScreenElementId \{param = menu_chain_id
			id = [
				{
					id = OnlineLobbyInterface
				}
				{
					local_id = winner_vs_loser_menu
				}
				{
					local_id = winner
				}
				{
					local_id = menu_chain
				}
			]}
		if ScreenElementExists id = <menu_chain_id>
			DestroyScreenElement id = <menu_chain_id>
		endif
		ResolveScreenElementId \{param = stamp_id
			id = [
				{
					id = OnlineLobbyInterface
				}
				{
					local_id = winner_vs_loser_menu
				}
				{
					local_id = winner
				}
				{
					local_id = stamp
				}
			]}
		if ScreenElementExists id = <stamp_id>
			DestroyScreenElement id = <stamp_id>
		endif
	endif
	GameMode_GetType
	if (<type> = battle)
		if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_winner_score_container
				param = winner_score}
			<winner_score> :Die
		endif
		if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_loser_score_container
				param = loser_score}
			<loser_score> :Die
		endif
	endif
endscript

script destroy_player_scores_postgame_container 
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :GetTags
		if ScreenElementExists id = <loser_menu_id>
			DestroyScreenElement id = <loser_menu_id> preserve_parent
		endif
		if ScreenElementExists id = <winner_menu_id>
			DestroyScreenElement id = <winner_menu_id> preserve_parent
		endif
	endif
endscript

script determine_game_scores_and_winner 
	team_score = 0
	opponent_team_score = 0
	tie = false
	GameMode_GetNumPlayers
	if (<num_players> > 2)
		<opponent_team_score> = ($band2_status.score)
		<team_score> = ($band1_status.score)
	else
		if ($game_mode = p2_battle)
			<team_score> = ($player1_status.save_health)
			<opponent_team_score> = ($player2_status.save_health)
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			<team_score> = ($player1_status.score)
			<opponent_team_score> = ($player2_status.score)
		endif
	endif
	if (<team_score> = <opponent_team_score>)
		<tie> = true
	endif
	CastToInteger \{team_score}
	CastToInteger \{opponent_team_score}
	return team_score = <team_score> opponent_team_score = <opponent_team_score> tie = <tie>
endscript

script refresh_player_scores_postgame_container 
	printf \{qs("\L---refresh_player_scores_postgame_container")}
	OnlineLobbyInterface :GetTags
	if ScreenElementExists id = <loser_menu_id>
		if IsScreenElementInFocus id = <loser_menu_id>
			LaunchEvent type = unfocus target = <loser_menu_id>
			focus_id = <loser_menu_id>
			focus_index = <loser_index>
		endif
	endif
	if ScreenElementExists id = <winner_menu_id>
		if IsScreenElementInFocus id = <winner_menu_id>
			LaunchEvent type = unfocus target = <winner_menu_id>
			focus_id = <winner_menu_id>
			focus_index = <winner_index>
		endif
	endif
	destroy_player_scores_postgame_container
	create_player_scores_postgame_container
	if GotParam \{locked}
		OnlineLobbyInterface :GetTags
		new_event_handlers = [
			{pad_up postgame_lobby_up_down_action params = {action = up}}
			{pad_down postgame_lobby_up_down_action params = {action = down}}
		]
		if ScreenElementExists id = <loser_menu_id>
			SetScreenElementProps {
				id = <loser_menu_id>
				event_handlers = []
				replace_handlers
			}
			SetScreenElementProps {
				id = <loser_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
		if ScreenElementExists id = <winner_menu_id>
			SetScreenElementProps {
				id = <winner_menu_id>
				event_handlers = []
				replace_handlers
			}
			SetScreenElementProps {
				id = <winner_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
		OnlineLobbyInterface :SetTags \{locked_to_players = 1}
		if ScreenElementExists \{id = NetPrefInterface}
			if NOT ScriptIsRunning \{ui_destroy_net_preferences}
				ui_destroy_net_preferences
			else
				begin
				if ScriptIsRunning \{ui_destroy_net_preferences}
					Wait \{1
						gameframe}
				else
					break
				endif
				repeat
			endif
		endif
		ui_event_get_top
		if (<base_name> = 'online_quit_warning')
			generic_event_back
		endif
		if ScreenElementExists \{id = current_menu}
			if IsScreenElementInFocus \{id = current_menu}
				LaunchEvent \{type = unfocus
					target = current_menu}
			endif
		endif
		if ScreenElementExists id = <winner_menu_id>
			if NOT IsScreenElementInFocus id = <winner_menu_id>
				if NOT IsScreenElementInFocus id = <loser_menu_id>
					OnlineLobbyInterface :SetTags \{winner_index = 0}
					LaunchEvent type = focus target = <winner_menu_id> data = {child_index = 0}
				endif
			endif
		endif
		clean_up_user_control_helpers
		menu_finish
	elseif GotParam \{unlock}
		OnlineLobbyInterface :GetTags
		if ScreenElementExists id = <loser_menu_id>
			<new_event_handlers> = [
				{pad_back postgame_lobby_quit params = {id = <loser_menu_id>}}
				{pad_up postgame_lobby_up_down_action params = {action = up}}
				{pad_down postgame_lobby_up_down_action params = {action = down}}
			]
			SetScreenElementProps {
				id = <loser_menu_id>
				event_handlers = []
				replace_handlers
			}
			SetScreenElementProps {
				id = <loser_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
		if ScreenElementExists id = <winner_menu_id>
			<new_event_handlers> = [
				{pad_back postgame_lobby_quit params = {id = <winner_menu_id>}}
				{pad_up postgame_lobby_up_down_action params = {action = up}}
				{pad_down postgame_lobby_up_down_action params = {action = down}}
			]
			SetScreenElementProps {
				id = <winner_menu_id>
				event_handlers = []
				replace_handlers
			}
			SetScreenElementProps {
				id = <winner_menu_id>
				event_handlers = <new_event_handlers>
				replace_handlers
			}
		endif
	endif
	if GotParam \{focus_id}
		LaunchEvent type = focus target = <focus_id> data = {child_index = <focus_index>}
	endif
	printf \{qs("\Lrefresh_player_scores_postgame_container---")}
endscript

script postgame_lobby_to_setlist 
	if IsHost
		SendStructure \{callback = postgame_goto_setlist
			data_to_send = {
				none
			}}
		OnlineLobbyInterface :Obj_SpawnScriptLater \{song_being_selected}
	else
		SendStructure \{callback = postgame_goto_setlist
			data_to_send = {
				none
			}}
	endif
endscript

script postgame_goto_setlist 
	if IsHost
		begin
		if ScreenElementExists \{id = OnlineLobbyInterface}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		OnlineLobbyInterface :Obj_SpawnScriptLater \{song_being_selected}
		SendStructure \{callback = postgame_goto_setlist
			data_to_send = {
				none
			}}
	else
		begin
		if ScreenElementExists \{id = OnlineLobbyInterface}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		OnlineLobbyInterface :Obj_SpawnScriptNow \{song_being_selected}
	endif
endscript

script song_being_selected 
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :GetTags
		OnlineLobbyInterface :SetTags \{setlist_enabled = 0}
		ResolveScreenElementId id = {<postgame_menu_id> child = 0}
		if (<menu_index> = 0)
			if IsScreenElementInFocus \{id = current_menu}
				LaunchEvent \{type = unfocus
					target = current_menu}
				LaunchEvent \{type = focus
					target = current_menu
					data = {
						child_index = 1
					}}
			endif
			OnlineLobbyInterface :SetTags \{menu_index = 0}
			OnlineLobbyInterface :SetTags Menu_items = (<Menu_items> - 1)
		endif
		<resolved_id> :SE_SetProps {not_focusable}
		ResolveScreenElementId id = {<resolved_id> child = text}
		<resolved_id> :SE_SetProps {alpha = 0.5}
		index = ($online_to_setlist_count)
		begin
		FormatText TextName = timer_msg qs("COUNTDOWN TO SETLIST %d") d = <index>
		printf qs("\L%s") s = <timer_msg>
		if ScreenElementExists \{id = OnlineLobbyInterface}
			if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_left_side
					param = left_side}
				<left_side> :SE_SetProps info_text = <timer_msg>
			endif
		endif
		if (<index> = 6)
			SpawnScriptLater \{block_and_delay}
		elseif (<index> = 5)
			OnlineLobbyInterface :SetTags \{toggle_allowed = 0}
			refresh_player_scores_postgame_container \{locked}
		elseif (<index> = 4)
			host_start_player_settings_sync
		endif
		if (<index> = 0)
			break
		endif
		index = (<index> - 1)
		Wait \{1
			second}
		repeat
		vocals_distribute_mics
		generic_event_back \{state = uistate_setlist
			data = {
				no_jamsession
			}}
	else
		printf \{qs("\Lour matchmaking menu doesn't exist")}
	endif
endscript

script block_and_delay 
	SetButtonEventMappings \{block_menu_input}
	Wait \{1.5
		seconds}
	SetButtonEventMappings \{unblock_menu_input}
endscript

script postgame_lobby_quit 
	if GotParam \{device_num}
		is_controller_online controller_index = <device_num>
		if (<online> = 1)
			if GotParam \{id}
				LaunchEvent type = unfocus target = <id>
			endif
			ui_event_get_top
			if GotParam \{is_popup}
				generic_event_replace \{state = uistate_online_quit_warning
					data = {
						is_popup
					}}
			else
				generic_event_choose \{state = uistate_online_quit_warning
					data = {
						is_popup
					}}
			endif
		endif
	endif
endscript

script postgame_net_preferences 
	if NOT ScreenElementExists \{id = NetPrefInterface}
		LaunchEvent \{type = unfocus
			target = current_menu}
		postgame_lobby_transition_out
		ui_create_net_preferences device_num = <device_num> exit_script = postgame_lobby_transition_in post_game_lobby
	endif
endscript

script postgame_lobby_add_player_slot \{cash_text = qs("0")
		cash_icon_id = cash_milestone_icon_001}
	RequireParams \{[
			name
			controller_texture
			xuid
			bg_rgba
			parent
			local
			player_num
		]
		all}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :GetTags
		FormatText checksumname = player_slot_id 'player_slot_p%p' p = <player_num> AddToStringLookup
		CreateScreenElement {
			type = DescInterface
			desc = 'online_lobby_player_slot_item'
			id = <player_slot_id>
			parent = <parent>
			auto_dims = false
			dims = (450.0, 50.0)
			event_handlers = [
				{focus postgame_player_slot_change_focus params = {focus}}
				{unfocus postgame_player_slot_change_focus params = {unfocus}}
			]
			tags = {local_player = 0}
		}
		if isXenon
			if GotParam \{xuid}
				<id> :SE_SetProps event_handlers = [{pad_choose ui_menu_select_sfx}
					{pad_choose menu_show_gamercard_from_netid params = {net_id = <xuid>}}
				]
			endif
		endif
		if isXenon
			FormatText checksumname = player_status 'player%d_status' d = (<player_num>)
			<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
		endif
		<id> :Desc_CheckVersion desired = 2 AssertIf = Mismatch
		<id> :SE_SetProps {
			player_slot_name_text = <name>
			player_instrument_logo_texture = <controller_texture>
			player_slot_bg_rgba = <bg_rgba>
			cash_icon_texture = <cash_icon_id>
			cash_rank_text = <cash_text>
			cash_icon_alpha = 1
		}
		if <id> :Desc_ResolveAlias name = alias_sign_in_button param = signin_id
			<signin_id> :Die
		endif
		<id> :SetTags msg_checksum = gamer_card
		<id> :SetTags local_player = <local>
	endif
endscript

script setup_slot_menu menu = alias_winner_vmenu color = ($online_player_slot_bg_team1)
	RequireParams \{[
			score
			start_index
			num_players
		]
		all}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		if OnlineLobbyInterface :Desc_ResolveAlias name = <menu> param = slot_menu
			NetOptions :Pref_Get \{name = game_modes}
			if (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
				<slot_menu> :SE_SetProps {
					replace_handlers
					event_handlers = [
						{pad_back postgame_lobby_quit params = {id = <slot_menu>}}
						{pad_up postgame_lobby_up_down_action params = {action = up}}
						{pad_down postgame_lobby_up_down_action params = {action = down}}
						{pad_l1 post_game_toggle_guitar_part}
					]
				}
			else
				<slot_menu> :SE_SetProps {
					replace_handlers
					event_handlers = [
						{pad_back postgame_lobby_quit params = {id = <slot_menu>}}
						{pad_up postgame_lobby_up_down_action params = {action = up}}
						{pad_down postgame_lobby_up_down_action params = {action = down}}
					]
				}
			endif
			begin
			GetPlayerInfo <start_index> net_id_first
			GetPlayerInfo <start_index> net_id_second
			GetPlayerInfo <start_index> part
			GetPlayerInfo <start_index> is_local_client
			switch (<part>)
				case guitar
				icon_texture = Logo_Guitar_GrayScale
				case Bass
				icon_texture = Logo_Bass_GrayScale
				case drum
				icon_texture = Logo_Drum_GrayScale
				case Vocals
				icon_texture = Logo_Vocal_GrayScale
			endswitch
			FormatText checksumname = gamertag 'gamertag_%d' d = (<start_index> - 1)
			name = $<gamertag>
			xuid = [0 0]
			SetArrayElement ArrayName = xuid index = 0 newvalue = (<net_id_first>)
			SetArrayElement ArrayName = xuid index = 1 newvalue = (<net_id_second>)
			GetPlayerInfo <start_index> career_earnings
			cash_get_info_from_earnings earnings = <career_earnings>
			FormatText TextName = cash_text qs("%d") d = <rank>
			GetPlayerInfo \{1
				team}
			yellow_team = <team>
			GetPlayerInfo <start_index> team
			color = $online_player_slot_bg_team1
			if (<team> != <yellow_team>)
				<color> = $online_player_slot_bg_team2
			endif
			postgame_lobby_add_player_slot {
				name = <name>
				controller_texture = <icon_texture>
				xuid = <xuid>
				bg_rgba = <color>
				parent = <slot_menu>
				cash_text = <cash_text>
				cash_icon_id = <cash_icon_id>
				player_num = <start_index>
				local = <is_local_client>
			}
			<start_index> = (<start_index> + 1)
			repeat <num_players>
			return menu_id = <slot_menu>
		endif
	endif
endscript

script postgame_item_change_focus 
	Obj_GetID
	<ObjID> :GetTags
	ResolveScreenElementId id = [
		{id = <ObjID>}
		{local_id = text}
	]
	if GotParam \{focus}
		if GotParam \{msg_checksum}
			set_postgame_dialog_message msg_checksum = <msg_checksum>
		endif
		retail_menu_focus id = <resolved_id>
	elseif GotParam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script postgame_player_slot_change_focus 
	Obj_GetID
	<ObjID> :GetTags
	ResolveScreenElementId id = [
		{id = <ObjID>}
		{local_id = online_player_slots_item}
		{local_id = player_slot_name}
	]
	if GotParam \{focus}
		if GotParam \{msg_checksum}
			set_postgame_dialog_message msg_checksum = <msg_checksum>
		endif
		retail_menu_focus id = <resolved_id>
	elseif GotParam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script set_postgame_dialog_message 
	if NOT GotParam \{msg_checksum}
		return
	endif
	if isXenon
		plat_helper_strings = net_helper_text_strings_xen
	elseif IsNgc
		plat_helper_strings = net_helper_text_strings_wii
	else
		plat_helper_strings = net_helper_text_strings_ps3
	endif
	AppendSuffixToChecksum Base = <msg_checksum> SuffixString = '_text'
	if StructureContains Structure = ($<plat_helper_strings>) <appended_id>
		if ScreenElementExists \{id = OnlineLobbyInterface}
			if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_left_side
					param = left_side}
				<left_side> :SE_SetProps info_text = ($<plat_helper_strings>.<appended_id>)
			endif
		endif
	elseif StructureContains Structure = ($net_helper_text_strings) <appended_id>
		if ScreenElementExists \{id = OnlineLobbyInterface}
			if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_left_side
					param = left_side}
				<left_side> :SE_SetProps info_text = ($net_helper_text_strings.<appended_id>)
			endif
		endif
	endif
endscript

script postgame_lobby_up_down_action 
	OnlineLobbyInterface :GetTags
	if NOT GotParam \{action}
		return
	endif
	if NOT ScreenElementExists \{id = current_menu}
		return
	endif
	if NOT ScreenElementExists id = <winner_menu_id>
		return
	endif
	generic_menu_up_or_down_sound
	printf \{qs("\L---postgame_lobby_up_down_action")}
	if IsScreenElementInFocus \{id = current_menu}
		if (<action> = up)
			generic_menu_up_or_down_sound \{up}
			if (<menu_index> = 0)
				if (<loser_items> > 0)
					LaunchEvent \{type = unfocus
						target = current_menu}
					LaunchEvent type = focus target = <loser_menu_id> data = {child_index = (<loser_items> - 1)}
					OnlineLobbyInterface :SetTags loser_index = (<loser_items> - 1)
				else
					LaunchEvent \{type = unfocus
						target = current_menu}
					LaunchEvent type = focus target = <winner_menu_id> data = {child_index = (<winner_items> - 1)}
					OnlineLobbyInterface :SetTags winner_index = (<winner_items> - 1)
				endif
			else
				OnlineLobbyInterface :SetTags menu_index = (<menu_index> - 1)
			endif
		elseif (<action> = down)
			generic_menu_up_or_down_sound \{down}
			if (<menu_index> = (<Menu_items> - 1))
				if (<winner_items> > 0)
					LaunchEvent \{type = unfocus
						target = current_menu}
					LaunchEvent type = focus target = <winner_menu_id> data = {child_index = 0}
					OnlineLobbyInterface :SetTags \{winner_index = 0}
				else
					OnlineLobbyInterface :SetTags \{menu_index = 0}
				endif
			else
				OnlineLobbyInterface :SetTags menu_index = (<menu_index> + 1)
			endif
		endif
	elseif IsScreenElementInFocus id = <winner_menu_id>
		if (<action> = up)
			generic_menu_up_or_down_sound \{up}
			if (<winner_index> = 0)
				if (<locked_to_players> = 0)
					LaunchEvent type = unfocus target = <winner_menu_id>
					LaunchEvent type = focus target = current_menu data = {child_index = (<Menu_items> - 1)}
					OnlineLobbyInterface :SetTags menu_index = (<Menu_items> - 1)
				elseif (<loser_items> > 0)
					LaunchEvent type = unfocus target = <winner_menu_id>
					LaunchEvent type = focus target = <loser_menu_id> data = {child_index = 0}
					OnlineLobbyInterface :SetTags \{loser_index = 0}
				else
					OnlineLobbyInterface :SetTags winner_index = (<winner_items> - 1)
				endif
			else
				OnlineLobbyInterface :SetTags winner_index = (<winner_index> - 1)
			endif
		elseif (<action> = down)
			generic_menu_up_or_down_sound \{down}
			if (<winner_index> = (<winner_items> - 1))
				if (<loser_items> > 0)
					LaunchEvent type = unfocus target = <winner_menu_id>
					LaunchEvent type = focus target = <loser_menu_id> data = {child_index = 0}
					OnlineLobbyInterface :SetTags \{loser_index = 0}
				elseif (<locked_to_players> = 0)
					LaunchEvent type = unfocus target = <winner_menu_id>
					LaunchEvent \{type = focus
						target = current_menu
						data = {
							child_index = 0
						}}
					OnlineLobbyInterface :SetTags \{menu_index = 0}
				else
					OnlineLobbyInterface :SetTags \{winner_index = 0}
				endif
			else
				OnlineLobbyInterface :SetTags winner_index = (<winner_index> + 1)
			endif
		endif
	elseif IsScreenElementInFocus id = <loser_menu_id>
		if (<action> = up)
			generic_menu_up_or_down_sound \{up}
			if (<loser_index> = 0)
				LaunchEvent type = unfocus target = <loser_menu_id>
				LaunchEvent type = focus target = <winner_menu_id> data = {child_index = (<winner_items> - 1)}
				OnlineLobbyInterface :SetTags winner_index = (<winner_items> - 1)
			else
				OnlineLobbyInterface :SetTags loser_index = (<loser_index> - 1)
			endif
		elseif (<action> = down)
			generic_menu_up_or_down_sound \{down}
			if (<loser_index> = (<loser_items> - 1))
				if (<locked_to_players> = 0)
					LaunchEvent type = unfocus target = <loser_menu_id>
					LaunchEvent \{type = focus
						target = current_menu
						data = {
							child_index = 0
						}}
					OnlineLobbyInterface :SetTags \{menu_index = 0}
				else
					LaunchEvent type = unfocus target = <loser_menu_id>
					LaunchEvent type = focus target = <winner_menu_id> data = {child_index = 0}
					OnlineLobbyInterface :SetTags \{winner_index = 0}
				endif
			else
				OnlineLobbyInterface :SetTags loser_index = (<loser_index> + 1)
			endif
		endif
	endif
endscript

script post_game_toggle_guitar_part 
	printf \{qs("\L--- toggle_guitar_part")}
	OnlineLobbyInterface :GetSingleTag \{toggle_allowed}
	if (<toggle_allowed> = 0)
		return
	endif
	RequireParams \{[
			device_num
		]
		all}
	info_index = 1
	index = 1
	begin
	GetPlayerInfo <index> controller
	if (<device_num> = <controller>)
		<info_index> = <index>
		break
	endif
	index = (<index> + 1)
	repeat 8
	get_controller_type controller_index = <device_num>
	if (<controller_type> = guitar)
		GetPlayerInfo <info_index> part
		if (<part> = guitar)
			SetPlayerInfo <info_index> part = Bass
			GetPlayerInfo <info_index> net_id_first
			GetPlayerInfo <info_index> net_id_second
			FormatText checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
			SendStructure callback = update_postgame_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = Bass}
			update_postgame_part first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = Bass
		elseif (<part> = Bass)
			SetPlayerInfo <info_index> part = guitar
			GetPlayerInfo <info_index> net_id_first
			GetPlayerInfo <info_index> net_id_second
			FormatText checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
			SendStructure callback = update_postgame_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = guitar}
			update_postgame_part first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = guitar
		endif
	endif
endscript

script update_postgame_part 
	if IsHost
		SendStructure callback = update_postgame_part data_to_send = <...>
	endif
	printf \{qs("\L---update_postgame_part")}
	found = 0
	info_index = 1
	begin
	GetPlayerInfo <info_index> net_id_first
	GetPlayerInfo <info_index> net_id_second
	FormatText checksumname = gamertag 'gamertag_%d' d = (<info_index> - 1)
	if ((<net_id_first> = <first_id>) && (<net_id_second> = <second_id>))
		if isXenon
			<found> = 1
			break
		elseif LocalizedStringEquals a = <name> b = ($<gamertag>)
			<found> = 1
			break
		endif
	endif
	info_index = (<info_index> + 1)
	repeat 8
	if (<found> = 1)
		SetPlayerInfo <info_index> part = <part>
		if ScreenElementExists \{id = OnlineLobbyInterface}
			refresh_player_scores_postgame_container
		endif
	endif
endscript

script lobby_drop_player_scr 
	printf \{qs("\L---lobby_drop_player_scr")}
	KillSpawnedScript \{name = postgame_goto_setlist}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :GetTags
		OnlineLobbyInterface :Obj_KillSpawnedScript \{name = song_being_selected}
		ui_event_get_top
		if (<base_name> = 'online_quit_warning')
			generic_event_back
			ui_event_wait_for_safe
		endif
		if ScreenElementExists \{id = NetPrefInterface}
			NetPrefInterface :GetTags
			if ScreenElementExists id = <submenu_id>
				LaunchEvent type = unfocus target = <submenu_id>
			else
				LaunchEvent \{type = unfocus
					target = net_preferences_popup}
			endif
		else
			LaunchEvent \{type = unfocus
				target = current_menu}
		endif
		FormatText \{TextName = popup_text}
		create_net_popup \{title = qs("GAME OVER")
			popup_text = qs("A player has left the game. There are not enough players to continue.")}
		Wait \{3
			seconds}
		destroy_net_popup
		set_focus_color rgba = ($online_lobby_item_text_color_focus)
		set_unfocus_color rgba = ($online_lobby_item_text_color)
		if ScreenElementExists \{id = NetPrefInterface}
			NetPrefInterface :GetTags
			if ScreenElementExists id = <submenu_id>
				LaunchEvent type = focus target = <submenu_id>
			else
				LaunchEvent \{type = focus
					target = net_preferences_popup}
			endif
		else
			LaunchEvent \{type = focus
				target = current_menu}
		endif
		if (<locked_to_players> = 1)
			OnlineLobbyInterface :SetTags \{locked_to_players = 0}
			refresh_player_scores_postgame_container \{unlock}
		endif
		player = 1
		GameMode_GetNumPlayers
		begin
		FormatText checksumname = player_slot_id 'player_slot_p%p' p = <player>
		<player_slot_id> :GetTags
		if (<local_player> = 0)
			<player_slot_id> :SE_SetProps {alpha = 0.35000002}
		endif
		<player> = (<player> + 1)
		repeat <num_players>
		if (<setlist_enabled> = 1)
			OnlineLobbyInterface :SetTags \{setlist_enabled = 0}
			OnlineLobbyInterface :GetTags
			ResolveScreenElementId id = {<postgame_menu_id> child = 0}
			if (<menu_index> = 0)
				LaunchEvent \{type = unfocus
					target = current_menu}
				if NOT ScreenElementExists \{id = NetPrefInterface}
					LaunchEvent \{type = focus
						target = current_menu
						data = {
							child_index = 1
						}}
				endif
				OnlineLobbyInterface :SetTags \{menu_index = 0}
			else
				OnlineLobbyInterface :SetTags menu_index = (<menu_index> - 1)
			endif
			OnlineLobbyInterface :SetTags Menu_items = (<Menu_items> - 1)
			<resolved_id> :SE_SetProps {not_focusable}
			ResolveScreenElementId id = {<resolved_id> child = text}
			<resolved_id> :SE_SetProps {alpha = 0.5}
		endif
	endif
endscript

script lobby_end_game_scr 
	printf \{qs("\LWe got an end game event and we don't need to do anything")}
endscript
