
script ui_create_wii_friends_list \{for_invite = 0
		offline = 0}
	z_priority = 100.0
	createscreenelement \{type = containerelement
		id = wii_friend_code_container
		parent = root_window
		pos = (420.0, -400.0)
		alpha = 0.75}
	menu_anchor = <id>
	createscreenelement {
		type = spriteelement
		parent = <menu_anchor>
		texture = online_setlist_popup_bg
		dims = (512.0, 256.0)
		pos = (420.0, -190.0)
		just = [center top]
		z_priority = <z_priority>
		alpha = 1.0
	}
	getmyfriendnum
	formattext textname = friendkeytext qs(0x1068a1e9) s = <myfriendkey>
	createscreenelement {
		type = textblockelement
		parent = <menu_anchor>
		id = wii_friend_code_helper_text
		font = fontgrid_text_a8
		scale = 0.65000004
		rgba = [250 250 250 255]
		text = <friendkeytext>
		just = [center top]
		internal_just = [center center]
		z_priority = (<z_priority> + 0.1)
		pos = (420.0, -25.0)
		dims = (800.0, 100.0)
	}
	wii_friend_code_container :se_setprops \{pos = (420.0, 110.0)
		time = 0.5}
	menu_params = {
		title = qs(0xb0baa2ea)
		vmenu_id = wii_friends_list_vmenu
		scrolling
		use_all_controllers
	}
	if (<for_invite> = 0)
		<menu_params> = {
			<menu_params>
			pad_option2_script = generic_event_choose
			pad_option2_params = {state = uistate_enter_friend_num data = {offline = <offline>}}
		}
	endif
	make_generic_menu <menu_params>
	if (<offline> = 1)
		updatefriendslist
	endif
	wii_friends_list_vmenu :settags offline = <offline>
	wii_friends_list_vmenu :settags for_invite = <for_invite>
	wii_friends_list_vmenu :settags \{state = base}
	printf qs(0xa0bc64c4) d = <for_invite>
	populate_friends
	if (<for_invite> = 1)
		ui_helpers_wii_friends_list \{state = invite_only}
	else
		ui_helpers_wii_friends_list \{state = base}
	endif
	createscreenelement \{parent = root_window
		id = inviteinfobar
		type = descinterface
		desc = 'invite_info1'
		pos = (130.0, 30.0)
		scale = 1.1}
	if (<for_invite> = 1)
		inviteinfobar :se_setprops \{alpha = 0.0}
	endif
	if ($ui_friends_list_tut_shown = 0)
		getnumfriends
		totalfriends = (<numfriendsonline> + <numfriendsoffline> + <numfriendspending>)
		if (<totalfriends> = 0)
			ui_wii_friends_invite_tutorial
			change \{ui_friends_list_tut_shown = 1}
		else
			change \{ui_friends_list_tut_shown = 1}
		endif
	endif
	if 0x8658e568
		destroy_loading_screen
	endif
endscript
ui_friends_list_tut_shown = 0

script ui_destroy_wii_friends_list 
	destroy_generic_menu
	clean_up_user_control_helpers
	if screenelementexists \{id = wii_friend_code_container}
		destroyscreenelement \{id = wii_friend_code_container}
	endif
	if screenelementexists \{id = inviteinfobar}
		destroyscreenelement \{id = inviteinfobar}
	endif
	killspawnedscript \{name = ui_wii_friends_invite_blink_invite}
	if screenelementexists \{id = invite_tut_container}
		destroyscreenelement \{id = invite_tut_container}
	endif
endscript

