invite_instruments = [
	{
		checksum = guitar1
		name = $wii_guitar_1
	}
	{
		checksum = guitar2
		name = $wii_guitar_2
	}
	{
		checksum = Drums
		name = qs("Drums")
	}
	{
		checksum = Vocals
		name = qs("Vocals")
	}
]

script ui_create_wii_invite_players \{online = 1
		min_players = 0
		max_players = 4
		enable_if_online = 1
		enable_if_valid = 0
		required_instruments = {
			guitar1
		}
		pad_start_script = dump_players_selected
		game_mode = p2_pro_faceoff
		detail_game_mode = p2_pro_faceoff}
	CreateScreenElement \{parent = root_window
		id = wii_sign_in_menu
		type = DescInterface
		desc = 'wifi_signin'
		scale = (0.85, 1.0)
		pos = (20.0, -30.0)
		Player1_text = $wii_invite_players_player1_text
		Player2_text = $wii_invite_players_player2_text
		Player3_text = $wii_invite_players_player3_text
		Player4_text = $wii_invite_players_player4_text
		Player1Connect_text = $wii_invite_players_connect_text
		Player2Connect_text = $wii_invite_players_connect_text
		Player3Connect_text = $wii_invite_players_connect_text
		Player4Connect_text = $wii_invite_players_connect_text
		Player1SignIn_text = qs("")
		Player2SignIn_text = qs("")
		Player3SignIn_text = qs("")
		Player4SignIn_text = qs("")}
	CreateScreenElement \{parent = root_window
		id = SideBar
		type = DescInterface
		desc = 'invite_side_panel'
		pos = (420.0, -4.0)}
	<invite_props> = {}
	if (<min_players> = <max_players>)
		FormatText TextName = players qs("%d") d = <max_players>
	else
		FormatText TextName = players qs(0xd5f4275a) d = <min_players> e = <max_players>
	endif
	<invite_props> = {
		<invite_props>
		Players_Text = <players>
	}
	if StructureContains \{Structure = required_instruments
			guitar1}
		<invite_props> = {
			<invite_props>
			Guitar_alpha = 1
		}
	else
		<invite_props> = {
			<invite_props>
			Guitar_alpha = 0.2
		}
	endif
	if StructureContains \{Structure = required_instruments
			guitar2}
		<invite_props> = {
			<invite_props>
			Bass_alpha = 1
		}
	else
		<invite_props> = {
			<invite_props>
			Bass_alpha = 0.2
		}
	endif
	if StructureContains \{Structure = required_instruments
			Vocals}
		<invite_props> = {
			<invite_props>
			Vocal_alpha = 1
		}
	else
		<invite_props> = {
			<invite_props>
			Vocal_alpha = 0.2
		}
	endif
	if StructureContains \{Structure = required_instruments
			Drums}
		<invite_props> = {
			<invite_props>
			Drum_alpha = 1
		}
	else
		<invite_props> = {
			<invite_props>
			Drum_alpha = 0.2
		}
	endif
	SideBar :SE_SetProps <invite_props>
	AssignAlias \{id = wii_sign_in_menu
		alias = current_menu}
	last_controller_types = [none none none none]
	active_controllers = [0 0 0 0]
	last_part = [0 0 0 0]
	if (<enable_if_online> = 1)
		get_online_controllers
	elseif (<enable_if_valid> = 1)
		get_required_instruments required_instruments = <required_instruments>
	else
		enabled = [0 0 0 0]
	endif
	printstruct <...>
	<i> = 0
	<num_vocalists> = 0
	<vocalists> = [0 0 0 0]
	begin
	if (<enabled> [<i>] = 1)
		get_controller_type controller_index = <i>
		if (<controller_type> = Vocals)
			<num_vocalists> = (<num_vocalists> + 1)
			SetArrayElement ArrayName = vocalists index = <i> newvalue = 1
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	if (<num_vocalists> > 1)
		<i> = 0
		begin
		if (<vocalists> [<i>] = 1)
			printf qs(0x6867ff53) d = <i>
			SetArrayElement ArrayName = enabled index = <i> newvalue = 0
		endif
		<i> = (<i> + 1)
		repeat 4
	endif
	i = 0
	num_selected = 0
	begin
	if (<enabled> [<i>] = 1)
		<num_selected> = (<num_selected> + 1)
	endif
	<i> = (<i> + 1)
	repeat 4
	sign_in_funcs = [wii_sign_in_none_signin wii_sign_in_none_signin wii_sign_in_none_signin wii_sign_in_none_signin]
	wii_sign_in_menu :SE_SetProps {
		event_handlers = [
			{pad_start <pad_start_script>}
			{pad_choose wii_invite_players_choose}
			{pad_back restore_previous_player_bindings_and_leave}
			{pad_l1 wii_sign_in_toggle_part}
		]
	}
	original_controllers = [0 0 0 0]
	i = 0
	begin
	GetPlayerInfo (<i> + 1) controller
	SetArrayElement ArrayName = original_controllers index = <i> newvalue = <controller>
	<i> = (<i> + 1)
	repeat 4
	SetPlayerInfo \{1
		controller = 0}
	SetPlayerInfo \{2
		controller = 1}
	SetPlayerInfo \{3
		controller = 2}
	SetPlayerInfo \{4
		controller = 3}
	wii_sign_in_menu :SetTags {
		last_active_controllers = <active_controllers>
		last_controller_types = <last_controller_types>
		last_enabled = [0 0 0 0]
		last_part = <last_part>
		sign_in_funcs = <sign_in_funcs>
		num_selected = <num_selected>
		min_players = <min_players>
		max_players = <max_players>
		original_controllers = <original_controllers>
		required_instruments = <required_instruments>
		online = <online>
		game_mode = <game_mode>
		detail_game_mode = <detail_game_mode>
		vocalist_assigned = -1
	}
	wii_sign_in_refresh_controllers
	<i> = 0
	begin
	if (<enabled> [<i>] = 1)
		printf qs(0x77faf31e) d = <i>
		wii_sign_in_player_choose device_num = <i>
	endif
	<i> = (<i> + 1)
	repeat 4
	LaunchEvent \{target = wii_sign_in_menu
		type = focus}
	create_wii_invite_players_helpers
	SpawnScriptLater \{wii_sign_in_poll_controllers}
	SpawnScriptLater \{wii_invite_players_poll_invite}
endscript

script ui_destroy_wii_invite_players 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = wii_sign_in_menu}
		DestroyScreenElement \{id = wii_sign_in_menu}
	endif
	if ScreenElementExists \{id = SideBar}
		DestroyScreenElement \{id = SideBar}
	endif
	KillSpawnedScript \{name = wii_sign_in_poll_controllers}
	KillSpawnedScript \{name = wii_invite_players_poll_invite}
endscript

script wii_invite_players_poll_invite 
	GetFriendInfo index = ($friendlist_selection_index)
	friend_index = <resolvedIndex>
	begin
	if NOT check_invite index = <friend_index>
		spawnscriptnow \{controller_sign_in_invite_invalid}
		return
	endif
	ui_event_get_top
	if NOT (<base_name> = 'wii_invite_players')
		return
	endif
	Wait \{10
		gameframes}
	repeat
endscript

script controller_sign_in_invite_invalid 
	ui_event_get_top
	if NOT (<base_name> = 'wii_invite_players')
		return
	endif
	restore_previous_player_bindings_and_leave
	create_generic_popup \{title = $wii_error
		ok_menu
		message = $wii_invite_error_invalid
		ok_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				block_refresh_and_destroy
			}
		]
		priority = 5
		back_script = block_refresh_and_destroy}
endscript

script create_wii_invite_players_helpers 
	add_user_control_helper \{text = $wii_sign_in_out
		button = green
		z = 100000}
	add_user_control_helper \{text = qs("GUITAR/BASS")
		button = Orange
		z = 100000
		use_guitar_button = 1}
	add_user_control_helper \{text = qs("ACCEPT")
		button = start
		z = 100000}
	add_user_control_helper \{text = qs("CANCEL")
		button = red
		z = 100000}
endscript

script wii_invite_players_choose 
	wii_sign_in_player_choose device_num = <device_num>
	wii_sign_in_menu :GetSingleTag \{last_enabled}
	num_selected = 0
	i = 0
	begin
	if (<last_enabled> [<i>] = 1)
		<num_selected> = (<num_selected> + 1)
	endif
	<i> = (<i> + 1)
	repeat 4
	wii_sign_in_menu :SetTags num_selected = <num_selected>
endscript

script get_online_controllers 
	get_instrument_tags \{check_online = 1}
	enabled = [0 0 0 0]
	i = 0
	begin
	if StructureContains Structure = <tags> ($invite_instruments [<i>].checksum)
		<index> = (<tags>.($invite_instruments [<i>].checksum))
		SetArrayElement ArrayName = enabled index = <index> newvalue = 1
	endif
	<i> = (<i> + 1)
	repeat 4
	printstruct <...>
	return enabled = <enabled>
endscript

