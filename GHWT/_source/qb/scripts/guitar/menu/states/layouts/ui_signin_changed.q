
script ui_create_signin_changed \{no_options = 0}
	destroy_popup_warning_menu
	if (<no_options> = 0)
		options = [
			{
				func = signing_change_confirm_reboot
				text = qs("CONTINUE")
				scale = (1.0, 1.0)
			}
		]
	endif
	create_popup_warning_menu {
		title = qs("SIGN-IN CHANGED")
		title_props = {scale = 1.0}
		textblock = {
			text = qs("A user sign-in change has caused the game to lose ownership of saves and achievements. As a result, the game has restarted.")
			pos = (640.0, 380.0)
		}
		menu_pos = (640.0, 510.0)
		options = <options>
		use_all_controllers
		z_priority = 1100
		no_focus
	}
	AssignAlias id = <menu_id> alias = current_menu
endscript

script ui_destroy_signin_changed 
	destroy_popup_warning_menu
endscript
