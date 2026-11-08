
script ui_create_cag_select_part_inclusion_options 
	RequireParams \{[
			part
		]
		all}
	make_generic_menu \{vmenu_id = create_cag_custom_part_pickguard_options_vmenu
		pad_back_script = ui_event
		pad_back_params = {
			event = menu_back
			data = {
				num_states = 2
			}
		}}
	create_ui_history_header text = <text>
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_part_pickguard_options_vmenu}
	if GetCASAppearancePart part = <part>
		GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		if GotParam \{Finishable}
			add_generic_menu_icon_item {
				text = qs("Finishes")
				choose_state = UIstate_cag_select_part_inclusion
				choose_state_data = {part = (<Finishable>) body_part = <part> text = qs("Finishes") cam_anim = GuitarBody}
			}
		endif
		if GotParam \{Colorable}
			add_generic_menu_icon_item {
				text = qs("Color")
				choose_state = UIstate_cas_color_edit
				choose_state_data = {part = <part> text = qs("Color") cam_anim = GuitarBody part_materials = [skin]}
			}
		endif
		if GotParam \{Detailable}
			add_generic_menu_icon_item {
				text = $wii_detail
				choose_state = UIstate_cag_select_part_inclusion
				choose_state_data = {part = CAS_Drum_Detail body_part = <part> text = qs("Details") cam_anim = GuitarBody}
			}
		endif
	endif
	menu_finish \{car_helper_text}
	LaunchEvent type = focus target = create_cag_custom_part_pickguard_options_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_select_part_inclusion_options 
	destroy_generic_menu
endscript
