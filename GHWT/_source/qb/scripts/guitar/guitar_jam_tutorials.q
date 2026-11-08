jam_tutorial_status = inactive
jam_tutorial_disconnect = 0
g_jam_tutorial = 0

script jam_force_kill_tutorial \{status = section_done}
	if ($jam_tutorial_status = active)
		change \{jam_tutorial_status = skipping}
		KillSpawnedScript \{id = jam_tutorial_spawns}
		jam_tutorial_segment_cleanup
		StopAllSounds
		KeyOffAllSfx
		if ($jam_tutorial_disconnect = 0)
			jam_tutorial_skipping_message
		endif
		change jam_tutorial_status = <status>
	endif
endscript

script jam_tutorial_skipping_message 
	if ScreenElementExists \{id = jam_band_container}
		<parent> = jam_band_container
	elseif ScreenElementExists \{id = jam_studio_element}
		<parent> = jam_studio_element
	else
		return
	endif
	<text> = qs("Skipping...")
	<pos> = (955.0, 465.0)
	CreateScreenElement {
		id = tut_skip_text_container
		type = ContainerElement
		parent = <parent>
		z_priority = 80
	}
	CreateScreenElement {
		id = tut_skip_text_glow
		rgba = [0 0 0 150]
		type = SpriteElement
		parent = tut_skip_text_container
		texture = mixer_glow_64
		pos = <pos>
		dims = (450.0, 90.0)
		just = [center center]
		z_priority = 78
	}
	CreateScreenElement {
		id = tut_skip_text_shadow
		type = TextElement
		parent = tut_skip_text_container
		font = fontgrid_title_a1
		text = <text>
		scale = 1
		pos = (<pos> + (2.0, 2.0))
		just = [center center]
		rgba = [0 0 0 255]
		z_priority = 79
	}
	CreateScreenElement {
		id = tut_skip_text
		type = TextElement
		parent = tut_skip_text_container
		font = fontgrid_title_a1
		text = <text>
		scale = 1
		pos = <pos>
		just = [center center]
		rgba = [200 200 200 255]
		z_priority = 80
	}
	tut_skip_text :SE_SetProps \{alpha = 0}
	tut_skip_text_shadow :SE_SetProps \{alpha = 0}
	tut_skip_text_glow :SE_SetProps \{alpha = 0}
	tut_skip_text :SE_SetProps \{alpha = 1
		time = 0.1}
	tut_skip_text_shadow :SE_SetProps \{alpha = 1
		time = 0.1}
	tut_skip_text_glow :SE_SetProps \{alpha = 1
		time = 0.1}
	tut_skip_text :SE_WaitProps
	Wait \{0.5
		seconds}
	tut_skip_text :SE_SetProps \{alpha = 0
		time = 0.1}
	tut_skip_text_shadow :SE_SetProps \{alpha = 0
		time = 0.1}
	tut_skip_text_glow :SE_SetProps \{alpha = 0
		time = 0.1}
	tut_skip_text :SE_WaitProps
	if ScreenElementExists \{id = tut_skip_text_container}
		DestroyScreenElement \{id = tut_skip_text_container}
	endif
endscript

