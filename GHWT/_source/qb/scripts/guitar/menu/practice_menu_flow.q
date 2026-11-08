came_to_practice_from = main_menu
came_to_practice_difficulty = easy
came_to_practice_difficulty2 = easy

script practice_check_song_for_parts 
	if SD_Needs_Load song = ($current_song)
		create_loading_screen \{jam_mode = 1}
		if NOT SD_Load_Song song = ($current_song)
			return
		endif
		destroy_loading_screen
	endif
	unload_songqpak
	destroy_band
	load_songqpak song_name = ($current_song) async = 0
	get_song_struct song = ($current_song)
	if StructureContains Structure = <song_struct> no_rhythm_track
		change \{structurename = player1_status
			part = guitar}
		generic_event_choose \{state = uistate_select_difficulty}
		return
	endif
	get_song_prefix song = ($current_song)
	FormatText checksumname = song_rhythm_array_id '%s_song_rhythm_easy' s = <song_prefix>
	if GlobalExists name = <song_rhythm_array_id> type = array
		GetArraySize $<song_rhythm_array_id>
		if (<array_size> > 0)
			generic_event_choose \{state = UIstate_practice_select_part}
			return
		endif
	endif
	if StructureContains Structure = <song_struct> use_coop_notetracks
		generic_event_choose \{state = UIstate_practice_select_part}
		return
	endif
	ui_practice_select_part \{part = guitar}
endscript

script practice_check_song_for_parts_back 
	load_songqpak song_name = ($current_song) async = 0
	get_song_struct song = ($current_song)
	if StructureContains Structure = <song_struct> no_rhythm_track
		return \{flow_state = practice_setlist_fs}
	endif
	get_song_prefix song = ($current_song)
	FormatText checksumname = song_rhythm_array_id '%s_song_rhythm_easy' s = <song_prefix>
	if GlobalExists name = <song_rhythm_array_id> type = array
		GetArraySize $<song_rhythm_array_id>
		if (<array_size> > 0)
			return \{flow_state = practice_select_part_fs}
		endif
	endif
	if StructureContains Structure = <song_struct> use_coop_notetracks
		return \{flow_state = practice_select_part_fs}
	endif
	return \{flow_state = practice_setlist_fs}
endscript

script practice_start_song \{device_num = 0}
	change \{game_mode = training}
	change \{current_transition = practice}
	change \{current_level = load_z_studio}
	start_song {
		StartTime = ($practice_start_time)
		device_num = <device_num>
		practice_intro = 1
		endtime = ($practice_end_time)
		uselaststarttime = <uselaststarttime>
		songseekable = true
	}
	spawnscriptnow \{practice_update}
endscript

script practice_restart_song 
	if ((isps2) || (IsNgc))
		printf \{qs(0xbae9fb7a)}
		end_song \{ignore_fsb = 1}
	endif
	ResetScoreUpdateReady
	spawnscriptnow \{practice_restart_song_spawned}
endscript

script practice_restart_song_spawned 
	SetScriptCannotPause
	change \{game_mode = training}
	change \{current_transition = practice}
	destroy_bg_viewport
	generic_event_back \{state = uistate_gameplay}
	if ($special_event_stage != 0)
		if ($current_special_event_num = 2)
			change \{special_event_stage = 2}
			destroy_pause_menu
			reset_special_event \{num = 2}
		endif
	endif
	restart_song practice_intro = 1 StartTime = ($practice_start_time) endtime = ($practice_end_time) songseekable = true
	KillSpawnedScript \{name = practice_update}
	spawnscriptnow \{practice_update}
endscript

