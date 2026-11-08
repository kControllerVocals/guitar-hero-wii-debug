
script spawn_reject 
	begin
	if NOT IsDwcInPotentiallyBlockingCall
		break
	else
		printf \{qs(0x76848ad4)}
		Wait \{1
			gameframe}
	endif
	repeat
	if NOT NetSessionFunc \{obj = session
			func = is_matchmaking_active}
		printf \{qs(0x3f1263f9)}
		return
	endif
	ui_event_get_top
	if (<base_name> = 'band_mode')
		cancel_career_search_early
	else
		if NOT cancel_start_matchmaking
			return \{false}
		endif
	endif
	GetFriendName index = <index>
	FormatText TextName = reject_text ($wii_reject_dialog) a = <nickName> b = ($reject_phrases_full [<phrase>])
	create_generic_popup {
		title = $wii_rejected
		ok_menu
		message = <reject_text>
		ok_eventhandlers = [
			{focus popup_menu_focus}
			{unfocus popup_menu_unfocus}
			{pad_choose destroy_invite_popups}
		]
		priority = 5
		back_script = destroy_invite_popups
	}
	return \{true}
endscript
should_spawn_disconnect = 0

script safe_spawn_disconnect 
	change \{should_spawn_disconnect = 1}
endscript

script check_player_disconnect 
	begin
	if ($should_spawn_disconnect = 1)
		if spawn_disconnect
			change \{should_spawn_disconnect = 0}
			return
		endif
	endif
	if NOT NetSessionFunc \{obj = session
			func = is_matchmaking_active}
		printf \{qs(0xa02f6eba)}
		return
	endif
	Wait \{10
		gameframes}
	repeat
endscript

script check_invite_valid 
	RequireParams \{[
			friend_index
		]
		all}
	begin
	GetFriendInfo
	if NOT check_invite index = <friend_index>
		Wait \{30.0
			seconds}
		if NOT check_invite index = <friend_index>
			if spawn_invite_invalid
				return
			endif
		endif
	endif
	if NOT NetSessionFunc \{obj = session
			func = is_matchmaking_active}
		printf \{qs(0xe2dfc758)}
		return
	endif
	Wait \{10
		gameframes}
	repeat
endscript

script spawn_invite_invalid 
	ui_event_get_top
	if (<base_name> = 'band_mode')
		cancel_career_search_early
	else
		if NOT cancel_start_matchmaking \{from_invalid}
			return \{false}
		endif
	endif
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
				destroy_invite_popups
			}
		]
		priority = 5
		back_script = destroy_invite_popups}
	return \{true}
endscript

script spawn_disconnect 
	ui_event_get_top
	if (<base_name> = 'band_mode')
		cancel_career_search_early
	else
		if NOT cancel_start_matchmaking
			return \{false}
		endif
	endif
	create_generic_popup \{title = $wii_error
		ok_menu
		message = $wii_wifi_friend_disconnect
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
				destroy_generic_popup
			}
		]
		priority = 5
		back_script = destroy_generic_popup}
	return \{true}
endscript

script ok_after_reject 
	destroy_generic_popup
	LaunchEvent \{type = pad_back}
endscript

script spawn_friend_left 
	if ScreenElementExists \{id = warning_message_container}
		leaving_lobby_dialog_unfocus
		destroy_leaving_lobby_dialog
	endif
	create_generic_popup \{title = $wii_error
		ok_menu
		message = $wii_wifi_friend_leave
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
				ok_after_friend_left
			}
		]
		back_script = ok_after_friend_left}
endscript

script ok_after_friend_left 
	destroy_generic_popup
	network_player_lobby_message \{type = character_select
		action = deselect}
	if NOT ($ui_flow_manager_state [0] = online_character_select_fs)
		ui_flow_manager_respond_to_action \{action = handle_dropped_client}
		Wait \{1
			gameframe}
	endif
	quit_network_game
endscript
invite_pos = (150.0, 150.0)

