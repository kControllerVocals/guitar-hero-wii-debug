cash_milestones = {
	stars_3_bonus = {
		text = qs("3 Star Performance")
		Cash = [
			5
			10
			15
			20
			25
		]
	}
	stars_4_bonus = {
		text = qs("4 Star Performance")
		Cash = [
			10
			20
			30
			40
			50
		]
	}
	stars_5_bonus = {
		text = qs("5 Star Performance")
		Cash = [
			15
			30
			45
			60
			75
		]
	}
	perfect_bonus = {
		text = qs("Perfect Performance")
		Cash = [
			20
			40
			60
			80
			100
		]
	}
	decade = {
		text = qs("Prolific Player")
		Cash = [
			20
			20
			20
			20
			20
		]
	}
	score = {
		text = qs("New High Score")
		Cash = [
			5
			10
			15
			20
			25
		]
	}
	never_in_red = {
		text = qs("Never Red")
		Cash = [
			5
			10
			15
			20
			25
		]
	}
	never_used_star_power = {
		text = qs("Star Power Unused")
		Cash = [
			5
			5
			5
			10
			10
		]
	}
	full_star_power = {
		text = qs("Full Star Power")
		Cash = [
			5
			5
			5
			10
			10
		]
	}
	note_streak = {
		text = qs("Solo Streaker")
		Cash = [
			2
			5
			10
			15
			20
		]
	}
	band_note_streak = {
		text = qs("Band Unity")
		Cash = [
			1
			2
			3
			4
			5
		]
	}
	hot_start = {
		text = qs("Hot Start")
		Cash = [
			5
			5
			10
			15
			20
		]
	}
	strong_finish = {
		text = qs("Strong Finish")
		Cash = [
			5
			5
			10
			15
			20
		]
	}
	percent_hit = {
		text = qs("Percent Notes Hit")
		Cash = [
			2
			4
			6
			8
			10
		]
	}
	jam = {
		text = $wii_played_custom_song
		Cash = [
			5
			10
			15
			20
			25
		]
	}
	whammy_every_note = {
		text = qs("Whammy Maestro")
		Cash = [
			5
			10
			15
			20
			25
		]
	}
	slide_wah_every_note = {
		text = qs("Slide Guru")
		Cash = [
			10
			15
			20
			30
			40
		]
	}
	got_sponsored = {
		text = qs("Got Sponsored")
		Cash = [
			1
			1
			1
			1
			1
		]
	}
}
cash_milestones_collection = [
]
cash_milestones_collection_ui = [
]
cash_milestones_band_ui = [
]
cash_milestones_gig_total = 0
__cash_milestones_player_award = 0

script Progression_CashMilestonesSongWon 
	printf 'Progression_CashMilestonesSongWon - Song: %s' s = ($current_song)
	get_song_saved_in_globaltags song = ($current_song)
	if ((<saved_in_globaltags> = 0) && ($current_song != jamsession))
		printf 'Progression_CashMilestonesSongWon - %s is not in globaltags, bailing.' s = ($current_song)
		return
	endif
	GetArraySize \{$cash_milestones_collection}
	if (<array_size> = 0)
		Progression_CashMilestonesClear
	endif
	if ($Cheat_AlwaysSlide = 1 || $Cheat_AutoKick = 1)
		return
	endif
	change \{got_sponsored_last_gig = 0}
	update_song_star_rating
	GameMode_GetNumPlayers
	<i> = 1
	begin
	change \{__cash_milestones_player_award = 0}
	GetPlayerInfo <i> is_local_client
	if (<is_local_client> = 1)
		evaluate_individual_cash_milestones player = <i>
		Progression_AwardCashMilestones player = <i> milestone_cash = ($__cash_milestones_player_award)
	endif
	change \{__cash_milestones_player_award = 0}
	<i> = (<i> + 1)
	repeat <num_players>
	if (<num_players> > 1)
		cash_set_milestones_band_ui
	else
		change cash_milestones_collection_ui = ($cash_milestones_collection [0])
	endif
	cash_sum_gig_earnings
endscript

