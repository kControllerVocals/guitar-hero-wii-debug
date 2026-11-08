progression_beat_game_last_song = 0
progression_unlock_tier_last_song = 0
progression_got_sponsored_last_song = 0
progression_play_completion_movie = 0
progression_completion_tier = 1
progression_unlocked_guitar = -1
progression_unlocked_guitar2 = -1
progression_unlocked_type = guitar
Cash_System_rules = [
	{
		diff = easy_rhythm
		newstars = 3
		oldstars = 0
		Cash = 35
	}
	{
		diff = easy_rhythm
		newstars = 4
		oldstars = 0
		Cash = 85
	}
	{
		diff = easy_rhythm
		newstars = 5
		oldstars = 0
		Cash = 150
	}
	{
		diff = easy_rhythm
		newstars = 4
		oldstars = 3
		Cash = 50
	}
	{
		diff = easy_rhythm
		newstars = 5
		oldstars = 3
		Cash = 115
	}
	{
		diff = easy_rhythm
		newstars = 5
		oldstars = 4
		Cash = 65
	}
	{
		diff = easy
		newstars = 3
		oldstars = 0
		Cash = 75
	}
	{
		diff = easy
		newstars = 4
		oldstars = 0
		Cash = 175
	}
	{
		diff = easy
		newstars = 5
		oldstars = 0
		Cash = 300
	}
	{
		diff = easy
		newstars = 4
		oldstars = 3
		Cash = 100
	}
	{
		diff = easy
		newstars = 5
		oldstars = 3
		Cash = 225
	}
	{
		diff = easy
		newstars = 5
		oldstars = 4
		Cash = 125
	}
	{
		diff = medium
		newstars = 3
		oldstars = 0
		Cash = 150
	}
	{
		diff = medium
		newstars = 4
		oldstars = 0
		Cash = 350
	}
	{
		diff = medium
		newstars = 5
		oldstars = 0
		Cash = 600
	}
	{
		diff = medium
		newstars = 4
		oldstars = 3
		Cash = 200
	}
	{
		diff = medium
		newstars = 5
		oldstars = 3
		Cash = 450
	}
	{
		diff = medium
		newstars = 5
		oldstars = 4
		Cash = 250
	}
	{
		diff = hard
		newstars = 3
		oldstars = 0
		Cash = 300
	}
	{
		diff = hard
		newstars = 4
		oldstars = 0
		Cash = 700
	}
	{
		diff = hard
		newstars = 5
		oldstars = 0
		Cash = 1200
	}
	{
		diff = hard
		newstars = 4
		oldstars = 3
		Cash = 400
	}
	{
		diff = hard
		newstars = 5
		oldstars = 3
		Cash = 900
	}
	{
		diff = hard
		newstars = 5
		oldstars = 4
		Cash = 500
	}
	{
		diff = expert
		newstars = 3
		oldstars = 0
		Cash = 450
	}
	{
		diff = expert
		newstars = 4
		oldstars = 0
		Cash = 1050
	}
	{
		diff = expert
		newstars = 5
		oldstars = 0
		Cash = 1800
	}
	{
		diff = expert
		newstars = 4
		oldstars = 3
		Cash = 600
	}
	{
		diff = expert
		newstars = 5
		oldstars = 3
		Cash = 1350
	}
	{
		diff = expert
		newstars = 5
		oldstars = 4
		Cash = 750
	}
]
Songs_Implemented = {
}

script Progression_CheckSong5Star 
	printf \{qs("\LProgression_CheckSong5Star")}
	get_progression_globals game_mode = ($game_mode)
	songlist = <tier_global>
	tier = 1
	begin
	setlist_prefix = ($<songlist>.prefix)
	FormatText checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	FormatText checksumname = tier_checksum 'tier%s' s = <tier>
	GetArraySize ($<songlist>.<tier_checksum>.songs)
	unlocked = 0
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gignum = <tier>
	GetGlobalTags <gig_name>
	if (<unlocked> = 0 && <completed> = 0)
		return \{false}
	endif
	array_count = 0
	begin
	if ($current_progression_flag = Career_Band)
		get_band_difficulty
		format_globaltag_song_checksum part = ($<songlist>.part) song = ($<songlist>.<tier_checksum>.songs [<array_count>]) difficulty = <band_difficulty>
	else
		format_globaltag_song_checksum part = ($<songlist>.part) song = ($<songlist>.<tier_checksum>.songs [<array_count>])
	endif
	GetGlobalTags <song_checksum> param = unlocked
	GetGlobalTags <song_checksum> param = stars
	if NOT Progression_IsBossSong tier_global = <tier_global> tier = <tier> song = ($<songlist>.<tier_checksum>.songs [<array_count>])
		if NOT (<stars> = 5)
			return \{false}
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	tier = (<tier> + 1)
	repeat ($<songlist>.num_tiers)
	return \{true}
endscript

script Progression_CheckDiff 
	printf \{qs("\LProgression_CheckDiff")}
	Progression_GetDifficulty
	if NOT (<diff> = <difficulty>)
		return \{false}
	endif
	if GotParam \{mode}
		if NOT ($game_mode = <mode>)
			return \{false}
		endif
	endif
	return \{true}
endscript

script Progression_SongFailed 
	printf \{qs("\LProgression_SongFailed")}
	if ($coop_dlc_active = 1)
		return
	endif
	if ($game_mode = p1_career ||
			$game_mode = p2_career)
		UpdateAtoms \{name = Progression}
	endif
endscript

