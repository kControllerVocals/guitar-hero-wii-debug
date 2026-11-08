
script Strum_iterator \{song_name = qs("\Ltest")
		difficulty = qs("\Leasy")
		array_type = qs("\Lsong")
		part = ''}
	strum_iterator_CFunc_setup
	begin
	if strum_iterator_CFunc
		break
	endif
	WaitOneGameFrame
	repeat
	strum_iterator_CFunc_cleanup
endscript

script FretPos_iterator 
	if NOT GotParam \{target}
		printf \{qs("\LFretPos_iterator called without target!")}
		return
	endif
	if ($disable_band = 1)
		return
	endif
	get_song_prefix song = <song_name>
	FormatText checksumname = event_array '%s_anim_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists name = <event_array> type = array
		printf \{qs("\LFRETPOS ANIMS DISABLED: No midi events found for this song")}
		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	array_size = (<array_size> / 2)
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_size>
		array_size = (<array_size> - (<array_entry> / 2))
		if (<array_size> = 0)
			return
		endif
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry>
		begin
		if TimeMarkerReached
			GetSongTimeMs time_offset = <time_offset>
			break
		endif
		WaitOneGameFrame
		repeat
		TimeMarkerReached_ClearParams
		DecompressNoteValue note_value = ($<event_array> [(<array_entry> + 1)])
		if CompositeObjectExists name = <target>
			if (<part> = guitar)
				if ((<note> >= 118) && (<note> <= 127))
					LaunchEvent type = pose_fret target = <target> data = {note = <note> note_length = <length>}
				endif
			else
				if ((<note> >= 101) && (<note> <= 110))
					LaunchEvent type = pose_fret target = <target> data = {note = <note> note_length = <length>}
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
	endif
endscript

script FretFingers_iterator \{part = ''}
	FretFingers_iterator_CFunc_Setup
	begin
	if FretFingers_iterator_CFunc
		break
	endif
	WaitOneGameFrame
	repeat
	FretFingers_iterator_CFunc_Cleanup
endscript

script WatchForStartPlaying_iterator 
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= 0)
		BandManager_EndIntroAnims
		BandManager_TurnOnAllArmAnims
		BandManager_StartAllFacialAnims
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script Faceoff_Anim_iterator \{song_name = qs("\Ltest")
		difficulty = qs("\Leasy")
		array_type = qs("\Lsong")
		part = ''}
	printf channel = faceoff qs(0xc6b303c3) a = <player>
	if NOT GotParam \{player}
		printf \{qs("\LFaceoff_Anim_iterator called without param 'player'!")}
		return
	endif
	get_song_prefix song = <song_name>
	get_notetrack_part_text player_status = <player_status> song_name = <song_name>
	FormatText checksumname = event_array '%s_%ifaceoff%p' s = <song_prefix> i = <part> p = <player_text> AddToStringLookup
	array_entry = 0
	GetArraySize $<event_array>
	if (<array_size> = 0)
		return
	endif
	GetSongTimeMs time_offset = <time_offset>
	begin
	if ((<time> - <skipleadin>) < ($<event_array> [<array_entry>]) [0])
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	array_size = (<array_size> - <array_entry>)
	if (<array_size> = 0)
		return
	endif
	if ($player1_status.part = Vocals)
		is_singing = true
	else
		is_singing = false
	endif
	begin
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= $<event_array> [<array_entry>] [0])
		break
	endif
	Wait \{1
		gameframe}
	repeat
	printstruct $<player_status>
	target = ($<player_status>.band_member)
	ExtendCRC <target> '_Info' out = info_struct
	change structurename = <info_struct> playing = true
	if (<is_singing> = true)
	else
		Band_ChangeFacialAnims name = <target> ff_anims = facial_anims_female_rocker_rocking Mf_anims = facial_anims_male_rocker_rocking
	endif
	play_time = ($<event_array> [<array_entry>] [1])
	stop_playing_time = (($<event_array> [<array_entry>] [0]) + ($<event_array> [<array_entry>] [1]))
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<time> >= <stop_playing_time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	change structurename = <info_struct> playing = false
	if (<is_singing> = true)
	else
		Band_ChangeFacialAnims name = <target> ff_anims = facial_anims_female_rocker Mf_anims = facial_anims_male_rocker
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script Drumkit_anim_iterator 
	<id> :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PrepareAnims params = {anims = [
			GH_Drum_Tom_1
			GH_Drum_Tom_2
			GH_Drum_Snare
			GH_Drum_Cymbal_1
			GH_Drum_Cymbal_2
			GH_Drum_Cymbal_3
			GH_Drum_Kick
			GH_Drum_Cymbal_HH_Open
			GH_Drum_Cymbal_HH_Closed
		] hold_list = [GH_Drum_Cymbal_HH_Closed]}
	ExtendCRC <id> '_Info' out = info_struct
	get_song_prefix song = <song_name>
	FormatText checksumname = event_array '%s_drums_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists name = <event_array> type = array
		printf \{qs("\LFRETPOS ANIMS DISABLED: No midi events found for this song")}
		return
	endif
	array_entry = 0
	GetArraySize $<event_array>
	array_size = (<array_size> / 2)
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_size>
		array_size = (<array_size> - (<array_entry> / 2))
		if (<array_size> = 0)
			return
		endif
		begin
		TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry>
		begin
		if TimeMarkerReached
			GetSongTimeMs time_offset = <time_offset>
			break
		endif
		WaitOneGameFrame
		repeat
		TimeMarkerReached_ClearParams
		if ($game_mode = p2_faceoff)
			<playing> = (($<info_struct>).playing)
		else
			<playing> = true
		endif
		if CompositeObjectExists name = <id>
			if (<playing> = true)
				DecompressNoteValue note_value = ($<event_array> [(<array_entry> + 1)])
				if (<note> >= 73 && <note> <= 82)
					switch (<note>)
						case 73
						<id> :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [0]) blend_period = $drum_kit_blend_time}
						case 75
						<id> :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [2]) blend_period = $drum_kit_blend_time}
						case 76
						<id> :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [3]) blend_period = $drum_kit_blend_time}
						case 78
						<id> :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [5]) blend_period = $drum_kit_blend_time}
						case 79
						<id> :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [6]) blend_period = $drum_kit_blend_time}
						case 80
						<id> :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [7]) blend_period = $drum_kit_blend_time}
						case 81
						<id> :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [8]) blend_period = $drum_kit_blend_time}
						case 82
						<id> :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [9]) blend_period = $drum_kit_blend_time}
					endswitch
				endif
			endif
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_size>
	endif
