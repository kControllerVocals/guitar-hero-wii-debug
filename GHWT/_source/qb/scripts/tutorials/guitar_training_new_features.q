training_new_features_tutorial_script = [
	{
		call = training_new_features_tutorial_startup
	}
	{
		lesson = 1
		call = training_5_1_show_title
	}
	{
		call = training_5_1_start_gem_scroller
	}
	{
		call = training_5_1_explain
	}
	{
		call = training_5_1_wait_for_extended_sustains
	}
	{
		call = training_5_1_complete_message
	}
	{
		lesson = 2
		call = training_5_2_start_gem_scroller
	}
	{
		call = training_5_2_explain
	}
	{
		call = training_5_2_wait_for_slider_tapping
	}
	{
		call = training_5_2_complete_message
	}
	{
		lesson = 3
		call = training_5_3_start_gem_scroller
	}
	{
		call = training_5_3_explain
	}
	{
		call = training_5_3_wait_for_slider_strumming
	}
	{
		call = training_5_3_complete_message
	}
	{
		lesson = 4
		call = training_5_4_start_gem_scroller
	}
	{
		call = training_5_4_explain
	}
	{
		call = training_5_4_wait_for_slider_wah
	}
	{
		call = training_5_4_complete_message
	}
	{
		call = training_new_features_tutorial_1_end
	}
]
training_using_slider = 0

script training_new_features_tutorial_startup 
	create_loading_screen
	training_init_session
	training_container :SetTags \{num_parts = 2
		num_complete = 0}
	ReloadSfx \{mode = tutorials
		tutorial = guitar_new}
	destroy_loading_screen
	LaunchEvent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
	if IsGuitarTouchController controller = ($player1_status.controller)
		change \{training_using_slider = 1}
	else
		change \{training_using_slider = 0}
	endif
endscript

script training_5_1_show_title 
	training_show_title \{title = qs("New Features Tutorial")}
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

script training_5_1_start_gem_scroller 
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = Tut_Gtr_ExtSus
		disable_hud}
	KillSpawnedScript \{name = update_score_fast}
	training_wait_for_gem_scroller_startup
endscript

script training_5_1_explain 
	Wait \{3.5
		seconds
		ignoreslomo}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("EXTENDED SUSTAINS")}
	training_add_lesson_body_text \{number = 1
		text = qs("PLAY and HOLD the Long Note")}
	training_add_lesson_body_text \{number = 2
		text = qs("STRUM to play the other notes while holding the long note")}
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_pause_gem_scroller
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson5_extended_sustain_note}
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
	training_play_sound \{Sound = 'Tut_Gtr_Sustains_01_GTR'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_Sustains_02_GTR'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_Sustains_03_GTR'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs("Hit 6 notes with extended sustain")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 6}
	training_play_sound \{Sound = 'Tut_Gtr_Sustains_04_GTR'
		Wait}
	Wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script lesson5_extended_sustain_note 
	Wait \{1
		gameframe}
	GetPlayerInfo \{1
		extended_sustain_percent_hold}
	if NOT (<extended_sustain_percent_hold> < 1.0)
		change training_extended_sustains_played = ($training_extended_sustains_played + 1)
	endif
	if ScreenElementExists \{id = LessonHeader}
		training_display_notes_hit notes_hit = ($training_extended_sustains_played) notes_required = 6
	endif
endscript
training_extended_sustains_played = 0

script training_5_1_wait_for_extended_sustains 
	change \{training_extended_sustains_played = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_extended_sustains_played >= 6)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	Wait \{1
		seconds
		ignoreslomo}
endscript

script training_5_1_complete_message 
	if ScreenElementExists \{id = notes_hit_text}
		DestroyScreenElement \{id = notes_hit_text}
	endif
	Wait \{0.75
		seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_narrator
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs("Lesson Complete")
			text_physics = 0
		}}
	training_play_sound \{Sound = 'Tut_Gtr_Sustains_13_GTR'
		Wait}
	Wait \{5
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_01_GTR'
		Wait}
	Wait \{1
		seconds
		ignoreslomo}
	training_container :GetTags
	<num_complete> = (<num_complete> + 1)
	training_container :SetTags num_complete = (<num_complete>)
