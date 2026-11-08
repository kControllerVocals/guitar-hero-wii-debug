band_mode_mode = none
band_mode_actual_devices = [
	0
	0
	0
	0
]
band_mode_menu_tags = none
band_mode_last_num_ready = 0
band_mode_current_leader = -1
band_mode_can_choose_leader = 0
band_mode_previous_leader = -1
net_matchmaking_search_window = cancel_only
net_band_mode_menu = none
num_players_in_band = 0
net_band_members = [
]
net_num_joiners = 0
net_invites_limbo = 0
career_matchmaking_complete = 0
signin_glitch_protect = 0
net_band_leader_player_num = -1
net_career_invite_flag = 0
net_career_data_sync_done = 1
net_encore_msg_start_sent = 0
net_breakdown_next_song_msg_sent = 0
net_breakdown_continue_msg_sent = 0
net_career_selected_song = none
net_career_selected_gig = 1
net_career_end_game_already_called = 0
net_career_invite_flag = 0

script ui_init_band_mode 
	sanity_check_fix_deleted_characters
	change \{band_mode_last_num_ready = 0}
	if ($band_mode_menu_tags = none)
		change \{band_mode_previous_leader = -1}
	endif
endscript

script ui_create_band_mode 
	change \{band_mode_current_leader = -1}
	change \{menu_over_ride_exclusive_device = -1}
	change \{net_career_data_sync_done = 1}
	change \{net_num_player_settings_ack = 0}
	change \{net_encore_msg_start_sent = 0}
	change \{net_breakdown_next_song_msg_sent = 0}
	change \{net_breakdown_continue_msg_sent = 0}
	set_cas_loading_setup \{setup = Band}
	change \{ui_band_mode_hit_force_completion = 0}
	change \{player_drop_in_setting_sync = 0}
	SpawnScriptLater \{menu_music_on}
	if NOT ($net_band_mode_menu = lobby)
		band_mode_remap_controllers_1_to_4
		clear_temp_net_id_array
		net_clear_all_remote_player_status
		change \{net_dropped_players_flag = 0}
		if ($net_band_mode_menu = invite)
			change \{band_mode_menu_tags = none}
		endif
	else
		change \{band_mode_menu_tags = none}
	endif
	spawn_player_drop_listeners \{drop_player_script = net_career_drop_player
		end_game_script = net_career_end_game}
	if ($is_network_game = 0)
		update_ingame_controllers
	endif
	fadetoblack \{off
		no_wait}
	if ScriptIsRunning \{update_client_searching_timer}
		KillSpawnedScript \{name = update_client_searching_timer}
	endif
	spawnscriptnow \{ui_create_band_mode_spawned}
endscript

script band_mode_remap_controllers_1_to_4 
	character_id_controller = [none none none none none none none none]
	GetMaxPlayers
	i = 0
	begin
	iPlayer = (<i> + 1)
	GetPlayerInfo (<iPlayer>) controller
	GetPlayerInfo (<iPlayer>) character_id
	if ((<controller> >= 0) && (<controller> < 8))
		SetArrayElement ArrayName = character_id_controller index = <controller> newvalue = <character_id>
		printf 'Player %p, controller %d used to use %c' p = <iPlayer> d = <controller> c = <character_id>
	endif
	i = (<i> + 1)
	repeat <max_players>
	SetPlayerInfo \{1
		controller = 0}
	SetPlayerInfo \{2
		controller = 1}
	SetPlayerInfo \{3
		controller = 2}
	SetPlayerInfo \{4
		controller = 3}
	i = 0
	begin
	iPlayer = (<i> + 1)
	if (<character_id_controller> [<i>] != none)
		SetPlayerInfo (<iPlayer>) character_id = (<character_id_controller> [<i>])
		printf 'Player %p, controller %d now using %c' p = <iPlayer> d = <i> c = (<character_id_controller> [<i>])
	else
		SetPlayerInfo (<iPlayer>) character_id = judy
		printf 'Player %p, controller %d had no previous character, defaulting to judy' p = <iPlayer> d = <i>
	endif
	i = (<i> + 1)
	repeat 4
	sanity_check_fix_deleted_characters
endscript

script ui_create_band_mode_spawned 
	frontend_load_soundcheck \{loadingscreen}
	change band_mode_current_leader = ($band_mode_previous_leader)
	cas_free_resources_camera_fix \{base_name = 'band_hub'
		alwaysfix}
	new_leader = ($band_mode_previous_leader)
	if ($is_network_game = 1)
		change \{respond_to_signin_changed = 1}
		if (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite))
			change \{respond_to_signin_changed_all_players = 1}
		elseif (($net_band_mode_menu = HOST) || ($net_band_mode_menu = join))
			change \{respond_to_signin_changed = 0}
			change \{respond_to_signin_changed_all_players = 0}
		else
			change \{respond_to_signin_changed_all_players = 0}
		endif
	else
		change \{respond_to_signin_changed = 0}
		change \{respond_to_signin_changed_all_players = 0}
	endif
	change \{respond_to_signin_changed_func = ui_band_mode_signin_changed}
	band_builder_clear_random_appearances \{cpu_only}
	band_builder_clear_setup
	cas_set_object_node_pos \{player = 1
		node = z_Soundcheck_TRG_Waypoint_Player1_Start}
	cas_set_object_node_pos \{player = 2
		node = z_Soundcheck_TRG_Waypoint_Player2_Start}
	cas_set_object_node_pos \{player = 3
		node = z_Soundcheck_TRG_Waypoint_Player3_Start}
	cas_set_object_node_pos \{player = 4
		node = z_Soundcheck_TRG_Waypoint_Player4_Start}
	reset_band_mode
	if NOT (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite))
		NetSessionFunc \{func = match_init}
	endif
	set_focus_color
	set_unfocus_color
	GetActiveControllers
	controller_num = 0
	CreateScreenElement \{parent = root_window
		id = MyInterfaceElement
		type = DescInterface
		desc = 'band_play'}
	MyInterfaceElement :SE_GetProps
	array = [
		{pad_start ui_band_mode_continue}
		{pad_start ui_band_mode_save_tags}
	]
	if (($is_network_game = 0))
		AddArrayElement array = <array> element = {pad_option ui_band_mode_choose_leader}
	elseif ($is_network_game = 1)
		if (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite))
			array = []
			if IsHost
				AddArrayElement array = <array> element = {pad_start net_ui_band_mode_continue}
			endif
		endif
		if IsPs3
			AddArrayElement array = <array> element = {pad_option2 ui_band_mode_ps3_invite_received}
		endif
	endif
	MyInterfaceElement :SetProps event_handlers = <array>
	menu_array = []
	desc_array = []
	if MyInterfaceElement :Desc_ResolveAlias \{name = alias_hmenu}
		band_hmenu = <resolved_id>
	endif
	total_guitar = 2
	total_drum = 1
	total_mic = 1
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		total_guitar = 2
		total_drum = 2
		total_mic = 2
	elseif ($game_mode = p2_battle)
		total_guitar = 2
		total_drum = 2
		total_mic = 0
	endif
	MyInterfaceElement :SetTags {
		total_guitar = <total_guitar>
		total_drum = <total_drum>
		total_mic = <total_mic>
		current_guitar = 0
		current_drum = 0
		current_mic = 0
		net_gig_ready = 0
		net_vocals_ready = 0
		net_instruments_ready = 0
		net_lobby_ready = 0
	}
	i = 0
	begin
	ResolveScreenElementId id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	current_desc_item = <resolved_id>
	AddArrayElement array = <desc_array> element = <resolved_id>
	desc_array = <array>
	if <resolved_id> :Desc_ResolveAlias name = alias_menu
		if ($is_network_game = 1)
			switch ($net_band_mode_menu)
				case invite
				net_get_invite_menu_tags index = <i> desc_id = <current_desc_item> init
				add_gamertag_to_band_lobby index = <i> name = <name> menu = <menu> desc_item = <current_desc_item>
				<resolved_id> :SetTags {
					menu = <menu>
					instrument = <part>
					difficulty = none
					controller = <controller>
					allowed = <allowed>
					user_id = <user_id>
					band_leader = <band_leader>
					index = <i>
				}
				case lobby
				net_get_root_menu_tags index = <i> desc_id = <current_desc_item>
				add_gamertag_to_band_lobby index = <i> menu = <menu> desc_item = <current_desc_item>
				<resolved_id> :SetTags {
					menu = <menu>
					instrument = <part>
					difficulty = <difficulty>
					controller = <controller>
					allowed = <allowed>
					band_leader = <band_leader>
					index = <i>
				}
				case HOST
				if NetSessionFunc func = IsControllerInGame params = {controller = <i>}
					menu = net_local_join
				else
					menu = join
				endif
				ui_get_controller_parts_allowed controller = <i> filter_by_character
				<resolved_id> :SetTags {
					menu = <menu>
					instrument = none
					difficulty = easy
					controller = <i>
					user_id = [0 0]
					allowed = <allowed>
					marked_in = 0
					index = <i>
					controller_instrument = none
				}
				<resolved_id> :Obj_SpawnScriptLater ui_band_mode_check_disconnect
				case join
				ui_get_controller_parts_allowed controller = <i> filter_by_character
				<resolved_id> :SetTags {
					menu = join
					instrument = none
					difficulty = easy
					controller = <i>
					user_id = [0 0]
					allowed = <allowed>
					index = <i>
					controller_instrument = none
				}
				<resolved_id> :Obj_SpawnScriptLater ui_band_mode_check_disconnect
				default
				ScriptAssert 'unhandled $net_band_mode_menu=%n' n = ($net_band_mode_menu)
			endswitch
		else
			ui_get_controller_parts_allowed controller = <i> filter_by_character
			<resolved_id> :SetTags {
				menu = join
				instrument = none
				difficulty = easy
				controller = <i>
				allowed = <allowed>
				index = <i>
				controller_instrument = none
			}
			<resolved_id> :Obj_SpawnScriptLater ui_band_mode_check_disconnect
		endif
		get_player_num_from_controller controller_index = <i>
		if NOT ($band_mode_menu_tags = none)
			<resolved_id> :SetTags {
				($band_mode_menu_tags [<i>])
			}
			<resolved_id> :GetSingleTag menu
			if (<player_num> >= 0)
				if (<menu> = join)
					cas_queue_kill_player player = <player_num>
				elseif (<menu> = net_remote_root)
					<resolved_id> :Obj_KillSpawnedScript name = ui_band_mode_check_disconnect
				else
					ui_band_mode_show_character player = <player_num> use_existing
				endif
			endif
		else
			if (<player_num> >= 0)
				cas_queue_kill_player player = <player_num>
				<resolved_id> :GetSingleTag menu
				if (<menu> = net_local_join)
					ui_band_mode_show_character player = <player_num>
				endif
			endif
		endif
		<resolved_id> :SetProps event_handlers = [
			{pad_up ui_band_mode_scroll_sound params = {up controller = <controller> device_num = <device_num>}}
			{pad_down ui_band_mode_scroll_sound params = {down controller = <controller> device_num = <device_num>}}
		]
		if <resolved_id> :GetSingleTag menu
			AddArrayElement array = <menu_array> element = <resolved_id>
			menu_array = <array>
		else
			ScriptAssert \{'Expected menu tag'}
		endif
		if (($is_network_game = 1) && ($net_band_leader_player_num > -1) && ($net_band_leader_player_num = (<i> + 1)) && ($net_band_mode_menu = HOST))
			printf \{qs(0xf4a97cdd)}
			<current_desc_item> :SE_SetProps leader_indicator_alpha = 1.0
		elseif (($is_network_game = 1) && ($net_band_mode_menu = join))
			<current_desc_item> :SE_SetProps leader_indicator_alpha = 0.0
		endif
	endif
	i = (<i> + 1)
	repeat 4
	MyInterfaceElement :SetTags {
		menus = <menu_array>
		descs = <desc_array>
	}
	GetArraySize \{menu_array}
	if (<array_size> > 0)
		i = 0
		begin
		curr_id = (<menu_array> [<i>])
		RunScriptOnScreenElement id = <curr_id> ui_band_mode_create_menu
		i = (<i> + 1)
		repeat <array_size>
	endif
	if NOT ($band_mode_menu_tags = none)
		MyInterfaceElement :SetTags {
			($band_mode_menu_tags [4])
		}
	endif
	net_setup_band_lobby_ticker
	if ($is_network_game = 1)
		if ($net_band_mode_menu = HOST)
			update_network_ticker \{msg_checksum = menu_host}
		endif
		if ($net_band_mode_menu = join)
			update_network_ticker \{msg_checksum = menu_join}
		endif
		if ($net_band_mode_menu = invite)
			update_network_ticker \{msg_checksum = menu_invite}
		endif
		if IsPs3
			if NOT NetSessionFunc \{obj = voice
					func = voice_allowed}
				update_network_ticker \{msg_checksum = ps3_chat}
			endif
		endif
		if (($net_band_mode_menu = HOST) || ($net_band_mode_menu = invite))
		endif
		if (($net_band_mode_menu = lobby) && ($career_matchmaking_complete = 0))
			change \{net_matchmaking_search_window = cancel_only}
			if ($net_career_invite_flag = 1)
				change \{net_matchmaking_search_window = invites}
			endif
			net_ui_band_mode_create_searching_menu options_type = ($net_matchmaking_search_window)
			if ScreenElementExists \{id = MyInterfaceElement}
				MyInterfaceElement :Obj_SpawnScriptNow \{check_num_matchmaking_players_loop}
			endif
		endif
	endif
	AssignAlias \{id = MyInterfaceElement
		alias = band_mode_menu}
	ui_band_mode_helper_text
	change \{band_mode_menu_tags = none}
	change \{band_mode_previous_leader = -1}
	ui_band_mode_choose_leader device_num = <new_leader>
	LaunchEvent \{type = focus
		target = band_mode_menu}
endscript

script ui_band_mode_signin_changed 
	printf \{qs("\Lui_band_mode_signin_changed")}
	if (($primary_controller = <controller>) && ($is_network_game = 1))
		handle_signin_changed
		return
	endif
	RemoveContentFiles playerid = <controller>
	reset_globaltags savegame = <controller>
	cheat_turnoffalllocked
	get_player_num_from_controller controller_index = <controller>
	ui_band_mode_kill_character player = <player_num>
	MyInterfaceElement :GetTags
	controller_signin = <controller>
	index = 0
	GetArraySize <menus>
	begin
	current_menu = (<menus> [<index>])
	<current_menu> :GetSingleTag controller
	if (<controller> = <controller_signin>)
		break
	endif
	index = (<index> + 1)
	repeat <array_size>
	<current_menu> :GetSingleTag menu
	if (($is_network_game = 1) && (<menu> = net_remote_root))
		menu = net_remote_root
	else
		menu = join
	endif
	<current_menu> :SetTags {menu = <menu> instrument = none difficulty = none marked_in = 0}
	ui_band_mode_helper_text
	<current_menu> :Obj_SpawnScriptNow ui_band_mode_update_menu
	<current_menu> :GetSingleTag controller_instrument
	switch <controller_instrument>
		case guitar
		MyInterfaceElement :SetTags {current_guitar = (<current_guitar> - 1)}
		case drum
		MyInterfaceElement :SetTags {current_drum = (<current_drum> - 1)}
		case mic
		if (($allow_controller_for_all_instruments) = 0)
			MyInterfaceElement :SetTags {current_mic = (<current_mic> - 1)}
		endif
	endswitch
	<current_menu> :SetTags controller_instrument = none
	MyInterfaceElement :GetSingleTag \{descs}
	current_desc = (<descs> [<index>])
	<current_desc> :SE_SetProps reposition_pos = (0.0, 0.0) ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
endscript

script ui_destroy_band_mode 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :Die
	endif
	clean_up_user_control_helpers
	setup_bg_viewport
	restore_dummy_bg_camera
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
	destroy_popup_warning_menu
	cleanup_all_photo_assets
endscript

script ui_deinit_band_mode 
	change \{disallow_band_edit_char_spam = 0}
	if ($signin_glitch_protect = 0)
		cancel_all_cas_loads
	else
		change \{signin_glitch_protect = 0}
	endif
endscript

script ui_return_band_mode 
	UnloadPak \{'pak\\ui\\gig_posters.pak'
		heap = BottomUpHeap}
	frontend_load_soundcheck
	if ($is_network_game = 1)
		spawnscriptnow \{task_menu_default_anim_in
			params = {
				base_name = 'band_hub'
			}}
		printf \{qs(0xce7aa0c0)}
		destroy_loading_screen
		startrendering
		if ScreenElementExists \{id = MyInterfaceElement}
			MyInterfaceElement :SE_SetProps \{alpha = 1.0}
			band_mode_menu :GetSingleTag \{menus}
			i = 0
			GetArraySize <menus>
			begin
			if ScreenElementExists id = (<menus> [<i>])
				(<menus> [<i>]) :GetSingleTag menu
				if (<menu> = ready)
					get_savegame_from_controller controller = ($primary_controller)
					GetPlayerInfo (<i> + 1) character_id
					get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
					cas_queue_add_request appearance = (<profile_struct>.appearance) player = (<i> + 1)
				endif
				(<menus> [<i>]) :obj_spawnscript ui_band_mode_update_menu
			endif
			i = (<i> + 1)
			repeat <array_size>
			if ($net_band_mode_menu = join)
				change \{num_players_in_band = 0}
			endif
		endif
	endif
	ui_band_mode_helper_text
endscript

script is_band_character_select_up 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :GetSingleTag \{menus}
		GetArraySize <menus>
	else
		array_size = 0
	endif
	num = 0
	num_joined = 0
	i = 0
	if (<array_size> > 0)
		begin
		<curr_id> = (<menus> [<i>])
		<curr_id> :GetTags
		if (<menu> = character)
			return \{true}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script band_kill_character_select_menus 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :GetSingleTag \{menus}
		GetArraySize <menus>
	else
		array_size = 0
	endif
	num = 0
	num_joined = 0
	i = 0
	if (<array_size> > 0)
		begin
		<curr_id> = (<menus> [<i>])
		if <curr_id> :GetSingleTag menu
			if (<menu> = character)
				<curr_id> :Obj_SpawnScriptNow ui_band_mode_back
				RemoveParameter \{menu}
				killed_something = 1
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if GotParam \{killed_something}
		return \{true}
	endif
	return \{false}
endscript

script ui_band_mode_choose_leader 
	printscriptinfo \{'ui_band_mode_choose_leader'}
	if is_band_character_select_up
		return \{false}
	elseif ($band_mode_can_choose_leader = 0)
		return \{false}
	elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || ($game_mode = p2_battle))
		return \{false}
	endif
	MyInterfaceElement :GetTags
	backing_out = 0
	if NOT ($is_network_game)
		if (<device_num> = -1)
			<backing_out> = 1
			controller = 0
			begin
			get_player_num_from_controller controller_index = <controller>
			if (<player_num> >= 0)
				if band_mode_has_player_joined player = (<player_num> - 1)
					<device_num> = <controller>
					break
				endif
			endif
			<controller> = (<controller> + 1)
			repeat 4
		endif
	endif
	<i> = 0
	begin
	current_desc = (<descs> [<i>])
	if ($net_band_mode_menu = join)
		<current_desc> :SE_SetProps leader_indicator_alpha = 0
	elseif (<i> = <device_num>)
		printf \{qs(0x42c11537)}
		<current_desc> :SE_SetProps leader_indicator_alpha = 1
		change band_mode_current_leader = <i>
		if NOT ($band_mode_previous_leader = <device_num>)
			SoundEvent \{event = select_band_leader}
			change band_mode_previous_leader = <device_num>
		endif
	else
		<current_desc> :SE_SetProps leader_indicator_alpha = 0
	endif
	<i> = (<i> + 1)
	repeat 4
	if (<backing_out> = 0)
		ui_band_mode_helper_text
	endif
endscript

script ui_band_mode_create_menu 
	GetTags
	Obj_GetID
	<ObjID> :SetProps exclusive_device = <controller> event_handlers = [{pad_back ui_band_mode_back}]
	if NOT (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite) || (<menu> = net_remote_root))
		if GotParam \{player_index}
			obj_spawnscript ui_band_mode_update_name params = {controller = <controller> player_index = <player_index>}
		else
			obj_spawnscript ui_band_mode_update_name params = {controller = <controller>}
		endif
	endif
	ui_band_mode_update_menu \{init}
endscript

script ui_band_mode_update_name 
	MyInterfaceElement :GetTags
	GetSingleTag \{index}
	current_desc = (<descs> [<index>])
	if isXenon
		begin
		if ($band_mode_active = 0)
			name = qs("\L")
			NetSessionFunc func = get_gamertag params = {controller = <controller>}
			if GotParam \{name}
				band_gamertag_rename gamertag = <name> index = <index>
			endif
			if ($is_network_game)
				<check_cont> = $primary_controller
			else
				<check_cont> = $band_mode_current_leader
			endif
			if (<controller> = <check_cont>)
				<current_desc> :SE_SetProps leader_indicator_alpha = 1
			else
				<current_desc> :SE_SetProps leader_indicator_alpha = 0
			endif
		endif
		Wait \{1
			second
			ignoreslomo}
		repeat
	else
		begin
		if ($band_mode_active = 0)
			if ($is_network_game)
				<check_cont> = $primary_controller
			else
				<check_cont> = $band_mode_current_leader
			endif
			if NOT ($net_band_mode_menu = join)
				if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
					<current_desc> :SE_SetProps leader_indicator_alpha = 0
				elseif (<controller> = <check_cont>)
					<current_desc> :SE_SetProps leader_indicator_alpha = 1
				else
					<current_desc> :SE_SetProps leader_indicator_alpha = 0
				endif
			endif
			if band_mode_has_player_joined player = <index>
				FormatText TextName = gamertag_text qs("Controller %a") a = (<controller> + 1)
				band_gamertag_rename gamertag = <gamertag_text> index = <index>
			else
				band_gamertag_rename index = <index> gamertag = qs("\L")
			endif
		endif
		Wait \{5
			gameframes}
		repeat
	endif
endscript

script band_mode_has_player_joined 
	screenelement_get_tags \{id = MyInterfaceElement}
	if StructureContains Structure = <tags> menus
		menu_id = (<tags>.menus [<player>])
		if GotParam \{menu_id}
			if ScreenElementExists id = <menu_id>
				<menu_id> :GetTags
				if (<menu> = join)
					return \{false}
				endif
			else
				return \{false}
			endif
		else
			return \{false}
		endif
		return \{true}
	else
		return \{false}
	endif
endscript

script ui_band_menu_occlude_character 
	MyInterfaceElement :GetTags
	if GotParam \{descs}
		RequireParams \{[
				index
			]
			all}
		current_desc = (<descs> [<index>])
		if GotParam \{revert}
			<current_desc> :SE_SetProps Menu_Player_bg_alpha = 0.8 scrollbar_alpha = 0.0 scrolling_menu_dims = (200.0, 200.0) name_arrow_up_pos = (-3.685994, -14.62645)
			<current_desc> :SE_SetProps reposition_pos = (0.0, 0.0) ready_banner_pos = (0.0, 500.0) time = 0.2 motion = ease_in
			if <current_desc> :Desc_ResolveAlias name = alias_scrolling_menu param = band_play_smenu
				SetScreenElementProps id = <band_play_smenu> top_selection = false
			else
				ScriptAssert \{qs("\Lui_band_menu_occlude_character was unable to create alias_scrolling_menu alias")}
			endif
		else
			<current_desc> :SE_SetProps Menu_Player_bg_alpha = 1.0 scrollbar_alpha = 1.0 scrolling_menu_dims = (200.0, 500.0) name_arrow_up_pos = (-3.685994, 285.0)
			<current_desc> :SE_SetProps reposition_pos = (0.0, -275.0) time = 0.2 motion = ease_out
			if <current_desc> :Desc_ResolveAlias name = alias_scrolling_menu param = band_play_smenu
				SetScreenElementProps id = <band_play_smenu> top_selection = true
			else
				ScriptAssert \{qs("\Lui_band_menu_occlude_character was unable to create alias_scrolling_menu alias")}
			endif
		endif
	endif
endscript

script ui_band_mode_update_menu 
	printf \{qs(0xdab1d717)}
	destroy_loading_screen
	startrendering
	GetTags
	Obj_GetID
	LaunchEvent type = unfocus target = <ObjID>
	DestroyScreenElement id = <ObjID> preserve_parent
	SE_GetParentId
	<parent_id> :SE_SetProps reset_window_top
	child_index = 0
	<ObjID> :SetProps {
		replace_handlers event_handlers = [
			{pad_up ui_band_mode_scroll_sound params = {up controller = <controller> device_num = <device_num>}}
			{pad_down ui_band_mode_scroll_sound params = {down controller = <controller> device_num = <device_num>}}
		]
		alpha = 0.0
	}
	ui_band_menu_occlude_character revert index = <index>
	printf \{qs("\Lui_band_mode_update_menu")}
	switch <menu>
		case instrument
		ui_band_mode_create_menu_instrument
		case lefty
		ui_band_mode_create_menu_lefty
		<ObjID> :GetSingleTag instrument
		get_savegame_from_controller controller = <controller>
		focus_index = 0
		if (<instrument> = Vocals)
			GetGlobalTags savegame = <savegame> user_options param = vocals_highway_view_save
			if (<vocals_highway_view_save> = scrolling)
				focus_index = 1
			endif
		else
			GetGlobalTags savegame = <savegame> user_options param = lefty_flip_save
			if (<lefty_flip_save> = 1)
				focus_index = 1
			endif
		endif
		given_focus = <focus_index>
		case difficulty
		ui_band_mode_create_menu_difficulty
		if ($is_network_game = 0)
			difficulty = ($default_difficulty [<controller>])
		endif
		focus_index = 0
		if GotParam \{difficulty}
			switch (<difficulty>)
				case easy
				focus_index = 1
				case medium
				focus_index = 2
				case hard
				focus_index = 3
				case expert
				focus_index = 4
			endswitch
		endif
		given_focus = <focus_index>
		case character
		case p2_character
		ui_band_mode_create_menu_character
		case root
		case p2_root
		ui_band_mode_create_menu_root menu = <menu>
		if GetScreenElementChildren id = <ObjID>
			GetArraySize <children>
			child_index = (<array_size> - 1)
		endif
		case ready
		case ready2
		case p2_ready
		if ($is_network_game = 1)
			ui_event_get_stack
			if ((<stack> [0].base_name) = 'band_mode')
				ui_band_mode_choose_sound instrument = <instrument> ready = 1 controller = <controller>
			endif
		else
			ui_band_mode_choose_sound instrument = <instrument> ready = 1 controller = <controller>
		endif
		ui_band_mode_create_menu_ready
		<ObjID> :SetProps replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case join
		ui_band_mode_create_menu_join <...>
		<ObjID> :SetProps replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case net_remote_open
		ui_band_mode_create_menu_net_remote_open
		<ObjID> :SetProps replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case net_remote_root
		ui_band_mode_create_menu_net_remote_root
		<ObjID> :SetProps replace_handlers event_handlers = [
			{pad_up nullscript}
			{pad_down nullscript}
		]
		case net_local_join
		ui_band_mode_create_menu_net_local_join
		if GetScreenElementChildren id = <ObjID>
			GetArraySize <children>
			child_index = (<array_size> - 1)
		endif
		case net_local_root
		ui_band_mode_create_menu_net_local_root
		MyInterfaceElement :GetSingleTag \{net_gig_ready}
		if ((<net_gig_ready> = 0) && (IsHost) && ($primary_controller = <controller>))
			child_index = 0
		elseif (<instrument> = none)
			if isXenon
				child_index = 2
			else
				child_index = 1
			endif
		else
			if GetScreenElementChildren id = <ObjID>
				GetArraySize <children>
				child_index = (<array_size> - 1)
			endif
		endif
		case friends
		ui_band_mode_create_friends_list
		case gigs
		ui_band_mode_create_gigs
		case gamer_cards
		ui_band_mode_create_menu_gamer_cards
		case invites
		ui_band_mode_create_invite
	endswitch
	if NOT GotParam \{skip_update_wait}
		Wait \{5
			gameframes}
	endif
	if NOT GotParam \{init}
		ui_band_mode_check_menus
	endif
	<ObjID> :SetProps alpha = 1.0
	MyInterfaceElement :GetTags
	if GotParam \{descs}
		current_desc = (<descs> [<index>])
		if NOT (<menu> = gigs)
			ui_band_mode_show_arrows id = <current_desc>
		endif
		printf qs(0x404d7eea) d = <instrument>
		switch <instrument>
			case guitar
			<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_guitar
			case Bass
			<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_bass
			case drum
			<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_drum
			case Vocals
			<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_vocal
			default
			<current_desc> :SE_SetProps instrument_alpha = 0.0 instrument_texture = logo_guitar
		endswitch
		curr_index = <index>
		if (<menu> = join)
			band_character_rename index = <index>
		else
			GetArraySize <menus>
			i = 0
			begin
			curr_menu = (<menus> [<i>])
			<curr_menu> :GetSingleTag index
			if (<index> = <curr_index>)
				break
			endif
			i = (<i> + 1)
			repeat <array_size>
			if NOT (<i> = <array_size>)
				band_character_rename index = <index> player = (<i> + 1)
			endif
		endif
		if ($is_network_game = 1)
			GetPlayerInfo (<curr_index> + 1) net_obj_id
			GetPlayerInfo (<curr_index> + 1) is_local_client
			if ($net_band_mode_menu = lobby)
				if (<is_local_client> = 1)
					band_character_rename index = <curr_index> player = (<curr_index> + 1)
				elseif (<net_obj_id> >= 0)
					net_get_character_name player = (<curr_index> + 1)
					band_character_rename index = <curr_index> character_name = <display_name>
				else
					band_character_rename index = <index>
				endif
				if (($career_matchmaking_complete = 1) && (<net_obj_id> < 0) && (<menu> = net_remote_open))
					(<descs> [<index>]) :SE_SetProps reposition_pos = (0.0, 220.0) time = 0.1 motion = ease_out
					(<descs> [<index>]) :SE_WaitProps
					(<descs> [<index>]) :SE_SetProps reposition_pos = (0.0, 450.0) time = 0.1 alpha = 0
				endif
			endif
		endif
	endif
	if ((<menu> = net_remote_open) || (<menu> = net_remote_root) || ($net_career_data_sync_done = 0))
		if ((<menu> = net_remote_root) && ($net_band_mode_menu = HOST))
			printf \{qs("\Lgive focus like normal")}
		else
			return
		endif
	endif
	if GotParam \{given_focus}
		printf 'Give focus %s %d' s = <ObjID> d = <given_focus>
		LaunchEvent type = focus target = <ObjID> data = {child_index = <given_focus>}
	else
		LaunchEvent type = focus target = <ObjID> data = {child_index = <child_index>}
	endif
endscript

script ui_band_mode_show_arrows 
	RequireParams \{[
			id
		]
		all}
	if ScreenElementExists id = <id>
		<id> :SE_SetProps scroll_arrow_alpha = 1.0
	endif
endscript

script ui_band_mode_hide_arrows 
	RequireParams \{[
			id
		]
		all}
	if ScreenElementExists id = <id>
		<id> :SE_SetProps scroll_arrow_alpha = 0.0
	endif
endscript

script net_ui_band_mode_quit 
	printf \{qs("\Lnet_ui_band_mode_quit")}
	if IsHost
		printf \{qs("\La client dropped and I'm the host notify everyone else")}
		SendStructure callback = net_ui_band_mode_quit data_to_send = {<...>}
	endif
	if GotParam \{is_host}
		printf \{qs("\Lhost quit career lobby go back to join lobby")}
		quit_network_game_early
		change \{net_band_mode_menu = join}
		quit_career_back_to_lobby
	else
		printf \{qs("\Lclient quit career lobby drop the ui and keep waiting")}
		change num_players_in_band = ($num_players_in_band - 1)
		MyInterfaceElement :GetTags
		current_desc = (<descs> [(<player_num> - 1)])
		band_gamertag_rename index = (<player_num> - 1) gamertag = qs("\L")
		(<menus> [(<player_num> - 1)]) :SetTags {menu = net_remote_open
			instrument = none
			difficulty = none}
		(<menus> [(<player_num> - 1)]) :obj_spawnscript ui_band_mode_update_menu
		ui_band_mode_helper_text
	endif
endscript

script net_ui_host_quit_lobby 
	printf \{qs("\L---net_ui_host_quit_lobby")}
	SendStructure \{callback = net_ui_band_mode_quit
		data_to_send = {
			is_host = 1
		}}
endscript

script net_ui_client_quit_lobby 
	printf \{qs("\L---net_ui_client_quit_lobby")}
	SendStructure callback = net_ui_band_mode_quit data_to_send = {player_num = <player_num>}
endscript

script correct_allowed_parts 
	if NOT ArrayContains array = <allowed_parts> contains = <part>
		if StructureContains Structure = <allowed> <part>
			RemoveParameter <part> struct_name = allowed
		endif
	endif
	return allowed = <allowed>
endscript

script filter_allowed_parts_by_character_type 
	RequireParams \{[
			allowed
			controller
		]
		all}
	get_player_num_from_controller controller_index = <controller>
	printf 'filter_allowed_parts_by_character_type player=%p controller=%c' p = <player_num> c = <controller>
	if (<player_num> < 0)
		return allowed = <allowed>
	endif
	FormatText checksumname = player_status 'player%p_status' p = <player_num>
	character_id = ($<player_status>.character_id)
	get_savegame_from_controller controller = <controller>
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	allowed_parts = (<profile_struct>.allowed_parts)
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = drum
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = Bass
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = Vocals
	correct_allowed_parts allowed_parts = <allowed_parts> allowed = <allowed> part = guitar
	return allowed = <allowed>
endscript

script ui_band_mode_create_menu_instrument 
	Obj_GetID
	GetTags
	fit_width = `scale each line if larger`
	fit_height = `scale down if larger`
	printstruct <...>
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("GUITAR")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {instrument = guitar}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if NOT StructureContains Structure = <allowed> name = guitar
		<id> :SetProps not_focusable rgba = [64 64 64 255]
	endif
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("BASS")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {instrument = Bass}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if NOT StructureContains Structure = <allowed> name = Bass
		<id> :SetProps not_focusable rgba = [64 64 64 255]
	endif
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("DRUMS")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {instrument = drum}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if NOT StructureContains Structure = <allowed> name = drum
		<id> :SetProps not_focusable rgba = [64 64 64 255]
	endif
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("VOCALS")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {instrument = Vocals}}
		]
		tags = {has_mic = 1}
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if NOT StructureContains Structure = <allowed> name = Vocals
		<id> :SetProps not_focusable rgba = [64 64 64 255]
	elseif is_regular_controller controller = <controller>
		<id> :SetProps tags = {has_mic = 0}
	endif
	RunScriptOnScreenElement id = <id> ui_band_mode_mic_check params = {controller = <controller>}
endscript

script ui_band_mode_create_menu_lefty 
	Obj_GetID
	GetTags
	fit_width = `scale each line if larger`
	fit_height = `scale down if larger`
	if (<instrument> = Vocals)
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("STATIC")
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = static}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("SCROLLING")
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = scrolling}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	else
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("STANDARD")
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = standard}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("LEFTY FLIP")
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {lefty = lefty}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
endscript

script ui_band_mode_mic_check 
	RequireParams \{[
			controller
		]
		all}
	if NOT is_regular_controller controller = <controller>
		return
	endif
	if (($allow_controller_for_all_instruments) = 1)
		SetProps \{tags = {
				has_mic = 1
			}}
		return
	endif
	GameMode_GetProperty \{prop = faceoff}
	if (<faceoff> = true)
		get_player_num_from_controller controller_index = <controller>
		if (<player_num> = -1)
			ScriptAssert 'Controller %c has not been assigned to a player.' c = <controller>
		endif
	endif
	Obj_GetID
	begin
	<has_mic> = 0
	if (<faceoff> = true)
		if vocals_player_has_mic player = <player_num>
			<has_mic> = 1
		endif
	else
		if controller_has_headset controller = <controller>
			<has_mic> = 1
		elseif IsMicrophonePluggedIn
			<has_mic> = 1
		endif
	endif
	SetProps tags = {has_mic = <has_mic>}
	Wait \{1
		gameframe}
	repeat
endscript

script ui_band_mode_create_menu_difficulty 
	Obj_GetID
	if ($game_mode != p2_battle)
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("BEGINNER")
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {difficulty = easy_rhythm}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	else
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("BEGINNER")
			font = fontgrid_text_a6
			rgba = [64 64 64 255]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			not_focusable
		}
	endif
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("EASY")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = easy}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("MEDIUM")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = medium}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("HARD")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = hard}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("EXPERT")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {difficulty = expert}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
endscript

script ui_band_mode_create_menu_ready 
	Obj_GetID
	SE_GetParentId
	<parent_id> :SE_GetParentId
	GetTags
	MyInterfaceElement :GetSingleTag \{descs}
	current_desc = (<descs> [<index>])
	if French
		<current_desc> :SE_SetProps ready_banner_texture = ready_banner_french
	elseif German
		<current_desc> :SE_SetProps ready_banner_texture = ready_banner_german
	elseif Italian
		<current_desc> :SE_SetProps ready_banner_texture = ready_banner_italian
	elseif Spanish
		<current_desc> :SE_SetProps ready_banner_texture = ready_banner_spanish
	endif
	ui_band_mode_animate_ready current_desc = <current_desc>
endscript

script ui_band_mode_animate_ready 
	RequireParams \{[
			current_desc
		]
		all}
	<current_desc> :SE_SetProps reposition_pos = (0.0, 220.0) ready_banner_pos = (0.0, -130.0) time = 0.1 motion = ease_out
	<current_desc> :SE_WaitProps
	<current_desc> :SE_SetProps reposition_pos = (0.0, 210.0) time = 0.1 motion = ease_out
	<current_desc> :SE_WaitProps
	<current_desc> :SE_SetProps ready_banner_scale = 1.8 time = 0.1 motion = ease_out
	<current_desc> :SE_WaitProps
	<current_desc> :SE_SetProps ready_banner_scale = 1.4 time = 0.1 motion = ease_in
	<current_desc> :SE_WaitProps
	<current_desc> :SE_SetProps ready_banner_scale = 1.6 time = 0.1 motion = ease_out
	<current_desc> :SE_WaitProps
	<current_desc> :SE_SetProps ready_banner_scale = 1.5 time = 0.1 motion = ease_in
endscript

script ui_band_mode_animate_unready 
	RequireParams \{[
			current_desc
		]
		all}
	<current_desc> :SE_SetProps reposition_pos = (0.0, -20.0) ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
	<current_desc> :SE_WaitProps
	<current_desc> :SE_SetProps reposition_pos = (0.0, 0.0) time = 0.05 motion = ease_in
endscript

script ui_band_mode_create_menu_root 
	Obj_GetID
	SE_GetParentId
	<parent_id> :SE_GetParentId
	GetTags
	get_savegame_from_controller controller = <controller>
	change \{rich_presence_context = presence_gigboard_and_setlist}
	GameMode_GetType
	if (<type> = career)
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("VIEW GIGS")
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {root = gigs}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	get_player_num_from_controller controller_index = <controller>
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("RANDOM ROCKER")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_random_character params = {player = <player_num> index = <index>}}
		]
		internal_scale = 0.4
		just = [center bottom]
		internal_just = [center center]
	}
	root = character
	if (<menu> = p2_root)
		root = p2_character
	endif
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("SELECT ROCKER")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {root = <root>}}
		]
		internal_scale = 0.4
		just = [center bottom]
		internal_just = [center center]
	}
	get_player_num_from_controller controller_index = <controller>
	FormatText checksumname = player_status 'player%p_status' p = <player_num>
	if profile_can_be_modified id = ($<player_status>.character_id) savegame = <savegame>
		<show_edit_hero> = 1
		if NOT ($is_network_game)
			if isXenon
				if NOT CheckForSignIn local controller_index = <controller>
					<show_edit_hero> = 0
				endif
			endif
			if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle) || ($game_mode = p1_quickplay) || ($game_mode = p2_quickplay) || ($game_mode = p3_quickplay) || ($game_mode = p4_quickplay))
				<show_edit_hero> = 0
			endif
		endif
		if (<show_edit_hero>)
			CreateScreenElement {
				type = TextBlockElement
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				dims = (200.0, 40.0)
				parent = <ObjID>
				text = qs("EDIT ROCKER")
				font = fontgrid_text_a6
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_band_mode_choose_sound params = {controller = <controller>}}
					{pad_choose ui_band_mode_save_tags}
					{pad_choose ui_band_mode_choose params = {edit_hero player = <player_num> controller = <controller>}}
				]
				internal_scale = 0.4
				just = [center bottom]
				internal_just = [center center]
			}
		endif
	endif
	not_signed_in = 0
	if isXenon
		if NOT IsLocallySignedIn controller = <controller>
			not_signed_in = 1
		endif
	endif
	if (<not_signed_in> = 0)
		if NOT (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
			if current_band_has_band_name controller = <controller>
				CreateScreenElement {
					type = TextBlockElement
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					dims = (200.0, 40.0)
					parent = <ObjID>
					text = qs("BAND INFO")
					font = fontgrid_text_a6
					rgba = ($menu_unfocus_color)
					event_handlers = [
						{focus retail_menu_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_band_mode_choose_sound params = {controller = <controller>}}
						{pad_choose ui_band_mode_save_tags}
						{pad_choose generic_event_choose params = {state = uistate_band_name_logo}}
					]
					internal_scale = 0.4
					just = [center bottom]
					internal_just = [center center]
				}
			endif
		endif
	endif
	if isXenon
		if (<not_signed_in> = 0)
			if NOT (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
				CreateScreenElement {
					type = TextBlockElement
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					dims = (200.0, 40.0)
					parent = <ObjID>
					text = qs("BAND MEMBERS")
					font = fontgrid_text_a6
					rgba = ($menu_unfocus_color)
					event_handlers = [
						{focus retail_menu_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_band_mode_choose params = {root = gamer_cards}}
					]
					just = [center bottom]
					internal_just = [center center]
				}
			endif
		endif
	endif
	ready = ready
	if (<menu> = p2_root)
		ready = p2_ready
	endif
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("READY")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {ready = <ready>}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if NOT ($is_network_game)
		if isXenon
			if ($band_mode_current_leader != -1)
				if CheckForSignIn local controller_index = ($band_mode_current_leader)
					return
				endif
			endif
			if CheckForSignIn local controller_index = <controller>
				change \{band_mode_can_choose_leader = 1}
				ui_band_mode_choose_leader device_num = <controller>
				change \{band_mode_can_choose_leader = 0}
			endif
		else
			if ($band_mode_current_leader = -1)
				change \{band_mode_can_choose_leader = 1}
				ui_band_mode_choose_leader device_num = <controller>
				change \{band_mode_can_choose_leader = 0}
			endif
		endif
	endif
endscript

script ui_band_mode_save_tags 
	MyInterfaceElement :GetSingleTag \{menus}
	change \{band_mode_menu_tags = none}
	GetArraySize <menus>
	array = []
	i = 0
	begin
	curr_id = (<menus> [<i>])
	screenelement_get_tags id = <curr_id>
	RemoveParameter \{struct_name = tags
		tag_selected_id}
	RemoveParameter \{struct_name = tags
		tag_selected_index}
	RemoveParameter \{struct_name = tags
		tag_selected_childs_grid_index}
	if StructureContains Structure = <tags> menu
		if (<tags>.menu = character)
			tags = {<tags> menu = root}
		endif
		if (<tags>.menu = invites)
			if IsPs3
				tags = {<tags> menu = net_local_root}
			else
				tags = {<tags> menu = friends}
			endif
		endif
	endif
	AddArrayElement array = <array> index = <i> element = <tags>
	i = (<i> + 1)
	repeat <array_size>
	if (<array_size> < 4)
		begin
		AddArrayElement array = <array> index = <i> element = {}
		i = (<i> + 1)
		repeat (4 - <array_size>)
	endif
	screenelement_get_tags \{id = MyInterfaceElement}
	RemoveParameter \{struct_name = tags
		menus}
	RemoveParameter \{struct_name = tags
		descs}
	AddArrayElement array = <array> index = <i> element = <tags>
	change band_mode_menu_tags = <array>
endscript
disallow_band_edit_char_spam = 0

script band_edit_character 
	if ($disallow_band_edit_char_spam = 0)
		change \{disallow_band_edit_char_spam = 1}
		hide_glitch \{num_frames = 10}
		external_edit_character player = <player>
	endif
endscript

script ui_band_mode_create_menu_character 
	Obj_GetID
	<ObjID> :GetTags
	ui_band_menu_occlude_character index = <index>
	get_player_num_from_controller controller_index = <controller>
	player = <player_num>
	FormatText checksumname = player_status 'player%p_status' p = <player_num>
	current_character_id = ($<player_status>.character_id)
	if band_builder_is_finalized_random character_id = <current_character_id>
		current_character_id = ($<player_status>.original_character_id)
	endif
	get_savegame_from_controller band_character_select controller = <controller>
	get_musician_profile_size savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	i = 0
	menu_index = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	get_controller_part controller = <controller>
	if display_character_logic savegame = <character_savegame> profile_struct = <profile_struct> part = <controller_part> bandplay
		character_id = (<profile_struct>.name)
		if is_profile_purchased id = <character_id> savegame = <savegame>
			get_car_photo_icon profile_struct = <profile_struct> savegame = <character_savegame> character_id = <character_id>
			if (<current_character_id> = <character_id>)
				focus_index = <menu_index>
			endif
			CreateScreenElement {
				type = DescInterface
				desc = 'band_play_menu_char'
				parent = <ObjID>
				band_play_menu_char_icon_texture = <icon>
				event_handlers = [
					{pad_choose band_character_select_choose params = {price = <price> player = <player> character_id = <character_id> menu = <menu> savegame = <character_savegame> borrowed_from_band_leader = <borrowed_from_band_leader>}}
				]
				just = [center bottom]
				dims = (80.0, 80.0)
			}
			SetScreenElementProps {
				id = <id>
				event_handlers = [
					{focus band_character_select_focus params = {id = <id> character_name = (<profile_struct>.fullname) index = <index> player = <player_num>}}
					{unfocus band_character_select_unfocus params = {id = <id> character_name = (<profile_struct>.fullname) index = <index>}}
				]
			}
			menu_index = (<menu_index> + 1)
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	get_controller_part controller = <controller>
	if display_character_logic savegame = <character_savegame> profile_struct = <profile_struct> part = <controller_part> bandplay
		character_id = (<profile_struct>.name)
		if is_profile_purchased id = <character_id> savegame = <savegame>
			get_car_photo_icon profile_struct = <profile_struct> savegame = <character_savegame> character_id = <character_id>
			CreateScreenElement {
				type = DescInterface
				desc = 'band_play_menu_char'
				parent = <ObjID>
				band_play_menu_char_icon_texture = <icon>
				just = [center bottom]
				dims = (80.0, 80.0)
				not_focusable
			}
		endif
	endif
	i = (<i> + 1)
	repeat 6
	return given_focus = <focus_index>
endscript

script band_character_select_focus 
	if GotParam \{character_name}
		band_character_rename index = <index> character_name = <character_name>
	endif
	<id> :SE_SetProps scale = 1.2 pos = {relative (0.0, -10.0)} band_play_menu_char_highlight_alpha = 1.0
endscript

script band_character_rename 
	RequireParams \{[
			index
		]
		all}
	MyInterfaceElement :GetTags
	if GotParam \{descs}
		current_desc = (<descs> [<index>])
		<current_desc> :SE_GetProps
		if NOT GotParam \{character_name}
			character_name = qs("\L")
			if GotParam \{player}
				FormatText checksumname = player_status 'player%p_status' p = <player>
				get_savegame_from_player_status player_status = <player_status>
				character_id = ($<player_status>.character_id)
				get_fullname_of_character id = <character_id> savegame = <savegame> profanity_allowed
				character_name = <fullname>
			endif
		endif
		name = qs("\L")
		if NOT (<character_name> = qs("\L"))
			StringLength string = <character_name>
			Mod a = <str_len> b = (2)
			if (<Mod> = 1)
				character_name = (<character_name> + qs("\L "))
				str_len = (<str_len> + 1)
			endif
			total = 0
			i = 0
			begin
			total = (<total> + <str_len> + 5)
			if (<total> > 128)
				break
			endif
			if (<i> = 0)
				temp_total = (<total> + <str_len> + 5)
				if (<temp_total> > 128)
					break
				endif
			endif
			FormatText TextName = name qs("\L%n     %c") n = <name> c = <character_name>
			i = (<i> + 1)
			if (<i> = 2)
				i = 0
			endif
			repeat
		endif
		if (<name_text> = <name>)
			return
		endif
		<current_desc> :Obj_KillSpawnedScript name = band_character_name_scroll
		<current_desc> :SE_SetProps name_text = <character_name> name_dims = (0.0, 39.0) name_pos = (0.0, -19.28137)
		<current_desc> :SE_GetProps
		if ((<name_dims> [0]) < 240)
			x = ((248 - (<name_dims> [0])) / 2)
			<current_desc> :SE_SetProps name_pos = ((0.0, 19.28137) + ((1.0, 0.0) * <x>))
			return
		endif
		<current_desc> :SE_SetProps name_text = qs("\L") name_dims = (0.0, 39.0) name_pos = (0.0, 19.28137)
		<current_desc> :SE_SetProps name_text = <name>
		<current_desc> :SE_GetProps
		<current_desc> :Obj_SpawnScriptNow band_character_name_scroll params = {width = (<name_dims> [0])}
	endif
endscript

script band_character_name_scroll 
	RequireParams \{[
			width
		]
		all}
	time = (4.0 * (<width> / 500.0))
	SE_SetProps name_pos = {((-0.125, 0.0) * <width>) relative}
	begin
	SE_SetProps name_pos = {((-0.5, 0.0) * <width>) relative} time = <time>
	Wait <time> seconds ignoreslomo
	SE_SetProps name_pos = {((0.5, 0.0) * <width>) relative}
	repeat
endscript

script band_gamertag_rename 
	RequireParams \{[
			gamertag
			index
		]
		all}
	MyInterfaceElement :GetTags
	if GotParam \{descs}
		current_desc = (<descs> [<index>])
	elseif GotParam \{desc_item}
		current_desc = <desc_item>
	endif
	if ((GotParam descs) || (GotParam desc_item))
		name = qs("\L")
		if NOT (<gamertag> = qs("\L"))
			StringLength string = <gamertag>
			Mod a = <str_len> b = (2)
			if (<Mod> = 1)
				gamertag = (<gamertag> + qs("\L "))
				str_len = (<str_len> + 1)
			endif
			total = 0
			i = 0
			begin
			total = (<total> + <str_len> + 5)
			if (<total> > 128)
				break
			endif
			if (<i> = 0)
				temp_total = (<total> + <str_len> + 5)
				if (<temp_total> > 128)
					break
				endif
			endif
			FormatText TextName = name qs("\L%n     %c") n = <name> c = <gamertag>
			i = (<i> + 1)
			if (<i> = 2)
				i = 0
			endif
			repeat
		endif
		<current_desc> :SE_GetProps
		if (<gamertag_text> = <name>)
			return
		endif
		<current_desc> :Obj_KillSpawnedScript name = band_gamertag_scroll
		<current_desc> :SE_SetProps gamertag_text = <gamertag> gamertag_dims = (0.0, 39.0) GamerTag_pos = (0.0, -19.28137)
		<current_desc> :SE_GetProps
		if ((<gamertag_dims> [0]) < 240)
			x = ((248 - (<gamertag_dims> [0])) / 2)
			<current_desc> :SE_SetProps GamerTag_pos = ((0.0, -19.28137) + ((1.0, 0.0) * <x>))
			return
		endif
		<current_desc> :SE_SetProps gamertag_text = qs("\L") gamertag_dims = (0.0, 39.0) GamerTag_pos = (0.0, -19.28137)
		<current_desc> :SE_SetProps gamertag_text = <name>
		<current_desc> :SE_GetProps
		<current_desc> :Obj_SpawnScriptNow band_gamertag_scroll params = {width = (<gamertag_dims> [0])}
	endif
endscript

script band_gamertag_scroll 
	RequireParams \{[
			width
		]
		all}
	time = (5.0 * (<width> / 500.0))
	SE_SetProps GamerTag_pos = {((-0.125, 0.0) * <width>) relative}
	begin
	SE_SetProps GamerTag_pos = {((-0.5, 0.0) * <width>) relative} time = <time>
	Wait <time> seconds ignoreslomo
	SE_SetProps GamerTag_pos = {((0.5, 0.0) * <width>) relative}
	repeat
endscript

script band_character_select_unfocus 
	<id> :SE_SetProps scale = 1.0 pos = (0.0, 0.0) band_play_menu_char_highlight_alpha = 0.0
endscript

script band_resolve_guest_characters 
	RequireParams \{[
			player
			character_id
			savegame
			borrowed_from_band_leader
		]
		all}
	if profile_can_be_modified id = <character_id> savegame = <savegame>
		if NOT is_completely_custom_musician id = <character_id> savegame = <savegame>
			if NOT SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Modifiable id = <character_id>
				ScriptAssert '%s not found' s = <character_id>
			endif
			if globaltag_check_preset_musician_modified index = <index> savegame = <borrowed_from_band_leader>
				savegame = <borrowed_from_band_leader>
				printf 'Using guest %d' d = <character_id>
			else
				printf 'Using leader %d' d = <character_id>
			endif
		endif
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
		force_set_random_appearance player = <player> appearance = (<profile_struct>.appearance)
		UpdateStructElement struct = $guest_character_fullnames element = <new_character_id> value = (<profile_struct>.fullname)
		change guest_character_fullnames = <newstruct>
		UpdateStructElement struct = $guest_character_names element = <new_character_id> value = (<profile_struct>.name)
		change guest_character_names = <newstruct>
		FormatText checksumname = player_status 'player%p_status' p = <player>
		change structurename = <player_status> original_character_id = <character_id>
		character_id = <new_character_id>
	endif
	return character_id = <character_id>
endscript

script band_character_select_choose 
	FormatText checksumname = player_status 'player%p_status' p = <player>
	if (($<player_status>.controller) < 4)
		SetArrayElement ArrayName = band_builder_random_preset_used GlobalArray index = ($<player_status>.controller) newvalue = <character_id>
	endif
	if GotParam \{borrowed_from_band_leader}
		if NOT (<borrowed_from_band_leader> = <savegame>)
			set_band_character_id_globaltag savegame = <savegame> controller = ($<player_status>.controller) character_id = <character_id> player = <player>
		endif
		ui_band_mode_choose_sound instrument = `default` controller = ($<player_status>.controller)
		band_resolve_guest_characters player = <player> character_id = <character_id> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
		change structurename = <player_status> character_id = <character_id>
	else
		ui_band_mode_choose_sound instrument = `default` controller = ($<player_status>.controller)
		change structurename = <player_status> character_id = <character_id>
		set_band_character_id_globaltag savegame = <savegame> controller = ($<player_status>.controller) character_id = <character_id> player = <player>
	endif
	cas_queue_new_character_profile player = <player> id = <character_id> savegame = <savegame>
	character = character
	if (<menu> = p2_character)
		character = p2_character
	endif
	ui_band_mode_choose character = <character>
endscript

script band_character_select_back_out 
	RequireParams \{[
			player
			controller
		]
		all}
	FormatText checksumname = player_status 'player%p_status' p = <player>
	character_id = ($<player_status>.character_id)
	get_savegame_from_controller controller = <controller>
	cas_queue_new_character_profile player = <player> id = <character_id> savegame = <savegame>
endscript

script ui_band_mode_create_menu_join 
	Obj_GetID
	GetTags
	printf \{qs("\Lui_band_mode_create_menu_join")}
	change \{rich_presence_context = presence_gigboard_and_setlist}
	array = [
		{unfocus retail_menu_unfocus}
		{pad_choose ui_band_mode_choose params = {join}}
	]
	user_control_helper_get_buttonchar button = green controller = <controller>
	CreateScreenElement {
		type = TextBlockElement
		parent = <ObjID>
		text = (<buttonchar> + qs("\_JOIN"))
		font = fontgrid_text_a6
		dims = (200.0, 0.0)
		allow_expansion
		rgba = ($menu_unfocus_color)
		event_handlers = <array>
		internal_scale = 0.6
		just = [center bottom]
		internal_just = [center center]
		not_focusable
	}
	user_control_helper_get_buttonchar button = Yellow controller = <controller>
	if isXenon
		if ($is_network_game = 1)
			if CheckForSignIn controller_index = <controller>
				text = qs("\L")
			else
				text = (<buttonchar> + qs("\_SIGN\_IN"))
				AddArrayElement array = <array> element = {pad_option2 ui_band_mode_choose params = {join change_profile}}
			endif
		else
			if IsLocallySignedIn controller = <controller>
				text = (<buttonchar> + qs("\_gamer\_profile"))
				AddArrayElement array = <array> element = {pad_option2 ui_band_mode_choose params = {join change_profile}}
			else
				text = (<buttonchar> + qs("\_SIGN\_IN"))
				AddArrayElement array = <array> element = {pad_option2 ui_band_mode_choose params = {join change_profile}}
			endif
		endif
	else
		text = qs("\L")
	endif
	CreateScreenElement {
		type = TextBlockElement
		parent = <ObjID>
		text = <text>
		font = fontgrid_text_a6
		dims = (200.0, 0.0)
		allow_expansion
		rgba = ($menu_unfocus_color)
		event_handlers = <array>
		internal_scale = 0.6
		just = [center bottom]
		internal_just = [center center]
	}
	if ($is_network_game = 1)
		NetSessionFunc func = RemoveController params = {controller = <controller>}
	endif
endscript

script ui_band_mode_create_menu_net_remote_open 
	Obj_GetID
	CreateScreenElement {
		type = TextBlockElement
		parent = <ObjID>
		local_id = text
		fit_height = `scale down if larger`
		text = qs("Waiting for players")
		font = fontgrid_text_a6
		dims = (200.0, 40.0)
		allow_expansion
		rgba = ($menu_unfocus_color)
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
endscript

script ui_band_mode_create_menu_net_remote_root 
	Obj_GetID
	SE_GetParentId
	<parent_id> :SE_GetParentId
	GetTags
	MyInterfaceElement :GetTags
	GetSingleTag \{index}
	current_desc = (<descs> [<index>])
	printf qs(0x404d7eea) d = <instrument>
	switch <instrument>
		case guitar
		<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_guitar
		case Bass
		<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_bass
		case drum
		<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_drum
		case Vocals
		<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_vocal
		default
		<current_desc> :SE_SetProps instrument_alpha = 0.0 instrument_texture = logo_guitar
	endswitch
	if ($net_band_mode_menu = HOST)
		event_handlers = [
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {join = net_remote_root}}
		]
		user_control_helper_get_buttonchar button = green controller = <controller>
		if CheckForSignIn controller_index = <controller>
			text = (qs("Changing Settings\n") + <buttonchar> + qs("\_JOIN"))
		else
			text = (qs("Changing Settings\n") + <buttonchar> + qs("\_SIGN\_IN"))
		endif
		NetSessionFunc \{obj = party
			func = get_party_members}
		GetArraySize <connections>
		i = 0
		begin
		if ((<connections> [<i>].user_id [0]) = (<user_id> [0]) && (<connections> [<i>].user_id [1]) = (<user_id> [1]))
			name = (<connections> [<i>].gamertag)
		endif
		i = (<i> + 1)
		repeat <array_size>
		add_gamertag_to_band_lobby index = <index> name = <name> menu = <menu>
	else
		get_savegame_from_controller controller = ($primary_controller)
		GetPlayerInfo (<index> + 1) character_id
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
		if is_current_state_band_mode
			printstruct <profile_struct>
			printf qs(0xf637a202) d = <index>
			if (<profile_struct>.name = netappearance1 || <profile_struct>.name = netappearance2 || <profile_struct>.name = netappearance3)
				cas_queue_add_request appearance = (<profile_struct>.appearance) player = (<index> + 1)
			endif
		endif
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
		]
		text = qs("Changing Settings")
	endif
	CreateScreenElement {
		type = TextBlockElement
		parent = <ObjID>
		text = <text>
		font = fontgrid_text_a6
		dims = (200.0, 0.0)
		rgba = ($menu_unfocus_color)
		event_handlers = <event_handlers>
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
		allow_expansion
	}
endscript

script ui_band_mode_create_menu_net_local_join 
	printf \{qs("\L--- ui_band_mode_create_menu_net_local_join ---")}
	Obj_GetID
	GetTags
	change \{rich_presence_context = presence_gigboard_and_setlist}
	if ($net_band_mode_menu = HOST)
		SE_GetParentId
		GetSingleTag \{marked_in}
		if (<marked_in> = 0)
			MyInterfaceElement :GetTags
			if IsGuitarController controller = <controller>
				SetTags \{controller_instrument = guitar}
				MyInterfaceElement :SetTags {current_guitar = (<current_guitar> + 1)}
			elseif IsDrumController controller = <controller>
				SetTags \{controller_instrument = drum}
				MyInterfaceElement :SetTags {current_drum = (<current_drum> + 1)}
			elseif (($allow_controller_for_all_instruments) = 0)
				SetTags \{controller_instrument = mic}
				MyInterfaceElement :SetTags {current_mic = (<current_mic> + 1)}
			endif
			SetTags \{marked_in = 1}
			NetSessionFunc func = get_user_id params = {controller_index = <controller>}
			SetTags user_id = <user_id>
		endif
	endif
	if ($net_band_mode_menu = invite)
		get_player_num_from_controller controller_index = <controller>
		ui_band_mode_show_character player = <player_num>
	endif
	MyInterfaceElement :GetSingleTag \{descs}
	NetSessionFunc func = get_user_id params = {controller_index = <controller>}
	if isXenon
		(<descs> [<index>]) :Obj_SpawnScriptLater update_headset_status params = {obj_id = (<descs> [<index>]) uid = <user_id>}
	endif
	if (($net_band_mode_menu = HOST) || ($net_band_mode_menu = invite))
		if (<index> = $primary_controller)
			CreateScreenElement {
				type = TextBlockElement
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				dims = (200.0, 40.0)
				parent = <ObjID>
				text = $wii_friends
				font = fontgrid_text_a6
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_band_mode_select_friends}
				]
				internal_scale = 0.75
				just = [center bottom]
				internal_just = [center center]
			}
		endif
	endif
	if isXenon
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("BAND MEMBERS")
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {net_local_join = gamer_cards device_num = <device_num>}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	get_player_num_from_controller controller_index = <controller>
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("RANDOM ROCKER")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_random_character params = {player = <player_num> index = <index>}}
		]
		internal_scale = 0.4
		just = [center bottom]
		internal_just = [center center]
	}
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("SELECT ROCKER")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {root = p2_character}}
		]
		internal_scale = 0.4
		just = [center bottom]
		internal_just = [center center]
	}
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (160.0, 40.0)
		parent = <ObjID>
		text = qs("READY")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {ready = ready device_num = <device_num>}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	get_controller_type controller_index = <controller>
	if (<controller_type> = controller)
		if controller_has_headset controller = <controller>
			controller_type = Vocals
		endif
	endif
	SetTags instrument = <controller_type>
	return instrument = <controller_type>
