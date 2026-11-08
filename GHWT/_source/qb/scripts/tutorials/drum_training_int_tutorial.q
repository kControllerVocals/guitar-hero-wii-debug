training_drum_int_tutorial_script = [
	{
		call = training_drum_int_tutorial_startup
	}
	{
		time = 1000
		call = training_drum_int_tutorial_show_title
	}
	{
		lesson = 1
		call = drum_training_2_1_show_lesson_header
	}
	{
		call = drum_training_2_1_show_highway
	}
	{
		call = drum_training_2_1_add_play_each_note_task
	}
	{
		call = drum_training_2_1_complete_message
	}
	{
		lesson = 2
		call = drum_training_2_2_show_lesson_header
	}
	{
		call = drum_training_2_2_show_highway
	}
	{
		call = drum_training_2_2_add_play_each_note_task
	}
	{
		call = drum_training_2_2_complete_message
	}
	{
		lesson = 3
		call = drum_training_2_3_show_lesson_header
	}
	{
		call = drum_training_2_3_show_highway
	}
	{
		call = drum_training_2_3_add_play_each_note_task
	}
	{
		call = drum_training_2_3_complete_message
	}
	{
		lesson = 4
		call = drum_training_2_4_show_lesson_header
	}
	{
		call = drum_training_2_4_show_highway
	}
	{
		call = drum_training_2_4_show_items_on_highway
	}
	{
		call = drum_training_2_4_add_play_each_note_task
	}
	{
		call = drum_training_2_4_complete_message
	}
	{
		lesson = 5
		call = drum_training_2_5_show_lesson_header
	}
	{
		call = drum_training_2_5_show_highway
	}
	{
		call = drum_training_2_5_add_play_each_note_task
	}
	{
		call = drum_training_2_5_complete_message
	}
	{
		call = drum_training_int_tutorial_end
	}
]

script drum_training_int_generic_placeholder_lesson_complete 
	printf \{qs(0xeb8f84ff)}
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

script drum_training_int_generic_hit_note \{notes_required = 8}
	printf \{qs("\Lstarting drum_trainingint_generic_hit_note")}
	change DRUM_NOTES_HIT = ($DRUM_NOTES_HIT + 1)
	if (($DRUM_NOTES_HIT = 1) || ($DRUM_NOTES_HIT = 4))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit notes_hit = $DRUM_NOTES_HIT notes_required = <notes_required>
endscript

script training_drum_int_tutorial_startup 
	create_loading_screen
	training_init_session
	ReloadSfx \{mode = tutorials
		tutorial = drum_int}
	destroy_loading_screen
	LaunchEvent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_drum_int_tutorial_show_title 
	printf \{qs("\Lstarting training_drum_int_tutorial_show_title")}
	training_show_title \{title = qs("Intermediate Drums Training")}
	begin
	if ($transitions_locked = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	Wait \{5
		seconds}
	training_destroy_title
endscript

script drum_training_2_1_show_lesson_header 
	printf \{qs("\Lstarting drum_training_2_1_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("Adding the First Part of a Drum Beat")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_2_1_hit_note 
	printf \{qs("\Lstarting drum_training_2_1_hit_note")}
	change DRUM_NOTES_HIT = ($DRUM_NOTES_HIT + 1)
	if (($DRUM_NOTES_HIT = 1) || ($DRUM_NOTES_HIT = 4))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit \{notes_hit = $DRUM_NOTES_HIT
		notes_required = 16}
endscript

script drum_training_2_1_missed_note 
	printf \{qs("\Lstarting drum_training_2_1_missed_note")}
	change DRUM_NOTES_MISSED = ($DRUM_NOTES_MISSED + 1)
	if (($DRUM_NOTES_MISSED = 6) || ($DRUM_NOTES_MISSED = 12))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_FirstDrum_06_DRM'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Dru_FirstDrum_07_DRM'
				Wait}
			)
	endif
endscript

script drum_training_2_1_wait_for_hit_notes 
	printf \{qs("\Lstarting drum_training_2_1_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($DRUM_NOTES_HIT >= 16)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_2_1_show_highway 
	printf \{qs("\Lstarting drum_training_2_1_show_highway")}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_FirstDrum_01_DRM'
		Wait}
	training_hide_narrator
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Drum_Beat1
		part = drum
		disable_hud
		no_score_update}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 drum_training_2_1_hit_note}
		{missed_notep1 drum_training_2_1_missed_note}
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
	training_wait_for_gem_scroller_startup
