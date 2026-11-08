
script ui_create_jam_publish_title_entry 
	change \{num_name_size = 14}
	make_generic_menu \{vmenu_id = text_entry_vmenu
		title = qs("Enter Song Name")}
	add_generic_menu_text_item \{text = qs("SONG NAME: ")
		heading}
	text_entry_add_item {
		pad_back_script = generic_event_back
		pad_choose_script = <choose_script>
		pad_choose_params = <choose_params>
		pad_back_script = generic_event_back
		text = <text>
		validity_message = qs("You must enter a song name to continue")
	}
	menu_finish \{no_helper_text}
	ui_cas_text_entry_helper_text
	LaunchEvent \{type = focus
		target = text_entry_vmenu
		data = {
			child_index = 1
		}}
	LaunchEvent \{type = pad_choose}
endscript

script ui_return_jam_publish_text_entry 
	clean_up_user_control_helpers
	ui_cas_text_entry_helper_text
endscript

script ui_destroy_jam_publish_title_entry 
	change \{num_name_size = 19}
	destroy_generic_menu
endscript
