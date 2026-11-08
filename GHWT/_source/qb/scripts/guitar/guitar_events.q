guitar_events = [
	{
		type = call
		event = missed_note
		Scr = GuitarEvent_MissedNote
	}
	{
		type = call
		event = unnecessary_note
		Scr = GuitarEvent_UnnecessaryNote
	}
	{
		type = call
		event = hit_notes
		Scr = GuitarEvent_HitNotes
	}
	{
		type = call
		event = hit_note
		Scr = GuitarEvent_HitNote
	}
	{
		type = call
		event = drumfill_hit
		Scr = GuitarEvent_DrumFillHit
	}
	{
		type = call
		event = hit_mine
		Scr = GuitarEvent_HitMine
	}
	{
		type = call
		event = star_power_on
		Scr = GuitarEvent_StarPowerOn
	}
	{
		type = call
		event = star_power_off
		Scr = GuitarEvent_StarPowerOff
	}
	{
		type = spawn
		event = song_failed
		Scr = GuitarEvent_SongFailed
	}
	{
		type = spawn
		event = song_won
		Scr = GuitarEvent_SongWon
	}
	{
		type = spawn
		event = star_sequence_bonus
		Scr = GuitarEvent_StarSequenceBonus
	}
	{
		type = call
		event = whammy_on
		Scr = GuitarEvent_WhammyOn
	}
	{
		type = call
		event = whammy_off
		Scr = GuitarEvent_WhammyOff
	}
	{
		type = call
		event = firstnote_window_open
		Scr = GuitarEvent_FirstNote_Window_Open
	}
]

script create_guitar_events 
	printf qs("\Lcreate_guitar_events %a ..........") a = <player_text>
	GetArraySize \{$guitar_events}
	array_entry = 0
	begin
	event = ($guitar_events [<array_entry>].event)
	type = ($guitar_events [<array_entry>].type)
	ExtendCRC <event> <player_text> out = event
	SetEventHandler response = call_script event = <event> Scr = event_spawner params = {event_spawned = <array_entry>}
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	Block
endscript

script event_spawner 
	spawnscriptnow ($guitar_events [<event_spawned>].Scr) params = {<...>} id = song_event_scripts
endscript

script event_iterator 
	printf qs("\LEvent %e Iterator started with time %d") d = <time_offset> e = <event_string>
	get_song_prefix song = <song_name>
	FormatText checksumname = song '%s_%e' s = <song_prefix> e = <event_string> AddToStringLookup
	array_entry = 0
	if NOT GlobalExists name = <song> type = array
		return
	endif
	GetArraySize $<song>
	if (<array_size> = 0)
		return
	endif
	GetSongTimeMs time_offset = <time_offset>
	begin
	if ((<time> - <skipleadin>) < (($<song> [<array_entry>]).time))
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	array_size = (<array_size> - <array_entry>)
	if (<array_size> = 0)
		return
	endif
	begin
	TimeMarkerReached_SetParams time_offset = <time_offset> array = <song> array_entry = <array_entry> ArrayOfStructures
	begin
	if TimeMarkerReached
		GetSongTimeMs time_offset = <time_offset>
		break
	endif
	WaitOneGameFrame
	repeat
	TimeMarkerReached_ClearParams
	ScriptName = ($<song> [<array_entry>].Scr)
	if ScriptExists <ScriptName>
		spawnscriptnow <ScriptName> params = {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)} id = song_event_scripts
	elseif SymbolIsCFunc <ScriptName>
		<ScriptName> {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script wait_for_correct_frame 
	if NOT ($playing_song_for_real = 1)
		return
	endif
	if wait_for_correct_frame_cfunc
		WaitOneGameFrame
	endif
endscript

script wait_for_correct_frame_obj 
	if NOT ($playing_song_for_real = 1)
		return
	endif
	if (<id> = vocalist || <id> = Drummer)
		return
	endif
	if (<id> = Guitarist)
		if ($current_frame_toggle = 1)
			Wait \{1
				gameframe}
		endif
	else
		if ($current_frame_toggle = 0)
			Wait \{1
				gameframe}
		endif
	endif
endscript

script GuitarEvent_MissedNote \{extended_miss = 0}
	wait_for_correct_frame player = ($<player_status>.player)
	if (<bum_note> = 1)
		Guitar_Wrong_Note_Sound_Logic <...>
	endif
	if ($is_network_game && ($<player_status>.is_local_client = 0))
		if (<silent_miss> = 1)
		endif
	else
		if NOT (($<player_status>.part) = drum)
			PlayerGetVolume player_status = <player_status>
			if NOT (<volume> = 0)
				if (<silent_miss> = 1)
				else
					if NOT (<extended_miss> = 1)
						PlayerSetVolume player_status = <player_status> volume = 0
						UpdateGuitarVolume
						jam_update_volume volume = 0 player = ($<player_status>.player)
					endif
				endif
			endif
		endif
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			if CompositeObjectExists name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = Bass)
					BandManager_MissedNote name = ($<player_status>.band_member)
				endif
			endif
		endif
	endif
	InputArrayGetElement name = <song> index = <array_entry>
	if ($show_play_log = 1)
		output_log_text qs("\LMissed Note (%t)") t = (<gem_array> [0]) color = Orange
	endif
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	FormatText checksumname = highway 'Highway_2D%p' p = <player_text> AddToStringLookup = true
	LegacyDoScreenElementMorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	Wait <half_time> seconds
	if ($<player_status>.star_power_used = 1)
		LegacyDoScreenElementMorph id = <highway> rgba = ($highway_starpower) time = <half_time>
	else
		LegacyDoScreenElementMorph id = <highway> rgba = ($highway_normal) time = <half_time>
	endif
endscript

script GuitarEvent_UnnecessaryNote 
	wait_for_correct_frame player = ($<player_status>.player)
	Guitar_Wrong_Note_Sound_Logic <...>
	if NOT ($is_network_game && ($<player_status>.is_local_client = 0))
		PlayerSetVolume player_status = <player_status> volume = 0
		UpdateGuitarVolume
		jam_update_volume volume = 0 player = ($<player_status>.player)
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			if CompositeObjectExists name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = Bass)
					LaunchEvent type = Anim_MissedNote target = ($<player_status>.band_member)
				endif
			endif
		endif
	endif
	if ($show_play_log = 1)
		if (<array_entry> > 0)
			<songtime> = (<songtime> - ($check_time_early * 1000.0))
			InputArrayGetElement name = <song> index = <array_entry>
			next_note = (<gem_array> [0])
			InputArrayGetElement name = <song> index = (<array_entry> -1)
			prev_note = (<gem_array> [0])
			next_time = (<next_note> - <songtime>)
			prev_time = (<songtime> - <prev_note>)
			if (<prev_time> < ($check_time_late * 1000.0))
				<prev_time> = 1000000.0
			endif
			if (<next_time> < <prev_time>)
				<next_time> = (0 - <next_time>)
				output_log_text qs("\LME: %n (%t)") n = <next_time> t = <next_note> color = red
			else
				output_log_text qs("\LML: %n (%t)") n = <prev_time> t = <prev_note> color = darkred
			endif
		endif
	endif
endscript

script GuitarEvent_HitNotes 
	if ($show_play_log = 1)
		GetGlobalTags \{user_options}
		CastToInteger \{lag_calibration}
		Mod a = <lag_calibration> b = 1000
		<video_offset> = <Mod>
		<audio_offset> = ((<lag_calibration> / 1000) - 1)
		<off_note> = (0 - (<off_note> - ($time_input_offset + <audio_offset> + <video_offset>)))
		CastToInteger \{off_note}
		InputArrayGetElement name = <song> index = <array_entry>
		note_time = (<gem_array> [0])
		if (<off_note> < 0)
			output_log_text qs("\LHE: %n (%t)") n = <off_note> t = <note_time> color = green
		else
			output_log_text qs("\LHL: %n (%t)") n = <off_note> t = <note_time> color = darkgreen
		endif
	endif
	wait_for_correct_frame player = ($<player_status>.player)
	if (<updatevolume> = true)
		PlayerSetVolume player_status = <player_status> volume = 100
		UpdateGuitarVolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
	endif
	if ($Debug_Audible_HitNote = 1)
		SoundEvent \{event = GH_SFX_HitNoteSoundEvent}
	endif
endscript

