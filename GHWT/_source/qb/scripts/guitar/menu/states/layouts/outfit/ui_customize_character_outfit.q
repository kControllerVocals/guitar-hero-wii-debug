
script ui_create_customize_character_outfit 
	start_CAS_rebuild_loop
	make_generic_menu \{vmenu_id = create_customize_character_outfit_vmenu
		title = qs("Outfit")
		num_icons = 1
		show_history}
	cas_set_object_node_pos player = ($cas_current_player) node = $CAS_node_name
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_outfit_vmenu
		camera_list = [
			'customize_character_outfit'
			'customize_character_R'
			'customize_character_B'
			'customize_character_L'
		]
		no_zoom}
	add_generic_menu_icon_item {
		icon = Outfit_Torso
		text = qs("TORSO")
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs("SELECT TOP")
			cam_name = 'customize_torso'
			camera_list = ['customize_torso' 'customize_torso_R' 'customize_torso_B' 'customize_torso_L']
			part = CAS_Torso
			purchase_menu
			num_icons = 2
			hist_tex = Outfit_Torso
			is_popup
			icon_offset = (0.0, 20.0)
			list_offset = (0.0, 55.0)
			color_wheel = ($clothing_colorwheel)
			stance = Stance_Select_Torso
			only_rotate
		}
	}
	add_generic_menu_icon_item {
		icon = pants
		text = qs("PANTS")
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs("SELECT PANTS")
			cam_name = 'customize_pants'
			camera_list = ['customize_pants' 'customize_pants_R' 'customize_pants_B' 'customize_pants_L']
			part = CAS_Legs
			purchase_menu
			num_icons = 2
			hist_tex = pants
			is_popup
			color_wheel = ($clothing_colorwheel)
			stance = Stance_Select_Pants
			only_rotate
		}
	}
	if is_female_char
		add_generic_menu_icon_item {
			icon = shoes
			text = qs("SHOES")
			choose_state = UIstate_popout_select_part
			choose_state_data = {
				text = qs("SELECT SHOES")
				cam_name = 'customize_female_shoes'
				part = CAS_Shoes
				purchase_menu
				num_icons = 2
				hist_tex = shoes
				is_popup
				color_wheel = ($clothing_colorwheel)
				stance = Stance_Select_Shoes
				disable_rotation_zoom = 1
			}
		}
	else
		add_generic_menu_icon_item {
			icon = shoes
			text = qs("SHOES")
			choose_state = UIstate_popout_select_part
			choose_state_data = {
				text = qs("SELECT SHOES")
				cam_name = 'customize_shoes'
				part = CAS_Shoes
				purchase_menu
				num_icons = 2
				hist_tex = shoes
				is_popup
				color_wheel = ($clothing_colorwheel)
				stance = Stance_Select_Shoes
				disable_rotation_zoom = 1
			}
		}
	endif
	add_generic_menu_icon_item \{icon = Accessories
		text = qs("ACCESSORIES")
		choose_state = UIstate_customize_character_outfit_accessories}
	menu_finish \{car_helper_text
		no_zoom_text}
	GetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue param = visit_outfit
	if (<visit_outfit> = 0)
		SetGlobalTags savegame = ($cas_current_savegame) cas_helper_dialogue params = {visit_outfit = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = UIstate_helper_dialogue
				is_popup
				life = 30
				text = qs("The OUTFIT option allows you to change your apparel and purchase more items as they become available.  Some items can be colorized after being selected.")
			}}
	endif
endscript

script ui_return_customize_character_outfit 
	clean_up_user_control_helpers
	menu_finish \{car_helper_text
		no_zoom_text}
endscript

script ui_destroy_customize_character_outfit 
	destroy_generic_menu
	stop_CAS_rebuild_loop
endscript
