
script ui_create_options_settings 
	GetGlobalTags \{user_options}
	make_menu_frontend \{screen = Guitarist
		title = qs("SETTINGS")
		pad_back_script = ui_options_check_settings
		title_pos = (0.0, 70.0)
		pos = (-50.0, 0.0)}
	add_menu_frontend_item \{text = qs("AUDIO")
		item_height = 30
		choose_state = uistate_options_audio}
	FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
	GetGlobalTags <bandname_id> param = auto_dwc_login
	if (<auto_dwc_login> = 0)
		scroll_texture = data_settings_xmark
	else
		scroll_texture = data_settings_checkmark
	endif
	add_menu_frontend_item \{text = $wii_auto_signin_caps
		pos = (20.0, 0.0)
		pad_choose_script = change_auto_signin_status}
	CreateScreenElement {
		type = SpriteElement
		parent = <item_container_id>
		local_id = check
		pos = (0.0, 55.0)
		just = [center center]
		texture = <scroll_texture>
		scale = 0.7
	}
	lefty_texture = data_settings_xmark
	if (<lefty_flip_save> = 1)
		lefty_texture = data_settings_checkmark
	endif
	if isXenon
		add_menu_frontend_item {
			text = qs("LEFTY FLIP")
			pos = (20.0, 0.0)
			pad_choose_script = ui_options_controller_choose_lefty_flip
			pad_choose_params = {popup = <popup> player_device = $primary_controller}
		}
	else
		add_menu_frontend_item \{text = qs("LEFTY FLIP")
			pos = (20.0, 0.0)
			item_height = 35
			choose_state = UIstate_options_settings_lefty_warning
			choose_state_data = {
				is_popup
			}}
		current_menu :SetTags lefty_id = <item_id>
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = <item_container_id>
		local_id = check
		pos = (1.0, 55.0)
		just = [center center]
		texture = <lefty_texture>
		scale = 0.7
	}
	if ($vocal_enable_static_view = 1)
		if (<vocals_highway_view_save> = static)
			scroll_texture = data_settings_xmark
		else
			scroll_texture = data_settings_checkmark
		endif
		add_menu_frontend_item \{text = qs("SCROLLING VOCALS")
			pos = (20.0, 0.0)
			item_height = 35
			pad_choose_script = options_change_vocals_highway_view
			pad_choose_params = {
				no_restart
				player = 1
			}}
		CreateScreenElement {
			type = SpriteElement
			parent = <item_container_id>
			local_id = check
			pos = (2.0, 55.0)
			just = [center center]
			texture = <scroll_texture>
			scale = 0.7
		}
	endif
	GetPlayerInfo \{player = 1
		vocals_sp_clap}
	if (<vocals_sp_clap> = 0)
		scroll_texture = data_settings_xmark
	else
		scroll_texture = data_settings_checkmark
	endif
	add_menu_frontend_item \{text = qs("VOCALS STAR\nPOWER CLAP")
		pos = (20.0, 0.0)
		pad_choose_script = options_change_vocals_sp_clap
		pad_choose_params = {
			player = 1
		}}
	CreateScreenElement {
		type = SpriteElement
		parent = <item_container_id>
		local_id = check
		pos = (3.0, 55.0)
		just = [center center]
		texture = <scroll_texture>
		scale = 0.7
	}
	count_texture = data_settings_xmark
	if (<unpause_count> = 1)
		count_texture = data_settings_checkmark
	endif
	add_menu_frontend_item \{text = qs("COUNTDOWN")
		pos = (20.0, 0.0)
		item_height = 35
		pad_choose_script = ui_options_settings_choose_count
		pad_choose_params = {
			player = 1
		}}
	CreateScreenElement {
		type = SpriteElement
		parent = <item_container_id>
		local_id = check
		pos = (4.0, 55.0)
		just = [center center]
		texture = <count_texture>
		scale = 0.7
	}
	ui_options_set_settings
	menu_finish
endscript

script ui_destroy_options_settings 
	generic_ui_destroy
endscript

script ui_options_settings_choose_count 
	Obj_GetID
	GetGlobalTags \{user_options
		param = unpause_count}
	if ResolveScreenElementId id = {<ObjID> child = {0 child = check}}
		if (<unpause_count> = 1)
			<unpause_count> = 0
			SoundEvent \{event = checkbox_sfx}
			if GotParam \{popup}
				<resolved_id> :SetProps texture = Options_Controller_X
			else
				<resolved_id> :SetProps texture = data_settings_xmark
			endif
		else
			<unpause_count> = 1
			SoundEvent \{event = CheckBox_Check_SFX}
			if GotParam \{popup}
				<resolved_id> :SetProps texture = Options_Controller_Check
			else
				<resolved_id> :SetProps texture = data_settings_checkmark
			endif
		endif
		SetGlobalTags user_options params = {unpause_count = <unpause_count>}
	endif
endscript

script change_auto_signin_status 
	FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
	GetGlobalTags <bandname_id> param = auto_dwc_login
	if (<auto_dwc_login> = 0)
		SetGlobalTags <bandname_id> params = {auto_dwc_login = 1}
	else
		SetGlobalTags <bandname_id> params = {auto_dwc_login = 0}
	endif
	printf \{qs(0xbbca3368)}
	ui_memcard_autosave_replace \{event = menu_replace
		state = uistate_options_settings}
endscript

script ui_create_options_settings_lefty_warning 
	create_new_generic_popup \{popup_type = ok_menu
		title = $wii_popup_warning
		text = $wii_options_lefty_warning
		ok_func = ui_options_settings_lefty_warning
		title_effect}
endscript

script ui_destroy_options_settings_lefty_warning 
	destroy_generic_popup
endscript

script ui_options_settings_lefty_warning 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	current_menu :GetSingleTag \{lefty_id}
	<lefty_id> :obj_spawnscript ui_options_controller_choose_lefty_flip params = {player_device = $primary_controller}
	ui_destroy_options_settings_lefty_warning
	generic_event_back
endscript
