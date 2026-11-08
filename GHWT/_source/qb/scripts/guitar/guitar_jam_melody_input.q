jam_input_current_melody = null
jam_input_current_melody_atk = null
jam_sustain_melody = 0
jam_melody_touch_count = 0
jam_melody_current_pattern = 0
jam_melody_last_pattern = 0
jam_key_volume = 100
jam_melody_pan = 0

script jam_input_melody controller = ($player1_status.controller) spawn_id = jam_input_spawns
	mid_up_strum = 0
	mid_down_strum = 0
	change \{jam_melody_touch_count = 0}
	spawnscriptnow jam_input_melody_tilt id = <spawn_id> params = {controller = <controller> player = <select_player>}
	jam_input_add_player_server player = <select_player> spawn_id = <spawn_id>
endscript

script jam_input_melody_per_frame 
	instrument_controls = [enabled]
	if ($game_mode = training)
		if ScreenElementExists \{id = jam_band_container}
			jam_band_container :GetTags
		elseif ScreenElementExists \{id = jam_studio_element}
			jam_studio_element :GetTags
		endif
	endif
	if ArrayContains array = <instrument_controls> contains = enabled
		<mid_up_strum> = 0
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
			if NOT (<hold_pattern> = $jam_melody_current_pattern)
				change jam_melody_current_pattern = <hold_pattern>
				<Play> = 0
				if (<hold_pattern> && 1)
					if NOT ($jam_melody_last_pattern = 1)
						<Play> = 1
					elseif ($jam_melody_last_pattern > <hold_pattern>)
						<Play> = 1
					endif
					if (<Play> = 1)
						change \{jam_melody_last_pattern = 1}
						jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
				elseif (<hold_pattern> && 16)
					if NOT ($jam_melody_last_pattern = 16)
						<Play> = 1
					elseif ($jam_melody_last_pattern > <hold_pattern>)
						<Play> = 1
					endif
					if (<Play> = 1)
						change \{jam_melody_last_pattern = 16}
						jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
				elseif (<hold_pattern> && 256)
					if NOT ($jam_melody_last_pattern = 256)
						<Play> = 1
					elseif ($jam_melody_last_pattern > <hold_pattern>)
						<Play> = 1
					endif
					if (<Play> = 1)
						change \{jam_melody_last_pattern = 256}
						jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
				elseif (<hold_pattern> && 4096)
					if NOT ($jam_melody_last_pattern = 4096)
						<Play> = 1
					elseif ($jam_melody_last_pattern > <hold_pattern>)
						<Play> = 1
					endif
					if (<Play> = 1)
						change \{jam_melody_last_pattern = 4096}
						jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
				elseif (<hold_pattern> && 65536)
					if NOT ($jam_melody_last_pattern = 65536)
						<Play> = 1
					elseif ($jam_melody_last_pattern > <hold_pattern>)
						<Play> = 1
					endif
					if (<Play> = 1)
						change \{jam_melody_last_pattern = 65536}
						jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = <hold_pattern> up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
						spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
					endif
				else
					change \{jam_melody_last_pattern = 0}
				endif
			endif
		endif
		if ControllerMake up <controller>
			jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = 1048576 up_strum = 1 stop_sound = 1 controller = <controller> select_player = <select_player>
			spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
		elseif ControllerMake down <controller>
			jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = 1048576 up_strum = 0 stop_sound = 1 controller = <controller> select_player = <select_player>
			spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {select_player = <select_player> controller = <controller>}
		elseif (<touch_strum> = 1)
			if ($jam_melody_touch_count = 0)
				change jam_melody_touch_count = ($jam_melody_touch_count + 1)
				jam_input_melody_strum_recording spawn_id = <spawn_id> player = <select_player> hold_pattern = 1048576 up_strum = 0 stop_sound = 1 controller = <controller> select_player = <select_player>
				change \{jam_melody_last_pattern = 1048576}
				spawnscriptnow jam_input_stop_sound_melody id = <spawn_id> params = {check_touch = 1 select_player = <select_player> controller = <controller>}
			else
				change jam_melody_touch_count = ($jam_melody_touch_count + 1)
			endif
		else
			change \{jam_melody_current_pattern = 0}
			change \{jam_melody_touch_count = 0}
		endif
	endif
	jam_input_whammy player = <select_player> controller = <controller>
	if (($jam_advanced_record) = 0)
		jam_check_simple_record_input controller = <controller> select_player = <select_player>
	endif
	return mid_up_strum = <mid_up_strum> mid_down_strum = <mid_down_strum>