endscript

script training_5_2_start_gem_scroller 
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("THE SLIDER / TAPPING")}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = Tut_Gtr_Slide
		disable_hud}
	KillSpawnedScript \{name = update_score_fast}
	change \{training_slider_notes_played = 0}
	training_wait_for_gem_scroller_startup
endscript
training_slider_notes_played = 0

script training_5_2_explain 
	Wait \{3
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = 1
		text = qs("Slide your fingers on the Slider or tap the touch zones to play the notes")}
	training_add_lesson_body_text \{number = 2
		text = qs("Don't hold any Fret Buttons down when using the Slider")}
	training_add_lesson_body_text \{number = 3
		text = qs("If you miss a note, release the Slider to try again")}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_02_GTR'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_03_GTR'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_04_GTR'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_05_GTR'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_06_GTR'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs("Hit 8 notes using the slider or by tapping")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_07_GTR'
		Wait}
	Wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_5_2_wait_for_slider_tapping 
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson5_slider_note}
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
	change \{training_slider_notes_played = 0}
	change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_slider_notes_played >= 8)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	Wait \{1
		seconds
		ignoreslomo}
endscript

script lesson5_slider_note 
	change training_slider_notes_played = ($training_slider_notes_played + 1)
	training_display_notes_hit notes_hit = ($training_slider_notes_played)
endscript

script training_5_2_complete_message 
	if ScreenElementExists \{id = notes_hit_text}
		DestroyScreenElement \{id = notes_hit_text}
	endif
	Wait \{0.75
		seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller \{still_in_training = 0}
	if IsGuitarTouchController controller = ($player1_status.controller)
		change \{training_using_slider = 1}
	else
		change \{training_using_slider = 0}
	endif
	if ($training_using_slider = 0)
		training_show_narrator \{narrator = 'guitarist'}
		training_play_sound \{Sound = 'Tut_Gtr_SliderTap_14_GTR'
			Wait}
		Wait \{0.5
			seconds
			ignoreslomo}
		training_play_sound \{Sound = 'Tut_Gtr_SliderTap_17_GTR'
			Wait}
		Wait \{0.5
			seconds
			ignoreslomo}
		training_play_sound \{Sound = 'Tut_Gtr_SliderTap_18_GTR'
			Wait}
		training_hide_narrator \{narrator = 'guitarist'}
		Wait \{0.5
			seconds
			ignoreslomo}
		SoundEvent \{event = Tutorial_Mode_Finish_Chord}
		spawnscriptnow \{create_exploding_text
			id = training_spawned_script
			params = {
				parent = 'lesson_complete'
				text = qs("New Features Tutorial")
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
	else
		SoundEvent \{event = Tutorial_Mode_Finish_Chord}
		spawnscriptnow \{create_exploding_text
			id = training_spawned_script
			params = {
				parent = 'lesson_complete'
				text = qs("Lesson Complete")
				text_physics = 0
			}}
	endif
	training_hide_narrator \{narrator = 'guitarist'}
	Wait \{7
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = create_exploding_text}
	destroy_all_exploding_text
	training_container :GetTags
	<num_complete> = (<num_complete> + 1)
	training_container :SetTags num_complete = (<num_complete>)
endscript

script training_5_3_start_gem_scroller 
	if ($training_using_slider = 0)
		return
	endif
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("STRUMMING WITH THE SLIDER")}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = Tut_Gtr_DiffNotes
		disable_hud}
	KillSpawnedScript \{name = update_score_fast}
	change \{training_slider_notes_played = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_5_3_explain 
	if ($training_using_slider = 0)
		return
	endif
	Wait \{3
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = 1
		text = qs("HOLD Fret Button to CHOOSE the correctly colored note as it approaches the Strike Line")}
	training_add_lesson_body_text \{number = 2
		text = qs("TAP The Slider to PLAY the note as it crosses the Strike Line")}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_14_GTR'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs("Hit 8 notes using the slider to strum")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_15_GTR'
		Wait}
	Wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_5_3_wait_for_slider_strumming 
	if ($training_using_slider = 0)
		return
	endif
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 lesson5_slider_strum}
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
	change \{training_slider_notes_played = 0}
	change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_slider_notes_played >= 8)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	Wait \{1
		seconds
		ignoreslomo}
