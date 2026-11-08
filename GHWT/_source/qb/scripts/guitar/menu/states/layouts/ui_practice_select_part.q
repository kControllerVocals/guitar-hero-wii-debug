
script ui_create_practice_select_part \{rhythm_track = 0}
	ui_get_controller_parts_allowed controller = ($primary_controller)
	make_generic_menu \{title = qs("PRACTICE PART")}
	get_song_rhythm_track_cfunc song = ($current_song)
	<parts> = [
		{text = qs("GUITAR")
			rhythm_text = qs("LEAD")
			id = cpp_guitar
			part = guitar
		}
		{text = qs("BASS")
			rhythm_text = qs("RHYTHM")
			id = cpp_bass
			part = Bass
		}
		{text = qs("DRUMS")
			id = cpp_drum
			part = drum
		}
		{text = qs("VOCALS")
			id = cpp_vocals
			part = Vocals
		}
	]
	<num_not_focusable> = 0
	GetArraySize <parts>
	<i> = 0
	begin
	<part_struct> = (<parts> [<i>])
	focus = {}
	if NOT StructureContains Structure = <allowed> (<part_struct>.part)
		focus = {not_focusable}
		<num_not_focusable> = (<num_not_focusable> + 1)
	endif
	if (<rhythm_track> = 1)
		<part_text> = (<part_struct>.rhythm_text)
	else
		<part_text> = (<part_struct>.text)
	endif
	if (<num_not_focusable> = 4)
		focus = {}
	endif
	add_generic_menu_text_item {
		text = <part_text>
		pad_choose_script = ui_practice_select_part
		pad_choose_params = {part = (<part_struct>.part)}
		<focus>
	}
	i = (<i> + 1)
	repeat <array_size>
	menu_finish
	current_menu :obj_spawnscript \{PollForMic}
endscript

script ui_destroy_practice_select_part 
	if ScreenElementExists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	generic_ui_destroy
endscript

script ui_practice_select_part 
	ui_get_controller_parts_allowed controller = ($primary_controller)
	if NOT StructureContains Structure = <allowed> <part>
		generic_event_choose state = uistate_select_instrument_warning data = {instrument = <part> controller = ($primary_controller) AddMainMenu = 0}
	endif
	change structurename = player1_status part = <part>
	vocals_distribute_mics
	set_song_section_array \{player = 1}
	generic_event_choose \{state = uistate_practice_select_difficulty}
endscript
