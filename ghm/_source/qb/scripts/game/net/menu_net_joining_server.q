
script create_join_server_menu 
	createscreenelement \{type = containerelement
		parent = root_window
		id = joining_screen_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = xb_online_bg}
	displaysprite \{id = online_frame
		parent = joining_screen_container
		tex = xb_online_frame_large
		pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaysprite \{id = xb_online_frame_crown
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
		<title_text> = qs(0xf05a63dd)
	else
		<title_text> = qs(0x0956be4d)
	endif
	createscreenelement {
		type = textelement
		parent = joining_screen_container
		font = fontgrid_title_a1
		scale = 0.85
		rgba = ($online_dark_purple)
		text = <title_text>
		pos = (640.0, 135.0)
		just = [center top]
		z_priority = 2.1
	}
	createscreenelement {
		type = textelement
		parent = joining_screen_container
		text = qs(0x78490530)
		just = [center center]
		pos = (640.0, 340.0)
		rot_angle = 0
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		z_priority = 2.1
	}
	getscreenelementdims id = <id>
	createscreenelement {
		type = textelement
		parent = <id>
		id = dots_text
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs(0x03ac90f0)
		just = [left top]
		z_priority = 2.1
		pos = (<width> * (1.0, 0.0) + (5.0, 15.0))
	}
	if screenelementexists \{id = dots_text}
		runscriptonscreenelement \{id = dots_text
			animate_dots
			params = {
				id = dots_text
			}}
	endif
	launchevent \{type = focus
		target = joining_screen_container}
	0x997d22d5
endscript

script destroy_join_server_menu 
	destroy_generic_popup
	if screenelementexists \{id = joining_screen_container}
		destroyscreenelement \{id = joining_screen_container}
	endif
	destroy_popup_warning_menu
	destroy_menu_backdrop
endscript

script create_joining_screen 
	createscreenelement \{type = containerelement
		parent = root_window
		id = joining_screen_container
		pos = (0.0, 0.0)}
	create_menu_backdrop \{texture = menu_venue_bg}
	createscreenelement \{type = textelement
		parent = joining_screen_container
		text = qs(0x78490530)
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
	createscreenelement \{type = textelement
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
		text = qs(0x03ac90f0)
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
	if screenelementexists \{id = joining_dots_text}
		runscriptonscreenelement \{id = joining_dots_text
			animate_dots
			params = {
				id = joining_dots_text
			}}
	endif
endscript

script destroy_joining_screen 
	if screenelementexists \{id = joining_screen_container}
		destroyscreenelement \{id = joining_screen_container}
	endif
	destroy_menu_backdrop
endscript
0xbefe4db6 = 0

script 0xb2284bbf 
	change \{0xbefe4db6 = 1}
	destroy_generic_popup
endscript

script 0x8904059c \{go_back = 1}
	change \{0xbefe4db6 = 1}
	change \{is_network_game = 0}
	if (<go_back> = 1)
		generic_event_back
	endif
	0xf643c6a5
endscript

script 0x80ee4d07 
	change \{0xbefe4db6 = 1}
	destroy_generic_popup
	if (<go_back> = 1)
		generic_event_back
	endif
	change \{num_players_in_band = 0}
	ui_band_mode_change_menu_focus_all \{focus_type = focus}
	0xf643c6a5
endscript

script 0x997d22d5 \{go_back = 1
		cancel_script = 0x8904059c}
	change \{0xbefe4db6 = 0}
	spawnscriptnow create_generic_popup params = {
		loading_window
		can_cancel
		message = qs(0xddccf0c3)
		wait_variable = 0xbefe4db6
		cancel_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose <cancel_script> params = {go_back = <go_back>}}
		]
	}
endscript

script 0x47d189ca 
	destroy_generic_popup
	ui_event_get_top
	if (<base_name> = 'online')
		cancel_start_matchmaking
	endif
endscript

script 0x9282b5c7 
	change \{0xbefe4db6 = 1}
	destroy_generic_popup
	create_generic_popup \{ok_menu
		title = qs(0x1a4b0d3a)
		message = qs(0x1876e423)
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
				0x47d189ca
			}
		]}
endscript
