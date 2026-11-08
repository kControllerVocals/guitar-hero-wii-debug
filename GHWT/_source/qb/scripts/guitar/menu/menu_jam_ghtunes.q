jam_ghtunes_num_results = 14
jam_ghtunes_curr_start_at = 0
jam_ghtunes_max_start_at = 999999999
ghtunes_verified = 0
jam_ghtunes_last_search_text = qs("")

script create_jam_ghtunes_menu 
	startrendering
	spawnscriptnow \{BG_Crowd_Front_End_Silence
		params = {
			immediate = 1
		}}
	if NOT IsLoggedIn
		jam_ghtunes_failed_dialog \{dialog = 0}
		return
	endif
	if IsLoggedIn
		NetSessionFunc \{func = live_settings_init}
	endif
	if ($ghtunes_killswitch = 1)
		jam_ghtunes_failed_dialog \{dialog = 7}
		return
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if NOT NetSessionFunc \{func = can_view_user_content}
		jam_ghtunes_failed_dialog \{dialog = 2}
		return
	endif
	Menu_Music_Off
	if ($ghtunes_verified = 0)
		VerifyJamUserContent controller = ($primary_controller)
		Block \{type = verify_jam_user_content}
		printf \{channel = jam_mode
			qs("\LGHTUNES VERIFIED")}
		change \{ghtunes_verified = 1}
	endif
	spawnscriptnow \{id = ghtunes_spawns
		ghtunes_signin_check}
	change \{jam_ghtunes_curr_start_at = 0}
	change \{jam_ghtunes_max_start_at = 999999999}
	clean_up_user_control_helpers
	SoundEvent \{event = GHTunes_On}
	if ScreenElementExists \{id = ghtunes_element}
		DestroyScreenElement \{id = ghtunes_element}
	endif
	CreateScreenElement {
		parent = root_window
		id = ghtunes_element
		type = DescInterface
		desc = 'gh_tunes_share'
		exclusive_device = ($primary_controller)
		rot_angle = 0
		loading_alpha = 0
		leaderboard_select_alpha = 0
		watermark_alpha = 0
	}
	ghtunes_element :SetTags \{current_leaderboard_index = 0
		last_genre_searched = 0}
	ghtunes_element :SetProps \{page_text = qs("Loading..")}
	ghtunes_element :SetProps \{item_select_alpha = 0}
	GetScreenElementPosition \{id = ghtunes_element}
	ghtunes_element :SetProps pos = (<screenelementpos> + (0.0, -800.0)) scale = 0.3
	ghtunes_element :SE_WaitProps
	ghtunes_element :SetProps pos = (<screenelementpos> + (0.0, 0.0)) scale = 1.005 time = 0.2
	ghtunes_element :SE_WaitProps
	ghtunes_element :SetProps pos = (<screenelementpos> + (0.0, 0.0)) scale = 0.99799997 time = 0.1
	ghtunes_element :SE_WaitProps
	ghtunes_element :SetProps pos = (<screenelementpos> + (0.0, 0.0)) scale = 1.002 time = 0.1
	ghtunes_element :SE_WaitProps
	ghtunes_element :SetProps pos = (<screenelementpos> + (0.0, 0.0)) scale = 1.0 time = 0.1
	ghtunes_element :SE_WaitProps
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 10000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 10000}
	add_user_control_helper \{text = qs("TERMS OF USE")
		button = Orange
		z = 10000}
	if is_super_user controller = ($primary_controller)
		add_user_control_helper \{text = qs("SUPERUSER")
			z = 10000}
	endif
	if ghtunes_element :Desc_ResolveAlias \{name = jam_user_content_leaderboard}
		AssignAlias id = <resolved_id> alias = ghtunes_leaderboard_menu
		ghtunes_leaderboard_menu :SetProps {exclusive_device = ($primary_controller)
			event_handlers = [{pad_up ghtunes_pad_up}
				{pad_down ghtunes_pad_down}
				{pad_back ghtunes_board_back}
				{pad_option2 ghtunes_previous_page}
				{pad_option ghtunes_next_page}
				{pad_left ghtunes_add_to_showcase}
				{pad_choose ghtunes_pad_choose}
				{pad_l1 ghtunes_show_terms_of_service params = {parent_menu = ghtunes_leaderboard_menu}}
				{pad_start ghtunes_pad_start}
			]
		}
		LaunchEvent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if ghtunes_element :Desc_ResolveAlias \{name = alias_SORT_scrolling_menu}
		AssignAlias id = <resolved_id> alias = ghtunes_sort_scrolling_menu
		ghtunes_sort_scrolling_menu :SetProps {exclusive_device = ($primary_controller)
			event_handlers = [
				{pad_back ghtunes_menu_back}
				{pad_up SoundEvent params = {event = GHTunes_UI_Scroll}}
				{pad_down SoundEvent params = {event = GHTunes_UI_Scroll}}
				{pad_choose ghtunes_choose_leaderboard}
				{pad_l1 ghtunes_show_terms_of_service params = {parent_menu = ghtunes_sort_scrolling_menu}}
			]
		}
		<index> = 0
		begin
		FormatText checksumname = op_name 'alias_sort_op%a' a = <index>
		ghtunes_element :Desc_ResolveAlias name = <op_name>
		AssignAlias id = <resolved_id> alias = <op_name>
		<op_name> :SetProps {event_handlers = [
				{focus ghtunes_focus params = {id = <op_name> index = <index>}}
				{unfocus ghtunes_unfocus params = {id = <op_name> index = <index>}}
				{unfocus retail_menu_unfocus}
			]
		}
		<index> = (<index> + 1)
		repeat 8
		ghtunes_element :Desc_ResolveAlias \{name = alias_sort_category_bg}
		AssignAlias id = <resolved_id> alias = alias_sort_category_bg
	endif
	spawnscriptnow \{id = ghtunes_spawns
		ghtunes_add_leaderboard_screen}
	LaunchEvent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color \{rgba = [
			64
			64
			64
			255
		]}
	LaunchEvent \{type = focus
		target = ghtunes_sort_scrolling_menu}
	if GotParam \{straight_to_leaderbrd}
		ghtunes_choose_leaderboard forced_index = <straight_to_leaderbrd>
	endif
endscript

script ghtunes_focus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			<id> :GetSingleTag old_font
			if NOT GotParam \{old_font}
				<id> :SE_GetProps
				<id> :SetTags old_font = <font>
			endif
			SetScreenElementProps id = <id> font = fontgrid_text_a1 rgba = $menu_focus_color
		endif
	else
		GetSingleTag \{old_font}
		if NOT GotParam \{old_font}
			SE_GetProps
			SetTags old_font = <font>
		endif
		SetProps \{font = fontgrid_text_a11
			rgba = $menu_focus_color}
	endif
	if GetScreenElementChildren id = <id>
		(<children> [1]) :SetProps scale = 1 pos = (-79.0, -6.0) rgba = [220 220 220 255]
	endif
	ghtunes_element :SE_SetProps info_text = ($ghtunes_leaderboard [<index>].info_text)
endscript

script ghtunes_unfocus 
	if GetScreenElementChildren id = <id>
		(<children> [1]) :SetProps scale = 0.5 pos = (-62.0, 5.0) rgba = [64 64 64 255]
	endif
endscript
ghtunes_leaderboard = [
	{
		leaderboard = user_content_best_songs
		name_text = qs("ALL TIME BEST")
		icon = alltime_best_icon
		large_icon = all_time_best_lrg
		info_text = qs("The top rated songs on GHTunes of all time.")
	}
	{
		leaderboard = user_content_fast_movers
		name_text = qs("RISING STAR")
		icon = rising_star_icon
		large_icon = rising_star_lrg
		info_text = qs("Songs from up and coming creators.")
	}
	{
		leaderboard = user_content_best_weekly
		name_text = qs("HOT THIS WEEK")
		icon = hot_this_week_icon
		large_icon = hot_this_week_lrg
		info_text = qs("The best rated songs on GHTunes this week.")
	}
	{
		leaderboard = user_content_top_artists
		name_text = qs("TOP ARTIST")
		icon = top_artist_icon
		large_icon = top_artist_lrg
		info_text = qs("The top contributing artists on GHTunes.")
	}
	{
		leaderboard = user_content_showcase
		name_text = qs("SHOWCASE")
		icon = showcase_icon
		large_icon = showcase_lrg
		info_text = qs("Handpicked songs from your friends at Neversoft and Activision.")
	}
	{
		leaderboard = user_content_recently_added
		name_text = qs("RECENTLY ADDED")
		icon = newest_song_icon
		large_icon = recently_added_lrg
		info_text = qs("The most recent songs added to GHTunes.")
	}
	{
		leaderboard = user_content_showcase
		name_text = qs("GENRE")
		icon = BrowseByGenre_icon
		large_icon = browse_by_genre_lrg
		info_text = qs("The top rated songs filtered by a specified genre.")
	}
	{
		leaderboard = user_content_title_az
		name_text = qs("SEARCH")
		icon = search_icon
		large_icon = search_lrg
		info_text = qs("Search by song title name.")
	}
]