script ui_helpers_wii_friends_list 
	if NOT gotparam \{state}
		wii_friends_list_vmenu :getsingletag \{state}
	endif
	clean_up_user_control_helpers
	switch <state>
		case base
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xaf4d5dd2)
			button = red
			z = 100000}
		add_user_control_helper \{text = qs(0xc29d3992)
			button = yellow
			z = 100000}
		case popup
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
		case reject
		add_user_control_helper \{text = qs(0xf13fea63)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
		case invite_only
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
		add_user_control_helper \{text = qs(0xf7723015)
			button = red
			z = 100000}
		case 0x2b54a3f9
		add_user_control_helper \{text = qs(0xc18d5e76)
			button = green
			z = 100000}
	endswitch
	wii_friends_list_vmenu :settags state = <state>
endscript
friendlist_selection_index = 0

script launch_friends_list 
	enable_network_wait_variable
	updatefriendslist
	create_generic_popup \{loading_window
		message = qs(0x8d5c436f)
		wait_variable = network_wait_var
		z = 200}
	generic_event_choose state = uistate_wii_friends_list data = {for_invite = <for_invite>}
endscript

script launch_offline_friends_list 
	getmyfriendnum
	if (<error> = 0)
		generic_event_choose \{state = uistate_wii_friends_list
			data = {
				offline = 1
			}}
	else
		create_new_generic_popup \{popup_type = error_menu
			error_func = destroy_generic_popup
			text = qs(0x88f937e4)}
	endif
endscript

script populate_friends 
	getfriendslist
	getarraysize <friendlist>
	wii_friends_list_vmenu :getsingletag \{for_invite}
	wii_friends_list_vmenu :getsingletag \{offline}
	if (<for_invite> = 1)
		choose_script = friendlist_invite_friend
	else
		choose_script = friendlist_friend_options
	endif
	if (<array_size> > 0)
		friend = 0
		begin
		getfriendinfo index = <friend>
		formattext textname = friendname qs(0x4d4555da) s = <nickname>
		if (<status> > 0 && <offline> = 0)
			if (<haspendinginvite> = 1)
				<icon> = pending_invite
			else
				<icon> = online_icon
			endif
		else
			if gotparam \{is_pending_friend}
				<icon> = pending_friend
			else
				if (<offline> = 1)
					<icon> = friend
				else
					<icon> = offline_icon
				endif
			endif
		endif
		add_friend = 0
		if (<for_invite> = 1)
			if (<status> > 0 && <haspendinginvite> = 0)
				<add_friend> = 1
			endif
		else
			<add_friend> = 1
		endif
		if (<add_friend> = 1)
			add_generic_menu_icon_item {
				icon = <icon>
				text = <friendname>
				pad_choose_script = <choose_script>
				additional_focus_script = select_friend
				additional_focus_params = {friend = <friend>}
			}
			if <item_container_id> :desc_resolvealias name = alias_generic_menu_smenu_iconitem_text
				<item_container_id> :se_setprops {
					generic_menu_smenu_iconitem_container_pos = {(-70.0, 0.0) relative}
				}
				getscreenelementdims id = <resolved_id>
				0x40cc1098 = (((<width> + 70) * (1.0, 0.0)) + (<height> * (0.0, 1.0)))
				<resolved_id> :se_setprops {
					pos = {(-70.0, 0.0) relative}
					font = 0x29d2eb4f
					scale_mode = `per axis`
					dims = <0x40cc1098>
				}
				<item_container_id> :se_waitprops
			endif
		endif
		<friend> = (<friend> + 1)
		repeat <array_size>
	else
		if screenelementexists \{id = inviteinfobar}
			inviteinfobar :se_setprops \{valid_info_alpha = 0
				invalid_invite_alpha = 1}
		endif
	endif
endscript

script clear_menu 
	requireparams \{[
			menu
		]
		all}
	getscreenelementchildren id = <menu>
	if gotparam \{children}
		i = 0
		getarraysize <children>
		if (<array_size> > 0)
			begin
			destroyscreenelement id = (<children> [<i>])
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script select_friend 
	change friendlist_selection_index = <friend>
	getfriendinfo index = <friend>
	if gotparam \{is_pending_friend}
		inviteinfobar :se_setprops \{valid_info_alpha = 0
			invalid_invite_alpha = 1}
	else
		if (<haspendinginvite> = 1)
			<invite_props> = {}
			if (<game_mode> = p4_career)
				base_game_mode = <game_mode>
				<invite_props> = {
					<invite_props>
					gamemode_text = qs(0xdf90fff4)
				}
			else
				netoptions :pref_size \{name = game_modes}
				i = 0
				begin
				netoptions :pref_getstruct name = game_modes index = <i>
				if (<game_mode> = <pref_struct>.search_chk)
					<base_game_mode> = (<pref_struct>.checksum)
					<invite_props> = {
						<invite_props>
						gamemode_text = (<pref_struct>.name)
					}
					break
				endif
				i = (<i> + 1)
				repeat <size>
			endif
			get_required_inst_and_players friend = <friend> base_game_mode = <base_game_mode> detail_game_mode = <game_mode> num_inviting_players = <num_players>
			if (<min_required_players> = <max_required_players>)
				formattext textname = players qs(0x48c6d14c) d = <max_required_players>
			else
				formattext textname = players qs(0xd5f4275a) d = <min_required_players> e = <max_required_players>
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
			<invite_props> = {
				<invite_props>
				valid_info_alpha = 1
				invalid_invite_alpha = 0
			}
			inviteinfobar :se_setprops <invite_props>
		else
			inviteinfobar :se_setprops \{valid_info_alpha = 0
				invalid_invite_alpha = 1}
		endif
	endif
endscript

script refresh_and_destroy 
	destroy_generic_popup
	wait \{1
		gameframe}
	refresh_friends_list
endscript

script refresh_friends_list 
	ui_event_get_top
	if NOT (screenelementexists id = wii_friends_list_vmenu)
		return
	endif
	clear_menu \{menu = wii_friends_list_vmenu}
	populate_friends
	launchevent \{type = focus
		target = wii_friends_list_vmenu
		data = {
			child_index = $friendlist_selection_index
		}}
	change \{disable_menu_sounds = 0}
	turn_off_highlight
	getscreenelementchildren \{id = wii_friends_list_vmenu}
	if gotparam \{children}
		getarraysize <children>
		if (<array_size> > 0)
			turn_on_highlight
		endif
	endif
endscript

script friendlist_friend_options 
	create_context_friend_menu
endscript

script friendlist_add_friend 
	wii_friends_list_vmenu :getsingletag \{offline}
	generic_event_choose state = uistate_enter_friend_num data = {offline = <offline>}
endscript

script friendlist_delete_friend 
	wii_friends_list_vmenu :getsingletag \{offline}
	friend = $friendlist_selection_index
	printf qs(0x803c5ef3) a = <friend>
	printf qs(0x542e87e4) c = <friend>
	deletefriend index = <friend> offline = <offline>
endscript

script create_context_friend_menu 
	destroy_generic_popup
	getnumfriends
	totalfriends = (<numfriendsonline> + <numfriendsoffline> + <numfriendspending>)
	if (<totalfriends> = 0)
		return
	endif
	wii_friends_list_vmenu :getsingletag \{offline}
	friend = $friendlist_selection_index
	getfriendinfo index = <friend>
	formattext textname = text qs(0xab316b9c) a = <nickname>
	if (<haspendinginvite> = 1 && <offline> = 0)
		create_generic_popup {
			title = qs(0x976cf9e7)
			option_menu = 4
			focus_option = 4
			message = <text>
			option1 = {
				title = qs(0xfab6c50b)
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose request_accept_invite}
				]
			}
			option2 = {
				title = qs(0x78c0e261)
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose choose_reject_phrase}
				]
			}
			option3 = {
				title = qs(0xa39f5c0a)
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose confirm_delete_friend params = {name = <nickname>}}
				]
			}
			option4 = {
				title = qs(0xf7723015)
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose block_refresh_and_destroy}
				]
			}
			back_script = block_refresh_and_destroy
			previous_menu = vmenu_friendlist
		}
	elseif (<status> > 0 && <offline> = 0)
		create_generic_popup {
			title = qs(0x976cf9e7)
			option_menu = 3
			focus_option = 3
			message = <text>
			option1 = {
				title = qs(0x5cfe4c43)
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose friendlist_invite_friend}
				]
			}
			option2 = {
				title = qs(0xa39f5c0a)
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose confirm_delete_friend params = {name = <nickname>}}
				]
			}
			option3 = {
				title = qs(0xf7723015)
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose block_refresh_and_destroy}
				]
			}
			back_script = block_refresh_and_destroy
		}
	else
		create_generic_popup {
			title = qs(0x976cf9e7)
			option_menu = 2
			focus_option = 2
			message = <text>
			option1 = {
				title = qs(0xa39f5c0a)
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose confirm_delete_friend params = {name = <nickname>}}
				]
			}
			option2 = {
				title = qs(0xf7723015)
				eventhandlers = [
					{focus popup_menu_focus}
					{unfocus popup_menu_unfocus}
					{pad_choose block_refresh_and_destroy}
				]
			}
			back_script = block_refresh_and_destroy
		}
	endif
	ui_helpers_wii_friends_list \{state = popup}