script jam_play_tutorial_topic 
	create_loading_screen \{jam_mode = 1}
	change \{jam_tutorial_disconnect = 0}
	change \{game_mode = training}
	if IsGuitarController \{controller = $primary_controller}
		SetPlayerInfo \{1
			part = guitar}
	elseif IsDrumController \{controller = $primary_controller}
		SetPlayerInfo \{1
			part = drum}
	elseif isRBDrum \{controller = $primary_controller}
		SetPlayerInfo \{1
			part = drum}
	else
		SetPlayerInfo \{1
			part = guitar}
	endif
	if (<ghmix_tut> = 0)
		if (<index> = 5)
			generic_event_choose \{state = uistate_jam_band_tut_recording
				data = {
					editing = 0
					tutorial = 1
					song = none
				}}
		else
			generic_event_choose \{state = UIstate_jam_band_tut
				data = {
					editing = 0
					tutorial = 1
					song = none
				}}
		endif
		<quit_button> = start
	else
		if (<ghmix_tut> = 1)
			<song_name> = 'StudioExample1'
		elseif (<ghmix_tut> = 2)
			<song_name> = 'StudioExample2'
		endif
		ClearJamSession
		jam_recording_create_editable_arrays
		LoadJam file_name = <song_name>
		change jam_selected_song = <song_name>
		generic_event_choose no_sound state = UIstate_recording data = {editing = 1 back_to_jam_band = 0 current_instrument = 0 player = ($jam_current_recording_player)}
		<quit_button> = select
	endif
	if (<ghmix_tut> > 0)
		ui_event_wait_for_safe
		training_create_and_hide_headers \{type = ghmix}
	else
		training_create_and_hide_headers
	endif
	<tutorial_topic> = ($jam_tutorial_menu_topics [<index>])
	ReloadSfx mode = tutorials tutorial = (<tutorial_topic>.lesson_tag)
	change \{g_in_tutorial = 1}
	change \{g_jam_tutorial = 1}
	destroy_loading_screen
	Wait \{0.5
		seconds}
	jam_camera_wait
	begin
	if ScreenElementExists \{id = jam_band_container}
		break
	endif
	if ScreenElementExists \{id = jam_studio_element}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if (<ghmix_tut> = 0)
		jam_band_container :SetTags \{disable_simple_rec = 1
			role = rhythm
			disable_inst_select = 1
			allow_easy_backout = 0}
		safe_hide \{id = jam_band_highway_playline}
	endif
	GetArraySize (<tutorial_topic>.sections)
	<count> = 0
	<topic_completed> = 0
	<skipped> = 0
	begin
	if ($jam_tutorial_status = inactive)
		spawnscriptnow id = jam_tutorial_spawns (<tutorial_topic>.sections [<count>])
		change \{jam_tutorial_status = active}
	elseif ($jam_tutorial_status = force_exit)
		<topic_completed> = 1
		<force_exit> = 1
	elseif ($jam_tutorial_status = section_done)
		change \{jam_tutorial_status = inactive}
		<count> = (<count> + 1)
		if (<count> >= <array_size>)
			<topic_completed> = 1
		endif
	endif
	if ControllerMake <quit_button> ($primary_controller)
		<skipped> = 1
		jam_force_kill_tutorial
	endif
	if ($jam_tutorial_disconnect = 1)
		printf \{'jam_tutorial_disconnect skip'}
		Wait \{5
			gameframes}
		<skipped> = 1
		jam_force_kill_tutorial
	endif
	if (<topic_completed> = 1)
		stoprendering
		if ScreenElementExists \{id = jam_band_container}
			jam_band_container :SetTags \{disable_simple_rec = 0
				allow_easy_backout = 1}
			training_destroy_narrator_icons
		endif
		jam_tutorial_segment_cleanup
		training_destroy_lesson_and_task_headers
		destroy_jam_band_menu
		KillSpawnedScript \{id = jam_tutorial_spawns}
		SetPlayerInfo \{1
			part = guitar}
		if (<skipped> = 0)
			change \{g_in_tutorial = 0}
			change \{g_jam_tutorial = 0}
			ui_memcard_autosave \{event = menu_back
				state = uistate_jam_tutorials}
			training_check_for_all_tutorials_finished
		else
			change \{g_in_tutorial = 0}
			change \{g_jam_tutorial = 0}
			generic_event_back \{state = uistate_jam_tutorials}
		endif
		change \{jam_tutorial_status = inactive}
		startrendering
		break
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script jam_tutorial_intro 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 3}
	training_create_narrator_icons
	Wait \{1
		second}
	training_show_title \{title = qs("Music Studio Quick Start Guide")}
	Wait \{0.5
		second}
	training_play_sound \{Sound = 'Tut_RS_QuickStart_01_BAS'}
	Wait \{5
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	Wait \{9.25
		seconds}
	training_change_header_type \{type = studio}
	jam_tutorial_show_narrator
	jam_tutorial_instrument_select_menu
	training_play_sound \{Sound = 'Tut_RS_QuickStart_02_BAS'}
	Wait \{1
		second}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	Wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = Bass}
	jam_tutorial_add_arrow \{instrument = Bass
		life = 1}
	Wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	Wait \{1.25
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = melody}
	jam_tutorial_add_arrow \{instrument = melody
		life = 1}
	Wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = Drums}
	jam_tutorial_add_arrow \{instrument = Drums
		life = 1}
	Wait \{2
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	Wait \{0.5
		seconds}
	jam_tutorial_select_role_challenge
	training_wait_for_sound \{Sound = 'Tut_RS_QuickStart_02_BAS'}
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_intro_noise 
	training_change_header_type \{type = standard}
	Wait \{1
		second}
	training_show_title \{title = qs("Making Noise")}
	Wait \{0.5
		second}
	training_play_sound \{Sound = 'Tut_RS_QuickStart_03_BAS'}
	Wait \{5
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("MAKING NOISE")}
	training_add_lesson_body_text \{number = 1
		text = qs("Play notes with your instrument by using it normally.")}
	training_add_lesson_body_text \{number = 2
		text = qs("Listen to the differences in the sounds each action creates.")}
	training_set_task_header_body \{text = qs("Make 15 Sounds")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	jam_tutorial_make_noise_challenge \{notes_required = 15}
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_intro_recording 
	Wait \{1
		second}
	training_show_title \{title = qs("Recording a Jam")}
	Wait \{0.5
		second}
	training_play_sound \{Sound = 'Tut_RS_QuickStart_05_BAS'}
	Wait \{5
		seconds}
	training_destroy_title
	Wait \{1
		seconds}
	training_change_header_type \{type = standard}
	training_show_narrator \{narrator = 'bassist'}
	jam_tutorial_record_jam_challenge
	Wait \{1
		second}
	training_show_title \{title = qs("Playing it Back")}
	Wait \{0.5
		second}
	training_play_sound \{Sound = 'Tut_RS_QuickStart_07_BAS'}
	Wait \{5
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	Wait \{1
		seconds}
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("REWINDING SONG")}
	jam_tutorial_rewind_challenge \{next = playback}
	Wait \{1
		gameframe}
	training_set_lesson_header_text \{number = qs("\L5")
		text = qs("SONG PLAYBACK")}
	jam_tutorial_playback_challenge
	training_wait_for_sound \{Sound = 'Tut_RS_Record_22_BAS'}
	training_play_sound \{Sound = 'Tut_RS_QuickStart_08_BAS'}
	Wait \{5
		seconds}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{training
			params = {
				rs_introduction_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_select_role_challenge 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	if IsGuitarController \{controller = $primary_controller}
		training_set_lesson_header_text \{number = qs("\L1")
			text = qs("CHOOSING A ROLE")}
		training_add_lesson_body_text \{number = 1
			text = qs("The guitar controller can be used for any of these roles.")}
		training_add_lesson_body_text \{number = 2
			text = qs("Select a role to try for the rest of this tutorial.")}
		training_set_task_header_body \{text = qs("Choose a Role")}
		ps2_training_set_task_header_body_props \{color = [
				255
				168
				40
				255
			]
			scale = (1.1, 1.1)}
		training_show_narrator \{narrator = 'bassist'}
		Wait \{0.15
			seconds}
		training_show_lesson_header
		training_show_task_header
		jam_tutorial_instrument_select_menu \{selectable}
		Block \{type = jam_tutorial_instrument_selected}
		jam_band_container :SetTags \{disable_inst_select = 1}
		switch (<event_data>.select_instrument)
			case 0
			<role> = rhythm
			case 1
			<role> = lead
			case 2
			<role> = Bass
			case 3
			<role> = Drums
			case 4
			<role> = melody
		endswitch
		jam_tutorial_role_selected role = <role>
	elseif IsDrumController \{controller = $primary_controller}
		jam_band_container :SetTags \{role = Drums}
	else
		ScriptAssert \{'Guitar or Drum controller is required to complete the tutorials!'}
	endif
endscript

script jam_tutorial_role_selected 
	jam_band_container :SetTags {role = <role>}
	jam_tutorial_destroy_instrument_UI
	training_wait_for_sound \{Sound = 'Tut_RS_QuickStart_02_BAS'}
	training_hide_lesson_header
	training_hide_narrator
	jam_tutorial_lesson_complete
endscript

script jam_tutorial_make_noise_challenge \{notes_required = 15}
	if ((IsDrumController controller = $primary_controller))
		jam_band_container :SetTags \{role = Drums}
	else
		jam_band_container :GetSingleTag \{role}
	endif
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_QuickStart_03_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Melody_03_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<num_sounds> = 0
	training_display_notes_hit notes_hit = <num_sounds> notes_required = <notes_required>
	begin
	Block \{anytypes = [
			jam_tutorial_lead_strum
			jam_tutorial_bass_strum
			jam_tutorial_rhythm_strum
			jam_tutorial_drum_hit
			jam_tutorial_melody_hit
		]}
	<num_sounds> = (<num_sounds> + 1)
	training_display_notes_hit notes_hit = <num_sounds> notes_required = <notes_required>
	if (<num_sounds> = <notes_required>)
		Wait \{1
			seconds}
		break
	endif
	Wait \{1
		gameframes}
	repeat
	training_play_sound \{Sound = 'Tut_RS_QuickStart_04_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_QuickStart_04_BAS'}
	training_hide_lesson_header
	training_hide_narrator
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_record_jam_challenge 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("RECORD A JAM")}
	jam_tutorial_recording_challenge \{notes_required = 20
		time_limit = 25}
	training_play_sound \{Sound = 'Tut_RS_QuickStart_06_BAS'}
	training_hide_lesson_header
	training_hide_narrator
	jam_tutorial_destroy_instrument_UI
	jam_tutorial_lesson_complete
endscript

script jam_tutorial_lead 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 3}
	training_create_narrator_icons
	Wait \{1
		second}
	training_show_title \{title = qs("Lead and Bass Guitar")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_LeadBass_01_BAS'}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{instrument = lead}
	Wait \{1
		second}
	jam_tutorial_add_arrow \{instrument = lead}
	Wait \{2
		seconds}
	Wait \{1
		second}
	jam_tutorial_inst_menu_indicate \{instrument = Bass}
	training_play_sound \{Sound = 'Tut_RS_LeadBass_02_BAS'}
	Wait \{0.25
		second}
	jam_tutorial_add_arrow \{instrument = Bass}
	Wait \{9.75
		seconds}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_LeadBass_03_BAS'}
	Wait \{2
		seconds}
	jam_tutorial_display_instrument_icons \{icons = [
			lead
			Bass
			rhythm
		]}
	Wait \{3.5
		seconds}
	training_wait_for_sound \{Sound = 'Tut_RS_LeadBass_03_BAS'}
	jam_tutorial_destroy_instrument_icons
	training_hide_narrator
	jam_destroy_select_instrument_menu \{player = 1}
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_open_strum 
	Wait \{1
		second}
	training_show_title \{title = qs("Open Strumming")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_OpenStrum_01_BAS'}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	Wait \{1.5
		second}
	jam_tutorial_instrument_select_menu \{instrument = rhythm}
	Wait \{1.5
		second}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	Wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	Wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = Bass}
	jam_tutorial_add_arrow \{instrument = Bass
		life = 1}
	Wait \{2.5
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_show_narrator \{narrator = 'bassist'}
	Wait \{1
		second}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = lead}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("OPEN STRUMMING")}
	jam_tutorial_anim \{Anim = open_strum}
	training_play_sound \{Sound = 'Tut_RS_OpenStrum_02_BAS'}
	Wait \{2
		seconds}
	jam_tutorial_add_arrow \{pos = (900.0, 325.0)
		life = 2
		scale = 0.5}
	Wait \{1
		seconds}
	jam_tutorial_add_arrow \{pos = (600.0, 325.0)
		life = 2
		scale = 0.5}
	jam_tutorial_open_strum_challenge
	training_play_sound \{Sound = 'Tut_RS_OpenStrum_03_BAS'}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_open_strum_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs("DO NOT hold any Fret Buttons down.")}
	training_add_lesson_body_text \{number = 2
		text = qs("PRESS the Strum Bar on the guitar.")}
	training_set_task_header_body \{text = qs("Open Strum 5 Times")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	<strums_required> = 5
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_OpenStrum_02_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<num_open_strums> = 0
	<warned> = 0
	training_display_notes_hit notes_hit = <num_open_strums> notes_required = <strums_required>
	begin
	Block \{type = jam_tutorial_lead_strum}
	if (<event_data>.hold_pattern = 1048576)
		<num_open_strums> = (<num_open_strums> + 1)
		training_display_notes_hit notes_hit = <num_open_strums> notes_required = <strums_required>
		if (<num_open_strums> = <strums_required>)
			Wait \{1
				second}
			jam_tutorial_destroy_anim
			break
		endif
	elseif (<warned> = 0)
		training_play_sound \{Sound = 'Tut_Gtr_OpenNotes_11_BAS'}
		<warned> = 1
	endif
	Wait \{1
		gameframes}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_open_strum_anim 
	jam_tutorial_create_ghost_player
	begin
	Wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	Wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	Wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	Wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	repeat
endscript

script jam_tutorial_play_scale 
	Wait \{1
		second}
	training_show_title \{title = qs("Exploring the Scale")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Scale_01_BAS'}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = lead}
	Wait \{12
		seconds}
	training_play_sound \{Sound = 'Tut_RS_Scale_02_BAS'}
	jam_tutorial_anim \{Anim = play_scale_single}
	Wait \{2
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_show_narrator \{narrator = 'bassist'}
	Wait \{1
		second}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = Bass}
	Wait \{7
		second}
	jam_tutorial_anim \{Anim = play_scale}
	training_play_sound \{Sound = 'Tut_RS_Scale_03_BAS'}
	Wait \{2
		second}
	jam_tutorial_add_arrow \{pos = (430.0, 330.0)
		life = 3
		scale = 0.5
		rot = 90}
	Wait \{3
		second}
	jam_tutorial_add_arrow \{pos = (420.0, 325.0)
		life = 3
		scale = 0.5
		rot = 0}
	training_wait_for_sound \{Sound = 'Tut_RS_Scale_03_BAS'}
	Wait \{0.5
		second}
	training_play_sound \{Sound = 'Tut_RS_Scale_04_BAS'}
	Wait \{2
		second}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("EXPLORE THE SCALE")}
	jam_tutorial_play_scale_challenge
	training_play_sound \{Sound = 'Tut_RS_Scale_05_BAS'}
	Wait \{2
		second}
	training_hide_narrator
	jam_tutorial_destroy_anim
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_play_scale_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs("HOLD different or no Fret Buttons to select a note.")}
	training_add_lesson_body_text \{number = 2
		text = qs("PRESS the Strum Bar on the guitar to play the note.")}
	training_add_lesson_body_text \{number = 3
		text = qs("Play all 6 notes in the scale, including the root note.")}
	training_set_task_header_body \{text = qs("Strum the 6 Notes")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_Scale_04_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	jam_tutorial_show_scale
	<array> = [
		1048576
		1
		16
		256
		4096
		65536
	]
	GetArraySize <array>
	<notes_required> = (<array_size>)
	training_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	begin
	Block \{type = jam_tutorial_bass_strum}
	GetArraySize <array>
	<i> = 0
	begin
	if (<array> [<i>] = <event_data>.hold_pattern)
		RemoveArrayElement array = <array> index = (<i>)
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	GetArraySize <array>
	num_notes = (<notes_required> - <array_size>)
	training_display_notes_hit notes_hit = <num_notes> notes_required = <notes_required>
	if (<array_size> = 0)
		Wait \{1
			second}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_play_scale_anim \{Anim = null}
	jam_tutorial_create_ghost_player
	jam_tutorial_create_ghost_G_R_Y_GR_GRY
	<i> = 0
	if (<Anim> = single)
		frets = [
			jam_tut_fret_hand_bG
			jam_tut_fret_hand_bR
			jam_tut_fret_hand_bY
		]
	else
		frets = [
			jam_tut_fret_hand_bG
			jam_tut_fret_hand_bGR
			jam_tut_fret_hand_bGRY
		]
	endif
	begin
	Wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	safe_hide id = (<frets> [<i>])
	safe_show \{id = jam_tut_fret_hand_bott_none}
	Wait \{0.25
		seconds}
	jam_tutorial_advance_index array = <frets> i = <i>
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	safe_hide id = (<frets> [<i>])
	safe_show \{id = jam_tut_fret_hand_bott_none}
	jam_tutorial_advance_index array = <frets> i = <i>
	repeat
endscript

script jam_tutorial_tilt 
	Wait \{1
		second}
	training_show_title \{title = qs("Shifting an Octave")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Octave_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = lead}
	training_wait_for_sound \{Sound = 'Tut_RS_Octave_01_BAS'}
	Wait \{0.5
		seconds}
	training_play_sound \{Sound = 'Tut_RS_Octave_02_BAS'}
	Wait \{0.75
		seconds}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	Wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = Bass}
	jam_tutorial_add_arrow \{instrument = Bass
		life = 1}
	Wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = melody}
	jam_tutorial_add_arrow \{instrument = melody
		life = 1}
	training_wait_for_sound \{Sound = 'Tut_RS_Octave_02_BAS'}
	jam_destroy_select_instrument_menu \{player = 1}
	Wait \{1
		second}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_narrator
	jam_tutorial_show_instrument_UI \{instrument = lead}
	jam_tutorial_anim \{Anim = tilt}
	training_play_sound \{Sound = 'Tut_RS_Octave_03_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Octave_03_BAS'}
	jam_tutorial_add_arrow \{pos = (250.0, 300.0)
		life = 5
		scale = 0.5}
	training_play_sound \{Sound = 'Tut_RS_Octave_04_BAS'}
	Wait \{5
		seconds}
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("TILT TO CHANGE OCTAVE")}
	jam_tutorial_destroy_anim
	jam_tutorial_tilt_challenge
	training_play_sound \{Sound = 'Tut_RS_Octave_05_BAS'}
	Wait \{4
		seconds}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{training
			params = {
				rs_lead_and_bass_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_tilt_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs("Hold your guitar LEVEL and the nub will point down, TILT it UP and the nub will point up.")}
	training_add_lesson_body_text \{number = 2
		text = qs("PRESS the Strum Bar on the guitar to play notes.")}
	training_set_task_header_body \{text = qs("Play 6 notes, 3 low and 3 high")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_Octave_04_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<notes_required> = 3
	<high_notes_hit> = 0
	<low_notes_hit> = 0
	<final_instructions_shown> = 0
	training_display_notes_hit notes_hit = (<high_notes_hit> + <low_notes_hit>) notes_required = (<notes_required> * 2)
	begin
	Block \{type = jam_tutorial_lead_strum}
	if (<event_data>.tilt = 1)
		if (<high_notes_hit> < <notes_required>)
			<high_notes_hit> = (<high_notes_hit> + 1)
		endif
	else
		if (<low_notes_hit> < <notes_required>)
			<low_notes_hit> = (<low_notes_hit> + 1)
		endif
	endif
	training_display_notes_hit notes_hit = (<high_notes_hit> + <low_notes_hit>) notes_required = (<notes_required> * 2)
	if ((<high_notes_hit> >= <notes_required>) && (<low_notes_hit> >= <notes_required>))
		training_display_notes_hit notes_hit = <notes_required> notes_required = <notes_required>
		Wait \{1
			second}
		break
	endif
	if ((<high_notes_hit> = <notes_required>) && (<final_instructions_shown> = 0))
		<final_instructions_shown> = 1
		training_add_lesson_body_text \{number = 3
			text = qs("Make sure the white nub is pointed DOWN, and play the final low notes.")}
	elseif ((<low_notes_hit> = <notes_required>) && (<final_instructions_shown> = 0))
		<final_instructions_shown> = 1
		training_add_lesson_body_text \{number = 3
			text = qs("Make sure the white nub is pointed UP, and play the final high notes.")}
	endif
	Wait \{1
		gameframe}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_tilt_anim 
	jam_tutorial_create_tiltable_guitar
	<tilt_angle> = 50
	<tilt_state> = 0
	begin
	if (<tilt_state> = 0)
		<tilt_state> = 1
		jam_tut_ghost_container :SE_SetProps rot_angle = <tilt_angle> time = 0.75
		jam_tut_ghost_container :SE_WaitProps
	else
		<tilt_state> = 0
		jam_tut_ghost_container :SE_SetProps \{rot_angle = 0
			time = 0.75}
		jam_tut_ghost_container :SE_WaitProps
	endif
	Wait \{2
		seconds}
	repeat
endscript

script jam_tutorial_rhythm 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 2}
	training_create_narrator_icons
	Wait \{1
		second}
	training_show_title \{title = qs("The Rhythm Guitar")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Rhythm_01_BAS'}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = rhythm}
	jam_tutorial_add_arrow \{instrument = rhythm}
	Wait \{5
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_hide_narrator
	Wait \{1
		second}
	training_show_title \{title = qs("Power Chords")}
	training_play_sound \{Sound = 'Tut_RS_Rhythm_02_BAS'}
	Wait \{1
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	jam_tutorial_anim \{Anim = chord_2}
	Wait \{9
		seconds}
	training_play_sound \{Sound = 'Tut_RS_Rhythm_03_BAS'}
	Wait \{2
		seconds}
	training_show_narrator \{narrator = 'bassist'}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = rhythm}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("POWER CHORDS")}
	jam_tutorial_chord_challenge \{chords_required = 5
		chord_buttons = 2}
	training_hide_narrator
	jam_tutorial_destroy_anim
	jam_tutorial_lesson_complete
	Wait \{1
		second}
	training_show_title \{title = qs("Clean Chords")}
	Wait \{1
		seconds}
	training_play_sound \{Sound = 'Tut_RS_Rhythm_04_BAS'}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	jam_tutorial_anim \{Anim = chord_3}
	Wait \{1
		seconds}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = rhythm}
	training_show_narrator \{narrator = 'bassist'}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("CLEAN CHORDS")}
	jam_tutorial_chord_challenge \{chords_required = 4
		chord_buttons = 3}
	training_hide_narrator
	jam_tutorial_destroy_anim
	training_play_sound \{Sound = 'Tut_RS_Rhythm_05_BAS'}
	Wait \{0.5
		seconds}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_chord_challenge \{chords_required = 0}
	if (<chord_buttons> = 2)
		<array> = [
			17
			272
			4352
			69632
			257
			4112
			65792
		]
		<chord_text> = qs("Power Chord")
		<plural_chords_text> = qs("Power Chords")
	elseif (<chord_buttons> = 3)
		<array> = [
			273
			4368
			69888
			4113
			4353
			65808
			69648
		]
		<chord_text> = qs("Clean Chord")
		<plural_chords_text> = qs("Clean Chords")
	elseif (<chord_buttons> = 5)
		<array> = [
			17
			272
			4352
			69632
			257
			4112
			65792
			273
			4368
			69888
			4113
			4353
			65808
			69648
		]
		<chord_text> = qs("Chord")
		<plural_chords_text> = qs("Chords")
		<chord_buttons> = qs("2 or 3")
	endif
	FormatText TextName = lesson_body_1 qs("HOLD %n Fret Buttons.") n = <chord_buttons>
	FormatText TextName = lesson_body_3 qs("Change the %n buttons held to play a different %c.") n = <chord_buttons> c = <chord_text>
	FormatText TextName = lesson_body_4 qs("Wide split Fret Button presses will play a 'Special Effect' instead of a %c.") c = <chord_text>
	FormatText TextName = task_header qs("Play %r unique %c") r = <chords_required> c = <plural_chords_text>
	training_add_lesson_body_text number = 1 text = <lesson_body_1>
	training_add_lesson_body_text \{number = 2
		text = qs("PRESS the Strum Bar on the guitar to play the chord.")}
	training_add_lesson_body_text number = 3 text = <lesson_body_3>
	training_add_lesson_body_text number = 4 text = <lesson_body_4>
	training_set_task_header_body text = <task_header>
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_Rhythm_03_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Rhythm_04_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Effects_06_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<chords_hit> = 0
	training_display_notes_hit notes_hit = <chords_hit> notes_required = <chords_required>
	begin
	Block \{type = jam_tutorial_rhythm_strum}
	GetArraySize <array>
	<i> = 0
	begin
	if (<array> [<i>] = <event_data>.hold_pattern)
		RemoveArrayElement array = <array> index = (<i>)
		<chords_hit> = (<chords_hit> + 1)
		training_display_notes_hit notes_hit = <chords_hit> notes_required = <chords_required>
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if (<chords_hit> = <chords_required>)
		Wait \{1
			second}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_chord_anim 
	jam_tutorial_create_ghost_player
	<tut_ui_props> = {parent = jam_tut_anim_container type = SpriteElement just = [center center] rgba = [255 255 255 255] scale = (0.3, 0.3)}
	if (<num> = 2)
		DestroyScreenElement \{id = jam_tut_fret_hand_bott}
		CreateScreenElement {
			<tut_ui_props>
			id = jam_tut_fret_hand_bott
			texture = tutorial_hand_button_gr
			dims = (154.0, 77.0)
			pos = (580.0, 385.0)
			z_priority = 5
		}
	elseif (<num> = 3)
		DestroyScreenElement \{id = jam_tut_fret_hand_bott}
		CreateScreenElement {
			<tut_ui_props>
			id = jam_tut_fret_hand_bott
			texture = tutorial_hand_button_gry
			dims = (154.0, 77.0)
			pos = (580.0, 385.0)
			z_priority = 5
		}
	endif
	safe_hide \{id = jam_tut_fret_hand_bott}
	begin
	Wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show \{id = jam_tut_fret_hand_bott}
	jam_tut_fret_hand_bott :SE_SetProps \{pos = (580.0, 385.0)}
	jam_tut_fret_hand_bott_none :SE_SetProps \{pos = (580.0, 385.0)}
	jam_tut_fret_hand_top :SE_SetProps \{pos = (610.0, 330.0)}
	Wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	safe_hide \{id = jam_tut_fret_hand_bott}
	safe_show \{id = jam_tut_fret_hand_bott_none}
	jam_tut_fret_hand_bott :SE_SetProps \{pos = (590.0, 385.0)}
	jam_tut_fret_hand_bott_none :SE_SetProps \{pos = (590.0, 385.0)}
	jam_tut_fret_hand_top :SE_SetProps \{pos = (620.0, 330.0)}
	Wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show \{id = jam_tut_fret_hand_bott}
	jam_tut_fret_hand_bott :SE_SetProps \{pos = (600.0, 385.0)}
	jam_tut_fret_hand_bott_none :SE_SetProps \{pos = (600.0, 385.0)}
	jam_tut_fret_hand_top :SE_SetProps \{pos = (630.0, 330.0)}
	Wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	safe_hide \{id = jam_tut_fret_hand_bott}
	safe_show \{id = jam_tut_fret_hand_bott_none}
	jam_tut_fret_hand_bott :SE_SetProps \{pos = (590.0, 385.0)}
	jam_tut_fret_hand_bott_none :SE_SetProps \{pos = (590.0, 385.0)}
	jam_tut_fret_hand_top :SE_SetProps \{pos = (620.0, 330.0)}
	repeat