script GuitarEvent_HitNote 
	wait_for_correct_frame player = <player>
	if GotParam \{kick}
		GuitarEvent_Kick_Drum_Hit_Note player = <player> player_text = <player_text>
	elseif GotParam \{open_note}
		GuitarEvent_Hit_Open_Note player = <player> player_text = <player_text>
	elseif GotParam \{easy_rhythm_note}
		GuitarEvent_Hit_Easy_Rhythm_Note player_text = <player_text>
	else
		if ($game_mode = p2_battle || $boss_battle = 1)
			change structurename = <player_status> last_hit_note = <color>
		endif
		WaitOneGameFrame
		scale = (2.0, 2.0)
		if GotParam \{drum_accent}
			if GotParam \{scale}
				scale = (<scale> * 2.0)
			else
				scale = (1.0, 2.0)
			endif
		endif
		star = ($<player_status>.star_power_used)
		name = <fx_id>
		NoteFX
		Wait \{6
			gameframes}
		Wait \{10
			gameframes}
		if ScreenElementExists id = <fx_id>
			DestroyScreenElement id = <fx_id>
		endif
	endif
endscript

script GuitarEvent_DrumFillHit 
	if GotParam \{kick}
		GuitarEvent_HitNote <...>
	endif
endscript
hit_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		255
		128
		0
		255
	]
	end_color = [
		255
		0
		0
		0
	]
	start_scale = (2.0, 2.0)
	end_scale = (1.0, 1.0)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}
star_hit_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		0
		255
		255
		255
	]
	end_color = [
		0
		255
		255
		0
	]
	start_scale = (2.0, 2.0)
	end_scale = (1.0, 1.0)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}
whammy_particle_params = {
	z_priority = 8.0
	material = sys_Particle_Spark01_sys_Particle_Spark01
	start_color = [
		255
		128
		0
		255
	]
	end_color = [
		255
		0
		0
		0
	]
	start_scale = (1.0, 1.0)
	end_scale = (0.5, 0.5)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.5
}

script hitmine_fade_effect 
	Obj_GetID
	<ObjID> :SE_SetProps alpha = 0 time = <t2> Anim = fast_out rgba = [255 , 0 , 0 , 255]
	<ObjID> :SE_WaitProps
	DestroyScreenElement id = <ObjID>
endscript

script hitmine_grow_effect 
	Obj_GetID
	<ObjID> :SE_SetProps scale = <scale> time = 0.25 Anim = fast_out
endscript

script GuitarEvent_HitMine 
	spawnscriptnow GuitarEvent_HitMine_Spawned params = {<...>}
endscript

script GuitarEvent_HitMine_Spawned 
	if ($<player_status>.highway_position = left)
		SoundEvent \{event = GH_SFX_BattleMode_Mine_Explode_P1}
	else
		SoundEvent \{event = GH_SFX_BattleMode_Mine_Explode_P2}
	endif
	spawnscriptnow hammer_highway params = {other_player_text = <player_text>}
	FormatText checksumname = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	<particle_pos> = (<pos> - (0.0, 20.0))
	ExtendCRC <mine_fx_id> '_hit_particle' out = particle_id
	DestroyScreenElement id = <mine_fx_id>
	CreateScreenElement {
		type = ContainerElement
		id = <mine_fx_id>
		parent = <container_id>
		pos = <particle_pos>
		z_priority = 8.0
		just = [center center]
		pos_anchor = [center center]
	}
	CreateScreenElement {
		type = ContainerElement
		local_id = grow_container
		parent = <mine_fx_id>
		pos = (0.0, 0.0)
		just = [center center]
		pos_anchor = [center center]
		scale = <start_scale>
	}
	<grow_id> = <id>
	<start_scale> = (1.0, 1.0)
	<end_scale> = (3.0, 3.0)
	CreateScreenElement {
		type = SpriteElement
		local_id = top_wave
		pos = (0.0, 0.0)
		texture = icon_attack_explode
		parent = <grow_id>
		rgba = [255 , 255 , 255 , 255]
		blend = Add
		alpha = 0.75
	}
	CreateScreenElement {
		type = SpriteElement
		local_id = sparky
		pos = (0.0, 0.0)
		texture = JOW_Spark02
		parent = <grow_id>
		rgba = [255 , 255 , 255 , 255]
		blend = Add
		alpha = 0.75
		scale = (2.0, 2.0)
	}
	RunScriptOnScreenElement id = <mine_fx_id> hitmine_fade_effect params = {t1 = 0.15 t2 = 0.25}
	RunScriptOnScreenElement id = <grow_id> hitmine_grow_effect params = {scale = <end_scale>}
	<crowd_decrease_count> = $battle_mine_health_decrease_count
	<wait_time> = 0.15
	<wait_time_slice> = (<wait_time> / <crowd_decrease_count>)
	if ($<player_status>.current_num_powerups > 0)
		remove_battle_card player_status = <player_status>
		update_battlecards_remove player_status = <player_status>
	endif
	CastToInteger \{crowd_decrease_count}
	begin
	CrowdDecrease player_status = <player_status>
	Wait <wait_time_slice> seconds
	repeat <crowd_decrease_count>
endscript

script KillMineFX 
	KillSpawnedScript \{name = GuitarEvent_HitMine_Spawned}
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 1
		player = 1}
	<container_pos> = (<pos> + (0.0, 720.0))
	LegacyDoScreenElementMorph id = gem_containerp1 pos = <container_pos>
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 2
		player = 2}
	<container_pos> = (<pos> + (0.0, 720.0))
	LegacyDoScreenElementMorph id = gem_containerp2 pos = <container_pos>
endscript

script GuitarEvent_StarPowerOn 
	wait_for_correct_frame player = <player>
	KillSpawnedScript \{name = highway_pulse_black}
	if ($drum_solo_songtime_paused = 0)
		GH_Star_Power_Verb_On player = <player>
	endif
	StarPowerOn player = <player>
	if ($current_num_players = 4)
		if (all_players_using_starpower)
			spawnscriptnow \{play_group_star_power_animation}
			change \{achievements_121_jigowatts_flag = 1}
		endif
	endif
endscript

script GuitarEvent_StarPowerOff 
	wait_for_correct_frame player = ($<player_status>.player)
	KillSpawnedScript \{name = highway_pulse_black}
	if isSinglePlayerGame
		SoundEvent \{event = Star_Power_Release_Center_Gh4}
		SoundEvent \{event = Star_Power_Release_Front_GH4}
	else
		spawnscriptnow Star_Power_Release_SFX_Multiplayer params = {player = ($<player_status>.player)}
	endif
	GH_Star_Power_Verb_Off player = ($<player_status>.player)
	spawnscriptnow rock_meter_star_power_off params = {player_text = <player_text>}
	SpawnScriptLater Kill_StarPower_StageFX params = {<...>}
	FormatText checksumname = cont 'starpower_container_left%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		LegacyDoScreenElementMorph id = <cont> alpha = 0
	endif
	FormatText checksumname = cont 'starpower_container_right%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <cont>
		LegacyDoScreenElementMorph id = <cont> alpha = 0
	endif
	FormatText checksumname = highway 'Highway_2D%p' p = <player_text> AddToStringLookup = true
	if ScreenElementExists id = <highway>
		SetScreenElementProps id = <highway> rgba = ($highway_normal_x2)
	endif
	spawnscriptnow \{Kill_StarPower_Camera}
endscript

script GuitarEvent_PreFretbar 
	spawnscriptnow \{GH_Audible_Metronome}
	waittime = 0.18
	Wait <waittime> seconds
	spawnscriptnow \{Crowd_Anticipation}
endscript

script GH_Audible_Metronome 
	if ($Debug_Audible_Metronome = 1)
		Wait ((0.25 + (($default_lag_settings.xenon.input_lag_ms) * 0.001)) - 0.008333) seconds
		SoundEvent \{event = GH_SFX_BeatSoundEvent}
	endif
endscript

