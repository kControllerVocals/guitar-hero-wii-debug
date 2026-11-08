
script ui_create_cag_custom 
	make_generic_menu \{vmenu_id = create_cag_custom_vmenu
		title = qs("AXE SMITH")
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_cag_custom_vmenu
		camera_list = [
			'cag_main'
			'cag_main_R'
			'cag_main_B'
			'cag_main_L'
		]
		no_zoom}
	add_generic_menu_icon_item {
		icon = icon_cag_body
		text = qs("BODY")
		choose_state = UIstate_cag_custom_body
		choose_state_data = {instrument_info = <instrument_info>}
	}
	add_generic_menu_icon_item {
		icon = icon_cag_neck
		text = qs("FRET BOARD")
		choose_state = UIstate_cag_select_part_inclusion
		choose_state_data = {
			part = (<instrument_info>.neck_part)
			body_part = (<instrument_info>.body_part)
			text = qs("NECK")
			cam_name = 'DrumStart'
			is_popup
			hist_tex = icon_cag_neck
			cam_name = 'cag_select_fretboard'
			no_edit
			camera_list = ['cag_select_fretboard' 'cag_select_fretboard_R' 'cag_select_fretboard_B' 'cag_select_fretboard_L']
			zoom_camera = 'customize_cag_Zoom'
		}
	}
	if GetCASAppearancePart part = (<instrument_info>.neck_part)
		GetActualCASOptionStruct part = (<instrument_info>.neck_part) desc_id = <desc_id>
		if GotParam \{Finishable}
			add_generic_menu_icon_item {
				icon = icon_cag_inlay
				text = qs("INLAYS")
				choose_state = UIstate_cag_select_part_inclusion
				choose_state_data = {part = (<Finishable>) body_part = (<instrument_info>.neck_part) text = qs("INLAYS") cam_name = 'cag_select_fretboard' cam_anim = GuitarBody container_id = <container_id> is_popup hist_tex = icon_cag_inlay color_wheel = ($guitar_colorwheel)
					camera_list = ['cag_select_fretboard' 'cag_select_fretboard_R' 'cag_select_fretboard_B' 'cag_select_fretboard_L']
					zoom_camera = 'customize_cag_Zoom'
				}
			}
		endif
	endif
	add_generic_menu_icon_item {
		icon = icon_cag_head
		text = qs("HEADSTOCK")
		choose_state = UIstate_cag_custom_head
		choose_state_data = {part = (<instrument_info>.head_part) body_part = (<instrument_info>.body_part)}
	}
	add_generic_menu_icon_item {
		icon = icon_cag_hardware
		text = qs("HARDWARE")
		choose_state = UIstate_cag_custom_hardware
		choose_state_data = {instrument_info = <instrument_info>}
	}
	add_generic_menu_icon_item {
		icon = icon_highway
		text = qs("HIGHWAY")
		choose_state = UIstate_cag_custom_highway
		choose_state_data = {instrument_info = <instrument_info>}
	}
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_cag
	if (<visit_cag> = 0)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_cag = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = UIstate_helper_dialogue
				is_popup
				life = 30
				text = qs("The CUSTOMIZE option allows you to build a custom axe.  Changing BODY STYLE, FRET BOARD, HEADSTOCK STYLE and PICKGUARD STYLE will undo any changes to the FINISHES that you make.")
			}}
	endif
	menu_finish \{car_helper_text
		no_zoom_text}
	LaunchEvent type = focus target = create_cag_custom_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_cag_custom 
	destroy_generic_menu
endscript

script ui_return_cag_custom 
	spawnscriptnow \{ui_event_block
		params = {
			event = menu_refresh
		}}
endscript
