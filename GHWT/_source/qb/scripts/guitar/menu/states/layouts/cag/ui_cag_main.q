
script ui_create_cag_main 
	GetCASAppearance
	if StructureContains Structure = <appearance> CAS_Full_Instrument
		make_generic_menu \{vmenu_id = create_cag_main_vmenu
			pad_back_script = generic_event_back
			title = qs("Premade Instrument Demo")
			num_icons = 2
			show_history}
		setup_cas_menu_handlers \{vmenu_id = create_cag_main_vmenu}
		add_generic_menu_icon_item \{icon = icon_load
			text = qs("Temp Full Instrument")
			choose_state = UIstate_popout_select_part
			choose_state_data = {
				part = CAS_Full_Instrument
				is_popup
				hist_tex = icon_load
			}}
	elseif ((<instrument_info>.desc_id) = guitar)
		if NOT GotParam \{old_guitar_save_checksum}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_guitar_save
			old_guitar_save_checksum = <array_checksum>
			ui_event_add_params old_guitar_save_checksum = <old_guitar_save_checksum>
		endif
		make_generic_menu \{vmenu_id = create_cag_main_vmenu
			title = qs("AXE SMITH")
			num_icons = 2
			show_history}
		setup_cas_menu_handlers \{vmenu_id = create_cag_main_vmenu
			camera_list = [
				'cag_main'
				'cag_main_R'
				'cag_main_B'
				'cag_main_L'
			]
			no_zoom}
		add_generic_menu_icon_item {
			icon = icon_customize
			text = qs("CUSTOMIZE")
			choose_state = UIstate_cag_custom
			choose_state_data = {instrument_info = <instrument_info>}
		}
		add_generic_menu_icon_item {
			icon = icon_save
			text = qs("SAVE")
			choose_state = UIstate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs("SAVE") slot_list = player_guitar_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
		}
		add_generic_menu_icon_item {
			icon = icon_load
			text = qs("LOAD")
			choose_state = UIstate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs("LOAD") slot_list = player_guitar_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}
		}
	endif
	if ((<instrument_info>.desc_id) = Bass)
		if NOT GotParam \{old_bass_save_checksum}
			globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_bass_save
			old_bass_save_checksum = <array_checksum>
			ui_event_add_params old_bass_save_checksum = <old_bass_save_checksum>
		endif
		make_generic_menu \{vmenu_id = create_cag_main_vmenu
			title = qs("AXE SMITH")
			num_icons = 2
			show_history}
		setup_cas_menu_handlers \{vmenu_id = create_cag_main_vmenu
			camera_list = [
				'cag_main'
				'cag_main_R'
				'cag_main_B'
				'cag_main_L'
			]
			no_zoom}
		add_generic_menu_icon_item {
			icon = icon_customize
			text = qs("CUSTOMIZE")
			choose_state = UIstate_cag_custom
			choose_state_data = {instrument_info = <instrument_info>}
		}
		add_generic_menu_icon_item {
			icon = icon_save
			text = qs("SAVE")
			choose_state = UIstate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs("SAVE") slot_list = player_bass_save instrument_info = <instrument_info> save_guitar loaded_index = <loaded_index> hist_tex = icon_save}
		}
		add_generic_menu_icon_item {
			icon = icon_load
			text = qs("LOAD")
			choose_state = UIstate_cas_save_slots
			choose_state_data = {savegame = ($cas_current_savegame) text = qs("LOAD") slot_list = player_bass_save instrument_info = <instrument_info> load_guitar hist_tex = icon_load}
		}
	endif
	add_generic_menu_icon_item {
		icon = icon_random
		text = qs("RANDOM")
		pad_choose_script = generate_random_instrument
		pad_choose_params = {type = (<instrument_info>.desc_id) rebuild}
	}
	CreateScreenElement \{parent = create_cag_main_vmenu
		type = DescInterface
		desc = 'Axesmith_menu_item'
		not_focusable
		autoSizeDims = true}
	GetCurrentCASObject
	printf \{qs("\L---------------------------------Guitar-------------------------------------------")}
	BandManager_ChangeStance name = <cas_object> stance = Stance_Select_Guitar no_wait
	menu_finish \{car_helper_text
		no_zoom_text}
	SpawnScriptLater \{generic_menu_animate_in}
endscript

script ui_destroy_cag_main 
	destroy_generic_menu
endscript

script ui_init_cag_main 
	ui_event_add_params hist_tex = <hist_tex>
	change_cas_instrument_if_necessary instrument = (<instrument_info>.instrument_name)
endscript

script ui_deinit_cag_main 
	change_cas_instrument_if_necessary \{instrument = none}
endscript

script cag_exit_save 
	if GotParam \{old_guitar_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_guitar_save
		if NOT (<old_guitar_save_checksum> = <array_checksum>)
			if CheckForSignIn
				cag_update_photo
				ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = ($cas_current_savegame)}
			else
				generic_event_back
			endif
		else
			generic_event_back
		endif
	elseif GotParam \{old_bass_save_checksum}
		globaltag_getarraychecksum savegame = ($cas_current_savegame) array_name = player_bass_save
		if NOT (<old_bass_save_checksum> = <array_checksum>)
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
	endif
endscript

script cag_update_photo 
	destroy_generic_menu
	if ($cas_current_savegame >= 0)
		if is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
			cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame)
		endif
	endif
endscript