script GuitarEvent_StarPowerClapOnBeat 
	if (($player1_status.star_power_used = 1) && (($player1_status.part = Bass) || ($player1_status.part = guitar)))
		ActivateStarPowerPulse player = ($player1_status.controller) num = 1 length = 10 strength = 11 priority = 1
	endif
	if (($player2_status.star_power_used = 1) && (($player2_status.part = Bass) || ($player2_status.part = guitar)))
		ActivateStarPowerPulse player = ($player2_status.controller) num = 1 length = 10 strength = 11 priority = 1
	endif
	if (($player3_status.star_power_used = 1) && (($player3_status.part = Bass) || ($player3_status.part = guitar)))
		ActivateStarPowerPulse player = ($player3_status.controller) num = 1 length = 10 strength = 11 priority = 1
	endif
	if (($player4_status.star_power_used = 1) && (($player4_status.part = Bass) || ($player4_status.part = guitar)))
		ActivateStarPowerPulse player = ($player4_status.controller) num = 1 length = 10 strength = 11 priority = 1
	endif
	if (($player1_status.star_power_used = 1) || ($player2_status.star_power_used = 1) || ($player3_status.star_power_used = 1) || ($player4_status.star_power_used = 1))
		if ($Clap_Fade = 1)
			printf \{channel = sfx
				qs("\LWHAT")}
			change \{Clap_Fade = 0}
			spawnscriptnow \{Clap_Fade_Kill}
		endif
		if ($game_mode != tutorial)
			if (($Star_Clap_Normal = 1) || ($Star_Clap_LeftCenterRight = 1))
				printf \{qs("\LNormal")}
				SoundEvent \{event = $Current_Crowd_Clap_Normal_SoundEvent}
			elseif ($Star_Clap_Middle = 1)
				printf \{qs("\LMiddle")}
				SoundEvent \{event = $Current_Crowd_Clap_Middle_SoundEvent}
			elseif ($Star_Clap_Left = 1)
				printf \{qs("\LLeft")}
				SoundEvent \{event = $Current_Crowd_Clap_Left_SoundEvent}
			elseif ($Star_Clap_Right = 1)
				printf \{qs("\Lright")}
				SoundEvent \{event = $Current_Crowd_Clap_Right_SoundEvent}
			elseif ($Star_Clap_Right_Middle = 1)
				printf \{qs("\LRight_Middle")}
				SoundEvent \{event = $Current_Crowd_Clap_Right_Middle_SoundEvent}
			elseif ($Star_Clap_Left_Middle = 1)
				printf \{qs("\LLeft_Middle")}
				SoundEvent \{event = $Current_Crowd_Clap_Left_Middle_SoundEvent}
			endif
		endif
	elseif ($Clap_Fade = 1)
		printf \{channel = sfx
			qs("\Lclap fading mo fo")}
		if ($Star_Clap_Normal = 1)
			printf \{qs("\LNormal")}
			SoundEvent \{event = $Current_Crowd_Clap_Normal_SoundEvent}
		elseif ($Star_Clap_Middle = 1)
			printf \{qs("\LMiddle")}
			SoundEvent \{event = $Current_Crowd_Clap_Middle_SoundEvent}
		elseif ($Star_Clap_Left = 1)
			printf \{qs("\LLeft")}
			SoundEvent \{event = $Current_Crowd_Clap_Left_SoundEvent}
		elseif ($Star_Clap_Right = 1)
			printf \{qs("\LRight")}
			SoundEvent \{event = $Current_Crowd_Clap_Right_SoundEvent}
		elseif ($Star_Clap_Right_Middle = 1)
			printf \{qs("\LRight_Middle")}
			SoundEvent \{event = $Current_Crowd_Clap_Right_Middle_SoundEvent}
		elseif ($Star_Clap_Left_Middle = 1)
			printf \{qs("\LLeft_Middle")}
			SoundEvent \{event = $Current_Crowd_Clap_Left_Middle_SoundEvent}
		endif
	else
		if ($CrowdListenerStateClapOn1234 = 1)
			if ($Star_Clap_Normal = 1)
				printf \{qs("\LNormal")}
				SoundEvent \{event = $Current_Crowd_Clap_Normal_SoundEvent}
			elseif ($Star_Clap_Middle = 1)
				printf \{qs("\LMiddle")}
				SoundEvent \{event = $Current_Crowd_Clap_Middle_SoundEvent}
			elseif ($Star_Clap_Left = 1)
				printf \{qs("\LLeft")}
				SoundEvent \{event = $Current_Crowd_Clap_Left_SoundEvent}
			elseif ($Star_Clap_Right = 1)
				printf \{qs("\LRight")}
				SoundEvent \{event = $Current_Crowd_Clap_Right_SoundEvent}
			elseif ($Star_Clap_Right_Middle = 1)
				printf \{qs("\LRight_Middle")}
				SoundEvent \{event = $Current_Crowd_Clap_Right_Middle_SoundEvent}
			elseif ($Star_Clap_Left_Middle = 1)
				printf \{qs("\LLeft_Middle")}
				SoundEvent \{event = $Current_Crowd_Clap_Left_Middle_SoundEvent}
			endif
		endif
	endif
endscript

script GuitarEvent_Fretbar 
	GuitarEvent_Fretbar_CFunc
endscript

script GuitarEvent_Fretbar_Early 
endscript

script GuitarEvent_Fretbar_Late 
endscript

script check_first_note_formed 
	GetSongTime
	<StartTime> = (<songtime> - 0.0167)
	duration = ($<player_status>.check_time_early + $<player_status>.check_time_late)
	begin
	GetHeldPattern controller = ($<player_status>.controller) player = ($<player_status>.player) player_status = <player_status>
	if (<strum> = <hold_pattern>)
		PlayerSetVolume player_status = <player_status> volume = 100
		UpdateGuitarVolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
	endif
	WaitOneGameFrame
	GetSongTime
	if ((<songtime> - <StartTime>) >= <duration>)
		break
	endif
	repeat
endscript

script GuitarEvent_FirstNote_Window_Open 
	if IsGuitarController controller = ($<player_status>.controller)
		GetStrumPattern entry = 0 song = <song>
		spawnscriptnow check_first_note_formed params = {strum = <strum> player_status = <player_status>}
	else
		PlayerSetVolume player_status = <player_status> volume = 100
		UpdateGuitarVolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
	endif
endscript
blueWhammyFXID01p1 = JOW_NIL
blueWhammyFXID02p1 = JOW_NIL
greenWhammyFXID01p1 = JOW_NIL
greenWhammyFXID02p1 = JOW_NIL
orangeWhammyFXID01p1 = JOW_NIL
orangeWhammyFXID02p1 = JOW_NIL
redWhammyFXID01p1 = JOW_NIL
redWhammyFXID02p1 = JOW_NIL
yellowWhammyFXID01p1 = JOW_NIL
yellowWhammyFXID02p1 = JOW_NIL
blueWhammyFXID01p2 = JOW_NIL
blueWhammyFXID02p2 = JOW_NIL
greenWhammyFXID01p2 = JOW_NIL
greenWhammyFXID02p2 = JOW_NIL
orangeWhammyFXID01p2 = JOW_NIL
orangeWhammyFXID02p2 = JOW_NIL
redWhammyFXID01p2 = JOW_NIL
redWhammyFXID02p2 = JOW_NIL
yellowWhammyFXID01p2 = JOW_NIL
yellowWhammyFXID02p2 = JOW_NIL

script Destroy_AllWhammyFX 
	WhammyFXOffAll \{player_status = player1_status}
	WhammyFXOffAll \{player_status = player2_status}
endscript

script GuitarEvent_WhammyOn 
	if (<player> = 1)
		lock = whammyon_lockp1
	else
		lock = whammyon_lockp2
	endif
	change globalname = <lock> newvalue = 1
	wait_for_correct_frame player = <player>
	WhammyFXOn <...>
	change globalname = <lock> newvalue = 0
endscript

