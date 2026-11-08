
script ui_create_select_difficulty 
	spawnscriptnow select_difficulty_show_movie params = {<...>}
	PlayVideo \{video = menu}
endscript

script ui_destroy_select_difficulty 
	generic_ui_destroy
	if ScreenElementExists \{id = DifficultyInterface}
		spawnscriptnow \{ui_destroy_select_difficulty_spawned}
	endif
	destroy_viewport_ui
	set_focus_color
	set_unfocus_color
endscript

script ui_destroy_select_difficulty_spawned 
	DestroyScreenElement \{id = DifficultyInterface}
endscript

script ui_setlist_diff_focus 
	GetTags
	DifficultyInterface :SE_SetProps highlight_pos = ((20.0, -83.0) + ((0.0, 44.5) * <index>)) time = 0.05
endscript

script ui_select_difficulty_back_setlist 
	generic_event_back
endscript
default_difficulty = [
	easy
	easy
	easy
	easy
]

script ui_create_select_difficulty_spawned 
	if NOT ($game_mode = training)
		spawnscriptnow \{menu_music_fade
			params = {
				in
				time = 0.01
			}}
	endif
	if NOT GotParam \{can_change_level}
		can_change_level = 1
	endif
	clean_up_user_control_helpers
	difficulty = ($default_difficulty [$primary_controller])
	focus_index = 0
	if GotParam \{difficulty}
		switch (<difficulty>)
			case easy
			focus_index = 1
			case medium
			focus_index = 2
			case hard
			focus_index = 3
			case expert
			focus_index = 4
		endswitch
	endif
	GetPlayerInfo \{1
		part}
	if GotParam \{from_setlist}
		if NOT ($game_mode = training)
			if ScreenElementExists \{id = DifficultyInterface}
				ui_destroy_select_difficulty_spawned
			endif
			set_unfocus_color \{rgba = [
					93
					30
					28
					255
				]}
			set_focus_color \{rgba = [
					255
					128
					0
					255
				]}
			CreateScreenElement {
				parent = root_window
				id = DifficultyInterface
				type = DescInterface
				desc = 'setlist_b_difficulty_desc'
				pos = (0.0, 0.0)
				z_priority = 100
				alpha = 0.0
				exclusive_device = ($primary_controller)
			}
			if DifficultyInterface :Desc_ResolveAlias \{name = alias_menu}
				AssignAlias id = <resolved_id> alias = current_menu
				current_menu :SE_SetProps \{event_handlers = [
						{
							pad_up
							generic_menu_up_or_down_sound
						}
						{
							pad_down
							generic_menu_up_or_down_sound
						}
						{
							pad_back
							ui_select_difficulty_back_setlist
						}
					]}
				diff_array = [easy_rhythm easy medium hard expert]
				i = 0
				begin
				SetScreenElementProps {
					id = {current_menu child = <i>}
					event_handlers = [
						{focus retail_menu_focus}
						{focus ui_setlist_diff_focus}
						{unfocus retail_menu_unfocus}
						{pad_choose selected_difficulty params = {diff = (<diff_array> [<i>]) can_change_level = <can_change_level>}}
					]
					tags = {index = <i>}
				}
				i = (<i> + 1)
				repeat 5
			endif
			DifficultyInterface :SE_SetProps \{alpha = 1.0
				time = 0.25}
			menu_finish
			LaunchEvent type = focus target = current_menu data = {child_index = <focus_index>}
			return
		endif
	endif
	if ($game_mode = p1_career)
		get_diff_completion_text
		spacing_between = 25
	endif
	item_scale = 1.5
	<complete_pos> = (0.0, 15.0)
	if ($game_mode = training)
		menu_create_script = make_generic_menu
		add_item_script = add_generic_menu_text_item
	else
		menu_create_script = make_menu_frontend
		add_item_script = add_menu_frontend_item
	endif
	if ($game_mode = training)
		difficulty_pos = (-15.0, 25.0)
	else
		difficulty_pos = (-15.0, 60.0)
	endif
	<menu_create_script> {
		title = qs("DIFFICULTY")
		item_scale = <item_scale>
	}
	current_menu :SE_SetProps \{pos = {
			(60.0, 0.0)
			relative
		}}
	scale = 1.5
	<add_item_script> {
		text = qs("BEGINNER")
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = easy_rhythm}
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <item_container_id>
		texture = icon_difficulty_beginner
		pos = <difficulty_pos>
		scale = 0.6
	}
	<add_item_script> {
		text = qs("EASY")
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = easy}
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <item_container_id>
		texture = icon_difficulty_easy
		pos = <difficulty_pos>
		scale = 0.6
	}
	<add_item_script> {
		text = qs("MEDIUM")
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = medium}
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <item_container_id>
		texture = icon_difficulty_medium
		pos = <difficulty_pos>
		scale = 0.6
	}
	<add_item_script> {
		text = qs("HARD")
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = hard}
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <item_container_id>
		texture = icon_difficulty_hard
		pos = <difficulty_pos>
		scale = 0.6
	}
	<add_item_script> {
		text = qs("EXPERT")
		pad_choose_script = selected_difficulty
		pad_choose_params = {diff = expert}
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <item_container_id>
		texture = icon_difficulty_expert
		pos = <difficulty_pos>
		scale = 0.6
	}
	if (($game_mode != training) && ($game_mode != p2_faceoff) && ($game_mode != p2_pro_faceoff) && ($game_mode != p2_battle))
		get_completed_percentage part = <part>
		printf 'completed_songs = %a, total_songs = %b' a = <completed_songs> b = <total_songs>
		FormatText TextName = completed_songs_text qs("%a\% COMPLETE") a = <completed_percentage>
		CreateScreenElement \{type = ContainerElement
			parent = current_menu
			id = difficulty_menu_container
			dims = (300.0, 60.0)
			just = [
				center
				center
			]
			not_focusable}
		CreateScreenElement {
			type = TextBlockElement
			parent = difficulty_menu_container
			dims = (400.0, 60.0)
			just = [center center]
			rgba = [90 132 112 255]
			text = <completed_songs_text>
			font = fontgrid_text_A11_b
			single_line = false
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = proportional
			internal_just = [center center]
			font_spacing = -1
			pos = (250.0, 70.0)
		}
	endif
	menu_finish
	LaunchEvent type = focus target = current_menu data = {child_index = <focus_index>}
