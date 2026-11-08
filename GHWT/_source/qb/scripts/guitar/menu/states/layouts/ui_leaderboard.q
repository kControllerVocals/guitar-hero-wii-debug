
script ui_create_leaderboard 
	SetSoundBussParams \{Crowd_Beds = {
			vol = -100
			pitch = 0.0
		}
		time = 2}
	SetSoundBussParams \{Crowd_One_Shots = {
			vol = -100
			pitch = 0.0
		}
		time = 2}
	CreateScreenElement {
		parent = root_window
		id = LeaderboardInterface
		type = DescInterface
		desc = 'leaderboard'
		exclusive_device = ($lb_controller)
		z_priority = -100
	}
	if LeaderboardInterface :Desc_ResolveAlias \{name = alias_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SE_SetProps {
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
				{pad_up ui_leaderboard_scroll}
				{pad_down ui_leaderboard_scroll params = {down}}
				{pad_back generic_event_back}
				{pad_option2 generic_event_choose params = {state = UIstate_leaderboard_filter data = {is_popup}}}
				{pad_option generic_event_choose params = {state = UIstate_leaderboard_me data = {is_popup}}}
			]
			exclusive_device = ($lb_controller)
			alpha = 0
		}
		GetFriendsList \{established_only}
		ui_leadeboard_get_friends friendList = <friendList>
		current_menu :SetTags \{last_index = -1
			goto_bottom = 0
			can_scroll_down = 0}
		if GotParam \{my_data}
			current_menu :SetTags my_data = <my_data>
			if GotParam \{my_cash}
				current_menu :SetTags my_cash = <my_cash>
			endif
		else
			current_menu :SE_SetProps \{event_handlers = [
					{
						pad_option
						nullscript
					}
				]
				replace_handlers}
		endif
		CreateScreenElement \{parent = current_menu
			type = DescInterface
			desc = 'leaderboard_head'
			not_focusable
			autoSizeDims = false
			dims = (0.0, 220.0)}
		switch ($LeaderboardSearchValue)
			case 0
			search_title = qs("ALL TIME BEST")
			case 1
			search_title = qs("MY RANK")
			case 2
			search_title = qs("MY FRIENDS")
		endswitch
		ui_leaderboard_get_instrument_icon
		header_desc = 'leaderboard_row_header'
		if ($current_leaderboard_instrument = Band)
			header_desc = 'leaderboard_row_header_band'
			instrument_text = qs("Band Board")
		endif
		if ($current_leaderboard_group = song)
			get_song_title song = ($song_checksum)
			get_song_artist song = ($song_checksum)
			<id> :SE_SetProps {
				leaderboard_head_text = <instrument_text>
				leaderboard_artist_text = <song_artist>
				leaderboard_song_text = <song_title>
				leaderboard_type_text = <search_title>
			}
		else
			if ($current_leaderboard_id = lb_career_cash)
				<id> :SE_SetProps {
					leaderboard_head_text = qs("Rock Rank Board")
					leaderboard_artist_text = qs("Total Cash Earned")
					leaderboard_song_text = qs("\L")
					leaderboard_type_text = <search_title>
				}
			else
				ui_leaderboard_get_headers
				<id> :SE_SetProps {
					leaderboard_head_text = qs("Career Board")
					leaderboard_artist_text = qs("Career")
					leaderboard_song_text = <title>
					leaderboard_type_text = <search_title>
				}
			endif
		endif
		current_menu :SetTags title_id = <id>
		CreateScreenElement {
			parent = current_menu
			type = DescInterface
			desc = <header_desc>
			not_focusable
			autoSizeDims = false
			dims = (0.0, 120.0)
		}
		<id> :SE_SetProps {
			rank_text = ($current_leaderboard_array [0].headers [0])
			name_text = ($current_leaderboard_array [0].headers [1])
			score_text = ($current_leaderboard_array [0].headers [2])
			icon_texture = <instrument_icon>
			not_focusable
		}
		current_menu :SetTags header_id = <id>
		if (($current_leaderboard_group = Cash) || ($current_leaderboard_group = career))
			if <id> :Desc_ResolveAlias name = alias_difficulty_container
				<resolved_id> :Die
			endif
		endif
		item_desc = 'leaderboard_row'
		if ($current_leaderboard_instrument = Band)
			item_desc = 'leaderboard_row_band'
		endif
		array = []
		i = 0
		begin
		CreateScreenElement {
			parent = current_menu
			type = DescInterface
			desc = <item_desc>
			autoSizeDims = false
			dims = (0.0, 45.0)
			event_handlers = [
				{focus ui_leaderboard_item_focus}
				{unfocus ui_leaderboard_item_unfocus}
			]
			tags = {index = <i>}
		}
		if isXenon
			<id> :SE_SetProps event_handlers = [{pad_start ui_leaderboard_show_gamercard}]
		endif
		AddArrayElement array = <array> element = <id>
		i = (<i> + 1)
		repeat 10
		current_menu :SetTags Menu_items = <array>
		current_menu :SE_SetProps \{alpha = 1.0
			time = 0.1}
	endif
	ui_leaderboard_add_helper_text
