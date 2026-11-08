G_TRAINING_VERIFYING_TRACK_STYLE_DONE = 0
VOCAL_NOTES_HIT = 0
VOCAL_NOTES_MISSED = 0
training_vocals_tutorial_script = [
	{
		call = training_vocals_tutorial_startup
	}
	{
		time = 1000
		call = training_vocals_tutorial_show_title
	}
	{
		lesson = 1
		call = training_8_1_show_lesson_header
	}
	{
		call = training_8_1_show_microphone_image
	}
	{
		call = training_8_1_complete_message
	}
	{
		lesson = 2
		call = training_8_2_show_lesson_header
	}
	{
		call = training_8_2_show_static_highway
	}
	{
		call = training_8_2_show_items_on_highway
	}
	{
		call = training_8_2_show_static_vs_scrolling
	}
	{
		call = training_8_2_prompt_for_layout
	}
	{
		call = training_8_2_complete_message
	}
	{
		lesson = 3
		call = training_8_3_show_lesson_header
	}
	{
		call = training_8_3_show_highway
	}
	{
		call = training_8_3_show_items_on_highway
	}
	{
		call = training_8_3_start_singing_task
	}
	{
		call = training_8_3_complete_message
	}
	{
		lesson = 4
		call = training_8_4_show_lesson_header
	}
	{
		call = training_8_4_show_highway
	}
	{
		call = training_8_4_show_rock_meter_and_demo
	}
	{
		call = training_8_4_complete_message
	}
	{
		lesson = 5
		call = training_8_5_show_lesson_header
	}
	{
		call = training_8_5_show_highway
	}
	{
		call = training_8_5_show_items_on_highway
	}
	{
		call = training_8_5_start_spoken_task
	}
	{
		call = training_8_5_complete_message
	}
	{
		lesson = 6
		call = training_8_6_show_lesson_header
	}
	{
		call = training_8_6_show_highway
	}
	{
		call = training_8_6_show_items_on_highway
	}
	{
		call = training_8_6_start_freeform_task
	}
	{
		call = training_8_6_show_hype_section
	}
	{
		call = training_8_6_complete_message
	}
	{
		lesson = 7
		call = training_8_7_show_lesson_header
	}
	{
		call = training_8_7_show_highway
	}
	{
		call = training_8_7_start_star_power_task
	}
	{
		call = training_8_7_complete_message
	}
	{
		lesson = 8
		call = training_8_8_show_lesson_header
	}
	{
		call = training_8_8_show_highway
	}
	{
		call = training_8_8_start_activate_star_power_task
	}
	{
		call = training_8_8_complete_message
	}
	{
		call = training_vocals_tutorial_end
	}
]

script training_8_generic_placeholder_lesson_complete 
	printf \{qs(0xed30921a)}
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

script training_vocals_tutorial_startup 
	create_loading_screen
	training_init_session
	ReloadSfx \{mode = tutorials
		tutorial = Vocals}
	destroy_loading_screen
	LaunchEvent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_vocals_tutorial_show_title 
	printf \{qs("\Lstarting training_vocals_tutorial_show_title")}
	training_show_title \{title = qs("Vocals Tutorial")}
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

script training_8_1_show_lesson_header 
	printf \{qs("\Lstarting training_8_1_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("Introduction to Vocals")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_1_show_microphone_image 
	printf \{qs("\Lstarting training_8_1_show_microphone_image")}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Intro_01_VOX'
		Wait}
	training_hide_narrator
	Wait \{1.0
		seconds
		ignoreslomo}
	CreateScreenElement \{parent = training_container
		type = SpriteElement
		id = microphone_sprite
		just = [
			center
			center
		]
		texture = tutorial_mic_full
		pos = (640.0, 490.0)
		scale = (1.0, 1.0)
		z_priority = 4}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Intro_02_VOX'
		Wait}
	training_play_sound \{Sound = 'Tut_Vox_Intro_03_VOX'
		Wait}
	training_hide_narrator
	safe_destroy \{id = microphone_sprite}
endscript

script training_8_1_complete_message 
	printf \{qs("\Lstarting training_8_1_complete_message")}
	training_8_generic_placeholder_lesson_complete
