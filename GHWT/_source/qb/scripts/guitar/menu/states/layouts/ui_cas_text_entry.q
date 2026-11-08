
script ui_create_cas_text_entry 
	change \{num_name_size = 14}
	if NOT GotParam \{no_show_history}
		show_history = {show_history}
	endif
	if English
		hist_tex = icon_name
	elseif German
		hist_tex = icon_name_german
	elseif French
		hist_tex = icon_name_french
	elseif Italian
		hist_tex = icon_name_italian
	elseif Spanish
		hist_tex = icon_name_spanish
	endif
	make_generic_menu {
		vmenu_id = text_entry_vmenu
		title = qs("Enter Name")
		num_icons = <num_icons>
		hist_tex = <hist_tex>
		show_history
	}
	add_generic_menu_text_item \{text = qs("NAME: ")
		heading}
	text_entry_add_item {
		pad_back_script = generic_event_back
		pad_choose_script = <choose_script>
		pad_choose_params = <choose_params>
		text = <text>
		text_case = title
	}
	ui_cas_text_entry_helper_text
	lock_to_text_entry
	if English
		ui_event_add_params \{hist_tex = icon_name}
	elseif German
		ui_event_add_params \{hist_tex = icon_name_german}
	elseif French
		ui_event_add_params \{hist_tex = icon_name_french}
	elseif Italian
		ui_event_add_params \{hist_tex = icon_name_italian}
	elseif Spanish
		ui_event_add_params \{hist_tex = icon_name_spanish}
	endif
	if GotParam \{cam_name}
		spawnscriptnow task_menu_default_anim_in params = {base_name = <cam_name>}
	endif
endscript

script ui_cas_text_entry_helper_text 
	add_user_control_helper \{text = qs("ACCEPT")
		button = green
		z = 100000}
	add_user_control_helper \{text = qs("CANCEL")
		button = red
		z = 100000}
	add_user_control_helper \{text = qs("ADD LETTER")
		button = Yellow
		z = 100000}
	add_user_control_helper \{text = qs("BACKSPACE")
		button = Blue
		z = 100000}
	controller = ($primary_controller)
	add_user_control_helper \{text = qs("CAPS")
		button = Orange
		z = 100000}
endscript

script ui_return_cas_text_entry 
	ui_cas_text_entry_helper_text
endscript

script ui_destroy_cas_text_entry 
	SoundEvent \{event = Enter_Band_Name_Finish}
	if ScreenElementExists \{id = generic_menu}
		DestroyScreenElement \{id = generic_menu}
	endif
	generic_ui_destroy
endscript

script lock_to_text_entry 
	LaunchEvent \{type = focus
		target = text_entry_vmenu
		data = {
			child_index = 1
		}}
	LaunchEvent \{type = pad_choose}
endscript
