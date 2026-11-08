training_band_tutorial_script = [
	{
		call = training_band_tutorial_startup
	}
	{
		time = 1000
		call = training_band_tutorial_show_title
	}
	{
		lesson = 1
		call = training_6_1_show_lesson_header
	}
	{
		call = training_6_1_complete_message
	}
	{
		lesson = 2
		call = training_6_2_show_lesson_header
	}
	{
		call = training_6_2_show_instruments
	}
	{
		call = training_6_2_show_highway
	}
	{
		call = training_6_2_show_items_on_highway
	}
	{
		call = training_6_2_show_bands_rock_meter_and_demo
	}
	{
		call = training_6_2_show_individual_indicators_and_demo
	}
	{
		call = training_6_2_show_individual_note_streak_and_demo
	}
	{
		call = training_6_2_complete_message
	}
	{
		lesson = 3
		call = training_6_3_show_lesson_header
	}
	{
		call = training_6_3_show_highway
	}
	{
		call = training_6_3_show_bands_rock_meter_and_demo
	}
	{
		call = training_6_3_show_band_playing_in_unison
	}
	{
		call = training_6_3_complete_message
	}
	{
		lesson = 4
		call = training_6_4_show_lesson_header
	}
	{
		call = training_6_4_show_highway
	}
	{
		call = training_6_4_show_band_vs_band
	}
	{
		call = training_6_4_complete_message
	}
	{
		call = training_band_tutorial_1_end
	}
]