script Progression_SongWon 
	printf \{qs("\LProgression_SongWon")}
	additional_cash = 0
	change \{progression_beat_game_last_song = 0}
	change \{progression_unlock_tier_last_song = 0}
	change \{progression_got_sponsored_last_song = 0}
	change \{progression_play_completion_movie = 0}
	update_song_star_rating
	if isSinglePlayerGame
		GetPlayerInfo \{1
			part}
	else
		part = Band
	endif
	get_difficulty_text_nl difficulty = ($player1_status.difficulty)
	get_song_prefix song = ($current_song)
	get_formatted_songname song_prefix = (<song_prefix>) difficulty_text_nl = <difficulty_text_nl> part = ($instrument_list.<part>.text_nl)
	if ($current_song != jamsession)
		if isSinglePlayerGame
			get_player_percent_accuracy \{player_index = 1}
		else
			GameMode_GetNumPlayersShown
			p = 1
			gold_stars = 1
			begin
			get_player_percent_accuracy player_index = <p>
			if (<percent_notes_hit> != 100)
				gold_stars = 0
			endif
			p = (<p> + 1)
			repeat <num_players_shown>
			if (<gold_stars> = 1)
				<percent_notes_hit> = 100
			else
				<percent_notes_hit> = 0
			endif
		endif
		if (<percent_notes_hit> = 100)
			if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
				SetGlobalTags <songname> params = {tr_percent100 = 1}
			endif
		endif
	endif
	GameMode_GetType
	if (<type> = career)
		update_gig_progress
		get_progression_globals ($current_progression_flag) game_mode = ($game_mode) use_current_tab = 1
		songlist = <tier_global>
		FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
		SetGlobalTags <bandname_id> params = {first_play = 0} all_active_players = 1
		GetGlobalTags \{Progression
			params = current_tier}
		GetGlobalTags \{Progression
			params = current_song_count}
		GetGlobalTags \{Progression
			params = career_using_createagig}
		song_count = <current_song_count>
		if GotParam \{current_tier}
			setlist_prefix = ($<songlist>.prefix)
			FormatText checksumname = tier_checksum 'tier%s' s = <current_tier>
			if (<career_using_createagig> = 1)
				if ($current_progression_flag = Career_Band)
					get_band_difficulty
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($current_song) difficulty = <band_difficulty>
				else
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($current_song)
				endif
			else
				if ($current_progression_flag = Career_Band)
					get_band_difficulty
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier_checksum>.songs [<song_count>]) difficulty = <band_difficulty>
				else
					format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier_checksum>.songs [<song_count>])
				endif
			endif
			if Progression_IsBossSong tier_global = <tier_global> tier = <current_tier> song = ($<tier_global>.<tier_checksum>.songs [<song_count>])
				change \{structurename = player1_status
					stars = 5}
			endif
			GetGlobalTags <song_checksum> param = stars
			old_stars = <stars>
			GetGlobalTags <song_checksum> param = score
			old_score = <score>
			if isSinglePlayerGame
				GetPlayerInfo \{1
					stars}
				new_stars = <stars>
			else
				new_stars = ($band1_status.stars)
			endif
			new_score = 0
			player = 1
			begin
			GetPlayerInfo <player> score
			new_score = (<new_score> + <score>)
			player = (<player> + 1)
			repeat $current_num_players
			if ($is_network_game = 0)
				Progression_CashMilestonesSongWon
			endif
			if ($player1_status.total_notes > 0)
				p1_percent_complete = (100 * $player1_status.notes_hit / $player1_status.total_notes)
				if (<p1_percent_complete> = 100)
					SetGlobalTags <song_checksum> params = {percent100 = 1} all_active_players = 1
				endif
			endif
			if (<new_stars> > <old_stars>)
				SetGlobalTags <song_checksum> params = {stars = <new_stars>} all_active_players = 1
				if ($current_tab = tab_setlist)
					if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) nocash
						Progression_AwardCash old_stars = <stars> new_stars = <new_stars>
					endif
				endif
			endif
			if (<new_score> > <old_score>)
				CastToInteger \{new_score}
				SetGlobalTags <song_checksum> params = {score = <new_score>} all_active_players = 1
			endif
			setup_encore = 1
			GetGlobalTags \{Progression
				params = career_play_song_and_end
				noassert = 1}
			if GotParam \{career_play_song_and_end}
				if (<career_play_song_and_end> = 1)
					setup_encore = 0
				endif
			endif
			if (<career_using_createagig> = 1)
				setup_encore = 0
			endif
			if (<setup_encore> = 1)
				GetArraySize ($<tier_global>.<tier_checksum>.songs)
				GetGlobalTags \{Progression
					params = current_song_count}
				if StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep1
					if ((<current_song_count> + 1) = (<array_size> - 1))
						change \{current_transition = preencore}
						<current_song_count> = (<current_song_count> + 1)
						SetGlobalTags Progression params = {current_song_count = <current_song_count> encore_song = ($<tier_global>.<tier_checksum>.encorep1)}
					endif
				endif
			endif
			if ($is_network_game = 0)
				format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
				GetGlobalTags <gig_name> param = completed
				if (<completed> = 0)
					if StructureContains Structure = ($<tier_global>.<tier_checksum>) end_with_credits
						if Progression_Career_Check_Gig_Complete ($current_progression_flag) gig = ($current_gig_number)
							change \{end_credits = 1}
						endif
					endif
				endif
			endif
		endif
		if NOT ($current_song = jamsession)
			if GlobalTagExists \{$current_song
					noassert = 1}
				SetGlobalTags \{$current_song
					all_active_players = 1
					params = {
						unlocked = 1
					}}
			endif
		endif
	elseif (<type> = quickplay && $is_network_game = 0)
		Progression_CashMilestonesSongWon
	endif
	Progression_UpdateDetailedStatsForGig
endscript

script update_song_star_rating 
	GameMode_GetNumPlayersShown
	player = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player>
	new_stars = 3
	if ($<player_status>.score >= $<player_status>.base_score * ($star_rating_cutoffs.star5 [(<num_players_shown> - 1)]))
		new_stars = 5
	elseif ($<player_status>.score >= $<player_status>.base_score * ($star_rating_cutoffs.star4 [(<num_players_shown> - 1)]))
		new_stars = 4
	endif
	change structurename = <player_status> stars = <new_stars>
	player = (<player> + 1)
	repeat $current_num_players
	player = 1
	summed_averages = 0.0
	begin
	get_average_multiplier player = <player>
	summed_averages = (<summed_averages> + <average_multiplier>)
	player = (<player> + 1)
	repeat <num_players_shown>
	band_avg_multiplier = (<summed_averages> / <num_players_shown>)
	band_stars = 3
	if (<band_avg_multiplier> >= ($star_rating_cutoffs.star5 [0]))
		band_stars = 5
	elseif (<band_avg_multiplier> >= ($star_rating_cutoffs.star4 [0]))
		band_stars = 4
	endif
	change structurename = band1_status stars = <band_stars>
