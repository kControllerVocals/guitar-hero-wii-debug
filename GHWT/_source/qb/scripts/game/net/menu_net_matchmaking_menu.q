GLOBAL_SHOULD_USE_NET_DEBUGGING = 0
online_lobby_item_text_color = [
	200
	200
	200
	255
]
online_player_slot_bg_team1 = [
	255
	255
	0
	255
]
online_player_slot_bg_team2 = [
	83
	45
	106
	255
]
online_player_slot_bg_gray = [
	89
	90
	92
	255
]
ps3_chat_warning_text = [
	150
	150
	150
	255
]
default_online_warning_pos = (980.0, 480.0)
online_lobby_item_text_color_focus = [
	223
	112
	45
	255
]
net_num_player_settings_ack = 0
online_to_setlist_count = 10
net_num_players = 0
num_local_players = 0
controller0_wants_online = 0
controller1_wants_online = 0
controller2_wants_online = 0
controller3_wants_online = 0
gamertag_0 = qs("")
gamertag_1 = qs("")
gamertag_2 = qs("")
gamertag_3 = qs("")
gamertag_4 = qs("")
gamertag_5 = qs("")
gamertag_6 = qs("")
gamertag_7 = qs("")
net_helper_text_strings = {
	log_out_of_dwc_text = $wii_Log_Out_Highlight_Info
	find_a_game_text = qs("Find other players to play Guitar Hero World Tour with.")
	debug_create_match_text = qs("Jump into the setlist for easy testing.")
	debug_custom_search_text = qs("Find a match with specific settings.")
	game_mode_text = qs("Choose what game mode you would like to play.")
	start_matchmaking_text = qs(0x5491255a)
	friend_matchmaking_text = qs(0xe9352a66)
	matchmaking_complete_text = qs("Adding players to your session.")
	friends_text = $wii_manage_friends
	friends_menu_text = qs(0x17c41fba)
	timer_5_text = qs("COUNT DOWN TO SETLIST 5")
	timer_4_text = qs("COUNT DOWN TO SETLIST 4")
	timer_3_text = qs("COUNT DOWN TO SETLIST 3")
	timer_2_text = qs("COUNT DOWN TO SETLIST 2")
	timer_1_text = qs("COUNT DOWN TO SETLIST 1")
	timer_0_text = qs("COUNT DOWN TO SETLIST 0")
	wii_friends_title = qs(0x54a29d26)
	wii_friends_text = qs(0xe54b6758)
	DLC_menu_title = qs("MUSIC STORE")
	DLC_menu_text = $wii_Music_Store_Highlight_Info
	postgame_play_again_text = qs("Play another song.")
	postgame_party_up_text = qs("Party up to stay together after this match ends.")
	p2_pro_faceoff_text = qs("Play full track against 1 player.")
	p4_pro_faceoff_text = qs("Play with a partner against 2 players.")
	p2_faceoff_text = qs("Alternate parts against 1 player.")
	p2_battle_text = qs("Battle against 1 player.")
	p2_quickplay_text = qs("Play co-op with 1 player.")
	p4_quickplay_text = qs("Join a band and play songs.")
	p8_pro_faceoff_text = qs("Join a band and play a full track against another band.")
	p4_career_text = qs("Career Text")
}
net_helper_text_strings_xen = {
	preferences_text = qs("Edit preferences for Xbox LIVE play.")
	pref_character_text = qs("Select rocker for Xbox LIVE play.")
	pref_difficulty_text = qs("Change difficulty for Xbox LIVE play.")
	pref_lefty_flip_text = qs("Change lefty flip for Xbox LIVE play.")
	pref_venue_text = qs("Select preferred venue for Xbox LIVE play.")
	pref_vocal_style_text = qs("Select vocal highway for Xbox LIVE play.")
	gamer_card_text = qs("Press \m0 to view gamer card.")
	sign_in_text = qs("Press \m0 to Sign In.")
	postgame_quit_text = qs("Move back to the Xbox LIVE lobby.")
	blank_text = qs("")
}
net_helper_text_strings_ps3 = {
	preferences_text = qs("Edit preferences for online play.")
	pref_character_text = qs("Select rocker for online play.")
	pref_difficulty_text = qs("Change difficulty for online play.")
	pref_lefty_flip_text = qs("Change lefty flip for online play.")
	pref_venue_text = qs("Select preferred venue for online play.")
	pref_vocal_style_text = qs("Select vocal highway for online play.")
	gamer_card_text = qs("")
	postgame_quit_text = qs("Move back to the online lobby.")
}
has_invite_join_result_callback_completed = 0
net_no_focus_warning = 0
disconnected_from_host_client = 0
num_matchmaking_tries = 0

script net_spawned_wait_and_set_joinable 
	if NetSessionFunc \{obj = party
			func = is_host}
		Wait \{2
			seconds}
		NetSessionFunc \{obj = party
			func = set_party_joinable
			params = {
				joinable = 1
			}}
	endif
endscript

script create_net_matchmaking_menu 
	frontend_load_soundcheck \{loadingscreen}
	CreateScreenElement \{parent = root_window
		id = OnlineLobbyInterface
		type = DescInterface
		desc = 'online_lobby'
		pos = (0.0, -1000.0)
		tags = {
			menu_index = 0
			Menu_items = 0
			slots_index = 0
			slot_items = 0
			player_slots_menu_id = 0
			locked_to_players = 0
			toggle_allowed = 1
		}
		music_store_text = $wii_DLC_MusicStore_Text
		log_out_text = $wii_log_out
		matchmaking_title_text = $wii_Matchmaking_title_text}
	set_focus_color rgba = ($online_lobby_item_text_color_focus)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	OnlineLobbyInterface :Desc_CheckVersion \{desired = 17
		AssertIf = Mismatch}
	GetActiveControllers
	GetArraySize <active_controllers>
	i = 0
	begin
	if (<active_controllers> [<i>] = 1)
		if NetSessionFunc func = IsControllerInGame params = {controller = <i>}
			restore_save_net_preferences controller_index = <i>
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	create_matchmaking_menu_and_items
	create_player_slots_container
	spawnscriptnow \{task_menu_default_anim_in
		params = {
			base_name = 'band_hub'
		}}
	if isXenon
		create_signin_container
	endif
	change \{net_no_focus_warning = 0}
	online_lobby_setup_helper_controls
	if GotParam \{accepting_invite}
		create_joining_invite_popup
	else
		if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_matchmaking_vmenu}
			AssignAlias id = <resolved_id> alias = current_menu
			LaunchEvent \{type = focus
				target = current_menu}
			OnlineLobbyInterface :Obj_SpawnScriptNow online_lobby_animate_in params = {<...>}
		endif
	endif
	change \{mMatchingWindowId = 0}
endscript

script online_lobby_setup_helper_controls \{menu_type = left_hand}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :GetTags
		clean_up_user_control_helpers
		if ChecksumEquals a = left_hand b = <menu_type>
			add_user_control_helper \{text = qs("SELECT")
				button = green
				z = 100000}
		elseif ChecksumEquals a = right_hand b = <menu_type>
			if isXenon
				if GotParam \{gamer_card}
					if (<gamer_card> = 1)
						add_user_control_helper \{text = qs("VIEW GAMER CARD")
							button = green
							z = 100000}
					endif
				endif
			endif
		endif
		GetActiveControllers
		GetArraySize <active_controllers>
		i = 0
		begin
		if (<active_controllers> [<i>] = 1)
			if NetSessionFunc func = IsControllerInGame params = {controller = <i>}
				get_controller_type controller_index = <i>
				if (<controller_type> = guitar)
					add_user_control_helper text = qs("GUITAR/BASS") button = Orange z = 100000 controller = <i> use_guitar_button = 1
					break
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 100000}
		add_user_control_helper \{text = $wii_sign_in_out
			button = Blue
			z = 100000}
	endif
endscript

script online_lobby_animate_in 
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	Wait \{0.5
		second}
	SoundEvent \{event = Online_Main_Panel_In}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :SE_SetProps \{pos = (0.0, 30.0)
			time = 0.2
			Anim = gentle}
	else
		return
	endif
	Wait \{0.22
		second}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :SE_SetProps \{pos = (0.0, 0.0)
			time = 0.1
			Anim = gentle}
	else
		return
	endif
	ResolveScreenElementId \{id = [
			{
				id = OnlineLobbyInterface
			}
			{
				local_id = lobby_menu
			}
			{
				local_id = matchmaking_container
			}
			{
				local_id = right_side_container
			}
		]}
	online_lobby_swing id = <resolved_id>
	if GotParam \{lost_party}
		create_online_warning_message \{title = qs("INFO")
			message = qs("You lost connection to your party.")
			alpha = 0.0}
		display_online_warning_message
	endif
endscript

script online_lobby_swing 
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	if (RandomInteger (0.0, 1.0) = 1)
		swing_direction = 1
	else
		swing_direction = -1
	endif
	swing_direction = (<swing_direction> * RandomFloat (0.3, 1.0))
	if ScreenElementExists id = <id>
		<id> :SE_SetProps rot_angle = (<swing_direction> * 2) Anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		second}
	if ScreenElementExists id = <id>
		<id> :SE_SetProps rot_angle = (<swing_direction> * -1.75) Anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		second}
	if ScreenElementExists id = <id>
		<id> :SE_SetProps rot_angle = (<swing_direction> * 1.5) Anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		second}
	if ScreenElementExists id = <id>
		<id> :SE_SetProps rot_angle = (<swing_direction> * -1.25) Anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		second}
	if ScreenElementExists id = <id>
		<id> :SE_SetProps rot_angle = (<swing_direction> * 1.0) Anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		second}
	if ScreenElementExists id = <id>
		<id> :SE_SetProps rot_angle = (<swing_direction> * -0.5) Anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		second}
	if ScreenElementExists id = <id>
		<id> :SE_SetProps rot_angle = (<swing_direction> * 0.25) Anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		second}
	if ScreenElementExists id = <id>
		<id> :SE_SetProps rot_angle = 0 Anim = gentle time = 0.1
	else
		return
	endif
endscript

script online_lobby_transition_in 
	online_lobby_setup_helper_controls
	ResolveScreenElementId \{id = [
			{
				id = OnlineLobbyInterface
			}
			{
				local_id = lobby_menu
			}
			{
				local_id = matchmaking_container
			}
			{
				local_id = left_side_container
			}
		]}
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	SoundEvent \{event = Online_Panel_In}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		<resolved_id> :SE_SetProps pos = {(0.0, 1000.0) relative} time = 0.15 Anim = gentle
	else
		return
	endif
	Wait \{0.15
		second}
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script online_lobby_transition_out 
	ResolveScreenElementId \{id = [
			{
				id = OnlineLobbyInterface
			}
			{
				local_id = lobby_menu
			}
			{
				local_id = matchmaking_container
			}
			{
				local_id = left_side_container
			}
		]}
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		<resolved_id> :SE_SetProps pos = {(0.0, -1000.0) relative} time = 0.15 Anim = gentle
	else
		return
	endif
	Wait \{0.15
		second}
endscript

script destroy_net_matchmaking_menu 
	if ScreenElementExists \{id = OnlineLobbyInterface}
		DestroyScreenElement \{id = OnlineLobbyInterface}
	endif
	if NOT ($mMatchingWindowId = 0)
		if ScreenElementExists \{id = $mMatchingWindowId}
			DestroyScreenElement \{id = $mMatchingWindowId}
		endif
	endif
	KillSpawnedScript \{name = set_net_ui_to_finished_searching}
	generic_ui_destroy
endscript

script create_joining_invite_popup 
	printf \{qs("\L---create_joining_invite_popup")}
	if ($has_invite_join_result_callback_completed = 0)
		create_popup_warning_menu \{title = qs("JOINING")
			textblock = {
				text = qs("")
			}
			parent = current_menu
			no_background
			options = [
				{
					func = kill_online_popup
					text = qs("Cancel")
				}
			]}
		CreateScreenElement \{type = SpriteElement
			parent = PopupElement
			texture = load_wheel
			pos = (440.0, 300.0)
			dims = (128.0, 128.0)
			just = [
				center
				center
			]
			z_priority = 520}
		PopupElement :Obj_SpawnScriptNow animate_online_icon params = {id = <id>}
		AssignAlias \{id = pu_warning_vmenu
			alias = current_menu}
	endif
endscript

script cleanup_invite_popup 
	printf \{qs("\L--- cleanup_invite_popup")}
	destroy_popup_warning_menu
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script animate_online_icon 
	rot_angle = -360
	begin
	<id> :SE_SetProps rot_angle = <rot_angle> time = 1.0
	<id> :SE_WaitProps
	<rot_angle> = (<rot_angle> - 360)
	repeat
endscript

script create_online_warning_message title = qs("TEST") message = qs("NO MESSAGE PROVIDED") pos = ($default_online_warning_pos) parent = OnlineLobbyInterface alpha = 1.0
	if NOT ScreenElementExists id = <parent>
		return
	endif
	if ScreenElementExists \{id = online_warning_message_container}
		DestroyScreenElement \{id = online_warning_message_container}
	endif
	GetScreenElementZPriority id = <parent>
	CreateScreenElement {
		type = ContainerElement
		id = online_warning_message_container
		parent = <parent>
		pos = <pos>
		just = [center center]
		z_priority = (<z_priority> + 20)
		alpha = <alpha>
	}
	menu_anchor = <id>
	CreateScreenElement {
		type = SpriteElement
		parent = <menu_anchor>
		texture = online_dialog_bg
		dims = (360.0, 360.0)
		pos = (0.0, 0.0)
		just = [center center]
		z_priority = (<z_priority> + 21)
		alpha = 1.0
	}
	CreateScreenElement {
		type = TextBlockElement
		parent = <menu_anchor>
		id = online_warning_message_title
		font = fontgrid_text_a6
		rgba = ($online_lobby_item_text_color)
		text = <title>
		just = [center center]
		internal_just = [center center]
		z_priority = (<z_priority> + 22)
		pos = (0.0, -115.0)
		dims = (150.0, 36.0)
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = `per axis`
	}
	CreateScreenElement {
		type = TextBlockElement
		parent = <menu_anchor>
		id = online_warning_message_text
		font = fontgrid_text_a6
		rgba = ($online_lobby_item_text_color)
		text = <message>
		just = [center center]
		internal_just = [center center]
		internal_scale = 0.7
		z_priority = (<z_priority> + 22)
		pos = (0.0, 25.0)
		dims = (300.0, 200.0)
		single_line = false
		fit_width = wrap
		fit_height = `scale down if larger`
		scale_mode = `per axis`
	}
endscript

script destroy_online_warning_message 
	if ScreenElementExists \{id = online_warning_message_container}
		DestroyScreenElement \{id = online_warning_message_container}
	endif
endscript

script display_online_warning_message 
	if ScreenElementExists \{id = online_warning_message_container}
		online_warning_message_container :Obj_SpawnScriptNow \{online_warning_message_animate}
	endif
endscript

script online_warning_message_animate 
	if ScreenElementExists \{id = online_warning_message_container}
		online_warning_message_container :SE_SetProps \{alpha = 1.0
			time = 0.2}
		online_warning_message_container :SE_WaitProps
	endif
	Wait \{2.0
		seconds}
	if ScreenElementExists \{id = online_warning_message_container}
		online_warning_message_container :SE_SetProps \{alpha = 0.0
			time = 0.2}
		online_warning_message_container :SE_WaitProps
	endif
	destroy_online_warning_message
endscript

script create_ps3_chat_warning_message 
	CreateScreenElement {
		type = TextBlockElement
		parent = OnlineLobbyInterface
		id = ps3_chat_warning_text
		font = fontgrid_text_a6
		rgba = ($ps3_chat_warning_text)
		pos = (870.0, 550.0)
		dims = (515.0, 200.0)
		text = <message>
		just = [center center]
		internal_just = [center center]
		internal_scale = 0.5
		z_priority = 3.1
		single_line = false
		fit_width = wrap
		fit_height = `scale down if larger`
		scale_mode = `per axis`
	}
endscript

script destroy_ps3_chat_warning_message 
	if ScreenElementExists \{id = ps3_chat_warning_text}
		DestroyScreenElement \{id = ps3_chat_warning_text}
	endif
endscript