endscript

script ui_band_mode_create_menu_net_local_root 
	Obj_GetID
	SE_GetParentId
	<parent_id> :SE_GetParentId
	GetTags
	MyInterfaceElement :GetTags
	GetSingleTag \{index}
	change \{rich_presence_context = presence_gigboard_and_setlist}
	get_player_num_from_controller controller_index = <controller>
	ui_band_mode_show_character player = <player_num>
	if ScriptIsRunning \{net_ui_band_mode_countdown_to_gig}
		countdown_active = 1
	else
		countdown_active = 0
	endif
	current_desc = (<descs> [<index>])
	printf qs(0x404d7eea) d = <instrument>
	switch <instrument>
		case guitar
		<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_guitar
		case Bass
		<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_bass
		case drum
		<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_drum
		case Vocals
		<current_desc> :SE_SetProps instrument_alpha = 1.0 instrument_texture = logo_vocal
		default
		<current_desc> :SE_SetProps instrument_alpha = 0.0 instrument_texture = logo_guitar
	endswitch
	if ((IsHost) && (<band_leader> = 1) && (<countdown_active> = 0) && ($net_popup_active = 0))
		gig_text = qs("SELECT GIG")
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose net_career_goto_gig_board}
		]
	else
		gig_text = qs("VIEW GIGS")
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {root = gigs}}
		]
	endif
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = <gig_text>
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = <event_handlers>
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if isXenon
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("BAND MEMBERS")
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {net_local_join = gamer_cards device_num = <device_num>}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	if NOT ((<instrument> = Vocals) || (<instrument> = drum))
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("INSTRUMENT")
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {root = instrument}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	if (<instrument> = Vocals)
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("VOCAL VIEW")
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {root = lefty}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	else
		CreateScreenElement {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 40.0)
			parent = <ObjID>
			text = qs("LEFTY FLIP")
			font = fontgrid_text_a6
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {root = lefty}}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("DIFFICULTY")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {root = difficulty}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 40.0)
		parent = <ObjID>
		text = qs("READY")
		font = fontgrid_text_a6
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_band_mode_choose params = {ready = ready}}
		]
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center center]
	}
	if ((IsHost) && ($primary_controller = <controller>))
		MyInterfaceElement :GetTags
		if (<net_gig_ready> = 0)
			<id> :SE_SetProps not_focusable rgba = [50 44 35 255]
		endif
	endif
endscript

script ui_band_mode_create_friends_list 
	GetTags
	generic_menu_pad_choose_sound
	NetSessionFunc obj = friends func = begin_retrieve_friends_list params = {callback = career_friendslist_callback device_num = <controller> callback_params = {menu_index = <index>}}
endscript

script ui_band_mode_create_invite 
	Obj_GetID
	GetTags
	CreateScreenElement {
		type = TextBlockElement
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		dims = (200.0, 30.0)
		parent = <ObjID>
		text = <friend_name>
		font = fontgrid_text_a6
		rgba = [200 0 0 255]
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
		]
		not_focusable
		internal_scale = 0.75
		just = [center bottom]
		internal_just = [center top]
	}
	if isXenon
		switch <friend_friendstate>
			case online
			status_texture = friendslist_online
			case offline
			status_texture = friendslist_offline
			case away
			status_texture = friendslist_away
			case busy
			status_texture = friendslist_busy
		endswitch
		CreateScreenElement {
			type = SpriteElement
			parent = <ObjID>
			texture = <status_texture>
			dims = (32.0, 32.0)
			just = [center top]
			not_focusable
		}
		CreateScreenElement {
			type = TextBlockElement
			parent = <ObjID>
			text = qs("VIEW GAMER CARD")
			font = fontgrid_text_a6
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 30.0)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose menu_show_gamercard_from_netid params = {net_id = <friend_id>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	DONT_SHOW_INVITE_OPTIONS = 0
	if GotParam \{CANT_INVITE}
		if (1 = <CANT_INVITE>)
			<DONT_SHOW_INVITE_OPTIONS> = 1
		endif
	endif
	if NOT IsPs3
		if (0 = <DONT_SHOW_INVITE_OPTIONS>)
			if (<friend_sentfriendrequest> = true)
				CreateScreenElement {
					type = TextBlockElement
					parent = <ObjID>
					text = qs("FRIEND REQUEST PENDING")
					font = fontgrid_text_a6
					fit_height = `scale down if larger`
					dims = (200.0, 90.0)
					rgba = [200 0 0 255]
					event_handlers = [
						{focus retail_menu_focus}
						{unfocus retail_menu_unfocus}
					]
					not_focusable
					internal_scale = 0.75
					just = [center bottom]
					internal_just = [center center]
				}
				<ObjID> :SetProps replace_handlers event_handlers = [
					{pad_up nullscript}
					{pad_down nullscript}
				]
			else
				CreateScreenElement {
					type = TextBlockElement
					parent = <ObjID>
					text = qs("INVITE AS GUITAR")
					font = fontgrid_text_a6
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					dims = (200.0, 30.0)
					rgba = ($menu_unfocus_color)
					event_handlers = [
						{focus retail_menu_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = guitar index = <index>}}
						{pad_choose generic_menu_pad_choose_sound}
					]
					internal_scale = 0.75
					just = [center bottom]
					internal_just = [center center]
				}
				CreateScreenElement {
					type = TextBlockElement
					parent = <ObjID>
					text = qs("INVITE AS DRUM")
					font = fontgrid_text_a6
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					dims = (200.0, 30.0)
					rgba = ($menu_unfocus_color)
					event_handlers = [
						{focus retail_menu_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = drum index = <index>}}
						{pad_choose generic_menu_pad_choose_sound}
					]
					internal_scale = 0.75
					just = [center bottom]
					internal_just = [center center]
				}
				CreateScreenElement {
					type = TextBlockElement
					parent = <ObjID>
					text = qs("INVITE AS VOCALS")
					font = fontgrid_text_a6
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					dims = (200.0, 30.0)
					rgba = ($menu_unfocus_color)
					event_handlers = [
						{focus retail_menu_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = mic index = <index>}}
						{pad_choose generic_menu_pad_choose_sound}
					]
					internal_scale = 0.75
					just = [center bottom]
					internal_just = [center center]
				}
			endif
		endif
	else
		CreateScreenElement {
			type = TextBlockElement
			parent = <ObjID>
			text = qs("INVITE AS GUITAR")
			font = fontgrid_text_a6
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 30.0)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = guitar index = <index>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
		CreateScreenElement {
			type = TextBlockElement
			parent = <ObjID>
			text = qs("INVITE AS DRUM")
			font = fontgrid_text_a6
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 30.0)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = drum index = <index>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
		CreateScreenElement {
			type = TextBlockElement
			parent = <ObjID>
			text = qs("INVITE AS VOCALS")
			font = fontgrid_text_a6
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			dims = (200.0, 30.0)
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose ui_band_mode_choose params = {invites = friends net_id = <friend_id> name = <friend_name> instrument_type = mic index = <index>}}
				{pad_choose generic_menu_pad_choose_sound}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
		}
	endif
	RemoveTags \{[
			friend_name
			friend_id
			friend_sentfriendrequest
			friend_sentinvite
			friend_friendstate
			CANT_INVITE
		]}
endscript

script ui_band_mode_create_gigs 
	Obj_GetID
	SE_GetParentId
	<parent_id> :SE_GetParentId
	GetTags
	event_handlers = [
		{focus ui_band_mode_create_gigs_focus}
		{unfocus ui_band_mode_create_gigs_unfocus}
	]
	CreateScreenElement {
		type = ContainerElement
		parent = <ObjID>
		just = [center center]
		not_focusable
		dims = (128.0, 32.0)
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <id>
		texture = name_arrow_up
		just = [center bottom]
		pos_anchor = [center bottom]
		pos = (0.0, 0.0)
		scale = 1.15
	}
	i = ($current_gig_number)
	if ((<i> < 1) || (<i> > (($GH4_Career_Band_Songs.num_tiers) -2)))
		i = 1
	endif
	FormatText checksumname = tier 'tier%i' i = <i>
	format_globaltag_gigname setlist_prefix = ($GH4_Career_Band_Songs.prefix) gignum = <i>
	get_savegame_from_controller controller = <controller>
	GetGlobalTags <gig_name> savegame = <savegame>
	if (<i> < 10)
		FormatText checksumname = texture 'gig_poster_small_0%i' i = <i>
	else
		FormatText checksumname = texture 'gig_poster_small_%i' i = <i>
	endif
	if NOT GotParam \{first_texture}
		first_texture = <texture>
		if (<completed> = 1 || <completed> = 2)
			first_complete = 1
		endif
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <ObjID>
		dims = (100.0, 125.0)
		event_handlers = <event_handlers>
		just = [center center]
		tags = {
			index = <i>
			controller = <controller>
		}
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <id>
		texture = <texture>
		dims = (100.0, 125.0)
		just = [center center]
		pos_anchor = [center center]
		pos = (0.0, 0.0)
	}
	diff_alpha = 0
	if (<completed> = 1 || <completed> = 2)
		diff_alpha = 1
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = <id>
		texture = Gig_poster_checkmark_128
		just = [center center]
		pos_anchor = [center center]
		pos = (0.0, 0.0)
		alpha = <diff_alpha>
	}
	CreateScreenElement {
		type = ContainerElement
		parent = <ObjID>
		just = [center center]
		not_focusable
		dims = (128.0, 32.0)
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <id>
		texture = name_arrow_dn
		just = [center top]
		pos_anchor = [center top]
		scale = 1.15
		pos = (0.0, 0.0)
	}
	<ObjID> :SetProps event_handlers = [
		{pad_up ui_band_mode_create_gigs_scroll}
		{pad_down ui_band_mode_create_gigs_scroll params = {down}}
	]
	MyInterfaceElement :GetTags
	if GotParam \{descs}
		current_desc = (<descs> [<index>])
		ui_band_mode_hide_arrows id = <current_desc>
	endif
endscript

script ui_band_mode_create_gigs_scroll 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	GetTags
	Obj_GetID
	ResolveScreenElementId id = {<ObjID> child = {1 child = 0}}
	<resolved_id> :GetTags
	if (<index> < 1)
		index = 1
	elseif (<index> > (($GH4_Career_Band_Songs.num_tiers) -2))
		index = (($GH4_Career_Band_Songs.num_tiers) -2)
	endif
	if GotParam \{down}
		i = (<index> + 1)
		RunScriptOnScreenElement id = {<ObjID> child = {2 child = 0}} ui_band_mode_create_gigs_blink_arrow
	else
		i = (<index> - 1)
		RunScriptOnScreenElement id = {<ObjID> child = {0 child = 0}} ui_band_mode_create_gigs_blink_arrow
	endif
	begin
	if (<i> < 1)
		i = (($GH4_Career_Band_Songs.num_tiers) -2)
	elseif (<i> > (($GH4_Career_Band_Songs.num_tiers) -2))
		i = 1
	endif
	if (<i> = <index>)
		break
	endif
	FormatText checksumname = tier 'tier%i' i = <i>
	format_globaltag_gigname setlist_prefix = ($GH4_Career_Band_Songs.prefix) gignum = <i>
	get_savegame_from_controller controller = <controller>
	GetGlobalTags <gig_name> savegame = <savegame>
	if (<unlocked> = 1)
		if (<i> < 10)
			FormatText checksumname = texture 'gig_poster_small_0%i' i = <i>
		else
			FormatText checksumname = texture 'gig_poster_small_%i' i = <i>
		endif
		<resolved_id> :SE_SetProps texture = <texture>
		if (<completed> = 1 || <completed> = 2)
			SetScreenElementProps id = {<resolved_id> child = 0} alpha = 1.0
		else
			SetScreenElementProps id = {<resolved_id> child = 0} alpha = 0.0
		endif
		break
	endif
	if GotParam \{down}
		i = (<i> + 1)
	else
		i = (<i> - 1)
	endif
	repeat
	<resolved_id> :SetTags index = <i>
	if GotParam \{down}
		<resolved_id> :obj_spawnscript ui_band_mode_create_gigs_move_poster params = {down}
	else
		i = (<index> + 1)
		<resolved_id> :obj_spawnscript ui_band_mode_create_gigs_move_poster
	endif
endscript

script ui_band_mode_create_gigs_choose 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	GetTags
	band_mode_menu :SetTags \{net_gig_ready = 1}
	generic_menu_pad_choose_sound
	change \{current_progression_flag = Career_Band}
	change current_gig_number = <index>
	ui_band_mode_choose \{gigs}
endscript

script ui_band_mode_create_gigs_blink_arrow 
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	SE_SetProps \{scale = 1.3499999
		time = 0.1
		motion = ease_in}
	SE_WaitProps
	SE_SetProps \{scale = 1.15
		time = 0.1
		motion = ease_out}
endscript

script ui_band_mode_create_gigs_move_poster 
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	SE_SetProps \{alpha = 0.0}
	if GotParam \{down}
		SE_SetProps \{pos = (0.0, -10.0)}
		SE_SetProps \{alpha = 1.0
			pos = (0.0, 0.0)
			time = 0.1
			motion = ease_out}
	else
		SE_SetProps \{pos = (0.0, 10.0)}
		SE_SetProps \{alpha = 1.0
			pos = (0.0, 0.0)
			time = 0.1
			motion = ease_out}
	endif
endscript

script ui_band_mode_create_gigs_focus 
endscript

script ui_band_mode_create_gigs_unfocus 
endscript

script ui_band_mode_create_menu_gamer_cards 
	Obj_GetID
	if ($is_network_game = 1)
		if NOT ($net_band_mode_menu = lobby)
			NetSessionFunc \{obj = party
				func = get_party_members}
			GetArraySize <connections>
			i = 0
			begin
			CreateScreenElement {
				type = ContainerElement
				parent = <ObjID>
				dims = (200.0, 40.0)
				just = [center bottom]
			}
			container_id = <id>
			CreateScreenElement {
				type = TextBlockElement
				fit_width = `expand dims`
				fit_height = `scale down if larger`
				parent = <id>
				text = (<connections> [<i>].gamertag)
				font = fontgrid_text_a6
				dims = (0.0, 40.0)
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{focus career_friendslist_scroll}
					{unfocus career_friendslist_stop_scroll}
				]
				internal_scale = 0.75
				just = [left bottom]
				internal_just = [left center]
				pos_anchor = [left bottom]
				pos = (0.0, 0.0)
			}
			GetScreenElementDims id = <id>
			if NOT (<width> > 200)
				<id> :SE_SetProps {
					just = [center bottom]
					internal_just = [center center]
					pos_anchor = [center bottom]
					pos = (0.0, 0.0)
				}
			endif
			<container_id> :SE_SetProps {
				focusable_child = <id>
				event_handlers = [
					{pad_choose menu_show_gamercard_from_netid params = {net_id = (<connections> [<i>].user_id)}}
					{pad_choose generic_menu_pad_choose_sound}
				]
			}
			i = (<i> + 1)
			repeat <array_size>
		else
			i = 0
			begin
			net_id = [0 0]
			GetPlayerInfo (<i> + 1) net_id_first
			GetPlayerInfo (<i> + 1) net_id_second
			SetArrayElement ArrayName = net_id index = 0 newvalue = <net_id_first>
			SetArrayElement ArrayName = net_id index = 1 newvalue = <net_id_second>
			GetPlayerInfo (<i> + 1) gamertag
			name = $<gamertag>
			CreateScreenElement {
				type = TextBlockElement
				fit_width = `scale each line if larger`
				fit_height = `scale down if larger`
				parent = <ObjID>
				text = <name>
				font = fontgrid_text_a6
				dims = (200.0, 40.0)
				allow_expansion
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose menu_show_gamercard_from_netid params = {net_id = <net_id>}}
				]
				internal_scale = 0.75
				just = [center bottom]
				internal_just = [center center]
			}
			i = (<i> + 1)
			repeat ($current_num_players)
		endif
	else
		printf \{qs("\Lnot too sure if game side guys will use this")}
		MyInterfaceElement :GetTags
		GetArraySize \{menus}
		i = 0
		begin
		curr_menu = (<menus> [<i>])
		<curr_menu> :GetTags
		if NOT (<menu> = join)
			NetSessionFunc obj = match func = get_gamertag params = {controller = <controller>}
			NetSessionFunc func = get_user_id params = {controller_index = <controller>}
			if (<name> = qs("\L"))
				FormatText TextName = name qs("Controller\_%n") n = (<controller> + 1)
			endif
			CreateScreenElement {
				type = TextBlockElement
				parent = <ObjID>
				text = <name>
				font = fontgrid_text_a6
				dims = (200.0, 40.0)
				allow_expansion
				rgba = ($menu_unfocus_color)
				event_handlers = [
					{focus retail_menu_focus}
					{unfocus retail_menu_unfocus}
					{pad_choose ui_band_mode_show_gamertag params = {net_id = <user_id> device_num = <controller>}}
				]
				internal_scale = 0.75
				just = [center bottom]
				internal_just = [center center]
			}
		else
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_band_mode_show_gamertag 
	if NOT GotParam \{device_num}
		return
	endif
	if IsLocallySignedIn controller = <device_num>
		if GotParam \{net_id}
			NetSessionFunc func = showGamerCard params = {player_xuid = <net_id> controller_index = <device_num>}
		endif
	endif
