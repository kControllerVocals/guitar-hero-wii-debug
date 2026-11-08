debug_saves = 0

script reset_globaltags savegame = ($primary_controller)
	globaltag_checksum = initial_v227
	LockGlobalTags \{off}
	ClearGlobalTags savegame = <savegame>
	stars
	printf \{'I take a long time... I need to be fixed'}
	stars
	printf 'Resetting GlobalTags for savegame %d' d = <savegame>
	SetGlobalTags savegame = <savegame> last_singleplayer_character params = {last_singleplayer_character = none}
	SetGlobalTags savegame = <savegame> last_band_characters params = {
		last_band_characters = [none none none none]
	}
	SetGlobalTags savegame = <savegame> last_h2h_characters params = {
		last_h2h_characters = [none none]
	}
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'guitar'
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'bass'
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'drum'
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'vocals'
	setupsongtags savegame = <savegame> globaltag_checksum = <globaltag_checksum> part = 'band'
	setup_venuetags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	band_index = 1
	begin
	FormatText TextName = bandname_id 'band%i' i = <band_index>
	get_progression_globals \{Career_Guitar}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = guitar bandname_id = <bandname_id>
	get_progression_globals \{Career_Bass}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Bass bandname_id = <bandname_id>
	get_progression_globals \{Career_Drum}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = drum bandname_id = <bandname_id>
	get_progression_globals \{Career_Vocals}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Vocals bandname_id = <bandname_id>
	get_progression_globals \{Career_Band}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Band bandname_id = <bandname_id>
	<band_index> = (<band_index> + 1)
	repeat ($num_career_bands)
	get_progression_globals \{Career_Guitar}
	setup_setlisttags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = guitar
	get_progression_globals \{Career_Bass}
	setup_setlisttags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Bass
	get_progression_globals \{Career_Drum}
	setup_setlisttags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = drum
	get_progression_globals \{Career_Vocals}
	setup_setlisttags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Vocals
	get_progression_globals \{Career_Band}
	setup_setlisttags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Band
	setup_quickplay_song_tags savegame = <savegame> allsongs
	get_progression_globals \{Career_Guitar}
	setup_quickplay_song_tags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = guitar
	get_progression_globals \{Career_Bass}
	setup_quickplay_song_tags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Bass
	get_progression_globals \{Career_Drum}
	setup_quickplay_song_tags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = drum
	get_progression_globals \{Career_Vocals}
	setup_quickplay_song_tags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Vocals
	get_progression_globals \{Career_Band}
	setup_quickplay_song_tags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Band
	setup_bandtags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_user_option_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_training_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_unlocks savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_custom_character_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_online_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_cas_helper_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	setup_saved_instrument_tags savegame = <savegame> globaltag_checksum = <globaltag_checksum>
	SetGlobalTags savegame = <savegame> globaltag_checksum params = {globaltag_checksum = <globaltag_checksum>}
	LockGlobalTags
endscript

script reset_globaltags_all 
	reset_globaltags \{savegame = 0}
	get_num_globaltag_sets
	if (<num_globaltag_sets> > 1)
		savegame = 1
		begin
		printf 'Copying GlobalTags for savegame %d' d = <savegame>
		ScriptAssert \{qs(0x89c5b1f6)}
		CopyGlobalTags from = 0 to = <savegame>
		<savegame> = (<savegame> + 1)
		repeat (<num_globaltag_sets> - 1)
	endif
endscript

script setup_globaltags 
	reset_globaltags \{savegame = 0}
	get_num_globaltag_sets
	if (<num_globaltag_sets> > 1)
		savegame = 1
		begin
		printf 'Copying GlobalTags for savegame %d' d = <savegame>
		ScriptAssert \{qs(0x0dae1b8e)}
		CopyGlobalTags from = 0 to = <savegame>
		<savegame> = (<savegame> + 1)
		repeat (<num_globaltag_sets> - 1)
	endif
endscript

script init_globaltags 
	max_globaltag_structs = 10000
	PushMemProfile \{'globaltags'}
	GetArraySize ($instrument_progression_list)
	instrument_size = <array_size>
	InitGlobalTags max_sets = <globaltag_sets> max_structs = <max_globaltag_structs> max_cars = ($max_num_create_a_rockers)
	PopMemProfile
endscript

script get_num_globaltag_sets 
	GetMaxPlayers
	if ((IsPs3) || (isps2) || (IsNgc))
		return \{num_globaltag_sets = 1}
	else
		return num_globaltag_sets = <max_players>
	endif
endscript
default_topscores = [
	{
		scores = [
			19737
			18164
			17809
		]
	}
	{
		scores = [
			19737
			18164
			17809
		]
	}
	{
		scores = [
			46322
			41217
			39989
		]
	}
	{
		scores = [
			54046
			49787
			41256
		]
	}
	{
		scores = [
			64289
			61986
			55423
		]
	}
]
default_songtags_with_difficulty = {
	tr_stars = [
		0
		0
		0
	]
	bestscore = 0
	beststars = 0
	tr_percent100 = 0
	stars = 0
	score = 0
	percent100 = 0
	unlocked = 0
}

script setup_custom_character_tags 
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = custom_profiles max_size = ($max_num_create_a_rockers) packtype = createarocker
	GetArraySize \{$Preset_Musician_Profiles_Modifiable}
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = preset_profiles max_size = <array_size> packtype = presetcars start_full
	i = 0
	begin
	globaltag_set_preset_musician savegame = <savegame> index = <i> appearance = ($Preset_Musician_Profiles_Modifiable [<i>].appearance)
	globaltag_checksum = (<globaltag_checksum> + ($Preset_Musician_Profiles_Modifiable [<i>].name))
	i = (<i> + 1)
	repeat <array_size>
	return globaltag_checksum = <globaltag_checksum>
endscript
default_songtags = {
	available_on_other_client = 0
}

script get_formatted_songname \{part = 'guitar'}
	FormatText checksumname = songname '%s%p%d' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> AddToStringLookup = true
	return songname = <songname>
endscript

script get_formatted_songname_for_jam_mode 
	if NOT GotParam \{part}
		part = 'guitar'
	endif
	FormatText TextName = songname '%s_%p_%d_quickplay' s = (<song_prefix>) p = <part> d = <difficulty_text_nl> AddToStringLookup = true
	FormatText checksumname = songname2 '%s' s = <songname> AddToStringLookup = true
	return songname = <songname2>
endscript
default_venuetags = {
	unlocked = 0
}
cheat_venuetags = {
	unlocked = 1
}