endscript

script ui_leaderboard_item_focus \{time = 0.1}
	GetTags
	SE_GetProps
	current_menu :GetSingleTag \{my_data}
	current_menu :GetSingleTag \{friendList}
	bg_rgba = [25 , 80 , 95 , 128]
	if isXenon
		if GotParam \{friendList}
			GetArraySize <friendList>
			i = 0
			begin
			if ((<friendList> [<i>].name) = <name_text>)
				break
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if GotParam \{my_data}
		if ((<my_data> [1]) = <name_text>)
			bg_rgba = [255 , 185 , 0 , 255]
		endif
	endif
	i = 1
	begin
	GetPlayerInfo <i> gamertag
	if (<gamertag> = <name_text>)
		bg_rgba = [255 , 185 , 0 , 255]
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	SE_SetProps bg_rgba = <bg_rgba>
	<ratio> = (<index> / 9.0)
	pos = ((0.0, 1.0) * ((<ratio> * 270) - 135))
	LeaderboardInterface :SE_SetProps leaderboard_scrollthumb_pos = <pos> time = <time>
endscript

script ui_leaderboard_item_unfocus 
	SE_GetProps
	current_menu :GetSingleTag \{my_data}
	current_menu :GetSingleTag \{friendList}
	bg_rgba = [200 200 200 255]
	if isXenon
		if GotParam \{friendList}
			GetArraySize <friendList>
			i = 0
			begin
			if ((<friendList> [<i>].name) = <name_text>)
				bg_rgba = [200 , 235 , 255 , 255]
				break
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if GotParam \{my_data}
		if ((<my_data> [1]) = <name_text>)
			bg_rgba = [255 , 225 , 160 , 255]
		endif
	endif
	i = 1
	begin
	GetPlayerInfo <i> gamertag
	if (<gamertag> = <name_text>)
		bg_rgba = [255 , 225 , 160 , 255]
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	SE_SetProps bg_rgba = <bg_rgba>
endscript

script ui_return_leaderboard 
	current_menu :GetTags
	switch ($LeaderboardSearchValue)
		case 0
		search_title = qs("ALL TIME BEST")
		case 1
		search_title = qs("MY RANK")
		case 2
		search_title = qs("MY FRIENDS")
	endswitch
	<title_id> :SE_SetProps {
		leaderboard_type_text = <search_title>
	}
	ui_leaderboard_add_helper_text
endscript

script ui_destroy_leaderboard 
	SetSoundBussParams {Crowd_Beds = {vol = (($Default_BussSet.Crowd_Beds.vol)) pitch = 0.0} time = 1}
	SetSoundBussParams {Crowd_One_Shots = {vol = (($Default_BussSet.Crowd_One_Shots.vol)) pitch = 0.0} time = 1}
	clean_up_user_control_helpers
	DestroyScreenElement \{id = LeaderboardInterface}
endscript

script ui_leaderboard_add_helper_text 
	clean_up_user_control_helpers
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs("BACK") button = red <all_button_params> z = 100
	add_user_control_helper text = qs("FILTERS") button = Yellow <all_button_params> z = 100
	current_menu :GetSingleTag \{my_data}
	if GotParam \{my_data}
		add_user_control_helper text = qs("MY RANK") button = Blue <all_button_params> z = 100
	endif
	if isXenon
		add_user_control_helper text = qs("GAMER CARD") button = start <all_button_params> z = 100
	endif
endscript

script ui_leaderboard_show_gamercard 
	GetTags
	if GotParam \{player_xuid}
		if NOT (<player_xuid> = 0)
			NetSessionFunc func = showGamerCard params = {player_xuid = <player_xuid>}
		endif
	endif
endscript

