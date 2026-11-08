
script ui_create_customize_character_mic_main 
	make_generic_menu \{vmenu_id = create_customize_character_mic_vmenu
		title = qs("CHOOSE MIC")
		show_history
		hist_tex = icon_customize}
	SpawnScript \{generic_menu_animate_in}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_mic_vmenu
		no_zoom
		no_rotate}
	add_generic_menu_icon_item \{icon = icon_mic
		text = qs("MIC")
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs("MIC")
			part = CAS_Mic
			hist_tex = icon_mic
			is_popup
			cam_name = 'customize_microphone'
			disable_rotation_zoom = 1
			stance = Stance_Select_Microphone
			return_stance = Stance_Select_Mic
		}}
	add_generic_menu_icon_item \{icon = icon_mic_stand
		text = qs("MIC STAND")
		choose_state = UIstate_popout_select_part
		choose_state_data = {
			text = qs("MIC STAND")
			part = CAS_Mic_Stand
			hist_tex = icon_mic_stand
			is_popup
			cam_name = 'customize_character_mic'
			disable_rotation_zoom = 1
			stance = Stance_Select_Mic
			return_stance = Stance_Select_Mic
		}}
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
	GetCurrentCASObject
	printf \{qs("\L---------------------------------Mic-------------------------------------------")}
	BandManager_ChangeStance name = <cas_object> stance = Stance_Select_Mic no_wait
	LaunchEvent type = focus target = create_customize_character_mic_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_customize_character_mic_main 
	destroy_generic_menu
endscript

script ui_return_customize_character_mic_main 
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
endscript
