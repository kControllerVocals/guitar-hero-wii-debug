host_songs_to_pick = 0
client_songs_to_pick = 0
tie_breaker = HOST
num_songs = num_1
player1_color = [
	0
	200
	100
	255
]
player2_color = [
	200
	0
	100
	255
]
net_setlist_songs = [
	null
	null
	null
	null
	null
	null
	null
]
net_setlist_tiers = [
	0
	0
	0
	0
	0
	0
	0
]
net_song_num = 0
net_song_countdown = 0
g_tie_breaker_song = 0
g_disable_song_chooser_spinner = 0

script create_setlist_popup 
	if ($net_new_matchmaking_ui_flag = 1)
		if GotParam \{parent_element}
			create_net_ui parent_element = <parent_element>
		else
			create_net_ui
		endif
	else
		get_number_of_songs
		ui_print_gamertags \{pos1 = (240.0, 70.0)
			pos2 = (1045.0, 70.0)
			dims = (400.0, 45.0)
			just1 = [
				left
				top
			]
			just2 = [
				right
				top
			]}
		if (ScreenElementExists id = net_setlist_popup_container)
			return
		endif
		create_ready_icons \{pos1 = (290.0, 170.0)
			pos2 = (850.0, 150.0)}
		if ($g_tie_breaker_song = 0)
			reset_setlist
			reset_net_stats_menu
			change \{net_song_num = 0}
		endif
		if ((<num_songs> = 1) || ($game_mode = p2_coop))
			set_final_song_selection
		endif
	endif
endscript

script destroy_setlist_popup 
	destroy_gamertags
	destroy_menu \{menu_id = net_setlist_popup_container}
	destroy_ready_icons
endscript

script net_request_song 
	change \{net_permision_to_select_song = 0}
	if NOT search_for_tool_in_quickplay_list song = ($current_song)
		if (($current_level) = load_z_tool)
			change \{current_level = load_z_newyork}
		endif
	endif
	SendStructure callback = net_song_selected data_to_send = {song_checksum = ($current_song) level_checksum = ($current_level)}
	if IsHost
		KillSpawnedScript \{name = setlist_SD_online_poll_for_removal}
		change \{net_song_countdown = 1}
		if ScreenElementExists \{id = net_setlist_helper_text}
			net_setlist_helper_text :Obj_SpawnScriptLater song_selected_countdown params = {song_checksum = ($current_song)}
		endif
	endif
endscript

script net_song_selected 
	RequireParams \{[
			song_checksum
			level_checksum
		]
		all}
	spawnscriptnow \{destroy_setlist_songpreview_monitor}
	change current_song = <song_checksum>
	change current_level = <level_checksum>
	if IsHost
		SendStructure callback = net_song_selected data_to_send = {song_checksum = ($current_song) level_checksum = ($current_level)}
	endif
	KillSpawnedScript \{name = setlist_SD_online_poll_for_removal}
	change \{net_song_countdown = 1}
	ui_event_get_top
	if (<base_name> = 'online_quit_warning')
		generic_event_back
	endif
	if ScreenElementExists \{id = net_setlist_spinner}
		destroy_net_setlist_spinner
	endif
	ui_event_wait_for_safe
	wait_time = 0
	begin
	if ScreenElementExists \{id = net_setlist_helper_text}
		break
	endif
	if (<wait_time> > 3)
		break
	endif
	Wait \{1.0
		seconds}
	<wait_time> = (<wait_time> + 1)
	repeat
	if ScreenElementExists \{id = net_setlist_helper_text}
		net_setlist_helper_text :Obj_SpawnScriptLater song_selected_countdown params = {song_checksum = <song_checksum>}
	endif
endscript

script create_song_chooser_spinner 
	printf \{qs("\L---create_song_chooser_spinner")}
	LaunchEvent \{type = unfocus
		target = setlist_menu}
	change \{net_song_countdown = 0}
	clean_up_user_control_helpers
	setlist_popup_z = ($setlist_text_z + 50.0)
	if IsNgc
		message_text = $wii_download_notice
	else
		message_text = qs("All players must have the same Downloaded Song in order to play it in Xbox LIVE multiplayer games.")
	endif
	CreateScreenElement {
		id = net_setlist_spinner
		type = DescInterface
		desc = 'net_setlist_spinner'
		parent = SetlistInterface
		z_priority = <setlist_popup_z>
		alpha = 0.0
		message_text = <message_text>
		not_focusable
	}
	net_setlist_spinner :SE_SetProps net_spinner_name_text = ($gamertag_0)
	if NOT GotParam \{selected_index}
		selected_index = 0
	endif
	net_setlist_spinner :Obj_SpawnScriptLater spin_names params = {selected_index = <selected_index>}
endscript
online_length_of_spinner = 5