endscript

script jam_input_stop_sound_melody \{select_player = 1
		check_touch = 0}
	Wait \{$jam_input_strum_wait
		gameframes}
	GetHeldPattern controller = <controller> player = <select_player> nobrokenstring
	melody_hold_pattern = <hold_pattern>
	current_melody = $jam_input_current_melody
	<open_strum> = 0
	if (<melody_hold_pattern> = 1048576)
		<open_strum> = 1
	endif
	begin
	if (<open_strum> = 0)
		GetHeldPattern controller = <controller> player = <select_player> nobrokenstring
		if NOT (<melody_hold_pattern> && <hold_pattern>)
			jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
				stop = 1}
			break
		endif
	else
		if (<check_touch> = 0)
			if ControllerPressed up <controller>
				<holding_dir> = 1
			elseif ControllerPressed down <controller>
				<holding_dir> = 1
			else
				<holding_dir> = 0
			endif
			if (<holding_dir> = 0)
				jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
					stop = 1}
				break
			endif
		else
			if ($jam_melody_touch_count = 0)
				jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
					stop = 1}
				break
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	jam_input_melody_stop_sound
endscript

script jam_input_melody_stop_sound 
	StopSound \{$melody_sample}
endscript

script jam_input_melody_strum_recording \{spawn_id = jam_input_spawns}
	final_note_sample = null
	note_type = 0
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody}
	if (<hold_pattern> && 1)
		<hold_pattern> = 1
		jam_get_sample player = <select_player> button = 5 sample_type = <note_type> tilt = ($jam_tilt_melody)
	elseif (<hold_pattern> && 16)
		<hold_pattern> = 16
		jam_get_sample player = <select_player> button = 4 sample_type = <note_type> tilt = ($jam_tilt_melody)
	elseif (<hold_pattern> && 256)
		<hold_pattern> = 256
		jam_get_sample player = <select_player> button = 3 sample_type = <note_type> tilt = ($jam_tilt_melody)
	elseif (<hold_pattern> && 4096)
		<hold_pattern> = 4096
		jam_get_sample player = <select_player> button = 2 sample_type = <note_type> tilt = ($jam_tilt_melody)
	elseif (<hold_pattern> && 65536)
		<hold_pattern> = 65536
		jam_get_sample player = <select_player> button = 1 sample_type = <note_type> tilt = ($jam_tilt_melody)
	elseif (<hold_pattern> = 1048576)
		<hold_pattern> = 1048576
		jam_get_sample player = <select_player> button = 0 sample_type = <note_type> tilt = ($jam_tilt_melody)
	endif
	if NOT (<final_note_sample> = null)
		<sustain> = 1
		jam_input_melody_play_note <...>
	endif
	return hold_pattern = <hold_pattern>
endscript

script jam_input_melody_get_current_note 
	if (<hold_pattern> && 1)
		jam_get_sample player = <player> button = 5 tilt = ($jam_tilt_melody) get_text = 1
	elseif (<hold_pattern> && 16)
		jam_get_sample player = <player> button = 4 tilt = ($jam_tilt_melody) get_text = 1
	elseif (<hold_pattern> && 256)
		jam_get_sample player = <player> button = 3 tilt = ($jam_tilt_melody) get_text = 1
	elseif (<hold_pattern> && 4096)
		jam_get_sample player = <player> button = 2 tilt = ($jam_tilt_melody) get_text = 1
	elseif (<hold_pattern> && 65536)
		jam_get_sample player = <player> button = 1 tilt = ($jam_tilt_melody) get_text = 1
	elseif (<hold_pattern> = 1048576)
		jam_get_sample player = <player> button = 0 tilt = ($jam_tilt_melody) get_text = 1
	endif
	if GotParam \{single_note_text}
		return single_note_text = <single_note_text>
	else
		return \{single_note_text = qs("err")}
	endif