script cash_set_milestones_band_ui 
	GameMode_GetNumPlayers
	<player_idx> = 0
	begin
	<player_individual_cash> = 0
	<milestones> = ($cash_milestones_collection [<player_idx>])
	GetArraySize <milestones>
	<num_milestones> = <array_size>
	if (<num_milestones> > 0)
		<milestone_idx> = 0
		begin
		<milestone> = (<milestones> [<milestone_idx>])
		<player_individual_cash> = (<player_individual_cash> + <milestone>.Cash)
		<milestone_idx> = (<milestone_idx> + 1)
		repeat <num_milestones>
	endif
	<player_cash> = {
		individual_cash = <player_individual_cash>
		total_cash = <player_individual_cash>
	}
	SetArrayElement ArrayName = cash_milestones_band_ui GlobalArray index = <player_idx> newvalue = <player_cash>
	<player_idx> = (<player_idx> + 1)
	repeat <num_players>
endscript

script cash_sum_gig_earnings 
	<total_cash> = 0
	GameMode_GetNumPlayers
	<i> = 0
	begin
	GetArraySize \{$cash_milestones_collection}
	if (<array_size> > 0)
		<collection> = ($cash_milestones_collection [<i>])
		GetArraySize <collection>
		if (<array_size> > 0)
			<j> = 0
			begin
			<total_cash> = (<total_cash> + (<collection> [<j>].Cash))
			<j> = (<j> + 1)
			repeat <array_size>
		endif
	endif
	<i> = (<i> + 1)
	repeat <num_players>
	change cash_milestones_gig_total = <total_cash>
endscript

script Progression_CashMilestonesClear 
	change \{cash_milestones_collection = [
			[
			]
			[
			]
			[
			]
			[
			]
		]}
	change \{cash_milestones_collection_per_song = [
			[
			]
			[
			]
			[
			]
			[
			]
		]}
	change \{cash_milestones_collection_ui = [
		]}
	change \{cash_milestones_band_ui = [
			{
			}
			{
			}
			{
			}
			{
			}
		]}
	change \{cash_milestones_gig_total = 0}
endscript

script Progression_AnyPlayerWonCash 
	GameMode_GetNumPlayers
	<i> = 1
	begin
	GetPlayerInfo <i> new_cash
	if (<new_cash> > 0)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <num_players>
	return \{false}
endscript

script Progression_ClearNewCash 
	GameMode_GetNumPlayers
	<i> = 1
	begin
	SetPlayerInfo <i> new_cash = 0
	<i> = (<i> + 1)
	repeat <num_players>
endscript

script Progression_GetNumLocalPlayers 
	GameMode_GetNumPlayers
	num_local_players = 0
	player = 1
	begin
	<player_status> = ($player_status_array [<player>])
	if ($<player_status>.is_local_client = 1)
		num_local_players = (<num_local_players> + 1)
		local_team = ($<player_status>.team)
	endif
	<player> = (<player> + 1)
	repeat <num_players>
	if NOT GotParam \{local_team}
		ScriptAssert \{'There should be at least one local player in the game!'}
	endif
	return num_local_players = <num_local_players>
endscript

