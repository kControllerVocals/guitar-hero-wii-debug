TRAINING_DRUMS_HIT = [
	0
	0
	0
	0
	0
]
TOTAL_DRUMS_HIT = 0
TOTAL_DRUMS_COMPLETE = 0
DRUM_NOTES_HIT = 0
DRUM_NOTES_MISSED = 0
TRAINING_KICK_DRUM_HIT = 0
training_drum_basic_tutorial_script = [
	{
		call = training_drum_basic_tutorial_startup
	}
	{
		time = 1000
		call = training_drum_basic_tutorial_show_title
	}
	{
		lesson = 1
		call = drum_training_1_1_show_lesson_header
	}
	{
		call = drum_training_1_1_show_holding_sticks_image
	}
	{
		call = drum_training_1_1_complete_message
	}
	{
		lesson = 2
		call = drum_training_1_2_show_lesson_header
	}
	{
		call = drum_training_1_2_show_drum_image
	}
	{
		call = drum_training_1_2_add_play_each_note_task
	}
	{
		call = drum_training_1_2_complete_message
	}
	{
		lesson = 3
		call = drum_training_1_3_show_lesson_header
	}
	{
		call = drum_training_1_3_show_highway
	}
	{
		call = drum_training_1_3_show_items_on_highway
	}
	{
		call = drum_training_1_3_add_play_each_note_task
	}
	{
		call = drum_training_1_3_complete_message
	}
	{
		lesson = 4
		call = drum_training_1_4_show_lesson_header
	}
	{
		call = drum_training_1_4_show_highway
	}
	{
		call = drum_training_1_4_show_items_on_highway
	}
	{
		call = drum_training_1_4_add_play_each_note_task
	}
	{
		call = drum_training_1_4_complete_message
	}
	{
		lesson = 5
		call = drum_training_1_5_show_lesson_header
	}
	{
		call = drum_training_1_5_show_drum_image
	}
	{
		call = drum_training_1_5_add_play_each_note_task
	}
	{
		call = drum_training_1_5_complete_message
	}
	{
		lesson = 6
		call = drum_training_1_6_show_lesson_header
	}
	{
		call = drum_training_1_6_show_highway
	}
	{
		call = drum_training_1_6_add_play_each_note_task
	}
	{
		call = drum_training_1_6_point_out_freeform_section
	}
	{
		call = drum_training_1_6_complete_message
	}
	{
		lesson = 7
		call = drum_training_1_7_show_lesson_header
	}
	{
		call = drum_training_1_7_show_highway
	}
	{
		call = drum_training_1_7_show_rock_meter
	}
	{
		call = drum_training_1_7_point_out_score
	}
	{
		call = drum_training_1_7_complete_message
	}
	{
		lesson = 8
		call = drum_training_1_8_show_lesson_header
	}
	{
		call = drum_training_1_8_show_highway
	}
	{
		call = drum_training_1_8_show_items_on_highway
	}
	{
		call = drum_training_1_8_add_play_each_note_task
	}
	{
		call = drum_training_1_8_complete_message
	}
	{
		call = drum_training_basic_tutorial_end
	}
]

script drum_training_basic_generic_placeholder_lesson_complete 
	printf \{qs(0x459a2a8d)}
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

script training_drum_basic_tutorial_startup 
	create_loading_screen
	training_init_session
	ReloadSfx \{mode = tutorials
		tutorial = drum_basic}
	destroy_loading_screen
	LaunchEvent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_drum_basic_tutorial_show_title 
	printf \{qs("\Lstarting training_drum_basic_tutorial_show_title")}
	training_show_title \{title = qs("Basic Drums Training")}
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