endscript

script jam_input_melody_tilt 
	<low_tilt> = 0.0
	<high_tilt> = 100.0
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [4])
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
				change \{jam_tilt_melody = 0}
			else
				change \{jam_tilt_melody = 1}
			endif
		else
			if (<line_rot> <= 1)
				change \{jam_tilt_melody = 0}
			elseif (<line_rot> > 1 && <line_rot> < 50)
				change \{jam_tilt_melody = 1}
			elseif (<line_rot> > 50 && <line_rot> < 99)
				change \{jam_tilt_melody = 2}
			else
				change \{jam_tilt_melody = 3}
			endif
		endif
	else
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_input_melody_play_note \{sustain = 0
		playback = 0}
	KillSpawnedScript \{name = jam_input_stop_sound_melody}
	jam_update_falling_gem_sustain \{sustain_global = jam_sustain_melody
		stop = 1}
	jam_input_melody_stop_sound
	PlaySound $melody_sample pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 3 pan1x = (($jam_melody_pan) / 10.0) buss = JamMode_Vox send_vol2 = -24 slot = 8
	change \{jam_input_current_melody = $melody_sample}
	if ($jam_tutorial_status = active)
		BroadcastEvent type = jam_tutorial_melody_hit data = {hold_pattern = <hold_pattern>}
	endif
	if (<playback> = 0)
		spawnscriptnow jam_fretboard_add_note params = {player = <select_player> gem_pattern = <hold_pattern> sustain = jam_sustain_melody}
		<velocity> = 0
		if (<note_fret> > 31)
			<velocity> = (<note_fret> -31)
			<note_fret> = 31
		endif
		<melody> = 1
		jam_record_note <...>
	endif
	BroadcastEvent \{type = jam_note_hit}
endscript

script jam_get_single_sample_for_melody_playback 
	<sample_checksum> = ($melody_sample)
	<oct> = 1
	if (<string> = 5)
		<oct> = 3
	elseif ((<string> = 2) && (<fret> >= 2))
		<oct> = 2
	elseif (<string> > 2)
		<oct> = 2
	endif
	begin
	if (<string> > 0)
		if (<string> = 4)
			<fret> = (<fret> - 8)
		else
			<fret> = (<fret> - 7)
		endif
		<string> = (<string> -1)
	endif
	if (<fret> < 0)
		<fret> = (<fret> + 12)
	endif
	if (<string> = 0)
		break
	endif
	repeat
	if (<oct> = 2)
		<fret> = (<fret> + 12)
	elseif (<oct> = 3)
		<fret> = (<fret> + 24)
	endif
	<range> = ($jam_melody_octave_range)
	if (<range> = 2)
		<fret> = (<fret> + 12)
	endif
	<final_pitch> = (<fret> -16)
	return sample_checksum = <sample_checksum> pitch_shift = <final_pitch>
endscript

script SetMelodyKit \{melody_kit = 0}
	GetArraySize \{$pause_melody_kit_options}
	if ((<melody_kit> >= <array_size>) || (<melody_kit> < 0))
		<melody_kit> = 0
	endif
	change jam_current_melody_kit = <melody_kit>
	change Melody_Jam_Set = ($pause_melody_kit_options [<melody_kit>].pakname)
	change melody_sample = ($pause_melody_kit_options [<melody_kit>].sample_start)
	SetSongInfo melody_kit = <melody_kit>
endscript

script LoadMelodyKit \{melody_kit = 0}
	SetMelodyKit melody_kit = <melody_kit>
	LoadKeyboardSamples
endscript

script UnLoadMelodyKit 
	if NOT (($LoadedMelodyKitPak) = 'none')
		change \{globalname = LoadedMelodyKitPak
			newvalue = 'none'}
	endif
endscript
