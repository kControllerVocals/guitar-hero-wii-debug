
script ui_create_band_logo_choose 
	spawnscriptnow ui_create_band_logo_choose_spawned params = {<...>}
endscript

script ui_create_band_logo_choose_spawned 
	if NOT GotParam \{supress_model_load}
		change \{cas_heap_state = in_cas}
		get_current_band_info
		GetGlobalTags <band_info>
		if GotParam \{band_logo}
			GetArraySize <band_logo>
			if ((<array_size>) <= 0)
				randomize_band_logo
			endif
		endif
		cas_update_band_logo
		generate_random_appearance \{is_female = 1
			genre = mixed
			new_car_character}
		EditCASAppearance \{target = SetPart
			targetParams = {
				part = CAS_Torso
				desc_id = F_Torso_Band_Logo_Tee
			}}
		change \{cas_current_instrument = none}
		cas_queue_add_request appearance = ($cas_current_appearance) instrument = none player = ($cas_current_player)
		cas_queue_wait
		GetCurrentCASObject
		BandManager_ChangeStance name = <cas_object> stance = Stance_Select_Torso no_wait
	endif
	GetCurrentCASObject
	<cas_object> :Obj_SetPosition position = (0.0, 0.0, 0.0)
	<cas_object> :Obj_SetOrientation Quat = (0.0, -0.13, 0.0)
	<cas_object> :obj_setvisibility viewport = bg_viewport exclusive
	PlayIGCCam \{name = character_head_camera
		viewport = bg_viewport
		pos = (-0.15, 1.4499999, 1.0)
		Play_hold = 1
		interrupt_current}
	change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	pad_back_script = nullscript
	menu_create_script = make_generic_menu
	item_add_script = add_generic_menu_text_item
	if ui_event_exists_in_stack \{name = 'mainmenu'}
		pad_back_script = generic_event_back
	endif
	cam_name = 'options_manage_band_logo'
	if GotParam \{from_band_info}
		<menu_create_script> {
			title = qs(0x9ff0059d)
			item_scale = 1.3
			pad_back_script = <pad_back_script>
		}
		get_savegame_from_controller controller = <device_num>
		FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
		GetGlobalTags <bandname_id> param = name savegame = <savegame>
		CreateScreenElement {
			type = TextBlockElement
			parent = generic_menu
			text = <name>
			pos = (340.0, 180.0)
			font = fontgrid_text_a6_fire
			dims = (260.0, 35.0)
			just = [center , top]
			rgba = (($default_color_scheme).text_color)
			fit_height = `scale down if larger`
			fit_width = `scale each line if larger`
		}
		<item_add_script> {
			text = qs(0x7716d78c)
			choose_state = uistate_band_name_enter
			choose_state_data = {from_band_logo = 1}
		}
	else
		<menu_create_script> {
			title = qs("CHOOSE BAND LOGO")
			item_scale = 1.3
			pad_back_script = <pad_back_script>
		}
	endif
	<item_add_script> {
		text = qs("Continue")
		pad_choose_script = band_logo_choose_continue
		pad_choose_params = {event_params = <event_params> from_band_info = <from_band_info>}
	}
	get_savegame_from_controller controller = ($primary_controller)
	<item_add_script> {
		text = qs("Edit Band Logo")
		choose_state = UIstate_cap_main
		choose_state_data = {savegame = <savegame> text = qs("Edit Band Logo") part = CAS_Band_Logo cam_name = <cam_name> num_icons = 0}
	}
	<item_add_script> {
		text = qs(0x7adcd8ba)
		pad_choose_script = randomize_band_logo
		pad_choose_params = {rebuild_model = 1}
	}
	if NOT GotParam \{pad_back_script}
		menu_finish
	else
		add_user_control_helper \{text = qs("SELECT")
			button = green
			z = 100000}
	endif
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script ui_destroy_band_logo_choose 
	generic_ui_destroy
	destroy_generic_menu
endscript

script ui_init_band_logo_choose controller = ($primary_controller)
	return
	init_band_logo controller = <controller>
	fadetoblack \{off
		alpha = 1.0
		time = 0.1
		z_priority = 100
		no_wait}
	spawnscriptnow \{task_menu_default_anim_in
		params = {
			base_name = 'options_manage_band_logo'
		}}
	BandLogoObject :Obj_SetPosition \{position = (-33.45, -1.42, 21.9)}
	BandLogoObject :Obj_SetOrientation \{dir = (0.0, 0.0, -1.0)}
	BandLogoObject :SwitchOnAtomic \{CAS_Band_Logo}
	BandLogoObject :Obj_ApplyScaling \{scale = 1.0}
endscript

script ui_deinit_band_logo_choose 
	change \{cas_override_object = none}
	BandLogoObject :SwitchOffAtomic \{CAS_Band_Logo}
	cas_free_resources \{no_bink
		no_loading_screen
		band_logo}
endscript

script randomize_band_logo \{rebuild_model = 0}
	edit_graphic_select_random_logo
	edit_graphic_prepare_sprite_infos
	GenerateCAGTexture info_array = <sprite_infos> player = <currentSkaterProfileIndex> test = 0 slow_path = 1
endscript

script band_logo_choose_continue 
	GetCASAppearancePart \{part = CAS_Band_Logo}
	if GotParam \{cap}
		get_savegame_from_controller controller = <device_num>
		get_current_band_info
		SetGlobalTags savegame = <savegame> <band_info> params = {band_logo = <cap>}
	endif
	if GotParam \{from_band_info}
		ui_memcard_autosave_replace \{event = menu_replace
			state = uistate_options}
	else
		ui_memcard_autosave_replace event = menu_replace state = uistate_boot_download_scan data = {controller = <device_num>}
	endif
endscript

script current_band_has_band_logo controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info>
	if GotParam \{band_logo}
		if IsChecksum <band_logo>
			return \{true}
		else
			return \{false}
		endif
	else
		return \{false}
	endif
endscript

script current_band_has_band_name controller = ($primary_controller)
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info>
	if GotParam \{name}
		if (<name> = qs("\L"))
			return \{false}
		else
			return \{true}
		endif
	else
		return \{false}
	endif
endscript

script any_band_has_band_name 
	<loop_count> = ($num_career_bands)
	band_index = 1
	begin
	FormatText checksumname = bandname_id 'band%i_info' i = <band_index>
	GetGlobalTags <bandname_id> param = name
	if GotParam \{name}
		if NOT (<name> = qs("\L"))
			return \{true}
		endif
	endif
	<band_index> = (<band_index> + 1)
	repeat <loop_count>
	return \{false}
endscript

script SetBandLogoToCASAppearance 
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info>
	if GotParam \{band_logo}
		if IsChecksum <band_logo>
			EditCASAppearance target = SetPart targetParams = {part = CAS_Select_A_Logo desc_id = <band_logo>}
		endif
	endif
endscript
