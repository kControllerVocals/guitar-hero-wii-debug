
script ui_create_customize_character_mic 
	if NOT GotParam \{old_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_mic_save
		old_save_checksum = <array_checksum>
		ui_event_add_params old_save_checksum = <old_save_checksum>
	endif
	make_generic_menu \{vmenu_id = create_customize_character_mic_vmenu
		title = qs("MIC")
		num_icons = 2
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_mic_vmenu
		no_zoom
		no_rotate}
	add_generic_menu_icon_item {
		icon = icon_customize
		text = qs("CUSTOMIZE")
		choose_state = UIstate_customize_character_mic_main
		choose_state_data = {instrument_info = <instrument_info>}
	}
	add_generic_menu_icon_item {
		icon = icon_save
		text = qs("SAVE")
		choose_state = UIstate_cas_save_slots
		choose_state_data = {savegame = ($cas_current_savegame) text = qs("SAVE") slot_list = player_mic_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
	}
	add_generic_menu_icon_item {
		icon = icon_load
		text = qs("LOAD")
		choose_state = UIstate_cas_save_slots
		choose_state_data = {savegame = ($cas_current_savegame) text = qs("LOAD MIC") slot_list = player_mic_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}
	}
	add_generic_menu_icon_item \{icon = icon_random
		text = qs("RANDOM")
		pad_choose_script = generate_random_instrument
		pad_choose_params = {
			type = Vocals
			rebuild
		}}
	CreateScreenElement \{parent = create_customize_character_mic_vmenu
		type = DescInterface
		AxeSmith_Menu_Item_img_texture = micdrum_sponsor
		desc = 'Axesmith_menu_item'
		not_focusable
		autoSizeDims = true}
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
	printf \{qs("\L---------------------------------Mic-------------------------------------------")}
	if GetCurrentCASObject
		BandManager_ChangeStance name = <cas_object> stance = Stance_Select_Mic no_wait
	endif
	LaunchEvent type = focus target = create_customize_character_mic_vmenu data = {child_index = <selected_index>}
endscript

script ui_return_customize_character_mic 
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
endscript

script ui_destroy_customize_character_mic 
	destroy_generic_menu
endscript

script ui_init_customize_character_mic 
	change_cas_instrument_if_necessary \{instrument = Vocals}
endscript

script ui_deinit_customize_character_mic 
	change_cas_instrument_if_necessary \{instrument = none}
endscript

script customize_character_mic_exit_save 
	globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_mic_save
	if NOT (<old_save_checksum> = <array_checksum>)
		cas_get_player_status
		if CheckForSignIn local controller_index = ($<player_status>.controller)
			cag_update_photo
			ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
		else
			generic_event_back
		endif
	else
		generic_event_back
	endif
endscript
