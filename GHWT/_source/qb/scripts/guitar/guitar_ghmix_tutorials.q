
script ghmix_tutorial_live_rec 
	jam_studio_element :SetTags \{challenges_complete = 0
		challenges_req = 3}
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]
		tool_controls = [
		]}
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps alpha = 0
	endif
	Wait \{1.5
		second}
	training_show_title \{title = qs("Editing in GHMix")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_GHMix_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'
		expression = 2}
	training_wait_for_sound \{Sound = 'Tut_RS_GHMix_01_BAS'}
	Wait \{0.5
		second}
	training_show_narrator \{narrator = 'bassist'
		expression = 0}
	training_play_sound \{Sound = 'Tut_RS_GHMix_02_BAS'
		Wait}
	training_hide_narrator
	training_show_title \{title = qs("Live Record Tool")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_LiveRec_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_LiveRec_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_live_rec_challenge
	training_show_narrator \{narrator = 'bassist'
		expression = 0}
	training_play_sound \{Sound = 'Tut_RS_LiveRec_02_BAS'
		Wait}
	training_hide_narrator
	training_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_live_rec_challenge 
	jam_control_goto \{option_index = 3}
	ghmix_tutorial_force_snap \{setting = 6}
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		tool_controls = [
		]
		block_snap = 0}
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("LIVE RECORDING IN GHMIX")}
	if (ControllerHasDpad controller = $primary_controller)
		training_add_lesson_body_text \{number = 1
			text = $wii_ghmix_snap_resolution}
		current_step_num = 2
	else
		ghmix_tutorial_force_snap \{setting = 4}
		current_step_num = 1
	endif
	training_set_task_header_body \{text = qs("Record 10 notes")}
	<notes_required> = 10
	training_show_lesson_header
	training_show_task_header
	training_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	if (ControllerHasDpad controller = $primary_controller)
		begin
		Block \{type = ghmix_snap_changed}
		if ($jam_current_quantize = 4)
			ControllerDebounce \{left}
			ControllerDebounce \{right}
			break
		endif
		repeat
	endif
	training_add_lesson_body_text number = <current_step_num> text = qs(0x67cb9e93)
	current_step_num = (<current_step_num> + 1)
	jam_studio_element :SetTags \{controls_enabled = [
			0
			0
			0
			1
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
		]
		block_snap = 1}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size_before = ($<appended_id>)
	Block \{type = ghmix_start_rec}
	training_add_lesson_body_text number = <current_step_num> text = qs("Play notes as normal.")
	current_step_num = (<current_step_num> + 1)
	begin
	<num_new_notes> = ((($<appended_id>) - <notetrack_size_before>) / 2)
	if (<num_new_notes> >= <notes_required>)
		training_display_notes_hit notes_hit = <notes_required> notes_required = <notes_required>
		break
	else
		training_display_notes_hit notes_hit = <num_new_notes> notes_required = <notes_required>
	endif
	Wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text number = <current_step_num> text = qs("PRESS Stop Recording \m9 to finish.")
	Block \{type = ghmix_stop_rec}
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		block_snap = 1}
	training_play_sound \{Sound = 'Tut_RS_LiveRec_04_BAS'
		Wait}
	training_hide_lesson_header
endscript

script ghmix_tutorial_step_rec 
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	training_show_title \{title = qs("Changing Instruments")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_StepRec_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_StepRec_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_step_rec_switch_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_StepRec_02_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_step_rec_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_StepRec_03_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_step_rec_switch_challenge 
	jam_studio_element :SetTags \{controls_enabled = [
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
			1
		]
		block_updown = 0}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("SWITCHING TO BASS TRACK")}
	training_add_lesson_body_text \{number = 1
		text = qs("PRESS the Strum Bar to highlight Change Instrument.")}
	training_set_task_header_body \{text = qs("Switch to the Bass")}
	training_show_lesson_header
	training_show_task_header
	begin
	if ($jam_control_selected = 13)
		jam_studio_element :SetTags \{block_updown = 1}
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 2
		text = $wii_ghmix_cycle_instrument}
	begin
	if ($jam_current_track = 2)
		ControllerDebounce \{x}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		block_updown = 1}
	training_hide_lesson_header
endscript

