
script ui_create_fail_song 
	spawn_player_drop_listeners \{drop_player_script = net_career_fail_menu_drop_player
		end_game_script = net_career_fail_menu_end_game}
	change \{playing_song = 0}
	create_fail_song_menu
endscript

script ui_destroy_fail_song 
	destroy_fail_song_menu
	destroy_player_drop_events
endscript

script net_career_fail_menu_drop_player 
	printf \{qs("\L--- net_career_fail_menu_drop_player ---")}
	if (<is_game_over> = 0)
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
		switch <drop_reason>
			case net_message_player_quit
			FormatText TextName = drop_msg qs("%s has quit.\n") s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			FormatText TextName = drop_msg qs("Lost connection to %s.\n") s = <name_string>
			default
			drop_msg = qs("")
		endswitch
		if ScreenElementExists \{id = fail_song_static_text_container}
			net_create_player_drop_message_box parent_element = fail_song_static_text_container drop_msg = <drop_msg>
		endif
	endif
endscript

script net_career_fail_menu_end_game 
	printf \{qs("\L--- net_career_fail_menu_end_game ---")}
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
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
		if ScreenElementExists \{id = popup_warning_container}
			popup_warning_container :SE_SetProps \{z_priority = 1500.2}
		endif
		Wait \{3
			seconds}
		destroy_net_popup
		quit_network_game
		if ui_event_exists_in_stack \{name = 'group_play'}
			printf \{qs(0x26ffae70)}
			change \{is_network_game = 0}
			ui_event \{event = menu_back
				state = uistate_group_play}
		else
			printf \{qs(0x7a510fef)}
			ui_event \{event = menu_back
				state = uistate_online}
		endif
	endif
endscript