endscript

script drumkit_input_playanim 
	if ($g_in_tutorial = 1)
		return
	endif
	switch <drum_index>
		case 0
		Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [2]) blend_period = $drum_kit_blend_time}
		case 2
		Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [6]) blend_period = $drum_kit_blend_time}
		case 3
		Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [3]) blend_period = $drum_kit_blend_time}
		case 4
		Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [9]) blend_period = $drum_kit_blend_time}
		case 5
		Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [0]) blend_period = $drum_kit_blend_time}
	endswitch
endscript

script AE_DrumKit_play_hiHat 
	Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [5]) blend_period = $drum_kit_blend_time}
endscript

script AE_DrumKit_play_Snare 
endscript

script AE_DrumKit_play_Crash1 
	Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [8]) blend_period = $drum_kit_blend_time}
endscript

script AE_DrumKit_play_Crash2 
	Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [9]) blend_period = $drum_kit_blend_time}
endscript

script AE_DrumKit_play_Tom1 
	Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [3]) blend_period = $drum_kit_blend_time}
endscript

script AE_DrumKit_play_tom2 
	Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [2]) blend_period = $drum_kit_blend_time}
endscript

script AE_DrumKit_play_Ride 
	Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [7]) blend_period = $drum_kit_blend_time}
endscript

script AE_DrumKit_Stop_Crash1 
	Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [10]) blend_period = $drum_kit_blend_time}
endscript

script AE_DrumKit_Stop_Crash2 
	Drummer :Anim_Command target = DrumKit command = ApplyDrumKitDifference_PlayAnim params = {Anim = ($drumkit_anims [11]) blend_period = $drum_kit_blend_time}
endscript

script handle_strum_event 
	Obj_GetID
	wait_for_correct_frame_obj id = <ObjID>
	Obj_KillSpawnedScript \{name = hero_strum_guitar}
	Obj_SpawnScriptNow hero_strum_guitar params = {note_length = <note_length>}
endscript

script handle_missed_strum_event 
	Obj_KillSpawnedScript \{name = hero_strum_guitar}
	Obj_SpawnScriptNow hero_strum_guitar params = {note_length = <note_length>}
endscript

script handle_start_playing 
	printf \{channel = AnimInfo
		qs(0x0d2e1821)}
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	if (<info_struct>.stance = intro || <info_struct>.stance = intro_smstg)
		handle_change_stance \{stance = Stance_A}
	endif
endscript

