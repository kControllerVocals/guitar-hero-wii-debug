
script ui_create_character_face_deformation_options 
	ui_event_add_params hist_tex = <hist_tex>
	if NOT GetCASAppearancePart \{part = CAS_Body}
		ScriptAssert \{'%s not found'
			s = CAS_Body}
	endif
	if NOT GetActualCASOptionStruct part = CAS_Body desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = CAS_Body t = <desc_id>
	endif
	make_generic_menu {
		vmenu_id = create_character_face_deformation_options_vmenu
		title = <text>
		show_history
	}
	setup_cas_menu_handlers \{vmenu_id = create_character_face_deformation_options_vmenu
		zoom_camera = 'customize_null_Zoom'}
	GetArraySize \{option_array}
	i = 0
	begin
	if StructureContains Structure = (<option_array> [<i>]) bonemenu
		if find_bone_deform_info deform_bones = (<deform_bones>) group_name = ((<option_array> [<i>]).group_name)
			RemoveParameter \{invert}
			if StructureContains Structure = (<option_array> [<i>]) invert
				invert = {invert}
			endif
			if StructureContains Structure = (<option_array> [<i>]) icon_rot
				icon_rot = ((<option_array> [<i>]).icon_rot)
			else
				RemoveParameter \{icon_rot}
			endif
			if StructureContains Structure = (<option_array> [<i>]) icon
				cas_get_bone_slider_value part = CAS_Body group_name = ((<option_array> [<i>]).group_name)
				FormatText checksumname = widget_id 'widget_%i' i = <i>
				<set_up_down> = true
				if StructureContains Structure = (<option_array> [<i>]) pad_direction
					if (((<option_array> [<i>]).pad_direction) = horiz)
						<set_up_down> = false
						<pad_left_script> = update_bone_deformation
						<pad_left_params> = {part = CAS_Body group_name = ((<option_array> [<i>]).group_name)}
						<pad_right_script> = update_bone_deformation
						<pad_right_params> = {part = CAS_Body group_name = ((<option_array> [<i>]).group_name)}
						RemoveParameter \{pad_up_script}
						RemoveParameter \{pad_up_params}
						RemoveParameter \{pad_down_script}
						RemoveParameter \{pad_down_params}
					endif
				endif
				if (<set_up_down> = true)
					<pad_up_script> = update_bone_deformation
					<pad_up_params> = {part = CAS_Body group_name = ((<option_array> [<i>]).group_name)}
					<pad_down_script> = update_bone_deformation
					<pad_down_params> = {part = CAS_Body group_name = ((<option_array> [<i>]).group_name)}
					RemoveParameter \{pad_left_script}
					RemoveParameter \{pad_left_params}
					RemoveParameter \{pad_right_script}
					RemoveParameter \{pad_right_params}
				endif
				button_widget_add_item {
					widget_id = <widget_id>
					text = ((<option_array> [<i>]).text)
					button_icon = ((<option_array> [<i>]).icon)
					min = <min_slider>
					max = <max_slider>
					start_value = <slider>
					step = ((<option_array> [<i>]).step)
					pad_up_script = <pad_up_script>
					pad_up_params = <pad_up_params>
					pad_down_script = <pad_down_script>
					pad_down_params = <pad_down_params>
					pad_left_script = <pad_left_script>
					pad_left_params = <pad_left_params>
					pad_right_script = <pad_right_script>
					pad_right_params = <pad_right_params>
					fill_type = ((<option_array> [<i>]).fill_type)
					icon_rot = <icon_rot>
					<invert>
					init_helper_text = {car_helper_text}
					deinit_helper_text = {car_helper_text_extra}
					deinit_script = widget_restore_cap
					deinit_arams = no_rotate_zoom
					accept_script = widget_accept_cap
					accept_params = no_rotate_zoom
					init_script = widget_init_cap
					init_params = no_rotate_zoom
					zoom_camera = 'customize_null_Zoom'
				}
			else
				cas_create_bonemenu_slider {
					deform_info = <bone_deform_info>
					part = CAS_Body
					pad_back_script = ui_event
					pad_back_params = {event = menu_back}
				}
			endif
		endif
	endif
	if StructureContains Structure = (<option_array> [<i>]) replacemenu
		if StructureContains Structure = (<option_array> [<i>]) stance
			stance = ((<option_array> [<i>]).stance)
		endif
		if StructureContains Structure = (<option_array> [<i>]) return_stance
			return_stance = ((<option_array> [<i>]).return_stance)
		endif
		add_generic_menu_icon_item {
			icon = ((<option_array> [<i>]).hist_tex)
			text = ((<option_array> [<i>]).text)
			choose_state = UIstate_popout_select_part
			choose_state_data = {
				text = ((<option_array> [<i>]).text)
				part = ((<option_array> [<i>]).part)
				is_popup
				hist_tex = ((<option_array> [<i>]).hist_tex)
				stance = <stance>
				return_stance = <return_stance>
				disable_rotation_zoom = 1
				zoom_camera = 'customize_null_Zoom'
			}
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
	add_generic_menu_icon_item {
		icon = widget_default
		text = qs("DEFAULT")
		pad_choose_script = restore_group_defaults
		pad_choose_params = {option_array = <option_array> deform_bones = <deform_bones> part = CAS_Body}
		pad_choose_sound = NullSound
	}
	menu_finish \{car_helper_text_back
		no_zoom_text
		no_rotate_text}
endscript

script ui_return_character_face_deformation_options 
	menu_finish \{car_helper_text_back}
endscript

script ui_destroy_character_face_deformation_options 
	destroy_generic_menu
endscript

script ui_init_character_face_deformation_options 
	cas_bonemenu_begin \{part = CAS_Body}
	PushTemporaryCASAppearance
endscript

script ui_deinit_character_face_deformation_options 
	cas_bonemenu_exit \{part = CAS_Body}
	PopTemporaryCASAppearance
endscript

script restore_group_defaults 
	RequireParams \{[
			part
			option_array
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if GotParam \{bones}
		SoundEvent \{event = character_reset}
		GetArraySize \{option_array}
		i = 0
		begin
		if StructureContains Structure = (<option_array> [<i>]) group_name
			if StructureContains Structure = bones name = ((<option_array> [<i>]).group_name)
				RemoveComponent structure_name = bones name = ((<option_array> [<i>]).group_name)
			endif
		elseif StructureContains Structure = (<option_array> [<i>]) part
			if ChecksumEquals a = ((<option_array> [<i>]).part) b = CAS_Eyes
				cas_add_item_to_appearance \{part = CAS_Eyes
					desc_id = eyes_blue}
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	SetCASAppearanceBones part = <part> bones = <bones>
	cas_bonemenu_apply_changes
	GetArraySize \{option_array}
	i = 0
	begin
	if StructureContains Structure = ((<option_array>) [<i>]) bonemenu
		FormatText checksumname = widget_id 'widget_%i' i = <i>
		cas_get_bone_slider_value part = CAS_Body group_name = ((<option_array> [<i>]).group_name)
		button_widget_set_value widget_id = <widget_id> new_value = <slider>
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script update_bone_deformation 
	RequireParams \{[
			part
			group_name
		]
		all}
	GetCASAppearancePart part = <part>
	if NOT GotParam \{bones}
		bones = {}
	endif
	UpdateStructElement struct = <bones> element = <group_name> value = <value>
	SetCASAppearanceBones part = <part> bones = <newstruct>
	UpdateCurrentCASModel buildScript = reskin_model_from_appearance buildscriptparams = {kill_objects = <kill_objects>}
endscript
