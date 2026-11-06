
script ui_create_band_name_enter 
	change menu_flow_locked = ($menu_flow_locked + 1)
	disable_pause
	spawnscriptnow ui_create_band_name_enter_spawned params = <...>
	change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_create_band_name_enter_spawned 
	change menu_flow_locked = ($menu_flow_locked + 1)
	frontend_load_soundcheck \{loadingscreen}
	getwaypointpos \{name = z_soundcheck_trg_waypoint_car_start}
	cam_pos = (<pos> + (-0.3, 1.4499999, 1.0))
	playigccam {
		name = ui_band_name_enter_camera
		viewport = bg_viewport
		pos = <cam_pos>
		quat = (0.0, -1.0, 0.0)
		play_hold = 1
		interrupt_current
	}
	if gotparam \{from_band_logo}
		if spanish
			make_generic_menu \{title = qs(0xe116f6ac)
				pad_back_script = nullscript
				title_dims = (350.0, 50.0)
				shift = (-50.0, 0.0)}
		elseif italian
			make_generic_menu \{title = qs(0xe116f6ac)
				pad_back_script = nullscript
				title_dims = (280.0, 50.0)
				shift = (-20.0, 0.0)}
		elseif german
			make_generic_menu \{title = qs(0xe116f6ac)
				pad_back_script = nullscript
				title_dims = (300.0, 50.0)
				shift = (-30.0, 0.0)}
		elseif french
			make_generic_menu \{title = qs(0xe116f6ac)
				pad_back_script = nullscript
				title_dims = (310.0, 50.0)
				shift = (-30.0, 0.0)}
		else
			make_generic_menu \{title = qs(0xe116f6ac)
				pad_back_script = nullscript}
		endif
		get_savegame_from_controller controller = <device_num>
		get_current_band_info
		bandname_id = <band_info>
		getglobaltags <bandname_id> param = name savegame = <savegame>
		random_name = <name>
		skip_deinit = 1
		pad_back_script = generic_event_back
		dims = (1.5 * (350.0, 29.0))
	else
		if spanish
			make_generic_menu \{title = qs(0x4775c198)
				pad_back_script = nullscript
				title_dims = (350.0, 50.0)
				shift = (-50.0, 0.0)}
		elseif italian
			make_generic_menu \{title = qs(0x4775c198)
				pad_back_script = nullscript
				title_dims = (280.0, 50.0)
				shift = (-20.0, 0.0)}
		elseif german
			make_generic_menu \{title = qs(0x4775c198)
				pad_back_script = nullscript
				title_dims = (300.0, 50.0)
				shift = (-30.0, 0.0)}
		elseif french
			make_generic_menu \{title = qs(0x4775c198)
				pad_back_script = nullscript
				title_dims = (300.0, 50.0)
				shift = (-30.0, 0.0)}
		else
			make_generic_menu \{title = qs(0x4775c198)
				pad_back_script = nullscript}
		endif
		pad_back_script = nullscript
		dims = (1.0 * (350.0, 37.0))
		cas_random_band_name
		skip_deinit = 1
	endif
	change \{num_name_size = 20}
	text_entry_add_item {
		pad_choose_script = ui_band_name_confirm
		pad_choose_params = {from_options = <from_options> from_band_logo = <from_band_logo> event_params = <event_params>}
		pad_back_script = nullscript
		linear_flow
		text = <random_name>
		dims = <dims>
		validity_message = qs(0x6d83d9d1)
		skip_deinit = <skip_deinit>
	}
	if isguitarcontroller controller = ($primary_controller)
		event_handlers = [
			{pad_option re_randomize_band_name params = {text_entry = <text_entry>}}
			{pad_option generic_menu_pad_choose_sound}
			{pad_square generic_event_back}
		]
	else
		if isdrumcontroller controller = ($primary_controller)
			event_handlers = [
				{pad_option re_randomize_band_name params = {text_entry = <text_entry>}}
				{pad_option generic_menu_pad_choose_sound}
				{pad_l1 generic_event_back}
			]
		else
			event_handlers = [
				{pad_option re_randomize_band_name params = {text_entry = <text_entry>}}
				{pad_option generic_menu_pad_choose_sound}
				{pad_r2 generic_event_back}
			]
		endif
	endif
	setscreenelementprops {
		id = current_menu
		event_handlers = <event_handlers>
	}
	menu_finish \{no_helper_text}
	launchevent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	launchevent \{type = pad_choose}
	ui_band_name_enter_helper_text
	change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_band_name_enter_helper_text 
	add_user_control_helper \{text = qs(0x2931d48b)
		button = green
		z = 100000
		all_buttons}
	add_user_control_helper \{text = qs(0x271a1633)
		button = red
		z = 100000}
	add_user_control_helper \{text = qs(0xa3503d64)
		button = yellow
		z = 100000}
	add_user_control_helper \{text = qs(0x0b6c701b)
		button = blue
		z = 100000}
	add_user_control_helper \{text = qs(0xaf4d5dd2)
		button = orange
		z = 100000}
	add_user_control_helper \{text = qs(0x0e41fe46)
		button = start
		z = 100000}
