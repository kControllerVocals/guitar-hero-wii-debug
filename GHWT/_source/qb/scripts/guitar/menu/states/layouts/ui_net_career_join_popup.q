online_band_num_results = 0

script ui_create_net_career_join_popup 
	create_popup_warning_menu {
		title = qs("Searching")
		textblock = {
			text = qs("Looking for a band.")
		}
		options = [
			{
				func = cancel_net_career_mode_search
				text = qs("CANCEL")
			}
		]
		no_background
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		player_device = <device_num>
	}
	change \{online_band_num_results = 0}
	NetOptions :Pref_Choose \{name = game_modes
		checksum = p4_career}
	NetOptions :Pref_Choose \{name = ranked
		checksum = player}
	set_network_preferences
	NetSessionFunc \{obj = match
		func = stop_server_list}
	NetSessionFunc \{obj = match
		func = free_server_list}
	NetSessionFunc \{obj = match
		func = set_search_params
		params = {
			difficulty = dont_care
			gamemode = p4_career
			num_songs = dont_care
			needed_guitars = 2
			needed_drums = 1
			needed_microphones = 1
			scoring_mode = career
		}}
	NetSessionFunc \{obj = match
		func = set_server_list_mode
		params = {
			quickmatch
		}}
	NetSessionFunc {
		obj = match
		func = start_server_list
		params = {
			callback = online_band_search_item_add
			callback_complete = online_band_search_stop
			controller = <device_num>
		}
	}
	SpawnScript check_for_new_players params = {device_num = <device_num>}
endscript

script check_for_new_players 
	printf \{qs("\Lcheck_for_new_players")}
	begin
	if (NetSessionFunc obj = match func = get_num_matchmaking_players)
		NetSessionFunc \{obj = party
			func = get_party_members}
		GetArraySize <connections>
		if (<array_size> < <num_matchmaking_players>)
			destroy_popup_warning_menu
			create_popup_warning_menu {
				title = qs("Joining")
				textblock = {
					text = qs("Band Found! Waiting for Host to begin the match.")
				}
				options = [
					{
						func = cancel_net_career_mode_search
						text = qs("CANCEL")
					}
				]
				no_background
				popup_event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
					{pad_back cancel_net_career_mode_search}
				]
				player_device = <device_num>
			}
			break
		endif
	endif
	Wait \{1
		frame}
	repeat
endscript

script ui_destroy_net_career_join_popup 
	if ScriptExists \{check_for_new_players}
		KillSpawnedScript \{name = check_for_new_players}
	endif
	destroy_popup_warning_menu
endscript

script ui_deinit_net_career_join_popup 
	ui_destroy_net_career_join_popup
endscript

script cancel_net_career_mode_search 
	if NetSessionFunc \{obj = match
			func = cancel_join_server}
		Obj_GetID
		<ObjID> :SE_SetProps block_events
		ui_destroy_net_career_join_popup
		change \{num_players_in_band = 0}
		ui_band_mode_helper_text
		ui_band_mode_change_menu_focus_all \{focus_type = focus}
	endif
endscript

script online_band_search_item_add 
	printf \{qs("\Lonline_band_search_item_add")}
	change online_career_num_results = (($online_career_num_results) + 1)
endscript

script online_band_search_stop 
	printf \{qs("\Lonline_band_search_stop")}
	NetSessionFunc \{obj = match
		func = stop_server_list}
	if ($online_band_num_results = 0)
		ui_event_get_top
		destroy_popup_warning_menu
		ui_create_net_zero_search_results_popup device_num = <device_num>
	endif
endscript
