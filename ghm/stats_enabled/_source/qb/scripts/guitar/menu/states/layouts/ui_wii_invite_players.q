invite_instruments = [
	{
		checksum = guitar1
		name = qs(0xd892b015)
	}
	{
		checksum = guitar2
		name = qs(0xf3bfe3d6)
	}
	{
		checksum = drums
		name = qs(0xf3e03f27)
	}
	{
		checksum = vocals
		name = qs(0x9fae80a8)
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
	createscreenelement \{parent = root_window
		id = wii_sign_in_menu
		type = descinterface
		desc = 'wifi_signin'
		scale = (0.85, 1.0)
		pos = (20.0, -30.0)
		player1_text = qs(0x7c104666)
		player2_text = qs(0x573d15a5)
		player3_text = qs(0x4e2624e4)
		player4_text = qs(0x0167b223)
		player1connect_text = qs(0x258c601a)
		player2connect_text = qs(0x258c601a)
		player3connect_text = qs(0x258c601a)
		player4connect_text = qs(0x258c601a)
		player1signin_text = qs(0x00000000)
		player2signin_text = qs(0x00000000)
		player3signin_text = qs(0x00000000)
		player4signin_text = qs(0x00000000)}
	createscreenelement \{parent = root_window
		id = sidebar
		type = descinterface
		desc = 'invite_side_panel'
		pos = (420.0, -4.0)}
	<invite_props> = {}
	if (<min_players> = <max_players>)
		formattext textname = players qs(0x48c6d14c) d = <max_players>
	else
		formattext textname = players qs(0xd5f4275a) d = <min_players> e = <max_players>
	endif
	<invite_props> = {
		<invite_props>
		players_text = <players>
	}
	if structurecontains \{structure = required_instruments
			guitar1}
		<invite_props> = {
			<invite_props>
			guitar_alpha = 1
		}
	else
		<invite_props> = {
			<invite_props>
			guitar_alpha = 0.2
		}
	endif
	if structurecontains \{structure = required_instruments
			guitar2}
		<invite_props> = {
			<invite_props>
			bass_alpha = 1
		}
	else
		<invite_props> = {
			<invite_props>
			bass_alpha = 0.2
		}
	endif
	if structurecontains \{structure = required_instruments
			vocals}
		<invite_props> = {
			<invite_props>
			vocal_alpha = 1
		}
	else
		<invite_props> = {
			<invite_props>
			vocal_alpha = 0.2
		}
	endif
	if structurecontains \{structure = required_instruments
			drums}
		<invite_props> = {
			<invite_props>
			drum_alpha = 1
		}
	else
		<invite_props> = {
			<invite_props>
			drum_alpha = 0.2
		}
	endif
	sidebar :se_setprops <invite_props>
	assignalias \{id = wii_sign_in_menu
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
		if (<controller_type> = vocals)
			<num_vocalists> = (<num_vocalists> + 1)
			setarrayelement arrayname = vocalists index = <i> newvalue = 1
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	if (<num_vocalists> > 1)
		<i> = 0
		begin
		if (<vocalists> [<i>] = 1)
			printf qs(0x6867ff53) d = <i>
			setarrayelement arrayname = enabled index = <i> newvalue = 0
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
	wii_sign_in_menu :se_setprops {
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
	getplayerinfo (<i> + 1) controller
	setarrayelement arrayname = original_controllers index = <i> newvalue = <controller>
	<i> = (<i> + 1)
	repeat 4
	setplayerinfo \{1
		controller = 0}
	setplayerinfo \{2
		controller = 1}
	setplayerinfo \{3
		controller = 2}
	setplayerinfo \{4
		controller = 3}
	wii_sign_in_menu :settags {
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
	launchevent \{target = wii_sign_in_menu
		type = focus}
	create_wii_invite_players_helpers
	spawnscriptlater \{wii_sign_in_poll_controllers}
	spawnscriptlater \{wii_invite_players_poll_invite}
endscript

script ui_destroy_wii_invite_players 
	clean_up_user_control_helpers
	if screenelementexists \{id = wii_sign_in_menu}
		destroyscreenelement \{id = wii_sign_in_menu}
	endif
	if screenelementexists \{id = sidebar}
		destroyscreenelement \{id = sidebar}
	endif
	killspawnedscript \{name = wii_sign_in_poll_controllers}
	killspawnedscript \{name = wii_invite_players_poll_invite}
endscript

script wii_invite_players_poll_invite 
	getfriendinfo index = ($friendlist_selection_index)
	friend_index = <resolvedindex>
	begin
	if NOT check_invite index = <friend_index>
		spawnscriptnow \{controller_sign_in_invite_invalid}
		return
	endif
	ui_event_get_top
	if NOT (<base_name> = 'wii_invite_players')
		return
	endif
	wait \{10
		gameframes}
	repeat
endscript

script controller_sign_in_invite_invalid 
	ui_event_get_top
	if NOT (<base_name> = 'wii_invite_players')
		return
	endif
	create_generic_popup \{title = qs(0x79597197)
		ok_menu
		message = qs(0xb7077d5e)
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
		back_script = 0x6ec28ba2}
endscript

script 0x6ec28ba2 
	restore_previous_player_bindings_and_leave
	block_refresh_and_destroy
endscript

script create_wii_invite_players_helpers 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs(0x6e1a97ed)
		button = green
		z = 100000}
	add_user_control_helper \{text = qs(0x0d215c11)
		button = orange
		z = 100000
		use_guitar_button = 1}
	add_user_control_helper \{text = qs(0xb73cb78f)
		button = start
		z = 100000}
	add_user_control_helper \{text = qs(0xf7723015)
		button = red
		z = 100000}
endscript

script wii_invite_players_choose 
	wii_sign_in_player_choose device_num = <device_num>
	wii_sign_in_menu :getsingletag \{last_enabled}
	num_selected = 0
	i = 0
	begin
	if (<last_enabled> [<i>] = 1)
		<num_selected> = (<num_selected> + 1)
	endif
	<i> = (<i> + 1)
	repeat 4
	wii_sign_in_menu :settags num_selected = <num_selected>
endscript

script get_online_controllers 
	get_instrument_tags \{check_online = 1}
	enabled = [0 0 0 0]
	i = 0
	begin
	if structurecontains structure = <tags> ($invite_instruments [<i>].checksum)
		<index> = (<tags>.($invite_instruments [<i>].checksum))
		setarrayelement arrayname = enabled index = <index> newvalue = 1
	endif
	<i> = (<i> + 1)
	repeat 4
	printstruct <...>
	return enabled = <enabled>
endscript

script get_required_instruments 
	requireparams \{[
			required_instruments
		]
		all}
	get_instrument_tags \{check_online = 1}
	enabled = [0 0 0 0]
	i = 0
	begin
	if structurecontains structure = <tags> ($invite_instruments [<i>].checksum)
		setarrayelement arrayname = enabled index = <i> newvalue = 1
	endif
	<i> = (<i> + 1)
	repeat 4
	online_controllers = <enabled>
	<enabled> = [0 0 0 0]
	i = 0
	begin
	if structurecontains structure = <required_instruments> ($invite_instruments [<i>].checksum)
		if (<online_controllers> [<i>] = 1)
			<index> = (<tags>.($invite_instruments [<i>].checksum))
			setarrayelement arrayname = enabled index = <index> newvalue = 1
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	printstruct <...>
	return enabled = <enabled>
endscript

script approve_accept_invite 
	0x79db87d7
	spawnscriptnow 0xdb0fdbe4 params = {<...>}
endscript

script 0xdb0fdbe4 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	valid = 1
	wii_sign_in_menu :gettags
	if NOT (<num_selected> >= <min_players> && <num_selected> <= <max_players>)
		printf qs(0xd26fa8ad) d = <num_selected> e = <min_players> f = <max_players>
		valid = 0
	endif
	0x44ee3579
	printstruct <...>
	i = 0
	begin
	<selected> = (<last_enabled> [<i>])
	if (<selected> = 1)
		if (<last_controller_types> [<i>] = guitar)
			if (<last_part> [<i>] = 0)
				printf qs(0x26a3cf9e) d = (<i> + 1)
				setplayerinfo (<i> + 1) part = guitar
			else
				printf qs(0x7feb4955) d = (<i> + 1)
				setplayerinfo (<i> + 1) part = bass
			endif
		elseif (<last_controller_types> [<i>] = drum)
			printf qs(0xcdec50e4) d = (<i> + 1)
			setplayerinfo (<i> + 1) part = drum
		elseif (<last_controller_types> [<i>] = vocals)
			printf qs(0xa8381950) d = (<i> + 1)
			setplayerinfo (<i> + 1) part = vocals
		endif
		get_instrument_tags \{check_online = 0}
		<j> = 0
		<checksum> = 'invalid'
		begin
		if structurecontains structure = <tags> ($invite_instruments [<j>].checksum)
			<index> = (<tags>.($invite_instruments [<j>].checksum))
			if (<index> = <i>)
				<checksum> = ($invite_instruments [<j>].checksum)
				break
			endif
		endif
		<j> = (<j> + 1)
		repeat 4
		if structurecontains structure = <required_instruments> <checksum>
			printf qs(0xbadabd43) d = <checksum>
		else
			if ((<checksum> = guitar1) && (structurecontains structure = <required_instruments> guitar2))
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
				setplayerinfo <player_num> part = bass
				case p2_pro_faceoff
				case p2_faceoff
				case p2_battle
				printf \{qs(0xa11e8c63)}
				setplayerinfo <player_num> part = guitar
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
		setarrayelement arrayname = old_signed_in index = <i> newvalue = 1
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
		netsessionfunc func = addcontrollers params = {controller = <index>}
	else
		if NOT (<index> = -1)
			printf qs(0x42ebb00d) d = <index>
			netsessionfunc func = removecontroller params = {controller = <index>}
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
			netsessionfunc func = addcontrollers params = {controller = <i>}
		else
			netsessionfunc func = removecontroller params = {controller = <i>}
		endif
		<i> = (<i> + 1)
		repeat 4
		0xf00f29a9
		create_intrument_config_warning \{helper_controls_script = create_wii_invite_players_helpers}
		return
	endif
	netoptions :pref_size \{name = game_modes}
	i = 0
	begin
	netoptions :pref_getstruct name = game_modes index = <i>
	if (<detail_game_mode> = <pref_struct>.search_chk)
		netoptions :pref_choose name = game_modes index = <i>
		break
	endif
	i = (<i> + 1)
	repeat <size>
	accept_invite {
		enabled_controllers = <last_enabled>
		detail_game_mode = <detail_game_mode>
	}
	0xf00f29a9
endscript

script 0xbfe5c085 
	wait \{1
		gameframes}
	begin
	if NOT isdwcinpotentiallyblockingcall
		break
	endif
	wait \{0.005
		seconds}
	repeat
	cancel_start_matchmaking \{0xd57d1d8c = 1}
	wait \{1
		seconds}
	spawn_invite index = <index>
endscript