script handle_fret_event 
	Obj_GetID
	wait_for_correct_frame_obj id = <ObjID>
	handle_fret_event_cfunc note = <note>
endscript

script handle_finger_event 
	Obj_GetID
	wait_for_correct_frame_obj id = <ObjID>
	hero_play_chord chord = <chord>
endscript

script handle_missed_note 
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	if ($<info_struct>.playing_missed_note = false)
		change structurename = <info_struct> playing_missed_note = true
	endif
endscript

script handle_hit_note 
	Obj_GetID
	handle_hit_note_CFunc
endscript

script handle_change_stance \{Speed = 1.0}
	Obj_GetID
	wait_for_correct_frame_obj id = <ObjID>
	ExtendCRC <ObjID> '_Info' out = info_struct
	display_debug_info = false
	if (should_display_debug_info)
		display_debug_info = true
	endif
	if GotParam \{no_wait}
		anim_set = ($<info_struct>.anim_set)
		old_stance = ($<info_struct>.stance)
		if play_stance_transition_cfunc anim_set = <anim_set> old_stance = <old_stance> new_stance = <stance>
			hero_play_anim Anim = <anim_to_run> Speed = <Speed>
			hero_wait_until_anim_finished
		else
		endif
		change structurename = <info_struct> stance = <stance>
		change structurename = <info_struct> next_stance = <stance>
		if (<display_debug_info> = true)
			printf channel = AnimInfo qs("\L%a stance is immediately changing to %b ....") a = <ObjID> b = <stance>
		endif
		if (<ObjID> = Guitarist || <ObjID> = bassist)
			if (<stance> = intro || <stance> = intro_smstg || <stance> = stance_frontend || <stance> = stance_frontend_guitar)
				change structurename = <info_struct> disable_arms = 2
				change structurename = <info_struct> next_anim_disable_arms = 2
			else
				change structurename = <info_struct> disable_arms = 0
				change structurename = <info_struct> next_anim_disable_arms = 0
			endif
			Obj_SwitchScript \{guitarist_idle}
		else
			Obj_SwitchScript \{BandMember_Idle}
		endif
	else
		if (<display_debug_info> = true)
			printf channel = AnimInfo qs("\L%a is queuing stance change to %b.............") a = <ObjID> b = <stance>
		endif
		change structurename = <info_struct> next_stance = <stance>
		if (<ObjID> = Guitarist || <ObjID> = bassist)
			if (<stance> = intro || <stance> = intro_smstg || <stance> = stance_frontend || <stance> = stance_frontend_guitar)
				change structurename = <info_struct> next_anim_disable_arms = 2
			else
				change structurename = <info_struct> next_anim_disable_arms = 0
			endif
		endif
	endif
	return
endscript

script queue_change_stance 
	Obj_GetID
	ExtendCRC <ObjID> '_Info' out = info_struct
	change structurename = <info_struct> next_stance = <stance>
endscript

script handle_play_anim \{blend_time = 0.2}
	Obj_GetID
	wait_for_correct_frame_obj id = <ObjID>
	ExtendCRC <ObjID> '_Info' out = info_struct
	anim_set = ($<info_struct>.anim_set)
	stance = ($<info_struct>.stance)
	display_debug_info = false
	if (should_display_debug_info)
		display_debug_info = true
	endif
	if GotParam \{no_wait}
		if (<display_debug_info> = true)
			printf channel = AnimInfo qs("\L%a will immediately start the %b anim........") a = <ObjID> b = <Anim>
		endif
		change structurename = <info_struct> current_anim = <Anim>
		change structurename = <info_struct> next_anim = none
		if GotParam \{repeat_count}
			change structurename = <info_struct> anim_repeat_count = <repeat_count>
		else
			change structurename = <info_struct> anim_repeat_count = 1
		endif
		if GotParam \{Cycle}
			change structurename = <info_struct> cycle_anim = true
		else
			change structurename = <info_struct> cycle_anim = false
		endif
		if (<name> = Guitarist || <name> = bassist)
			if GotParam \{disable_auto_arms}
				change structurename = <info_struct> disable_arms = 2
			elseif GotParam \{disable_auto_strum}
				change structurename = <info_struct> disable_arms = 1
			else
				change structurename = <info_struct> disable_arms = 0
			endif
		endif
		Obj_KillSpawnedScript \{name = hero_play_adjusting_random_anims}
		Obj_SpawnScriptNow hero_play_adjusting_random_anims params = {Anim = <Anim> blend_time = <blend_time>}
	else
		if (<display_debug_info> = true)
			if (<info_struct>.next_anim != none)
				printf channel = AnimInfo qs("\L******* %a is replacing queued anim %b with %c ******* ") a = <ObjID> b = (<info_struct>.next_anim) c = <Anim>
			else
				printf channel = AnimInfo qs("\L%a is queueing the %b anim........") a = <ObjID> b = <Anim>
			endif
		endif
		change structurename = <info_struct> next_anim = <Anim>
		if GotParam \{repeat_count}
			change structurename = <info_struct> next_anim_repeat_count = <repeat_count>
		else
			change structurename = <info_struct> next_anim_repeat_count = 1
		endif
		if GotParam \{Cycle}
			change structurename = <info_struct> cycle_next_anim = true
		else
			change structurename = <info_struct> cycle_next_anim = false
		endif
		if (<name> = Guitarist || <name> = bassist)
			if GotParam \{disable_auto_arms}
				change structurename = <info_struct> next_anim_disable_arms = 2
			elseif GotParam \{disable_auto_strum}
				change structurename = <info_struct> next_anim_disable_arms = 1
			else
				change structurename = <info_struct> next_anim_disable_arms = 0
			endif
		endif
	endif
