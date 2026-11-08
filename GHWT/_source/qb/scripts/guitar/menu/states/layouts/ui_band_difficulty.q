
script ui_create_band_difficulty 
	destroy_loading_screen
	change menu_flow_locked = ($menu_flow_locked + 1)
	spawnscriptnow \{task_menu_default_anim_in
		params = {
			base_name = 'band_hub'
		}}
	if GotParam \{p2}
		cas_set_object_node_pos \{player = 1
			node = z_Soundcheck_TRG_Waypoint_Player1_Start}
		cas_set_object_node_pos \{player = 2
			node = z_Soundcheck_TRG_Waypoint_Player4_Start}
		get_savegame_from_controller controller = ($player1_status.controller)
		cas_queue_new_character_profile id = ($player1_status.character_id) player = 1 savegame = <savegame>
		printf 'requesting %s for %d' s = <character_id> d = 1
		get_savegame_from_controller controller = ($player2_status.controller)
		cas_queue_new_character_profile id = ($player2_status.character_id) player = 2 savegame = <savegame>
		printf 'requesting %s for %d' s = <character_id> d = 2
	else
		cas_set_object_node_pos \{player = 1
			node = z_Soundcheck_TRG_Waypoint_Player1_Start}
		cas_set_object_node_pos \{player = 2
			node = z_Soundcheck_TRG_Waypoint_Player2_Start}
		cas_set_object_node_pos \{player = 3
			node = z_Soundcheck_TRG_Waypoint_Player3_Start}
		cas_set_object_node_pos \{player = 4
			node = z_Soundcheck_TRG_Waypoint_Player4_Start}
		i = 0
		begin
		controller = ($band_mode_actual_devices [<i>])
		SetPlayerInfo (<i> + 1) controller = <controller>
		if (<controller> < 4)
			GetPlayerInfo (<i> + 1) is_local_client
			if (<is_local_client> = 1)
				GetPlayerInfo (<i> + 1) character_id
				get_savegame_from_controller controller = <controller>
				cas_queue_new_character_profile id = <character_id> player = (<controller> + 1) savegame = <savegame>
				printf 'requesting %s for %d' s = <character_id> d = (<controller> + 1)
			endif
		endif
		i = (<i> + 1)
		repeat ($current_num_players)
	endif
	set_focus_color
	set_unfocus_color
	CreateScreenElement {
		parent = root_window
		id = MyInterfaceElement
		type = DescInterface
		desc = 'band_play'
		tags = {continue_data = <continue_data>}
	}
	MyInterfaceElement :SE_GetProps
	if MyInterfaceElement :Desc_ResolveAlias \{name = alias_hmenu}
		band_hmenu = <resolved_id>
	endif
	if GotParam \{p2}
		<band_hmenu> :SE_SetProps spacing_between = 400
	endif
	menu_array = []
	desc_array = []
	ps2_players_added = 0
	i = 0
	j = 1
	begin
	ResolveScreenElementId id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	if GotParam \{p2}
		if (<i> = 2)
			DestroyScreenElement id = <resolved_id>
			i = 1
		endif
	endif
	if ScreenElementExists id = <resolved_id>
		curr_desc = <resolved_id>
		AddArrayElement array = <desc_array> element = <resolved_id>
		desc_array = <array>
		<resolved_id> :Desc_ResolveAlias name = alias_menu
		continue = 0
		begin
		GetPlayerInfo <j> controller
		if GotParam \{p2}
			<cont_check> = 0
			begin
			if (<cont_check> = <controller>)
				continue = 1
				break
			endif
			<cont_check> = (<cont_check> + 1)
			repeat 4
			if (<continue> = 1)
				break
			endif
		else
			if (<i> = <controller>)
				continue = 1
				break
			endif
		endif
		j = (<j> + 1)
		repeat ($current_num_players)
		if GotParam \{p2}
			j = 2
		else
			j = 1
		endif
		if (<continue> = 1)
			if NOT GotParam \{p2}
				ui_get_controller_parts_allowed controller = <i>
			else
				switch ($g_head_to_head_instrument_type)
					case guitar
					allowed = {guitar Bass}
					case Drums
					allowed = {drum}
					case Vocals
					GameMode_GetType
					if (<type> != battle)
						if ($allow_controller_for_all_instruments = 0)
							allowed = {Vocals}
						else
							allowed = {guitar Bass drum Vocals}
						endif
					else
						allowed = {}
					endif
				endswitch
				if ($allow_controller_for_all_instruments = 1)
					allowed = {guitar Bass drum Vocals}
				endif
			endif
			if GotParam \{p2}
				<resolved_id> :SetTags {
					menu = instrument
					instrument = none
					difficulty = none
					controller = <controller>
					allowed = <allowed>
					index = <i>
				}
			else
				player_status = ($player_status_array [(<ps2_players_added> + 1)])
				cas_queue_new_character_profile player = (<i> + 1) id = ($<player_status>.character_id) savegame = 0
				<resolved_id> :SetTags {
					menu = instrument
					instrument = none
					difficulty = none
					controller = <controller>
					allowed = <allowed>
					index = <i>
				}
				controller = <controller>
			endif
			if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
				<curr_desc> :SE_SetProps leader_indicator_alpha = 0
			elseif (<controller> = $band_mode_current_leader)
				<curr_desc> :SE_SetProps leader_indicator_alpha = 1
			endif
			<resolved_id> :SetTags {index = <i>}
			<resolved_id> :SetProps event_handlers = [
				{pad_up ui_band_mode_scroll_sound params = {up}}
				{pad_down ui_band_mode_scroll_sound params = {down}}
			]
			AddArrayElement array = <menu_array> element = <resolved_id>
			menu_array = <array>
			ps2_players_added = (<ps2_players_added> + 1)
		else
			<resolved_id> :SE_GetParentId
			<parent_id> :SE_SetProps not_focusable alpha = 0.0
			<curr_desc> :SE_SetProps reposition_pos = (0.0, 500.0)
		endif
	endif
	i = (<i> + 1)
	repeat 4
	MyInterfaceElement :SetTags {menus = <menu_array> descs = <desc_array>}
	GetArraySize <menu_array>
	if (<array_size> > 0)
		i = 0
		begin
		resolved_id = (<menu_array> [<i>])
		<resolved_id> :GetSingleTag controller
		<resolved_id> :GetSingleTag index
		spawnscriptnow ui_band_difficulty_delay_input params = {<...>}
		name = qs("\L")
		NetSessionFunc func = get_gamertag params = {controller = <controller>}
		if GotParam \{name}
			band_gamertag_rename gamertag = <name> index = <index>
		endif
		<resolved_id> :Obj_SpawnScriptNow ui_band_instrument_check_controllers
		i = (<i> + 1)
		repeat <array_size>
	endif
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		MyInterfaceElement :SE_SetProps \{ticker_alpha = 0.0}
	endif
	LaunchEvent \{type = focus
		target = MyInterfaceElement}
	ui_band_mode_helper_text
	change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_band_instrument_check_controllers 
	GetTags
	<my_allowed> = <allowed>
	begin
	if (<menu> = instrument)
		ui_get_controller_parts_allowed controller = <controller> filter_by_character
		if NOT CompareStructs struct1 = <allowed> struct2 = <my_allowed>
			SetTags allowed = <allowed>
			<my_allowed> = <allowed>
			ui_band_mode_update_menu
		endif
		Wait \{10
			gameframes}
	else
		return
	endif
	repeat
