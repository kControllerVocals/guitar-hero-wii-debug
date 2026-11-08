
script ui_create_cap_main \{album_cover = 0}
	spawnscriptnow ui_create_cap_main_spawned params = {<...>}
endscript

script ui_create_cap_main_spawned savegame = ($cas_current_savegame)
	if NOT GotParam \{old_save_checksum}
		globaltag_getarraychecksum savegame = <savegame> array_name = player_created_graphics_save
		old_save_checksum = <array_checksum>
		ui_event_add_params old_save_checksum = <old_save_checksum>
	endif
	if NOT ChecksumEquals a = <part> b = CAS_Band_Logo
		show_history = {show_history}
	else
		no_show_history = 1
	endif
	make_generic_menu {
		vmenu_id = create_cap_main_vmenu
		pad_back_script = cap_main_back
		pad_back_params = {album_cover = <album_cover>}
		title = <text>
		num_icons = <num_icons>
		<show_history>
	}
	add_generic_menu_icon_item {
		icon = icon_current
		text = qs("EDIT")
		choose_state = UIstate_cap_layers_list
		choose_state_data = {part = <part> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera>}
	}
	add_generic_menu_icon_item {
		icon = icon_save
		text = qs("SAVE")
		pad_choose_script = cap_main_choose_save
		pad_choose_params = {savegame = <savegame> slot_list = player_created_graphics_save save_cap part = <part> div_id = <div_id> hist_tex = icon_save text = qs("Save Design") no_show_history = <no_show_history>}
	}
	add_generic_menu_icon_item {
		icon = icon_load
		text = qs("LOAD")
		choose_state = UIstate_generic_dialogue
		choose_state_data = {
			is_popup
			title = qs("Load Design?")
			text = qs("By loading, your old design will be lost. Would you like to continue?")
			choose_yes_func = generic_event_replace
			choose_yes_params = {data = {state = UIstate_cas_save_slots savegame = <savegame> text = qs("Load") slot_list = player_created_graphics_save part = <part> div_id = <div_id> load_design hist_tex = icon_load camera_list = <camera_list> zoom_camera = <zoom_camera> no_show_history = <no_show_history>}}
		}
	}
	if ChecksumEquals a = <part> b = CAS_Band_Logo
		add_generic_menu_icon_item \{icon = icon_random
			text = qs("RANDOM")
			pad_choose_script = randomize_band_logo}
	endif
	add_generic_menu_icon_item {
		icon = icon_remove
		text = qs("CLEAR")
		choose_state = UIstate_generic_dialogue
		choose_state_data = {
			is_popup
			title = qs("Clear Design?")
			text = qs("By selecting clear your old design will be lost. Would you like to continue?")
			choose_yes_func = cap_clear_design
			choose_yes_params = {part = <part> div_id = <div_id>}
			highlight_no
		}
	}
	if ChecksumEquals a = <part> b = CAS_Band_Logo
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
		generic_menu_animate_in
	else
		setup_cas_menu_handlers vmenu_id = create_cap_main_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
		menu_finish \{car_helper_text}
	endif
	if GotParam \{cam_name}
		change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <cam_name>
		change \{generic_menu_block_input = 0}
	endif
	GetGlobalTags savegame = <savegame> cas_helper_dialogue param = visit_cap
	if (<visit_cap> = 0)
		printf \{qs("\LSHOW HELPER DIALOGUE")}
		SetGlobalTags savegame = <savegame> cas_helper_dialogue params = {visit_cap = 1}
		ui_event_wait \{event = menu_change
			data = {
				state = UIstate_helper_dialogue
				is_popup
				life = 30
				text = qs("The EDIT option allows you to design art with customizable shapes, in layers.  The SAVE and LOAD options allow created art to be available in all modes where you can apply graphics.")
			}}
	endif
endscript

script ui_return_cap_main 
	clean_up_user_control_helpers
	if ChecksumEquals a = <part> b = CAS_Band_Logo
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
	else
		menu_finish \{car_helper_text}
	endif
endscript

script ui_init_cap_main 
	if GotParam \{additional_init_script}
		<additional_init_script>
	endif
	if GotParam \{stance}
		GetCurrentCASObject
		if GotParam \{cas_object}
			BandManager_ChangeStance name = <cas_object> stance = <stance> no_wait
		endif
	endif
endscript

script ui_destroy_cap_main 
	destroy_generic_menu
endscript

script ui_deinit_cap_main 
	FlushAllCompositeTextures
	if GotParam \{additional_deinit_script}
		<additional_deinit_script>
	endif
	if GetCurrentCASObject
		if GotParam \{return_stance}
			BandManager_ChangeStance name = <cas_object> stance = <return_stance> no_wait
		else
			BandManager_ChangeStance name = <cas_object> stance = stance_frontend no_wait
		endif
	endif
endscript

script cas_load_graphic 
	cas_load_graphic_data layers = <layers> part = <part> div_id = <div_id>
	ui_event event = menu_change data = {state = UIstate_cap_layers_list part = <part> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera>}
endscript

