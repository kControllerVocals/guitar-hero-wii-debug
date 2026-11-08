
script ui_create_cas_save_slots 
	if NOT GotParam \{savegame}
		savegame = ($cas_current_savegame)
	endif
	RequireParams \{[
			slot_list
		]
		all}
	if NOT GotParam \{no_show_history}
		show_history = {show_history}
	endif
	make_generic_menu {
		title = <text>
		icon = <hist_tex>
		<show_history>
		no_up_down_sound_handlers
	}
	if GotParam \{load_guitar}
		pad_triangle_script = load_guitar_save_edit
		pad_triangle_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
		pad_choose_script = load_guitar_save_apply
		pad_choose_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
	elseif GotParam \{save_guitar}
		pad_choose_script = exit_save_instrument_worker
		pad_choose_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
	elseif GotParam \{load_drum}
		pad_choose_script = load_drum_save
		pad_choose_params = {instrument_info = <instrument_info> list = <slot_list> savegame = <savegame>}
	elseif GotParam \{load_design}
		pad_triangle_script = load_cap_design
		pad_triangle_params = {list = <slot_list> part = <part> div_id = <div_id> savegame = <savegame>}
		pad_choose_script = apply_cap_design
		pad_choose_params = {list = <slot_list> part = <part> div_id = <div_id> savegame = <savegame>}
	elseif GotParam \{save_cap}
		pad_choose_script = save_cap_design_worker
		pad_choose_params = {list = <slot_list> part = <part> div_id = <div_id> savegame = <savegame>}
	endif
	globaltag_getarraysize savegame = <savegame> array_name = <slot_list>
	if ((GotParam load_design) || (GotParam save_cap))
		max_saves = ($max_num_logo_saves)
	else
		max_saves = ($max_num_instrument_saves)
	endif
	FormatText TextName = text qs("(%i/%j)") i = <array_size> j = <max_saves>
	CreateScreenElement {
		type = TextBlockElement
		parent = root_window
		id = num_slots
		font = ($test_menu_font)
		text = <text>
		pos = (525.0, 175.0)
		rgba = [250 250 250 255]
		dims = (375.0, 50.0)
		scale = 0.7
	}
	<num_items> = <array_size>
	if (<array_size> > 0)
		i = 0
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = <slot_list> index = <i>
		if GotParam \{disable_delete}
			slots_add_item {
				index = <i>
				text = (<element>.name)
				pad_choose_script = <pad_choose_script>
				pad_choose_params = {<pad_choose_params> index = <i>}
				additional_focus_script = save_slots_set_helper_text
			}
		else
			slots_add_item {
				index = <i>
				text = (<element>.name)
				pad_choose_script = <pad_choose_script>
				pad_choose_params = {<pad_choose_params> index = <i> overwrite}
				pad_square_script = generic_event_choose
				pad_square_params = {
					data = {
						state = UIstate_generic_dialogue
						is_popup
						title = qs("Delete Entry?")
						text = qs("Are you sure you want to delete this entry?")
						choose_yes_func = {
							slot_delete_entry params = {list = <slot_list> index = <i> savegame = <savegame>}
						}
					}
				}
				additional_focus_script = save_slots_set_helper_text_delete
			}
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		if ((GotParam load_guitar) || (GotParam load_drum) || (GotParam load_design))
			<num_items> = 1
			slots_add_item {
				index = <array_size>
				text = qs("No Saves")
				pad_choose_script = generic_event_back
				additional_focus_script = save_slots_set_helper_text
			}
		endif
	endif
	if (<array_size> < <max_saves>)
		if GotParam \{save_guitar}
			<num_items> = (<num_items> + 1)
			slots_add_item {
				index = <array_size>
				text = qs("New Save")
				pad_choose_script = exit_save_instrument
				pad_choose_params = {index = <array_size> instrument_info = <instrument_info> list = <slot_list> savegame = <savegame> no_show_history = <no_show_history>}
				additional_focus_script = save_slots_set_helper_text
			}
		elseif GotParam \{save_cap}
			<num_items> = (<num_items> + 1)
			slots_add_item {
				index = <array_size>
				text = qs("New Save")
				pad_choose_script = save_cap_design
				pad_choose_params = {index = <array_size> list = <slot_list> part = <part> div_id = <div_id> savegame = <savegame> no_show_history = <no_show_history>}
				additional_focus_script = save_slots_set_helper_text
			}
		endif
	endif
	if (<num_items> > 1)
		add_generic_menu_up_down_sound_handlers
	endif
	LaunchEvent type = focus target = current_menu data = {child_index = <loaded_index>}
	displaySprite \{parent = generic_menu
		tex = boot_brick_bg
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z = 0}
	displaySprite \{parent = generic_menu
		tex = gradient_256
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z = 1
		alpha = 0.5
		blendMode = subtract
		flip_h}
	menu_finish \{no_helper_text}
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100000}
	if NOT GotParam \{disable_delete}
		add_user_control_helper \{text = qs("DELETE")
			button = Blue
			z = 100000}
	endif
