
script ui_create_recording_disconnect \{training = 0}
	if (<training> = 1)
		options = [
			{
				func = ui_recording_disconnect_quit
				func_params = {<...>}
				text = qs("QUIT")
				sound_func = nullscript
			}
		]
	else
		options = [
			{
				func = ui_recording_disconnect_continue
				func_params = {<...>}
				text = qs("OK")
				sound_func = nullscript
			}
		]
	endif
	create_popup_warning_menu {
		title = qs("WARNING")
		textblock = {
			text = qs("")
		}
		options = <options>
		player_device = ($primary_controller)
	}
	PopupElement :SetTags \{is_disconnect_warning = true}
	PopupElement :obj_spawnscript ui_recording_disconnect_update params = {training = <training>}
endscript

script ui_destroy_recording_disconnect 
	destroy_popup_warning_menu
endscript

script ui_recording_disconnect_update \{training = 0}
	old_text = $wii_rocking_too_hard
	begin
	text = qs("")
	GetControllerType controller = ($primary_controller)
	GetActiveControllers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	if (((<controller_type> != guitar) && (<controller_type> != drum)) || <is_active_controller> != 1)
		if (<training> = 1)
			text = qs("YOU ARE ROCKING OUT A BIT TOO HARD!\n\nYou must connect either a Guitar or Drum Controller to continue.")
		else
			text = qs("YOU ARE ROCKING OUT A BIT TOO HARD!\n\nYou must connect either a Guitar or Drum Controller to continue recording.")
		endif
	else
		if (<controller_type> = guitar)
			text = (<text> + qs("Your Guitar Controller is connected!"))
		elseif (<controller_type> = drum)
			if isRBDrum controller = ($primary_controller)
				text = (<text> + qs("Your Four Pad Drum Controller is connected!"))
			else
				text = (<text> + qs("Your Guitar Hero Drum Controller is connected!"))
			endif
		endif
	endif
	if NOT (<old_text> = <text>)
		SE_SetProps {PopupBody_text = <text>}
		old_text = <text>
	endif
	Wait \{5
		gameframes}
	repeat
endscript

script ui_recording_disconnect_continue 
	printf \{'ui_recording_disconnect_continue'}
	GetControllerType controller = ($primary_controller)
	if NOT ((<controller_type> = guitar) || (<controller_type> = drum))
		menu_scroll_end_sound
		return
	endif
	generic_event_back
	spawnscriptnow \{jam_recording_check_disconnect}
endscript

script ui_recording_disconnect_quit 
	printf \{'ui_recording_disconnect_quit'}
	if (<training> = 1)
		change \{jam_tutorial_disconnect = 1}
		generic_event_back
	else
		create_loading_screen
		Wait \{3
			gameframes}
		generic_event_back \{state = UIstate_mainmenu}
	endif
endscript
