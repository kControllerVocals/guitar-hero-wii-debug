
script ui_create_customize_character_body_art 
	make_generic_menu \{vmenu_id = create_customize_character_body_art_vmenu
		title = qs("Tattoos")
		num_icons = 2
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_body_art_vmenu
		camera_list = [
			'customize_tat_torso'
			'customize_tat_torso_R'
			'customize_tat_torso_B'
			'customize_tat_torso_L'
		]
		zoom_camera = 'customize_character_Zoom'}
	add_generic_menu_icon_item \{icon = BodyArt_Chest
		text = qs("Torso")
		choose_state = UIstate_customize_character_sub_sections
		choose_state_data = {
			text = qs("Torso Tattoo")
			cam_name = 'customize_tat_torso'
			part = CAS_Torso_Art
			stance = Stance_Select_Tat_Chest
			choose_script = ui_event
			choose_params = {
				event = menu_back
			}
			num_icons = 2
			additional_init_script = hide_torso_parts_for_body_art
			additional_deinit_script = unhide_torso_parts_for_body_art
		}}
	add_generic_menu_icon_item \{icon = BodyArt_RightArm
		text = qs("Right Arm")
		choose_state = UIstate_customize_character_sub_sections
		choose_state_data = {
			text = qs("Right Arm")
			cam_name = 'customize_tat_right_arm'
			part = CAS_Right_Arm_Art
			stance = Stance_Select_Tat_Arm_R
			choose_script = ui_event
			choose_params = {
				event = menu_back
			}
			num_icons = 2
			additional_init_script = hide_torso_parts_for_body_art
			additional_deinit_script = unhide_torso_parts_for_body_art
		}}
	add_generic_menu_icon_item \{icon = BodyArt_LeftArm
		text = qs("Left Arm")
		choose_state = UIstate_customize_character_sub_sections
		choose_state_data = {
			text = qs("Left Arm")
			cam_name = 'customize_tat_left_arm'
			part = CAS_Left_Arm_Art
			stance = Stance_Select_Tat_Arm_L
			choose_script = ui_event
			choose_params = {
				event = menu_back
			}
			num_icons = 2
			additional_init_script = hide_torso_parts_for_body_art
			additional_deinit_script = unhide_torso_parts_for_body_art
		}}
	menu_finish \{car_helper_text}
	LaunchEvent type = focus target = create_customize_character_body_art_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_customize_character_body_art 
	destroy_generic_menu
endscript

script hide_torso_parts_for_body_art 
	PushTemporaryCASAppearance
	SetCASAppearancePartInstance \{part = CAS_Acc_Left
		part_instance = {
			desc_id = none
		}}
	SetCASAppearancePartInstance \{part = CAS_Acc_Right
		part_instance = {
			desc_id = none
		}}
	if is_female_char
		SetCASAppearancePartInstance \{part = CAS_Torso
			part_instance = {
				desc_id = F_Fun_Torso_BikiniTop
			}}
	else
		SetCASAppearancePartInstance \{part = CAS_Torso
			part_instance = {
				desc_id = none
			}}
	endif
	RebuildCurrentCASModel
endscript

script unhide_torso_parts_for_body_art 
	MergePartIntoTemporaryCASAppearance \{part_list = [
			CAS_Body
			CAS_Right_Arm_Art
			CAS_Left_Arm_Art
			CAS_Torso_Art
		]}
endscript
