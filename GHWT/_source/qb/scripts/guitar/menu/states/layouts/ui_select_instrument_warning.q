
script ui_create_select_instrument_warning \{AddMainMenu = 1}
	switch (<instrument>)
		case guitar
		case Bass
		text = qs("You must use a Guitar Controller to continue.")
		case drum
		text = qs("You must use a Drum Controller to continue.")
		case Vocals
		if isXenon
			text = qs("You must connect a microphone or Xbox 360 Headset to continue.")
		else
			text = $wii_connect_logitech
		endif
	endswitch
	ui_event_exists_in_stack \{name = 'band_mode'}
	printstruct <...>
	if ui_event_exists_in_stack \{name = 'band_mode'}
		if ($is_network_game = 1)
			if (<AddMainMenu> = 1)
				options = [
					{
						func = check_for_guitar
						func_params = {controller = controller}
						text = qs("CONTINUE")
					}
					{
						func = generic_event_back
						func_params = {state = UIstate_mainmenu}
						text = qs("RETURN TO MAIN MENU")
					}
				]
			else
				options = [
					{
						func = check_for_guitar
						func_params = {controller = controller}
						text = qs("CONTINUE")
					}
				]
			endif
		else
			if (<AddMainMenu> = 1)
				options = [
					{
						func = generic_event_back
						text = qs("GO BACK")
					}
					{
						func = generic_event_back
						func_params = {state = UIstate_mainmenu}
						text = qs("RETURN TO MAIN MENU")
					}
				]
			else
				options = [
					{
						func = generic_event_back
						text = qs("GO BACK")
					}
				]
			endif
		endif
	else
		if (<AddMainMenu> = 1)
			options = [
				{
					func = generic_event_back
					text = qs("GO BACK")
				}
				{
					func = generic_event_back
					func_params = {state = UIstate_mainmenu}
					text = qs("RETURN TO MAIN MENU")
				}
			]
		else
			options = [
				{
					func = generic_event_back
					text = qs("GO BACK")
				}
			]
		endif
	endif
	create_popup_warning_menu {
		textblock = {
			text = <text>
			dims = (800.0, 400.0)
			scale = 0.55
		}
		player_device = ($primary_controller)
		no_background
		menu_pos = (640.0, 520.0)
		options = <options>
	}
endscript

script ui_destroy_select_instrument_warning 
	destroy_popup_warning_menu
endscript

script check_for_guitar 
	get_controller_type controller_index = <controller>
	if (<controller_type> = guitar)
		generic_event_back
	endif
endscript