script ui_leaderboard_update_rows 
	printf \{qs("\L--- ui_leaderboard_update_rows")}
	if NOT ScreenElementExists \{id = current_menu}
		ScriptAssert \{qs("\LLeaderboard menu doesn't exist")}
		return
	endif
	current_menu :GetSingleTag \{Menu_items}
	current_menu :GetSingleTag \{my_data}
	current_menu :GetSingleTag \{friendList}
	if GotParam \{leaderboard_data}
		current_menu :SetTags \{can_scroll_down = 1}
		<i> = 0
		GetArraySize <leaderboard_data>
		leaderboard_data_size = <array_size>
		begin
		if (<leaderboard_data_size> <= 0)
			break
		endif
		current_id = (<Menu_items> [<i>])
		GetArraySize (<leaderboard_data> [<i>].data)
		<data_index> = (<array_size> - 1)
		if (($current_leaderboard_instrument) = Band)
			data_index = 2
		endif
		cash_alpha = 0
		GetArraySize \{cash_data}
		if ($current_leaderboard_group = Cash)
			if NOT (<array_size> = 0)
				if isXenon
					j = 0
					begin
					if (((<leaderboard_data> [<i>].player_xuid [0]) = (<cash_data> [<j>].player_xuid [0])) && ((<leaderboard_data> [<i>].player_xuid [1]) = (<cash_data> [<j>].player_xuid [1])))
						FormatText TextName = earnings '%e' e = (<cash_data> [<j>].data [2])
						StringToInteger \{earnings}
						cash_get_info_from_earnings earnings = <earnings>
						FormatText TextName = rank qs("\L%r") r = <rank>
						cash_alpha = 1
						break
					endif
					j = (<j> + 1)
					repeat <array_size>
				else
					FormatText TextName = earnings '%e' e = (<leaderboard_data> [<i>].data [<data_index>])
					StringToInteger \{earnings}
					cash_get_info_from_earnings earnings = <earnings>
					FormatText TextName = rank qs("\L%r") r = <rank>
					cash_alpha = 1
				endif
			endif
		endif
		<current_id> :SE_SetProps {
			rank_text = (<leaderboard_data> [<i>].data [0])
			name_text = (<leaderboard_data> [<i>].data [1])
			data_text = (<leaderboard_data> [<i>].data [<data_index>])
			cash_alpha = <cash_alpha>
			cash_icon_texture = <cash_icon_id>
			cash_rank_text = <rank>
		}
		if (($current_leaderboard_group = Cash) || ($current_leaderboard_group = career))
			if <current_id> :Desc_ResolveAlias name = alias_difficulty_container
				<resolved_id> :Die
			endif
		endif
		if ($current_leaderboard_instrument = Band)
			if isXenon
				if <current_id> :Desc_ResolveAlias name = alias_difficulty_container
					if GetScreenElementChildren id = <resolved_id>
						GetArraySize <children>
						j = 0
						begin
						RemoveParameter \{difficulty_icon}
						RemoveParameter \{difficulty_alpha}
						ui_leaderboard_get_difficulty_icon num = (<leaderboard_data> [<i>].data [(<j> + 3)])
						if NOT GotParam \{difficulty_icon}
							difficulty_icon = icon_difficulty_easy
						endif
						child_id = (<children> [<j>])
						<child_id> :SE_SetProps {
							texture = <difficulty_icon>
							alpha = <difficulty_alpha>
						}
						j = (<j> + 1)
						repeat <array_size>
					endif
				endif
			endif
		else
			if (<data_index> = 3)
				RemoveParameter \{difficulty_icon}
				RemoveParameter \{difficulty_alpha}
				ui_leaderboard_get_difficulty_icon num = (<leaderboard_data> [<i>].data [2])
				<current_id> :SE_SetProps {
					difficulty_texture = <difficulty_icon>
					difficulty_alpha = <difficulty_alpha>
				}
			endif
		endif
		if isXenon
			<current_id> :SetTags player_xuid = (<leaderboard_data> [<i>].player_xuid)
		endif
		bg_rgba = [200 200 200 255]
		if GotParam \{my_data}
			if ((<my_data> [0]) = (<leaderboard_data> [<i>].data [0]))
				bg_rgba = [255 , 225 , 160 , 255]
			endif
		endif
		if isXenon
			if GotParam \{friendList}
				GetArraySize <friendList>
				j = 0
				begin
				if ((<friendList> [<j>].name) = (<leaderboard_data> [<i>].data [1]))
					bg_rgba = [200 , 235 , 255 , 255]
					break
				endif
				j = (<j> + 1)
				repeat <array_size>
			endif
		endif
		<current_id> :SE_SetProps bg_rgba = <bg_rgba>
		<i> = (<i> + 1)
		repeat <leaderboard_data_size>
		if (<leaderboard_data_size> < 10)
			current_menu :SetTags \{can_scroll_down = 0}
			filler = (10 - <leaderboard_data_size>)
			begin
			current_id = (<Menu_items> [<i>])
			<current_id> :SE_SetProps {
				rank_text = qs("\L")
				name_text = qs("\L")
				data_text = qs("\L")
				cash_alpha = 0
			}
			if ($current_leaderboard_instrument = Band)
				if isXenon
					if <current_id> :Desc_ResolveAlias name = alias_difficulty_container
						if GetScreenElementChildren id = <resolved_id>
							GetArraySize <children>
							j = 0
							begin
							RemoveParameter \{difficulty_icon}
							RemoveParameter \{difficulty_alpha}
							ui_leaderboard_get_difficulty_icon \{num = qs("0")}
							child_id = (<children> [<j>])
							<child_id> :SE_SetProps {
								texture = <difficulty_icon>
								alpha = <difficulty_alpha>
							}
							j = (<j> + 1)
							repeat <array_size>
						endif
					endif
				endif
			else
				RemoveParameter \{difficulty_icon}
				RemoveParameter \{difficulty_alpha}
				ui_leaderboard_get_difficulty_icon \{num = qs("0")}
				<current_id> :SE_SetProps {
					difficulty_texture = <difficulty_icon>
					difficulty_alpha = <difficulty_alpha>
				}
			endif
			if isXenon
				<current_id> :SetTags player_xuid = 0
			endif
			<current_id> :SE_SetProps bg_rgba = [200 200 200 255]
			<i> = (<i> + 1)
			repeat <filler>
		endif
	else
		printf \{qs("\LDid not recieve leaderboard information")}
	endif
	current_menu :GetSingleTag \{goto_bottom}
	if GotParam \{my_leaderboard}
		i = 0
		if GotParam \{my_data}
			begin
			if ((<my_data> [1]) = (<leaderboard_data> [<i>].data [1]))
				break
			endif
			i = (<i> + 1)
			repeat 10
		endif
		ui_event_wait event = menu_back data = {selected_index = (<i> + 2)}
	elseif (<goto_bottom> = 0)
		ui_event_wait \{event = menu_back
			data = {
				selected_index = 0
			}}
	else
		current_menu :SetTags \{goto_bottom = 0}
		ui_event_wait \{event = menu_back
			data = {
				selected_index = 11
			}}
	endif
	current_menu :SE_SetProps \{alpha = 1.0
		time = 0.1}
endscript

script ui_leaderboard_get_difficulty_icon \{num = qs("0")}
	difficulty_icon = icon_difficulty_easy
	difficulty_alpha = 1
	if NOT (($current_leaderboard_instrument) = Band)
		switch <num>
			case qs("0")
			difficulty_icon = icon_difficulty_easy
			difficulty_alpha = 0
			case qs("1")
			difficulty_icon = icon_difficulty_easy
			case qs("2")
			difficulty_icon = icon_difficulty_medium
			case qs("3")
			difficulty_icon = icon_difficulty_hard
			case qs("4")
			difficulty_icon = icon_difficulty_expert
		endswitch
	else
		switch <num>
			case qs("0")
			difficulty_icon = icon_difficulty_easy
			difficulty_alpha = 0
			case qs("1")
			difficulty_icon = icon_difficulty_beginner
			case qs("2")
			difficulty_icon = icon_difficulty_easy
			case qs("3")
			difficulty_icon = icon_difficulty_medium
			case qs("4")
			difficulty_icon = icon_difficulty_hard
			case qs("5")
			difficulty_icon = icon_difficulty_expert
		endswitch
	endif
	return {difficulty_icon = <difficulty_icon> difficulty_alpha = <difficulty_alpha>}
endscript

script ui_leaderboard_get_instrument_icon 
	switch ($current_leaderboard_instrument)
		case guitar
		return \{instrument_icon = mixer_icon_guitar
			instrument_text = qs("Guitar Board")}
		case backup
		return \{instrument_icon = mixer_icon_bass
			instrument_text = qs("Bass Board")}
		case Drums
		return \{instrument_icon = mixer_icon_drums
			instrument_text = qs("Drum Board")}
		case mic
		return \{instrument_icon = mixer_icon_vox
			instrument_text = qs("Vocal Board")}
	endswitch
endscript