script drum_training_1_1_show_lesson_header 
	printf \{qs("\Lstarting drum_training_1_1_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("Holding the Sticks")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_1_create_sticks 
	printf \{qs("\Lstarting drum_training_1_1_create_sticks")}
	CreateScreenElement \{parent = training_container
		type = SpriteElement
		id = stick_sprite_up
		just = [
			center
			center
		]
		texture = tutorial_drum_hand_up
		pos = (630.0, 460.0)
		scale = (0.75, 0.75)
		z_priority = 4}
	safe_hide id = <id>
	CreateScreenElement \{parent = training_container
		type = SpriteElement
		id = stick_sprite_down
		just = [
			center
			center
		]
		texture = tutorial_drum_hand_down
		pos = (630.0, 460.0)
		scale = (0.75, 0.75)
		z_priority = 4}
	safe_hide id = <id>
	CreateScreenElement \{parent = training_container
		type = SpriteElement
		id = two_hand_stick_sprite
		just = [
			center
			center
		]
		texture = tutorial_drum_2hands
		pos = (630.0, 460.0)
		scale = (1.0, 1.0)
		z_priority = 4}
endscript

script drum_training_1_1_animate_sticks 
	printf \{qs("\Lstarting drum_training_1_1_animate_sticks")}
	safe_hide \{id = two_hand_stick_sprite}
	begin
	safe_hide \{id = stick_sprite_down}
	safe_show \{id = stick_sprite_up}
	Wait \{1
		seconds}
	safe_hide \{id = stick_sprite_up}
	safe_show \{id = stick_sprite_down}
	play_drum_sample \{pad = snare
		velocity = 70}
	Wait \{1
		seconds}
	repeat 6
	safe_hide \{id = stick_sprite_down}
	safe_show \{id = stick_sprite_up}
endscript

script drum_training_1_1_show_holding_sticks_image 
	printf \{qs("\Lstarting drum_training_1_1_show_holding_sticks_image")}
	spawnscriptnow \{drum_training_1_1_create_sticks
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	LoadTutorialSFX \{mode = Tut_Dru_HoldSticks}
	training_play_sound \{Sound = 'Tut_Dru_HoldSticks_01_DRM'
		Wait}
	training_hide_narrator
	spawnscriptnow \{drum_training_1_1_animate_sticks
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_HoldSticks_02_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_HoldSticks_03_DRM'
		Wait}
	training_hide_narrator
	safe_destroy \{id = two_hand_stick_sprite}
	safe_destroy \{id = stick_sprite_up}
	safe_destroy \{id = stick_sprite_down}
endscript

script drum_training_1_1_complete_message 
	printf \{qs("\Lstarting drum_training_1_1_complete_message")}
	drum_training_basic_generic_placeholder_lesson_complete
endscript

script drum_training_1_2_show_lesson_header 
	printf \{qs("\Lstarting drum_training_1_2_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("Drum Test")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_2_create_drum_hit_sprites 
	printf \{qs("\Lstarting drum_training_1_2_create_drum_hit_sprites")}
	CreateScreenElement \{parent = drumkit_sprite
		type = SpriteElement
		id = drum_hit_0
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			0
			107
			51
			255
		]
		pos = (335.0, 173.0)
		scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	CreateScreenElement \{parent = drumkit_sprite
		type = SpriteElement
		id = drum_hit_1
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			0
			160
			198
			255
		]
		pos = (253.0, 159.0)
		scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	CreateScreenElement \{parent = drumkit_sprite
		type = SpriteElement
		id = drum_hit_2
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			255
			191
			0
			255
		]
		pos = (198.0, 108.0)
		scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	CreateScreenElement \{parent = drumkit_sprite
		type = SpriteElement
		id = drum_hit_3
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			191
			0
			0
			255
		]
		pos = (152.0, 175.0)
		scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
	CreateScreenElement \{parent = drumkit_sprite
		type = SpriteElement
		id = drum_hit_4
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			1
			83
			83
			255
		]
		pos = (344.0, 89.0)
		scale = (0.9, 0.9)
		z_priority = 5
		alpha = 0.0}
endscript

script drum_training_1_2_wait_for_drum_test_complete 
	printf \{qs("\Lstarting drum_training_1_2_wait_for_drum_test_complete")}
	training_show_task_header
	change \{TRAINING_DRUMS_HIT = [
			0
			0
			0
			0
			0
		]}
	change \{TOTAL_DRUMS_HIT = 0}
	change \{TOTAL_DRUMS_COMPLETE = 0}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_choose training_hit_drum params = {index = 0}}
		{pad_option training_hit_drum params = {index = 1}}
		{pad_option2 training_hit_drum params = {index = 2}}
		{pad_back training_hit_drum params = {index = 3}}
		{pad_r1 training_hit_drum params = {index = 4}}
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
	change \{LESSON_COMPLETE = 0}
	begin
	if ($LESSON_COMPLETE = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	LaunchEvent \{type = unfocus
		target = menu_tutorial}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
endscript

script training_hit_drum \{velocity = 127}
	printf qs(0x820308b6) i = <index>
	FormatText checksumname = drum_hit 'drum_hit_%i' i = <index>
	if ($TRAINING_DRUMS_HIT [<index>] < 4)
		SetArrayElement ArrayName = TRAINING_DRUMS_HIT GlobalArray index = <index> newvalue = ($TRAINING_DRUMS_HIT [<index>] + 1)
		change TOTAL_DRUMS_HIT = ($TOTAL_DRUMS_HIT + 1)
		<drum_hit> :SE_SetProps {
			scale = (0.0)
			alpha = 1.0
		}
		<drum_hit> :SE_SetProps {
			scale = (1.5)
			alpha = 0.0
			time = 0.25
		}
		GetDrumHitVelocity \{player = 1}
		switch <drum_hit>
			case drum_hit_0
			printf \{qs("\Lhitting drum_hit_0")}
			play_drum_sample pad = tom2 velocity = <velocity>
			case drum_hit_1
			printf \{qs("\Lhitting drum_hit_1")}
			play_drum_sample pad = tom1 velocity = <velocity>
			case drum_hit_2
			printf \{qs("\Lhitting drum_hit_2")}
			play_drum_sample pad = hihat velocity = <velocity>
			case drum_hit_3
			printf \{qs("\Lhitting drum_hit_3")}
			play_drum_sample pad = snare velocity = <velocity>
			case drum_hit_4
			printf \{qs("\Lhitting drum_hit_4")}
			play_drum_sample pad = cymbal velocity = <velocity>
		endswitch
		if ($TRAINING_DRUMS_HIT [<index>] = 4)
			change TOTAL_DRUMS_COMPLETE = ($TOTAL_DRUMS_COMPLETE + 1)
			GetScreenElementPosition id = <drum_hit>
			<checkmark_offset> = (50.0, 45.0)
			CreateScreenElement {
				parent = drumkit_sprite
				type = SpriteElement
				just = [center center]
				texture = tutorial_checkmark
				pos = (<screenelementpos> + <checkmark_offset>)
				scale = (0.6, 0.6)
				z_priority = 7
			}
			if (($TOTAL_DRUMS_COMPLETE = 1) || ($TOTAL_DRUMS_COMPLETE = 3))
				GetRandomValue \{name = random_value
					a = 0
					b = 10}
				if (<random_value> < 5)
					training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
				else
					training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
				endif
			endif
		endif
		if ($TOTAL_DRUMS_HIT >= 20)
			change \{LESSON_COMPLETE = 1}
		endif
	endif
endscript

script drum_training_1_2_show_drum_image 
	printf \{qs("\Lstarting drum_training_1_2_show_drum_image")}
	training_show_narrator \{narrator = 'drummer'}
	LoadTutorialSFX \{mode = Tut_Dru_DrumTest}
	training_play_sound \{Sound = 'Tut_Dru_DrumTest_01_DRM'
		Wait}
	training_hide_narrator
	<drum_kit_texture> = tutorial_DrumKit_ngc
	CreateScreenElement {
		parent = training_container
		type = SpriteElement
		id = drumkit_sprite
		just = [center center]
		texture = <drum_kit_texture>
		pos = (640.0, 490.0)
		scale = (0.9, 0.9)
		z_priority = 4
	}
	drum_training_1_2_create_drum_hit_sprites
endscript

script drum_training_1_2_add_play_each_note_task 
	printf \{qs("\Lstarting drum_training_1_2_add_play_each_note_task")}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("HIT the PAD with the sticks to play a note.")}
	training_add_lesson_body_text \{number = qs("\L2")
		text = qs("Try to HIT the CENTER of the PAD instead of the EDGE.")}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_DrumTest_02_DRM'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Dru_DrumTest_03_DRM'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Dru_DrumTest_04_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs("Play each note four times.")}
	training_show_task_header
	drum_training_1_2_wait_for_drum_test_complete
	training_hide_lesson_header
	Wait \{0.25
		seconds
		ignoreslomo}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_DrumTest_05_DRM'
		Wait}
	training_hide_narrator
	safe_destroy \{id = drumkit_sprite}
endscript

script drum_training_1_2_complete_message 
	printf \{qs("\Lstarting drum_training_1_2_complete_message")}
	drum_training_basic_generic_placeholder_lesson_complete
endscript

script drum_training_1_3_show_lesson_header 
	printf \{qs("\Lstarting drum_training_1_3_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("One Hand")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_3_show_highway 
	printf \{qs("\Lstarting drum_training_1_3_show_highway")}
	training_show_narrator \{narrator = 'drummer'}
	LoadTutorialSFX \{mode = Tut_Dru_OneHand}
	training_play_sound \{Sound = 'Tut_Dru_OneHand_01_DRM'
		Wait}
	training_hide_narrator
	SetPlayerInfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Drum_OneHand
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
		{hit_notesp1 drum_training_1_3_hit_note}
		{missed_notep1 drum_training_1_3_missed_note}
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

script drum_training_1_3_hit_note 
	printf \{qs("\Lstarting drum_training_1_3_hit_note")}
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
	training_display_notes_hit \{notes_hit = $DRUM_NOTES_HIT}
endscript

script drum_training_1_3_missed_note 
	printf \{qs("\Lstarting drum_training_1_3_missed_note")}
	change DRUM_NOTES_MISSED = ($DRUM_NOTES_MISSED + 1)
	if (($DRUM_NOTES_MISSED = 3) || ($DRUM_NOTES_MISSED = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_OneHand_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_OneHand_08_DRM'}
			)
	endif
endscript

script drum_training_1_3_wait_for_hit_notes 
	printf \{qs("\Lstarting drum_training_1_3_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($DRUM_NOTES_HIT >= 8)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_3_show_items_on_highway 
	printf \{qs("\Lstarting drum_training_1_3_show_items_on_highway")}
	Wait \{3.6
		seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_OneHand_02_DRM'
		Wait}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("To play a note, HIT the correct PAD with the sticks as it crosses the STRIKE LINE.")}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Dru_OneHand_03_DRM'
		Wait}
	training_hide_narrator
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (700.0, 370.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (545.0, 360.0)
			scale = 0.7}
	endif
	Wait \{0.5
		seconds
		ignoreslomo}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_OneHand_04_DRM'
		Wait}
	training_hide_narrator
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (886.0, 635.0)
			scale = 0.7
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (380.0, 635.0)
			scale = 0.7
			rot = -90}
	endif
	Wait \{2
		seconds
		ignoreslomo}
endscript

script drum_training_1_3_add_play_each_note_task 
	printf \{qs("\Lstarting drum_training_1_3_add_play_each_note_task")}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_OneHand_05_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs("Hit 8 notes.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	change \{DRUM_NOTES_HIT = 0}
	change \{DRUM_NOTES_MISSED = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller
	drum_training_1_3_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_OneHand_06_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_3_complete_message 
	printf \{qs("\Lstarting drum_training_1_3_complete_message")}
	safe_destroy \{id = notes_hit_text}
	drum_training_basic_generic_placeholder_lesson_complete
endscript

script drum_training_1_4_show_lesson_header 
	printf \{qs("\Lstarting drum_training_1_4_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("Two Hands")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_4_hit_note 
	printf \{qs("\Lstarting drum_training_1_4_hit_note")}
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
	training_display_notes_hit \{notes_hit = $DRUM_NOTES_HIT}
endscript

script drum_training_1_4_missed_note 
	printf \{qs("\Lstarting drum_training_1_4_missed_note")}
	change DRUM_NOTES_MISSED = ($DRUM_NOTES_MISSED + 1)
	if (($DRUM_NOTES_MISSED = 3) || ($DRUM_NOTES_MISSED = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_TwoHands_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_TwoHands_08_DRM'}
			)
	endif
endscript

script drum_training_1_4_wait_for_hit_notes 
	printf \{qs("\Lstarting drum_training_1_4_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($DRUM_NOTES_HIT >= 8)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_4_show_highway 
	printf \{qs("\Lstarting drum_training_1_4_show_highway")}
	training_show_narrator \{narrator = 'drummer'}
	LoadTutorialSFX \{mode = Tut_Dru_TwoHands}
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_01_DRM'
		Wait}
	training_hide_narrator
	SetPlayerInfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Drum_TwoHands
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
		{drum_multi_hitp1 drum_training_1_4_hit_note}
		{missed_notep1 drum_training_1_4_missed_note}
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

script drum_training_1_4_show_items_on_highway 
	printf \{qs("\Lstarting drum_training_1_4_show_items_on_highway")}
	Wait \{3.6
		seconds}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_02_DRM'
		Wait}
	training_hide_narrator
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("To play a pair of notes, HIT the correct PADS at the same time as they cross the STRIKE LINE.")}
	training_show_lesson_header
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow
			life = 7.0
			pos = (700.0, 400.0)
			scale = 0.7}
		training_add_arrow \{id = training_arrow
			life = 7.0
			pos = (642.0, 400.0)
			scale = 0.7}
	else
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (545.0, 360.0)
			scale = 0.7}
		training_add_arrow \{id = training_arrow
			life = 3.0
			pos = (595.0, 360.0)
			scale = 0.7}
	endif
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_03_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_4_add_play_each_note_task 
	printf \{qs("\Lstarting drum_training_1_4_add_play_each_note_task")}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_04_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs("Hit 8 pairs of notes.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	change \{DRUM_NOTES_HIT = 0}
	change \{DRUM_NOTES_MISSED = 0}
	training_destroy_all_arrows
	training_resume_gem_scroller
	drum_training_1_4_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_06_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_4_complete_message 
	printf \{qs("\Lstarting drum_training_1_4_complete_message")}
	safe_destroy \{id = notes_hit_text}
	drum_training_basic_generic_placeholder_lesson_complete
endscript

script drum_training_1_5_show_lesson_header 
	printf \{qs("\Lstarting drum_training_1_5_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L5")
		text = qs("Kick Pedal")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_5_create_kick_sprites 
	printf \{qs("\Lstarting drum_training_1_5_create_kick_sprites")}
	CreateScreenElement \{parent = training_container
		type = SpriteElement
		id = kick_foot_sprite_up
		just = [
			center
			center
		]
		texture = tutorial_KickPedal_Foot
		pos = (630.0, 450.0)
		scale = (0.75, 0.75)
		z_priority = 4}
	safe_hide id = <id>
	CreateScreenElement \{parent = training_container
		type = SpriteElement
		id = kick_sprite_up
		just = [
			center
			center
		]
		texture = tutorial_KickPedal_Up
		pos = (630.0, 450.0)
		scale = (0.75, 0.75)
		z_priority = 4}
	safe_hide id = <id>
	CreateScreenElement \{parent = training_container
		type = SpriteElement
		id = kick_foot_sprite_down
		just = [
			center
			center
		]
		texture = tutorial_KickPedal_Foot
		pos = (630.0, 470.0)
		scale = (0.75, 0.75)
		z_priority = 4
		rot_angle = -10}
	CreateScreenElement \{parent = training_container
		type = SpriteElement
		id = kick_sprite_down
		just = [
			center
			center
		]
		texture = tutorial_KickPedal_Down
		pos = (630.0, 450.0)
		scale = (0.75, 0.75)
		z_priority = 4}
endscript

script drum_training_1_5_create_kick_with_no_foot_sprites 
	printf \{qs("\Lstarting drum_training_1_5_create_kick_with_no_foot_sprites")}
	CreateScreenElement \{parent = training_container
		type = SpriteElement
		id = kick_nofoot_sprite_down
		just = [
			center
			center
		]
		texture = tutorial_KickPedal_Down
		pos = (630.0, 450.0)
		scale = (0.75, 0.75)
		z_priority = 4}
	safe_hide id = <id>
	CreateScreenElement \{parent = training_container
		type = SpriteElement
		id = kick_nofoot_sprite_up
		just = [
			center
			center
		]
		texture = tutorial_KickPedal_Up
		pos = (630.0, 450.0)
		scale = (0.75, 0.75)
		z_priority = 4}
endscript

script drum_training_1_5_animate_kicks 
	printf \{qs("\Lstarting drum_training_1_5_animate_kicks")}
	Wait \{1.5
		seconds}
	begin
	safe_hide \{id = kick_sprite_down}
	safe_hide \{id = kick_foot_sprite_down}
	safe_show \{id = kick_sprite_up}
	safe_show \{id = kick_foot_sprite_up}
	Wait \{0.5
		seconds}
	safe_hide \{id = kick_sprite_up}
	safe_hide \{id = kick_foot_sprite_up}
	safe_show \{id = kick_sprite_down}
	safe_show \{id = kick_foot_sprite_down}
	Wait \{0.5
		seconds}
	repeat 3
endscript

script drum_training_1_5_show_drum_image 
	printf \{qs("\Lstarting drum_training_1_5_show_drum_image")}
	spawnscriptnow \{drum_training_1_5_create_kick_sprites
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	LoadTutorialSFX \{mode = Tut_Dru_KickPedal}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_01_DRM'
		Wait}
	Wait \{0.5
		seconds}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_02_DRM'
		Wait}
	Wait \{0.5
		seconds}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_03_DRM'
		Wait}
	Wait \{0.5
		seconds}
	spawnscriptnow \{drum_training_1_5_animate_kicks
		id = training_spawned_script}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_04_DRM'
		Wait}
	training_hide_narrator
	KillSpawnedScript \{name = drum_training_1_5_animate_kicks}
	safe_hide \{id = kick_sprite_up}
	safe_hide \{id = kick_sprite_down}
	safe_hide \{id = kick_foot_sprite_down}
	safe_hide \{id = kick_foot_sprite_up}
endscript

script drum_training_1_5_create_kick_drum_hit_sprites 
	printf \{qs("\Lstarting drum_training_1_5_create_kick_drum_hit_sprites")}
	CreateScreenElement \{parent = kick_nofoot_sprite_down
		type = SpriteElement
		id = kick_drum_hit
		just = [
			center
			center
		]
		texture = tutorial_drum_hit
		rgba = [
			80
			0
			80
			255
		]
		pos = (118.0, 333.0)
		scale = (2.0, 2.0)
		z_priority = 5
		alpha = 0.0}
endscript

script drum_training_1_5_wait_for_drum_test_complete 
	printf \{qs("\Lstarting drum_training_1_5_wait_for_drum_test_complete")}
	training_show_task_header
	change \{TRAINING_KICK_DRUM_HIT = 0}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{pad_l1 training_hit_kick_drum}
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
	change \{LESSON_COMPLETE = 0}
	begin
	if ($LESSON_COMPLETE = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	LaunchEvent \{type = unfocus
		target = menu_tutorial}
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	SetMenuAutoRepeatTimes \{(0.3, 0.05)}
endscript

script training_hit_kick_drum \{velocity = 127}
	printf \{qs("\Lstarting training_hit_kick_drum")}
	change TRAINING_KICK_DRUM_HIT = ($TRAINING_KICK_DRUM_HIT + 1)
	safe_hide \{id = kick_nofoot_sprite_up}
	safe_show \{id = kick_nofoot_sprite_down}
	play_drum_sample pad = kick velocity = <velocity>
	kick_drum_hit :SE_SetProps {
		scale = (0.0)
		alpha = 1.0
	}
	kick_drum_hit :SE_SetProps {
		scale = (4.0)
		alpha = 0.0
		time = 0.25
	}
	if (($TRAINING_KICK_DRUM_HIT = 1) || ($TRAINING_KICK_DRUM_HIT = 3))
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
	Wait \{0.5
		seconds}
	safe_show \{id = kick_nofoot_sprite_up}
	safe_hide \{id = kick_nofoot_sprite_down}
	if ($TRAINING_KICK_DRUM_HIT >= 4)
		change \{LESSON_COMPLETE = 1}
	endif
endscript

script drum_training_1_5_add_play_each_note_task 
	printf \{qs("\Lstarting drum_training_1_5_add_play_each_note_task")}
	spawnscriptnow \{drum_training_1_5_create_kick_with_no_foot_sprites
		id = training_spawned_script}
	spawnscriptnow \{drum_training_1_5_create_kick_drum_hit_sprites
		id = training_spawned_script}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("PRESS the PEDAL down with your foot to play a note.")}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_05_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs("Hit 4 notes.")}
	training_show_task_header
	drum_training_1_5_wait_for_drum_test_complete
	training_hide_lesson_header
	safe_hide \{id = kick_nofoot_sprite_up}
	safe_hide \{id = kick_nofoot_sprite_down}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_KickPedal_06_DRM'
		Wait}
	training_hide_narrator
	safe_destroy \{id = kick_drum_hit}
endscript

script drum_training_1_5_complete_message 
	printf \{qs("\Lstarting drum_training_1_5_complete_message")}
	drum_training_basic_generic_placeholder_lesson_complete
endscript

script drum_training_1_6_show_lesson_header 
	printf \{qs("\Lstarting drum_training_1_6_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L6")
		text = qs("Kick in a Song")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_6_show_highway 
	printf \{qs("\Lstarting drum_training_1_6_show_highway")}
	SetPlayerInfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Drum_Kick
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
		{hit_notesp1 drum_training_1_6_hit_note}
		{missed_notep1 drum_training_1_6_missed_note}
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

script drum_training_1_6_hit_note 
	printf \{qs("\Lstarting drum_training_1_6_hit_note")}
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
	training_display_notes_hit \{notes_hit = $DRUM_NOTES_HIT}
endscript

script drum_training_1_6_missed_note 
	printf \{qs("\Lstarting drum_training_1_6_missed_note")}
	change DRUM_NOTES_MISSED = ($DRUM_NOTES_MISSED + 1)
	if (($DRUM_NOTES_MISSED = 3) || ($DRUM_NOTES_MISSED = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_06_DRM'}
			)
	endif
endscript

script drum_training_1_6_wait_for_hit_notes 
	printf \{qs("\Lstarting drum_training_1_6_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($DRUM_NOTES_HIT >= 8)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_6_spawn_delayed_strike_line_arrow 
	printf \{qs("\Lstarting drum_training_1_6_spawn_delayed_strike_line_arrow")}
	Wait \{2.5
		seconds
		ignoreslomo}
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (886.0, 635.0)
			scale = 0.7
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (380.0, 635.0)
			scale = 0.7
			rot = -90}
	endif
endscript

script drum_training_1_6_add_play_each_note_task 
	printf \{qs("\Lstarting drum_training_1_6_add_play_each_note_task")}
	Wait \{3.6
		seconds}
	training_pause_gem_scroller
	if training_are_notes_flipped
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (766.0, 360.0)
			scale = 0.7
			rot = 90}
	else
		training_add_arrow \{id = training_arrow2
			life = 3
			pos = (500.0, 380.0)
			scale = 0.7
			rot = -90}
	endif
	spawnscriptnow \{drum_training_1_6_spawn_delayed_strike_line_arrow
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	LoadTutorialSFX \{mode = Tut_Dru_KickSong}
	training_play_sound \{Sound = 'Tut_Dru_KickSong_01_DRM'
		Wait}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("To play a note, PRESS the KICK PEDAL as it crosses the STRIKE LINE.")}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Dru_KickSong_02_DRM'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
	training_set_task_header_body \{text = qs("Hit 8 notes.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0}
	change \{DRUM_NOTES_HIT = 0}
	change \{DRUM_NOTES_MISSED = 0}
	training_resume_gem_scroller
	drum_training_1_6_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
endscript

script drum_training_1_6_spawn_freeform_highway 
	printf \{qs("\Lstarting drum_training_1_6_spawn_freeform_highway")}
	SetPlayerInfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Drum_Free
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
		{drumfill_hitp1 drum_training_1_6_b_hit_note}
		{missed_notep1 drum_training_1_6_b_missed_note}
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
	Wait \{4.0
		seconds
		ignoreslomo}
	training_pause_gem_scroller
endscript

script drum_training_1_6_b_hit_note 
	printf \{qs("\Lstarting drum_training_1_6_b_hit_note")}
	change DRUM_NOTES_HIT = ($DRUM_NOTES_HIT + 1)
	if (($DRUM_NOTES_HIT = 12) || ($DRUM_NOTES_HIT = 24))
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
		notes_required = 32}
endscript

script drum_training_1_6_b_missed_note 
	printf \{qs("\Lstarting drum_training_1_6_b_missed_note")}
	change DRUM_NOTES_MISSED = ($DRUM_NOTES_MISSED + 1)
	if (($DRUM_NOTES_MISSED = 3) || ($DRUM_NOTES_MISSED = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_AddKick_06_DRM'}
			)
	endif
endscript

script drum_training_1_6_b_wait_for_hit_notes 
	printf \{qs("\Lstarting drum_training_1_6_b_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($DRUM_NOTES_HIT >= 32)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_6_point_out_freeform_section 
	printf \{qs("\Lstarting drum_training_1_6_point_out_freeform_section")}
	spawnscriptnow \{drum_training_1_6_spawn_freeform_highway
		id = training_spawned_script}
	training_show_narrator \{narrator = 'drummer'}
	LoadTutorialSFX \{mode = Tut_Dru_Impro}
	training_play_sound \{Sound = 'Tut_Dru_Impro_01_DRM'
		Wait}
	Wait \{4
		seconds}
	training_add_arrow \{id = training_arrow2
		life = 3
		pos = (500.0, 375.0)
		scale = 0.7
		rot = -90}
	training_play_sound \{Sound = 'Tut_Dru_Impro_02_DRM'
		Wait}
	training_hide_narrator
	training_clear_lesson_body_text
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("During the freeform sections, improvise with any notes you want.")}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Dru_TwoHands_05_DRM'
		Wait}
	training_hide_narrator
	training_destroy_all_arrows
	training_set_task_header_body \{text = qs("Hit any 32 notes.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 32}
	change \{DRUM_NOTES_HIT = 0}
	change \{DRUM_NOTES_MISSED = 0}
	training_resume_gem_scroller
	drum_training_1_6_b_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_KickSong_03_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_6_complete_message 
	printf \{qs("\Lstarting drum_training_1_6_complete_message")}
	drum_training_basic_generic_placeholder_lesson_complete
endscript

script drum_training_1_7_show_lesson_header 
	printf \{qs("\Lstarting drum_training_1_7_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L7")
		text = qs("Interface")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_7_show_highway 
	printf \{qs("\Lstarting drum_training_1_7_show_highway")}
	SetPlayerInfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 0}
	training_start_gem_scroller \{song = Tut_Demo
		part = drum}
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
	training_wait_for_gem_scroller_startup
endscript

script drum_training_1_7_show_rock_meter 
	printf \{qs("\Lstarting drum_training_1_7_show_rock_meter")}
	Wait \{3.6
		second}
	training_pause_gem_scroller
	training_show_narrator \{narrator = 'drummer'}
	LoadTutorialSFX \{mode = Tut_Dru_UI}
	training_play_sound \{Sound = 'Tut_Dru_UI_01_DRM'
		Wait}
	training_hide_narrator
	change \{current_num_players = 1}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (375.0, 500.0)
		scale = 0.7
		rot = 90}
	training_add_lesson_body_text \{number = 1
		text = qs("Yellow = OK Performance")}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_UI_02_DRM'
		Wait}
	training_hide_narrator
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.6
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 2
		text = qs("Green = Good Performance")}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_UI_03_DRM'
		Wait}
	training_hide_narrator
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 0.4
		}
		id = training_spawned_script}
	training_add_lesson_body_text \{number = 3
		text = qs("Red = Bad Performance")}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_UI_04_DRM'
		Wait}
	training_hide_narrator
	training_start_HUD_flashing_red
	training_add_lesson_body_text \{number = 4
		text = qs("Blinking Red = Danger!")}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_UI_05_DRM'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Dru_UI_06_DRM'
		Wait}
	training_hide_narrator
	training_stop_HUD_flashing_red
