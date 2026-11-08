
script ui_create_cag_custom_head 
	make_generic_menu \{vmenu_id = create_cag_custom_head_id
		show_history
		title = qs("Change Head")}
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_head_id
		camera_list = [
			'cag_custom_head'
			'cag_custom_head_R'
			'cag_custom_head_B'
			'cag_custom_head_L'
		]
		no_zoom}
	add_generic_menu_icon_item {
		icon = icon_cag_head_type
		text = qs("STYLE")
		choose_state = UIstate_cag_select_part_inclusion
		choose_state_data = {
			part = <part>
			body_part = <body_part>
			text = qs("CHOOSE HEAD")
			is_popup
			hist_tex = icon_cag_head_type
			color_wheel = ($guitar_colorwheel)
			camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
			zoom_camera = 'customize_cag_Zoom'
			no_edit
		}
	}
	if GetCASAppearancePart part = <part>
		GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		if GotParam \{Finishable}
			add_generic_menu_icon_item {
				text = qs("FINISHES")
				choose_state = UIstate_cag_select_part_inclusion
				choose_state_data = {part = (<Finishable>) body_part = <part> text = qs("Finishes") cam_anim = GuitarBody container_id = <container_id> is_popup hist_tex = icon_cag_head_finishes
					camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
					zoom_camera = 'customize_cag_Zoom'
				}
			}
		endif
		if GotParam \{Detailable}
			add_generic_menu_icon_item {
				text = $wii_detail
				choose_state = UIstate_cag_select_part_inclusion
				choose_state_data = {part = (<Detailable>) body_part = <part> text = qs("Details") cam_anim = GuitarBody container_id = <container_id> is_popup hist_tex = icon_cag_head_finishes
					camera_list = ['cag_custom_head' 'cag_custom_head_R' 'cag_custom_head_B' 'cag_custom_head_L']
					zoom_camera = 'customize_cag_Zoom'
				}
			}
		endif
	endif
	menu_finish \{car_helper_text
		no_zoom_text}
	LaunchEvent type = focus target = create_cag_custom_head_id data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_head 
	destroy_generic_menu
endscript

script ui_return_cag_custom_head 
	spawnscriptnow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript
