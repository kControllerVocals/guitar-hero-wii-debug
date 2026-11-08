
script ui_create_cas_select_part_options \{num_states = 2}
	make_generic_menu {
		vmenu_id = create_cas_select_part_options_vmenu
		title = qs("EDIT ITEM")
		pad_back_script = ui_event
		pad_back_params = {event = menu_back data = {num_states = <num_states>}}
		show_history
		num_icons = <num_icons>
	}
	setup_cas_menu_handlers vmenu_id = create_cas_select_part_options_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	if GetCASPartMaterials part = <part>
		add_generic_menu_icon_item {
			text = qs("COLOR")
			icon = menu_history_color_edit
			choose_state = UIstate_cas_color_edit
			choose_state_data = {part = <part> part_materials = <part_materials> num_states = 1 hist_tex = menu_history_color_edit camera_list = <camera_list> zoom_camera = <zoom_camera>}
		}
	endif
	add_generic_menu_icon_item {
		text = qs("ADD DESIGN")
		icon = icon_graphics
		choose_state = UIstate_cap_main
		choose_state_data = {savegame = ($cas_current_savegame) part = <part> text = qs("DESIGN") hist_tex = icon_graphics camera_list = <camera_list> zoom_camera = <zoom_camera>}
	}
	menu_finish \{car_helper_text}
endscript

script ui_destroy_cas_select_part_options 
	destroy_generic_menu
endscript

script ui_deinit_cas_select_part_options 
	if GotParam \{additional_deinit_script}
		<additional_deinit_script>
	endif
endscript
