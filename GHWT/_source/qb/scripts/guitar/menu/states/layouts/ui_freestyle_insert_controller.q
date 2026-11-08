
script ui_create_freestyle_insert_controller 
	SetButtonEventMappings \{unblock_menu_input}
	create_popup_warning_menu {
		title = qs("WARNING")
		textblock = {
			text = $wii_freestyle_controller_insert
		}
		options = [
			{
				func = ui_freestyle_controller_continue
				text = qs("CONTINUE")
			}
			{
				func = ui_freestyle_controller_back
				text = qs(0xa3ec595c)
			}
		]
		dlg_z_priority = ($ps3_fade_overlay_z + 100)
		use_all_controllers
	}
endscript

script freestyle_check_controllers_signin 
	controller_on = 0
	controller_index = 0
	begin
	GetWiiControllerType controller = <controller_index>
	if (<controller_type> = nunchuk || <controller_type> = guitar || <controller_type> = DrumKit)
		controller_on = 1
	endif
	<controller_index> = (<controller_index> + 1)
	repeat 4
	if ($freestyle_rocking_out_too_hard = 0 && <controller_on> = 0)
		ui_create_freestyle_insert_controller
	endif
endscript

script ui_freestyle_controller_back 
	ui_destroy_freestyle_insert_controller
	fade_overlay_off
	change \{freestyle_rocking_out_too_hard = 0}
	generic_event_back \{state = UIstate_mainmenu}
endscript

script ui_freestyle_controller_continue 
	ui_destroy_freestyle_insert_controller
	fade_overlay_off
	change \{freestyle_rocking_out_too_hard = 0}
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script ui_destroy_freestyle_insert_controller 
	destroy_popup_warning_menu
endscript