script ghtunes_choose_leaderboard 
	clean_up_user_control_helpers
	ghtunes_sort_scrolling_menu :Menu_GetSelectedIndex
	if GotParam \{forced_index}
		<selected_index> = (<forced_index>.index)
	endif
	FormatText checksumname = op_name 'alias_sort_op%a' a = <selected_index>
	LaunchEvent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	if NOT GotParam \{forced_index}
		<op_name> :SetProps rgba = [0 0 0 255]
	endif
	SoundEvent \{event = GHTunes_UI_Select}
	<Board> = ($ghtunes_leaderboard [<selected_index>].leaderboard)
	ghtunes_element :SetTags {current_leaderboard_index = <selected_index>}
	if (<selected_index> = 6)
		spawnscriptnow \{ghtunes_create_genre_menu
			id = ghtunes_spawns}
		return
	endif
	if (<selected_index> = 7)
		if NOT ($jam_ghtunes_last_search_text = qs(""))
			spawnscriptnow id = ghtunes_spawns ghtunes_string_search params = {text = ($jam_ghtunes_last_search_text)}
		else
			spawnscriptnow \{ghtunes_create_alphasearch_menu
				id = ghtunes_spawns}
		endif
		return
	endif
	leaderboard_index = 0
	GetArraySize ($net_user_content_leaderboards)
	begin
	if ($net_user_content_leaderboards [<leaderboard_index>].checksum = <Board>)
		if NOT ($net_user_content_leaderboards [<leaderboard_index>].active = 1)
			jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($ghtunes_leaderboard [<selected_index>].name_text)
			return
		endif
	endif
	<leaderboard_index> = (<leaderboard_index> + 1)
	repeat <array_size>
	if (user_content_top_artists = <Board>)
		if NOT ($is_user_content_top_artists_active = 1)
			jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($ghtunes_leaderboard [<selected_index>].name_text)
			return
		endif
	endif
	spawnscriptnow ghtunes_add_header id = ghtunes_spawns params = {leaderboard_name = ($ghtunes_leaderboard [<selected_index>].name_text) icon = ($ghtunes_leaderboard [<selected_index>].icon) large_icon = ($ghtunes_leaderboard [<selected_index>].large_icon)}
	LaunchEvent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :SetProps \{page_text = qs("Loading..")}
	ghtunes_clear_leaderboard
	ghtunes_remove_leaderboard_screen
	if GotParam \{forced_index}
		change jam_ghtunes_curr_start_at = (<forced_index>.start_at)
	else
		change \{jam_ghtunes_curr_start_at = 0}
	endif
	change \{jam_ghtunes_max_start_at = 999999999}
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	ghtunes_add_loading_screen
	if NOT (<Board> = user_content_top_artists)
		GetJamUserContentStats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
	else
		GetJamTopArtistStats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
	endif
endscript

script ghtunes_create_genre_menu 
	LaunchEvent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	LaunchEvent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	if ghtunes_element :Desc_ResolveAlias \{name = alias_genre_icon}
		<resolved_id> :SE_SetProps scale = 1 pos = (-79.0, -6.0) rgba = [220 220 220 255]
	endif
	make_menu \{vmenu_id = genre_select_vmenu
		menu_bg = list_bg
		pos = (540.0, 478.0)
		bg_pos = (520.0, 465.0)
		bg_scale = (0.25, 0.17)
		extra_z = 30
		pad_back_script = ghtunes_submenu_back
		Scroll_down_SFX = GHTunes_Scroll
		Scroll_up_SFX = GHTunes_Scroll}
	add_menu_item \{text = qs("Genre:")
		heading}
	ghtunes_element :GetTags
	GetArraySize ($jam_genre_list)
	index = <last_genre_searched>
	begin
	add_menu_item {
		pad_choose_script = ghtunes_genre_choose
		pad_choose_params = {index = <index>}
		additional_focus_script = ghtunes_genre_focus
		additional_focus_params = {index = <index>}
		pad_choose_sound = NullSound
	}
	if (<index> = <last_genre_searched>)
		CreateScreenElement {
			type = TextBlockElement
			parent = <item_container_id>
			id = ghtunes_genre_text
			font = fontgrid_text_a3
			just = [center center]
			internal_just = [left center]
			scale = 1
			rgba = [220 220 220 255]
			pos = (125.0, -10.0)
			dims = (180.0, 38.0)
			text = ($jam_genre_list [<index>].name_text)
			z_priority = 45
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			text_case = Original
		}
	endif
	<index> = (<index> + 1)
	if (<index> >= <array_size>)
		<index> = 0
	endif
	repeat <array_size>
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100000}
	LaunchEvent \{type = focus
		target = genre_select_vmenu}
endscript

script ghtunes_genre_focus 
	curr_genre = ($jam_genre_list [<index>].name_text)
	ghtunes_genre_text :SE_SetProps text = <curr_genre>
endscript

script ghtunes_genre_choose 
	SoundEvent \{event = GHTunes_UI_Select}
	LaunchEvent \{type = unfocus
		target = genre_select_vmenu}
	ghtunes_element :SetProps \{page_text = qs("Loading")}
	generic_ui_destroy
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	ghtunes_element :SetTags {last_genre_searched = <index>}
	generic_ui_destroy
	LaunchEvent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	ghtunes_reset_selection
	change \{jam_ghtunes_curr_start_at = 0}
	change \{jam_ghtunes_max_start_at = 999999999}
	leaderboard_index = 0
	GetArraySize ($net_user_content_leaderboards)
	begin
	if ($net_user_content_leaderboards [<leaderboard_index>].checksum = ($jam_genre_list [<index>].leaderboard))
		if NOT ($net_user_content_leaderboards [<leaderboard_index>].active = 1)
			jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($jam_genre_list [<index>].name_text)
			return
		endif
	endif
	<leaderboard_index> = (<leaderboard_index> + 1)
	repeat <array_size>
	spawnscriptnow ghtunes_add_header id = ghtunes_spawns params = {leaderboard_name = ($jam_genre_list [<index>].name_text) icon = ($ghtunes_leaderboard [6].icon) large_icon = ($ghtunes_leaderboard [6].large_icon)}
	ghtunes_clear_leaderboard
	ghtunes_remove_leaderboard_screen
	ghtunes_add_loading_screen
	GetJamUserContentStats leaderboard = ($jam_genre_list [<index>].leaderboard) start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
endscript

script ghtunes_create_alphasearch_menu 
	if NOT ($net_user_content_leaderboards [1].active = 1)
		jam_ghtunes_leaderboard_select_failed dialog = 0 leaderboard_name = ($ghtunes_leaderboard [7].name_text)
		return
	endif
	LaunchEvent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	LaunchEvent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	if ghtunes_element :Desc_ResolveAlias \{name = alias_search_icon}
		<resolved_id> :SE_SetProps scale = 1 pos = (-79.0, -6.0) rgba = [220 220 220 255]
	endif
	make_menu \{parent = ghtunes_element
		vmenu_id = text_entry_vmenu
		menu_bg = list_bg
		pos = (540.0, 518.0)
		bg_pos = (520.0, 505.0)
		bg_scale = (0.25, 0.17)
		extra_z = 30}
	add_menu_item \{text = qs("Search For:")
		heading}
	change \{num_name_size = 12}
	text_entry_add_item \{pad_choose_script = ghtunes_string_search
		pad_choose_params = {
		}
		pad_back_script = ghtunes_submenu_back
		validity_message = qs("You must enter something to search for!")
		dims = (100.0, 10.0)
		material = 0x00000000
		single_line = true
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = title
		internal_just = [
			-1.0
			-1.0
		]
		internal_scale = (1.0, 1.0)
		blend = blend
		font_spacing = -1}
	clean_up_user_control_helpers
	ui_cas_text_entry_helper_text
	LaunchEvent \{type = focus
		target = text_entry_vmenu
		data = {
			child_index = 1
		}}
	LaunchEvent \{type = pad_choose}
endscript

script ghtunes_submenu_back 
	SoundEvent \{event = GHTunes_UI_Back}
	generic_ui_destroy
	Wait \{2
		gameframes}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 10000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 10000}
	add_user_control_helper \{text = qs("TERMS OF USE")
		button = Orange
		z = 10000}
	LaunchEvent \{type = focus
		target = ghtunes_sort_scrolling_menu}
endscript