endscript

script drum_training_1_7_point_out_score 
	printf \{qs("\Lstarting drum_training_1_7_point_out_score")}
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.0
		}
		id = training_spawned_script}
	training_add_arrow \{id = training_arrow2
		life = 2
		pos = (380.0, 580.0)
		scale = 0.7
		rot = 90}
	training_add_lesson_body_text \{number = 5
		text = qs("Play Notes = Score Points")}
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_UI_07_DRM'
		Wait}
	training_hide_narrator
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller
	training_resume_gem_scroller
endscript

script drum_training_1_7_complete_message 
	printf \{qs("\Lstarting drum_training_1_7_complete_message")}
	drum_training_basic_generic_placeholder_lesson_complete
endscript

script drum_training_1_8_show_lesson_header 
	printf \{qs("\Lstarting drum_training_1_8_show_lesson_header")}
	training_set_lesson_header_text \{number = qs("\L8")
		text = qs("Accents")}
	training_show_lesson_header
	create_training_pause_handler
endscript

script drum_training_1_8_show_highway 
	printf \{qs("\Lstarting drum_training_1_8_show_highway")}
	SetPlayerInfo \{1
		four_lane_highway = 0}
	change \{tutorial_disable_hud = 1}
	training_start_gem_scroller \{song = Tut_Drum_Break
		difficulty = medium
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
		{hit_notep1 drum_training_1_8_hit_note params = {<...>}}
		{missed_notep1 drum_training_1_8_missed_note}
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

script drum_training_1_8_hit_note 
	printf \{qs("\Lstarting drum_training_1_8_hit_note")}
	printstruct <...>
	if GotParam \{drum_accent}
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
			notes_required = 4}
	endif
