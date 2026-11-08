
script ui_create_cadrm_hub 
	part = (<instrument_info>.body_part)
	make_generic_menu \{vmenu_id = create_cadrm_hub_vmenu
		title = $wii_customize_drums
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_cadrm_hub_vmenu
		no_zoom}
	add_generic_menu_icon_item {
		icon = icon_cadrm_size
		text = qs("SIZE")
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			part = <part>
			text = qs("CHOOSE DRUM SET SIZE")
			cam_name = 'cad_select_size'
			choose_script = nullscript
			hist_tex = icon_cadrm_size is_popup
			color_wheel = ($guitar_colorwheel)
			return_stance = Stance_Select_Drum
			purchase_menu
			disable_rotation_zoom = 1
		}
	}
	add_generic_menu_icon_item \{icon = icon_cadrm_shell
		text = qs("SHELL")
		choose_state = UIstate_customize_character_sub_sections
		choose_state_data = {
			text = qs("SHELL")
			cam_name = 'cad_select_shell'
			part = CAS_Drum_Finish
			choose_script = ui_event
			choose_params = {
				event = menu_back
			}
			num_icons = 2
			return_stance = Stance_Select_Drum
		}}
	add_generic_menu_icon_item \{icon = icon_cadrm_skin
		text = qs("SKIN")
		choose_state = UIstate_customize_character_sub_sections
		choose_state_data = {
			text = qs("SKIN")
			cam_name = 'cad_select_skin'
			part = CAS_Drum_Detail
			choose_script = ui_event
			choose_params = {
				event = menu_back
			}
			num_icons = 2
			return_stance = Stance_Select_Drum
		}}
	if is_part_capable part = <part>
		add_generic_menu_icon_item {
			icon = icon_graphics
			text = qs("GRAPHICS")
			choose_state = UIstate_cap_main
			choose_state_data = {savegame = ($cas_current_savegame) part = <part> text = qs("GRAPHICS") cam_name = 'cadrm_skin' hist_tex = icon_graphics color_wheel = ($guitar_colorwheel) return_stance = Stance_Select_Drum}
		}
	endif
	add_generic_menu_icon_item {
		icon = icon_highway
		text = qs("HIGHWAY")
		choose_state = UIstate_cag_custom_highway
		choose_state_data = {instrument_info = <instrument_info>}
	}
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_cadrm
	if (<visit_cadrm> = 0)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_cadrm = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = UIstate_helper_dialogue
				is_popup
				life = 30
				text = qs("The CUSTOMIZE option allows you to build a custom drum kit. Changing the SIZE of the drum kit will undo any SHELL and SKIN changes that you make.")
			}}
	endif
	GetCurrentCASObject
	if is_female_char
		<cas_object> :Anim_Command target = FemaleDiff command = ApplyFemaleDrummerDifference_SetAnim params = {Anim = GH_Rocker_Female_Drummer_D}
	endif
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
endscript

script ui_return_cadrm_hub 
	clean_up_user_control_helpers
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
endscript

script ui_destroy_cadrm_hub 
	destroy_generic_menu
endscript
