
script ui_create_customize_character_proportions 
	if NOT GetCASAppearancePart \{part = cas_physique}
		ScriptAssert \{'%s not found'
			s = cas_physique}
	endif
	if NOT GetActualCASOptionStruct part = cas_physique desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = cas_physique t = <desc_id>
	endif
	make_generic_menu \{vmenu_id = create_customize_character_proportions_vmenu
		title = qs("Proportions")
		num_icons = 2
		show_history}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_proportions_vmenu
		camera_list = [
			'customize_character'
			'customize_character_R'
			'customize_character_B'
			'customize_character_L'
		]
		no_zoom}
	if GotParam \{preset_builds}
		find_phyique_number
		printf \{qs("\L#################Preset Physiques! ######################")}
		GetArraySize \{preset_builds}
		button_widget_add_item {
			widget_id = Physique_widget
			text = qs("PHYSIQUE")
			button_icon = widget_spread
			start_value = <physique_num>
			min = 0
			max = (<array_size> -1)
			step = 1
			pad_left_script = update_physique
			pad_left_params = {part = cas_physique preset_builds = <preset_builds>}
			pad_right_script = update_physique
			pad_right_params = {part = cas_physique preset_builds = <preset_builds>}
			fill_type = `Left to Right`
			deinit_script = widget_restore_cap
			deinit_params = only_rotate
			accept_script = widget_accept_cap
			accept_params = only_rotate
			init_script = widget_init_cap
			init_params = only_rotate
			camera_list = ['customize_character' 'customize_character_R' 'customize_character_B' 'customize_character_L']
			only_rotate
		}
	endif
	GetArraySize ($cas_physique_bone_options)
	i = 0
	begin
	if StructureContains Structure = (($cas_physique_bone_options) [<i>]) bonemenu
		if find_bone_deform_info deform_bones = (<deform_bones>) group_name = ((($cas_physique_bone_options) [<i>]).group_name)
			if StructureContains Structure = (($cas_physique_bone_options) [<i>]) icon
				cas_get_bone_slider_value part = cas_physique group_name = ((($cas_physique_bone_options) [<i>]).group_name)
				FormatText checksumname = widget_id 'widget_%i' i = <i>
				button_widget_add_item {
					widget_id = <widget_id>
					text = ((($cas_physique_bone_options) [<i>]).text)
					button_icon = ((($cas_physique_bone_options) [<i>]).icon)
					min = <min_slider>
					max = <max_slider>
					start_value = <slider>
					step = ((($cas_physique_bone_options) [<i>]).step)
					pad_up_script = update_bone_deformation
					pad_up_params = {part = cas_physique group_name = ((($cas_physique_bone_options) [<i>]).group_name)}
					pad_down_script = update_bone_deformation
					pad_down_params = {part = cas_physique group_name = ((($cas_physique_bone_options) [<i>]).group_name)}
					fill_type = ((($cas_physique_bone_options) [<i>]).fill_type)
					deinit_script = widget_restore_cap
					deinit_params = only_rotate
					accept_script = widget_accept_cap
					accept_params = only_rotate
					init_script = widget_init_cap
					init_params = only_rotate
					camera_list = ['customize_character' 'customize_character_R' 'customize_character_B' 'customize_character_L']
					only_rotate
				}
			else
				cas_create_bonemenu_slider {
					deform_info = <bone_deform_info>
					part = cas_physique
					pad_back_script = ui_event
					pad_back_params = {event = menu_back}
				}
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	add_generic_menu_icon_item {
		icon = widget_default
		text = qs("RESTORE DEFAULTS")
		pad_choose_script = reset_physique_to_default
		pad_choose_params = {part = cas_physique deform_bones = <deform_bones>}
		pad_choose_sound = NullSound
	}
	cas_bonemenu_begin \{part = cas_physique}
	menu_finish \{car_helper_text_back_rotate}
endscript

script ui_destroy_customize_character_proportions 
	destroy_generic_menu
endscript

script ui_init_customize_character_proportions 
	PushTemporaryCASAppearance
endscript

script ui_deinit_customize_character_proportions 
	cas_bonemenu_exit \{part = cas_physique}
	PopTemporaryCASAppearance
endscript

script reset_physique_to_default 
	reset_bone_deform_info part = <part>
	reset_additional_bone_deform_info part = <part>
	SoundEvent \{event = character_reset}
	GetArraySize ($cas_physique_bone_options)
	i = 0
	begin
	if StructureContains Structure = (($cas_physique_bone_options) [<i>]) bonemenu
		cas_refresh_given_bone_slider {
			part = <part>
			deform_array = <deform_bones>
			group_name = ((($cas_physique_bone_options) [<i>]).group_name)
		}
		reset_proportion_widget i = <i> deform_array = <deform_bones>
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script update_physique 
	GetCASAppearancePart part = <part>
	CastToInteger \{value}
	SetCASAppearanceAdditionalBones part = <part> additional_bone_transforms = (<preset_builds> [<value>].additional_bone_transforms)
	UpdateCurrentCASModel buildScript = reskin_model_from_appearance buildscriptparams = {kill_objects = <kill_objects>}
endscript

script reset_proportion_widget 
	if StructureContains Structure = (($cas_physique_bone_options) [<i>]) icon
		FormatText checksumname = widget_id 'widget_%i' i = <i>
		button_widget_set_value widget_id = <widget_id> new_value = 0
	endif
	button_widget_set_value \{widget_id = Physique_widget
		new_value = 0}
endscript

script find_phyique_number 
	if NOT GetCASAppearancePart \{part = cas_physique}
		ScriptAssert \{'%s not found'
			s = cas_physique}
	endif
	if NOT GetActualCASOptionStruct part = cas_physique desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = cas_physique t = <desc_id>
	endif
	if GotParam \{additional_bone_transforms}
		GenerateChecksumFromArray \{ArrayName = additional_bone_transforms}
		add_bone_checksum = <array_checksum>
		if GotParam \{preset_builds}
			GetArraySize <preset_builds>
			i = 0
			begin
			preset_bones = ((<preset_builds> [<i>]).additional_bone_transforms)
			GenerateChecksumFromArray \{ArrayName = preset_bones}
			if (ChecksumEquals a = <add_bone_checksum> b = <array_checksum>)
				printf qs("\LPhysique matches preset number %i") i = <i>
				return physique_num = <i>
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	printf \{qs("\LUnable to find Physique match")}
	return \{physique_num = 0}
endscript

script find_physique_height \{slider = 0}
	cas_get_bone_slider_value \{part = cas_physique
		group_name = Height}
	return Height = <slider>
endscript