script setup_venuetags 
	if GotParam \{cheat}
		venue_tags = $cheat_venuetags
	else
		venue_tags = $default_venuetags
	endif
	setup_generalvenuetags savegame = <savegame>
	GetArraySize \{$LevelZoneArray}
	level_zone_array_size = <array_size>
	index = 0
	begin
	GetArraySize \{$instrument_progression_list}
	instrument_size = <array_size>
	instrument_index = 0
	begin
	get_LevelZoneArray_checksum index = <index>
	if NOT StructureContains Structure = ($LevelZones.<level_checksum>) debug_only
		get_progression_globals ($instrument_progression_list [<instrument_index>])
		FormatText {
			checksumname = venue_checksum
			'%s_%i'
			s = ($LevelZones.<level_checksum>.name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			AddToStringLookup = true
		}
		SetGlobalTags savegame = <savegame> <venue_checksum> params = {(<venue_tags>)} packtype = unlockedtags
		if GotParam \{globaltag_checksum}
			<globaltag_checksum> = (<globaltag_checksum> + <venue_checksum>)
		endif
		if StructureContains Structure = ($<tier_global>.tier1) unlocked_levels
			GetArraySize ($<tier_global>.tier1.unlocked_levels)
			array_count = 0
			begin
			level_checksum = ($<tier_global>.tier1.unlocked_levels [<array_count>])
			FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.name)
			SetGlobalTags savegame = <savegame> <venue_checksum> params = {unlocked = 1} packtype = unlockedtags
			array_count = (<array_count> + 1)
			repeat <array_size>
		endif
		if GotParam \{globaltag_checksum}
			<globaltag_checksum> = (<globaltag_checksum> + <venue_checksum>)
		endif
	endif
	<instrument_index> = (<instrument_index> + 1)
	repeat <instrument_size>
	<index> = (<index> + 1)
	repeat (<level_zone_array_size> - 1)
	if GotParam \{globaltag_checksum}
		return globaltag_checksum = <globaltag_checksum>
	endif
endscript

script setup_generalvenuetags 
	get_LevelZoneArray_size
	array_count = 0
	begin
	get_LevelZoneArray_checksum index = <array_count>
	if NOT StructureContains Structure = ($LevelZones.<level_checksum>) debug_only
		FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<level_checksum>.name) AddToStringLookup = true
		if NOT GetGlobalTags savegame = <savegame> <venue_checksum> noassert = 1
			SetGlobalTags savegame = <savegame> <venue_checksum> params = {($default_venuetags)} packtype = unlockedtags
		endif
		SetGlobalTags savegame = <savegame> <venue_checksum> params = {unlocked = 0} packtype = unlockedtags
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript
default_charactertags = {
	unlocked = 0
	unlocked_on_other_client = 0
	available_on_other_client = 0
}
default_songsetlisttags = {
	stars = 0
	score = 0
	percent100 = 0
	unlocked = 0
}

script setup_setlisttags \{globaltag_checksum = none
		force = 0
		songlist = gh_songlist
		download = 0}
	if (<download> = 1)
		return globaltag_checksum = <globaltag_checksum>
	endif
	if GotParam \{SetList_Songs}
		tier_count = 1
		begin
		FormatText checksumname = tier 'tier%d' d = <tier_count>
		defaultunlocked = 0
		unlockall = 0
		if StructureContains Structure = ($<SetList_Songs>.<tier>) defaultunlocked
			<defaultunlocked> = 1
		elseif StructureContains Structure = ($<SetList_Songs>.<tier>) unlockall
			<unlockall> = 1
		endif
		if (<defaultunlocked> = 1 || <unlockall> = 1)
			tier_song_count = 0
			GetArraySize ($<SetList_Songs>.<tier>.songs)
			tier_song_size = <array_size>
			if (<tier_song_size> > 0)
				begin
				if (<defaultunlocked> = 1)
					unlock_size = ($<SetList_Songs>.<tier>.defaultunlocked)
				else (<unlockall> = 1)
					unlock_size = -1
				endif
				if (<tier_song_count> < <unlock_size> || <unlock_size> = -1)
					difficulty_index = 0
					GetArraySize \{$difficulty_list}
					difficulty_size = <array_size>
					begin
					format_globaltag_song_checksum part = <part> song = ($<SetList_Songs>.<tier>.songs [<tier_song_count>]) difficulty_index = <difficulty_index>
					SetGlobalTags savegame = <savegame> <song_checksum> params = {unlocked = 1}
					<difficulty_index> = (<difficulty_index> + 1)
					repeat <difficulty_size>
				endif
				<tier_song_count> = (<tier_song_count> + 1)
				repeat <tier_song_size>
			endif
		endif
		<tier_count> = (<tier_count> + 1)
		repeat ($<SetList_Songs>.num_tiers)
	endif
	return globaltag_checksum = <globaltag_checksum>
endscript
default_bandtags = {
	Cash = 100
	auto_dwc_login = 0
	career_earnings = 100
	name = qs("\L")
	font = fontgrid_text_a6
	first_play = 1
	first_battle_play = 1
	first_venue_movie_played = 0
	first_quickplay_setlist = 1
	finalbandintro_transition_played_band = 0
	finalbandintro_transition_played_bass = 0
	finalbandintro_transition_played_drum = 0
	finalbandintro_transition_played_guitar = 0
	finalbandintro_transition_played_vocals = 0
	first_instrument_career_guitar = 0
	first_instrument_career_bass = 0
	first_instrument_career_drum = 0
	first_instrument_career_vocals = 0
	band_unique_id = non_existent_checksum
	band_logo = [
	]
	allow_ghtunes_logo = 0
	purchased_profiles = [
	]
	got_sponsored_band_t1 = 0
	got_sponsored_band_t2 = 0
	got_sponsored_band_t3 = 0
	got_sponsored_band_t4 = 0
	got_sponsored_band_t5 = 0
	got_sponsored_band_t6 = 0
	got_sponsored_band_t7 = 0
	got_sponsored_band_t8 = 0
	got_sponsored_band_t9 = 0
	got_sponsored_band_t10 = 0
	got_sponsored_band_t11 = 0
	got_sponsored_band_t12 = 0
	got_sponsored_guitar_t1 = 0
	got_sponsored_guitar_t2 = 1
	got_sponsored_guitar_t3 = 0
	got_sponsored_guitar_t4 = 1
	got_sponsored_guitar_t5 = 0
	got_sponsored_guitar_t6 = 0
	got_sponsored_guitar_t7 = 1
	got_sponsored_guitar_t8 = 0
	got_sponsored_guitar_t9 = 1
	got_sponsored_guitar_t10 = 0
	got_sponsored_guitar_t11 = 1
	got_sponsored_guitar_t12 = 1
	got_sponsored_bass_t1 = 0
	got_sponsored_bass_t2 = 1
	got_sponsored_bass_t3 = 0
	got_sponsored_bass_t4 = 1
	got_sponsored_bass_t5 = 0
	got_sponsored_bass_t6 = 0
	got_sponsored_bass_t7 = 1
	got_sponsored_bass_t8 = 0
	got_sponsored_bass_t9 = 1
	got_sponsored_bass_t10 = 0
	got_sponsored_bass_t11 = 1
	got_sponsored_bass_t12 = 1
	got_sponsored_drum_t1 = 0
	got_sponsored_drum_t2 = 0
	got_sponsored_drum_t3 = 0
	got_sponsored_drum_t4 = 1
	got_sponsored_drum_t5 = 1
	got_sponsored_drum_t6 = 0
	got_sponsored_drum_t7 = 1
	got_sponsored_drum_t8 = 0
	got_sponsored_drum_t9 = 1
	got_sponsored_drum_t10 = 0
	got_sponsored_drum_t11 = 1
	got_sponsored_drum_t12 = 1
	got_sponsored_vocals_t1 = 0
	got_sponsored_vocals_t2 = 1
	got_sponsored_vocals_t3 = 1
	got_sponsored_vocals_t4 = 1
	got_sponsored_vocals_t5 = 1
	got_sponsored_vocals_t6 = 0
	got_sponsored_vocals_t7 = 1
	got_sponsored_vocals_t8 = 1
	got_sponsored_vocals_t9 = 1
	got_sponsored_vocals_t10 = 1
	got_sponsored_vocals_t11 = 1
	got_sponsored_vocals_t12 = 1
	att_ballpark_band = 0
	att_ballpark_guitar = 0
	att_ballpark_bass = 0
	att_ballpark_drum = 0
	att_ballpark_vocals = 0
}
default_progressiontags = {
	current_difficulty = easy
	current_tier = 1
	current_song_count = 0
	encore_song = none
	career_play_song_and_end = 0
	career_using_createagig = 0
}

script setup_bandtags 
	band_count = 0
	begin
	FormatText checksumname = default_bandname 'band%i_info' i = (<band_count> + 1) AddToStringLookup = true
	SetGlobalTags savegame = <savegame> <default_bandname> params = {($default_bandtags)}
	<band_count> = (<band_count> + 1)
	repeat ($num_career_bands + 1)
	SetGlobalTags savegame = <savegame> Progression params = {$default_progressiontags}
endscript
override_audio_lag = -1
override_video_lag = -1

script setup_user_option_tags 
	SetGlobalTags savegame = <savegame> user_options params = {
		volumes = {
			guitar = {
				mic = {vol = 7 comp = 1 rev = 2}
				Vocals = {vol = 7}
				backup = {vol = 7}
				guitar = {vol = 7 eq = 2}
				Bass = {vol = 7 eq = 2}
				drum = {vol = 7 eq = 2}
				Crowd = {vol = 7}
				sfx = {vol = 7}
				Band = {vol = 7}
			}
		}
		dolby_digital = 0
		PS2_Stereo_Sound = 1
		ps2_widescreen = 0
		lefty_flip_save = 0
		use_tilt_for_starpower_save = 1
		enable_touch_strip_save = 1
		lefty_flip_p1 = 0
		lefty_flip_p2 = 0
		lefty_flip_p3 = 0
		lefty_flip_p4 = 0
		Hyperspeed_Guitar = 1.0
		Hyperspeed_Bass = 1.0
		Hyperspeed_Drum = 1.0
		AirInstruments = 0
		InvisibleCharacters = 0
		gem_set = standard_gems
		FX_Set = standard_fx
		Star_Set = standard_stars
		unpause_count = 1
		lag_calibration = 0.0
		has_calibrated = 0
		autosave = 1
		resting_whammy_position_device_0 = -0.76
		resting_whammy_position_device_1 = -0.76
		resting_whammy_position_device_2 = -0.76
		resting_whammy_position_device_3 = -0.76
		resting_whammy_position_device_4 = -0.76
		resting_whammy_position_device_5 = -0.76
		resting_whammy_position_device_6 = -0.76
		star_power_position_device_0 = -1.0
		star_power_position_device_1 = -1.0
		star_power_position_device_2 = -1.0
		star_power_position_device_3 = -1.0
		star_power_position_device_4 = -1.0
		star_power_position_device_5 = -1.0
		star_power_position_device_6 = -1.0
		guitar_motion_neck_left_idle = -0.63
		guitar_motion_neck_right_idle = 0.5
		guitar_motion_face_up_idle = -0.76
		guitar_motion_face_down_idle = 0.31
		gamma_brightness = 5
		vocals_highway_view_save = scrolling
		vocals_sp_clap_save = 1
		online_game_mode = 0
		online_difficulty = 0
		online_num_songs = 0
		online_tie_breaker = 0
		online_highway = 0
		ghtunes_num_songs_rated = 0
		unlock_Cheat_Line6Unlock = 0
		unlock_Cheat_AlwaysSlide = 0
		unlock_Cheat_AirInstruments = 0
		unlock_Cheat_InvisibleCharacters = 0
		unlock_Cheat_SnobCrowd = 0
		unlock_Cheat_PerformanceMode = 0
		unlock_Cheat_Hyperspeed = 0
		unlock_Cheat_AutoKick = 0
		unlock_Cheat_UnlockQuickplay = 0
		unlock_Cheat_UnlockATTBallpark = 0
		unlock_Cheat_GemColor = 0
		unlock_Cheat_FlameColor = 0
		unlock_Cheat_StarColor = 0
		unlock_Cheat_BestBuyKid = 0
		unlock_Cheat_VocalFireball = 0
		unlock_Cheat_BucketHat = 0
		unlock_Cheat_EuroContestWinner = 0
		unlock_Cheat_Rina = 0
		unlock_Cheat_Aaron = 0
		cheat_index0 = 0
		cheat_index1 = 0
		cheat_index2 = 0
		cheat_index3 = 0
		cheat_index4 = 0
		cheat_index5 = 0
		cheat_index6 = 0
		cheat_index7 = 0
		cheat_index8 = 0
		cheat_index9 = 0
		cheat_index10 = 0
		cheat_index11 = 0
		cheat_index12 = 0
		cheat_index13 = 0
		cheat_index14 = 0
		cheat_index15 = 0
		cheat_index16 = 0
		cheat_index17 = 0
		cheat_index18 = 0
		cheat_index19 = 0
		cheat_index20 = 0
		cheat_index21 = 0
		cheat_index22 = 0
		cheat_index23 = 0
		cheat_index24 = 0
		cheat_index25 = 0
		cheat_index26 = 0
		cheat_index27 = 0
		cheat_index28 = 0
		cheat_index29 = 0
		cheat_index30 = 0
		freestyle_auto_help = 1
		freestyle_whammy_reverse = 0
	}
	if NOT (override_audio_lag = -1 || $override_video_lag = -1)
		if ($override_audio_lag > 200)
			change \{override_audio_lag = 200}
		endif
		if ($override_video_lag > 200)
			change \{override_video_lag = 200}
		endif
		lag_calibration = (($override_audio_lag * 1000) + 1000)
		SetGlobalTags savegame = <savegame> user_options params = {lag_calibration = <lag_calibration>}
		SetGlobalTags savegame = <savegame> user_options params = {lag_calibration = (<lag_calibration> + $override_video_lag)}
	endif
