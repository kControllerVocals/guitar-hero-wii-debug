
script create_leaderboard_menu 
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = leaderboard}
	create_menu_backdrop \{texture = xb_online_bg}
	if ($current_leaderboard_group = song)
		get_leaderboard_headers \{song = true}
		change lb_rating_value = (($LeaderboardDiffValue) + 1)
	else
		get_leaderboard_headers \{song = false}
		change \{lb_rating_value = 0}
	endif
	switch ($LeaderboardSearchValue)
		case 0
		search_title = qs(0x8ec67d7c)
		case 1
		search_title = qs(0xa1241173)
		case 2
		search_title = qs(0x258ad5d4)
	endswitch
	menu_backdrop_container :SetTags <...>
	if IsNgc
		menu_backdrop_container :GetTags
		if ($current_leaderboard_group = song)
			my_data = [qs(0x0cb4d476) qs("") qs("") qs(0xabfbfc18)]
		else
			my_data = [qs(0x0cb4d476) qs("") qs(0xabfbfc18)]
		endif
		new_leaderboard_menu {
			title = <title>
			my_data = <my_data>
			search_type_title = <search_title>
			column_pos = <column_pos>
			headers = <headers>
		}
		change \{user_control_pill_text_color = [
				255
				255
				255
				255
			]}
		change \{user_control_pill_color = [
				0
				0
				0
				255
			]}
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 100}
		add_user_control_helper \{text = qs("FILTERS")
			button = Yellow
			z = 100}
		if ($kickingToMain = 0)
			enable_network_wait_variable
		endif
		if (($current_leaderboard_group) = song)
			type = 1
		else
			type = 0
		endif
		if (($checking_coop_song_flag) = 1)
			coop_flag = true
		else
			coop_flag = false
		endif
		NetSessionFunc {
			obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = create_leaderboard_menu2
				listtype = <type>
				coop = <coop_flag>
				me = 1
				columns = <columns>
				num_rows = 1
				new_lb = ($new_leaderboard)
			}
		}
		change \{waiting_on_leaderboards = 1}
		Wait \{1
			gameframe}
		change \{new_leaderboard = 0}
		if ($kickingToMain = 0)
			create_generic_popup \{title = $wii_lb_title
				loading_window
				can_cancel
				message = $wii_lb_waiting
				wait_variable = network_wait_var
				cancel_eventhandlers = [
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
						exit_leaderboard
					}
				]}
		endif
	else
		create_leaderboard_loading_bar
		NetSessionFunc {
			obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = create_leaderboard_menu2
				listtype = me
				columns = <columns>
				num_rows = 1
			}
		}
	endif
endscript

script destroy_leaderboard_loading_bar 
	if ScreenElementExists \{id = net_leaderboards_loading_cont}
		DestroyScreenElement \{id = net_leaderboards_loading_cont}
	endif
endscript

script create_leaderboard_loading_bar 
	destroy_leaderboard_loading_bar
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = net_leaderboards_loading_cont
		z_priority = 1500
		just = [
			left
			top
		]
		pos = (570.0, 280.0)}
	<cont_id> = <id>
	CreateScreenElement {
		type = TextElement
		parent = <cont_id>
		font = fontgrid_text_a4
		text = qs("Loading")
		rgba = ($online_medium_blue)
		just = [left top]
		alpha = 0
	}
	text_id = <id>
	RunScriptOnScreenElement id = <text_id> leaderboard_loading_bar_animate
	RunScriptOnScreenElement id = <cont_id> leaderboard_loading_timeout_script
endscript

script leaderboard_loading_timeout_script 
	Wait \{10
		seconds}
	generic_event_back
endscript

script leaderboard_loading_bar_animate 
	Obj_GetID
	Wait \{0.5
		seconds}
	<ObjID> :SE_SetProps alpha = 1
	i = 0
	begin
	text = qs("Loading")
	switch (<i>)
		case 0
		text = qs("Loading")
		case 1
		text = qs(0x7b063d06)
		case 2
		text = qs("Loading..")
		case 3
		text = qs("Loading...")
	endswitch
	<ObjID> :SE_SetProps text = <text>
	Wait \{0.5
		seconds}
	i = (<i> + 1)
	if (<i> > 3)
		i = 0
	endif
	repeat
endscript

script create_leaderboard_menu2 
	printf \{qs(0x68991d37)}
	GetArraySize \{leaderboard_data}
	if (<array_size> > 0)
		my_data = (<leaderboard_data> [0].data)
	else
		if ($current_leaderboard_group = song)
			my_data = [qs(0x0cb4d476) qs("") qs("") qs(0xabfbfc18)]
		else
			my_data = [qs(0x0cb4d476) qs("") qs(0xabfbfc18)]
		endif
		SetScreenElementProps id = leaderboard_your_score text = (<my_data> [2])
	endif
	SpawnScriptLater create_leaderboard_menu3 params = {my_data = <my_data>}
endscript

script create_leaderboard_menu3 
	printf \{qs(0x71822c76)}
	if NOT IsNgc
		menu_backdrop_container :GetTags
		Wait \{1
			gameframes}
		new_leaderboard_menu {
			title = <title>
			my_data = <my_data>
			search_type_title = <search_title>
			column_pos = <column_pos>
			headers = <headers>
		}
	endif
	if ($lb_list_type = friends)
		change \{lb_offset = 0}
	endif
	request_leaderboard <...> <params>
	if NOT IsNgc
		change \{user_control_pill_text_color = [
				255
				255
				255
				255
			]}
		change \{user_control_pill_color = [
				0
				0
				0
				255
			]}
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 100}
		add_user_control_helper \{text = qs("FILTERS")
			button = Yellow
			z = 100}
		if isXenon
			add_user_control_helper \{text = qs("GAMER CARD")
				button = start
				z = 100}
		endif
	endif
