CAS_Temp_Parts = [
]

script ui_create_customize_character_sub_sections 
	switch (<part>)
		case CAS_Torso_Art
		icon = BodyArt_Chest
		cam_name = 'customize_tat_torso'
		sections = CAS_Body_Art_Sections
		case CAS_Right_Arm_Art
		icon = BodyArt_RightArm
		cam_name = 'customize_character'
		sections = CAS_Body_Art_Sections
		case CAS_Left_Arm_Art
		icon = BodyArt_LeftArm
		cam_name = 'customize_tat_left_arm'
		sections = CAS_Body_Art_Sections
		case CAS_Drum_Detail
		icon = icon_cadrm_skin
		cam_name = 'cad_select_skin'
		sections = CAS_Drum_Skin_Sections
		inclusion_part = CAS_Drums
		case CAS_Drum_Finish
		icon = icon_cadrm_shell
		cam_name = 'cad_select_shell'
		sections = CAS_Drum_Shell_Sections
		inclusion_part = CAS_Drums
	endswitch
	make_generic_menu {
		vmenu_id = create_customize_character_body_art_vmenu
		title = <text>
		num_icons = 2
		show_history
	}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_body_art_vmenu
		no_rotate
		no_zoom}
	GetArraySize ($<sections>)
	i = 0
	begin
	RemoveParameter \{not_focusable}
	if GotParam \{inclusion_part}
		ui_customize_character_sub_sections_get_included_count part = <part> parts_list = ($<sections> [<i>].parts) inclusion_part = <inclusion_part>
		if (<included_count> < 2)
			not_focusable = not_focusable
		endif
	endif
	add_generic_menu_icon_item {
		icon = <icon>
		text = ($<sections> [<i>].text)
		pad_choose_script = ui_select_object_subset_and_continue
		pad_choose_params = {<...> parts_list = ($<sections> [<i>].parts) inclusion_part = <inclusion_part>}
		<not_focusable>
	}
	i = (<i> + 1)
	repeat <array_size>
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
	LaunchEvent type = focus target = create_customize_character_body_art_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_customize_character_sub_sections 
	GetCurrentCASObject
	if GotParam \{return_stance}
		BandManager_ChangeStance name = <cas_object> stance = <return_stance> no_wait
	else
		BandManager_ChangeStance name = <cas_object> stance = stance_frontend no_wait
	endif
	destroy_generic_menu
endscript

script ui_select_object_subset_and_continue 
	change \{CAS_Temp_Parts = [
		]}
	GetArraySize (<parts_list>)
	i = 0
	begin
	temp_desc = (<parts_list> [<i>])
	GetActualCASOptionStruct part = <part> desc_id = <temp_desc>
	temp_struct = {desc_id = <temp_desc> frontend_desc = <frontend_desc>}
	if GotParam \{materials}
		temp_struct = {<temp_struct> materials = <materials>}
	endif
	if GotParam \{hidden}
		temp_struct = {<temp_struct> hidden}
	endif
	if GotParam \{inclusion_part}
		get_inclusion_list body_part = <inclusion_part>
		if cas_in_inclusion_list inclusion = <inclusion> part_name = <part> part_desc_id = <temp_desc>
			AddArrayElement array = ($CAS_Temp_Parts) element = <temp_struct>
			change CAS_Temp_Parts = <array>
		endif
	else
		AddArrayElement array = ($CAS_Temp_Parts) element = <temp_struct>
		change CAS_Temp_Parts = <array>
	endif
	i = (<i> + 1)
	repeat (<array_size>)
	if (<part> = CAS_Right_Arm_Art)
		ui_event event = menu_change data = {state = UIstate_popout_select_part text = <text> cam_name = 'customize_tat_Right_arm' part = CAS_Temp_Parts surrogate_part = <part> num_icons = 2 is_popup icon_offset = (100.0, 120.0) list_offset = (100.0, 155.0) color_wheel = ($clothing_colorwheel) stance = <stance> additional_init_script = <additional_init_script> additional_deinit_script = <additional_deinit_script> return_stance = <return_stance> disable_rotation_zoom = 1 no_rotate no_zoom pull_back_distance = <pull_back_distance> play_current_anim = <play_current_anim>}
	else
		ui_event event = menu_change data = {state = UIstate_popout_select_part text = <text> cam_name = <cam_name> part = CAS_Temp_Parts surrogate_part = <part> num_icons = 2 is_popup icon_offset = (100.0, 120.0) list_offset = (100.0, 155.0) color_wheel = ($clothing_colorwheel) stance = <stance> additional_init_script = <additional_init_script> additional_deinit_script = <additional_deinit_script> return_stance = <return_stance> disable_rotation_zoom = 1 no_rotate no_zoom pull_back_distance = <pull_back_distance> play_current_anim = <play_current_anim>}
	endif
endscript

script ui_init_customize_character_sub_sections 
	if GotParam \{additional_init_script}
		<additional_init_script>
	endif
endscript

script ui_deinit_customize_character_sub_sections 
	if GotParam \{additional_deinit_script}
		<additional_deinit_script>
	endif
endscript

script ui_return_customize_character_sub_sections 
	if (<part> = CAS_Right_Arm_Art)
		spawnscriptnow \{task_menu_default_anim_in
			params = {
				base_name = 'customize_character'
			}}
	endif
	menu_finish \{car_helper_text
		no_rotate_text
		no_zoom_text}
endscript

script ui_customize_character_sub_sections_get_included_count 
	GetArraySize (<parts_list>)
	included_count = 0
	i = 0
	begin
	temp_desc = (<parts_list> [<i>])
	get_inclusion_list body_part = <inclusion_part>
	if cas_in_inclusion_list inclusion = <inclusion> part_name = <part> part_desc_id = <temp_desc>
		included_count = (<included_count> + 1)
	endif
	i = (<i> + 1)
	repeat (<array_size>)
	return included_count = <included_count>
endscript