script ghtunes_string_search 
	if ScreenElementExists \{id = text_entry_vmenu}
		LaunchEvent \{type = unfocus
			target = text_entry_vmenu}
	endif
	LaunchEvent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :SetProps \{page_text = qs("Loading")}
	generic_ui_destroy
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	FormatText TextName = title qs("%a: %b") a = ($ghtunes_leaderboard [7].name_text) b = <text>
	spawnscriptnow ghtunes_add_header id = ghtunes_spawns params = {leaderboard_name = <title> icon = ($ghtunes_leaderboard [7].icon) large_icon = ($ghtunes_leaderboard [7].large_icon)}
	ghtunes_clear_leaderboard
	ghtunes_remove_leaderboard_screen
	ghtunes_add_loading_screen
	generic_ui_destroy
	LaunchEvent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	ghtunes_reset_selection
	change jam_ghtunes_last_search_text = <text>
	SearchJamUserContent leaderboard = user_content_title_az num_results = $jam_ghtunes_num_results search_string = <text>
endscript

script ghtunes_signin_check 
	begin
	if ($blade_active = 0)
		if NOT IsLoggedIn controller_index = ($primary_controller)
			if IsLoggedIn local controller_index = ($primary_controller)
				if NetSessionFunc \{func = is_cable_unplugged}
					if ScreenElementExists \{id = ghtunes_element}
						LaunchEvent \{type = unfocus
							target = ghtunes_element}
					endif
					if ScreenElementExists \{id = ghtunes_leaderboard_menu}
						LaunchEvent \{type = unfocus
							target = ghtunes_leaderboard_menu}
					endif
					jam_ghtunes_failed_dialog \{dialog = 3}
					return
				endif
			else
				if ScreenElementExists \{id = ghtunes_element}
					LaunchEvent \{type = unfocus
						target = ghtunes_element}
				endif
				if ScreenElementExists \{id = ghtunes_leaderboard_menu}
					LaunchEvent \{type = unfocus
						target = ghtunes_leaderboard_menu}
				endif
				jam_ghtunes_failed_dialog \{dialog = 0}
				return
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ghtunes_signin_check_unspawned 
	NetSessionFunc \{func = storage_stats_init}
	if NetSessionFunc \{func = is_cable_unplugged}
		jam_ghtunes_failed_dialog \{dialog = 3}
		return \{false}
	endif
	if NOT IsLoggedIn controller_index = ($primary_controller)
		if IsLoggedIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = is_cable_unplugged}
				if ScreenElementExists \{id = song_preview_element}
					LaunchEvent \{type = unfocus
						target = song_preview_element}
				endif
				jam_ghtunes_failed_dialog \{dialog = 3}
				return \{false}
			endif
		else
			if ScreenElementExists \{id = song_preview_element}
				LaunchEvent \{type = unfocus
					target = song_preview_element}
			endif
			jam_ghtunes_failed_dialog \{dialog = 0}
			return \{false}
		endif
	endif
	if NOT NetSessionFunc \{func = is_lobby_available}
		Wait \{1
			gameframe}
		show_ghtunes_connecting_popup
		<timeout> = 20.0
		ResetTimer
		begin
		if NetSessionFunc \{func = is_lobby_available}
			destroy_popup_warning_menu
			break
		else
			if (<is_connecting> = 0)
				if (<failed_get_server_list> = 1)
					destroy_popup_warning_menu
					jam_ghtunes_failed_dialog \{dialog = 8}
				else
					destroy_popup_warning_menu
					jam_ghtunes_failed_dialog \{dialog = 5}
				endif
				return \{false}
			endif
		endif
		if TimeGreaterThan <timeout>
			destroy_popup_warning_menu
			jam_ghtunes_failed_dialog \{dialog = 5}
			return \{false}
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	return \{true}
endscript

script ghtunes_pad_up 
	Wait \{1
		gameframe}
	SoundEvent \{event = GHTunes_UI_Scroll}
	ghtunes_leaderboard_menu :Menu_GetSelectedIndex
	ghtunes_element :SetProps item_select_pos = ((102.0, 207.0) + ((0.0, 31.75) * <selected_index>))
	printf channel = jam_publish qs("\Lghtunes_pad_up %s") s = <selected_index>
endscript

script ghtunes_pad_down 
	Wait \{1
		gameframe}
	SoundEvent \{event = GHTunes_UI_Scroll}
	ghtunes_leaderboard_menu :Menu_GetSelectedIndex
	ghtunes_element :SetProps item_select_pos = ((102.0, 207.0) + ((0.0, 31.75) * <selected_index>))
	printf channel = jam_publish qs("\Lghtunes_pad_down %s") s = <selected_index>
endscript

script ghtunes_reset_selection 
	ghtunes_element :SetProps \{item_select_pos = (102.0, 207.0)}
endscript

script ghtunes_view_user_content 
	if GotParam \{selected_index}
		if (($ghtunes_curr_content_array [<selected_index>].has_content) = 0)
			return
		endif
	endif
	if ScreenElementExists \{id = song_preview_element}
		LaunchEvent \{type = unfocus
			target = song_preview_element}
	else
		LaunchEvent \{type = unfocus
			target = ghtunes_sort_scrolling_menu}
		LaunchEvent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if GotParam \{selected_index}
		user_id = ($ghtunes_curr_content_array [<selected_index>].user_id)
		user_name = ($ghtunes_curr_content_array [<selected_index>].user_name)
	endif
	destroy_jam_ghtunes_menu
	jam_upload_song_dialog \{ghtunes = 1
		dialog = 3}
	GetJamUserContentList user_id = <user_id>
	Block \{type = get_jam_user_content_list}
	if (<event_data>.failed = 1)
		jam_upload_song_failed \{dialog = 18}
	else
		slot_array = $jam_curr_slot_array
		stoprendering
		if ui_event_exists_in_stack \{name = 'jam_download_slot'}
			generic_event_back state = UIstate_jam_download_slot data = {slot_array = <slot_array> board_index = <board_index> start_at = ($jam_ghtunes_curr_start_at) user_name = <user_name> user_id = <user_id>}
		else
			generic_event_choose state = UIstate_jam_download_slot data = {slot_array = <slot_array> board_index = <board_index> start_at = ($jam_ghtunes_curr_start_at) user_name = <user_name> user_id = <user_id>}
		endif
		jam_upload_song_dialog_destroy
	endif
endscript