script create_matchmaking_menu_and_items 
	if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_matchmaking_vmenu}
		<resolved_id> :SE_SetProps {
			event_handlers = [
				{pad_back leave_net_main_menu params = {id = <resolved_id>}}
				{pad_up net_up_down_action params = {action = up}}
				{pad_down net_up_down_action params = {action = down}}
				{pad_option generic_event_choose params = {state = UIstate_wii_sign_in data = {online = 0 enable_if_online = 1}}}
				{pad_l1 toggle_guitar_part}
			]
		}
		<matchmaking_vmenu_id> = <resolved_id>
		Menu_items = 0
		if NetSessionFunc \{obj = party
				func = is_host}
		else
			focusable = not_focusable
		endif
		ResolveScreenElementId id = {<matchmaking_vmenu_id> child = start_matchmaking}
		<resolved_id> :SE_SetProps {
			<focusable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose online_lobby_pad_choose_wrapper params = {pad_choose_script = start_matchmaking}}
			]
		}
		if GotParam \{focusable}
			if (<focusable> = not_focusable)
				ResolveScreenElementId id = [
					{id = <resolved_id>}
					{local_id = text}
				]
				<Menu_items> = (<Menu_items> - 1)
				<resolved_id> :SE_SetProps alpha = 0.5
			endif
		endif
		choose_first_viewable_mode \{net_pref_name = game_modes}
		NetOptions :Pref_Get \{name = game_modes}
		FormatText TextName = game_mode_text qs("MODE: %d") d = <display_string>
		ResolveScreenElementId id = [
			{id = <matchmaking_vmenu_id>}
			{local_id = game_mode}
			{local_id = text}
		]
		start_matchmaking_params = {
			net_pref_name = game_modes
			base_text = qs("MODE: ")
			vmenu_id = current_menu
			text_id = <resolved_id>
			net_pref_name = game_modes
		}
		ResolveScreenElementId id = {<matchmaking_vmenu_id> child = game_mode}
		<resolved_id> :SE_SetProps {
			<focusable>
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose online_lobby_pad_choose_wrapper params = {pad_choose_script = try_create_matchmaking_submenu <start_matchmaking_params> title = qs("GAME MODE")}}
			]
		}
		if GotParam \{focusable}
			if (<focusable> = not_focusable)
				ResolveScreenElementId id = [
					{id = <resolved_id>}
					{local_id = text}
				]
				<resolved_id> :SE_SetProps alpha = 0.5
			endif
		endif
		OnlineLobbyInterface :SE_SetProps {
			matchmaking_game_mode_text = <game_mode_text>
		}
		ResolveScreenElementId id = {<matchmaking_vmenu_id> child = friends}
		<resolved_id> :SE_SetProps {
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose net_wii_friends}
			]
		}
		ResolveScreenElementId id = {<matchmaking_vmenu_id> child = preferences}
		<resolved_id> :SE_SetProps {
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose online_lobby_pad_choose_wrapper params = {pad_choose_script = start_net_preferences}}
			]
		}
		ResolveScreenElementId id = {<matchmaking_vmenu_id> child = music_store}
		<resolved_id> :SE_SetProps {
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose net_DLC_menu}
			]
			tags = {
				msg_checksum = music_store
			}
		}
		ResolveScreenElementId id = {<matchmaking_vmenu_id> child = log_out}
		<resolved_id> :SE_SetProps {
			event_handlers = [
				{focus matchmaking_item_change_focus params = {focus}}
				{unfocus matchmaking_item_change_focus params = {unfocus}}
				{pad_choose ui_menu_select_sfx}
				{pad_choose log_out_of_dwc params = {device_num = <device_num>}}
			]
			tags = {
				msg_checksum = log_out
			}
		}
		<Menu_items> = 0
		GetScreenElementChildren id = <matchmaking_vmenu_id>
		GetArraySize <children>
		j = 0
		begin
		if NOT (<children> [<j>]) :GetSingleTag tag_not_focusable
			<Menu_items> = (<Menu_items> + 1)
		endif
		j = (<j> + 1)
		repeat <array_size>
		OnlineLobbyInterface :SetTags Menu_items = <Menu_items>
		if (1 = $GLOBAL_SHOULD_USE_NET_DEBUGGING)
			add_matchmaking_item {
				vmenu_id = <matchmaking_vmenu_id>
				msg_checksum = debug_create_match
				text = qs("DEBUG: CREATE MATCH")
				choose_script = net_quick_create
				<focusable>
			}
			add_matchmaking_item {
				vmenu_id = <matchmaking_vmenu_id>
				msg_checksum = debug_custom_search
				text = qs("DEBUG: CUSTOM SEARCH")
				choose_script = net_custom_search
				<focusable>
			}
		endif
	endif
endscript

script destroy_matchmaking_menu_and_items 
	if ScreenElementExists \{id = matchmaking_vscollingmenu}
		DestroyScreenElement \{id = matchmaking_vscollingmenu}
	endif
endscript

script net_up_down_action 
	RequireParams \{[
			device_num
		]
		all}
	printf qs(0x30bc7ac9) d = <device_num>
	is_controller_online controller_index = <device_num>
	printf qs(0x7f460d52) d = <online>
	if (<online> = 1)
		OnlineLobbyInterface :GetTags
		if NOT GotParam \{action}
			return
		endif
		if NOT ScreenElementExists \{id = current_menu}
			return
		endif
		if NOT ScreenElementExists id = <player_slots_menu_id>
			return
		endif
		generic_menu_up_or_down_sound <action>
		if (<locked_to_players> = 0)
			if IsScreenElementInFocus \{id = current_menu}
				if (<action> = up)
					if (<menu_index> = 0)
						OnlineLobbyInterface :SetTags menu_index = (<Menu_items> - 1)
					else
						OnlineLobbyInterface :SetTags menu_index = (<menu_index> - 1)
					endif
				elseif (<action> = down)
					if (<menu_index> = (<Menu_items> - 1))
						OnlineLobbyInterface :SetTags \{menu_index = 0}
					else
						OnlineLobbyInterface :SetTags menu_index = (<menu_index> + 1)
					endif
				endif
			elseif IsScreenElementInFocus id = <player_slots_menu_id>
				printf qs(0xd99e91f0) d = <slots_index> s = <slot_items>
				if (<action> = up)
					if (<slots_index> = 0)
						if (<Menu_items> > 0)
							LaunchEvent type = unfocus target = <player_slots_menu_id>
							online_lobby_setup_helper_controls
							LaunchEvent type = focus target = current_menu data = {child_index = (<Menu_items> - 1)}
							OnlineLobbyInterface :SetTags menu_index = (<Menu_items> - 1)
						else
							OnlineLobbyInterface :SetTags slots_index = (<slots_items> - 1)
						endif
					else
						OnlineLobbyInterface :SetTags slots_index = (<slots_index> - 1)
					endif
				elseif (<action> = down)
					if (<slots_index> = (<slot_items> - 1))
						if (<Menu_items> > 0)
							LaunchEvent type = unfocus target = <player_slots_menu_id>
							online_lobby_setup_helper_controls
							LaunchEvent \{type = focus
								target = current_menu
								data = {
									child_index = 0
								}}
							OnlineLobbyInterface :SetTags \{menu_index = 0}
						else
							OnlineLobbyInterface :SetTags slots_index = (<slots_items> - 1)
						endif
					else
						OnlineLobbyInterface :SetTags slots_index = (<slots_index> + 1)
					endif
				endif
			endif
		endif
	endif
endscript

script choose_first_viewable_mode 
	NetOptions :Pref_Get \{name = game_modes}
	is_gamemode_visible mode = <checksum>
	if (<item_is_visible>)
		return
	endif
	NetOptions :Pref_Size \{name = game_modes}
	i = 0
	begin
	NetOptions :Pref_Get name = game_modes index = <i>
	is_gamemode_visible mode = <checksum>
	if (<item_is_visible>)
		NetOptions :Pref_Choose name = game_modes index = <i>
		return
	endif
	<i> = (<i> + 1)
	repeat <size>
endscript

script is_gamemode_visible 
	<returnValue> = 0
	get_visible_game_modes
	if ArrayContains array = <modes> contains = <mode>
		<returnValue> = 1
	endif
	return item_is_visible = <returnValue>
endscript

script get_visible_game_modes 
	GetActiveControllers
	GetArraySize <active_controllers>
	controller_index = 0
	num_players = 0
	available_modes = []
	begin
	if (<active_controllers> [<controller_index>] = 1)
		if CheckForSignIn controller_index = <controller_index>
			num_players = (<num_players> + 1)
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_size>
	change num_local_players = <num_players>
	printf \{qs(0xcbebbfc5)}
	printf ($num_local_players)
	available_modes = [
		p2_pro_faceoff
		p4_pro_faceoff
		p2_faceoff
		p2_pro_faceoff
		p2_faceoff
		p2_battle
		p2_quickplay
		p4_quickplay
		p8_pro_faceoff
	]
	return modes = <available_modes>
endscript

script try_create_matchmaking_submenu 
	RequireParams \{[
			device_num
			title
		]
		all}
	if ScriptIsRunning \{create_matchmaking_submenu}
		return
	endif
	ui_menu_select_sfx
	create_matchmaking_submenu <...>
endscript

script create_matchmaking_submenu \{title = qs("NONE")}
	online_lobby_transition_out
	CreateScreenElement {
		type = DescInterface
		parent = OnlineLobbyInterface
		desc = 'online_lobby_left_side'
		pos = (0.0, -1000.0)
		id = OnlineSubMenuInterface
		exclusive_device = <device_num>
		tags = {
			menu_index = 0
			Menu_items = 0
			player_num = <info_index>
			exit_script = <exit_script>
			scrollbar_id = null
		}
	}
	OnlineSubMenuInterface :Desc_CheckVersion \{desired = 2
		AssertIf = Mismatch}
	<id> :SE_SetProps title_text = <title>
	left_side_id = <id>
	if OnlineSubMenuInterface :Desc_ResolveAlias \{name = alias_online_lobby_scrollbar
			param = scrollbar_id}
		OnlineSubMenuInterface :SetTags scrollbar_id = <scrollbar_id>
	endif
	if OnlineSubMenuInterface :Desc_ResolveAlias \{name = alias_left_side_vmenu}
		<resolved_id> :SE_SetProps {
			event_handlers = [
				{pad_back generic_menu_pad_back_sound}
				{pad_back destroy_matchmaking_submenu params = {container_id = OnlineSubMenuInterface vmenu_id = <subvmenu_id> parent_id = <vmenu_id>}}
				{pad_up generic_menu_up_or_down_sound}
				{pad_up online_lobby_submenu_up}
				{pad_down generic_menu_up_or_down_sound}
				{pad_down online_lobby_submenu_down}
			]
		}
		subvmenu_id = <resolved_id>
		NetOptions :Pref_GetStruct name = <net_pref_name>
		if GotParam \{pref_struct}
			<checksum> = (<pref_struct>.search_chk)
		endif
		<current_index> = 0
		NetOptions :Pref_Size name = <net_pref_name>
		i = 0
		<menu_index> = 0
		<item_is_visible> = 1
		begin
		NetOptions :Pref_GetStruct name = <net_pref_name> index = <i>
		if StructureContains Structure = <pref_struct> func
			(<pref_struct>.func) mode = (<pref_struct>.checksum)
		endif
		if (<item_is_visible>)
			if (<checksum> = <pref_struct>.search_chk)
				<current_index> = <menu_index>
			endif
			add_matchmaking_item {
				sub_menu_item
				slide_left
				vmenu_id = <subvmenu_id>
				text = (<pref_struct>.name)
				choose_script = select_submenu_item
				focus_script = matchmaking_submenu_item_change_focus
				choose_script_params = {
					net_pref_name = <net_pref_name>
					base_text = <base_text>
					text = (<pref_struct>.name)
					text_id = <text_id>
					index = <i>
					container_id = OnlineSubMenuInterface
					vmenu_id = <subvmenu_id>
					parent_id = <vmenu_id>
				}
			}
			if GotParam \{id}
				<id> :SetTags msg_checksum = (<pref_struct>.checksum)
			endif
			<menu_index> = (<menu_index> + 1)
		endif
		i = (<i> + 1)
		repeat <size>
		if ScreenElementExists id = <scrollbar_id>
			OnlineSubMenuInterface :GetTags
			scroll_increment = (175 / (<Menu_items> -1))
			<scrollbar_id> :SetTags scroll_increment = <scroll_increment>
			<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = ((0.0, 1.0) * (<scroll_increment> * <current_index>))
		endif
		OnlineSubMenuInterface :SetTags menu_index = <current_index>
		LaunchEvent type = unfocus target = <vmenu_id>
	endif
	clean_up_user_control_helpers
	menu_finish
	if GotParam \{title}
		switch <title>
			case qs("GAME MODE")
			SoundEvent \{event = Online_Panel_In}
		endswitch
	endif
	if GotParam \{subvmenu_id}
		<left_side_id> :Obj_SpawnScriptNow animate_left_side params = {id = <left_side_id> direction = in focus_id = <subvmenu_id> focus_index = <current_index>}
	else
		<left_side_id> :Obj_SpawnScriptNow animate_left_side params = {id = <left_side_id> direction = in}
	endif
endscript

script destroy_matchmaking_submenu 
	if NOT ((GotParam container_id) || (GotParam vmenu_id) || (GotParam parent_id))
		return
	endif
	if ScreenElementExists id = <vmenu_id>
		LaunchEvent type = unfocus target = <vmenu_id>
	endif
	if ScreenElementExists id = <container_id>
		animate_left_side id = <container_id> direction = out
		DestroyScreenElement id = <container_id>
		online_lobby_transition_in
	endif
	if ScreenElementExists id = <parent_id>
		LaunchEvent type = focus target = <parent_id>
	endif
endscript

script select_submenu_item 
	if GotParam \{text_id}
		if ScreenElementExists id = <text_id>
			FormatText TextName = new_string qs("%s%d") s = <base_text> d = <text>
			SetScreenElementProps id = <text_id> text = <new_string>
			NetOptions :Pref_Choose name = <net_pref_name> index = <index>
		endif
	endif
	destroy_matchmaking_submenu container_id = <container_id> vmenu_id = <vmenu_id> parent_id = <parent_id>
endscript

script online_lobby_submenu_up 
	if ScreenElementExists \{id = OnlineSubMenuInterface}
		OnlineSubMenuInterface :GetTags
		if (<menu_index> = 0)
			OnlineSubMenuInterface :SetTags menu_index = (<Menu_items> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = (0.0, 175.0)
			endif
		else
			OnlineSubMenuInterface :SetTags menu_index = (<menu_index> - 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				pos = ((0.0, -1.0) * <scroll_increment>)
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = {<pos> relative}
			endif
		endif
	endif
endscript

script online_lobby_submenu_down 
	if ScreenElementExists \{id = OnlineSubMenuInterface}
		OnlineSubMenuInterface :GetTags
		if ((<menu_index> + 1) = <Menu_items>)
			OnlineSubMenuInterface :SetTags \{menu_index = 0}
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = (0.0, 0.0)
			endif
		else
			OnlineSubMenuInterface :SetTags menu_index = (<menu_index> + 1)
			if ScreenElementExists id = <scrollbar_id>
				<scrollbar_id> :GetTags
				pos = ((0.0, 1.0) * (<scroll_increment>))
				<scrollbar_id> :SE_SetProps scrollbar_thumb_pos = {<pos> relative}
			endif
		endif
	endif
endscript

script add_matchmaking_item \{focus_script = matchmaking_item_change_focus}
	if NOT GotParam \{vmenu_id}
		return
	endif
	if NOT GotParam \{text}
		text = qs("TEST")
	endif
	text_alpha = 1
	if GotParam \{not_focusable}
		focusable = not_focusable
		text_alpha = 0.5
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <vmenu_id>
		pos = (0.0, 0.0)
		dims = (256.0, 40.0)
		<focusable>
		event_handlers = [
			{focus <focus_script> params = {focus}}
			{unfocus <focus_script> params = {unfocus}}
		]
	}
	container_id = <id>
	if GotParam \{msg_checksum}
		<container_id> :SetTags msg_checksum = <msg_checksum>
	endif
	if GotParam \{choose_script}
		SetScreenElementProps {
			id = <container_id>
			event_handlers = [
				{pad_choose ui_menu_select_sfx}
				{pad_choose <choose_script> params = <choose_script_params>}
			]
		}
	endif
	if GotParam \{sub_menu_item}
		width = 285
		if ScreenElementExists \{id = OnlineSubMenuInterface}
			OnlineSubMenuInterface :GetTags
			OnlineSubMenuInterface :SetTags Menu_items = (<Menu_items> + 1)
		endif
	else
		if NOT GotParam \{not_focusable}
			OnlineLobbyInterface :GetTags
			OnlineLobbyInterface :SetTags Menu_items = (<Menu_items> + 1)
		endif
		width = 285
	endif
	GetScreenElementZPriority id = <container_id>
	<text_pos> = (10.0, 0.0)
	if GotParam \{slide_left}
		<text_pos> = (0.0, 0.0)
	endif
	if GotParam \{text_id}
		CreateScreenElement {
			type = TextBlockElement
			parent = <container_id>
			id = <text_id>
			local_id = text
			font = fontgrid_text_a6
			rgba = ($online_lobby_item_text_color)
			pos = <text_pos>
			alpha = <text_alpha>
			dims = (325.0, 42.0)
			text = <text>
			just = [left top]
			z_priority = (<z_priority> + 1.5)
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = `per axis`
		}
	else
		CreateScreenElement {
			type = TextBlockElement
			parent = <container_id>
			local_id = text
			font = fontgrid_text_a6
			rgba = ($online_lobby_item_text_color)
			pos = <text_pos>
			alpha = <text_alpha>
			dims = (325.0, 42.0)
			text = <text>
			just = [left top]
			z_priority = (<z_priority> + 1.5)
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = `per axis`
		}
	endif
	return id = <container_id>
endscript

script matchmaking_item_change_focus 
	Obj_GetID
	<ObjID> :GetTags
	ResolveScreenElementId id = [
		{id = <ObjID>}
		{local_id = text}
	]
	if GotParam \{focus}
		if GotParam \{msg_checksum}
			set_net_dialog_message msg_checksum = <msg_checksum>
		endif
		retail_menu_focus id = <resolved_id>
	elseif GotParam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script set_net_dialog_message 
	if NOT GotParam \{msg_checksum}
		return
	endif
	if isXenon
		plat_helper_strings = net_helper_text_strings_xen
	elseif IsNgc
		plat_helper_strings = net_helper_text_strings_wii
	else
		plat_helper_strings = net_helper_text_strings_ps3
	endif
	AppendSuffixToChecksum Base = <msg_checksum> SuffixString = '_text'
	if StructureContains Structure = ($<plat_helper_strings>) <appended_id>
		if ScreenElementExists \{id = OnlineLobbyInterface}
			OnlineLobbyInterface :SE_SetProps matchmaking_info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif StructureContains Structure = ($net_helper_text_strings) <appended_id>
		if ScreenElementExists \{id = OnlineLobbyInterface}
			OnlineLobbyInterface :SE_SetProps matchmaking_info_text = ($net_helper_text_strings.<appended_id>)
		endif
	endif
endscript

script matchmaking_submenu_item_change_focus 
	Obj_GetID
	<ObjID> :GetTags
	ResolveScreenElementId id = [
		{id = <ObjID>}
		{local_id = text}
	]
	if GotParam \{focus}
		if GotParam \{msg_checksum}
			set_submenu_helper_text msg_checksum = <msg_checksum>
		endif
		retail_menu_focus id = <resolved_id>
	elseif GotParam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script set_submenu_helper_text 
	if NOT GotParam \{msg_checksum}
		return
	endif
	if isXenon
		plat_helper_strings = net_helper_text_strings_xen
	elseif IsNgc
		plat_helper_strings = net_helper_text_strings_wii
	else
		plat_helper_strings = net_helper_text_strings_ps3
	endif
	AppendSuffixToChecksum Base = <msg_checksum> SuffixString = '_text'
	if StructureContains Structure = ($<plat_helper_strings>) <appended_id>
		if ScreenElementExists \{id = OnlineSubMenuInterface}
			OnlineSubMenuInterface :SE_SetProps info_text = ($<plat_helper_strings>.<appended_id>)
		endif
	elseif StructureContains Structure = ($net_helper_text_strings) <appended_id>
		if ScreenElementExists \{id = OnlineSubMenuInterface}
			OnlineSubMenuInterface :SE_SetProps info_text = ($net_helper_text_strings.<appended_id>)
		endif
	endif
endscript

script create_player_slots_container 
	if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_player_slots_vmenu}
		<player_slots_menu_id> = <resolved_id>
		OnlineLobbyInterface :SetTags player_slots_menu_id = <player_slots_menu_id>
		<player_slots_menu_id> :SE_SetProps {
			not_focusable
			event_handlers = [
				{pad_back leave_net_main_menu params = {id = <player_slots_menu_id>}}
				{pad_up net_up_down_action params = {action = up}}
				{pad_down net_up_down_action params = {action = down}}
				{pad_l1 toggle_guitar_part}
			]
		}
		<player_slots_menu_id> :SetTags {
			num_players_in_session = 0
			safe_to_refresh_player_slots = 1
			all_players_checksum = [
				empty
				empty
				empty
				empty
				empty
				empty
				empty
				empty
			]
			local_controllers = [
				unplugged
				unplugged
				unplugged
				unplugged
				unplugged
				unplugged
				unplugged
			]
		}
		<player_slots_menu_id> :Obj_SpawnScriptLater update_player_slots_ui
	endif
endscript

script create_player_slots_ui 
	OnlineLobbyInterface :GetTags
	<player_slots_menu_id> :GetTags
	GetArraySize \{all_players_checksum}
	count = 0
	begin
	if (<all_players_checksum> [<count>] = local_signed_in)
		add_player_slot_to_menu index = <count> player_type = local
	elseif (<all_players_checksum> [<count>] = remote)
		add_player_slot_to_menu index = <count> player_type = remote
	elseif (<all_players_checksum> [<count>] = local_not_signed_in)
		get_ui_slot_corresponding_controller target_ui_slot = <count>
		add_player_slot_to_menu index = <count> player_type = not_signed_in controller = <controller>
	endif
	count = (<count> + 1)
	repeat <array_size>
endscript

script destroy_player_slots_ui 
	OnlineLobbyInterface :GetTags
	if ScreenElementExists id = <player_slots_menu_id>
		DestroyScreenElement id = <player_slots_menu_id> preserve_parent
	endif
	OnlineLobbyInterface :SetTags \{slot_items = 0}
endscript

script refresh_player_slots_ui 
	printscriptinfo \{qs("---refresh_player_slots_ui")}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :GetTags
		begin
		<player_slots_menu_id> :GetTags
		if (<safe_to_refresh_player_slots> = 1)
			break
		endif
		Wait \{1
			frame}
		repeat
		<player_slots_menu_id> :SetTags safe_to_refresh_player_slots = 0
		OnlineLobbyInterface :GetTags
		if IsScreenElementInFocus id = <player_slots_menu_id>
			LaunchEvent type = unfocus target = <player_slots_menu_id>
			target_slots_index = <slots_index>
		endif
		destroy_player_slots_ui
		create_player_slots_ui
		if isXenon
			update_signed_in_controllers
		endif
		if GotParam \{target_slots_index}
			OnlineLobbyInterface :GetTags
			if (<slot_items> = 0)
				OnlineLobbyInterface :SetTags \{menu_index = 0}
				LaunchEvent \{type = focus
					target = current_menu
					data = {
						child_index = 0
					}}
			else
				if ((<target_slots_index> + 1) > <slot_items>)
					OnlineLobbyInterface :SetTags \{slots_index = 0}
					LaunchEvent type = focus target = <player_slots_menu_id> data = {child_index = 0}
				else
					OnlineLobbyInterface :SetTags slots_index = <target_slots_index>
					LaunchEvent type = focus target = <player_slots_menu_id> data = {child_index = <target_slots_index>}
				endif
			endif
		endif
		<player_slots_menu_id> :SetTags safe_to_refresh_player_slots = 1
	endif
endscript

script player_slot_change_focus 
	Obj_GetID
	<ObjID> :GetTags
	ResolveScreenElementId id = [
		{id = <ObjID>}
		{local_id = online_player_slots_item}
		{local_id = player_slot_name}
	]
	if GotParam \{focus}
		if GotParam \{msg_checksum}
			set_net_dialog_message msg_checksum = <msg_checksum>
		endif
		if GotParam \{view_gamer_card}
			online_lobby_setup_helper_controls menu_type = right_hand gamer_card = <view_gamer_card>
		endif
		retail_menu_focus id = <resolved_id>
	elseif GotParam \{unfocus}
		retail_menu_unfocus id = <resolved_id>
	endif
endscript

script add_player_slot_to_menu 
	keep_sign_in_button = 0
	cash_icon_alpha = 0
	cash_icon_id = cash_milestone_icon_002
	cash_text = qs("")
	if (<player_type> = not_signed_in)
		name = qs("TO SIGN IN")
		get_controller_type controller_index = <controller>
		FormatText checksumname = controller_texture 'Logo_%d_GrayScale' d = ($Controller_Lookup_Table.<controller_type>)
		<keep_sign_in_button> = 1
		<cash_text> = qs("")
	elseif (<player_type> = local || <player_type> = remote)
		FormatText checksumname = gamertag 'gamertag_%d' d = <index>
		FormatText checksumname = player_status 'player%d_status' d = (<index> + 1)
		xuid = [0 0]
		SetArrayElement ArrayName = xuid index = 0 newvalue = ($<player_status>.net_id_first)
		SetArrayElement ArrayName = xuid index = 1 newvalue = ($<player_status>.net_id_second)
		sign_in_button_alpha = 0
		if (<player_type> = remote)
			name = $<gamertag>
			FormatText checksumname = controller_texture 'Logo_%d_GrayScale' d = ($Controller_Lookup_Table.($<player_status>.part))
			cash_get_info_from_earnings earnings = (($<player_status>.career_earnings))
			FormatText TextName = cash_text qs("\L%d") d = <rank>
			<cash_icon_alpha> = 1
		else
			if NOT NetSessionFunc func = IsControllerInGame params = {controller = ($<player_status>.controller)}
				name = qs("TO JOIN GAME")
				<keep_sign_in_button> = 1
			else
				NetSessionFunc obj = match func = get_gamertag params = {controller = ($<player_status>.controller)}
				change globalname = <gamertag> newvalue = <name>
				cash_ranks_get_icon_id player = (<index> + 1)
				cash_ranks_get_rank player = (<index> + 1)
				FormatText TextName = cash_text qs("\L%d") d = <rank>
				<cash_icon_alpha> = 1
				<keep_sign_in_button> = 0
			endif
			if ($net_starting_matchmaking = 0)
				get_controller_type controller_index = ($<player_status>.controller)
				FormatText checksumname = controller_texture 'Logo_%d_GrayScale' d = ($Controller_Lookup_Table.<controller_type>)
				if (<controller_type> = guitar)
					FormatText checksumname = controller_texture 'Logo_%d_GrayScale' d = ($Controller_Lookup_Table.($<player_status>.part))
				endif
			else
				FormatText checksumname = controller_texture 'Logo_%d_GrayScale' d = ($Controller_Lookup_Table.($<player_status>.part))
			endif
		endif
	endif
	<view_gamer_card> = 0
	if isXenon
		if GotParam \{xuid}
			if (<keep_sign_in_button> = 0)
				<view_gamer_card> = 1
			endif
		endif
	endif
	OnlineLobbyInterface :GetTags
	CreateScreenElement {
		type = DescInterface
		desc = 'online_lobby_player_slot_item'
		parent = <player_slots_menu_id>
		auto_dims = false
		dims = (450.0, 50.0)
		not_focusable
		event_handlers = [
			{focus player_slot_change_focus params = {focus view_gamer_card = <view_gamer_card>}}
			{unfocus player_slot_change_focus params = {unfocus}}
		]
	}
	<id> :Desc_CheckVersion desired = 2 AssertIf = Mismatch
	<id> :SE_SetProps {
		player_slot_name_text = <name>
		player_instrument_logo_texture = <controller_texture>
		player_slot_bg_rgba = ($online_player_slot_bg_gray)
		cash_icon_texture = <cash_icon_id>
		cash_rank_text = <cash_text>
		cash_icon_alpha = <cash_icon_alpha>
	}
	if (<keep_sign_in_button> = 0)
		if <id> :Desc_ResolveAlias name = alias_sign_in_button param = signin_id
			<signin_id> :Die
		endif
		if isXenon
			FormatText checksumname = player_status 'player%d_status' d = (<index> + 1)
			if (<player_type> = remote)
				<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
			elseif NOT NetSessionFunc func = XenonIsGuest params = {controller_index = ($<player_status>.controller)}
				<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
			endif
		endif
	else
		if (<player_type> = not_signed_in)
			get_controller_type controller_index = <controller>
			if ((<controller_type> = controller) || (<controller_type> = Vocals))
				if <id> :Desc_ResolveAlias name = alias_sign_in_button param = signin_id
					<signin_id> :SE_SetProps text = qs("\L\bi")
				endif
			else
				if <id> :Desc_ResolveAlias name = alias_sign_in_button param = signin_id
					<signin_id> :SE_SetProps text = qs("\L\b7")
				endif
			endif
		endif
	endif
	if isXenon
		if GotParam \{xuid}
			if (<keep_sign_in_button> = 0)
				<id> :SE_SetProps event_handlers = [{pad_choose ui_menu_select_sfx}
					{pad_choose menu_show_gamercard_from_netid params = {net_id = <xuid>}}
				]
			endif
		endif
		if (<player_type> = not_signed_in)
			<id> :SetTags msg_checksum = sign_in
		elseif (<player_type> = remote)
			<id> :SetTags msg_checksum = gamer_card
		elseif NetSessionFunc func = IsControllerInGame params = {controller = <controller>}
			<id> :SetTags msg_checksum = gamer_card
		else
			<id> :SetTags msg_checksum = Blank
		endif
	endif
	OnlineLobbyInterface :GetTags
	OnlineLobbyInterface :SetTags slot_items = (<slot_items> + 1)
endscript

script update_headset_status 
	headset_icon_alpha = 0
	has_headset = 0
	is_talking = 0
	begin
	<has_headset> = 0
	<is_talking> = 0
	if (NetSessionFunc obj = voice func = hasheadset params = {player_xuid = <uid>})
		<has_headset> = 1
	endif
	if (<has_headset> = 1)
		if (NetSessionFunc obj = voice func = IsTalking params = {player_xuid = <uid>})
			<is_talking> = 1
		endif
		if (<is_talking> = 1)
			headset_icon_alpha = 1.0
		else
			headset_icon_alpha = 0.5
		endif
	else
		headset_icon_alpha = 0
	endif
	if ScreenElementExists id = <obj_id>
		<obj_id> :SE_SetProps headset_icon_alpha = <headset_icon_alpha>
	endif
	Wait \{1.0
		second}
	repeat
endscript

script update_player_slots_ui 
	begin
	get_active_local_controllers
	get_signin_status_local_controllers
	get_controller_type_local_controllers
	Wait \{0.1
		seconds}
	repeat
endscript

script get_active_local_controllers 
	GetActiveControllers
	GetArraySize <active_controllers>
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		check_for_local_controller_change controller_index = <controller_index> state = active
		if (<change>)
			add_remove_player_to_net_ui action = Add index = <controller_index> player_type = local_not_signed_in
		endif
	endif
	if (<active_controllers> [<controller_index>] = 0)
		check_for_local_controller_change controller_index = <controller_index> state = inactive
		if CheckForSignIn controller_index = <controller_index>
			NetSessionFunc func = RemoveController params = {controller = <controller_index>}
		endif
		if (<change>)
			if NOT CheckForSignIn controller_index = <controller_index>
				get_controller_corresponding_ui_slot controller = <controller_index>
				add_remove_player_to_net_ui action = remove ui_slot = <ui_slot> index = <controller_index> player_type = local_not_signed_in
			endif
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_size>
endscript

script get_signin_status_local_controllers 
	if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_player_slots_vmenu}
		<resolved_id> :GetTags
		GetArraySize <local_controllers>
		controller_index = 0
		begin
		if NOT (<local_controllers> [<controller_index>] = unplugged)
			if CheckForSignIn controller_index = <controller_index>
				check_for_signin_signin_change controller_index = <controller_index> state = signed_in
				if (<change>)
					add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_signed_in
				endif
			else
				check_for_signin_signin_change controller_index = <controller_index> state = signed_out
				if (<change>)
					NetSessionFunc func = RemoveController params = {controller = <controller_index>}
					add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_not_signed_in
				endif
			endif
		endif
		controller_index = (<controller_index> + 1)
		repeat <array_size>
	endif
endscript

script get_controller_type_local_controllers 
	if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_player_slots_vmenu}
		<resolved_id> :GetTags
		GetArraySize <local_controllers>
		controller_index = 0
		begin
		if NOT (<local_controllers> [<controller_index>] = unplugged)
			if CheckForSignIn controller_index = <controller_index>
				check_for_controller_change controller_index = <controller_index>
				if (<change>)
					add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_signed_in
				endif
			else
				check_for_controller_change controller_index = <controller_index>
				if (<change>)
					NetSessionFunc func = RemoveController params = {controller = <controller_index>}
					add_remove_player_to_net_ui action = replace index = <controller_index> player_type = local_not_signed_in
				endif
			endif
		endif
		controller_index = (<controller_index> + 1)
		repeat <array_size>
	endif
endscript

script poll_for_controller_change_and_disconnect 
	begin
	if NOT NetSessionFunc \{obj = session
			func = is_matchmaking_active}
		printf \{qs("\LScript detected matchmaking finished!")}
		break
	endif
	if check_for_any_controller_change
		break
	endif
	Wait \{0.1
		second}
	repeat
	spawnscriptnow \{ensure_cancel_start_matchmaking}
endscript

script ensure_cancel_start_matchmaking 
	begin
	if NOT NetSessionFunc \{obj = session
			func = is_matchmaking_active}
		printf \{qs("\LScript detected matchmaking finished!")}
		break
	endif
	if ScriptIsRunning \{cancel_start_matchmaking}
		break
	endif
	if cancel_start_matchmaking \{auto_cancel}
		break
	endif
	Wait \{0.1
		seconds}
	repeat
endscript

script check_for_any_controller_change 
	if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_player_slots_vmenu}
		<resolved_id> :GetTags
		GetActiveControllers
		GetArraySize <local_controllers>
		controller_index = 0
		begin
		if NOT (<local_controllers> [<controller_index>] = unplugged)
			if CheckForSignIn controller_index = <controller_index>
				check_for_controller_change controller_index = <controller_index>
				if (<change> = 1)
					return \{true}
				endif
				if (<active_controllers> [<controller_index>] = 0)
					return \{true}
				endif
			endif
		endif
		controller_index = (<controller_index> + 1)
		repeat <array_size>
	endif
endscript

script is_net_player_in_struct 
	info_index = 1
	begin
	GetPlayerInfo <info_index> net_id_first
	GetPlayerInfo <info_index> net_id_second
	GetPlayerInfo <info_index> controller
	if ((<net_id_first> = <user_id_first>) && (<net_id_second> = <user_id_second>))
		if (<controller> = <controller_index>)
			return player_in_struct = 1 info_index = <info_index>
		endif
	endif
	info_index = (<info_index> + 1)
	repeat 8
	return \{player_in_struct = 0}
endscript

script restore_save_net_preferences 
	printf \{qs("\L--- restore_save_net_preferences")}
	RequireParams \{[
			controller_index
		]
		all}
	get_savegame_from_controller controller = <controller_index>
	found = 0
	index = 1
	begin
	GetPlayerInfo <index> is_local_client
	if (<is_local_client> = 1)
		GetPlayerInfo <index> controller
		if (<controller_index> = <controller>)
			load_settings = 0
			if isXenon
				<load_settings> = 1
			elseif (<controller_index> = $primary_controller)
				<load_settings> = 1
			endif
			if (<load_settings> = 1)
				GetGlobalTags savegame = <savegame> user_options param = lefty_flip_save
				GetGlobalTags savegame = <savegame> user_options param = vocals_highway_view_save
				SetPlayerInfo <index> vocals_highway_view = <vocals_highway_view_save>
				SetPlayerInfo <index> lefty_flip = <lefty_flip_save>
				SetPlayerInfo <index> lefthanded_gems = <lefty_flip_save>
				SetPlayerInfo <index> lefthanded_button_ups = <lefty_flip_save>
				SetPlayerInfo <index> lefthanded_button_ups_flip_save = <lefty_flip_save>
				SetPlayerInfo <index> lefthanded_gems_flip_save = <lefty_flip_save>
				SetPlayerInfo <index> difficulty = ($default_difficulty [<controller_index>])
			endif
			get_controller_part controller = <controller_index>
			get_last_band_character_recorded player = <index> part = <controller_part> no_band_leader_grab
			if (<character_id> = none)
				cas_get_random_preset_character savegame = <savegame> part = <controller_part>
			endif
			SetPlayerInfo <index> character_id = <character_id>
		endif
	endif
	index = (<index> + 1)
	repeat 8
endscript

script poll_party_object 
	NetSessionFunc \{obj = party
		func = get_party_members}
	GetArraySize <connections>
	<connections_size> = <array_size>
	if (<connections_size> > 0)
		<index> = 0
		begin
		if ((<connections> [<index>]).is_local = 0)
			is_net_player_in_struct {
				user_id_first = ((<connections> [<index>]).user_id [0])
				user_id_second = ((<connections> [<index>]).user_id [1])
				controller_index = ((<connections> [<index>]).controller_index)
			}
			if (<player_in_struct> = 0)
				printf \{qs("\LADD PLAYER FROM PARTY POLL")}
				NetSessionFunc \{obj = party
					func = get_shared_data}
				FormatText checksumname = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
				if StructureContains Structure = <party_shared_data> <player_data>
					part = ((<party_shared_data>.<player_data>).player_part)
					earnings = ((<party_shared_data>.<player_data>).player_career_earnings)
				else
					switch ((<connections> [<index>]).instrument)
						case eGUITAR
						part = guitar
						case eMICROPHONE
						part = Vocals
						case eDRUMS
						part = drum
						default
						part = guitar
					endswitch
					earnings = 0
				endif
				if ui_slots_are_full
					printf \{qs("\LMust remove a ui slot")}
					remove_locals_not_ingame \{one_player}
				endif
				add_remove_player_to_net_ui {
					action = Add
					index = ((<connections> [<index>]).controller_index)
					player_type = remote
					name = ((<connections> [<index>]).gamertag)
					net_id_first = ((<connections> [<index>]).user_id [0])
					net_id_second = ((<connections> [<index>]).user_id [1])
					controller_type = controller
					part = <part>
					career_earnings = <earnings>
					local_client = 0
					obj_id = -1
				}
			else
				NetSessionFunc \{obj = party
					func = get_shared_data}
				FormatText checksumname = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
				if StructureContains Structure = <party_shared_data> <player_data>
					GetPlayerInfo <info_index> part
					GetPlayerInfo <info_index> career_earnings
					if NOT (((<party_shared_data>.<player_data>).player_part = <part>))
						SetPlayerInfo <info_index> part = ((<party_shared_data>.<player_data>).player_part)
						SetPlayerInfo <info_index> career_earnings = ((<party_shared_data>.<player_data>).player_career_earnings)
						refresh_player_slots_ui
					elseif NOT (((<party_shared_data>.<player_data>).player_career_earnings = <career_earnings>))
						SetPlayerInfo <info_index> career_earnings = ((<party_shared_data>.<player_data>).player_career_earnings)
						refresh_player_slots_ui
					endif
				endif
			endif
		else
			is_net_player_in_struct {
				user_id_first = ((<connections> [<index>]).user_id [0])
				user_id_second = ((<connections> [<index>]).user_id [1])
				controller_index = ((<connections> [<index>]).controller_index)
			}
			if (<player_in_struct> = 1)
				GetPlayerInfo <info_index> controller
				if NetSessionFunc func = IsControllerInGame params = {controller = <controller>}
					NetSessionFunc \{obj = party
						func = get_shared_data}
					FormatText checksumname = player_data 'player_%d' d = ((<connections> [<index>]).party_id)
					if StructureContains Structure = <party_shared_data> <player_data>
						GetPlayerInfo <info_index> part
						if NOT (((<party_shared_data>.<player_data>).player_part = <part>))
							printf \{qs("\Lsomething is different update the party info")}
							get_savegame_from_controller controller = <controller>
							get_current_band_info
							GetGlobalTags <band_info> savegame = <savegame> param = career_earnings
							FormatText checksumname = player_info 'player_%d' d = ((<connections> [<index>]).party_id)
							FormatText checksumname = player_status 'player%d_status' d = <info_index>
							party_info = {}
							AppendStruct {
								struct = party_info
								field = <player_info>
								params = {
									player_part = ($<player_status>.part)
									player_career_earnings = <career_earnings>
								}
							}
							NetSessionFunc obj = party func = append_shared_data params = {data = <party_info>}
						endif
					else
						printf \{qs("\Lfirst time through update party info")}
						SetPlayerInfo <info_index> party_id = ((<connections> [<index>]).party_id)
						get_savegame_from_controller controller = <controller>
						get_current_band_info
						GetGlobalTags <band_info> savegame = <savegame> param = career_earnings
						FormatText checksumname = player_info 'player_%d' d = ((<connections> [<index>]).party_id)
						FormatText checksumname = player_status 'player%d_status' d = <info_index>
						party_info = {}
						AppendStruct {
							struct = party_info
							field = <player_info>
							params = {
								player_part = ($<player_status>.part)
								player_career_earnings = <career_earnings>
							}
						}
						NetSessionFunc obj = party func = append_shared_data params = {data = <party_info>}
						refresh_player_slots_ui
					endif
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat <connections_size>
	endif
	OnlineLobbyInterface :GetTags
	if ScreenElementExists id = <player_slots_menu_id>
		<player_slots_menu_id> :GetTags
		GetArraySize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = remote)
			if (<connections_size> > 0)
				<index> = 0
				<found> = 0
				begin
				if ((<connections> [<index>]).is_local = 0)
					GetPlayerInfo (<i> + 1) net_id_first
					GetPlayerInfo (<i> + 1) net_id_second
					if ((((<connections> [<index>]).user_id [0]) = <net_id_first>) &&
							(((<connections> [<index>]).user_id [1]) = <net_id_second>))
						<found> = 1
						break
					endif
				endif
				<index> = (<index> + 1)
				repeat <connections_size>
				if (<found> = 0)
					add_remove_player_to_net_ui {
						action = remove
						ui_slot = <i>
						player_type = remote
					}
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script check_for_local_controller_change \{controller_index = -1}
	if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_player_slots_vmenu}
		if (<controller_index> = -1)
			printf \{qs("\Ldidn't recieve a controller index")}
			return
		endif
		<resolved_id> :GetTags
		if (<state> = active)
			if (<local_controllers> [<controller_index>] = unplugged)
				return \{change = 1}
			else
				return \{change = 0}
			endif
		elseif (<state> = inactive)
			if NOT (<local_controllers> [<controller_index>] = unplugged)
				return \{change = 1}
			else
				return \{change = 0}
			endif
		endif
	endif
endscript

script check_for_signin_signin_change \{controller_index = -1}
	if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_player_slots_vmenu}
		if (<controller_index> = -1)
			printf \{qs("\Ldidn't recieve a controller index")}
			return
		endif
		<resolved_id> :GetTags
		get_controller_corresponding_ui_slot controller = <controller_index>
		if (<state> = signed_in)
			if (<all_players_checksum> [<ui_slot>] = local_not_signed_in)
				return \{change = 1}
			else
				return \{change = 0}
			endif
		elseif (<state> = signed_out)
			if (<all_players_checksum> [<ui_slot>] = local_signed_in)
				return \{change = 1}
			else
				return \{change = 0}
			endif
		endif
	endif
endscript

script check_for_controller_change \{controller_index = -1}
	if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_player_slots_vmenu}
		if (<controller_index> = -1)
			printf \{qs("\Ldidn't recieve a controller index")}
			return
		endif
		get_player_num_from_controller controller_index = <controller_index>
		get_controller_type controller_index = <controller_index>
		if (<player_num> > 0)
			GetPlayerInfo <player_num> part
			switch <controller_type>
				case guitar
				if NOT (<part> = Bass || <part> = guitar)
					SetPlayerInfo <player_num> part = guitar
					return \{change = 1}
				endif
				case drum
				if NOT (<part> = drum)
					SetPlayerInfo <player_num> part = drum
					return \{change = 1}
				endif
				case Vocals
				case controller
				if NOT (<part> = Vocals)
					SetPlayerInfo <player_num> part = Vocals
					return \{change = 1}
				endif
			endswitch
		endif
		return \{change = 0}
	endif
endscript

script add_remove_player_to_net_ui 
	if NOT ScreenElementExists \{id = OnlineLobbyInterface}
		return
	endif
	OnlineLobbyInterface :GetTags
	if ScreenElementExists id = <player_slots_menu_id>
		<player_slots_menu_id> :GetTags
		if (<action> = Add)
			printf qs("\LAdding player type - %d") d = <player_type>
			if (<player_type> = local_signed_in || <player_type> = remote)
				players_to_add = 1
			else
				players_to_add = 0
			endif
			get_next_available_slot slot_type = <player_type>
			if (<available_slot> = -1)
				printf \{qs("\LWe are out of SLOTS can't add this player")}
				return
			endif
			<player_slots_menu_id> :GetTags
			if (<player_type> = local_not_signed_in || <player_type> = local_signed_in)
				FormatText checksumname = controller_status 'plugged_in_%d' d = <available_slot>
				if (-1 != <index>)
					SetArrayElement ArrayName = local_controllers index = <index> newvalue = <controller_status>
				else
					printf \{qs("\LWe have a index of -1!")}
					printstruct <...>
					printscriptinfo \{qs("add_remove_player_to_net_ui")}
					return
				endif
			endif
			SetArrayElement ArrayName = all_players_checksum index = <available_slot> newvalue = <player_type>
			<player_slots_menu_id> :SetTags {
				all_players_checksum = <all_players_checksum>
				local_controllers = <local_controllers>
				num_players_in_session = (<num_players_in_session> + <players_to_add>)
			}
			if (<player_type> = local_signed_in || <player_type> = remote)
				add_player_to_player_status_structs <...>
			endif
		elseif (<action> = remove)
			printf qs("\LRemoving player type - %d") d = <player_type>
			if (<player_type> = local_signed_in || <player_type> = remote)
				players_to_remove = 1
			else
				players_to_remove = 0
			endif
			if (<player_type> = local_not_signed_in || <player_type> = local_signed_in)
				if (-1 != <index>)
					get_controller_corresponding_ui_slot controller = <index>
					SetArrayElement ArrayName = local_controllers index = <index> newvalue = unplugged
					SetArrayElement ArrayName = all_players_checksum index = <ui_slot> newvalue = empty
				else
					printf \{qs("\L!!!! index = -1!!!!")}
					printstruct <...>
					return
				endif
			else
				SetArrayElement ArrayName = all_players_checksum index = <ui_slot> newvalue = empty
			endif
			<player_slots_menu_id> :SetTags {
				all_players_checksum = <all_players_checksum>
				local_controllers = <local_controllers>
				num_players_in_session = (<num_players_in_session> - <players_to_remove>)
			}
			if NOT (<player_type> = remote)
				is_controller_online controller_index = <index>
				if (<online> = 1)
					NetSessionFunc func = RemoveController params = {controller = <index>}
				endif
			endif
			remove_player_from_player_status_structs index = <ui_slot>
		elseif (<action> = replace)
			printf qs("\LReplace player type - %d") d = <player_type>
			get_controller_corresponding_ui_slot controller = <index>
			SetArrayElement ArrayName = local_controllers index = <index> newvalue = unplugged
			SetArrayElement ArrayName = all_players_checksum index = <ui_slot> newvalue = empty
			<player_slots_menu_id> :SetTags {
				all_players_checksum = <all_players_checksum>
				local_controllers = <local_controllers>
			}
			add_remove_player_to_net_ui action = Add index = <index> player_type = <player_type>
			return
		endif
		refresh_player_slots_ui
	endif
endscript

script add_player_to_player_status_structs 
	FormatText checksumname = player_status 'player%d_status' d = (<available_slot> + 1)
	if (<player_type> = local_signed_in)
		NetSessionFunc obj = match func = get_gamertag params = {controller = <index>}
		GetNetID controller_index = <index>
		get_controller_type controller_index = <index>
		change structurename = <player_status> controller = <index>
		local_client = 1
		obj_id = -1
		get_savegame_from_controller controller = <index>
		get_current_band_info
		GetGlobalTags <band_info> savegame = <savegame> param = career_earnings
		if NOT GotParam \{part}
			part = <controller_type>
			if (<part> = guitar && ($<player_status>.part = Bass))
				<part> = Bass
			endif
			if (<part> = controller)
				<part> = Vocals
			endif
		endif
	elseif (<player_type> = remote)
		change structurename = <player_status> controller = <index>
		local_client = 0
	endif
	FormatText checksumname = gamertag 'gamertag_%d' d = <available_slot>
	change globalname = <gamertag> newvalue = <name>
	change structurename = <player_status> gamertag = <gamertag>
	change structurename = <player_status> net_id_first = <net_id_first>
	change structurename = <player_status> net_id_second = <net_id_second>
	change structurename = <player_status> controller_type = <controller_type>
	change structurename = <player_status> is_local_client = <local_client>
	change structurename = <player_status> net_obj_id = <obj_id>
	if GotParam \{part}
		change structurename = <player_status> part = <part>
	endif
	if GotParam \{career_earnings}
		change structurename = <player_status> career_earnings = <career_earnings>
	endif
endscript

script remove_player_from_player_status_structs 
	FormatText checksumname = player_status 'player%d_status' d = (<index> + 1)
	change structurename = <player_status> net_id_first = 0
	change structurename = <player_status> net_id_second = 0
	change structurename = <player_status> is_local_client = 0
	change structurename = <player_status> net_obj_id = -1
	change structurename = <player_status> career_earnings = 0
	change structurename = <player_status> lefty_flip = 0
endscript

script get_next_available_slot 
	OnlineLobbyInterface :GetTags
	<player_slots_menu_id> :GetTags
	slot = -1
	if (<slot_type> = local_not_signed_in)
		GetArraySize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = empty)
			<slot> = <i>
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	elseif (<slot_type> = remote)
		GetArraySize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = empty)
			<slot> = <i>
			break
		elseif (<all_players_checksum> [<i>] = local_not_signed_in)
			shift_player_slots starting_point = <i>
			<slot> = <i>
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	elseif (<slot_type> = local_signed_in)
		GetArraySize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = empty)
			<slot> = <i>
			break
		elseif (<all_players_checksum> [<i>] = remote)
			shift_player_slots starting_point = <i>
			<slot> = <i>
			break
		elseif (<all_players_checksum> [<i>] = local_not_signed_in)
			shift_player_slots starting_point = <i>
			<slot> = <i>
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return available_slot = <slot>
endscript

script shift_player_slots 
	OnlineLobbyInterface :GetTags
	<player_slots_menu_id> :GetTags
	GetArraySize \{all_players_checksum}
	i = <starting_point>
	shift_value_current = (<all_players_checksum> [<i>])
	shift_value_next = (<all_players_checksum> [(<i> + 1)])
	GetPlayerInfo (<i> + 1) net_id_first
	GetPlayerInfo (<i> + 1) net_id_second
	GetPlayerInfo (<i> + 1) controller
	GetPlayerInfo (<i> + 1) is_local_client
	GetPlayerInfo (<i> + 1) part
	GetPlayerInfo (<i> + 1) career_earnings
	GetPlayerInfo (<i> + 1) difficulty
	GetPlayerInfo (<i> + 1) lefty_flip
	GetPlayerInfo (<i> + 1) character_id
	GetPlayerInfo (<i> + 1) vocals_highway_view
	FormatText checksumname = gamertag 'gamertag_%d' d = (<i>)
	current_net_info = {
		net_id_first = <net_id_first>
		net_id_second = <net_id_second>
		gamertag = ($<gamertag>)
		controller = <controller>
		is_local = <is_local_client>
		part = <part>
		earnings = <career_earnings>
		difficulty = <difficulty>
		lefty_flip = <lefty_flip>
		character_id = <character_id>
		vocals_highway_view = <vocals_highway_view>
	}
	FormatText checksumname = gamertag 'gamertag_%d' d = (<i> + 1)
	GetPlayerInfo (<i> + 2) net_id_first
	GetPlayerInfo (<i> + 2) net_id_second
	GetPlayerInfo (<i> + 2) controller
	GetPlayerInfo (<i> + 2) is_local_client
	GetPlayerInfo (<i> + 2) part
	GetPlayerInfo (<i> + 2) career_earnings
	GetPlayerInfo (<i> + 2) difficulty
	GetPlayerInfo (<i> + 2) lefty_flip
	GetPlayerInfo (<i> + 2) character_id
	GetPlayerInfo (<i> + 2) vocals_highway_view
	next_net_info = {
		net_id_first = <net_id_first>
		net_id_second = <net_id_second>
		gamertag = ($<gamertag>)
		controller = <controller>
		is_local = <is_local_client>
		part = <part>
		earnings = <career_earnings>
		difficulty = <difficulty>
		lefty_flip = <lefty_flip>
		character_id = <character_id>
		vocals_highway_view = <vocals_highway_view>
	}
	get_ui_slot_corresponding_controller target_ui_slot = <i>
	if (<controller> = -1)
		controller_value = unplugged
	else
		controller_value = (<local_controllers> [<controller>])
	endif
	SetArrayElement ArrayName = all_players_checksum index = <i> newvalue = empty
	begin
	if NOT (<controller_value> = unplugged)
		FormatText checksumname = controller_status 'plugged_in_%d' d = (<i> + 1)
		SetArrayElement ArrayName = local_controllers index = <controller> newvalue = <controller_status>
	endif
	SetArrayElement ArrayName = all_players_checksum index = (<i> + 1) newvalue = <shift_value_current>
	copy_net_info_into_struct destination_index = (<i> + 2) info = <current_net_info>
	if ((<i> + 2) = <array_size>)
		break
	endif
	current_net_info = {
		net_id_first = (<next_net_info>.net_id_first)
		net_id_second = (<next_net_info>.net_id_second)
		gamertag = (<next_net_info>.gamertag)
		controller = (<next_net_info>.controller)
		is_local = (<next_net_info>.is_local)
		part = (<next_net_info>.part)
		earnings = (<next_net_info>.earnings)
		difficulty = (<next_net_info>.difficulty)
		lefty_flip = (<next_net_info>.lefty_flip)
		character_id = (<next_net_info>.character_id)
		vocals_highway_view = (<next_net_info>.vocals_highway_view)
	}
	GetPlayerInfo (<i> + 3) net_id_first
	GetPlayerInfo (<i> + 3) net_id_second
	GetPlayerInfo (<i> + 3) controller
	GetPlayerInfo (<i> + 3) is_local_client
	GetPlayerInfo (<i> + 3) part
	GetPlayerInfo (<i> + 3) career_earnings
	GetPlayerInfo (<i> + 3) difficulty
	GetPlayerInfo (<i> + 3) lefty_flip
	GetPlayerInfo (<i> + 3) character_id
	GetPlayerInfo (<i> + 3) vocals_highway_view
	FormatText checksumname = gamertag 'gamertag_%d' d = (<i> + 2)
	next_net_info = {
		net_id_first = <net_id_first>
		net_id_second = <net_id_second>
		gamertag = ($<gamertag>)
		controller = <controller>
		is_local = <is_local_client>
		part = <part>
		earnings = <career_earnings>
		difficulty = <difficulty>
		lefty_flip = <lefty_flip>
		character_id = <character_id>
		vocals_highway_view = <vocals_highway_view>
	}
	shift_value_current = <shift_value_next>
	shift_value_next = (<all_players_checksum> [(<i> + 2)])
	get_ui_slot_corresponding_controller target_ui_slot = (<i> + 1)
	if (<controller> = -1)
		controller_value = unplugged
	else
		controller_value = (<local_controllers> [<controller>])
	endif
	i = (<i> + 1)
	repeat <array_size>
	<player_slots_menu_id> :SetTags all_players_checksum = <all_players_checksum> local_controllers = <local_controllers>