script online_song_choose_spin 
	getnumplayers
	total_time = 0
	wait_time = 0.025
	player_index = 0
	begin
	FormatText checksumname = gamertag 'gamertag_%d' d = <player_index>
	name = $<gamertag>
	SoundEvent \{event = GhMix_Scroll_Up_Down}
	if ScreenElementExists \{id = net_spinner_text}
		net_spinner_text :SE_SetProps text = <name>
	endif
	GetPlayerInfo (<player_index> + 1) net_obj_id
	if ((<wait_time> > 0.75) && ($online_song_choice_id = <net_obj_id>))
		break
	endif
	Wait <wait_time> seconds
	<wait_time> = (<wait_time> * 1.1)
	if (<player_index> = (<num_players> - 1))
		<player_index> = 0
	else
		<player_index> = (<player_index> + 1)
	endif
	repeat
	net_setlist_spinner_container :Obj_SpawnScriptLater kill_online_choose_spinner params = <...>
	i = 0
	begin
	if ScreenElementExists \{id = net_spinner_text}
		if (<i> = 0)
			SoundEvent \{event = GhMix_Select}
			net_spinner_text :SE_SetProps rgba = ($online_lobby_item_text_color)
		else
			SoundEvent \{event = GhMix_Select}
			net_spinner_text :SE_SetProps rgba = ($online_medium_blue)
		endif
	endif
	Wait \{0.1
		seconds}
	if (<i> = 0)
		<i> = 1
	else
		<i> = 0
	endif
	repeat
endscript

script kill_online_choose_spinner 
	Wait \{2.0
		seconds}
	destroy_net_setlist_spinner <...>
endscript

script destroy_net_setlist_spinner 
	printf \{qs("\Ldestroy_net_setlist_spinner")}
	destroy_spinner
	create_setlist_popup \{parent_element = SetlistInterface}
	if local_player_is_choosing_song
		add_user_control_helper \{text = qs("SELECT SONG")
			button = green
			z = 100}
	endif
	setlist_show_sort_helper_text
	setlist_show_jump_helper_text
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	if GotParam \{selected_index}
		LaunchEvent type = focus target = setlist_menu data = {child_index = <selected_index>}
	else
		printstruct <...>
		printf \{qs("\Ldidn't receive a selected index so we are not calling focus")}
	endif
	SpawnScriptLater \{setlist_songpreview_monitor}
endscript

script net_setlist_go_back 
	if ($player2_present = 0)
		SendNetMessage \{type = select_song
			song_checksum = 0}
	endif
endscript

script net_setlist_players_ready 
	Wait \{2
		seconds}
	printf \{qs("\LStarting net play with setlist:")}
	net_print_setlist
	change current_song = ($net_setlist_songs [($net_song_num)])
	SetGlobalTags Progression params = {current_tier = ($net_setlist_tiers [($net_song_num)])}
	if ($g_tie_breaker_song = 1)
		ui_flow_manager_respond_to_action \{action = continue_to_final_song}
	else
		if (IsHost)
			host_proceed_to_online_play
		endif
	endif
endscript

script net_print_setlist 
	GetArraySize \{$net_setlist_songs}
	array_count = 0
	begin
	printf qs("\L%c") c = ($net_setlist_songs [<array_count>])
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script get_selection_indeces 
	get_number_of_songs
	if ($net_song_num = (<num_songs> -1))
		songlist_index = ($net_song_num + 1)
		menu_selection_index = 1
	else
		total_selections = (<num_songs> / 2)
		if (<is_host_selection>)
			picks_left = $host_songs_to_pick
			if ($game_mode = p2_coop)
				<total_selections> = (<total_selections> + 1)
				songlist_index = (<num_songs> - ((<picks_left> - 1) * 2))
				if (<songlist_index> > <num_songs>)
					<songlist_index> = (<num_songs> + 1)
				endif
			else
				songlist_index = (<num_songs> - (<picks_left> * 2))
			endif
		else
			picks_left = $client_songs_to_pick
			songlist_index = (<num_songs> - ((<picks_left> * 2) - 1))
		endif
		menu_selection_index = ((<total_selections> - <picks_left>) + 1)
	endif
	return songlist_index = <songlist_index> menu_selection_index = <menu_selection_index>
endscript

script reset_setlist 
	printf \{qs("\L---reset_setlist")}
	get_number_of_song_selections
	change host_songs_to_pick = <song_selections>
	change client_songs_to_pick = <song_selections>
	if (IsHost)
		SetSongSelections
	endif
	GetArraySize \{$net_setlist_songs}
	array_count = 0
	begin
	SetArrayElement ArrayName = net_setlist_songs GlobalArray index = <array_count> newvalue = null
	SetArrayElement ArrayName = net_setlist_tiers GlobalArray index = <array_count> newvalue = 0
	<array_count> = (<array_count> + 1)
	repeat <array_size>
endscript

script get_number_of_song_selections 
	get_number_of_songs
	return song_selections = ((<num_songs> - 1) / 2)
endscript

script get_number_of_songs 
	switch ($num_songs)
		case num_1
		return \{num_songs = 1}
		case num_3
		return \{num_songs = 3}
		case num_5
		return \{num_songs = 5}
		case num_7
		return \{num_songs = 7}
	endswitch