endscript

script setup_online_tags 
	SetGlobalTags savegame = <savegame> net params = {
		venue = load_z_Frathouse
		guitar_part = guitar
	}
endscript

script write_globals_to_global_tags 
endscript

script globaltag_set_preset_musician 
	RequireParams \{[
			savegame
			index
			appearance
		]}
	dest_appearance = {}
	CASCopySelectiveParts \{src_appearance_name = appearance
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_parts}
	CASCopySelectiveParts \{src_appearance_name = appearance
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_instrument_parts}
	globaltag_setarrayelement savegame = <savegame> array_name = preset_profiles index = <index> element = <dest_appearance>
endscript

script globaltag_get_preset_musician 
	RequireParams \{[
			savegame
			index
			profile_struct
		]}
	globaltag_getarrayelement savegame = <savegame> array_name = preset_profiles index = <index>
	dest_appearance = (<profile_struct>.appearance)
	CASCopySelectiveParts \{src_appearance_name = element
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_parts}
	CASCopySelectiveParts \{src_appearance_name = element
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_instrument_parts}
	return profile_struct = {<profile_struct> appearance = <dest_appearance>}
endscript

script get_checksum_of_modified_appearance 
	RequireParams \{[
			appearance
		]
		all}
	dest_appearance = {}
	CASCopySelectiveParts \{src_appearance_name = appearance
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_parts}
	CASCopySelectiveParts \{src_appearance_name = appearance
		dest_appearance_name = dest_appearance
		part_array_name = modifiable_preset_musician_instrument_parts}
	GenerateChecksumFromStruct struct = <dest_appearance>
	return checksum = <structure_checksum>
endscript

script globaltag_check_preset_musician_modified 
	RequireParams \{[
			savegame
			index
		]
		all}
	get_checksum_of_modified_appearance appearance = (($Preset_Musician_Profiles_Modifiable [<index>]).appearance)
	original_checksum = <checksum>
	globaltag_get_preset_musician savegame = <savegame> profile_struct = ($Preset_Musician_Profiles_Modifiable [<index>]) index = <index>
	get_checksum_of_modified_appearance appearance = (<profile_struct>.appearance)
	if (<original_checksum> = <checksum>)
		return \{false}
	endif
	return \{true}
endscript

script restore_globals_from_global_tags 
	<i> = 1
	begin
	GetPlayerInfo player = <i> controller
	get_savegame_from_controller controller = <controller>
	GetGlobalTags savegame = <savegame> user_options
	FormatText checksumname = player_status 'player%i_status' i = <i> AddToStringLookup
	change structurename = <player_status> lefty_flip = <lefty_flip_save>
	change structurename = <player_status> vocals_highway_view = <vocals_highway_view_save>
	change structurename = <player_status> vocals_sp_clap = <vocals_sp_clap_save>
	change structurename = <player_status> use_tilt_for_starpower = <use_tilt_for_starpower_save>
	change structurename = <player_status> enable_touch_strip = <enable_touch_strip_save>
	<i> = (<i> + 1)
	repeat 4
	MonitorControllerStates
endscript

script setup_training_tags 
	SetGlobalTags savegame = <savegame> training params = {basic_lesson = not_complete
		star_power_lesson = not_complete
		advanced_techniques_lesson = not_complete
		new_features_lesson = not_complete
		drum_basic_lesson = not_complete
		drum_int_lesson = not_complete
		vocals_lesson = not_complete
		band_lesson = not_complete
		versus_lesson = not_complete
		has_prompt_guitar_tutorial = not_complete
		has_prompt_bass_tutorial = not_complete
		has_prompt_drum_tutorial = not_complete
		has_prompt_vocal_tutorial = not_complete
		rs_introduction_lesson = not_complete
		rs_lead_and_bass_lesson = not_complete
		rs_rhythm_lesson = not_complete
		rs_drums_lesson = not_complete
		rs_melody_lesson = not_complete
		rs_recording_lesson = not_complete
		rs_pro_guitar_lesson = not_complete
		rs_advanced_tools_lesson = not_complete
		rs_ghmix_editing_lesson = not_complete
		rs_ghmix_pro_techniques_tools_lesson = not_complete
	}
endscript

script setup_unlocks \{globaltag_checksum = none}
	GetArraySize ($Bonus_Videos)
	index = 0
	begin
	unlocked = 1
	if NOT StructureContains Structure = ($Bonus_Videos [<index>]) unlocked
		unlocked = 0
	endif
	video_checksum = ($Bonus_Videos [<index>].id)
	SetGlobalTags savegame = <savegame> <video_checksum> params = {unlocked = <unlocked>} packtype = unlockedtags
	globaltag_checksum = (<globaltag_checksum> + <video_checksum>)
	<index> = (<index> + 1)
	repeat <array_size>
	return globaltag_checksum = <globaltag_checksum>
endscript

script GlobalTags_UnlockAll songs_only = 0 difficulty = ($player1_status.difficulty)
	get_savegame_from_controller controller = ($primary_controller)
	if NOT (<songs_only> = 1)
		array_count = 0
		GetArraySize \{$Preset_Musician_Profiles_Locked}
		if (<array_size>)
			begin
			if StructureContains Structure = ($Preset_Musician_Profiles_Locked [<array_count>]) locked
				unlock_profile id = ($Preset_Musician_Profiles_Locked [<array_count>].name) savegame = <savegame>
			endif
			array_count = (<array_count> + 1)
			repeat <array_size>
		endif
		array_count = 0
		GetArraySize \{$Bonus_Videos}
		if (<array_size>)
			begin
			SetGlobalTags savegame = <savegame> ($Bonus_Videos [<array_count>].id) params = {unlocked = 1}
			array_count = (<array_count> + 1)
			repeat <array_size>
		endif
	endif
	array_count = 0
	begin
	setlist_prefix = ($<songlist>.prefix)
	FormatText checksumname = tiername '%ptier%i' p = <setlist_prefix> i = (<array_count> + 1)
	FormatText checksumname = tier_checksum 'tier%s' s = (<array_count> + 1)
	if NOT GlobalExists name = <songlist> type = Structure
		ScriptAssert '%s does not exist' s = <songlist> DoNotResolve
	endif
	if NOT StructureContains Structure = ($<songlist>) <tier_checksum>
		ScriptAssert '%s not found in $ %d' s = <tier_checksum> d = <songlist> DoNotResolve
	endif
	if NOT StructureContains Structure = ($<songlist>.<tier_checksum>) songs
		ScriptAssert 'songs not found in $ %d . %s' d = <songlist> s = <tier_checksum> DoNotResolve
	endif
	GetArraySize ($<songlist>.<tier_checksum>.songs)
	song_count = 0
	begin
	setlist_prefix = ($<songlist>.prefix)
	format_globaltag_song_checksum part = ($<songlist>.part) song = ($<songlist>.<tier_checksum>.songs [<song_count>]) difficulty = <difficulty>
	stars = 5
	if (<song_count> = <array_size> - 1)
		if StructureContains Structure = ($<songlist>.<tier_checksum>) end_with_credits
			stars = 0
		endif
	endif
	if (<songs_only> = 1)
		SetGlobalTags savegame = <savegame> <song_checksum> params = {unlocked = 1}
	else
		SetGlobalTags savegame = <savegame> <song_checksum> params = {stars = <stars>
			score = 1000000
			unlocked = 1}
		get_difficulty_text_nl difficulty = <difficulty>
		get_song_prefix song = ($<songlist>.<tier_checksum>.songs [<song_count>])
		get_formatted_songname song_prefix = <song_prefix> difficulty_text_nl = <difficulty_text_nl>
	endif
	song_count = (<song_count> + 1)
	repeat <array_size>
	array_count = (<array_count> + 1)
	repeat ($<songlist>.num_tiers)
	setup_venuetags \{cheat}
