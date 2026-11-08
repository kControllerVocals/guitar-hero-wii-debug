guitar_jam_playback_recordng_increment_track_index = 0

script guitar_jam_playback_recording \{start_time = 0
		jam_instrument = 0
		in_game = 0}
	printf \{channel = jam_mode
		qs("\LJAM MODE: Playback Recording Start")}
	track = ($jam_tracks [<jam_instrument>].id)
	if (<in_game> != 1)
		gem_array = ($jam_tracks [<jam_instrument>].gem_array)
		AppendSuffixToChecksum Base = <gem_array> SuffixString = '_size'
		gem_array_size = ($<appended_id>)
		gem_array_size_id = <appended_id>
	else
		gem_array = ($jam_tracks [<jam_instrument>].in_game_gem_array)
		GetArraySize ($<gem_array>)
		gem_array_size = <array_size>
	endif
	reset_song_time StartTime = <start_time>
	GetJamSessionSize track = <track>
	orig_size = <track_size>
	if (<track_size> = 0)
		return
	endif
	track_index = 0
	start_at_index = -1
	begin
	GetJamSessionSound track = <track> index = <track_index>
	if (<time> >= <start_time>)
		start_at_index = <track_index>
		break
	endif
	<track_index> = (<track_index> + 1)
	if (<track_index> >= <track_size>)
		break
	endif
	repeat
	if (<start_at_index> = -1)
		return
	endif
	old_effect_on = ($jam_current_active_effects [<jam_instrument>])
	is_effect_on = ($jam_current_active_effects [<jam_instrument>])
	ms_per_beat = (60000.0 / $jam_current_bpm)
	sustain_min = 4
	<sustain_min> = (<ms_per_beat> / <sustain_min>)
	CastToInteger \{sustain_min}
	sustain_cutoff = 8
	<sustain_cutoff> = (<ms_per_beat> / <sustain_cutoff>)
	CastToInteger \{sustain_cutoff}
	FormatText checksumname = spawn_id 'playback_sustain_note_%s' s = <jam_instrument>
	if IsTrue \{$g_optimized_guitar_jam_playback_recording}
		<track_index> = <start_at_index>
		change \{guitar_jam_playback_recordng_increment_track_index = 0}
		begin
		<track_index> = (<track_index> + ($guitar_jam_playback_recordng_increment_track_index))
		change \{guitar_jam_playback_recordng_increment_track_index = 0}
		if (<track_index> >= <track_size>)
			break
		endif
		if NOT JamPlaybackRecording_Process <...>
			break
		endif
		Wait \{1
			gameframe}
		repeat
		printf \{channel = jam_mode
			qs("\LJAM MODE: Playback Recording Stop")}
		return
	endif
	<track_index> = <start_at_index>
	begin
	GetSongTimeMs
	CastToInteger \{time}
	curr_song_time = <time>
	GetJamSessionSize track = <track>
	if (<track_size> = <orig_size>)
		GetJamSessionSound track = <track> index = <track_index>
		if (<curr_song_time> >= <time>)
			if (<in_game> != 1)
				<gem_array_size> = ($<gem_array_size_id>)
			endif
			if ((<track_index> * 2) < <gem_array_size>)
				GetNoteTrackItem name = <gem_array> index = (<track_index> * 2)
			else
				gem_length = 60
			endif
			curr_length = <gem_length>
			curr_effect = <effect>
			KillSpawnedScript \{name = jam_recording_sustain_note}
			if (<track> = rhythm)
				KillSpawnedScript \{name = jam_input_stop_sound_rhythm}
				jam_get_sample_checksum fret = <note_fret> string = <note_string> type = <note_type> chord_dir = 1 chord_type = <chord_type> jam_instrument = <jam_instrument>
				jam_input_rhythm_play_note final_note_sample = <sample_checksum> pitch_shift = <pitch_shift> note_fret = <note_fret> note_type = <note_type> playback = 1
			elseif (<track> = lead)
				KillSpawnedScript \{name = jam_input_stop_sound_lead}
				jam_get_sample_checksum fret = <note_fret> string = <note_string> type = <note_type> jam_instrument = <jam_instrument>
				jam_input_lead_play_note final_note_sample = <sample_checksum> pitch_shift = <pitch_shift> note_fret = <note_fret> note_type = <note_type> playback = 1
			elseif (<track> = Bass)
				KillSpawnedScript \{name = jam_input_stop_sound_bass}
				jam_get_sample_checksum fret = <note_fret> string = <note_string> type = <note_type> jam_instrument = <jam_instrument>
				jam_input_bass_play_note final_note_sample = <sample_checksum> pitch_shift = <pitch_shift> note_fret = <note_fret> note_type = <note_type> playback = 1
			elseif (<track> = melody)
				KillSpawnedScript \{name = jam_input_stop_sound_melody}
				jam_get_single_sample_for_melody_playback fret = <note_fret> string = <note_string> type = <note_type> jam_instrument = <jam_instrument>
				jam_input_melody_play_note final_note_sample = <sample_checksum> pitch_shift = <pitch_shift> playback = 1
			endif
			spawnscriptnow jam_recording_sustain_note params = {length = <curr_length> track = <track>}
			<track_index> = (<track_index> + 1)
		endif
	endif
	GetJamSessionSize track = <track>
	if (<track_size> > <orig_size>)
		<track_index> = (<track_index> + 1)
		<orig_size> = <track_size>
	endif
	if (<track_index> >= <track_size>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	printf \{channel = jam_mode
		qs("\LJAM MODE: Playback Recording Stop")}
endscript

script guitar_jam_playback_delete \{start_time = 0
		jam_instrument = 0
		in_game = 0}
	printf \{channel = jam_mode
		qs("\LJAM MODE: DELETE Playback Start")}
	track = ($jam_tracks [<jam_instrument>].id)
	jam_stop_sound jam_instrument = <jam_instrument>
	gem_array = ($jam_tracks [<jam_instrument>].gem_array)
	AppendSuffixToChecksum Base = <gem_array> SuffixString = '_size'
	gem_array_size = ($<appended_id>)
	gem_array_size_id = <appended_id>
	reset_song_time StartTime = <start_time>
	GetJamSessionSize track = <track>
	orig_size = <track_size>
	ms_per_beat = (60000.0 / $jam_current_bpm)
	sustain_min = 4
	<forward_delete> = (<ms_per_beat> / <sustain_min>)
	CastToInteger \{forward_delete}
	if (<track_size> = 0)
		return
	endif
	track_index = 0
	start_at_index = -1
	begin
	GetJamSessionSound track = <track> index = <track_index>
	if (<time> >= <start_time>)
		start_at_index = <track_index>
		break
	endif
	<track_index> = (<track_index> + 1)
	if (<track_index> >= <track_size>)
		break
	endif
	repeat
	if (<start_at_index> = -1)
		return
	endif
	<delete_index> = <start_at_index>
	begin
	GetSongTimeMs
	CastToInteger \{time}
	curr_song_time = <time>
	GetJamSessionSize track = <track>
	if (<track_size> > 0 && <track_size> = <orig_size>)
		GetJamSessionSound track = <track> index = <delete_index>
		if ((<curr_song_time> + <forward_delete>) >= <time>)
			DeleteJamSessionSound track = ($jam_tracks [<jam_instrument>].id) index = <delete_index>
			DeleteNoteTrackItem name = <gem_array> index = (<delete_index> * 2)
			<orig_size> = (<orig_size> - 1)
		endif
	endif
	GetJamSessionSize track = <track>
	if (<track_size> > <orig_size>)
		<add_index> = (<track_size> - <orig_size>)
		<delete_index> = (<delete_index> + <add_index>)
		<orig_size> = <track_size>
	endif
	if (<delete_index> >= <track_size>)
		printf \{channel = jam_mode
			qs("\LIndex past size")}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_recording_sustain_note 
	length_seconds = (<length> / 1000.0)
	Wait <length_seconds> seconds
	if (<length> < 60)
		switch <track>
			case rhythm
			StopSound \{unique_id = $jam_input_current_chord}
			case lead
			StopSound \{unique_id = $jam_input_current_lead}
			case Bass
			StopSound \{unique_id = $jam_input_current_bass}
			case melody
			jam_input_melody_stop_sound
		endswitch
	else
		switch <track>
			case rhythm
			StopSound \{unique_id = $jam_input_current_chord
				fade_type = linear
				fade_time = $jam_fade_time}
			case lead
			StopSound \{unique_id = $jam_input_current_lead
				fade_type = linear
				fade_time = $jam_fade_time}
			case Bass
			StopSound \{unique_id = $jam_input_current_bass
				fade_type = linear
				fade_time = $jam_fade_time}
			case melody
			jam_input_melody_stop_sound
		endswitch
	endif
endscript

script jam_stop_all_samples 
	StopSound unique_id = ($jam_input_current_chord)
	StopSound unique_id = ($jam_input_current_lead)
	StopSound unique_id = ($jam_input_current_bass)
	jam_input_melody_stop_sound
endscript

script jam_update_volume \{volume = 0}
	update_volume = <volume>
	if NOT ($current_song_qpak = jamsession)
		return
	endif
	GetSongInfo
	GetPlayerInfo <player> part
	if (<part> = guitar)
		inst = <playback_track1>
	elseif (<part> = Bass)
		inst = <playback_track2>
	else
		return
	endif
	if ((<inst> < 0) || (<inst> > 4))
		return
	endif
	GetTrackInfo track = ($jam_tracks [<inst>].id)
	new_vol = ((10 - <volume>) * 2)
	vocals_get_num_vocalists
	if (<num_vocalists> > 0 && <inst> = 4)
		return
	endif
	switch <inst>
		case 0
		if (<update_volume> = 0)
			SetSoundBussParams \{JamMode_RhythmGuitar = {
					vol = -100
				}}
		else
			SetSoundBussParams {JamMode_RhythmGuitar = {vol = (($Default_BussSet.JamMode_RhythmGuitar.vol) - <new_vol>)}}
		endif
		case 1
		if (<update_volume> = 0)
			SetSoundBussParams \{JamMode_LeadGuitar = {
					vol = -100
				}}
		else
			SetSoundBussParams {JamMode_LeadGuitar = {vol = (($Default_BussSet.JamMode_LeadGuitar.vol) - <new_vol>)}}
		endif
		case 2
		if (<update_volume> = 0)
			SetSoundBussParams \{JamMode_Bass = {
					vol = -100
				}}
		else
			SetSoundBussParams {JamMode_Bass = {vol = (($Default_BussSet.JamMode_Bass.vol) - <new_vol>)}}
		endif
		case 4
		if (<update_volume> = 0)
			SetSoundBussParams \{JamMode_Vox = {
					vol = -100
				}}
		else
			SetSoundBussParams {JamMode_Vox = {vol = (($Default_BussSet.JamMode_Vox.vol) - <new_vol>)}}
		endif
	endswitch
endscript

script jam_fadeout_sound_event 
	fade_out_event = <event>
	if isSoundEventPlaying <fade_out_event>
		AppendSuffixToChecksum Base = <fade_out_event> SuffixString = '_container'
		event_container = <appended_id>
		sound_array = (($<event_container>).Sounds)
		GetArraySize <sound_array>
		count = 0
		begin
		if issoundplaying (<sound_array> [<count>])
			break
		endif
		<count> = (<count> + 1)
		repeat <array_size>
		SetSoundParams (<sound_array> [<count>]) vol = 0
		Wait \{0.15
			seconds}
		SetSoundParams (<sound_array> [<count>]) vol = -6
		Wait \{0.15
			seconds}
		SetSoundParams (<sound_array> [<count>]) vol = -12
		StopSoundEvent <fade_out_event>
	endif
endscript

script jam_delete_range track = ($jam_current_track) low_bound = 0 high_bound = 1000
	CastToInteger \{low_bound}
	CastToInteger \{high_bound}
	<low_bound> = (<low_bound> - 2)
	<high_bound> = (<high_bound> + 2)
	GetJamSessionSize track = ($jam_tracks [<track>].id)
	sessionsound_index = 0
	if (<track_size> > 0)
		begin
		GetJamSessionSound track = ($jam_tracks [<track>].id) index = <sessionsound_index>
		if (<time> >= <low_bound> && <time> <= <high_bound>)
			DeleteJamSessionSound track = ($jam_tracks [<track>].id) index = <sessionsound_index>
			<track_size> = (<track_size> - 1)
		else
			<sessionsound_index> = (<sessionsound_index> + 1)
		endif
		if (<sessionsound_index> >= <track_size>)
			break
		endif
		repeat
	endif
	GetJamSessionSize track = ($jam_tracks [<track>].id)
	if (<track_size> = 0)
		printf \{channel = jam_mode
			qs("\LSESSION SOUND EMPTY")}
	endif
	gem_array = ($jam_tracks [<track>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = <appended_id>
	if (($<notetrack_size>) > 0)
		notetrack_index = 0
		begin
		time = ($<gem_array> [<notetrack_index>])
		if (<time> >= <low_bound> && <time> <= <high_bound>)
			DeleteNoteTrackItem name = <gem_array> index = <notetrack_index>
		else
			<notetrack_index> = (<notetrack_index> + 2)
		endif
		if (<notetrack_index> >= ($<notetrack_size>))
			break
		endif
		repeat
	endif
	if (($<notetrack_size>) = 0)
		printf \{channel = jam_mode
			qs("\LNOTE TRACK EMPTY")}
	endif
	if (<low_bound> = (<high_bound> -104))
		markers_array = editable_jam_markers
		suffix = '_size'
		AppendSuffixToChecksum Base = <markers_array> SuffixString = <suffix>
		<markers_size> = <appended_id>
		if (($<markers_size>) > 0)
			marker_index = 0
			begin
			time = ($<markers_array> [<marker_index>].time)
			if (<time> >= <low_bound> && <time> <= <high_bound>)
				DeleteMarkerItem name = <markers_array> index = <marker_index>
			else
				<marker_index> = (<marker_index> + 1)
			endif
			if (<marker_index> >= ($<markers_size>))
				break
			endif
			repeat
		endif
	endif
endscript

script jam_recording_metronome \{flash_light = 0}
	if NOT GotParam \{time}
		<curr_time> = $jam_highway_play_time
	else
		<curr_time> = <time>
	endif
	CastToInteger \{curr_time}
	if NOT GotParam \{bpm}
		bpm = ($jam_current_bpm)
	endif
	quantize_to = 1
	ms_per_beat = (60000.0 / <bpm>)
	quantize_fretbar = (<ms_per_beat> / <quantize_to>)
	intervals = (<curr_time> / <quantize_fretbar>)
	CastToInteger \{intervals}
	new_time_fretbar = (<intervals> * <quantize_fretbar>)
	<new_time_fretbar> = (<new_time_fretbar> + <quantize_fretbar>)
	CastToInteger \{new_time_fretbar}
	quantize_to = 0.25
	ms_per_beat = (60000.0 / <bpm>)
	quantize_measure = (<ms_per_beat> / <quantize_to>)
	intervals = (<curr_time> / <quantize_measure>)
	CastToInteger \{intervals}
	new_time_measure = (<intervals> * <quantize_measure>)
	<new_time_measure> = (<new_time_measure> + <quantize_measure>)
	CastToInteger \{new_time_measure}
	flipper = 0
	FormatText \{checksumname = simple_rec_button_onl1
		'jam_simple_rec_button_onl_%s'
		s = 1}
	FormatText \{checksumname = simple_rec_button_onl2
		'jam_simple_rec_button_onl_%s'
		s = 2}
	FormatText \{checksumname = simple_rec_button_onl3
		'jam_simple_rec_button_onl_%s'
		s = 3}
	FormatText \{checksumname = simple_rec_button_onl4
		'jam_simple_rec_button_onl_%s'
		s = 4}
	FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = <select_player>
	tick = 0
	begin
	GetSongTimeMs
	CastToInteger \{time}
	if (<time> >= <new_time_measure>)
		<new_time_fretbar> = (<new_time_fretbar> + <quantize_fretbar>)
		<new_time_measure> = (<new_time_measure> + <quantize_measure>)
		if ($jam_click_track = 1)
			SoundEvent \{event = Jam_Mode_Metronome
				downbeat = 1}
			printf \{channel = jam_mode
				qs("\LMEASURE")}
		endif
		if NOT GotParam \{sound_only}
			if (<flash_light> = 1)
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl1>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl2>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl3>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl4>}
			endif
			if (<tick> = 0)
				toggle_advanced_record_metronome \{left}
				<tick> = 1
			else
				toggle_advanced_record_metronome \{right}
				<tick> = 0
			endif
		endif
	endif
	if (<time> >= <new_time_fretbar>)
		<new_time_fretbar> = (<new_time_fretbar> + <quantize_fretbar>)
		if ($jam_click_track = 1)
			SoundEvent \{event = Jam_Mode_Metronome}
		endif
		if NOT GotParam \{sound_only}
			if (<flash_light> = 1)
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl1>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl2>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl3>}
				spawnscriptnow jam_flash_recording_element id = <jam_player_spawns> params = {id = <simple_rec_button_onl4>}
			endif
			if (<tick> = 0)
				toggle_advanced_record_metronome \{left}
				<tick> = 1
			else
				toggle_advanced_record_metronome \{right}
				<tick> = 0
			endif
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_recording_metronome_stop 
	KillSpawnedScript \{name = jam_recording_metronome}
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias \{name = metronome_box}
			<resolved_id> :SetProps pos = (51.0, 800.0) time = 0.2
			<resolved_id> :SE_WaitProps
		endif
	endif
endscript

script jam_flash_recording_element 
	safe_show id = <id>
	Wait \{10
		frames}
	safe_hide id = <id>
endscript

script toggle_advanced_record_metronome 
	if ScreenElementExists \{id = jam_studio_element}
		if GotParam \{left}
			jam_studio_element :SetProps \{metronome_left_texture = metronome_tick}
			jam_studio_element :SetProps \{metronome_right_texture = metronome_tock}
		else
			jam_studio_element :SetProps \{metronome_right_texture = metronome_tick}
			jam_studio_element :SetProps \{metronome_left_texture = metronome_tock}
		endif
	endif
endscript

script jamsession_AddScriptArrayItem 
	AddScriptArrayItem name = <arraylist> checksum = <song_checksum>
endscript

script jamsession_array_action 
	FormatText checksumname = song_checksum '%s_jam_markers' s = <song_prefix> AddToStringLookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = heap_song type = Structure <...>
	FormatText checksumname = song_checksum '%s_jam_album_cover' s = <song_prefix> AddToStringLookup = true
	<func> name = <song_checksum> size = 1 heap = heap_song type = Structure <...>
	count = 1
	begin
	if (<count> = 5)
		<difficulty_text> = 'in_game'
	else
		difficulty = ($difficulty_list [<count>])
		get_difficulty_text_nl difficulty = <difficulty>
		<difficulty_text> = <difficulty_text_nl>
	endif
	gem_count = <gemarraysize>
	star_count = <starsize>
	count2 = 0
	begin
	switch <count2>
		case 0
		type = ''
		case 1
		type = '_rhythm'
		case 2
		type = '_drum'
		case 3
		type = '_guitarcoop'
		case 4
		type = '_rhythmcoop'
	endswitch
	FormatText checksumname = song_checksum '%s_song%t_%d' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = (2 * <gem_count>) heap = heap_song <...>
	if NOT (<count> = 5)
		FormatText checksumname = song_checksum '%s%t_%d_star' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = $jamsession_max_star_sequences size2 = 3 heap = heap_song <...>
		FormatText checksumname = song_checksum '%s%t_%d_FaceOffStar' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = heap_song <...>
		FormatText checksumname = song_checksum '%s%t_%d_StarBattleMode' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = heap_song <...>
		FormatText checksumname = song_checksum '%s%t_%d_Tapping' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = heap_song <...>
		FormatText checksumname = song_checksum '%s%t_%d_WhammyController' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = heap_song <...>
	endif
	<count2> = (<count2> + 1)
	repeat 5
	if NOT (<count> = 5)
		FormatText checksumname = song_checksum '%s_%d_DrumFill' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = heap_song <...>
		FormatText checksumname = song_checksum '%s_%d_DrumUnmute' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
		<func> name = <song_checksum> size = 0 size2 = 3 heap = heap_song <...>
	endif
	<count> = (<count> + 1)
	if (<count> >= 6)
		break
	endif
	repeat
	FormatText checksumname = song_checksum '%s_DrumSolo' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = 0 size2 = 2 heap = heap_song <...>
	FormatText checksumname = song_checksum '%s_FaceOffP1' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = 0 size2 = 2 heap = heap_song <...>
	FormatText checksumname = song_checksum '%s_FaceOffP2' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = 0 size2 = 2 heap = heap_song <...>
	FormatText checksumname = song_checksum '%s_BossBattleP1' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = 0 size2 = 2 heap = heap_song <...>
	FormatText checksumname = song_checksum '%s_BossBattleP2' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = 0 size2 = 2 heap = heap_song <...>
	FormatText checksumname = song_checksum '%s_timesig' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = <starsize> size2 = 3 heap = heap_song <...>
	FormatText checksumname = song_checksum '%s_fretbars' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = heap_song <...>
	FormatText checksumname = song_checksum '%s_markers' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = heap_song type = Structure <...>
	FormatText checksumname = song_checksum '%s_guitar_markers' s = <song_prefix> t = <type> d = <difficulty_text> AddToStringLookup = true
	<func> name = <song_checksum> size = <fretbarsize> heap = heap_song type = Structure <...>
	GetArraySize \{$scripts_array}
	count = 0
	begin
	script_array_size = 0
	if (($scripts_array [<count>].name) = 'lightshow')
		<script_array_size> = (2 * <gem_count>)
	endif
	FormatText checksumname = song_checksum '%s_%p_notes' s = <song_prefix> p = ($scripts_array [<count>].name) AddToStringLookup = true
	<func> name = <song_checksum> size = <script_array_size> heap = heap_song <...>
	FormatText checksumname = song_checksum '%s_%p' s = <song_prefix> p = ($scripts_array [<count>].name) AddToStringLookup = true
	<func> name = <song_checksum> size = 0 heap = heap_song type = Structure <...>
	count = (<count> + 1)
	repeat <array_size>
endscript

script jamsession_copyfinalscriptarrays 
	ExtendCRC <arraylist> '_size' out = arraylistsize
	count = 0
	begin
	CopyFinalScriptArray sourcename = ($<arraylist> [<count>]) destname = ($<arraylist2> [<count>])
	count = (<count> + 1)
	repeat $<arraylistsize>
endscript

script jamsession_copymarkerarrays \{song = editable}
	suffix = '_jam_markers'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_jam_markers = <appended_id>
	suffix = '_lightshow_notes'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_lightshow_notes = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_lightshow_notes> SuffixString = <suffix>
	AppendSuffixToChecksum Base = <song_jam_markers> SuffixString = <suffix>
	jam_markers_size = ($<appended_id>)
	if NOT GlobalExists name = <song_lightshow_notes> type = array
		return
	endif
	AddScriptArrayNoteItem name = <song_lightshow_notes> time = 0 length = 80 note = ($jam_lightshow [0].note) velocity = 100
	count = 0
	note_count = 0
	begin
	if (<jam_markers_size> = 0)
		break
	endif
	curr_time = ($<song_jam_markers> [<count>].time)
	curr_marker_lightshow = ($<song_jam_markers> [<count>].LightShow)
	next_time = -1
	if (<count> < (<jam_markers_size> - 1))
		next_time = ($<song_jam_markers> [(<count> + 1)].time)
	endif
	AddScriptArrayNoteItem name = <song_lightshow_notes> time = <curr_time> length = 80 note = ($jam_lightshow [<curr_marker_lightshow>].note) velocity = 100
	<note_count> = (<note_count> + 1)
	curr_change = ($jam_lightshow [<curr_marker_lightshow>].change)
	ms_per_beat = ((60000.0 / $jam_current_bpm) / <curr_change>)
	beat_count = 0
	begin
	if (<next_time> > 0)
		color_change_time = (<curr_time> + (<ms_per_beat> * <beat_count>))
		CastToInteger \{color_change_time}
		if (<color_change_time> < <next_time>)
			AddScriptArrayNoteItem name = <song_lightshow_notes> time = <color_change_time> length = 80 note = 58 velocity = 100
			<note_count> = (<note_count> + 1)
			if (<note_count> >= (($gemarraysize) * 2))
				break
			endif
		else
			break
		endif
	else
		break
	endif
	<beat_count> = (<beat_count> + 1)
	repeat
	if (<note_count> >= (($gemarraysize) * 2))
		break
	endif
	<count> = (<count> + 1)
	if (<count> > (<jam_markers_size> - 1))
		break
	endif
	repeat
endscript

script jamsession_unload \{song_prefix = 'jamsession'}
	FormatText checksumname = arraylist '%s_arraylist' s = <song_prefix>
	ExtendCRC <arraylist> '_size' out = arraylistsize
	if NOT GlobalExists name = <arraylist> type = array
		return
	endif
	if ($<arraylistsize> > 0)
		count = 0
		begin
		if GlobalExists name = ($<arraylist> [<count>]) type = array
			DestroyScriptArray name = ($<arraylist> [<count>])
		endif
		count = (<count> + 1)
		repeat $<arraylistsize>
		if GlobalExists name = <arraylist> type = array
			DestroyScriptArray name = <arraylist>
		endif
	endif
	if (<song_prefix> = 'jamsession')
		if GlobalExists \{name = jamsession_song_vocals
				type = array}
			DestroyScriptArray \{name = jamsession_song_vocals}
		endif
	endif
	jam_clear_clipboards
endscript

script jamsession_startsong 
	ReloadSfx \{mode = jammode}
endscript

script jam_add_end_of_song_marker 
	count = 0
	last_end_time = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = <appended_id>
	if (($<notetrack_size>) > 0)
		GetNoteTrackItem name = <gem_array> index = (($<notetrack_size>) - 2)
		if ((<gem_time> + <gem_length>) > <last_end_time>)
			<last_end_time> = (<gem_time> + <gem_length>)
		endif
	endif
	<count> = (<count> + 1)
	repeat 5
	fret_ms = (60000.0 / $jam_current_bpm)
	intervals = (<last_end_time> / <fret_ms>)
	CastToInteger \{intervals}
	end_marker_time = ((<intervals> * <fret_ms>) + <fret_ms>)
	CastToInteger \{end_marker_time}
	new_marker = {time = <end_marker_time> , marker = qs("\L_ENDOFSONG")}
	SetArrayElement ArrayName = editable_guitar_markers GlobalArray index = 0 newvalue = <new_marker>
	change \{globalname = editable_guitar_markers_size
		newvalue = 1}
	CopyFinalScriptArray \{sourcename = editable_guitar_markers
		destname = jamsession_guitar_markers}
	printf channel = jam_mode qs("\LADD END OF SONG MARKER, time %a") a = <end_marker_time>
	return end_time = <end_marker_time>
endscript

script jam_debug_track \{jam_instrument = 0}
	printf \{channel = jam_mode
		qs("\L0000000000000000000000000")}
	printf \{channel = jam_mode
		qs("\L")}
	printf \{channel = jam_mode
		qs("\L")}
	gem_array = ($jam_tracks [<jam_instrument>].gem_array)
	jamsession_debug_print_script_array gem_array = <gem_array>
	printf \{channel = jam_mode
		qs("\L")}
	guitar_jam_print_recording track = ($jam_tracks [<jam_instrument>].id)
	printf \{channel = jam_mode
		qs("\L")}
	printf \{channel = jam_mode
		qs("\L")}
	printf \{channel = jam_mode
		qs("\L0000000000000000000000000")}
endscript

script jamsession_debug_print_script_array gem_array = <gem_array>
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	GetArraySize \{$gem_colors}
	gem_color_array_size = <array_size>
	printf \{channel = jam_mode
		qs("\L*********************")}
	printf channel = jam_mode qs("\LScript array size %s") s = ($<appended_id>)
	<notetrack_size> = <appended_id>
	count = 0
	begin
	if (($<notetrack_size>) = 0)
		break
	endif
	GetNoteTrackItem name = <gem_array> index = <count>
	debug_get_bitfield_text curr_bitfield = <gem_pattern> num_bits = (<gem_color_array_size> + 6)
	printf channel = jam_mode qs("\LJAM: %d, time %a %b") d = <bitfield_text> a = <gem_time> b = <gem_length>
	count = (<count> + 2)
	if (<count> > (($<notetrack_size>) - 2))
		break
	endif
	repeat
	printf \{channel = jam_mode
		qs("\L*********************")}
endscript

script guitar_jam_print_recording \{track = rhythm}
	OutputJamSessionSounds
	printf \{channel = jam_mode
		qs("\L*********************")}
	GetJamSessionSize track = <track>
	printf channel = jam_mode qs("\LRecording Track Size: %s") s = <track_size>
	track_index = 0
	begin
	if (<track_size> = 0)
		return
	endif
	GetJamSessionSound track = <track> index = <track_index>
	printf channel = jam_mode qs("\LIndex %i: time=%t") i = <track_index> t = <time>
	<track_index> = (<track_index> + 1)
	repeat <track_size>
	printf \{channel = jam_mode
		qs("\L*********************")}
endscript
g_optimized_guitar_jam_playback_recording = 1
