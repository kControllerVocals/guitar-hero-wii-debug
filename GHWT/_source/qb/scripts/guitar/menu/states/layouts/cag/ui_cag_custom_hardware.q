
script ui_create_cag_custom_hardware 
	make_generic_menu \{vmenu_id = create_cag_custom_hardware_vmenu
		title = qs("Hardware")
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_hardware_vmenu
		camera_list = [
			'cag_custom_hardware'
			'cag_custom_hardware_R'
			'cag_custom_hardware_B'
			'cag_custom_hardware_L'
		]
		no_zoom}
	add_generic_menu_icon_item {
		icon = icon_cag_pickguard
		text = qs("PICKGUARD")
		choose_state = UIstate_cag_select_part_inclusion
		choose_state_data = {
			part = (<instrument_info>.pick_guard_part)
			body_part = (<instrument_info>.body_part)
			text = qs("Pickguard")
			cam_name = 'cag_custom_hardware'
			camera_list = ['cag_custom_hardware' 'cag_custom_hardware_R' 'cag_custom_hardware_B' 'cag_custom_hardware_L']
			is_popup
			hist_tex = icon_cag_pickguard
			no_edit
		}
		ui_event_script = ui_event_if_camera_finished
	}
	if (1)
		add_generic_menu_icon_item {
			icon = icon_pickguard_finishes
			text = qs("PICKGUARD FINISH")
			choose_state = UIstate_cag_select_part_inclusion
			choose_state_data = {part = (<instrument_info>.pickgaurd_finish_part) body_part = (<instrument_info>.body_part) text = qs("Pickguard Finish") cam_name = 'DrumStart' is_popup hist_tex = icon_pickguard_finishes color_wheel = ($guitar_colorwheel)
				camera_list = ['cag_custom_hardware' 'cag_custom_hardware_R' 'cag_custom_hardware_B' 'cag_custom_hardware_L']
			}
			ui_event_script = ui_event_if_camera_finished
		}
		RemoveParameter \{section_index}
	endif
	add_generic_menu_icon_item {
		icon = icon_cag_pickups
		text = qs("PICKUPS")
		choose_state = UIstate_cag_select_part_inclusion
		choose_state_data = {
			part = (<instrument_info>.pickups_part)
			body_part = (<instrument_info>.body_part)
			text = qs("Pickups")
			cam_name = 'cag_custom_hardware'
			camera_list = ['cag_custom_hardware' 'cag_custom_hardware_R' 'cag_custom_hardware_B' 'cag_custom_hardware_L']
			is_popup
			hist_tex = icon_cag_pickups
			color_wheel = ($guitar_colorwheel)
		}
		ui_event_script = ui_event_if_camera_finished
	}
	add_generic_menu_icon_item {
		icon = icon_cag_knobs
		text = qs("KNOBS")
		choose_state = UIstate_cag_select_part_inclusion
		choose_state_data = {
			part = (<instrument_info>.knobs_part)
			body_part = (<instrument_info>.body_part)
			text = qs("Knobs")
			cam_name = 'cag_custom_hardware'
			camera_list = ['cag_custom_hardware' 'cag_custom_hardware_R' 'cag_custom_hardware_B' 'cag_custom_hardware_L']
			is_popup
			hist_tex = icon_cag_knobs
			color_wheel = ($guitar_colorwheel)
		}
		ui_event_script = ui_event_if_camera_finished
	}
	add_generic_menu_icon_item {
		icon = icon_cag_bridges
		text = qs("BRIDGES")
		choose_state = UIstate_cag_select_part_inclusion
		choose_state_data = {
			part = (<instrument_info>.bridge_part)
			body_part = (<instrument_info>.body_part)
			text = qs("Bridges")
			cam_name = 'cag_custom_hardware'
			camera_list = ['cag_custom_hardware' 'cag_custom_hardware_R' 'cag_custom_hardware_B' 'cag_custom_hardware_L']
			is_popup
			hist_tex = icon_cag_bridges
			color_wheel = ($guitar_colorwheel)
		}
		ui_event_script = ui_event_if_camera_finished
	}
	menu_finish \{car_helper_text
		no_zoom_text}
	LaunchEvent type = focus target = create_cag_custom_hardware_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom_hardware 
	destroy_generic_menu
endscript

script ui_return_cag_custom_hardware 
	spawnscriptnow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript
