
script ui_create_customize_character_outfit_accessories 
	start_CAS_rebuild_loop
	make_generic_menu \{back_state = UIstate_cas
		vmenu_id = create_customize_character_outfit_accessories_vmenu
		title = qs("Accessories")
		num_icons = 2
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_outfit_accessories_vmenu
		no_rotate
		no_zoom}
	add_generic_menu_icon_item {
		icon = icon_face_acc
		text = qs("FACE")
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs("CHOOSE FACE ACCESSORY")
			cam_name = 'customize_face'
			part = CAS_Acc_Face
			stance = Stance_Select_Head
			is_popup
			hist_tex = icon_face_acc
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = Stance_Select_Glasses
			disable_rotation_zoom = 1
		}
	}
	add_generic_menu_icon_item {
		icon = AccessoriesHat
		text = qs("HAT")
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs("CHOOSE HAT")
			cam_name = 'customize_hat'
			part = CAS_Hat
			hist_tex = AccessoriesHat
			stance = Stance_Select_Head
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = Stance_Select_Hat
			disable_rotation_zoom = 1
		}
	}
	add_generic_menu_icon_item {
		icon = AccessoriesLeftArm
		text = qs("LEFT ARM")
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs("CHOOSE LEFT ARM ACCESSORY")
			cam_name = 'customize_left_arm'
			part = CAS_Acc_Left
			hist_tex = AccessoriesLeftArm
			stance = Stance_Select_Arm_L
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = Stance_Select_Arm_L
			additional_init_script = hide_car_parts_accessories
			additional_deinit_script = unhide_car_parts_accessories
			disable_rotation_zoom = 1
		}
	}
	add_generic_menu_icon_item {
		icon = AccessoriesRightArm
		text = qs("RIGHT ARM")
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs("CHOOSE RIGHT ARM ACCESSORY")
			cam_name = 'customize_right_arm'
			part = CAS_Acc_Right
			hist_tex = AccessoriesRightArm
			stance = Stance_Select_Arm_R
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = Stance_Select_Arm_R
			additional_init_script = hide_car_parts_accessories
			additional_deinit_script = unhide_car_parts_accessories
			disable_rotation_zoom = 1
		}
	}
	add_generic_menu_icon_item {
		icon = icon_face_piercing
		text = qs("PIERCINGS")
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			hist_tex = icon_face_piercing
			cam_name = 'customize_piercings'
			camera_list = ['customize_character_piercings' 'customize_character_piercings_R' 'customize_character_piercings_B' 'customize_character_piercings_L']
			part = CAS_Acc_Ears
			stance = Stance_Select_Head
			is_popup
			color_wheel = ($clothing_colorwheel)
			purchase_menu
			stance = Stance_Select_Head
			additional_init_script = hide_car_parts_piercings
			additional_deinit_script = unhide_car_parts_piercings
			disable_rotation_zoom = 1
		}
	}
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
endscript

script ui_return_customize_character_outfit_accessories 
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
endscript

script ui_destroy_customize_character_outfit_accessories 
	destroy_generic_menu
	stop_CAS_rebuild_loop
endscript

script hide_car_parts_accessories 
	PushTemporaryCASAppearance
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

script unhide_car_parts_accessories 
	MergePartIntoTemporaryCASAppearance \{part_list = [
			CAS_Acc_Left
			CAS_Acc_Right
		]}
endscript

script hide_car_parts_piercings 
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

script unhide_car_parts_piercings 
	MergePartIntoTemporaryCASAppearance \{part_list = [
			CAS_Acc_Ears
		]}
endscript