script practice_update 
	SetScriptCannotPause
	if ($special_event_stage != 0)
		check_current_special_event_percentages \{dont_use_extra_notes}
	endif
	begin
	practice_audio_filter
	if ($special_event_stage != 0)
		if ScreenElementExists \{id = practice_container}
			SetScreenElementProps \{id = practice_container
				alpha = 0}
		endif
		GetPlayerInfo \{1
			part}
		FormatText \{checksumname = event_num
			'special_event%d'
			d = $current_special_event_num}
		FormatText \{checksumname = challenge_num
			'challenge%d'
			d = $current_special_event_challenge_num}
		FormatText checksumname = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
		if ($current_special_event_num = 1 || $current_special_event_num = 2)
			show_recording_text = 1
			if ($current_special_event_num = 2)
				if ($special_event_stage >= 2)
					if ($current_section_array_entry = ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [0]))
						if ScreenElementExists \{id = special_event_question_markp1}
							SetScreenElementProps \{id = special_event_question_markp1
								unhide}
							special_event_question_markp1 :LegacyDoMorph \{alpha = 1
								time = 1}
						endif
						change \{special_event_alpha_out_gems = 1}
					else
						if ScreenElementExists \{id = special_event_question_markp1}
							special_event_question_markp1 :LegacyDoMorph \{alpha = 0
								time = 1}
						endif
					endif
				else
					if ($current_special_event_num != 2)
						<show_recording_text> = 0
					endif
				endif
			endif
			if (<show_recording_text> = 1)
				get_song_section_array
				GetSongTimeMs
				recording_text = qs("\L")
				recording = -1
				recording_countdown = -1
				set_special_event_section = false
				GetArraySize ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
				use_special_event_section_array = 1
				if (<array_size> = 0)
					<use_special_event_section_array> = 0
					get_song_section_array
					GetMarkerArraySize array = <song_section_array>
				endif
				entry = 0
				begin
				if (<use_special_event_section_array> = 1)
					recording_section = ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [<entry>])
				else
					recording_section = <entry>
				endif
				section_time = ($<song_section_array> [<recording_section>].time)
				if (<section_time> >= <time>)
					if (<set_special_event_section> = false)
						change current_special_event_section = <recording_section>
						<set_special_event_section> = true
					endif
				endif
				continue = 0
				if check_current_special_event_percentages section_to_check = <recording_section>
					if (<recording_section> = ($current_section_array_entry))
						<continue> = 1
					endif
				else
					<recording> = 0
					<recording_countdown> = 0
				endif
				if (<continue> = 0)
					if ($current_section_array_entry = <recording_section> && $practice_start_time <= (<time> - 50))
						if (<recording_section> < $practice_end_index)
							<recording> = 1
							<recording_text> = qs("Recording..")
							break
						endif
					endif
					if (<section_time> >= <time> && <recording> = 0 && <recording_countdown> = 0)
						if (<recording_section> < $practice_end_index)
							if (<section_time> - <time> <= 10000)
								time_to_format = (<section_time> + 1000)
								format_time_from_seconds time = ((<time_to_format> - <time>) / 1000.0)
								FormatText TextName = recording_text qs("Recording in %d..") d = <time_formatted>
								<recording_countdown> = 1
								break
							endif
						endif
					endif
				endif
				<entry> = (<entry> + 1)
				repeat <array_size>
				if (<recording> = 1 || <recording_countdown> = 1)
					if ScreenElementExists \{id = special_event_recording_textp1}
						SetScreenElementProps id = special_event_recording_textp1 text = <recording_text> alpha = 1 unhide
					endif
				else
					if ScreenElementExists \{id = special_event_recording_textp1}
						SetScreenElementProps id = special_event_recording_textp1 text = <recording_text> alpha = 0
					endif
				endif
			endif
		endif
	endif
	GetSongTimeMs
	if (<time> > (($practice_end_time) + ($Song_Win_Delay * 1000 - 100)))
		if ($practice_loop_section = 0)
			spawnscriptnow \{finish_practice_song}
		else
			spawnscriptnow \{practice_loop_song}
			return
		endif
	endif
	Wait \{1
		gameframes}
	repeat
endscript