endscript

script jam_tutorial_effects 
	training_change_header_type \{type = studio}
	Wait \{1
		second}
	training_show_title \{title = qs("The Effects Module")}
	Wait \{1
		second}
	<effects> = []
	<effect> = ($jam_current_instrument_effects [0])
	<effects> = (<effects> + <effect>)
	training_play_sound \{Sound = 'Tut_RS_Effects_01_BAS'}
	Wait \{1
		seconds}
	training_destroy_title
	jam_tutorial_show_narrator
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = rhythm}
	Wait \{0.5
		seconds}
	jam_tutorial_add_arrow \{instrument = rhythm
		time = 1}
	Wait \{0.5
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		time = 1}
	Wait \{0.5
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = Bass}
	jam_tutorial_add_arrow \{instrument = Bass
		time = 1}
	Wait \{0.5
		seconds}
	training_play_sound \{Sound = 'Tut_RS_Effects_02_BAS'}
	Wait \{1
		second}
	jam_destroy_select_instrument_menu \{player = 1}
	Wait \{11
		second}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = rhythm}
	training_play_sound \{Sound = 'Tut_RS_Effects_03_BAS'}
	Wait \{2
		second}
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("SELECTING EFFECTS")}
	jam_tutorial_change_effect_challenge effects = <effects>
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Effects_04_BAS'
		Wait}
	Wait \{1
		second}
	jam_tutorial_add_arrow \{pos = (450.0, 490.0)
		life = 6
		scale = 0.5
		rot = 90}
	training_play_sound \{Sound = 'Tut_RS_Effects_05_BAS'
		Wait}
	Wait \{1
		second}
	training_hide_narrator
	training_change_header_type \{type = standard}
	jam_tutorial_show_narrator
	training_play_sound \{Sound = 'Tut_RS_Effects_07_BAS'}
	Wait \{2
		second}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{training
			params = {
				rs_rhythm_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_change_effect_challenge 
	jam_tutorial_effects_show_menu \{time = 2}
	begin
	Block \{type = jam_tutorial_changed_effect}
	if NOT ArrayContains array = <effects> contains = (<event_data>.effect)
		<effects> = (<effects> + (<event_data>.effect))
		break
	else
		training_play_sound \{Sound = 'Tut_RS_StepRec_04_BAS'}
		jam_tutorial_effects_show_menu \{time = 2}
	endif
	repeat
	training_hide_lesson_header
	return effects = <effects>
endscript

script jam_tutorial_effects_show_menu \{time = 2}
	jam_band_pause \{select_player = 1
		player_cont = inst_player_cont_1
		event_cont = inst_cont_1
		forced_pause}
	LaunchEvent \{type = unfocus
		target = vmenu_options_1}
	Wait <time> seconds
	jam_band_pause_effects {
		player_cont = inst_player_cont_1
		player_pause = jam_band_pause_1
		scrolling_options = scrolling_options_1
		event_cont = inst_cont_1
		select_player = 1
		text_id = option_text_0_1
		option = 0
		vmenu_id = vmenu_options_1
		respawn_input = 1
		device_num = 0
		controller = ($primary_controller)
		device_num = ($primary_controller)
	}
endscript

script jam_tutorial_drums 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 2}
	training_create_narrator_icons
	Wait \{1
		second}
	training_show_title \{title = qs("Basic Drumming")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Drums_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = Drums}
	jam_tutorial_add_arrow \{instrument = Drums}
	Wait \{3
		seconds}
	training_play_sound \{Sound = 'Tut_RS_Drums_02_BAS'}
	Wait \{6
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_show_narrator \{narrator = 'bassist'}
	Wait \{5
		seconds}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = Drums
		drum_kit = 2}
	Wait \{1
		seconds}
	training_play_sound \{Sound = 'Tut_RS_Drums_03_BAS'}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("IMPROVISED DRUM SOLO")}
	jam_tutorial_drum_solo_challenge
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_drum_solo_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs("Use the sticks to hit the pads of the drum set.")}
	training_add_lesson_body_text \{number = 2
		text = qs("Try the different pads and listen to their sounds.")}
	training_add_lesson_body_text \{number = 3
		text = qs("Keep the beat going smoothly.")}
	training_set_task_header_body \{text = qs("Play 25 Beats")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_Drums_03_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<num_beats> = 0
	<num_beats_required> = 25
	<max_time_between_beats> = 2
	begin
	training_display_notes_hit notes_hit = <num_beats> notes_required = <num_beats_required>
	Block \{type = jam_tutorial_drum_hit}
	if (<event_data>.hold_pattern = timed_out)
		training_play_sound \{Sound = 'Tut_Vs_BattleTilt_04_BAS'}
		<num_beats> = 0
	else
		KillSpawnedScript \{name = jam_tutorial_drum_solo_expire}
		spawnscriptnow jam_tutorial_drum_solo_expire params = {time = <max_time_between_beats>}
		<num_beats> = (<num_beats> + 1)
		<num_beats_left> = (<num_beats_required> - <num_beats>)
		if (<num_beats_left> = 0)
			training_display_notes_hit notes_hit = <num_beats> notes_required = <num_beats_required>
			training_play_sound \{Sound = 'Tut_RS_Drums_04_BAS'}
			Wait \{1
				second}
			break
		endif
	endif
	Wait \{1
		gameframes}
	repeat
	training_hide_narrator
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_drum_solo_expire \{time = 2}
	Wait <time> seconds
	BroadcastEvent \{type = jam_tutorial_drum_hit
		data = {
			hold_pattern = timed_out
		}}
endscript

script jam_tutorial_drum_kits 
	Wait \{1
		second}
	training_show_title \{title = qs("Drum Kits")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Drums_05_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = Drums}
	Wait \{3
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_show_narrator \{narrator = 'bassist'}
	Wait \{0.5
		second}
	<drum_kits> = []
	<drum_kits> = (<drum_kits> + ($jam_current_drum_kit))
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = Drums
		drum_kit = 4}
	<drum_kits> = (<drum_kits> + ($jam_current_drum_kit))
	training_play_sound \{Sound = 'Tut_RS_Drums_06_BAS'}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("TESTING THE KIT")}
	jam_tutorial_drum_tune_challenge drum_kits = <drum_kits>
	jam_tutorial_lesson_complete
	training_play_sound \{Sound = 'Tut_RS_Drums_08_BAS'}
	Wait \{3
		seconds}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = Drums}
	training_change_header_type \{type = studio}
	training_show_narrator \{narrator = 'bassist'}
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("CHANGING YOUR KIT")}
	jam_tutorial_drum_kit_challenge drum_kits = <drum_kits>
	jam_tutorial_lesson_complete
	training_change_header_type \{type = standard}
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Drums_10_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = Drums}
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("TRYING THE NEW KIT")}
	jam_tutorial_drum_tune_challenge drum_kits = <drum_kits>
	jam_tutorial_lesson_complete
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Drums_12_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = Drums}
	training_set_lesson_header_text \{number = qs("\L5")
		text = qs("ACTIVATING THE PERCUSSION KIT")}
	jam_tutorial_drum_percussion_challenge
	training_wait_for_sound \{Sound = 'Tut_RS_Drums_12_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Drums_13_BAS'}
	training_set_lesson_header_text \{number = qs("\L6")
		text = qs("TRYING THE PERCUSSION KIT")}
	jam_tutorial_drum_tune_challenge drum_kits = <drum_kits> req_percussion = 1
	training_play_sound \{Sound = 'Tut_RS_Drums_14_BAS'}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{training
			params = {
				rs_drums_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_drum_percussion_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs("PRESS Star Power \ma to activate the Percussion Kit.")}
	training_set_task_header_body \{text = qs("Activate the Percussion Kit")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_Drums_12_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	Block \{type = jam_tutorial_percussion}
	training_display_notes_hit \{notes_hit = 1
		notes_required = 1}
	training_hide_lesson_header
endscript

script jam_tutorial_drum_tune_challenge \{req_percussion = 0}
	if IsDrumController \{controller = $primary_controller}
		training_add_lesson_body_text \{number = 1
			text = qs("Use the sticks to hit the pads of the drum set.")}
		training_add_lesson_body_text \{number = 2
			text = qs("Try all of the different pads.")}
		training_add_lesson_body_text \{number = 3
			text = qs("Don't forget the Kick Pedal.")}
	else
		training_add_lesson_body_text \{number = 1
			text = qs("PRESS the Fret Buttons to play each drum.")}
		training_add_lesson_body_text \{number = 2
			text = qs("Listen to the sounds of the drums.")}
		training_add_lesson_body_text \{number = 3
			text = qs("Don't forget the Strum Bar plays the Kick Drum.")}
	endif
	if isRBDrum \{controller = $primary_controller}
		training_set_task_header_body \{text = qs("Try all 5 Drums")}
		<array> = [
			1048576
			65536
			4096
			256
			1
		]
	else
		training_set_task_header_body \{text = qs("Try all 6 Drums")}
		<array> = [
			1048576
			1
			16
			256
			4096
			65536
		]
	endif
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_Drums_06_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Drums_10_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Drums_13_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	jam_tutorial_show_drumpads
	GetArraySize <array>
	<notes_required> = (<array_size>)
	training_display_notes_hit notes_hit = (<notes_required> - <array_size>) notes_required = <notes_required>
	begin
	Block \{type = jam_tutorial_drum_hit}
	if (<req_percussion> <= $is_percussion_kit)
		GetArraySize <array>
		<i> = 0
		begin
		if (<array> [<i>] = <event_data>.hold_pattern)
			RemoveArrayElement array = <array> index = (<i>)
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		GetArraySize <array>
		training_display_notes_hit notes_hit = (<notes_required> - <array_size>) notes_required = <notes_required>
		if (<array_size> = 0)
			Random (
				@ training_play_sound \{Sound = 'Tut_RS_Drums_07_BAS'
					Wait}
				@ training_play_sound \{Sound = 'Tut_RS_Drums_11_BAS'
					Wait}
				)
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	training_hide_narrator
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_drum_kit_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs("PRESS Up and Down to highlight a Drum Kit.")}
	training_add_lesson_body_text \{number = 2
		text = $wii_jam_tutorial_drum_kit_press_select}
	training_set_task_header_body \{text = qs("Pick a Drum Kit")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_show_task_header
	begin
	jam_tutorial_drum_kit_show_menu \{time = 1}
	Block \{type = jam_change_drum_kit}
	if NOT ArrayContains array = <drum_kits> contains = (<event_data>.new_kit)
		<drum_kits> = (<drum_kits> + ($jam_current_drum_kit))
		training_display_notes_hit \{notes_hit = 1
			notes_required = 1}
		break
	else
		training_play_sound \{Sound = 'Tut_RS_Drums_15_BAS'
			Wait}
	endif
	repeat
	training_play_sound \{Sound = 'Tut_RS_Drums_09_BAS'
		Wait}
	Wait \{1
		second}
	training_hide_narrator
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
	return drum_kits = <drum_kits>
endscript

script jam_tutorial_drum_kit_show_menu \{time = 5}
	jam_band_pause \{select_player = 1
		player_cont = inst_player_cont_1
		event_cont = inst_cont_1
		forced_pause}
	LaunchEvent \{type = unfocus
		target = vmenu_options_1}
	Wait <time> seconds
	ResolveScreenElementId \{id = {
			drum_select_element_1
			child = {
				scroll_menu
				child = menu
			}
		}}
	jam_band_pause_submenu {
		submenu_name = 'drum_kit'
		submenu_title = qs("drum kit")
		player_cont = inst_player_cont_1
		player_pause = jam_band_pause_1
		scrolling_options = scrolling_options_1
		event_cont = <resolved_id>
		select_player = 1
		text_id = option_text_3_1
		option = 3
		vmenu_id = vmenu_options_1
		options_array = ($pause_drum_kit_options)
		selectable_choices
		current_submenu_choice = ($jam_current_drum_kit)
	}
	menu_jam_band_add_control_helpers \{state = pause_submenu}
endscript

script jam_tutorial_show_drumpads 
endscript

script jam_tutorial_melody 
	training_create_narrator_icons
	Wait \{1
		second}
	training_show_title \{title = qs("Melody on the Keyboard")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Melody_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	training_change_header_type \{type = studio}
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_Melody_01_BAS'}
	training_play_sound \{Sound = 'Tut_RS_Melody_02_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = melody}
	Wait \{0.25
		seconds}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("CHOOSE A MELODY")}
	jam_tutorial_melody_select_challenge
	training_change_header_type \{type = standard}
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Melody_03_BAS'}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("PLAY THE KEYBOARD")}
	jam_tutorial_melody_challenge
	training_play_sound \{Sound = 'Tut_RS_Melody_04_BAS'}
	Wait \{3.5
		seconds}
	training_hide_narrator
	jam_tutorial_lesson_complete
	SetGlobalTags \{training
		params = {
			rs_melody_lesson = complete
		}}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_melody_select_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs("PRESS Up and Down to highlight the Keyboard Type you desire.")}
	training_add_lesson_body_text \{number = 2
		text = $wii_training_keyboard}
	training_set_task_header_body \{text = qs("Select a Keyboard Type")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_Melody_02_BAS'}
	training_show_task_header
	jam_tutorial_melody_type_show_menu \{time = 1}
	Block \{type = jam_tutorial_changed_melody_kit}
	training_hide_narrator
	training_hide_lesson_header
endscript

script jam_tutorial_melody_type_show_menu \{time = 2}
	jam_band_pause \{select_player = 1
		player_cont = inst_player_cont_1
		event_cont = inst_cont_1
		forced_pause}
	LaunchEvent \{type = unfocus
		target = vmenu_options_1}
	Wait <time> seconds
	jam_band_pause_melody_kit {
		player_cont = inst_player_cont_1
		player_pause = jam_band_pause_1
		scrolling_options = scrolling_options_1
		event_cont = inst_cont_1
		select_player = 1
		text_id = option_text_0_1
		option = 0
		vmenu_id = vmenu_options_1
		respawn_input = 1
		device_num = 0
		controller = ($primary_controller)
		device_num = ($primary_controller)
	}
	menu_jam_band_add_control_helpers \{state = pause_submenu}
endscript

script jam_tutorial_melody_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs("PRESS a Fret Button OR Strum to play a note.")}
	training_add_lesson_body_text \{number = 2
		text = qs("You DO NOT have to Strum for every note when playing your keyboard.")}
	training_set_task_header_body \{text = qs("Play 10 Notes on the Keyboard")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	jam_tutorial_make_noise_challenge \{notes_required = 10}
endscript

script jam_tutorial_recording 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 2}
	training_create_narrator_icons
	Wait \{1
		second}
	training_show_title \{title = qs("Studio Recording")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Record_01_BAS'}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	Wait \{1
		second}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = lead}
	jam_tutorial_add_arrow \{pos = (338.0, 520.0)
		life = 3
		scale = 0.75
		rot = 0}
	training_play_sound \{Sound = 'Tut_RS_Record_02_BAS'}
	jam_tutorial_recording_anim
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("RECORDING NOTES")}
	jam_tutorial_recording_challenge \{notes_required = 15
		time_limit = 25}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_rewind
	jam_tutorial_playback
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_record_multi
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_recording_anim 
endscript