endscript

script ui_band_mode_choose 
	SE_GetParentId
	if (($is_network_game = 1) && ($net_band_mode_menu = lobby))
		get_player_num_from_controller controller_index = <device_num>
		MyInterfaceElement :GetSingleTag \{menus}
		if NOT IsScreenElementInFocus id = (<menus> [(<player_num> - 1)])
			return
		endif
	endif
	if GotParam \{instrument}
		SetSpawnInstanceLimits \{max = 1
			management = ignore_spawn_request}
		if ($is_network_game = 1)
			<parent_id> :GetSingleTag controller
		else
			get_player_num_from_controller controller_index = <device_num>
			GetPlayerInfo <player_num> controller
		endif
		ui_get_controller_parts_allowed controller = <controller>
		if NOT StructureContains Structure = <allowed> <instrument>
			generic_event_choose state = uistate_select_instrument_warning data = {instrument = <instrument> controller = <controller>}
			return
		elseif GetSingleTag \{has_mic}
			if ((<instrument> = Vocals) && (<has_mic> = 0))
				generic_event_choose state = uistate_select_instrument_warning data = {instrument = <instrument> controller = <controller>}
				return
			endif
		endif
		temp_instrument = <instrument>
		MyInterfaceElement :GetSingleTag \{menus}
		GetArraySize <menus>
		<parent_id> :GetSingleTag index
		i = 0
		begin
		if NOT (<i> = <index>)
			curr_menu = (<menus> [<i>])
			<curr_menu> :GetSingleTag instrument
			if NOT (<instrument> = none)
				if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || ($game_mode = p2_battle))
					if NOT (<instrument> = <temp_instrument>)
						return
					endif
				else
					if (<instrument> = <temp_instrument>)
						return
					endif
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
		instrument = <temp_instrument>
		switch <instrument>
			case guitar
			Anim = guitar
			ui_band_mode_choose_sound controller = <controller>
			case Bass
			Anim = Bass
			ui_band_mode_choose_sound controller = <controller>
			case drum
			Anim = Drums
			ui_band_mode_choose_sound controller = <controller>
			case Vocals
			Anim = Vocals
			ui_band_mode_choose_sound controller = <controller>
		endswitch
		if ($is_network_game = 0)
			hacky_fix_band_celebrity_character player = <player_num>
		endif
		if cas_player_has_character_object player = (<device_num> + 1)
			Band_PlayAnim name = <character_object> Anim = <Anim> no_wait
		endif
		<parent_id> :SetTags {instrument = <instrument>}
		if ($is_network_game = 1)
			<parent_id> :SetTags {menu = net_local_root}
			get_player_num_from_controller controller_index = <device_num>
			SendStructure callback = spawn_net_ui_band_mode_choose data_to_send = {instrument = <instrument> player_num = <player_num> spawn_script_now}
		else
			<parent_id> :SetTags {menu = lefty}
		endif
	elseif GotParam \{lefty}
		if ($is_network_game = 1)
			<parent_id> :SetTags {menu = net_local_root}
		else
			<parent_id> :SetTags {menu = difficulty}
		endif
		get_player_num_from_controller controller_index = <device_num>
		ui_band_mode_choose_sound instrument = `default` controller = <controller>
		switch (<lefty>)
			case standard
			SetPlayerInfo <player_num> lefty_flip = 0
			SetPlayerInfo <player_num> lefthanded_gems = 0
			SetPlayerInfo <player_num> lefthanded_button_ups = 0
			SetPlayerInfo <player_num> lefthanded_button_ups_flip_save = 0
			SetPlayerInfo <player_num> lefthanded_gems_flip_save = 0
			case lefty
			SetPlayerInfo <player_num> lefty_flip = 1
			SetPlayerInfo <player_num> lefthanded_gems = 1
			SetPlayerInfo <player_num> lefthanded_button_ups = 1
			SetPlayerInfo <player_num> lefthanded_button_ups_flip_save = 1
			SetPlayerInfo <player_num> lefthanded_gems_flip_save = 1
			default
			<has_mic> = 0
			if controller_has_headset controller = <device_num>
				<has_mic> = 1
			elseif IsMicrophonePluggedIn
				<has_mic> = 1
			endif
			if (<has_mic> = 0)
				generic_event_choose state = uistate_select_instrument_warning data = {instrument = Vocals controller = <device_num>}
				return
			endif
			SetPlayerInfo <player_num> vocals_highway_view = <lefty>
		endswitch
	elseif GotParam \{difficulty}
		if <parent_id> :GetSingleTag instrument
			if (<instrument> = Vocals)
				<has_mic> = 0
				if controller_has_headset controller = <device_num>
					<has_mic> = 1
				elseif IsMicrophonePluggedIn
					<has_mic> = 1
				endif
				if (<has_mic> = 0)
					generic_event_choose state = uistate_select_instrument_warning data = {instrument = Vocals controller = <device_num>}
					return
				endif
			endif
		endif
		<parent_id> :SetTags {difficulty = <difficulty>}
		ui_band_mode_choose_sound instrument = `default` controller = <controller>
		SetArrayElement ArrayName = default_difficulty GlobalArray index = <device_num> newvalue = <difficulty>
		if ($is_network_game = 1)
			<parent_id> :SetTags {menu = net_local_root}
			get_player_num_from_controller controller_index = <device_num>
			SendStructure callback = spawn_net_ui_band_mode_choose data_to_send = {difficulty = <difficulty> player_num = <player_num> spawn_script_now}
		else
			<parent_id> :SetTags {menu = ready2}
			MyInterfaceElement :obj_spawnscript \{ui_band_difficulty_continue}
		endif
	elseif GotParam \{root}
		if (<root> = instrument)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :SetTags {menu = instrument}
			if ($is_network_game = 1)
				<parent_id> :SetTags {instrument = none}
				MyInterfaceElement :SetTags \{net_instruments_ready = 0}
				get_player_num_from_controller controller_index = <device_num>
				SendStructure callback = spawn_net_ui_band_mode_choose data_to_send = {instrument = none player_num = <player_num> spawn_script_now}
			endif
		elseif (<root> = lefty)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :SetTags {menu = lefty}
		elseif (<root> = difficulty)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :SetTags {menu = difficulty}
		elseif (<root> = character)
			<parent_id> :SetTags {menu = character}
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
		elseif (<root> = p2_character)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :SetTags {menu = p2_character}
		elseif (<root> = friends)
			<parent_id> :SetTags {menu = friends}
		elseif (<root> = gigs)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :SetTags {menu = gigs}
		elseif (<root> = gamer_cards)
			ui_band_mode_choose_sound instrument = `default` controller = <controller>
			<parent_id> :SetTags {menu = gamer_cards}
		endif
	elseif GotParam \{ready}
		if (<ready> = ready)
			<parent_id> :SetTags {menu = ready}
			if ($net_band_mode_menu = lobby)
				get_player_num_from_controller controller_index = <device_num>
				SendStructure callback = spawn_net_ui_band_mode_choose data_to_send = {ready = ready player_num = <player_num> spawn_script_now}
			elseif (($net_band_mode_menu = invite) || ($net_band_mode_menu = HOST))
				<parent_id> :GetSingleTag user_id
			endif
		elseif (<ready> = p2_ready)
			<parent_id> :SetTags {menu = p2_ready}
			MyInterfaceElement :obj_spawnscript \{ui_character_hub_continue}
		endif
	elseif GotParam \{join}
		ui_band_mode_choose_sound controller = <device_num>
		if ($is_network_game = 1)
			if (($net_band_mode_menu = HOST) || ($net_band_mode_menu = join))
				if isXenon
					if NOT (CheckForSignIn controller_index = <device_num>)
						ui_band_mode_signin device_num = <device_num>
						net_career_wait_until_menu_update_is_done
						<parent_id> :obj_spawnscript ui_band_mode_update_menu
						return
					endif
				else
					printf \{qs("\Lps3 stuff")}
				endif
			endif
		else
			if GotParam \{change_profile}
				if NOT IsAnyControllerSignedIn
					ui_band_mode_signin device_num = <device_num>
					return
				endif
			endif
		endif
		<parent_id> :GetTags
		MyInterfaceElement :GetTags
		if IsGuitarController controller = <controller>
			if (<controller_instrument> != guitar)
				if (<current_guitar> = <total_guitar>)
					update_network_ticker \{msg_checksum = max_guitars}
					return
				endif
			endif
			<parent_id> :SetTags controller_instrument = guitar
			MyInterfaceElement :SetTags {current_guitar = (<current_guitar> + 1)}
		elseif IsDrumController controller = <controller>
			if (<controller_instrument> != drum)
				if (<current_drum> = <total_drum>)
					update_network_ticker \{msg_checksum = max_drum}
					return
				endif
			endif
			<parent_id> :SetTags controller_instrument = drum
			MyInterfaceElement :SetTags {current_drum = (<current_drum> + 1)}
		elseif (($allow_controller_for_all_instruments) = 0)
			if ($is_network_game = 1)
				mic = 0
				if IsMicrophonePluggedIn
					mic = 1
				endif
				if is_regular_controller controller = <controller>
					if controller_has_headset controller = <controller>
						mic = 1
					endif
				endif
				if (0 = <mic>)
					update_network_ticker \{msg_checksum = no_mic}
					return
				endif
			endif
			if (<controller_instrument> != mic)
				if (<current_mic> = <total_mic>)
					update_network_ticker \{msg_checksum = max_vocals}
					return
				endif
			endif
			<parent_id> :SetTags controller_instrument = mic
			MyInterfaceElement :SetTags {current_mic = (<current_mic> + 1)}
		endif
		if ($is_network_game = 1)
			NetSessionFunc func = AddControllers params = {controller = <controller>}
			NetSessionFunc func = get_user_id params = {controller_index = <controller>}
			<parent_id> :SetTags marked_in = 1
			update_network_ticker msg_checksum = join controller = <device_num>
			if ((<menu> = net_remote_root))
				net_move_invite_player_to_open_menu menu_id = <parent_id>
				<parent_id> :obj_spawnscript ui_band_mode_update_name params = {controller = <device_num>}
				<parent_id> :obj_spawnscript ui_band_mode_check_disconnect
			endif
			<parent_id> :SetTags user_id = <user_id>
			menu = net_local_join
		else
			menu = root
		endif
		get_player_num_from_controller controller_index = <controller>
		ui_band_mode_show_character player = <player_num>
		<parent_id> :SetTags {menu = <menu>}
		isguest = false
		if isXenon
			if NetSessionFunc func = XenonIsGuest params = {controller_index = <device_num>}
				isguest = true
			endif
		endif
		ui_band_mode_save_tags controller = <device_num>
		if GotParam \{change_profile}
			if NOT IsAnyControllerSignedIn
				ui_band_mode_signin device_num = <device_num>
			else
				change \{signin_glitch_protect = 1}
				generic_event_replace state = uistate_signin data = {device_num = <device_num> new_data = {controller = <device_num>} allow_back = 1 new_state = UIstate_band_mode primary = 0 force_signin = 1}
			endif
		else
			if IsLocallySignedIn controller = <device_num>
				if (<isguest> = false)
					if NOT current_band_has_band_name controller = <device_num>
						change \{signin_glitch_protect = 1}
						generic_event_replace no_sound state = uistate_signin data = {device_num = <device_num> new_data = {controller = <device_num>} allow_back = 1 new_state = UIstate_band_mode primary = 0}
					endif
				endif
			else
			endif
		endif
	elseif GotParam \{character}
		if (<character> = character)
			<parent_id> :SetTags {menu = root}
		elseif (<character> = p2_character)
			if ($is_network_game = 1)
				<parent_id> :SetTags {menu = net_local_join}
			else
				<parent_id> :SetTags {menu = p2_root}
			endif
		endif
	elseif GotParam \{gigs}
		if ($is_network_game = 1)
			<parent_id> :SetTags {menu = net_local_root}
		else
			<parent_id> :SetTags {menu = root}
		endif
	elseif GotParam \{net_local_join}
		ui_band_mode_choose_sound instrument = `default` controller = <controller>
		<parent_id> :SetTags {menu = gamer_cards}
	elseif GotParam \{friends}
		ui_band_mode_choose_sound back controller = <controller>
		<parent_id> :SetTags {
			menu = invites
			friend_name = <name>
			friend_id = <id>
			friend_sentfriendrequest = <sentfriendrequest>
			friend_sentinvite = <sentinvite>
			friend_friendstate = <friendstate>
			CANT_INVITE = <CANT_INVITE>
		}
	elseif GotParam \{invites}
		if NOT IsPs3
			<parent_id> :SetTags {menu = friends}
		else
			<parent_id> :SetTags {menu = invites}
		endif
		invite_to_game net_id = <net_id> name = <name> instrument = <instrument_type> menu_index = <index>
	elseif GotParam \{edit_hero}
		ui_band_mode_choose_sound instrument = `default` controller = <controller>
		band_edit_character player = <player>
	elseif GotParam \{band_info}
		ui_band_mode_choose_sound instrument = `default` controller = <controller>
		menu_choose_band_make_selection band_index = <band_index> from_options = <from_options>
	endif
	begin
	if NOT ScriptIsRunning \{ui_band_mode_update_menu}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	<parent_id> :obj_spawnscript ui_band_mode_update_menu
	if ($is_network_game = 1)
		ui_event_get_stack
		if ((<stack> [0].base_name) = 'band_mode')
			ui_band_mode_helper_text <...>
		endif
	else
		ui_band_mode_helper_text <...>
	endif
endscript

script spawn_net_ui_band_mode_choose 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :Obj_SpawnScriptNow net_ui_band_mode_choose params = {<...>}
	endif
endscript

script net_ui_band_mode_choose 
	i = 0
	begin
	if (<player_num> = <i>)
		GetPlayerInfo <player_num> is_local_client
		if (<is_local_client> = 1)
			return
		endif
	endif
	i = (<i> + 1)
	repeat 8
	MyInterfaceElement :GetSingleTag \{menus}
	if GotParam \{instrument}
		(<menus> [(<player_num> - 1)]) :SetTags {instrument = <instrument>}
		data_to_send = {instrument = <instrument> player_num = <player_num> spawn_script_now}
		if (<instrument> = none)
			MyInterfaceElement :SetTags \{net_instruments_ready = 0}
		endif
	elseif GotParam \{difficulty}
		(<menus> [(<player_num> - 1)]) :SetTags {difficulty = <difficulty>}
		data_to_send = {difficulty = <difficulty> player_num = <player_num> spawn_script_now}
	elseif GotParam \{ready}
		(<menus> [(<player_num> - 1)]) :SetTags {menu = ready}
		data_to_send = {ready = ready player_num = <player_num> spawn_script_now}
	elseif GotParam \{character}
		data_to_send = {character = <character> character_id = <character_id> player_num = <player_num> spawn_script_now}
	endif
	if IsHost
		SendStructure callback = spawn_net_ui_band_mode_choose data_to_send = <data_to_send>
	endif
	begin
	if NOT ScriptIsRunning \{ui_band_mode_update_menu}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	(<menus> [(<player_num> - 1)]) :obj_spawnscript ui_band_mode_update_menu
	ui_event_get_stack
	if ((<stack> [0].base_name) = 'band_mode')
		ui_band_mode_helper_text
	endif
endscript

script ui_band_mode_back 
	GetTags
	SE_GetParentId
	if (($is_network_game = 1) && ($net_band_mode_menu = lobby))
		get_player_num_from_controller controller_index = <device_num>
		MyInterfaceElement :GetSingleTag \{menus}
		if NOT IsScreenElementInFocus id = (<menus> [(<player_num> - 1)])
			return
		endif
	endif
	switch <menu>
		case instrument
		if ($is_network_game = 1)
			SetTags \{menu = net_local_root}
			ui_band_mode_choose_sound back controller = <controller>
		else
			cas_queue_wait
			generic_event_back \{nosound}
			ui_band_mode_choose_sound back controller = <controller>
		endif
		case lefty
		if ($is_network_game = 1)
			SetTags \{menu = net_local_root}
		else
			SetTags \{menu = instrument
				instrument = none}
		endif
		ui_band_mode_choose_sound back controller = <controller>
		case difficulty
		if ($is_network_game = 1)
			SetTags \{menu = net_local_root}
			ui_band_mode_choose_sound back controller = <controller>
		else
			SetTags \{menu = lefty}
			ui_band_mode_choose_sound back controller = <controller>
		endif
		case character
		get_player_num_from_controller controller_index = <controller>
		band_character_select_back_out player = <player_num> controller = <controller>
		SetTags \{menu = root}
		ui_band_mode_choose_sound back controller = <controller>
		case p2_character
		if ($is_network_game = 1)
			ui_band_mode_choose_sound back controller = <controller>
			get_player_num_from_controller controller_index = <controller>
			band_character_select_back_out player = <player_num> controller = <controller>
			SetTags \{menu = net_local_join}
		else
			SetTags \{menu = p2_root}
		endif
		case root
		get_player_num_from_controller controller_index = <controller>
		printf qs(0xa976f510) d = <player_num>
		if ((<player_num> > 4) || (<player_num> < 1))
			return
		endif
		ui_band_mode_kill_character player = <player_num>
		MyInterfaceElement :GetTags
		ui_band_mode_choose_sound back controller = <controller>
		GetSingleTag \{controller_instrument}
		switch <controller_instrument>
			case guitar
			MyInterfaceElement :SetTags {current_guitar = (<current_guitar> - 1)}
			case drum
			MyInterfaceElement :SetTags {current_drum = (<current_drum> - 1)}
			case mic
			if (($allow_controller_for_all_instruments) = 0)
				MyInterfaceElement :SetTags {current_mic = (<current_mic> - 1)}
			endif
		endswitch
		SetTags \{controller_instrument = none}
		SetTags \{menu = join
			instrument = none
			difficulty = none}
		case p2_root
		change menu_flow_locked = ($menu_flow_locked + 1)
		cas_queue_wait
		change menu_flow_locked = ($menu_flow_locked - 1)
		generic_event_back
		case join
		if ($is_network_game = 1)
			if ($primary_controller = <controller>)
				printf \{qs(0x1952b0fd)}
				career_quit_warning_popup
			else
				return
			endif
		else
			cas_destroy_all_characters
			generic_event_back \{nosound}
			ui_band_mode_choose_sound back controller = <controller>
		endif
		case ready
		if ($is_network_game = 1)
			if ($net_band_mode_menu = lobby)
				SetTags \{menu = net_local_root}
				get_player_num_from_controller controller_index = <device_num>
				SendStructure callback = spawn_net_ui_band_mode_back data_to_send = {player_num = <player_num> spawn_script_now}
			else
				<parent_id> :GetSingleTag user_id
				SetTags \{menu = net_local_join}
			endif
		else
			SetTags \{menu = root}
		endif
		ui_band_mode_choose_sound back controller = <controller>
		MyInterfaceElement :GetSingleTag \{descs}
		current_desc = (<descs> [<index>])
		ui_band_mode_animate_unready current_desc = <current_desc>
		case net_local_root
		if ($net_popup_active = 0)
			if NOT ScriptIsRunning \{net_ui_band_mode_countdown_to_gig}
				ui_event_get_top
				if (<base_name> = 'band_mode')
					generic_blocking_execute_script pad_script = generic_event_choose pad_params = {data = {state = uistate_online_quit_warning is_popup player_device = <device_num>}}
				endif
			endif
		endif
		return
		case net_local_join
		ui_band_mode_choose_sound back controller = <controller>
		get_player_num_from_controller controller_index = <controller>
		printf qs(0x2fc5a7b8) d = <player_num>
		if ((<player_num> > 4) || (<player_num> < 1))
			return
		endif
		ui_band_mode_kill_character player = <player_num>
		MyInterfaceElement :GetTags
		GetSingleTag \{controller_instrument}
		switch <controller_instrument>
			case guitar
			MyInterfaceElement :SetTags {current_guitar = (<current_guitar> - 1)}
			case drum
			MyInterfaceElement :SetTags {current_drum = (<current_drum> - 1)}
			case mic
			if (($allow_controller_for_all_instruments) = 0)
				MyInterfaceElement :SetTags {current_mic = (<current_mic> - 1)}
			endif
		endswitch
		SetTags \{controller_instrument = none}
		if isXenon
			(<descs> [<index>]) :Obj_KillSpawnedScript name = update_headset_status
		endif
		(<descs> [<index>]) :SE_SetProps headset_icon_alpha = (0.0)
		NetSessionFunc func = RemoveController params = {controller = <controller>}
		SetTags \{menu = join
			instrument = none
			difficulty = none
			marked_in = 0}
		update_network_ticker \{msg_checksum = signin_change}
		case friends
		ui_band_mode_choose_sound back controller = <controller>
		SetTags \{menu = net_local_join}
		case invites
		ui_band_mode_choose_sound back controller = <controller>
		if NOT IsPs3
			SetTags \{menu = friends}
		else
			SetTags \{menu = net_local_join}
		endif
		case gigs
		if ($is_network_game = 1)
			SetTags \{menu = net_local_root}
		else
			SetTags \{menu = root}
		endif
		ui_band_mode_choose_sound back controller = <controller>
		case ready2
		ui_band_mode_choose_sound back controller = <controller>
		SetTags \{menu = difficulty}
		MyInterfaceElement :GetSingleTag \{descs}
		current_desc = (<descs> [<index>])
		<current_desc> :SE_SetProps reposition_pos = (0.0, -20.0) ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
		<current_desc> :SE_WaitProps
		<current_desc> :SE_SetProps reposition_pos = (0.0, 0.0) time = 0.05 motion = ease_in
		case p2_ready
		SetTags \{menu = p2_root}
		ui_band_mode_choose_sound back controller = <controller>
		MyInterfaceElement :GetSingleTag \{descs}
		current_desc = (<descs> [<index>])
		<current_desc> :SE_SetProps reposition_pos = (0.0, -20.0) ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
		<current_desc> :SE_WaitProps
		<current_desc> :SE_SetProps reposition_pos = (0.0, 0.0) time = 0.05 motion = ease_in
		case gamer_cards
		ui_band_mode_choose_sound back controller = <controller>
		if ($is_network_game = 1)
			if NOT ($net_band_mode_menu = lobby)
				SetTags \{menu = net_local_join}
			else
				SetTags \{menu = net_local_root}
			endif
		else
			SetTags \{menu = root}
		endif
	endswitch
	if NOT (<menu> = join)
		ui_band_mode_helper_text
		ui_band_mode_update_menu
	endif
endscript

script spawn_net_ui_band_mode_back 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :Obj_SpawnScriptNow net_ui_band_mode_back params = {<...>}
	endif
endscript

script net_ui_band_mode_back 
	i = 0
	begin
	if (<player_num> = <i>)
		GetPlayerInfo <player_num> is_local_client
		if (<is_local_client> = 1)
			return
		endif
	endif
	i = (<i> + 1)
	repeat 8
	MyInterfaceElement :GetSingleTag \{menus}
	(<menus> [(<player_num> - 1)]) :GetTags
	switch <menu>
		case ready
		(<menus> [(<player_num> - 1)]) :SetTags {menu = net_remote_root}
		MyInterfaceElement :GetSingleTag \{descs}
		current_desc = (<descs> [(<player_num> - 1)])
		<current_desc> :SE_SetProps reposition_pos = (0.0, -20.0) ready_banner_pos = (0.0, 500.0) time = 0.1 motion = ease_in
		<current_desc> :SE_WaitProps
		<current_desc> :SE_SetProps reposition_pos = (0.0, 0.0) time = 0.05 motion = ease_in
		data_to_send = {menu = ready player_num = <player_num> spawn_script_now}
		case net_local_root
		printf \{qs("\Lmight need this for getting quit messages")}
		case character
		printf \{qs("\Lgoing to need this for character select stuff")}
		case net_remote_root
		printf \{qs("\Lwe're in a bad state, some how lost a ready message")}
		return
	endswitch
	if IsHost
		SendStructure callback = spawn_net_ui_band_mode_back data_to_send = <data_to_send>
	endif
	begin
	if NOT ScriptIsRunning \{ui_band_mode_update_menu}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	(<menus> [(<player_num> - 1)]) :obj_spawnscript ui_band_mode_update_menu
	ui_event_get_stack
	if ((<stack> [0].base_name) = 'band_mode')
		ui_band_mode_choose_sound back controller = <controller>
		ui_band_mode_helper_text
	endif
endscript

