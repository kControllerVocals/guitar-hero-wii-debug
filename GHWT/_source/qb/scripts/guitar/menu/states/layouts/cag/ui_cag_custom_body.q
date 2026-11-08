
script ui_create_cag_custom_body 
	part = (<instrument_info>.body_part)
	make_generic_menu \{vmenu_id = create_cag_custom_body_vmenu
		title = qs("Body")
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_body_vmenu
		camera_list = [
			'cag_custom_body'
			'cag_custom_body_R'
			'cag_custom_body_B'
			'cag_custom_body_L'
		]
		no_zoom}
	add_generic_menu_icon_item {
		icon = icon_cag_type
		text = qs("STYLE")
		pad_choose_script = continue_to_type
		pad_choose_params = {
			part = <part>
			is_popup
			cam_name = 'cag_custom_body'
			camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
		}
	}
	if GetCASAppearancePart part = <part>
		GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		if GotParam \{Finishable}
			add_generic_menu_icon_item {
				text = qs("FINISH")
				choose_state = UIstate_cag_select_part_inclusion
				choose_state_data = {part = (<Finishable>) body_part = <part> text = qs("Finishes") cam_anim = GuitarBody container_id = <container_id> is_popup hist_tex = icon_cag_head_finishes
					camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
				}
			}
		endif
		if GotParam \{Detailable}
			add_generic_menu_icon_item {
				text = $wii_detail
				choose_state = UIstate_cag_select_part_inclusion
				choose_state_data = {part = (<Detailable>) body_part = <part> text = qs("Details") cam_anim = GuitarBody container_id = <container_id> is_popup hist_tex = icon_cag_head_finishes
					camera_list = ['cag_custom_body' 'cag_custom_body_R' 'cag_custom_body_B' 'cag_custom_body_L']
				}
			}
		endif
	endif
	menu_finish \{car_helper_text
		no_zoom_text}
	LaunchEvent type = focus target = create_cag_custom_body_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_body 
	destroy_generic_menu
endscript

script ui_return_cag_custom_body 
	spawnscriptnow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript

script continue_to_finishes 
	if Is_ui_event_running
		return \{false}
	endif
	CasCancelLoading
	CasBlockForComposite
	CASBlockForLoading
	ui_event_block event = menu_change data = {state = UIstate_cap_artist_layer_popout <...>}
endscript

script continue_to_type 
	if Is_ui_event_running
		return \{false}
	endif
	CasCancelLoading
	CasBlockForComposite
	CASBlockForLoading
	ui_event_block event = menu_change data = {state = UIstate_cag_custom_body_types <...>}
endscript