endscript

script copy_net_info_into_struct 
	SetPlayerInfo <destination_index> net_id_first = (<info>.net_id_first)
	SetPlayerInfo <destination_index> net_id_second = (<info>.net_id_second)
	SetPlayerInfo <destination_index> controller = (<info>.controller)
	SetPlayerInfo <destination_index> is_local_client = (<info>.is_local)
	SetPlayerInfo <destination_index> part = (<info>.part)
	SetPlayerInfo <destination_index> career_earnings = (<info>.earnings)
	SetPlayerInfo <destination_index> difficulty = (<info>.difficulty)
	SetPlayerInfo <destination_index> lefty_flip = (<info>.lefty_flip)
	SetPlayerInfo <destination_index> lefthanded_gems = (<info>.lefty_flip)
	SetPlayerInfo <destination_index> lefthanded_button_ups = (<info>.lefty_flip)
	SetPlayerInfo <destination_index> lefthanded_button_ups_flip_save = (<info>.lefty_flip)
	SetPlayerInfo <destination_index> lefthanded_gems_flip_save = (<info>.lefty_flip)
	SetPlayerInfo <destination_index> character_id = (<info>.character_id)
	SetPlayerInfo <destination_index> vocals_highway_view = (<info>.vocals_highway_view)
	FormatText checksumname = gamertag 'gamertag_%d' d = (<destination_index> -1)
	change globalname = <gamertag> newvalue = (<info>.gamertag)
	MonitorControllerStates
endscript

script get_controller_corresponding_ui_slot 
	OnlineLobbyInterface :GetTags
	<player_slots_menu_id> :GetTags
	switch (<local_controllers> [<controller>])
		case plugged_in_0
		return \{ui_slot = 0}
		case plugged_in_1
		return \{ui_slot = 1}
		case plugged_in_2
		return \{ui_slot = 2}
		case plugged_in_3
		return \{ui_slot = 3}
		case plugged_in_4
		return \{ui_slot = 4}
		case plugged_in_5
		return \{ui_slot = 5}
		case plugged_in_6
		return \{ui_slot = 6}
		case plugged_in_7
		return \{ui_slot = 7}
		default
		return \{ui_slot = -1}
	endswitch
endscript

script get_ui_slot_corresponding_controller 
	OnlineLobbyInterface :GetTags
	<player_slots_menu_id> :GetTags
	GetArraySize \{local_controllers}
	controller = 0
	begin
	get_controller_corresponding_ui_slot controller = <controller>
	printf qs(0xd99ce6fd) d = <controller> e = <ui_slot> f = <target_ui_slot>
	if (<ui_slot> = <target_ui_slot>)
		return controller = <controller>
	endif
	controller = (<controller> + 1)
	repeat <array_size>
	return \{controller = -1}
endscript

script leave_net_main_menu 
	RequireParams \{[
			device_num
		]
		all}
	generic_event_back \{state = UIstate_mainmenu}
	change \{is_network_game = 0}
endscript

script refresh_online_lobby 
	Wait \{10
		gameframes}
	printf \{qs("\LCalling menu_refresh")}
	ui_event_wait \{event = menu_refresh}
endscript

script matchmaking_SD_eject_spawned 
	begin
	if cancel_start_matchmaking
		WaitOneGameFrame
		FormatText TextName = errorText qs(0x22ed234f) s = ($wii_RA_message_SD_Card_Removed)
		create_new_generic_popup {
			popup_type = error_menu
			text = <errorText>
			error_func = destroy_generic_popup
		}
		return
	endif
	WaitOneGameFrame
	repeat
endscript

script poll_matchmaking_for_SD_eject 
	begin
	if CNTSDPeekCardWasEjected
		spawnscriptnow \{matchmaking_SD_eject_spawned}
		return
	endif
	WaitOneGameFrame
	repeat
endscript

script get_net_loading_globe_pos 
	GetDisplaySettings
	if (<widescreen> = false)
		globe_pos = (935.0, 600.0)
	else
		globe_pos = (960.0, 600.0)
	endif
	return globe_pos = <globe_pos>
endscript

script create_start_matchmaking_container \{friends = none
		action = HOST}
	destroy_popup_warning_menu
	if NOT (<friends> = none)
		if (<friends> = HOST)
			if GotParam \{friend_name}
				FormatText TextName = text $wii_invite_host_waiting_name s = <friend_name>
			else
				text = $wii_invite_host_waiting
			endif
		else
			if GotParam \{friend_name}
				FormatText TextName = text $wii_invite_client_waiting_name s = <friend_name>
			else
				text = $wii_invite_client_waiting
			endif
		endif
		create_popup_warning_menu {
			title = $wii_waiting_heading_friends
			textblock = {
				text = <text>
			}
			parent = OnlineLobbyInterface
			no_background
			options = [
				{
					func = cancel_start_matchmaking
					func_params = {friends}
					text = qs("CANCEL")
				}
			]
		}
	else
		create_popup_warning_menu \{title = qs("SEARCHING")
			textblock = {
				text = qs("")
			}
			parent = OnlineLobbyInterface
			no_background
			options = [
				{
					func = cancel_start_matchmaking
					text = qs("CANCEL")
				}
			]}
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
	if (<action> = HOST)
		<rgba> = [129 160 224 255]
	else
		<rgba> = [255 255 255 255]
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = PopupElement
		texture = online_load_wheel
		rgba = <rgba>
		pos = <globe_pos>
		dims = (128.0, 128.0)
		just = [center center]
		z_priority = 521
		no_squishy = true
	}
	PopupElement :Obj_SpawnScriptNow animate_online_icon params = {id = <id>}
	if (<friends> = none)
		PopupElement :Obj_SpawnScriptNow \{update_players_found}
	endif
	if (($SD_SongStruct_Valid) = 1)
		RunScriptOnScreenElement \{id = PopupElement
			poll_matchmaking_for_SD_eject}
	endif
endscript
last_cancel_matchmaking_time = 0

script cancel_start_matchmaking 
	if NOT IsDwcInPotentiallyBlockingCall
		if NOT GotParam \{from_invalid}
			if ScriptIsRunning \{check_invite_valid}
				KillSpawnedScript \{name = check_invite_valid}
			endif
		endif
		if GotParam \{friends}
			GetStartTime
			change last_cancel_matchmaking_time = <StartTime>
		endif
		NetSessionFunc \{obj = match
			func = cancel_join_server}
		NetSessionFunc \{obj = session
			func = get_matchmaking_status}
		if (<state> = eSEARCHING)
			cancel_join_server
			printf \{qs(0xcd8bb11c)}
		else
			quit_network_game
			printf \{qs(0xbff4520f)}
		endif
		change \{net_new_matchmaking_ui_flag = 0}
		OnlineLobbyInterface :GetTags
		<player_slots_menu_id> :Obj_SpawnScriptLater update_player_slots_ui
		<player_slots_menu_id> :Obj_KillSpawnedScript name = poll_for_controller_change_and_disconnect
		destroy_searching_ui
		online_lobby_setup_helper_controls
		LaunchEvent \{type = focus
			target = current_menu}
		return \{true}
	else
		stars
		printf \{qs(0xdeef6891)}
		stars
		spawnscriptnow \{open_net_problems_icon}
		return \{false}
	endif
endscript

script destroy_searching_ui 
	destroy_popup_warning_menu
	set_focus_color rgba = ($online_lobby_item_text_color_focus)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
endscript

script update_players_found 
	<time_waited> = 0
	message = qs("Searching for players...")
	if ScreenElementExists \{id = PopupElement}
		PopupElement :SetProps {
			PopupBody_text = <message>
		}
	endif
	begin
	if NOT IsDwcInPotentiallyBlockingCall
		if (<time_waited> >= 120)
			create_confirm_search_again
			break
		endif
	endif
	Wait \{1.0
		seconds}
	<time_waited> = (<time_waited> + 1.0)
	repeat
endscript

script create_confirm_search_again 
	destroy_searching_ui
	create_popup_warning_menu \{title = qs("UPDATE")
		textblock = {
			text = qs("There are currently no games available that match your search criteria.")
		}
		parent = current_menu
		no_background
		options = [
			{
				func = continue_matchmaking_search
				text = qs("CONTINUE")
			}
			{
				func = cancel_start_matchmaking
				text = qs("CANCEL SEARCH")
			}
		]}
	if (($SD_SongStruct_Valid) = 1)
		RunScriptOnScreenElement \{id = PopupElement
			poll_matchmaking_for_SD_eject}
	endif
endscript

script continue_matchmaking_search 
	destroy_popup_warning_menu
	create_start_matchmaking_container
endscript

script create_signin_container 
	if NetSessionFunc \{obj = party
			func = is_host}
		CreateScreenElement \{type = ContainerElement
			parent = OnlineLobbyInterface
			id = online_lobby_signin_container
			event_handlers = [
				{
					pad_choose
					signin_or_join_game
				}
			]}
		if isXenon
			update_signed_in_controllers
		endif
		LaunchEvent \{type = focus
			target = online_lobby_signin_container}
	endif
endscript

script update_signed_in_controllers 
	printf \{qs("\L---update_signed_in_controllers")}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		if ScreenElementExists \{id = online_lobby_signin_container}
			non_signed_in_controllers = []
			signed_in_controllers = []
			GetActiveControllers
			GetArraySize <active_controllers>
			i = 0
			begin
			if (<active_controllers> [<i>] = 1)
				if NOT CheckForSignIn controller_index = <i> dont_set_primary
					AddArrayElement array = <non_signed_in_controllers> element = <i>
					<non_signed_in_controllers> = <array>
				elseif NOT NetSessionFunc func = IsControllerInGame params = {controller = <i>}
					AddArrayElement array = <non_signed_in_controllers> element = <i>
					<non_signed_in_controllers> = <array>
				else
					AddArrayElement array = <signed_in_controllers> element = <i>
					<signed_in_controllers> = <array>
				endif
			else
				AddArrayElement array = <non_signed_in_controllers> element = <i>
				<non_signed_in_controllers> = <array>
			endif
			<i> = (<i> + 1)
			repeat <array_size>
			AddArrayElement array = <non_signed_in_controllers> element = <i>
			<non_signed_in_controllers> = <array>
			online_lobby_signin_container :SE_SetProps {exclusive_device = <non_signed_in_controllers>}
			GetArraySize <non_signed_in_controllers>
		endif
		if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_matchmaking_vmenu}
			<resolved_id> :SE_SetProps {exclusive_device = <signed_in_controllers>}
		endif
		if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_player_slots_vmenu}
			<resolved_id> :SE_SetProps {exclusive_device = <signed_in_controllers>}
		endif
	endif
endscript

script signin_or_join_game 
	RequireParams \{[
			device_num
		]
		all}
	if NetSessionFunc \{obj = party
			func = is_host}
		if ($net_starting_matchmaking = 0)
			change \{net_block_matchmaking = 1}
			if NOT (party_is_full)
				if isXenon
					if NOT CheckForSignIn controller_index = <device_num> dont_set_primary
						generic_menu_pad_choose_sound
						if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_player_slots_vmenu
								param = player_slots_menu}
							<player_slots_menu> :Obj_KillSpawnedScript name = update_player_slots_ui
						endif
						if CheckForSignIn local controller controller_index = <device_num>
							NetSessionFunc \{func = showsigninui
								params = {
									convert_offline_to_guest
								}}
						else
							NetSessionFunc \{func = ShowSignInUI4Pane
								params = {
									online_only
								}}
						endif
						wait_for_blade_complete
						Wait \{1.0
							seconds}
						if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_player_slots_vmenu
								param = player_slots_menu}
							<player_slots_menu> :Obj_SpawnScriptNow update_player_slots_ui
						endif
					else
						generic_menu_pad_choose_sound
						if can_add_vocals_player device_num = <device_num>
							NetSessionFunc func = AddControllers params = {controller = <device_num>}
							if NOT NetSessionFunc func = XenonIsGuest params = {controller_index = <device_num>}
								net_clear_all_remote_player_status
								generic_event_replace no_sound state = uistate_signin data = {device_num = <device_num> allow_back = 0 new_state = uistate_online primary = 0}
							else
								if IsScreenElementInFocus \{id = current_menu}
									online_lobby_setup_helper_controls
								else
									online_lobby_setup_helper_controls \{menu_type = right_hand}
								endif
							endif
						else
							create_vocals_warning
						endif
					endif
				else
					if can_add_vocals_player device_num = <device_num>
						NetSessionFunc func = AddControllers params = {controller = <device_num>}
						restore_save_net_preferences controller_index = <device_num>
						if IsScreenElementInFocus \{id = current_menu}
							online_lobby_setup_helper_controls
						else
							online_lobby_setup_helper_controls \{menu_type = right_hand}
						endif
						change \{need_to_refresh_player_slots = 1}
					else
						create_vocals_warning
					endif
				endif
			endif
		endif
	endif
endscript

script start_matchmaking 
	printf \{qs("\L--- start_matchmaking")}
	RequireParams \{[
			device_num
		]
		all}
	if CheckForSignIn controller_index = <device_num>
		if vocalist_has_mic
			if is_valid_instrument_config
				if NOT handle_online_SD_enumeration \{kick_back}
					return
				endif
				change \{disconnected_from_host_client = 0}
				change \{num_matchmaking_tries = 0}
				destroy_online_warning_message
				if IsPs3
					destroy_ps3_chat_warning_message
				endif
				NetOptions :Pref_Get \{name = game_modes}
				if (<checksum> = p2_battle)
					get_player_num_from_controller controller_index = ($primary_controller)
					if (<player_num> != -1)
						GetPlayerInfo <player_num> difficulty
						if (<difficulty> = easy_rhythm)
							checksum = easy
							SetPlayerInfo <player_num> difficulty = <checksum>
						endif
					endif
				endif
				<rand> = Random (@ 0 @ 1 )
				if (<rand> = 0)
					action = join
				else
					action = HOST
				endif
				ui_menu_select_sfx
				set_net_ui_to_searching action = <action>
				clear_temp_net_id_array
				setup_temp_net_id_array
				change \{net_new_matchmaking_ui_flag = 1}
				change \{net_num_player_settings_ack = 0}
				if (<action> = HOST)
					printf \{qs(0xb24bfaa0)}
					set_user_values_for_match
					set_network_preferences
					setup_and_post_game device_num = <device_num>
					OnlineLobbyInterface :GetTags
					<player_slots_menu_id> :Obj_SpawnScriptNow poll_for_controller_change_and_disconnect
				else
					printf \{qs(0x96fee678)}
					get_custom_match_search_params
					set_network_preferences
					DWCJoinGame <...> join_friends = 0
					OnlineLobbyInterface :GetTags
					<player_slots_menu_id> :Obj_SpawnScriptNow poll_for_controller_change_and_disconnect
				endif
			else
				menu_scroll_end_sound
				create_intrument_config_warning
			endif
		else
			menu_scroll_end_sound
			create_microphone_warning
		endif
	else
		menu_scroll_end_sound
	endif
endscript