script ui_band_mode_continue 
	if Is_ui_event_running
		return
	endif
	if (($is_network_game = 1) && (($net_band_mode_menu = HOST) || ($net_band_mode_menu = join)))
		if NOT check_num_local_players
			return
		endif
	endif
	if (($is_network_game = 1) && ($net_band_mode_menu = HOST))
		if NOT (<device_num> = ($primary_controller))
			SoundEvent \{event = UI_SFX_Negative_Select}
			update_network_ticker \{msg_checksum = non_primary_post}
			return
		endif
	endif
	if ($is_network_game = 0)
		if (<device_num> != $band_mode_current_leader)
			SoundEvent \{event = UI_SFX_Negative_Select}
			update_network_ticker \{msg_checksum = non_primary_post}
			return
		endif
	endif
	GetTags
	num_ready = 0
	player = 1
	real_player = 1
	temp_devices = [-1 , -1 , -1 , -1]
	temp_devices_remove = [-1 , -1 , -1 , -1]
	array = []
	temp_characters = [arse arse arse arse]
	band_controller_types = [0 0 0 0]
	GetArraySize <menus>
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :GetTags
	add_player = 0
	if (<menu> = ready)
		add_player = 1
	endif
	if (<add_player> = 1)
		<num_ready> = (<num_ready> + 1)
		SetArrayElement ArrayName = temp_devices index = (<real_player> - 1) newvalue = <controller>
		if ($is_network_game)
			<check_cont> = ($primary_controller)
		else
			<check_cont> = $band_mode_current_leader
		endif
		if (<controller> = <check_cont>)
			primary_controller_ready = 1
		endif
		GetPlayerInfo (<i> + 1) character_id
		SetArrayElement ArrayName = temp_characters index = (<real_player> - 1) newvalue = <character_id>
		if NOT NetSessionFunc obj = match func = get_gamertag params = {controller = <i>}
			name = qs("\L")
		endif
		AddArrayElement array = <array> element = <name>
		if IsGuitarController controller = <controller>
			SetArrayElement ArrayName = band_controller_types index = (<real_player> - 1) newvalue = 1
		elseif IsDrumController controller = <controller>
			SetArrayElement ArrayName = band_controller_types index = (<real_player> - 1) newvalue = 2
		else
			SetArrayElement ArrayName = band_controller_types index = (<real_player> - 1) newvalue = 3
		endif
		<real_player> = (<real_player> + 1)
	else
		SetArrayElement ArrayName = temp_devices_remove index = <i> newvalue = <controller>
	endif
	i = (<i> + 1)
	repeat <array_size>
	printstruct <temp_devices>
	printstruct <temp_characters>
	if ($is_network_game = 1)
		GetArraySize <temp_devices>
		controller_index = 0
		begin
		if ((<temp_devices> [<controller_index>]) = <device_num>)
			ok_to_start_search = 1
		endif
		controller_index = (<controller_index> + 1)
		repeat <array_size>
		if NOT GotParam \{ok_to_start_search}
			return
		endif
		get_player_num_from_controller controller_index = <device_num>
		if NOT IsScreenElementInFocus id = (<menus> [(<player_num> - 1)])
			return
		endif
		if isXenon
			if NetSessionFunc func = XenonIsGuest params = {controller_index = <device_num>}
				SoundEvent \{event = UI_SFX_Negative_Select}
				spawnscriptnow \{update_network_ticker
					params = {
						msg_checksum = guest_continue
					}}
				return
			endif
		endif
		if NOT GotParam \{primary_controller_ready}
			if NOT ($net_band_mode_menu = join)
				spawnscriptnow \{update_network_ticker
					params = {
						msg_checksum = band_leader
					}}
				return
			endif
		endif
		if (<num_ready> > 0)
			change \{current_progression_flag = Career_Band}
		else
			return
		endif
	elseif (<num_ready> < 2)
		spawnscriptnow \{ui_band_mode_warning
			params = {
				text = qs("More players are needed for band play.")
			}}
		return
	elseif NOT GotParam \{primary_controller_ready}
		<text> = $wii_one_must_press_to_lead
		spawnscriptnow ui_band_mode_warning params = {text = <text>}
		return
	else
		change \{current_progression_flag = Career_Band}
	endif
	<player> = 1
	begin
	if ((<temp_devices> [(<player> - 1)]) < 0)
		ScriptAssert \{'Some player didnt get a controller set correctly'}
	endif
	if ((<temp_characters> [(<player> - 1)]) = arse)
		ScriptAssert \{'Some player didnt get a character set correctly'}
	endif
	FormatText checksumname = player_device 'player%d_device' d = <player>
	change globalname = <player_device> newvalue = (<temp_devices> [(<player> - 1)])
	FormatText checksumname = gamertag 'gamertag_%d' d = (<player> - 1)
	change globalname = <gamertag> newvalue = (<array> [(<player> - 1)])
	SetPlayerInfo <player> gamertag = <gamertag>
	SetPlayerInfo <player> controller = (<temp_devices> [(<player> - 1)])
	SetPlayerInfo <player> character_id = (<temp_characters> [(<player> - 1)])
	SetPlayerInfo <player> is_local_client = 1
	SetPlayerInfo <player> difficulty = ($default_difficulty [(<temp_devices> [(<player> - 1)])])
	if ($is_network_game = 1)
		GetNetID controller_index = (<temp_devices> [(<player> - 1)])
		NetSessionFunc func = get_gamertag params = {controller = (<temp_devices> [(<player> - 1)])}
		SetArrayElement ArrayName = temp_net_id GlobalArray index = (<temp_devices> [(<player> - 1)]) newvalue = {net_id_first = <net_id_first> net_id_second = <net_id_second> name = <name>}
	endif
	<player> = (<player> + 1)
	repeat (<real_player> - 1)
	GetArraySize <temp_devices_remove>
	i = 0
	begin
	if NOT ((<temp_devices_remove> [<i>]) = -1)
		NetSessionFunc func = RemoveController params = {controller = (<temp_devices_remove> [<i>])}
		cas_queue_kill_player player = (<i> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (($is_network_game = 1) && (<num_ready> < 4))
		remote_player = (<num_ready> + 1)
		begin
		SetPlayerInfo <remote_player> is_local_client = 0
		remote_player = (<remote_player> + 1)
		repeat (4 - <num_ready>)
	endif
	if ($band_mode_mode = quickplay || $band_mode_mode = none)
		FormatText checksumname = mode 'p%d_quickplay' d = <num_ready>
	elseif ($is_network_game = 1)
		mode = p4_career
		NetOptions :Pref_Choose \{name = game_modes
			checksum = p4_career}
		NetOptions :Pref_Choose \{name = ranked
			checksum = player}
		change num_players_in_band = <num_ready>
		set_network_preferences
	else
		FormatText checksumname = mode 'p%d_career' d = <num_ready>
	endif
	change game_mode = <mode>
	change current_num_players = <num_ready>
	change \{band_mode_active = 1}
	change \{in_join_band_screens = 0}
	change band_mode_actual_devices = <temp_devices>
	cancel_all_cas_loads
	clear_exclusive_devices
	i = 0
	begin
	if NOT (<temp_devices> [<i>] = -1)
		add_exclusive_device device = (<temp_devices> [<i>])
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	if ($band_mode_mode = quickplay)
		change primary_controller = ($band_mode_current_leader)
		change last_start_pressed_device = ($band_mode_current_leader)
		generic_event_choose no_sound state = uistate_setlist data = {use_all_controllers num_band_players = <num_ready> band_controller_types = <band_controller_types>}
		SoundEvent \{event = Band_Mode_Career_Ready}
	elseif ($is_network_game = 1)
		change \{respond_to_signin_changed_all_players = 1}
		SoundEvent \{event = Band_Mode_Career_Ready}
		if ($net_band_mode_menu = join)
			printf qs("\Lcurrent_num_players = %d") d = ($current_num_players)
			ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
			set_network_preferences
			open_band_mode_searching_popup
			<ranked> = player
			get_custom_match_search_params
			change \{net_career_end_game_already_called = 0}
			UpdateNumLocalPlayers
			change_controller_disconnect_scripts_on_all_menus \{change_type = remove}
			DWCJoinGame <...> join_friends = 0
		elseif ($net_band_mode_menu = HOST)
			RequireParams \{[
					device_num
				]
				all}
			change \{net_career_end_game_already_called = 0}
			UpdateNumLocalPlayers
			NetSessionFunc \{obj = party
				func = set_party_joinable
				params = {
					joinable = 0
				}}
			setup_and_post_game device_num = <device_num>
			change \{net_band_mode_menu = lobby}
			generic_event_choose \{no_sound
				state = UIstate_band_mode}
		endif
	else
		change primary_controller = ($band_mode_current_leader)
		change last_start_pressed_device = ($band_mode_current_leader)
		generic_event_choose \{state = uistate_band_difficulty
			no_sound
			data = {
				continue_data = {
					state = uistate_gig_posters
				}
			}}
		SoundEvent \{event = Band_Mode_Career_Ready}
	endif
endscript

script net_ui_band_mode_continue 
	printf qs("\Lwe have %d players in the band") d = ($num_players_in_band)
	if ($career_matchmaking_complete = 0)
		update_network_ticker \{msg_checksum = matchmaking_complete}
		return
	endif
	if ($num_players_in_band > 1)
		if (ScreenElementExists id = MyInterfaceElement)
			get_player_num_from_controller controller_index = <device_num>
			MyInterfaceElement :GetSingleTag \{menus}
			MyInterfaceElement :GetSingleTag \{net_gig_ready}
			(<menus> [(<player_num> - 1)]) :GetSingleTag menu
			if NOT (<menu> = ready)
				update_network_ticker \{msg_checksum = host_ready_up}
				return
			endif
			if (<net_gig_ready> = 1)
				if NOT ScriptIsRunning \{net_ui_band_mode_countdown_to_gig}
					if NOT (($net_career_selected_song = $current_song) || ($net_career_selected_gig = $current_gig_number))
						change current_song = ($net_career_selected_song)
						change current_gig_number = ($net_career_selected_gig)
					endif
					generic_menu_pad_choose_sound
					SendStructure \{callback = spawn_net_ui_band_mode_countdown_to_gig
						data_to_send = {
							none
						}}
					MyInterfaceElement :Obj_SpawnScriptNow \{net_ui_band_mode_countdown_to_gig}
				endif
			else
				update_network_ticker \{msg_checksum = no_gig_selected}
			endif
		endif
	else
		SoundEvent \{event = UI_SFX_Negative_Select}
		update_network_ticker \{msg_checksum = more_players_needed}
	endif
endscript

script net_career_invite_continue_to_lobby 
	NetSessionFunc \{obj = party
		func = get_party_members}
	GetArraySize \{connections}
	array = []
	remote_players = []
	num_players = 0
	if (<array_size> > 0)
		i = 0
		begin
		if ((<connections> [<i>].is_local) = 1)
			num_players = (<num_players> + 1)
			find_party_member_menu member_id = (<connections> [<i>].user_id)
			if (GotParam party_member_menu_checksum)
				<party_member_menu_checksum> :GetSingleTag controller
				AddArrayElement array = <array> element = <controller>
			endif
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	else
		ScriptAssert \{qs("\LSomehow our party object got cleared?!?")}
	endif
endscript

script spawn_net_ui_band_mode_countdown_to_gig 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :Obj_SpawnScriptNow \{net_ui_band_mode_countdown_to_gig}
	endif
endscript

script net_ui_band_mode_countdown_to_gig 
	ui_event_get_stack
	if NOT ((<stack> [0].base_name) = 'band_mode')
		generic_event_back
	endif
	update_network_ticker \{msg_checksum = waiting_for_data}
	i = 10
	begin
	update_network_ticker msg_checksum = count_down index = <i>
	generic_menu_up_or_down_sound \{down}
	if (<i> = 4)
		get_local_players_in_game
		GetSingleTag \{menus}
		GetArraySize \{menus}
		j = 0
		begin
		if ScreenElementExists id = (<menus> [<j>])
			GetPlayerInfo (<j> + 1) net_obj_id
			if (<net_obj_id> >= 0)
				(<menus> [<j>]) :SetTags {menu = ready}
				RunScriptOnObject id = (<menus> [<j>]) ui_band_mode_update_menu
				LaunchEvent type = unfocus target = (<menus> [<j>])
			else
				(<menus> [<j>]) :SetTags {menu = net_remote_open}
			endif
		endif
		LaunchEvent \{type = unfocus
			target = MyInterfaceElement}
		j = (<j> + 1)
		repeat <array_size>
		clean_up_user_control_helpers
		printf qs("\L--- num_players_in_band = %d ---") d = ($num_players_in_band)
		j = 0
		begin
		(<menus> [<j>]) :GetSingleTag instrument
		(<menus> [<j>]) :GetSingleTag difficulty
		if (<instrument> = controller)
			instrument = Vocals
		endif
		SetPlayerInfo (<j> + 1) part = <instrument>
		if NOT (<difficulty> = none)
			SetPlayerInfo (<j> + 1) difficulty = <difficulty>
		endif
		j = (<j> + 1)
		repeat ($num_players_in_band)
		change current_num_players = ($num_players_in_band)
		change \{net_career_data_sync_done = 0}
		host_start_player_settings_sync
	endif
	i = (<i> -1)
	Wait \{1
		second}
	repeat 11
	vocals_distribute_mics
	change \{career_matchmaking_complete = 0}
	SoundEvent \{event = Band_Mode_Career_Ready}
	if ($num_players_in_band = <num_local_players>)
		if IsHost
			net_career_check_instruments
			host_proceed_to_online_play
		endif
	endif
endscript

script net_career_wait_to_proceed_to_online_play 
	getnumplayers
	starting_players = (<num_players> + ($net_dropped_players_flag))
	begin
	getnumplayers
	if NOT ScriptIsRunning \{net_ui_band_mode_countdown_to_gig}
		break
	endif
	Wait \{0.25
		seconds}
	repeat
	begin
	getnumplayers
	if (($net_num_players) = ($net_num_player_settings_ack))
		if (<num_players> < <starting_players>)
			change \{player_drop_in_setting_sync = 1}
		endif
		break
	endif
	if (<num_players> < <starting_players>)
		change \{player_drop_in_setting_sync = 1}
		break
	endif
	Wait \{0.25
		seconds}
	repeat
	if ((IsHost) && (<num_players> = <starting_players>) || (($player_drop_in_setting_sync = 1)))
		host_proceed_to_online_play
	else
		printf \{qs("\L could do cleanup here but drop handlers should take care of the rest, we just don't want wonky shit happening if we have some erroneous error ")}
		return
	endif
endscript

script ui_band_mode_show_character 
	printf 'ui_band_mode_show_character player=%d' d = <player>
	if (<player> = -1)
		printf 'WARNING: INVALID PLAYER NUMBER %p' p = <player>
		return
	endif
	FormatText checksumname = player_status 'player%p_status' p = <player>
	get_savegame_from_player_status band_character_select player_status = <player_status>
	controller = ($<player_status>.controller)
	if NOT GotParam \{use_existing}
		if (($band_mode_mode = career) || ($is_network_game = 1) || (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff)))
			get_controller_part controller = <controller>
			get_last_band_character_recorded player = <player> part = <controller_part>
			if NOT (<character_id> = none)
				if (<controller> < 4)
					SetArrayElement ArrayName = band_builder_random_preset_used GlobalArray index = <controller> newvalue = <character_id>
				endif
				if GotParam \{borrowed_from_band_leader}
					band_resolve_guest_characters player = <player> character_id = <character_id> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
				endif
				change structurename = <player_status> character_id = <character_id>
				got_from_globaltags = 1
			endif
		endif
		if NOT GotParam \{got_from_globaltags}
			random_band_mode_character player = <player>
			set_band_character_id_globaltag savegame = <savegame> controller = <controller> character_id = <character_id> player = <player>
		endif
	endif
	cas_queue_new_character_profile player = <player> id = ($<player_status>.character_id) savegame = <savegame>
endscript

script random_band_mode_character 
	RequireParams \{[
			player
		]}
	printf 'random_band_mode_character %d' d = <player>
	FormatText checksumname = player_status 'player%p_status' p = <player>
	get_savegame_from_player_status band_character_select player_status = <player_status>
	controller = ($<player_status>.controller)
	get_controller_part controller = <controller>
	if (<controller_part> = guitar)
		if (Random (@ 0 @ 1 )= 0)
			controller_part = Bass
		endif
	endif
	if (Random (@ 0 @ 1 @ 2 )= 0)
		if NOT cas_get_random_car savegame = <savegame> controller = <controller>
			cas_get_random_preset_character savegame = <savegame> controller = <controller> part = <controller_part>
		endif
	else
		cas_get_random_preset_character savegame = <savegame> controller = <controller> part = <controller_part>
	endif
	set_band_character_id_globaltag savegame = <savegame> controller = <controller> character_id = <character_id> player = <player>
	if GotParam \{borrowed_from_band_leader}
		get_player_num_from_controller controller_index = <controller>
		band_resolve_guest_characters player = <player_num> character_id = <character_id> savegame = <savegame> borrowed_from_band_leader = <borrowed_from_band_leader>
	endif
	change structurename = <player_status> character_id = <character_id>
	return character_id = <character_id>
endscript

script ui_band_mode_random_character 
	printf \{'ui_band_mode_random_character'}
	FormatText checksumname = player_status 'player%p_status' p = <player>
	get_savegame_from_player_status player_status = <player_status>
	controller = ($<player_status>.controller)
	ui_band_mode_choose_sound instrument = `default` controller = <controller>
	random_band_mode_character player = <player>
	cas_queue_new_character_profile player = <player> id = ($<player_status>.character_id) savegame = <savegame>
	SE_GetParentId
	band_character_rename index = <index> player = <player>
	if ($net_band_mode_menu = none)
		if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
			given_focus = 0
		elseif ($band_mode_mode = quickplay)
			given_focus = 0
		else
			given_focus = 1
		endif
	else
		given_focus = 2
	endif
	<parent_id> :Obj_SpawnScriptNow ui_band_mode_update_menu params = {given_focus = <given_focus> skip_update_wait}
endscript

script ui_band_mode_kill_character 
	printf \{'ui_band_mode_kill_character'}
	switch <player>
		case 1
		if cas_player_has_character_object \{player = 2}
			Band_PlayAnim name = <character_object> Anim = BackOutR no_wait
		endif
		case 2
		if cas_player_has_character_object \{player = 1}
			Band_PlayAnim name = <character_object> Anim = BackOutL no_wait
		endif
		if cas_player_has_character_object \{player = 3}
			Band_PlayAnim name = <character_object> Anim = BackOutR no_wait
		endif
		case 3
		if cas_player_has_character_object \{player = 2}
			Band_PlayAnim name = <character_object> Anim = BackOutL no_wait
		endif
		if cas_player_has_character_object \{player = 4}
			Band_PlayAnim name = <character_object> Anim = BackOutR no_wait
		endif
		case 4
		if cas_player_has_character_object \{player = 3}
			Band_PlayAnim name = <character_object> Anim = BackOutL no_wait
		endif
	endswitch
	cas_queue_kill_player player = <player>
endscript

script ui_band_mode_check_menus 
	MyInterfaceElement :GetTags
	GetArraySize <menus>
	Obj_GetID
	count = <array_size>
	printscriptinfo
	i = 0
	begin
	if ScreenElementExists id = (<menus> [<i>])
		<curr_id> = (<menus> [<i>])
		<curr_id> :GetTags
		if (<menu> = instrument)
			if NOT (<ObjID> = (<menus> [<i>]))
			endif
			GetScreenElementChildren id = (<menus> [<i>])
			if NOT GotParam \{children}
				return
			endif
			GetArraySize <children>
			j = 0
			begin
			if ScreenElementExists id = {(<menus> [<i>]) child = <j>}
				switch <j>
					case 0
					if StructureContains Structure = <allowed> name = guitar
						if NOT IsScreenElementInFocus id = {(<menus> [<i>]) child = <j>}
							SetScreenElementProps id = {(<menus> [<i>]) child = <j>} rgba = ($menu_unfocus_color) focusable
						endif
					endif
					case 1
					if StructureContains Structure = <allowed> name = Bass
						if NOT IsScreenElementInFocus id = {(<menus> [<i>]) child = <j>}
							SetScreenElementProps id = {(<menus> [<i>]) child = <j>} rgba = ($menu_unfocus_color) focusable
						endif
					endif
					case 2
					if StructureContains Structure = <allowed> name = drum
						if NOT IsScreenElementInFocus id = {(<menus> [<i>]) child = <j>}
							SetScreenElementProps id = {(<menus> [<i>]) child = <j>} rgba = ($menu_unfocus_color) focusable
						endif
					endif
					case 3
					if StructureContains Structure = <allowed> name = Vocals
						if NOT IsScreenElementInFocus id = {(<menus> [<i>]) child = <j>}
							SetScreenElementProps id = {(<menus> [<i>]) child = <j>} rgba = ($menu_unfocus_color) focusable
						endif
					endif
				endswitch
			endif
			j = (<j> + 1)
			repeat <array_size>
		endif
	endif
	i = (<i> + 1)
	repeat <count>
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		i = 0
		begin
		<curr_id> = (<menus> [<i>])
		<curr_id> :GetTags
		check_instrument = <instrument>
		j = 0
		begin
		curr_id_2 = (<menus> [<j>])
		if NOT (<curr_id> = <curr_id_2>)
			<curr_id_2> :GetTags
			index = -1
			if (<menu> = instrument)
				switch <check_instrument>
					case guitar
					index = 0
					case Bass
					index = 1
					case drum
					index = 2
					case Vocals
					index = 3
					default
				endswitch
				if (<index> != -1)
					k = 0
					begin
					if NOT (<k> = <index>)
						if ScreenElementExists id = {<curr_id_2> child = <k>}
							SetScreenElementProps id = {<curr_id_2> child = <k>} rgba = [64 64 64 255] font = fontgrid_text_a6 material = null not_focusable
						endif
					endif
					k = (<k> + 1)
					repeat 4
					if NOT (<curr_id_2> = <ObjID>)
						if NOT <curr_id_2> :Menu_SelectedIndexIs <index>
							<curr_id_2> :Menu_ChangeSelection
						endif
					endif
					k = 0
					begin
					if NOT (<k> = <index>)
						if ScreenElementExists id = {<curr_id_2> child = <k>}
							SetScreenElementProps id = {<curr_id_2> child = <k>} rgba = [64 64 64 255] font = fontgrid_text_a6 material = null not_focusable
						endif
					endif
					k = (<k> + 1)
					repeat 4
				endif
				RemoveParameter \{index}
				RemoveParameter \{menu}
			endif
		endif
		j = (<j> + 1)
		repeat <count>
		i = (<i> + 1)
		repeat <count>
		return
	endif
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :GetTags
	check_instrument = <instrument>
	j = 0
	begin
	curr_id_2 = (<menus> [<j>])
	if NOT (<curr_id> = <curr_id_2>)
		<curr_id_2> :GetTags
		index = -1
		if (<menu> = instrument)
			switch <check_instrument>
				case guitar
				index = 0
				case Bass
				index = 1
				case drum
				index = 2
				case Vocals
				index = 3
				default
			endswitch
			if (<index> != -1)
				if ScreenElementExists id = {<curr_id_2> child = <index>}
					SetScreenElementProps id = {<curr_id_2> child = <index>} rgba = [64 64 64 255] font = fontgrid_text_a6 material = null not_focusable
				endif
				if <curr_id_2> :Menu_SelectedIndexIs <index>
					<curr_id_2> :Menu_ChangeSelection
				endif
				if ScreenElementExists id = {<curr_id_2> child = <index>}
					SetScreenElementProps id = {<curr_id_2> child = <index>} rgba = [64 64 64 255] font = fontgrid_text_a6 material = null not_focusable
				endif
			endif
			RemoveParameter \{index}
			RemoveParameter \{menu}
		endif
	endif
	j = (<j> + 1)
	repeat <count>
	i = (<i> + 1)
	repeat <count>
	i = 0
	begin
	i = (<i> + 1)
	repeat <count>
endscript

script ui_band_mode_check_disconnect 
	MyInterfaceElement :GetSingleTag \{menus}
	GetTags
	begin
	GetActiveControllers
	begin
	if NOT ScriptIsRunning \{ui_band_mode_check_menus}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<active_controllers> [<index>] = 0)
		curr_menu = (<menus> [<index>])
		<curr_menu> :GetSingleTag menu
		if NOT (<menu> = join)
			<curr_menu> :SetTags {menu = root}
			<curr_menu> :obj_spawnscript ui_band_mode_back
			RemoveParameter \{curr_menu}
			RemoveParameter \{menu}
		endif
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script ui_band_mode_warning \{text_scale = 1
		time = 3}
	if ($is_network_game = 1)
		if GotParam \{press_start_to_proceed}
			update_network_ticker \{msg_checksum = press_start_to_proceed}
		else
			if GotParam \{text}
				update_network_ticker msg = <text> no_checksum
			else
				SoundEvent \{event = UI_SFX_Negative_Select}
				update_network_ticker \{msg_checksum = more_players_needed}
			endif
		endif
	else
		net_ticker_update_msg msg_type = vert msg = <text>
	endif
endscript

script ui_band_mode_signin 
	RequireParams \{[
			device_num
		]
		all}
	change \{respond_to_signin_changed_func = none}
	MyInterfaceElement :SE_SetProps \{block_events}
	if isXenon
		if ($band_mode_show_signin = 1)
			call_blade = 0
			if ($is_network_game = 1)
				if (CheckForSignIn local controller_index = <device_num>)
					if NOT (CheckForSignIn controller_index = <device_num>)
						NetSessionFunc \{func = showsigninui
							params = {
								convert_offline_to_guest
							}}
						call_blade = 1
					endif
				else
					NetSessionFunc \{func = ShowSignInUI4Pane
						params = {
							online_only
						}}
					call_blade = 1
				endif
			else
				NetSessionFunc \{func = ShowSignInUI4Pane}
				call_blade = 1
			endif
			if (<call_blade> = 1)
				wait_for_blade_complete
			endif
			if ($is_network_game = 1)
				update_network_ticker \{msg_checksum = signin_change}
			endif
		endif
	endif
	change \{respond_to_signin_changed_func = ui_band_mode_signin_changed}
	MyInterfaceElement :SE_SetProps \{unblock_events}
endscript

