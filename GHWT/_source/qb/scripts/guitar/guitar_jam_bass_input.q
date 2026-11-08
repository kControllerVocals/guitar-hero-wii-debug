jam_input_current_bass = null
jam_sustain_bass = 0
jam_bass_pan = 0

script jam_input_bass_recording controller = ($player1_status.controller) spawn_id = jam_input_spawns select_player = 1 hammer_on = 1
	mid_up_strum = 0
	mid_down_strum = 0
	spawnscriptnow jam_input_bass_tilt id = <spawn_id> params = {controller = <controller> player = <select_player>}
	jam_input_add_player_server player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_bass_per_frame 
	instrument_controls = [enabled]
	if ($game_mode = training)
		if ScreenElementExists \{id = jam_band_container}
			jam_band_container :GetTags
		elseif ScreenElementExists \{id = jam_studio_element}
			jam_studio_element :GetTags
		endif
	endif
	if ArrayContains array = <instrument_controls> contains = enabled
		if NOT (<touch_strum> = 1)
			do_it = 0
			if ($jam_advanced_record = 0)
				<do_it> = 1
			endif
			if (ControllerHasDpad controller = <controller>)
				<do_it> = 1
			endif
			if NOT ControllerPressed select <controller>
				<do_it> = 1
			endif
			if (<do_it> = 1)
				if ControllerPressed up <controller>
					if (<mid_up_strum> = 0)
						KillSpawnedScript \{name = jam_input_bass_hopo}
						jam_input_bass_strum_recording spawn_id = <spawn_id> player = <select_player> hammer_on = <hammer_on> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_bass id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
					<mid_up_strum> = (<mid_up_strum> + 1)
				else
					<mid_up_strum> = 0
				endif
				if ControllerPressed down <controller>
					if (<mid_down_strum> = 0)
						KillSpawnedScript \{name = jam_input_bass_hopo}
						jam_input_bass_strum_recording spawn_id = <spawn_id> player = <select_player> hammer_on = <hammer_on> hold_pattern = <hold_pattern> up_strum = 0 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_bass id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
					<mid_down_strum> = (<mid_down_strum> + 1)
				else
					<mid_down_strum> = 0
				endif
			endif
		else
			KillSpawnedScript \{name = jam_input_bass_hopo}
			jam_input_bass_strum_recording spawn_id = <spawn_id> player = <select_player> hammer_on = <hammer_on> hold_pattern = <hold_pattern> slap = 1 up_strum = 0 stop_sound = 1 controller = <controller> select_player = <select_player>
			spawnscriptnow jam_input_stop_sound_bass id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
		endif
		jam_input_whammy player = <select_player> controller = <controller>
	endif
	if (($jam_advanced_record) = 0)
		jam_check_simple_record_input controller = <controller> select_player = <select_player>
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript

script jam_input_bass_per_frame_no_strum 
	if ControllerPressed up <controller>
		<mid_up_strum> = (<mid_up_strum> + 1)
	else
		<mid_up_strum> = 0
	endif
	if ControllerPressed down <controller>
		<mid_down_strum> = (<mid_down_strum> + 1)
	else
		<mid_down_strum> = 0
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript

script jam_input_stop_sound_bass select_player = 1 controller = ($player1_status.controller)
	Wait \{$jam_input_strum_wait
		gameframes}
	GetHeldPattern controller = <controller> player = <select_player> nobrokenstring
	jam_input_get_single_note pattern = <hold_pattern>
	bass_hold_pattern = <single_note_pattern>
	current_bass = $jam_input_current_bass
	begin
	GetHeldPattern controller = <controller> player = <select_player> nobrokenstring
	jam_input_get_single_note pattern = <hold_pattern>
	<hold_pattern> = <single_note_pattern>
	if NOT (<bass_hold_pattern> = <hold_pattern>)
		if ((<hold_pattern> < <bass_hold_pattern>) || (<bass_hold_pattern> || <hold_pattern>) || <hold_pattern> = 1048576)
			jam_update_falling_gem_sustain \{sustain_global = jam_sustain_bass
				stop = 1}
			break
		endif
	endif
	if NOT issoundplaying \{$jam_input_current_bass}
		jam_update_falling_gem_sustain \{sustain_global = jam_sustain_bass
			stop = 1}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	StopSound \{$jam_input_current_bass
		fade_type = linear
		fade_time = $jam_fade_time}
	if ($jam_highway_step_recording = 0)
	endif
endscript

script fret_noise_bass 
	RandomNoRepeat (
		@ SoundEvent \{event = Jam_Fret_Noise_bass_short}
		@ 
		@ 
		@ SoundEvent \{event = Jam_Fret_Noise_bass_medium}
		@ 
		@ 
		@ 
		)
endscript