endscript

script training_8_2_show_lesson_header 
	printf \{qs("\Lstarting training_8_2_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("The Vocals Highway")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_2_show_static_highway 
	printf \{qs("\Lstarting training_8_2_show_static_highway")}
	vocals_set_highway_view \{player = 1
		view = static
		controller = 1}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Highway_01_VOX'
		Wait}
	training_hide_narrator
	vocals_distribute_mics
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Demo
		part = Vocals
		disable_hud
		no_score_update
		StartTime = 4000}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
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
	training_wait_for_gem_scroller_startup \{disable_mic}
endscript

script training_8_2_show_scrolling_highway 
	printf \{qs("\Lstarting training_8_2_show_scrolling_highway")}
	training_resume_gem_scroller
	training_destroy_gem_scroller
	vocals_set_highway_view \{player = 1
		view = scrolling
		controller = 1}
	vocals_distribute_mics
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Demo
		part = Vocals
		disable_hud
		no_score_update
		StartTime = 6000}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
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
	training_wait_for_gem_scroller_startup \{disable_mic}
endscript

script training_8_2_point_out_comet_and_tunnel 
	printf \{qs("\Lstarting training_8_2_point_out_comet_and_tunnel")}
	Wait \{3.0
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 2.0
		pos = (425.0, 500.0)
		scale = 0.7}
	Wait \{4.0
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 2.0
		pos = (590.0, 500.0)
		scale = 0.7}
endscript

script training_8_2_show_items_on_highway 
	printf \{qs("\Lstarting training_8_2_show_items_on_highway")}
	Wait \{3.0
		seconds}
	training_pause_gem_scroller
	Wait \{1.0
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 2.0
		pos = (545.0, 430.0)
		scale = 0.7}
	spawnscriptnow \{training_8_2_point_out_comet_and_tunnel
		id = training_spawned_script}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Highway_02_VOX'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
endscript

script training_8_2_show_static_vs_scrolling 
	printf \{qs("\Lstarting training_8_2_show_static_vs_scrolling")}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Highway_03_VOX'
		Wait}
	training_hide_narrator
	training_8_2_show_scrolling_highway \{id = training_spawned_script}
	Wait \{2.0
		seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Highway_05_VOX'
		Wait}
	training_hide_narrator
	training_destroy_gem_scroller
	training_hide_lesson_header
endscript

script training_8_2_prompt_for_layout 
	printf \{qs("\Lstarting training_8_2_prompt_for_layout")}
	change \{G_TRAINING_VERIFYING_TRACK_STYLE_DONE = 0}
	training_8_2_prompt_function
	begin
	if ($G_TRAINING_VERIFYING_TRACK_STYLE_DONE)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	training_show_lesson_header
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Highway_06_VOX'
		Wait}
	training_play_sound \{Sound = 'Tut_Vox_Highway_07_VOX'
		Wait}
	training_hide_narrator
	training_resume_gem_scroller
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
endscript

script training_8_2_prompt_function 
	printf \{qs("\Lstarting training_8_2_prompt_function")}
	if ScreenElementExists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	create_popup_warning_menu \{title = qs("Select Vocal Highway")
		textblock = {
			text = qs("Which Vocal Highway type would you like to use?")
		}
		no_background
		options = [
			{
				func = training_8_2_choose_static_or_scrolling
				func_params = {
					chose = static
				}
				text = qs("Static")
			}
			{
				func = training_8_2_choose_static_or_scrolling
				func_params = {
					chose = scrolling
				}
				text = qs("Scrolling")
			}
		]}
endscript

script training_8_2_choose_static_or_scrolling 
	printf \{qs("\Lstarting training_8_2_choose_static_or_scrolling")}
	if GotParam \{chose}
		if (<chose> = static)
			printf \{qs("\Lchose static highway.")}
			vocals_set_highway_view \{player = 1
				view = static
				controller = 1}
		else
			printf \{qs("\Lchose scrolling highway.")}
			vocals_set_highway_view \{player = 1
				view = scrolling
				controller = 1}
		endif
	endif
	destroy_popup_warning_menu
	change \{G_TRAINING_VERIFYING_TRACK_STYLE_DONE = 1}
endscript

script training_8_2_complete_message 
	printf \{qs("\Lstarting training_8_2_complete_message")}
	training_8_generic_placeholder_lesson_complete
endscript

script training_8_3_show_lesson_header 
	printf \{qs("\Lstarting training_8_3_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("Singing in Key")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_3_hit_note 
	printf \{qs("\Lstarting training_8_3_hit_note")}
	change VOCAL_NOTES_HIT = ($VOCAL_NOTES_HIT + 1)
	training_display_notes_hit \{notes_hit = $VOCAL_NOTES_HIT
		notes_required = 3}
	if ($VOCAL_NOTES_HIT = 1)
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_09_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_10_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_11_VOX'
				Wait}
			)
	endif
endscript

script training_8_3_missed_note 
	printf \{qs("\Lstarting training_8_3_missed_note")}
	change VOCAL_NOTES_MISSED = ($VOCAL_NOTES_MISSED + 1)
	if (($VOCAL_NOTES_MISSED = 1) || ($VOCAL_NOTES_MISSED = 2))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_06_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_07_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_08_VOX'
				Wait}
			)
	endif
endscript

script training_8_3_wait_for_hit_notes 
	printf \{qs("\Lstarting training_8_3_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($VOCAL_NOTES_HIT >= 3)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_8_3_show_highway 
	printf \{qs("\Lstarting training_8_3_show_highway")}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_HitNotes_01_VOX'
		Wait}
	training_hide_narrator
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Vox_HitNotes
		part = Vocals
		disable_hud
		no_score_update}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{vocals_hit_phrase training_8_3_hit_note}
		{vocals_miss_phrase training_8_3_missed_note}
		{song_wonp1 training_song_won}
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
	training_wait_for_gem_scroller_startup \{disable_mic}
endscript

script training_8_3_point_out_tunnel 
	printf \{qs("\Lstarting training_8_3_point_out_tunnel")}
	vocals_get_highway_view \{player = 1}
	Wait \{3.0
		seconds
		ignoreslomo}
	if (<highway_view> = static)
		training_add_arrow \{id = training_arrow
			life = 2.0
			pos = (410.0, 490.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 2.0
			pos = (410.0, 490.0)
			scale = 0.7}
	endif
	Wait \{1.0
		seconds
		ignoreslomo}
	if (<highway_view> = static)
		training_add_arrow \{id = training_arrow
			life = 2.0
			pos = (750.0, 475.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 2.0
			pos = (800.0, 500.0)
			scale = 0.7}
	endif
endscript

script training_8_3_point_out_lyrics 
	printf \{qs("\Lstarting training_8_3_point_out_lyrics")}
	Wait \{10.0
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 7.0
		pos = (410.0, 585.0)
		scale = 0.7
		rot = -90}
endscript

script training_8_3_show_items_on_highway 
	printf \{qs("\Lstarting training_8_3_show_items_on_highway")}
	vocals_get_highway_view \{player = 1}
	if (<highway_view> = static)
		Wait \{3.5
			seconds}
	else
		Wait \{3.0
			seconds}
	endif
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("The Comet SHOWS if you are within range.")}
	training_add_lesson_body_text \{number = qs("\L2")
		text = $wii_sing_louder}
	training_show_lesson_header
	spawnscriptnow \{training_8_3_point_out_tunnel
		id = training_spawned_script}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_HitNotes_02_VOX'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
	spawnscriptnow \{training_8_3_point_out_lyrics
		id = training_spawned_script}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_HitNotes_03_VOX'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
endscript

script training_8_3_start_singing_task 
	printf \{qs("\Lstarting training_8_3_start_singing_task")}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_HitNotes_04_VOX'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs("Sing phrase 3 times.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 3}
	change \{VOCAL_NOTES_HIT = 0}
	change \{VOCAL_NOTES_MISSED = 0}
	training_destroy_all_arrows
	vocals_mute_all_mics \{mute = false}
	training_resume_gem_scroller
	training_8_3_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_HitNotes_05_VOX'
		Wait}
	training_hide_narrator
endscript

script training_8_3_complete_message 
	printf \{qs("\Lstarting training_8_3_complete_message")}
	training_8_generic_placeholder_lesson_complete
endscript

script training_8_4_show_lesson_header 
	printf \{qs("\Lstarting training_8_4_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("Rock Meter")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_4_show_highway 
	printf \{qs("\Lstarting training_8_4_show_highway")}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Meter_01_VOX'
		Wait}
	training_hide_narrator \{narrator = 'vocalist'
		no_placeholder}
	change \{tutorial_disable_hud = 0}
	training_start_gem_scroller \{song = Tut_Demo
		part = Vocals}
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
	training_set_score \{score = 3141975}
	training_wait_for_gem_scroller_startup \{disable_mic}
endscript

script training_8_4_make_rock_meter_changes 
	printf \{qs("\Lstarting training_8_4_make_rock_meter_changes")}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (275.0, 325.0)
		scale = 0.7
		rot = 90}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.6
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 1
		text = qs("Green = Good Performance")}
	Wait \{3.0
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.0
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 2
		text = qs("Yellow = OK Performance")}
	Wait \{3.0
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 0.4
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 3
		text = qs("Red = Bad Performance")}
	Wait \{4
		seconds
		ignoreslomo}
	training_start_HUD_flashing_red
	training_add_lesson_body_text \{number = 4
		text = qs("Blinking Red = Danger!")}
endscript

script training_8_4_make_additional_rock_meter_changes 
	printf \{qs("\Lstarting training_8_4_make_additional_rock_meter_changes")}
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.0
		}
		id = training_spawned_script}
	Wait \{8.0
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.6
		}
		id = training_spawned_script}
	Wait \{7.0
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 0.4
		}
		id = training_spawned_script}
endscript

script training_8_4_show_rock_meter_and_demo 
	printf \{qs("\Lstarting training_8_4_show_rock_meter_and_demo")}
	Wait \{3.0
		second}
	training_pause_gem_scroller
	spawnscriptnow \{training_8_4_make_rock_meter_changes
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Vox_Meter_02_VOX'
		Wait}
	training_stop_HUD_flashing_red
	Wait \{0.5
		seconds
		ignoreslomo}
	spawnscriptnow \{training_8_4_make_additional_rock_meter_changes
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Vox_Meter_03_VOX'
		Wait}
	training_destroy_all_arrows
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_resume_gem_scroller
endscript

script training_8_4_complete_message 
	printf \{qs("\Lstarting training_8_4_complete_message")}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Meter_04_VOX'
		Wait}
	training_hide_narrator
	training_8_generic_placeholder_lesson_complete
endscript

script training_8_5_show_lesson_header 
	printf \{qs("\Lstarting training_8_5_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L5")
		text = qs("Spoken Lyrics")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_5_hit_note 
	printf \{qs("\Lstarting training_8_5_hit_note")}
	change VOCAL_NOTES_HIT = ($VOCAL_NOTES_HIT + 1)
	training_display_notes_hit \{notes_hit = $VOCAL_NOTES_HIT
		notes_required = 4}
	if (($VOCAL_NOTES_HIT = 1) || ($VOCAL_NOTES_HIT = 2))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_Words_08_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_09_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_10_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_11_VOX'
				Wait}
			)
	endif
endscript

script training_8_5_missed_note 
	printf \{qs("\Lstarting training_8_5_missed_note")}
	change VOCAL_NOTES_MISSED = ($VOCAL_NOTES_MISSED + 1)
	if (($VOCAL_NOTES_MISSED = 1) || ($VOCAL_NOTES_MISSED = 3))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_Words_05_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_06_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_07_VOX'
				Wait}
			)
	endif
endscript

script training_8_5_wait_for_hit_notes 
	printf \{qs("\Lstarting training_8_5_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($VOCAL_NOTES_HIT >= 4)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_8_5_show_highway 
	printf \{qs("\Lstarting training_8_5_show_highway")}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Words_01_VOX'
		Wait}
	training_hide_narrator
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Vox_Spoken
		part = Vocals
		disable_hud
		no_score_update}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{vocals_hit_phrase training_8_5_hit_note}
		{vocals_miss_phrase training_8_5_missed_note}
		{song_wonp1 training_song_won}
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
	training_wait_for_gem_scroller_startup \{disable_mic}