script ghmix_tutorial_step_rec_challenge 
	jam_studio_element :SetTags \{controls_enabled = [
			0
			0
			0
			0
			1
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]
		block_updown = 0}
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("STEP RECORDING IN GHMIX")}
	training_add_lesson_body_text \{number = 1
		text = qs("PRESS the Strum Bar to highlight Step Record.")}
	training_set_task_header_body \{text = qs("Record 10 Notes")}
	<notes_required> = 10
	training_show_lesson_header
	training_show_task_header
	training_display_notes_hit notes_hit = 0 notes_required = <notes_required>
	begin
	if ($jam_control_selected = 4)
		jam_studio_element :SetTags \{block_updown = 1}
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 2
		text = $wii_ghmix_begin_recording}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size_before = ($<appended_id>)
	Block \{type = ghmix_start_step}
	training_add_lesson_body_text \{number = 3
		text = qs("Play notes as normal.")}
	begin
	<num_new_notes> = ((($<appended_id>) - <notetrack_size_before>) / 2)
	if (<num_new_notes> >= <notes_required>)
		training_display_notes_hit notes_hit = <notes_required> notes_required = <notes_required>
		break
	else
		training_display_notes_hit notes_hit = <num_new_notes> notes_required = <notes_required>
	endif
	Wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 4
		text = qs("PRESS Stop Recording \m9 to finish.")}
	Block \{type = ghmix_stop_step}
	jam_studio_element :SetTags \{controls_enabled = [
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
	training_play_sound \{Sound = 'Tut_RS_StepRec_05_BAS'
		Wait}
	training_hide_lesson_header
endscript

script ghmix_tutorial_delete 
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	ghmix_tutorial_force_snap \{setting = 3}
	begin
	if ($jam_current_track = 3)
		break
	endif
	jam_recording_switch_instrument
	Wait \{1
		gameframe}
	repeat
	training_show_title \{title = qs("Delete Tool")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Del_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_Del_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_delete_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Del_03_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{training
			params = {
				rs_ghmix_editing_lesson = complete
			}}
	endif
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_delete_challenge 
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("DELETING DRUM SOLO")}
	training_add_lesson_body_text \{number = 1
		text = qs("Use Navigation Tools to get to the solo.")}
	training_set_task_header_body \{text = qs("Delete the drum solo")}
	training_show_lesson_header
	training_show_task_header
	jam_studio_element :SetTags \{controls_enabled = [
			1
			1
			0
			0
			0
			1
			1
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 0
		block_updown = 0
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	<bad_solo_start_time> = 18000
	<bad_solo_end_time> = 26000
	ghmix_tutorial_highlight start_time = <bad_solo_start_time> end_time = <bad_solo_end_time>
	jam_studio_show_helper_arrow target = <bad_solo_start_time>
	begin
	if (($jam_highway_play_time > (<bad_solo_start_time> -100)) && ($jam_highway_play_time < (<bad_solo_start_time> + 100)))
		jam_studio_element :SetTags \{controls_enabled = [
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
		ControllerDebounce \{x}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
		text = qs("Activate the Delete Tool.")}
	training_play_sound \{Sound = 'Tut_RS_Del_02_BAS'}
	jam_studio_element :SetTags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
			0
			0
			0
			0
			0
		]}
	begin
	if ($jam_control_selected = 8)
		jam_studio_element :SetTags \{block_updown = 1}
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Block \{type = ghmix_delete_start}
	training_add_lesson_body_text \{number = 3
		text = qs("PRESS the Strum Bar to highlight the solo.")}
	jam_studio_element :SetTags \{delete_controls = [
			select
		]}
	jam_studio_show_helper_arrow target = <bad_solo_end_time>
	begin
	if (($jam_highway_play_time > (<bad_solo_end_time> -100)) && ($jam_highway_play_time < (<bad_solo_end_time> + 100)))
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_play_sound \{Sound = 'Tut_RS_LiveRec_04_BAS'}
	jam_studio_element :SetTags \{delete_controls = [
			delete
		]}
	training_add_lesson_body_text \{number = 4
		text = qs("PRESS Delete \m9 to remove the solo.")}
	Block \{type = ghmix_delete_done}
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	training_hide_lesson_header
endscript

script ghmix_tutorial_copypaste 
	jam_studio_element :SetTags \{challenges_complete = 0
		challenges_req = 3}
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	ghmix_tutorial_force_snap \{setting = 3}
	begin
	if ($jam_current_track = 4)
		break
	endif
	jam_recording_switch_instrument
	Wait \{1
		gameframe}
	repeat
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps alpha = 0
	endif
	training_show_title \{title = qs("Copy and Paste")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Copy_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_Copy_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_copypaste_copy_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Copy_02_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_copypaste_paste_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Copy_04_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_lesson_complete
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_copypaste_copy_challenge 
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("COPYING THE CHORUS")}
	training_add_lesson_body_text \{number = 1
		text = qs("Use Navigation Tools to get to the chorus.")}
	training_set_task_header_body \{text = qs("Copy the chorus")}
	training_show_lesson_header
	training_show_task_header
	jam_studio_element :SetTags \{controls_enabled = [
			1
			1
			0
			0
			0
			1
			1
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 0
		block_updown = 0
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	<chorus_start_time> = 2000
	<chorus_end_time> = 18000
	ghmix_tutorial_highlight start_time = <chorus_start_time> end_time = <chorus_end_time>
	jam_studio_show_helper_arrow target = <chorus_start_time>
	begin
	if (($jam_highway_play_time > (<chorus_start_time> -100)) && ($jam_highway_play_time < (<chorus_start_time> + 100)))
		jam_studio_element :SetTags \{controls_enabled = [
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
			]
			block_updown = 1}
		ControllerDebounce \{x}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
		text = qs("Activate the Copy Tool.")}
	jam_studio_element :SetTags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			1
			0
			0
			0
			0
		]
		block_updown = 0}
	jam_studio_element :SetTags \{copy_controls = [
			strum
		]}
	Block \{type = ghmix_start_copy}
	training_add_lesson_body_text \{number = 3
		text = qs("PRESS the Strum Bar to highlight the chorus.")}
	jam_studio_show_helper_arrow target = <chorus_end_time>
	begin
	if (($jam_highway_play_time > (<chorus_end_time> -100)) && ($jam_highway_play_time < (<chorus_end_time> + 100)))
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 4
		text = qs("PRESS Copy \m9 to copy the chorus into the buffer.")}
	jam_studio_element :SetTags \{copy_controls = [
			copy
		]}
	Block \{type = ghmix_stop_copy}
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		block_updown = 1}
	training_hide_lesson_header