endscript

script drum_training_2_1_add_play_each_note_task 
	printf \{qs("\Lstarting drum_training_2_1_add_play_each_note_task")}
	Wait \{3.6
		seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_FirstDrum_02_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_FirstDrum_03_DRM'
		Wait}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("HIT the NOTES in ORDER as they cross the STRIKE LINE.")}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Dru_FirstDrum_04_DRM'
		Wait}
	training_hide_narrator
	change \{DRUM_NOTES_HIT = 0}
	change \{DRUM_NOTES_MISSED = 0}
	training_set_task_header_body \{text = qs("Hit 16 notes.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 16}
	training_resume_gem_scroller
	drum_training_2_1_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_FirstDrum_05_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_1_complete_message 
	printf \{qs("\Lstarting drum_training_2_1_complete_message")}
	drum_training_int_generic_placeholder_lesson_complete
endscript

script drum_training_2_2_show_lesson_header 
	printf \{qs("\Lstarting drum_training_2_2_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("Adding Another Drum")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_2_2_hit_note 
	printf \{qs("\Lstarting drum_training_2_2_hit_note")}
	change DRUM_NOTES_HIT = ($DRUM_NOTES_HIT + 1)
	if (($DRUM_NOTES_HIT = 1) || ($DRUM_NOTES_HIT = 4))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit \{notes_hit = $DRUM_NOTES_HIT
		notes_required = 20}
endscript

script drum_training_2_2_missed_note 
	printf \{qs("\Lstarting drum_training_2_2_missed_note")}
	change DRUM_NOTES_MISSED = ($DRUM_NOTES_MISSED + 1)
	if (($DRUM_NOTES_MISSED = 8) || ($DRUM_NOTES_MISSED = 16))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_AddDrum_03_DRM'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Dru_AddDrum_04_DRM'
				Wait}
			)
	endif
endscript

script drum_training_2_2_wait_for_hit_notes 
	printf \{qs("\Lstarting drum_training_2_2_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($DRUM_NOTES_HIT >= 20)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_2_2_show_highway 
	printf \{qs("\Lstarting drum_training_2_2_show_highway")}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Drum_Beat2
		part = drum
		disable_hud
		no_score_update}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 drum_training_2_2_hit_note}
		{missed_notep1 drum_training_2_2_missed_note}
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
	training_wait_for_gem_scroller_startup
endscript

script drum_training_2_2_add_play_each_note_task 
	printf \{qs("\Lstarting drum_training_2_2_add_play_each_note_task")}
	Wait \{3.6
		seconds}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("HIT the NOTES in ORDER as they cross the STRIKE LINE.")}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_AddDrum_01_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs("Hit 20 notes.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 20}
	change \{DRUM_NOTES_HIT = 0}
	change \{DRUM_NOTES_MISSED = 0}
	training_resume_gem_scroller
	drum_training_2_2_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_AddDrum_02_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_2_complete_message 
	printf \{qs("\Lstarting drum_training_2_2_complete_message")}
	drum_training_int_generic_placeholder_lesson_complete
endscript

script drum_training_2_3_show_lesson_header 
	printf \{qs("\Lstarting drum_training_2_3_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("Adding in the Kick")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_2_3_hit_note 
	printf \{qs("\Lstarting drum_training_2_3_hit_note")}
	change DRUM_NOTES_HIT = ($DRUM_NOTES_HIT + 1)
	if (($DRUM_NOTES_HIT = 9) || ($DRUM_NOTES_HIT = 18))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
	training_display_notes_hit \{notes_hit = $DRUM_NOTES_HIT
		notes_required = 24}
endscript

script drum_training_2_3_missed_note 
	printf \{qs("\Lstarting drum_training_2_3_missed_note")}
	change DRUM_NOTES_MISSED = ($DRUM_NOTES_MISSED + 1)
	if (($DRUM_NOTES_MISSED = 10) || ($DRUM_NOTES_MISSED = 20))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_05_DRM'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_06_DRM'
				Wait}
			)
	endif
endscript

script drum_training_2_3_wait_for_hit_notes 
	printf \{qs("\Lstarting drum_training_2_3_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($DRUM_NOTES_HIT >= 24)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_2_3_show_highway 
	printf \{qs("\Lstarting drum_training_2_3_show_highway")}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_AddKick_01_DRM'
		Wait}
	training_hide_narrator
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Drum_Beat3
		part = drum
		disable_hud
		no_score_update}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 drum_training_2_3_hit_note}
		{missed_notep1 drum_training_2_3_missed_note}
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
	training_wait_for_gem_scroller_startup
endscript

script drum_training_2_3_add_play_each_note_task 
	printf \{qs("\Lstarting drum_training_2_3_add_play_each_note_task")}
	Wait \{3.6
		seconds}
	training_pause_gem_scroller
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("HIT the NOTES in ORDER as they cross the STRIKE LINE.")}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_AddKick_02_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_AddKick_03_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs("Hit 24 notes.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 24}
	change \{DRUM_NOTES_HIT = 0}
	change \{DRUM_NOTES_MISSED = 0}
	training_resume_gem_scroller
	drum_training_2_3_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_AddKick_04_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_3_complete_message 
	printf \{qs("\Lstarting drum_training_2_3_complete_message")}
	drum_training_int_generic_placeholder_lesson_complete
endscript

script drum_training_2_4_show_lesson_header 
	printf \{qs("\Lstarting drum_training_2_4_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("Star Combos")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_2_4_hit_note 
	printf \{qs("\Lstarting drum_training_2_4_hit_note")}
	change DRUM_NOTES_HIT = ($DRUM_NOTES_HIT + 1)
	if (($DRUM_NOTES_HIT = 9) || ($DRUM_NOTES_HIT = 18))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	endif
endscript

script drum_training_2_4_missed_note 
	printf \{qs("\Lstarting drum_training_2_4_missed_note")}
	change DRUM_NOTES_MISSED = ($DRUM_NOTES_MISSED + 1)
	if (($DRUM_NOTES_MISSED = 5) || ($DRUM_NOTES_MISSED = 5))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_StarCombo_08_DRM'
				Wait}
			@ training_play_sound \{Sound = 'Tut_Dru_StarCombo_09_DRM'
				Wait}
			)
	endif
endscript

script drum_training_2_4_wait_for_hit_notes 
	printf \{qs("\Lstarting drum_training_2_4_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player1_status.star_power_amount = 50)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_2_4_show_highway 
	printf \{qs("\Lstarting drum_training_2_4_show_highway")}
	change \{tutorial_disable_hud = 0}
	training_start_gem_scroller \{song = Tut_Drum_Combos
		part = drum}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 drum_training_2_4_hit_note}
		{missed_notep1 drum_training_2_4_missed_note}
		{star_sequence_bonusp1 hit_star_power_sequence}
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
	training_wait_for_gem_scroller_startup
endscript

script drum_training_2_4_show_items_on_highway 
	printf \{qs("\Lstarting drum_training_2_4_show_items_on_highway")}
	Wait \{3.6
		seconds}
	training_pause_gem_scroller
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (700.0, 400.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (595.0, 360.0)
			scale = 0.7}
	endif
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_01_DRM'
		Wait}
	training_hide_narrator
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("HIT ALL of the NOTES in order as they cross the STRIKE LINE, to gain STAR POWER.")}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_02_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_03_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_04_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_4_add_play_each_note_task 
	printf \{qs("\Lstarting drum_training_2_4_add_play_each_note_task")}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_05_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs("Get Star Power.")}
	training_show_task_header
	change \{DRUM_NOTES_HIT = 0}
	change \{DRUM_NOTES_MISSED = 0}
	training_resume_gem_scroller
	drum_training_2_4_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_StarCombo_06_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_4_complete_message 
	printf \{qs("\Lstarting drum_training_2_4_complete_message")}
	drum_training_int_generic_placeholder_lesson_complete