endscript

script get_player_percent_accuracy 
	RequireParams \{[
			player_index
		]
		all}
	if NOT PlayerInfoEquals <player_index> part = Vocals
		GetPlayerInfo <player_index> notes_hit
		GetPlayerInfo <player_index> max_notes
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	else
		GetPlayerInfo <player_index> vocal_phrase_quality
		GetPlayerInfo <player_index> vocal_phrase_max_qual
		if (<vocal_phrase_max_qual> > 0)
			<percent_notes_hit> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
	endif
	MathFloor <percent_notes_hit>
	<percent_notes_hit> = <floor>
	return percent_notes_hit = <percent_notes_hit>
endscript
end_credits = 0
boss_devil_score = 0

script Progression_EndCredits 
	printf \{qs("\LCREDITS BEGIN")}
	change boss_devil_score = ($player1_status.score)
	reset_score \{player_status = player1_status}
	change \{current_level = load_z_credits}
	change \{current_song = $final_credits_song}
	create_loading_screen \{force_predisplay = 1}
	Load_Venue
	spawnscriptnow \{Credits_ScreenFX}
	restart_gem_scroller song_name = ($current_song) difficulty = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty) StartTime = 0 end_credits_restart = 1
	generic_event_choose \{state = uistate_play_song}
	spawnscriptnow \{scrolling_list_begin}
endscript

script Progression_EndCredits_Done 
	if ($end_credits = 1)
		change structurename = player1_status score = ($boss_devil_score)
		change \{boss_devil_score = 0}
	endif
	destroy_credits_menu
endscript

script PlayMovie_EndCredits 
	KillMovie \{TextureSlot = 1}
	PreLoadMovie \{movie = 'Fret_Flames'
		TextureSlot = 1
		TexturePri = -2
		no_loop
		no_hold}
	begin
	if (isMoviePreLoaded TextureSlot = 1)
		StartPreLoadedMovie \{TextureSlot = 1}
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script Progression_AwardCash 
	printf \{qs("\LProgression_AwardCash")}
	additional_cash = 0
	get_current_band_info
	GetGlobalTags <band_info>
	GetGlobalTags \{Progression
		params = current_song_count}
	get_progression_globals ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	GetGlobalTags <gig_name> param = cash_earned
	SetGlobalTags <gig_name> params = {cash_earned = (<cash_earned> + <additional_cash>)}
	GetGlobalTags \{Progression
		params = current_song_count}
	return additional_cash = <additional_cash>
endscript

script Progression_CountCompletedSongsInCurrentTier 
	completed_songs = 0
	tier_size = 0
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	if NOT (<tier_global> = 0 || $current_gig_number = 0)
		Progression_GetNumTierSong tier_global = <tier_global> tier = ($current_gig_number) all
		song_count = 0
		begin
		Progression_GetTierSong tier_global = <tier_global> tier = ($current_gig_number) song_count = <song_count>
		GetGlobalTags <song_checksum> param = stars
		if NOT (<stars> = 0)
			completed_songs = (<completed_songs> + 1)
		endif
		song_count = (<song_count> + 1)
		repeat <tier_size>
	endif
	return {completed_songs = <completed_songs> total_songs = <tier_size>}
endscript

script Progression_GetNumTierSong 
	FormatText checksumname = tier_checksum 'tier%s' s = <tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	if GotParam \{all}
		return tier_size = <array_size>
	endif
	if StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep1
		array_size = (<array_size> - 1)
	endif
	if StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep2
		array_size = (<array_size> - 1)
	endif
	if StructureContains Structure = ($<tier_global>.<tier_checksum>) boss
		array_size = (<array_size> - 1)
	endif
	return tier_size = <array_size>
endscript

script Progression_GetTierSong 
	setlist_prefix = ($<tier_global>.prefix)
	FormatText checksumname = tier_checksum 'tier%s' s = <tier>
	song = ($<tier_global>.<tier_checksum>.songs [<song_count>])
	format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
	return song = <song> song_checksum = <song_checksum>
endscript

script Progression_GetBossSong 
	setlist_prefix = ($<tier_global>.prefix)
	FormatText checksumname = tier_checksum 'tier%s' s = <tier>
	if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) boss
		return \{song_count = -1
			song = none
			song_checksum = none}
	endif
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = (<array_size> - 1)
	if StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep1
		array_count = (<array_count> - 1)
	endif
	song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
	format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
	return song_count = <array_count> song = <song> song_checksum = <song_checksum>
endscript

script Progression_GetEncoreSong \{type = any}
	setlist_prefix = ($<tier_global>.prefix)
	FormatText checksumname = tier_checksum 'tier%s' s = <tier>
	if (<type> = any)
		if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep1
			if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep2
				return \{song_count = -1
					song = none
					song_checksum = none}
			endif
		endif
	endif
	if (<type> = p1)
		if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep1
			return \{song_count = -1
				song = none
				song_checksum = none}
		endif
	endif
	if (<type> = p2)
		if NOT StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep2
			return \{song_count = -1
				song = none
				song_checksum = none}
		endif
	endif
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = (<array_size> - 1)
	if (<type> = p1)
		if StructureContains Structure = ($<tier_global>.<tier_checksum>) encorep2
			array_count = (<array_count> - 1)
		endif
	endif
	song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
	if ($current_progression_flag = Career_Band)
		get_band_difficulty
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty = <band_difficulty>
	else
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song>
	endif
	return song_count = <array_count> song = <song> song_checksum = <song_checksum>
endscript

script Progression_IsBossSong 
	if NOT GotParam \{tier}
		return \{false}
	endif
	query_song = <song>
	Progression_GetBossSong <...>
	if (<song> = <query_song>)
		return \{true}
	endif
	return \{false}
endscript