endscript

script add_leaderboard_rows_to_menu 
	printf \{qs(0x65771e43)}
	if NOT IsNgc
		destroy_leaderboard_loading_bar
	elseif GotParam \{lastgroup}
		change lb_lastgroup = <lastgroup>
	endif
	if ($lb_list_type = me)
		if IsNgc
			change lb_offset = <offset>
			change lb_selection_index = <selection_index>
			change \{lb_list_type = none}
		else
			NetSessionFunc \{obj = match
				func = get_gamertag}
		endif
	endif
	if ScreenElementExists \{id = arrow_down}
		SetScreenElementProps id = arrow_down rgba = ($online_light_blue)
	endif
	if ScreenElementExists \{id = arrow_up}
		SetScreenElementProps id = arrow_up rgba = ($online_light_blue) flip_h
	endif
	if GotParam \{leaderboard_data}
		<array_count> = 0
		GetArraySize <leaderboard_data>
		begin
		if (<array_size> <= 0)
			break
		endif
		FormatText checksumname = leaderboard_rank 'leaderboard_entry_%i_rank' i = <array_count>
		FormatText checksumname = leaderboard_entry 'leaderboard_entry_%i_gamertag' i = <array_count>
		FormatText checksumname = leaderboard_name 'leaderboard_entry_%i_name' i = <array_count>
		FormatText checksumname = leaderboard_score 'leaderboard_entry_%i_score' i = <array_count>
		FormatText checksumname = leaderboard_difficulty 'leaderboard_entry_%i_difficulty' i = <array_count>
		FormatText TextName = rank qs("\L%a") a = (<leaderboard_data> [<array_count>].data [0])
		FormatText TextName = text qs("\L%a") a = (<leaderboard_data> [<array_count>].data [1])
		if ScreenElementExists id = <leaderboard_difficulty>
			if NOT IsNgc
				FormatText TextName = score qs("\L%a") a = (<leaderboard_data> [<array_count>].data [3])
				get_diff_string_from_string_num num = (<leaderboard_data> [<array_count>].data [2])
				FormatText TextName = difficulty qs(0x83f32bd8) a = <diff>
			else
				difficulty = qs(0x4d4eeee3)
				if ((<leaderboard_data> [<array_count>].data [3]) = qs("\Leasy"))
					difficulty = qs(0x4d4eeee3)
				elseif ((<leaderboard_data> [<array_count>].data [3]) = qs("\Lmedium"))
					difficulty = qs(0x88fac60c)
				elseif ((<leaderboard_data> [<array_count>].data [3]) = qs("\Lhard"))
					difficulty = qs(0xbf24363e)
				elseif ((<leaderboard_data> [<array_count>].data [3]) = qs("\Lexpert"))
					difficulty = qs(0x0516d532)
				endif
				FormatText TextName = score qs("\L%a") a = (<leaderboard_data> [<array_count>].data [2])
			endif
		else
			FormatText TextName = score qs("\L%a") a = (<leaderboard_data> [<array_count>].data [2])
		endif
		<leaderboard_rank> :SE_SetProps text = <rank>
		<leaderboard_entry> :SE_SetProps unblock_events
		<leaderboard_rank> :SE_SetProps text = <rank>
		if NOT IsNgc
			<leaderboard_entry> :SetTags player_xuid = (<leaderboard_data> [<array_count>].player_xuid)
			<leaderboard_score> :SE_SetProps text = <score>
			<leaderboard_name> :SE_SetProps text = <text>
		endif
		fit_text_into_menu_item id = <leaderboard_score> max_width = 175
		fit_text_into_menu_item id = <leaderboard_name> max_width = 220
		if ScreenElementExists id = <leaderboard_difficulty>
			<leaderboard_difficulty> :SE_SetProps text = <difficulty>
		endif
		if NOT IsNgc
			if ($lb_list_type = me)
				if (<name> = (<leaderboard_data> [<array_count>].data [1]))
					change lb_offset = <offset>
					change lb_selection_index = <array_count>
					change \{lb_list_type = none}
				endif
			endif
		endif
		if ($lb_list_type = rating)
			change lb_offset = <offset>
			change \{lb_list_type = none}
		endif
		<array_count> = (<array_count> + 1)
		repeat <array_size>
		if (<array_count> < 10)
			change \{lb_lastgroup = 1}
			change lb_last_index = (<array_count> - 1)
			begin
			if (<array_count> >= 10)
				break
			endif
			FormatText checksumname = leaderboard_rank 'leaderboard_entry_%i_rank' i = <array_count>
			FormatText checksumname = leaderboard_entry 'leaderboard_entry_%i_gamertag' i = <array_count>
			FormatText checksumname = leaderboard_score 'leaderboard_entry_%i_score' i = <array_count>
			FormatText checksumname = leaderboard_difficulty 'leaderboard_entry_%i_difficulty' i = <array_count>
			<leaderboard_rank> :SE_SetProps text = qs("\L")
			SetScreenElementProps {
				id = {<leaderboard_entry> child = the_text}
				text = qs("\L")
			}
			<leaderboard_entry> :SE_SetProps block_events
			<leaderboard_score> :SE_SetProps text = qs("\L")
			<leaderboard_difficulty> :SE_SetProps text = qs("\L")
			<array_count> = (<array_count> + 1)
			repeat
		else
			change \{lb_last_index = 9}
			printf \{qs(0xe184c09f)}
		endif
	else
		printf \{qs(0xcd9cf27d)}
	endif
	FormatText checksumname = leaderboard_entry 'leaderboard_entry_%i_gamertag' i = ($lb_selection_index)
	if IsNgc
		clear_network_wait_variable
	endif
	gamertag_vmenu :Obj_SpawnScriptLater return_focus_to_leaderboard params = {target = <leaderboard_entry>}