endscript
instrument_progression_list = [
	Career_Guitar
	Career_Bass
	Career_Drum
	Career_Vocals
	Career_Band
]
instrument_progression_list_nl_strings = {
	Career_Guitar = 'guitar'
	Career_Bass = 'bass'
	Career_Drum = 'drum'
	Career_Vocals = 'vocals'
	Career_Band = 'band'
}
unlock_order_list = [
	GH4_Career_Guitar_Progression_Unlock_Order
	GH4_Career_Bass_Progression_Unlock_Order
	GH4_Career_Drum_Progression_Unlock_Order
	GH4_Career_Vocals_Progression_Unlock_Order
	GH4_Career_Band_Progression_Unlock_Order
]

script get_minimum_difficulty \{difficulty1 = easy
		difficulty2 = easy}
	if (<difficulty1> = <difficulty2>)
		return minimum_difficulty = <difficulty1>
	else
		switch <difficulty1>
			case easy
			return \{minimum_difficulty = easy}
			case medium
			if (<difficulty2> = easy)
				return \{minimum_difficulty = easy}
			else
				return \{minimum_difficulty = medium}
			endif
			case hard
			switch <difficulty2>
				case easy
				return \{minimum_difficulty = easy}
				case medium
				return \{minimum_difficulty = medium}
				case expert
				return \{minimum_difficulty = hard}
			endswitch
			case expert
			switch <difficulty2>
				case easy
				return \{minimum_difficulty = easy}
				case medium
				return \{minimum_difficulty = medium}
				case hard
				return \{minimum_difficulty = hard}
			endswitch
		endswitch
	endif
endscript

script get_game_mode_ui_string 
	if NOT GotParam \{game_mode}
		SoftAssert \{qs("\LDid not get game_mode!")}
		return
	endif
	return ui_string = ($game_mode_ui_strings.<game_mode>)
endscript
game_mode_ui_strings = {
	p1_career = qs("Career")
	p2_career = qs("Career")
	p1_quickplay = qs("Quick Play")
	p2_quickplay = qs("Co-op Quick Play")
	p2_faceoff = qs("Face Off")
	p2_pro_faceoff = qs("Pro Faceoff")
	p2_battle = qs("Battle")
	p2_coop = qs("Co-op")
}

script get_difficulty_ui_string 
	if NOT GotParam \{difficulty}
		SoftAssert \{qs("\LDid not get difficulty!")}
		return
	endif
	return ui_string = ($game_difficulty_ui_strings.<difficulty>)
endscript
game_difficulty_ui_strings = {
	easy = qs("Easy")
	medium = qs("Medium")
	hard = qs("Hard")
	expert = qs("Expert")
}
game_mode_names = {
	p1_career = 'p1_career'
	p2_career = 'p2_career'
	p1_quickplay = 'p1_quickplay'
	p2_quickplay = 'p2_quickplay'
	p2_faceoff = 'p2_faceoff'
	p2_pro_faceoff = 'p2_pro_faceoff'
	p4_pro_faceoff = 'p4_pro_faceoff'
	p2_battle = 'p2_battle'
	p8_pro_faceoff = 'p8_pro_faceoff'
	p2_coop = 'p2_coop'
	p4_quickplay = 'p4_quickplay'
	training = 'training'
	tutorial = 'tutorial'
}

script get_band_game_mode_name 
	game_mode_name = ($game_mode_names.p1_career)
	return game_mode_name = <game_mode_name>
endscript

script get_game_mode_name 
	return game_mode_name = ($game_mode_names.$game_mode)
endscript

script get_band_info \{band_index = 1}
	if ($num_career_bands > 1)
		FormatText checksumname = band_info 'band%i_info' i = <band_index> AddToStringLookup = true
		return band_info = <band_info>
	else
		return \{band_info = band_info}
	endif
endscript

script get_current_band_info 
	get_band_info band_index = ($current_band)
	return band_info = <band_info>
endscript

script get_band_checksum \{band_index = 1}
	if ($num_career_bands > 1)
		FormatText checksumname = band_checksum 'career_band%i' i = <band_index> AddToStringLookup = true
		return band_checksum = <band_checksum>
	else
		return \{band_checksum = Career_Band}
	endif
endscript

script get_current_band_checksum 
	get_band_checksum band_index = ($current_band)
	return band_checksum = <band_checksum>
endscript

script set_current_band_part_flags 
	RequireParams \{[
			desc_id
			part
		]
		all}
	if GotParam \{unlocked}
		flag = {unlocked}
	endif
	if GotParam \{purchased}
		flag = {purchased}
	endif
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	if NOT GotParam \{unlock_purchased}
		initilize_current_band_unlock_purchase
	endif
	if NOT StructureContains Structure = <unlock_purchased> <part>
		ScriptAssert qs("\LPart %p provided to set_current_band_unlock_flags is not valid.") p = <part>
	endif
	unlock_purchased_struct = (<unlock_purchased>.<part>)
	GetArraySize \{unlock_purchased_struct}
	if (<array_size> > 0)
		i = 0
		begin
		if (((<unlock_purchased_struct> [<i>]).desc_id) = <desc_id>)
			SetArrayElement ArrayName = unlock_purchased_struct index = <i> newvalue = {(<unlock_purchased_struct> [<i>]) desc_id = <desc_id> <flag>}
			AddParam name = <part> structure_name = new_entry value = <unlock_purchased_struct>
			unlock_purchased = {<unlock_purchased> <new_entry>}
			LockGlobalTags \{off}
			SetGlobalTags <band_info> params = {unlock_purchased = <unlock_purchased>} savegame = <savegame>
			LockGlobalTags
			return
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	AddArrayElement array = <unlock_purchased_struct> element = {desc_id = <desc_id> <flag>}
	AddParam name = <part> structure_name = new_entry value = <array>
	unlock_purchased = {<unlock_purchased> <new_entry>}
	LockGlobalTags \{off}
	SetGlobalTags <band_info> params = {unlock_purchased = <unlock_purchased>} savegame = <savegame>
	LockGlobalTags
	return