script jam_input_bass_strum_recording controller = ($player2_status.controller) spawn_id = jam_input_spawns hammer_on = 1 slap = 0
	final_note_sample = null
	note_type = 0
	if NOT (<slap> = 1)
		if ControllerPressed select <controller>
			<note_type> = 3
		endif
	else
		<note_type> = 3
	endif
	strum_type = ($bassist_info.strum)
	ExtendCRC <strum_type> '_Strums' out = strum_anims
	GetArraySize ($<strum_anims>.Med)
	GetRandomValue name = newindex Integer a = 0 b = (<array_size> - 1)
	strum_anim = ($<strum_anims>.Med [<newindex>])
	band_play_strum_anim name = bassist Anim = <strum_anim> BlendDuration = $strum_blend_time
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_bass}
	scale_index = ($jam_track_scaleindex [2])
	if ((<scale_index> = 0) || (<scale_index> = 4))
		if (<hold_pattern> = 17)
			jam_get_sample player = <select_player> button = 6 sample_type = <note_type> tilt = ($jam_tilt_bass)
		endif
		if NOT (<final_note_sample> = null)
			<sustain> = 1
			jam_input_bass_play_note <...>
			return
		endif
	endif
	if (<hold_pattern> && 1)
		<hold_pattern> = 1
		jam_get_sample player = <select_player> button = 5 sample_type = <note_type> tilt = ($jam_tilt_bass)
	elseif (<hold_pattern> && 16)
		<hold_pattern> = 16
		jam_get_sample player = <select_player> button = 4 sample_type = <note_type> tilt = ($jam_tilt_bass)
	elseif (<hold_pattern> && 256)
		<hold_pattern> = 256
		jam_get_sample player = <select_player> button = 3 sample_type = <note_type> tilt = ($jam_tilt_bass)
	elseif (<hold_pattern> && 4096)
		<hold_pattern> = 4096
		jam_get_sample player = <select_player> button = 2 sample_type = <note_type> tilt = ($jam_tilt_bass)
	elseif (<hold_pattern> && 65536)
		<hold_pattern> = 65536
		jam_get_sample player = <select_player> button = 1 sample_type = <note_type> tilt = ($jam_tilt_bass)
	elseif (<hold_pattern> = 1048576)
		<hold_pattern> = 1048576
		jam_get_sample player = <select_player> button = 0 sample_type = <note_type> tilt = ($jam_tilt_bass)
	endif
	if NOT (<final_note_sample> = null)
		<sustain> = 1
		jam_input_bass_play_note <...>
	endif
endscript

script jam_input_bass_hopo spawn_id = jam_input_spawns controller = ($player2_status.controller)
	if ControllerPressed select <controller>
		return
	endif
	final_note_sample = null
	if (<hold_pattern> && 1)
		<hold_pattern> = 1
		jam_get_sample player = <select_player> button = 5 tilt = ($jam_tilt_bass) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 5 tilt = ($jam_tilt_bass) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 16)
		<hold_pattern> = 16
		jam_get_sample player = <select_player> button = 4 tilt = ($jam_tilt_bass) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 4 tilt = ($jam_tilt_bass) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 256)
		<hold_pattern> = 256
		jam_get_sample player = <select_player> button = 3 tilt = ($jam_tilt_bass) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 3 tilt = ($jam_tilt_bass) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 4096)
		<hold_pattern> = 4096
		jam_get_sample player = <select_player> button = 2 tilt = ($jam_tilt_bass) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 2 tilt = ($jam_tilt_bass) hopo = 2
		<pulloff_sample> = <final_note_sample>
	elseif (<hold_pattern> && 65536)
		<hold_pattern> = 65536
		jam_get_sample player = <select_player> button = 1 tilt = ($jam_tilt_bass) hopo = 1
		<hammer_sample> = <final_note_sample>
		jam_get_sample player = <select_player> button = 1 tilt = ($jam_tilt_bass) hopo = 2
		<pulloff_sample> = <final_note_sample>
	endif
	if NOT (<final_note_sample> = null)
		if (<hammer> = 1)
			<final_note_sample> = <hammer_sample>
			<note_type> = 1
		else
			<final_note_sample> = <pulloff_sample>
			<note_type> = 2
		endif
		<hopo_note> = 1
		<sustain> = 1
		jam_input_bass_play_note <...>
		spawnscriptnow jam_input_stop_sound_bass id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
	endif
endscript