script ghtunes_pad_choose 
	if ScreenElementExists \{id = ghtunes_leaderboard_menu}
		ghtunes_leaderboard_menu :Menu_GetSelectedIndex
	endif
	if GotParam \{selected_index}
		if (($ghtunes_curr_content_array [<selected_index>].has_content) = 0)
			return
		endif
	endif
	if ScreenElementExists \{id = ghtunes_element}
		LaunchEvent \{type = unfocus
			target = ghtunes_element}
	endif
	if ScreenElementExists \{id = ghtunes_leaderboard_menu}
		LaunchEvent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if ScreenElementExists \{id = ghtunes_element}
		LaunchEvent \{type = unfocus
			target = ghtunes_element}
	endif
	if ScreenElementExists \{id = ghtunes_leaderboard_menu}
		LaunchEvent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if ScreenElementExists \{id = ghtunes_element}
		ghtunes_element :GetTags
	endif
	top_artist_board_download = 0
	if GotParam \{file_id}
		<top_artist_board_download> = 1
	endif
	if NOT (<top_artist_board_download> = 1)
		<Board> = ($ghtunes_leaderboard [<current_leaderboard_index>].leaderboard)
		if (<Board> = user_content_top_artists)
			ghtunes_leaderboard_menu :Menu_GetSelectedIndex
			ghtunes_view_user_content selected_index = <selected_index> board_index = 3
			return
		endif
	endif
	if GotParam \{board_index}
		current_leaderboard_index = <board_index>
	endif
	KillSpawnedScript \{name = ghtunes_signin_check}
	Wait \{1
		gameframe}
	SoundEvent \{event = GHTunes_UI_Select}
	jam_get_num_songs
	if NOT (<top_artist_board_download> = 1)
		ghtunes_leaderboard_menu :Menu_GetSelectedIndex
		if ($ghtunes_curr_content_array [<selected_index>].file_id = 0)
			return
		endif
		file_id = ($ghtunes_curr_content_array [<selected_index>].file_id)
		filename = ($ghtunes_curr_content_array [<selected_index>].filename)
		LaunchEvent \{type = unfocus
			target = ghtunes_element}
		LaunchEvent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	GetArraySize ($jam_curr_directory_listing) param = directory_size
	if (<directory_size> > 0)
		i = 0
		begin
		curr_directory_file_id = ($jam_curr_directory_listing [<i>].fileid.fileid)
		if NOT (<curr_directory_file_id> = 0)
			if ((<file_id>.file_id [1]) = <curr_directory_file_id> [1])
				if ((<file_id>.file_id [0]) = <curr_directory_file_id> [0])
					jam_ghtunes_download_failed_dialog dialog = 6 start_at = ($jam_ghtunes_curr_start_at) board_index = <current_leaderboard_index>
					return
				endif
			endif
		endif
		<i> = (<i> + 1)
		repeat <directory_size>
	endif
	clean_up_user_control_helpers
	SoundEvent \{event = GHTunes_off}
	jam_upload_song_dialog \{ghtunes = 1
		dialog = 2}
	jam_recording_create_editable_arrays
	jam_init_scales
	<no_effects> = [0 0 0 0 0]
	change jam_current_instrument_effects = <no_effects>
	change jam_current_active_effects = <no_effects>
	jam_highway_create_fretbars
	jam_recording_setup_timesig
	ClearJamSession
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	switch <index>
		case 0
		pan = ($jam_rhythm_pan)
		case 1
		pan = ($jam_lead_pan)
		case 4
		pan = ($jam_melody_pan)
		default
		pan = 0
	endswitch
	SetTrackInfo track = ($jam_tracks [<index>].id) volume = 10 pan = <pan> tuning = 0 bpm = ($jam_current_bpm) effect = ($jam_current_instrument_effects [<index>])
	<index> = (<index> + 1)
	repeat <array_size>
	jam_init_volumes
	jam_init_pan
	mark_unsafe_for_shutdown
	GetJamUserContent controller = ($primary_controller) file_id = <file_id>
	Block \{type = get_jam_user_content}
	if (<event_data>.failed = 0)
		SetSongInfo \{song_version = $jam_song_version
			downloaded = 1}
		jam_init_volumes
		jam_load_effect
		destroy_jam_ghtunes_menu
		FormatText TextName = title_text qs("\L%s") s = <filename>
		jam_upload_song_dialog_destroy
		if GotParam \{selected_index}
			<user_id> = ($ghtunes_curr_content_array [<selected_index>].user_id)
			<user_name> = ($ghtunes_curr_content_array [<selected_index>].user_name)
		endif
		if NOT (<top_artist_board_download> = 1)
			create_song_preview_menu {
				filename = <title_text>
				board_index = <current_leaderboard_index>
				start_at = ($jam_ghtunes_curr_start_at)
				ghtunes = 1 file_id = <file_id>
				num_ratings = ($ghtunes_curr_content_array [<selected_index>].num_ratings)
				selected_index = <selected_index>
				user_id = <user_id>
				user_name = <user_name>
			}
		else
			create_song_preview_menu {
				filename = <title_text>
				board_index = <board_index>
				start_at = ($jam_ghtunes_curr_start_at)
				ghtunes = 1
				file_id = <file_id>
				num_ratings = <num_ratings>
				user_id = <user_id>
				user_name = <user_name>
			}
		endif
	else
		jamsession_unload \{song_prefix = 'editable'}
		ClearJamSession
		if ScreenElementExists \{id = ghtunes_element}
			ghtunes_element :SetProps \{rot_angle = 0
				time = 0}
		endif
		jam_ghtunes_download_failed_dialog dialog = 4 start_at = ($jam_ghtunes_curr_start_at) board_index = <current_leaderboard_index>
	endif
	mark_safe_for_shutdown
	printf channel = jam_publish qs("\Lghtunes_pad_choose %s %a") s = <selected_index> a = <title_text>
endscript

script ghtunes_pad_start 
	if isXenon
		ghtunes_leaderboard_menu :Menu_GetSelectedIndex
		user_id = ($ghtunes_curr_content_array [<selected_index>].user_id)
		if GotParam \{user_id}
			if NOT (<user_id> = 0)
				NetSessionFunc func = showGamerCard params = {player_xuid = (<user_id>.user_id)}
			endif
		endif
	endif
endscript

script GetJamUserContent_callback 
	printf \{channel = jam_publish
		qs("\LGetJamUserContent_callback")}
	BroadcastEvent \{type = get_jam_user_content
		data = {
			failed = 0
		}}
endscript

script GetJamUserContent_failed_callback 
	printf \{channel = jam_publish
		qs("\LGetJamUserContent_callback")}
	BroadcastEvent \{type = get_jam_user_content
		data = {
			failed = 1
		}}
endscript

script VerifyJamUserContent_callback 
	printf \{channel = jam_publish
		qs("\LVerifyJamUserContent_callback")}
	BroadcastEvent \{type = verify_jam_user_content}
endscript

script jam_get_primary_user_id 
	NetSessionFunc func = get_user_id params = {controller_index = ($primary_controller)}
	return primary_user_id = <user_id>
endscript

script jam_ghtunes_download_failed_dialog \{dialog = 0}
	if ScreenElementExists \{id = ghtunes_element}
		LaunchEvent \{type = unfocus
			target = ghtunes_element}
		LaunchEvent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	else
		destroy_generic_menu
	endif
	SoundEvent \{event = Menu_Warning_SFX}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = dialog
			qs(0x214955d6)
			s = $jam_max_user_songs}
		case 1
		FormatText \{TextName = dialog
			qs("GHTunes Download failed. The song you are attempting to download is of an outdated version and cannot be downloaded.")}
		case 2
		FormatText \{TextName = dialog
			qs("GHTunes Download failed. You already have a song with the same filename as the one you are attempting to download. Please delete or rename this song before trying again.")}
		case 4
		FormatText \{TextName = dialog
			qs("GHTunes Download failed. Network error while downloading file, please try again.")}
		case 5
		FormatText \{TextName = dialog
			qs("GHTunes Download failed. You can't download your own songs.")}
		case 6
		FormatText \{TextName = dialog
			qs("GHTunes Download failed. The song you have selected has already been saved.")}
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs("DOWNLOAD FAILED")
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_ghtunes_download_failed_go_back}
				func_params = {<...>}
				text = qs("GO BACK")
			}
		]
		Long
	}
endscript

script jam_ghtunes_download_failed_go_back 
	destroy_popup_warning_menu
	destroy_generic_menu
	ui_event event = menu_back state = UIstate_jam_ghtunes data = {straight_to_leaderbrd = {index = <board_index> start_at = <start_at>}}
endscript

script jam_ghtunes_leaderboard_select_failed \{dialog = 0}
	LaunchEvent \{type = unfocus
		target = ghtunes_element}
	LaunchEvent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	LaunchEvent \{type = unfocus
		target = ghtunes_sort_scrolling_menu}
	SoundEvent \{event = Menu_Warning_SFX}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText TextName = dialog qs("The %a GHTunes leaderboard is temporarily unavailable. Please check back later.") a = <leaderboard_name>
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs("GHTunes")
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_ghtunes_leaderboard_select_failed_back}
				text = qs("GO BACK")
			}
		]
	}
endscript

script jam_ghtunes_leaderboard_select_failed_back 
	destroy_popup_warning_menu
	ghtunes_board_back
endscript
ghtunes_rating_for_5star = 8.6
ghtunes_curr_content_array = [
]

