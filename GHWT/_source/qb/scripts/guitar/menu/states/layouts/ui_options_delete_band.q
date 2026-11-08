
script ui_create_options_delete_band 
	text = [
		qs("You are about to permanently delete the selected band. ")
		qs("All progress associated with that band will be lost. ")
		qs("Are you sure you want to continue?")
	]
	create_popup_warning_menu {
		textblock = {
			text = <text>
		}
		menu_pos = (640.0, 480.0)
		back_button_script = generic_event_back
		options = [
			{
				func = menu_confirm_band_delete_select_yes
				text = qs("DELETE")
				scale = (1.0, 1.0)
			}
			{
				func = generic_event_back
				text = qs("CANCEL")
				scale = (1.0, 1.0)
			}
		]
	}
endscript

script ui_destroy_options_delete_band 
	destroy_popup_warning_menu
endscript