endscript

script return_focus_to_leaderboard 
	Wait \{0.8
		seconds}
	LaunchEvent type = focus target = gamertag_vmenu data = {child_id = <target>}
	if ($lb_list_type = me)
		LaunchEvent type = focus target = <target>
	endif
endscript

script destroy_leaderboard_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = online_leaderboard_menu}
	destroy_menu_backdrop
	if ScreenElementExists \{id = leaderboard_container}
		DestroyScreenElement \{id = leaderboard_container}
	endif
	if ScreenElementExists \{id = leaderboard_filter_container}
		DestroyScreenElement \{id = leaderboard_filter_container}
	endif
endscript

script get_leaderboard_headers \{song = true}
	GetArraySize ($current_leaderboard_array)
	if (<song> = true)
		if isXenon
			<columns> = ($master_leaderboard_song_list [0].column_ids)
			<headers> = ($master_leaderboard_song_list [0].headers)
			column_pos = ($master_leaderboard_song_list [0].column_pos)
		elseif IsNgc
			<columns> = ($master_leaderboard_song_list_ngc [0].column_ids)
			<headers> = ($master_leaderboard_song_list_ngc [0].headers)
			column_pos = ($master_leaderboard_song_list_ngc [0].column_pos)
		else
			<columns> = ($master_leaderboard_song_list_ps3 [0].column_ids)
			<headers> = ($master_leaderboard_song_list_ps3 [0].headers)
			column_pos = ($master_leaderboard_song_list_ps3 [0].column_pos)
		endif
		if ($checking_coop_song_flag = 1)
			get_song_title song = ($song_checksum)
			FormatText TextName = title qs(0x2b84b057) s = <song_title>
		else
			get_song_title song = ($current_leaderboard_id)
			<title> = <song_title>
		endif
	else
		GetArraySize ($current_leaderboard_array)
		array_entry = 0
		begin
		if ((($current_leaderboard_array) [<array_entry>].leaderboard_id) = ($current_leaderboard_id))
			<columns> = (($current_leaderboard_array) [<array_entry>].column_ids)
			<headers> = (($current_leaderboard_array) [<array_entry>].headers)
			<title> = (($current_leaderboard_array) [<array_entry>].title)
			column_pos = (($current_leaderboard_array) [<array_entry>].column_pos)
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
	endif
	return columns = <columns> headers = <headers> title = <title> column_pos = <column_pos>
endscript

script leaderboard_previous_leaderboard 
	get_prev_leaderboard_from_checksum leaderboard = ($current_leaderboard_id)
	change current_leaderboard_id = <leaderboard>
	ui_event \{event = menu_refresh}
endscript

script leaderboard_next_leaderboard 
	get_next_leaderboard_from_checksum leaderboard = ($current_leaderboard_id)
	change current_leaderboard_id = <leaderboard>
	ui_event \{event = menu_refresh}
endscript

script leaderboard_back_action 
	generic_event_back
endscript

script submit_filter_query 
	SetButtonEventMappings \{block_menu_input}
	change \{in_leaderboard_filter = 0}
	switch ($LeaderboardSearchValue)
		case 0
		change \{lb_list_type = rating}
		case 1
		change \{lb_list_type = me}
		case 2
		change \{lb_list_type = friends}
	endswitch
	change \{lb_offset = 0}
	change \{new_leaderboard = 1}
	if (($current_leaderboard_group = song) && ($LeaderboardSongTypeValue = 1))
		if NOT IsNgc
			FormatText checksumname = coop_song_checksum 'lb_coop_%s' s = ($current_leaderboard_id) DontAssertForChecksums
			change \{current_leaderboard_id = coop_song_checksum}
		endif
		change \{checking_coop_song_flag = 1}
	elseif (($current_leaderboard_group = song) && ($LeaderboardSongTypeValue = 0))
		change current_leaderboard_id = ($song_checksum)
		change \{checking_coop_song_flag = 0}
	endif
	if ScreenElementExists \{id = leaderboard_filter_container}
		DestroyScreenElement \{id = leaderboard_filter_container}
	endif
	if ScreenElementExists \{id = leaderboard_container}
		DestroyScreenElement \{id = leaderboard_container}
	endif
	if ScreenElementExists \{id = menu_backdrop_container}
		DestroyScreenElement \{id = menu_backdrop_container}
	endif
	clean_up_user_control_helpers
	ui_event \{event = menu_refresh}
endscript