script jam_tutorial_recording_challenge 
	FormatText TextName = task_header qs("Record %r Notes") r = <notes_required>
	training_add_lesson_body_text \{number = 1
		text = $wii_jam_begin_recording}
	training_add_lesson_body_text \{number = 2
		text = qs("Play notes with your instrument by using it normally.")}
	training_set_task_header_body text = <task_header>
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_Record_02_BAS'}
	training_show_task_header
	training_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	jam_band_container :SetTags \{simplerec_controls = [
			record
			Play
		]}
	jam_band_container :SetTags \{disable_simple_rec = 0
		end_time = 0}
	Block \{type = jam_tutorial_record_start}
	jam_band_container :SetTags \{disable_simple_rec = 1}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	<rec_limit> = (<time_limit> * 1000)
	jam_band_container :GetTags
	switch <role>
		case rhythm
		<track> = 0
		case lead
		<track> = 1
		case Bass
		<track> = 2
		case Drums
		<track> = 3
		case melody
		<track> = 4
	endswitch
	<gem_array> = ($jam_tracks [<track>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	<close> = 0
	begin
	notetrack_size_after = ($<appended_id>)
	if (<close> = 0)
		if ($jam_highway_play_time >= (<rec_limit> - 2000))
			<close> = 1
		endif
		if (((<notetrack_size_after> - <notetrack_size>) / 2) >= (<notes_required> -9))
			training_play_sound \{Sound = 'Tut_RS_Record_18_BAS'}
			<close> = 1
		endif
	endif
	<notes_recorded> = ((<notetrack_size_after> - <notetrack_size>) / 2)
	training_display_notes_hit notes_hit = <notes_recorded> notes_required = <notes_required>
	if (<notes_recorded> >= <notes_required>)
		training_wait_for_sound \{Sound = 'Tut_RS_Record_18_BAS'}
		training_play_sound \{Sound = 'Tut_RS_AdvGtr_10_BAS'
			Wait}
		break
	endif
	if ($jam_highway_play_time >= <rec_limit>)
		GetPlayerInfo \{1
			jam_instrument}
		jam_delete_range track = <jam_instrument> low_bound = 0 high_bound = ($jam_highway_song_length)
		change \{jam_highway_play_time = 0}
		change \{jam_band_playline_pos = (0.0, 0.0)}
		SetScreenElementProps id = jam_band_highway_playline pos = ($jam_band_playline_pos)
		guitar_jam_simplerecops_command_stoprec \{select_player = 1}
		guitar_jam_simplerecops_command_stopplay \{select_player = 1}
		jam_band_container :SetTags \{disable_simple_rec = 1}
		jam_band_container :SetTags \{instrument_controls = [
			]}
		training_play_sound \{Sound = 'Tut_RS_Record_17_BAS'
			Wait}
		<close> = 0
		jam_band_container :SetTags \{disable_simple_rec = 0}
		Block \{type = jam_tutorial_record_start}
		jam_band_container :SetTags \{disable_simple_rec = 1}
		jam_band_container :SetTags \{instrument_controls = [
				enabled
			]}
	endif
	Wait \{1
		gameframe}
	repeat
	jam_band_container :SetTags \{disable_simple_rec = 0}
	training_add_lesson_body_text \{number = 3
		text = $wii_jam_stop_recording}
	jam_band_container :SetTags \{simplerec_controls = [
			Play
		]}
	Block \{type = jam_tutorial_record_end}
	jam_band_container :SetTags \{disable_simple_rec = 1}
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_rewind 
	training_show_narrator \{narrator = 'bassist'}
	jam_band_container :SetTags \{disable_simple_rec = 1}
	training_play_sound \{Sound = 'Tut_RS_Record_04_BAS'
		Wait}
	training_play_sound \{Sound = 'Tut_RS_Record_05_BAS'}
	jam_tutorial_rewind_anim
	jam_tutorial_add_arrow \{pos = (250.0, 610.0)
		life = 4
		scale = 0.75
		rot = 90}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("REWINDING SONG")}
	jam_tutorial_rewind_challenge \{next = playback}
endscript

script jam_tutorial_rewind_anim 
endscript

script jam_tutorial_rewind_challenge 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI
	training_add_lesson_body_text \{number = 1
		text = $wii_jam_navigate_back}
	training_set_task_header_body \{text = qs("Rewind to the Start")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_QuickStart_07_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Record_05_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Record_11_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Record_13_BAS'}
	training_show_task_header
	<end_time> = ($jam_highway_play_time)
	jam_band_container :SetTags {end_time = <end_time>}
	<wrong> = 0
	<close> = 0
	jam_band_container :SetTags \{simplerec_controls = [
			skip_back
		]}
	begin
	jam_band_container :SetTags \{disable_simple_rec = 0}
	if ($jam_highway_play_time <= 0)
		training_display_notes_hit \{notes_hit = 1
			notes_required = 1}
		jam_band_container :SetTags \{disable_simple_rec = 1}
		break
	endif
	GetScreenElementProps \{id = jam_band_highway_playline}
	if NOT jam_tutorial_is_rewind_vo_playing
		if (($jam_highway_play_time > (<end_time> + 1500)) && (<wrong> = 0))
			training_play_sound \{Sound = 'Tut_RS_Record_19_BAS'}
			<wrong> = 1
		elseif (($jam_highway_play_time < (<end_time> -1500)) && (<wrong> = 1))
			training_play_sound \{Sound = 'Tut_RS_Record_20_BAS'}
			<wrong> = 0
		elseif (($jam_highway_play_time <= (<end_time> / 2)) && (<close> = 0))
			training_play_sound \{Sound = 'Tut_RS_Record_21_BAS'}
			<close> = 1
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	training_wait_for_sound \{Sound = 'Tut_RS_Record_19_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Record_20_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Record_21_BAS'}
	if (<next> = playback)
		training_play_sound \{Sound = 'Tut_RS_Record_14_BAS'}
	elseif (<next> = record)
		training_play_sound \{Sound = 'Tut_RS_Record_12_BAS'}
	endif
	Wait \{1
		second}
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_is_rewind_vo_playing 
	if training_is_sound_playing \{Sound = 'Tut_RS_Record_19_BAS'}
		return \{true}
	elseif training_is_sound_playing \{Sound = 'Tut_RS_Record_20_BAS'}
		return \{true}
	elseif training_is_sound_playing \{Sound = 'Tut_RS_Record_21_BAS'}
		return \{true}
	else
		return \{false}
	endif
endscript

script jam_tutorial_playback 
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_Record_14_BAS'}
	training_play_sound \{Sound = 'Tut_RS_Record_07_BAS'
		Wait}
	training_play_sound \{Sound = 'Tut_RS_Record_08_BAS'}
	jam_tutorial_playback_anim
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("SONG PLAYBACK")}
	jam_tutorial_playback_challenge
	training_wait_for_sound \{Sound = 'Tut_RS_Record_22_BAS'}
	training_play_sound \{Sound = 'Tut_RS_Record_09_BAS'}
	Wait \{4
		second}
endscript

script jam_tutorial_playback_anim 
endscript

script jam_tutorial_playback_challenge 
	jam_tutorial_show_instrument_UI
	training_add_lesson_body_text \{number = 1
		text = $wii_jam_playback}
	training_set_task_header_body \{text = qs("Play back the recorded track.")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_Record_14_BAS'}
	training_wait_for_sound \{Sound = 'Tut_RS_Record_08_BAS'}
	training_show_task_header
	jam_band_container :SetTags \{simplerec_controls = [
			Play
		]}
	jam_band_container :SetTags \{disable_simple_rec = 0}
	Block \{type = jam_tutorial_play_start}
	jam_band_container :SetTags \{disable_simple_rec = 1}
	jam_band_container :GetTags
	begin
	if ($jam_highway_play_time >= <end_time>)
		jam_band_container :SetTags \{disable_simple_rec = 0}
		training_add_lesson_body_text \{number = 2
			text = $wii_jam_stop_playback}
		training_play_sound \{Sound = 'Tut_RS_Record_22_BAS'}
		training_display_notes_hit \{notes_hit = 1
			notes_required = 1}
		Block \{type = jam_tutorial_play_stop}
		jam_band_container :SetTags \{disable_simple_rec = 1}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_record_multi 
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Record_10_BAS'
		Wait}
	training_play_sound \{Sound = 'Tut_RS_Record_11_BAS'}
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("REWINDING YOUR SONG")}
	jam_tutorial_rewind_challenge \{next = record}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = rhythm}
	training_set_lesson_header_text \{number = qs("\L5")
		text = qs("RECORDING A SECOND INSTRUMENT")}
	jam_tutorial_recording_challenge \{notes_required = 10
		time_limit = 25}
	jam_tutorial_lesson_complete
	jam_tutorial_show_instrument_UI \{instrument = rhythm}
	training_play_sound \{Sound = 'Tut_RS_Record_13_BAS'}
	Wait \{3
		seconds}
	training_set_lesson_header_text \{number = qs("\L6")
		text = qs("REWIND THE SONG")}
	jam_tutorial_rewind_challenge \{next = playback}
	jam_tutorial_show_instrument_UI \{instrument = rhythm}
	training_set_lesson_header_text \{number = qs("\L7")
		text = qs("PLAYING IT ALL BACK")}
	jam_tutorial_playback_challenge
	training_wait_for_sound \{Sound = 'Tut_RS_Record_22_BAS'}
	training_play_sound \{Sound = 'Tut_RS_Record_15_BAS'
		Wait}
	Wait \{0.5
		seconds}
	training_play_sound \{Sound = 'Tut_RS_Record_16_BAS'
		Wait}
	training_hide_narrator
