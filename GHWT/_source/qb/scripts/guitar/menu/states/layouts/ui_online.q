
script ui_init_online 
	set_home_button_notallowed
	net_init
endscript

script ui_create_online 
	SD_Unload_Song
	change \{rich_presence_context = presence_gigboard_and_setlist}
	change \{game_mode = p2_pro_faceoff}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_all_players = 1}
	change \{respond_to_signin_changed_func = none}
	change \{is_network_game = 1}
	if NetSessionFunc \{obj = party
			func = is_host}
		NetSessionFunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
	endif
	fadetoblack \{off
		no_wait}
	spawnscriptnow create_net_matchmaking_menu params = <...>
	BroadcastEvent \{type = online_menu_created}
endscript

script ui_destroy_online 
	KillSpawnedScript \{name = create_net_matchmaking_menu}
	destroy_net_matchmaking_menu
endscript

script ui_deinit_online 
	KillSpawnedScript \{name = set_net_ui_to_finished_searching}
	SD_Unload_Song
	net_clear_all_remote_player_status
	set_home_button_allowed
	KillSpawnedScript \{name = set_net_ui_to_finished_searching}
	SetPlayerInfo 1 controller = ($primary_controller)
	if NetSessionFunc \{obj = party
			func = is_host}
		NetSessionFunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 0
			}}
	endif
endscript

script ui_return_online 
	set_focus_color rgba = ($online_lobby_item_text_color)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	online_lobby_setup_helper_controls
endscript

script kill_online_popup 
	menu_net_matchmaking_deinit
	destroy_popup_warning_menu
	leave_net_main_menu
endscript