script new_leaderboard_menu 
	printf \{qs(0x9b67a9ec)}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = leaderboard_container
		just = [
			left
			top
		]
		pos = (0.0, 0.0)}
	anchor_id = <id>
	CreateScreenElement {
		type = SpriteElement
		id = net_leaderboard_bg
		texture = xb_online_frame_large
		parent = <anchor_id>
		just = [left top]
		pos = (60.0, 40.0)
	}
	scale_element_to_size {
		id = <id>
		target_width = 1170
		target_height = 600
	}
	create_leaderboard_headers {
		parent = <anchor_id>
		headers = <headers>
		column_pos = <column_pos>
	}
	text_scale = (0.8, 1.0)
	CreateScreenElement {
		type = TextElement
		parent = <anchor_id>
		id = current_leaderboard_title_extra
		font = fontgrid_title_a1
		scale = <text_scale>
		rgba = ($online_dark_purple)
		text = <search_type_title>
		just = [right top]
		pos = (590.0, 85.0)
		z_priority = 20
	}
	fit_text_into_menu_item id = <id> max_width = 320
	CreateScreenElement {
		type = TextElement
		parent = <anchor_id>
		id = current_leaderboard_title
		font = fontgrid_title_a1
		scale = <text_scale>
		rgba = [210 210 210 250]
		text = <title>
		just = [left top]
		pos = (610.0, 85.0)
		z_priority = 10
	}
	fit_text_into_menu_item id = <id> max_width = 400
	CreateScreenElement {
		type = SpriteElement
		parent = <anchor_id>
		texture = xb_online_icon_player
		pos = (320.0, 250.0)
		id = net_leaderboard_icon
		z_priority = 10
		just = [left top]
		scale = 1.5
	}
	NetSessionFunc \{obj = match
		func = get_gamertag}
	CreateScreenElement {
		type = TextElement
		parent = <anchor_id>
		id = leaderboard_your_gamertag
		font = fontgrid_text_a4
		pos = (380.0, 350.0)
		text = <name>
		rgba = ($online_light_blue)
		z_priority = 20
		scale = (0.6, 0.8)
	}
	fit_text_into_menu_item id = <id> max_width = 220
	score = (<my_data> [2])
	if ((($current_leaderboard_id) = lb_faceoff_winratio) || (($current_leaderboard_id) = lb_pro_faceoff_winratio) || (($current_leaderboard_id) = lb_battle_winratio))
		if NOT ((<my_data> [2]) = qs(0xabfbfc18))
			winlosevalue = (<my_data> [2])
			WideStringToInteger \{winlosevalue}
			GetLeaderboardWinLoseValue winlosevalue = <winlosevalue>
			FormatText TextName = score qs("\L%a") a = <win> b = <lose>
		endif
	elseif ($current_leaderboard_group = song)
		if ((<my_data> [3]) = qs(0xabfbfc18))
			FormatText TextName = score qs("\L%a") a = (<my_data> [3])
		else
			get_diff_string_from_string_num num = (<my_data> [2])
			FormatText TextName = score qs(0x849938f5) a = (<my_data> [3]) b = <diff>
		endif
	endif
	CreateScreenElement {
		type = TextElement
		parent = <anchor_id>
		id = leaderboard_your_score
		font = fontgrid_text_a4
		pos = (370.0, 390.0)
		text = <score>
		rgba = ($online_light_purple)
		z_priority = 20
		scale = (0.5, 0.7)
		alpha = 1
	}
	CreateScreenElement {
		type = SpriteElement
		id = arrow_up
		texture = xb_online_arrow
		parent = <anchor_id>
		just = [left top]
		pos = (750.0, 195.0)
		z_priority = 20
		scale = 1
		rgba = ($online_light_blue)
	}
	<id> :SE_SetProps flip_h
	CreateScreenElement {
		type = SpriteElement
		id = arrow_down
		texture = xb_online_arrow
		parent = <anchor_id>
		just = [left top]
		pos = (750.0, 590.0)
		z_priority = 20
		scale = 1
		rgba = ($online_light_blue)
	}
	CreateScreenElement \{type = VScrollingMenu
		parent = leaderboard_container
		id = gamertag_scrolling_menu
		internal_just = [
			left
			top
		]
		just = [
			left
			top
		]
		dims = (400.0, 480.0)
		pos = (580.0, 210.0)}
	CreateScreenElement \{type = VMenu
		parent = gamertag_scrolling_menu
		id = gamertag_vmenu
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		event_handlers = [
			{
				pad_up
				leaderboard_scroll
				params = {
					dir = up
				}
			}
			{
				pad_down
				leaderboard_scroll
				params = {
					dir = down
				}
			}
			{
				pad_option2
				hide_unhide_current_leaderboard
				params = {
					hide
				}
			}
			{
				pad_option2
				create_leaderboard_filter_dialog
			}
			{
				pad_back
				leaderboard_back_action
			}
		]}
	array_count = 0
	color = black
	begin
	FormatText checksumname = leaderboard_rank 'leaderboard_entry_%i_rank' i = <array_count>
	FormatText checksumname = leaderboard_entry 'leaderboard_entry_%i_gamertag' i = <array_count>
	FormatText checksumname = leaderboard_name 'leaderboard_entry_%i_name' i = <array_count>
	FormatText checksumname = leaderboard_score 'leaderboard_entry_%i_score' i = <array_count>
	FormatText checksumname = leaderboard_difficulty 'leaderboard_entry_%i_difficulty' i = <array_count>
	CreateScreenElement {
		type = ContainerElement
		dims = (30.0, 35.0)
		parent = gamertag_vmenu
		id = <leaderboard_entry>
		event_handlers = [
			{focus leaderboard_custom_focus}
			{unfocus leaderboard_custom_unfocus}
			{pad_back leaderboard_back_action}
		]
	}
	if isXenon
		<id> :SE_SetProps event_handlers = [{pad_start show_gamercard}]
	endif
	cont_id = <id>
	text_scale = 0.65000004
	if IsNgc
		text_offset = (-80.0, 7.0)
	else
		text_offset = (-80.0, 0.0)
	endif
	CreateScreenElement {
		type = TextElement
		parent = <cont_id>
		id = <leaderboard_rank>
		local_id = rank
		font = fontgrid_text_a4
		scale = <text_scale>
		pos = (<text_offset> + (1.0, 0.0) * <column_pos> [0])
		rgba = ($online_light_blue)
		text = qs("-")
		just = [left top]
		z_priority = 10
	}
	CreateScreenElement {
		type = TextElement
		parent = <cont_id>
		id = <leaderboard_name>
		local_id = the_text
		font = fontgrid_text_a4
		scale = <text_scale>
		rgba = ($online_light_blue)
		text = qs("-")
		just = [left top]
		z_priority = 10
		pos = (<text_offset> + (1.0, 0.0) * <column_pos> [1])
	}
	CreateScreenElement {
		type = TextElement
		parent = <cont_id>
		local_id = score
		id = <leaderboard_score>
		font = fontgrid_text_a4
		scale = <text_scale>
		rgba = ($online_light_blue)
		text = qs("-")
		just = [right top]
		pos = (<text_offset> + (1.0, 0.0) * <column_pos> [2])
		block_events
		z_priority = 10
	}
	GetArraySize \{headers}
	if (<array_size> = 4)
		CreateScreenElement {
			type = TextElement
			parent = <cont_id>
			local_id = difficulty
			id = <leaderboard_difficulty>
			font = fontgrid_text_a4
			scale = <text_scale>
			rgba = ($online_light_blue)
			text = qs("-")
			just = [left top]
			pos = (<text_offset> + (1.0, 0.0) * <column_pos> [3])
			block_events
			z_priority = 10
		}
	endif
	if ChecksumEquals a = black b = <color>
		bg_color = [0 0 0 100]
		color = grey
	else
		bg_color = [128 128 128 100]
		color = black
	endif
	<cont_id> :SetTags orig_bg_color = <bg_color>
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		local_id = bg_bar
		texture = white
		pos = (-125.0, 5.0)
		just = [left top]
		rgba = <bg_color>
		z_priority = 5
	}
	scale_element_to_size {
		id = <id>
		target_width = 555
		target_height = 35
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		local_id = bg_bar_left
		texture = character_hub_hilite_bookend
		pos = (-152.0, 5.0)
		just = [left top]
		rgba = ($online_light_blue)
		alpha = 0
		z_priority = 5
	}
	scale_element_to_size {
		id = <id>
		target_width = 40
		target_height = 35
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <cont_id>
		local_id = bg_bar_right
		texture = character_hub_hilite_bookend
		pos = (430.0, 5.0)
		just = [left top]
		rgba = ($online_light_blue)
		alpha = 0
		z_priority = 5
	}
	scale_element_to_size {
		id = <id>
		target_width = 40
		target_height = 35
	}
	<array_count> = (<array_count> + 1)
	repeat 10
	if IsNgc
		LaunchEvent \{type = focus
			target = gamertag_vmenu}
	endif