endscript

script ui_return_band_name_enter 
	change menu_flow_locked = ($menu_flow_locked + 1)
	ui_band_name_enter_helper_text
	change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_band_name_enter 
	change menu_flow_locked = ($menu_flow_locked + 1)
	killcamanim \{name = ui_band_name_enter_camera}
	destroy_generic_menu
	change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_band_name_confirm 
	change menu_flow_locked = ($menu_flow_locked + 1)
	if NOT ui_band_name_is_valid <...>
		soundevent \{event = menu_warning_sfx}
		printf \{'tried to start one popup'}
		if ($0x238076ba = 0)
			printf \{'start one popup'}
			change menu_flow_locked = ($menu_flow_locked - 1)
			if screenelementexists \{id = current_menu}
				launchevent \{type = unfocus
					target = current_menu}
				create_popup_warning_menu \{textblock = {
						text = qs(0x6d83d9d1)
					}
					options = [
						{
							func = enter_band_remove_warning_refocus
							text = qs(0x182f0173)
						}
					]}
			endif
		endif
	else
		get_current_band_info
		bandname_id = <band_info>
		gettruestarttime
		formattext checksumname = band_unique_id 'band_info_%d' d = <starttime>
		setglobaltags <bandname_id> params = {name = <text> band_unique_id = <band_unique_id>}
		agora_update band_id = <band_unique_id> name = <text> new_band
		soundevent \{event = enter_band_name_finish}
		change menu_flow_locked = ($menu_flow_locked - 1)
		if gotparam \{from_band_logo}
			generic_event_back \{data = {
					supress_model_load
				}}
		elseif ($options_for_manage_band = 1)
			generic_event_choose \{event = menu_change
				state = uistate_options_manage_band_logo}
		else
			if gotparam \{from_options}
				generic_event_choose \{event = menu_replace
					state = uistate_options_manage_band_logo}
			else
				create_loading_screen
				generic_event_replace state = uistate_band_logo_choose data = {event_params = <event_params>}
			endif
		endif
	endif
endscript

script enter_band_remove_warning_refocus 
	destroy_popup_warning_menu
	enter_band_name_reset_user_control_helpers
	launchevent \{type = focus
		target = current_menu
		data = {
			child_index = 0
		}}
	launchevent \{type = pad_choose}
endscript

script re_randomize_band_name 
	printf \{qs(0xd8ab1fc5)}
	cas_random_band_name
	seed_text_entry text = <random_name> text_entry = <text_entry>
	refresh_text_on_screen text_entry = <text_entry>
endscript

script ui_band_name_is_valid 
	stringremovetrailingwhitespace string = <text>
	stringtochararray string = <new_string>
	getarraysize <char_array>
	if (<array_size> = 0)
		return \{false}
	else
		return \{true}
	endif
endscript