endscript

script ghmix_tutorial_copypaste_paste_challenge 
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("PASTING THE CHORUS")}
	training_add_lesson_body_text \{number = 1
		text = qs("Use Navigation Tools to get to the gap.")}
	training_set_task_header_body \{text = qs("Paste the chorus")}
	training_show_lesson_header
	training_show_task_header
	jam_studio_element :SetTags \{controls_enabled = [
			1
			1
			0
			0
			0
			1
			1
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 0
		block_updown = 0
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	<start_time> = 34000
	<end_time> = 48000
	ghmix_tutorial_highlight start_time = <start_time> end_time = <end_time>
	jam_studio_show_helper_arrow target = <start_time>
	begin
	if (($jam_highway_play_time > (<start_time> -100)) && ($jam_highway_play_time < (<start_time> + 100)))
		jam_studio_element :SetTags \{controls_enabled = [
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
			]
			block_snap = 1
			block_updown = 1}
		ControllerDebounce \{x}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
		text = qs("Activate the Paste Tool.")}
	training_play_sound \{Sound = 'Tut_RS_Copy_03_BAS'}
	jam_studio_element :SetTags \{controls_enabled = [
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
			1
			0
			0
			0
		]
		block_snap = 1
		block_updown = 0}
	Block \{type = ghmix_paste_start}
	training_add_lesson_body_text \{number = 3
		text = $wii_ghmix_paste_chorus}
	jam_studio_element :SetTags \{paste_controls = [
			paste_one
		]}
	Block \{type = ghmix_paste_pasted}
	training_add_lesson_body_text \{number = 4
		text = $wii_ghmix_finish_pasting}
	jam_studio_element :SetTags \{paste_controls = [
			cancel
		]}
	Block \{type = ghmix_paste_done}
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		block_snap = 1
		block_updown = 1}
	training_hide_lesson_header
endscript

