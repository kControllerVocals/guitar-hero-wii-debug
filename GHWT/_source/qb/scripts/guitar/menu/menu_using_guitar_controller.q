menu_using_guitar_controller_font = fontgrid_text_a8

script create_using_guitar_controller_menu 
	create_menu_backdrop \{texture = white}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = current_menu
		pos = (0.0, 0.0)
		event_handlers = [
			{
				pad_start
				ui_event
				params = {
					event = menu_replace
					data = {
						state = uistate_boot_download_scan
					}
				}
			}
			{
				pad_choose
				ui_event
				params = {
					event = menu_replace
					data = {
						state = uistate_boot_download_scan
					}
				}
			}
		]}
	guitar_tex = boot_usingGuitar_gtr_LesPaul
	GetPlatform
	switch <platform>
		case ps3
		<guitar_tex> = boot_usingGuitar_gtr_LesPaul_PS3
		case Ps2
		<guitar_tex> = boot_usingGuitar_gtr_LesPaul_PS2
	endswitch
	displaySprite parent = current_menu tex = <guitar_tex> pos = (660.0, 510.0) just = [center center] z = 1
	controller = boot_usingGuitar
	if NOT IsGuitarController
		controller = boot_usingDrums
		if NOT IsDrumController
			controller = boot_usingMic
		endif
	endif
	displaySprite parent = current_menu tex = <controller> pos = (640.0, 270.0) just = [center center] z = 1
	displaySprite \{parent = current_menu
		id = bg_helper
		tex = boot_usingGuitar_BG
		rgba = [
			83
			95
			147
			255
		]
		dims = (221.0, 40.0)
		just = [
			center
			top
		]
		z = 0.5}
	displayText \{parent = current_menu
		id = bg_helper_text
		font = fontgrid_text_a8
		rgba = [
			223
			223
			223
			255
		]
		scale = 0.5
		just = [
			center
			top
		]
		z = 0.6
		noshadow}
	menu_using_guitar_controller_add_text_start
	menu_using_guitar_controller_add_text_back
	menu_using_guitar_controller_add_text_continue
	menu_using_guitar_controller_add_text_up_down
	menu_using_guitar_controller_add_text_tilt_starpower
	menu_using_guitar_controller_add_text_header
	RunScriptOnScreenElement \{id = current_menu
		go_through_using_guitar_text}
	LaunchEvent \{type = focus
		id = current_menu}
	return \{play_sound = 0}
endscript

script destroy_using_guitar_controller_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = current_menu}
	destroy_menu_backdrop
endscript

script wait_for_button_release 
	begin
	GetButtonsPressed
	if (<breaks> = 1)
		return
	endif
	WaitOneGameFrame
	repeat
endscript