script special_event_show_miss_notes 
	if ScreenElementExists \{id = special_event_missed_note_textp1}
		if GotParam \{close}
			SetScreenElementProps \{id = special_event_missed_note_textp1
				unhide
				text = qs("CLOSE")
				rgba = [
					255
					215
					0
					255
				]
				alpha = 1}
		elseif GotParam \{missed}
			SetScreenElementProps \{id = special_event_missed_note_textp1
				unhide
				text = qs("MISSED")
				rgba = [
					255
					20
					20
					255
				]
				alpha = 1}
		elseif GotParam \{good}
			SetScreenElementProps \{id = special_event_missed_note_textp1
				unhide
				text = qs("GOOD")
				rgba = [
					20
					200
					20
					255
				]
				alpha = 1}
		endif
		Wait \{0.52
			seconds}
		special_event_missed_note_textp1 :LegacyDoMorph \{alpha = 0
			time = 1}
	endif
endscript

script practice_loop_song 
	stoprendering
	RemovePlayerServerFretbarIterator \{fretbar_id = CreateFretbar
		id = player1_status}
	RemovePlayerServerFretbarIterator \{fretbar_id = PreFretbarEvent
		id = player1_status}
	RemovePlayerServerFretbarIterator \{fretbar_id = FretbarEvent
		id = player1_status}
	RemovePlayerServerFretbarIterator \{fretbar_id = CreateVocalMarker
		id = player1_status}
	ClearPlayerServerMessages
	LaunchGemEvent \{event = kill_objects}
	FlushPlayerServerMessages
	KillSpawnedScript \{name = GuitarEvent_MissedNote}
	KillSpawnedScript \{name = GuitarEvent_UnnecessaryNote}
	KillSpawnedScript \{name = GuitarEvent_HitNotes}
	KillSpawnedScript \{name = GuitarEvent_HitNote}
	KillSpawnedScript \{name = GuitarEvent_StarPowerOn}
	KillSpawnedScript \{name = GuitarEvent_StarPowerOff}
	KillSpawnedScript \{name = GuitarEvent_StarHitNote}
	KillSpawnedScript \{name = GuitarEvent_StarSequenceBonus}
	KillSpawnedScript \{name = GuitarEvent_StarMissNote}
	KillSpawnedScript \{name = GuitarEvent_WhammyOn}
	KillSpawnedScript \{name = GuitarEvent_WhammyOff}
	KillSpawnedScript \{name = GuitarEvent_StarWhammyOn}
	KillSpawnedScript \{name = GuitarEvent_StarWhammyOff}
	KillSpawnedScript \{name = GuitarEvent_Note_Window_Open}
	KillSpawnedScript \{name = GuitarEvent_Note_Window_Close}
	KillSpawnedScript \{name = GuitarEvent_crowd_poor_medium}
	KillSpawnedScript \{name = GuitarEvent_crowd_medium_good}
	KillSpawnedScript \{name = GuitarEvent_crowd_medium_poor}
	KillSpawnedScript \{name = GuitarEvent_crowd_good_medium}
	KillSpawnedScript \{name = GuitarEvent_CreateFirstGem}
	KillSpawnedScript \{name = highway_pulse_black}
	KillSpawnedScript \{name = GuitarEvent_HitNote_Spawned}
	KillSpawnedScript \{name = hit_note_fx}
	KillSpawnedScript \{name = Do_StarPower_StageFX}
	KillSpawnedScript \{name = Do_StarPower_Camera}
	KillSpawnedScript \{name = first_gem_fx}
	KillSpawnedScript \{name = gem_iterator}
	KillSpawnedScript \{name = gem_array_stepper}
	KillSpawnedScript \{name = gem_array_events}
	KillSpawnedScript \{name = gem_step}
	KillSpawnedScript \{name = gem_step_end}
	KillSpawnedScript \{name = Strum_iterator}
	KillSpawnedScript \{name = FretPos_iterator}
	KillSpawnedScript \{name = FretFingers_iterator}
	KillSpawnedScript \{name = Drumkit_anim_iterator}
	KillSpawnedScript \{name = WatchForStartPlaying_iterator}
	KillSpawnedScript \{name = Faceoff_Anim_iterator}
	Band_DisableTempoIterator
	KillSpawnedScript \{name = tempo_matching_iterator}
	KillSpawnedScript \{name = MomentCamera_PlayAnim_Spawned}
	KillSpawnedScript \{name = fretbar_update_tempo}
	KillSpawnedScript \{name = fretbar_update_hammer_on_tolerance}
	KillSpawnedScript \{name = check_note_hold}
	KillSpawnedScript \{name = net_check_note_hold}
	KillSpawnedScript \{name = gem_scroller}
	KillSpawnedScript \{name = button_checker}
	KillSpawnedScript \{name = check_buttons}
	notemap_deinit
	reset_score \{player_status = player1_status}
	reset_buffer = 2000
	if (($player1_status.part) = Vocals)
		ResetVocalHighwayIndexes \{player = 1}
		reset_buffer = 4000
	endif
	setslomo \{0.001}
	reset_song_time StartTime = ($practice_start_time - <reset_buffer>)
	SetArrayElement \{ArrayName = currently_holding
		GlobalArray
		index = 0
		newvalue = 0}
	SpawnScriptLater \{update_score_fast
		params = {
			player_status = player1_status
		}}
	spawnscriptnow gem_scroller params = {
		player = 1
		player_status = player1_status
		player_text = 'p1'
		training_mode = 0
		song_name = ($current_song)
		difficulty = ($player1_status.difficulty)
		difficulty2 = ($player2_status.difficulty)
		looping = 1
	}
	if (($player1_status.part) != Vocals)
		spawnscriptnow button_checker params = {
			player = 1
			player_status = player1_status
			player_text = 'p1'
			training_mode = 0
			song_name = ($current_song)
			difficulty = ($player1_status.difficulty)
			difficulty2 = ($player2_status.difficulty)
			looping = 1
		}
	endif
	calc_songscoreinfo \{player_status = player1_status}
	spawnscriptnow \{practice_update}
	Wait \{1
		gameframe}
	SongPause
	SetSeekPosition_Song position = ($practice_start_time - <reset_buffer>)
	SongUnPause
	setslomo \{$current_speedfactor}
	pausegh3
	Wait \{1
		gameframe}
	unpausegh3
	startrendering
