tr_max_band_characters = 13
num_top_scores = 3
g_tr_went_past_max_width = 0

script create_top_rockers_menu \{for_options = 0}
	disable_pause
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_tr_page
		type = DescInterface
		desc = 'top_rockers'
		exclusive_device = <exclusive_device>
	}
	new_score = -1
	if (<for_options> = 0)
		if NOT ($game_mode = p2_faceoff || $game_mode = p1_career || $game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career || $game_mode = p2_pro_faceoff || $game_mode = p8_pro_faceoff || $game_mode = p4_quickplay || $game_mode = p3_quickplay || $game_mode = p1_quickplay || $game_mode = p2_quickplay)
			SpawnScript \{menu_music_on}
		endif
		menu_top_rockers_check_for_new_top_score
	endif
	menu_top_rockers_create_paper for_options = <for_options>
	if NOT (<new_score> = -1)
		menu_top_rockers_init_band_name_creation score_index = <new_score>
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs("ACCEPT")
			button = green
			z = 100}
		add_user_control_helper \{text = qs("SET LETTER")
			button = Yellow
			z = 100}
		add_user_control_helper \{text = qs("BACKSPACE")
			button = Blue
			z = 100}
	else
		menu_top_rockers_create_continue_button for_options = <for_options>
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 100}
	endif
endscript

script destroy_top_rockers_menu 
	clean_up_user_control_helpers
	destroy_menu_backdrop
	DestroyScreenElement \{id = my_tr_page}
	destroy_menu \{menu_id = continue_button}
	destroy_menu \{menu_id = back_button}
endscript

script menu_top_rockers_get_top_rocker_data \{for_options = 0}
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> = -1)
		player_num = 1
	endif
	GetPlayerInfo <player_num> difficulty
	get_difficulty_text_nl difficulty = <difficulty>
	get_song_prefix song = ($track_last_song)
	get_song_title song = ($track_last_song)
	if isSinglePlayerGame
		GetPlayerInfo <player_num> part
	else
		part = Band
	endif
	get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
	GetGlobalTags <songname>
	get_difficulty_text difficulty = <difficulty>
	GetUpperCaseString <song_title>
	song_title = <UpperCaseString>
	GetUpperCaseString <difficulty_text>
	difficulty_text = <UpperCaseString>
	if (<for_options> = 0)
		if isSinglePlayerGame
			getScoreFromDetailedStats player = <player_num>
			getStarsFromDetailedStats player = <player_num>
			GetPlayerInfo <player_num> part
		else
			part = Band
			score = ($gig_detailed_stats_band.score)
			stars = ($gig_detailed_stats_band.stars)
		endif
	endif
	return <...>
endscript

script menu_top_rockers_create_paper 
	menu_top_rockers_get_top_rocker_data for_options = <for_options>
	StringToCharArray string = <song_title>
	GetArraySize <char_array>
	max_width = 190
	max_characters = 20
	if (<array_size> >= <max_characters>)
		new_song_text = qs("\L")
		char_index = 0
		begin
		<new_song_text> = (<new_song_text> + (<char_array> [<char_index>]))
		<char_index> = (<char_index> + 1)
		if (<char_index> >= <array_size>)
			break
		endif
		if (<char_index> >= <max_characters>)
			if ((<char_array> [<char_index>]) = qs("\L "))
				printf \{qs("\Lfound space")}
				break
			endif
		endif
		repeat
		<song_title> = (<new_song_text> + qs("\L..."))
		<max_width> = 270
	endif
	FormatText TextName = my_song_text qs("%d") d = <song_title>
	my_tr_page :SE_SetProps song_title_text_text = <my_song_text>
	FormatText TextName = my_diff_text qs("%d") d = <difficulty_text>
	my_tr_page :SE_SetProps difficulty_text_text = <my_diff_text>
	my_diff_texture = icon_diff_outline_01
	switch <difficulty>
		case easy_rhythm
		my_diff_texture = icon_diff_outline_01
		case easy
		my_diff_texture = icon_diff_outline_02
		case medium
		my_diff_texture = icon_diff_outline_03
		case hard
		my_diff_texture = icon_diff_outline_04
		case expert
		my_diff_texture = icon_diff_outline_05
	endswitch
	my_tr_page :SE_SetProps icon_difficulty_texture = <my_diff_texture> icon_difficulty_texture2 = <my_diff_texture>
	if my_tr_page :Desc_ResolveAlias \{name = alias_top_rockers_desc_menu}
	else
		ScriptAssert \{qs("\LProblem resolving alias in top rockers")}
	endif
	GetScreenElementChildren id = <resolved_id>
	entry_idx = 0
	begin
	FormatText TextName = song_score_text qs("\L%s") s = (<scores> [<entry_idx>]) usecommas
	FormatText TextName = score_name_text qs("\L%s") s = (<names> [<entry_idx>])
	FormatText checksumname = score_name_id 'score_name%d' d = (<entry_idx> + 1)
	SetScreenElementProps {
		id = (<children> [<entry_idx>])
		score_text = <song_score_text>
		name_text = <score_name_text>
	}
	AssignAlias id = (<children> [<entry_idx>]) alias = <score_name_id>
	<entry_idx> = (<entry_idx> + 1)
	repeat ($num_top_scores)
