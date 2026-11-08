net_career_song_index = 0

script ui_init_net_setup 
	set_home_button_notallowed
	net_init
	GameMode_GetType
	if (<type> = career)
		NetSessionFunc \{func = RemoveAllControllers}
	endif
	destroy_loading_screen
endscript

script ui_create_net_setup 
	spawnscriptnow ui_create_net_setup_spawned params = <...>
endscript

script ui_create_net_setup_spawned 
	begin
	if ($DEMONWARE_IS_READY = 1)
		break
	endif
	Wait \{1
		frame}
	repeat
	GameMode_GetType
	if (<type> = career)
		Wait \{1
			second}
		change \{current_num_players = 0}
		change \{quickplay_song_list_current = -1}
		if GotParam \{action}
			change net_band_mode_menu = <action>
		endif
		ui_event_wait \{event = menu_change
			data = {
				state = UIstate_band_mode
			}}
	else
		spawnscriptnow \{task_menu_default_anim_in
			params = {
				base_name = 'band_hub'
			}}
		NetSessionFunc \{obj = party
			func = set_joiner_mode
			params = {
				mode = online_menu
			}}
		Wait \{1
			second}
		change player1_device = ($primary_controller)
		change \{current_num_players = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = uistate_online
			}}
	endif
endscript

script ui_destroy_net_setup 
endscript

script ui_deinit_net_setup 
	NetSessionFunc \{obj = party
		func = stop_party_session}
	NetSessionFunc \{obj = match
		func = cancel_join_server}
	quit_network_game
	shut_down_net_play
	GameMode_GetType
	if (<type> = career)
		change \{current_num_players = 2}
		change \{num_players_in_band = 0}
		change \{quickplay_song_list_current = 0}
		change \{career_matchmaking_complete = 0}
		change \{net_band_mode_menu = none}
		change \{net_band_members = [
			]}
		change \{net_num_joiners = 0}
		change \{net_invites_limbo = 0}
		change \{net_band_leader_player_num = -1}
		change \{net_encore_msg_start_sent = 0}
		change \{net_breakdown_next_song_msg_sent = 0}
		change \{net_breakdown_continue_msg_sent = 0}
		NetSessionFunc func = AddControllers params = {controller = ($primary_controller)}
		change \{num_exclusive_mp_controllers = 0}
		clear_temp_net_id_array
	else
		printf \{qs("\Lxbl/psn")}
	endif
	set_home_button_allowed
endscript
