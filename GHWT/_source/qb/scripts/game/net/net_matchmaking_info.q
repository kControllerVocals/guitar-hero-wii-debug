net_matchmaking_container_pos = (300.0, 100.0)
net_matchmaking_text_font = fontgrid_text_a8
net_matchmaking_text_color = [
	200
	200
	200
	255
]
net_matchmaking_text_scale = (0.7, 0.7)
net_matchmaking_sub_text_scale = (0.5, 0.5)
net_matchmaking_sub_squeeze_text_scale = (0.4, 0.5)
net_matchmaking_just = [
	left
	top
]

script net_create_matchmaking_status_window 
	printf \{qs("\L--- create_matchmaking_status_window")}
	if ScreenElementExists \{id = net_matchmaking_info}
		DestroyScreenElement \{id = net_matchmaking_info}
	endif
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = net_matchmaking_info
		pos = $net_matchmaking_container_pos
		just = [
			left
			top
		]}
	<cont_id> = <id>
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		texture = white
		dims = (1280.0, 720.0)
		just = [left top]
		rgba = [0 0 0 180]
		pos = (-100.0, -100.0)
		z_priority = 9
	}
	net_create_matchmaking_match_headers cont_id = <cont_id>
	net_create_matchmaking_session_menu {
		parent_id = <cont_id>
		cont_id = net_matchmaking_host_session
		vmenu_id = net_matchmaking_host_session_vmenu
		pos = (0.0, 90.0)
		title = qs("Host Session")
	}
	net_create_matchmaking_session_menu {
		parent_id = <cont_id>
		cont_id = net_matchmaking_join_session
		vmenu_id = net_matchmaking_join_session_vmenu
		pos = (0.0, 330.0)
		title = qs("Join Session")
	}
	RunScriptOnScreenElement {
		id = <cont_id>
		params = {obj_id = <cont_id>}
		net_matchmaking_status_window_update_spawned
	}
endscript
mMatchingWindowId = 0

script net_matchmaking_status_window_update_spawned 
	printf \{qs("\L--- net_matchmaking_status_window_update_spawned")}
	RequireParams \{[
			obj_id
		]
		all}
	change mMatchingWindowId = <obj_id>
	Wait \{0.1
		seconds}
	begin
	if NOT NetSessionFunc \{obj = session
			func = is_matchmaking_active}
		printf \{qs("\LScript detected matchmaking finished!")}
		break
	endif
	NetSessionFunc \{obj = session
		func = get_matchmaking_status}
	net_matchmaking_status_window_update <...>
	Wait \{0.1
		seconds}
	repeat
	Wait \{10
		seconds}
	if ScreenElementExists id = <obj_id>
		DestroyScreenElement id = <obj_id>
	endif
endscript

script net_matchmaking_status_window_reboot 
	cancel_join_server
	quit_network_game
	get_custom_match_search_params
	set_network_preferences
	DWCJoinGame <...> join_friends = 0
endscript

script net_matchmaking_status_window_update 
	RequireParams \{[
			mode
			state
		]
		all}
	if NOT GotParam \{num_reserved_spots}
		num_reserved_spots = -1
	endif
	net_integer_to_string int = <num_reserved_spots>
	SetScreenElementProps {
		id = net_matchmaking_reserved_spots_text
		text = <display_string>
	}
	if NOT GotParam \{num_session_spots}
		num_session_spots = -1
	endif
	net_integer_to_string int = <num_session_spots>
	SetScreenElementProps {
		id = net_matchmaking_max_spots_text
		text = <display_string>
	}
	net_get_matchmaking_mode_string mode = <mode>
	SetScreenElementProps {
		id = net_matchmaking_mode_text
		text = <display_string>
	}
	net_get_matchmaking_state_string state = <state>
	SetScreenElementProps {
		id = net_matchmaking_state_text
		text = <display_string>
	}
	net_integer_to_string int = <hosting_time_left>
	SetScreenElementProps {
		id = net_matchmaking_host_time_text
		text = <display_string>
	}
	if GotParam \{host_session}
		GetArraySize \{host_session}
		if (<array_size> > 0)
			<i> = 0
			begin
			net_create_matchmaking_reservation_menu {
				(<host_session> [<i>])
				parent_id = net_matchmaking_host_session_vmenu
			}
			repeat <array_size>
		endif
	endif
	if GotParam \{join_session}
		GetArraySize \{join_session}
		if (<array_size> > 0)
			<i> = 0
			begin
			net_create_matchmaking_reservation_menu {
				(<join_session> [<i>])
				parent_id = net_matchmaking_join_session_vmenu
			}
			repeat <array_size>
		endif
	endif