script Progression_IsEncoreSong 
	query_song = <song>
	Progression_GetEncoreSong <...> type = p1
	if (<song> = <query_song>)
		return \{true}
	endif
	Progression_GetEncoreSong <...> type = p2
	if (<song> = <query_song>)
		return \{true}
	endif
	return \{false}
endscript

script Progression_UnlockSong \{encore = 0
		boss = 0
		unlocked = 0}
	setlist_prefix = ($<tier_global>.prefix)
	tier = 1
	begin
	FormatText checksumname = tiername '%ptier%i' p = <setlist_prefix> i = <tier>
	FormatText checksumname = tier_checksum 'tier%s' s = <tier>
	GetArraySize ($<tier_global>.<tier_checksum>.songs)
	array_count = 0
	begin
	if ($<tier_global>.<tier_checksum>.songs [<array_count>] = <song>)
		if ($current_progression_flag = Career_Band)
			get_band_difficulty
			format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier_checksum>.songs [<array_count>]) difficulty = <band_difficulty>
		else
			format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier_checksum>.songs [<array_count>])
		endif
		SetGlobalTags <song_checksum> all_active_players = 1 params = {unlocked = 1}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	tier = (<tier> + 1)
	repeat ($<tier_global>.num_tiers)
endscript

script Progression_GetDifficulty 
	difficulty = ($player1_status.difficulty)
	if ($game_mode = p2_career)
		get_minimum_difficulty difficulty1 = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty)
		difficulty = <minimum_difficulty>
	endif
	return difficulty = <difficulty>
endscript

script Progression_SetProgressionNodeFlags 
	ChangeNodeFlag \{LS_ALWAYS
		1}
	ls_encore = 0
	ls_3_5 = 0
	get_progression_globals ($current_progression_flag) game_mode = ($game_mode)
	tier = ($current_gig_number)
	if ($coop_dlc_active = 0)
		if ($game_mode = p1_career ||
				$game_mode = p2_career ||
				$game_mode = p3_career ||
				$game_mode = p4_career)
			if Progression_IsEncoreSong tier_global = <tier_global> tier = <tier> song = ($current_song)
				ls_encore = 1
			endif
			Progression_GetDifficulty
			Progression_CountCompletedSongsInCurrentTier
			if (<completed_songs> >= (<total_songs> - 1))
				ls_3_5 = 1
			endif
		endif
	endif
	if ($debug_encore)
		<ls_encore> = 1
	endif
	printf qs("\LProgression_SetProgressionNodeFlags encore = %d 3_5 = %i") d = <ls_encore> i = <ls_3_5>
	if (<ls_encore> = 1)
		ChangeNodeFlag \{LS_3_5_PRE
			0}
		ChangeNodeFlag \{LS_3_5_POST
			1}
		ChangeNodeFlag \{LS_ENCORE_PRE
			0}
		ChangeNodeFlag \{LS_ENCORE_POST
			1}
	elseif (<ls_3_5> = 1)
		ChangeNodeFlag \{LS_3_5_PRE
			0}
		ChangeNodeFlag \{LS_3_5_POST
			1}
		ChangeNodeFlag \{LS_ENCORE_PRE
			1}
		ChangeNodeFlag \{LS_ENCORE_POST
			0}
	else
		ChangeNodeFlag \{LS_3_5_PRE
			1}
		ChangeNodeFlag \{LS_3_5_POST
			0}
		ChangeNodeFlag \{LS_ENCORE_PRE
			1}
		ChangeNodeFlag \{LS_ENCORE_POST
			0}
	endif
	GetPakManCurrentName \{map = zones}
	if GotParam \{pakname}
		FormatText checksumname = zone_setup '%s_SetupNodeflags' s = <pakname>
		if ScriptExists <zone_setup>
			spawnscriptnow <zone_setup>
		endif
	endif
endscript
GH4_Demo_Songs = {
	prefix = 'demo'
	num_tiers = 4
	tier1 = {
		songs = [
			beatit
			rebelyell
		]
		level = load_z_goth
		defaultunlocked = 2
	}
	tier2 = {
		songs = [
			crazytrain
		]
		level = load_z_fairgrounds
		defaultunlocked = 1
	}
	tier3 = {
		songs = [
			americanwoman
		]
		level = load_z_fairgrounds
		defaultunlocked = 1
	}
	tier4 = {
		songs = [
			everlong
		]
		level = load_z_military
		defaultunlocked = 1
	}
}
Bonus_progression = {
	tier_global = Bonus_Songs
	progression_global = none
}
Download_Guitar_progression = {
	tier_global = GH4_Download_Songs_Guitar
	progression_global = none
}
Download_Bass_progression = {
	tier_global = GH4_Download_Songs_Bass
	progression_global = none
}
Download_Drum_progression = {
	tier_global = GH4_Download_Songs_Drum
	progression_global = none
}
Download_Vocals_progression = {
	tier_global = GH4_Download_Songs_Vocals
	progression_global = none
}
Download_Band_progression = {
	tier_global = GH4_Download_Songs_Band
	progression_global = none
}
Demo_progression = {
	tier_global = GH4_Demo_Songs
	progression_global = none
}
Career_Guitar_progression = {
	tier_global = GH4_Career_Guitar_Songs
	progression_global = GH4_Career_Guitar_Progression
}
Career_Bass_progression = {
	tier_global = GH4_Career_Bass_Songs
	progression_global = GH4_Career_Bass_Progression
}
Career_Drum_progression = {
	tier_global = GH4_Career_Drum_Songs
	progression_global = GH4_Career_Drum_Progression
}
Career_Vocals_progression = {
	tier_global = GH4_Career_Vocals_Songs
	progression_global = GH4_Career_Vocals_Progression
}
Career_Band_progression = {
	tier_global = GH4_Career_Band_Songs
	progression_global = GH4_Career_Band_Progression
}

