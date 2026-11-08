
script ui_create_cag_custom_body_types 
	start_CAS_rebuild_loop
	RequireParams \{[
			part
		]
		all}
	make_list_menu {
		vmenu_id = create_cag_custom_body_types_vmenu
		pad_back_script = generic_exit_restore
		parent = <container_id>
		icon = <hist_tex>
	}
	setup_cas_menu_handlers vmenu_id = create_cag_custom_body_types_vmenu camera_list = <camera_list> no_zoom
	get_part_current_desc_id part = <part>
	current_part = 0
	num_parts_added = 0
	GetArraySize ($<part>)
	i = 0
	begin
	if cas_item_is_visible part = <part> part_index = <i>
		if is_part_unlocked part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
			if (((($<part>) [<i>]).desc_id) = <current_desc_id>)
				current_part = <num_parts_added>
			endif
			if NOT is_part_purchased part = <part> desc_id = ((($<part>) [<i>]).desc_id) savegame = ($cas_current_savegame)
				price = ((($<part>) [<i>]).price)
				FormatText TextName = pad_choose_dialogue qs("Would you like to purchase this %s?") s = ((($<part>) [<i>]).frontend_desc)
			endif
			add_list_item {
				text = (($<part> [<i>]).frontend_desc)
				pad_choose_script = generic_event_back
				pad_choose_params = {part = <part>}
				camera_list = <camera_list>
				zoom_camera = <zoom_camera>
				additional_focus_script = add_cag_part
				additional_focus_params = {part = <part> index = <i>}
				price = <price>
				pad_choose_dialogue = <pad_choose_dialogue>
			}
			if GotParam \{price}
				RemoveParameter \{price}
			endif
			if GotParam \{pad_choose_dialogue}
				RemoveParameter \{pad_choose_dialogue}
			endif
			if GotParam \{pad_back_dialogue}
				RemoveParameter \{pad_back_dialogue}
			endif
			num_parts_added = (<num_parts_added> + 1)
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_cancel
		no_zoom_text}
	LaunchEvent type = focus target = create_cag_custom_body_types_vmenu data = {child_index = <current_part>}
endscript

script ui_destroy_cag_custom_body_types 
	generic_list_destroy
	stop_CAS_rebuild_loop
endscript

script ui_init_cag_custom_body_types 
	PushTemporaryCASAppearance
	ui_load_cas_rawpak part = <part>
endscript

script ui_deinit_cag_custom_body_types 
	FlushAllCompositeTextures
	PopTemporaryCASAppearance
	cleanup_cas_menu_handlers
endscript

script add_cag_part 
	RequireParams \{[
			part
			index
		]
		all}
	KillAllCompositeTextures
	DumpCompositeScratchTextures
	get_part_current_desc_id part = <part>
	if NOT (((($<part>) [<index>]).desc_id) = <current_desc_id>)
		if GetActualCASOptionStruct part = <part> desc_id = ($<part> [<index>].desc_id)
			if GotParam \{RandomizeFinish}
				GetArraySize (<inclusion>)
				loop_size = (<array_size>)
				i = 0
				valid_array = none
				begin
				filter = (<inclusion> [<i>])
				if (<filter>.part = <RandomizeFinish>)
					valid_array = (<filter>.valid)
					break
				endif
				i = (<i> + 1)
				repeat (<loop_size>)
				if (<valid_array> = none)
					ScriptAssert \{qs(0x9413ac76)}
				endif
				GetArraySize (<valid_array>)
				GetRandomValue name = rand_val a = 0 b = (<array_size> - 1) Integer
				new_desc_id = (<valid_array> [<rand_val>])
				EditCASAppearance target = SetPart targetParams = {part = <RandomizeFinish> desc_id = <new_desc_id>}
			endif
			if NOT GotParam \{Finishable}
				if (<part> = CAS_Guitar_Body)
					EditCASAppearance \{target = SetPart
						targetParams = {
							part = CAS_Guitar_Finish
							desc_id = empty
						}}
				elseif (<part> = CAS_Bass_Body)
					EditCASAppearance \{target = SetPart
						targetParams = {
							part = CAS_Bass_Finish
							desc_id = empty
						}}
				endif
			endif
			if NOT GotParam \{Detailable}
				if (<part> = CAS_Guitar_Body)
					EditCASAppearance \{target = SetPart
						targetParams = {
							part = CAS_Guitar_Body_Detail
							desc_id = empty
						}}
				elseif (<part> = CAS_Bass_Body)
					EditCASAppearance \{target = SetPart
						targetParams = {
							part = CAS_Bass_Body_Detail
							desc_id = empty
						}}
				endif
			endif
			if NOT GotParam \{Logoable}
				if (<part> = CAS_Guitar_Body)
					EditCASAppearance \{target = SetPart
						targetParams = {
							part = cas_guitar_logo
							desc_id = none
						}}
				elseif (<part> = CAS_Bass_Body)
					EditCASAppearance \{target = SetPart
						targetParams = {
							part = CAS_Bass_Logo
							desc_id = none
						}}
				endif
			endif
		endif
		cas_part_will_conflict part_name = <part> part_desc_id = ($<part> [<index>].desc_id)
		if GotParam \{change_parts}
			printf \{qs("\L~~~~~~CONFLICTED PART~~~~~")}
			GetArraySize \{change_parts}
			if (<array_size> > 0)
				i = 0
				begin
				cas_add_item_to_appearance part = (<change_parts> [<i>].part) desc_id = (<change_parts> [<i>].desc_id) no_rebuild
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
		cas_add_item_to_appearance part = <part> desc_id = ($<part> [<index>].desc_id) incremental no_rebuild
		trigger_CAS_rebuild_loop
	endif
endscript

script add_cag_part_spin_guitar 
	GetCurrentCASObject
	if is_female_char
		Band_PlaysimpleAnim name = <cas_object> Anim = car_female_select_guitar_turn_flip BlendDuration = 1.0
	else
		Band_PlaysimpleAnim name = <cas_object> Anim = CAR_male_Select_guitar_turn_flip BlendDuration = 1.0
	endif
endscript
