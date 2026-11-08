
script ui_create_character_hub 
	set_cas_loading_setup \{setup = h2h}
	spawnscriptnow ui_create_character_hub_spawned params = {<...>}
endscript

script ui_create_character_hub_spawned 
	Wait \{1
		seconds}
	band_builder_clear_random_appearances \{cpu_only}
	band_builder_clear_setup
	if ($player1_status.bot_play = 1)
		if NOT ($player1_status.bot_original_controller = -1)
			change structurename = player1_status controller = ($player1_status.bot_original_controller)
		endif
	endif
	if ($player2_status.bot_play = 1)
		if NOT ($player2_status.bot_original_controller = -1)
			change structurename = player2_status controller = ($player2_status.bot_original_controller)
		endif
	endif
	if ($player3_status.bot_play = 1)
		if NOT ($player3_status.bot_original_controller = -1)
			change structurename = player3_status controller = ($player3_status.bot_original_controller)
		endif
	endif
	if ($player4_status.bot_play = 1)
		if NOT ($player4_status.bot_original_controller = -1)
			change structurename = player4_status controller = ($player4_status.bot_original_controller)
		endif
	endif
	cas_free_resources_camera_fix \{base_name = 'character_hub'}
	cas_set_object_node_pos \{player = 1
		node = z_Soundcheck_TRG_Waypoint_Player1_Start}
	cas_set_object_node_pos \{player = 2
		node = z_Soundcheck_TRG_Waypoint_Player4_Start}
	change band_mode_current_leader = ($player1_status.controller)
	ui_band_mode_show_character \{player = 1}
	ui_band_mode_show_character \{player = 2}
	CreateScreenElement \{parent = root_window
		id = MyInterfaceElement
		type = DescInterface
		desc = 'band_play'}
	array = []
	if NOT ($is_network_game)
		if NOT ($game_mode = p2_faceoff)
			AddArrayElement array = <array> element = {pad_start ui_band_mode_continue}
		endif
	endif
	if (GotParam net_career_lobby)
		if (IsHost)
			AddArrayElement array = <array> element = {pad_start net_ui_band_mode_continue}
		endif
	endif
	MyInterfaceElement :SetProps event_handlers = <array>
	if MyInterfaceElement :Desc_ResolveAlias \{name = alias_hmenu}
		band_hmenu = <resolved_id>
	endif
	<band_hmenu> :SE_SetProps spacing_between = 400
	begin
	ResolveScreenElementId id = [
		{id = <band_hmenu>}
		{index = 2}
	]
	<resolved_id> :Die
	repeat 2
	menu_array = []
	desc_array = []
	i = 0
	begin
	ResolveScreenElementId id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	AddArrayElement array = <desc_array> element = <resolved_id>
	desc_array = <array>
	<resolved_id> :Desc_ResolveAlias name = alias_menu
	GetPlayerInfo (<i> + 1) controller
	<resolved_id> :SetTags {
		menu = p2_root
		instrument = none
		difficulty = easy
		controller = <controller>
		allowed = <allowed>
		index = <i>
	}
	<resolved_id> :SetProps event_handlers = [
		{pad_up ui_band_mode_scroll_sound params = {up}}
		{pad_down ui_band_mode_scroll_sound params = {down}}
	]
	AddArrayElement array = <menu_array> element = <resolved_id>
	menu_array = <array>
	i = (<i> + 1)
	repeat 2
	MyInterfaceElement :SetTags {menus = <menu_array> descs = <desc_array>}
	i = 0
	begin
	ResolveScreenElementId id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	<resolved_id> :Desc_ResolveAlias name = alias_menu
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		RunScriptOnScreenElement id = <resolved_id> ui_band_mode_create_menu params = {player_index = <i>}
	else
		RunScriptOnScreenElement id = <resolved_id> ui_band_mode_create_menu
	endif
	i = (<i> + 1)
	repeat 2
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		MyInterfaceElement :SE_SetProps \{ticker_alpha = 0.0}
	endif
	LaunchEvent \{type = focus
		target = MyInterfaceElement}
	ui_band_mode_helper_text
endscript

script ui_destroy_character_hub 
	DestroyScreenElement \{id = MyInterfaceElement}
	generic_ui_destroy
	cleanup_all_photo_assets
endscript

script ui_init_character_hub 
endscript

script ui_deinit_character_hub 
	cas_destroy_all_characters
endscript

script ui_character_hub_continue 
	GetTags
	num_ready = 0
	GetArraySize <menus>
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :GetTags
	if (<menu> = p2_ready)
		<num_ready> = (<num_ready> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<num_ready> = 2)
		cas_queue_wait
		cancel_all_cas_loads
		if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
			SoundEvent \{event = Band_Mode_Career_Ready}
			generic_event_choose \{no_sound
				state = uistate_setlist
				data = {
					no_jamsession
					use_all_controllers
				}}
		else
			generic_event_choose \{state = uistate_gig_posters}
		endif
	endif
endscript