script GetJamUserContentStats_callback 
	Wait \{2
		seconds}
	if NOT ScreenElementExists \{id = ghtunes_element}
		return
	endif
	if NOT ScreenElementExists \{id = ghtunes_leaderboard_menu}
		return
	endif
	if ScreenElementExists \{id = popup_warning_container}
		return
	endif
	ghtunes_element :SE_SetProps \{stats_heading_alpha = 1
		top_artist_heading_alpha = 0}
	LaunchEvent \{type = focus
		target = ghtunes_leaderboard_menu
		data = {
			child_index = 0
		}}
	ghtunes_reset_selection
	printf \{channel = jam_publish
		qs("\LGetJamUserContentStats_callback")}
	is_showcase = 0
	ghtunes_element :GetSingleTag \{current_leaderboard_index}
	if (<current_leaderboard_index> = 4)
		<is_showcase> = 1
	endif
	change ghtunes_curr_content_array = <content_array>
	if ghtunes_element :Desc_ResolveAlias \{name = jam_user_content_leaderboard}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			results_array_size = <array_size>
			if NOT (<results_array_size> = 0)
				i = 0
				begin
				has_content = 0
				if ((<content_array> [<i>].has_content) = 1)
					FormatText TextName = title_text qs("\L%s") s = (<content_array> [<i>].filename)
					(<children> [<i>]) :SetProps title_text = <title_text>
					FormatText TextName = number_text qs("\L%s") s = (<i> + 1 + ($jam_ghtunes_num_results * ($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results)))
					(<children> [<i>]) :SetProps number_text = <number_text>
					<rating> = (<content_array> [<i>].rating)
					if (<rating> >= ($ghtunes_rating_for_5star) || <is_showcase> = 1)
						(<children> [<i>]) :SetProps stars_texture = five_star_glow five_star_full_rgba = [255 255 0 255]
						(<children> [<i>]) :SetProps five_star_off_alpha = 1 five_star_full_alpha = 1 star_clip_dims = (134 * (1.0, 0.0) + (0.0, 25.0))
						(<children> [<i>]) :Obj_KillSpawnedScript name = ghtunes_animate_5stars
						(<children> [<i>]) :obj_spawnscript ghtunes_animate_5stars params = {id = (<children> [<i>])}
					else
						<new_x_dims> = ((<rating> / 9.0) * 132)
						(<children> [<i>]) :Obj_KillSpawnedScript name = ghtunes_animate_5stars
						(<children> [<i>]) :SetProps stars_texture = five_star_full five_star_full_rgba = [255 255 255 255] five_star_off_alpha = 1 five_star_full_alpha = 1 star_clip_dims = (<new_x_dims> * (1.0, 0.0) + (0.0, 25.0))
					endif
					FormatText TextName = user_text qs("\L%s") s = (<content_array> [<i>].user_name)
					(<children> [<i>]) :SetProps user_id_text = <user_text>
					GetArraySize \{$jam_genre_list}
					genre_count = 0
					genre_text = qs("")
					begin
					printf channel = jam_mode qs("\Lcheck %s genre %a") s = ($jam_genre_list [<genre_count>].checksum) a = (<content_array> [<i>].genre)
					if (($jam_genre_list [<genre_count>].checksum) = (<content_array> [<i>].genre))
						genre_text = ($jam_genre_list [<genre_count>].abrev_text)
						break
					endif
					<genre_count> = (<genre_count> + 1)
					repeat <array_size>
					(<children> [<i>]) :SetProps genre_text = <genre_text>
				else
					change jam_ghtunes_max_start_at = ($jam_ghtunes_curr_start_at + <i>)
					break
				endif
				i = (<i> + 1)
				repeat <results_array_size>
			endif
		endif
	endif
	FormatText TextName = page_text qs("Page %s") s = (($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1)
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("PREVIEW")
		button = green
		z = 10000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 10000}
	if ((($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1) > 1)
		add_user_control_helper \{text = qs("PREVIOUS")
			button = Yellow
			z = 10000}
	endif
	if (($jam_ghtunes_curr_start_at + $jam_ghtunes_num_results) < $jam_ghtunes_max_start_at)
		add_user_control_helper \{text = qs("NEXT")
			button = Blue
			z = 10000}
	endif
	if is_super_user controller = ($primary_controller)
		add_user_control_helper \{text = qs("SHOWCASE")
			button = pad_left
			z = 10000}
	endif
	add_user_control_helper \{text = qs("TERMS OF USE")
		button = Orange
		z = 10000}
	if isXenon
		add_user_control_helper \{text = qs("GAMER CARD")
			button = start
			z = 10000}
	endif
	ghtunes_element :SetProps page_text = <page_text>
	ghtunes_element :SetProps \{item_select_alpha = 10000}
	ghtunes_remove_loading_screen
endscript

script GetJamTopArtistStats_callback 
	Wait \{2
		seconds}
	if NOT ScreenElementExists \{id = ghtunes_element}
		return
	endif
	if NOT ScreenElementExists \{id = ghtunes_leaderboard_menu}
		return
	endif
	ghtunes_element :SE_SetProps \{stats_heading_alpha = 0
		top_artist_heading_alpha = 1}
	LaunchEvent \{type = focus
		target = ghtunes_leaderboard_menu
		data = {
			child_index = 0
		}}
	ghtunes_reset_selection
	printf \{channel = jam_publish
		qs("\LGetJamTopArtistStats_callback")}
	change ghtunes_curr_content_array = <content_array>
	if ghtunes_element :Desc_ResolveAlias \{name = jam_user_content_leaderboard}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			results_array_size = <array_size>
			printf \{channel = jam_publish
				qs("\LTEST 1")}
			if NOT (<results_array_size> = 0)
				i = 0
				begin
				has_content = 0
				if ((<content_array> [<i>].has_content) = 1)
					printf \{channel = jam_publish
						qs("\LTEST 2")}
					FormatText TextName = artist_text qs("\L%s") s = (<content_array> [<i>].user_name)
					(<children> [<i>]) :SetProps title_text = <artist_text>
					FormatText TextName = number_text qs("\L%s") s = (<i> + 1 + ($jam_ghtunes_num_results * ($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results)))
					(<children> [<i>]) :SetProps number_text = <number_text>
				else
					change jam_ghtunes_max_start_at = ($jam_ghtunes_curr_start_at + <i>)
					break
				endif
				i = (<i> + 1)
				repeat <results_array_size>
			endif
		endif
	endif
	FormatText TextName = page_text qs("Page %s") s = (($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1)
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("VIEW USER SONGS")
		button = green
		z = 10000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 10000}
	if ((($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1) > 1)
		add_user_control_helper \{text = qs("PREVIOUS")
			button = Yellow
			z = 10000}
	endif
	if (($jam_ghtunes_curr_start_at + $jam_ghtunes_num_results) < $jam_ghtunes_max_start_at)
		add_user_control_helper \{text = qs("NEXT")
			button = Blue
			z = 10000}
	endif
	if is_super_user controller = ($primary_controller)
		add_user_control_helper \{text = qs("SHOWCASE")
			button = pad_left
			z = 10000}
	endif
	add_user_control_helper \{text = qs("TERMS OF USE")
		button = Orange
		z = 10000}
	if isXenon
		add_user_control_helper \{text = qs("GAMER CARD")
			button = start
			z = 10000}
	endif
	ghtunes_element :SetProps page_text = <page_text>
	ghtunes_element :SetProps \{item_select_alpha = 10000}
	ghtunes_remove_loading_screen
endscript

script ghtunes_animate_5stars 
	begin
	GetRandomValue \{name = glow_time
		a = 0.7
		b = 1.0}
	if ScreenElementExists id = <id>
		<id> :SE_SetProps stars_texture = five_star_glow five_star_full_scale = 1 five_star_full_rgba = [255 255 255 255] time = <glow_time>
		<id> :SE_WaitProps
	else
		break
	endif
	GetRandomValue \{name = glow_time
		a = 0.7
		b = 1.0}
	if ScreenElementExists id = <id>
		<id> :SE_SetProps stars_texture = five_star_glow five_star_full_scale = 1.02 five_star_full_rgba = [255 252 100 255] time = <glow_time>
		<id> :SE_WaitProps
	else
		break
	endif
	repeat
endscript

script GetJamUserContentStats_failed_callback 
	Wait \{2
		seconds}
	jam_upload_song_dialog_destroy
	if ScreenElementExists \{id = ghtunes_element}
		LaunchEvent \{type = unfocus
			target = ghtunes_element}
	endif
	if ScreenElementExists \{id = ghtunes_element}
		LaunchEvent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	jam_ghtunes_failed_dialog \{dialog = 3}
endscript

script ghtunes_next_page 
	if NOT (($jam_ghtunes_curr_start_at + $jam_ghtunes_num_results) < $jam_ghtunes_max_start_at)
		return
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if ScriptIsRunning \{ghtunes_spam_lock}
		return
	else
		spawnscriptnow \{ghtunes_spam_lock
			id = ghtunes_spawns}
	endif
	if ($jam_ghtunes_curr_start_at = 0)
		change jam_ghtunes_curr_start_at = ($jam_ghtunes_num_results + 1)
	else
		change jam_ghtunes_curr_start_at = ($jam_ghtunes_curr_start_at + $jam_ghtunes_num_results)
	endif
	if ($jam_ghtunes_curr_start_at > $jam_ghtunes_max_start_at)
		change jam_ghtunes_curr_start_at = ($jam_ghtunes_curr_start_at - $jam_ghtunes_num_results)
		return
	endif
	SoundEvent \{event = GHTunes_UI_Select}
	ghtunes_clear_leaderboard
	LaunchEvent \{type = unfocus
		target = ghtunes_element}
	LaunchEvent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :SetProps \{page_text = qs("Loading..")}
	ghtunes_element :SetProps \{item_select_alpha = 0}
	ghtunes_reset_selection
	ghtunes_add_loading_screen
	ghtunes_element :GetTags
	if NOT GotParam \{current_leaderboard_index}
		current_leaderboard_index = 0
	endif
	<Board> = ($ghtunes_leaderboard [<current_leaderboard_index>].leaderboard)
	if NOT (<Board> = user_content_top_artists)
		if (<current_leaderboard_index> = 6)
			GetJamUserContentStats leaderboard = ($jam_genre_list [<last_genre_searched>].leaderboard) start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		else
			GetJamUserContentStats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		endif
	else
		GetJamTopArtistStats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
	endif
	printf channel = jam_publish qs("\Lswitch forward to page %s") s = (($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1)
endscript

script ghtunes_previous_page 
	if NOT ((($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1) > 1)
		return
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	if ScriptIsRunning \{ghtunes_spam_lock}
		return
	else
		spawnscriptnow \{ghtunes_spam_lock
			id = ghtunes_spawns}
	endif
	change jam_ghtunes_curr_start_at = ($jam_ghtunes_curr_start_at - $jam_ghtunes_num_results)
	if ($jam_ghtunes_curr_start_at < 0)
		change \{jam_ghtunes_curr_start_at = 0}
		return
	endif
	SoundEvent \{event = GHTunes_UI_Back}
	ghtunes_clear_leaderboard
	LaunchEvent \{type = unfocus
		target = ghtunes_element}
	LaunchEvent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	ghtunes_element :SetProps \{page_text = qs("Loading..")}
	ghtunes_element :SetProps \{item_select_alpha = 0}
	ghtunes_reset_selection
	ghtunes_add_loading_screen
	ghtunes_element :GetTags
	if NOT GotParam \{current_leaderboard_index}
		current_leaderboard_index = 0
	endif
	<Board> = ($ghtunes_leaderboard [<current_leaderboard_index>].leaderboard)
	if NOT (<Board> = user_content_top_artists)
		if (<current_leaderboard_index> = 6)
			GetJamUserContentStats leaderboard = ($jam_genre_list [<last_genre_searched>].leaderboard) start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		else
			GetJamUserContentStats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
		endif
	else
		GetJamTopArtistStats leaderboard = <Board> start_at = $jam_ghtunes_curr_start_at num_results = $jam_ghtunes_num_results
	endif
	printf channel = jam_publish qs("\Lswitch to page %s") s = (($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1)
endscript

script ghtunes_add_to_showcase 
	if is_super_user controller = ($primary_controller)
		ghtunes_add_to_showcase_check
		return
	else
		return
	endif
endscript

script ghtunes_add_to_showcase_check 
	current_leaderboard_index = 0
	if ScreenElementExists \{id = ghtunes_element}
		ghtunes_element :GetTags
		if (<current_leaderboard_index> = 3)
			return
		endif
	endif
	ghtunes_leaderboard_menu :Menu_GetSelectedIndex
	FormatText TextName = dialog qs("Are you sure you want to add the song (%s) to the Showcase leaderboard? It better be really good.") s = ($ghtunes_curr_content_array [<selected_index>].filename)
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	create_popup_warning_menu {
		title = qs("SUPERUSER")
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {ghtunes_add_to_showcase_go_back}
				func_params = {selected_index = <selected_index>}
				text = qs("GO BACK")
			}
			{
				func = {ghtunes_add_to_showcase_confirm}
				func_params = {selected_index = <selected_index>}
				text = qs("CONTINUE")
			}
		]
	}
	LaunchEvent \{type = unfocus
		target = ghtunes_element}
	LaunchEvent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	SoundEvent \{event = Menu_Warning_SFX}
endscript

script ghtunes_add_to_showcase_success 
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	create_popup_warning_menu {
		title = qs("SUPERUSER")
		textblock = {
			text = qs("Song added to Showcase leaderboard.")
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {ghtunes_add_to_showcase_go_back}
				func_params = {selected_index = <selected_index>}
				text = qs("GO BACK")
			}
		]
	}
	LaunchEvent \{type = unfocus
		target = ghtunes_element}
	LaunchEvent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	SoundEvent \{event = Menu_Warning_SFX}
endscript

script ghtunes_add_to_showcase_confirm 
	if (($ghtunes_curr_content_array [<selected_index>].file_id) = 0)
		return
	endif
	AddToShowCase controller = ($primary_controller) file_id = ($ghtunes_curr_content_array [<selected_index>].file_id)
	Block \{type = add_to_showcase}
	ghtunes_add_to_showcase_success
endscript

script ghtunes_add_to_showcase_go_back 
	current_leaderboard_index = 0
	if ScreenElementExists \{id = ghtunes_element}
		ghtunes_element :GetTags
	endif
	jam_ghtunes_download_failed_go_back start_at = ($jam_ghtunes_curr_start_at) board_index = <current_leaderboard_index>
endscript

script addtoshowcase_callback 
	printf \{channel = jam_mode
		qs("\Laddtoshowcase_callback")}
	BroadcastEvent \{type = add_to_showcase}
endscript

script ghtunes_spam_lock \{time = 1}
	Wait <time> seconds
endscript

script ghtunes_clear_leaderboard 
	if ghtunes_element :Desc_ResolveAlias \{name = jam_user_content_leaderboard}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			if NOT (<array_size> = 0)
				i = 0
				begin
				(<children> [<i>]) :SetProps number_text = qs("")
				(<children> [<i>]) :SetProps title_text = qs("")
				(<children> [<i>]) :SetProps rating_text = qs("")
				(<children> [<i>]) :SetProps user_id_text = qs("")
				(<children> [<i>]) :SetProps genre_text = qs("")
				(<children> [<i>]) :SetProps five_star_off_alpha = 0 five_star_full_alpha = 0
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
		ghtunes_reset_selection
	endif
endscript

script ghtunes_board_back 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 10000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 10000}
	add_user_control_helper \{text = qs("TERMS OF USE")
		button = Orange
		z = 10000}
	SoundEvent \{event = GHTunes_UI_Back}
	LaunchEvent \{type = unfocus
		target = ghtunes_leaderboard_menu}
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color \{rgba = [
			64
			64
			64
			255
		]}
	LaunchEvent \{type = focus
		target = ghtunes_sort_scrolling_menu}
	change \{jam_ghtunes_last_search_text = qs("")}
	ghtunes_reset_selection
	ghtunes_add_leaderboard_screen
endscript

script ghtunes_menu_back \{dialog = 0}
	destroy_popup_warning_menu
	SoundEvent \{event = GHTunes_UI_Back}
	if (<dialog> = 1)
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs("SELECT")
			button = green
			z = 10000}
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 10000}
		add_user_control_helper \{text = qs("TERMS OF USE")
			button = Orange
			z = 10000}
		set_focus_color \{rgba = [
				220
				220
				220
				255
			]}
		set_unfocus_color \{rgba = [
				64
				64
				64
				255
			]}
		LaunchEvent \{type = focus
			target = ghtunes_sort_scrolling_menu}
		ghtunes_remove_loading_screen
		ghtunes_add_leaderboard_screen
	else
		if ScreenElementExists \{id = ghtunes_element}
			SoundEvent \{event = GHTunes_off}
			LaunchEvent \{type = unfocus
				target = ghtunes_element}
			ghtunes_element :SetProps \{alpha = 0}
		endif
		generic_event_back \{nosound = nosound}
	endif