script get_progression_globals \{use_current_tab = 0}
	if NOT GotParam \{game_mode}
		game_mode = ($game_mode)
	endif
	if (<use_current_tab> = 1)
		if ($current_tab = tab_bonus)
			Bonus = 1
		elseif ($current_tab = tab_downloads)
			download = 1
		endif
	endif
	if ($is_demo_mode = 1)
		if GotParam \{Bonus}
			AddParams ($Bonus_progression)
		elseif GotParam \{download}
			AddParams ($Download_progression)
		elseif (<game_mode> = p1_career)
			AddParams ($Demo_progression_Career)
		elseif (<game_mode> = p1_quickplay)
			AddParams ($Demo_progression_Quickplay)
		else
			AddParams ($Demo_progression_Multiplayer)
		endif
		return tier_global = <tier_global> progression_global = <progression_global>
	endif
	if GotParam \{download}
		if GotParam \{Career_Guitar}
			AddParams ($Download_Guitar_progression)
		elseif GotParam \{Career_Bass}
			AddParams ($Download_Bass_progression)
		elseif GotParam \{Career_Drum}
			AddParams ($Download_Drum_progression)
		elseif GotParam \{Career_Vocals}
			AddParams ($Download_Vocals_progression)
		elseif GotParam \{Career_Band}
			AddParams ($Download_Band_progression)
		endif
	endif
	if GotParam \{Career_Band}
		AddParams ($Career_Band_progression)
	elseif GotParam \{Career_Guitar}
		AddParams ($Career_Guitar_progression)
	elseif GotParam \{Career_Bass}
		AddParams ($Career_Bass_progression)
	elseif GotParam \{Career_Drum}
		AddParams ($Career_Drum_progression)
	elseif GotParam \{Career_Vocals}
		AddParams ($Career_Vocals_progression)
	elseif GotParam \{Bonus}
		AddParams ($Bonus_progression)
	elseif ($band_mode_mode = career)
		AddParams ($Career_Band_progression)
	elseif ($band_mode_mode = quickplay)
		AddParams ($Career_Band_progression)
	elseif (<game_mode> = p1_career)
		AddParams ($Career_Guitar_progression)
	elseif (<game_mode> = p2_career)
		AddParams ($Career_Band_progression)
	elseif (<game_mode> = p1_quickplay)
		AddParams ($Career_Guitar_progression)
	elseif (<game_mode> = p2_quickplay)
		AddParams ($Career_Band_progression)
	elseif (<game_mode> = p2_coop)
		AddParams ($Career_Band_progression)
	else
		AddParams ($Career_Band_progression)
	endif
	return tier_global = <tier_global> progression_global = <progression_global>
endscript

script progression_set_new_song_in_gig_list 
	printf \{'progression_set_new_song_in_gig_list'}
	get_progression_globals ($current_progression_flag)
	setlist_prefix = ($<tier_global>.prefix)
	FormatText \{checksumname = tiername
		'tier%d'
		d = $current_gig_number}
	song_num = 0
	GetArraySize ($<tier_global>.<tiername>.songs)
	song_size = <array_size>
	GetGlobalTags \{Progression}
	if (<career_using_createagig> = 0)
		format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
		SetGlobalTags <gig_name> params = {started = 1} all_active_players = 1
		if GotParam \{career_play_song_and_end}
			if (<career_play_song_and_end> = 1)
				return \{false}
			endif
		endif
	endif
	if ($quickplay_song_list_current != -1)
		if quickplay_set_new_song_in_gig_list
			return \{true}
		endif
	else
		if ((<current_song_count> + 1) < <song_size>)
			<current_song_count> = (<current_song_count> + 1)
			change current_song = ($<tier_global>.<tiername>.songs [<current_song_count>])
			SetGlobalTags Progression params = {current_song_count = <current_song_count>}
			if StructureContains Structure = ($<tier_global>.<tiername>) boss
				if ($current_song = ($<tier_global>.<tiername>.boss))
					SetGlobalTags <gig_name> params = {boss_unlocked = 1} all_active_players = 1
				endif
			endif
			printf \{'*************************************************************************'}
			printf \{channel = Progression
				'*****************'}
			printf \{channel = Progression
				'$current_song = %c'
				c = $current_song}
			printf \{channel = Progression
				'*****************'}
			printf \{'*************************************************************************'}
			UpdateAtoms \{name = Progression}
			change \{current_transition = forceintro}
			return \{true}
		endif
	endif
	if (<career_using_createagig> = 0)
		GetGlobalTags <gig_name> params = completed
		if (<completed> = 0)
			SetGlobalTags <gig_name> params = {completed = 1} all_active_players = 1
			change \{allow_career_progression_check = 1}
		elseif (<completed> = -1)
			SetGlobalTags <gig_name> params = {completed = 2} all_active_players = 1
		endif
		if ($current_level != load_z_credits)
			FormatText {
				checksumname = venue_checksum
				'%s_%i'
				s = ($LevelZones.($current_level).name)
				i = ($instrument_list.($<tier_global>.part).text_nl)
				AddToStringLookup = true
			}
			SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
			FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.($current_level).name)
			SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
		endif
	endif
	UpdateAtoms \{name = Progression}
	if IsHost
		SendStructure \{callback = SaveGigComplete
			data_to_send = {
				none
			}}
	endif
	return \{false}
endscript

script SaveGigComplete 
	get_progression_globals ($current_progression_flag)
	setlist_prefix = ($<tier_global>.prefix)
	FormatText \{checksumname = tiername
		'tier%d'
		d = $current_gig_number}
	song_num = 0
	GetArraySize ($<tier_global>.<tiername>.songs)
	song_size = <array_size>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	SetGlobalTags <gig_name> params = {started = 1}
	GetGlobalTags <gig_name> params = completed
	if (<completed> = 0)
		SetGlobalTags <gig_name> params = {completed = 1}
		change \{allow_career_progression_check = 1}
	elseif (<completed> = -1)
		SetGlobalTags <gig_name> params = {completed = 2}
	endif
	FormatText {
		checksumname = venue_checksum
		'%s_%i'
		s = ($LevelZones.($current_level).name)
		i = ($instrument_list.($<tier_global>.part).text_nl)
		AddToStringLookup = true
	}
	SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
	FormatText checksumname = venue_checksum 'venue_%s' s = ($LevelZones.($current_level).name)
	SetGlobalTags <venue_checksum> all_active_players = 1 params = {unlocked = 1}
	UpdateAtoms \{name = Progression}