endscript

script jam_tutorial_ghtunes 
	Wait \{1
		second}
	training_show_title \{title = $wii_downloading_gh_tunes}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_GHTunes_01_BAS'}
	Wait \{2
		seconds}
	training_destroy_title
	safe_hide \{id = jam_menu_backdrop}
	safe_hide \{id = jam_band_highway_master}
	safe_hide \{id = jam_band_black_banner}
	CreateScreenElement \{parent = root_window
		id = ghtunes_element
		type = DescInterface
		desc = 'gh_tunes_share'
		rot_angle = 0
		loading_alpha = 0
		leaderboard_select_alpha = 1
		watermark_alpha = 0}
	ghtunes_element :SE_SetProps info_text = ($ghtunes_leaderboard [0].info_text)
	Wait \{1
		seconds}
	jam_tutorial_add_arrow \{z = 1000
		pos = (821.0, 489.0)
		life = 2
		scale = 0.5
		rot = 90}
	Wait \{2
		seconds}
	jam_tutorial_add_arrow \{z = 1000
		pos = (735.0, 304.0)
		life = 2
		scale = 0.5
		rot = 90}
	Wait \{2
		seconds}
	jam_tutorial_add_arrow \{z = 1000
		pos = (789.0, 349.0)
		life = 2
		scale = 0.5
		rot = 90}
	training_wait_for_sound \{Sound = 'Tut_RS_GHTunes_01_BAS'}
	Wait \{1
		seconds}
	training_play_sound \{Sound = 'Tut_RS_GHTunes_02_BAS'}
	Wait \{4
		seconds}
	jam_tutorial_add_arrow \{z = 1000
		pos = (656.0, 579.0)
		life = 2
		scale = 0.5
		rot = 90}
	training_wait_for_sound \{Sound = 'Tut_RS_GHTunes_02_BAS'}
	if ScreenElementExists \{id = ghtunes_element}
		DestroyScreenElement \{id = ghtunes_element}
	endif
	safe_show \{id = jam_menu_backdrop}
	safe_show \{id = jam_band_highway_master}
	safe_show \{id = jam_band_black_banner}
	Wait \{1
		second}
	training_show_title \{title = qs("Uploading GH Tunes")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_GHTunes_03_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_GHTunes_03_BAS'}
	Wait \{1
		second}
	training_hide_narrator
	training_hide_lesson_header
	safe_hide \{id = jam_menu_backdrop}
	safe_hide \{id = jam_band_highway_master}
	safe_hide \{id = jam_band_black_banner}
	LoadJam \{file_name = qs("\LStudioExample1")}
	change \{jam_selected_song = qs("\LStudioExample1")}
	create_jam_song_select_popup
	LaunchEvent \{type = unfocus
		target = pu_warning_vmenu}
	training_play_sound \{Sound = 'Tut_RS_GHTunes_04_BAS'}
	Wait \{5
		seconds}
	jam_tutorial_add_arrow \{z = 1000
		pos = (850.0, 543.0)
		life = 2
		scale = 0.5
		rot = 90}
	Wait \{2
		seconds}
	destroy_popup_warning_menu
	Wait \{0.5
		seconds}
	create_faked_jam_publish_song_menu
	LaunchEvent \{type = unfocus
		target = current_menu}
	jam_tutorial_add_arrow \{pos = (481.0, 226.0)
		life = 2
		scale = 0.5
		rot = 90}
	Wait \{3
		seconds}
	jam_tutorial_add_arrow \{pos = (481.0, 273.0)
		life = 2
		scale = 0.5
		rot = 90}
	jam_tutorial_add_arrow \{pos = (481.0, 307.0)
		life = 2
		scale = 0.5
		rot = 90}
	Wait \{4
		seconds}
	jam_tutorial_add_arrow \{pos = (380.0, 436.0)
		life = 2
		scale = 0.5
		rot = 90}
	Wait \{2
		seconds}
	jam_tutorial_add_arrow \{pos = (481.0, 577.0)
		life = 2
		scale = 0.5
		rot = 90}
	training_wait_for_sound \{Sound = 'Tut_RS_GHTunes_04_BAS'}
	training_hide_narrator
	destroy_generic_menu
	if ScreenElementExists \{id = jam_publish_song_container}
		DestroyScreenElement \{id = jam_publish_song_container}
	endif
	safe_show \{id = jam_menu_backdrop}
	safe_show \{id = jam_band_highway_master}
	safe_show \{id = jam_band_black_banner}
	jam_tutorial_lesson_complete
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{training
			params = {
				rs_recording_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script create_faked_jam_publish_song_menu 
	printf \{qs("\Lstarting create_faked_jam_publish_song_menu")}
	if ScreenElementExists \{id = jam_publish_song_container}
		DestroyScreenElement \{id = jam_publish_song_container}
	endif
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = jam_publish_song_container}
	back_drop_color = [50 50 50 255]
	rot = 0
	header_x = 320
	header_y = 80
	header_foreground_color = <back_drop_color>
	header_background_color = [255 255 255 255]
	make_generic_menu \{title = qs("Publish Song")
		vmenu_id = create_publish_song_menu}
	add_generic_menu_text_item \{text = qs("\LStudioExample1")
		choose_state = UIstate_jam_publish_text_entry
		choose_state_data = {
			choose_script = jam_name_choose_script
			text = qs("\LStudioExample1")
			choose_params = {
				filename = qs("\LStudioExample1")
			}
		}}
	new_genre = -1
	FormatText \{TextName = genre
		qs("Genre:        %s")
		s = qs("No Genre")}
	add_generic_menu_text_item {
		text = <genre>
		choose_state = UIstate_jam_publish_genre
		choose_state_data = {choose_script = jam_genre_choose_script}
	}
	FormatText \{TextName = guitar_playback_text
		qs("Guitar Track:     NONE")}
	FormatText \{TextName = bass_playback_text
		qs("Bass Track:     NONE")}
	add_generic_menu_text_item {
		text = <guitar_playback_text>
		choose_state = UIstate_jam_publish_track_select
		choose_state_data = {choose_script = jam_track_select_choose_script guitar_num = 1 playback_track1 = <playback_track1> playback_track2 = <playback_track2>}
	}
	add_generic_menu_text_item {
		text = <bass_playback_text>
		choose_state = UIstate_jam_publish_track_select
		choose_state_data = {choose_script = jam_track_select_choose_script guitar_num = 2 playback_track1 = <playback_track1> playback_track2 = <playback_track2>}
	}
	add_generic_menu_icon_item {
		icon = icon_jam_preview
		text = qs("Preview Song")
		pad_choose_script = jam_preview_song_choose_script
		pad_choose_params = {filename = <newfilename>}
	}
	add_generic_menu_icon_item \{icon = icon_graphics
		text = qs("Album Art")
		pad_choose_script = jam_album_art_choose_script}
	add_generic_menu_icon_item {
		icon = icon_save
		text = qs("Save and Quit")
		pad_choose_script = jam_save_and_quit_choose_script
		pad_choose_params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	}
	add_generic_menu_icon_item {
		icon = icon_jam_upload
		text = qs("Upload to GHTunes")
		pad_choose_script = jam_upload_song_choose_script
		pad_choose_params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	}
	add_generic_menu_icon_item {
		icon = icon_jam_upload
		text = qs("Manage GHTunes")
		pad_choose_script = jam_delete_song_choose_script
		pad_choose_params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	}
	jam_publish_draw_album_cover
	LaunchEvent \{type = focus
		target = current_menu}
	if ($jam_signin_upload = 1)
		change \{jam_signin_upload = 0}
		spawnscriptnow jam_upload_song_choose_script params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	endif
	startrendering
endscript

script jam_tutorial_sustains 
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 3}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	training_create_narrator_icons
	Wait \{1
		second}
	training_show_title \{title = qs("Playing Sustained Notes")}
	Wait \{1.5
		second}
	training_destroy_title
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{instrument = rhythm}
	Wait \{0.75
		seconds}
	training_play_sound \{Sound = 'Tut_RS_AdvGtr_01_BAS'}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	Wait \{0.5
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	Wait \{0.5
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = Bass}
	jam_tutorial_add_arrow \{instrument = Bass
		life = 1}
	training_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_01_BAS'}
	Wait \{1
		second}
	training_show_narrator \{narrator = 'bassist'}
	jam_destroy_select_instrument_menu \{player = 1}
	training_play_sound \{Sound = 'Tut_RS_AdvGtr_02_BAS'}
	jam_tutorial_anim \{Anim = sustains}
	Wait \{3
		seconds}
	jam_tutorial_show_instrument_UI \{instrument = Bass}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("PLAY SUSTAINED NOTES")}
	jam_tutorial_sustains_challenge
	training_hide_narrator
	jam_tutorial_destroy_anim
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_sustains_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs("HOLD any Fret Button down.")}
	training_add_lesson_body_text \{number = 2
		text = qs("PRESS the Strum Bar on the guitar to play the note.")}
	training_add_lesson_body_text \{number = 3
		text = qs("Continue to HOLD the Fret Button for at least 2 seconds.")}
	training_set_task_header_body \{text = qs("Play 5 Sustain Notes")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_02_BAS'}
	training_show_task_header
	<num_sustains> = 0
	<num_sustains_required> = 5
	<min_length_sustain> = 2
	<current_sustain> = null
	training_display_notes_hit notes_hit = <num_sustains> notes_required = <num_sustains_required>
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	begin
	Block \{type = jam_tutorial_sustain}
	if ((<event_data>.sustain = completed) && (<current_sustain> = started))
		<current_sustain> = completed
		<num_sustains> = (<num_sustains> + 1)
		<num_sustains_left> = (<num_sustains_required> - <num_sustains>)
		training_display_notes_hit notes_hit = <num_sustains> notes_required = <num_sustains_required>
		if (<num_sustains_left> = 0)
			training_play_sound \{Sound = 'Tut_RS_AdvGtr_03_BAS'}
			Wait \{1
				second}
			break
		endif
	else
		if (<event_data>.sustain = 1)
			spawnscriptnow jam_tutorial_sustain_timer params = {time = <min_length_sustain>}
			<current_sustain> = started
		else
			if (<current_sustain> = started)
				jam_tutorial_destroy_instrument_UI
				KillSpawnedScript \{name = jam_tutorial_sustain_timer}
				training_play_sound \{Sound = 'Tut_RS_AdvGtr_13_BAS'
					Wait}
				jam_tutorial_show_instrument_UI \{instrument = Bass}
			endif
		endif
	endif
	Wait \{1
		gameframes}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_sustain_timer 
	Wait <time> seconds
	BroadcastEvent \{type = jam_tutorial_sustain
		data = {
			sustain = completed
		}}
endscript

script jam_tutorial_sustains_anim 
	jam_tutorial_create_ghost_player
	jam_tutorial_create_ghost_G_R_Y_GR_GRY
	frets = [
		jam_tut_fret_hand_bG
		jam_tut_fret_hand_bR
		jam_tut_fret_hand_bY
	]
	<i> = 0
	begin
	Wait \{0.25
		seconds}
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_dn}
	safe_hide \{id = jam_tut_hand_dn}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	Wait \{3
		seconds}
	safe_hide id = (<frets> [<i>])
	safe_show \{id = jam_tut_fret_hand_bott_none}
	Wait \{0.25
		seconds}
	jam_tutorial_advance_index array = <frets> i = <i>
	safe_hide \{id = jam_tut_strum}
	safe_hide \{id = jam_tut_hand}
	safe_show \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_fret_hand_bott_none}
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		seconds}
	safe_hide \{id = jam_tut_strum_up}
	safe_hide \{id = jam_tut_hand_up}
	safe_show \{id = jam_tut_strum}
	safe_show \{id = jam_tut_hand}
	Wait \{3
		seconds}
	safe_hide id = (<frets> [<i>])
	safe_show \{id = jam_tut_fret_hand_bott_none}
	jam_tutorial_advance_index array = <frets> i = <i>
	repeat