script ui_band_mode_helper_text 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :GetSingleTag \{menus}
		GetArraySize <menus>
	else
		array_size = 0
	endif
	num = 0
	num_joined = 0
	i = 0
	if (<array_size> > 0)
		begin
		<curr_id> = (<menus> [<i>])
		<curr_id> :GetTags
		if (<menu> = ready)
			num = (<num> + 1)
		endif
		if (<menu> = join)
			if ($band_mode_current_leader = <i>)
				if isXenon
					band_kill_character_select_menus
				endif
				change \{band_mode_current_leader = -1}
				ui_band_mode_choose_leader \{device_num = -1}
			endif
		else
			num_joined = (<num_joined> + 1)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	clean_up_user_control_helpers
	if ($is_network_game = 1)
		if ($net_career_invite_flag = 0)
			add_user_control_helper \{all_buttons
				text = qs("SELECT")
				button = green
				z = 100000}
		endif
		if ($num_players_in_band = 0)
			if (<num> >= 1)
				if ($net_band_mode_menu = HOST)
					add_user_control_helper \{text = qs("POST BAND")
						button = start
						z = 100000}
				elseif ($net_band_mode_menu = join)
					add_user_control_helper \{text = qs("FIND BAND")
						button = start
						z = 100000}
				endif
			endif
			if NOT (($net_band_mode_menu = lobby) || ($net_band_mode_menu = invite))
				if isXenon
					add_user_control_helper \{all_buttons
						text = qs("SIGN IN")
						button = Yellow
						z = 100000}
				endif
			endif
			if IsPs3
				add_user_control_helper \{all_buttons
					text = qs("INVITES")
					button = Yellow
					z = 100000}
			endif
			add_user_control_helper \{all_buttons
				text = qs("BACK")
				button = red
				z = 100000}
		else
			if NOT (ScriptIsRunning check_num_matchmaking_players_loop)
				if IsHost
					add_user_control_helper \{text = qs("CONTINUE")
						button = start
						z = 100000}
				endif
				if IsPs3
					add_user_control_helper \{all_buttons
						text = qs("INVITES")
						button = Yellow
						z = 100000}
				endif
				if NOT GotParam \{no_back}
					add_user_control_helper \{all_buttons
						text = qs("BACK")
						button = red
						z = 100000}
				endif
			else
				if IsPs3
					add_user_control_helper \{all_buttons
						text = qs("INVITES")
						button = Yellow
						z = 100000}
				endif
			endif
		endif
	else
		if GotParam \{root}
			if (<root> = gigs)
				if IsHost
					add_user_control_helper \{all_buttons
						text = qs("SELECT")
						button = green
						z = 100000}
				endif
			else
				add_user_control_helper \{all_buttons
					text = qs("SELECT")
					button = green
					z = 100000}
			endif
		else
			add_user_control_helper \{all_buttons
				text = qs("SELECT")
				button = green
				z = 100000}
		endif
		if (<num> >= 2)
			add_user_control_helper \{text = qs("CONTINUE")
				button = start
				controller = $band_mode_current_leader
				z = 100000}
			if (<num> = 2 && $band_mode_last_num_ready < 2)
				if ($band_mode_current_leader = -1)
				else
					user_control_helper_get_buttonchar \{button = start
						controller = $band_mode_current_leader}
					FormatText TextName = button_text qs("Press %b to proceed.") b = <buttonchar>
					spawnscriptnow ui_band_mode_warning params = {press_start_to_proceed text = <button_text> text_scale = 2 time = 5}
				endif
			endif
			try_leader = 1
		else
			if (<num_joined> >= 1)
				try_leader = 1
			endif
		endif
		ui_event_get_stack
		if NOT ((<stack> [0].base_name) = 'band_mode')
			RemoveParameter \{try_leader}
		endif
		change \{band_mode_can_choose_leader = 0}
		if GotParam \{try_leader}
			if NOT is_band_character_select_up
				add_user_control_helper \{all_buttons
					text = qs("BAND LEADER")
					button = Blue
					z = 100000}
				change \{band_mode_can_choose_leader = 1}
			endif
		endif
		if isXenon
			if NOT IsAnyControllerSignedIn
			endif
		endif
		add_user_control_helper \{all_buttons
			text = qs("BACK")
			button = red
			z = 100000}
	endif
	change band_mode_last_num_ready = <num>
endscript

script IsAnyControllerSignedIn 
	GetMaxControllerSignins
	i = 0
	begin
	if IsLocallySignedIn controller = <i>
		return \{true}
	endif
	i = (<i> + 1)
	repeat <max_signins>
	return \{false}
endscript

script ui_band_mode_scroll_sound 
	GetTags
	get_player_num_from_controller controller_index = <controller>
	spawnscriptnow Band_Screen_UI_Sound params = {sound_type = scroll <...> controller = <player_num>}
endscript

script ui_band_mode_choose_sound \{ready = 0
		controller = 0}
	GetTags
	get_player_num_from_controller controller_index = <controller>
	if (<player_num> < 0)
		player_num = 1
	endif
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		if (<player_num> = 1)
			<pan1x> = -0.25
			<pan1y> = 1
			<pan2x> = -0.25
			<pan2y> = 1
		elseif (<player_num> = 2)
			<pan1x> = 0.25
			<pan1y> = 1
			<pan2x> = 0.25
			<pan2y> = 1
		endif
	else
		if (<player_num> = 1)
			<pan1x> = -0.25
			<pan1y> = 1
			<pan2x> = -0.25
			<pan2y> = 1
		elseif (<player_num> = 2)
			<pan1x> = -0.15
			<pan1y> = 1
			<pan2x> = -0.15
			<pan2y> = 1
		elseif (<player_num> = 3)
			<pan1x> = 0.15
			<pan1y> = 1
			<pan2x> = 0.15
			<pan2y> = 1
		elseif (<player_num> = 4)
			<pan1x> = 0.25
			<pan1y> = 1
			<pan2x> = 0.25
			<pan2y> = 1
		endif
	endif
	if NOT GotParam \{back}
		if (<ready> = 1)
			switch <instrument>
				case drum
				PlaySound Drum_Select_Affirmation_01 vol = -2 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case guitar
				PlaySound Guitar_Select_Affirmation_1 vol = 0 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case Vocals
				PlaySound Mic_Select_Affirmation_01 vol = 15 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case Bass
				PlaySound Bass_Select_Affirmation_02 vol = -1 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				default
				PlaySound CheckBox_Check_SFX vol = 2 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endswitch
		else
			switch <instrument>
				case drum
				PlaySound ui_sound_05 vol = -6 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case guitar
				PlaySound ui_sound_05 vol = -6 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case Vocals
				PlaySound ui_sound_05 vol = -6 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				case Bass
				PlaySound ui_sound_05 vol = -6 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
				default
				PlaySound ui_sound_05 vol = -6 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
			endswitch
		endif
	else GotParam \{back}
		PlaySound UI_Sound_09 vol = -7.5 buss = front_end pan1x = <pan1x> pan1y = <pan1y> pan2x = <pan2x> pan2y = <pan2y>
	endif
endscript

script ui_get_controller_parts_allowed 
	RequireParams \{[
			controller
		]
		all}
	if (($allow_controller_for_all_instruments) = 0)
		allowed = {}
		if IsGuitarController controller = <controller>
			allowed = {guitar Bass}
		elseif IsDrumController controller = <controller>
			allowed = {drum}
		elseif IsMicrophonePluggedIn
			allowed = {Vocals}
		endif
	else
		allowed = {guitar Bass drum Vocals}
		if IsGuitarController controller = <controller>
			allowed = {guitar Bass}
		elseif IsDrumController controller = <controller>
			allowed = {drum}
		elseif IsMicrophonePluggedIn
			allowed = {guitar Bass drum Vocals}
		endif
	endif
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		switch ($g_head_to_head_instrument_type)
			case guitar
			RemoveParameter \{drum
				struct_name = allowed}
			case Drums
			RemoveParameter \{guitar
				struct_name = allowed}
			RemoveParameter \{Bass
				struct_name = allowed}
			default
			ScriptAssert \{qs(0xd986128b)}
		endswitch
		if ($game_mode = p2_battle)
			RemoveParameter \{drum
				struct_name = allowed}
		endif
		RemoveParameter \{Vocals
			struct_name = allowed}
	endif
	if GotParam \{filter_by_character}
		filter_allowed_parts_by_character_type allowed = <allowed> controller = <controller>
	endif
	return allowed = <allowed>
endscript

script proceed_to_band_lobby 
	printf \{qs("\Lproceed_to_band_lobby")}
	change \{net_band_mode_menu = lobby}
	ui_destroy_net_career_join_popup
	ui_event \{event = menu_change
		data = {
			state = UIstate_band_mode
		}}
endscript

script add_gamertag_to_band_lobby 
	printf \{qs("\Ladd_gamertag_to_band_lobby")}
	band_leader = 0
	if NOT GotParam \{name}
		GetPlayerInfo (<index> + 1) controller
		GetPlayerInfo (<index> + 1) gamertag
		name = $<gamertag>
		if (<name> = qs(""))
			name = qs("\L")
		endif
	else
		controller = -1
	endif
	if MyInterfaceElement :Desc_ResolveAlias \{name = alias_hmenu}
		ResolveScreenElementId id = [
			{id = <resolved_id>}
			{index = <index>}
		]
		if GotParam \{name}
			band_gamertag_rename gamertag = <name> index = <index> desc_item = <desc_item>
		endif
		if ((<controller> = $primary_controller) && (IsHost) && (<menu> = net_local_root))
			band_leader = 1
			<resolved_id> :SE_SetProps leader_indicator_alpha = 1
		endif
	endif
	return band_leader = <band_leader>
endscript

script net_add_player_to_career_ui 
	if IsHost
		if (<local_client> = 0)
			change num_players_in_band = (($num_players_in_band) + 1)
			printf qs("\Lnum_players_in_band = %d") d = ($num_players_in_band)
			MyInterfaceElement :GetSingleTag \{menus}
			add_gamertag_to_band_lobby index = (<player_num> - 1) menu = net_remote_root
			net_get_character_name player = (<player_num> - 1)
			band_character_rename index = (<player_num> - 1) character_name = <fullname>
			if (<part> = guitar)
				part = none
			endif
			(<menus> [(<player_num> - 1)]) :SetTags {
				instrument = <part>
				difficulty = <difficulty>
				menu = net_remote_root
			}
			(<menus> [(<player_num> - 1)]) :obj_spawnscript ui_band_mode_update_menu
		endif
	else
		if ($net_band_mode_menu = lobby)
			if (<local_client> = 0)
				change num_players_in_band = (($num_players_in_band) + 1)
				printf qs("\Lnum_players_in_band = %d") d = ($num_players_in_band)
			endif
		else
			if (<local_client> = 0)
				change num_players_in_band = (($num_players_in_band) + 1)
				printf qs("\Lnum_players_in_band = %d") d = ($num_players_in_band)
			endif
		endif
	endif
endscript

script net_career_goto_band_lobby 
	printf \{qs("\Lnet_career_goto_band_lobby")}
	end_singleplayer_game
	KillSpawnedScript \{name = Loading_Screen_Crowd_Swell}
	KillSpawnedScript \{name = Crowd_Loading_Whistle}
	if GotParam \{from_encore}
		kill_gem_scroller
	endif
	change \{career_matchmaking_complete = 1}
	GetGlobalTags \{user_options}
	if (<autosave> = 1)
		ui_memcard_autosave \{event = menu_back
			state = UIstate_band_mode
			data = {
				all_active_players = true
			}}
	else
		ui_event \{event = menu_back
			data = {
				state = UIstate_band_mode
			}}
	endif
endscript

script net_career_goto_gig_board 
	if ScreenElementExists \{id = MyInterfaceElement}
		generic_menu_pad_choose_sound
		MyInterfaceElement :SE_SetProps \{alpha = 0.0}
		clean_up_user_control_helpers
		LoadPak \{'pak\\ui\\gig_posters.pak'
			heap = BottomUpHeap}
		ui_event event = menu_change data = {state = uistate_gig_posters controller = <device_num> is_popup}
	endif
endscript

script is_current_state_band_mode 
	ui_event_get_stack
	GetArraySize <stack>
	if (<array_size> > 0)
		if ((<stack> [0].base_name) = 'band_mode')
			return \{true}
		else
			return \{false}
		endif
	else
		return \{false}
	endif
endscript

script net_setup_band_lobby_ticker 
	ResolveScreenElementId \{id = [
			{
				id = MyInterfaceElement
			}
			{
				local_id = band_menu_container
			}
			{
				local_id = online_ticker_window_element
			}
		]}
	if ScreenElementExists id = <resolved_id>
	endif
	ResolveScreenElementId \{id = [
			{
				id = MyInterfaceElement
			}
			{
				local_id = band_menu_container
			}
			{
				local_id = online_ticker_window_element
			}
			{
				local_id = online_ticker_vert_text
			}
		]}
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :SE_GetProps
		<resolved_id> :SetTags {
			msg_pending = 0
			orgin_pos = <pos>
		}
		<resolved_id> :Obj_SpawnScriptLater net_ticker_msg_loop params = {msg_type = vert}
	endif
	ResolveScreenElementId \{id = [
			{
				id = MyInterfaceElement
			}
			{
				local_id = band_menu_container
			}
			{
				local_id = online_ticker_window_element
			}
			{
				local_id = online_ticker_horiz_text
			}
		]}
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :SE_GetProps
		<resolved_id> :SetTags {
			msg_pending = 0
			orgin_pos = <pos>
		}
		<resolved_id> :Obj_SpawnScriptLater net_ticker_msg_loop params = {msg_type = horiz}
	endif
endscript

script net_ticker_msg_loop 
	begin
	GetSingleTag \{msg_pending}
	if (<msg_pending>)
		SetTags \{msg_pending = 0}
		if (<msg_type> = vert)
			Obj_KillSpawnedScript \{name = net_ticker_vert_scroll}
		elseif (<msg_type> = horiz)
			Obj_KillSpawnedScript \{name = net_ticker_horiz_scroll}
		endif
		if (<msg_type> = vert)
			Obj_SpawnScriptNow \{net_ticker_vert_scroll}
		elseif (<msg_type> = horiz)
			Obj_SpawnScriptNow \{net_ticker_horiz_scroll}
		endif
	endif
	Wait \{0.25
		seconds}
	repeat
endscript

script net_ticker_update_msg 
	if NOT GotParam \{msg}
		return
	endif
	if (<msg_type> = vert)
		text_id = online_ticker_vert_text
	elseif (<msg_type> = horiz)
		text_id = online_ticker_horiz_text
	endif
	ResolveScreenElementId id = [
		{id = MyInterfaceElement}
		{local_id = band_menu_container}
		{local_id = online_ticker_window_element}
		{local_id = <text_id>}
	]
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :SE_SetProps text = <msg> alpha = 0.0
		<resolved_id> :SetTags msg_pending = 1
	endif
endscript

script net_ticker_vert_scroll 
	MyInterfaceElement :SE_SetProps \{online_ticker_window_element_alpha = 1.0
		time = 0.1}
	if ScreenElementExists \{id = scrolling_msg_container}
		scrolling_msg_container :SE_SetProps \{alpha = 0.0}
	endif
	Obj_GetID
	GetSingleTag \{orgin_pos}
	<ObjID> :SE_SetProps alpha = 1.0 pos = <orgin_pos>
	<ObjID> :SetProps pos = (<orgin_pos> + (0.0, -55.0)) time = 0.2
	<ObjID> :SE_WaitProps
	Wait \{4
		second}
	<ObjID> :SetProps alpha = (0.0) time = 0.5
	<ObjID> :SE_WaitProps
	<ObjID> :SE_SetProps pos = <orgin_pos>
	if ScreenElementExists \{id = scrolling_msg_container}
		scrolling_msg_container :SetProps \{alpha = 1.0
			time = 0.5}
		scrolling_msg_container :SE_WaitProps
	endif
	if NOT ScriptIsRunning \{net_ticker_horiz_scroll}
		MyInterfaceElement :SE_SetProps \{online_ticker_window_element_alpha = 0.0
			time = 0.1}
	endif
endscript

script net_ticker_horiz_scroll \{scroll_time = 6}
	printf \{qs("\Lnet_ticker_horiz_scroll")}
	MyInterfaceElement :SE_SetProps \{online_ticker_window_element_alpha = 1.0
		time = 0.1}
	Obj_GetID
	<ObjID> :SE_GetProps
	CreateScreenElement {
		type = TextElement
		parent = <ObjID>
		scale = <scale>
		text = qs("\L ")
		font = <font>
	}
	GetScreenElementDims id = <id>
	space_width = <width>
	DestroyScreenElement id = <id>
	<ObjID> :SE_GetParentId
	if ScreenElementExists \{id = scrolling_msg_container}
		DestroyScreenElement \{id = scrolling_msg_container}
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <parent_id>
		id = scrolling_msg_container
	}
	GetScreenElementChildren id = <ObjID>
	GetArraySize (<children>)
	i = 0
	orgin_end_pos = (0.0, -6.0)
	begin
	(<children> [<i>]) :text_getstring
	printf <string>
	FormatText checksumname = ticker_text 'ticker_text_%i' i = <i>
	CreateScreenElement {
		type = TextElement
		parent = scrolling_msg_container
		id = <ticker_text>
		just = [left top]
		scale = <scale>
		text = <string>
		font = <font>
		rgba = <rgba>
		z_priority = <z_priority>
	}
	GetScreenElementDims id = <id>
	new_width = (<width> + <space_width>)
	orgin_end_pos = (<orgin_end_pos> - (<new_width> * (1.0, 0.0)))
	<i> = (<i> + 1)
	repeat <array_size>
	orgin_start_pos = (1280.0, -6.0)
	time_factor = (1280 / <scroll_time>)
	scroll_time = ((1280 - (<orgin_end_pos>.(1.0, 0.0))) / <time_factor>)
	begin
	start_pos = <orgin_start_pos>
	end_pos = <orgin_end_pos>
	<i> = 0
	begin
	FormatText checksumname = ticker_text 'ticker_text_%i' i = <i>
	<ObjID> :Obj_SpawnScriptNow scroll_ticker_each_line params = {id = <ticker_text> start_pos = <start_pos> end_pos = <end_pos> scroll_time = <scroll_time>}
	GetScreenElementDims id = <ticker_text>
	<new_width> = (<width> + <space_width>)
	start_pos = (<start_pos> + (<new_width> * (1.0, 0.0)))
	end_pos = (<end_pos> + (<new_width> * (1.0, 0.0)))
	<i> = (<i> + 1)
	repeat <array_size>
	Wait <scroll_time> seconds
	repeat
	if NOT ScriptIsRunning \{net_ticker_vert_scroll}
		MyInterfaceElement :SE_SetProps \{online_ticker_window_element_alpha = 0.0
			time = 0.1}
	endif
endscript

script scroll_ticker_each_line 
	if ScreenElementExists id = <id>
		<id> :SE_SetProps pos = <start_pos>
		<id> :SE_SetProps pos = <end_pos> time = <scroll_time>
		<id> :SE_WaitProps
	endif
endscript

script update_network_ticker 
	printf \{qs("\Lupdate_network_ticker")}
	if NOT GotParam \{no_checksum}
		if NOT (GotParam msg_checksum)
			return
		endif
	else
		msg_type = vert
		replace = 1
	endif
	switch <msg_checksum>
		case waiting_for_data
		msg_type = horiz
		msg = qs("Waiting for player data.")
		replace = 1
		case menu_invite
		msg_type = horiz
		msg = qs("Waiting for the band leader to post the band.")
		append = 1
		case max_guitars
		msg_type = vert
		msg = qs("There are already a maximum number of guitar controllers being used.")
		replace = 1
		case max_vocals
		msg_type = vert
		if isXenon
			msg = qs("There are already a maximum number of Xbox 360 Controllers being used.")
		else
			msg = qs("There are already a maximum number of wireless controllers being used.")
		endif
		replace = 1
		case max_drum
		msg_type = vert
		msg = qs("There are already a maximum number of drum controllers being used.")
		replace = 1
		case no_mic
		msg_type = vert
		if isXenon
			msg = qs("A microphone or Xbox 360 Headset must be plugged in to join the band.")
		else
			msg = qs("A microphone must be plugged in to join the band.")
		endif
		replace = 1
		case band_leader
		msg_type = vert
		msg = qs("Band leader needs to be part of the band")
		replace = 1
		case menu_host
		msg_type = horiz
		user_control_helper_get_buttonchar \{button = start}
		FormatText TextName = msg qs("Invite friends or press %d to post the band.") d = <buttonchar>
		append = 1
		case menu_join
		msg_type = horiz
		user_control_helper_get_buttonchar \{button = green}
		green = <buttonchar>
		user_control_helper_get_buttonchar \{button = start}
		FormatText TextName = msg qs("Press %d to join. Press %e to search for a band with all members who are ready.") d = <green> e = <buttonchar>
		append = 1
		case guitarist_roles
		msg_type = vert
		msg = qs("Guitarists have not choosen their roles yet.")
		replace = 1
		case ps3_chat
		msg_type = horiz
		msg = qs("Chat is disabled on your PLAYSTATION®Network account due to parental control restrictions.")
		append = 1
		case full
		msg_type = horiz
		msg = qs("Band is now full.")
		replace = 1
		case non_primary_post
		msg_type = vert
		if NOT ($net_band_mode_menu = none)
			msg = qs("Only the band leader can post the band.")
		else
			msg = qs("Only the band leader can select to continue.")
		endif
		replace = 1
		case guest_continue
		msg_type = vert
		if ($net_band_mode_menu = HOST)
			msg = qs("Xbox LIVE guests can not post a band.")
		elseif ($net_band_mode_menu = join)
			msg = qs("Xbox LIVE guests can not search for bands.")
		endif
		replace = 1
		case matchmaking_complete
		msg_type = vert
		msg = qs("Lets wait a little longer to get some joiners first.")
		replace = 1
		case host_ready_up
		msg_type = vert
		msg = qs("Host needs to ready up before starting gig.")
		replace = 1
		case count_down
		msg_type = vert
		get_progression_globals \{Career_Band}
		FormatText \{checksumname = tiername
			'tier%d'
			d = $current_gig_number}
		level_checksum = ($<tier_global>.<tiername>.level)
		if StructureContains Structure = $LevelZones <level_checksum>
			if (<level_checksum> = load_z_tool)
				FormatText TextName = msg qs("Rocking out at the %v Venue in %d") v = ($LevelZones.<level_checksum>.title) d = <index>
			elseif (<level_checksum> = load_z_newyork || <level_checksum> = load_z_Ballpark || <level_checksum> = load_z_Scifi || <level_checksum> = load_z_metalfest)
				FormatText TextName = msg qs("Rocking out at %v in %d") v = ($LevelZones.<level_checksum>.title) d = <index>
			else
				FormatText TextName = msg qs("Rocking out at the %v in %d") v = ($LevelZones.<level_checksum>.title) d = <index>
			endif
		else
			FormatText TextName = msg qs("Rocking out in %d") d = <index>
		endif
		replace = 1
		case count_down_no_quit
		msg_type = vert
		msg = qs("You can not quit once the host has started the countdown.")
		replace = 1
		case gig_selected
		msg_type = horiz
		msg = qs("Gig has been selected.")
		replace = 1
		case no_gig_selected
		msg_type = vert
		replace = 1
		msg = qs("Host needs to select a gig.")
		case signin_request
		msg_type = vert
		replace = 1
		FormatText TextName = msg qs("Player %d needs to sign into an Xbox LIVE multiplayer enabled gamer profile.") d = (<device_num> + 1)
		case more_players_needed
		msg_type = vert
		replace = 1
		msg = qs("More players are needed for band play.")
		case press_start_to_proceed
		msg_type = vert
		replace = 1
		user_control_helper_get_buttonchar \{button = start
			controller = $band_mode_current_leader}
		FormatText TextName = msg qs("Press %b to proceed.") b = <buttonchar>
		case join
		msg_type = horiz
		append = 1
		if (isXenon)
			if NOT (CheckForSignIn controller_index = <controller>)
				msg = qs("Players need to sign into an Xbox LIVE multiplayer enabled gamer profile to join band.")
			endif
		endif
		case signin_change
		msg_type = horiz
		replace = 1
		if (isXenon)
			MyInterfaceElement :GetSingleTag \{menus}
			GetArraySize <menus>
			count = 0
			i = 0
			begin
			(<menus> [<i>]) :GetSingleTag menu
			if NOT (<menu> = join)
				if NOT (CheckForSignIn controller_index = <i>)
					count = (<count> + 1)
					msg = qs("Players need to sign into an Xbox LIVE multiplayer enabled gamer profile to join band.")
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
			if (<count> = 0)
				msg = qs("")
			endif
		endif
		case net_too_many_local
		msg_type = vert
		replace = 1
		msg = $wii_band_ticker_too_many_local
	endswitch
	if (GotParam msg)
		if (<msg_type> = vert)
			msg_text_id = online_ticker_vert_text
		elseif (<msg_type> = horiz)
			msg_text_id = online_ticker_horiz_text
		else
			msg_text_id = online_ticker_vert_text
		endif
		ResolveScreenElementId id = [
			{id = MyInterfaceElement}
			{local_id = band_menu_container}
			{local_id = online_ticker_window_element}
			{local_id = <msg_text_id>}
		]
		if ScreenElementExists id = <resolved_id>
			if (GotParam append)
				<resolved_id> :SE_GetProps
				FormatText TextName = new_msg qs("%d\n%t") d = <text> t = <msg>
			elseif (GotParam replace)
				FormatText TextName = new_msg qs("%t") t = <msg>
			elseif (GotParam Clear)
				new_msg = qs("")
			endif
			net_ticker_update_msg msg_type = <msg_type> msg = <new_msg>
		endif
	endif
endscript

script net_get_root_menu_tags 
	if (<index> < ($num_players_in_band))
		GetPlayerInfo (<index> + 1) is_local_client
		if (<is_local_client> = 1)
			GetPlayerInfo (<index> + 1) controller
			get_controller_type controller_index = <controller>
			if (<controller_type> = controller)
				controller_type = Vocals
			endif
			part = <controller_type>
			ui_get_controller_parts_allowed controller = <controller> filter_by_character
			NetSessionFunc func = get_user_id params = {controller_index = <controller>}
			xuid = <user_id>
			menu = net_local_root
		else
			GetPlayerInfo (<index> + 1) part
			controller = 10
			allowed = {}
			xuid = [0 0]
			GetPlayerInfo (<index> + 1) net_id_first
			GetPlayerInfo (<index> + 1) net_id_second
			SetArrayElement ArrayName = xuid index = 0 newvalue = <net_id_first>
			SetArrayElement ArrayName = xuid index = 1 newvalue = <net_id_second>
			menu = net_remote_root
		endif
		if isXenon
			<desc_id> :obj_spawnscript update_headset_status params = {obj_id = <desc_id> uid = <xuid>}
		endif
		if (<part> = guitar || <part> = controller)
			part = none
		endif
		GetPlayerInfo (<index> + 1) difficulty
	else
		is_local_client = 0
		controller = 10
		part = none
		allowed = {}
		difficulty = none
		menu = net_remote_open
	endif
	if (<is_local_client> = 0)
		cas_queue_kill_player player = (<index> + 1)
	endif
	return {
		is_local_client = <is_local_client>
		controller = <controller>
		part = <part>
		allowed = <allowed>
		difficulty = <difficulty>
		menu = <menu>
	}