script go_through_using_guitar_text 
	text = qs("1) STRAP ON")
	if NOT IsGuitarController
		text = qs("1) SIT DOWN")
		if NOT IsDrumController
			text = qs("1) STAND UP")
		endif
	endif
	max_width = 200
	begin
	if ScreenElementExists \{id = bg_helper}
		SetScreenElementProps \{id = bg_helper
			pos = (406.0, 135.0)}
	endif
	if ScreenElementExists \{id = bg_helper_text}
		SetScreenElementProps id = bg_helper_text pos = (407.0, 130.0) text = <text>
		GetScreenElementDims \{id = bg_helper_text}
		SetScreenElementProps \{id = bg_helper_text
			scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle id = bg_helper_text dims = (<max_width> * (1.0, 0.0) + <Height> * (0.0, 1.0))
		else
			SetScreenElementProps \{id = bg_helper_text
				scale = 0.5}
		endif
	endif
	Wait \{2
		seconds}
	if ScreenElementExists \{id = bg_helper}
		SetScreenElementProps \{id = bg_helper
			pos = (639.0, 135.0)}
	endif
	if ScreenElementExists \{id = bg_helper_text}
		SetScreenElementProps \{id = bg_helper_text
			pos = (640.0, 130.0)
			text = qs("2) BANG HEAD")}
		GetScreenElementDims \{id = bg_helper_text}
		SetScreenElementProps \{id = bg_helper_text
			scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle id = bg_helper_text dims = (<max_width> * (1.0, 0.0) + <Height> * (0.0, 1.0))
		else
			SetScreenElementProps \{id = bg_helper_text
				scale = 0.5}
		endif
	endif
	Wait \{2
		seconds}
	if ScreenElementExists \{id = bg_helper}
		SetScreenElementProps \{id = bg_helper
			pos = (872.0, 135.0)}
	endif
	if ScreenElementExists \{id = bg_helper_text}
		SetScreenElementProps \{id = bg_helper_text
			pos = (873.0, 130.0)
			text = qs("3) LOSE CONTROL")}
		GetScreenElementDims \{id = bg_helper_text}
		SetScreenElementProps \{id = bg_helper_text
			scale = 1}
		if (<width> > <max_width>)
			fit_text_in_rectangle id = bg_helper_text dims = (<max_width> * (1.0, 0.0) + <Height> * (0.0, 1.0))
		else
			SetScreenElementProps \{id = bg_helper_text
				scale = 0.5}
		endif
	endif
	Wait \{2
		seconds}
	repeat
endscript

script menu_using_guitar_controller_add_text_start 
	text1 = qs("START")
	text1_pos = (805.0, 585.0)
	text2 = qs("button")
	text2_pos = (805.0, 618.0)
	CreateScreenElement {
		type = TextElement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		scale = (0.7, 0.7)
	}
	GetScreenElementDims id = <id>
	if (<width> > 80)
		extra_space = (<width> - 80)
		GetScreenElementProps id = <id>
		SetScreenElementProps id = <id> pos = (<pos> - <extra_space> * (0.5, 0.0))
	endif
	CreateScreenElement {
		type = TextElement
		text = <text2>
		pos = <text2_pos>
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_back 
	text1 = qs("BACK")
	text1_pos = (460.0, 582.0)
	text2 = qs("Red Button")
	text2_pos = (460.0, 615.0)
	CreateScreenElement {
		type = TextElement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		scale = (0.7, 0.7)
	}
	CreateScreenElement {
		type = TextElement
		text = <text2>
		pos = <text2_pos>
		parent = current_menu
		rgba = [165 70 70 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_continue 
	text1 = qs("CONTINUE")
	text1_pos = (390.0, 582.0)
	text2 = qs("Green Button")
	text2_pos = (390.0, 615.0)
	CreateScreenElement {
		type = TextElement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		scale = (0.7, 0.7)
	}
	GetScreenElementDims id = <id>
	if (<width> > 125)
		extra_space = (<width> - 125)
		GetScreenElementProps id = <id>
		SetScreenElementProps id = <id> pos = (<pos> - <extra_space> * (0.5, 0.0))
	endif
	CreateScreenElement {
		type = TextElement
		text = <text2>
		pos = <text2_pos>
		parent = current_menu
		rgba = [80 145 105 255]
		font = ($menu_using_guitar_controller_font)
		just = [right top]
		scale = 0.6
	}
endscript

script menu_using_guitar_controller_add_text_up_down 
	text1 = qs("UP/DOWN")
	text1_pos = (590.0, 390.0)
	text2 = qs("Strum Bar")
	text2_pos = (590.0, 423.0)
	CreateScreenElement {
		type = TextElement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (0.7, 0.7)
	}
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		type = TextElement
		text = <text2>
		pos = <text2_pos>
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = 0.6
	}
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
endscript

script menu_using_guitar_controller_add_text_tilt_starpower 
	text1 = qs("TILT UP")
	text1_pos = (300.0, 390.0)
	text2 = qs("for Star Power")
	text2_pos = (300.0, 423.0)
	CreateScreenElement {
		type = TextElement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		scale = (0.7, 0.7)
	}
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	CreateScreenElement {
		type = TextElement
		text = <text2>
		pos = <text2_pos>
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [left top]
		scale = 0.6
	}
	GetScreenElementDims id = <id>
	if (<width> > 180)
		SetScreenElementProps id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((180.0, 0.0) + <Height> * (0.0, 1.0))
	endif
	CreateScreenElement \{type = SpriteElement
		parent = current_menu
		texture = boot_usingGuitar_arrow
		pos = (270.0, 460.0)
		just = [
			right
			center
		]}
endscript

script menu_using_guitar_controller_add_text_header 
	text1 = qs("IN THE EVENT OF ROCK")
	text1_pos = (660.0, 55.0)
	text2 = qs("USING THE GUITAR CONTROLLER")
	text2_pos = (660.0, 95.0)
	text2 = qs("USING THE GUITAR CONTROLLER")
	if NOT IsGuitarController
		text2 = qs("USING THE DRUM CONTROLLER")
		if NOT IsDrumController
			text2 = qs("USING THE MIC & CONTROLLER")
		endif
	endif
	CreateScreenElement {
		type = TextElement
		text = <text1>
		pos = <text1_pos>
		parent = current_menu
		rgba = [100 110 145 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (1.4, 1.0)
	}
	CreateScreenElement {
		type = TextElement
		text = <text2>
		pos = <text2_pos>
		parent = current_menu
		rgba = [0 0 0 255]
		font = ($menu_using_guitar_controller_font)
		just = [center top]
		scale = (0.9, 0.7)
	}
endscript