script training_6_generic_placeholder_lesson_complete 
	printf \{qs(0x84b8ccdf)}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	Wait \{0.75
		seconds
		ignoreslomo}
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_destroy_gem_scroller
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs("Lesson Complete")
			text_physics = 0
		}}
	Wait \{7
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
endscript

script training_band_tutorial_startup 
	create_loading_screen
	printf \{qs("\Lstarting training_band_tutorial_startup")}
	training_init_session
	ReloadSfx \{mode = tutorials
		tutorial = Band}
	destroy_loading_screen
	LaunchEvent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_band_tutorial_show_title 
	printf \{qs("\Lstarting training_band_tutorial_show_title")}
	training_show_title \{title = qs("Band Mode Tutorial")}
	begin
	if ($transitions_locked = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	Wait \{3
		seconds}
	training_destroy_title
endscript

script training_6_1_show_lesson_header 
	printf \{qs("\Lstarting training_6_1_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("Introduction to Band Play")}
	training_show_lesson_header
	create_training_pause_handler
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_Band_Intro_01_BAS'
		Wait}
	Wait \{0.25
		seconds}
	training_play_sound \{Sound = 'Tut_Band_Intro_02_BAS'
		Wait}
	training_hide_narrator
endscript

script training_6_1_complete_message 
	printf \{qs("\Lstarting training_6_1_complete_message")}
	training_6_generic_placeholder_lesson_complete
endscript

script training_6_2_show_lesson_header 
	printf \{qs("\Lstarting training_6_2_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("Playing as a Band")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_6_2_show_instruments 
	printf \{qs("\Lstarting training_6_2_show_instruments")}
	create_training_pause_handler
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (0.0, 0.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	LaunchEvent \{type = focus
		target = menu_tutorial}
	CreateScreenElement \{parent = menu_tutorial
		id = training_instrument_select_hub
		type = DescInterface
		desc = 'band_play'}
	training_instrument_select_hub :SE_GetProps
	if training_instrument_select_hub :Desc_ResolveAlias \{name = alias_hmenu}
		band_hmenu = <resolved_id>
	endif
	menu_array = []
	desc_array = []
	i = 0
	begin
	ResolveScreenElementId id = [
		{id = <band_hmenu>}
		{index = <i>}
	]
	AddArrayElement array = <desc_array> element = <resolved_id>
	desc_array = <array>
	<resolved_id> :Desc_ResolveAlias name = alias_menu
	if ScreenElementExists id = <resolved_id>
		allowed = {guitar Bass drum Vocals}
		<resolved_id> :SetTags {
			menu = instrument
			instrument = none
			difficulty = none
			controller = <i>
			allowed = <allowed>
			index = <i>
		}
		DestroyScreenElement id = <resolved_id> preserve_parent
		LaunchEvent type = focus target = <resolved_id> data = {child_index = 0}
		text_params = {
			type = TextBlockElement
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			parent = <resolved_id>
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
			]
			internal_scale = 0.75
			just = [center bottom]
			internal_just = [center center]
			font = fontgrid_text_a3
			rgba = ($menu_unfocus_color)
			dims = (200.0, 40.0)
		}
		CreateScreenElement {
			text = qs("INSTRUMENT")
			font = fontgrid_text_a3
			rgba = [200 0 0 255]
			<text_params>
			not_focusable
		}
		CreateScreenElement {
			text = qs("Guitar")
			<text_params>
		}
		CreateScreenElement {
			text = qs("Bass")
			<text_params>
		}
		CreateScreenElement {
			text = qs("Drums")
			<text_params>
		}
		CreateScreenElement {
			text = qs("Vocals")
			<text_params>
		}
		AddArrayElement array = <menu_array> element = <resolved_id>
		menu_array = <array>
		if (<i> > 0)
			LaunchEvent type = pad_down target = <resolved_id>
			begin
			LaunchEvent type = pad_down target = <resolved_id>
			repeat <i>
		endif
	endif
	i = (<i> + 1)
	repeat 4
	training_instrument_select_hub :SetTags {menus = <menu_array> descs = <desc_array>}
	menu_finish
	clean_up_user_control_helpers
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_Band_Play_01_BAS'
		Wait}
	training_hide_narrator
	destroy_menu \{menu_id = menu_tutorial}
	training_hide_lesson_header
endscript

script training_6_2_show_highway 
	printf \{qs("\Lstarting training_6_2_show_highway")}
	SetPlayerInfo \{2
		four_lane_highway = 0}
	training_start_gem_scroller \{players = 4
		song = Tut_Demo}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	LaunchEvent \{type = focus
		target = menu_tutorial}
	change \{structurename = band1_status
		score = 3141975}
	training_wait_for_gem_scroller_startup
endscript

script training_6_2_show_items_on_highway 
	printf \{qs("\Lstarting training_6_2_show_items_on_highway")}
	create_training_pause_handler
	Wait \{3.6
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_play_sound \{Sound = 'Tut_Band_Star_01_BAS'}
	Wait \{2
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (640.0, 120.0)
		scale = 0.7
		rot = 180}
	Wait \{2
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (235.0, 360.0)
		scale = 0.7}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (1045.0, 360.0)
		scale = 0.7}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (640.0, 360.0)
		scale = 0.7}
	Wait \{3
		seconds
		ignoreslomo}
	training_destroy_all_arrows
endscript

script training_6_2_spawn_meter_changing 
	printf \{qs("\Lstarting training_6_2_spawn_meter_changing")}
	training_add_arrow \{id = training_arrow2
		life = 4
		pos = (275.0, 100.0)
		scale = 0.7
		rot = 90}
	Wait \{9
		seconds
		ignoreslomo}
	Wait \{2
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.6
		}
		id = training_spawned_script}
	Wait \{2
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 0.4
		}
		id = training_spawned_script}
	Wait \{2
		seconds
		ignoreslomo}
	training_start_HUD_flashing_red
endscript

script training_6_2_show_bands_rock_meter_and_demo 
	printf \{qs("\Lstarting training_6_2_show_bands_rock_meter_and_demo")}
	create_training_pause_handler
	spawnscriptnow \{training_6_2_spawn_meter_changing
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Band_Star_02_BAS'
		Wait}
	training_stop_HUD_flashing_red
endscript

script training_6_2_move_individual_indicators 
	printf \{qs("\Lstarting training_6_2_move_individual_indicators")}
	training_add_arrow \{id = training_arrow2
		life = 4
		pos = (275.0, 170.0)
		scale = 0.7
		rot = 90}
	player_status = player1_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 0.5 ignore_band_members} id = training_spawned_script
	player_status = player2_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	player_status = player3_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 1.4 ignore_band_members} id = training_spawned_script
	player_status = player4_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 0.8 ignore_band_members} id = training_spawned_script
	Wait \{2.0
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = training_set_health}
	player_status = player1_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	player_status = player2_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 1.1 ignore_band_members} id = training_spawned_script
	player_status = player3_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 0.8 ignore_band_members} id = training_spawned_script
	player_status = player4_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 1.6 ignore_band_members} id = training_spawned_script
	Wait \{2.0
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = training_set_health}
	player_status = player1_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 1.1 ignore_band_members} id = training_spawned_script
	player_status = player2_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 0.6 ignore_band_members} id = training_spawned_script
	player_status = player3_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 1.6 ignore_band_members} id = training_spawned_script
	player_status = player4_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	Wait \{2.0
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = training_set_health}
	player_status = player1_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	player_status = player2_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	player_status = player3_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
	player_status = player4_status
	spawnscriptnow training_set_health params = {player_status = <player_status> health = 0.2 ignore_band_members} id = training_spawned_script