endscript

script choose_reject_phrase 
	destroy_generic_popup
	wait \{1
		gameframe}
	create_new_generic_popup \{title = qs(0xee59a32d)
		title_effect
		popup_type = phrase_window
		phrase_array = reject_phrases_short
		phrase_func = send_reject_phrase
		back_script = back_out_of_rejection}
	ui_helpers_wii_friends_list \{state = reject}
endscript

script back_out_of_rejection 
	destroy_generic_popup
	create_context_friend_menu
endscript

script send_reject_phrase 
	friend = $friendlist_selection_index
	printf qs(0x8a05825c) a = <friend>
	phrase_text = ($<phrase_array> [<phrase_index>])
	printf qs(0xbb489105) a = <phrase_text> b = <friend>
	sendrejectphrase index = <friend> phrase = <phrase_index>
	formattext \{checksumname = inviteid
		'invite_id%a'
		a = $friendlist_selection_index}
	if screenelementexists id = <inviteid>
		destroyscreenelement id = <inviteid>
	endif
	block_refresh_and_destroy
endscript

script confirm_delete_friend 
	destroy_generic_popup
	wait \{1
		gameframe}
	formattext textname = text qs(0xbd4d8f10) a = <name>
	wii_friends_list_vmenu :getsingletag \{offline}
	if (<offline> = 1)
		<delete_script> = context_menu_choose_delete_friend_offline
	else
		<delete_script> = context_menu_choose_delete_friend
	endif
	create_generic_popup {
		title = qs(0x5861dd47)
		yes_no_menu
		focus_no
		message = <text>
		yes_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose <delete_script> params = {name = <name>}}
		]
		no_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
		]
		back_script = block_refresh_and_destroy
	}