endscript

script create_leaderboard_headers \{pos = (500.0, 160.0)
		parent = leaderboard_container
		headers = [
			qs("RANK")
			qs("GAMERTAG")
			qs("SCORE")
		]
		column_pos = [
			0
			80
			480
		]
		text_scale = 0.7}
	printf \{qs(0x8bfe563a)}
	if NOT ScreenElementExists id = <parent>
		printf \{qs(0x4e79d20e)}
		return
	endif
	if ScreenElementExists \{id = leaderboard_column_header_cont}
		DestroyScreenElement \{id = leaderboard_column_header_cont}
	endif
	CreateScreenElement {
		type = ContainerElement
		id = leaderboard_column_header_cont
		parent = <parent>
		pos = <pos>
		just = [left top]
	}
	cont_id = <id>
	CreateScreenElement {
		type = SpriteElement
		id = leaderboard_header_bg
		parent = <cont_id>
		pos = (-55.0, -14.0)
		texture = store_frame_bottom_bg
		rgba = ($online_dark_purple)
		just = [left top]
	}
	scale_element_to_size {
		id = <id>
		target_width = 580
		target_height = 75
	}
	if IsNgc
		header_nudge = (0.0, 7.0)
	else
		header_nudge = (0.0, 0.0)
	endif
	GetArraySize \{headers}
	CreateScreenElement {
		type = TextElement
		parent = <cont_id>
		font = fontgrid_text_a4
		scale = <text_scale>
		pos = ((-35.0, 0.0) + <header_nudge> + (1.0, 0.0) * <column_pos> [0])
		rgba = ($online_light_purple)
		text = (<headers> [0])
		just = [left top]
		z_priority = 10
	}
	fit_text_into_menu_item id = <id> max_width = 100
	CreateScreenElement {
		type = TextElement
		parent = <cont_id>
		font = fontgrid_text_a4
		scale = <text_scale>
		pos = (<header_nudge> + (1.0, 0.0) * <column_pos> [1])
		rgba = ($online_light_purple)
		text = (<headers> [1])
		just = [left top]
		z_priority = 10
	}
	fit_text_into_menu_item id = <id> max_width = 200
	CreateScreenElement {
		type = TextElement
		parent = <cont_id>
		font = fontgrid_text_a4
		scale = <text_scale>
		pos = (<header_nudge> + (1.0, 0.0) * <column_pos> [2])
		rgba = ($online_light_purple)
		text = (<headers> [2])
		just = [right top]
		z_priority = 10
	}
	if (<array_size> > 3)
		FormatText TextName = new_text qs(0x0ca98c87) s = (<headers> [2]) d = (<headers> [3])
		<id> :SE_SetProps {
			text = <new_text>
			just = [right top]
			pos = ((1.0, 0.0) * <column_pos> [3] + <header_nudge> + (50.0, 0.0))
		}
	endif
	fit_text_into_menu_item id = <id> max_width = 200
