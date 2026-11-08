
script ui_create_options_data 
	make_menu_frontend \{screen = Guitarist
		title = qs("SAVE / LOAD")
		pad_back_script = ui_options_check_settings
		title_pos = (-20.0, 100.0)
		pos = (-90.0, -20.0)}
	if ($enable_saving = 0)
		add_menu_frontend_item \{text = qs("SAVE GAME")
			not_focusable}
	else
		add_menu_frontend_item \{text = qs("SAVE GAME")
			pad_choose_script = option_data_save_and_load_confirm
			pad_choose_params = {
				event = menu_change
				save = 1
			}}
	endif
	if ($enable_loading = 0)
		add_menu_frontend_item \{text = qs("LOAD GAME")
			not_focusable}
	else
		add_menu_frontend_item \{text = qs("LOAD GAME")
			pad_choose_script = option_data_save_and_load_confirm
			pad_choose_params = {
				event = menu_change
				load = 1
			}}
	endif
	if (($enable_loading = 0) || ($enable_saving = 0))
		add_menu_frontend_item \{text = qs("RESET PROGRESS")
			not_focusable}
	else
		add_menu_frontend_item \{text = qs("RESET PROGRESS")
			pad_choose_script = generic_event_choose
			pad_choose_params = {
				state = uistate_options_data_delete
			}}
	endif
	if ($enable_saving = 0)
		add_menu_frontend_item \{text = qs("AUTOSAVE")
			pos = (20.0, 0.0)
			not_focusable}
	else
		add_menu_frontend_item \{text = qs("AUTOSAVE")
			pad_choose_script = ui_options_data_toggle_autosave}
	endif
	texture = data_settings_xmark
	GetGlobalTags \{user_options}
	if (<autosave> = 1)
		<texture> = data_settings_checkmark
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = <item_container_id>
		local_id = check
		pos = (-15.0, 55.0)
		just = [center center]
		texture = <texture>
		scale = 0.65000004
	}
	menu_finish
	ui_options_set_settings
endscript

script ui_destroy_options_data 
	generic_ui_destroy
endscript

script ui_options_data_toggle_autosave \{time = 0.075}
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	memcard_check_for_existing_save
	if (<found> = 0)
		wii_memcard_check_for_space
		if (<nospace> = 1)
			if IsNgc
				generic_event_choose \{event = menu_change
					data = {
						state = UIState_Wii_Handle_Trc
						event_params = {
							memcard_status = insufficient_space_ingame
							type = load
							event_params = {
								event = menu_back
								state = uistate_options_data
							}
						}
					}}
			endif
			return
		elseif (<noinode> = 1)
			if IsNgc
				generic_event_choose \{event = menu_change
					data = {
						state = UIState_Wii_Handle_Trc
						event_params = {
							memcard_status = insufficient_inode_ingame
							type = load
							event_params = {
								event = menu_back
								state = uistate_options_data
							}
						}
					}}
			endif
			return
		endif
	endif
	if (<found> = 1)
		SetSaveFileName FileType = Progress name = ($memcard_file_types [$progressFileTypeIndex].file_name)
		if IsSaveCorrupt \{FileType = Progress}
			if IsNgc
				generic_event_choose \{event = menu_change
					data = {
						state = UIState_Wii_Handle_Trc
						event_params = {
							memcard_status = load_corrupt_ingame
							type = load
							event_params = {
								event = menu_back
								state = uistate_options_data
							}
						}
					}}
			endif
			return
		endif
	endif
	GetTags
	Obj_GetID
	<id> = <ObjID>
	if ResolveScreenElementId id = {<id> child = {0 child = check}}
		GetGlobalTags \{user_options}
		if (<autosave> = 1)
			SoundEvent \{event = checkbox_sfx}
			<autosave> = 0
			if ScreenElementExists id = <resolved_id>
				<resolved_id> :LegacyDoMorph alpha = 0 time = <time>
				SetScreenElementProps id = <resolved_id> texture = data_settings_xmark
				<resolved_id> :LegacyDoMorph alpha = 1 time = <time>
			endif
		else
			SoundEvent \{event = CheckBox_Check_SFX}
			<autosave> = 1
			if ScreenElementExists id = <resolved_id>
				<resolved_id> :LegacyDoMorph alpha = 0 time = <time>
				SetScreenElementProps id = <resolved_id> texture = data_settings_checkmark
				<resolved_id> :LegacyDoMorph alpha = 1 time = <time>
			endif
		endif
		SetGlobalTags user_options params = {autosave = <autosave>}
	endif
endscript

script option_data_save_and_load_confirm 
	LaunchEvent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	if GotParam \{save}
		confirmFunc = option_data_save_yes
		text = $option_data_save_confirm
	elseif GotParam \{load}
		confirmFunc = option_data_load_yes
		text = $option_data_load_confirm
	endif
	create_popup_warning_menu {
		textblock = {
			text = <text>
		}
		options = [
			{
				func = option_data_save_load_cancel
				text = $wii_popup_cancel
			}
			{
				func = <confirmFunc>
				func_params = {data = {event = menu_back state = uistate_options_data}}
				text = $wii_popup_sure
			}
		]
	}
endscript

script option_data_save_yes 
	change \{memcard_after_func = option_data_save_load_after_func}
	ui_memcard_save \{event = menu_back
		data = {
			state = uistate_options_data
		}}
endscript

script option_data_load_yes 
	change \{memcard_after_func = option_data_save_load_after_func}
	ui_memcard_load \{event = menu_back
		data = {
			state = uistate_options_data
		}}
endscript

script option_data_save_load_cancel 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script option_data_save_load_after_func 
	destroy_popup_warning_menu
endscript