script GuitarEvent_WhammyOff 
	if (<player> = 1)
		lock = whammyon_lockp1
	else
		lock = whammyon_lockp2
	endif
	begin
	if NOT ($<lock>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	wait_for_correct_frame player = <player>
	WhammyFXOff <...>
endscript

script GuitarEvent_SongFailed 
	if ($failed_song = 1)
		return
	endif
	change \{playing_song_for_real = 0}
	if ($game_mode = training || $game_mode = tutorial)
		return
	endif
	destroy_cameracut_ingame_menu
	if ($is_network_game)
		online_fail_song
	elseif ($game_mode = p2_battle)
		GuitarEvent_SongWon \{battle_win = 1}
	else
		KillSpawnedScript \{name = guitar_jam_playback_recording}
		KillSpawnedScript \{name = guitar_jam_drum_playback}
		KillSpawnedScript \{name = jam_input_whammy_spawned}
		jam_stop_all_samples
		jam_deinit_reverb
		KillSpawnedScript \{name = GuitarEvent_SongWon_Spawned}
		if NOT ScriptIsRunning \{GuitarEvent_SongFailed_Spawned}
			spawnscriptnow \{GuitarEvent_SongFailed_Spawned}
		endif
	endif
endscript

script GuitarEvent_SongFailed_Spawned 
	disable_pause
	if ($is_attract_mode = 1)
		ScriptAssert \{'Song failure in attract mode, this is bad'}
		return
	endif
	if NOT ($boss_battle = 1)
		disable_highway_prepass
		disable_bg_viewport
	endif
	LightShow_SongFailed
	if ($is_network_game)
		disable_pause
		if ($net_pause = 1)
			net_unpausegh
		endif
		mark_unsafe_for_shutdown
	endif
	GetSongTimeMs
	change failed_song_time = <time>
	PauseGame
	Progression_SongFailed
	if ($boss_battle = 1)
		disable_pause
		preload_movie = 'Player2_wins'
		KillMovie \{TextureSlot = 1}
		FormatText checksumname = preload_movie_checksum '%s' s = <preload_movie>
		change g_you_rock_movie = <preload_movie_checksum>
		FormatText TextName = winner_text qs("%s Rocks!") s = ($current_boss.character_name)
		winner_space_between = (50.0, 0.0)
		winner_scale = 1.0
		if ($current_boss.character_profile = morello)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = slash)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = satan)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		spawnscriptnow \{wait_and_play_you_rock_movie}
		Wait \{0.2
			seconds}
		spawnscriptnow \{waitAndKillHighway}
		spawnscriptnow create_exploding_text params = {parent = 'you_rock_physics' text = <winner_text>}
	endif
	UnPauseGame
	if ($is_network_game)
		ui_event_wait_for_safe
		disable_pause
	endif
	SoundEvent \{event = Crowd_Fail_Song_SFX}
	SoundEvent \{event = $Current_Crowd_Transition_Neutral_To_Bad_L}
	SoundEvent \{event = $Current_Crowd_Transition_Neutral_To_Bad_R}
	SoundEvent \{event = GH_SFX_You_Lose_Single_Player}
	PlayLossVideo
	Transition_Play \{type = songlost}
	Transition_Wait
	change \{current_transition = none}
	disable_pause
	PauseGame
	show_calibration = 0
	GetGlobalTags \{user_options
		param = has_calibrated}
	if (<has_calibrated> = 0)
	endif
	if ($special_event_stage != 0)
		<show_calibration> = 0
	endif
	GameMode_GetType
	if ($is_network_game = 0)
		ui_event_wait_for_safe
		Wait \{1
			gameframe}
		if ui_event_exists_in_stack \{name = 'pausemenu'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = uistate_gameplay
				}}
		elseif ui_event_exists_in_stack \{name = 'song_unpause'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = uistate_gameplay
				}}
		endif
		if (<show_calibration> = 1)
			SetGlobalTags \{user_options
				params = {
					has_calibrated = 1
				}}
			Body = qs("You seem to be having a hard time hitting the notes. Maybe you'd like to blame it on the lag and calibrate for your TV?")
			spawnscriptnow {
				ui_event {
					params = {
						event = menu_change
						data = {
							state = uistate_options_calibrate_lag_warning
							Body = <Body>
							cancel_script = menu_replace_to_fail_song
							yes_func_params = {go_back_script = menu_replace_to_fail_song}
						}
					}
				}
			}
		else
			spawnscriptnow \{ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_fail_song
					}
				}}
		endif
	elseif (<type> = career)
		ui_event_get_top
		if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
			spawnscriptnow \{ui_event
				params = {
					event = menu_replace
					data = {
						state = uistate_fail_song
					}
				}}
		else
			spawnscriptnow \{ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_fail_song
					}
				}}
		endif
	else
		ui_event_get_top
		if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
			spawnscriptnow \{ui_event
				params = {
					event = menu_replace
					data = {
						state = uistate_online_post_game_lobby
					}
				}}
		else
			spawnscriptnow \{ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_online_post_game_lobby
					}
				}}
		endif
	endif
	if ($current_num_players = 1)
		SoundEvent \{event = Crowd_Fail_Song_SFX}
		BG_Crowd_Front_End_Silence \{immediate = 1}
	else
	endif
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
	KillSpawnedScript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
	destroy_exploding_text \{parent = 'you_rock_2_physics'}
endscript
GPULog_OutputFilename = 'none'

script GuitarEvent_SongWon \{battle_win = 0}
	change \{playing_song_for_real = 0}
	destroy_cameracut_ingame_menu
	if ($output_gpu_log = 1)
		if IsPs3
			FormatText \{TextName = filename
				'%s_gpu_ps3'
				s = $current_level
				DontAssertForChecksums}
		else
			FormatText \{TextName = filename
				'%s_gpu'
				s = $current_level
				DontAssertForChecksums}
		endif
		if NOT StringEquals \{a = $GPULog_OutputFilename
				b = 'none'}
			<filename> = $GPULog_OutputFilename
		endif
		TextOutputEnd output_text filename = <filename>
	endif
	if NotCD
		if ($output_song_stats = 1)
			FormatText \{TextName = filename
				'%s_stats'
				s = $current_song
				DontAssertForChecksums}
			TextOutputStart
			TextOutput \{text = qs("\LPlayer 1")}
			FormatText TextName = text qs("\LScore: %s") s = ($player1_status.score) DontAssertForChecksums
			TextOutput text = <text>
			FormatText TextName = text qs("\LNotes Hit: %n of %t") n = ($player1_status.notes_hit) t = ($player1_status.total_notes) DontAssertForChecksums
			TextOutput text = <text>
			FormatText TextName = text qs("\LBest Run: %r") r = ($player1_status.best_run) DontAssertForChecksums
			TextOutput text = <text>
			FormatText TextName = text qs("\LMax Notes: %m") m = ($player1_status.max_notes) DontAssertForChecksums
			TextOutput text = <text>
			FormatText TextName = text qs("\LBase score: %b") b = ($player1_status.base_score) DontAssertForChecksums
			TextOutput text = <text>
			if (($player1_status.base_score) = 0)
				FormatText \{TextName = text
					qs("\LScore Scale: n/a")}
			else
				FormatText TextName = text qs("\LScore Scale: %s") s = (($player1_status.score) / ($player1_status.base_score)) DontAssertForChecksums
			endif
			TextOutput text = <text>
			if (($player1_status.total_notes) = 0)
				FormatText \{TextName = text
					qs("\LNotes Hit Percentage: n/a")}
			else
				FormatText TextName = text qs("\LNotes Hit Percentage: %s") s = ((($player1_status.notes_hit) / ($player1_status.total_notes)) * 100.0) DontAssertForChecksums
			endif
			TextOutput text = <text>
			TextOutputEnd output_text filename = <filename>
		endif
	endif
	if ($current_num_players = 2)
		GetSongTimeMs
		if ($last_time_in_lead_player = 0)
			change structurename = player1_status time_in_lead = ($player1_status.time_in_lead + <time> - $last_time_in_lead)
		elseif ($last_time_in_lead_player = 1)
			change structurename = player2_status time_in_lead = ($player2_status.time_in_lead + <time> - $last_time_in_lead)
		endif
		change \{last_time_in_lead_player = -1}
	endif
	if ($game_mode = p2_battle)
		if NOT (<battle_win> = 1)
			change \{save_current_powerups_p1 = $current_powerups_p1}
			change \{save_current_powerups_p2 = $current_powerups_p2}
			change structurename = player1_status save_num_powerups = ($player1_status.current_num_powerups)
			change structurename = player2_status save_num_powerups = ($player2_status.current_num_powerups)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			change structurename = player1_status save_health = <p1_health>
			change structurename = player2_status save_health = <p2_health>
			battlemode_killspawnedscripts
			if ScreenElementExists \{id = battlemode_container}
				DestroyScreenElement \{id = battlemode_container}
			endif
			change \{battle_do_or_die = 1}
			change battle_do_or_die_speed_scale = ($battle_do_or_die_speed_scale + $battle_do_or_die_speed_scale_increase)
			if ($battle_do_or_die_speed_scale < $Hyperspeed_Fastest)
				change \{battle_do_or_die_speed_scale = $Hyperspeed_Fastest}
			endif
			change battle_do_or_die_attack_scale = ($battle_do_or_die_attack_scale + $battle_do_or_die_attack_scale_increase)
			if ($battle_do_or_die_attack_scale > $battle_do_or_die_attack_scale_max)
				change \{battle_do_or_die_attack_scale = $battle_do_or_die_attack_scale_max}
			endif
		else
			battlemode_killspawnedscripts
			change \{battle_do_or_die = 0}
			change \{battle_do_or_die_speed_scale = 1.0}
			change \{battle_do_or_die_attack_scale = 1.0}
		endif
	endif
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	KillSpawnedScript \{name = jam_input_whammy_spawned}
	jam_stop_all_samples
	jam_deinit_reverb
	KillSpawnedScript \{name = GuitarEvent_SongFailed_Spawned}
	if NOT ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
		spawnscriptnow \{GuitarEvent_SongWon_Spawned}
	endif
endscript