endscript

script leaderboard_custom_focus 
	Obj_GetID
	if ScreenElementExists id = {<ObjID> child = rank}
		SetScreenElementProps id = {<ObjID> child = rank} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists id = {<ObjID> child = the_text}
		SetScreenElementProps id = {<ObjID> child = the_text} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists id = {<ObjID> child = score}
		SetScreenElementProps id = {<ObjID> child = score} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists id = {<ObjID> child = difficulty}
		SetScreenElementProps id = {<ObjID> child = difficulty} rgba = ($online_dark_purple)
	endif
	if ScreenElementExists id = {<ObjID> child = bg_bar}
		SetScreenElementProps id = {<ObjID> child = bg_bar} rgba = ($online_light_blue)
	endif
	if ScreenElementExists id = {<ObjID> child = bg_bar_right}
		SetScreenElementProps id = {<ObjID> child = bg_bar_right} alpha = 1
	endif
	if ScreenElementExists id = {<ObjID> child = bg_bar_left}
		SetScreenElementProps id = {<ObjID> child = bg_bar_left} alpha = 1
	endif
endscript

script leaderboard_custom_unfocus 
	Obj_GetID
	if ScreenElementExists id = {<ObjID> child = rank}
		SetScreenElementProps id = {<ObjID> child = rank} rgba = ($online_light_blue)
	endif
	if ScreenElementExists id = {<ObjID> child = the_text}
		SetScreenElementProps id = {<ObjID> child = the_text} rgba = ($online_light_blue)
	endif
	if ScreenElementExists id = {<ObjID> child = score}
		SetScreenElementProps id = {<ObjID> child = score} rgba = ($online_light_blue)
	endif
	if ScreenElementExists id = {<ObjID> child = difficulty}
		SetScreenElementProps id = {<ObjID> child = difficulty} rgba = ($online_light_blue)
	endif
	<ObjID> :GetSingleTag orig_bg_color
	if ScreenElementExists id = {<ObjID> child = bg_bar}
		SetScreenElementProps id = {<ObjID> child = bg_bar} rgba = <orig_bg_color>
	endif
	if ScreenElementExists id = {<ObjID> child = bg_bar_right}
		SetScreenElementProps id = {<ObjID> child = bg_bar_right} alpha = 0
	endif
	if ScreenElementExists id = {<ObjID> child = bg_bar_left}
		SetScreenElementProps id = {<ObjID> child = bg_bar_left} alpha = 0
	endif
endscript

script leaderboard_scroll \{dir = down}
	if (<dir> = down)
		if ($lb_selection_index = $lb_last_index)
			if ($lb_lastgroup = 1)
				SetScreenElementProps \{id = gamertag_vmenu
					dont_allow_wrap}
				return
			endif
			LaunchEvent \{type = unfocus
				target = gamertag_vmenu}
			change \{lb_selection_index = 0}
			change lb_offset = ($lb_offset + 10)
			if ($current_leaderboard_group = song)
				get_leaderboard_headers \{song = true}
			else
				get_leaderboard_headers \{song = false}
			endif
			if ScreenElementExists \{id = arrow_down}
				SetScreenElementProps id = arrow_down rgba = ($online_dark_purple)
				Wait \{0.2
					seconds}
			endif
			request_leaderboard <...>
		else
			change lb_selection_index = ($lb_selection_index + 1)
			SetScreenElementProps \{id = gamertag_vmenu
				allow_wrap}
		endif
	else
		if ($lb_selection_index = 0)
			if ($lb_offset <= 0)
				SetScreenElementProps \{id = gamertag_vmenu
					dont_allow_wrap}
				return
			else
				SetScreenElementProps \{id = gamertag_vmenu
					allow_wrap}
				change lb_offset = ($lb_offset - 10)
				if ($lb_offset < 0)
					change \{lb_offset = 0}
				endif
			endif
			LaunchEvent \{type = unfocus
				target = gamertag_vmenu}
			change \{lb_selection_index = 9}
			if ($current_leaderboard_group = song)
				get_leaderboard_headers \{song = true}
			else
				get_leaderboard_headers \{song = false}
			endif
			if ScreenElementExists \{id = arrow_up}
				SetScreenElementProps id = arrow_up rgba = ($online_dark_purple) flip_h
				Wait \{0.2
					seconds}
			endif
			request_leaderboard <...>
		else
			change lb_selection_index = ($lb_selection_index - 1)
		endif
	endif
	generic_menu_up_or_down_sound <dir>
endscript