script ui_leaderboard_get_headers 
	columns = [0]
	if ($current_leaderboard_group = song)
		<columns> = ($current_leaderboard_array [0].column_ids)
		<headers> = ($current_leaderboard_array [0].headers)
		get_song_title song = ($song_checksum)
		<title> = <song_title>
	else
		GetArraySize ($current_leaderboard_array)
		array_entry = 0
		begin
		if ((($current_leaderboard_array) [<array_entry>].leaderboard_id) = ($current_leaderboard_id))
			<columns> = (($current_leaderboard_array) [<array_entry>].column_ids)
			<headers> = (($current_leaderboard_array) [<array_entry>].headers)
			<title> = (($current_leaderboard_array) [<array_entry>].title)
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
	endif
	return {columns = <columns> headers = <headers> title = <title>}
endscript

script ui_leaderboard_scroll 
	Wait \{1
		gameframe}
	Obj_GetID
	SetScreenElementLock id = <ObjID> lock
	SetScreenElementLock id = <ObjID> unlock
	Menu_GetSelectedIndex
	GetSingleTag \{last_index}
	SetTags last_index = <selected_index>
	if NOT GotParam \{last_index}
		return
	endif
	if Is_ui_event_running
		return
	endif
	if GotParam \{down}
		GetSingleTag \{can_scroll_down}
		if ((<can_scroll_down> = 1) && (<last_index> = <selected_index>))
			prev_offset = ($lb_offset)
			change lb_offset = ($lb_offset + 10)
			SetTags \{last_index = 2}
			generic_event_choose state = UIstate_leaderboard_load data = {is_popup prev_offset = <prev_offset> offset}
		endif
	else
		if (<last_index> = <selected_index>)
			prev_offset = ($lb_offset)
			if ($lb_offset <= 1)
				printf \{qs("\Lat very top... returning")}
				return
			elseif ($lb_offset < 11)
				change \{lb_offset = 1}
			else
				change lb_offset = ($lb_offset - 10)
			endif
			SetTags \{last_index = 11
				goto_bottom = 1}
			generic_event_choose state = UIstate_leaderboard_load data = {is_popup prev_offset = <prev_offset> offset}
		endif
	endif
endscript

script ui_leadeboard_get_friends 
	if ScreenElementExists \{id = current_menu}
		if GotParam \{friendList}
			GetArraySize <friendList>
			if (<array_size> > 0)
				current_menu :SetTags friendList = <friendList>
			endif
		endif
	endif
endscript

script ui_leaderboard_view_current_song \{my_song = $current_song}
	printf \{'ui_leaderboard_view_current_song'}
	if isXenon
		change lb_controller = <device_num>
	elseif IsPs3
		get_all_exclusive_devices
		change lb_controller = <exclusive_device>
	endif
	signin_params = {local}
	if IsPs3
		signin_params = {}
	endif
	if NOT CheckForSignIn <signin_params> controller_index = <device_num>
		ui_event_wait \{event = menu_change
			data = {
				state = UIstate_leaderboard_timeout
			}}
		return
	endif
	lb_offset = 1
	change \{current_leaderboard_group = song}
	if isXenon
		change \{current_leaderboard_array = $master_leaderboard_song_list}
	else
		change \{current_leaderboard_array = $master_leaderboard_song_list_ps3}
	endif
	change song_checksum = <my_song>
	if ($current_num_players > 1 && $boss_battle != 1)
		<instrument> = 'band'
	else
		get_player_num_from_controller controller_index = <device_num>
		GetPlayerInfo <player_num> part
		if (<part> = Vocals)
			instrument = 'mic'
		elseif (<part> = Bass)
			instrument = 'backup'
		elseif (<part> = drum)
			instrument = 'drums'
		else
			<instrument> = ($part_list_props.<part>.text_nl)
		endif
	endif
	FormatText checksumname = instrument_checksum '%i' i = <instrument>
	change current_leaderboard_instrument = <instrument_checksum>
	get_song_prefix song = ($song_checksum)
	FormatText checksumname = leaderboard_id '%s_%i' s = <song_prefix> i = <instrument> AddToStringLookup = true
	change current_leaderboard_id = <leaderboard_id>
	if IsPs3
		if NetSessionFunc \{func = is_lobby_available}
			ui_leaderboard_view_current_song_continue
		else
			NetSessionFunc \{func = onlinesignin
				params = {
					callback = ui_leaderboard_view_current_song_continue
				}}
		endif
	else
		ui_leaderboard_view_current_song_continue
	endif
endscript

script ui_leaderboard_view_current_song_continue 
	generic_event_choose \{state = UIstate_leaderboard_load
		data = {
			my_status
		}}
endscript
