stream_config = gh1
song_is_waiting_to_start = 0

script preload_song \{StartTime = 0
		fadeintime = 0.0
		songseekable = false}
	printscriptinfo \{qs(0x2e9fb54c)}
	adjustedtime = <StartTime>
	printf qs("\Lsong %s") s = <song_name>
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	if StructureContains Structure = <song_struct> streamname
		song_prefix = (<song_struct>.streamname)
	endif
	SoundBussUnlock \{Band_Balance}
	if StructureContains Structure = <song_struct> name = band_playback_volume
		SetSoundBussParams {Band_Balance = {vol = ((<song_struct>.band_playback_volume) - 1.5)}} time = <fadeintime>
	else
		SetSoundBussParams {Band_Balance = {vol = -1.5}} time = <fadeinttime>
	endif
	SoundBussLock \{Band_Balance}
	if StructureContains Structure = <song_struct> overall_song_volume
		SongSetMasterVolume vol = (<song_struct>.overall_song_volume)
	endif
	if NOT ($current_song = jamsession)
		isDLC = 0
		if is_song_downloaded song_checksum = <song_name>
			<isDLC> = <download>
		endif
		if SongFileExists filename = <song_prefix> isDLC = <isDLC>
			PreLoadGH4Song filename = <song_prefix> isDLC = <isDLC> songseekable = <songseekable>
		endif
	endif
	change \{song_is_waiting_to_start = 1}
	SetLastGuitarVolume \{player = 1
		last_guitar_volume = 100}
	SetLastGuitarVolume \{player = 2
		last_guitar_volume = 100}
	SetLastGuitarVolume \{player = 3
		last_guitar_volume = 100}
	SetLastGuitarVolume \{player = 4
		last_guitar_volume = 100}
	SetSeekPosition_Song position = <StartTime>
	return adjustedtime = <adjustedtime>
endscript

script SetupSongDSPNetworks 
	get_song_prefix song = <song_name>
	get_song_struct song = <song_name>
	mode = $game_mode
	if ($boss_battle = 1)
		mode = boss_battle
	endif
	if ($is_attract_mode = 1)
		mode = attract_mode
	endif
	num_players = $current_num_players
	GameMode_GetNumPlayersShown
	if (<num_players_shown> < <num_players>)
		<num_players> = <num_players_shown>
	endif
	player1_part = ($player1_status.part)
	player2_part = ($player2_status.part)
	player3_part = ($player3_status.part)
	player4_part = ($player4_status.part)
	GetPlayerInfo \{1
		highway_position}
	p1_highway_position = <highway_position>
	GetPlayerInfo \{2
		highway_position}
	p2_highway_position = <highway_position>
	GetPlayerInfo \{3
		highway_position}
	p3_highway_position = <highway_position>
	GetPlayerInfo \{4
		highway_position}
	p4_highway_position = <highway_position>
	mono_drums = 0
	if StructureContains Structure = <song_struct> mono_drums
		mono_drums = (<song_struct>.mono_drums)
	endif
	SongSetupPlayerParts <...>
	SongSetPlayerEQSettings
endscript

script SongSetPlayerEQSettings 
	primary_profile = 1
	player = 1
	begin
	GetPlayerInfo <player> controller
	if ((<controller>) = ($primary_controller))
		primary_profile = <player>
	endif
	player = (<player> + 1)
	repeat $current_num_players
	printf qs("\LEntering SongSetPlayerEQSettings...Primary Controller: %c") c = ($primary_controller)
	GetPlayerInfo <primary_profile> part
	active_profile_part = <part>
	printf qs("\LPrimary Profile = %p part= %a") p = <primary_profile> a = <part>
	GetGlobalTags \{user_options
		attract_mode_fix = 1}
	index = (<volumes>.guitar.guitar.eq - 1)
	printf qs("\LSetting guitar eq to eq index: %i with %p as the active profile") i = <index> p = <active_profile_part>
	SongSetPlayerPartEQ part = guitar {((($PlayerPartEQLookup)).(guitar) [<index>])}
	index = (<volumes>.guitar.Bass.eq - 1)
	printf qs("\LSetting bass eq to eq index: %i with %p as the active profile") i = <index> p = <active_profile_part>
	SongSetPlayerPartEQ part = guitar {((($PlayerPartEQLookup)).(guitar) [<index>])}
	index = (<volumes>.guitar.drum.eq - 1)
	printf qs("\LSetting drum eq to eq index: %i with %p as the active profile") i = <index> p = <active_profile_part>
	SongSetPlayerPartEQ part = guitar {((($PlayerPartEQLookup)).(guitar) [<index>])}
endscript

script waitforseek_song 
	Wait \{15
		gameframe}
	return
endscript

script setslomo_song 
	SongSetPitch pitch_percent = (<slomo> * 100.0)
endscript

script startpreloadpaused_song 
	SongPlay