script setup_temp_net_id_array 
	GetActiveControllers
	GetArraySize <active_controllers>
	i = 0
	begin
	if NetSessionFunc func = IsControllerInGame params = {controller = <i>}
		GetNetID controller_index = (<i>)
		NetSessionFunc obj = match func = get_gamertag params = {controller = <i>}
		SetArrayElement ArrayName = temp_net_id GlobalArray index = <i> newvalue = {net_id_first = <net_id_first> net_id_second = <net_id_second> name = <name>}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script vocalist_has_mic 
	found_vocalist = 0
	GetActiveControllers
	GetArraySize <active_controllers>
	i = 0
	begin
	if (<active_controllers> [<i>] = 1)
		if NetSessionFunc func = IsControllerInGame params = {controller = <i>}
			get_controller_type controller_index = <i>
			if (<controller_type> = Vocals || <controller_type> = controller)
				<found_vocalist> = 1
				if IsMicrophonePluggedIn \{number = 0}
					return \{true}
				elseif IsMicrophonePluggedIn \{number = 1}
					return \{true}
				elseif controller_has_headset controller = <i>
					return \{true}
				endif
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if (<found_vocalist> = 1)
		return \{false}
	else
		return \{true}
	endif
endscript

script create_microphone_warning 
	change \{net_no_focus_warning = 1}
	LaunchEvent \{type = unfocus
		target = current_menu}
	if IsPs3
		popup_text = qs("You must plug in a microphone with your controller to continue.")
	elseif isXenon
		popup_text = qs("You must connect a microphone or Xbox 360 Headset to continue.")
	else
		popup_text = $wii_connect_logitech
	endif
	create_net_popup title = qs("WARNING") popup_text = <popup_text>
	if ScreenElementExists \{id = PopupElement}
		PopupElement :Obj_SpawnScriptNow \{wait_and_kill_config_warning_popup}
	endif
endscript

script is_valid_instrument_config 
	printf \{qs("\L---is_valid_instrument_config")}
	num_bass = 0
	num_guitars = 0
	num_drums = 0
	num_mics = 0
	num_local_bass = 0
	num_local_guitars = 0
	num_local_drums = 0
	num_local_mics = 0
	num_local_players = 0
	num_players = 0
	if GotParam \{game_mode}
		search_mode = <game_mode>
	else
		NetOptions :Pref_GetStruct \{name = game_modes}
		search_mode = (<pref_struct>.search_chk)
	endif
	index = 0
	begin
	if NetSessionFunc func = IsControllerInGame params = {controller = <index>}
		<num_local_players> = (<num_local_players> + 1)
		<num_players> = (<num_players> + 1)
		get_player_num_from_controller controller_index = <index>
		get_controller_type controller_index = <index>
		GetPlayerInfo <player_num> part
		printf qs(0x3216a9a6) d = <controller_type> s = <part>
		switch <controller_type>
			case guitar
			if NOT (<part> = Bass || <part> = guitar)
				return \{false}
			endif
			case drum
			if NOT (<part> = drum)
				return \{false}
			endif
			case Vocals
			case controller
			if NOT (<part> = Vocals)
				return \{false}
			endif
		endswitch
		switch (<part>)
			case Bass
			<num_bass> = (<num_bass> + 1)
			<num_local_bass> = (<num_local_bass> + 1)
			<num_guitars> = (<num_guitars> + 1)
			<num_local_guitars> = (<num_local_guitars> + 1)
			case guitar
			<num_guitars> = (<num_guitars> + 1)
			<num_local_guitars> = (<num_local_guitars> + 1)
			case drum
			<num_drums> = (<num_drums> + 1)
			<num_local_drums> = (<num_local_drums> + 1)
			case Vocals
			<num_mics> = (<num_mics> + 1)
			<num_local_mics> = (<num_local_mics> + 1)
		endswitch
		printf qs(0x7751799a) d = <player_num> e = <part>
	endif
	<index> = (<index> + 1)
	repeat 4
	printstruct <...>
	if ((<num_guitars> > 4) || (<num_drums> > 2) || (<num_mics> > 2) ||
			(<num_local_guitars> > 2) || (<num_local_drums> > 1) || (<num_local_mics> > 1))
		return \{false}
	endif
	switch (<search_mode>)
		case p2_battle
		if (<num_local_players> = 1)
			if (<num_players> <= 2 && <num_drums> = 0 && <num_mics> = 0 && <num_bass> = 0)
				return \{true}
			endif
		endif
		case p2_faceoff
		case p2_pro_faceoff
		if (<num_local_players> = 1 && <num_players> <= 2)
			if (<num_guitars> != 0 && <num_mics> = 0 && <num_drums> = 0 && <num_bass> = 0)
				return \{true}
			endif
		endif
		case p2_pro_faceoff_bass
		case p2_faceoff_bass
		if (<num_local_players> = 1 && <num_mics> = 0 && <num_drums> = 0 && <num_bass> > 0)
			if (<num_players> = 1 && <num_local_bass> = 1)
				return \{true}
			elseif (<num_players> = 2 && <num_local_bass> = 1 && <num_bass> = 2)
				return \{true}
			endif
		endif
		case p4_pro_faceoff
		if (<num_local_players> = 2 && <num_players> <= 4 && <num_mics> = 0 && <num_drums> = 0 && <num_guitars> > 0)
			return \{true}
		endif
		case p2_coop
		if (<num_local_players> = 1 && <num_mics> = 0 && <num_drums> = 0 && <num_players> <= 2)
			return \{true}
		endif
		case p4_quickplay
		if (<num_local_players> < 4 && <num_players> <= 4)
			if (<num_guitars> <= 2 && <num_drums> <= 1 && <num_mics> <= 1)
				return \{true}
			endif
		endif
		case p2_pro_faceoff_drums
		case mode_extra_1
		if (<num_local_players> = 1 && <num_mics> = 0 && <num_guitars> = 0)
			if (<num_players> = 1 && <num_local_drums> = 1)
				return \{true}
			elseif (<num_players> = 2 && <num_local_drums> = 1 && <num_drums> = 2)
				return \{true}
			endif
		endif
		case p8_pro_faceoff
		if (<num_local_players> = 4 && <num_mics> = 1 && <num_guitars> = 2 && <num_drums> = 1)
			return \{true}
		else
			return \{false}
		endif
		case p2_career
		return \{false}
		case p4_career
		if (<num_local_players> >= 1 && <num_local_players> < 4)
			return \{true}
		else
			return \{false}
		endif
		default
		return \{false}
	endswitch
	return \{false}
endscript

script create_intrument_config_warning \{helper_controls_script = online_lobby_setup_helper_controls
		msg_txt = qs("The current instrument setup is not supported for this game mode.")}
	change \{net_no_focus_warning = 1}
	LaunchEvent \{type = unfocus
		target = current_menu}
	create_net_popup title = qs("WARNING") popup_text = <msg_txt>
	if ScreenElementExists \{id = PopupElement}
		PopupElement :Obj_SpawnScriptNow wait_and_kill_config_warning_popup params = {helper_controls_script = <helper_controls_script>}
	endif
endscript

script wait_and_kill_config_warning_popup 
	Wait \{3.0
		seconds}
	destroy_net_popup
	set_focus_color rgba = ($online_lobby_item_text_color_focus)
	set_unfocus_color rgba = ($online_lobby_item_text_color)
	<helper_controls_script>
	change \{net_no_focus_warning = 0}
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script net_quick_create 
	printf \{qs("\L--- net_quick_create")}
	RequireParams \{[
			device_num
		]
		all}
	if (<device_num> = $primary_controller)
		if CheckForSignIn controller_index = <device_num>
			if NOT handle_online_SD_enumeration \{kick_back}
				return
			endif
			change \{disconnected_from_host_client = 0}
			change \{num_matchmaking_tries = 0}
			destroy_online_warning_message
			if IsPs3
				destroy_ps3_chat_warning_message
			endif
			ui_menu_select_sfx
			set_net_ui_to_searching
			change \{net_new_matchmaking_ui_flag = 1}
			change \{net_num_player_settings_ack = 0}
			set_user_values_for_match
			get_custom_match_search_params
			set_network_preferences
			DWCJoinGame <...> join_friends = 0
			SpawnScriptLater \{start_matchmaking_state_machine}
			if NOT CD
				net_create_matchmaking_status_window
			endif
		else
			menu_scroll_end_sound
		endif
	else
		menu_scroll_end_sound
	endif
endscript

script net_custom_search 
	generic_event_choose state = UIstate_net_custom_search data = {device_num = <device_num>}
endscript

script net_wii_friends \{for_invite = 0}
	if (<for_invite> = 1)
		if NOT is_valid_instrument_config
			create_intrument_config_warning
			return
		endif
	endif
	launch_friends_list for_invite = <for_invite>
endscript

script net_DLC_menu 
	generic_event_choose \{state = UIstate_DLC_menu}
endscript

script set_net_ui_to_searching \{action = HOST}
	OnlineLobbyInterface :GetTags
	LaunchEvent \{type = unfocus
		target = current_menu}
	create_start_matchmaking_container friends = <friends> friend_name = <friend_name> action = <action>
	<player_slots_menu_id> :Obj_KillSpawnedScript name = update_player_slots_ui
	remove_locals_not_ingame
	<player_slots_menu_id> :GetTags
	GetArraySize \{all_players_checksum}
	i = 0
	begin
	if (<all_players_checksum> [<i>] = empty)
		if ((<i> + 1) = <array_size>)
			printf qs("\Li = %m j = %d") m = <i> d = <j>
			break
		endif
		j = (<i> + 1)
		second_loop = (<array_size> - <j>)
		begin
		if (<all_players_checksum> [<j>] = local_signed_in)
			get_ui_slot_corresponding_controller target_ui_slot = <j>
			GetPlayerInfo (<j> + 1) part
			GetPlayerInfo (<j> + 1) difficulty
			GetPlayerInfo (<j> + 1) lefty_flip
			GetPlayerInfo (<j> + 1) character_id
			GetPlayerInfo (<j> + 1) vocals_highway_view
			add_remove_player_to_net_ui action = remove ui_slot = <j> index = <controller> player_type = local_signed_in
			add_remove_player_to_net_ui action = Add index = <controller> player_type = local_signed_in part = <part>
			get_controller_corresponding_ui_slot controller = <controller>
			if (<ui_slot> != -1)
				SetPlayerInfo (<ui_slot> + 1) difficulty = <difficulty>
				SetPlayerInfo (<ui_slot> + 1) lefty_flip = <lefty_flip>
				SetPlayerInfo (<ui_slot> + 1) character_id = <character_id>
				SetPlayerInfo (<ui_slot> + 1) vocals_highway_view = <vocals_highway_view>
			endif
			<player_slots_menu_id> :GetSingleTag all_players_checksum
			break
		endif
		j = (<j> + 1)
		repeat <second_loop>
	endif
	i = (<i> + 1)
	repeat <array_size>
	remove_empty_slots_from_status_structs
	refresh_player_slots_ui
	set_net_dialog_message \{msg_checksum = start_matchmaking}
endscript

script remove_locals_not_ingame 
	OnlineLobbyInterface :GetTags
	<player_slots_menu_id> :GetTags
	GetArraySize \{all_players_checksum}
	i = 0
	begin
	if (<all_players_checksum> [<i>] = local_not_signed_in)
		get_ui_slot_corresponding_controller target_ui_slot = <i>
		add_remove_player_to_net_ui action = remove ui_slot = <i> index = <controller> player_type = local_not_signed_in
		if GotParam \{one_player}
			return
		endif
	elseif (<all_players_checksum> [<i>] = local_signed_in)
		get_ui_slot_corresponding_controller target_ui_slot = <i>
		if NOT NetSessionFunc func = IsControllerInGame params = {controller = <controller>}
			add_remove_player_to_net_ui action = remove ui_slot = <i> index = <controller> player_type = local_signed_in
			if GotParam \{one_player}
				return
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script remove_empty_slots_from_status_structs 
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :GetTags
		<player_slots_menu_id> :GetTags
		GetArraySize \{all_players_checksum}
		i = 0
		begin
		if (<all_players_checksum> [<i>] = empty)
			FormatText checksumname = player_status 'player%d_status' d = (<i> + 1)
			change structurename = <player_status> is_local_client = 0
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script set_net_ui_to_finished_searching 
	printf \{qs("\Lset_net_ui_to_finished_searching")}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		spawn_player_drop_listeners \{drop_player_script = matchmaking_countdown_drop_player_script
			end_game_script = matchmaking_countdown_end_game_script}
		destroy_searching_ui
		sent_settings_sync = 0
		set_ui_to_final_player_slots
		change \{online_song_choice_id = 0}
		index = ($online_to_setlist_count)
		begin
		FormatText TextName = timer_msg qs("COUNTDOWN TO SETLIST %d") d = <index>
		if ScreenElementExists \{id = OnlineLobbyInterface}
			OnlineLobbyInterface :SE_SetProps matchmaking_info_text = (<timer_msg>)
		endif
		if (<index> = 5)
			OnlineLobbyInterface :SetTags \{toggle_allowed = 0}
			set_ui_to_final_player_slots \{locked}
		elseif (<index> < 5 && (<sent_settings_sync> = 0))
			<sent_settings_sync> = 1
			host_start_player_settings_sync
		endif
		if (<index> = 0)
			break
		endif
		index = (<index> - 1)
		Wait \{1
			second}
		repeat
		vocals_distribute_mics
		if NOT ($net_match_dlc_sync_finished = 1)
			if IsPs3
				title = qs("ONLINE")
			else
				title = qs("LOADING")
			endif
			destroy_popup_warning_menu
			create_popup_warning_menu {
				title = <title>
				title_props = {scale = 1.0}
				textblock = {
					text = qs("Syncing downloadable content...")
					pos = (640.0, 380.0)
				}
				no_background
			}
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
			wait_time = 0
			begin
			if ($net_match_dlc_sync_finished = 1)
				break
			elseif (<wait_time> > 15)
				KillSpawnedScript \{name = net_match_send_available_items}
				break
			endif
			<wait_time> = (<wait_time> + 1)
			Wait \{1.0
				seconds}
			repeat
			destroy_popup_warning_menu
		endif
		generic_event_choose \{state = uistate_setlist
			data = {
				no_jamsession
			}}
	else
		printf \{qs("\Lour matchmaking menu doesn't exist")}
	endif
endscript

script lock_player_parts 
	printf \{qs("\L--- lock_player_parts")}
	if IsHost
		GameMode_GetNumPlayers
		index = 1
		num_bass = [0 0]
		num_guitar = [0 0]
		begin
		GetPlayerInfo <index> part
		GetPlayerInfo <index> team
		if (<part> = guitar || <part> = Bass)
			if (<part> = guitar)
				SetArrayElement ArrayName = num_guitar index = <team> newvalue = (<num_guitar> [<team>] + 1)
				if (<num_guitar> [<team>] > 1)
					SetPlayerInfo <index> part = Bass
				else
					SetPlayerInfo <index> part = guitar
				endif
			elseif (<part> = Bass)
				SetArrayElement ArrayName = num_bass index = <team> newvalue = (<num_bass> [<team>] + 1)
				if (<num_bass> [<team>] > 1)
					SetPlayerInfo <index> part = guitar
				else
					SetPlayerInfo <index> part = Bass
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat (<num_players>)
		if ScreenElementExists \{id = OnlineLobbyInterface}
			if ($network_game_postgame_lobby = 0)
				OnlineLobbyInterface :GetTags
				set_ui_to_final_player_slots slot = <slot_index> locked
			else
				refresh_player_scores_postgame_container \{locked}
			endif
		endif
	endif
endscript

script set_ui_to_final_player_slots \{slot = 0}
	destroy_player_slots_ui
	OnlineLobbyInterface :GetTags
	GameMode_GetNumPlayers
	<index> = 1
	begin
	GetPlayerInfo <index> net_id_first
	GetPlayerInfo <index> net_id_second
	GetPlayerInfo <index> part
	switch (<part>)
		case guitar
		icon_texture = Logo_Guitar_GrayScale
		case Bass
		icon_texture = Logo_Bass_GrayScale
		case drum
		icon_texture = Logo_Drum_GrayScale
		case Vocals
		icon_texture = Logo_Vocal_GrayScale
	endswitch
	FormatText checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
	name = $<gamertag>
	xuid = [0 0]
	SetArrayElement ArrayName = xuid index = 0 newvalue = (<net_id_first>)
	SetArrayElement ArrayName = xuid index = 1 newvalue = (<net_id_second>)
	color = ($online_player_slot_bg_team1)
	if NOT GameMode_IsCooperative
		if (<index> > <num_players> / 2)
			color = ($online_player_slot_bg_team2)
		endif
	endif
	GetPlayerInfo <index> career_earnings
	cash_get_info_from_earnings earnings = <career_earnings>
	GetPlayerInfo <index> controller
	GetPlayerInfo <index> is_local_client
	FormatText TextName = cash_text qs("%d") d = <rank>
	online_lobby_add_player_slot {
		name = <name>
		controller_texture = <icon_texture>
		xuid = <xuid>
		bg_rgba = <color>
		parent = <player_slots_menu_id>
		cash_text = <cash_text>
		cash_icon_id = <cash_icon_id>
		controller = <controller>
		is_local_client = <is_local_client>
	}
	<index> = (<index> + 1)
	repeat <num_players>
	clean_up_user_control_helpers
	NetOptions :Pref_Get \{name = game_modes}
	if GotParam \{locked}
		new_event_handlers = [
			{pad_up net_up_down_action params = {action = up}}
			{pad_down net_up_down_action params = {action = down}}
		]
		if isXenon
			add_user_control_helper \{text = qs("VIEW GAMER CARD")
				button = green
				z = 100000}
		endif
	elseif (<checksum> = p4_pro_faceoff || <checksum> = p2_quickplay || <checksum> = p4_quickplay || <checksum> = p8_pro_faceoff)
		new_event_handlers = [
			{pad_up net_up_down_action params = {action = up}}
			{pad_down net_up_down_action params = {action = down}}
			{pad_l1 toggle_guitar_part params = {finished_matchmaking}}
		]
		if isXenon
			add_user_control_helper \{text = qs("VIEW GAMER CARD")
				button = green
				z = 100000}
		endif
		GetActiveControllers
		GetArraySize <active_controllers>
		i = 0
		begin
		if (<active_controllers> [<i>] = 1)
			if NetSessionFunc func = IsControllerInGame params = {controller = <i>}
				get_controller_type controller_index = <i>
				if (<controller_type> = guitar)
					add_user_control_helper text = qs("GUITAR/BASS") button = Orange z = 100000 controller = <i> use_guitar_button = 1
					break
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	else
		new_event_handlers = [
			{pad_up net_up_down_action params = {action = up}}
			{pad_down net_up_down_action params = {action = down}}
		]
		if isXenon
			add_user_control_helper \{text = qs("VIEW GAMER CARD")
				button = green
				z = 100000}
		endif
	endif
	SetScreenElementProps {
		id = <player_slots_menu_id>
		event_handlers = <new_event_handlers>
		replace_handlers
	}
	OnlineLobbyInterface :SetTags slot_items = <num_players> Menu_items = 0 slot_index = 0 locked_to_players = 1