script GuitarEvent_SongWon_Spawned 
	if ($is_attract_mode = 1)
		ui_event \{event = menu_back}
		return
	endif
	if NOT ($game_mode = p2_battle)
	endif
	change track_last_song = ($current_song)
	change \{calibrate_lag_failed_num = 0}
	GameMode_GetType
	<end_session> = 0
	if (<type> = career)
		if progression_check_for_gig_end
			<end_session> = 1
		endif
	elseif (<type> = quickplay)
		if quickplay_end_of_gig_list
			<end_session> = 1
		endif
	endif
	OnExitRun SongWon_WriteLeaderboardStats params = {song_checksum = ($current_song) end_credits = ($end_credits) end_session = <end_session>}
	if ($is_network_game)
		mark_unsafe_for_shutdown
		if ($shutdown_game_for_signin_change_flag = 1)
			return
		endif
		if ($net_pause = 1)
			net_unpausegh
		endif
		if ($player2_present)
			SendNetMessage {
				type = net_win_song
				note_streak = ($player1_status.best_run)
				notes_hit = ($player1_status.notes_hit)
				total_notes = ($player1_status.total_notes)
			}
		endif
	endif
	if ($game_mode = training)
		if ($special_event_stage = 0)
			generic_event_choose \{state = uistate_song_breakdown
				data = {
					for_practice = 1
				}}
		endif
		return
	elseif ($game_mode = tutorial)
		return
	endif
	Progression_EndCredits_Done
	PauseGame
	disable_pause
	if ($battle_do_or_die = 0)
		if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = p3_career || $game_mode = p4_career || $game_mode = p3_quickplay || $game_mode = p4_quickplay)
			SoundEvent \{event = You_Rock_End_SFX}
			spawnscriptnow \{Cheer_Before_Explosion}
		endif
	endif
	printf \{channel = sfx
		qs("\LSONG WON SPAWNED: Current_Crowd_Looping_BG_Area_Good = %s")
		s = $Current_Crowd_Looping_BG_Area_Good}
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good}
	Crowd_Surge_And_Sustain_At_End_Of_Song
	spawnscriptnow \{You_Rock_Waiting_Crowd_SFX}
	tie = false
	text_pos = (640.0, 360.0)
	rock_legend = 0
	fit_dims = (350.0, 0.0)
	if ($battle_do_or_die = 1)
		SoundEvent \{event = Do_Or_Die_SFX}
		winner_text = qs("Do or Die!")
		winner_space_between = (65.0, 0.0)
		winner_scale = 1.8
	else
		if ($game_mode = p2_battle)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			if (<p2_health> > <p1_health>)
				winner = qs("Two")
			else
				winner = qs("One")
			endif
			if ($is_network_game)
				if (<p2_health> > <p1_health>)
					name = ($gamertag_1)
				else
					name = ($gamertag_0)
				endif
				SetPlayerInfo 1 save_health = <p1_health>
				SetPlayerInfo 2 save_health = <p2_health>
				FormatText TextName = winner_text qs("%s") s = <name>
				<text_pos> = (640.0, 240.0)
			else
				FormatText TextName = winner_text qs("Player %s Rocks!") s = <winner>
			endif
			winner_space_between = (50.0, 0.0)
			winner_scale = 1.5
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			p1_score = ($player1_status.score)
			p2_score = ($player2_status.score)
			if (<p2_score> > <p1_score>)
				winner = qs("Two")
			elseif (<p1_score> > <p2_score>)
				winner = qs("One")
			else
				<tie> = true
			endif
			if (<tie> = true)
				winner_text = qs("TIE!")
				winner_space_between = (15.0, 0.0)
				winner_scale = 0.5
				fit_dims = (100.0, 0.0)
			else
				if ($is_network_game)
					if (<p2_score> > <p1_score>)
						name = ($gamertag_1)
					else
						name = ($gamertag_0)
					endif
					FormatText TextName = winner_text <name>
					<text_pos> = (640.0, 240.0)
				else
					FormatText TextName = winner_text qs("Player %s Rocks!") s = <winner>
				endif
				winner_space_between = (50.0, 0.0)
				winner_scale = 1.5
			endif
		else
			if ($is_network_game = 1)
				opponent_score = ($band2_status.score)
				our_score = ($band1_status.score)
				if (<opponent_score> > <our_score>)
					winner_text = qs("You Got")
					winner_space_between = (40.0, 0.0)
					fit_dims = (350.0, 0.0)
					winner_scale = 1.0
				else
					winner_text = qs("You Rock!")
					winner_space_between = (40.0, 0.0)
					fit_dims = (350.0, 0.0)
					winner_scale = 1.0
				endif
			else
				winner_text = qs("You Rock!")
				winner_space_between = (40.0, 0.0)
				fit_dims = (350.0, 0.0)
				winner_scale = 1.0
			endif
		endif
	endif
	spawnscriptnow \{waitAndKillHighway}
	KillSpawnedScript \{name = jiggle_text_array_elements}
	spawnscriptnow \{wait_and_play_you_rock_movie}
	Create_HandsOfGod text = <winner_text>
	SoundEvent \{event = You_Rock_End_SFX}
	text_pos = (640.0, 360.0)
	rock_legend = 0
	fit_dims = (350.0, 0.0)
	if ($is_network_game = 1)
		if NOT GameMode_IsCooperative
			if (<tie> = false && $battle_do_or_die = 0)
				GameMode_GetNumPlayers
				if (<num_players> > 2)
					opponent_score = ($band2_status.score)
					our_score = ($band1_status.score)
					if (<opponent_score> > <our_score>)
						<yourock_text_2> = qs("Rocked!")
						spawnscriptnow create_exploding_text params = {parent = 'you_rock_2_physics' text = <yourock_text_2> placement = bottom}
					endif
				else
					<yourock_text_2> = qs("Rocks!")
					spawnscriptnow create_exploding_text params = {parent = 'you_rock_2_physics' text = <yourock_text_2> placement = bottom}
				endif
			endif
		endif
	endif
	change \{old_song = none}
	if ($battle_do_or_die = 0)
		Progression_SongWon
		if ($current_transition = preencore)
			end_song
			UnPauseGame
			Transition_Play \{type = preencore}
			Transition_Wait
			change \{current_transition = none}
			PauseGame
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
				ui_event \{event = menu_replace
					data = {
						state = uistate_song_breakdown
						for_encore = 1
						no_sound
					}}
			else
				generic_event_choose \{no_sound
					state = uistate_song_breakdown
					data = {
						for_encore = 1
					}}
			endif
			encore_transition = 1
		elseif ($current_transition = preboss)
			end_song
			UnPauseGame
			Transition_Play \{type = preboss}
			Transition_Wait
			change \{current_transition = none}
			PauseGame
			change \{use_last_player_scores = 1}
			change old_song = ($current_song)
			change \{show_boss_helper_screen = 1}
			change \{net_ready_to_start = 0}
			spawnscriptnow \{start_boss}
			generic_event_back \{nosound
				state = uistate_gameplay}
			return
		else
			UnPauseGame
			if ($end_credits = 1 && $current_level = load_z_newyork)
				Transition_Play \{type = FinalBandOutro}
			else
				Transition_Play \{type = songwon}
			endif
			Transition_Wait
			change \{current_transition = none}
			PauseGame
		endif
	else
		UnPauseGame
		Transition_Play \{type = songwon}
		KillSpawnedScript \{name = Do_Or_Die_Helper_Text}
		if ScreenElementExists \{id = do_or_die_helper_container}
			DestroyScreenElement \{id = do_or_die_helper_container}
		endif
		spawnscriptnow \{Do_Or_Die_Helper_Text
			params = {
				parent_id = yourock_text
			}}
		Wait \{0.1
			seconds}
		spawnscriptnow \{waitAndKillHighway}
		Wait \{6
			seconds}
		change \{current_transition = none}
		PauseGame
	endif
	if ($battle_do_or_die = 1)
		printf \{qs("\LBATTLE MODE, Song Won, Begin Do or Die")}
		if ($is_network_game)
			if ScreenElementExists \{id = HandsOfGod}
				DestroyScreenElement \{id = HandsOfGod}
			endif
			generic_event_choose \{state = uistate_play_song}
		else
			spawnscriptnow \{fail_song_menu_select_retry_song
				params = {
					do_or_die = 1
				}}
		endif
		KillSpawnedScript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		destroy_exploding_text \{parent = 'you_rock_2_physics'}
	elseif ($end_credits = 1 && $current_song = $final_credits_song)
		KillSpawnedScript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		destroy_exploding_text \{parent = 'you_rock_2_physics'}
		change \{end_credits = 0}
		career_song_ended_select_quit \{for_credits_venue = 1}
		get_progression_globals ($current_progression_flag)
		get_movie_id_by_name movie = ($<tier_global>.end_movie)
		i = 1
		begin
		GetPlayerInfo <i> controller
		get_savegame_from_controller controller = <controller>
		SetGlobalTags <id> params = {unlocked = 1} savegame = <savegame>
		i = (<i> + 1)
		repeat ($current_num_players)
		get_movie_id_by_name movie = ($<tier_global>.end_movie)
		i = 1
		begin
		GetPlayerInfo <i> controller
		get_savegame_from_controller controller = <controller>
		SetGlobalTags <id> params = {unlocked = 1} savegame = <savegame>
		i = (<i> + 1)
		repeat ($current_num_players)
		PlayMovieAndWait movie = ($<tier_global>.end_movie)
		ui_memcard_autosave \{event = menu_back
			state = uistate_gig_posters
			data = {
				all_active_players = true
			}}
	else
		KillSpawnedScript \{name = create_exploding_text}
		destroy_all_exploding_text
		if NOT GotParam \{encore_transition}
			if ($progression_beat_game_last_song = 1)
				ui_event \{event = menu_change
					data = {
						state = uistate_beat_game
					}}
			else
				loading_transition = 0
				GameMode_GetType
				if (<type> = career)
					stats_song_checksum = ($current_song)
					if progression_set_new_song_in_gig_list
						loading_transition = 1
					endif
				elseif (<type> = quickplay)
					stats_song_checksum = ($current_song)
					if quickplay_set_new_song_in_gig_list
						loading_transition = 1
					endif
				endif
				if (<loading_transition> = 1)
					change \{my_trans_flag = 1}
					ui_event_get_top
					if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
						ui_event \{event = menu_replace
							data = {
								state = uistate_song_breakdown
								normal_breakdown = 1
								no_sound
							}}
					else
						generic_event_choose \{no_sound
							state = uistate_song_breakdown
							data = {
								normal_breakdown = 1
							}}
					endif
				else
					if ($is_network_game = 1 && <type> != career)
						ui_event_get_top
						if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
							ui_event \{event = menu_replace
								data = {
									state = uistate_online_post_game_lobby
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_online_post_game_lobby
								}}
						endif
					else
						ui_event_get_top
						if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
							ui_event \{event = menu_replace
								data = {
									state = uistate_song_breakdown
									gig_complete = 1
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_song_breakdown
									gig_complete = 1
								}}
						endif
					endif
				endif
			endif
		endif
	endif
	if ($is_network_game)
		if (GotParam loading_transition)
			if (<loading_transition> = 0)
				mark_safe_for_shutdown
			endif
		else
			mark_safe_for_shutdown
		endif
	endif
endscript

script SongWon_WriteLeaderboardStats 
	RequireParams \{[
			song_checksum
			end_session
		]
		all}
	printf \{qs("\LSongWon_WriteLeaderboardStats")}
	printstruct <...>
	if ($is_network_game = 1)
		if Achievements_IsCheatingAutoKick
			autokick_cheating = 1
		else
			autokick_cheating = 0
		endif
		if NOT ($Cheat_AlwaysSlide = 1 || (<autokick_cheating> = 1))
			if ($game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career)
				if (<end_credits> = 1)
					NetSessionFunc \{obj = session
						func = end_active_session}
				else
					net_write_single_player_stats song_checksum = <song_checksum> end_session = <end_session>
				endif
			else
				online_song_end_write_stats song_checksum = <song_checksum>
			endif
		else
			NetSessionFunc \{obj = session
				func = end_active_session}
		endif
	else
		if ($game_mode = p2_battle || $is_attract_mode = 1 || $boss_battle = 1 || <end_credits> = 1)
			end_singleplayer_game
			if ($game_mode = p2_battle)
				spawnscriptnow \{xenon_singleplayer_session_complete_uninit
					params = {
						song_failed
					}}
			else
				spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
			endif
		else
			if (<song_checksum> != jamsession)
				net_write_single_player_stats song_checksum = <song_checksum> end_session = <end_session>
			elseif (<song_checksum> = jamsession && <end_session> = 1)
				end_singleplayer_game
			endif
		endif
	endif
	if (<end_credits> = 1)
		return
	endif
	GameMode_GetType
	if (<type> = career)
		if ($is_network_game = 1)
			if IsHost
				agora_update
			endif
		else
			agora_update
		endif
	endif
	if ($is_network_game = 1)
		if IsHost
			agora_write_stats song_checksum = <song_checksum>
		endif
	elseif NOT ($boss_battle = 1)
		if NOT ($devil_finish)
			agora_write_stats song_checksum = <song_checksum>
		endif
	endif
endscript

script kill_you_rock_movie 
	KillMovie \{TextureSlot = 1}
endscript

script Do_Or_Die_Helper_Text 
	CreateScreenElement \{type = ContainerElement
		id = do_or_die_helper_container
		parent = root_window
		pos = (0.0, 0.0)}
	FormatText \{checksumname = text_checksum
		'do_or_die_helper'}
	percent = ((((1.0 - $battle_do_or_die_speed_scale) * 100.0) * ($battle_do_or_die_speed_scale_percent / ((0.0 - $battle_do_or_die_speed_scale_increase) * 100.0))) + 100.0)
	percent = (<percent> + 0.5)
	CastToInteger \{percent}
	FormatText TextName = text qs("Highway scroll speed increased to %d\%") d = <percent>
	CreateScreenElement {
		type = TextElement
		id = <text_checksum>
		parent = do_or_die_helper_container
		pos = (640.0, 500.0)
		text = <text>
		font = fontgrid_text_a8
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	FormatText \{checksumname = text_checksum2
		'do_or_die_helper2'}
	percent = ($battle_do_or_die_attack_scale * 100.0)
	CastToInteger \{percent}
	FormatText TextName = text qs("Attack strength increased to %d\%") d = <percent>
	CreateScreenElement {
		type = TextElement
		id = <text_checksum2>
		parent = do_or_die_helper_container
		pos = (640.0, 540.0)
		text = <text>
		font = fontgrid_text_a8
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	Wait \{5
		seconds}
	LegacyDoScreenElementMorph {
		id = <text_checksum>
		alpha = 0
		time = 1
	}
	LegacyDoScreenElementMorph {
		id = <text_checksum2>
		alpha = 0
		time = 1
	}
endscript

script Boss_Unlocked_Text 
	CreateScreenElement \{type = ContainerElement
		id = boss_unlocked_text_container
		parent = root_window
		pos = (0.0, 0.0)}
	if ($current_song = bosstom)
		FormatText \{TextName = boss
			qs("\LTom Morello")}
		pos = (634.0, 580.0)
	elseif ($current_song = bossslash)
		pos = (634.0, 580.0)
		FormatText \{TextName = boss
			qs("\LSlash")}
	elseif ($current_song = bossdevil)
		pos = (800.0, 580.0)
		FormatText \{TextName = boss
			qs("\LLou")}
	endif
	FormatText \{TextName = unlocked
		qs("unlocked")}
	FormatText \{TextName = visit_store
		qs("VISIT STORE")}
	FormatText TextName = text qs("\L%s %b, %v") s = <boss> b = <unlocked> v = <visit_store>
	FormatText \{checksumname = boss_unlocked
		'boss_unlocked'}
	if ScreenElementExists id = <boss_unlocked>
		DestroyScreenElement id = <boss_unlocked>
	endif
	CreateScreenElement {
		type = TextElement
		id = <boss_unlocked>
		parent = boss_unlocked_text_container
		pos = <pos>
		text = <text>
		font = fontgrid_text_a11
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	Wait \{3
		seconds}
	if ScreenElementExists id = <boss_unlocked>
		LegacyDoScreenElementMorph {
			id = <boss_unlocked>
			alpha = 0
			time = 1
		}
	endif
endscript
g_you_rock_movie = none

script create_you_rock_effect \{player_status = player1_status}
	printf \{qs(0xd42f6229)
		a = $g_you_rock_movie}
	switch ($g_you_rock_movie)
		case Player1_wins
		case Player2_wins
		case Fret_Flames
		case `Satan-Battle_WIN`
		case `Satan-Battle_LOSS`
		case Golden_Guitar
		default
	endswitch
	pos_table = ($highway_pos_table [(($<player_status>.player) -1)])
endscript

script wait_and_play_you_rock_movie 
	if ($is_network_game = 1)
		if ($player2_present = 1)
			create_you_rock_effect
		endif
	else
		create_you_rock_effect
	endif
endscript

script waitAndKillHighway 
	Wait \{0.5
		seconds}
	disable_bg_viewport
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
time_to_next_beat2 = -1
next_beat_time2 = -1
tempo_iterator_offset = 0
time_offset = 0

script tempo_matching_iterator 
	printf qs("\Ltempo_matching_iterator started with time %d") d = <time_offset>
	change time_offset = <time_offset>
	Band_EnableTempoIterator
endscript
measure_callback = nullscript
beat_callback = nullscript

script SetMeasureCallback 
	if GotParam \{callback}
		change measure_callback = <callback>
	else
	endif
endscript

script ClearMeasureCallbacks 
	change \{measure_callback = nullscript}
endscript

script SetBeatCallback 
	if GotParam \{callback}
		change beat_callback = <callback>
	else
	endif
endscript

script GetTimeToNextBeat 
	GetSongTimeMs \{time_offset = $tempo_iterator_offset}
	return time_to_next_beat = ($next_beat_time - <time>)
endscript

script ClearBeatCallbacks 
	change \{beat_callback = nullscript}
endscript

script spawn_measure_callbacks 
	spawnscriptnow \{$measure_callback}
endscript

script spawn_beat_callbacks 
	spawnscriptnow $beat_callback params = {time_to_next_beat = <time_to_next_beat>}
endscript

script measure_test_script 
	printf \{channel = tempo
		qs("\L......measure......")}
endscript

script beat_test_script 
	printf channel = tempo qs("\L    ...beat (time to next %a)...") a = <time_to_next_beat>
endscript

script GuitarEvent_StarSequenceBonus 
	wait_for_correct_frame player = ($<player_status>.player)
	if ($is_attract_mode = 1)
		return
	endif
	change structurename = <player_status> sp_phrases_hit = ($<player_status>.sp_phrases_hit + 1)
	if isSinglePlayerGame
		SoundEvent \{event = Star_Power_Awarded_SFX}
	else
		spawnscriptnow Star_Power_Awarded_SFX_Multiplayer params = {player = ($<player_status>.player)}
	endif
	FormatText checksumname = container_id 'gem_container%p' p = ($<player_status>.text) AddToStringLookup = true
	player = ($<player_status>.player)
	player = (<player> - 1)
	GetArraySize \{$gem_colors}
	InputArrayGetElement name = <song> index = <array_entry>
	destroy_big_bolt {player_status = <player_status> gem_array = <gem_array>}
	gem_count = 0
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		if (<gem_count> = (<array_size> -1))
			if GotParam \{got_one}
				break
			endif
		else
			got_one = 1
		endif
		color = ($gem_colors [<gem_count>])
		if ($<player_status>.lefthanded_button_ups = 1)
			<pos2d> = (($button_up_models [<player>]).<color>.left_pos_2d)
			<Angle> = (($button_models [<player>]).<color>.Angle)
		else
			<pos2d> = (($button_up_models [<player>]).<color>.pos_2d)
			<Angle> = (($button_models [<player>]).<color>.left_angle)
		endif
		FormatText checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		if NOT ScreenElementExists id = <name>
			CreateScreenElement {
				type = SpriteElement
				id = <name>
				parent = <container_id>
				material = sys_Big_Bolt01_sys_Big_Bolt01
				blend = Add
				use_animated_uvs = true
				top_down_v
				frame_length = 0.005
				num_uv_frames = (8.0, 1.0)
				rgba = [255 255 255 255]
				pos = <pos2d>
				rot_angle = <Angle>
				scale = $star_power_bolt_scale
				just = [center bottom]
				z_priority = 6
			}
		endif
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	Wait \{$star_power_bolt_time
		seconds}
	destroy_big_bolt {player_status = <player_status> gem_array = <gem_array> kill_when_empty = kill_when_empty}
endscript

script destroy_big_bolt 
	gem_count = 0
	GetArraySize \{$gem_colors}
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		FormatText checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> AddToStringLookup = true
		DestroyScreenElement id = <name>
		WaitOneGameFrame
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
endscript

script GuitarEvent_Multiplier4xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_4X}
	SoundEvent \{event = Lose_Multiplier_Crowd}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 4}
endscript

script GuitarEvent_Multiplier3xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_3X}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 3}
endscript