endscript

script lesson5_slider_strum 
	if (<hit_note_touch> = 1)
		change training_slider_notes_played = ($training_slider_notes_played + 1)
		training_display_notes_hit notes_hit = ($training_slider_notes_played)
	endif
endscript

script training_5_3_complete_message 
	if ($training_using_slider = 0)
		return
	endif
	if ScreenElementExists \{id = notes_hit_text}
		DestroyScreenElement \{id = notes_hit_text}
	endif
	Wait \{0.75
		seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs("Lesson Complete")
			text_physics = 0
		}}
	training_hide_narrator \{narrator = 'guitarist'}
	Wait \{7
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = create_exploding_text}
	destroy_all_exploding_text
endscript

script training_5_4_start_gem_scroller 
	if ($training_using_slider = 0)
		return
	endif
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("SLIDER WAH")}
	training_clear_lesson_body_text
	training_show_lesson_header
	training_show_narrator \{narrator = 'guitarist'}
	training_start_gem_scroller \{bot_array = [
			0
			0
			0
			0
		]
		song = Tut_Gtr_LongNotes
		disable_hud}
	KillSpawnedScript \{name = update_score_fast}
	change \{training_slider_notes_played = 0}
	training_wait_for_gem_scroller_startup
endscript

script training_5_4_explain 
	if ($training_using_slider = 0)
		return
	endif
	Wait \{3
		seconds
		ignoreslomo}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = 1
		text = qs("PLAY the long note as usual")}
	training_add_lesson_body_text \{number = 2
		text = qs("SLIDE your finger on The Slider to add Wah")}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_17_GTR'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_set_task_header_body \{text = qs("Hit 8 notes and use Slider Wah")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_07_GTR'
		Wait}
	Wait \{1
		seconds
		ignoreslomo}
	training_resume_gem_scroller
endscript

script training_5_4_wait_for_slider_wah 
	if ($training_using_slider = 0)
		return
	endif
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{whammy_offp1 lesson5_slider_wah}
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
	change \{training_slider_notes_played = 0}
	change \{training_song_over = 0}
	begin
	if ($training_song_over = 1)
		break
	endif
	if ($training_slider_notes_played >= 8)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	Wait \{1
		seconds
		ignoreslomo}
endscript

script lesson5_slider_wah 
	if (<touch_wah> = 1)
		change training_slider_notes_played = ($training_slider_notes_played + 1)
		training_display_notes_hit notes_hit = ($training_slider_notes_played)
	endif
endscript

script training_5_4_complete_message 
	if ($training_using_slider = 0)
		return
	endif
	if ScreenElementExists \{id = notes_hit_text}
		DestroyScreenElement \{id = notes_hit_text}
	endif
	Wait \{0.75
		seconds
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs("New Features Tutorial")
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
	training_hide_narrator \{narrator = 'guitarist'}
	training_play_sound \{Sound = 'Tut_Gtr_SliderTap_18_GTR'}
	Wait \{7
		seconds
		ignoreslomo}
	training_wait_for_sound \{Sound = 'Tut_Gtr_SliderTap_18_GTR'}
	KillSpawnedScript \{name = create_exploding_text}
	destroy_all_exploding_text
endscript

script training_new_features_tutorial_1_end 
	training_container :GetTags
	if (<num_complete> = <num_parts>)
		SetGlobalTags \{training
			params = {
				new_features_lesson = complete
			}}
	endif
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
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript

script training_check_for_all_tutorials_finished 
	if NOT ($is_attract_mode = 1)
	endif
	GetGlobalTags \{training}
	if (<basic_lesson> != complete)
		return
	endif
	if (<star_power_lesson> != complete)
		return
	endif
	if (<advanced_techniques_lesson> != complete)
		return
	endif
	if (<new_features_lesson> != complete)
		return
	endif
	if (<drum_basic_lesson> != complete)
		return
	endif
	if (<drum_int_lesson> != complete)
		return
	endif
endscript