script Progression_SetCashMilestone \{multiplier = 1}
	RequireParams \{[
			player
			milestone
		]
		all}
	if NOT StructureContains Structure = $cash_milestones <milestone>
		SoftAssert 'Uknknown cash milestone %m' m = <milestone>
		return
	endif
	if NOT GotParam \{sponsorship_value}
		get_current_difficulty player = <player>
		<difficulty_idx> = ($difficulty_list_props.<current_difficulty>.index)
		<milestone_base_cash> = ($cash_milestones.<milestone>.Cash [<difficulty_idx>])
	else
		<milestone_base_cash> = <sponsorship_value>
	endif
	Progression_GetNumLocalPlayers
	if (<num_local_players> > 1)
		if (<milestone> = got_sponsored)
			multiplier = (<multiplier> / <num_local_players>)
		else
			multiplier = (<multiplier> / (<num_local_players> - 0.1))
		endif
		printf 'Progression_SetCashMilestone - PS3 band multiplier is %f' f = <multiplier>
	endif
	<milestone_reward> = (<milestone_base_cash> * <multiplier>)
	CastToInteger \{milestone_reward}
	if (<milestone_reward> <= 0)
		return
	endif
	change __cash_milestones_player_award = ($__cash_milestones_player_award + <milestone_reward>)
	<player_idx> = (<player> - 1)
	<tmp_milestone_struct> = {milestone = <milestone> Cash = <milestone_reward>}
	GetArraySize ($cash_milestones_collection_per_song)
	if (<array_size> > 0)
		AddArrayElement array = ($cash_milestones_collection_per_song [<player_idx>]) element = <tmp_milestone_struct>
		SetArrayElement ArrayName = cash_milestones_collection_per_song GlobalArray index = <player_idx> newvalue = <array>
		RemoveParameter \{array}
	endif
	cash_get_duplicate_milestone_index player = <player> milestone = <milestone>
	if (<duplicate_milestone_index> = -1)
		<milestone_struct> = {milestone = <milestone> Cash = <milestone_reward> Band = false}
		AddArrayElement array = ($cash_milestones_collection [<player_idx>]) element = <milestone_struct>
	else
		<prev_milestone_struct> = ($cash_milestones_collection [<player_idx>] [<duplicate_milestone_index>])
		<prev_milestone_cash> = (<prev_milestone_struct>.Cash)
		<milestone_struct> = {milestone = <milestone> Cash = (<prev_milestone_cash> + <milestone_reward>) Band = false}
		<player_collection> = ($cash_milestones_collection [<player_idx>])
		SetArrayElement ArrayName = player_collection index = <duplicate_milestone_index> newvalue = <milestone_struct>
		<array> = <player_collection>
	endif
	SetArrayElement ArrayName = cash_milestones_collection GlobalArray index = <player_idx> newvalue = <array>
endscript

script cash_get_duplicate_milestone_index 
	RequireParams \{[
			milestone
			player
		]
		all}
	<player_idx> = (<player> - 1)
	<duplicate_milestone_index> = -1
	GetArraySize ($cash_milestones_collection [<player_idx>])
	if (<array_size> > 0)
		<i> = 0
		begin
		<milestone_struct> = ($cash_milestones_collection [<player_idx>] [<i>])
		if StructureContains Structure = <milestone_struct> milestone
			if ChecksumEquals a = (<milestone_struct>.milestone) b = <milestone>
				<duplicate_milestone_index> = <i>
				break
			endif
		else
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return duplicate_milestone_index = <duplicate_milestone_index>
endscript

script Progression_AwardCashMilestones 
	RequireParams \{[
			player
			milestone_cash
		]
		all}
	GetPlayerInfo <player> is_local_client
	if (<is_local_client> = 0)
		ScriptAssert \{'Calling script ensures this is a local client now'}
	endif
	cash_ranks_get_rank player = <player>
	old_rank = <rank>
	printf 'Cash milestones awarded $%d to player %p.' d = <milestone_cash> p = <player>
	GetPlayerInfo <player> new_cash
	SetPlayerInfo <player> new_cash = (<new_cash> + <milestone_cash>)
	GetPlayerInfo <player> checksum
	get_savegame_from_player_status player_status = <checksum>
	get_current_band_info
	GetGlobalTags savegame = <savegame> <band_info> param = Cash
	SetGlobalTags savegame = <savegame> <band_info> params = {Cash = (<Cash> + <milestone_cash>)}
	GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
	SetGlobalTags savegame = <savegame> <band_info> params = {career_earnings = (<career_earnings> + <milestone_cash>)}
	SetPlayerInfo <player> career_earnings = (<career_earnings> + <milestone_cash>)
	cash_ranks_get_rank player = <player>
	new_rank = <rank>
	if NOT (<new_rank> = <old_rank>)
		SetPlayerInfo <player> cash_rank_up = 1
		return \{true}
	endif
	return \{false}
endscript