endscript

script net_get_invite_menu_tags 
	printf \{qs("\Lnet_get_invite_menu_tags")}
	NetSessionFunc \{obj = party
		func = get_party_members}
	GetArraySize \{connections}
	if (<index> < <array_size>)
		if ((<connections> [<index>].is_local) = 1)
			menu = net_local_join
			controller = (<connections> [<index>].controller_index)
			NetSessionFunc func = AddControllers params = {controller = <controller>}
			SetArrayElement ArrayName = temp_net_id GlobalArray index = <controller> newvalue = {net_id_first = (<connections> [<index>].user_id [0]) net_id_second = (<connections> [<index>].user_id [1]) name = (<connections> [<index>].gamertag)}
		else
			menu = net_remote_root
			controller = <index>
		endif
		switch (<connections> [<index>].instrument)
			case eGUITAR
			part = guitar
			case eDRUMS
			part = drum
			case eMICROPHONE
			part = Vocals
		endswitch
		name = (<connections> [<index>].gamertag)
		user_id = (<connections> [<index>].user_id)
		player_array = [{user_id = (<connections> [<index>].user_id) is_local = (<connections> [<index>].is_local) controller_index = (<connections> [<index>].controller_index)}]
		change net_band_members = (($net_band_members) + <player_array>)
		if GotParam \{init}
			change net_num_joiners = (($net_num_joiners) + 1)
		endif
		if isXenon
			<desc_id> :obj_spawnscript update_headset_status params = {obj_id = <desc_id> uid = <user_id>}
		endif
	else
		menu = net_remote_open
		part = none
		name = qs("\L")
		user_id = [0 0]
		controller = <index>
	endif
	return {
		part = <part>
		menu = <menu>
		name = <name>
		user_id = <user_id>
		controller = <controller>
	}
endscript

script career_update_party_data 
	NetSessionFunc \{obj = party
		func = get_shared_data}
	i = 0
	num_players = 0
	begin
	FormatText checksumname = player 'player_%d' d = <i>
	if StructureContains Structure = <party_shared_data> <player>
		if (((<party_shared_data>.<player>.user_id [0]) = (<user_id> [0])) &&
				((<party_shared_data>.<player>.user_id [1]) = (<user_id> [1])))
			printf \{qs("\Lupdating our already existing data")}
			break
		endif
		num_players = (<num_players> + 1)
	endif
	i = (<i> + 1)
	repeat 4
	if (<num_players> < 4)
		switch <num_players>
			case 0
			data = {
				player_0 = {
					user_id = <user_id>
					menu = <menu>
				}
			}
			case 1
			data = {
				player_1 = {
					user_id = <user_id>
					menu = <menu>
				}
			}
			case 2
			data = {
				player_2 = {
					user_id = <user_id>
					menu = <menu>
				}
			}
			case 3
			data = {
				player_3 = {
					user_id = <user_id>
					menu = <menu>
				}
			}
		endswitch
		NetSessionFunc obj = party func = append_shared_data params = {data = <data>}
	endif
endscript

script career_poll_party_data 
	begin
	NetSessionFunc \{obj = party
		func = get_shared_data}
	i = 0
	begin
	FormatText checksumname = player 'player_%d' d = <i>
	if StructureContains Structure = <party_shared_data> <player>
		get_party_member_status member_id = (<party_shared_data>.<player>.user_id)
		if (<is_party_member> = 1)
			if (<is_local> = 0)
				find_party_member_menu member_id = (<party_shared_data>.<player>.user_id)
				if GotParam \{party_member_menu_index}
					GetSingleTag \{menus}
					(<menus> [<party_member_menu_index>]) :GetSingleTag menu
					if (<menu> = net_local_join)
						menu = net_remote_root
					endif
					if NOT (<menu> = (<party_shared_data>.<player>.menu))
						(<menus> [<party_member_menu_index>]) :SetTags {
							menu = (<party_shared_data>.<player>.menu)
						}
						(<menus> [<party_member_menu_index>]) :obj_spawnscript ui_band_mode_update_menu
					endif
				endif
			endif
		else
		endif
	endif
	i = (<i> + 1)
	repeat 4
	Wait \{1
		second}
	repeat
endscript

script career_poll_party_for_joiners 
	GetSingleTag \{menus}
	begin
	if ((isXenon) && ($wait_for_sysnotify_unpause_flag = 0))
		wait_for_sysnotify_unpause
	endif
	NetSessionFunc \{obj = party
		func = get_party_members}
	GetArraySize <connections>
	if (<array_size> > ($net_num_joiners))
		joiner = 1
	elseif (<array_size> < ($net_num_joiners))
		quitter = 1
	endif
	change net_num_joiners = <array_size>
	if GotParam \{joiner}
		net_add_party_joiner menus = <menus>
		RemoveParameter \{joiner}
	endif
	if GotParam \{quitter}
		net_remove_party_joiner menus = <menus>
		RemoveParameter \{quitter}
	endif
	Wait \{1
		second}
	repeat
endscript

script net_add_party_joiner 
	printf \{qs("\L--- net_add_party_joiner ---")}
	RequireParams \{[
			menus
		]
		all}
	NetSessionFunc \{obj = party
		func = get_party_members}
	i = 0
	begin
	is_new_player user_id = (<connections> [<i>].user_id) controller_index = (<connections> [<i>].controller_index)
	if (<new_player> = 1)
		if ((<connections> [<i>]).is_local = 0)
			GetArraySize <menus>
			if ($net_band_mode_menu = invite)
				goal_menu = net_remote_open
			elseif ($net_band_mode_menu = HOST)
				goal_menu = join
			endif
			m = 0
			begin
			(<menus> [<m>]) :GetSingleTag menu
			if (<goal_menu> = <menu>)
				open_menu = <m>
				break
			endif
			m = (<m> + 1)
			repeat <array_size>
			if GotParam \{open_menu}
				MyInterfaceElement :GetSingleTag \{descs}
				net_get_invite_menu_tags index = <i> desc_id = (<descs> [<open_menu>])
				(<menus> [<open_menu>]) :Obj_KillSpawnedScript name = ui_band_mode_update_name
				(<menus> [<open_menu>]) :Obj_KillSpawnedScript name = ui_band_mode_check_disconnect
				add_gamertag_to_band_lobby index = <open_menu> name = <name> menu = <menu>
				(<menus> [<open_menu>]) :SetTags {
					menu = <menu>
					instrument = <part>
					difficulty = none
					user_id = <user_id>
				}
				(<menus> [<open_menu>]) :obj_spawnscript ui_band_mode_update_menu
				switch (<part>)
					case guitar
					case Bass
					MyInterfaceElement :GetSingleTag \{current_guitar}
					MyInterfaceElement :SetTags current_guitar = (<current_guitar> + 1)
					case drum
					MyInterfaceElement :GetSingleTag \{current_drum}
					MyInterfaceElement :SetTags current_drum = (<current_drum> + 1)
					case Vocals
					MyInterfaceElement :GetSingleTag \{current_mic}
					MyInterfaceElement :SetTags current_mic = (<current_mic> + 1)
				endswitch
				ui_band_mode_show_character player = (<open_menu> + 1)
			else
				printstruct ($net_band_members)
				ScriptAssert \{qs("\Lwe did not find an open spot for our new party memeber")}
			endif
		elseif ((<connections> [<i>]).is_local = 1)
			player_array = [{user_id = (<connections> [<i>].user_id) is_local = (<connections> [<i>].is_local) controller_index = (<connections> [<i>].controller_index)}]
			change net_band_members = (($net_band_members) + <player_array>)
		endif
	endif
	i = (<i> + 1)
	repeat ($net_num_joiners)
endscript

script net_remove_party_joiner 
	printf \{qs("\L--- net_remove_party_joiner ---")}
	RequireParams \{[
			menus
		]
		all}
	NetSessionFunc \{obj = party
		func = get_party_members}
	array = []
	GetArraySize ($net_band_members)
	net_num_band_memebers = <array_size>
	j = 0
	begin
	is_quitter user_id = ($net_band_members [<j>].user_id) controller_index = ($net_band_members [<j>].controller_index)
	if (<quitter> = 1)
		AddArrayElement array = <array> element = <j>
		find_party_member_menu member_id = ($net_band_members [<j>].user_id)
		if GotParam \{party_member_menu_index}
			quitter_menu = <party_member_menu_index>
			(<menus> [<quitter_menu>]) :GetSingleTag menu
			(<menus> [<quitter_menu>]) :GetSingleTag instrument
			switch (<instrument>)
				case guitar
				case Bass
				MyInterfaceElement :GetSingleTag \{current_guitar}
				MyInterfaceElement :SetTags current_guitar = (<current_guitar> - 1)
				case drum
				MyInterfaceElement :GetSingleTag \{current_drum}
				MyInterfaceElement :SetTags current_drum = (<current_drum> - 1)
				case Vocals
				MyInterfaceElement :GetSingleTag \{current_mic}
				MyInterfaceElement :SetTags current_mic = (<current_mic> - 1)
			endswitch
			if ($net_band_mode_menu = invite)
				(<menus> [<quitter_menu>]) :SetTags {
					menu = net_remote_open
					instrument = none
					difficulty = none
					controller = 10
					user_id = [0 0]
				}
				ui_band_mode_kill_character player = (<quitter_menu> + 1)
				band_character_rename index = <quitter_menu>
				add_gamertag_to_band_lobby index = <quitter_menu> name = qs("") menu = net_remote_open
				(<menus> [<quitter_menu>]) :obj_spawnscript ui_band_mode_update_menu
			elseif ($net_band_mode_menu = HOST)
				(<menus> [<quitter_menu>]) :SetTags {
					menu = join
					instrument = none
					difficulty = none
					controller = <quitter_menu>
					user_id = [0 0]
				}
				if (($net_band_members [<j>].is_local) = 0)
					(<menus> [<quitter_menu>]) :obj_spawnscript ui_band_mode_update_name params = {controller = <quitter_menu>}
					(<menus> [<quitter_menu>]) :obj_spawnscript ui_band_mode_check_disconnect
					ui_band_mode_kill_character player = (<quitter_menu> + 1)
					(<menus> [<quitter_menu>]) :obj_spawnscript ui_band_mode_update_menu
				endif
			endif
		else
			printstruct ($net_band_members)
			ScriptAssert \{qs("\Lwe did not find the quitters old menu")}
		endif
	endif
	j = (<j> + 1)
	repeat <net_num_band_memebers>
	index_array = <array>
	GetArraySize \{index_array}
	if (<array_size> > 0)
		a = (<array_size> - 1)
		begin
		RemoveArrayElement array = ($net_band_members) index = (<index_array> [<a>])
		change net_band_members = <array>
		a = (<a> - 1)
		repeat <array_size>
	endif
endscript

script find_party_member_menu 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :GetSingleTag \{menus}
		GetArraySize \{menus}
		i = 0
		begin
		(<menus> [<i>]) :GetSingleTag user_id
		if ((<member_id> [0]) = (<user_id> [0]) &&
				(<member_id> [1]) = (<user_id> [1]))
			return party_member_menu_index = <i> part_member_menu_checksum = (<menus> [<i>])
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script get_party_member_status 
	if ((GotParam net_id_first) && (GotParam net_id_second))
		array = []
		AddArrayElement array = <array> element = <net_id_first>
		AddArrayElement array = <array> element = <net_id_second>
		member_id = <array>
	endif
	is_local = 0
	is_party_member = 0
	NetSessionFunc \{obj = party
		func = get_party_members}
	GetArraySize <connections>
	if (<array_size> > 0)
		i = 0
		begin
		if (((<connections> [<i>].user_id [0]) = (<member_id> [0]))
				&& ((<connections> [<i>].user_id [1]) = (<member_id> [1])))
			is_party_member = 1
			if ((<connections> [<i>].is_local) = 1)
				is_local = 1
			endif
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return is_local = <is_local> is_party_member = <is_party_member>
endscript

script is_new_player 
	RequireParams \{[
			user_id
		]
		all}
	GetArraySize ($net_band_members)
	new_player = 1
	if (<array_size> > 0)
		i = 0
		begin
		if (($net_band_members [<i>].user_id [0]) = (<user_id> [0]) &&
				($net_band_members [<i>].user_id [1]) = (<user_id> [1]))
			if IsPs3
				if (($net_band_members [<i>].controller_index) = <controller_index>)
					new_player = 0
					break
				endif
			else
				new_player = 0
				break
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return new_player = <new_player>
endscript

script is_quitter 
	RequireParams \{[
			user_id
		]
		all}
	NetSessionFunc \{obj = party
		func = get_party_members}
	GetArraySize <connections>
	quitter = 1
	if (<array_size> > 0)
		i = 0
		begin
		if ((<connections> [<i>].user_id [0]) = (<user_id> [0]) &&
				(<connections> [<i>].user_id [1]) = (<user_id> [1]))
			if IsPs3
				if ((<connections> [<i>].controller_index) = <controller_index>)
					quitter = 0
					break
				endif
			else
				quitter = 0
				break
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return quitter = <quitter>
endscript

script net_get_invite_controller_by_user_id 
	RequireParams \{[
			user_id
		]
		all}
	GetArraySize ($temp_net_id)
	controller = 0
	if (<array_size> > 0)
		begin
		if (($temp_net_id [<controller>].net_id_first) = (<user_id> [0])
				&& ($temp_net_id [<controller>].net_id_second) = (<user_id> [1]))
			break
		endif
		controller = (<controller> + 1)
		repeat <array_size>
	endif
	return controller = <controller>
endscript

script cancel_career_search_early 
	if ScriptIsRunning \{update_client_searching_timer}
		KillSpawnedScript \{name = update_client_searching_timer}
	endif
	if ScriptIsRunning \{check_player_disconnect}
		KillSpawnedScript \{name = check_player_disconnect}
	endif
	if ScriptIsRunning \{check_invite_valid}
		KillSpawnedScript \{name = check_invite_valid}
	endif
	quit_network_game_early
	change \{num_players_in_band = 0}
	change \{net_band_members = [
		]}
	change \{net_num_joiners = 0}
	change \{net_invites_limbo = 0}
	change \{career_matchmaking_complete = 0}
	if GotParam \{menu_mode}
		change net_band_mode_menu = <menu_mode>
	else
		change \{net_band_mode_menu = HOST}
	endif
	if ($net_band_mode_menu = HOST)
		NetSessionFunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
	endif
	UnPauseGame
	generic_event_back
endscript
ui_band_mode_hit_force_completion = 0

script career_proceed_with_current_reservations 
	NetSessionFunc \{obj = match
		func = get_num_matchmaking_players}
	if (<num_matchmaking_players> > 1)
		change \{ui_band_mode_hit_force_completion = 1}
		NetSessionFunc \{obj = match
			func = force_completion}
	endif
	ui_band_mode_helper_text
endscript

script check_num_matchmaking_players_loop 
	GetSingleTag \{menus}
	begin
	if NOT ScriptIsRunning \{ui_band_mode_update_menu}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
	current_players = ($num_players_in_band)
	GetActiveControllers
	GetArraySize <active_controllers>
	starting_controllers = <active_controllers>
	begin
	if ($career_matchmaking_complete = 1)
		destroy_popup_warning_menu
		change \{net_career_invite_flag = 0}
		ui_band_mode_helper_text
		break
	endif
	Wait \{1
		second}
	repeat
endscript

script net_update_remote_menu_text 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :GetSingleTag \{menus}
		if (NetSessionFunc {obj = match
					func = get_num_matchmaking_players})
			if ($num_players_in_band < 4)
				i = ($num_players_in_band)
				begin
				if ((<num_matchmaking_players> - <i>) > 0)
					msg = qs("Found Player")
				else
					msg = qs("Waiting for players")
				endif
				ResolveScreenElementId id = [
					{id = (<menus> [<i>])}
					{local_id = text}
				]
				if ScreenElementExists id = <resolved_id>
					<resolved_id> :SE_SetProps text = <msg>
				endif
				i = (<i> + 1)
				repeat (4 - ($num_players_in_band))
				if (<current_players> < <num_matchmaking_players>)
					generic_menu_pad_choose_sound
				elseif (<current_players> > <num_matchmaking_players>)
					generic_menu_pad_back_sound
				endif
			endif
		endif
	endif
endscript

script ui_band_mode_change_menu_focus_all 
	RequireParams \{[
			focus_type
		]
		all}
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :GetSingleTag \{menus}
		GetArraySize <menus>
		i = 0
		begin
		if GotParam \{local_only}
			(<menus> [<i>]) :GetSingleTag menu
			if ((<menu> = net_local_root) || (<menu> = net_local_join))
				LaunchEvent target = (<menus> [<i>]) type = <focus_type>
			endif
		else
			LaunchEvent target = (<menus> [<i>]) type = <focus_type>
		endif
		i = (<i> + 1)
		repeat <array_size>
		LaunchEvent target = MyInterfaceElement type = <focus_type>
	endif
endscript