endscript

script ui_return_cas_save_slots 
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100000}
	if NOT GotParam \{disable_delete}
		add_user_control_helper \{text = qs("DELETE")
			button = Blue
			z = 100000}
	endif
endscript

script ui_destroy_cas_save_slots 
	if ScreenElementExists \{id = num_slots}
		DestroyScreenElement \{id = num_slots}
	endif
	destroy_generic_menu
endscript

script slots_add_item \{focus_script = slot_focus_script
		unfocus_script = slot_unfocus_script}
	CreateScreenElement {
		type = DescInterface
		parent = current_menu
		desc = 'generic_menu_slot_item'
		<not_focusable>
		slot_text_text = <text>
		autoSizeDims = true
	}
	SetScreenElementProps {
		id = <id>
		event_handlers = [{focus <focus_script> params = {id = <id> index = <index> additional_focus_script = <additional_focus_script> additional_focus_params = <additional_focus_params>}}
			{unfocus <unfocus_script> params = {id = <id> index = <index>}}
		]
	}
	if GotParam \{pad_choose_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_choose <pad_choose_script> params = <pad_choose_params>}
				{pad_choose generic_menu_pad_choose_sound}
			]
		}
	endif
	if GotParam \{pad_triangle_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_option2 <pad_triangle_script> params = <pad_triangle_params>}
				{pad_option2 generic_menu_pad_choose_sound}
			]
		}
	endif
	if GotParam \{pad_square_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_option <pad_square_script> params = <pad_square_params>}
				{pad_option generic_menu_pad_choose_sound}
			]
		}
	endif
	if GotParam \{pad_start_script}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_start <pad_start_script> params = <pad_start_params>}
				{pad_start generic_menu_pad_choose_sound}
			]
		}
	endif
endscript

script load_guitar_save_edit 
	load_guitar_save <...>
	ui_event event = menu_replace data = {state = UIstate_cag_custom instrument_info = <instrument_info> loaded_index = <index>}
endscript

script load_guitar_save_apply 
	load_guitar_save <...>
	generic_event_back
endscript