endscript
lost_network_message_xenon = qs("The gamer profile is not enabled for Xbox LIVE multiplayer game play or the network connection is lost.")
lost_network_message_ps3 = qs("You are not signed in to the PLAYSTATION®Network.  You must sign in to continue.")

script jam_ghtunes_failed_dialog \{dialog = 0}
	if ScreenElementExists \{id = ghtunes_leaderboard_menu}
		LaunchEvent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	clean_up_user_control_helpers
	destroy_popup_warning_menu
	switch <dialog>
		case 0
		dialog_txt = $wii_ghtunes_signin
		case 1
		dialog_txt = $wii_ghtunes_unavailable
		case 2
		if isXenon
			dialog_txt = qs("You have set your console to prohibit user created content. You will be unable to access GHTunes. Any songs that you have received through GHTunes will not be accessible.")
		elseif IsPs3
			dialog_txt = qs("Online service is disabled on your PLAYSTATION®Network account due to parental control restrictions.")
		elseif IsNgc
			dialog_txt = $wii_ghtunes_parental
		endif
		case 3
		dialog_txt = qs("Unable to connect to GHTunes. Please check your network connection and settings and try again.")
		case 4
		if isXenon
			dialog_txt = qs("No gamer profile currently signed in. Please sign into an Xbox LIVE multiplayer enabled gamer profile to browse GHTunes.")
		elseif IsPs3
			dialog_txt = qs("You must be signed in to the PLAYSTATION®Network to browse GH tunes.")
		else
			dialog_txt = $wii_ghtunes_must_be_signed
		endif
		case 5
		dialog_txt = qs("Unable to connect to GHTunes. Please check your network connection and settings and try again.")
		case 6
		dialog_txt = qs("The page you are attempting to access failed to load. Please try again in a few minutes.")
		case 7
		dialog_txt = qs("Unable to connect to GHTunes. Please check your network connection and settings and try again.")
		case 8
		dialog_txt = qs("The Guitar Hero World Tour server is not available at this time. Please try again later.")
	endswitch
	create_popup_warning_menu {
		title = qs("GHTUNES FAILED")
		textblock = {
			text = <dialog_txt>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {ghtunes_menu_back}
				func_params = {dialog = <dialog>}
				text = qs("GO BACK")
			}
		]
		Long
	}