endscript

script ui_destroy_band_difficulty 
	KillSpawnedScript \{name = ui_band_difficulty_delay_input}
	DestroyScreenElement \{id = MyInterfaceElement}
	generic_ui_destroy
endscript

script ui_band_difficulty_continue 
	if Is_ui_event_running
		return
	endif
	begin
	if NOT ScriptIsRunning \{trigger_CAS_rebuild_loop}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	cas_queue_wait
	GetTags
	num_ready = 0
	player = 1
	temp_parts = [arse , arse , arse , arse]
	GetArraySize <menus>
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :GetTags
	if (<menu> = ready2)
		<num_ready> = (<num_ready> + 1)
		get_player_num_from_controller controller_index = <controller>
		SetArrayElement ArrayName = temp_parts index = (<player_num> -1) newvalue = <instrument>
		SetPlayerInfo <player_num> difficulty = <difficulty>
	endif
	i = (<i> + 1)
	repeat <array_size>
	GameMode_GetProperty \{prop = faceoff}
	if (<faceoff> = true)
		if (<instrument> = Vocals)
			if NOT vocals_mic_distribution_is_valid
				GetPlayerInfo <invalid_mic_player> controller
				printf 'ui_band_difficulty_continue: Player %p (controller %c) is missing their mic.' p = <invalid_mic_player> c = <controller>
				generic_event_choose state = uistate_select_instrument_warning data = {instrument = Vocals controller = <controller>}
				return
			endif
		endif
	endif
	if NOT (<num_ready> = $current_num_players)
		return
	else
		register_new_progression_atoms \{Career_Band}
		Wait \{10
			gameframe}
	endif
	<player> = 1
	begin
	part = (<temp_parts> [(<player> - 1)])
	if (<part> = arse)
		ScriptAssert \{'Yes, something is very wrong here'}
	endif
	SetPlayerInfo <player> part = <part>
	player = (<player> + 1)
	repeat <num_ready>
	cas_destroy_all_characters
	if (<faceoff> = false)
		vocals_distribute_mics
	endif
	if NOT vocals_mic_distribution_is_valid
		GetPlayerInfo <invalid_mic_player> controller
		generic_event_choose state = uistate_select_instrument_warning data = {instrument = Vocals controller = <controller>}
		return
	endif
	if GotParam \{continue_data}
		generic_event_choose no_sound data = {<continue_data>}
	else
		generic_event_choose \{state = uistate_play_song}
	endif
endscript

script ui_deinit_band_difficulty 
	cancel_all_cas_loads
endscript

script ui_band_difficulty_delay_input 
	Wait \{1
		seconds}
	if ScreenElementExists id = <resolved_id>
		if GotParam \{p2}
			RunScriptOnScreenElement id = <resolved_id> ui_band_mode_create_menu params = {player_index = <i>}
		else
			RunScriptOnScreenElement id = <resolved_id> ui_band_mode_create_menu
		endif
	endif
endscript