endscript

script initilize_current_band_unlock_purchase 
	GetArraySize ($master_editable_list)
	i = 0
	begin
	AddParam name = ((($master_editable_list) [<i>]).part) value = []
	i = (<i> + 1)
	repeat <array_size>
	RemoveParameter \{i}
	RemoveParameter \{array_size}
	unlock_purchased = {<...>}
	return unlock_purchased = <unlock_purchased>
endscript

script unlock_purchase_all_cas_parts 
	GetArraySize ($master_editable_list)
	master_list_size = <array_size>
	i = 0
	begin
	part = ((($master_editable_list) [<i>]).part)
	GetArraySize ($<part>)
	j = 0
	begin
	if StructureContains Structure = (($<part>) [<j>]) locked
		set_current_band_part_flags part = <part> desc_id = ((($<part>) [<j>]).desc_id) unlocked
	endif
	if StructureContains Structure = (($<part>) [<j>]) price
		set_current_band_part_flags part = <part> desc_id = ((($<part>) [<j>]).desc_id) purchased
	endif
	j = (<j> + 1)
	repeat <array_size>
	i = (<i> + 1)
	repeat <master_list_size>
endscript

script get_current_band_part_flags 
	RequireParams \{[
			desc_id
			part
		]
		all}
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame>
	if NOT GotParam \{unlock_purchased}
		return
	endif
	if NOT StructureContains Structure = <unlock_purchased> <part>
		ScriptAssert qs("\LPart %p provided to set_current_band_unlock_flags is not valid.") p = <part>
	endif
	unlock_purchased_struct = (<unlock_purchased>.<part>)
	GetArraySize \{unlock_purchased_struct}
	if (<array_size> > 0)
		i = 0
		begin
		if (((<unlock_purchased_struct> [<i>]).desc_id) = <desc_id>)
			return part_flags = (<unlock_purchased_struct> [<i>])
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script get_current_band_name 
	get_current_band_info
	GetGlobalTags <band_info>
	return band_name = <name>
endscript

script setup_cas_helper_tags 
	SetGlobalTags savegame = <savegame> cas_helper_dialogue params = {
		visit_cag = 0
		visit_cap = 0
		visit_cadrm = 0
		visit_deformation = 0
		visit_outfit = 0
	}
endscript
default_gig_tags = {
	unlocked = 0
	first_time_unlocked = 0
	completed = 0
	started = 0
	encore_unlocked = 0
	boss_unlocked = 0
	cash_earned = 0
	gig_progress = 0
}
default_special_event_gig_tags = {
	unlocked = 0
	completed = -1
	challenge1_unlocked = 1
	challenge2_unlocked = 0
	challenge3_unlocked = 0
	challenge1_completed = 0
	challenge2_completed = 0
	challenge3_completed = 0
}
default_pay_to_play_gig_tags = {
	unlocked = 0
	first_time_unlocked = 0
	completed = 0
	cash_earned = 0
	gig_progress = 0
}

script setup_gigtags \{globaltag_checksum = none
		use_cheat_tags = 0}
	if NOT GotParam \{unlock_order}
		unlock_order = GH4_Career_Band_Progression_Unlock_Order
		if (<part> = guitar)
			unlock_order = GH4_Career_Guitar_Progression_Unlock_Order
		elseif (<part> = drum)
			unlock_order = GH4_Career_Drum_Progression_Unlock_Order
		elseif (<part> = Bass)
			unlock_order = GH4_Career_Bass_Progression_Unlock_Order
		elseif (<part> = Vocals)
			unlock_order = GH4_Career_Vocals_Progression_Unlock_Order
		endif
	endif
	setlist_prefix = ($<unlock_order>.name)
	cheat_tags = {}
	if (<use_cheat_tags> = 1)
		<cheat_tags> = {unlocked = 1 encore_unlocked = 1 boss_unlocked = 1 started = 1 gig_progress = 10}
	endif
	free_gig = 1
	begin
	FormatText checksumname = gignum 'gig%d' d = <free_gig>
	if NOT StructureContains Structure = ($<unlock_order>.freegigs) <gignum>
		break
	endif
	gig = ($<unlock_order>.freegigs.<gignum>.name)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig> band_prefix = <bandname_id>
	additional_tags = {}
	if StructureContains Structure = ($<unlock_order>.freegigs.<gignum>) DEBUG_DONT_UNLOCK
		<additional_tags> = {completed = -1}
	endif
	SetGlobalTags {
		savegame = <savegame>
		<gig_name>
		params = {($default_gig_tags) <additional_tags> unlocked = 1}
		packtype = gigtags
	}
	globaltag_checksum = (<globaltag_checksum> + <gig_name>)
	FormatText checksumname = tier 'tier%d' d = ($<unlock_order>.freegigs.<gignum>.num)
	song_count = 0
	GetArraySize ($<SetList_Songs>.<tier>.songs)
	begin
	SetGlobalTags savegame = <savegame> ($<SetList_Songs>.<tier>.songs [<song_count>]) params = {unlocked = 1}
	<song_count> = (<song_count> + 1)
	repeat <array_size>
	tier_level = ($<SetList_Songs>.<tier>.level)
	FormatText {
		checksumname = venue_checksum
		'%s_%i'
		s = ($LevelZones.<tier_level>.name)
		i = ($instrument_list.($<SetList_Songs>.part).text_nl)
		AddToStringLookup = true
	}
	if NOT StructureContains Structure = ($<unlock_order>.freegigs.<gignum>) DEBUG_DONT_UNLOCK
		SetGlobalTags savegame = <savegame> <venue_checksum> params = {unlocked = 1}
	endif
	FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.<tier_level>.name)
	SetGlobalTags savegame = <savegame> <venue_checksum> params = {unlocked = 1}
	<free_gig> = (<free_gig> + 1)
	repeat
	set_num = 1
	begin
	FormatText checksumname = setnum 'unlockset%d' d = <set_num>
	if NOT StructureContains Structure = $<unlock_order> <setnum>
		break
	endif
	gig_num = 1
	begin
	FormatText checksumname = gignum 'gig%d' d = <gig_num>
	if NOT StructureContains Structure = ($<unlock_order>.<setnum>) <gignum>
		break
	endif
	gig = ($<unlock_order>.<setnum>.<gignum>.name)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig> band_prefix = <bandname_id>
	SetGlobalTags {
		savegame = <savegame>
		<gig_name>
		params = {($default_gig_tags) <cheat_tags>}
		packtype = gigtags
	}
	globaltag_checksum = (<globaltag_checksum> + <gig_name>)
	<gig_num> = (<gig_num> + 1)
	repeat
	paytoplay_num = 1
	begin
	FormatText checksumname = paytoplaynum 'pay_to_play%d' d = <paytoplay_num>
	if NOT StructureContains Structure = ($<unlock_order>.<setnum>) <paytoplaynum>
		break
	endif
	gig = ($<unlock_order>.<setnum>.<paytoplaynum>.name)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig> band_prefix = <bandname_id>
	SetGlobalTags savegame = <savegame> <gig_name> params = {($default_pay_to_play_gig_tags) <cheat_tags>} packtype = gigtags
	globaltag_checksum = (<globaltag_checksum> + <gig_name>)
	<paytoplay_num> = (<paytoplay_num> + 1)
	repeat
	<set_num> = (<set_num> + 1)
	repeat
	free_gig = 1
	begin
	FormatText checksumname = gignum 'gig%d' d = <free_gig>
	if NOT StructureContains Structure = ($<unlock_order>.freegigs_last) <gignum>
		break
	endif
	gig = ($<unlock_order>.freegigs_last.<gignum>.name)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig> band_prefix = <bandname_id>
	additional_tags = {}
	if StructureContains Structure = ($<unlock_order>.freegigs_last.<gignum>) DEBUG_DONT_UNLOCK
		<additional_tags> = {completed = -1}
	endif
	SetGlobalTags {
		savegame = <savegame>
		<gig_name>
		params = {($default_gig_tags) <additional_tags>}
		packtype = gigtags
	}
	globaltag_checksum = (<globaltag_checksum> + <gig_name>)
	<free_gig> = (<free_gig> + 1)
	repeat
	return globaltag_checksum = <globaltag_checksum>
endscript

script format_globaltag_song_checksum difficulty = ($player1_status.difficulty)
	if GotParam \{song}
		get_song_name song = <song>
	endif
	if GotParam \{difficulty_index}
		get_difficulty_text_nl index = <difficulty_index>
	else
		if NOT GotParam \{difficulty_text_nl}
			get_difficulty_text_nl difficulty = <difficulty>
		endif
	endif
	if NOT GotParam \{part}
		part = guitar
	endif
	if NOT GotParam \{part_text}
		part_text = ($instrument_list.<part>.text_nl)
	endif
	FormatText checksumname = song_checksum '%s%p%d' s = <song_name> p = <part_text> d = <difficulty_text_nl> AddToStringLookup = true
	return song_checksum = <song_checksum>
endscript

script get_autosave_enabled 
	GetGlobalTags \{user_options}
	return enabled = <autosave>
endscript

script format_globaltag_gigname 
	RequireParams \{[
			setlist_prefix
		]
		all}
	if GotParam \{gignum}
		FormatText TextName = gig 'gig%g' g = (<gignum>)
	endif
	if NOT GotParam \{band_prefix}
		FormatText TextName = bandname_id 'band%d' d = ($current_band)
		band_prefix = <bandname_id>
	endif
	FormatText checksumname = gig_name '%b_%s_%g' b = <band_prefix> s = <setlist_prefix> g = <gig> AddToStringLookup = true
	return gig_name = <gig_name>
endscript

script setup_quickplay_song_tags 
	if GotParam \{allsongs}
		GetArraySize ($gh_songlist)
		i = 0
		begin
		song = ($gh_songlist [<i>])
		get_song_saved_in_globaltags song = <song>
		if (<saved_in_globaltags> = 1)
			SetGlobalTags savegame = <savegame> <song> params = {unlocked = 0}
		endif
		i = (<i> + 1)
		repeat <array_size>
		return
	endif
	if NOT GotParam \{unlock_order}
		unlock_order = GH4_Career_Band_Progression_Unlock_Order
		if (<part> = guitar)
			unlock_order = GH4_Career_Guitar_Progression_Unlock_Order
		elseif (<part> = drum)
			unlock_order = GH4_Career_Drum_Progression_Unlock_Order
		elseif (<part> = Bass)
			unlock_order = GH4_Career_Bass_Progression_Unlock_Order
		elseif (<part> = Vocals)
			unlock_order = GH4_Career_Vocals_Progression_Unlock_Order
		endif
	endif
	free_gig = 1
	begin
	FormatText checksumname = gignum 'gig%d' d = <free_gig>
	if NOT StructureContains Structure = ($<unlock_order>.freegigs) <gignum>
		break
	endif
	FormatText checksumname = tier 'tier%d' d = ($<unlock_order>.freegigs.<gignum>.num)
	song_count = 0
	GetArraySize ($<SetList_Songs>.<tier>.songs)
	begin
	SetGlobalTags savegame = <savegame> ($<SetList_Songs>.<tier>.songs [<song_count>]) params = {unlocked = 1}
	<globaltag_checksum> = (<globaltag_checksum> + ($<SetList_Songs>.<tier>.songs [<song_count>]))
	<song_count> = (<song_count> + 1)
	repeat <array_size>
	<free_gig> = (<free_gig> + 1)
	repeat
	return globaltag_checksum = <globaltag_checksum>
endscript

script set_band_character_id_globaltag 
	if band_builder_is_random character_id = <character_id>
		return
	endif
	if (($is_network_game = 0) && (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff)))
		RequireParams \{[
				savegame
				player
				character_id
			]}
		player_index = (<player> -1)
		printf 'set_band_character_id_globaltag h2h savegame=%d player_index=%i char=%c' d = <savegame> i = <player_index> c = <character_id>
		GetGlobalTags savegame = <savegame> last_h2h_characters
		SetArrayElement ArrayName = last_h2h_characters index = <player_index> newvalue = <character_id>
		SetGlobalTags savegame = <savegame> last_h2h_characters params = {last_h2h_characters = <last_h2h_characters>}
		return
	endif
	if (($band_mode_mode = career) || ($is_network_game = 1))
		printf 'set_band_character_id_globaltag savegame=%d controller=%i char=%c' d = <savegame> i = <controller> c = <character_id>
		RequireParams \{[
				savegame
				controller
				character_id
			]}
		if (<controller> >= 4)
			return
		endif
		GetGlobalTags savegame = <savegame> last_band_characters
		SetArrayElement ArrayName = last_band_characters index = <controller> newvalue = <character_id>
		SetGlobalTags savegame = <savegame> last_band_characters params = {last_band_characters = <last_band_characters>}
	endif
endscript

script get_last_band_character_recorded 
	RequireParams \{[
			player
		]
		all}
	FormatText checksumname = player_status 'player%p_status' p = <player>
	controller = ($<player_status>.controller)
	get_savegame_from_player_status band_character_select player_status = <player_status>
	if (($is_network_game = 0) && (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff)))
		if NOT GotParam \{character_id}
			player_index = (<player> -1)
			GetGlobalTags savegame = <savegame> last_h2h_characters
			character_id = (<last_h2h_characters> [<player_index>])
		endif
	else
		if NOT GotParam \{character_id}
			if (<controller> >= 4)
				return \{character_id = none}
			endif
			GetGlobalTags savegame = <savegame> last_band_characters
			character_id = (<last_band_characters> [<controller>])
		endif
	endif
	if NOT profile_exists id = <character_id> savegame = <savegame>
		character_id = none
	endif
	return character_id = <character_id>
endscript

script setup_saved_instrument_tags 
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_created_graphics_save max_size = ($max_num_logo_saves) packtype = logos
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_guitar_save max_size = ($max_num_instrument_saves) packtype = guitars
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_bass_save max_size = ($max_num_instrument_saves) packtype = basses
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_drum_save max_size = ($max_num_instrument_saves) packtype = Drums
	globaltag_createarray globaltag_checksum = <globaltag_checksum> savegame = <savegame> array_name = player_mic_save max_size = ($max_num_instrument_saves) packtype = Vocals
	return globaltag_checksum = <globaltag_checksum>
endscript

script globaltag_createarray 
	RequireParams \{[
			savegame
			array_name
			max_size
			packtype
		]
		all}
	SetGlobalTags savegame = <savegame> <array_name> params = {valid_entries = [] max_size = <max_size>}
	i = 0
	begin
	FormatText TextName = arrayappend '_array%d' d = <i>
	ExtendCRC <array_name> <arrayappend> out = arrayid
	SetGlobalTags savegame = <savegame> <arrayid> params = {contents = {}} packtype = <packtype>
	globaltag_checksum = (<globaltag_checksum> + <arrayid>)
	i = (<i> + 1)
	repeat <max_size>
	if GotParam \{start_full}
		i = 0
		begin
		globaltag_addarrayelement savegame = <savegame> array_name = <array_name> element = {}
		i = (<i> + 1)
		repeat <max_size>
	endif
	return globaltag_checksum = <globaltag_checksum>
endscript

script globaltag_getarraysize 
	RequireParams \{[
			savegame
			array_name
		]
		all}
	GetGlobalTags savegame = <savegame> <array_name>
	GetArraySize <valid_entries>
	return array_size = <array_size>
endscript

script globaltag_getarrayelement 
	RequireParams \{[
			savegame
			array_name
			index
		]
		all}
	GetGlobalTags savegame = <savegame> <array_name>
	GetArraySize <valid_entries>
	if (<index> < <array_size>)
		GetGlobalTags savegame = <savegame> (<valid_entries> [<index>])
		return true element = <contents>
	endif
	return \{false}
endscript

script globaltag_setarrayelement 
	RequireParams \{[
			savegame
			array_name
			index
			element
		]
		all}
	GetGlobalTags savegame = <savegame> <array_name>
	GetArraySize <valid_entries>
	if (<index> < <array_size>)
		SetGlobalTags savegame = <savegame> (<valid_entries> [<index>]) params = {contents = <element>}
		return \{true}
	endif
	return \{false}
endscript

script globaltag_addarrayelement 
	RequireParams \{[
			savegame
			array_name
			element
		]
		all}
	GetGlobalTags savegame = <savegame> <array_name>
	GetArraySize <valid_entries>
	if (<array_size> < <max_size>)
		i = 0
		begin
		FormatText TextName = arrayappend '_array%d' d = <i>
		ExtendCRC <array_name> <arrayappend> out = arrayid
		if NOT ArrayContains array = <valid_entries> contains = <arrayid>
			AddArrayElement array = <valid_entries> element = <arrayid>
			SetGlobalTags savegame = <savegame> <array_name> params = {valid_entries = <array> max_size = <max_size>}
			SetGlobalTags savegame = <savegame> <arrayid> params = {contents = <element>}
			return \{true}
		endif
		i = (<i> + 1)
		repeat (<array_size> + 1)
	endif
	return \{false}
endscript

script globaltag_removearrayelement 
	RequireParams \{[
			savegame
			array_name
			index
		]
		all}
	GetGlobalTags savegame = <savegame> <array_name>
	GetArraySize <valid_entries>
	if (<array_size> <= <max_size>)
		RemoveArrayElement array = <valid_entries> index = <index>
		SetGlobalTags savegame = <savegame> <array_name> params = {valid_entries = <array> max_size = <max_size>}
		return \{true}
	endif
	return \{false}
endscript

script globaltag_getarraychecksum 
	RequireParams \{[
			savegame
			array_name
		]
		all}
	array_checksum = arse
	globaltag_getarraysize savegame = <savegame> array_name = <array_name>
	if (<array_size> > 0)
		i = 0
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = <array_name> index = <i>
		GenerateChecksumFromStruct \{StructName = element}
		array_checksum = (<array_checksum> + <structure_checksum>)
		i = (<i> + 1)
		repeat <array_size>
	endif
	return array_checksum = <array_checksum>
endscript
neversoft_hiscore_names = [
	qs("\LDan")
	qs("\LJason")
	qs(0x7b14bc1a)
	qs(0x3620edcf)
	qs("\LJon")
	qs(0xf453ed01)
	qs("\LNick")
	qs("\LMarcus")
	qs(0x5841e81d)
	qs("\LKevin")
	qs("\LTom")
	qs(0x95de7259)
	qs(0x50887e52)
	qs("\LTim")
	qs("\LDavid")
	qs("\LRob")
	qs("\LColin")
	qs(0x30bb629c)
	qs("\LChris")
	qs(0xfc14280f)
	qs(0x01d35d32)
	qs(0x8964c5e9)
	qs(0xa74dbf7e)
	qs(0x35f6ef54)
	qs(0xa05864bf)
	qs(0x57689ca3)
	qs(0x5013af7d)
	qs("\LMatt")
	qs(0x94d1c609)
	qs(0x1d51ef5a)
	qs("\LMichael")
	qs(0xebf6f0b0)
	qs("\LGrant")
	qs(0xfedec7ea)
	qs(0xafb91015)
	qs(0x445d0668)
	qs(0x1c46c380)
	qs(0xc482c2cf)
	qs("\LBob")
	qs("\LJames")
	qs(0xba6013cb)
	qs("\LJake")
]