endscript

script jam_tutorial_hos 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	Wait \{1
		second}
	training_show_title \{title = qs("Hammer-ons and Pull-offs")}
	Wait \{2
		second}
	training_destroy_title
	training_play_sound \{Sound = 'Tut_RS_AdvGtr_04_BAS'}
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = lead}
	Wait \{0.25
		seconds}
	jam_tutorial_add_arrow \{instrument = lead
		time = 1}
	Wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = Bass}
	jam_tutorial_add_arrow \{instrument = Bass
		life = 1}
	training_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_04_BAS'}
	jam_destroy_select_instrument_menu \{player = 1}
	training_play_sound \{Sound = 'Tut_RS_AdvGtr_05_BAS'}
	jam_tutorial_anim \{Anim = hopo}
	jam_tutorial_show_instrument_UI \{instrument = lead}
	training_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_05_BAS'}
	training_play_sound \{Sound = 'Tut_RS_AdvGtr_06_BAS'}
	jam_tutorial_show_narrator
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("EXECUTE HAMMER-ON AND PULL-OFF RUNS")}
	jam_tutorial_hopo_challenge
	jam_tutorial_destroy_anim
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_hopo_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs("HOLD any Fret Button down.")}
	training_add_lesson_body_text \{number = 2
		text = qs("PRESS the Strum Bar on the guitar ONCE to play a note.")}
	training_add_lesson_body_text \{number = 3
		text = qs("Hammer on and Pull off at least 4 more notes in sequence by pressing or releasing different Fret Buttons.")}
	training_set_task_header_body \{text = qs("Play 3 Runs")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_06_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	<num_hopo> = 0
	<num_hopo_runs> = 0
	<num_hopo_runs_required> = 3
	<min_length_hopo_run> = 4
	<max_length_between_notes> = 2
	<num_hopo_runs_left> = (<num_hopo_runs_required>)
	<hopo_run> = incomplete
	training_display_notes_hit notes_hit = <num_hopo_runs> notes_required = <num_hopo_runs_required>
	begin
	Block \{type = jam_tutorial_lead_strum}
	switch (<event_data>.note_type)
		case timed_out
		if NOT (<hopo_run> = completed)
			<num_hopo> = 0
			<warning> = Random (@ 1 @ 2 @ 3 @ 4 @ 5 )
			if (<warning> = 1)
				jam_tutorial_destroy_instrument_UI
				training_play_sound \{Sound = 'Tut_RS_AdvGtr_15_BAS'
					Wait}
				jam_tutorial_show_instrument_UI \{instrument = lead}
			endif
		endif
		case 0
		case 3
		KillSpawnedScript \{name = jam_tutorial_hopo_timer}
		if (<num_hopo> > 0)
			<num_hopo> = 0
			if (<hopo_run> = incomplete)
				<warning> = Random (@ 1 @ 2 @ 3 @ 4 @ 5 )
				if (<warning> = 1)
					jam_tutorial_destroy_instrument_UI
					training_play_sound \{Sound = 'Tut_RS_AdvGtr_14_BAS'
						Wait}
					jam_tutorial_show_instrument_UI \{instrument = lead}
				endif
			endif
		endif
		case 1
		case 2
		KillSpawnedScript \{name = jam_tutorial_hopo_timer}
		<num_hopo> = (<num_hopo> + 1)
		<num_hopo_left> = (<min_length_hopo_run> - <num_hopo>)
		if (<num_hopo_left> = 0)
			<num_hopo_runs> = (<num_hopo_runs> + 1)
			<num_hopo_runs_left> = (<num_hopo_runs_required> - <num_hopo_runs>)
			<hopo_run> = completed
			training_display_notes_hit notes_hit = <num_hopo_runs> notes_required = <num_hopo_runs_required>
			if (<num_hopo_runs_left> = 0)
				training_play_sound \{Sound = 'Tut_RS_AdvGtr_07_BAS'}
				Wait \{1
					second}
				break
			endif
		else
			spawnscriptnow jam_tutorial_hopo_timer params = {time = <max_length_between_notes>}
			<hopo_run> = incomplete
		endif
	endswitch
	Wait \{1
		gameframes}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_hopo_timer \{time = 2}
	Wait <time> seconds
	BroadcastEvent \{type = jam_tutorial_lead_strum
		data = {
			note_type = timed_out
		}}
endscript

script jam_tutorial_hopo_anim 
	jam_tutorial_create_ghost_player
	jam_tutorial_create_ghost_G_R_Y_GR_GRY
	frets = [
		jam_tut_fret_hand_bott_none
		jam_tut_fret_hand_bG
		jam_tut_fret_hand_bGR
		jam_tut_fret_hand_bGRY
		jam_tut_fret_hand_bGR
		jam_tut_fret_hand_bG
	]
	<i> = 0
	<strum_position> = neutral
	begin
	if NOT (<strum_position> = down)
		jam_tutorial_anim_strum \{position = down}
		<strum_position> = down
	else
		jam_tutorial_anim_strum \{position = up}
		<strum_position> = up
	endif
	safe_hide id = (<frets> [<i>])
	jam_tutorial_advance_index array = <frets> i = <i>
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		seconds}
	jam_tutorial_anim_strum \{position = neutral}
	<strum_position> = neutral
	begin
	safe_hide id = (<frets> [<i>])
	jam_tutorial_advance_index array = <frets> i = <i>
	safe_show id = (<frets> [<i>])
	Wait \{0.5
		seconds}
	if (<frets> [<i>] = jam_tut_fret_hand_bott_none)
		break
	endif
	repeat
	repeat
endscript

script jam_tutorial_pms 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	Wait \{1
		second}
	training_show_title \{title = qs("Palm Muting Notes")}
	Wait \{2
		second}
	training_destroy_title
	training_play_sound \{Sound = 'Tut_RS_AdvGtr_08_BAS'}
	jam_tutorial_show_narrator \{offset}
	jam_tutorial_instrument_select_menu \{player = 1
		instrument = rhythm}
	Wait \{1
		second}
	jam_tutorial_add_arrow \{instrument = rhythm
		life = 1}
	Wait \{0.75
		seconds}
	jam_tutorial_inst_menu_indicate \{instrument = lead}
	jam_tutorial_add_arrow \{instrument = lead
		life = 1}
	Wait \{3
		seconds}
	jam_destroy_select_instrument_menu \{player = 1}
	training_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_08_BAS'}
	Wait \{0.5
		seconds}
	training_play_sound \{Sound = 'Tut_RS_AdvGtr_09_BAS'}
	jam_tutorial_anim \{Anim = pm}
	Wait \{5
		seconds}
	jam_tutorial_show_narrator
	jam_tutorial_show_instrument_UI \{instrument = rhythm}
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("PALM MUTE NOTES")}
	jam_tutorial_pm_challenge \{challenge = pm_notes}
	training_hide_narrator
	jam_tutorial_lesson_complete
	Wait \{1
		second}
	jam_tutorial_show_narrator
	training_play_sound \{Sound = 'Tut_RS_AdvGtr_11_BAS'}
	jam_tutorial_show_instrument_UI \{instrument = rhythm}
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("PALM MUTE CHORDS")}
	jam_tutorial_pm_challenge \{challenge = pm_chords}
	training_play_sound \{Sound = 'Tut_RS_AdvGtr_12_BAS'
		Wait}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{training
			params = {
				rs_pro_guitar_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_pm_challenge \{challenge = null}
	<num_pm> = 0
	<num_pm_required> = 5
	if (<challenge> = pm_notes)
		<array> = [
			1048576
			1
			16
			256
			4096
			65536
		]
		<task_header> = qs("Palm Mute 5 notes")
		<instructions_2> = qs("HOLD a single Fret Button down.")
		<instructions_3> = qs("PRESS the Strum Bar to play a muted note.")
	elseif (<challenge> = pm_chords)
		<array> = [
			17
			272
			4352
			69632
			257
			4112
			65792
			273
			4368
			69888
			4113
			4353
			65808
			69648
		]
		<task_header> = qs("Palm Mute 5 chords")
		<instructions_2> = qs("HOLD 2 or 3 Fret Buttons down. Wide split Fret Button combinations will produce a 'sound effect', not a chord.")
		<instructions_3> = qs("PRESS the Strum Bar to play a muted chord.")
	else
		return
	endif
	training_add_lesson_body_text \{number = 1
		text = qs("HOLD down Star Power \ma.")}
	training_add_lesson_body_text number = 2 text = <instructions_2>
	training_add_lesson_body_text number = 3 text = <instructions_3>
	training_set_task_header_body text = <task_header>
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_AdvGtr_09_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	training_display_notes_hit notes_hit = <num_pm> notes_required = <num_pm_required>
	begin
	Block \{type = jam_tutorial_rhythm_strum}
	if ((<event_data>.chord_type) = 3)
		if ArrayContains array = <array> contains = (<event_data>.hold_pattern)
			<num_pm> = (<num_pm> + 1)
			<num_pm_left> = (<num_pm_required> - <num_pm>)
			training_display_notes_hit notes_hit = <num_pm> notes_required = <num_pm_required>
			if (<num_pm_left> = 0)
				training_play_sound \{Sound = 'Tut_RS_AdvGtr_10_BAS'
					Wait}
				Wait \{1
					second}
				break
			endif
		endif
	endif
	Wait \{1
		gameframes}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_pm_anim 
endscript

script jam_tutorial_arpeggiator 
	training_create_narrator_icons
	jam_band_container :SetTags \{challenges_complete = 0
		challenges_req = 2}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	Wait \{1
		second}
	training_show_title \{title = qs("The Arpeggiator")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Arpeg_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_Arpeg_01_BAS'}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Arpeg_02_BAS'}
	training_change_header_type \{type = studio}
	training_show_narrator \{narrator = 'bassist'}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("USING THE KEY MACHINE")}
	jam_tutorial_arpeggiator_challenge
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Arpeg_03_BAS'
		Wait}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_band_container :SetTags {challenges_complete = <challenges_complete>}
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_arpeggiator_challenge 
	training_add_lesson_body_text \{number = 1
		text = qs("HOLD different fret combinations for repeating patterns.")}
	training_add_lesson_body_text \{number = 2
		text = qs("You can use the Slider to adjust the pattern.")}
	training_set_task_header_body \{text = qs("Hold 5 patterns for 10 notes each")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_Arpeg_02_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	jam_tutorial_show_instrument_UI \{instrument = melody
		machine = 1}
	<req_patterns> = 5
	<req_notes> = 10
	<patterns_completed> = []
	<notes_completed> = 0
	<current_pattern> = 16777216
	<current_type> = 9
	<final_instruction_added> = 0
	training_display_notes_hit notes_hit = 0 notes_required = <req_patterns>
	begin
	Block \{type = jam_tutorial_melody_hit}
	if NOT ArrayContains array = <patterns_completed> contains = ($jam_tut_arpeggiator_pattern)
		if (<current_pattern> = $jam_tut_arpeggiator_pattern)
			if (<final_instruction_added> = 1)
				<new_type> = ($jam_current_arpeggiator_type [4])
				if (<new_type> = 2)
					<notes_completed> = 0
				else
					if (<new_type> = <current_type>)
						<notes_completed> = (<notes_completed> + 1)
					else
						<notes_completed> = 1
						<current_type> = <new_type>
					endif
				endif
			else
				<notes_completed> = (<notes_completed> + 1)
			endif
		else
			<notes_completed> = 1
			<current_pattern> = $jam_tut_arpeggiator_pattern
		endif
		if (<notes_completed> = <req_notes>)
			<notes_completed> = 0
			<patterns_completed> = (<patterns_completed> + $jam_tut_arpeggiator_pattern)
			GetArraySize <patterns_completed>
			training_display_notes_hit notes_hit = <array_size> notes_required = <req_patterns>
			if (<array_size> = <req_patterns>)
				training_play_sound \{Sound = 'Tut_RS_Drums_04_BAS'}
				Wait \{1
					second}
				break
			endif
		endif
	endif
	GetArraySize <patterns_completed>
	if ((<array_size> = (<req_patterns> -1)) && (<final_instruction_added> = 0))
		<final_instruction_added> = 1
		training_add_lesson_body_text \{number = 3
			text = qs("For the last pattern, use the whammy to try a different type.")}
	endif
	Wait \{1
		gameframe}
	repeat
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_drum_machine 
	Wait \{1
		second}
	training_show_title \{title = qs("The Drum Machine")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_DrumMach_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_DrumMach_01_BAS'}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_DrumMach_02_BAS'}
	training_change_header_type \{type = studio}
	training_show_narrator \{narrator = 'bassist'}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("USING THE DRUM MACHINE")}
	jam_tutorial_drum_machine_challenge
	Wait \{1
		second}
	jam_tutorial_drum_machine_percussion_challenge
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_DrumMach_03_BAS'
		Wait}
	training_hide_narrator
	jam_tutorial_lesson_complete
	jam_band_container :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{training
			params = {
				rs_advanced_tools_lesson = complete
			}}
	endif
	change \{jam_tutorial_status = section_done}