endscript

script ghtunes_add_leaderboard_screen 
	ghtunes_element :SE_SetProps \{stats_heading_alpha = 0
		top_artist_heading_alpha = 0}
	ghtunes_clear_leaderboard
	spawnscriptnow \{ghtunes_remove_header
		id = ghtunes_spawns}
	ghtunes_element :SetProps \{leaderboard_select_alpha = 1
		time = 0.3}
	ghtunes_element :SE_WaitProps
endscript

script ghtunes_remove_leaderboard_screen 
	ghtunes_element :SetProps \{leaderboard_select_alpha = 0
		time = 0.3}
	ghtunes_element :SE_WaitProps
endscript

script ghtunes_add_loading_screen 
	spawnscriptnow \{ghtunes_animate_spinning_record
		id = ghtunes_spawns}
	spawnscriptnow \{ghtunes_update_loading_text
		id = ghtunes_spawns}
	ghtunes_element :SetProps \{loading_alpha = 1
		time = 0.3}
	ghtunes_element :SE_WaitProps
endscript

script ghtunes_remove_loading_screen 
	ghtunes_element :SetProps \{loading_alpha = 0
		time = 0.3}
	ghtunes_element :SE_WaitProps
	KillSpawnedScript \{name = ghtunes_animate_spinning_record}
	KillSpawnedScript \{name = ghtunes_update_loading_text}
endscript

script ghtunes_animate_spinning_record 
	rot_angle = 0
	begin
	ghtunes_element :SetProps record_rot_angle = <rot_angle>
	<rot_angle> = (<rot_angle> + 4)
	if (<rot_angle> >= 360)
		<rot_angle> = 0
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ghtunes_update_loading_text 
	time_between = 0.25
	loading_text_base = qs("Loading")
	period_array = [qs("") qs("\L.") qs("\L..") qs("\L...")]
	count = 0
	begin
	FormatText TextName = loading_text qs("\L%s%a") s = <loading_text_base> a = (<period_array> [<count>])
	ghtunes_element :SetProps loading_text = <loading_text>
	Wait <time_between> seconds
	<count> = (<count> + 1)
	if (<count> > 3)
		<count> = 0
	endif
	repeat
endscript

script ghtunes_add_header \{leaderboard_name = qs("LEADERBOARD NAME")
		icon = rising_star_icon
		large_icon = rising_star_lrg}
	spawnscriptnow ghtunes_add_watermark id = ghtunes_spawns params = {icon = <large_icon>}
	ghtunes_element :SetProps leaderboard_name_text = <leaderboard_name> icon_texture = <icon>
	ghtunes_element :SetProps \{header_pos = (-266.0, 0.0)
		time = 0.4}
	ghtunes_element :SE_WaitProps
endscript

script ghtunes_remove_header 
	spawnscriptnow \{ghtunes_remove_watermark
		id = ghtunes_spawns}
	ghtunes_element :SetProps \{header_pos = (-266.0, 118.0)
		time = 0.2}
	ghtunes_element :SE_WaitProps
endscript

script ghtunes_add_watermark \{icon = rising_star_lrg}
	ghtunes_element :SetProps watermark_texture = <icon> watermark_alpha = 0
	ghtunes_element :SetProps \{watermark_alpha = 0.2
		time = 0.4}
	ghtunes_element :SE_WaitProps
endscript

script ghtunes_remove_watermark 
	ghtunes_element :SetProps \{watermark_alpha = 0
		time = 0.2}
	ghtunes_element :SE_WaitProps
endscript

script destroy_jam_ghtunes_menu 
	destroy_song_preview_menu \{ghtunes = 1}
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	KillSpawnedScript \{id = ghtunes_spawns}
	KillSpawnedScript \{name = ghtunes_animate_5stars}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = ghtunes_leaderboard_menu}
		LaunchEvent \{type = unfocus
			target = ghtunes_leaderboard_menu}
	endif
	if ScreenElementExists \{id = ghtunes_element}
		LaunchEvent \{type = unfocus
			target = ghtunes_element}
		DestroyScreenElement \{id = ghtunes_element}
	endif
	if ScreenElementExists \{id = ghtunes_terms_dialog_box}
		DestroyScreenElement \{id = ghtunes_terms_dialog_box}
	endif
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
	endif
endscript
legal_ghtunes_num_results = 20
legal_ghtunes_curr_start_at = 0
legal_ghtunes_max_start_at = 999999999
legal_ghtunes_on_last_page = 0

script ghtunes_show_terms_of_service \{start_at = 1
		num_results = 0}
	clean_up_user_control_helpers
	printf \{qs(0x8931adb2)}
	printf \{qs(0xa09e3728)}
	printf qs(0x3466483d) a = <start_at> b = <num_results>
	printf \{qs(0x8931adb2)}
	SoundEvent \{event = GHTunes_UI_Select}
	if ScreenElementExists \{id = ghtunes_terms_dialog_box}
		DestroyScreenElement \{id = ghtunes_terms_dialog_box}
	endif
	if ScreenElementExists id = <parent_menu>
		LaunchEvent type = unfocus target = <parent_menu>
	endif
	if NOT ghtunes_signin_check_unspawned
		return
	endif
	show_ghtunes_connecting_popup
	JamUpdateTermsOfUse controller = ($primary_controller)
	Block \{type = verify_update_terms_of_use}
	Wait \{1.5
		seconds}
	destroy_popup_warning_menu
	terms_of_service_error = 0
	if (<event_data>.failed = 1)
		<terms_of_service_error> = 1
	endif
	if NOT GlobalExists \{name = ghtunes_terms_of_service_array}
		<terms_of_service_error> = 1
	else
		GetArraySize \{$ghtunes_terms_of_service_array}
		if (<array_size> <= 0)
			<terms_of_service_error> = 1
		endif
	endif
	if (<terms_of_service_error> = 1)
		jam_ghtunes_failed_dialog \{dialog = 7}
		return
	endif
	printf \{qs(0xb5b07469)}
	printstruct <...>
	if ChecksumEquals a = <parent_menu> b = song_preview_element
		parent = song_preview_element
	else
		parent = ghtunes_element
	endif
	CreateScreenElement {
		parent = <parent>
		type = DescInterface
		id = ghtunes_terms_dialog_box
		desc = 'ghtunes_legal_dialog'
		pos = (0.0, 0.0)
		scale = 1
		z_priority = 75
		event_handlers = [
			{pad_up ghtunes_terms_scroll params = {up}}
			{pad_down ghtunes_terms_scroll params = {down}}
			{pad_option2 ghtunes_legal_previous_page params = {parent_menu = <parent_menu>}}
			{pad_option ghtunes_legal_next_page params = {parent_menu = <parent_menu>}}
			{pad_back ghtunes_terms_back params = {parent_menu = <parent_menu> user_id = <user_id> selected_index = <selected_index>}}
		]
	}
	ghtunes_terms_dialog_box :SetProps legal_title_text = ($ghtunes_terms_of_service_array [0])
	if ghtunes_terms_dialog_box :Desc_ResolveAlias \{name = alias_text_menu}
		GetArraySize ($ghtunes_terms_of_service_array)
		Mod a = <array_size> b = $legal_ghtunes_num_results
		change legal_ghtunes_max_start_at = (<array_size> - <Mod>)
		<i> = <start_at>
		if (((<start_at>) + ($legal_ghtunes_num_results)) < (<array_size> -1))
			<repeat_for> = ($legal_ghtunes_num_results)
		else
			<repeat_for> = (<array_size> - <start_at>)
		endif
		printf \{qs(0x8931adb2)}
		printf qs(0x8ad2fa44) a = <i> b = <repeat_for>
		printf \{qs(0x8931adb2)}
		begin
		printf '%b' b = <i>
		CreateScreenElement {
			type = TextBlockElement
			parent = <resolved_id>
			font = fontgrid_text_a3
			just = [left top]
			internal_just = [left top]
			scale = 1
			internal_scale = 0.6
			rgba = [200 200 200 255]
			dims = (900.0, 30.0)
			text = ($ghtunes_terms_of_service_array [<i>])
			z_priority = 11
			fit_width = wrap
			fit_height = `expand dims`
			scale_mode = proportional
			text_case = Original
			alpha = 0
		}
		<i> = (<i> + 1)
		repeat (<repeat_for>)
		ghtunes_terms_hide_offscreen_text parent = <resolved_id>
	endif
	LaunchEvent \{type = focus
		target = ghtunes_terms_dialog_box}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100000}
	if ((($legal_ghtunes_curr_start_at / $legal_ghtunes_num_results) + 1) > 1)
		add_user_control_helper \{text = qs("PREVIOUS")
			button = Yellow
			z = 10000}
	endif
	if (($legal_ghtunes_curr_start_at + <repeat_for>) != <array_size>)
		add_user_control_helper \{text = qs("NEXT")
			button = Blue
			z = 10000}
		change \{legal_ghtunes_on_last_page = 0}
	else
		change \{legal_ghtunes_on_last_page = 1}
	endif