script GuitarEvent_Multiplier2xOff 
	SoundEvent \{event = UI_SFX_Lose_Multiplier_2X}
	spawnscriptnow highway_pulse_multiplier_loss params = {player_text = ($<player_status>.text) multiplier = 2}
endscript

script GuitarEvent_KillSong \{loadingtransition = 0}
	GH3_SFX_Stop_Sounds_For_KillSong <...> loading_transition = <loading_transition>
endscript

script GuitarEvent_EnterVenue 
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = echo_params 'Echo_Crowd_Buss_%s' s = <pakname>
	FormatText checksumname = reverb_params 'Reverb_Crowd_Buss_%s' s = <pakname>
	if NOT GlobalExists name = <echo_params>
		echo_params = Echo_Crowd_Buss_Default_SemiWet
	endif
	if NOT GlobalExists name = <reverb_params>
		reverb_params = Reverb_Crowd_Buss_Default_SemiWet
	endif
	setsoundbusseffects effect = [{$<echo_params>}]
	setsoundbusseffects effect = [{$<reverb_params>}]
endscript

script GuitarEvent_ExitVenue 
	setsoundbusseffects \{effect = [
			{
				$Echo_Dry
			}
		]}
	setsoundbusseffects \{effect = [
			{
				$Reverb_Dry
			}
		]}
endscript

script GuitarEvent_GemStarPowerOn 
endscript

script GuitarEvent_BattleAttackFinished 
	GH3_Battle_Attack_Finished_SFX <...>
endscript

script GuitarEvent_TransitionIntro 
endscript

script GuitarEvent_TransitionFastIntro 
endscript

script GuitarEvent_TransitionPreEncore 
endscript

script GuitarEvent_TransitionEncore 
endscript

script GuitarEvent_TransitionPreBoss 
endscript

script GuitarEvent_TransitionBoss 
endscript

script kick_fade_effect 
	Obj_GetID
	<ObjID> :SE_SetProps alpha = 0 time = <t2> Anim = fast_out rgba = [200 , 70 , 255 , 255]
	<ObjID> :SE_WaitProps
	DestroyScreenElement id = <ObjID>
endscript

script kick_grow_effect 
	Obj_GetID
	<ObjID> :SE_SetProps scale = <scale> time = 0.25 Anim = fast_out
endscript
kick_fx_index = 0
kick_index = 0
kick_fx_scale = 1.0
kick_fx_scale_3p = 1.2
kick_fx_scale_end = (1.25, 0.0)

script GuitarEvent_Kick_Drum_Hit_Note \{player = 1}
	FormatText checksumname = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	change kick_index = ($kick_index + 1)
	if ($kick_index > 1024)
		change \{kick_index = 0}
	endif
	<highway_info> = ($highway_pos_table [<player> -1])
	if (<highway_info>.nowbar_scale_x < 1.3)
		<x_scale> = (<highway_info>.nowbar_scale_x * ($kick_fx_scale_3p))
	else
		<x_scale> = (<highway_info>.nowbar_scale_x * ($kick_fx_scale))
	endif
	<particle_pos> = (640.0, 640.0)
	FormatText checksumname = fx_id 'kick_fx_%p_i%d' p = <player> d = ($kick_fx_index)
	DestroyScreenElement id = <fx_id>
	CreateScreenElement {
		type = ContainerElement
		id = <fx_id>
		parent = <container_id>
		pos = <particle_pos>
		z_priority = 8.0
		just = [center center]
		pos_anchor = [center center]
		alpha = 1.0
	}
	CreateScreenElement {
		type = ContainerElement
		local_id = grow_container
		parent = <fx_id>
		pos = (0.0, 0.0)
		just = [center center]
		pos_anchor = [center center]
	}
	<grow_id> = <id>
	<start_scale> = (<x_scale> * (1.0, 0.0) + (0.0, 1.0))
	<end_scale> = (<x_scale> * ($kick_fx_scale_end) + (0.0, 2.5))
	CreateScreenElement {
		type = SpriteElement
		local_id = top_wave
		pos = (0.0, 0.0)
		texture = wii_kick_particle03
		parent = <grow_id>
		rgba = [255 255 255 255]
		blend = Add
		scale = <start_scale>
		alpha = 1.0
	}
	RunScriptOnScreenElement id = <fx_id> kick_fade_effect params = {t1 = 0.15 t2 = 0.25}
	RunScriptOnScreenElement id = <grow_id> kick_grow_effect params = {scale = <end_scale>}
	change kick_fx_index = (($kick_fx_index) + 1)
	if (($kick_fx_index) = 10)
		change \{kick_fx_index = 0}
	endif
endscript

script GuitarEvent_Hit_Open_Note 
	GuitarEvent_Kick_Drum_Hit_Note player = <player> player_text = <player_text>
endscript

script GuitarEvent_Hit_Easy_Rhythm_Note 
	GuitarEvent_Kick_Drum_Hit_Note player_text = <player_text>
endscript

script PlayerSetVolume 
	if GotParam \{volume}
		if (($<player_status>.part) = drum)
			if GotParam \{drum}
				switch <drum>
					case 1
					change structurename = <player_status> drum_volume1 = <volume>
					case 2
					change structurename = <player_status> drum_volume2 = <volume>
					case 3
					change structurename = <player_status> drum_volume1 = <volume>
					case 4
					change structurename = <player_status> drum_volume4 = <volume>
				endswitch
				return
			endif
		endif
		change structurename = <player_status> guitar_volume = <volume>
	endif
