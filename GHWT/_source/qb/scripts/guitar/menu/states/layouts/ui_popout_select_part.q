
script ui_create_popout_select_part 
	spawnscriptnow ui_create_popout_select_part_spawned params = {<...>}
	if NOT GotParam \{noRebuildLoop}
		start_CAS_rebuild_loop
	else
		stop_CAS_rebuild_loop
	endif
endscript

script ui_create_popout_select_part_spawned 
	RequireParams \{[
			part
		]
		all}
	make_list_menu {
		vmenu_id = create_popout_select_part_vmenu
		pad_back_script = generic_exit_restore
		pad_back_sound = NullSound
		parent = <container_id>
		text_case = <text_case>
		icon = <hist_tex>
		icon_offset = <icon_offset>
		list_offset = <list_offset>
	}
	if NOT GotParam \{disable_rotation_zoom}
		if GotParam \{only_rotate}
			setup_cas_menu_handlers vmenu_id = create_popout_select_part_vmenu camera_list = <camera_list> no_rotate = <no_rotate> pull_back_distance = <pull_back_distance> no_zoom
		else
			setup_cas_menu_handlers vmenu_id = create_popout_select_part_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera> no_rotate = <no_rotate> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance>
		endif
	endif
	ResolveBodySpecificPartInAppearance part = <part>
	if NOT GotParam \{surrogate_part}
		surrogate_part = <part>
	endif
	current_part = 0
	get_part_current_desc_id part = <part>
	GetArraySize ($<part>)
	num_parts_added = 0
	i = 0
	begin
	if cas_item_is_visible part = <part> part_index = <i>
		if is_part_unlocked part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
			if (((($<part>) [<i>]).desc_id) = <current_desc_id>)
				current_part = <num_parts_added>
			endif
			if NOT is_part_purchased part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
				if GotParam \{purchase_menu}
					price = ((($<part>) [<i>]).price)
					FormatText TextName = pad_choose_dialogue qs("Would you like to purchase and edit this %s?") s = ((($<part>) [<i>]).frontend_desc)
					show_purchasable = 1
				endif
				if is_part_editable part = <part> desc_id = ((($<part>) [<i>]).desc_id)
					editable = {editable}
				endif
			elseif is_part_editable part = <part> desc_id = ((($<part>) [<i>]).desc_id)
				if GotParam \{choose_script}
					pad_option2_script = <choose_script>
				else
					if (<part> != CAS_Lip_Makeup)
						pad_option2_script = popout_select_part_decide_action
						show_editable = 1
						editable = {editable}
					endif
				endif
				if GotParam \{only_rotate}
					pad_option2_params = {part = <part> index = <i> color_wheel = <color_wheel> num_icons = <num_icons> icon = <hist_tex> camera_list = <camera_list> zoom_camera = <zoom_camera> no_rotate = <no_rotate> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance> stance = <stance> additional_deinit_script = <additional_deinit_script> return_stance = <return_stance> surrogate_part = <surrogate_part> only_rotate}
				elseif GotParam \{disable_rotation_zoom}
					pad_option2_params = {part = <part> index = <i> color_wheel = <color_wheel> num_icons = <num_icons> icon = <hist_tex> camera_list = <camera_list> zoom_camera = <zoom_camera> no_rotate = <no_rotate> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance> stance = <stance> additional_deinit_script = <additional_deinit_script> return_stance = <return_stance> surrogate_part = <surrogate_part> disable_rotation_zoom}
				else
					pad_option2_params = {part = <part> index = <i> color_wheel = <color_wheel> num_icons = <num_icons> icon = <hist_tex> camera_list = <camera_list> zoom_camera = <zoom_camera> no_rotate = <no_rotate> no_zoom = <no_zoom> pull_back_distance = <pull_back_distance> stance = <stance> additional_deinit_script = <additional_deinit_script> return_stance = <return_stance> surrogate_part = <surrogate_part>}
				endif
			endif
			if GotParam \{only_rotate}
				add_list_item {
					text = ((($<part>) [<i>]).frontend_desc)
					pad_choose_script = generic_event_back
					pad_choose_params = {part = <part> nosound}
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					additional_focus_script = select_part_focus_change
					additional_focus_params = {part = <part> index = <i> play_current_anim = <play_current_anim> disable_rotation_zoom = <disable_rotation_zoom> show_purchasable = <show_purchasable> show_editable = <show_editable> surrogate_part = <surrogate_part> only_rotate}
					price = <price>
					pad_choose_dialogue = <pad_choose_dialogue>
					pad_option2_script = <pad_option2_script>
					pad_option2_params = <pad_option2_params>
					<editable>
				}
			else
				add_list_item {
					text = ((($<part>) [<i>]).frontend_desc)
					pad_choose_script = generic_event_back
					pad_choose_params = {part = <part> nosound}
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					additional_focus_script = select_part_focus_change
					additional_focus_params = {part = <part> index = <i> play_current_anim = <play_current_anim> disable_rotation_zoom = <disable_rotation_zoom> show_purchasable = <show_purchasable> show_editable = <show_editable> surrogate_part = <surrogate_part>}
					price = <price>
					pad_choose_dialogue = <pad_choose_dialogue>
					pad_option2_script = <pad_option2_script>
					pad_option2_params = <pad_option2_params>
					<editable>
				}
			endif
			num_parts_added = (<num_parts_added> + 1)
			if GotParam \{price}
				RemoveParameter \{price}
			endif
			if GotParam \{pad_choose_dialogue}
				RemoveParameter \{pad_choose_dialogue}
			endif
			if GotParam \{pad_back_dialogue}
				RemoveParameter \{pad_back_dialogue}
			endif
			if GotParam \{show_purchasable}
				RemoveParameter \{show_purchasable}
			endif
			if GotParam \{show_editable}
				RemoveParameter \{show_editable}
			endif
			if GotParam \{pad_option2_script}
				RemoveParameter \{pad_option2_script}
			endif
			if GotParam \{editable}
				RemoveParameter \{editable}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	clean_up_user_control_helpers
	LaunchEvent type = focus target = create_popout_select_part_vmenu data = {child_index = <current_part>}
	if GotParam \{stance}
		GetCurrentCASObject
		BandManager_ChangeStance name = <cas_object> stance = <stance> no_wait
	endif
	if GotParam \{cam_name}
		change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		change \{generic_menu_block_input = 0}
	endif
endscript

script ui_destroy_popout_select_part 
	generic_list_destroy
	destroy_popup_warning_menu
	stop_CAS_rebuild_loop
endscript

script ui_init_popout_select_part 
	RequireParams \{[
			part
		]
		all}
	ui_load_cas_rawpak part = <part>
	if GotParam \{additional_init_script}
		<additional_init_script>
	endif
	PushTemporaryCASAppearance
endscript

script ui_deinit_popout_select_part 
	FlushAllCompositeTextures
	PopTemporaryCASAppearance
	if NOT GotParam \{skip_deinit_script}
		if GotParam \{additional_deinit_script}
			<additional_deinit_script>
		endif
		GetCurrentCASObject
		if GotParam \{return_stance}
			BandManager_ChangeStance name = <cas_object> stance = <return_stance> no_wait
		else
			BandManager_ChangeStance name = <cas_object> stance = stance_frontend no_wait
		endif
	else
		ui_event_remove_params \{param = skip_deinit_script}
	endif
	cleanup_cas_menu_handlers
endscript

script popout_select_part_decide_action 
	if ScriptIsRunning \{select_part_focus_change_spawned}
		KillSpawnedScript \{name = select_part_focus_change_spawned}
	endif
	RequireParams \{[
			part
		]
		all}
	if NOT GotParam \{surrogate_part}
		surrogate_part = <part>
	endif
	LaunchEvent \{type = unfocus
		target = create_popout_select_part_vmenu}
	get_part_current_desc_id part = <surrogate_part>
	begin
	if (((($<part>) [<index>]).desc_id) = <current_desc_id>)
		if ($part_changed = 0)
			break
		endif
	endif
	Wait \{0.5
		seconds}
	repeat
	if GotParam \{purchase_menu}
	endif
	ui_event_add_params \{skip_deinit_script = 1}
	if is_part_capable part = <surrogate_part>
		if GetCASPartMaterials part = <surrogate_part>
			generic_event_replace data = {
				state = UIstate_cas_select_part_options
				part = <surrogate_part>
				part_materials = <part_materials>
				num_states = 1
				num_icons = <num_icons>
				hist_tex = <icon>
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				no_rotate = <no_rotate>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
			}
			return
		endif
		get_section_index_from_desc_id part = <surrogate_part> target_desc_id = Finishes
		if GotParam \{section_index}
			generic_event_replace data = {
				state = UIstate_cap_artist_layer
				part = <surrogate_part> text = qs("Finishes")
				section_index = <section_index>
				back_steps = 2
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				no_rotate = <no_rotate>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
			}
			return
		else
			generic_event_replace data = {
				state = UIstate_cap_main
				savegame = ($cas_current_savegame)
				part = <surrogate_part> text = qs("Design")
				back_steps = 1
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				no_rotate = <no_rotate>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
			}
			return
		endif
	elseif GetCASPartMaterials part = <surrogate_part>
		GetArraySize <part_materials>
		if (<array_size> > 1)
			if GotParam \{disable_rotation_zoom}
				ui_event event = menu_replace data = {
					state = UIstate_cas_select_part_color_options
					part = <surrogate_part>
					part_materials = <part_materials>
					hist_tex = menu_history_color_edit
					num_states = 1
					num_icons = <num_icons>
					color_wheel = <color_wheel>
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					no_rotate = <no_rotate>
					no_zoom = <no_zoom>
					pull_back_distance = <pull_back_distance>
					stance = <stance>
					additional_deinit_script = <additional_deinit_script>
					return_stance = <return_stance>
					disable_rotation_zoom
				}
			elseif GotParam \{only_rotate}
				ui_event event = menu_replace data = {
					state = UIstate_cas_select_part_color_options
					part = <surrogate_part>
					part_materials = <part_materials>
					hist_tex = menu_history_color_edit
					num_states = 1
					num_icons = <num_icons>
					color_wheel = <color_wheel>
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					no_rotate = <no_rotate>
					no_zoom = <no_zoom>
					pull_back_distance = <pull_back_distance>
					stance = <stance>
					additional_deinit_script = <additional_deinit_script>
					return_stance = <return_stance>
					only_rotate
				}
			else
				ui_event event = menu_replace data = {
					state = UIstate_cas_select_part_color_options
					part = <surrogate_part>
					part_materials = <part_materials>
					hist_tex = menu_history_color_edit
					num_states = 1
					num_icons = <num_icons>
					color_wheel = <color_wheel>
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					no_rotate = <no_rotate>
					no_zoom = <no_zoom>
					pull_back_distance = <pull_back_distance>
					stance = <stance>
					additional_deinit_script = <additional_deinit_script>
					return_stance = <return_stance>
				}
			endif
		else
			if GotParam \{disable_rotation_zoom}
				ui_event event = menu_replace data = {
					state = UIstate_cas_color_edit
					part = <surrogate_part>
					part_materials = <part_materials>
					hist_tex = menu_history_color_edit
					num_states = 1
					num_icons = <num_icons>
					color_wheel = <color_wheel>
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					no_rotate = <no_rotate>
					no_zoom = <no_zoom>
					pull_back_distance = <pull_back_distance>
					stance = <stance>
					additional_deinit_script = <additional_deinit_script>
					return_stance = <return_stance>
					no_rotate_zoom
				}
			elseif GotParam \{only_rotate}
				ui_event event = menu_replace data = {
					state = UIstate_cas_color_edit
					part = <surrogate_part>
					part_materials = <part_materials>
					hist_tex = menu_history_color_edit
					num_states = 1
					num_icons = <num_icons>
					color_wheel = <color_wheel>
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					no_rotate = <no_rotate>
					no_zoom = <no_zoom>
					pull_back_distance = <pull_back_distance>
					stance = <stance>
					additional_deinit_script = <additional_deinit_script>
					return_stance = <return_stance>
					only_rotate
				}
			else
				ui_event event = menu_replace data = {
					state = UIstate_cas_color_edit
					part = <surrogate_part>
					part_materials = <part_materials>
					hist_tex = menu_history_color_edit
					num_states = 1
					num_icons = <num_icons>
					color_wheel = <color_wheel>
					camera_list = <camera_list>
					zoom_camera = <zoom_camera>
					no_rotate = <no_rotate>
					no_zoom = <no_zoom>
					pull_back_distance = <pull_back_distance>
					stance = <stance>
					additional_deinit_script = <additional_deinit_script>
					return_stance = <return_stance>
				}
			endif
		endif
		return
	else
		if GotParam \{disable_rotation_zoom}
			ui_event event = menu_replace data = {
				state = UIstate_cas_color_edit
				part = <surrogate_part>
				part_materials = <part_materials>
				hist_tex = menu_history_color_edit
				num_states = 1
				num_icons = <num_icons>
				color_wheel = <color_wheel>
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				no_rotate = <no_rotate>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
				no_rotate_zoom
			}
		else
			ui_event event = menu_replace data = {
				state = UIstate_cas_color_edit
				part = <surrogate_part>
				part_materials = <part_materials>
				hist_tex = menu_history_color_edit
				num_states = 1
				num_icons = <num_icons>
				color_wheel = <color_wheel>
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				no_rotate = <no_rotate>
				no_zoom = <no_zoom>
				pull_back_distance = <pull_back_distance>
				stance = <stance>
				additional_deinit_script = <additional_deinit_script>
				return_stance = <return_stance>
			}
		endif
	endif
endscript

script select_part_focus_change 
	RequireParams \{[
			part
		]
		all}
	KillAllCompositeTextures
	if NOT GotParam \{surrogate_part}
		surrogate_part = <part>
	endif
	get_part_current_desc_id part = <surrogate_part>
	printf qs("\LCurrent Desc ID is %c") c = <current_desc_id> DoNotResolve
	if (((($<part>) [<index>]).desc_id) != <current_desc_id>)
		new_part = (($<part>) [<index>])
		if StructureContains Structure = (<new_part>) Finishable
			EditCASAppearance target = SetPart targetParams = {part = (<new_part>.Finishable) desc_id = none}
		endif
		if StructureContains Structure = (<new_part>) Detailable
			EditCASAppearance target = SetPart targetParams = {part = (<new_part>.Detailable) desc_id = none}
		endif
		if StructureContains Structure = (<new_part>) Logoable
			EditCASAppearance target = SetPart targetParams = {part = (<new_part>.Logoable) desc_id = none}
		endif
		if (<surrogate_part> = CAS_Select_A_Logo)
			GenerateCAGTexture single_texture = (<new_part>.with1)
		endif
		if NOT (GotParam play_current_anim)
			if NOT ($part_changed = 2)
				cas_add_item_to_appearance {
					part = <surrogate_part>
					desc_id = (($<part>) [<index>].desc_id)
					no_rebuild
				}
				trigger_CAS_rebuild_loop
			else
				cas_add_item_to_appearance {
					part = <surrogate_part>
					desc_id = (($<part>) [<index>].desc_id)
				}
			endif
		else
			cas_add_item_to_appearance {
				part = <surrogate_part>
				desc_id = (($<part>) [<index>].desc_id)
				no_rebuild
			}
		endif
	else
		if (<surrogate_part> = CAS_Drum_Detail && <current_desc_id> = none)
			cas_add_item_to_appearance \{part = CAS_Drum_Detail
				desc_id = none
				no_rebuild}
			trigger_CAS_rebuild_loop
		endif
	endif
	if GotParam \{play_current_anim}
		new_part = (($<part>) [<index>])
		if StructureContains Structure = (<new_part>) frontend_anim_name
			GetCurrentCASObject
			Band_PlaysimpleAnim name = <cas_object> Anim = (<new_part>.frontend_anim_name)
		endif
	endif
	clean_up_user_control_helpers
	if GotParam \{disable_rotation_zoom}
		no_rotate_zoom_text = {no_rotate_zoom_text}
	endif
	if GotParam \{show_editable}
		if GotParam \{only_rotate}
			car_helper_text = {car_helper_text_alt}
			no_rotate_zoom_text = {no_zoom_text}
		else
			car_helper_text = {car_helper_text_alt}
		endif
	elseif GotParam \{show_purchasable}
		if GotParam \{only_rotate}
			car_helper_text = {car_helper_text_purchase}
			no_rotate_zoom_text = {no_zoom_text}
		else
			car_helper_text = {car_helper_text_purchase}
			no_rotate_zoom_text = {no_rotate_zoom_text}
		endif
	else
		if GotParam \{only_rotate}
			car_helper_text = {car_helper_text}
			no_rotate_zoom_text = {no_zoom_text}
		else
			car_helper_text = {car_helper_text}
		endif
	endif
	menu_finish <car_helper_text> <no_rotate_zoom_text>
endscript