endscript

script ghtunes_legal_next_page 
	printstruct <...>
	if (($legal_ghtunes_on_last_page) = 1)
		return
	endif
	if ($legal_ghtunes_curr_start_at = 0)
		change legal_ghtunes_curr_start_at = ($legal_ghtunes_num_results + 1)
	else
		change legal_ghtunes_curr_start_at = ($legal_ghtunes_curr_start_at + $legal_ghtunes_num_results)
	endif
	SoundEvent \{event = GHTunes_UI_Select}
	ghtunes_show_terms_of_service parent_menu = <parent_menu> start_at = $legal_ghtunes_curr_start_at num_results = $legal_ghtunes_num_results
endscript

script ghtunes_legal_previous_page 
	if NOT ((($legal_ghtunes_curr_start_at / $legal_ghtunes_num_results) + 1) > 1)
		return
	endif
	change legal_ghtunes_curr_start_at = ($legal_ghtunes_curr_start_at - $legal_ghtunes_num_results)
	if ($legal_ghtunes_curr_start_at < 1)
		change \{legal_ghtunes_curr_start_at = 1}
		return
	endif
	SoundEvent \{event = GHTunes_UI_Back}
	ghtunes_show_terms_of_service parent_menu = <parent_menu> start_at = $legal_ghtunes_curr_start_at num_results = $legal_ghtunes_num_results
endscript

script ghtunes_terms_hide_offscreen_text 
	GetScreenElementChildren id = <parent>
	GetScreenElementProps id = <parent>
	<parent_y_pos> = (<pos>.(0.0, 1.0))
	GetArraySize <children>
	<i> = 0
	begin
	<child> = (<children> [<i>])
	GetScreenElementProps id = <child>
	<child_y_pos> = (<pos>.(0.0, 1.0))
	<y_pos> = (<parent_y_pos> + <child_y_pos>)
	GetScreenElementDims id = <child>
	<y_dims> = (<dims>.(1.0, 0.0))
	<y_check_top> = (<y_dims> * -1)
	<y_check_bottom> = (720 + <y_dims>)
	if (<y_pos> < <y_check_top> || <y_pos> > <y_check_bottom>)
		<child> :SE_SetProps alpha = 0
	elseif NOT (<alpha> = 1)
		<child> :SE_SetProps alpha = 1
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script ghtunes_destroy_terms_of_service 
	SoundEvent \{event = GHTunes_UI_Back}
	if ScreenElementExists \{id = ghtunes_terms_dialog_box}
		DestroyScreenElement \{id = ghtunes_terms_dialog_box}
	endif
endscript

script ghtunes_terms_scroll 
	<scroll_speed> = (0.0, 20.0)
	if ghtunes_terms_dialog_box :Desc_ResolveAlias \{name = alias_text_menu}
		GetScreenElementProps id = <resolved_id>
		<up_limit> = 0
		<down_limit> = (((<dims> [1]) * -1) + 400)
		if GotParam \{up}
			if ((<pos> [1]) < <up_limit>)
				<new_pos> = (<pos> + <scroll_speed>)
			else
				<new_pos> = (1.0, 0.0)
			endif
		elseif GotParam \{down}
			if ((<pos> [1]) > <down_limit>)
				<new_pos> = (<pos> - <scroll_speed>)
			else
				<new_pos> = ((1.0, 0.0) + (<down_limit> * (0.0, 1.0)))
			endif
		endif
		<ratio> = (360.0 / (<down_limit> * -1))
		<scroll_pos_y> = (((<new_pos> [1] * -1) * <ratio>) + 42)
		<scroll_pos> = ((1.0, 0.0) + ((<scroll_pos_y>) * (0.0, 1.0)))
		ghtunes_terms_dialog_box :SetProps scrollbar_pos = <scroll_pos>
		<resolved_id> :SetProps pos = <new_pos>
		ghtunes_terms_hide_offscreen_text parent = <resolved_id>
	endif
endscript

script ghtunes_terms_back 
	change \{legal_ghtunes_curr_start_at = 1}
	change \{legal_ghtunes_on_last_page = 0}
	clean_up_user_control_helpers
	ghtunes_destroy_terms_of_service
	if ChecksumEquals a = <parent_menu> b = ghtunes_leaderboard_menu
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs("PREVIEW")
			button = green
			z = 10000}
		if ScreenElementExists \{id = ghtunes_element}
			ghtunes_element :GetTags
			if GotParam \{current_leaderboard_index}
				if (<current_leaderboard_index> = 3)
					clean_up_user_control_helpers
					add_user_control_helper \{text = qs("VIEW USER SONGS")
						button = green
						z = 10000}
				endif
			endif
		endif
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 10000}
		if ((($jam_ghtunes_curr_start_at / $jam_ghtunes_num_results) + 1) > 1)
			add_user_control_helper \{text = qs("PREVIOUS")
				button = Yellow
				z = 10000}
		endif
		if (($jam_ghtunes_curr_start_at + $jam_ghtunes_num_results) < $jam_ghtunes_max_start_at)
			add_user_control_helper \{text = qs("NEXT")
				button = Blue
				z = 10000}
		endif
		if is_super_user controller = ($primary_controller)
			add_user_control_helper \{text = qs("SHOWCASE")
				button = pad_left
				z = 10000}
		endif
		add_user_control_helper \{text = qs("TERMS OF USE")
			button = Orange
			z = 10000}
		if isXenon
			add_user_control_helper \{text = qs("GAMER CARD")
				button = start
				z = 10000}
		endif
	elseif ChecksumEquals a = <parent_menu> b = ghtunes_sort_scrolling_menu
		set_focus_color \{rgba = [
				220
				220
				220
				255
			]}
		set_unfocus_color \{rgba = [
				64
				64
				64
				255
			]}
		add_user_control_helper \{text = qs("SELECT")
			button = green
			z = 10000}
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 10000}
		add_user_control_helper \{text = qs("TERMS OF USE")
			button = Orange
			z = 10000}
	elseif ChecksumEquals a = <parent_menu> b = song_preview_element
		add_user_control_helper \{text = qs("PLAY/PAUSE")
			button = green
			z = 100000}
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 100000}
		add_user_control_helper \{text = qs("SAVE")
			button = Yellow
			z = 100000}
		add_user_control_helper \{text = qs("TERMS OF USE")
			button = Orange
			z = 100000}
		if isXenon
			if GotParam \{user_id}
				add_user_control_helper \{text = qs("GAMER CARD")
					button = start
					z = 100000}
			endif
		endif
		add_user_control_helper \{text = qs("VIEW ALL BY ARTIST")
			button = Blue
			z = 100000}
	endif
	if ScreenElementExists id = <parent_menu>
		LaunchEvent type = focus target = <parent_menu>
	endif
endscript

script JamUpdateTermsOfUse_callback 
	Wait \{1
		gameframe}
	BroadcastEvent \{type = verify_update_terms_of_use
		data = {
			failed = 0
		}}
endscript

script JamUpdateTermsOfUse_failed_callback 
	Wait \{1
		gameframe}
	BroadcastEvent \{type = verify_update_terms_of_use
		data = {
			failed = 1
		}}
endscript

script JamUpdateSubmissionAgreement_callback 
	Wait \{1
		gameframe}
	BroadcastEvent \{type = verify_update_submission_agreement
		data = {
			failed = 0
		}}
endscript

script JamUpdateSubmissionAgreement_failed_callback 
	Wait \{1
		gameframe}
	BroadcastEvent \{type = verify_update_submission_agreement
		data = {
			failed = 1
		}}
endscript

script show_ghtunes_connecting_popup 
	destroy_popup_warning_menu
	create_popup_warning_menu {
		player_device = ($primary_controller)
		title = qs("CONNECTING...")
		textblock = {
			text = qs("Connecting to GHTunes.")
		}
	}
	CreateScreenElement {
		type = SpriteElement
		parent = popup_warning_container
		id = loading_record
		texture = load_record
		pos = (640.0, 512.0)
		z_priority = 10000
		rot_angle = RandomFloat (0.0, 360.0)
	}
	popup_warning_container :obj_spawnscript \{jam_recording_animate_spinning_record}
endscript