endscript

script menu_top_rockers_create_continue_button 
	callback = {generic_event_back}
	get_all_exclusive_devices
	CreateScreenElement {
		type = TextElement
		parent = root_window
		id = continue_button
		scale = 0.9
		pos = (690.0, 590.0)
		font = ($gh3_button_font)
		rgba = [255 255 255 255]
		just = [left top]
		z_priority = 4
		exclusive_device = <exclusive_device>
	}
	CreateScreenElement {
		type = TextElement
		parent = continue_button
		id = continue_text
		scale = 0.8
		pos = (40.0, 23.0)
		font = fontgrid_text_a8
		rgba = [0 0 0 255]
		just = [left center]
		z_priority = 4
		event_handlers = [
			{pad_back <callback>}
		]
	}
	LaunchEvent \{type = focus
		target = continue_text}
endscript

script menu_top_rockers_check_for_new_top_score \{nowrite = 0}
	get_player_num_from_controller controller_index = ($primary_controller)
	if (<player_num> > 0)
		GetPlayerInfo <player_num> part
		if (<part> = drum)
			if ($Cheat_AutoKick = 1)
				return \{new_score = -1
					newbestscore = 0}
			endif
		endif
	endif
	RemoveParameter \{part}
	nowrite_full = 0
	if ($Cheat_AlwaysSlide = 1)
		<nowrite> = 1
		<nowrite_full> = 1
	endif
	newbestscore = 0
	player_score = 0
	player_stars = 0
	menu_top_rockers_get_top_rocker_data
	player_stars = <stars>
	player_score = <score>
	CastToInteger \{player_score}
	score_array = [0 0 0]
	name_array = [qs("\L") qs("\L") qs("\L")]
	stars_array = [0 0 0]
	score_index = 0
	begin
	SetArrayElement ArrayName = score_array index = <score_index> newvalue = (<scores> [<score_index>])
	SetArrayElement ArrayName = name_array index = <score_index> newvalue = (<names> [<score_index>])
	SetArrayElement ArrayName = stars_array index = <score_index> newvalue = (<tr_stars> [<score_index>])
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	<score_index> = 0
	new_score = -1
	begin
	if (<player_score> > (<score_array> [<score_index>]))
		<new_score> = <score_index>
		if (<nowrite> = 0)
			score_shift_index = ($num_top_scores - 2)
			if NOT (($num_top_scores - (<score_index> + 1)) = 0)
				begin
				SetArrayElement ArrayName = score_array index = (<score_shift_index> + 1) newvalue = (<score_array> [<score_shift_index>])
				SetArrayElement ArrayName = name_array index = (<score_shift_index> + 1) newvalue = (<name_array> [<score_shift_index>])
				SetArrayElement ArrayName = stars_array index = (<score_shift_index> + 1) newvalue = (<stars_array> [<score_shift_index>])
				<score_shift_index> = (<score_shift_index> - 1)
				repeat ($num_top_scores - (<score_index> + 1))
			endif
			SetArrayElement ArrayName = score_array index = <score_index> newvalue = <player_score>
			SetArrayElement ArrayName = stars_array index = <score_index> newvalue = <player_stars>
		endif
		break
	endif
	<score_index> = (<score_index> + 1)
	repeat ($num_top_scores)
	if (<bestscore> < <player_score>)
		bestscore = <player_score>
		beststars = <player_stars>
		if (<nowrite_full> = 0)
			SetGlobalTags <songname> params = {bestscore = <bestscore>}
			SetGlobalTags <songname> params = {beststars = <beststars>}
		endif
		newbestscore = 1
	endif
	if (<nowrite> = 1)
		return new_score = <new_score> newbestscore = <newbestscore>
	endif
	if (<score_index> > -1 && <score_index> < $num_top_scores)
		get_current_band_info
		GetGlobalTags <band_info>
		my_tr_bandname = <name>
		ShortenUIString {
			ui_string = <my_tr_bandname>
			max_len = 9
		}
		my_tr_bandname = <short_ui_string>
		SetArrayElement ArrayName = name_array index = <score_index> newvalue = <my_tr_bandname>
	endif
	if (<nowrite_full> = 0)
		SetGlobalTags <songname> params = {scores = <score_array>}
		SetGlobalTags <songname> params = {names = <name_array>}
		SetGlobalTags <songname> params = {tr_stars = <stars_array>}
	endif
	return new_score = <new_score> newbestscore = 0
endscript
tr_first_time_initialised = 0