endscript

script context_menu_choose_delete_friend 
	destroy_generic_popup
	wait \{1
		gameframe}
	friendlist_delete_friend
	enable_network_wait_variable
	create_generic_popup \{loading_window
		message = qs(0xb9922bed)
		wait_variable = network_wait_var
		previous_menu = vmenu_friendlist}
	formattext textname = text qs(0x5adc3731) a = <name>
	wait \{1
		gameframe}
	ui_helpers_wii_friends_list \{state = 0x2b54a3f9}
	create_generic_popup {
		title = qs(0x3fc1c076)
		ok_menu
		message = <text>
		ok_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
		]
	}
endscript

script friendlist_invite_friend 
	destroy_generic_popup
	gettrueelapsedtime \{starttime = $last_cancel_matchmaking_time}
	printf 'elapsed time %d' d = <elapsedtime>
	if (<elapsedtime> < 33000 && <elapsedtime> > 0)
		create_generic_popup \{title = qs(0xdbec01b2)
			ok_menu
			message = qs(0xe8aeada0)
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
			back_script = block_refresh_and_destroy}
		return
	endif
	gamemode_gettype
	if NOT (<type> = career)
		is_controller_online controller_index = <device_num>
		if NOT (<online> = 1)
			create_intrument_config_warning \{helper_controls_script = ui_helpers_wii_friends_list
				msg_txt = qs(0xc11a7209)}
			return
		endif
		netoptions :pref_get \{name = game_modes}
		if ((<checksum> = p2_pro_faceoff) || (<checksum> = p2_faceoff))
			set_gamemode_by_instrument device_num = <device_num>
		endif
		if NOT is_valid_instrument_config
			create_intrument_config_warning \{helper_controls_script = ui_helpers_wii_friends_list}
			return
		endif
	endif
	friend = $friendlist_selection_index
	getfriendinfo index = <friend>
	formattext textname = text qs(0x77459aea) a = <nickname>
	create_generic_popup {
		title = qs(0xdbec01b2)
		yes_no_menu
		message = <text>
		yes_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose friendlist_confirm_invite_friend params = {index = <resolvedindex> nickname = <nickname>}}
		]
		no_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
		]
		back_script = block_refresh_and_destroy
	}
endscript

script context_menu_choose_delete_friend_offline 
	destroy_generic_popup
	wait \{1
		gameframe}
	friendlist_delete_friend
	formattext textname = text qs(0x5adc3731) a = <name>
	create_generic_popup {
		title = qs(0x3fc1c076)
		ok_menu
		message = <text>
		ok_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose block_refresh_and_destroy}
		]
		back_script = block_refresh_and_destroy
	}
endscript