endscript

script online_lobby_add_player_slot \{cash_text = qs("0")
		cash_icon_id = cash_milestone_icon_002}
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :GetTags
		CreateScreenElement {
			type = DescInterface
			desc = 'online_lobby_player_slot_item'
			parent = <parent>
			auto_dims = false
			dims = (450.0, 50.0)
			event_handlers = [
				{focus player_slot_change_focus params = {focus}}
				{unfocus player_slot_change_focus params = {unfocus}}
			]
		}
		if isXenon
			if GotParam \{xuid}
				<id> :SE_SetProps event_handlers = [{pad_choose ui_menu_select_sfx}
					{pad_choose menu_show_gamercard_from_netid params = {net_id = <xuid>}}
				]
				if (<is_local_client> = 0)
					<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
				elseif GotParam \{controller}
					if NOT NetSessionFunc func = XenonIsGuest params = {controller_index = (<controller>)}
						<id> :Obj_SpawnScriptLater update_headset_status params = {obj_id = <id> uid = <xuid>}
					endif
				endif
			endif
		endif
		<id> :Desc_CheckVersion desired = 2 AssertIf = Mismatch
		<id> :SE_SetProps {
			player_slot_name_text = <name>
			player_instrument_logo_texture = <controller_texture>
			player_slot_bg_rgba = <bg_rgba>
			cash_icon_texture = <cash_icon_id>
			cash_rank_text = <cash_text>
			cash_icon_alpha = 1
		}
		if <id> :Desc_ResolveAlias name = alias_sign_in_button param = signin_id
			<signin_id> :Die
		endif
	endif
endscript

script update_ui_total_players 
	printf \{qs("\Lupdate_ui_total_players")}
	KillSpawnedScript \{name = check_invite_valid}
	KillSpawnedScript \{name = check_player_disconnect}
	KillSpawnedScript \{name = ensure_cancel_start_matchmaking}
	OnlineLobbyInterface :GetTags
	<player_slots_menu_id> :Obj_KillSpawnedScript name = poll_for_controller_change_and_disconnect
	get_local_players_in_game
	num_connecting = (<total_players> - <num_local_players>)
	FormatText TextName = message qs("Found %d player(s)") d = <num_connecting>
	if ScreenElementExists \{id = PopupElement}
		PopupElement :SetProps {
			PopupBody_text = <message>
		}
	endif
	GameMode_GetType
	if (<type> = career)
		printf \{qs("\Lcareer matchmaking is done")}
		get_local_players_in_game
		if (($num_players_in_band = <num_local_players>) && ($num_players_in_band = <total_players>))
			Wait \{1
				second}
			FinalizeJoinProcessLocalOnly
		endif
	else
	endif
	change net_num_players = <total_players>
endscript

script net_msg_update_player_ui 
	printf \{qs("\Lnet_msg_update_player_ui")}
	GameMode_GetType
	if (<type> = career)
		net_add_player_to_career_ui {
			name = <gamertag_string>
			player_num = <player_num>
			net_id_first = <net_id_first>
			net_id_second = <net_id_second>
			local_client = <local_client>
			obj_id = <obj_id>
			part = <part>
			difficulty = <difficulty>
		}
	endif
endscript

script net_msg_update_joining_ui 
	printf \{qs("\Lnet_msg_update_joining_ui")}
	GameMode_GetType
	if (<type> = career)
		if ($net_invites_limbo = 1)
			printf \{qs(0x30ae5bd0)}
			change \{net_invites_limbo = 0}
		endif
		if NOT IsHost
			register_new_progression_atoms \{Career_Band}
			proceed_to_band_lobby
		else
			ui_band_mode_change_menu_focus_all \{focus_type = focus
				local_only}
			get_player_num_from_controller controller_index = ($primary_controller)
			SendStructure callback = net_career_asign_band_leader_icon data_to_send = {player_num = <player_num>}
			if ScreenElementExists \{id = MyInterfaceElement}
				MyInterfaceElement :obj_spawnscript \{net_career_host_finalize_menu_ui}
			endif
		endif
	else
		if ScreenElementExists \{id = OnlineLobbyInterface}
			OnlineLobbyInterface :Obj_SpawnScriptLater \{set_net_ui_to_finished_searching}
		else
			SpawnScriptLater \{set_net_ui_to_finished_searching}
		endif
	endif
endscript

script choose_random_venue 
	GetArraySize ($LevelZoneArray)
	begin
	GetRandomValue name = level_index Integer a = 0 b = (<array_size> -1)
	get_LevelZoneArray_checksum index = <level_index>
	if NOT StructureContains Structure = ($LevelZones.<level_checksum>) debug_only
		change current_level = <level_checksum>
		break
	endif
	repeat
endscript

script host_start_player_settings_sync 
	if IsHost
		if ($net_num_player_settings_ack = 0)
			printf \{qs("\L---host_start_player_settings_sync")}
			SendStructure \{callback = player_settings_request
				data_to_send = {
					none
				}}
			i = 1
			num_local_players = 4
			begin
			FormatText checksumname = player_status 'player%d_status' d = <i>
			if ((($<player_status>.is_local_client) = 1) && (($<player_status>.net_obj_id) >= 0))
				change net_num_player_settings_ack = ($net_num_player_settings_ack + 1)
				printf ($net_num_player_settings_ack)
			endif
			i = (<i> + 1)
			repeat <num_local_players>
		endif
	endif
endscript
player_drop_in_setting_sync = 0

script choose_random_venue 
	GetArraySize ($LevelZoneArray)
	begin
	GetRandomValue name = level_index Integer a = 0 b = (<array_size> -1)
	get_LevelZoneArray_checksum index = <level_index>
	if NOT StructureContains Structure = ($LevelZones.<level_checksum>) debug_only
		change current_level = <level_checksum>
		break
	endif
	repeat
endscript

script proceed_to_setlist 
	generic_event_choose \{state = uistate_setlist}
endscript

script player_settings_request 
	printf \{qs("\Lplayer_settings_request")}
	GameMode_GetType
	if (<type> = career)
		begin
		if ($net_career_data_sync_done = 0)
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	num_local_players = 4
	player_data = {}
	i = 1
	begin
	FormatText checksumname = player_status 'player%d_status' d = <i>
	if ((($<player_status>.is_local_client) = 1) && (($<player_status>.net_obj_id) >= 0))
		AppendStruct {
			struct = player_data
			field = <player_status>
			params = {
				player_difficulty = ($<player_status>.difficulty)
				player_obj_id = ($<player_status>.net_obj_id)
				player_lefty_flip = ($<player_status>.lefty_flip)
				player_part = ($<player_status>.part)
			}
		}
	endif
	i = (<i> + 1)
	repeat <num_local_players>
	if NOT (<type> = career)
		if ScreenElementExists \{id = OnlineLobbyInterface}
			if ($network_game_postgame_lobby = 0)
				OnlineLobbyInterface :GetTags
				set_ui_to_final_player_slots slot = <slot_index> locked
			endif
		endif
	endif
	SendStructure callback = player_settings_request_ack data_to_send = {player_data = <player_data>} to_server
endscript

script player_settings_request_ack 
	printf \{qs("\Lplayer_settings_request_ack")}
	if GotParam \{player_data}
		num_local_players = 4
		i = 1
		begin
		FormatText checksumname = player_status 'player%d_status' d = <i>
		if StructureContains Structure = <player_data> <player_status>
			num_net_players = 8
			j = 1
			begin
			GetPlayerInfo <j> net_obj_id
			if (<net_obj_id> = <player_data>.<player_status>.player_obj_id)
				change net_num_player_settings_ack = ($net_num_player_settings_ack + 1)
				printf ($net_num_player_settings_ack)
				SetPlayerInfo <j> difficulty = (<player_data>.<player_status>.player_difficulty)
				SetPlayerInfo <j> lefty_flip = (<player_data>.<player_status>.player_lefty_flip)
				SetPlayerInfo <j> lefthanded_gems = (<player_data>.<player_status>.player_lefty_flip)
				SetPlayerInfo <j> lefthanded_button_ups = (<player_data>.<player_status>.player_lefty_flip)
				SetPlayerInfo <j> lefthanded_button_ups_flip_save = (<player_data>.<player_status>.player_lefty_flip)
				SetPlayerInfo <j> lefthanded_gems_flip_save = (<player_data>.<player_status>.player_lefty_flip)
				SetPlayerInfo <j> part = (<player_data>.<player_status>.player_part)
			endif
			j = (<j> + 1)
			repeat <num_net_players>
		endif
		i = (<i> + 1)
		repeat <num_local_players>
	endif
	GameMode_GetNumPlayers
	change net_num_players = <num_players>
	if (($net_num_players) = ($net_num_player_settings_ack))
		printf \{qs("\LHost recieved all player's settings.")}
		change \{net_num_player_settings_ack = 0}
		GameMode_GetType
		if (<type> = career)
			net_career_check_instruments
		else
			lock_player_parts
		endif
		num_valid_players = 0
		player_data = {}
		i = 0
		begin
		FormatText checksumname = player_status 'player%d_status' d = (<i> + 1)
		if (($<player_status>.net_obj_id) >= 0)
			AppendStruct {
				struct = player_data
				field = <player_status>
				params = {
					player_difficulty = ($<player_status>.difficulty)
					player_obj_id = ($<player_status>.net_obj_id)
					player_lefty_flip = ($<player_status>.lefty_flip)
					player_part = ($<player_status>.part)
				}
			}
			num_valid_players = (<num_valid_players> + 1)
		endif
		if ($net_num_players = <num_valid_players>)
			break
		endif
		i = (<i> + 1)
		repeat 8
		printf \{qs("\LHost now sending all players' info to everyone")}
		printstruct <player_data>
		SendStructure callback = finish_player_settings_sync data_to_send = {player_data = <player_data>}
		if (<type> = career)
			count = 0
			i = 1
			num_local_players = 4
			begin
			FormatText checksumname = player_status 'player%d_status' d = <i>
			if ((($<player_status>.net_obj_id) >= 0) && (($<player_status>.is_local_client) = 1))
				change net_num_player_settings_ack = (($net_num_player_settings_ack) + 1)
				printf qs("\Lwe currently have %d players locally that are in thte game") d = ($net_num_player_settings_ack)
			endif
			i = (<i> + 1)
			repeat <num_local_players>
			if ScreenElementExists \{id = MyInterfaceElement}
				MyInterfaceElement :obj_spawnscript \{net_career_wait_to_proceed_to_online_play}
			endif
		else
			if ($network_game_postgame_lobby = 0)
				get_local_players_in_game
				GameMode_GetNumPlayers
				if (<num_players> != <num_local_players>)
					net_match_send_available_items
				endif
			endif
		endif
	endif
endscript

script finish_player_settings_sync 
	printf \{qs("\Lfinish_player_settings_sync")}
	printstruct <...>
	if GotParam \{player_data}
		num_net_players = 8
		i = 1
		begin
		FormatText checksumname = player_status 'player%d_status' d = <i>
		if StructureContains Structure = <player_data> <player_status>
			num_net_players = 8
			j = 1
			begin
			GetPlayerInfo <j> net_obj_id
			if (<net_obj_id> = <player_data>.<player_status>.player_obj_id)
				SetPlayerInfo <j> difficulty = (<player_data>.<player_status>.player_difficulty)
				SetPlayerInfo <j> lefty_flip = (<player_data>.<player_status>.player_lefty_flip)
				SetPlayerInfo <j> lefthanded_gems = (<player_data>.<player_status>.player_lefty_flip)
				SetPlayerInfo <j> lefthanded_button_ups = (<player_data>.<player_status>.player_lefty_flip)
				SetPlayerInfo <j> lefthanded_button_ups_flip_save = (<player_data>.<player_status>.player_lefty_flip)
				SetPlayerInfo <j> lefthanded_gems_flip_save = (<player_data>.<player_status>.player_lefty_flip)
				SetPlayerInfo <j> part = (<player_data>.<player_status>.player_part)
			endif
			j = (<j> + 1)
			repeat <num_net_players>
		endif
		i = (<i> + 1)
		repeat <num_net_players>
	endif
	GameMode_GetType
	if (<type> = career)
		count = 0
		i = 1
		num_local_players = 4
		begin
		FormatText checksumname = player_status 'player%d_status' d = <i>
		if ((($<player_status>.net_obj_id) >= 0) && (($<player_status>.is_local_client) = 1))
			count = (<count> + 1)
		endif
		i = (<i> + 1)
		repeat <num_local_players>
		SendStructure callback = finish_player_settings_sync_ack data_to_send = {num_ready = <count>}
	else
		if ScreenElementExists \{id = OnlineLobbyInterface}
			if ($network_game_postgame_lobby = 0)
				OnlineLobbyInterface :GetTags
				get_local_players_in_game
				GameMode_GetNumPlayers
				if (<num_players> != <num_local_players>)
					net_match_send_available_items
				endif
				set_ui_to_final_player_slots slot = <slot_index> locked
			else
				refresh_player_scores_postgame_container \{locked}
			endif
		endif
	endif
endscript

script finish_player_settings_sync_ack 
	GameMode_GetType
	if (<type> = career)
		change net_num_player_settings_ack = (($net_num_player_settings_ack) + <num_ready>)
		printf qs("\Lwe now have %d players in the game") d = ($net_num_player_settings_ack)
	endif
endscript

script net_party_host_started_matchmaking 
	printf \{qs("\L--- net_party_host_started_matchmaking")}
	GameMode_GetType
	if (<type> = career)
		change \{net_band_mode_menu = lobby}
		change \{net_invites_limbo = 1}
		get_local_players_in_game
		change num_players_in_band = <num_local_players>
		ui_event \{event = menu_change
			data = {
				state = UIstate_band_mode
			}}
	else
		remove_empty_slots_from_status_structs
		change \{net_new_matchmaking_ui_flag = 1}
		LaunchEvent \{type = unfocus
			target = current_menu}
		set_net_dialog_message \{msg_checksum = start_matchmaking}
	endif
endscript

script net_party_attempted_join_result 
	printf \{qs("\L--- net_party_attempted_join_result")}
	RequireParams \{[
			join_result
			join_mode
		]
		all}
	change \{has_invite_join_result_callback_completed = 1}
	if (<join_result> = 1)
		printf \{qs("\LWe were able to join the remote party!")}
		if ChecksumEquals a = <join_mode> b = career_join
			ui_event_block \{event = menu_add
				data = {
					state = uistate_game_mode
					base_name = 'game_mode'
				}}
			ui_event_block \{event = menu_add
				data = {
					state = uistate_group_play
					base_name = 'group_play'
				}}
			change \{game_mode = p4_career}
			change \{net_band_mode_menu = invite}
			net_party_save_off_invite_controllers
			NetOptions :Pref_Choose \{name = game_modes
				checksum = p4_career}
			destroy_loading_screen
			ui_event \{event = menu_change
				data = {
					state = uistate_net_setup
				}}
		else
			change \{game_mode = p2_faceoff}
			ui_event_block \{event = menu_change
				data = {
					state = uistate_net_setup
				}}
		endif
	else
		shut_down_net_play
		printf \{qs("\LWe DID NOT join the remote party!")}
		if IsPs3
			popup_text = qs("Cannot join the online party. Insufficient slots available.")
			if GotParam \{reason}
				if (<reason> = bad_state)
					<popup_text> = qs("Cannot join the online party. Session no longer available.")
				endif
			endif
		else
			popup_text = qs("Cannot join the Xbox LIVE party. Insufficient slots available.")
			if GotParam \{reason}
				if (<reason> = bad_state)
					<popup_text> = qs("Cannot join the Xbox LIVE party. Session no longer available.")
				endif
			endif
		endif
		create_popup_warning_menu {
			title = qs("JOINING")
			textblock = {
				text = <popup_text>
			}
			parent = root_window
			no_background
			options = [
				{
					func = net_party_failed_join_attempt_continue
					text = qs("Continue")
				}
			]
		}
		destroy_loading_screen
	endif
endscript

script net_party_failed_join_attempt_continue 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	ui_event \{event = menu_refresh
		data = {
			lost_party
		}}
endscript

script net_party_lost_party_connection 
	printf \{qs("\L--- net_party_lost_party_connection")}
	ui_event_get_stack
	if NOT ((<stack> [0].base_name) = 'mainmenu')
		GameMode_GetType
		if (<type> = career)
			wait_for_safe_shutdown
			change \{net_ready_to_start = 1}
			if ui_event_exists_in_stack \{name = 'group_play'}
				printf \{qs(0x2cbfbd37)}
				change \{is_network_game = 0}
				ui_event \{event = menu_back
					data = {
						state = uistate_group_play
					}}
			elseif ui_event_exists_in_stack \{name = 'online'}
				printf \{qs(0x1bd529ce)}
				ui_event \{event = menu_back
					data = {
						state = uistate_online
					}}
			endif
			create_net_popup \{title = qs("GAME OVER")
				popup_text = qs("There are not enough players to continue.")}
			Wait \{3
				seconds}
			destroy_net_popup
		else
			player = 1
			GameMode_GetNumPlayers
			begin
			FormatText checksumname = player_status 'player%p_status' p = <player>
			if ($<player_status>.is_local_client = 0)
				net_clear_player_status player_status = <player_status>
			endif
			<player> = (<player> + 1)
			repeat <num_players>
			ui_event \{event = menu_refresh
				data = {
					lost_party
				}}
		endif
	endif