script evaluate_individual_cash_milestones 
	RequireParams \{[
			player
		]
		all}
	if ($current_song = jamsession)
		Progression_SetCashMilestone player = <player> milestone = jam
		return
	endif
	GameMode_GetType
	GetPlayerInfo <player> part
	switch <part>
		case guitar
		<part_eval> = evaluate_guitar_cash_milestones
		<part_text> = 'guitar'
		case Bass
		<part_eval> = evaluate_guitar_cash_milestones
		<part_text> = 'bass'
		case drum
		<part_text> = 'drum'
		case Vocals
		<part_text> = 'vocals'
	endswitch
	GetPlayerInfo <player> checksum
	GetPlayerInfo <player> is_local_client
	get_savegame_from_player_status player_status = <checksum>
	get_current_difficulty player = <player>
	get_difficulty_text_nl difficulty = <current_difficulty>
	get_song_prefix song = ($current_song)
	if (<type> = quickplay)
		<stars_tag> = beststars
		<score_tag> = bestscore
		get_formatted_songname song_prefix = <song_prefix> part = <part_text> difficulty_text_nl = <difficulty_text_nl>
	elseif (<type> = career)
		<stars_tag> = stars
		<score_tag> = score
		format_globaltag_song_checksum song_name = <song_prefix> part_text = <part_text> difficulty_text_nl = <difficulty_text_nl>
		<songname> = <song_checksum>
	else
		SoftAssert \{'Cash milestones should be quickplay and career only.'}
		return
	endif
	printf 'evaluate_individual_cash_milestones - %p - %n' s = <part_eval> p = <player> n = <songname>
	cash_gotSponsoredLastGig player = <player>
	Cash_GetStars player = <player>
	<new_stars> = <stars>
	if (($boss_battle) = 0)
		switch <new_stars>
			case 3
			Progression_SetCashMilestone player = <player> milestone = stars_3_bonus
			case 4
			Progression_SetCashMilestone player = <player> milestone = stars_4_bonus
			case 5
			Progression_SetCashMilestone player = <player> milestone = stars_5_bonus
			default
			SoftAssert 'Player %p got %s stars' p = <player> s = <new_stars>
		endswitch
	endif
	if (<part> = Vocals)
		GetPlayerInfo <player> vocal_phrase_quality
		GetPlayerInfo <player> vocal_phrase_max_qual
		<notes_hit> = (<vocal_phrase_quality> * 100)
		<max_notes> = (<vocal_phrase_max_qual> * 100)
	else
		Cash_GetInfo player = <player> param = notes_hit func = sum
		Cash_GetInfo player = <player> param = total_notes func = sum
		GetPlayerInfo player = <player> max_notes
	endif
	if (<max_notes> > 0)
		if (<notes_hit> = <max_notes>)
			Progression_SetCashMilestone player = <player> milestone = perfect_bonus
		endif
	endif
	if ($current_song != jamsession)
		cash_count_num_songs_beaten {
			player = <player>
			savegame = <savegame>
			part_text = <part_text>
			game_mode = <type>
			stars_tag = <stars_tag>
			ignore_song = $current_song
		}
		if (<num_songs_played> > 0)
			Mod a = <num_songs_played> b = 10
			if (<num_songs_played> = 9)
				Progression_SetCashMilestone player = <player> milestone = decade
			endif
		endif
	endif
	if ($current_song != jamsession)
		GetGlobalTags savegame = <savegame> <songname> param = <score_tag>
		<old_score> = (<...>.<score_tag>)
		Cash_GetScore player = <player>
		<new_score> = <score>
		if (<new_score> > <old_score>)
			Progression_SetCashMilestone player = <player> milestone = score
		endif
	endif
	Cash_GetLowestHealth player = <player>
	if (<lowest_health> > (2.0 / 3.0))
		Progression_SetCashMilestone player = <player> milestone = never_in_red
	endif
	if ($current_song != jamsession && ($boss_battle) = 0)
		GetPlayerInfo <player> star_power_use_count
		if (<star_power_use_count> = 0)
			Progression_SetCashMilestone player = <player> milestone = never_used_star_power
		endif
	endif
	Cash_GetInfo player = <player> param = star_power_amount func = status
	if (<star_power_amount> >= 100.0)
		Progression_SetCashMilestone player = <player> milestone = full_star_power
	endif
	Cash_GetBestRun player = <player>
	Progression_SetCashMilestone player = <player> milestone = note_streak multiplier = (<best_run> / 25)
	Cash_GetTotalBandStreak player = <player>
	Progression_SetCashMilestone player = <player> milestone = band_note_streak multiplier = (<total_band_streak> / 25)
	Cash_GetBeginningRun player = <player>
	if (<beginning_run> >= $hot_start_min_streak)
		Progression_SetCashMilestone player = <player> milestone = hot_start
	endif
	Cash_GetCurrentRun player = <player>
	if (<current_run> = <best_run>)
		Progression_SetCashMilestone player = <player> milestone = strong_finish
	endif
	if PlayerInfoEquals <player> part = Vocals
		GetPlayerInfo <player> vocal_phrase_quality
		GetPlayerInfo <player> vocal_phrase_max_qual
		<notes_hit> = (<vocal_phrase_quality> * 100)
		<total_notes> = (<vocal_phrase_max_qual> * 100)
	else
		Cash_GetInfo player = <player> param = notes_hit func = sum
		Cash_GetInfo player = <player> param = total_notes func = sum
	endif
	if (<total_notes> > 0)
		<pct_hit> = (100.0 * <notes_hit> / <total_notes>)
		CastToInteger \{pct_hit}
		if (<pct_hit> > 100)
			SoftAssert 'Player hit %h notes when the song only has %n notes' h = <notes_hit> n = <total_notes>
			<pct_hit> = 100
		endif
		Progression_SetCashMilestone player = <player> milestone = percent_hit multiplier = (((<pct_hit> - 75) / 5) + 1)
	endif
	if ScriptExists <part_eval>
		printf '%s - %n' s = <part_eval> n = <songname>
		<part_eval> player = <player> savegame = <savegame> songname = <songname>
	endif
