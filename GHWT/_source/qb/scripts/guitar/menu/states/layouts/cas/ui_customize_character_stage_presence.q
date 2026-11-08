
script ui_create_customize_character_stage_presence 
	make_generic_menu \{vmenu_id = stage_presence_vmenu
		title = qs("Presence")
		num_icons = 2
		show_history}
	setup_cas_menu_handlers \{vmenu_id = stage_presence_vmenu
		camera_list = [
			'customize_character_stage_presence'
			'customize_character_stage_presence_R'
			'customize_character_stage_presence_B'
			'customize_character_stage_presence_L'
		]
		no_zoom}
	add_generic_menu_icon_item \{icon = Presence_Intro
		text = qs("Intros")
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs("Intros")
			part = CAS_Intro_Anim
			camera_list = [
				'customize_character_stage_presence'
				'customize_character_stage_presence_R'
				'customize_character_stage_presence_B'
				'customize_character_stage_presence_L'
			]
			zoom_camera = 'customize_Presence_Zoom'
			hist_tex = Presence_Intro
			hist_name = qs("\LIntros")
			is_popup
			play_current_anim = true
			noRebuildLoop
			disable_rotation_zoom = 1
		}}
	add_generic_menu_icon_item \{text = qs("Wins")
		icon = Presence_Wins
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs("Wins")
			part = CAS_Win_Anim
			camera_list = [
				'customize_character_stage_presence'
				'customize_character_stage_presence_R'
				'customize_character_stage_presence_B'
				'customize_character_stage_presence_L'
			]
			zoom_camera = 'customize_Presence_Zoom'
			hist_tex = Presence_Wins
			hist_name = qs("\LWins")
			is_popup
			play_current_anim = true
			noRebuildLoop
			disable_rotation_zoom = 1
		}}
	add_generic_menu_icon_item \{text = qs("Losses")
		icon = Presence_Loses
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs("Losses")
			part = CAS_Lose_Anim
			camera_list = [
				'customize_character_stage_presence'
				'customize_character_stage_presence_R'
				'customize_character_stage_presence_B'
				'customize_character_stage_presence_L'
			]
			zoom_camera = 'customize_Presence_Zoom'
			hist_tex = Presence_Loses
			hist_name = qs("\LLosses")
			is_popup
			play_current_anim = true
			noRebuildLoop
			disable_rotation_zoom = 1
		}}
	menu_finish \{car_helper_text
		no_zoom_text}
endscript

script ui_return_customize_character_stage_presence 
	menu_finish \{car_helper_text
		no_zoom_text}
endscript

script ui_destroy_customize_character_stage_presence 
	destroy_generic_menu
endscript
