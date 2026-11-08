
script ui_create_cadrm_main 
	spawnscriptnow ui_create_cadrm_main_spawned params = {<...>}
endscript

script ui_create_cadrm_main_spawned 
	cas_queue_wait
	if NOT GotParam \{old_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_drum_save
		old_save_checksum = <array_checksum>
		ui_event_add_params old_save_checksum = <old_save_checksum>
	endif
	make_generic_menu \{vmenu_id = create_cadrm_main_vmenu
		title = qs("DRUMS")
		num_icons = 2
		show_history}
	spawnscriptnow \{generic_menu_animate_in}
	setup_cas_menu_handlers \{vmenu_id = create_cadrm_main_vmenu
		no_zoom}
	add_generic_menu_icon_item {
		icon = icon_customize
		text = qs("CUSTOMIZE")
		choose_state = UIstate_cadrm_hub
		choose_state_data = {instrument_info = <instrument_info>}
	}
	add_generic_menu_icon_item {
		icon = icon_save
		text = qs("SAVE")
		choose_state = UIstate_cas_save_slots
		choose_state_data = {savegame = ($cas_current_savegame) text = $wii_save_drum_kit slot_list = player_drum_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
	}
	add_generic_menu_icon_item {
		icon = icon_load
		text = qs("LOAD")
		choose_state = UIstate_cas_save_slots
		choose_state_data = {savegame = ($cas_current_savegame) text = qs("LOAD DRUM KIT") slot_list = player_drum_save instrument_info = <instrument_info> load_drum hist_tex = icon_load}
	}
	add_generic_menu_icon_item \{icon = icon_random
		text = qs("RANDOM")
		pad_choose_script = generate_random_instrument
		pad_choose_params = {
			type = drum
			rebuild
		}}
	CreateScreenElement \{parent = create_cadrm_main_vmenu
		type = DescInterface
		AxeSmith_Menu_Item_img_texture = micdrum_sponsor
		desc = 'Axesmith_menu_item'
		not_focusable
		autoSizeDims = true}
	printf \{qs("\L---------------------------------Drum--------------------------------------------")}
	GetCurrentCASObject
	BandManager_ChangeStance name = <cas_object> stance = Stance_Select_Drum no_wait
	if is_female_char
		<cas_object> :Anim_Command target = FemaleDiff command = ApplyFemaleDrummerDifference_SetAnim params = {Anim = GH_Rocker_Female_Drummer_D}
	endif
	LaunchEvent \{type = focus
		target = create_cadrm_main_vmenu}
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
endscript

script ui_destroy_cadrm_main 
	if is_female_char
		if GetCurrentCASObject
			<cas_object> :Anim_Command target = FemaleDiff command = ApplyFemaleDrummerDifference_Disable
		endif
	endif
	destroy_generic_menu
endscript

script ui_init_cadrm_main 
	change_cas_instrument_if_necessary instrument = (<instrument_info>.instrument_name)
endscript

script ui_deinit_cadrm_main 
	change_cas_instrument_if_necessary \{instrument = none}
endscript

script cadrm_exit_save 
	globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_drum_save
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