script menu_top_rockers_init_band_name_creation \{score_index = 0}
	if ($tr_first_time_initialised = 0)
		change \{new_band_name = [
				qs("\LA")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
				qs("\L")
			]}
		change \{default_band_indexes = [
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
				0
			]}
		change \{new_band_index = 0}
		change \{tr_first_time_initialised = 1}
	endif
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
	event_handlers = [
		{pad_up menu_tr_change_character params = {up score_index = (<score_index>)}}
		{pad_down menu_tr_change_character params = {down score_index = (<score_index>)}}
		{pad_option2 menu_tr_band_advance_pointer params = {score_index = (<score_index>)}}
		{pad_option menu_tr_band_retreat_pointer params = {score_index = (<score_index>)}}
		{pad_choose menu_tr_confirm_band_name params = {score_index = (<score_index>)}}
	]
	FormatText checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
	SetScreenElementProps id = <score_name_id> event_handlers = <event_handlers> replace_handlers
	LaunchEvent type = focus target = <score_name_id>
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_get_band_name_text 
	FormatText TextName = band_name_text_string qs("\L%a%b%c%d%e%f%g%h%i%j%k%l%m%n%o%p") a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15])
	return band_name_text_string = <band_name_text_string>
endscript

script menu_tr_refresh_band_name \{score_index = 0}
	printf qs("\LScore index is %d") d = <score_index>
	FormatText checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
	menu_tr_get_band_name_text
	SetScreenElementProps id = <score_name_id> name_text = (<band_name_text_string>)
endscript

script menu_tr_confirm_band_name 
	menu_tr_get_band_name_text
	SoundEvent \{event = Enter_Band_Name_Finish}
	StringRemoveTrailingWhitespace string = <band_name_text_string>
	menu_top_rockers_get_top_rocker_data
	SetArrayElement ArrayName = names index = <score_index> newvalue = <new_string>
	SetGlobalTags <songname> params = {names = <names>}
	generic_event_back
endscript

script menu_tr_change_character_up 
	SoundEvent \{event = Enter_Band_Name_Scroll_Up}
	SetArrayElement ArrayName = default_band_indexes GlobalArray index = $new_band_index newvalue = ($default_band_indexes [$new_band_index] + 1)
	GetArraySize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] > (<array_size> -1))
		SetArrayElement \{ArrayName = default_band_indexes
			GlobalArray
			index = $new_band_index
			newvalue = 0}
	endif
	SetArrayElement ArrayName = new_band_name GlobalArray index = $new_band_index newvalue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_change_character_down 
	SoundEvent \{event = Enter_Band_Name_Scroll_Down}
	SetArrayElement ArrayName = default_band_indexes GlobalArray index = $new_band_index newvalue = ($default_band_indexes [$new_band_index] -1)
	GetArraySize \{$default_band_characters}
	if ($default_band_indexes [$new_band_index] < 0)
		SetArrayElement ArrayName = default_band_indexes GlobalArray index = $new_band_index newvalue = (<array_size> -1)
	endif
	SetArrayElement ArrayName = new_band_name GlobalArray index = $new_band_index newvalue = ($default_band_characters [($default_band_indexes [$new_band_index])])
	menu_tr_refresh_band_name score_index = <score_index>
endscript

script menu_tr_band_advance_pointer 
	if (($new_band_index + 1) < $tr_max_band_characters)
		SoundEvent \{event = enter_band_name_select}
		change new_band_index = ($new_band_index + 1)
		SetArrayElement ArrayName = new_band_name GlobalArray index = $new_band_index newvalue = ($default_band_characters [($default_band_indexes [$new_band_index])])
		menu_tr_refresh_band_name score_index = <score_index> add_2_width
	endif
endscript

script menu_tr_band_retreat_pointer 
	if (($new_band_index -1) > -1)
		SoundEvent \{event = Enter_Band_Name_Back}
		SetArrayElement ArrayName = default_band_indexes GlobalArray index = ($new_band_index) newvalue = 0
		change new_band_index = ($new_band_index -1)
		SetArrayElement ArrayName = new_band_name GlobalArray index = ($new_band_index + 1) newvalue = qs("\L")
		if ($g_tr_went_past_max_width > 0)
			change g_tr_went_past_max_width = ($g_tr_went_past_max_width - 1)
			FormatText checksumname = score_name_id 'score_name%d' d = (<score_index> + 1)
			if ($g_tr_went_past_max_width = 0)
				SetScreenElementProps id = <score_name_id> scale = (0.6, 0.8)
			else
				GetScreenElementProps id = <score_name_id>
				SetScreenElementProps id = <score_name_id> scale = 1
				fit_text_in_rectangle id = <score_name_id> dims = (200.0, 50.0) pos = <pos>
			endif
		endif
		menu_tr_refresh_band_name score_index = <score_index>
	endif
endscript

script menu_tr_change_character 
	if IsGuitarController controller = <device_num>
		if GotParam \{up}
			menu_tr_change_character_down score_index = <score_index>
		else
			menu_tr_change_character_up score_index = <score_index>
		endif
	else
		if GotParam \{up}
			menu_tr_change_character_up score_index = <score_index>
		else
			menu_tr_change_character_down score_index = <score_index>
		endif
	endif
endscript