endscript

script jam_tutorial_drum_machine_challenge 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = Drums
		machine = 1
		drum_kit = 7}
	training_add_lesson_body_text \{number = 1
		text = qs("HOLD a Fret button down.")}
	training_add_lesson_body_text \{number = 2
		text = qs("Switch your held Fret Button combination to change the loop while staying on beat.")}
	training_add_lesson_body_text \{number = 3
		text = qs("You can use the Slider, Whammy Bar, and Strum Bar to further adjust the pattern and sound of the loop.")}
	training_set_task_header_body \{text = qs("Play 3 Loops for 20 notes each")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_lesson_header
	training_wait_for_sound \{Sound = 'Tut_RS_DrumMach_02_BAS'}
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	training_show_task_header
	jam_tutorial_drum_machine_loop_task
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_drum_machine_percussion_challenge 
	jam_band_container :SetTags \{instrument_controls = [
		]}
	jam_tutorial_show_instrument_UI \{instrument = Drums
		machine = 1}
	training_add_lesson_body_text \{number = 1
		text = qs("PRESS Star Power \ma to switch on the Percussion Kit.")}
	training_show_lesson_header
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	Block \{type = jam_tutorial_percussion}
	jam_band_container :SetTags \{instrument_controls = [
		]}
	training_add_lesson_body_text \{number = 2
		text = qs("HOLD a Fret button down.")}
	training_add_lesson_body_text \{number = 3
		text = qs("Switch your held Fret Button combination to change the loop while staying on beat.")}
	training_set_task_header_body \{text = qs("Play 3 Loops for 20 notes each")}
	ps2_training_set_task_header_body_props \{color = [
			255
			168
			40
			255
		]
		scale = (1.1, 1.1)}
	training_show_task_header
	jam_band_container :SetTags \{instrument_controls = [
			enabled
		]}
	jam_tutorial_drum_machine_loop_task \{req_percussion = 1}
	training_hide_lesson_header
	jam_tutorial_destroy_instrument_UI
endscript

script jam_tutorial_drum_machine_loop_task \{req_patterns = 3
		req_notes = 20
		req_percussion = 0}
	<patterns_completed> = []
	<notes_completed> = 0
	<current_pattern> = 16777216
	<current_type> = 9
	training_display_notes_hit notes_hit = 0 notes_required = <req_patterns>
	begin
	Block \{type = jam_tutorial_drum_hit}
	if (<req_percussion> <= $is_percussion_kit)
		if NOT ArrayContains array = <patterns_completed> contains = ($jam_loop_current_pattern)
			if (<current_pattern> = $jam_loop_current_pattern)
				<notes_completed> = (<notes_completed> + 1)
			else
				<notes_completed> = 1
				<current_pattern> = $jam_loop_current_pattern
			endif
			if (<notes_completed> = <req_notes>)
				<notes_completed> = 0
				<patterns_completed> = (<patterns_completed> + $jam_loop_current_pattern)
				GetArraySize <patterns_completed>
				training_display_notes_hit notes_hit = <array_size> notes_required = <req_patterns>
				if (<array_size> = <req_patterns>)
					Random (
						@ training_play_sound \{Sound = 'Tut_RS_Drums_07_BAS'}
						@ training_play_sound \{Sound = 'Tut_RS_Drums_11_BAS'}
						@ training_play_sound \{Sound = 'Tut_RS_AdvGtr_07_BAS'}
						@ training_play_sound \{Sound = 'Tut_RS_AdvGtr_10_BAS'}
						)
					Wait \{1
						second}
					break
				endif
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script create_jam_tutorial_message \{time = 4}
	destroy_jam_tutorial_message
	if NOT ScreenElementExists \{id = jam_band_container}
		CreateScreenElement \{type = ContainerElement
			parent = root_window
			id = jam_band_container
			pos = (0.0, 800.0)}
	endif
	if NOT ScreenElementExists \{id = jam_tut_text_window}
		CreateScreenElement \{type = WindowElement
			parent = jam_band_container
			id = jam_tut_text_window
			just = [
				left
				top
			]
			pos = (230.0, 580.0)
			dims = (830.0, 65.0)}
	endif
	CreateScreenElement {
		type = TextBlockElement
		parent = jam_tut_text_window
		id = jam_tut_text
		font = fontgrid_text_a8
		just = [center center]
		internal_just = [center center]
		z_priority = 100
		rgba = [255 255 255 255]
		dims = (840.0, 50.0)
		pos = (800.0, 25.0)
		text = <text>
		scale = 1
		internal_scale = 0.8
		z_priority = 55
	}
	jam_tut_text :SE_SetProps \{pos = (410.0, 25.0)
		time = 0.3}
	jam_tut_text :SE_WaitProps
	if (<time> = -1)
		return
	endif
	Wait <time> seconds
	destroy_jam_tutorial_message
endscript

script destroy_jam_tutorial_message 
	if NOT ScreenElementExists \{id = jam_tut_text}
		return
	endif
	jam_tut_text :SE_SetProps \{pos = (-100.0, 25.0)
		time = 0.3}
	jam_tut_text :SE_WaitProps
	DestroyScreenElement \{id = jam_tut_text}
endscript

script display_tutorial_narrator \{narrator = null}
	switch <narrator>
		case lou
		<texture> = tutorial_narrator_drummer_0
		<pos> = (945.0, 130.0)
		case GOR
		<texture> = tutorial_narrator_drummer_0
		<pos> = (520.0, 150.0)
		default
		<texture> = tutorial_narrator_drummer_0
		<pos> = (520.0, 150.0)
	endswitch
	if NOT ScreenElementExists \{id = jam_band_container}
		CreateScreenElement \{type = ContainerElement
			parent = root_window
			id = jam_band_container
			pos = (0.0, 800.0)}
	endif
	CreateScreenElement {
		parent = jam_band_container
		type = SpriteElement
		id = tut_narrator
		just = [center center]
		texture = <texture>
		pos = <pos>
		rot_angle = 0
		rgba = [255 255 255 255]
		scale = (1.5, 1.5)
		z_priority = 4
	}
endscript

script jam_tutorial_instrument_select_menu \{player = 1
		instrument = null}
	switch <instrument>
		case rhythm
		slot = 0
		case lead
		slot = 1
		case Bass
		slot = 2
		case Drums
		slot = 3
		default
		slot = 0
	endswitch
	FormatText checksumname = player_cont 'inst_player_cont_%s' s = <player>
	if ScreenElementExists id = <player_cont>
		jam_destroy_player \{player = 1}
	endif
	if GotParam \{selectable}
		jam_band_container :SetTags \{disable_inst_select = 0}
	endif
	jam_create_player_container \{player = 1}
	if NOT GotParam \{selectable}
		<slots> = [0 1 2 3 4]
		GetArraySize <slots>
		<i> = 0
		begin
		FormatText checksumname = inst_select_text 'jam_%a_select_text_%b' a = (<slots> [<i>]) b = <player>
		if (<i> = <slot>)
			LaunchEvent type = focus target = <inst_select_text>
			<inst_select_text> :SE_SetProps block_events
		else
			LaunchEvent type = unfocus target = <inst_select_text>
			<inst_select_text> :SE_SetProps not_focusable
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	FormatText checksumname = inst_select_element 'inst_select_element_%a' a = <player>
	if ScreenElementExists id = <inst_select_element>
		FormatText checksumname = inst_select_text 'jam_%a_select_text_%b' a = <slot> b = <player>
		LaunchEvent type = focus target = <inst_select_text>
	endif
endscript

script jam_tutorial_inst_menu_indicate \{player = 1
		instrument = null}
	switch <instrument>
		case rhythm
		slot = 0
		case lead
		slot = 1
		case Bass
		slot = 2
		case Drums
		slot = 3
		case melody
		slot = 4
		default
		slot = 0
	endswitch
	<slots> = [0 1 2 3 4]
	GetArraySize <slots>
	<i> = 0
	begin
	FormatText checksumname = inst_select_text 'jam_%a_select_text_%b' a = (<slots> [<i>]) b = <player>
	if NOT ScreenElementExists \{id = jam_band_container}
		CreateScreenElement \{type = ContainerElement
			parent = root_window
			id = jam_band_container
			pos = (0.0, 800.0)}
	endif
	if (<i> = <slot>)
		LaunchEvent type = focus target = <inst_select_text>
		<inst_select_text> :SE_SetProps block_events
	else
		LaunchEvent type = unfocus target = <inst_select_text>
		<inst_select_text> :SE_SetProps not_focusable
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script jam_tutorial_display_instrument_icons \{icons = [
			rhythm
			lead
			Bass
			drum
		]}
	if ScreenElementExists \{id = jam_tut_icon_container}
		DestroyScreenElement \{id = jam_tut_icon_container}
	endif
	CreateScreenElement \{type = ContainerElement
		id = jam_tut_icon_container
		parent = jam_band_container
		just = [
			left
			top
		]
		scale = (1.0, 1.0)
		z_priority = 4}
	<icon_params> = {parent = jam_tut_icon_container type = SpriteElement just = [center center] z_priority = 4}
	<pos> = (350.0, 275.0)
	if ScreenElementExists \{id = inst_player_cont_1}
		<pos> = (<pos> + (135.0, 0.0))
	endif
	GetArraySize <icons>
	<i> = 0
	begin
	<icon_type> = (<icons> [<i>])
	switch <icon_type>
		case rhythm
		<icon_id> = rhythm_icon
		<texture> = band_HUD_guitar
		<icon_dims> = (256.0, 256.0)
		case lead
		<icon_id> = lead_icon
		<texture> = band_HUD_guitar
		<icon_dims> = (256.0, 256.0)
		case Bass
		<icon_id> = bass_icon
		<texture> = band_HUD_bass
		<icon_dims> = (256.0, 256.0)
		case drum
		case Drums
		<icon_id> = drum_icon
		<texture> = band_HUD_drums
		<icon_dims> = (128.0, 128.0)
		default
		<icon_id> = rhythm_icon
		<texture> = band_HUD_guitar
		<icon_dims> = (256.0, 256.0)
	endswitch
	<icon_pos> = (<pos> + (<i> * (135.0, 0.0)))
	CreateScreenElement {
		<icon_params>
		id = <icon_id>
		texture = <texture>
		dims = <icon_dims>
		pos = <icon_pos>
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script jam_tutorial_destroy_instrument_icons 
	if ScreenElementExists \{id = jam_tut_icon_container}
		DestroyScreenElement \{id = jam_tut_icon_container}
	endif
endscript

script jam_tutorial_anim \{Anim = null}
	KillSpawnedScript \{id = jam_tut_anim}
	if ScreenElementExists \{id = jam_tut_anim_container}
		DestroyScreenElement \{id = jam_tut_anim_container}
	endif
	if NOT ScreenElementExists \{id = jam_band_container}
		CreateScreenElement \{type = ContainerElement
			parent = root_window
			id = jam_band_container
			pos = (0.0, 800.0)}
	endif
	CreateScreenElement \{type = ContainerElement
		id = jam_tut_anim_container
		parent = jam_band_container
		just = [
			left
			top
		]
		scale = (1.0, 1.0)
		z_priority = 6}
	switch <Anim>
		case open_strum
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_open_strum_anim}
		case play_scale_single
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_play_scale_anim
			params = {
				Anim = single
			}}
		case play_scale
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_play_scale_anim}
		case chord_2
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_chord_anim
			params = {
				num = 2
			}}
		case chord_3
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_chord_anim
			params = {
				num = 3
			}}
		case tilt
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_tilt_anim}
		case sustains
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_sustains_anim}
		case hopo
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_hopo_anim}
		case pm
		spawnscriptnow \{id = jam_tut_anim
			jam_tutorial_pm_anim}
		case null
		case `default`
		ScriptAssert 'Jam Tutorial Anim set to %a' a = <Anim>
	endswitch
endscript

script jam_tutorial_create_ghost_player 
	if ScreenElementExists \{id = jam_tut_ghost_container}
		DestroyScreenElement \{id = jam_tut_ghost_container}
	endif
	<guitar_tex> = tutorial_guitar
	<guitar_strum> = tutorial_guitar_strum
	<guitar_strum_up> = tutorial_guitar_strum_up
	<guitar_strum_dn> = tutorial_guitar_strum_dn
	if NOT ScreenElementExists \{id = jam_band_container}
		CreateScreenElement \{type = ContainerElement
			parent = root_window
			id = jam_band_container
			pos = (0.0, 800.0)}
	endif
	CreateScreenElement \{type = ContainerElement
		id = jam_tut_ghost_container
		parent = jam_band_container
		just = [
			left
			top
		]
		scale = (1.0, 1.0)
		z_priority = 6}
	<tut_ui_props> = {parent = jam_tut_ghost_container type = SpriteElement just = [center center] rgba = [255 255 255 255]}
	CreateScreenElement {<tut_ui_props> id = jam_tut_guitar texture = <guitar_tex> dims = (614.0, 307.0) pos = (745.0, 360.0) z_priority = 4}
	CreateScreenElement {<tut_ui_props> id = jam_tut_hand texture = tutorial_hand_strum dims = (154.0, 154.0) pos = (975.0, 330.0) z_priority = 6}
	CreateScreenElement {<tut_ui_props> id = jam_tut_hand_dn texture = tutorial_hand_strum_dn dims = (154.0, 154.0) pos = (975.0, 333.0) z_priority = 6}
	safe_hide \{id = jam_tut_hand_dn}
	CreateScreenElement {<tut_ui_props> id = jam_tut_hand_up texture = tutorial_hand_strum_up dims = (154.0, 154.0) pos = (975.0, 335.0) z_priority = 6}
	safe_hide \{id = jam_tut_hand_up}
	CreateScreenElement {<tut_ui_props> id = jam_tut_strum texture = <guitar_strum> dims = (77.0, 38.0) pos = (910.0, 360.0) z_priority = 5}
	CreateScreenElement {<tut_ui_props> id = jam_tut_strum_up texture = <guitar_strum_up> dims = (77.0, 38.0) pos = (910.0, 360.0) z_priority = 5}
	safe_hide \{id = jam_tut_strum_up}
	CreateScreenElement {<tut_ui_props> id = jam_tut_strum_dn texture = <guitar_strum_dn> dims = (77.0, 38.0) pos = (910.0, 360.0) z_priority = 5}
	safe_hide \{id = jam_tut_strum_down}
	CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_top texture = tutorial_hand_wrist dims = (154.0, 77.0) pos = (625.0, 330.0) z_priority = 3}
	CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_bott_none texture = tutorial_hand_button_none dims = (154.0, 77.0) pos = (580.0, 385.0) z_priority = 5}
	jam_tut_ghost_container :SetTags \{strum_position = neutral}