endscript

script evaluate_guitar_cash_milestones 
	RequireParams \{[
			player
			savegame
			songname
		]
		all}
	if PlayerInfoEquals <player> has_held_notes = 1
		get_current_difficulty player = <player>
		if (<current_difficulty> != easy_rhythm)
			GetPlayerInfo <player> whammy_every_note
			if (<whammy_every_note> = 1)
				Progression_SetCashMilestone player = <player> milestone = whammy_every_note
			endif
		endif
		if (<current_difficulty> != easy_rhythm)
			GetPlayerInfo <player> slide_wah_every_note
			if (<slide_wah_every_note> = 1)
				Progression_SetCashMilestone player = <player> milestone = slide_wah_every_note
			endif
		endif
	endif
endscript

script cash_has_beaten_song 
	RequireParams \{[
			player
			savegame
			song_checksum
			part_text
			game_mode
			stars_tag
		]
		all}
	GetArraySize \{$difficulty_list}
	<diff_idx> = 0
	begin
	<difficulty> = ($difficulty_list [<diff_idx>])
	get_difficulty_text_nl difficulty = <difficulty>
	if StructureContains Structure = $permanent_songlist_props <song_checksum>
		<song_props> = ($permanent_songlist_props.<song_checksum>)
		<in_globaltags> = 1
		<in_globaltags> = (<song_props>.saved_in_globaltags)
		if (<in_globaltags> = 1)
			get_song_prefix song = <song_checksum>
			if (<game_mode> = quickplay)
				get_formatted_songname song_prefix = <song_prefix> part = <part_text> difficulty_text_nl = <difficulty_text_nl>
			else
				<song_checksum_o> = <song_checksum>
				format_globaltag_song_checksum song_name = <song_prefix> part_text = <part_text> difficulty_text_nl = <difficulty_text_nl>
				<songname> = <song_checksum>
				<song_checksum> = <song_checksum_o>
			endif
			if GetGlobalTags savegame = <savegame> <songname> param = <stars_tag>
				if ((<...>.<stars_tag>) >= 3)
					return \{has_beaten_song = 1}
				else
					return \{has_beaten_song = 0}
				endif
			endif
		endif
	endif
	<diff_idx> = (<diff_idx> + 1)
	repeat <array_size>
	return \{has_beaten_song = -1}