endscript

script quickplay_set_new_song_in_gig_list 
	if ($quickplay_song_list_current = -1)
		return \{false}
	endif
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		return \{false}
	endif
	change quickplay_song_list_current = ($quickplay_song_list_current + 1)
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		return \{false}
	else
		change current_song = ($quickplay_song_list [($quickplay_song_list_current)])
		return \{true}
	endif
endscript

script quickplay_end_of_gig_list 
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		return \{true}
	endif
	<quickplay_song_list_current> = ($quickplay_song_list_current + 1)
	if (<quickplay_song_list_current> >= $num_quickplay_song_list)
		return \{true}
	else
		return \{false}
	endif
endscript

script progression_check_for_gig_end 
	GetGlobalTags \{Progression}
	if (<career_using_createagig> = 1)
		if quickplay_end_of_gig_list
			return \{true}
		endif
	else
		get_progression_globals ($current_progression_flag)
		FormatText \{checksumname = tiername
			'tier%d'
			d = $current_gig_number}
		GetArraySize ($<tier_global>.<tiername>.songs)
		if ((<current_song_count> + 1) >= <array_size>)
			return \{true}
		endif
	endif
	return \{false}
endscript

script debug_unlock_next_gig \{part = Band}
	temp = $allow_career_progression_check
	change \{allow_career_progression_check = 1}
	progression_flag = Career_Band
	unlock_order = GH4_Career_Band_Progression_Unlock_Order
	if (<part> = guitar)
		<progression_flag> = Career_Guitar
		<unlock_order> = GH4_Career_Guitar_Progression_Unlock_Order
	elseif (<part> = Bass)
		<progression_flag> = Career_Bass
		<unlock_order> = GH4_Career_Bass_Progression_Unlock_Order
	elseif (<part> = drum)
		<progression_flag> = Career_Drum
		<unlock_order> = GH4_Career_Drum_Progression_Unlock_Order
	elseif (<part> = Vocals)
		<progression_flag> = Career_Vocals
		<unlock_order> = GH4_Career_Vocals_Progression_Unlock_Order
	endif
	Progression_Career_Gig_Complete <...> (<progression_flag>)
	change allow_career_progression_check = <temp>
endscript

script register_new_progression_atoms 
	index = ($difficulty_list_props.($player1_status.difficulty).index)
	SetProgressionDifficulty difficulty = <index>
	DeRegisterAtoms
	get_progression_globals game_mode = ($game_mode) <...>
	if NOT (<progression_global> = none)
		setup_unlock_atoms <...>
		array = $<progression_global>
		GetArraySize \{$Unlock_Atoms}
		if (<array_size> > 0)
			i = 0
			begin
			AddArrayElement array = <array> element = ($Unlock_Atoms [<i>])
			i = (<i> + 1)
			repeat <array_size>
		endif
		RegisterAtoms name = Progression <array>
		UpdateAtoms \{name = Progression}
	endif
endscript

script Progression_Career_Check_Challenge_Complete 
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_num>
	FormatText checksumname = challenge_crc 'challenge%d_completed' d = <challenge_num>
	GetGlobalTags <gig_name>
	if ((<...>.<challenge_crc>) = 1)
		return \{true}
	endif
	return \{false}
endscript

script Check_Gig_Completed_Quick 
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_num>
	GetGlobalTags <gig_name>
	if (<completed> = 1 || <completed> = 2)
		return \{true}
	endif
	return \{false}
endscript

script Check_Gig_Unlocked 
	get_progression_globals <...>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig>
	GetGlobalTags <gig_name>
	if (<unlocked> = 1)
		return \{true}
	endif
	return \{false}
endscript

script Unlock_Special_Event_Challenge 
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gig_num>
	GetGlobalTags <gig_name>
	if (<challenge_num> = 2)
		SetGlobalTags <gig_name> params = {challenge2_unlocked = 1}
		if (<challenge2_unlocked> != 1)
			SetGlobalTags <gig_name> params = {completed = -1}
		endif
	elseif (<challenge_num> = 3)
		SetGlobalTags <gig_name> params = {challenge3_unlocked = 1}
		if (<challenge3_unlocked> != 1)
			SetGlobalTags <gig_name> params = {completed = -1}
		endif
	endif
endscript

script Progression_Career_Check_Gig_Complete 
	printf \{qs("\LProgression_Career_Check_Gig_Complete")}
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	if GotParam \{gig}
		FormatText checksumname = tier 'tier%d' d = <gig>
		GetArraySize ($<tier_global>.<tier>.songs)
		num_required = <array_size>
		if IsNgc
			if check_gig_progress_for_gig_complete setlist_prefix = ($<tier_global>.prefix) gignum = <gig> num_required = <num_required>
				return \{true}
			endif
		else
			array_entry = 0
			begin
			diff_index = 0
			begin
			format_globaltag_song_checksum part = ($<tier_global>.part) song = ($<tier_global>.<tier>.songs [<array_entry>]) difficulty_index = <diff_index>
			GetGlobalTags <song_checksum> params = stars
			if (<stars> > 2)
				<num_required> = (<num_required> - 1)
				break
			endif
			diff_index = (<diff_index> + 1)
			repeat 5
			<array_entry> = (<array_entry> + 1)
			repeat <array_size>
			if (<num_required> <= 0)
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript
allow_career_progression_check = 0