script request_leaderboard 
	if NOT IsNgc
		create_leaderboard_loading_bar
	endif
	printf \{qs(0x3cdff06f)}
	if IsNgc
		if (($current_leaderboard_group) = song)
			type = 1
		else
			type = 0
		endif
		if (($checking_coop_song_flag) = 1)
			coop_flag = true
		else
			coop_flag = false
		endif
		NetSessionFunc {
			obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = add_leaderboard_rows_to_menu
				listtype = <type>
				sort_type = ($lb_list_type)
				offset = ($lb_offset)
				coop = <coop_flag>
				columns = <columns>
				num_rows = 10
				new_lb = ($new_leaderboard)
			}
		}
	else
		NetSessionFunc {
			obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = add_leaderboard_rows_to_menu
				offset = ($lb_offset)
				columns = <columns>
				num_rows = 10
				listtype = ($lb_list_type)
				rating_val = ($lb_rating_value)
			}
		}
	endif
endscript

script show_gamercard 
	FormatText checksumname = leaderboard_entry 'leaderboard_entry_%i_gamertag' i = ($lb_selection_index)
	<leaderboard_entry> :GetTags
	NetSessionFunc func = showGamerCard params = {player_xuid = <player_xuid>}
endscript

script create_leaderboard_filter_dialog \{menu_id = online_leaderboard_filter_menu
		vmenu_id = online_leaderboard_filter_vmenu
		pos = (400.0, 525.0)}
	if ($in_leaderboard_filter)
		return
	endif
	change \{in_leaderboard_filter = 1}
	LaunchEvent \{type = unfocus
		target = gamertag_vmenu}
	search_vmenu_id = leaderboard_search_filter
	search_text_id = leaderboard_search_type
	difficulty_vmenu_id = difficulty_selection
	difficulty_text_id = lb_difficulty_selection_text
	song_vmenu_id = song_selection
	song_text_id = song_selection_text
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = leaderboard_filter_container
		pos = (0.0, 0.0)}
	CreateScreenElement {
		type = VScrollingMenu
		parent = leaderboard_filter_container
		id = <menu_id>
		just = [center top]
		dims = (500.0, 480.0)
		pos = (640.0, 290.0)
		z_priority = 1
	}
	CreateScreenElement {
		type = VMenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = (205.0, 0.0)
		just = [center top]
		internal_just = [left top]
		dims = (500.0, 480.0)
		event_handlers = [
			{pad_back hide_unhide_current_leaderboard}
			{pad_back destroy_leaderboard_filter}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	displaySprite \{id = leaderboard_filter_frame
		parent = leaderboard_filter_container
		tex = xb_online_frame_large
		pos = (640.0, 100.0)
		just = [
			center
			top
		]
		z = 2}
	displaySprite \{id = leaderboard_filter_frame_crown
		parent = leaderboard_filter_container
		tex = xb_online_frame_crown
		pos = (640.0, 42.0)
		just = [
			center
			top
		]
		z = 3
		dims = (256.0, 105.0)}
	CreateScreenElement {
		type = TextElement
		parent = leaderboard_filter_container
		font = fontgrid_title_a1
		scale = 0.85
		rgba = ($online_dark_purple)
		text = qs(0x261d8c2f)
		pos = (640.0, 135.0)
		just = [center top]
		z_priority = 100.0
	}
	CreateScreenElement {
		type = TextElement
		id = search
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs("SEARCH FOR:")
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = search text_id = <search_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <search_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = search text_id = <search_text_id> to = <search_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = LeaderboardSearchValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		type = VMenu
		id = <search_vmenu_id>
		parent = search
		pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <search_text_id> global = CopyOfGlobal type = search direction = up}}
			{pad_down net_custom_up_down params = {text = <search_text_id> global = CopyOfGlobal type = search direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <search_text_id> global = LeaderboardSearchValue type = search}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <search_vmenu_id> menu = search}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = LeaderboardSearchValue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <search_vmenu_id> menu = search}}
		]
	}
	CreateScreenElement {
		type = TextElement
		id = <search_text_id>
		parent = <search_vmenu_id>
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.search.values [($LeaderboardSearchValue)])
		just = [left top]
		z_priority = 100.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	if NOT IsNgc
		CreateScreenElement {
			type = TextElement
			id = lb_difficulty
			parent = <vmenu_id>
			font = fontgrid_title_a1
			scale = 0.65000004
			rgba = ($online_light_blue)
			text = qs("DIFFICULTY:")
			just = [left top]
			z_priority = 100.0
			event_handlers = [
				{focus net_custom_ui_focus params = {this_id = lb_difficulty text_id = <difficulty_text_id> VMenu = <vmenu_id>}}
				{unfocus net_custom_ui_unfocus params = {text_id = <difficulty_text_id>}}
				{pad_choose net_custom_ui_change_focus params = {this_id = lb_difficulty text_id = <difficulty_text_id> to = <difficulty_vmenu_id> from = <vmenu_id>}}
				{pad_choose net_copy_intial_params params = {copy_from = LeaderboardDiffValue copy_to = CopyOfGlobal}}
			]
		}
		CreateScreenElement {
			type = VMenu
			id = <difficulty_vmenu_id>
			parent = lb_difficulty
			pos = (550.0, 0.0)
			just = [left top]
			internal_just = [left top]
			event_handlers = [
				{pad_up animate_helper_arrows params = {direction = up}}
				{pad_down animate_helper_arrows params = {direction = down}}
				{pad_up net_custom_up_down params = {text = <difficulty_text_id> global = CopyOfGlobal type = lb_diff direction = up}}
				{pad_down net_custom_up_down params = {text = <difficulty_text_id> global = CopyOfGlobal type = lb_diff direction = down}}
				{pad_back net_commit_or_reset_params params = {text = <difficulty_text_id> global = LeaderboardDiffValue type = lb_diff}}
				{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <difficulty_vmenu_id> menu = search}}
				{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = LeaderboardDiffValue}}
				{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <difficulty_vmenu_id> menu = search}}
			]
		}
		CreateScreenElement {
			type = TextElement
			id = <difficulty_text_id>
			parent = <difficulty_vmenu_id>
			font = fontgrid_title_a1
			scale = 1.0
			rgba = ($online_light_blue)
			text = ($FilterTypes.lb_diff.values [($LeaderboardDiffValue)])
			just = [left top]
			z_priority = 100.0
		}
		fit_text_into_menu_item id = <id> max_width = 375
	endif
	CreateScreenElement {
		type = TextElement
		id = song_type
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs("SEARCH FOR:")
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = song_type text_id = <song_text_id> VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus params = {text_id = <song_text_id>}}
			{pad_choose net_custom_ui_change_focus params = {this_id = song_type text_id = <song_text_id> to = <song_vmenu_id> from = <vmenu_id>}}
			{pad_choose net_copy_intial_params params = {copy_from = LeaderboardSongTypeValue copy_to = CopyOfGlobal}}
		]
	}
	CreateScreenElement {
		type = VMenu
		id = <song_vmenu_id>
		parent = song_type
		pos = (550.0, 0.0)
		just = [left top]
		internal_just = [left top]
		event_handlers = [
			{pad_up animate_helper_arrows params = {direction = up}}
			{pad_down animate_helper_arrows params = {direction = down}}
			{pad_up net_custom_up_down params = {text = <song_text_id> global = CopyOfGlobal type = song_type direction = up}}
			{pad_down net_custom_up_down params = {text = <song_text_id> global = CopyOfGlobal type = song_type direction = down}}
			{pad_back net_commit_or_reset_params params = {text = <song_text_id> global = LeaderboardSongTypeValue type = song_type}}
			{pad_back net_custom_ui_change_unfocus params = {action = back to = <vmenu_id> from = <song_vmenu_id> menu = song_type}}
			{pad_choose net_commit_or_reset_params params = {commit copy_from = CopyOfGlobal copy_to = LeaderboardSongTypeValue}}
			{pad_choose net_custom_ui_change_unfocus params = {action = choose to = <vmenu_id> from = <song_vmenu_id> menu = song_type}}
		]
	}
	CreateScreenElement {
		type = TextElement
		id = <song_text_id>
		parent = <song_vmenu_id>
		font = fontgrid_title_a1
		scale = 1.0
		rgba = ($online_light_blue)
		text = ($FilterTypes.song_type.values [($LeaderboardSongTypeValue)])
		just = [left top]
		z_priority = 100.0
	}
	fit_text_into_menu_item id = <id> max_width = 375
	CreateScreenElement {
		type = TextElement
		id = submit_selection
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = 0.65000004
		rgba = ($online_light_blue)
		text = qs("DONE")
		just = [left top]
		z_priority = 100.0
		event_handlers = [
			{focus net_custom_ui_focus params = {this_id = submit_selection VMenu = <vmenu_id>}}
			{unfocus net_custom_ui_unfocus}
			{pad_choose submit_filter_query}
		]
	}
	<vmenu_id> :SetTags current_focus = first_time
	block_unblock_filter_criterias
	LaunchEvent type = focus target = <vmenu_id>