endscript

script select_difficulty_show_movie 
	if ($game_mode = p1_career)
		GetPlayerInfo \{1
			part}
		FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
		FormatText checksumname = first_time_played_part 'first_instrument_career_%s' s = ($instrument_list.<part>.text_nl)
		GetGlobalTags <bandname_id> param = <first_time_played_part>
		if ((<...>.<first_time_played_part>) = 0)
			switch (<part>)
				case guitar
				card_text = qs("The life and times of a guitarist")
				case Bass
				card_text = qs("The life and times of a bassist")
				case drum
				card_text = qs("The life and times of a drummer")
				case Vocals
				card_text = qs("The life and times of a vocalist")
			endswitch
			CreateScreenElement \{type = SpriteElement
				parent = root_window
				id = instrument_movie_bg
				texture = white
				rgba = [
					0
					0
					0
					255
				]
				pos = (640.0, 360.0)
				dims = (1280.0, 720.0)
				just = [
					center
					center
				]
				z_priority = 100}
			CreateScreenElement {
				type = TextBlockElement
				parent = instrument_movie_bg
				text = <card_text>
				font = ($test_menu_font)
				scale = 1.2
				dims = (600.0, 400.0)
				rgba = [200 200 200 255]
				pos = (640.0, 400.0)
				just = [center center]
				internal_just = [center center]
				z_priority = 101
			}
			menu_music_fade \{out
				time = 2}
			Wait \{1
				seconds}
			fadetoblack \{on
				alpha = 1.0
				time = 1
				z_priority = 999}
			Wait \{1
				seconds}
			destroy_menu \{menu_id = instrument_movie_bg}
			FormatText checksumname = progression_flag 'Career_%s' s = ($instrument_list.<part>.text_nl)
			change current_progression_flag = (<progression_flag>)
			get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
			if StructureContains Structure = ($<tier_global>) initial_movie
				Menu_Music_Off
				KillMovie \{TextureSlot = 0}
				i = 1
				get_movie_id_by_name movie = ($<tier_global>.initial_movie)
				begin
				GetPlayerInfo <i> controller
				get_savegame_from_controller controller = <controller>
				SetGlobalTags <id> params = {unlocked = 1} savegame = <savegame>
				i = (<i> + 1)
				repeat ($current_num_players)
				PlayMovieAndWait movie = ($<tier_global>.initial_movie) noblack
				spawnscriptnow \{menu_music_on}
			endif
			switch (<part>)
				case guitar
				SetGlobalTags <bandname_id> params = {first_instrument_career_guitar = 1}
				case Bass
				SetGlobalTags <bandname_id> params = {first_instrument_career_bass = 1}
				case drum
				SetGlobalTags <bandname_id> params = {first_instrument_career_drum = 1}
				case Vocals
				SetGlobalTags <bandname_id> params = {first_instrument_career_vocals = 1}
			endswitch
			fadetoblack \{off
				time = 0.5
				no_wait}
		endif
	endif
	spawnscriptnow ui_create_select_difficulty_spawned params = {<...>}
endscript

script get_completed_percentage 
	RequireParams \{[
			part
		]
		all}
	progression_flag = Career_Guitar
	switch (<part>)
		case Bass
		progression_flag = Career_Bass
		case drum
		progression_flag = Career_Drum
		case Vocals
		progression_flag = Career_Vocals
		case Band
		progression_flag = Career_Band
	endswitch
	get_progression_globals (<progression_flag>)
	printstruct <...>
	total_songs = 0.0
	completed_songs = 0.0
	num_tiers = ($<tier_global>.num_tiers)
	tier_num = 1
	begin
	FormatText checksumname = tiername 'tier%d' d = <tier_num>
	go_through_songs = 1
	if StructureContains Structure = ($<tier_global>.<tiername>) debug_gig
		go_through_songs = 0
	endif
	if StructureContains Structure = ($<tier_global>.<tiername>) createagig
		go_through_songs = 0
	endif
	if (<go_through_songs> = 1)
		GetArraySize ($<tier_global>.<tiername>.songs)
		song_index = 0
		begin
		if IsNgc
			if check_gig_progress_for_song_unlocked progression_flag = <progression_flag> gignum = <tier_num> song_index = <song_index>
				completed_songs = (<completed_songs> + 1)
			endif
		else
			song = ($<tier_global>.<tiername>.songs [<song_index>])
			diff_index = 0
			begin
			format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty_index = <diff_index>
			GetGlobalTags <song_checksum> params = stars
			if (<stars> > 2)
				completed_songs = (<completed_songs> + 1)
				break
			endif
			diff_index = (<diff_index> + 1)
			repeat 5
		endif
		total_songs = (<total_songs> + 1)
		song_index = (<song_index> + 1)
		repeat <array_size>
	endif
	tier_num = (<tier_num> + 1)
	repeat <num_tiers>
	completed_percentage = ((<completed_songs> / <total_songs>) * 100)
	CastToInteger \{completed_percentage}
	printf 'completed_songs = %a, total_songs = %b' a = <completed_songs> b = <total_songs>
	return completed_percentage = <completed_percentage>
endscript
