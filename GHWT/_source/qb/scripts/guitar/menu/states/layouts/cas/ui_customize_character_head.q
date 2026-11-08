
script ui_create_customize_character_head 
	make_generic_menu \{vmenu_id = customize_head_vmenu
		back_state = UIstate_cas
		title = qs("Change Head")
		num_icons = 1
		show_history}
	setup_cas_menu_handlers \{vmenu_id = customize_head_vmenu
		no_rotate
		no_zoom}
	add_generic_menu_icon_item \{icon = icon_face
		text = qs("FACE")
		choose_state = UIstate_character_face_deformation}
	if NOT (is_female_char)
		add_generic_menu_icon_item \{icon = icon_facial_hair
			text = qs("FACIAL HAIR")
			choose_state = UIstate_popout_select_part
			choose_state_data = {
				text = qs("Select Facial Hair Style")
				part = CAS_Male_Facial_Hair
				num_icons = 2
				is_popup
				hist_tex = icon_facial_hair
				return_stance = Stance_Select_Head
				disable_rotation_zoom = 1
			}}
	endif
	if (is_female_char)
		add_generic_menu_icon_item \{icon = icon_makeup
			text = qs("EYE MAKEUP")
			choose_state = UIstate_popout_select_part
			choose_state_data = {
				text = $wii_select_eye_makeup
				part = CAS_Eye_Makeup
				num_icons = 2
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				hist_tex = icon_makeup
				return_stance = Stance_Select_Head
				disable_rotation_zoom = 1
			}}
		add_generic_menu_icon_item \{icon = icon_lips
			text = qs("LIP MAKEUP")
			choose_state = UIstate_popout_select_part
			choose_state_data = {
				text = $wii_select_lip_makeup
				part = CAS_Lip_Makeup
				num_icons = 2
				is_popup
				additional_deinit_script = unhide_car_parts_for_face_paint
				additional_init_script = hide_car_parts_for_face_paint
				hist_tex = icon_lips
				return_stance = Stance_Select_Head
				disable_rotation_zoom = 1
			}}
	endif
	GetCurrentCASObject
	if GotParam \{cas_object}
		BandManager_ChangeStance name = <cas_object> stance = Stance_Select_Head no_wait
	endif
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
endscript

script ui_return_customize_character_head 
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
endscript

script ui_destroy_customize_character_head 
	destroy_generic_menu
endscript

script ui_init_customize_character_head 
	ui_load_cas_rawpak \{part = CAS_Body}
endscript

script hide_car_parts_for_face_paint 
	PushTemporaryCASAppearance
	SetCASAppearancePartInstance \{part = CAS_Hair
		part_instance = {
			desc_id = none
		}}
	SetCASAppearancePartInstance \{part = CAS_Hat_Hair
		part_instance = {
			desc_id = none
		}}
	SetCASAppearancePartInstance \{part = CAS_Hat
		part_instance = {
			desc_id = none
		}}
	SetCASAppearancePartInstance \{part = CAS_Acc_Face
		part_instance = {
			desc_id = none
		}}
	RebuildCurrentCASModel
endscript

script unhide_car_parts_for_face_paint 
	MergePartIntoTemporaryCASAppearance \{part_list = [
			CAS_Body
			CAS_Eye_Makeup
			CAS_Lip_Makeup
		]}
endscript