endscript

script Output_Camera_Sync_Warnings 
	printf \{qs("\LOutput_Camera_Sync_Warnings")}
	printf \{qs("\LCurrent song %a")
		a = $current_song}
	get_song_prefix song = ($current_song)
	FormatText checksumname = event_array '%s_cameras_notes' s = <song_prefix> AddToStringLookup
	Sync_Cameras_To_Performance song_name = ($current_song) Camera_Array = <event_array> output_results = 1
endscript

script Print_Camera_Sync_Warning 
	if NOT GotParam \{output_results}
		return
	endif
	if (<output_results> = 1)
		TextOutput text = <warning>
	endif
	printf channel = camera_warnings <warning>
endscript

script Show_PlayClip_Time 
	if (<playclip_time_displayed> = 1)
		return
	endif
	if (<end_frame> = -1)
		FormatText TextName = warning qs("%a: Band_PlayClip") a = <next_anim_time>
	else
		length_in_frames = (<end_frame> - <start_frame>)
		FormatText TextName = warning qs("%a: Band_PlayClip start-%b end-%c (length %d)  ") a = <next_anim_time> b = <start_frame> c = <end_frame> d = <length_in_frames>
	endif
	Print_Camera_Sync_Warning <...>
	return \{playclip_time_displayed = 1}
endscript

script Show_Camera_Warnings_Found 
	if (<warnings> = 0)
		text = qs("\L  no problems found")
		if (<output_results> = 1)
			TextOutput text = <text>
		endif
		printf channel = camera_warnings <text>
	endif
endscript