endscript

script jam_tutorial_anim_strum \{position = null}
	jam_tut_ghost_container :GetTags
	switch <strum_position>
		case up
		safe_hide \{id = jam_tut_strum_up}
		safe_hide \{id = jam_tut_hand_up}
		case down
		safe_hide \{id = jam_tut_strum_dn}
		safe_hide \{id = jam_tut_hand_dn}
		case neutral
		default
		safe_hide \{id = jam_tut_strum}
		safe_hide \{id = jam_tut_hand}
	endswitch
	switch <position>
		case up
		safe_show \{id = jam_tut_strum_up}
		safe_show \{id = jam_tut_hand_up}
		case down
		safe_show \{id = jam_tut_strum_dn}
		safe_show \{id = jam_tut_hand_dn}
		case neutral
		default
		safe_show \{id = jam_tut_strum}
		safe_show \{id = jam_tut_hand}
	endswitch
	jam_tut_ghost_container :SetTags strum_position = <position>
endscript

script jam_tutorial_create_dpad 
	if ScreenElementExists \{id = tut_dpad}
		DestroyScreenElement \{id = tut_dpad}
	endif
	CreateScreenElement \{parent = jam_band_container
		type = SpriteElement
		id = tut_dpad
		just = [
			center
			center
		]
		texture = d_pad
		pos = (800.0, 200.0)
		scale = (1.5, 1.5)
		z_priority = 10}
endscript

script jam_tutorial_create_tiltable_guitar 
	if ScreenElementExists \{id = jam_tut_ghost_container}
		DestroyScreenElement \{id = jam_tut_ghost_container}
	endif
	<guitar_tex> = tutorial_guitar
	<guitar_strum> = tutorial_guitar_strum
	<guitar_strum_up> = tutorial_guitar_strum_up
	<guitar_strum_dn> = tutorial_guitar_strum_dn
	if NOT ScreenElementExists \{id = jam_band_container}
		CreateScreenElement \{type = ContainerElement
			parent = root_window
			id = jam_band_container
			pos = (0.0, 800.0)}
	endif
	CreateScreenElement \{type = ContainerElement
		id = jam_tut_ghost_container
		parent = jam_band_container
		just = [
			center
			center
		]
		pos = (845.0, 360.0)
		scale = (1.0, 1.0)
		z_priority = 6}
	<tut_ui_props> = {parent = jam_tut_ghost_container type = SpriteElement just = [center center] rgba = [255 255 255 255]}
	CreateScreenElement {<tut_ui_props> id = jam_tut_guitar texture = <guitar_tex> dims = (614.0, 307.0) pos = (-100.0, 0.0) z_priority = 4}
	CreateScreenElement {<tut_ui_props> id = jam_tut_strum texture = <guitar_strum> dims = (77.0, 38.0) pos = (65.0, 0.0) z_priority = 5}
endscript

script jam_tutorial_create_ghost_G_R_Y_GR_GRY 
	if ScreenElementExists \{id = jam_tut_ghost_container}
		<tut_ui_props> = {parent = jam_tut_ghost_container type = SpriteElement just = [center center] rgba = [255 255 255 255]}
		CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_bG texture = tutorial_hand_button_g dims = (154.0, 77.0) pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_bG}
		CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_bR texture = tutorial_hand_button_r dims = (154.0, 77.0) pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_bR}
		CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_bY texture = tutorial_hand_button_y dims = (154.0, 77.0) pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_bY}
		CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_bGR texture = tutorial_hand_button_gr dims = (154.0, 77.0) pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_bGR}
		CreateScreenElement {<tut_ui_props> id = jam_tut_fret_hand_bGRY texture = tutorial_hand_button_gry dims = (154.0, 77.0) pos = (580.0, 385.0) z_priority = 5}
		safe_hide \{id = jam_tut_fret_hand_bGRY}
	endif
endscript

script jam_tutorial_show_instrument_UI \{player = 1
		machine = 0
		drum_kit = -1}
	jam_destroy_player \{player = 1}
	Wait \{1
		gameframe}
	if GotParam \{instrument}
		jam_band_container :SetTags {role = <instrument>}
	else
		jam_band_container :GetTags
		<instrument> = (<role>)
	endif
	<no_palm_perc> = 0
	switch <instrument>
		case rhythm
		<jam_instrument> = 0
		case lead
		<jam_instrument> = 1
		case Bass
		<jam_instrument> = 2
		<no_palm_perc> = 1
		case Drums
		<jam_instrument> = 3
		case melody
		<no_palm_perc> = 1
		<jam_instrument> = 4
	endswitch
	if (<machine> = 1)
		if (<jam_instrument> = 3)
			change \{is_drum_machine = 1}
		else
			is_arpeggiator = [0 0 0 0 0 0]
			SetArrayElement {
				ArrayName = is_arpeggiator
				index = <jam_instrument>
				newvalue = 1
			}
			change is_arpeggiator = <is_arpeggiator>
		endif
	endif
	SetPlayerInfo 1 jam_instrument = <jam_instrument>
	CreateScreenElement \{type = ContainerElement
		parent = jam_band_container
		id = inst_player_cont_1
		pos = (330.0, 52.0)}
	jam_create_instrument \{select_player = 1
		player_cont = inst_player_cont_1}
	jam_create_player_info \{player = 1
		player_cont = inst_player_cont_1}
	menu_jam_band_add_control_helpers state = instrument_ui instrument = <jam_instrument>
	if ((<jam_instrument> = 3) && (<drum_kit> > -1))
		jam_tutorial_change_drum_kit player = 1 option_index = <drum_kit>
	endif
endscript

script jam_tutorial_destroy_instrument_UI \{player = 1}
	StopSound \{unique_id = $jam_input_current_lead
		fade_type = log_fast
		fade_time = 0.3}
	StopSound \{unique_id = $jam_input_current_bass
		fade_type = log_fast
		fade_time = 0.3}
	StopSound \{unique_id = $jam_input_current_chord
		fade_type = log_fast
		fade_time = 0.3}
	StopSound \{unique_id = $jam_input_current_melody
		fade_type = log_fast
		fade_time = 0.3}
	jam_destroy_player \{player = 1}
	menu_jam_band_add_control_helpers
endscript

script jam_tutorial_segment_cleanup 
	jam_tutorial_destroy_check_marks
	training_destroy_all_arrows
	if ScreenElementExists \{id = ghtunes_element}
		DestroyScreenElement \{id = ghtunes_element}
	endif
	destroy_generic_menu
	if ScreenElementExists \{id = PopupElement}
		<is_disconnect_warning> = false
		PopupElement :GetSingleTag \{is_disconnect_warning}
		if (<is_disconnect_warning> = false)
			destroy_popup_warning_menu
		endif
	endif
	jam_tutorial_destroy_anim
	KillSpawnedScript \{id = training_spawned_script}
	KillSpawnedScript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
	jam_destroy_select_instrument_menu \{player = 1}
	jam_tutorial_destroy_instrument_UI \{player = 1}
	spawnscriptnow \{training_destroy_title}
	training_hide_narrator
	training_hide_lesson_header
	screen_elements = [
		jam_tut_text
		jam_tut_icon_container
		jam_tut_check_container
		jam_tut_anim_container
		tut_narrator
		jam_tut_ghost_container
		ghmix_tut_highlight
	]
	GetArraySize <screen_elements>
	<i> = 0
	begin
	if ScreenElementExists id = (<screen_elements> [<i>])
		DestroyScreenElement id = (<screen_elements> [<i>])
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	StopSoundsByBuss \{Training_VO}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetTags \{tool_controls = [
				force_exit
			]}
		jam_highway_move_beginning
	endif
endscript

script jam_tutorial_show_scale 
endscript

script jam_tutorial_init_check_marks 
	if ScreenElementExists \{id = jam_tut_check_container}
		DestroyScreenElement \{id = jam_tut_check_container}
	endif
	if NOT ScreenElementExists \{id = jam_band_container}
		CreateScreenElement \{type = ContainerElement
			parent = root_window
			id = jam_band_container
			pos = (0.0, 800.0)}
	endif
	CreateScreenElement \{type = ContainerElement
		id = jam_tut_check_container
		parent = jam_band_container
		just = [
			left
			top
		]
		scale = (1.0, 1.0)
		z_priority = 6}
	<check_mark_props> = {parent = jam_tut_check_container type = SpriteElement just = [center center] rgba = [255 255 255 255] scale = (0.5, 0.5)}
	<icon_x_inc> = 50
	<num_check_marks> = 0
	Block \{type = jam_update_check_marks}
	begin
	if (<event_data>.num_check_marks = <num_check_marks>)
		Block \{type = jam_update_check_marks}
	else
		if (<event_data>.num_check_marks > <num_check_marks>)
			<num_check_marks> = (<num_check_marks> + 1)
			FormatText checksumname = check_id 'check_%n' n = <num_check_marks>
			<icon_pos> = (((0.0, 1.0) * 140) + ((1.0, 0.0) * (600 + (<num_check_marks> * <icon_x_inc>))))
			CreateScreenElement {
				id = <check_id>
				<check_mark_props>
				texture = tutorial_checkmark
				pos = <icon_pos>
				z_priority = 6
			}
		else
			<num_check_marks> = (<num_check_marks> + 1)
			FormatText checksumname = check_id 'check_%n' n = <num_check_marks>
			DestroyScreenElement id = <check_id>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_tutorial_update_check_marks 
	if GotParam \{num_check_marks}
		BroadcastEvent type = jam_update_check_marks data = {num_check_marks = <num_check_marks>}
	endif
endscript

script jam_tutorial_destroy_check_marks 
	KillSpawnedScript \{name = jam_tutorial_init_check_marks}
	if ScreenElementExists \{id = jam_tut_check_container}
		DestroyScreenElement \{id = jam_tut_check_container}
	endif
endscript

script jam_tutorial_advance_index \{array = [
			null
		]
		i = 0}
	GetArraySize <array>
	<i> = (<i> + 1)
	if (<i> = <array_size>)
		<i> = 0
	endif
	return i = <i>
endscript

script jam_tutorial_add_arrow \{pos = (450.0, 175.0)
		life = 2
		scale = 0.5}
	if GotParam \{instrument}
		switch <instrument>
			case rhythm
			<pos> = (410.0, 155.0) <rot> = 90
			case lead
			<pos> = (410.0, 195.0) <rot> = 90
			case Bass
			<pos> = (410.0, 235.0) <rot> = 90
			case drum
			case Drums
			<pos> = (410.0, 275.0) <rot> = 90
			case melody
			<pos> = (410.0, 313.0) <rot> = 90
		endswitch
	endif
	training_add_arrow <...>
endscript

script jam_tutorial_lesson_complete 
	jam_recording_add_user_control_helpers
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
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

script jam_tutorial_destroy_anim 
	if ScreenElementExists \{id = jam_tut_anim_container}
		KillSpawnedScript \{id = jam_tut_anim}
		DestroyScreenElement \{id = jam_tut_anim_container}
	endif
	if ScreenElementExists \{id = jam_tut_ghost_container}
		DestroyScreenElement \{id = jam_tut_ghost_container}
	endif
endscript

script jam_tutorial_show_narrator 
	if GotParam \{offset}
		training_show_narrator \{narrator = 'bassist'
			new_pos = (1088.0, 182.0)
			hflip}
	else
		training_show_narrator \{narrator = 'bassist'}
	endif
endscript

script jam_tutorial_change_drum_kit \{player = 1
		option_index = 0}
	change jam_current_drum_kit = <option_index>
	SetSongInfo \{drum_kit = $jam_current_drum_kit}
	LoadDrumKitAll drum_kit = ($drum_kits [<option_index>].string_id) percussion_kit = ($drum_kits [<option_index>].percussion_string_id) async = 0
	<respawn> = 0
	if ($jam_advanced_record = 0)
		FormatText checksumname = player_info_element 'player_info_element_%a' a = <player>
		FormatText TextName = extra_info_text qs("%s") s = (($pause_drum_kit_options) [<option_index>].name_text)
		<respawn> = 1
		if ScreenElementExists id = <player_info_element>
			<player_info_element> :SE_SetProps extra_info_text = <extra_info_text>
		endif
	endif
endscript
