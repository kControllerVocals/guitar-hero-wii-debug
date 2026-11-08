
script open_dwc_error_dialog 
	Wait \{1
		gameframe}
	if (<dwc_error_code> > 0)
		FormatText TextName = error_msg qs(0x5ceb0ec8) d = (<dwc_error_code>) s = (<dwc_error_text>)
	else
		FormatText TextName = error_msg qs("%s") s = (<dwc_error_text>)
	endif
	destroy_generic_popup
	if IsNgc
		wii_bootup_handle_connection_error
	endif
	use_long_text_hack = 0
	if German
		if (<potential_long_text> = 1)
			<use_long_text_hack> = 1
		endif
	elseif Spanish
		if (<potential_long_text> = 1)
			<use_long_text_hack> = 1
		endif
	elseif Italian
		if (<potential_long_text> = 1)
			<use_long_text_hack> = 1
		endif
	elseif French
		if (<potential_long_text> = 1)
			<use_long_text_hack> = 1
		endif
	endif
	if (<use_long_text_hack> = 1)
		create_generic_popup {
			previous_menu = current_menu
			title = $wii_error
			long_text
			ok_menu
			message = <error_msg>
			ok_eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose destroy_and_allow_home_menu}
			]
		}
	else
		create_generic_popup {
			previous_menu = current_menu
			title = $wii_error
			ok_menu
			message = <error_msg>
			ok_eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose destroy_and_allow_home_menu}
			]
		}
	endif
endscript

script destroy_and_allow_home_menu 
	set_home_button_allowed
	destroy_generic_popup
endscript
kickingToMain = 0

script open_fatal_dwc_error_dialog 
	clear_network_wait_variable
	destroy_generic_popup
	change \{kickingToMain = 1}
	wii_handle_connection_loss
	open_dwc_error_dialog {
		dwc_error_code = <dwc_error_code>
		dwc_error_text = <dwc_error_text>
	}
endscript

script open_non_fatal_dwc_error_dialog 
	clear_network_wait_variable
	destroy_generic_popup
	if IsNgc
		wii_bootup_handle_connection_error
	endif
	ok_after_reject
	open_dwc_error_dialog {
		dwc_error_code = <dwc_error_code>
		dwc_error_text = <dwc_error_text>
	}
endscript

script close_dwc_error_dialog 
	destroy_generic_popup
	set_home_button_allowed
	if (<go_to_main_menu> = 1)
		wii_handle_connection_loss
	endif
endscript

script wii_handle_connection_loss 
	sysnotify_wait_until_safe
	cleanup_sessionfuncs
	($default_loading_screen.create)
	if ($is_network_game)
		shutdown_game_for_signin_change \{unloadcontent = 0}
	endif
	SetScriptCannotPause
	begin
	if NOT Is_ui_event_running
		if NOT ScriptIsRunning \{ui_create_play_song_spawned}
			if NOT ScriptIsRunning \{ui_create_band_mode_spawned}
				if NOT ScriptIsRunning \{ui_create_net_setup_spawned}
					break
				endif
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if ($is_network_game)
		shutdown_game_for_signin_change \{unloadcontent = 0}
	endif
	CancelEnterWifiMenu
	enable_pause
	Wait \{5
		gameframes}
	change \{force_front_end_animation_loads = 1}
	generic_event_back_block \{state = UIstate_mainmenu}
	change \{kickingToMain = 0}
	SetButtonEventMappings \{unblock_menu_input}
	($default_loading_screen.destroy)
endscript

script failed_connect_to_internet 
	printf \{qs(0x29c3e160)}
	destroy_generic_popup
	create_generic_popup \{title = $wii_error
		ok_menu
		message = $wii_failed_connect
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				destroy_and_allow_home_menu
			}
		]
		previous_menu = vmenu_main_menu}
endscript

script no_profiles_dialog 
	create_generic_popup \{title = $wii_no_prof_title
		ok_menu
		message = $wii_no_prof
		default_blackout
		add_user_control_helpers
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				wii_bootup_skip_login
			}
		]}
endscript
wii_parental_block = 0

script parental_block_dialog 
	create_generic_popup \{title = $wii_rvldwc_message_1000_title
		ok_menu
		message = $wii_rvldwc_message_1000
		default_blackout
		add_user_control_helpers
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				wii_bootup_skip_login
			}
		]}
endscript

