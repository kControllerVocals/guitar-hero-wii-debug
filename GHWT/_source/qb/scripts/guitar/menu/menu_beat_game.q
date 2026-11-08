beat_game_title = qs("\c6YOU BEAT GUITAR HERO III ON \c0%d\c6!\c0")
beat_game_message = qs("Think you've got what it takes to really\n blow their minds? Try this bad boy out on \c1%n\c0. There may be a reward waiting for you if you succeed. Pain, fame and glory await, lil' rocker.")
beat_game_message_expert = qs("Wow. You've mastered expert -- Go start a band already! Take it to the next level with the \c1%n\c0! Cheats can be unlocked in the options menu.")

script create_beat_game_menu 
	load_songqpak song_name = ($current_song) async = 0
	create_menu_backdrop \{texture = Beat_Game_BG}
	menu_font = fontgrid_title_a1
	get_current_band_info
	GetGlobalTags <band_info> param = name
	band_name = <name>
	FormatText TextName = band_name_text qs("\L%s") s = <band_name>
	difficulty_text = qs("EXPERT")
	next_difficulty_text = qs("PRECISION MODE CHEAT")
	<difficulty> = ($player1_status.difficulty)
	if ($game_mode = p2_career)
		<index1> = ($difficulty_list_props.($player1_status.difficulty).index)
		<index2> = ($difficulty_list_props.($player2_status.difficulty).index)
		if (<index2> < <index1>)
			<difficulty> = ($player2_status.difficulty)
		endif
	endif
	switch (<difficulty>)
		case easy
		<difficulty_text> = qs("EASY")
		next_difficulty = medium
		<next_difficulty_text> = qs("MEDIUM")
		case medium
		<difficulty_text> = qs("MEDIUM")
		next_difficulty = hard
		<next_difficulty_text> = qs("HARD")
		case hard
		<difficulty_text> = qs("HARD")
		next_difficulty = expert
		<next_difficulty_text> = qs("EXPERT")
	endswitch
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = beat_game_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	CreateScreenElement {
		type = TextElement
		parent = beat_game_container
		id = bgs_band_name
		just = [center top]
		font = <menu_font>
		text = <band_name_text>
		scale = 1.8499999
		rgba = [140 70 70 255]
		pos = (640.0, 346.0)
	}
	GetScreenElementDims \{id = bgs_band_name}
	if (<width> > 300)
		fit_text_in_rectangle \{id = bgs_band_name
			dims = (1160.0, 130.0)
			pos = (640.0, 346.0)}
	endif
	FormatText TextName = title_text $beat_game_title d = <difficulty_text>
	CreateScreenElement {
		type = TextElement
		parent = beat_game_container
		id = bgs_under_title
		just = [left top]
		font = <menu_font>
		text = <title_text>
		scale = 1.4
		rgba = [210 160 80 255]
	}
	fit_text_in_rectangle \{id = bgs_under_title
		dims = (1000.0, 80.0)
		pos = (280.0, 422.0)
		keep_ar = 1}
	if (<difficulty> = expert)
		FormatText TextName = motivation_text ($beat_game_message_expert) n = <next_difficulty_text>
	else
		FormatText TextName = motivation_text ($beat_game_message) n = <next_difficulty_text>
	endif
	CreateScreenElement {
		type = TextBlockElement
		parent = beat_game_container
		font = fontgrid_text_a8
		text = <motivation_text>
		dims = (1050.0, 700.0)
		pos = (640.0, 475.0)
		rgba = [250 245 145 255]
		just = [center top]
		internal_just = [center top]
		scale = 0.8
		z_priority = 3
	}
	<cheat> = qs("ROCK YOU LIKE A HURRICANE RIFF x 2")
	FormatText TextName = cheat_text qs("CHEAT HINT: %c") c = <cheat>
	if (<difficulty> = expert)
		CreateScreenElement {
			type = TextElement
			parent = beat_game_container
			id = bgs_cheat_text
			just = [center top]
			font = <menu_font>
			text = <cheat_text>
			scale = 0.8
			pos = (640.0, 602.0)
			rgba = [210 160 80 255]
		}
	endif
	button_font = buttons_x360
	displaySprite \{id = bgs_black_banner
		parent = beat_game_container
		tex = white
		pos = (0.0, -2.0)
		dims = (1240.0, 100.0)
		rgba = [
			0
			0
			0
			255
		]
		z = -2}
	CreateScreenElement \{type = TextElement
		parent = beat_game_container
		id = continue_text
		scale = 1.0
		pos = (40.0, 20.0)
		font = fontgrid_text_a8
		rgba = [
			0
			0
			0
			255
		]
		just = [
			left
			center
		]
		event_handlers = [
			{
				pad_choose
				menu_beat_game_continue_to_song_breakdown
			}
		]}
	spawnscriptnow scroll_band_name params = {band_text = <band_name_text>}
	LaunchEvent \{type = focus
		target = continue_text}
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 100}
endscript