endscript

script setlist_unready 
	LaunchEvent \{type = unfocus
		target = ready_container_p1}
	LaunchEvent \{type = focus
		target = current_menu}
	drop_out_ready_sign \{player = 1}
endscript

script create_net_ui \{parent_element = net_setlist_container}
	GameMode_GetNumPlayers
	index = 1
	<name> = qs("")
	begin
	GetPlayerInfo <index> net_obj_id
	if ($online_song_choice_id = <net_obj_id>)
		FormatText checksumname = gamertag 'gamertag_%d' d = (<index> - 1)
		<name> = $<gamertag>
		break
	endif
	<index> = (<index> + 1)
	repeat <num_players>
	if (<index> <= 8)
		GetPlayerInfo <index> is_local_client
		if (<is_local_client> = 1)
			FormatText TextName = message qs("%g you get to choose a song that rocks!") g = <name>
		else
			FormatText TextName = message qs("Who cares what song %g picks. You still get to rock out!") g = <name>
		endif
		setlist_popup_z = ($setlist_text_z + 50.0)
		CreateScreenElement {
			type = ContainerElement
			id = net_setlist_popup_container
			parent = <parent_element>
			pos = (320.0, -400.0)
			alpha = 0.75
		}
		menu_anchor = <id>
		CreateScreenElement {
			type = SpriteElement
			parent = <menu_anchor>
			texture = online_setlist_popup_bg
			dims = (1024.0, 256.0)
			pos = (320.0, -190.0)
			just = [center top]
			z_priority = <setlist_popup_z>
			alpha = 1.0
		}
		CreateScreenElement {
			type = TextBlockElement
			parent = <menu_anchor>
			id = net_setlist_helper_text
			font = fontgrid_text_a8
			scale = 0.7
			rgba = ($online_lobby_item_text_color)
			text = <message>
			just = [center top]
			internal_just = [center center]
			z_priority = (<setlist_popup_z> + 0.1)
			pos = (320.0, -25.0)
			dims = (1300.0, 100.0)
		}
		net_setlist_popup_container :SE_SetProps \{pos = (320.0, 110.0)
			time = 0.5}
	endif
endscript

script destroy_net_ui 
	if ScreenElementExists \{id = net_setlist_container}
		DestroyScreenElement \{id = net_setlist_container}
	endif
endscript

script song_selected_countdown 
	printf \{qs("\Lsong_selected_countdown")}
	get_song_title song = <song_checksum>
	i = 3
	begin
	if (<i> < 0)
		break
	endif
	FormatText TextName = msg qs("Starting %d in %i seconds") d = <song_title> i = <i>
	net_setlist_helper_text :SE_SetProps text = <msg>
	i = (<i> - 1)
	Wait \{1
		second}
	repeat
	if IsHost
		host_proceed_to_online_play
	endif
endscript

script spin_names 
	Obj_GetID
	<ObjID> :SE_SetProps alpha = 1.0 time = 0.1
	<ObjID> :SE_WaitProps
	Wait \{1
		seconds}
	GameMode_GetNumPlayers
	wait_time = 0.025
	player_index = 1
	begin
	SoundEvent \{event = GhMix_Scroll_Up_Down}
	<ObjID> :SE_SetProps net_spinner_text_pos = (0.0, -90.0) time = (<wait_time> / 2)
	<ObjID> :SE_WaitProps
	FormatText checksumname = gamertag 'gamertag_%d' d = <player_index>
	name = $<gamertag>
	<ObjID> :SE_SetProps net_spinner_name_text = <name>
	<ObjID> :SE_SetProps net_spinner_text_pos = (0.0, 90.0)
	<ObjID> :SE_SetProps net_spinner_text_pos = (0.0, 0.0) time = (<wait_time> / 2)
	<ObjID> :SE_WaitProps
	<wait_time> = (<wait_time> * 1.2)
	GetPlayerInfo (<player_index> + 1) net_obj_id
	if ((<wait_time> > 0.6) && ($online_song_choice_id = <net_obj_id>))
		break
	endif
	if (<player_index> = (<num_players> - 1))
		<player_index> = 0
	else
		<player_index> = (<player_index> + 1)
	endif
	repeat
	<ObjID> :Obj_SpawnScriptLater kill_online_choose_spinner params = {selected_index = <selected_index>}
	i = 0
	begin
	if (<i> = 0)
		SoundEvent \{event = GhMix_Select}
		<ObjID> :SE_SetProps net_spinner_text_color = ($online_lobby_item_text_color)
	else
		SoundEvent \{event = GhMix_Select}
		<ObjID> :SE_SetProps net_spinner_text_color = ($online_medium_blue)
	endif
	Wait \{0.1
		seconds}
	if (<i> = 0)
		<i> = 1
	else
		<i> = 0
	endif
	repeat
endscript

script destroy_spinner 
	if ScreenElementExists \{id = net_setlist_spinner}
		DestroyScreenElement \{id = net_setlist_spinner}
	endif
endscript
