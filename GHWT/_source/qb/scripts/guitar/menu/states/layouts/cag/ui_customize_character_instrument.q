
script ui_create_customize_character_instrument 
	spawnscriptnow ui_create_customize_character_instrument_worker params = {<...>}
endscript

script ui_create_customize_character_instrument_worker 
	change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	CASBlockForLoading
	CASWaitForComposite
	cas_queue_wait
	make_generic_menu \{vmenu_id = create_customize_character_instrument_vmenu
		title = qs("EDIT INSTRUMENTS")
		num_icons = 1
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_instrument_vmenu
		no_rotate = 1
		no_zoom}
	change \{cas_current_instrument = none}
	cas_set_object_node_pos player = ($cas_current_player) node = $CAS_node_name
	i = 0
	begin
	add_generic_menu_icon_item {
		icon = ((($cag_instruments) [<i>]).icon)
		text = ((($cag_instruments) [<i>]).text)
		choose_state = UIstate_cag_main
		choose_state_data = {instrument_info = (($cag_instruments) [<i>]) hist_tex = ((($cag_instruments) [<i>]).icon)}
	}
	i = (<i> + 1)
	repeat 2
	add_generic_menu_icon_item {
		icon = icon_cadrm_drum
		text = qs("DRUMS")
		choose_state = UIstate_cadrm_main
		choose_state_data = {instrument_info = (($cag_instruments) [2])}
	}
	add_generic_menu_icon_item {
		icon = icon_mic_2
		text = qs("MIC")
		choose_state = UIstate_customize_character_mic
		choose_state_data = {instrument_info = (($cag_instruments) [3])}
	}
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
	printf \{qs("\L----------------------------Instrument----------------------------------")}
	if GetCurrentCASObject
		BandManager_ChangeStance name = <cas_object> stance = stance_frontend no_wait
	endif
	LaunchEvent type = focus target = create_customize_character_instrument_vmenu data = {child_index = <selected_index>}
	SpawnScript \{generic_menu_animate_in}
endscript

script ui_destroy_customize_character_instrument 
	destroy_generic_menu
endscript

script ui_init_customize_character_instrument 
endscript

script ui_deinit_customize_character_instrument 
endscript

script change_cas_instrument_if_necessary 
	if NOT ($cas_current_instrument = <instrument>)
		cas_set_object_node_pos player = ($cas_current_player) instrument = <instrument>
		if GetCurrentCASObject
			<cas_object> :hide
		endif
		if NOT (<instrument> = none)
		endif
		change cas_current_instrument = <instrument>
		RebuildCurrentCASModel instrument = <instrument>
	endif
endscript