script spawn_invite 
	GetFriendName index = <index>
	FormatText TextName = friendName qs("%d") d = <nickName>
	printf qs(0x08ca0eda) s = <nickName>
	FormatText checksumname = invite_id '%n%i' n = <nickName> i = <index> AddToStringLookup = true
	if ScreenElementExists id = <invite_id>
		DestroyScreenElement id = <invite_id>
		Wait \{1
			gameframe}
	endif
	if ScreenElementExists \{id = invite_container}
		return
	endif
	CreateScreenElement \{type = ContainerElement
		id = invite_container
		parent = root_window
		pos = $invite_pos
		just = [
			left
			top
		]
		z_priority = 800.0}
	CreateScreenElement \{type = SpriteElement
		id = invite_icon
		parent = invite_container
		dims = (128.0, 128.0)
		texture = general_invite_icon
		just = [
			left
			top
		]
		pos = (0.0, 0.0)
		z_priority = 800.0
		alpha = 0.0}
	text_box_pos = (0.0, 0.0)
	<text_box_pos> = (<text_box_pos> + (100.0, 58.0))
	CreateScreenElement {
		type = SpriteElement
		id = invite_name_box
		parent = invite_container
		rgba = [0 0 0 255]
		pos = <text_box_pos>
		alpha = 1
		scale = (1.0, 1.0)
		dims = (1.0, 35.0)
		just = [left top]
		z_priority = 799.0
	}
	text_pos = (<text_box_pos> + (30.0, -4.0))
	CreateScreenElement {
		type = TextElement
		id = invite_text
		parent = invite_container
		rgba = [255 255 255 255]
		alpha = 0
		pos = <text_pos>
		font = fontgrid_text_a6
		internal_scale = (0.5, 0.7)
		scale = 0.8
		text = <friendName>
		just = [left top]
		z_priority = 800.0
	}
	GetScreenElementDims \{id = invite_text}
	printf qs(0x91737790) a = <width>
	box_width = ((<width>) * (1.0, 0.0) + (40.0, 1.0))
	invite_icon :LegacyDoMorph \{alpha = 1.0
		time = 0.2
		Anim = fast_out}
	invite_name_box :LegacyDoMorph scale = <box_width> scale_relative time = 0.2 Anim = fast_out
	invite_text :LegacyDoMorph \{alpha = 1
		time = 0.2
		Anim = fast_out}
	Wait \{60
		gameframes}
	invite_container :LegacyDoMorph \{alpha = 0.0
		time = 0.2
		Anim = fast_in}
	if ScreenElementExists \{id = invite_container}
		DestroyScreenElement \{id = invite_container}
	endif
endscript