endscript

script drum_training_2_5_show_lesson_header 
	printf \{qs("\Lstarting drum_training_2_5_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L5")
		text = qs("Activate Star Power")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_2_5_hit_note 
	printf \{qs("\Lstarting drum_training_2_5_hit_note")}
	if ($player1_status.star_power_used = 1)
		change DRUM_NOTES_HIT = ($DRUM_NOTES_HIT + 1)
		if (($DRUM_NOTES_HIT = 8) || ($DRUM_NOTES_HIT = 12))
			Random (
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
				@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
				)
		endif
		training_display_notes_hit \{notes_hit = $DRUM_NOTES_HIT
			notes_required = 16}
	endif
endscript

script drum_training_2_5_missed_note 
	printf \{qs("\Lstarting drum_training_2_5_missed_note")}
	change DRUM_NOTES_MISSED = ($DRUM_NOTES_MISSED + 1)
	if (($DRUM_NOTES_MISSED = 5) || ($DRUM_NOTES_MISSED = 5))
		Random (
			@ training_play_sound )\{Sound = 'Tut_Dru_ActStarPow_09_DRM'
			Wait}

	endif
endscript

script drum_training_2_5_wait_for_hit_notes 
	printf \{qs("\Lstarting drum_training_2_5_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($DRUM_NOTES_HIT >= 16)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_2_5_show_highway 
	printf \{qs("\Lstarting drum_training_2_5_show_highway")}
	change \{tutorial_disable_hud = 0}
	training_start_gem_scroller \{song = Tut_Drum_Activ
		part = drum
		no_score_update}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{hit_notesp1 drum_training_2_5_hit_note}
		{missed_notep1 drum_training_2_5_missed_note}
		{star_power_onp1 training_set_star_power_active}
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
	training_wait_for_gem_scroller_startup
endscript

script drum_training_2_5_add_play_each_note_task 
	printf \{qs("\Lstarting drum_training_2_5_add_play_each_note_task")}
	Wait \{3.6
		seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_01_DRM'
		Wait}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("Activate Star Power by HITTING both CYMBALS at the SAME time.")}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_02_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_03_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_04_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs("Activate Star Power and hit 16 notes.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 16}
	change \{DRUM_NOTES_HIT = 0}
	change \{DRUM_NOTES_MISSED = 0}
	training_resume_gem_scroller
	drum_training_2_5_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller \{still_in_training = 0}
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_05_DRM'
		Wait}
	Wait \{0.5
		seconds}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_06_DRM'
		Wait}
	Wait \{0.5
		seconds}
	training_play_sound \{Sound = 'Tut_Dru_ActStarPow_07_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_2_5_complete_message 
	printf \{qs("\Lstarting drum_training_2_5_complete_message")}
	training_destroy_title
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
		create_training_pause_handler
	endif
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_destroy_gem_scroller
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs("Intermediate Drums Lesson")
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

script drum_training_int_tutorial_end 
	training_kill_session
	if ScreenElementExists \{id = training_container}
		DestroyScreenElement \{id = training_container}
	endif
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
			drum_int_lesson = complete
		}}
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript
