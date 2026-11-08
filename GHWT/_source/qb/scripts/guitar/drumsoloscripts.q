
script GetSoloStartTime 
	if GotParam \{song}
		time = 9000000
		if StructureContains Structure = $drum_solo_structs name = <song>
			GetArraySize ($drum_solo_structs.<song>.events)
			index = 0
			begin
			if StructureContains Structure = ($drum_solo_structs.<song>.events [<index>]) name = time
				thistime = ($drum_solo_structs.<song>.events [<index>].time)
				if (<thistime> < <time>)
					time = <thistime>
				endif
			endif
			index = (<index> + 1)
			repeat <array_size>
		endif
		if (<time> < 9000000)
			return StartTime = (<time> - 1000)
		endif
	endif
endscript

script drum_solo_fadeout 
	printf \{qs("\Ldrum_solo_fadeout")}
	printstruct <...>
	if GotParam \{target}
		params = {time = (<dur> / 1000.0)}
		AddParam structure_name = params name = <target> value = {vol_percent = 0}
		SetSoundBussParams <params>
	endif
endscript

script drum_solo_fadein 
	printf \{qs("\Ldrum_solo_fadein")}
	printstruct <...>
	if GotParam \{target}
		params = {time = (<dur> / 1000.0)}
		AddParam structure_name = params name = <target> value = {vol_percent = 100}
		SetSoundBussParams <params>
	endif
endscript

script drum_solo_crowd 
	printf \{qs("\Ldrum_solo_crowd")}
	spawnscriptnow \{drum_solo_crowd_spawned}
endscript

script drum_solo_crowd_spawned 
	Play_A_Short_Crowd_Swell_For_This_Venue
	GH3_AdjustCrowdFastBigSurge
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good}
	One_Shot_SoundEvent \{SoundEvent = $Current_Crowd_OneShot_Positive_SoundEvent
		waittime = 2}
endscript

script drum_solo_start_crowd_sfx 
	printf \{qs("\Ldrum_solo_start_crowd_sfx")}
	Play_A_Short_Crowd_Swell_For_This_Venue
	spawnscriptnow drum_solo_crowd_spawned_building_intensity params = {solo_length = <solo_length>}
	spawnscriptnow \{drum_solo_temp_hack_crowd_claps}
	spawnscriptnow \{drum_solo_random_crowd_swells}
endscript

script drum_solo_random_crowd_swells 
	Wait \{0.6
		seconds}
	begin
	Random (
		@ Play_A_Short_Crowd_Swell_For_This_Venue
		Wait \{0.3
			seconds}
		@ Play_A_Med_Crowd_Swell_For_This_Venue
		Wait \{0.7
			seconds}
		@ Wait \{0.3
			seconds}
		@ Wait \{0.5
			seconds}
		@ Wait \{0.2
			seconds}
		)
	repeat
endscript

script drum_solo_crowd_spawned_building_intensity 
	SetSoundBussParams {`default` = {vol = (($Default_BussSet.`default`.vol) + 6.5)} time = 0.5}
	solo_in_seconds = (<solo_length> / 1000.0)
	waittime_to_start_long_surge = (<solo_in_seconds> / 2)
	Wait <waittime_to_start_long_surge> seconds
	KillSpawnedScript \{name = drum_solo_random_crowd_swells}
	SetSoundBussParams {Crowd_Beds = {vol = (($Default_BussSet.Crowd_Beds.vol) + 8)} time = <waittime_to_start_long_surge>}
endscript

script drum_solo_temp_hack_crowd_claps 
endscript

script drum_solo_crowd_reset 
	printf \{qs("\Ldrum_solo_crowd_reset")}
	SetSoundBussParams {`default` = {vol = ($Default_BussSet.`default`.vol)} time = 0.02}
	SetSoundBussParams {Crowd_Beds = {vol = (($Default_BussSet.Crowd_Beds.vol) + 8)} time = <waittime_to_start_long_surge>}
endscript

script drum_solo_warning 
	hud_create_message \{player = 1
		text = qs("Drum Solo in 4")
		priority = 1}
	Wait \{1
		second}
	hud_create_message \{player = 1
		text = qs("Drum Solo in 3")
		priority = 2}
	Wait \{1
		second}
	hud_create_message \{player = 1
		text = qs("Drum Solo in 2")
		priority = 3}
	Wait \{1
		second}
	hud_create_message \{player = 1
		text = qs("Drum Solo in 1")
		priority = 4}
	Wait \{1
		second}
	hud_create_message \{player = 1
		text = qs("")
		priority = 5}
endscript

script drum_solo_start_anim 
	band_playclip \{clip = D_SoloMoment01_CrazyTrain
		startFrame = 1}
	CameraCuts_SetArrayPrefix \{prefix = 'cameras_moments'
		changenow
		name = moment01}
	change \{CameraCuts_AllowNoteScripts = false}
	LightShow_SetTime \{time = 0}
	LightShow_SetParams \{mood = blackout}
	LightShow_SpotlightColor \{color = white}
	LightShow_EnableSpotlights \{enabled = false
		spots = [
			vocalist
			Guitarist
			bassist
			Drummer
		]}
	LightShow_EnableSpotlights \{enabled = true
		spots = [
			Drummer
		]}
endscript

script drum_solo_stop_anim 
	change \{CameraCuts_AllowNoteScripts = true}
endscript