endscript

script PlayerGetVolume 
	if (($<player_status>.part) = drum)
		if GotParam \{drum}
			switch <drum>
				case 1
				return volume = ($<player_status>.drum_volume1)
				case 2
				return volume = ($<player_status>.drum_volume2)
				case 3
				return volume = ($<player_status>.drum_volume1)
				case 4
				return volume = ($<player_status>.drum_volume4)
			endswitch
		endif
	endif
	return volume = ($<player_status>.guitar_volume)
endscript

script Create_HandsOfGod \{text = qs("You Rock!")}
	destroy_all_exploding_text
	spawnscriptnow create_exploding_text params = {text = <text>}
	if ScreenElementExists \{id = HandsOfGod}
		DestroyScreenElement \{id = HandsOfGod}
	endif
	CreateScreenElement \{parent = root_window
		id = HandsOfGod
		type = DescInterface
		desc = 'you_rock'
		z_priority = 0
		heap = BottomUpHeap}
	HandsOfGod :Obj_SpawnScriptNow \{Anim_HandsOfGod}
	spawnscriptnow \{do_lightning}
endscript
HOG_t1 = 2.0
HOG_t2 = 0.2
HOG_t4 = 0.6
HOG_t5 = 0.2
HOG_t7 = 0.6
HOG_bolt_scale = (0.5, 0.75)

script do_lightning 
	if ScreenElementExists \{id = freestyle_you_rock}
		DestroyScreenElement \{id = freestyle_you_rock}
	endif
	CreateScreenElement \{type = ContainerElement
		id = freestyle_you_rock
		parent = root_window
		pos = $freestyle_you_rock_pos
		just = [
			center
			center
		]
		internal_just = [
			center
			center
		]}
	Wait \{$HOG_t1
		second}
	create_you_rock_lightning \{Angle = 242
		scale = (0.5, 0.75)
		rgba = [
			255
			185
			0
			255
		]}
	create_you_rock_lightning \{Angle = 239
		scale = (1.5, 1.0)
		rgba = [
			255
			185
			0
			128
		]}
	Wait \{$HOG_t2
		second}
	create_you_rock_spark \{alpha = 0.5
		rgba = [
			255
			185
			0
			255
		]}
	Wait \{$HOG_t4
		second}
	create_you_rock_lightning \{Angle = 55
		scale = (0.5, 0.75)
		rgba = [
			128
			128
			255
			255
		]}
	create_you_rock_lightning \{Angle = 55
		scale = (2.0, 0.75)
		rgba = [
			128
			128
			255
			128
		]}
	Wait \{$HOG_t5
		second}
	create_you_rock_spark \{alpha = 0.5
		rgba = [
			128
			128
			255
			255
		]}
	Wait \{$HOG_t7
		second}
	create_you_rock_spark \{alpha = 1.0
		rgba = [
			255
			255
			255
			255
		]}
	create_you_rock_lightning \{Angle = 55
		scale = (0.5, 0.75)
		rgba = [
			255
			255
			255
			255
		]}
	create_you_rock_lightning \{Angle = 242
		scale = (1.0, 0.75)
		rgba = [
			255
			255
			255
			120
		]}
	SoundEvent \{event = You_Rock_Explosion}
endscript

script create_you_rock_lightning \{scale = 1.0}
	cos (<Angle> - 180)
	sin (<Angle> - 180)
	pos = (0.0, 0.0)
	CreateScreenElement {
		type = SpriteElement
		parent = freestyle_you_rock
		texture = sys_Big_Bolt01_sys_Big_Bolt01
		just = [center center]
		pos = <pos>
		rot_angle = <Angle>
		use_animated_uvs = true
		frame_length = $freestyle_lightning_frame_length
		scale = (<scale> * 0.5)
		rgba = <rgba>
		num_uv_frames = (8.0, 1.0)
		top_down_v
		loop_animated_uvs = false
		blend = Add
		z_priority = 0.97999996
	}
	SpawnScriptLater you_rock_lightning_script params = {id = <id>}
endscript

script you_rock_lightning_script 
	wait_for_animation id = <id>
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
endscript

script create_you_rock_spark 
	CreateScreenElement {
		type = SpriteElement
		parent = freestyle_you_rock
		texture = JOW_Spark02
		just = [center center]
		pos = (0.0, 0.0)
		blend = Add
		rgba = <rgba>
		scale = 1.0
		alpha = <alpha>
	}
	RunScriptOnScreenElement you_rock_spark_script id = <id> params = {}
endscript

script you_rock_spark_script 
	SE_SetProps \{scale = 40.0
		rot_angle = $freestyle_spark_rotation1
		time = $freestyle_spark_time1}
	SE_WaitProps
	SE_SetProps \{scale = 0.0
		alpha = 0.0
		rot_angle = $freestyle_spark_rotation2
		time = $freestyle_spark_time2}
	SE_WaitProps
	Die
endscript

script Anim_HandsOfGod 
	HandsOfGod :Obj_SpawnScriptLater \{rotate_highlight_sparkle_glow
		params = {
			id = HandsOfGod
			time = 1.25
		}}
	HandsOfGod :SE_SetProps \{hand_of_god_1_pos = (630.0, -550.0)
		hand_of_god_1_rot_angle = 40
		hand_of_god_1_alpha = 0
		hand_of_god_2_pos = (-685.0, 373.0)
		hand_of_god_2_rot_angle = 40
		hand_of_god_2_alpha = 0
		time = 0}
	Wait \{1.2
		seconds}
	HandsOfGod :SE_SetProps \{hand_of_god_1_rot_angle = 0
		hand_of_god_1_alpha = 1
		hand_of_god_2_rot_angle = 0
		hand_of_god_2_alpha = 1
		time = 0.2
		motion = ease_in}
	HandsOfGod :SE_WaitProps
	spawnscriptnow \{HandofGod_FX_01}
	HandsOfGod :SE_SetProps \{hand_of_god_1_rot_angle = 5
		hand_of_god_2_rot_angle = 5
		time = 0.1
		motion = ease_out}
	HandsOfGod :SE_WaitProps
	HandsOfGod :SE_SetProps \{hand_of_god_1_rot_angle = 0
		hand_of_god_2_rot_angle = 0
		time = 0.2
		motion = ease_in}
	HandsOfGod :SE_WaitProps
	HandsOfGod :SE_SetProps \{hand_of_god_1_rot_angle = 0
		hand_of_god_1_alpha = 1
		hand_of_god_2_rot_angle = 0
		hand_of_god_2_alpha = 1
		time = 0.7
		motion = ease_in}
	HandsOfGod :SE_WaitProps
	spawnscriptnow \{HandofGod_FX_02}
	begin
	HandsOfGod :SE_SetProps hand_of_god_1_rot_angle = Random (@ 2 @ -2 @ 4 @ -4 @ 0 )hand_of_god_2_rot_angle = Random (@ 2 @ -1 @ 4 @ -4 @ 0 )time = 0.1 motion = Random (@ ease_in @ ease_out )
	HandsOfGod :SE_WaitProps
	repeat 12
	HandsOfGod :SE_SetProps \{hand_of_god_1_rot_angle = 360
		hand_of_god_2_rot_angle = 360
		hand_of_god_1_alpha = 0
		hand_of_god_2_alpha = 0
		time = 1.5
		motion = ease_out}
	HandsOfGod :SE_WaitProps
	Die
endscript

script hot_start_achieved \{Band = 0}
	GameMode_GetType
	if (<type> = training)
		return
	endif
	if ($is_attract_mode = 1)
		return
	endif
	if (<player> = 1)
		printf \{channel = sfx
			qs("\LThis is player 1")}
		if isSinglePlayerGame
			pos = (640.0, 211.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_SinglePlayer params = {combo = <combo>}
		elseif ($game_mode = p2_career || $game_mode = p2_quickplay)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		else
			<s> = 0.35000002
			pos = (415.0, 170.0)
			spawnscriptnow GH_SFX_Note_Streak_P1 params = {combo = <combo>}
		endif
	else
		printf \{channel = sfx
			qs("\LThis is player multple")}
		if ($game_mode = p2_career || $game_mode = p2_quickplay)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		else
			<s> = 0.35000002
			pos = (865.0, 170.0)
			spawnscriptnow GH_SFX_Note_Streak_P2 params = {combo = <combo>}
		endif
	endif
	if NOT GameMode_IsBandScoring
		hud_create_message player = <player> text = qs("Hot Start!")
	elseif (<Band> = 1)
		hud_create_message \{Band
			text = qs("Hot Start!")
			style_script = hud_message_band_streak_style
			style_script_params = {
				players = [
					1
					1
					1
					1
				]
			}}
	endif
endscript