script ghmix_tutorial_loops 
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	begin
	if ($jam_current_track = 3)
		break
	endif
	jam_recording_switch_instrument
	Wait \{1
		gameframe}
	repeat
	jam_highway_move_beginning
	training_show_title \{title = qs("Loop Tool")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Loop_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_Loop_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_lay_loop_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Loop_02_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_loops_challenge
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_RS_Loop_03_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	jam_studio_element :SetTags {challenges_complete = <challenges_complete>}
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_lay_loop_challenge 
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("SETTING UP A LOOP")}
	training_add_lesson_body_text \{number = 1
		text = qs("Use Navigation Tools to get past the intro.")}
	training_set_task_header_body \{text = qs("Setup a 2 measure loop")}
	training_show_lesson_header
	training_show_task_header
	<start_time> = 2000
	<end_time> = 6000
	ghmix_tutorial_highlight start_time = <start_time> end_time = <end_time>
	ghmix_tutorial_force_snap \{setting = 2}
	jam_studio_element :SetTags \{controls_enabled = [
			1
			1
			0
			0
			0
			1
			1
			0
			0
			0
			0
			0
			0
			0
		]
		block_snap = 0
		block_updown = 0
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	jam_studio_show_helper_arrow target = <start_time>
	begin
	if (($jam_highway_play_time > (<start_time> -100)) && ($jam_highway_play_time < (<start_time> + 100)))
		ControllerDebounce \{x}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 2
		text = qs("Activate the Loop Tool.")}
	jam_studio_element :SetTags \{controls_enabled = [
			0
			0
			0
			0
			0
			0
			0
			1
			0
			0
			0
			0
			0
			0
		]
		block_snap = 0
		block_updown = 0
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	Block \{type = ghmix_start_loop}
	training_add_lesson_body_text \{number = 3
		text = qs("PRESS the Strum Bar to navigate 2 measures into the song.")}
	jam_studio_element :SetTags \{loop_controls = [
			select_area
		]}
	jam_studio_show_helper_arrow target = <end_time>
	begin
	if (($jam_highway_play_time > (<end_time> -100)) && ($jam_highway_play_time < (<end_time> + 100)))
		ControllerDebounce \{up}
		ControllerDebounce \{down}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	training_add_lesson_body_text \{number = 4
		text = qs("PRESS Set Loop \m9 to complete the loop.")}
	jam_studio_element :SetTags \{loop_controls = [
			set_loop
		]}
	Block \{type = ghmix_loop_set}
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	training_hide_lesson_header
endscript

script ghmix_tutorial_loops_challenge 
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias \{name = percussion_box}
			<resolved_id> :SetProps alpha = 0
		endif
	endif
	ghmix_tutorial_force_snap \{setting = 4}
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("BUILDING A BEAT")}
	training_add_lesson_body_text \{number = 1
		text = qs("Activate Live Record.")}
	training_set_task_header_body \{text = qs("Build a 3 part beat")}
	training_show_lesson_header
	training_show_task_header
	jam_studio_element :SetTags \{controls_enabled = [
			0
			0
			0
			1
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
		]
		block_updown = 0}
	Block \{type = ghmix_start_rec}
	training_add_lesson_body_text \{number = 2
		text = $wii_ghmix_hihat_loop}
	training_add_lesson_body_text \{number = 3
		text = $wii_ghmix_snare_loop}
	training_add_lesson_body_text \{number = 4
		text = qs("PRESS the Strum Bar to add Kick notes.")}
	<gem_array> = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	<notetrack_size_before> = ($<appended_id>)
	<notes_required> = 3
	begin
	<num_new_notes> = ((($<appended_id>) - <notetrack_size_before>) / 2)
	if (<num_new_notes> >= <notes_required>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	training_add_lesson_body_text \{number = 5
		text = qs("PRESS Stop Recording \m9 to finish.")}
	Block \{type = ghmix_stop_rec}
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	training_hide_lesson_header
endscript

script ghmix_tutorial_nudge 
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		tool_controls = [
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	ghmix_tutorial_force_snap \{setting = 3}
	begin
	if ($jam_current_track = 1)
		break
	endif
	jam_recording_switch_instrument
	Wait \{1
		gameframe}
	repeat
	jam_highway_move_beginning
	training_show_title \{title = qs("Note Nudge Tool")}
	Wait \{1
		second}
	training_play_sound \{Sound = 'Tut_RS_Nudge_01_BAS'}
	Wait \{3
		seconds}
	training_destroy_title
	training_show_narrator \{narrator = 'bassist'}
	training_wait_for_sound \{Sound = 'Tut_RS_Nudge_01_BAS'}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	ghmix_tutorial_nudge_challenge
	training_play_sound \{Sound = 'Tut_RS_Nudge_02_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_hide_placeholder
	jam_tutorial_lesson_complete
	jam_studio_element :GetTags
	<challenges_complete> = (<challenges_complete> + 1)
	if (<challenges_complete> = <challenges_req>)
		SetGlobalTags \{training
			params = {
				rs_ghmix_pro_techniques_tools_lesson = complete
			}}
	endif
	jam_tutorial_segment_cleanup
	change \{jam_tutorial_status = section_done}
endscript

script ghmix_tutorial_nudge_challenge 
	training_set_lesson_header_text \{number = qs("\L5")
		text = qs("NUDGING NOTES")}
	training_add_lesson_body_text \{number = 1
		text = qs("Activate the Note Nudge tool.")}
	training_set_task_header_body \{text = qs("Create a 2 measure gap")}
	training_show_lesson_header
	training_show_task_header
	jam_studio_element :SetTags \{controls_enabled = [
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
			1
			0
			0
		]
		block_updown = 0}
	jam_studio_element :SetTags \{nudge_controls = [
			nudge_all
		]}
	<start_time> = 0
	<end_time> = 2000
	ghmix_tutorial_highlight start_time = <start_time> end_time = <end_time>
	Block \{type = ghmix_start_nudge}
	training_add_lesson_body_text \{number = 2
		text = $wii_ghmix_nudge}
	jam_studio_show_helper_arrow target = <end_time>
	begin
	if (($jam_highway_play_time > (<end_time> -100)) && ($jam_highway_play_time < (<end_time> + 100)))
		ControllerDebounce \{x}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_studio_cancel_helper_arrow
	jam_studio_element :SetTags \{nudge_controls = [
			cancel
		]}
	training_add_lesson_body_text \{number = 3
		text = $wii_ghmix_cancel_nudge}
	Block \{type = ghmix_stop_nudge}
	jam_studio_element :SetTags \{controls_enabled = [
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
		]
		block_snap = 1
		block_updown = 1
		pause_options_disabled = [
			0
			0
			0
			0
			0
			0
			0
			0
			1
		]}
	training_hide_lesson_header
endscript

script ghmix_tutorial_highlight \{start_time = 0
		end_time = 500
		color = [
			10
			255
			10
			50
		]}
	if ScreenElementExists \{id = ghmix_tut_highlight}
		DestroyScreenElement \{id = ghmix_tut_highlight}
	endif
	second_end_time = -1
	if ScreenElementExists \{id = ghmix_tut_highlight2}
		DestroyScreenElement \{id = ghmix_tut_highlight2}
	endif
	if ((<end_time> - <start_time>) > 12000)
		<second_end_time> = <end_time>
		<end_time> = (<start_time> + 12000)
	endif
	low_pos = ((<start_time> / 1000.0) * $jam_highway_pixels_per_second)
	high_pos = ((<end_time> / 1000.0) * $jam_highway_pixels_per_second)
	highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		id = ghmix_tut_highlight
		texture = white
		just = [left top]
		rgba = <color>
		pos = (<low_pos> + (0.0, 55.0))
		dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
		z_priority = 10
	}
	if (<second_end_time> > 0)
		start_time = <end_time>
		end_time = <second_end_time>
		low_pos = ((<start_time> / 1000.0) * $jam_highway_pixels_per_second)
		high_pos = ((<end_time> / 1000.0) * $jam_highway_pixels_per_second)
		highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = ghmix_tut_highlight2
			texture = white
			just = [left top]
			rgba = <color>
			pos = (<low_pos> + (0.0, 55.0))
			dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
			z_priority = 10
		}
	endif
endscript

script ghmix_tutorial_force_snap \{setting = 3}
	change jam_current_quantize = <setting>
	jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
endscript

script jam_studio_show_helper_arrow 
	KillSpawnedScript \{name = jam_studio_show_helper_arrow_spawned}
	spawnscriptnow jam_studio_show_helper_arrow_spawned id = jam_tutorial_spawns params = {<...>}
endscript

script jam_studio_cancel_helper_arrow 
	KillSpawnedScript \{name = jam_studio_show_helper_arrow_spawned}
endscript

script jam_studio_show_helper_arrow_spawned \{target = 2000
		time = 5}
	begin
	if ($jam_highway_play_time < (<target> -500))
		jam_tutorial_add_arrow \{pos = (550.0, 150.0)
			life = 1
			rot = 180}
	elseif ($jam_highway_play_time > (<target> + 200))
		jam_tutorial_add_arrow \{pos = (550.0, 550.0)
			life = 1}
	else
	endif
	Wait <time> seconds
	repeat
endscript