endscript

script net_create_matchmaking_reservation_menu 
	RequireParams \{[
			parent_id
			id
		]
		all}
	DestroyScreenElement id = <parent_id> preserve_parent
	<res_id> = <id>
	<text_color> = $net_matchmaking_text_color
	<text_scale> = $net_matchmaking_sub_text_scale
	<default_just> = $net_matchmaking_just
	<z_priority> = 10
	CreateScreenElement {
		type = ContainerElement
		parent = <parent_id>
		pos = <pos>
		just = [left top]
	}
	<cont_id> = <id>
	if NOT GotParam \{res_id}
		res_id = -1
	endif
	FormatText TextName = display_string qs("Id: %d Tk: %t") d = <res_id> t = <ticket>
	CreateScreenElement {
		type = TextElement
		local_id = id_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <display_string>
		scale = <text_scale>
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	get_stacked_element_pos id = <id>
	net_get_reservation_mode_string mode = <mode>
	CreateScreenElement {
		type = TextElement
		local_id = id_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <display_string>
		scale = <text_scale>
		just = [left top]
		pos = <stacked_pos>
		z_priority = <z_priority>
		rgba = <text_color>
	}
	get_stacked_element_pos id = <id>
	net_get_reservation_state_string state = <state>
	CreateScreenElement {
		type = TextElement
		local_id = id_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <display_string>
		scale = <text_scale>
		just = [left top]
		pos = <stacked_pos>
		z_priority = <z_priority>
		rgba = <text_color>
	}
	get_stacked_element_pos id = <id>
	cont_size = <stacked_pos>
	SetScreenElementProps {
		id = <cont_id>
		dims = <cont_size>
	}
	CreateScreenElement {
		type = VMenu
		parent = <cont_id>
		just = [left top]
		pos = (0.0, 10.0)
	}
	connection_vmenu_id = <id>
	GetArraySize \{connections}
	if (<array_size> > 0)
		i = 0
		begin
		net_create_reservation_connection_entry {
			(<connections> [<i>])
			parent_id = <connection_vmenu_id>
		}
		repeat <array_size>
	endif
endscript

script net_create_reservation_connection_entry 
	CreateScreenElement {
		type = ContainerElement
		parent = <parent_id>
		just = [left top]
	}
	cont_id = <id>
	default_params = {
		type = TextElement
		parent = <cont_id>
		rgba = $net_matchmaking_text_color
		scale = $net_matchmaking_sub_squeeze_text_scale
		just = $net_matchmaking_just
		z_priority = 10
		font = $net_matchmaking_text_font
	}
	get_reservation_client_state_string state = <test_state>
	<test_state_string> = <display_string>
	if GotParam \{instrument}
		get_reservation_player_instrument_string instrument = <instrument>
		<instrument_string> = <display_string>
	else
		<instrument_string> = qs("???")
	endif
	FormatText {
		TextName = display_string
		qs("Fin=%d HasConnH=%e Ready=%f Ret=%g TestConn=%h TestState=%i Instrument=%j")
		d = <finished>
		e = <has_conn_handle>
		f = <ready>
		g = <retrieved>
		h = <test_conn>
		i = <test_state_string>
		j = <instrument_string>
	}
	CreateScreenElement {
		<default_params>
		text = <display_string>
		pos = (110.0, 0.0)
	}
	get_stacked_element_pos id = <id>
	cont_size = <stacked_pos>
	SetScreenElementProps {
		id = <cont_id>
		dims = <cont_size>
	}
endscript

script get_stacked_element_pos 
	RequireParams \{[
			id
		]
		all}
	GetScreenElementDims id = <id>
	GetScreenElementProps id = <id>
	return stacked_pos = (<pos> + <Height> * (0.0, 1.0))
endscript

script net_integer_to_string 
	FormatText TextName = display_string qs("%d") d = <int>
	return display_string = <display_string>
endscript

script net_create_matchmaking_session_menu 
	printf \{qs("\L--- net_create_matchmaking_session_menu")}
	RequireParams \{[
			parent_id
			cont_id
			vmenu_id
			pos
		]
		all}
	<text_color> = $net_matchmaking_text_color
	<text_scale> = $net_matchmaking_text_scale
	<default_just> = $net_matchmaking_just
	<z_priority> = 10
	CreateScreenElement {
		type = ContainerElement
		parent = <parent_id>
		id = <cont_id>
		pos = <pos>
		just = [left top]
	}
	CreateScreenElement {
		type = TextElement
		local_id = net_matchmaking_session_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = <title>
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = VMenu
		id = <vmenu_id>
		parent = <cont_id>
		just = [left top]
		pos = (0.0, 30.0)
	}
endscript

script net_create_matchmaking_match_headers 
	printf \{qs("\L--- create_matchmaking_match_headers")}
	RequireParams \{[
			cont_id
		]
		all}
	<text_color> = $net_matchmaking_text_color
	<text_scale> = $net_matchmaking_text_scale
	<default_just> = $net_matchmaking_just
	<z_priority> = 10
	CreateScreenElement {
		type = TextElement
		id = net_matchmaking_mode_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = qs("mode")
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = TextElement
		id = net_matchmaking_state_text
		parent = <cont_id>
		font = $net_matchmaking_text_font
		text = qs("state")
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (300.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = ContainerElement
		parent = <cont_id>
		id = net_matchmaking_host_time_cont
		pos = (0.0, 60.0)
		just = [left top]
	}
	<sub_cont_id> = <id>
	CreateScreenElement {
		type = TextElement
		local_id = label
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs("Hosting Time:")
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = TextElement
		id = net_matchmaking_host_time_text
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs("-1")
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (200.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = ContainerElement
		parent = <cont_id>
		id = net_matchmaking_host_max_spots_cont
		pos = (300.0, 30.0)
		just = [left top]
	}
	<sub_cont_id> = <id>
	CreateScreenElement {
		type = TextElement
		local_id = label
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs("Max Spots:")
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = TextElement
		id = net_matchmaking_max_spots_text
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs("-1")
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (180.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = ContainerElement
		parent = <cont_id>
		id = net_matchmaking_host_reserved_spots_cont
		pos = (0.0, 30.0)
		just = [left top]
	}
	<sub_cont_id> = <id>
	CreateScreenElement {
		type = TextElement
		local_id = label
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs("Reserved Spots:")
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (0.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
	CreateScreenElement {
		type = TextElement
		id = net_matchmaking_reserved_spots_text
		parent = <sub_cont_id>
		font = $net_matchmaking_text_font
		text = qs("-1")
		scale = $net_matchmaking_text_scale
		just = [left top]
		pos = (250.0, 0.0)
		z_priority = <z_priority>
		rgba = <text_color>
	}
endscript

script net_get_matchmaking_state_string 
	RequireParams \{[
			state
		]
		all}
	display_string = qs("")
	switch (<state>)
		case eIDLE
		display_string = qs("Idle")
		case eWAITING_FOR_LOBBY
		display_string = qs("Waiting for lobby")
		case eCREATING
		display_string = qs("Creating")
		case eHOSTING
		display_string = qs("Hosting")
		case eSEARCHING
		display_string = qs("Searching")
		case eFINISHED_SEARCHING
		display_string = qs("Retrieved server list")
		case eFAILED_SEARCHING
		display_string = qs("Failed searching")
		case eFAILED_HOSTING
		display_string = qs("Failed hosting")
		case eINGAME
		display_string = qs("In game")
		case eCREATING_RANKED_SESSION
		display_string = qs("Creating ranked game")
		case eNOTHING
		display_string = qs("Nothing")
		default
		printstruct <...>
		display_string = qs("Unknown")
	endswitch
	return display_string = <display_string>
endscript

script net_get_matchmaking_mode_string 
	RequireParams \{[
			mode
		]
		all}
	display_string = qs("")
	switch (<mode>)
		case vMODE_AUTOMATCH
		display_string = qs("Auto Matchmaking")
		case vMODE_OPTIMATCH
		display_string = qs("Optimatch")
		case vMODE_QUICKMATCH
		display_string = qs("Quickmatch")
		default
		display_string = qs("Unknown")
	endswitch
	return display_string = <display_string>
endscript

script net_get_reservation_mode_string 
	RequireParams \{[
			mode
		]
		all}
	display_string = qs("")
	switch (<mode>)
		case eJOINER
		display_string = qs("Joiner")
		case eHOSTING
		display_string = qs("Hosting")
		case eCLIENT
		display_string = qs("Client")
		case eINVALID_RESERVATION_MODE
		default
		printstruct <...>
		display_string = qs("Unknown")
	endswitch
	return display_string = <display_string>
endscript

script net_get_reservation_state_string 
	RequireParams \{[
			state
		]
		all}
	display_string = qs("")
	switch (<state>)
		case eRESERVING_SPOTS
		display_string = qs("Reserving spots")
		case eRESERVATION_CANCEL
		display_string = qs("Reservation canceled")
		case eCLIENTS_TESTING_NEW_HOST
		display_string = qs("Clients testing new host")
		case eCLIENTS_JOINING_NEW_HOST
		display_string = qs("Clients joining new host")
		case eJOINING_RESERVED_SESSION
		display_string = qs("Joining reserved session")
		case eWAITING_FOR_JOINS
		display_string = qs("Waiting for client joins")
		case eRESERVED_SPOTS
		display_string = qs("Reserved spots")
		case eRESERVATION_CANCELED
		display_string = qs("Reservation canceled")
		case eRESERVATION_COMPLETE
		display_string = qs("Reservation complete")
		case eRESERVATION_REJECTED
		display_string = qs("Reservation rejected")
		case eWAITING_COMMAND
		display_string = qs("Waiting for command")
		case ePREPARING_TEST_SESSION
		display_string = qs("Preparing test session")
		case eTESTING_CONNECTION
		display_string = qs("Testing connection")
		case eRESERVATION_JOIN
		display_string = qs("Joining into reservation spot")
		case eJOIN_GAME
		display_string = qs("Joining game!")
		case eFAILED
		display_string = qs("Failed")
		case eSUCCEEDED
		display_string = qs("Succeeded")
		case eREADY_FOR_DELETE
		display_string = qs("Ready for delete")
		case eINVALID_RESERVATION_STATE
		default
		display_string = qs("Unknown reservation state")
	endswitch
	return display_string = <display_string>
endscript

script get_reservation_client_state_string 
	RequireParams \{[
			state
		]
		all}
	display_string = qs("")
	switch (<state>)
		case eNOT_TESTED
		display_string = qs("Not tested")
		case eTESTING
		display_string = qs("Testing...")
		case eSUCCESS
		display_string = qs("Success")
		case eFAILED
		display_string = qs("Failed")
		default
		display_string = qs("Unknown")
		printstruct <...>
	endswitch
	return display_string = <display_string>
endscript

script get_reservation_player_instrument_string 
	RequireParams \{[
			instrument
		]
		all}
	display_string = qs("")
	switch (<instrument>)
		case eGUITAR
		display_string = qs("Guitar")
		case eMICROPHONE
		display_string = qs("Microphone")
		case eDRUMS
		display_string = qs("Drums")
		default
		display_string = qs("Unknown")
		printstruct <...>
	endswitch
	return display_string = <display_string>
endscript