endscript

script training_8_5_show_items_on_highway 
	printf \{qs("\Lstarting training_8_5_show_items_on_highway")}
	Wait \{6
		seconds}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("Some lyrics need to be SPOKEN, not sung.")}
	training_add_lesson_body_text \{number = qs("\L2")
		text = qs("SPOKEN WORDS don't need to be in pitch, but in TIME with the beat.")}
	training_show_lesson_header
	training_add_arrow \{id = training_arrow
		life = 7.0
		pos = (800.0, 485.0)
		scale = 0.7}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Words_02_VOX'
		Wait}
	training_hide_narrator
	training_add_arrow \{id = training_arrow
		life = 7.0
		pos = (410.0, 585.0)
		scale = 0.7
		rot = -90}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Words_03_VOX'
		Wait}
	training_hide_narrator
endscript

script training_8_5_start_spoken_task 
	printf \{qs("\Lstarting training_8_5_start_spoken_task")}
	training_set_task_header_body \{text = qs("Speak 4 phrases.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 4}
	change \{VOCAL_NOTES_HIT = 0}
	change \{VOCAL_NOTES_MISSED = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller
	training_8_5_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Words_04_VOX'
		Wait}
	training_hide_narrator
	training_resume_gem_scroller
endscript

script training_8_5_complete_message 
	printf \{qs("\Lstarting training_8_5_complete_message")}
	training_8_generic_placeholder_lesson_complete
endscript

script training_8_6_show_lesson_header 
	printf \{qs("\Lstarting training_8_6_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L6")
		text = qs("Freeform Vocals")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_6_hit_note 
	printf \{qs("\Lstarting training_8_6_hit_note")}
	change VOCAL_NOTES_HIT = ($VOCAL_NOTES_HIT + 1)
	training_display_notes_hit \{notes_hit = $VOCAL_NOTES_HIT
		notes_required = 4}
	if (($VOCAL_NOTES_HIT = 3) || ($VOCAL_NOTES_HIT = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_09_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_10_VOX'
				Wait}
			)
	endif
endscript

script training_8_6_missed_note 
	printf \{qs("\Lstarting training_8_6_missed_note")}
	change VOCAL_NOTES_MISSED = ($VOCAL_NOTES_MISSED + 1)
	if (($VOCAL_NOTES_MISSED = 3) || ($VOCAL_NOTES_MISSED = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_06_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_07_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_08_VOX'
				Wait}
			)
	endif
endscript

script training_8_6_wait_for_hit_notes 
	printf \{qs("\Lstarting training_8_6_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($VOCAL_NOTES_HIT >= 4)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_8_6_show_highway 
	printf \{qs("\Lstarting training_8_6_show_highway")}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Freeform_01_VOX'
		Wait}
	training_hide_narrator
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Vox_Freeform
		part = Vocals
		disable_hud
		no_score_update}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{vocals_hit_freeform training_8_6_hit_note}
		{vocals_miss_freeform training_8_6_missed_note}
		{song_wonp1 training_song_won}
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
	training_wait_for_gem_scroller_startup \{disable_mic}
endscript

script training_8_6_show_items_on_highway 
	printf \{qs("\Lstarting training_8_6_show_items_on_highway")}
	vocals_get_highway_view \{player = 1}
	if (<highway_view> = static)
		if IsPs3
			Wait \{3.56
				seconds}
		else
			Wait \{6.7
				seconds}
		endif
	else
		Wait \{5.5
			seconds}
	endif
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("Freeform sections BOTH sound and score best when sung in BEAT and TUNE with the rest of the song.")}
	training_show_lesson_header
	if (<highway_view> = static)
		training_add_arrow \{id = training_arrow
			life = 9.0
			pos = (640.0, 430.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 9.0
			pos = (800.0, 430.0)
			scale = 0.7}
	endif
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Freeform_02_VOX'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
endscript

script training_8_6_start_freeform_task 
	printf \{qs("\Lstarting training_8_6_start_freeform_task")}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Freeform_04_VOX'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs("Sing the 4 freeform sections.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 4}
	change \{VOCAL_NOTES_HIT = 0}
	change \{VOCAL_NOTES_MISSED = 0}
	training_destroy_all_arrows
	vocals_mute_all_mics \{mute = false}
	training_resume_gem_scroller
	training_8_6_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_resume_gem_scroller
endscript

script training_8_6_show_hype_section 
	printf \{qs("\Lstarting training_8_6_show_hype_section")}
	Wait \{1.0
		seconds}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Vox_Hype
		part = Vocals
		disable_hud
		no_score_update
		StartTime = 2500}
	KillSpawnedScript \{name = update_score_fast}
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
	training_wait_for_gem_scroller_startup \{disable_mic}
	vocals_get_highway_view \{player = 1}
	if (<highway_view> = static)
		Wait \{4.2
			seconds}
	else
		Wait \{4.0
			seconds}
	endif
	training_pause_gem_scroller
	if (<highway_view> = static)
		training_add_arrow \{id = training_arrow
			life = 9.0
			pos = (640.0, 430.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 9.0
			pos = (700.0, 430.0)
			scale = 0.7}
	endif
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_Freeform_05_VOX'
		Wait}
	training_hide_narrator
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_resume_gem_scroller
endscript

script training_8_6_complete_message 
	printf \{qs("\Lstarting training_8_6_complete_message")}
	training_8_generic_placeholder_lesson_complete
endscript

script training_8_7_show_lesson_header 
	printf \{qs("\Lstarting training_8_7_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L7")
		text = qs("Vocals Star Power")}
	training_show_lesson_header
	create_training_pause_handler
	training_hide_placeholder
endscript

script training_8_7_hit_note 
	printf \{qs("\Lstarting training_8_7_hit_note")}
	change VOCAL_NOTES_HIT = ($VOCAL_NOTES_HIT + 1)
	if (($VOCAL_NOTES_HIT = 3) || ($VOCAL_NOTES_HIT = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_09_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_10_VOX'
				Wait}
			)
	endif
endscript

script training_8_7_missed_note 
	printf \{qs("\Lstarting training_8_7_missed_note")}
	change VOCAL_NOTES_MISSED = ($VOCAL_NOTES_MISSED + 1)
	if (($VOCAL_NOTES_MISSED = 3) || ($VOCAL_NOTES_MISSED = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_06_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_07_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_08_VOX'
				Wait}
			)
	endif
endscript

script training_8_7_wait_for_hit_notes 
	printf \{qs("\Lstarting training_8_7_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player1_status.star_power_amount >= 50)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_8_7_show_highway 
	printf \{qs("\Lstarting training_8_7_show_highway")}
	change \{tutorial_disable_hud = 0}
	training_show_narrator \{narrator = 'vocalist'}
	training_start_gem_scroller \{song = Tut_Vox_Combos
		part = Vocals}
	training_hide_narrator \{narrator = 'vocalist'
		no_placeholder}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{vocals_hit_phrase training_8_7_hit_note}
		{vocals_miss_phrase training_8_7_missed_note}
		{song_wonp1 training_song_won}
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
	training_wait_for_gem_scroller_startup \{disable_mic}
endscript

script training_8_7_start_star_power_task 
	printf \{qs("\Lstarting training_8_7_start_star_power_task")}
	vocals_get_highway_view \{player = 1}
	if (<highway_view> = static)
		Wait \{3.5
			seconds}
	else
		Wait \{3.0
			seconds}
	endif
	training_pause_gem_scroller
	training_hide_narrator \{narrator = 'vocalist'
		no_placeholder}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("Scoring EXCELLENT and GOOD on an ENTIRE phrase builds up Star Power.")}
	training_add_lesson_body_text \{number = qs("\L2")
		text = qs("Star Power fills up amp bulbs.")}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Vox_StarPower_02_VOX'
		Wait}
	training_set_task_header_body \{text = qs("Build up Star Power")}
	training_show_task_header
	change \{VOCAL_NOTES_HIT = 0}
	change \{VOCAL_NOTES_MISSED = 0}
	training_destroy_all_arrows
	vocals_mute_all_mics \{mute = false}
	training_resume_gem_scroller
	training_8_7_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
endscript

script training_8_7_complete_message 
	printf \{qs("\Lstarting training_8_7_complete_message")}
	training_8_generic_placeholder_lesson_complete
endscript

script training_8_8_show_lesson_header 
	printf \{qs("\Lstarting training_8_8_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L8")
		text = qs("Activating Star Power")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script training_8_8_hit_note 
	printf \{qs("\Lstarting training_8_8_hit_note")}
	if ($player1_status.star_power_used = 1)
		change VOCAL_NOTES_HIT = ($VOCAL_NOTES_HIT + 1)
		training_display_notes_hit \{notes_hit = $VOCAL_NOTES_HIT
			notes_required = 4}
		if (($VOCAL_NOTES_HIT = 1) || ($VOCAL_NOTES_HIT = 2))
			Random (
				@ training_play_sound \{Sound = 'Tut_Vox_StarPower_09_VOX'
					Wait}
				@ training_play_sound \{Sound = 'Tut_Vox_StarPower_10_VOX'
					Wait}
				)
		endif
	endif
endscript

script training_8_8_missed_note 
	printf \{qs("\Lstarting training_8_8_missed_note")}
	change VOCAL_NOTES_MISSED = ($VOCAL_NOTES_MISSED + 1)
	if (($VOCAL_NOTES_MISSED = 1) || ($VOCAL_NOTES_MISSED = 3))
		Random (
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_06_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_07_VOX'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_08_VOX'
				Wait}
			)
	endif
endscript

script training_8_8_wait_for_hit_notes 
	printf \{qs("\Lstarting training_8_8_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($VOCAL_NOTES_HIT >= 4)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_8_8_show_highway 
	printf \{qs("\Lstarting training_8_8_show_highway")}
	change \{tutorial_disable_hud = 0}
	training_start_gem_scroller \{song = Tut_Vox_Activ
		part = Vocals}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{vocals_hit_phrase training_8_8_hit_note}
		{vocals_miss_phrase training_8_8_missed_note}
		{song_wonp1 training_song_won}
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
	change \{structurename = player1_status
		star_power_amount = 100}
	training_wait_for_gem_scroller_startup \{disable_mic}
endscript

script training_8_8_start_activate_star_power_task 
	printf \{qs("\Lstarting training_8_7_start_activate_star_power_task")}
	vocals_get_highway_view \{player = 1}
	if (<highway_view> = static)
		Wait \{2.0
			seconds}
	else
		Wait \{3.0
			seconds}
	endif
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("Unleash Star Power by CLAPPING the top of the mic, or PRESSING a button.")}
	training_show_lesson_header
	training_hide_narrator \{narrator = 'vocalist'
		no_placeholder}
	training_play_sound \{Sound = 'Tut_Vox_StarPower_03_VOX'
		Wait}
	training_set_task_header_body \{text = qs("Activate Star Power and hit 4 phrases.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 4}
	change \{VOCAL_NOTES_HIT = 0}
	change \{VOCAL_NOTES_MISSED = 0}
	training_destroy_all_arrows
	vocals_mute_all_mics \{mute = false}
	training_resume_gem_scroller
	training_8_8_wait_for_hit_notes
	training_pause_gem_scroller
	vocals_mute_all_mics \{mute = true}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (275.0, 325.0)
		scale = 0.7
		rot = 90}
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_StarPower_04_VOX'
		Wait}
	training_hide_narrator
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'vocalist'}
	training_play_sound \{Sound = 'Tut_Vox_StarPower_05_VOX'
		Wait}
	training_hide_narrator
	training_resume_gem_scroller
endscript

script training_8_8_complete_message 
	printf \{qs("\Lstarting training_8_8_complete_message")}
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
			text = qs("Vocals Lesson")
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

script training_vocals_tutorial_end 
	printf \{qs("\Lstarting training_vocals_tutorial_end")}
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
			vocals_lesson = complete
		}}
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript
