
script ui_create_cas_color_edit title = qs("Change Color") controller = ($primary_controller)
	ui_event_add_params hist_tex = <hist_tex>
	if GotParam \{restore_skin}
		GetArraySize <part_materials>
		if (<array_size> = 0)
			ScriptAssert \{'No part_materials!'}
		endif
		if NOT GotParam \{material_index}
			material_index = 0
		endif
		color_edit_get_current_colors part = <part> part_material = (<part_materials> [<material_index>])
		make_generic_menu {
			vmenu_id = create_cas_color_edit_vmenu
			pad_option2_script = color_edit_restore_default
			pad_option2_params = {part = <part> part_material = (<part_materials> [<material_index>]) restore_skin}
			title = <title>
			num_icons = <num_icons>
			show_history
		}
	else
		make_generic_menu {
			vmenu_id = create_cas_color_edit_vmenu
			pad_option2_script = color_edit_restore_default
			pad_option2_params = {part = <part>}
			title = <title>
			num_icons = <num_icons>
			show_history
		}
	endif
	if GotParam \{only_rotate}
		setup_cas_menu_handlers vmenu_id = create_cas_color_edit_vmenu camera_list = <camera_list> no_zoom
	elseif GotParam \{no_rotate_zoom}
		setup_cas_menu_handlers vmenu_id = create_cas_color_edit_vmenu camera_list = <camera_list> no_zoom
	else
		setup_cas_menu_handlers vmenu_id = create_cas_color_edit_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
	if GotParam \{cam_name}
		spawnscriptnow task_menu_default_anim_in params = {base_name = <cam_name>}
	endif
	ResolveBodySpecificPartInAppearance part = <part>
	GetArraySize <part_materials>
	if (<array_size> = 0)
		ScriptAssert \{'No part_materials!'}
	endif
	if NOT GotParam \{material_index}
		material_index = 0
	endif
	color_edit_get_current_colors part = <part> part_material = (<part_materials> [<material_index>])
	colorwheel_add_item {
		scale = 0.6
		pad_choose_script = color_edit_exit_accept
		pad_choose_params = {num_states = <num_states> material_index = <material_index> part = <part> part_materials = <part_materials> return_stance = <return_stance>}
		increment_focus_script = color_edit_focus_change
		increment_focus_params = {part = <part> part_material = (<part_materials> [<material_index>])}
		initial_rgb = <rgb>
		special_exit_script = color_edit_restore_previous
		lookup_table = <color_wheel>
	}
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100000}
	add_user_control_helper \{text = qs("CANCEL")
		button = red
		z = 100000}
	add_user_control_helper \{text = qs("RESET")
		button = Yellow
		z = 100000}
	if ((IsGuitarController controller = <controller>) || (IsDrumController controller = <controller>))
		if GotParam \{only_rotate}
			add_user_control_helper \{text = qs("ROTATE")
				button = Blue
				z = 100000}
		elseif no_rotate_zoom
		else
			add_user_control_helper \{text = qs("ROTATE")
				button = Blue
				z = 100000}
			add_user_control_helper \{text = qs("ZOOM")
				button = Orange
				z = 100000}
		endif
	else
		if GotParam \{only_rotate}
			add_user_control_helper \{text = qs("ROTATE")
				button = Blue
				z = 100000}
		elseif no_rotate_zoom
		else
			add_user_control_helper \{text = qs("ROTATE")
				button = Blue
				z = 100000}
			add_user_control_helper \{text = qs("ZOOM")
				button = Orange
				z = 100000}
		endif
	endif
	LaunchEvent \{type = focus
		target = create_cas_color_edit_vmenu
		data = {
			child_index = 0
		}}
	LaunchEvent \{type = pad_choose}
	if ScreenElementExists \{id = color_wheel_menu_item}
		if GotParam \{only_rotate}
			setup_cas_menu_handlers vmenu_id = color_wheel_menu_item no_zoom = <no_zoom> camera_list = <camera_list> no_zoom
		elseif GotParam \{no_rotate_zoom}
			setup_cas_menu_handlers vmenu_id = color_wheel_menu_item no_zoom = <no_zoom> camera_list = <camera_list> no_zoom
		else
			setup_cas_menu_handlers vmenu_id = color_wheel_menu_item no_zoom = <no_zoom> camera_list = <camera_list> zoom_camera = <zoom_camera>
		endif
	endif
endscript

script ui_return_cas_color_edit 
	menu_finish \{car_helper_text_extra}
endscript

script ui_destroy_cas_color_edit 
	destroy_generic_menu
endscript

script ui_init_cas_color_edit 
	ui_event_add_params \{hist_tex = menu_history_color_edit}
	PushTemporaryCASAppearance
endscript

script ui_deinit_cas_color_edit 
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
	endif
endscript

script color_edit_focus_change 
	if GetCASAppearancePart part = <part>
		if GetActualCASOptionStruct part = <part> desc_id = <desc_id>
			if GotParam \{color_all_materials}
				table_entry = ($color_lookup_table.<color>)
				RGBtoHSV rgb = (<table_entry>.diffuse)
				h = (<hsv> [0])
				s = (<hsv> [1])
				v = (<hsv> [2])
				CastToInteger \{h}
				CastToInteger \{s}
				CastToInteger \{v}
				colormenu_set_hsv part = <part> h = <h> s = <s> v = <v>
			endif
		endif
	endif
	SetCASAppearanceMaterial part = <part> material = <part_material> value = <color>
	if ((<part> = CAS_Female_Hair) || (<part> = CAS_Male_Hair))
		if GetCASAppearancePart part = <part>
			cas_propogate_hair_color
		endif
	endif
	cas_propogate_guitar_color_to part = <part>
	cas_propogate_color_to_other_parts \{part = CAS_Body
		other_parts = $ps2_fleshy_parts_array}
	UpdateCurrentCASModel \{buildScript = color_model_from_appearance}
endscript

script color_edit_get_current_colors 
	RequireParams \{[
			part
			part_material
		]
		all}
	if GetCASMaterialValue part = <part> material = <part_material>
		lookup = ($color_lookup_table.<value>)
		if GotParam \{lookup}
			if StructureContains Structure = <lookup> diffuse
				diff_r = (<lookup>.diffuse [0])
				diff_g = (<lookup>.diffuse [1])
				diff_b = (<lookup>.diffuse [2])
				if IsFloat <diff_r>
					diff_r = (<diff_r> * 255.0)
					diff_g = (<diff_g> * 255.0)
					diff_b = (<diff_b> * 255.0)
					CastToInteger \{diff_r}
					CastToInteger \{diff_g}
					CastToInteger \{diff_b}
				endif
				rgb = [0 0 0]
				SetArrayElement ArrayName = rgb index = 0 newvalue = <diff_r>
				SetArrayElement ArrayName = rgb index = 1 newvalue = <diff_g>
				SetArrayElement ArrayName = rgb index = 2 newvalue = <diff_b>
			endif
		else
			printstruct <...>
		endif
	endif
	if NOT GotParam \{rgb}
		AddArrayElement array = [] element = ($default_cas_hue)
		AddArrayElement array = <array> element = ($default_cas_sat)
		AddArrayElement array = <array> element = ($default_cas_value)
		HSVtoRGB hsv = <array>
	endif
	return rgb = <rgb>
endscript

script color_edit_exit_accept \{num_states = 2}
	GetArraySize <part_materials>
	material_index = (<material_index> + 1)
	if (<material_index> < <array_size>)
		ui_event event = menu_change data = {
			state = UIstate_cas_color_edit
			part = <part>
			part_materials = <part_materials>
			material_index = <material_index>
			hist_tex = menu_history_color_edit
			num_states = (<num_states> + 1)
			return_stance = <return_stance>
		}
	else
		generic_event_back data = {num_states = <num_states>}
	endif
endscript

script color_edit_restore_default 
	RequireParams \{[
			part
		]
		all}
	GetCASAppearancePart part = <part>
	RemoveParameter \{chosen_materials}
	SetCASAppearancePartInstance part = <part> part_instance = {<...>}
	if GotParam \{restore_skin}
		SetCASAppearanceMaterial part = <part> material = <part_material> value = skin_black3
	endif
	cas_propogate_color_to_other_parts \{part = CAS_Body
		other_parts = $ps2_fleshy_parts_array}
	UpdateCurrentCASModel \{buildScript = color_model_from_appearance}
	generic_event_back
endscript

script color_edit_restore_previous 
	RestoreTopTemporaryCASAppearance \{update_color}
	generic_event_back
endscript