script jam_input_bass_get_current_note 
	fret_anims = ($bassist_info.fret_anims)
	finger_anims = ($bassist_info.finger_anims)
	scale_index = ($jam_track_scaleindex [2])
	if ((<scale_index> = 0) || (<scale_index> = 4))
		if (<hold_pattern> = 17)
			jam_get_sample player = <player> button = 6 tilt = ($jam_tilt_bass) get_text = 1
			if GotParam \{single_note_text}
				return single_note_text = <single_note_text>
			else
				return \{single_note_text = qs("err")}
			endif
		endif
	endif
	if (<hold_pattern> && 1)
		jam_get_sample player = <player> button = 5 tilt = ($jam_tilt_bass) get_text = 1
		band_play_finger_anim name = bassist Anim = ($<finger_anims>.green)
		band_play_fret_anim name = bassist Anim = ($<fret_anims>.track_93)
	elseif (<hold_pattern> && 16)
		jam_get_sample player = <player> button = 4 tilt = ($jam_tilt_bass) get_text = 1
		band_play_finger_anim name = bassist Anim = ($<finger_anims>.green_red)
		band_play_fret_anim name = bassist Anim = ($<fret_anims>.track_94)
	elseif (<hold_pattern> && 256)
		jam_get_sample player = <player> button = 3 tilt = ($jam_tilt_bass) get_text = 1
		band_play_finger_anim name = bassist Anim = ($<finger_anims>.Yellow)
		band_play_fret_anim name = bassist Anim = ($<fret_anims>.track_95)
	elseif (<hold_pattern> && 4096)
		jam_get_sample player = <player> button = 2 tilt = ($jam_tilt_bass) get_text = 1
		band_play_finger_anim name = bassist Anim = ($<finger_anims>.blue_orange)
		band_play_fret_anim name = bassist Anim = ($<fret_anims>.track_96)
	elseif (<hold_pattern> && 65536)
		jam_get_sample player = <player> button = 1 tilt = ($jam_tilt_bass) get_text = 1
		band_play_finger_anim name = bassist Anim = ($<finger_anims>.green_blue)
		band_play_fret_anim name = bassist Anim = ($<fret_anims>.track_97)
	elseif (<hold_pattern> = 1048576)
		jam_get_sample player = <player> button = 0 tilt = ($jam_tilt_bass) get_text = 1
		band_play_finger_anim name = bassist Anim = ($<finger_anims>.green_orange)
	endif
	if GotParam \{single_note_text}
		return single_note_text = <single_note_text>
	else
		return \{single_note_text = qs("err")}
	endif
endscript

script jam_input_bass_tilt 
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [2])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if StructureContains Structure = <chosen_scale> chromatic
		<chromatic> = 1
	else
		<chromatic> = 0
	endif
	begin
	if GuitarGetAnalogueInfo controller = <controller>
		<spc_v_dist> = <RightY>
		jam_calc_line_rot player = <player> spc_v_dist = <spc_v_dist>
		if (<chromatic> = 0)
			if (<line_rot> <= 30)
				change \{jam_tilt_bass = 0}
			else
				change \{jam_tilt_bass = 1}
			endif
		else
			if (<line_rot> <= 1)
				change \{jam_tilt_bass = 0}
			elseif (<line_rot> > 1 && <line_rot> < 50)
				change \{jam_tilt_bass = 1}
			elseif (<line_rot> > 50 && <line_rot> < 99)
				change \{jam_tilt_bass = 2}
			else
				change \{jam_tilt_bass = 3}
			endif
		endif
	else
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_input_bass_play_note \{sustain = 0
		playback = 0}
	KillSpawnedScript \{name = jam_input_stop_sound_bass}
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_bass
		stop = 1}
	StopSound \{$jam_input_current_bass
		fade_type = linear
		fade_time = 0.05}
	StopSoundEvent \{Jam_Fret_Noise_bass_short
		fade_time = 0.2
		fade_type = linear}
	StopSoundEvent \{Jam_Fret_Noise_bass_medium
		fade_time = 0.2
		fade_type = linear}
	switch <note_type>
		case 0
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 5 buss = JamMode_Bass release_function = linear release_time = 10.0 release_length = 0.02 slot = 6
		case 1
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 5 buss = JamMode_Bass attack_time = 0.055 attack_function = flat_middle release_function = linear release_time = 10.0 release_length = 0.02 slot = 6 ps2_attack = 1
		case 2
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 5 buss = JamMode_Bass attack_time = 0.07 attack_function = flat_middle release_function = linear release_time = 10.0 release_length = 0.02 slot = 6 ps2_attack = 2
		case 3
		PlaySound <final_note_sample> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 5 buss = JamMode_Bass release_function = linear release_time = 10.0 release_length = 0.02 slot = 6
	endswitch
	change jam_input_current_bass = <final_note_sample>
	if ($jam_tutorial_status = active)
		BroadcastEvent type = jam_tutorial_bass_strum data = {hold_pattern = <hold_pattern> tilt = ($jam_tilt_bass) note_type = <note_type>}
	endif
	if (<playback> = 0)
		spawnscriptnow jam_fretboard_add_note params = {player = <select_player> gem_pattern = <hold_pattern> sustain = jam_sustain_bass}
		<pulsate_id> = pulsate_bass_spawn_id
		KillSpawnedScript id = <pulsate_id>
		spawnscriptnow id = <pulsate_id> jam_band_pulsate_speaker_head params = {instrument = 2 spawn_id = <pulsate_id>}
		jam_record_note <...>
	endif
	BroadcastEvent \{type = jam_note_hit}
endscript
