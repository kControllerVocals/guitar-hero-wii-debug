
script ui_create_wii_sign_in 
	CreateScreenElement \{parent = root_window
		id = wii_sign_in_menu
		type = DescInterface
		desc = 'wifi_signin'
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
	wii_sign_in_get_online_controllers
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
	last_controller_types = [none none none none]
	active_controllers = [0 0 0 0]
	last_part = [0 0 0 0]
	sign_in_funcs = [wii_sign_in_none_signin wii_sign_in_none_signin wii_sign_in_none_signin wii_sign_in_none_signin]
	wii_sign_in_setup_initial <...>
	printf \{qs(0xfe4d8814)}
	wii_sign_in_menu :SE_SetProps \{event_handlers = [
			{
				pad_start
				wii_sign_in_commit
			}
			{
				pad_choose
				wii_sign_in_player_choose
			}
			{
				pad_back
				restore_previous_player_bindings_and_leave
			}
			{
				pad_l1
				wii_sign_in_toggle_part
			}
		]}
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
		original_controllers = <original_controllers>
		vocalist_assigned = -1
		sign_in_funcs = <sign_in_funcs>
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
	add_user_control_helper \{text = $wii_sign_in_out
		button = green
		z = 100000}
	add_user_control_helper \{text = qs("GUITAR/BASS")
		button = Orange
		z = 100000
		use_guitar_button = 1}
	add_user_control_helper \{text = qs("DONE")
		button = start
		z = 100000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100000}
	SpawnScriptLater \{wii_sign_in_poll_controllers}
endscript

script restore_previous_player_bindings_and_leave 
	wii_sign_in_menu :GetSingleTag \{original_controllers}
	SetPlayerInfo 1 controller = (<original_controllers> [0])
	SetPlayerInfo 2 controller = (<original_controllers> [1])
	SetPlayerInfo 3 controller = (<original_controllers> [2])
	SetPlayerInfo 4 controller = (<original_controllers> [3])
	generic_event_back
endscript

script wii_sign_in_get_online_controllers 
	enabled = [0 0 0 0]
	i = 0
	begin
	is_controller_online controller_index = <i>
	if (<online> = 1)
		SetArrayElement ArrayName = enabled index = <i> newvalue = 1
	endif
	<i> = (<i> + 1)
	repeat 4
	return enabled = <enabled>
endscript

script ui_destroy_wii_sign_in 
	clean_up_user_control_helpers
	if ScreenElementExists \{id = wii_sign_in_menu}
		DestroyScreenElement \{id = wii_sign_in_menu}
	endif
	KillSpawnedScript \{name = wii_sign_in_poll_controllers}
endscript

script wii_sign_in_setup_initial 
endscript

script wii_sign_in_player_choose 
	RequireParams \{[
			device_num
		]
		all}
	printf \{qs(0x360e0a28)}
	wii_sign_in_menu :GetSingleTag \{last_enabled}
	wii_sign_in_menu :GetSingleTag \{sign_in_funcs}
	if (<last_enabled> [<device_num>] = 0)
		wii_sign_in_update_player_menu index = <device_num> changetype = choose signin_func = (<sign_in_funcs> [<device_num>]) sign_in = 1
	else
		wii_sign_in_update_player_menu index = <device_num> changetype = choose signin_func = (<sign_in_funcs> [<device_num>]) sign_in = 0
	endif
endscript

script wii_sign_in_commit 
	wii_sign_in_menu :GetTags
	i = 0
	begin
	if (<last_enabled> [<i>] = 1)
		printf qs(0xcf2c273d) s = (<last_controller_types> [<i>])
		NetSessionFunc func = AddControllers params = {controller = <i>}
		if (<last_controller_types> [<i>] = guitar)
			if (<last_part> [<i>] = 0)
				SetPlayerInfo (<i> + 1) part = guitar
			else
				SetPlayerInfo (<i> + 1) part = Bass
			endif
		endif
	else
		printf qs(0x42ebb00d) d = <i>
		NetSessionFunc func = RemoveController params = {controller = <i>}
	endif
	<i> = (<i> + 1)
	repeat 4
	generic_event_back \{data = {
			state = uistate_online
		}}
endscript

script wii_sign_in_update_player_menu 
	RequireParams \{[
			index
			changetype
			signin_func
		]
		all}
	printf \{qs(0x9a4b5fe4)}
	printscriptinfo \{qs(0xb958b465)}
	player = (<index> + 1)
	if (<changetype> = Connect)
		if (<connected> = 1)
			printf \{qs("\Lsigned in")}
			wii_sign_in_clear_instrument player = <player>
			<signin_func> player = <player> SignedIn = 0
		else
			printf \{qs(0x12e861f2)}
			wii_sign_in_clear_instrument player = <player>
			wii_sign_in_disconnect player = <player>
		endif
	elseif (<changetype> = controller)
		printf \{qs(0x5b89e490)}
		wii_sign_in_clear_instrument player = <player>
		<signin_func> player = <player> SignedIn = 0
	elseif (<changetype> = choose)
		if (<signin_func> = wii_sign_in_none_signin)
			printf \{qs(0x32d23ca4)}
			return
		endif
		printf \{qs(0xe601ecd7)}
		wii_sign_in_menu :GetSingleTag \{last_enabled}
		printstruct <...>
		if (<sign_in> = 1)
			printf qs(0x26fdb752) d = <index>
			SetArrayElement ArrayName = last_enabled index = <index> newvalue = 1
			<signin_func> player = <player> SignedIn = 1
		else
			printf qs(0x96914609) d = <index>
			SetArrayElement ArrayName = last_enabled index = <index> newvalue = 0
			<signin_func> player = <player> SignedIn = 0
		endif
		wii_sign_in_menu :SetTags last_enabled = <last_enabled>
	endif
endscript

script wii_sign_in_poll_controllers 
	begin
	wii_sign_in_refresh_controllers
	Wait \{1
		gameframes}
	repeat
endscript

script wii_sign_in_refresh_controllers 
	GetActiveControllers
	wii_sign_in_menu :GetSingleTag \{last_active_controllers}
	wii_sign_in_menu :GetSingleTag \{last_controller_types}
	wii_sign_in_menu :GetSingleTag \{sign_in_funcs}
	wii_sign_in_menu :GetSingleTag \{last_part}
	i = 0
	should_change = 0
	begin
	if NOT (<active_controllers> [<i>] = <last_active_controllers> [<i>])
		if (<active_controllers> [<i>] = 0)
			SetArrayElement ArrayName = last_controller_types index = <i> newvalue = none
			<controller_type> = none
			wii_sign_in_update_player_menu index = <i> changetype = choose signin_func = (<sign_in_funcs> [<i>]) sign_in = 0
			SetArrayElement ArrayName = sign_in_funcs index = <i> newvalue = wii_sign_in_none_signin
		else
			wii_sign_in_get_controller_type controller_index = <i>
			SetArrayElement ArrayName = last_controller_types index = <i> newvalue = <controller_type>
			wii_sign_in_get_signin_func instrument = <controller_type> part = (<last_part> [<i>])
			SetArrayElement ArrayName = sign_in_funcs index = <i> newvalue = <signin_func>
			if (<controller_type> = controller)
				printf qs(0x2e6fede3) d = <i>
				wii_sign_in_menu :GetSingleTag \{last_enabled}
				wii_sign_in_set_mic_text player = (<i> + 1)
				SetArrayElement ArrayName = last_enabled index = <i> newvalue = 0
				wii_sign_in_menu :SetTags last_enabled = <last_enabled>
			endif
		endif
		wii_sign_in_update_player_menu index = <i> changetype = Connect connected = (<active_controllers> [<i>]) signin_func = (<sign_in_funcs> [<i>])
	endif
	if (<active_controllers> [<i>] = 1)
		wii_sign_in_get_controller_type controller_index = <i>
		if NOT (<last_controller_types> [<i>] = <controller_type>)
			SetArrayElement ArrayName = last_controller_types index = <i> newvalue = <controller_type>
			wii_sign_in_get_signin_func instrument = <controller_type> part = (<last_part> [<i>])
			SetArrayElement ArrayName = sign_in_funcs index = <i> newvalue = <signin_func>
			wii_sign_in_update_player_menu index = <i> changetype = controller data = <controller_type> signin_func = <signin_func>
			if (<controller_type> = controller)
				printf qs(0x2e6fede3) d = <i>
				wii_sign_in_menu :GetSingleTag \{last_enabled}
				wii_sign_in_set_mic_text player = (<i> + 1)
				SetArrayElement ArrayName = last_enabled index = <i> newvalue = 0
				wii_sign_in_menu :SetTags last_enabled = <last_enabled>
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	wii_sign_in_menu :SetTags last_active_controllers = <active_controllers>
	wii_sign_in_menu :SetTags last_controller_types = <last_controller_types>
	wii_sign_in_menu :SetTags sign_in_funcs = <sign_in_funcs>
endscript

script wii_sign_in_drum_signin \{player = 1
		SignedIn = 0}
	WiiSignInGetPlayerParams player = <player>
	if (<SignedIn> = 1)
		instr_avail = 0
	else
		if wii_sign_in_is_inst_avail instrument = drum controller = (<player> -1)
			instr_avail = 1
		else
			instr_avail = 0
		endif
	endif
	FormatText checksumname = player_off_alpha 'Player%dDrumOff_alpha' d = <player>
	FormatText checksumname = player_on_alpha 'Player%dDrum_alpha' d = <player>
	prop_struct = {}
	SetStructureParam struct_name = prop_struct param = <player_off_alpha> value = 1
	SetStructureParam struct_name = prop_struct param = <player_on_alpha> value = 1
	wii_sign_in_menu :SE_SetProps {
		Player1DrumAvailable_alpha = <instr_avail>
		Player2DrumAvailable_alpha = <instr_avail>
		Player3DrumAvailable_alpha = <instr_avail>
		Player4DrumAvailable_alpha = <instr_avail>
		<prop_struct>
	}
	prop_struct = {}
	if (<SignedIn> = 1)
		SetStructureParam struct_name = prop_struct param = <player_off_alpha> value = 0
		wii_sign_in_menu :SE_SetProps {
			<prop_struct>
		}
	else
		SetStructureParam struct_name = prop_struct param = <player_on_alpha> value = 0
		wii_sign_in_menu :SE_SetProps {
			<prop_struct>
		}
	endif
	wii_sign_in_player_signin player = <player> SignedIn = <SignedIn> instrument = Drums
endscript

script wii_sign_in_vocal_signin \{player = 1
		SignedIn = 0}
	printf \{qs(0xe3fac52e)}
	WiiSignInGetPlayerParams player = <player>
	if (<SignedIn> = 1)
		instr_avail = 0
		wii_sign_in_menu :SetTags vocalist_assigned = (<player> -1)
	else
		wii_sign_in_menu :SetTags \{vocalist_assigned = -1}
		if wii_sign_in_is_inst_avail instrument = Vocals controller = (<player> -1)
			instr_avail = 1
		else
			instr_avail = 0
		endif
	endif
	FormatText checksumname = player_off_alpha 'Player%dVocalOff_alpha' d = <player>
	FormatText checksumname = player_on_alpha 'Player%dVocal_alpha' d = <player>
	prop_struct = {}
	SetStructureParam struct_name = prop_struct param = <player_off_alpha> value = 1
	SetStructureParam struct_name = prop_struct param = <player_on_alpha> value = 1
	wii_sign_in_menu :SE_SetProps {
		Player1VocalAvailable_alpha = <instr_avail>
		Player2VocalAvailable_alpha = <instr_avail>
		Player3VocalAvailable_alpha = <instr_avail>
		Player4VocalAvailable_alpha = <instr_avail>
		<prop_struct>
	}
	prop_struct = {}
	if (<SignedIn> = 1)
		SetStructureParam struct_name = prop_struct param = <player_off_alpha> value = 0
		wii_sign_in_menu :SE_SetProps {
			<prop_struct>
		}
	else
		SetStructureParam struct_name = prop_struct param = <player_on_alpha> value = 0
		wii_sign_in_menu :SE_SetProps {
			<prop_struct>
		}
	endif
	wii_sign_in_player_signin player = <player> SignedIn = <SignedIn> instrument = controller
endscript

script wii_sign_in_bass_signin \{player = 1
		SignedIn = 0}
	printf \{qs(0x7ef4ec1d)}
	WiiSignInGetPlayerParams player = <player>
	if (<SignedIn> = 1)
		instr_avail = 0
	else
		if wii_sign_in_is_inst_avail instrument = guitar part = 1 controller = (<player> -1)
			instr_avail = 1
		else
			instr_avail = 0
		endif
	endif
	FormatText checksumname = player_off_alpha 'Player%dBassOff_alpha' d = <player>
	FormatText checksumname = player_on_alpha 'Player%dBass_alpha' d = <player>
	prop_struct = {}
	SetStructureParam struct_name = prop_struct param = <player_off_alpha> value = 1
	SetStructureParam struct_name = prop_struct param = <player_on_alpha> value = 1
	wii_sign_in_menu :SE_SetProps {
		Player1BassAvailable_alpha = <instr_avail>
		Player2BassAvailable_alpha = <instr_avail>
		Player3BassAvailable_alpha = <instr_avail>
		Player4BassAvailable_alpha = <instr_avail>
		<prop_struct>
	}
	prop_struct = {}
	if (<SignedIn> = 1)
		SetStructureParam struct_name = prop_struct param = <player_off_alpha> value = 0
		wii_sign_in_menu :SE_SetProps {
			<prop_struct>
		}
	else
		SetStructureParam struct_name = prop_struct param = <player_on_alpha> value = 0
		wii_sign_in_menu :SE_SetProps {
			<prop_struct>
		}
	endif
	wii_sign_in_player_signin player = <player> SignedIn = <SignedIn> instrument = guitar
endscript

script wii_sign_in_guitar_signin \{player = 1
		SignedIn = 0}
	printf \{qs(0x130e4527)}
	WiiSignInGetPlayerParams player = <player>
	if (<SignedIn> = 1)
		instr_avail = 0
	else
		if wii_sign_in_is_inst_avail instrument = guitar part = 0 controller = (<player> -1)
			instr_avail = 1
		else
			instr_avail = 0
		endif
	endif
	FormatText checksumname = player_off_alpha 'Player%dGuitarOff_alpha' d = <player>
	FormatText checksumname = player_on_alpha 'Player%dGuitar_alpha' d = <player>
	prop_struct = {}
	SetStructureParam struct_name = prop_struct param = <player_off_alpha> value = 1
	SetStructureParam struct_name = prop_struct param = <player_on_alpha> value = 1
	wii_sign_in_menu :SE_SetProps {
		Player1GuitarAvailable_alpha = <instr_avail>
		Player2GuitarAvailable_alpha = <instr_avail>
		Player3GuitarAvailable_alpha = <instr_avail>
		Player4GuitarAvailable_alpha = <instr_avail>
		<prop_struct>
	}
	prop_struct = {}
	if (<SignedIn> = 1)
		SetStructureParam struct_name = prop_struct param = <player_off_alpha> value = 0
		wii_sign_in_menu :SE_SetProps {
			<prop_struct>
		}
	else
		SetStructureParam struct_name = prop_struct param = <player_on_alpha> value = 0
		wii_sign_in_menu :SE_SetProps {
			<prop_struct>
		}
	endif
	wii_sign_in_player_signin player = <player> SignedIn = <SignedIn> instrument = guitar
endscript

script wii_sign_in_is_inst_avail 
	RequireParams \{[
			instrument
			part
			controller
		]}
	wii_sign_in_menu :GetSingleTag \{last_enabled}
	wii_sign_in_menu :GetSingleTag \{last_controller_types}
	wii_sign_in_menu :GetSingleTag \{last_part}
	i = 0
	begin
	if NOT (<i> = <controller>)
		if (<instrument> = <last_controller_types> [<i>])
			if (<last_enabled> [<i>] = 1)
				if (<instrument> = guitar)
					if (<part> = <last_part> [<i>])
						return \{false}
					endif
				else
					return \{false}
				endif
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat 4
	return \{true}
endscript

script wii_sign_in_clear_instrument \{player = 1}
	printf qs(0x00f2b610) d = <player>
	if (<player> = 1)
		wii_sign_in_menu :SE_SetProps \{Player1Drum_alpha = 0
			Player1Vocal_alpha = 0
			Player1Bass_alpha = 0
			Player1Guitar_alpha = 0
			Player1DrumOff_alpha = 0
			Player1VocalOff_alpha = 0
			Player1BassOff_alpha = 0
			Player1GuitarOff_alpha = 0}
	elseif (<player> = 2)
		wii_sign_in_menu :SE_SetProps \{Player2Drum_alpha = 0
			Player2Vocal_alpha = 0
			Player2Bass_alpha = 0
			Player2Guitar_alpha = 0
			Player2DrumOff_alpha = 0
			Player2VocalOff_alpha = 0
			Player2BassOff_alpha = 0
			Player2GuitarOff_alpha = 0}
	elseif (<player> = 3)
		wii_sign_in_menu :SE_SetProps \{Player3Drum_alpha = 0
			Player3Vocal_alpha = 0
			Player3Bass_alpha = 0
			Player3Guitar_alpha = 0
			Player3DrumOff_alpha = 0
			Player3VocalOff_alpha = 0
			Player3BassOff_alpha = 0
			Player3GuitarOff_alpha = 0}
	elseif (<player> = 4)
		wii_sign_in_menu :SE_SetProps \{Player4Drum_alpha = 0
			Player4Vocal_alpha = 0
			Player4Bass_alpha = 0
			Player4Guitar_alpha = 0
			Player4DrumOff_alpha = 0
			Player4VocalOff_alpha = 0
			Player4BassOff_alpha = 0
			Player4GuitarOff_alpha = 0}
	endif
endscript

script wii_sign_in_reset_text \{player = 1}
	printf \{qs(0x26480ebc)}
	if (<player> = 1)
		wii_sign_in_menu :SE_SetProps \{Player1Connect_text = $wii_invite_players_connect_text
			Player1SignIn_text = qs("")}
	elseif (<player> = 2)
		wii_sign_in_menu :SE_SetProps \{Player2Connect_text = $wii_invite_players_connect_text
			Player2SignIn_text = qs("")}
	elseif (<player> = 3)
		wii_sign_in_menu :SE_SetProps \{Player3Connect_text = $wii_invite_players_connect_text
			Player3SignIn_text = qs("")}
	elseif (<player> = 4)
		wii_sign_in_menu :SE_SetProps \{Player4Connect_text = $wii_invite_players_connect_text
			Player4SignIn_text = qs("")}
	endif
endscript

script wii_sign_in_set_mic_text \{player = 1}
	printf \{qs(0x26480ebc)}
	if (<player> = 1)
		wii_sign_in_menu :SE_SetProps \{Player1Connect_text = $wii_online_mic_sign_in
			Player1SignIn_text = qs("")}
	elseif (<player> = 2)
		wii_sign_in_menu :SE_SetProps \{Player2Connect_text = $wii_online_mic_sign_in
			Player2SignIn_text = qs("")}
	elseif (<player> = 3)
		wii_sign_in_menu :SE_SetProps \{Player3Connect_text = $wii_online_mic_sign_in
			Player3SignIn_text = qs("")}
	elseif (<player> = 4)
		wii_sign_in_menu :SE_SetProps \{Player4Connect_text = $wii_online_mic_sign_in
			Player4SignIn_text = qs("")}
	endif
endscript

script wii_sign_in_disconnect \{player = 1}
	printf \{qs(0x364e5779)}
	wii_sign_in_clear_instrument player = <player>
	wii_sign_in_reset_text player = <player>
endscript

script wii_sign_in_toggle_part 
	wii_sign_in_menu :GetTags
	if NOT (<last_controller_types> [<device_num>] = guitar)
		return
	endif
	resignin = 0
	if (<last_enabled> [<device_num>] = 1)
		<resignin> = 1
		wii_sign_in_player_choose device_num = <device_num>
	endif
	if (<last_part> [<device_num>] = 0)
		SetArrayElement ArrayName = last_part index = <device_num> newvalue = 1
	else
		SetArrayElement ArrayName = last_part index = <device_num> newvalue = 0
	endif
	wii_sign_in_get_signin_func instrument = (<last_controller_types> [<device_num>]) part = (<last_part> [<device_num>])
	SetArrayElement ArrayName = sign_in_funcs index = <device_num> newvalue = <signin_func>
	SetArrayElement ArrayName = last_enabled index = <device_num> newvalue = 0
	wii_sign_in_menu :SetTags {
		last_part = <last_part>
		sign_in_funcs = <sign_in_funcs>
		last_enabled = <last_enabled>
	}
	wii_sign_in_update_player_menu index = <device_num> changetype = controller signin_func = <signin_func>
	if (<resignin> = 1)
		wii_sign_in_player_choose device_num = <device_num>
	endif
endscript

script wii_sign_in_player_signin \{player = 1
		SignedIn = 1
		instrument = guitar}
	printf \{qs(0x4966b476)}
	if (<SignedIn> = 1)
		switch <instrument>
			case guitar
			signin_text = $wii_invite_players_sign_out_guitar
			case Drums
			signin_text = $wii_invite_players_sign_out_drums
			case controller
			signin_text = $wii_invite_players_sign_out_vocals
		endswitch
	else
		switch <instrument>
			case guitar
			signin_text = $wii_invite_players_sign_in_guitar
			case Drums
			signin_text = $wii_invite_players_sign_in_drums
			case controller
			signin_text = $wii_invite_players_sign_in_vocals
		endswitch
	endif
	if (<player> = 1)
		wii_sign_in_menu :SE_SetProps {
			Player1Connect_text = qs("")
			Player1SignIn_text = <signin_text>
		}
	elseif (<player> = 2)
		wii_sign_in_menu :SE_SetProps {
			Player2Connect_text = qs("")
			Player2SignIn_text = <signin_text>
		}
	elseif (<player> = 3)
		wii_sign_in_menu :SE_SetProps {
			Player3Connect_text = qs("")
			Player3SignIn_text = <signin_text>
		}
	elseif (<player> = 4)
		wii_sign_in_menu :SE_SetProps {
			Player4Connect_text = qs("")
			Player4SignIn_text = <signin_text>
		}
	endif
endscript

script WiiSignInGetPlayerParams \{player = 1}
	printf \{qs(0xe5356893)}
	<Player1> = 0
	<Player2> = 0
	<Player3> = 0
	<Player4> = 0
	if (<player> = 1)
		<Player1> = 1
	elseif (<player> = 2)
		<Player2> = 1
	elseif (<player> = 3)
		<Player3> = 1
	elseif (<player> = 4)
		<Player4> = 1
	endif
	return Player1 = <Player1> Player2 = <Player2> Player3 = <Player3> Player4 = <Player4>
endscript

script wii_sign_in_none_signin 
	printf \{qs(0x17324e9a)}
endscript

script wii_sign_in_get_controller_type 
	RequireParams \{[
			controller_index
		]}
	get_controller_type controller_index = <controller_index>
	switch <controller_type>
		case Vocals
		wii_sign_in_menu :GetSingleTag \{vocalist_assigned}
		if NOT (<vocalist_assigned> = -1)
			if NOT (<vocalist_assigned> = <controller_index>)
				<controller_type> = controller
			endif
		endif
	endswitch
	return controller_type = <controller_type>
endscript

script wii_sign_in_get_signin_func 
	printf \{qs(0xedab4605)}
	RequireParams \{[
			instrument
			part
		]
		all}
	func = wii_sign_in_none_signin
	switch <instrument>
		case guitar
		if (<part> = 0)
			<func> = wii_sign_in_guitar_signin
		else
			<func> = wii_sign_in_bass_signin
		endif
		case drum
		<func> = wii_sign_in_drum_signin
		case Vocals
		<func> = wii_sign_in_vocal_signin
	endswitch
	return signin_func = <func>
endscript
