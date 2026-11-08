
script create_join_server_menu 
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = joining_screen_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = xb_online_bg}
	displaySprite \{id = online_frame
		parent = joining_screen_container
		tex = xb_online_frame_large
		pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaySprite \{id = xb_online_frame_crown
		parent = joining_screen_container
		tex = xb_online_frame_crown
		pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 2.1
		dims = (256.0, 105.0)}
	if (($ui_flow_manager_state [0]) = quick_match_joining_game_fs)
		<title_text> = qs(0x42d2d391)
	elseif (($ui_flow_manager_state [0]) = invite_joining_game_fs)
		<title_text> = qs("INVITATION")
	else
		<title_text> = qs("CUSTOM MATCH")
	endif
	CreateScreenElement {
		type = TextElement
		parent = joining_screen_container
		font = fontgrid_title_a1
		scale = 0.85
		rgba = ($online_dark_purple)
		text = <title_text>
		pos = (640.0, 135.0)
		just = [center top]
		z_priority = 2.1
	}
	CreateScreenElement {
		type = TextElement
		parent = joining_screen_container
		text = qs("JOINING GAME")
		just = [center center]
		pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		z_priority = 2.1
	}
	GetScreenElementDims id = <id>
	CreateScreenElement {
		type = TextElement
		parent = <id>
		id = dots_text
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs("\L")
		just = [left top]
		z_priority = 2.1
		pos = (<width> * (1.0, 0.0) + (5.0, 15.0))
	}
	if ScreenElementExists \{id = dots_text}
		RunScriptOnScreenElement \{id = dots_text
			animate_dots
			params = {
				id = dots_text
			}}
	endif
	LaunchEvent \{type = focus
		target = joining_screen_container}
	open_dwc_matchmaking_dialog
endscript

script destroy_join_server_menu 
	destroy_generic_popup
	if ScreenElementExists \{id = joining_screen_container}
		DestroyScreenElement \{id = joining_screen_container}
	endif
	destroy_menu_backdrop
endscript

script create_joining_screen 
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = joining_screen_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = menu_venue_bg}
	CreateScreenElement \{type = TextElement
		parent = joining_screen_container
		text = qs("JOINING GAME")
		just = [
			center
			center
		]
		pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_a1
		scale = 2.0
		rgba = [
			210
			210
			210
			250
		]
		shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		z_priority = 2.0}
	CreateScreenElement \{type = TextElement
		parent = joining_screen_container
		id = joining_dots_text
		font = fontgrid_text_a6
		scale = 2.0
		rgba = [
			210
			210
			210
			250
		]
		text = qs("\L")
		just = [
			left
			top
		]
		z_priority = 2.0
		pos = (640.0, 450.0)
		shadow
		shadow_offs = (5.0, 5.0)
		shadow_rgba = [
			0
			0
			0
			255
		]}
	if ScreenElementExists \{id = joining_dots_text}
		RunScriptOnScreenElement \{id = joining_dots_text
			animate_dots
			params = {
				id = joining_dots_text
			}}
	endif
endscript

script destroy_joining_screen 
	if ScreenElementExists \{id = joining_screen_container}
		DestroyScreenElement \{id = joining_screen_container}
	endif
	destroy_menu_backdrop
endscript
dwc_done_matchmaking = 0

script dwc_finish_matchmaking 
	change \{dwc_done_matchmaking = 1}
	destroy_generic_popup
endscript

script dwc_cancel_matchmaking \{go_back = 1}
	change \{dwc_done_matchmaking = 1}
	change \{is_network_game = 0}
	if (<go_back> = 1)
		generic_event_back
	endif
	EndMatch
endscript

script dwc_alternate_cancel_matchmaking 
	change \{dwc_done_matchmaking = 1}
	destroy_generic_popup
	if (<go_back> = 1)
		generic_event_back
	endif
	change \{num_players_in_band = 0}
	ui_band_mode_change_menu_focus_all \{focus_type = focus}
	EndMatch
endscript

script open_dwc_matchmaking_dialog \{go_back = 1
		cancel_script = dwc_cancel_matchmaking}
	change \{dwc_done_matchmaking = 0}
	spawnscriptnow create_generic_popup params = {
		loading_window
		can_cancel
		message = $wii_searching
		wait_variable = dwc_done_matchmaking
		cancel_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose <cancel_script> params = {go_back = <go_back>}}
		]
	}
endscript

script matchmaking_timeout_ok 
	destroy_generic_popup
	ui_event_get_top
	if (<base_name> = 'online')
		cancel_start_matchmaking
	endif
endscript

script open_dwc_matchmaking_timedout_dialog 
	change \{dwc_done_matchmaking = 1}
	destroy_generic_popup
	create_generic_popup \{ok_menu
		title = $wii_join_failed_text
		message = $wii_no_games_found_text
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
				matchmaking_timeout_ok
			}
		]}
endscript
