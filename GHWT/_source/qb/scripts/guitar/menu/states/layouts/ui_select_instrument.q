
script ui_create_select_instrument 
	ui_select_instrument_continue <...>
endscript

script ui_destroy_select_instrument 
	generic_ui_destroy
endscript
instrument_list = {
	guitar = {
		text = qs("GUITAR")
		text_nl = 'guitar'
	}
	Bass = {
		text = qs("BASS")
		text_nl = 'bass'
	}
	drum = {
		text = qs("DRUM")
		text_nl = 'drum'
	}
	Vocals = {
		text = qs("VOCALS")
		text_nl = 'vocals'
	}
	Band = {
		text = qs("BAND")
		text_nl = 'band'
	}
}

script PollForMic 
	ui_get_controller_parts_allowed controller = ($primary_controller)
	old_allowed = <allowed>
	begin
	ui_get_controller_parts_allowed controller = ($primary_controller)
	printstruct <...>
	if NOT CompareStructs struct1 = <allowed> struct2 = <old_allowed>
		ui_event \{event = menu_refresh}
		return
	endif
	Wait \{10
		gameframes}
	repeat
endscript

script ui_select_instrument_continue 
	if GotParam \{from_hub}
		title = qs("CHANGE INSTRUMENT")
	else
		title = qs("INSTRUMENT")
	endif
	if GotParam \{from_top_rocker}
		screen = Guitarist
	else
		screen = Drummer
	endif
	if GotParam \{from_top_rocker}
		make_menu_frontend screen = <screen> title = <title> item_scale = 1.5 title_pos = (0.0, 60.0) pos = (-30.0, 0.0)
	else
		make_menu_frontend screen = <screen> title = <title>
	endif
	allow_guitar = 0
	allow_drum = 0
	allow_vocal = 0
	if GotParam \{from_top_rocker}
		allow_guitar = 1
		allow_drum = 1
		allow_vocal = 1
	endif
	ui_get_controller_parts_allowed controller = ($primary_controller)
	if StructureContains Structure = <allowed> guitar
		allow_guitar = 1
	endif
	if StructureContains Structure = <allowed> drum
		allow_drum = 1
	endif
	if StructureContains Structure = <allowed> Vocals
		allow_vocal = 1
	endif
	printstruct <allowed>
	if (<allow_guitar> = 1)
		add_menu_frontend_item {
			text = ($band_mode_available_text.Instruments [0])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = guitar from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
		add_menu_frontend_item {
			text = ($band_mode_available_text.Instruments [1])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = Bass from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	else
		add_menu_frontend_item {
			text = ($band_mode_available_text.Instruments [0])
			choose_state = uistate_select_instrument_warning
			choose_state_data = {instrument = guitar}
			rgba = [50 44 35 255]
		}
		add_menu_frontend_item {
			text = ($band_mode_available_text.Instruments [1])
			choose_state = uistate_select_instrument_warning
			choose_state_data = {instrument = Bass}
			rgba = [50 44 35 255]
		}
	endif
	if (<allow_drum> = 1)
		add_menu_frontend_item {
			text = ($band_mode_available_text.Instruments [2])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = drum from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	else
		add_menu_frontend_item {
			text = ($band_mode_available_text.Instruments [2])
			choose_state = uistate_select_instrument_warning
			choose_state_data = {instrument = drum}
			rgba = [50 44 35 255]
		}
	endif
	if (<allow_vocal> = 1)
		add_menu_frontend_item {
			text = ($band_mode_available_text.Instruments [3])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = Vocals from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	else
		add_menu_frontend_item {
			text = ($band_mode_available_text.Instruments [3])
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = Vocals from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
			rgba = [50 44 35 255]
		}
	endif
	if GotParam \{from_top_rocker}
		add_menu_frontend_item {
			text = qs("BAND")
			pad_choose_script = ui_select_instrument_done
			pad_choose_params = {instrument = Band from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
		}
	else
		current_menu :obj_spawnscript ui_select_instrument_check_controllers params = {from_hub = <from_hub> from_top_rocker = <from_top_rocker>}
	endif
	if NOT GotParam \{old_base_name}
		if NOT GotParam \{from_top_rocker}
			initial_focus = 0
			if IsGuitarController controller = ($primary_controler)
				<initial_focus> = 0
			elseif IsDrumController controller = ($primary_controller)
				<initial_focus> = 2
			else
				if (<allow_guitar> = 0)
					if (<allow_drum> = 0)
						<initial_focus> = 3
					else
						<initial_focus> = 2
					endif
				endif
			endif
			LaunchEvent type = focus target = current_menu data = {child_index = <initial_focus>}
		endif
	endif
	menu_finish
	current_menu :obj_spawnscript \{PollForMic}
endscript
career_last_chosen_part = guitar

script ui_select_instrument_done \{player = 1
		event = menu_change}
	begin
	if NOT Is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<instrument> = Vocals)
		allow_vocal = 0
		if GotParam \{from_top_rocker}
			allow_vocal = 1
		else
		endif
		ui_get_controller_parts_allowed controller = ($primary_controller)
		if StructureContains Structure = <allowed> Vocals
			allow_vocal = 1
		endif
		if (<allow_vocal> = 0)
			printf \{qs(0x6f0cd253)}
			generic_event_choose \{state = uistate_select_instrument_warning
				data = {
					instrument = Vocals
				}}
			return
		endif
	endif
	change player1_device = ($primary_controller)
	SetPlayerInfo <player> part = <instrument>
	change career_last_chosen_part = <instrument>
	SetPlayerInfo <player> controller = ($primary_controller)
	vocals_distribute_mics
	if ($game_mode = p1_career)
		player_status = player1_status
		switch <instrument>
			case guitar
			change \{current_progression_flag = Career_Guitar}
			change structurename = <player_status> part = guitar
			case Bass
			change \{current_progression_flag = Career_Bass}
			change structurename = <player_status> part = Bass
			case drum
			change \{current_progression_flag = Career_Drum}
			change structurename = <player_status> part = drum
			case Vocals
			change \{current_progression_flag = Career_Vocals}
			change structurename = <player_status> part = Vocals
		endswitch
	endif
	switch ($game_mode)
		case p1_quickplay
		generic_event_choose event = <event> state = uistate_setlist data = {from_top_rocker = <from_top_rocker>}
		case p2_pro_faceoff
		case p2_battle
		SetPlayerInfo 1 part = <instrument>
		SetPlayerInfo 2 part = <instrument>
		generic_event_choose event = <event> state = uistate_select_difficulty
		default
		if GotParam \{from_hub}
			generic_event_back \{state = UIstate_singleplayer_character_hub}
		else
			generic_event_choose event = <event> state = uistate_select_difficulty
		endif
	endswitch
endscript