endscript

script cash_count_num_songs_beaten \{ignore_song = null}
	RequireParams \{[
			player
			savegame
			part_text
			game_mode
			stars_tag
		]
		all}
	<num_songs_played> = 0
	GetArraySize \{$gh_songlist}
	<i> = 0
	begin
	<song_checksum> = ($gh_songlist [<i>])
	cash_has_beaten_song {
		player = <player>
		savegame = <savegame>
		part_text = <part_text>
		game_mode = <game_mode>
		stars_tag = <stars_tag>
		song_checksum = <song_checksum>
	}
	if (<has_beaten_song> = 1)
		<num_songs_played> = (<num_songs_played> + 1)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return num_songs_played = <num_songs_played>
endscript

script cash_gotSponsoredLastGig 
	RequireParams \{[
			player
		]
		all}
	GameMode_GetType
	if (<type> = career)
		if progression_check_for_gig_end
			song_breakdown_check_for_sponsor player = <player>
		endif
	endif
endscript

script Cash_GetScore 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> score
	CastToInteger \{score}
	return score = <score>
endscript

script Cash_GetStars 
	RequireParams \{[
			player
		]
		all}
	<stars> = 0
	if GameMode_IsBandScoring
		stars = ($band1_status.stars)
	else
		GetPlayerInfo <player> stars
	endif
	return stars = <stars>
endscript

script Cash_GetLowestHealth 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> lowest_health
	return lowest_health = <lowest_health>
endscript

script Cash_GetCurrentRun 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> current_run
	return current_run = <current_run>
endscript

script Cash_GetBeginningRun 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> beginning_run
	return beginning_run = <beginning_run>
endscript

script Cash_GetBestRun 
	RequireParams \{[
			player
		]
		all}
	GetPlayerInfo <player> best_run
	return best_run = <best_run>
endscript

script Cash_GetTotalBandStreak 
	RequireParams \{[
			player
		]
		all}
	<total_band_streak> = 0
	GetBandIndexByPlayer player = <player>
	<band_id> = ($band_ids [<band_index>])
	<p2_streak> = ($<band_id>.high_2p_streak * 2)
	<p3_streak> = ($<band_id>.high_3p_streak * 3)
	<p4_streak> = ($<band_id>.high_4p_streak * 4)
	GameMode_GetNumPlayers
	switch (<num_players>)
		case 2
		<total_band_streak> = (<p2_streak>)
		case 3
		<total_band_streak> = (<p2_streak> + <p3_streak>)
		case 4
		<total_band_streak> = (<p2_streak> + <p3_streak> + <p4_streak>)
		default
		<total_band_streak> = 0
	endswitch
	return total_band_streak = <total_band_streak>
endscript

script Cash_GetInfo \{func = sum
		Band = false}
	RequireParams \{[
			param
			player
		]
		all}
	<retVal> = {}
	if (<Band> = false)
		GetPlayerInfo <player> <param>
		AddParam name = <param> structure_name = retVal value = (<...>.<param>)
	elseif (<func> = status)
		GetBandIndexByPlayer player = <player>
		band_id = ($band_ids [<band_index>])
		AddParam name = <param> structure_name = retVal value = ($<band_id>.<param>)
	else
		<sum> = 0
		<greatest> = 0
		<least> = 1000000000
		<mean> = 0
		GameMode_GetNumPlayers
		<player> = 1
		begin
		GetPlayerInfo <player> <param>
		<curr> = (<...>.<param>)
		<sum> = (<sum> + <curr>)
		if (<curr> > <greatest>)
			<greatest> = <curr>
		endif
		if (<curr> < <least>)
			<least> = <curr>
		endif
		<player> = (<player> + 1)
		repeat <num_players>
		<mean> = (<sum> / <num_players>)
		AddParam name = <param> structure_name = retVal value = (<...>.<func>)
	endif
	return <retVal>
endscript