endscript

script begin_jam_song \{Pause = 0}
	EnablePerformanceDOF
	GetSongTimeMs
	CastToInteger \{time}
	printf \{channel = jam_mode
		qs("\Ljam session playback (begin_song)")}
	spawnscriptnow guitar_jam_playback_recording params = {jam_instrument = 0 start_time = <time> in_game = 1}
	spawnscriptnow guitar_jam_playback_recording params = {jam_instrument = 1 start_time = <time> in_game = 1}
	spawnscriptnow guitar_jam_playback_recording params = {jam_instrument = 2 start_time = <time> in_game = 1}
	spawnscriptnow guitar_jam_playback_recording params = {jam_instrument = 4 start_time = <time> in_game = 1}
	spawnscriptnow guitar_jam_drum_playback params = {start_time = <time> gem_array = ($jam_tracks [3].in_game_gem_array)}
	jam_init_volumes
	jam_init_reverb
	jam_init_pan
	guitar_jam_effects_toggle_active \{jam_instrument = 0
		force_state = on}
	guitar_jam_effects_toggle_active \{jam_instrument = 1
		force_state = on}
	spawnscriptnow \{jam_input_whammy_spawned
		id = jam_input_spawns}
	change \{song_is_waiting_to_start = 0}
endscript

script begin_song \{Pause = 0}
	EnablePerformanceDOF
	startpreloadpaused_song
	UpdateGuitarVolume
	if NOT ($current_song_qpak = jamsession)
		if (<Pause> = 0)
			SongUnPause
		else
			SongPause
		endif
	endif
	change \{song_is_waiting_to_start = 0}
	EnableMic
endscript

script SetSeekPosition_Song \{position = 0}
	if SongIsSeekable
		printf \{qs(0x699cbcf4)}
		waitforsonginitialized
		printf \{qs(0x165d3b6b)}
		SongPause
		printf \{qs(0x07c04dca)}
		SongSeekBink time = <position>
		printf \{qs(0xb0554c2a)}
		waitforsonginitialized
		SongSeek time = <position>
		waitforsonginitialized
		printf \{qs(0x048bcbff)}
		SongUnPause
	endif
endscript

script waitforsonginitialized 
	begin
	printf \{qs(0x7e6cea02)}
	if SongIsInitialized
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript
Waiting_For_Pitching = 0

script Failed_Song_Pitch_Down 
	SongSetPitch \{pitch = -8
		time = 3}
	SongSetMasterVolume \{vol = -20
		time = 3}
	change \{Waiting_For_Pitching = 1}
	Wait \{3
		seconds}
	spawnscriptnow \{end_song}
endscript

script end_song \{song_failed_pitch_streams = 0}
	DisableMic
	if NOT (<song_failed_pitch_streams> = 1)
		KillSpawnedScript \{name = Failed_Song_Pitch_Down}
		if ($Waiting_For_Pitching = 1)
			change \{Waiting_For_Pitching = 0}
		endif
		DestroyEffectSendStack slot = ($starpower_sendeffect_slot)
		SongStop
	else
		printf \{channel = sfx
			qs("\LWe are pitching the stream down because we failed")}
		spawnscriptnow \{Failed_Song_Pitch_Down}
	endif
endscript

script set_whammy_pitchshift 
	SongSetPlayerWhammy player = ($<player_status>.player) whammy_value = (1 - (<control> * 0.057))
endscript

script PauseGh3Sounds 
	lockdsp
	SongPause
	PauseSoundsByBuss \{Master}
	unlockdsp
endscript

script UnpauseGh3Sounds 
	lockdsp
	SongUnPause
	UnpauseSoundsByBuss \{Master}
	UnpauseSoundsByBuss \{ui}
	UnpauseSoundsByBuss \{Crowd_One_Shots}
	UnpauseSoundsByBuss \{Crowd_One_Shots_Negative}
	UnpauseSoundsByBuss \{Crowd_Beds}
	UnpauseSoundsByBuss \{Crowd_Cheers}
	UnpauseSoundsByBuss \{Crowd_Boos}
	UnpauseSoundsByBuss \{Crowd_Nuetral}
	UnpauseSoundsByBuss \{`default`}
	UnpauseSoundsByBuss \{Test_Tones}
	UnpauseSoundsByBuss \{Practice_Band_Playback}
	UnpauseSoundsByBuss \{Test_Tones_DSP}
	UnpauseSoundsByBuss \{Right_Notes_Player2}
	UnpauseSoundsByBuss \{Wrong_Notes_Player1}
	UnpauseSoundsByBuss \{Wrong_Notes_Player2}
	UnpauseSoundsByBuss \{User_Vocal}
	UnpauseSoundsByBuss \{User_Music}
	UnpauseSoundsByBuss \{Encore_Events}
	UnpauseSoundsByBuss \{binkcutscenes}
	unlockdsp
endscript