script cas_load_graphic_data 
	RequireParams \{[
			layers
			part
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id> DoNotResolve
	endif
	if NOT GotParam \{sections}
		ScriptAssert qs("\LAsset is missing sections for this part %s") s = <part> DoNotResolve
	endif
	printf qs("\LDiv_id = %d") d = <div_id> DoNotResolve
	get_div_info part = <part> div_id = <div_id>
	if NOT GotParam \{target}
		printf \{qs("\LUnable to find target for specified CAP design, check part definition.")}
	endif
	printf qs("\Ltarget = %t") t = <target>
	if StructureContains Structure = (<layers> [0]) texture
		match_layers_texture sections = <sections> prof_texture = (<layers> [0].texture) target = <target> material = <material>
	elseif StructureContains Structure = (<layers> [0]) font
		match_layers_font prof_font = (<layers> [0].font) prof_text = (<layers> [0].text) sections = <sections> target = <target> material = <material>
	endif
	if NOT GotParam \{section_index}
		if NOT CD
			create_panel_message \{text = qs("Unable to match layer to a section, check part definition.")
				pos = (950.0, 600.0)
				rgba = [
					200
					50
					50
					255
				]
				scale = 0.5}
			printf \{qs("\LUnable to match layer to a section, check part definition.")}
		endif
	endif
	printf qs("\Lsection_index = %s") s = <section_index>
	if GotParam \{section_index}
		section = (<sections> [<section_index>])
		if GotParam \{cap}
			GetArraySize \{cap}
			i = 0
			begin
			if is_target_in_div target = (<cap> [<i>]) part = <part> div_id = <div_id>
				printf qs("\L~~~ IN CAP %i ~~~") i = <i>
				if is_matching_section cap = (<cap> [<i>]) section = <section>
					SetArrayElement ArrayName = cap index = <i> newvalue = {
						(<cap> [<i>])
						layers = <layers>
					}
					SetCASAppearanceCAP part = <part> cap = <cap>
					UpdateCASModelCAP part = <part>
					return
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
			FormatText checksumname = name '%s' s = (<sections> [<section_index>].base_tex)
			entry = {
				base_tex = <name>
				material = (<sections> [<section_index>].material)
				layers = <layers>
			}
			cap_set_target entry = <entry> section = <section>
			AddArrayElement array = <cap> element = <entry>
			SetCASAppearanceCAP part = <part> cap = <array>
			UpdateCASModelCAP part = <part>
			return
		else
			FormatText checksumname = name '%s' s = (<sections> [<section_index>].base_tex)
			entry = {
				base_tex = <name>
				material = (<sections> [<section_index>].material)
				layers = <layers>
			}
			cap_set_target entry = <entry> section = <section>
			SetCASAppearanceCAP part = <part> cap = [{<entry>}]
			UpdateCASModelCAP part = <part>
			return
		endif
	endif
endscript

script cap_new_design_worker 
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve
	endif
	remove_cap = 0
	if GotParam \{cap}
		newCAP = <cap>
		GetArraySize \{cap}
		i = 0
		begin
		capstruct = (<cap> [<i>])
		if is_target_in_div target = <capstruct> part = <part> div_id = <div_id>
			RemoveComponent \{name = layers
				structure_name = capstruct}
			SetArrayElement ArrayName = newCAP index = <i> newvalue = <capstruct>
			if NOT ((StructureContains Structure = <capstruct> pre_layer) || (StructureContains Structure = <capstruct> post_layer))
				RemoveArrayElement array = <newCAP> index = <i>
				newCAP = <array>
				if (<array_size> = 1)
					remove_cap = 1
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<remove_cap> = 1)
			SetCASAppearanceCAP part = <part>
		else
			SetCASAppearanceCAP part = <part> cap = <newCAP>
		endif
	endif
	UpdateCASModelCAP part = <part>
endscript

script cap_new_design 
	cap_new_design_worker <...>
	ui_event event = menu_change data = {state = UIstate_cap_layers_list part = <part> div_id = <div_id>}
endscript

script cap_clear_design 
	cap_new_design_worker <...>
	generic_event_back
endscript

script cap_main_exit_cleanup 
	ui_event \{event = menu_back}
endscript

script cap_main_back 
	if NOT (<album_cover> = 1)
		generic_event_back
	else
		LaunchEvent \{type = unfocus
			target = current_menu}
		cas_free_resources \{album_art
			no_loading_screen}
		jam_go_back_from_album_art
	endif
endscript

script cap_save_content \{num_states = 2
		album_cover = 0}
	if NOT (<album_cover> = 1)
		if GotParam \{back_steps}
			num_states = <back_steps>
		endif
		globaltag_getarraychecksum savegame = <savegame> array_name = player_created_graphics_save
		if NOT (<old_save_checksum> = <array_checksum>)
			cag_update_photo
			ui_memcard_autosave event = menu_back data = {num_states = <num_states> savegame = <savegame>}
		else
			if GotParam \{back_steps}
				cas_get_player_status
				if CheckForSignIn local controller_index = ($<player_status>.controller)
					ui_event event = menu_back data = {num_states = <num_states>}
				else
					generic_event_back
				endif
			else
				generic_event_back
			endif
		endif
	else
		LaunchEvent \{type = unfocus
			target = current_menu}
		cas_free_resources \{album_art
			no_loading_screen}
		jam_go_back_from_album_art
	endif
endscript

script cap_main_choose_save 
	extract_current_layers part = <part> div_id = <div_id>
	if NOT GotParam \{layers}
		generic_event_choose \{state = UIstate_generic_alert_popup
			data = {
				pad_choose_script = generic_event_back
				is_popup
				title = qs("No Design to Save")
				text = qs("You Cannot save an empty design!")
			}}
	else
		generic_event_choose data = {state = UIstate_cas_save_slots savegame = <savegame> <...>}
	endif
endscript