endscript

script drum_training_1_8_missed_note 
	printf \{qs("\Lstarting drum_training_1_8_missed_note")}
	change DRUM_NOTES_MISSED = ($DRUM_NOTES_MISSED + 1)
	if (($DRUM_NOTES_MISSED = 3) || ($DRUM_NOTES_MISSED = 6))
		Random (
			@ training_play_sound \{Sound = 'Tut_Dru_Accents_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Accents_06_DRM'}
			)
	endif
endscript

script drum_training_1_8_wait_for_hit_notes 
	printf \{qs("\Lstarting drum_training_1_8_wait_for_hit_notes")}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($DRUM_NOTES_HIT >= 4)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script drum_training_1_8_show_items_on_highway 
	printf \{qs("\Lstarting drum_training_1_8_show_items_on_highway")}
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
			pos = (545.0, 360.0)
			scale = 0.7}
	endif
	training_show_narrator \{narrator = 'drummer'}
	LoadTutorialSFX \{mode = Tut_Dru_Accents}
	training_play_sound \{Sound = 'Tut_Dru_Accents_01_DRM'
		Wait}
	training_play_sound \{Sound = 'Tut_Dru_Accents_02_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_8_add_play_each_note_task 
	printf \{qs("\Lstarting drum_training_1_8_add_play_each_note_task")}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("To play an accent note, HIT the drum HARDER than normal.")}
	training_show_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_Accents_03_DRM'
		Wait}
	training_hide_narrator
	training_set_task_header_body \{text = qs("Accent 4 notes.")}
	training_show_task_header
	training_display_notes_hit \{notes_hit = 0
		notes_required = 4}
	training_destroy_all_arrows
	change \{DRUM_NOTES_HIT = 0}
	change \{DRUM_NOTES_MISSED = 0}
	training_resume_gem_scroller
	drum_training_1_8_wait_for_hit_notes
	destroy_menu \{menu_id = menu_tutorial}
	create_training_pause_handler
	training_destroy_gem_scroller \{still_in_training = 0}
	training_hide_lesson_header
	training_show_narrator \{narrator = 'drummer'}
	training_play_sound \{Sound = 'Tut_Dru_Accents_04_DRM'
		Wait}
	training_hide_narrator
endscript

script drum_training_1_8_complete_message 
	printf \{qs("\Lstarting drum_training_1_8_complete_message")}
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
			text = qs("Basic Drums Lesson")
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

script drum_training_basic_tutorial_end 
	printf \{qs("\Lstarting drum_training_basic_tutorial_end")}
	training_kill_session
	safe_destroy \{id = training_container}
	safe_destroy \{id = training_arrow}
	safe_destroy \{id = training_strum_arrow}
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
	change \{tutorial_disable_hud = 0}
	SetGlobalTags \{training
		params = {
			drum_basic_lesson = complete
		}}
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript
