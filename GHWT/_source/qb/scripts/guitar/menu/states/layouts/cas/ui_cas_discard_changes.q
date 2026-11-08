
script ui_create_cas_discard_changes 
	create_popup_warning_menu \{title = qs("Discard Changes?")
		textblock = {
			text = qs("Would you like to discard these changes?")
		}
		no_background
		options = [
			{
				func = discard_changes_continue
				text = qs("Yes")
			}
			{
				func = generic_event_back
				text = qs("No")
			}
		]
		popup_event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
			{
				pad_back
				generic_event_back
			}
		]}
	setup_cas_menu_handlers \{vmenu_id = pu_warning_vmenu}
endscript

script ui_destroy_cas_discard_changes 
	destroy_popup_warning_menu
endscript

script discard_changes_continue 
	RestoreTopTemporaryCASAppearance
	generic_event_back \{data = {
			num_states = 2
		}}
endscript

script discard_changes_prompt 
	if NOT CompareTopTemporaryCASAppearance
		generic_event_choose \{data = {
				state = UIstate_cas_discard_changes
				is_popup
			}}
	else
		generic_event_back
	endif
endscript
