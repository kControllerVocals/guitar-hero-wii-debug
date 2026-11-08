
script ui_create_tutorial_prompt_easy 
	switch ($current_progression_flag)
		case Career_Guitar
		text = qs("You have selected Beginner difficulty. In this difficulty you will need to strum in time for each note, but do not need to hit any fret buttons to succeed.")
		case Career_Bass
		text = qs("You have selected Beginner difficulty. In this difficulty you will need to strum in time for each note, but do not need to hit any fret buttons to succeed.")
		case Career_Drum
		text = qs("You have selected Beginner difficulty. In this difficulty you will need to hit any drum pad in time with each note, but do not need to hit any particular drum to succeed.")
		case Career_Vocals
		text = qs("You have selected Beginner difficulty. In this difficulty you only need to sing in time with the words of the song, but do not need to worry about matching the pitch.")
	endswitch
	create_popup_warning_menu {
		title = qs("Beginner Note:")
		textblock = {
			text = <text>
		}
		options = [
			{
				func = tutorial_prompt_easy_continue
				text = qs("Continue")
			}
		]
		no_background
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back tutorial_prompt_easy_continue}]
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100000}
	SetGlobalTags \{training
		params = {
			has_prompt_easy_tutorial = complete
		}}
endscript

script ui_destroy_tutorial_prompt_easy 
	destroy_popup_warning_menu
endscript

script tutorial_prompt_easy_continue 
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_gig_posters
		}}
endscript
