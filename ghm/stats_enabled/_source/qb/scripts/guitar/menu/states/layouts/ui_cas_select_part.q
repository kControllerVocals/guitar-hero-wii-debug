
script ui_create_cas_select_part 
	spawnscriptnow ui_create_cas_select_part_spawned params = {<...>}
endscript

script ui_create_cas_select_part_spawned 
	requireparams \{[
			part
			text
		]
		all}
	ui_event_add_params hist_tex = <hist_tex>
	if gotparam \{cam_name}
		task_menu_default_anim_in base_name = <cam_name>
	endif
	make_generic_menu {
		vmenu_id = create_cas_select_part_vmenu
		pad_option2_script = generic_exit_restore
		title = <text>
		scrolling
		show_history
	}
	if gotparam \{camera_list}
		setup_cas_menu_handlers vmenu_id = create_cas_select_part_vmenu camera_list = <camera_list>
	else
		setup_cas_menu_handlers \{vmenu_id = create_cas_select_part_vmenu}
	endif
	if NOT gotparam \{choose_script}
		choose_script = select_part_decide_action
	endif
	resolvebodyspecificpartinappearance part = <part>
	current_part = 0
	get_part_current_desc_id part = <part>
	num_parts_added = 0
	getarraysize ($<part>)
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
	launchevent type = focus target = create_cas_select_part_vmenu data = {child_index = <current_part>}
	if gotparam \{stance}
		getcurrentcasobject
		bandmanager_changestance name = <cas_object> stance = <stance> no_wait
	endif
	if gotparam \{cam_name}
		task_menu_default_anim_in base_name = <cam_name>
	endif
endscript

script ui_destroy_cas_select_part 
	generic_ui_destroy
endscript

script ui_init_cas_select_part 
	ui_load_cas_rawpak part = <part>
	pushtemporarycasappearance
	if gotparam \{additional_init_script}
		<additional_init_script>
	endif
endscript

script ui_deinit_cas_select_part 
	getcurrentcasobject
	if gotparam \{return_stance}
		bandmanager_changestance name = <cas_object> stance = <return_stance> no_wait
	else
		bandmanager_changestance name = <cas_object> stance = stance_frontend no_wait
	endif
	if gotparam \{additional_deinit_script}
		<additional_deinit_script>
	endif
	flushallcompositetextures
	castemporariesflush
	poptemporarycasappearance
endscript

script select_part_decide_action 
	if scriptisrunning \{select_part_focus_change_spawned}
		killspawnedscript \{name = select_part_focus_change_spawned}
	endif
	requireparams \{[
			part
		]
		all}
	if is_part_capable part = <part>
		if getcaspartmaterials part = <part>
			generic_event_choose state = uistate_cas_select_part_options data = {part_materials = <part_materials> part = <part>}
			return
		endif
		get_section_index_from_desc_id part = <part> target_desc_id = finishes
		if gotparam \{section_index}
			generic_event_choose state = uistate_cap_artist_layer data = {part = <part> text = qs(0x3f47b13d) section_index = <section_index> back_steps = 3}
			return
		else
			generic_event_choose state = uistate_cap_main data = {savegame = ($cas_current_savegame) part = <part> text = qs(0x541bd475) back_steps = 2}
		endif
	elseif getcaspartmaterials part = <part>
		ui_event event = menu_change data = {state = uistate_cas_color_edit part = <part> part_materials = <part_materials> hist_tex = 0xdb87852b}
		printf \{qs(0x15f83e1d)}
	endif
endscript

script trigger_cas_rebuild_loop 
	setspawninstancelimits \{max = 1
		management = kill_oldest}
	wait \{1
		second}
	rebuildcurrentcasmodel
endscript