endscript

script training_6_2_show_individual_indicators_and_demo 
	printf \{qs("\Lstarting training_6_2_show_individual_indicators_and_demo")}
	create_training_pause_handler
	Wait \{2.0
		seconds
		ignoreslomo}
	spawnscriptnow \{training_6_2_move_individual_indicators
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Band_Star_03_BAS'
		Wait}
	Wait \{1.0
		seconds
		ignoreslomo}
endscript

script training_6_2_show_note_streak_indicator 
	printf \{qs("\Lstarting training_6_2_show_note_streak_indicator")}
	Wait \{4.0
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 4
		pos = (275.0, 250.0)
		scale = 0.7
		rot = 90}
endscript

script training_6_2_show_individual_note_streak_and_demo 
	printf \{qs("\Lstarting training_6_2_show_individual_note_streak_and_demo")}
	create_training_pause_handler
	GameMode_UpdateCooperative \{cooperative = 1}
	TutorialSetBandStreak \{streak = 50}
	spawnscriptnow \{training_6_2_show_note_streak_indicator
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Band_Star_04_BAS'
		Wait}
	TutorialSetBandStreak \{streak = 0}
	GameMode_UpdateCooperative \{cooperative = 0}
endscript

script training_6_2_complete_message 
	printf \{qs("\Lstarting training_6_2_complete_message")}
	training_play_sound \{Sound = 'Tut_Band_Star_05_BAS'
		Wait}
	training_resume_gem_scroller
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_6_generic_placeholder_lesson_complete
endscript

