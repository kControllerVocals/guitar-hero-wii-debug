
script ui_create_cas_select_part 
	spawnscriptnow ui_create_cas_select_part_spawned params = {<...>}
	start_CAS_rebuild_loop
endscript

script ui_create_cas_select_part_spawned 
	RequireParams \{[
			part
			text
		]
		all}
	ui_event_add_params hist_tex = <hist_tex>
	if GotParam \{cam_name}
		task_menu_default_anim_in base_name = <cam_name>
	endif
	make_generic_menu {
		vmenu_id = create_cas_select_part_vmenu
		pad_option2_script = generic_exit_restore
		title = <text>
		scrolling
		show_history
	}
	if GotParam \{camera_list}
		setup_cas_menu_handlers vmenu_id = create_cas_select_part_vmenu camera_list = <camera_list>
	else
		setup_cas_menu_handlers \{vmenu_id = create_cas_select_part_vmenu}
	endif
	if NOT GotParam \{choose_script}
		choose_script = select_part_decide_action
	endif
	ResolveBodySpecificPartInAppearance part = <part>
	current_part = 0
	get_part_current_desc_id part = <part>
	num_parts_added = 0
	GetArraySize ($<part>)
	i = 0
	begin
	if cas_item_is_visible part = <part> part_index = <i>
		if (((($<part>) [<i>]).desc_id) = <current_desc_id>)
			current_part = <num_parts_added>
		endif
		add_generic_menu_text_item {
			text = ((($<part>) [<i>]).frontend_desc)
			pad_choose_script = <choose_script>
			pad_choose_params = {<choose_params> part = <part>}
			additional_focus_script = select_part_focus_change
			additional_focus_params = {part = <part> index = <i>}
		}
		num_parts_added = (<num_parts_added> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	menu_finish \{car_helper_text_extra}
	LaunchEvent type = focus target = create_cas_select_part_vmenu data = {child_index = <current_part>}
	if GotParam \{stance}
		GetCurrentCASObject
		BandManager_ChangeStance name = <cas_object> stance = <stance> no_wait
	endif
	if GotParam \{cam_name}
		task_menu_default_anim_in base_name = <cam_name>
	endif
endscript

script ui_destroy_cas_select_part 
	printf \{qs(0xd4ff6b63)}
	generic_ui_destroy
	stop_CAS_rebuild_loop
endscript

script ui_init_cas_select_part 
	ui_load_cas_rawpak part = <part>
	PushTemporaryCASAppearance
	if GotParam \{additional_init_script}
		<additional_init_script>
	endif
endscript

script ui_deinit_cas_select_part 
	GetCurrentCASObject
	if GotParam \{return_stance}
		BandManager_ChangeStance name = <cas_object> stance = <return_stance> no_wait
	else
		BandManager_ChangeStance name = <cas_object> stance = stance_frontend no_wait
	endif
	if GotParam \{additional_deinit_script}
		<additional_deinit_script>
	endif
	FlushAllCompositeTextures
	PopTemporaryCASAppearance
endscript

script select_part_decide_action 
	if ScriptIsRunning \{select_part_focus_change_spawned}
		KillSpawnedScript \{name = select_part_focus_change_spawned}
	endif
	RequireParams \{[
			part
		]
		all}
	if is_part_capable part = <part>
		if GetCASPartMaterials part = <part>
			generic_event_choose state = UIstate_cas_select_part_options data = {part_materials = <part_materials> part = <part>}
			return
		endif
		get_section_index_from_desc_id part = <part> target_desc_id = Finishes
		if GotParam \{section_index}
			generic_event_choose state = UIstate_cap_artist_layer data = {part = <part> text = qs("FINISHES") section_index = <section_index> back_steps = 3}
			return
		else
			generic_event_choose state = UIstate_cap_main data = {savegame = ($cas_current_savegame) part = <part> text = qs("DESIGN") back_steps = 2}
		endif
	elseif GetCASPartMaterials part = <part>
		ui_event event = menu_change data = {state = UIstate_cas_color_edit part = <part> part_materials = <part_materials> hist_tex = menu_history_color_edit}
		printf \{qs("\LGO TO COLOR MENU")}
	endif
endscript

script start_CAS_rebuild_loop 
	SpawnScript \{part_loop}
endscript

script stop_CAS_rebuild_loop 
	if ($part_changed = 1)
		change \{part_changed = 3}
	else
		change \{part_changed = 2}
	endif
endscript

script trigger_CAS_rebuild_loop 
	change \{part_changed = 1}
endscript
part_changed = 2

script part_loop 
	change \{part_changed = 0}
	begin
	if ($part_changed = 1)
		change \{part_changed = 0}
		Wait \{1
			second}
		if ($part_changed = 0)
			RebuildCurrentCASModel
		endif
	elseif ($part_changed = 2)
		return
	elseif ($part_changed = 3)
		RebuildCurrentCASModel
		return
	elseif ($part_changed = 3)
		RebuildCurrentCASModel
		return
	else
		Wait \{0.5
			second}
	endif
	repeat
endscript