script Progression_Career_Gig_Complete 
	if ($allow_career_progression_check = 0)
		return
	endif
	change \{allow_career_progression_check = 0}
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	set_got_unlocked = 0
	set_num = 1
	begin
	FormatText checksumname = setnum 'unlockset%d' d = <set_num>
	if NOT StructureContains Structure = $<unlock_order> <setnum>
		break
	endif
	set_has_none = 0
	if StructureContains Structure = ($<unlock_order>.<setnum>) none
		set_has_none = 1
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = ($<unlock_order>.<setnum>.none)
		GetGlobalTags <gig_name> noassert = 1
		if (<unlocked> = 0)
			SetGlobalTags <gig_name> all_active_players = 1 params = {unlocked = 1 first_time_unlocked = 1}
			return
		endif
	endif
	if (<set_has_none> = 0)
		gig_num = 1
		begin
		FormatText checksumname = gignum 'gig%d' d = <gig_num>
		if NOT StructureContains Structure = ($<unlock_order>.<setnum>) <gignum>
			break
		endif
		gig = ($<unlock_order>.<setnum>.<gignum>.name)
		gig_number = ($<unlock_order>.<setnum>.<gignum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		GetGlobalTags <gig_name> noassert = 1
		if (<unlocked> = 0)
			SetGlobalTags <gig_name> all_active_players = 1 params = {unlocked = 1 first_time_unlocked = 1}
			<set_got_unlocked> = 1
			FormatText checksumname = tiername 'tier%d' d = <gig_number>
			GetArraySize ($<tier_global>.<tiername>.songs)
			song_index = 0
			begin
			SetGlobalTags ($<tier_global>.<tiername>.songs [<song_index>]) all_active_players = 1 params = {unlocked = 1}
			song_index = (<song_index> + 1)
			repeat <array_size>
		endif
		<gig_num> = (<gig_num> + 1)
		repeat
		specialevent_num = 1
		begin
		FormatText checksumname = specialeventnum 'special_event%d' d = <specialevent_num>
		if NOT StructureContains Structure = ($<unlock_order>.<setnum>) <specialeventnum>
			break
		endif
		gig = ($<unlock_order>.<setnum>.<specialeventnum>.name)
		gig_num = ($<unlock_order>.<setnum>.<specialeventnum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		GetGlobalTags <gig_name> noassert = 1
		if (<unlocked> = 0)
			SetGlobalTags <gig_name> all_active_players = 1 params = {unlocked = 1 first_time_unlocked = 1}
			<set_got_unlocked> = 1
			FormatText checksumname = tiername 'tier%d' d = <gig_num>
			GetArraySize ($<tier_global>.<tiername>.songs)
			song_index = 0
			begin
			SetGlobalTags ($<tier_global>.<tiername>.songs [<song_index>]) all_active_players = 1 params = {unlocked = 1}
			song_index = (<song_index> + 1)
			repeat <array_size>
		endif
		<specialevent_num> = (<specialevent_num> + 1)
		repeat
		paytoplay_num = 1
		begin
		FormatText checksumname = paytoplaynum 'pay_to_play%d' d = <paytoplay_num>
		if NOT StructureContains Structure = ($<unlock_order>.<setnum>) <paytoplaynum>
			break
		endif
		gig = ($<unlock_order>.<setnum>.<paytoplaynum>.name)
		gig_number = ($<unlock_order>.<setnum>.<paytoplaynum>.num)
		format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig>
		GetGlobalTags <gig_name> noassert = 1
		if (<unlocked> = 0)
			SetGlobalTags <gig_name> all_active_players = 1 params = {unlocked = 1 first_time_unlocked = 1}
			<set_got_unlocked> = 1
		endif
		<paytoplay_num> = (<paytoplay_num> + 1)
		repeat
		if (<set_got_unlocked> = 1)
			return
		endif
	endif
	<set_num> = (<set_num> + 1)
	repeat
endscript

script Progression_Career_Gig_Unlock 
	printf \{'Progression_Career_Gig_Unlock'}
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gig = <gig_name>
	GetGlobalTags <gig_name>
	if (<unlocked> = 0)
		SetGlobalTags <gig_name> all_active_players = 1 params = {unlocked = 1 first_time_unlocked = 1}
	endif
endscript

script Progression_ClearDetailedStatsForGig 
	change \{gig_detailed_stats = [
			[
			]
			[
			]
			[
			]
			[
			]
		]}
	change \{gig_detailed_stats_band = {
		}}
endscript

script Progression_UpdateDetailedStatsForGig 
	if ($game_mode = training)
		get_song_prefix song = ($current_song)
		printf qs(0xce28f240) s = ($current_song)
		load_songqpak song_name = ($current_song) async = 0
	endif
	Progression_ClearDetailedStatsForGig
	<default_song_stats> = {
		song = ($current_song)
	}
	GameMode_GetNumPlayersShown
	if (<num_players_shown> > 0)
		<player_idx> = 0
		begin
		<player> = (<player_idx> + 1)
		GetPlayerInfo <player> is_local_client
		if (<is_local_client> = 1)
			GetPlayerInfo <player> score
			CastToInteger \{score}
			printf \{qs(0x738df043)
				d = player
				s = score}
			GetPlayerInfo <player> cash_rank_up
			GetPlayerInfo <player> new_cash
			GetPlayerInfo <player> career_earnings
			GetPlayerInfo <player> stars
			GetPlayerInfo <player> notes_hit
			GetPlayerInfo <player> total_notes
			GetPlayerInfo <player> sp_phrases_hit
			GetPlayerInfo <player> sp_phrases_total
			GetPlayerInfo <player> best_run
			GetPlayerInfo <player> max_notes
			GetPlayerInfo <player> vocal_streak_phrases
			GetPlayerInfo <player> vocal_phrase_quality
			GetPlayerInfo <player> vocal_phrase_max_qual
			get_average_multiplier player = <player>
			<avg_multiplier> = <average_multiplier>
			get_song_section_arrays_for_player player = <player>
			<curr_song_stats> = {
				<default_song_stats>
				score = <score>
				stars = <stars>
				notes_hit = <notes_hit>
				best_run = <best_run>
				max_notes = <max_notes>
				total_notes = <total_notes>
				sp_phrases_hit = <sp_phrases_hit>
				sp_phrases_total = <sp_phrases_total>
				avg_multiplier = <avg_multiplier>
				cash_rank_up = <cash_rank_up>
				new_cash = <new_cash>
				career_earnings = <career_earnings>
				vocal_streak_phrases = <vocal_streak_phrases>
				vocal_phrase_quality = <vocal_phrase_quality>
				vocal_phrase_max_qual = <vocal_phrase_max_qual>
				detailed_stats = <detailed_stats>
				detailed_stats_max = <detailed_stats_max>
				section_names = <section_names>
			}
			GetArraySize \{$gig_detailed_stats}
			if (<array_size> < 10)
				<stats_all> = ($gig_detailed_stats)
				<old_stats_player> = (<stats_all> [<player_idx>])
				AddArrayElement array = <old_stats_player> element = <curr_song_stats>
				SetArrayElement ArrayName = stats_all index = <player_idx> newvalue = <array>
				change globalname = gig_detailed_stats newvalue = <stats_all>
			else
				ScriptAssert 'Played more than %d songs in the current gig.' d = <array_size>
			endif
		endif
		<player_idx> = (<player_idx> + 1)
		repeat <num_players_shown>
	endif
	printf ($band1_status.score)
	if (($current_num_players) > 1)
		current_band_stats = {
			stars = ($band1_status.stars)
			score = ($band1_status.score)
			high_mult = ($band1_status.high_mult)
			high_2p_streak = ($band1_status.high_2p_streak)
			high_3p_streak = ($band1_status.high_3p_streak)
			high_4p_streak = ($band1_status.high_4p_streak)
		}
		change gig_detailed_stats_band = <current_band_stats>
	endif
	if ($game_mode = training)
		printf \{qs(0x9ad4c2a4)}
		unload_songqpak
	endif
endscript

script get_song_section_arrays_for_player 
	RequireParams \{[
			player
		]
		all}
	<detailed_stats> = []
	<detailed_stats_max> = []
	<section_names> = []
	FormatText checksumname = last_song_stats 'p%p_last_song_detailed_stats' p = <player> AddToStringLookup
	FormatText checksumname = last_song_stats_max 'p%p_last_song_detailed_stats_max' p = <player> AddToStringLookup
	GetPlayerInfo <player> current_song_section_array
	if (<current_song_section_array> = none)
		return detailed_stats = <detailed_stats> detailed_stats_max = <detailed_stats_max> section_names = <section_names>
	endif
	<song_section_array> = <current_song_section_array>
	GetMarkerArraySize array = <song_section_array>
	if (<array_size> > 0)
		<detailed_stats> = ($<last_song_stats>)
		<detailed_stats_max> = ($<last_song_stats_max>)
		i = 0
		begin
		FormatText TextName = marker_text qs("\L%s") s = (($<song_section_array> [<i>]).marker)
		AddArrayElement array = <section_names> element = <marker_text>
		<section_names> = <array>
		i = (<i> + 1)
		repeat <array_size>
	endif
	return detailed_stats = <detailed_stats> detailed_stats_max = <detailed_stats_max> section_names = <section_names>
endscript

script progression_gig_get_highest_difficulty_completed 
	get_progression_globals <...> ($current_progression_flag)
	setlist_prefix = ($<tier_global>.prefix)
	highest_diff_completed = 'none'
	highest_diff_index = 4
	if GotParam \{gig}
		FormatText checksumname = tier 'tier%d' d = <gig>
		GetArraySize ($<tier_global>.<tier>.songs)
		num_required = <array_size>
		array_entry = 0
		begin
		song = ($<tier_global>.<tier>.songs [<array_entry>])
		progression_song_get_highest_difficulty_completed song = <song> ($current_progression_flag)
		if NOT GotParam \{diff_index}
			<diff_index> = 0
			printf \{qs(0x38513f60)}
		endif
		if (<diff_index> != -1)
			num_required = (<num_required> - 1)
			if (<diff_index> < <highest_diff_index>)
				highest_diff_index = <diff_index>
			endif
		endif
		<array_entry> = (<array_entry> + 1)
		repeat <array_size>
		if (<num_required> <= 0)
			get_difficulty_text_nl difficulty = ($difficulty_list [<highest_diff_index>])
			<highest_diff_completed> = <difficulty_text_nl>
		endif
	endif
	return highest_diff_completed = <highest_diff_completed>
endscript

script progression_song_get_highest_difficulty_completed 
	get_progression_globals <...>
	setlist_prefix = ($<tier_global>.prefix)
	highest_diff_completed = 'none'
	highest_diff_index = -1
	if GotParam \{song}
		diff_index = 0
		GetArraySize \{$difficulty_list}
		diff_size = <array_size>
		begin
		format_globaltag_song_checksum part = ($<tier_global>.part) song = <song> difficulty = ($difficulty_list [<diff_index>])
		GetGlobalTags <song_checksum> params = stars
		if (<stars> > 2)
			get_difficulty_text_nl difficulty = ($difficulty_list [<diff_index>])
			<highest_diff_completed> = <difficulty_text_nl>
			<highest_diff_index> = <diff_index>
		endif
		<diff_index> = (<diff_index> + 1)
		repeat <diff_size>
	endif
	return highest_diff_completed = <highest_diff_completed> diff_index = <highest_diff_index>
endscript

script update_gig_progress 
	get_progression_globals ($current_progression_flag)
	FormatText \{checksumname = tiername
		'tier%d'
		d = $current_gig_number}
	song_num = 0
	GetArraySize ($<tier_global>.<tiername>.songs)
	song_size = <array_size>
	GetGlobalTags \{Progression
		params = current_song_count}
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	GetGlobalTags <gig_name> param = gig_progress
	gig_progress_count = (<current_song_count> + 1)
	if (<gig_progress_count> > <gig_progress>)
		SetGlobalTags <gig_name> params = {gig_progress = <gig_progress_count>}
	endif
endscript

script check_gig_progress_for_gig_complete 
	RequireParams \{[
			setlist_prefix
			gignum
			num_required
		]
		all}
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gignum = <gignum>
	GetGlobalTags <gig_name> param = gig_progress
	if (<gig_progress> >= <num_required>)
		return \{true}
	endif
	return \{false}
endscript

script check_gig_progress_for_song_unlocked 
	RequireParams \{[
			progression_flag
			gignum
			song_index
		]
		all}
	get_progression_globals <progression_flag>
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gignum>
	GetGlobalTags <gig_name> param = gig_progress
	if (<gig_progress> >= (<song_index> + 1))
		return \{true}
	endif
	return \{false}
endscript