script friendlist_confirm_invite_friend 
	printf \{qs(0xb865b4f5)}
	setbuttoneventmappings \{block_menu_input}
	formattext textname = friend_name qs(0x4d4555da) s = <nickname>
	destroy_generic_popup
	wait \{5
		gameframe}
	change invite_index = <index>
	if ui_event_exists_in_stack \{name = 'band_mode'}
		printf \{qs(0xfcf5855c)}
		enable_network_wait_variable
		create_popup_warning_menu \{wait_variable = network_wait_var
			title = qs(0xabf4f150)
			textblock = {
				text = qs(0x37f4c584)
			}
			full_blackout = 1}
		generic_event_back_block
		spawnscriptnow ui_band_mode_friends_match params = {friend_index = <index>}
	else
		printf \{qs(0xcfc68bad)}
		generic_event_back_block
		start_invite_matchmaking action = host friend_index = <index> <...>
		setbuttoneventmappings \{unblock_menu_input}
	endif
endscript

script get_localized_loading_text 
	return 0x6b8904f0 = (qs(0xfab8f6e7))
endscript

script spawn_no_friends_dialog 
	destroy_generic_popup
	create_generic_popup \{title = qs(0x79597197)
		ok_menu
		message = qs(0x1167548f)
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
				destroy_and_go_back
			}
		]
		back_script = destroy_and_go_back}
endscript

script destroy_and_go_back 
	destroy_generic_popup
	generic_event_back
endscript

script block_refresh_and_destroy 
	setbuttoneventmappings \{block_menu_input}
	refresh_and_destroy
	ui_helpers_wii_friends_list \{state = base}
	wait \{0.5
		seconds}
	setbuttoneventmappings \{unblock_menu_input}
	ui_event_get_top
	if NOT (<base_name> = 'wii_friends_list')
		ui_event \{event = menu_back
			state = uistate_wii_friends_list
			force_event = true}
	endif
endscript

script choose_invite_icon 
	requireparams \{[
			index
		]
		all}
	getfriendinfo index = <index>
	<0x20caf8c6> = invite_icon
	if gotparam \{guitar1}
		appendsuffixtochecksum base = <0x20caf8c6> suffixstring = '_g1'
		<0x20caf8c6> = <appended_id>
	endif
	if gotparam \{guitar2}
		appendsuffixtochecksum base = <0x20caf8c6> suffixstring = '_g2'
		<0x20caf8c6> = <appended_id>
	endif
	if gotparam \{vocals}
		appendsuffixtochecksum base = <0x20caf8c6> suffixstring = '_v'
		<0x20caf8c6> = <appended_id>
	endif
	if gotparam \{drums}
		appendsuffixtochecksum base = <0x20caf8c6> suffixstring = '_d'
		<0x20caf8c6> = <appended_id>
	endif
	printf qs(0xe2b384a2) s = <0x20caf8c6>
	return 0xb4b1a439 = <0x20caf8c6>
endscript

script ui_wii_friends_invite_tutorial 
	create_generic_popup \{title = qs(0x50c3c667)
		ok_menu
		message = qs(0x85017cb2)
		default_blackout
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
				ui_wii_friends_invite_destroy_tutorial
			}
		]
		back_script = ui_wii_friends_invite_destroy_tutorial}
	spawnscript \{ui_wii_friends_invite_blink_invite}
endscript

script ui_wii_friends_invite_blink_invite 
	if screenelementexists \{id = invite_tut_container}
		destroyscreenelement \{id = invite_tut_container}
	endif
	createscreenelement \{type = containerelement
		id = invite_tut_container
		parent = root_window
		pos = $invite_pos
		just = [
			left
			top
		]
		z_priority = 10000000.0}
	createscreenelement \{type = spriteelement
		id = invite_tut_icon
		parent = invite_tut_container
		dims = (128.0, 128.0)
		texture = general_invite_icon
		just = [
			left
			top
		]
		pos = (0.0, 0.0)
		z_priority = 10000000.0
		alpha = 0.0}
	begin
	invite_tut_icon :legacydomorph \{time = 0.5
		alpha = 1.0}
	wait \{0.75
		seconds}
	invite_tut_icon :legacydomorph \{time = 0.5
		alpha = 0.0}
	wait \{0.5
		seconds}
	repeat
endscript

script ui_wii_friends_invite_destroy_tutorial 
	killspawnedscript \{name = ui_wii_friends_invite_blink_invite}
	if screenelementexists \{id = invite_tut_container}
		destroyscreenelement \{id = invite_tut_container}
	endif
	destroy_generic_popup
endscript

script turn_off_highlight 
	if screenelementexists \{id = generic_menu}
		generic_menu :se_setprops \{highlight_bars_alpha = 0}
	endif
endscript

script turn_on_highlight 
	if screenelementexists \{id = generic_menu}
		generic_menu :se_setprops \{highlight_bars_alpha = 1}
	endif
endscript
