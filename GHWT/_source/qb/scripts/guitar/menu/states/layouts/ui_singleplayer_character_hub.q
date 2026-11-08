
script ui_create_singleplayer_character_hub 
	printf \{'ui_create_singleplayer_character_hub'}
	set_cas_loading_setup \{setup = single}
	spawnscriptnow ui_create_singleplayer_character_hub_spawned params = <...>
endscript

script ui_create_singleplayer_character_hub_spawned 
	change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	cas_free_resources_camera_fix \{base_name = 'singleplayer_character_hub'}
	if init_singleplayer_character_hub pass_to_gigboard = <pass_to_gigboard> ent_player_status = <ent_player_status>
		player_status = player1_status
		switch ($<player_status>.part)
			case guitar
			hist_tex = icon_progression_guitar
			case Bass
			hist_tex = icon_progression_bass
			case drum
			hist_tex = icon_progression_drums
			case Vocals
			hist_tex = icon_progression_vocals
		endswitch
		make_generic_menu {
			title = qs("VIP LOUNGE")
			show_history
			num_icons = 0
			hist_tex = <hist_tex>
			vmenu_id = create_singleplayer_character_hub_vmenu
			pad_back_script = generic_event_back_block
		}
		cas_set_object_node_pos player = ($cas_current_player) node = Z_Soundcheck_TRG_Waypoint_CAR_Select
		add_generic_menu_icon_item \{text = qs("PLAY SHOW")
			icon = play_show
			pad_choose_script = singleplayer_player_show}
		add_generic_menu_icon_item {
			text = qs("SELECT ROCKER")
			icon = select_hero
			choose_state = uistate_character_selection
			choose_state_data = {object = <player>}
		}
		get_savegame_from_player_status player_status = <player_status>
		if NOT profile_can_be_modified id = ($<player_status>.character_id) savegame = <savegame>
			focusable_flags = {not_focusable}
		endif
		add_generic_menu_icon_item {
			text = qs("EDIT ROCKER")
			icon = icon_EditCharacter
			pad_choose_script = single_player_character_hub_edit_character
			<focusable_flags>
		}
		add_generic_menu_icon_item \{text = qs("VIDEOS")
			icon = vids
			choose_state = uistate_bonus_videos}
		add_generic_menu_icon_item \{text = qs("BAND INFO")
			icon = manage_band
			choose_state = uistate_band_name_logo}
		add_generic_menu_icon_item \{text = qs("ROCK RANKS")
			icon = cash_milestone_icon_012
			choose_state = UIstate_cash_milestones}
		if IsDrumController controller = ($primary_controller)
			focusable_flags = {not_focusable}
		endif
		menu_finish
		LaunchEvent \{type = focus
			target = create_singleplayer_character_hub_vmenu}
		create_band_money_display
		spawnscriptnow \{task_menu_default_anim_in
			params = {
				base_name = 'character_selection'
			}}
	endif
	destroy_loading_screen
endscript

script single_player_character_hub_edit_character 
	hide_glitch \{num_frames = 20}
	external_edit_character
endscript

script ui_destroy_singleplayer_character_hub 
	destroy_generic_menu
	destroy_band_money_display
endscript

script ui_deinit_singleplayer_character_hub 
	hide_glitch \{num_frames = 20}
	cas_fix_cameras_for_game
endscript
first_character_hub_enter = 0

script init_singleplayer_character_hub \{player = 1}
	FormatText checksumname = player_status 'player%d_status' d = <player>
	get_savegame_from_player_status player_status = <player_status>
	if GotParam \{pass_to_gigboard}
		spawnscriptnow cleanup_singleplayer_hub_return_tutorials params = {player = <player> Progression = <Progression> ent_player_status = <ent_player_status>}
		return \{false}
	else
		if ($first_character_hub_enter = 0)
			cas_queue_new_character_profile id = ($<player_status>.character_id) player = <player> savegame = <savegame> hide_old_character = 1
		endif
	endif
	if NOT ($game_mode = training)
		FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
		GetGlobalTags <bandname_id> param = first_venue_movie_played
		if (<first_venue_movie_played> = 0)
			get_progression_globals game_mode = ($game_mode)
			SetGlobalTags <bandname_id> params = {first_venue_movie_played = 1}
		endif
	endif
	if ($first_character_hub_enter = 1)
		spawnscriptnow \{character_hub_continue_to_selection}
		return \{false}
	endif
	return \{true}
endscript

script character_hub_continue_to_selection 
	ui_event_wait \{event = menu_change
		data = {
			state = uistate_character_selection
			from_difficulty = {
				from_difficulty
			}
		}}
endscript

script singleplayer_player_show 
	cas_destroy_all_characters
	cleanup_singleplayer_hub
	player_status = player1_status
	ui_event_add_params ent_player_status = ($<player_status>)
	ui_event_wait event = menu_change data = {state = UIstate_tutorial_prompt is_popup <...>}
endscript

script cleanup_singleplayer_hub 
	if ($shutdown_game_for_signin_change_flag = 1)
		change \{using_guitar_select_camera = 0}
	endif
	KillCamAnim \{name = ch_view_cam}
	KillCamAnim \{name = gs_view_cam}
	destroy_bg_viewport
	disable_pause
endscript

script cleanup_singleplayer_hub_return_tutorials 
	player_status = player1_status
	change globalname = <player_status> newvalue = <ent_player_status>
	switch (<ent_player_status>.part)
		case guitar
		change \{current_progression_flag = Career_Guitar}
		SetPlayerInfo \{1
			part = guitar}
		case Bass
		change \{current_progression_flag = Career_Bass}
		SetPlayerInfo \{1
			part = Bass}
		case drum
		change \{current_progression_flag = Career_Drum}
		SetPlayerInfo \{1
			part = drum}
		case Vocals
		change \{current_progression_flag = Career_Vocals}
		SetPlayerInfo \{1
			part = Vocals}
	endswitch
	ui_event_remove_params \{param = ent_player_status}
	change \{game_mode = p1_career}
	change \{current_num_players = 1}
	GameMode_UpdateNumPlayers \{num_players = 1}
	create_loading_screen
	destroy_bandname_viewport
	destroy_band
	frontend_load_soundcheck
	FormatText checksumname = player_status 'player%d_status' d = <player>
	get_savegame_from_player_status player_status = <player_status>
	cas_fix_cameras_for_game
	destroy_loading_screen
	ui_event_remove_params \{param = pass_to_gigboard}
	singleplayer_player_show \{continue_to_gigs}
endscript