endscript

script net_party_receive_host_party_info 
	printf \{qs("\L--- net_party_receive_host_party_info")}
endscript

script party_is_full 
	NetSessionFunc \{obj = party
		func = get_party_members}
	GetArraySize <connections>
	if (<array_size> >= 8)
		return \{true}
	else
		return \{false}
	endif
endscript

script ui_slots_are_full 
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :GetTags
		if ScreenElementExists id = <player_slots_menu_id>
			<player_slots_menu_id> :GetTags
			GetArraySize <all_players_checksum>
			if (<array_size> > 0)
				index = 0
				begin
				if (<all_players_checksum> [<index>] = empty)
					return \{false}
				endif
				index = (<index> + 1)
				repeat <array_size>
			endif
		endif
	endif
	return \{true}
endscript

script menu_net_matchmaking_init 
	printf \{qs("\L--- menu_net_matchmaking_init")}
	printf qs("\LCreating party session with controller %d") d = ($primary_controller)
	NetSessionFunc {
		obj = party
		func = create_party_session
		params = {
			controller_index = ($primary_controller)
		}
	}
	NetSessionFunc \{obj = party
		func = set_joiner_mode
		params = {
			mode = online_menu
		}}
endscript

script net_party_debug_dump 
	printf \{qs("\L--- net_party_debug_dump")}
	NetSessionFunc \{obj = party
		func = get_party_members}
	printstruct <...>
endscript

script menu_net_matchmaking_deinit 
	printf \{qs("\L--- menu_net_matchmaking_deinit")}
	NetSessionFunc \{obj = party
		func = stop_party_session}
endscript
temp_net_id = [
	{
		net_id_first = 0
		net_id_second = 0
		name = qs("")
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs("")
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs("")
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs("")
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs("")
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs("")
	}
	{
		net_id_first = 0
		net_id_second = 0
		name = qs("")
	}
]

script clear_temp_net_id_array 
	change \{temp_net_id = [
			{
				net_id_first = 0
				net_id_second = 0
				name = qs("")
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs("")
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs("")
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs("")
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs("")
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs("")
			}
			{
				net_id_first = 0
				net_id_second = 0
				name = qs("")
			}
		]}
endscript

script net_party_save_off_invite_controllers 
	printf \{qs("\L--- net_party_save_off_invite_controllers")}
	get_local_players_in_game
	GetArraySize \{local_players}
	if (<array_size> > 0)
		i = 0
		begin
		if ((<local_players> [<i>]) = 1)
			GetNetID controller_index = <i>
			NetSessionFunc func = get_gamertag params = {controller = <i>}
			SetArrayElement {
				GlobalArray
				ArrayName = temp_net_id
				index = <i>
				newvalue = {
					net_id_first = <net_id_first>
					net_id_second = <net_id_second>
					name = <name>
				}
			}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script start_friendslist 
	printf \{qs("\L-- start_friendslist")}
	if NOT ScreenElementExists \{id = FriendsListInterface}
		LaunchEvent \{type = unfocus
			target = current_menu}
		online_lobby_transition_out
		SoundEvent \{event = Online_Panel_In}
		ui_create_friends_list device_num = <device_num> exit_script = online_lobby_transition_in
	endif
endscript

script start_net_preferences 
	if NOT ScreenElementExists \{id = NetPrefInterface}
		LaunchEvent \{type = unfocus
			target = current_menu}
		online_lobby_transition_out
		SoundEvent \{event = Online_Panel_In}
		ui_create_net_preferences device_num = <device_num> exit_script = online_lobby_transition_in
	endif
endscript

script toggle_guitar_part 
	printf \{qs("\L--- toggle_guitar_part")}
	OnlineLobbyInterface :GetSingleTag \{toggle_allowed}
	if (<toggle_allowed> = 0)
		return
	endif
	RequireParams \{[
			device_num
		]
		all}
	info_index = 1
	index = 1
	begin
	GetPlayerInfo <index> controller
	if (<device_num> = <controller>)
		<info_index> = <index>
		break
	endif
	index = (<index> + 1)
	repeat 8
	get_controller_type controller_index = <device_num>
	if (<controller_type> = guitar)
		GetPlayerInfo <info_index> part
		SoundEvent \{event = Online_Instrument_Change}
		if (<part> = guitar)
			SetPlayerInfo <info_index> part = Bass
			if GotParam \{finished_matchmaking}
				GetPlayerInfo <info_index> net_id_first
				GetPlayerInfo <info_index> net_id_second
				FormatText checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
				SendStructure callback = update_player_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = Bass}
				update_player_part first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = Bass
			else
				refresh_player_slots_ui
			endif
		elseif (<part> = Bass)
			SetPlayerInfo <info_index> part = guitar
			if GotParam \{finished_matchmaking}
				GetPlayerInfo <info_index> net_id_first
				GetPlayerInfo <info_index> net_id_second
				FormatText checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
				SendStructure callback = update_player_part data_to_send = {first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = guitar}
				update_player_part first_id = <net_id_first> second_id = <net_id_second> name = ($<gamertag>) part = guitar
			else
				refresh_player_slots_ui
			endif
		endif
	endif
endscript

script update_player_part 
	if IsHost
		SendStructure callback = update_player_part data_to_send = <...>
	endif
	found = 0
	info_index = 1
	begin
	GetPlayerInfo <info_index> net_id_first
	GetPlayerInfo <info_index> net_id_second
	FormatText checksumname = gamertag 'gamertag_%d' d = (<info_index> - 1)
	if ((<net_id_first> = <first_id>) && (<net_id_second> = <second_id>))
		if isXenon
			<found> = 1
			break
		elseif LocalizedStringEquals a = <name> b = ($<gamertag>)
			<found> = 1
			break
		endif
	endif
	info_index = (<info_index> + 1)
	repeat 8
	if (<found> = 1)
		SetPlayerInfo <info_index> part = <part>
		if ScreenElementExists \{id = OnlineLobbyInterface}
			OnlineLobbyInterface :GetTags
			set_ui_to_final_player_slots slot = <slot_index>
		endif
	endif
endscript

script ps3_display_invites_received 
	NetSessionFunc \{func = DisplayAndAcceptInvites
		params = {
			callback = ps3_invite_callback
		}}
endscript

script ps3_invite_callback 
	printf \{qs("\L----ps3_invite_callback")}
endscript

script matchmaking_countdown_end_game_script 
	wait_for_safe_shutdown
	if ScreenElementExists \{id = OnlineLobbyInterface}
		OnlineLobbyInterface :Obj_KillSpawnedScript \{name = set_net_ui_to_finished_searching}
		KillSpawnedScript \{name = set_net_ui_to_finished_searching}
		if OnlineLobbyInterface :Desc_ResolveAlias \{name = alias_player_slots_vmenu
				param = player_slots_menu}
			LaunchEvent type = unfocus target = <player_slots_menu>
		endif
	endif
	create_net_popup \{title = qs("GAME OVER")
		popup_text = qs("A player has left the game. There are not enough players to continue.")}
	Wait \{3
		seconds}
	destroy_net_popup
	quit_network_game
	refresh_online_lobby
endscript

script matchmaking_countdown_drop_player_script 
	printf \{qs("\Lmatchmaking_countdown_drop_player_script")}
	printf \{qs("\L--- WARNING, DOING NOTHING ---")}
endscript

script print_net_ui_status 
	OnlineLobbyInterface :GetTags
	<player_slots_menu_id> :GetTags
	printstruct <...>
endscript

script print_current_net_prefs 
	NetOptions :Pref_Get \{name = game_modes}
	printstruct <...>
	NetOptions :Pref_Get \{name = ranked}
	printstruct <...>
endscript

script check_signin_wrapper 
	printstruct <...>
	if CheckForSignIn local controller controller_index = <device_num>
		NetSessionFunc \{func = showsigninui
			params = {
				convert_offline_to_guest
			}}
	else
		NetSessionFunc \{func = ShowSignInUI4Pane
			params = {
				online_only
			}}
	endif
	wait_for_blade_complete
	if CheckForSignIn controller_index = <device_num>
		printf \{qs("\Lwe should run our passed in script now")}
	else
		if isXenon
			if CheckForSignIn local controller controller_index = <device_num>
				NetSessionFunc \{func = showsigninui
					params = {
						convert_offline_to_guest
					}}
			else
				NetSessionFunc \{func = ShowSignInUI4Pane
					params = {
						online_only
					}}
			endif
			wait_for_blade_complete
		endif
	endif
endscript

script debug_4player_signin 
	if isXenon
		NetSessionFunc \{func = ShowSignInUI4Pane}
		wait_for_blade_complete
	endif
endscript

script print_player_status_structs_net_info 
	printf \{qs("\L----print_player_status_structs_net_info")}
	i = 1
	begin
	FormatText checksumname = player_status 'player%d_status' d = <i>
	FormatText checksumname = gamertag 'gamertag_%i' i = (<i> - 1)
	name = $<gamertag>
	printf <player_status>
	printf qs("\Lis_local_client = %d") d = ($<player_status>.is_local_client)
	printf qs("\Lnet_id_first = %d") d = ($<player_status>.net_id_first)
	printf qs("\Lnet_id_second = %d") d = ($<player_status>.net_id_second)
	printf qs("\Lgamertag - %g") g = <name>
	printf qs("\Lobj_id = %d") d = ($<player_status>.net_obj_id)
	printf ($<player_status>.part)
	printf ($<player_status>.net_difficulty)
	printf ($<player_status>.controller)
	printf ($<player_status>.career_earnings)
	i = (<i> + 1)
	repeat 8
endscript

script online_lobby_pad_choose_wrapper 
	RequireParams \{[
			device_num
			pad_choose_script
		]
		all}
	printf qs(0x37917242) d = <device_num>
	is_controller_online controller_index = <device_num>
	if (<online> = 0)
		printf qs(0xf825f1f2) d = <device_num>
	else
		<pad_choose_script> <...>
	endif
endscript

script is_controller_online 
	RequireParams \{[
			controller_index
		]
		all}
	FormatText checksumname = online_controller 'controller%d_wants_online' d = <controller_index>
	return online = ($<online_controller>)
endscript

script log_out_of_dwc 
	leave_net_main_menu \{device_num = $primary_controller}
	LogOut
endscript

script start_matchmaking_state_machine 
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
	if NOT IsDwcInPotentiallyBlockingCall
		if (<hosting_time_left> > 22)
			if (<state> = eSEARCHING)
				printf \{qs(0xb24bfaa0)}
				cancel_join_server
				set_user_values_for_match
				setup_and_post_game device_num = <device_num>
				printf \{qs(0x7c83f0e4)}
			else
				printf \{qs(0x96fee678)}
				quit_network_game
				get_custom_match_search_params
				set_network_preferences
				DWCJoinGame <...> join_friends = 0
				change num_matchmaking_tries = ($num_matchmaking_tries + 1)
				printf \{qs(0x0884516b)}
				printf ($num_matchmaking_tries)
			endif
		endif
	endif
	Wait \{0.1
		seconds}
	repeat
endscript

script start_invite_matchmaking \{action = HOST}
	if is_valid_instrument_config
		if NOT handle_online_SD_enumeration \{kick_back
				invite}
			return
		endif
		if (<action> = HOST)
			printf \{qs(0x7cdfddf5)}
			set_net_ui_to_searching friends = HOST friend_name = <friend_name> action = HOST
			set_net_dialog_message \{msg_checksum = friend_matchmaking}
			change \{net_new_matchmaking_ui_flag = 1}
			set_user_values_for_match
			get_custom_match_search_params
			set_network_preferences
			post_network_game controller = <device_num> who_can_join = friends friend_index = <friend_index>
			SpawnScript \{check_player_disconnect}
			OnlineLobbyInterface :GetTags
			<player_slots_menu_id> :Obj_SpawnScriptNow poll_for_controller_change_and_disconnect
		else
			printf \{qs(0x4046259a)}
			set_net_ui_to_searching friends = CLIENT friend_name = <friend_name> action = join
			change \{net_new_matchmaking_ui_flag = 1}
			set_user_values_for_match
			get_custom_match_search_params
			set_network_preferences
			DWCJoinGame <...> join_friends = 1 friend_index = <friend_index>
			SpawnScript check_invite_valid params = {friend_index = <friend_index>}
			OnlineLobbyInterface :GetTags
			<player_slots_menu_id> :Obj_SpawnScriptNow poll_for_controller_change_and_disconnect
		endif
	else
		menu_scroll_end_sound
		create_intrument_config_warning
	endif
endscript

script get_instruments_for_career_mode 
	i = 0
	num_guitars = 0
	drums_present = 0
	mic_present = 0
	begin
	if NetSessionFunc func = IsControllerInGame params = {controller = <i>}
		get_controller_type controller_index = <i>
		printf qs(0x84de2289) d = <controller_type>
		switch <controller_type>
			case guitar
			num_guitars = (<num_guitars> + 1)
			case drum
			drums_present = 1
			case Vocals
			mic_present = 1
		endswitch
	endif
	i = (<i> + 1)
	repeat 4
	return {
		num_guitars = <num_guitars>
		drums_present = <drums_present>
		mic_present = <mic_present>
	}
endscript
SD_SongStruct_Valid = 0
SD_Enumeration_Continue = 0

script SD_Enumeration_Do_Continue 
	change \{SD_Enumeration_Continue = 1}
	destroy_generic_popup
endscript

script handle_online_SD_enumeration 
	printf \{'---handle_online_SD_enumeration'}
	CNTSDCardWasEjected
	change \{SD_SongStruct = {
		}}
	change \{SD_SongStruct_Valid = 0}
	if NOT CNTSDIsCardPresent
		return \{true}
	endif
	if CNTSDIsCardUsable
		CNTSDGetContentIndices
		if NOT GotParam \{error}
			CNTSDCountSDSongs
			if (<SD_Song_Count> > $DLC_Max_Songs_On_SD)
				FormatText TextName = error $wii_DLC_SD_Too_Many_Songs d = ($DLC_Max_Songs_On_SD)
			endif
			if NOT GotParam \{error}
				CNTSDGetCatalogStatus
				if (<catalog_status> = wrong_wii)
					<error> = ($wii_CNTSD_RESULT_INCORRECT_DEVICE_catalog)
				endif
			endif
		endif
		if GotParam \{error}
			<index_array> = []
		endif
		GetArraySize \{GH4_download_songlist
			GlobalArray}
		<max_content_index> = (<array_size> + 1)
		GetArraySize <index_array>
		if (<array_size> > 0)
			<index> = 0
			begin
			<song_index> = (<index_array> [<index>])
			if (<song_index> > <max_content_index>)
				change \{SD_SongStruct_Valid = 0}
				change \{SD_SongStruct = {
					}}
				<error> = $wii_DLC_setlist_cannot_enumerate
				break
			endif
			if (<song_index> > 1)
				CNTGetFlags index = <song_index>
				if (<flag_owned> = true && <flag_present> = false && <flag_corrupt> = false)
					FormatText checksumname = song_checksum 'dlc%d' d = <song_index>
					change \{SD_SongStruct_Valid = 1}
					change SD_SongStruct = (($SD_SongStruct) + {<song_checksum>})
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	if CNTSDCardWasEjected
		<error> = ($wii_RA_message_SD_Card_Removed)
		<kick_back> = 1
		change \{SD_SongStruct_Valid = 0}
		change \{SD_SongStruct = {
			}}
	endif
	if NOT GotParam \{error}
		printstruct ($SD_SongStruct)
		if ($SD_SongStruct_Valid = 0)
			return \{true}
		elseif SD_CacheSizeCheck
			return \{true}
		endif
		if GotParam \{error_include_blocks}
			FormatText TextName = error <error> d = <blocks>
		endif
	endif
	change \{SD_SongStruct_Valid = 0}
	if GotParam \{error_SD_Corrupt_From_Usable}
		<error> = ($wii_RVLCNTSD_MESSAGE_0003)
	endif
	if GotParam \{error_include_name}
		FormatText TextName = error <error> s = $wii_RA_catalog_name
	endif
	change \{SD_Enumeration_Continue = 0}
	if GotParam \{kick_back}
		if got \{param
				invite}
			SetButtonEventMappings \{unblock_menu_input}
		endif
		FormatText TextName = errorText qs(0xdb9ce3ff) s = <error>
		create_new_generic_popup {
			popup_type = error_menu
			text = <errorText>
			error_func = destroy_generic_popup
		}
	else
		FormatText TextName = errorText qs(0xf3d5afc2) s = <error>
		<options> = [
			{
				func = SD_Enumeration_Do_Continue
				text = $wii_saveload_continue
			}
			{
				func = destroy_generic_popup
				text = $wii_saveload_cancel
			}
		]
		create_new_generic_popup {
			popup_type = message_options
			back_script = destroy_generic_popup
			title = $wii_error
			text = <errorText>
			options = <options>
			title_effect
		}
	endif
	begin
	if NOT ScreenElementExists \{id = Generic_PopupElement}
		break
	endif
	WaitOneGameFrame
	repeat
	if ($SD_Enumeration_Continue = 1)
		return \{true}
	else
		return \{false}
	endif
endscript