script get_required_instruments 
	RequireParams \{[
			required_instruments
		]
		all}
	get_instrument_tags \{check_online = 1}
	enabled = [0 0 0 0]
	i = 0
	begin
	if StructureContains Structure = <tags> ($invite_instruments [<i>].checksum)
		SetArrayElement ArrayName = enabled index = <i> newvalue = 1
	endif
	<i> = (<i> + 1)
	repeat 4
	online_controllers = <enabled>
	<enabled> = [0 0 0 0]
	i = 0
	begin
	if StructureContains Structure = <required_instruments> ($invite_instruments [<i>].checksum)
		if (<online_controllers> [<i>] = 1)
			<index> = (<tags>.($invite_instruments [<i>].checksum))
			SetArrayElement ArrayName = enabled index = <index> newvalue = 1
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	printstruct <...>
	return enabled = <enabled>
endscript

script approve_accept_invite 
	valid = 1
	wii_sign_in_menu :GetTags
	if NOT (<num_selected> >= <min_players> && <num_selected> <= <max_players>)
		printf qs(0xd26fa8ad) d = <num_selected> e = <min_players> f = <max_players>
		valid = 0
	endif
	printstruct <...>
	<got_guitar1> = 0
	i = 0
	begin
	<selected> = (<last_enabled> [<i>])
	if (<selected> = 1)
		get_instrument_tags \{check_online = 0}
		<j> = 0
		<checksum> = 'invalid'
		begin
		if StructureContains Structure = <tags> ($invite_instruments [<j>].checksum)
			<index> = (<tags>.($invite_instruments [<j>].checksum))
			if (<index> = <i>)
				<checksum> = ($invite_instruments [<j>].checksum)
				if (<got_guitar1> = 0)
					if (<checksum> = guitar1)
						<got_guitar1> = 1
					endif
				endif
				break
			endif
		endif
		<j> = (<j> + 1)
		repeat 4
		if ((<checksum> = guitar2) && (<got_guitar1> = 0))
			if StructureContains Structure = <required_instruments> guitar1
				printf qs(0xbadabd43) d = <checksum>
			else
				printf qs(0xa16025c2) d = <checksum>
				<valid> = 0
			endif
		else
			if StructureContains Structure = <required_instruments> <checksum>
				printf qs(0xbadabd43) d = <checksum>
			else
				printf qs(0xa16025c2) d = <checksum>
				<valid> = 0
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	if (<valid> = 1)
		<i> = 0
		begin
		<selected> = (<last_enabled> [<i>])
		<index> = <i>
		get_player_num_from_controller controller_index = <index>
		if (<selected> = 1)
			printf \{qs(0x8ed8526f)}
			switch <detail_game_mode>
				case p2_pro_faceoff_bass
				case p2_faceoff_bass
				printf \{qs(0x78866abc)}
				SetPlayerInfo <player_num> part = Bass
				case p2_pro_faceoff
				case p2_faceoff
				case p2_battle
				printf \{qs(0xa11e8c63)}
				SetPlayerInfo <player_num> part = guitar
			endswitch
		endif
		<i> = (<i> + 1)
		repeat 4
	endif
	<old_signed_in> = [0 0 0 0]
	<i> = 0
	begin
	is_controller_online controller_index = <i>
	if (<online> = 1)
		SetArrayElement ArrayName = old_signed_in index = <i> newvalue = 1
	endif
	<i> = (<i> + 1)
	repeat 4
	printf qs(0x1fd8b2fe) d = <num_selected>
	i = 0
	begin
	<selected> = (<last_enabled> [<i>])
	<index> = <i>
	if (<selected> = 1)
		printf qs(0x5dcc676a) s = <i>
		NetSessionFunc func = AddControllers params = {controller = <index>}
	else
		if NOT (<index> = -1)
			printf qs(0x42ebb00d) d = <index>
			NetSessionFunc func = RemoveController params = {controller = <index>}
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	if NOT is_valid_instrument_config game_mode = <detail_game_mode>
		<valid> = 0
	endif
	if (<valid> = 0)
		printstruct <...>
		<i> = 0
		begin
		<selected> = (<old_signed_in> [<i>])
		if (<selected> = 1)
			NetSessionFunc func = AddControllers params = {controller = <i>}
		else
			NetSessionFunc func = RemoveController params = {controller = <i>}
		endif
		<i> = (<i> + 1)
		repeat 4
		create_intrument_config_warning \{helper_controls_script = create_wii_invite_players_helpers}
		return
	endif
	NetOptions :Pref_Size \{name = game_modes}
	i = 0
	begin
	NetOptions :Pref_GetStruct name = game_modes index = <i>
	if (<detail_game_mode> = <pref_struct>.search_chk)
		NetOptions :Pref_Choose name = game_modes index = <i>
		break
	endif
	i = (<i> + 1)
	repeat <size>
	SpawnScript accept_invite params = {enabled_controllers = <last_enabled>
		detail_game_mode = <detail_game_mode>}
endscript