script Sync_Cameras_To_Performance \{output_results = 0}
	if NOT GotParam \{Camera_Array}
		return
	endif
	if NOT GlobalExists name = <Camera_Array> type = array
		return
	endif
	GetArraySize $<Camera_Array>
	if (<array_size> = 0)
		printf \{channel = clip
			qs("\Lcamera array is empty!")}
		return
	endif
	camera_array_size = <array_size>
	get_song_prefix song = <song_name>
	FormatText checksumname = anim_array '%s_performance' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists name = <anim_array> type = array
		return
	endif
	GetArraySize $<anim_array>
	if (<array_size> = 0)
		printf \{channel = clip
			qs("\Lperformance array is empty!")}
		return
	endif
	anim_array_size = <array_size>
	camera_index = 0
	next_camera_time = 0
	anim_index = 0
	next_anim_time = 0
	last_end_frame_time = -1
	last_camera_adjusted_index = -1
	Print_Camera_Sync_Warning warning = qs("\LCAMERA WARNINGS:") output_results = <output_results>
	warnings = 0
	THRESHOLD = $camera_snap_threshold
	begin
	start_frame = 0
	end_frame = -1
	playclip_time_displayed = 0
	begin
	if ((($<anim_array> [<anim_index>]).Scr) = band_playclip)
		next_anim_time = (($<anim_array> [<anim_index>]).time)
		params = (($<anim_array> [<anim_index>]).params)
		clip = (<params>.clip)
		if StructureContains Structure = <params> name = startFrame
			start_frame = (<params>.startFrame)
		endif
		if StructureContains Structure = <params> name = EndFrame
			end_frame = (<params>.EndFrame)
		endif
		break
	endif
	anim_index = (<anim_index> + 1)
	if (<anim_index> = <anim_array_size>)
		Show_Camera_Warnings_Found output_results = <output_results> warnings = <warnings>
		return
	endif
	repeat
	saved_camera_index = <camera_index>
	begin
	next_camera_time = ($<Camera_Array> [<camera_index>])
	time_diff = (<next_anim_time> - <next_camera_time>)
	if (<time_diff> < 0)
		time_diff = (<time_diff> * -1)
	endif
	if (<time_diff> < <THRESHOLD>)
		if (<time_diff> = 0)
		else
			if (<camera_index> = <last_camera_adjusted_index>)
				Show_PlayClip_Time {
					output_results = <output_results>
					playclip_time_displayed = <playclip_time_displayed>
					start_frame = <start_frame>
					end_frame = <end_frame>
					next_anim_time = <next_anim_time>
				}
				FormatText \{TextName = warning
					qs("\L  The start of this clip is not aligned with the end of the previous clip!")}
				Print_Camera_Sync_Warning warning = <warning> output_results = <output_results>
				warnings = (<warnings> + 1)
			endif
			camera_time_difference = (<next_anim_time> - <next_camera_time>)
			SetArrayElement ArrayName = <Camera_Array> GlobalArray index = <camera_index> newvalue = <next_anim_time>
			DecompressNoteValue note_value = ($<Camera_Array> [(<camera_index> + 1)])
			length = (<length> - <camera_time_difference>)
			CompressNoteValue length = <length> note = <note> velocity = <velocity>
			SetArrayElement ArrayName = <Camera_Array> GlobalArray index = (<camera_index> + 1) newvalue = <note_value>
			last_camera_adjusted_index = <camera_index>
		endif
		break
	endif
	camera_index = (<camera_index> + 2)
	if (<camera_index> >= <camera_array_size>)
		Show_PlayClip_Time {
			output_results = <output_results>
			playclip_time_displayed = <playclip_time_displayed>
			start_frame = <start_frame>
			end_frame = <end_frame>
			next_anim_time = <next_anim_time>
		}
		FormatText TextName = warning qs("\L  No camera found within %ams of start of clip!") a = <THRESHOLD>
		Print_Camera_Sync_Warning warning = <warning> output_results = <output_results>
		warnings = (<warnings> + 1)
		break
	endif
	repeat
	camera_index = <saved_camera_index>
	if (<end_frame> != -1)
		length_in_frames = (<end_frame> - <start_frame>)
		length_in_ms = ((<length_in_frames> / 30.0) * 1000)
		CastToInteger \{length_in_ms}
		end_time = (<next_anim_time> + <length_in_ms>)
		if check_for_short_anims_in_clip clip = <clip> endtime = (<length_in_frames> / 30.0) <...>
			playclip_time_displayed = 1
			warnings = (<warnings> + 1)
		endif
		begin
		next_camera_time = ($<Camera_Array> [<camera_index>])
		time_diff = (<end_time> - <next_camera_time>)
		if (<time_diff> < 0)
			time_diff = (<time_diff> * -1)
		endif
		if (<time_diff> < <THRESHOLD>)
			if (<time_diff> = 0)
			else
				camera_time_difference = (<end_time> - <next_camera_time>)
				SetArrayElement ArrayName = <Camera_Array> GlobalArray index = <camera_index> newvalue = <end_time>
				DecompressNoteValue note_value = ($<Camera_Array> [(<camera_index> + 1)])
				length = (<length> - <camera_time_difference>)
				CompressNoteValue length = <length> note = <note> velocity = <velocity>
				SetArrayElement ArrayName = <Camera_Array> GlobalArray index = (<camera_index> + 1) newvalue = <note_value>
				last_camera_adjusted_index = <camera_index>
			endif
			break
		endif
		camera_index = (<camera_index> + 2)
		if (<camera_index> >= <camera_array_size>)
			Show_PlayClip_Time {
				output_results = <output_results>
				playclip_time_displayed = <playclip_time_displayed>
				start_frame = <start_frame>
				end_frame = <end_frame>
				next_anim_time = <next_anim_time>
			}
			FormatText TextName = warning qs("  No camera found within %ams of end of clip!") a = <THRESHOLD>
			Print_Camera_Sync_Warning warning = <warning> output_results = <output_results>
			warnings = (<warnings> + 1)
			break
		endif
		repeat
		camera_index = <saved_camera_index>
	else
	endif
	camera_index = <saved_camera_index>
	anim_index = (<anim_index> + 1)
	if (<anim_index> = <anim_array_size>)
		Show_Camera_Warnings_Found output_results = <output_results> warnings = <warnings>
		return
	endif
	repeat
endscript