script load_guitar_save 
	RequireParams \{[
			list
			index
		]
		all}
	printf \{qs("\LLoad Guitar Save")}
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	guitar_save = <element>
	if StructureContains Structure = <guitar_save> body_part
		SetCASAppearancePartInstance part = (<instrument_info>.body_part) part_instance = (<guitar_save>.body_part)
	endif
	if StructureContains Structure = <guitar_save> neck_part
		SetCASAppearancePartInstance part = (<instrument_info>.neck_part) part_instance = (<guitar_save>.neck_part)
	endif
	if StructureContains Structure = <guitar_save> head_part
		SetCASAppearancePartInstance part = (<instrument_info>.head_part) part_instance = (<guitar_save>.head_part)
	endif
	if StructureContains Structure = <guitar_save> pick_guard_part
		SetCASAppearancePartInstance part = (<instrument_info>.pick_guard_part) part_instance = (<guitar_save>.pick_guard_part)
	endif
	if StructureContains Structure = <guitar_save> pickups_part
		SetCASAppearancePartInstance part = (<instrument_info>.pickups_part) part_instance = (<guitar_save>.pickups_part)
	endif
	if StructureContains Structure = <guitar_save> knobs_part
		SetCASAppearancePartInstance part = (<instrument_info>.knobs_part) part_instance = (<guitar_save>.knobs_part)
	endif
	if StructureContains Structure = <guitar_save> bridge_part
		SetCASAppearancePartInstance part = (<instrument_info>.bridge_part) part_instance = (<guitar_save>.bridge_part)
	endif
	if StructureContains Structure = <guitar_save> highway_part
		SetCASAppearancePartInstance part = (<instrument_info>.highway_part) part_instance = (<guitar_save>.highway_part)
	endif
	if StructureContains Structure = <guitar_save> stand_part
		SetCASAppearancePartInstance part = (<instrument_info>.stand_part) part_instance = (<guitar_save>.stand_part)
	endif
	if StructureContains Structure = <guitar_save> detail_part
		SetCASAppearancePartInstance part = (<instrument_info>.detail_part) part_instance = (<guitar_save>.detail_part)
	endif
	if StructureContains Structure = <guitar_save> finish_part
		SetCASAppearancePartInstance part = (<instrument_info>.finish_part) part_instance = (<guitar_save>.finish_part)
	endif
	if StructureContains Structure = <guitar_save> logo_part
		SetCASAppearancePartInstance part = (<instrument_info>.logo_part) part_instance = (<guitar_save>.logo_part)
	endif
	if StructureContains Structure = <guitar_save> head_finish_part
		SetCASAppearancePartInstance part = (<instrument_info>.head_finish_part) part_instance = (<guitar_save>.head_finish_part)
	endif
	if StructureContains Structure = <guitar_save> neck_finish_part
		SetCASAppearancePartInstance part = (<instrument_info>.neck_finish_part) part_instance = (<guitar_save>.neck_finish_part)
	endif
	if StructureContains Structure = <guitar_save> pickgaurd_finish_part
		SetCASAppearancePartInstance part = (<instrument_info>.pickgaurd_finish_part) part_instance = (<guitar_save>.pickgaurd_finish_part)
	endif
	if StructureContains Structure = <guitar_save> head_detail_part
		SetCASAppearancePartInstance part = (<instrument_info>.head_detail_part) part_instance = (<guitar_save>.head_detail_part)
	endif
	printcurrentappearance
	RebuildCurrentCASModel
endscript

script slot_focus_script 
	if ScreenElementExists id = <id>
		<id> :SE_SetProps {
			slot_text_font = fontgrid_text_a6_fire
			slot_text_material = sys_fontgrid_text_A6_fire_sys_fontgrid_text_A6_fire
			slot_bg_texture = slot_boarder
			slot_text_rgba = [255 255 255 255]
		}
	endif
	if GotParam \{additional_focus_script}
		<additional_focus_script> <additional_focus_params>
	endif
endscript

script slot_unfocus_script 
	if ScreenElementExists id = <id>
		<id> :SE_SetProps {
			slot_text_font = fontgrid_text_a6
			slot_text_material = null
			slot_bg_texture = slot_boarder_no
			slot_text_rgba = [100 88 71 255]
		}
	endif
endscript

script slot_delete_entry 
	spawnscriptnow slot_delete_entry_worker params = <...>
endscript

script slot_delete_entry_worker 
	RequireParams \{[
			list
			index
		]
		all}
	globaltag_removearrayelement savegame = <savegame> array_name = <list> index = <index>
	ui_event_block \{event = menu_back}
	Wait \{1
		gameframe}
	ui_event \{event = menu_refresh}
endscript

script exit_save_instrument 
	ui_event event = menu_replace data = {state = UIstate_cas_text_entry choose_script = exit_save_instrument_worker choose_params = {<...>} no_show_history = <no_show_history>}
endscript