script net_ui_band_mode_create_searching_menu 
	RequireParams \{[
			options_type
		]
		all}
	title = qs("Searching")
	options = [
		{
			func = cancel_career_search_early_if_possible
			text = qs("CANCEL")
		}
	]
	msg_txt_blck = {
		text = $wii_career_searching
	}
	if (<options_type> = both_options)
		options = [
			{
				func = career_proceed_with_current_reservations
				text = qs("CONTINUE")
			}
			{
				func = cancel_career_search_early_if_possible
				text = qs("CANCEL")
			}
		]
		msg_txt_blck = {
			text = qs("Looking for more band members.")
		}
	elseif (<options_type> = invites)
		RemoveParameter \{options}
		title = qs("Joining")
		msg_txt_blck = {
			text = qs("Band Found! Waiting for Host to begin the match.")
		}
	endif
	destroy_popup_warning_menu
	if GotParam \{options}
		create_popup_warning_menu {
			title = <title>
			textblock = <msg_txt_blck>
			options = <options>
			no_background
			popup_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		AssignAlias id = <menu_id> alias = band_mode_searching_menu
		gradient_parent = dlog_master_container
	else
		create_popup_warning_menu {
			title = <title>
			textblock = <msg_txt_blck>
			no_background
			popup_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		gradient_parent = alert_master_container
	endif
	ui_band_mode_helper_text \{no_back = 1}
	ResolveScreenElementId id = [
		{id = PopupElement}
		{local_id = <gradient_parent>}
		{local_id = gradient_256}
	]
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :SE_SetProps alpha = 0.0
	endif
	get_net_loading_globe_pos
	CreateScreenElement {
		id = online_load_wheel_BG
		type = SpriteElement
		parent = PopupElement
		texture = online_load_wheel_BG
		pos = <globe_pos>
		dims = (128.0, 128.0)
		just = [center center]
		z_priority = 520
		no_squishy = true
	}
	CreateScreenElement {
		type = SpriteElement
		parent = PopupElement
		texture = online_load_wheel
		pos = <globe_pos>
		dims = (128.0, 128.0)
		just = [center center]
		z_priority = 521
		no_squishy = true
	}
	PopupElement :Obj_SpawnScriptNow animate_online_icon params = {id = <id>}
endscript

script cancel_career_search_early_if_possible 
	if IsDwcInPotentiallyBlockingCall
		stars
		printf \{qs(0xa72c779c)}
		stars
		spawnscriptnow \{open_net_problems_icon}
	else
		if ScriptIsRunning \{check_invite_valid}
			KillSpawnedScript \{name = check_invite_valid}
		endif
		cancel_career_search_early
		change_controller_disconnect_scripts_on_all_menus \{change_type = Add}
	endif
endscript

script get_controller_part 
	RequireParams \{[
			controller
		]
		all}
	if IsGuitarController controller = <controller>
		return \{controller_part = guitar}
	elseif IsDrumController controller = <controller>
		return \{controller_part = drum}
	else
		return \{controller_part = Vocals}
	endif
endscript

script career_friendslist_callback 
	printf \{qs("\L--- career_friendlist_callback ---")}
	RequireParams \{[
			params
		]
		all}
	if GotParam \{friendList}
		if ScreenElementExists \{id = MyInterfaceElement}
			MyInterfaceElement :GetSingleTag \{menus}
			if ScreenElementExists id = (<menus> [(<params>.menu_index)])
				(<menus> [(<params>.menu_index)]) :GetSingleTag menu
				if (<menu> = friends)
					GetArraySize <friendList>
					if (<array_size> > 0)
						i = 0
						begin
						if (0 != <friendList> [<i>].LocalPlayer)
							CANT_INVITE = 1
						elseif (0 != <friendList> [<i>].AlreadyInGame)
							CANT_INVITE = 1
						else
							CANT_INVITE = 0
						endif
						CreateScreenElement {
							type = ContainerElement
							parent = (<menus> [(<params>.menu_index)])
							dims = (200.0, 40.0)
							just = [center bottom]
						}
						container_id = <id>
						CreateScreenElement {
							type = TextBlockElement
							fit_width = `expand dims`
							fit_height = `scale down if larger`
							parent = <id>
							text = (<friendList> [<i>].name)
							font = fontgrid_text_a6
							dims = (0.0, 40.0)
							rgba = ($menu_unfocus_color)
							event_handlers = [
								{focus retail_menu_focus}
								{unfocus retail_menu_unfocus}
								{focus career_friendslist_scroll}
								{unfocus career_friendslist_stop_scroll}
							]
							internal_scale = 0.75
							just = [left bottom]
							internal_just = [left center]
							pos_anchor = [left bottom]
							pos = (0.0, 0.0)
						}
						GetScreenElementDims id = <id>
						if NOT (<width> > 200)
							<id> :SE_SetProps {
								just = [center bottom]
								internal_just = [center center]
								pos_anchor = [center bottom]
								pos = (0.0, 0.0)
							}
						endif
						<container_id> :SE_SetProps {
							focusable_child = <id>
							event_handlers = [
								{pad_choose ui_band_mode_choose params = {
										friends = invite
										name = (<friendList> [<i>].name)
										id = (<friendList> [<i>].id)
										sentfriendrequest = (<friendList> [<i>].sentfriendrequest)
										sentinvite = (<friendList> [<i>].sentinvite)
										friendstate = (<friendList> [<i>].friendstate)
										CANT_INVITE = <CANT_INVITE>
									}
								}
							]
						}
						<i> = (<i> + 1)
						repeat <array_size>
					else
						CreateScreenElement {
							type = TextBlockElement
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							parent = (<menus> [(<params>.menu_index)])
							text = qs("EMPTY")
							font = fontgrid_text_a6
							dims = (170.0, 40.0)
							rgba = ($menu_unfocus_color)
							event_handlers = [
								{focus retail_menu_focus}
								{unfocus retail_menu_unfocus}
							]
							internal_scale = 0.75
							just = [center bottom]
							internal_just = [center center]
						}
					endif
				endif
			endif
		endif
	endif
endscript

script career_friendslist_scroll 
	Obj_GetID
	GetScreenElementDims id = <ObjID>
	if (<width> <= 200)
		return
	endif
	x = (<width> - 200)
	begin
	Wait \{0.5
		seconds}
	SE_SetProps pos = ((-1.0, 0.0) * <x>) time = (10 * <x> / 200)
	SE_WaitProps
	Wait \{0.5
		seconds}
	SE_SetProps pos = (0.0, 0.0) time = (10 * <x> / 200)
	SE_WaitProps
	repeat
endscript

script career_friendslist_stop_scroll 
	Obj_KillSpawnedScript \{name = career_friendslist_scroll}
	SE_SetProps \{pos = (0.0, 0.0)}
endscript

script net_move_invite_player_to_open_menu 
	RequireParams \{[
			menu_id
		]
		all}
	<menu_id> :GetTags
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :GetSingleTag \{menus}
		m = 0
		GetArraySize \{menus}
		begin
		(<menus> [<m>]) :GetSingleTag menu
		if (join = <menu>)
			open_menu = <m>
			break
		endif
		m = (<m> + 1)
		repeat <array_size>
		if GotParam \{open_menu}
			(<menus> [<open_menu>]) :Obj_KillSpawnedScript name = ui_band_mode_update_name
			(<menus> [<open_menu>]) :Obj_KillSpawnedScript name = ui_band_mode_check_disconnect
			NetSessionFunc \{obj = party
				func = get_party_members}
			GetArraySize <connections>
			i = 0
			begin
			if ((<connections> [<i>].user_id [0]) = (<user_id> [0]) && (<connections> [<i>].user_id [1]) = (<user_id> [1]))
				name = (<connections> [<i>].gamertag)
			endif
			i = (<i> + 1)
			repeat <array_size>
			add_gamertag_to_band_lobby index = <open_menu> name = <name> menu = net_remote_root
			ui_band_mode_show_character player = (<open_menu> + 1)
			(<menus> [<open_menu>]) :SetTags {
				menu = net_remote_root
				instrument = <instrument>
				difficulty = none
				user_id = <user_id>
			}
			(<menus> [<open_menu>]) :obj_spawnscript ui_band_mode_update_menu
			return open_menu = <open_menu>
		else
			ScriptAssert \{qs("\Lwe did not find an open spot for our new party memeber")}
		endif
	endif
endscript

script net_career_memcard_drop_player 
	printf \{qs("\L--- net_career_memcard_drop_player ---")}
	spawnscriptnow wait_for_net_career_drop_player params = {<...>}
endscript

script wait_for_net_career_drop_player 
	printf \{qs("\L--- wait_for_net_career_drop_player ---")}
	begin
	if ($memcard_state_active = 0)
		ui_event_get_top
		if (<base_name> = 'band_mode')
			if ScreenElementExists \{id = MyInterfaceElement}
				break
			endif
		elseif (<base_name> = 'group_play')
			return
		endif
	endif
	Wait \{1
		second}
	repeat
	net_career_drop_player <...>
endscript

script net_career_memcard_end_game 
	printf \{qs("\L--- net_career_memcard_end_game ---")}
	spawnscriptnow wait_for_net_career_end_game params = {<...>}
endscript

script wait_for_net_career_end_game 
	printf \{qs("\L--- wait_for_net_career_end_game ---")}
	begin
	if ($memcard_state_active = 0)
		ui_event_get_top
		if (<base_name> = 'band_mode')
			if ScreenElementExists \{id = MyInterfaceElement}
				break
			endif
		elseif (<base_name> = 'group_play')
			return
		endif
	endif
	Wait \{1
		second}
	repeat
	net_career_end_game <...>
endscript

script net_career_drop_player 
	printf \{qs("\L--- net_career_drop_player ---")}
	printstruct <...>
	if (<is_game_over> = 0)
		change net_num_players = (($net_num_players) - 1)
		change current_num_players = (($current_num_players) - 1)
		change num_players_in_band = (($num_players_in_band) - 1)
		FormatText checksumname = mode 'p%d_career' d = ($current_num_players)
		change game_mode = <mode>
		SetPlayerInfo <dropped_player_num> is_local_client = 0
		SetPlayerInfo <dropped_player_num> net_id_first = 0
		SetPlayerInfo <dropped_player_num> net_id_second = 0
		SetPlayerInfo <dropped_player_num> net_obj_id = -1
		SetPlayerInfo <dropped_player_num> team = 0
		SetPlayerInfo <dropped_player_num> party_id = -1
		change net_dropped_players_flag = (($net_dropped_players_flag) + 1)
		switch <drop_reason>
			case net_message_player_quit
			FormatText TextName = drop_msg qs("%s has quit.\n") s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			FormatText TextName = drop_msg qs("Lost connection to %s.\n") s = <name_string>
			default
			drop_msg = qs("")
		endswitch
		if ScreenElementExists \{id = MyInterfaceElement}
			net_create_player_drop_message_box parent_element = MyInterfaceElement drop_msg = <drop_msg>
			MyInterfaceElement :GetTags
			(<menus> [(<dropped_player_num> - 1)]) :SetTags {
				menu = net_remote_open
				instrument = none
				difficulty = none
			}
			ui_band_mode_kill_character player = <dropped_player_num>
			(<descs> [(<dropped_player_num> - 1)]) :SE_SetProps reposition_pos = (0.0, 220.0) time = 0.1 motion = ease_out
			(<descs> [(<dropped_player_num> - 1)]) :SE_WaitProps
			(<descs> [(<dropped_player_num> - 1)]) :SE_SetProps reposition_pos = (0.0, 450.0) time = 0.1 alpha = 0
		endif
	endif
endscript

script net_career_end_game 
	printf \{qs("\L--- net_career_end_game ---")}
	ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
	if (($net_career_end_game_already_called) = 0)
		change \{net_career_end_game_already_called = 1}
	else
		return
	endif
	switch <drop_reason>
		case net_message_player_quit
		FormatText TextName = first_msg qs("%s has quit.") s = <name_string>
		case net_message_player_dropped
		case net_message_player_timed_out
		FormatText TextName = first_msg qs("Lost connection to %s.") s = <name_string>
		default
		first_msg = qs("")
	endswitch
	FormatText TextName = msg qs("%s\nThere are not enough players to continue.") s = <first_msg>
	create_net_popup title = qs("GAME OVER") popup_text = <msg>
	if ScreenElementExists \{id = PopupElement}
		PopupElement :SE_SetProps \{z_priority = 1500.2}
	endif
	Wait \{3
		seconds}
	destroy_net_popup
	if IsHost
		change \{net_band_mode_menu = HOST}
		NetSessionFunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
	else
		change \{net_band_mode_menu = join}
	endif
	change \{num_players_in_band = 0}
	change \{net_band_members = [
		]}
	change \{net_num_joiners = 0}
	was_career_matchmaking_complete = ($career_matchmaking_complete)
	change \{career_matchmaking_complete = 0}
	change \{game_mode = p4_career}
	quit_network_game
	ui_event_get_stack
	if ((<stack> [1].base_name) = 'band_mode')
		if (((<stack> [0].base_name) = 'online_quit_warning') || ((<stack> [0].base_name) = 'gig_posters') || ((<stack> [0].base_name) = 'select_instrument_warning'))
			generic_event_back \{data = {
					num_states = 2
				}}
		else
			ui_event \{event = menu_back}
		endif
	else
		ui_event \{event = menu_refresh}
	endif
	if NOT (<was_career_matchmaking_complete>)
		SpawnScript \{safe_spawn_dialog}
	endif
endscript

script fix_deleted_character_player_status 
	FormatText checksumname = player_status 'player%d_status' d = <player>
	if ($<player_status>.is_local_client = 0)
		return
	endif
	get_savegame_from_player_status player_status = <player_status>
	if NOT profile_exists id = ($<player_status>.character_id) savegame = <savegame>
		change structurename = <player_status> character_id = judy
	endif
endscript

script sanity_check_fix_deleted_characters 
	fix_deleted_character_player_status \{player = 1}
	fix_deleted_character_player_status \{player = 2}
	fix_deleted_character_player_status \{player = 3}
	fix_deleted_character_player_status \{player = 4}
	fix_deleted_character_player_status \{player = 5}
	fix_deleted_character_player_status \{player = 6}
	fix_deleted_character_player_status \{player = 7}
	fix_deleted_character_player_status \{player = 8}
endscript

script hacky_fix_band_celebrity_character 
	RequireParams \{[
			player
		]
		all}
	printf 'hacky_fix_band_celebrity_character p=%p' p = <player>
	GetPlayerInfo <player> character_id
	GetPlayerInfo <player> controller
	GetPlayerInfo <player> is_local_client
	if (<is_local_client> = 1)
		get_savegame_from_controller band_character_select controller = <controller>
		get_controller_part controller = <controller>
		if NOT fix_disallowed_character_choice character_id = <character_id> savegame = <savegame> part = <controller_part>
			printf qs("\L%a not allowed on %b") a = <character_id> b = <controller_part>
			SetPlayerInfo <player> character_id = <character_id>
			if (<controller> <= 4)
				cas_queue_new_character_profile id = <character_id> player = (<controller> + 1) savegame = <savegame>
				band_character_rename index = (<player> -1) player = <player>
			endif
		endif
	endif
endscript

script net_career_get_band_leader_difficulty 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :GetSingleTag \{menus}
		GetArraySize <menus>
		i = 0
		begin
		(<menus> [<i>]) :GetTags
		if (<band_leader> = 1)
			return band_difficulty = <difficulty>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	ScriptAssert \{qs("\Lno band leader found. Is this function getting called on a client machine?")}
endscript

script net_career_wait_until_menu_update_is_done 
	begin
	if NOT ScriptIsRunning \{ui_band_mode_update_menu}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script net_career_asign_band_leader_icon 
	RequireParams \{[
			player_num
		]
		all}
	begin
	if ScreenElementExists \{id = MyInterfaceElement}
		break
	endif
	Wait \{1
		second}
	repeat
	change net_band_leader_player_num = <player_num>
	MyInterfaceElement :GetSingleTag \{descs}
	printf \{qs(0x1c2385cc)}
	(<descs> [(<player_num> - 1)]) :SE_SetProps leader_indicator_alpha = 1.0
endscript

script net_career_check_instruments 
	printf \{qs("\L--- net_career_check_instruments ---")}
	GameMode_GetType
	if (<type> = career)
		loop_count = 4
	else
		loop_count = 8
		return
	endif
	guitar_count = 0
	bass_count = 0
	drum_count = 0
	vocals_count = 0
	non_asigned_count = 0
	array = []
	i = 1
	begin
	GetPlayerInfo <i> net_obj_id
	if (<net_obj_id> >= 0)
		GetPlayerInfo <i> part
		switch <part>
			case guitar
			guitar_count = (<guitar_count> + 1)
			AddArrayElement array = <array> element = <i>
			case Bass
			bass_count = (<bass_count> + 1)
			AddArrayElement array = <array> element = <i>
			case drum
			drum_count = (<drum_count> + 1)
			case Vocals
			vocals_count = (<vocals_count> + 1)
			default
			non_asigned_count = (<non_asigned_count> + 1)
			AddArrayElement array = <array> element = <i>
		endswitch
	endif
	i = (<i> + 1)
	repeat <loop_count>
	if (<type> = career)
		GetArraySize <array>
		if (<array_size> > 0)
			if ((<guitar_count> > 1) || (<bass_count> > 1))
				net_career_set_instruments player_num_array = <array>
			elseif (<non_asigned_count> = 2)
				net_career_set_instruments player_num_array = <array>
			elseif (<non_asigned_count> = 1)
				GetArraySize <array>
				if (<array_size> = 2)
					GetPlayerInfo (<array> [0]) part
					player1_part = <part>
					GetPlayerInfo (<array> [1]) part
					player2_part = <part>
					if (<player1_part> = guitar)
						SetPlayerInfo (<array> [1]) part = Bass
					elseif (<player1_part> = Bass)
						SetPlayerInfo (<array> [1]) part = guitar
					elseif (<player2_part> = guitar)
						SetPlayerInfo (<array> [0]) part = Bass
					elseif (<player2_part> = Bass)
						SetPlayerInfo (<array> [0]) part = guitar
					endif
				else
					SetPlayerInfo (<array> [0]) part = guitar
				endif
			endif
		endif
	endif
endscript

script net_career_set_instruments 
	RequireParams \{[
			player_num_array
		]
		all}
	part = guitar
	GetArraySize <player_num_array>
	i = 0
	begin
	SetPlayerInfo (<player_num_array> [<i>]) part = <part>
	if (<part> = guitar)
		part = Bass
	elseif (<part> = Bass)
		part = guitar
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script ui_band_mode_ps3_invite_received 
	if GotParam \{device_num}
		if ($primary_controller = <device_num>)
			ps3_display_invites_received
		endif
	endif
endscript

script net_career_host_finalize_menu_ui 
	Wait \{1
		second}
	GetSingleTag \{menus}
	i = 0
	begin
	GetPlayerInfo (<i> + 1) net_obj_id
	if (<net_obj_id> < 0)
		(<menus> [<i>]) :Obj_SpawnScriptLater ui_band_mode_update_menu
	endif
	i = (<i> + 1)
	repeat 4
endscript

script change_controller_disconnect_scripts_on_all_menus 
	RequireParams \{[
			change_type
		]
		all}
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :GetSingleTag \{menus}
		GetArraySize <menus>
		i = 0
		begin
		if (<change_type> = remove)
			(<menus> [<i>]) :Obj_KillSpawnedScript name = ui_band_mode_check_disconnect
		elseif (<change_type> = Add)
			(<menus> [<i>]) :Obj_SpawnScriptLater ui_band_mode_check_disconnect
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script open_band_mode_searching_popup 
	if NOT ScriptIsRunning \{update_client_searching_time}
		SpawnScriptLater \{update_client_searching_timer}
	endif
	change \{dwc_done_matchmaking = 0}
	options = [
		{
			func = cancel_career_search_early_if_possible
			text = $wii_popup_cancel
		}
	]
	msg_txt_blck = {
		text = $wii_popup_searching
	}
	destroy_popup_warning_menu
	create_popup_warning_menu {
		wait_variable = dwc_done_matchmaking
		title = $wii_popup_searching
		textblock = <msg_txt_blck>
		options = <options>
		no_background
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
	}
	ui_band_mode_helper_text \{no_back = 1}
	ResolveScreenElementId \{id = [
			{
				id = PopupElement
			}
			{
				local_id = dlog_master_container
			}
			{
				local_id = gradient_256
			}
		]}
	if ScreenElementExists id = <resolved_id>
		<resolved_id> :SE_SetProps alpha = 0.0
	endif
	get_net_loading_globe_pos
	CreateScreenElement {
		id = online_load_wheel_BG
		type = SpriteElement
		parent = PopupElement
		texture = online_load_wheel_BG
		pos = <globe_pos>
		dims = (128.0, 128.0)
		just = [center center]
		z_priority = 520
		no_squishy = true
	}
	CreateScreenElement {
		type = SpriteElement
		parent = PopupElement
		texture = online_load_wheel
		pos = <globe_pos>
		dims = (128.0, 128.0)
		just = [center center]
		z_priority = 521
		no_squishy = true
	}
	PopupElement :Obj_SpawnScriptNow animate_online_icon params = {id = <id>}
endscript

script ready_up_players_invite_client 
	printf \{qs(0x72957feb)}
	RequireParams \{[
			enabled_controllers
			resolved_Friend_Index
		]
		all}
	printstruct <...>
	SetButtonEventMappings \{block_menu_input}
	index = 0
	controller_enabled = 0
	begin
	printf qs(0xe919beb8) d = <index>
	<controller_enabled> = (<enabled_controllers> [<index>])
	if (<controller_enabled> = 1)
		printf qs(0xa2fb96ad) d = <index>
		Wait \{1.5
			seconds}
		LaunchEvent type = pad_choose data = {device_num = <index>}
		Wait \{1.5
			seconds}
		LaunchEvent type = pad_choose data = {device_num = <index>}
	else
		printf qs(0x601eb827) d = <index>
	endif
	<index> = (<index> + 1)
	repeat 4
	destroy_popup_warning_menu
	ui_band_mode_friends_game device_num = $primary_controller friend_index = <resolved_Friend_Index>
	SetButtonEventMappings \{unblock_menu_input}
endscript

script UpdateNumLocalPlayers 
	change \{num_local_players = 0}
	controller = 0
	begin
	if NetSessionFunc func = IsControllerInGame params = {controller = <controller>}
		change num_local_players = (($num_local_players) + 1)
	endif
	controller = (<controller> + 1)
	repeat 4
endscript

script create_band_confirm_search_again 
	destroy_popup_warning_menu
	create_popup_warning_menu \{title = $wii_popup_update
		textblock = {
			text = $wii_search_warning
		}
		no_background
		options = [
			{
				func = open_band_mode_searching_popup
				text = $wii_popup_continue
			}
			{
				func = cancel_career_search_early_if_possible
				text = $wii_popup_cancell_search
			}
		]
		popup_event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
		]}
	get_net_loading_globe_pos
	CreateScreenElement {
		id = online_load_wheel_BG
		type = SpriteElement
		parent = PopupElement
		texture = online_load_wheel_BG
		pos = <globe_pos>
		dims = (128.0, 128.0)
		just = [center center]
		z_priority = 520
		no_squishy = true
	}
	CreateScreenElement {
		type = SpriteElement
		parent = PopupElement
		texture = online_load_wheel
		pos = <globe_pos>
		dims = (128.0, 128.0)
		just = [center center]
		z_priority = 521
		no_squishy = true
	}
	PopupElement :Obj_SpawnScriptNow animate_online_icon params = {id = <id>}
endscript

script update_client_searching_timer 
	printf \{qs(0xc7759301)}
	searching_timer = 0
	begin
	if NOT NetSessionFunc \{obj = session
			func = is_matchmaking_active}
		printf \{qs("\LScript detected matchmaking finished!")}
		break
	endif
	searching_timer = (<searching_timer> + 1)
	printf qs(0x2319f0b4) d = <searching_timer>
	if (<searching_timer> > 60)
		create_band_confirm_search_again
		break
	endif
	Wait \{1
		second}
	repeat
	printf \{qs(0x21872cc7)}
endscript

script career_quit_warning_popup 
	ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
	create_popup_warning_menu \{title = $wii_popup_warning
		textblock = {
			text = $wii_quit_career_warning
		}
		parent = band_mode_menu
		no_background
		options = [
			{
				func = cancel_quit
				text = $wii_popup_cancel
			}
			{
				func = quit_career_mode
				text = $wii_popup_quit
			}
		]
		popup_event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down
				}
			}
		]}
endscript

script quit_career_mode 
	destroy_popup_warning_menu
	ui_band_mode_change_menu_focus_all \{focus_type = focus}
	if NOT (($net_band_mode_menu = HOST))
		ui_band_mode_choose_sound back controller = <controller>
	endif
	cas_destroy_all_characters
	if ui_event_exists_in_stack \{name = 'group_play'}
		change \{is_network_game = 0}
		ui_event \{event = menu_back
			data = {
				state = uistate_group_play
			}}
	else
		if ui_event_exists_in_stack \{name = 'online'}
			ui_event \{event = menu_back
				data = {
					state = uistate_online
				}}
		endif
	endif
endscript

script cancel_quit 
	destroy_popup_warning_menu
	ui_band_mode_change_menu_focus_all \{focus_type = focus}
endscript

script ui_band_mode_select_friends 
	MyInterfaceElement :SE_SetProps \{alpha = 0.0}
	generic_event_choose \{state = UIstate_wii_friends_list
		data = {
			is_popup
			for_invite = 1
		}}
endscript

script ui_band_mode_ready_all 
	printf \{qs(0x663d16fd)}
	printf ($is_network_game)
	i = 0
	begin
	MyInterfaceElement :GetSingleTag \{menus}
	printf '%d' d = (<menus> [<i>])
	(<menus> [<i>]) :GetSingleTag menu
	bal = (<menus> [<i>])
	printstruct <bal>
	printf 'player %e menu %d' e = <i> d = <menu>
	if NOT (<menu> = join)
		printf \{qs(0x66365b78)}
		if (<menu> = character || <menu> = p2_character)
			printf \{qs(0xa95b7547)}
			Wait \{1
				seconds}
			LaunchEvent type = pad_back data = {device_num = <i>}
			Wait \{1
				seconds}
			printf \{qs(0x6832f580)}
			LaunchEvent type = pad_choose data = {device_num = <i>}
		elseif (<menu> = net_local_join)
			GetScreenElementChildren id = <bal>
			GetArraySize <children>
			printf qs(0xc5ddac2f) d = <array_size>
			menu_id = (<menus> [<i>])
			Wait \{1
				seconds}
			LaunchEvent type = focus target = <menu_id> data = {child_index = 3}
			printf \{qs(0x6832f580)}
			Wait \{1
				seconds}
			LaunchEvent type = pad_choose data = {device_num = <i>}
		else
			printf \{qs(0xc9de1c8e)}
		endif
	else
		printf \{qs(0xcde77ab2)}
	endif
	<i> = (<i> + 1)
	repeat 4
	destroy_popup_warning_menu
endscript

script ui_band_mode_friends_match 
	SetButtonEventMappings \{block_menu_input}
	RequireParams \{[
			friend_index
		]
		all}
	ui_band_mode_ready_all
	ui_band_mode_friends_game device_num = $primary_controller friend_index = <friend_index>
	Wait \{2
		seconds}
	SpawnScript \{check_player_disconnect}
	SetButtonEventMappings \{unblock_menu_input}
endscript

script ui_band_mode_force_ready 
	RequireParams \{[
			menu_id
		]
		all}
	if ($is_network_game)
		change num_local_players = (($num_local_players) + 1)
	endif
	<menu_id> :SetTags {menu = ready}
	begin
	if NOT ScriptIsRunning \{ui_band_mode_update_menu}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	<menu_id> :obj_spawnscript ui_band_mode_update_menu
	if ($is_network_game = 1)
		ui_event_get_stack
		if ((<stack> [0].base_name) = 'band_mode')
			ui_band_mode_helper_text <...>
		endif
	else
		ui_band_mode_helper_text <...>
	endif
endscript

script ui_band_mode_friends_game 
	printf \{qs(0x75d68497)}
	RequireParams \{[
			friend_index
		]
		all}
	begin
	if NOT Is_ui_event_running
		break
	endif
	WaitOneGameFrame
	repeat
	MyInterfaceElement :GetTags
	printf \{qs(0x012b56ce)}
	num_ready = 0
	player = 1
	real_player = 1
	temp_devices = [-1 , -1 , -1 , -1]
	temp_devices_remove = [-1 , -1 , -1 , -1]
	array = []
	temp_characters = [arse arse arse arse]
	band_controller_types = [0 0 0 0]
	GetArraySize <menus>
	i = 0
	begin
	<curr_id> = (<menus> [<i>])
	<curr_id> :GetTags
	printstruct <menu>
	add_player = 0
	if (<menu> = ready)
		add_player = 1
	endif
	if (<add_player> = 1)
		<num_ready> = (<num_ready> + 1)
		SetArrayElement ArrayName = temp_devices index = (<real_player> - 1) newvalue = <controller>
		if ($is_network_game)
			<check_cont> = ($primary_controller)
		else
			<check_cont> = $band_mode_current_leader
		endif
		if (<controller> = <check_cont>)
			primary_controller_ready = 1
		endif
		GetPlayerInfo (<i> + 1) character_id
		SetArrayElement ArrayName = temp_characters index = (<real_player> - 1) newvalue = <character_id>
		if NOT NetSessionFunc obj = match func = get_gamertag params = {controller = <i>}
			name = qs("\L")
		endif
		AddArrayElement array = <array> element = <name>
		if IsGuitarController controller = <controller>
			SetArrayElement ArrayName = band_controller_types index = (<real_player> - 1) newvalue = 1
		elseif IsDrumController controller = <controller>
			SetArrayElement ArrayName = band_controller_types index = (<real_player> - 1) newvalue = 2
		else
			SetArrayElement ArrayName = band_controller_types index = (<real_player> - 1) newvalue = 3
		endif
		<real_player> = (<real_player> + 1)
	else
		SetArrayElement ArrayName = temp_devices_remove index = <i> newvalue = <controller>
	endif
	i = (<i> + 1)
	repeat <array_size>
	printstruct <temp_devices>
	printstruct <temp_characters>
	printf qs(0x433d17ea) d = <num_ready>
	if (<num_ready> > 0)
		change \{current_progression_flag = Career_Band}
	else
		return
	endif
	<player> = 1
	begin
	printf \{qs(0xe896e317)}
	if ((<temp_devices> [(<player> - 1)]) < 0)
		ScriptAssert \{'Some player didnt get a controller set correctly'}
	endif
	if ((<temp_characters> [(<player> - 1)]) = arse)
		ScriptAssert \{'Some player didnt get a character set correctly'}
	endif
	FormatText checksumname = player_device 'player%d_device' d = <player>
	change globalname = <player_device> newvalue = (<temp_devices> [(<player> - 1)])
	FormatText checksumname = gamertag 'gamertag_%d' d = (<player> - 1)
	change globalname = <gamertag> newvalue = (<array> [(<player> - 1)])
	SetPlayerInfo <player> gamertag = <gamertag>
	SetPlayerInfo <player> controller = (<temp_devices> [(<player> - 1)])
	SetPlayerInfo <player> character_id = (<temp_characters> [(<player> - 1)])
	SetPlayerInfo <player> is_local_client = 1
	SetPlayerInfo <player> difficulty = ($default_difficulty [(<temp_devices> [(<player> - 1)])])
	if ($is_network_game = 1)
		GetNetID controller_index = (<temp_devices> [(<player> - 1)])
		NetSessionFunc func = get_gamertag params = {controller = (<temp_devices> [(<player> - 1)])}
		SetArrayElement ArrayName = temp_net_id GlobalArray index = (<temp_devices> [(<player> - 1)]) newvalue = {net_id_first = <net_id_first> net_id_second = <net_id_second> name = <name>}
	endif
	<player> = (<player> + 1)
	repeat (<real_player> - 1)
	GetArraySize <temp_devices_remove>
	i = 0
	begin
	printf \{qs(0xc548d959)}
	if NOT ((<temp_devices_remove> [<i>]) = -1)
		NetSessionFunc func = RemoveController params = {controller = (<temp_devices_remove> [<i>])}
		cas_queue_kill_player player = (<i> + 1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (($is_network_game = 1) && (<num_ready> < 4))
		remote_player = (<num_ready> + 1)
		begin
		SetPlayerInfo <remote_player> is_local_client = 0
		remote_player = (<remote_player> + 1)
		repeat (4 - <num_ready>)
	endif
	mode = p4_career
	NetOptions :Pref_Choose \{name = game_modes
		checksum = p4_career}
	NetOptions :Pref_Choose \{name = ranked
		checksum = player}
	change num_players_in_band = <num_ready>
	set_network_preferences
	change game_mode = <mode>
	change current_num_players = <num_ready>
	change \{band_mode_active = 1}
	change \{in_join_band_screens = 0}
	change band_mode_actual_devices = <temp_devices>
	cancel_all_cas_loads
	clear_exclusive_devices
	i = 0
	begin
	if NOT (<temp_devices> [<i>] = -1)
		add_exclusive_device device = (<temp_devices> [<i>])
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	change \{respond_to_signin_changed_all_players = 1}
	SoundEvent \{event = Band_Mode_Career_Ready}
	if ($net_band_mode_menu = join)
		printf \{qs(0x7c2ba9c1)}
		if NOT check_num_local_players
			return
		endif
		printf qs("\Lcurrent_num_players = %d") d = ($current_num_players)
		ui_band_mode_change_menu_focus_all \{focus_type = unfocus}
		set_network_preferences
		clear_network_wait_variable
		Wait \{3
			gameframes}
		open_band_mode_searching_popup
		<ranked> = player
		get_custom_match_search_params
		change \{net_career_end_game_already_called = 0}
		change_controller_disconnect_scripts_on_all_menus \{change_type = remove}
		UpdateNumLocalPlayers
		DWCJoinGame <...> join_friends = 1 friend_index = <friend_index>
	elseif ($net_band_mode_menu = HOST)
		printf \{qs(0xb187e39c)}
		if NOT check_num_local_players
			return
		endif
		RequireParams \{[
				device_num
			]
			all}
		change \{net_career_end_game_already_called = 0}
		set_user_values_for_match
		get_custom_match_search_params
		set_network_preferences
		change \{net_band_mode_menu = lobby}
		generic_blocking_execute_script \{pad_script = generic_event_choose
			pad_params = {
				data = {
					no_sound
					state = UIstate_band_mode
				}
			}}
		clear_network_wait_variable
		WaitOneGameFrame
		post_network_game controller = <device_num> who_can_join = friends friend_index = <friend_index>
	endif
	printf \{qs(0x864f064f)}
endscript

script check_num_local_players 
	UpdateNumLocalPlayers
	if ($num_local_players = 4)
		update_network_ticker \{msg_checksum = net_too_many_local}
		return \{false}
	else
		return \{true}
	endif
endscript