endscript

script destroy_leaderboard_filter 
	change \{in_leaderboard_filter = 0}
	LaunchEvent \{type = unfocus
		target = online_leaderboard_filter_vmenu}
	if ScreenElementExists \{id = leaderboard_filter_container}
		DestroyScreenElement \{id = leaderboard_filter_container}
	endif
	LaunchEvent \{type = focus
		target = gamertag_vmenu}
endscript

script block_unblock_filter_criterias 
	if NOT ($current_leaderboard_group = song)
		if ScreenElementExists \{id = lb_difficulty}
			lb_difficulty :SE_SetProps not_focusable rgba = ($online_grey)
		endif
		if ScreenElementExists \{id = lb_difficulty_selection_text}
			lb_difficulty_selection_text :SE_SetProps rgba = ($online_grey) text = qs("N/A")
		endif
		if ScreenElementExists \{id = song_type}
			song_type :SE_SetProps not_focusable rgba = ($online_grey)
		endif
		if ScreenElementExists \{id = song_selection_text}
			song_selection_text :SE_SetProps rgba = ($online_grey) text = qs("N/A")
		endif
	endif
endscript

script hide_unhide_current_leaderboard 
	if GotParam \{hide}
		alpha_value = 0.0
	else
		alpha_value = 1.0
	endif
	if ScreenElementExists \{id = leaderboard_container}
		SetScreenElementProps {
			id = leaderboard_container
			alpha = <alpha_value>
		}
	endif
endscript

script get_diff_string_from_string_num 
	if GotParam \{num}
		switch <num>
			case qs("1")
			return \{diff = qs("E")}
			case qs("2")
			return \{diff = qs("M")}
			case qs("3")
			return \{diff = qs("H")}
			case qs("4")
			return \{diff = qs(0x00135fb0)}
		endswitch
	endif
endscript
