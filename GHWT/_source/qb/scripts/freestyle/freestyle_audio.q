freestyle_instrument_mix_levels = [
	{
		guitar = 0.45000002
		Drums = 0.85
		DrumKit = 0.85
	}
	{
		guitar = 0.375
		Drums = 0.8
		DrumKit = 0.85
	}
]
freestyle_release_time_low_notes = 40
freestyle_release_time_high_notes = 25
freestyle_release_time_mutes = 25
freestyle_release_time_chords = 40
freestyle_hopo_offset_low_notes = 50
freestyle_hopo_offset_mid_notes = 30
freestyle_hopo_offset_high_notes = 10
freestyle_style_preview_streams = [
	freestyle_streams_blues_preview
	freestyle_streams_rock_preview
	freestyle_streams_metal_preview
]
freestyle_enable_backing_streams = 1
freestyle_note_banks = {
}
freestyle_guitar_tunings = [
	none
]

script freestyle_set_mix_levels 
	FreestyleSetMasterVolume \{synthesizer_volume = 0.75
		stream_volume = 0.35000002}
	freestyle_set_instrument_mix_levels
	freestyle_set_stream_mix_levels
endscript

script freestyle_set_instrument_mix_levels 
	if ($freestyle_player_count > 0)
		player = 0
		mix_index = ($freestyle_player_count - 1)
		begin
		instrument = ($freestyle_player_data [<player>].instrument)
		if (instrument != none)
			volume = ($freestyle_instrument_mix_levels [<mix_index>].<instrument>)
			InstrumentSetVolume player = <player> volume = <volume>
		endif
		<player> = (<player> + 1)
		repeat $freestyle_max_players
	endif
endscript

script freestyle_set_stream_mix_levels 
	GetLoadedStreams
	GetArraySize <loaded_streams>
	stream_count = <array_size>
	if (<stream_count> > 0)
		if ($freestyle_enable_backing_streams = 0)
			mute_all = true
		else
			mute_all = false
		endif
		if is_drummer_human
			mute_drums = true
		else
			mute_drums = false
		endif
		stream = 0
		begin
		MuteStreamSet id = (<loaded_streams> [<stream>]) mute = <mute_all>
		MuteStreamSet id = (<loaded_streams> [<stream>]) mute = <mute_drums> track = Drums
		<stream> = (<stream> + 1)
		repeat <stream_count>
	endif
endscript

script freestyle_choose_samples_based_on_music 
	switch ($freestyle_music_type)
		case metal
		SetStructureParam \{struct_name = freestyle_note_banks
			param = guitar
			value = freestyle_noteBank_guitar_METAL}
		SetArrayElement \{GlobalArray
			ResolveGlobals = 0
			ArrayName = freestyle_guitar_tunings
			index = 0
			newvalue = freestyle_tuning_metal}
		case Rock
		SetStructureParam \{struct_name = freestyle_note_banks
			param = guitar
			value = freestyle_noteBank_guitar_rock}
		SetArrayElement \{GlobalArray
			ResolveGlobals = 0
			ArrayName = freestyle_guitar_tunings
			index = 0
			newvalue = freestyle_tuning_rock}
		case Blues
		SetStructureParam \{struct_name = freestyle_note_banks
			param = guitar
			value = freestyle_noteBank_guitar_blues}
		SetArrayElement \{GlobalArray
			ResolveGlobals = 0
			ArrayName = freestyle_guitar_tunings
			index = 0
			newvalue = freestyle_tuning_blues}
		default
		ScriptAssert \{qs(0x80a13847)
			a = $freestyle_music_type}
	endswitch
	SetStructureParam \{struct_name = freestyle_note_banks
		param = Drums
		value = freestyle_noteBank_drums}
endscript

script freestyle_assign_guitar_tunings 
	player = 0
	begin
	if ($freestyle_player_data [<player>].instrument = guitar)
		freestyle_get_guitar_tuning_index difficulty = ($freestyle_player_data [<player>].difficulty)
		tuning_name = ($freestyle_guitar_tunings [<tuning_index>])
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = tuning value = <tuning_name>
	endif
	<player> = (<player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_get_guitar_tuning_index 
	return \{tuning_index = 0}
endscript

script freestyle_stop_preview_stream 
	KillSpawnedScript \{name = freestyle_play_preview_stream_spawned}
	UnloadStreamSet \{id = preview}
endscript

script freestyle_play_preview_stream 
	freestyle_stop_preview_stream
	spawnscriptnow freestyle_play_preview_stream_spawned params = {style_index = <style_index>}
endscript

script freestyle_play_preview_stream_spawned 
	stream_ptr = ($freestyle_style_preview_streams [<style_index>])
	LoadStreamSet id = preview stream_data = $<stream_ptr>
	freestyle_wait_for_streams_to_load
	FreestyleSetMasterVolume \{stream_volume = 0.6}
	PlayStreamSet \{id = preview
		Loop = true}
endscript

script freestyle_wait_for_streams_to_load 
	begin
	if AreAllStreamsLoaded
		break
	endif
	Wait \{1
		frame}
	repeat
endscript