script check_invite 
	RequireParams \{[
			index
		]
		all}
	CheckForInvite index = <index>
	if (<invite_type> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script accept_invite 
	RequireParams \{[
			detail_game_mode
		]
		all}
	destroy_generic_popup
	GetFriendInfo index = ($friendlist_selection_index)
	printstruct <...>
	printf qs(0x4cc3cd93) a = <nickName>
	if (<detail_game_mode> = p4_career)
		enable_network_wait_variable
		create_popup_warning_menu \{wait_variable = network_wait_var
			title = qs("Loading")
			textblock = {
				text = $wii_loading_message
			}
			full_blackout = 1}
		change \{game_mode = p4_career}
		NetOptions :Pref_Choose \{name = game_modes
			checksum = p4_career}
		ui_event \{event = menu_replace
			data = {
				state = uistate_net_setup
				action = join
				controller = 0
			}}
		Wait \{2
			seconds}
		ready_up_players_invite_client enabled_controllers = <enabled_controllers> resolved_Friend_Index = <resolvedIndex>
		destroy_loading_screen
	else
		generic_event_back_block \{data = {
				state = uistate_online
			}}
		FormatText TextName = friend_name qs("%s") s = <nickName>
		start_invite_matchmaking action = join friend_index = <resolvedIndex> <...>
	endif
endscript

script request_accept_invite 
	destroy_generic_popup
	<friend> = $friendlist_selection_index
	GetFriendInfo index = <friend>
	printstruct <...>
	if NOT (<hasPendingInvite> = 1)
		create_generic_popup \{ok_menu
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
			back_script = block_refresh_and_destroy}
		return
	endif
	if (<game_mode> = p4_career)
		base_game_mode = <game_mode>
	else
		NetOptions :Pref_Size \{name = game_modes}
		i = 0
		begin
		NetOptions :Pref_GetStruct name = game_modes index = <i>
		if (<game_mode> = <pref_struct>.search_chk)
			<base_game_mode> = (<pref_struct>.checksum)
			break
		endif
		i = (<i> + 1)
		repeat <size>
	endif
	get_required_inst_and_players friend = <friend> base_game_mode = <base_game_mode> detail_game_mode = <game_mode> num_inviting_players = <num_players>
	generic_event_choose data = {
		state = UIstate_wii_invite_players
		online = 0
		min_players = <min_required_players>
		max_players = <max_required_players>
		game_mode = <base_game_mode>
		detail_game_mode = <game_mode>
		required_instruments = <required_instruments>
		enable_if_valid = 1
		pad_start_script = approve_accept_invite
	}
endscript

script get_required_inst_and_players 
	RequireParams \{[
			friend
			base_game_mode
			detail_game_mode
			num_inviting_players
		]
		all}
	game_mode_get_needed_instrument_set game_mode = <base_game_mode> detail_game_mode = <detail_game_mode> num_inviting_players = <num_inviting_players>
	printf \{qs(0xdf66fef2)}
	printstruct <...>
	instruments_needed = {}
	GetFriendInfo index = <friend>
	if (<instrument_set> = same)
		if GotParam \{guitar1}
			instruments_needed = {<instruments_needed> guitar1}
		endif
		if GotParam \{guitar2}
			instruments_needed = {<instruments_needed> guitar2}
		endif
		if GotParam \{Drums}
			instruments_needed = {<instruments_needed> Drums}
		endif
		if GotParam \{Vocals}
			instruments_needed = {<instruments_needed> Vocals}
		endif
	else
		if NOT (GotParam guitar1)
			instruments_needed = {<instruments_needed> guitar1}
		endif
		if NOT (GotParam guitar2)
			if NOT (GotParam guitar1)
				instruments_needed = {<instruments_needed> guitar2}
			else
				instruments_needed = {<instruments_needed> guitar1}
			endif
		endif
		if NOT (GotParam Drums)
			instruments_needed = {<instruments_needed> Drums}
		endif
		if NOT (GotParam Vocals)
			instruments_needed = {<instruments_needed> Vocals}
		endif
	endif
	if (<player_match> = exact)
		<min_players> = <players_needed>
		<max_players> = <players_needed>
	else
		<min_players> = 1
		<max_players> = <players_needed>
	endif
	if (<detail_game_mode> = p2_coop)
		instruments_needed = {guitar1 guitar2}
	endif
	return required_instruments = <instruments_needed> min_required_players = <min_players> max_required_players = <max_players>
endscript

script game_mode_get_needed_instrument_set 
	RequireParams \{[
			game_mode
			num_inviting_players
			detail_game_mode
		]
		all}
	required_instruments = same
	players_needed = <num_inviting_players>
	player_match = exact
	AppendSuffixToChecksum Base = <game_mode> SuffixString = '_props'
	printstruct $<appended_id>
	gamemode_players = ($<appended_id>.num_players)
	printf qs("\L%d") d = <gamemode_players>
	if StructureContains Structure = $<appended_id> faceoff
		<required_instruments> = same
		<players_needed> = <num_inviting_players>
		<player_match> = exact
	else
		if (($<appended_id>.type) = battle)
			<required_instruments> = same
			<players_needed> = <num_inviting_players>
			<player_match> = exact
		else
			<required_instruments> = opposite
			<players_needed> = (<gamemode_players> - <num_inviting_players>)
			<player_match> = upto
		endif
	endif
	return instrument_set = <required_instruments> players_needed = <players_needed> player_match = <player_match>
endscript

script destroy_invite_popups 
	destroy_generic_popup
	GameMode_GetType
	if (<type> = career)
		ui_band_mode_change_menu_focus_all \{focus_type = focus}
	endif
endscript