endscript

script finish_practice_song 
	KillSpawnedScript \{name = practice_update}
	Wait \{60
		gameframes}
	if ($special_event_stage != 0)
		if ($current_special_event_num = 1)
			kill_gem_scroller
			if ($special_event_stage = 1)
				change \{special_event_stage = 2}
			endif
			generic_event_choose \{state = UIstate_special_event_win
				no_sound}
		elseif ($current_special_event_num = 2)
			kill_gem_scroller
			create_special_event_win_menu \{check_special_event_and_return}
			reset_special_event \{num = 2}
			generic_event_choose \{state = UIstate_special_event_win
				no_sound}
		endif
	else
		generic_event_choose \{state = uistate_song_breakdown
			data = {
				for_practice = 1
			}
			no_sound}
	endif
endscript

script practice_audio_filter 
endscript

script shut_down_practice_mode 
	KillSpawnedScript \{name = practice_update}
	if ($game_mode = training)
		SetSoundBussParams {Crowd = {vol = ($Default_BussSet.Crowd.vol)}}
	endif
endscript
practice_calibrate_speedfactor = 1.0

script practice_calibrate_speedfactor_store 
	change practice_calibrate_speedfactor = ($current_speedfactor)
	change \{current_speedfactor = 1.0}
	setslomo \{1.0}
endscript

script practice_calibrate_restart_song 
	change current_speedfactor = ($practice_calibrate_speedfactor)
	setslomo \{$current_speedfactor}
	practice_restart_song
endscript

script end_practice_song_slomo 
	change \{current_speedfactor = 1.0}
	setslomo \{$current_speedfactor}
	change \{structurename = PitchShiftSlow1
		pitch = 1.0}
endscript

script end_practice_song 
	printf \{qs("\Lend_practice_song")}
	end_practice_song_slomo
	spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
	change \{current_starttime = 0}
	kill_gem_scroller
endscript