script login_successful 
	destroy_generic_popup
	create_generic_popup \{title = $wii_login
		ok_menu
		message = $wii_connected
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				destroy_generic_popup
			}
		]
		previous_menu = vmenu_main_menu}
endscript

script login_failed 
endscript

script online_log_out 
	LogOut
endscript

script approve_name_dialog 
	enable_network_wait_variable
	destroy_generic_popup
	create_generic_popup \{title = $wii_approving_title
		loading_window
		message = $wii_approving1
		wait_variable = network_wait_var
		default_blackout}
endscript

script destroy_name_dialog_early 
	KillSpawnedScript \{name = start_loading_process}
	destroy_generic_popup
endscript
leaderboard_refresh = 0

script exit_leaderboard 
	if NetSessionFunc \{obj = stats
			func = cancel_leaderboards}
		destroy_generic_popup
		clean_up_user_control_helpers
		ui_flow_manager_respond_to_action \{action = go_back}
		clear_network_wait_variable
	endif
endscript

script leaderboard_failed 
	if ($waiting_on_leaderboards = 1)
		destroy_generic_popup
		clear_network_wait_variable
		clean_up_user_control_helpers
		create_generic_popup \{title = $wii_error
			ok_menu
			message = $wii_server_timeout
			ok_eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					leaderboard_failed_ok
				}
			]}
	endif
endscript

script leaderboard_failed_ok 
	destroy_generic_popup
	ui_flow_manager_respond_to_action \{action = go_back}
endscript

script leaderboard_request_dialog 
	change \{leaderboard_refresh = 0}
	destroy_generic_popup
	create_generic_popup \{title = $wii_lb_title
		loading_window
		can_cancel
		message = $wii_lb_waiting
		wait_variable = leaderboard_refresh
		cancel_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				exit_leaderboard
			}
		]
		previous_menu = online_leaderboard_vmenu}
endscript

script open_name_approval_timeout_dialog 
	destroy_name_dialog_early
	create_generic_popup \{title = $wii_approval_timeout_title
		ok_menu
		message = $wii_server_unavailable
		previous_menu = ebn_marker
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				destroy_and_allow_home_menu
			}
		]}
endscript
wifi_done_connecting = 0

script wifi_connect_done 
	change \{wifi_done_connecting = 1}
	set_home_button_allowed
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
endscript

script cancel_wifi_connect 
	set_home_button_allowed
	change \{wifi_done_connecting = 1}
	CancelConnectToWifi
endscript

script open_connect_to_wifi_dialog 
	destroy_generic_popup
	clean_up_user_control_helpers
	change \{wifi_done_connecting = 0}
	set_home_button_notallowed
	create_generic_popup \{title = $wii_login
		loading_window
		message = $wii_connecting
		wait_variable = wifi_done_connecting
		default_blackout}
endscript

script open_server_connect_error_dialog 
	destroy_generic_popup
	create_new_generic_popup \{popup_type = error_menu
		priority = 12
		error_func = destroy_generic_popup
		text = $wii_error_no_agora}
endscript

script open_net_problems_icon 
	if ScreenElementExists \{id = NetProblems_Icon}
		return
	endif
	get_net_loading_globe_pos
	CreateScreenElement {
		type = SpriteElement
		id = NetProblems_Icon
		parent = root_window
		texture = online_load_wheel_disconnected
		dims = (128.0, 128.0)
		rgba = [255 255 255 255]
		pos = <globe_pos>
		just = [center center]
		scale = 1.0
		z_priority = 10000.0
		alpha = 0
		no_squishy = true
	}
	if ScreenElementExists \{id = online_load_wheel_BG}
		LegacyDoScreenElementMorph \{id = online_load_wheel_BG
			alpha = 0
			time = 0.25}
	endif
	LegacyDoScreenElementMorph \{id = NetProblems_Icon
		alpha = 1
		time = 0.25}
	Wait \{2
		seconds}
	if ScreenElementExists \{id = online_load_wheel_BG}
		LegacyDoScreenElementMorph \{id = online_load_wheel_BG
			alpha = 1
			time = 0.25}
	endif
	LegacyDoScreenElementMorph \{id = NetProblems_Icon
		alpha = 0
		time = 0.25}
	Wait \{0.5
		seconds}
	if ScreenElementExists \{id = NetProblems_Icon}
		DestroyScreenElement \{id = NetProblems_Icon}
	endif
endscript