script destroy_beat_game_menu 
	clean_up_user_control_helpers
	destroy_menu \{menu_id = beat_game_container}
	destroy_menu_backdrop
	KillSpawnedScript \{name = scroll_band_name}
endscript

script scroll_band_name 
	displayText id = scrolling_bandname1 parent = beat_game_container pos = (0.0, 34.0) scale = 1.333 font = <menu_font> text = <band_text> rgba = [124 77 65 255] z = -1
	GetScreenElementDims \{id = scrolling_bandname1}
	multi = (1280 / <width>)
	band_text_with_space = (<band_text> + qs("\L "))
	long_band_text = <band_text_with_space>
	StringLength string = <band_text_with_space>
	<band_text_with_space_length> = <str_len>
	begin
	StringLength string = <long_band_text>
	<long_band_text_length> = <str_len>
	if NOT (<long_band_text_length> < (127 - <band_text_with_space_length>))
		break
	endif
	<long_band_text> = (<long_band_text> + <band_text_with_space>)
	SetScreenElementProps id = scrolling_bandname1 text = <long_band_text>
	GetScreenElementDims \{id = scrolling_bandname1}
	if (<width> > 1280)
		break
	endif
	repeat <multi>
	SetScreenElementProps id = scrolling_bandname1 text = <long_band_text>
	fit_text_in_rectangle id = scrolling_bandname1 dims = ((1280.0, 0.0) + (<Height> * (0.0, 1.0))) pos = (0.0, 34.0)
	displayText id = scrolling_bandname2 parent = beat_game_container scale = 1.333 font = <menu_font> text = <long_band_text> rgba = [124 77 65 255] z = -1
	GetScreenElementDims \{id = scrolling_bandname1}
	fit_text_in_rectangle id = scrolling_bandname2 dims = ((1280.0, 0.0) + (<Height> * (0.0, 1.0))) pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
	first = 1
	begin
	if (<first>)
		LegacyDoScreenElementMorph id = scrolling_bandname1 pos = (((-1.0, 0.0) * <width>) + (0.0, 34.0)) time = 5
		LegacyDoScreenElementMorph \{id = scrolling_bandname2
			pos = (0.0, 34.0)
			time = 5}
	else
		LegacyDoScreenElementMorph id = scrolling_bandname2 pos = (((-1.0, 0.0) * <width>) + (0.0, 34.0)) time = 5
		LegacyDoScreenElementMorph \{id = scrolling_bandname1
			pos = (0.0, 34.0)
			time = 5}
	endif
	Wait \{5
		seconds}
	if (<first>)
		SetScreenElementProps id = scrolling_bandname1 pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
		SetScreenElementProps \{id = scrolling_bandname2
			pos = (0.0, 34.0)}
		<first> = 0
	else
		SetScreenElementProps id = scrolling_bandname2 pos = (((1.0, 0.0) * <width>) + (0.0, 34.0))
		SetScreenElementProps \{id = scrolling_bandname1
			pos = (0.0, 34.0)}
		<first> = 1
	endif
	repeat
endscript

script menu_beat_game_continue_to_song_breakdown 
	ui_event \{event = menu_change
		data = {
			state = uistate_song_breakdown
			gig_complete = 1
			game_beat = 1
		}}
endscript