script exit_save_instrument_worker 
	RequireParams \{[
			list
			index
			instrument_info
			savegame
		]
		all}
	if NOT GotParam \{overwrite}
		if NOT is_name_unique list = <list> name = <text> savegame = <savegame>
			ui_event_wait \{event = menu_change
				data = {
					state = UIstate_generic_alert_popup
					is_popup
					title = qs("Name is not unique?")
					text = qs("The name you entered is not unique, please enter a unique name.")
					pad_choose_script = save_slots_return_from_warning
				}}
			return
		endif
	endif
	if StructureContains Structure = <instrument_info> body_part
		if GetCASAppearancePartInstance part = (<instrument_info>.body_part)
			entry = {
				<entry>
				body_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> neck_part
		if GetCASAppearancePartInstance part = (<instrument_info>.neck_part)
			entry = {
				<entry>
				neck_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> head_part
		if GetCASAppearancePartInstance part = (<instrument_info>.head_part)
			entry = {
				<entry>
				head_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> pick_guard_part
		if GetCASAppearancePartInstance part = (<instrument_info>.pick_guard_part)
			entry = {
				<entry>
				pick_guard_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> pickups_part
		if GetCASAppearancePartInstance part = (<instrument_info>.pickups_part)
			entry = {
				<entry>
				pickups_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> knobs_part
		if GetCASAppearancePartInstance part = (<instrument_info>.knobs_part)
			entry = {
				<entry>
				knobs_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> bridge_part
		if GetCASAppearancePartInstance part = (<instrument_info>.bridge_part)
			entry = {
				<entry>
				bridge_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> highway_part
		if GetCASAppearancePartInstance part = (<instrument_info>.highway_part)
			entry = {
				<entry>
				highway_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> stick_part
		if GetCASAppearancePartInstance part = (<instrument_info>.stick_part)
			entry = {
				<entry>
				stick_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> stand_part
		if GetCASAppearancePartInstance part = (<instrument_info>.stand_part)
			entry = {
				<entry>
				stand_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> detail_part
		if GetCASAppearancePartInstance part = (<instrument_info>.detail_part)
			entry = {
				<entry>
				detail_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> finish_part
		if GetCASAppearancePartInstance part = (<instrument_info>.finish_part)
			entry = {
				<entry>
				finish_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> logo_part
		if GetCASAppearancePartInstance part = (<instrument_info>.logo_part)
			entry = {
				<entry>
				logo_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> head_finish_part
		if GetCASAppearancePartInstance part = (<instrument_info>.head_finish_part)
			entry = {
				<entry>
				head_finish_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> neck_finish_part
		if GetCASAppearancePartInstance part = (<instrument_info>.neck_finish_part)
			entry = {
				<entry>
				neck_finish_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> pickgaurd_finish_part
		if GetCASAppearancePartInstance part = (<instrument_info>.pickgaurd_finish_part)
			entry = {
				<entry>
				pickgaurd_finish_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	if StructureContains Structure = <instrument_info> head_detail_part
		if GetCASAppearancePartInstance part = (<instrument_info>.head_detail_part)
			entry = {
				<entry>
				head_detail_part = {desc_id = (<part_instance>.desc_id) chosen_materials = (<part_instance>.chosen_materials)}
			}
		endif
	endif
	globaltag_getarraysize savegame = <savegame> array_name = <list>
	if (<index> > (<array_size> -1))
		entry = {
			<entry>
			name = <text>
		}
		globaltag_addarrayelement savegame = <savegame> array_name = <list> element = <entry>
		cag_update_photo
		ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
	else
		globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
		entry = {
			<entry>
			name = (<element>.name)
		}
		create_new_generic_popup {
			popup_type = yes_no_menu
			yes_func = set_save_instrument_return
			yes_func_params = {list = <list> index = <index> entry = <entry> savegame = <savegame>}
			no_func = destroy_generic_popup
			focus_no
			text = qs("Are you sure you want to overwrite this save?")
			title = qs("Overwrite Save?")
			title_effect
		}
	endif
	if (<instrument_info>.desc_id = guitar)
		Achievements_ONE_OF_A_KIND_AXE controller = ($primary_controller)
	elseif (<instrument_info>.desc_id = drum)
		Achievements_CUSTOM_BEATS controller = ($primary_controller)
	endif
endscript

script set_save_instrument_return 
	destroy_generic_popup
	globaltag_setarrayelement savegame = <savegame> array_name = <list> index = <index> element = <entry>
	cag_update_photo
	ui_memcard_autosave_replace event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
endscript

script load_drum_save 
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	drum_save = <element>
	if StructureContains Structure = <drum_save> body_part
		SetCASAppearancePartInstance part = (<instrument_info>.body_part) part_instance = (<drum_save>.body_part)
	endif
	if StructureContains Structure = <drum_save> highway_part
		SetCASAppearancePartInstance part = (<instrument_info>.highway_part) part_instance = (<drum_save>.highway_part)
	endif
	if StructureContains Structure = <drum_save> stick_part
		SetCASAppearancePartInstance part = (<instrument_info>.stick_part) part_instance = (<drum_save>.stick_part)
	endif
	if StructureContains Structure = <drum_save> detail_part
		SetCASAppearancePartInstance part = (<instrument_info>.detail_part) part_instance = (<drum_save>.detail_part)
	endif
	if StructureContains Structure = <drum_save> finish_part
		SetCASAppearancePartInstance part = (<instrument_info>.finish_part) part_instance = (<drum_save>.finish_part)
	endif
	RebuildCurrentCASModel
	ui_event event = menu_replace data = {state = UIstate_cadrm_hub instrument_info = <instrument_info> loaded_index = <index>}
endscript

script apply_cap_design 
	change \{Achievements_modified_logo = 0}
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	change edit_graphic_layer_infos = (<element>.layers)
	printstruct \{$edit_graphic_layer_infos}
	generic_event_back
endscript

script load_cap_design 
	RequireParams \{[
			list
			index
			savegame
		]
		all}
	globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
	change edit_graphic_layer_infos = (<element>.layers)
	edit_graphic_prepare_sprite_infos
endscript

script save_cap_design 
	ui_event event = menu_replace data = {state = UIstate_cas_text_entry choose_script = save_cap_design_worker choose_params = {<...>} no_show_history = <no_show_history>}
endscript

script save_cap_design_worker 
	if NOT GotParam \{overwrite}
		if NOT is_name_unique list = <list> name = <text> savegame = <savegame>
			ui_event_wait \{event = menu_change
				data = {
					state = UIstate_generic_alert_popup
					is_popup
					title = qs("Name is not unique?")
					text = $wii_cas_save_slots
					pad_choose_script = save_slots_return_from_warning
				}}
			return
		endif
	endif
	globaltag_getarraysize savegame = <savegame> array_name = <list>
	entry = {layers = ($edit_graphic_layer_infos)}
	if (<index> > (<array_size> -1))
		entry = {
			<entry>
			name = <text>
		}
		globaltag_addarrayelement savegame = <savegame> array_name = <list> element = <entry>
		cag_update_photo
		ui_memcard_autosave event = menu_back data = {num_states = 2 savegame = <savegame> requested_autosave = 1}
	else
		globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <index>
		entry = {
			<entry>
			name = (<element>.name)
		}
		create_new_generic_popup {
			popup_type = yes_no_menu
			yes_func = set_save_cap_return
			yes_func_params = {list = <list> index = <index> entry = <entry> savegame = <savegame>}
			no_func = destroy_generic_popup
			focus_no
			text = qs("Are you sure you want to overwrite this save?")
			title = qs("Overwrite Save?")
			title_effect
		}
	endif
endscript

script set_save_cap_return 
	destroy_generic_popup
	globaltag_setarrayelement savegame = <savegame> array_name = <list> index = <index> element = <entry>
	cag_update_photo
	ui_memcard_autosave_replace event = menu_back data = {num_states = 1 savegame = <savegame> requested_autosave = 1}
endscript

script is_name_unique 
	RequireParams \{[
			list
			name
			savegame
		]
		all}
	globaltag_getarraysize savegame = <savegame> array_name = <list>
	if (<array_size> > 0)
		i = 0
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = <list> index = <i>
		if ((<element>.name) = <name>)
			return \{false}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{true}
endscript

script save_slots_return_from_warning 
	generic_event_back
	SpawnScriptLater \{lock_to_text_entry}
endscript

script save_slots_set_helper_text_delete 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100000}
	if NOT GotParam \{disable_delete}
		add_user_control_helper \{text = qs("DELETE")
			button = Blue
			z = 100000}
	endif
endscript

script save_slots_set_helper_text 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100000}
endscript
