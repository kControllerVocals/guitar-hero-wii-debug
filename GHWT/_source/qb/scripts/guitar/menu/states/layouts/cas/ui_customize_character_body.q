
script ui_create_customize_character_body 
	make_generic_menu \{vmenu_id = customize_body_vmenu
		back_state = UIstate_customize_character_appearance
		title = qs("Body")
		num_icons = 1
		show_history}
	setup_cas_menu_handlers \{vmenu_id = customize_body_vmenu
		camera_list = [
			'customize_character'
			'customize_character_R'
			'customize_character_B'
			'customize_character_L'
		]
		no_zoom}
	add_generic_menu_icon_item {
		text = qs("SKIN TONE")
		choose_state = UIstate_cas_color_edit
		choose_state_data = {
			text = qs("SKIN TONE")
			part = CAS_Body
			camera_list = ['customize_character_outfit' 'customize_character_R' 'customize_character_B' 'customize_character_L']
			part_materials = [skin]
			num_states = 1
			num_icons = 1
			hist_tex = SkinTone
			color_wheel = ($skin_colorwheel)
			only_rotate
			restore_skin
		}
		icon = SkinTone
	}
	add_generic_menu_icon_item \{icon = icon_size
		text = qs("PROPORTIONS")
		choose_state = UIstate_customize_character_proportions}
	add_generic_menu_icon_item \{icon = icon_graphics
		text = qs("TATTOOS")
		choose_state = UIstate_customize_character_sub_sections
		choose_state_data = {
			text = qs("Tattoos")
			cam_name = 'customize_character'
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
	add_generic_menu_icon_item \{icon = icon_presence
		text = qs("PRESENCE")
		choose_state = UIstate_customize_character_stage_presence}
	menu_finish \{car_helper_text
		no_zoom_text}
endscript

script ui_destroy_customize_character_body 
	destroy_generic_menu
endscript