script training_6_3_show_lesson_header 
	printf \{qs("\Lstarting training_6_3_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("The Band's Star Power")}
	create_training_pause_handler
endscript

script training_6_3_show_highway 
	printf \{qs("\Lstarting training_6_3_show_highway")}
	SetPlayerInfo \{2
		four_lane_highway = 0}
	training_start_gem_scroller \{players = 4
		song = Tut_Demo}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	LaunchEvent \{type = focus
		target = menu_tutorial}
	change \{structurename = band1_status
		score = 3141975}
	training_wait_for_gem_scroller_startup
endscript

script training_6_3_trigger_band_star_power 
	printf \{qs("\Lstarting training_6_3_trigger_band_star_power")}
	change \{structurename = band1_status
		star_power_display_amount = 100}
	<i> = 1
	begin
	GetPlayerInfo <i> checksum
	GetPlayerInfo <i> player
	GetPlayerInfo <i> text
	change structurename = <checksum> star_power_amount = 100
	spawnscriptnow star_power_activate_and_drain params = {player_status = <checksum> player = <player> player_text = <text>}
	<i> = (<i> + 1)
	repeat 4
endscript

script training_6_3_show_arrow_pointing_to_bulbs 
	printf \{qs("\Lstarting training_6_3_show_arrow_pointing_to_bulbs")}
	Wait \{3.0
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 4
		pos = (275.0, 75.0)
		scale = 0.7
		rot = 90}
endscript

script training_6_3_show_bands_rock_meter_and_demo 
	printf \{qs("\Lstarting training_6_3_show_bands_rock_meter_and_demo")}
	create_training_pause_handler
	Wait \{3.6
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	spawnscriptnow \{training_6_3_show_arrow_pointing_to_bulbs
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Band_Star_06_BAS'
		Wait}
endscript

script training_6_3_show_band_playing_in_unison 
	printf \{qs("\Lstarting training_6_3_show_band_playing_in_unison")}
	create_training_pause_handler
	training_6_3_trigger_band_star_power
	Wait \{4.0
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Band_Star_07_BAS'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Band_Star_08_BAS'
		Wait}
	training_clear_out_star_power
	Wait \{3.0
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Band_Star_09_BAS'
		Wait}
endscript

script training_6_3_complete_message 
	printf \{qs("\Lstarting training_6_3_complete_message")}
	training_play_sound \{Sound = 'Tut_Band_Star_10_BAS'
		Wait}
	training_resume_gem_scroller
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_6_generic_placeholder_lesson_complete
endscript

script training_6_4_show_lesson_header 
	printf \{qs("\Lstarting training_6_4_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("Band versus Band")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_6_4_show_highway 
	printf \{qs("\Lstarting training_6_4_show_highway")}
	change \{game_mode = p8_pro_faceoff}
	change \{structurename = player1_status
		team = 0}
	change \{structurename = player2_status
		team = 0}
	change \{structurename = player3_status
		team = 0}
	change \{structurename = player4_status
		team = 0}
	change \{structurename = player5_status
		team = 1}
	change \{structurename = player6_status
		team = 1}
	change \{structurename = player7_status
		team = 1}
	change \{structurename = player8_status
		team = 1}
	change \{structurename = player1_status
		is_local_client = 1}
	change \{structurename = player2_status
		is_local_client = 1}
	change \{structurename = player3_status
		is_local_client = 1}
	change \{structurename = player4_status
		is_local_client = 1}
	change \{structurename = player5_status
		is_local_client = 0}
	change \{structurename = player6_status
		is_local_client = 0}
	change \{structurename = player7_status
		is_local_client = 0}
	change \{structurename = player8_status
		is_local_client = 0}
	Wait \{1
		seconds
		ignoreslomo}
	training_hide_lesson_header
	SetPlayerInfo \{2
		four_lane_highway = 0}
	training_start_gem_scroller \{song = Tut_Demo
		players = 8
		num_bots = 4}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	LaunchEvent \{type = focus
		target = menu_tutorial}
	training_wait_for_gem_scroller_startup
	create_training_pause_handler
	Wait \{3.6
		seconds
		ignoreslomo}
	training_pause_gem_scroller
endscript

script training_6_4_show_band_vs_band 
	printf \{qs("\Lstarting training_6_4_show_band_vs_band")}
	create_training_pause_handler
	change \{game_mode = tutorial}
	spawnscriptnow \{training_6_4_animate_band_vs_band
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Band_Vs_01_BAS'
		Wait}
	training_resume_gem_scroller
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
endscript

script training_6_4_animate_band_vs_band 
	printf \{qs("\Lstarting training_6_4_show_band_vs_band")}
	Wait \{13.0
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (500.0, 360.0)
		scale = 0.7
		rot = 180}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (780.0, 360.0)
		scale = 0.7
		rot = 180}
	printstruct \{$band1_status}
	change \{structurename = player1_status
		score = 1000}
	change \{structurename = player2_status
		score = 1000}
	change \{structurename = player3_status
		score = 1000}
	change \{structurename = player4_status
		score = 1000}
	change \{structurename = band1_status
		score = 4000}
	Wait \{0.5
		seconds
		ignoreslomo}
	change \{structurename = player5_status
		score = 2000}
	change \{structurename = player6_status
		score = 2000}
	change \{structurename = player7_status
		score = 2000}
	change \{structurename = player8_status
		score = 2000}
	change \{structurename = band2_status
		score = 8000}
	Wait \{0.5
		seconds
		ignoreslomo}
	change \{structurename = player1_status
		score = 10000}
	change \{structurename = player2_status
		score = 10000}
	change \{structurename = player3_status
		score = 10000}
	change \{structurename = player4_status
		score = 10000}
	change \{structurename = band1_status
		score = 44000}
	Wait \{0.5
		seconds
		ignoreslomo}
	change \{structurename = player5_status
		score = 20000}
	change \{structurename = player6_status
		score = 20000}
	change \{structurename = player7_status
		score = 20000}
	change \{structurename = player8_status
		score = 20000}
	change \{structurename = band2_status
		score = 88000}
	Wait \{0.5
		seconds
		ignoreslomo}
	change \{structurename = player1_status
		score = 100000}
	change \{structurename = player2_status
		score = 100000}
	change \{structurename = player3_status
		score = 100000}
	change \{structurename = player4_status
		score = 100000}
	change \{structurename = band1_status
		score = 444000}
	Wait \{0.5
		seconds
		ignoreslomo}
	change \{structurename = player5_status
		score = 200000}
	change \{structurename = player6_status
		score = 200000}
	change \{structurename = player7_status
		score = 200000}
	change \{structurename = player8_status
		score = 200000}
	change \{structurename = band2_status
		score = 888000}
	Wait \{0.5
		seconds
		ignoreslomo}
endscript

script training_6_4_complete_message 
	printf \{qs("\Lstarting training_6_4_complete_message")}
	training_destroy_title
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_destroy_gem_scroller \{still_in_training = 0}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs("Band Mode Lesson")
			text_physics = 0
			placement = ps2_tut_top
			fit_dims
		}}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'complete_text'
			text = qs("Complete!")
			text_physics = 0
			placement = ps2_tut_bottom
			fit_dims
		}}
	Wait \{7
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = create_exploding_text}
	destroy_all_exploding_text
endscript

script training_band_tutorial_1_end 
	printf \{qs("\Lstarting training_band_tutorial_1_end")}
	training_kill_session
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_narrator_icons
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	SetGlobalTags \{training
		params = {
			band_lesson = complete
		}}
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript
