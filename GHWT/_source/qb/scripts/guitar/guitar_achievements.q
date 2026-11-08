gStar_Power_Triggered = 0
Achievement_Scripts = [
	{
		name = ONE_TIME_SOLO_ARTIST
		Scr = Achievements_ONE_TIME_SOLO_ARTIST
	}
	{
		name = BAND_ON_A_MISSION
		Scr = Achievements_BAND_ON_A_MISSION
	}
	{
		name = SOLO_ARTIST
		Scr = Achievements_SOLO_ARTIST
	}
	{
		name = LEARNING_THE_ROPES
		Scr = Achievements_LEARNING_THE_ROPES
	}
	{
		name = STIX
		Scr = Achievements_STIX
	}
	{
		name = YODELER
		Scr = Achievements_YODELER
	}
	{
		name = PICK_AND_AXE
		Scr = Achievements_PICK_AND_AXE
	}
	{
		name = PLAYED_BASS
		Scr = Achievements_PLAYED_BASS
	}
	{
		name = FIRST_OF_MANY
		Scr = Achievements_FIRST_OF_MANY
	}
	{
		name = BLING_BLING
		Scr = Achievements_BLING_BLING
	}
	{
		name = EASY_THERE
		Scr = Achievements_EASY_THERE
	}
	{
		name = MEDIUM_MUSICIAN
		Scr = Achievements_MEDIUM_MUSICIAN
	}
	{
		name = Hardcore
		Scr = Achievements_HARDCORE
	}
	{
		name = HALL_OF_FAMER
		Scr = Achievements_HALL_OF_FAMER
	}
	{
		name = JACK_OF_ALL_TRADES
		Scr = Achievements_JACK_OF_ALL_TRADES
	}
	{
		name = ONE_MAN_BAND
		Scr = Achievements_ONE_MAN_BAND
	}
	{
		name = 50_NOTE_POSSE
		Scr = Achievements_50_NOTE_POSSE
	}
	{
		name = 121_JIGOWATTS
		Scr = Achievements_121_JIGOWATTS
	}
	{
		name = TOP_OF_THE_CHARTS
		Scr = Achievements_TOP_OF_THE_CHARTS
	}
	{
		name = SHOULD_WE_STICK_TOGETHER
		Scr = Achievements_SHOULD_WE_STICK_TOGETHER
	}
	{
		name = GUITARISTS_COAT_TAILS_JIGOWATTS
		Scr = Achievements_GUITARISTS_COAT_TAILS
	}
	{
		name = VOCALISTS_COAT_TAILS
		Scr = Achievements_VOCALISTS_COAT_TAILS
	}
	{
		name = SOLID_GOLD_ROCKSTARS
		Scr = Achievements_SOLID_GOLD_ROCKSTARS
	}
	{
		name = PLATINUM_ROCKSTARS
		Scr = Achievements_PLATINUM_ROCKSTARS
	}
	{
		name = YOURE_A_TOOL
		Scr = Achievements_YOURE_A_TOOL
	}
	{
		name = HEAVY_METALL
		Scr = Achievements_HEAVY_METALL
	}
	{
		name = SUPER_GROUP_UNITE
		Scr = Achievements_SUPER_GROUP_UNITE
	}
	{
		name = FEEDING_THE_BEAST
		Scr = Achievements_FEEDING_THE_BEAST
	}
	{
		name = THIS_IS_TOTALLY_LEGAL
		Scr = Achievements_THIS_IS_TOTALLY_LEGAL
	}
	{
		name = MINE_IS_BIGGER_THAN_YOURS
		Scr = Achievements_MINE_IS_BIGGER_THAN_YOURS
	}
	{
		name = A_PAIR_BEATS_A_PAIR
		Scr = Achievements_A_PAIR_BEATS_A_PAIR
	}
	{
		name = SURVIVAL_OF_THE_FITTEST
		Scr = Achievements_SURVIVAL_OF_THE_FITTEST
	}
	{
		name = ROCK_MAIDEN
		Scr = Achievements_ROCK_MAIDEN
	}
	{
		name = WARRIOR_OF_ROCK
		Scr = Achievements_WARRIOR_OF_ROCK
	}
	{
		name = STAMP_OF_APPROVAL
		Scr = Achievements_STAMP_OF_APPROVAL
	}
	{
		name = ONE_OF_A_KIND_AXE
		Scr = Achievements_ONE_OF_A_KIND_AXE
	}
	{
		name = CUSTOM_BEATS
		Scr = Achievements_CUSTOM_BEATS
	}
	{
		name = INKED
		Scr = Achievements_INKED
	}
	{
		name = BAD_TO_THE_BONE
		Scr = Achievements_BAD_TO_THE_BONE
	}
	{
		name = SHINY_METAL_THINGY
		Scr = Achievements_SHINY_METAL_THINGY
	}
	{
		name = PUMPKIN_SMASHER
		Scr = Achievements_PUMPKIN_SMASHER
	}
	{
		name = WYLDE_MAN
		Scr = Achievements_WYLDE_MAN
	}
	{
		name = DONT_BLINK
		Scr = Achievements_DONT_BLINK
	}
	{
		name = THE_EXPERIENCE
		Scr = Achievements_THE_EXPERIENCE
	}
	{
		name = MOTORCITY_MADMAN
		Scr = Achievements_MOTORCITY_MADMAN
	}
	{
		name = LEADING_LADY
		Scr = Achievements_LEADING_LADY
	}
	{
		name = THE_DARK_PRINCE
		Scr = Achievements_THE_DARK_PRINCE
	}
	{
		name = MUSE_TO_MY_EARS
		Scr = Achievements_MUSE_TO_MY_EARS
	}
	{
		name = MIKE_CHECKA
		Scr = Achievements_MIKE_CHECKA
	}
	{
		name = GET_YOUR_BOOGIE_ON
		Scr = Achievements_GET_YOUR_BOOGIE_ON
	}
	{
		name = AXE_MUSEUM
		Scr = Achievements_AXE_MUSEUM
	}
]

script Achievements_Update 
	GetArraySize \{$Achievement_Scripts}
	<i> = 0
	begin
	<Scr> = ($Achievement_Scripts [<i>].Scr)
	<Scr>
	<i> = (<i> + 1)
	repeat <array_size>
endscript
Achievements_SongWonFlag = 0
Achievements_NewGigWonFlag = 0
Achievements_50_note_posse_flag = 0
achievements_121_jigowatts_flag = 0
Achievements_super_group_unite_flag = 0
Achievements_creating_character = 0
Achievements_modified_logo = 0

script Achievements_ResetGlobals 
	change \{Achievements_SongWonFlag = 0}
	change \{Achievements_NewGigWonFlag = 0}
	change \{Achievements_50_note_posse_flag = 0}
	change \{achievements_121_jigowatts_flag = 0}
	change \{Achievements_super_group_unite_flag = 0}
	change \{Achievements_creating_character = 0}
	change \{Achievements_modified_logo = 0}
endscript

script Achievements_IsSongWon 
	if ($Achievements_SongWonFlag = 1)
		return \{true}
	endif
	return \{false}
endscript

script Achievements_IsNewGigWon 
	if ($Achievements_NewGigWonFlag = 1)
		return \{true}
	endif
	return \{false}
endscript

script Achievements_AreAnyGigsWon \{part = 'guitar'}
	FormatText checksumname = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<i> = 1
	begin
	FormatText checksumname = career_part_gig 'career_%p_gig%n' p = <part> n = <i>
	GetGlobalTags <career_part_gig>
	if (<completed> = 1)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <total_gigs>
	return \{false}
endscript

script Achievements_NumGigsWon \{part = 'guitar'}
	FormatText checksumname = career_part_struct 'gh4_career_%p_songs' p = <part>
	<total_gigs> = ($<career_part_struct>.num_tiers)
	<num_crucial_gigs> = 0
	<num_gigs_won> = 0
	<i> = 1
	begin
	FormatText checksumname = career_part_gig 'career_%p_gig%n' p = <part> n = <i>
	GetGlobalTags <career_part_gig>
	FormatText checksumname = tier 'tier%n' n = <i>
	if NOT StructureContains Structure = ($<career_part_struct>.<tier>) paytoplay
		if NOT StructureContains Structure = ($<career_part_struct>.<tier>) debug_gig
			if NOT StructureContains Structure = ($<career_part_struct>.<tier>) createagig
				<num_crucial_gigs> = (<num_crucial_gigs> + 1)
				if (<completed> = 1)
					<num_gigs_won> = (<num_gigs_won> + 1)
				endif
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <total_gigs>
	return num_gigs_won = <num_gigs_won> total_gigs = <num_crucial_gigs>
endscript

script Achievements_CareerComplete \{part = 'guitar'}
	Achievements_NumGigsWon part = <part>
	if (<num_gigs_won> >= <total_gigs>)
		return \{complete = 1}
	endif
	return \{complete = 0}
endscript

script Achievements_PLAYED_BASS 
	printf \{'Achievements_PLAYED_BASS'}
	if NOT Achievements_IsSongWon
		return \{false}
	endif
	if ($game_mode = tutorial ||
			$game_mode = training)
		return
	endif
	GetPlayerInfo \{1
		part}
	if (<part> = Bass)
		SetGlobalTags \{achievement_info
			params = {
				performed_as_bassist = 1
			}}
	endif
endscript

script Achievements_GetPartString 
	switch (<part>)
		case guitar
		return \{part_string = 'guitar'}
		case Bass
		return \{part_string = 'bass'}
		case drum
		return \{part_string = 'drum'}
		case Vocals
		return \{part_string = 'vocals'}
		case none
		return \{part_string = 'none'}
		default
		return \{part_string = 'none'}
	endswitch
endscript

script Achievements_AwardPlayer 
	GetPlayerInfo <player> bot_play
	if (<bot_play> = 1)
		return
	endif
	FormatText checksumname = player_status 'player%n_status' n = <player>
	<controller> = ($<player_status>.controller)
	WriteAchievements achievement = <achievement> controller_id = <controller>
endscript

script Achievements_AwardBand 
	GameMode_GetNumPlayersShown
	<player> = 1
	begin
	Achievements_AwardPlayer achievement = <achievement> player = <player>
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script Achievements_CheckFor50NotePosse 
	if ($Achievements_50_note_posse_flag = 0 && ($game_mode = p4_career || $game_mode = p4_quickplay || $game_mode = p8_pro_faceoff))
		<four_way_streak> = 1
		<player> = 1
		begin
		GetPlayerInfo <player> current_run
		if (<current_run> < 50)
			<four_way_streak> = 0
			break
		endif
		<player> = (<player> + 1)
		repeat 4
		if (<four_way_streak> = 1)
			change \{Achievements_50_note_posse_flag = 1}
		endif
	endif
endscript

script Achievements_CheckForSuperGroupUnite 
	if ($Achievements_super_group_unite_flag = 0 && ($game_mode = p4_career || $game_mode = p4_quickplay || $game_mode = p8_pro_faceoff))
		<four_way_multiplier> = 1
		<player> = 1
		begin
		FormatText checksumname = player_status 'player%n_status' n = <player>
		get_current_multiplier player_status = <player_status>
		if (<multiplier> < 8)
			<four_way_multiplier> = 0
			break
		endif
		<player> = (<player> + 1)
		repeat 4
		if (<four_way_multiplier> = 1)
			change \{Achievements_super_group_unite_flag = 1}
		endif
	endif
endscript

script Achievements_ONE_TIME_SOLO_ARTIST 
	printf \{'Achievements_ONE_TIME_SOLO_ARTIST'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	GameMode_GetNumPlayers
	if (<num_players> = 1)
		Achievements_AwardPlayer \{achievement = ONE_TIME_SOLO_ARTIST
			player = 1}
	endif
endscript

script Achievements_BAND_ON_A_MISSION 
	printf \{'Achievements_BAND_ON_A_MISSION'}
	if NOT Achievements_IsNewGigWon
		return
	endif
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		Achievements_NumGigsWon \{part = 'band'}
		<half_gigs> = (<total_gigs> / 2)
		if (<num_gigs_won> > <half_gigs>)
			Achievements_AwardBand \{achievement = BAND_ON_A_MISSION}
		endif
	else
		GetPlayerInfo \{1
			part}
		Achievements_GetPartString part = <part>
		Achievements_NumGigsWon part = <part_string>
		<half_gigs> = (<total_gigs> / 2)
		if (<num_gigs_won> > <half_gigs>)
			Achievements_AwardPlayer \{achievement = BAND_ON_A_MISSION
				player = 1}
		endif
	endif
endscript

script Achievements_SOLO_ARTIST 
	printf \{'Achievements_SOLO_ARTIST'}
	if NOT Achievements_IsNewGigWon
		return
	endif
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		return
	endif
	GetPlayerInfo \{1
		part}
	Achievements_GetPartString part = <part>
	Achievements_CareerComplete part = <part_string>
	if (<complete> = 1)
		Achievements_AwardPlayer \{achievement = SOLO_ARTIST
			player = 1}
	endif
endscript

script Achievements_LEARNING_THE_ROPES 
	printf \{'Achievements_LEARNING_THE_ROPES'}
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		return
	endif
	GetGlobalTags \{training}
	if (<basic_lesson> = complete ||
			<star_power_lesson> = complete ||
			<advanced_techniques_lesson> = complete ||
			<new_features_lesson> = complete ||
			<drum_basic_lesson> = complete ||
			<drum_int_lesson> = complete ||
			<vocals_lesson> = complete ||
			<band_lesson> = complete ||
			<versus_lesson> = complete)
		Achievements_AwardPlayer \{achievement = LEARNING_THE_ROPES
			player = 1}
	endif
endscript

script Achievements_STIX 
	printf \{'Achievements_STIX'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	GameMode_GetNumPlayers
	<player> = 1
	begin
	GetPlayerInfo <player> part
	if (<part> = drum)
		if (<player> = 1)
			SetGlobalTags \{achievement_info
				params = {
					performed_as_drummer = 1
				}}
		endif
		Achievements_AwardPlayer achievement = STIX player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players>
endscript

script Achievements_YODELER 
	printf \{'Achievements_YODELER'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	GameMode_GetNumPlayers
	<player> = 1
	begin
	GetPlayerInfo <player> part
	if (<part> = Vocals)
		if (<player> = 1)
			SetGlobalTags \{achievement_info
				params = {
					performed_as_vocalist = 1
				}}
		endif
		Achievements_AwardPlayer achievement = YODELER player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players>
endscript

script Achievements_PICK_AND_AXE 
	printf \{'Achievements_PICK_AND_AXE'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	GameMode_GetNumPlayers
	<player> = 1
	begin
	GetPlayerInfo <player> part
	if (<part> = guitar)
		if (<player> = 1)
			SetGlobalTags \{achievement_info
				params = {
					performed_as_guitarist = 1
				}}
		endif
		Achievements_AwardPlayer achievement = PICK_AND_AXE player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players>
endscript

script Achievements_FIRST_OF_MANY 
	printf \{'Achievements_FIRST_OF_MANY'}
	if NOT Achievements_IsNewGigWon
		return
	endif
	Achievements_AwardBand \{achievement = FIRST_OF_MANY}
endscript

script Achievements_BLING_BLING 
	printf \{'Achievements_BLING_BLING'}
	get_current_band_info
	GetGlobalTags <band_info>
	if (<career_earnings> >= 1000000)
		Achievements_AwardBand \{achievement = BLING_BLING}
	endif
endscript

script Achievements_EASY_THERE 
	printf \{'Achievements_EASY_THERE'}
	if NOT Achievements_IsNewGigWon
		return
	endif
	GetPlayerInfo \{1
		difficulty}
	if (<difficulty> != easy)
		return
	endif
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		Achievements_CareerComplete \{part = 'band'}
		if (<complete> = 1)
			Achievements_AwardBand \{achievement = EASY_THERE}
		endif
	else
		GetPlayerInfo \{1
			part}
		Achievements_GetPartString part = <part>
		Achievements_CareerComplete part = <part_string>
		if (<complete> = 1)
			Achievements_AwardPlayer \{achievement = EASY_THERE
				player = 1}
		endif
	endif
endscript

script Achievements_MEDIUM_MUSICIAN 
	printf \{'Achievements_MEDIUM_MUSICIAN'}
	if NOT Achievements_IsNewGigWon
		return
	endif
	GetPlayerInfo \{1
		difficulty}
	if (<difficulty> != medium)
		return
	endif
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		Achievements_CareerComplete \{part = 'band'}
		if (<complete> = 1)
			Achievements_AwardBand \{achievement = MEDIUM_MUSICIAN}
		endif
	else
		GetPlayerInfo \{1
			part}
		Achievements_GetPartString part = <part>
		Achievements_CareerComplete part = <part_string>
		if (<complete> = 1)
			Achievements_AwardPlayer \{achievement = MEDIUM_MUSICIAN
				player = 1}
		endif
	endif
endscript

script Achievements_HARDCORE 
	printf \{'Achievements_HARDCORE'}
	if NOT Achievements_IsNewGigWon
		return
	endif
	GetPlayerInfo \{1
		difficulty}
	if (<difficulty> != hard)
		return
	endif
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		Achievements_CareerComplete \{part = 'band'}
		if (<complete> = 1)
			Achievements_AwardBand \{achievement = Hardcore}
		endif
	else
		GetPlayerInfo \{1
			part}
		Achievements_GetPartString part = <part>
		Achievements_CareerComplete part = <part_string>
		if (<complete> = 1)
			Achievements_AwardPlayer \{achievement = Hardcore
				player = 1}
		endif
	endif
endscript

script Achievements_HALL_OF_FAMER 
	printf \{'Achievements_HALL_OF_FAMER'}
	if NOT Achievements_IsNewGigWon
		return
	endif
	GetPlayerInfo \{1
		difficulty}
	if (<difficulty> != expert)
		return
	endif
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		Achievements_CareerComplete \{part = 'band'}
		if (<complete> = 1)
			Achievements_AwardBand \{achievement = HALL_OF_FAMER}
		endif
	else
		GetPlayerInfo \{1
			part}
		Achievements_GetPartString part = <part>
		Achievements_CareerComplete part = <part_string>
		if (<complete> = 1)
			Achievements_AwardPlayer \{achievement = HALL_OF_FAMER
				player = 1}
		endif
	endif
endscript

script Achievements_JACK_OF_ALL_TRADES 
	printf \{'Achievements_JACK_OF_ALL_TRADES'}
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		return
	endif
	Achievements_CareerComplete \{part = 'guitar'}
	if (<complete> = 0)
		return
	endif
	Achievements_CareerComplete \{part = 'bass'}
	if (<complete> = 0)
		return
	endif
	Achievements_CareerComplete \{part = 'drum'}
	if (<complete> = 0)
		return
	endif
	Achievements_CareerComplete \{part = 'vocals'}
	if (<complete> = 0)
		return
	endif
	Achievements_AwardPlayer \{achievement = JACK_OF_ALL_TRADES
		player = 1}
endscript

script Achievements_ONE_MAN_BAND 
	printf \{'Achievements_ONE_MAN_BAND'}
	GetGlobalTags \{achievement_info}
	if (<performed_as_guitarist> = 1 &&
			<performed_as_bassist> = 1 &&
			<performed_as_drummer> = 1 &&
			<performed_as_vocalist> = 1)
		Achievements_AwardPlayer \{achievement = ONE_MAN_BAND
			player = 1}
	endif
endscript

script Achievements_50_NOTE_POSSE 
	printf \{'Achievements_50_NOTE_POSSE'}
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if ($Achievements_50_note_posse_flag = 1)
		Achievements_AwardBand \{achievement = 50_NOTE_POSSE}
		change \{Achievements_50_note_posse_flag = 0}
	endif
endscript

script Achievements_121_JIGOWATTS 
	printf \{'Achievements_121_JIGOWATTS'}
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($game_mode = tutorial ||
			$game_mode = training ||
			$game_mode = p1_improv ||
			$rich_presence_context = presence_music_studio)
		return
	endif
	if ($achievements_121_jigowatts_flag = 1)
		Achievements_AwardBand \{achievement = 121_JIGOWATTS}
		change \{achievements_121_jigowatts_flag = 0}
	endif
endscript

script Achievements_TOP_OF_THE_CHARTS 
	printf \{'Achievements_TOP_OF_THE_CHARTS'}
	if NOT Achievements_IsNewGigWon
		return
	endif
	if ($game_mode != p4_career)
		return
	endif
	Achievements_CareerComplete \{part = 'band'}
	if (<complete> = 1)
		Achievements_AwardBand \{achievement = TOP_OF_THE_CHARTS}
	endif
endscript

script Achievements_SHOULD_WE_STICK_TOGETHER 
	printf \{'Achievements_SHOULD_WE_STICK_TOGETHER'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	Achievements_AwardBand \{achievement = SHOULD_WE_STICK_TOGETHER}
endscript

script Achievements_GUITARISTS_COAT_TAILS 
	printf \{'Achievements_GUITARISTS_COAT_TAILS'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	<highest_score> = 0
	<highest_score_player> = -1
	<highest_score_part> = none
	<player> = 1
	begin
	GetPlayerInfo <player> score
	if (<score> > <highest_score>)
		<highest_score> = <score>
		<highest_score_player> = <player>
		GetPlayerInfo <player> part
		<highest_score_part> = <part>
	endif
	<player> = (<player> + 1)
	repeat 4
	if (<highest_score_part> = guitar || <highest_score_part> = Bass)
		Achievements_AwardPlayer achievement = GUITARISTS_COAT_TAILS player = <highest_score_player>
	endif
endscript

script Achievements_VOCALISTS_COAT_TAILS 
	printf \{'Achievements_VOCALISTS_COAT_TAILS'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	<highest_score> = 0
	<highest_score_player> = -1
	<highest_score_part> = none
	<player> = 1
	begin
	GetPlayerInfo <player> score
	if (<score> > <highest_score>)
		<highest_score> = <score>
		<highest_score_player> = <player>
		GetPlayerInfo <player> part
		<highest_score_part> = <part>
	endif
	<player> = (<player> + 1)
	repeat 4
	if (<highest_score_part> = Vocals)
		Achievements_AwardPlayer achievement = VOCALISTS_COAT_TAILS player = <highest_score_player>
	endif
endscript

script Achievements_SOLID_GOLD_ROCKSTARS 
	printf \{'Achievements_SOLID_GOLD_ROCKSTARS'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	<player> = 1
	begin
	GetPlayerInfo <player> notes_hit
	GetPlayerInfo <player> total_notes
	if ((<notes_hit> < <total_notes>) || (<total_notes> = 0))
		return
	endif
	<player> = (<player> + 1)
	repeat 4
	Achievements_AwardBand \{achievement = SOLID_GOLD_ROCKSTARS}
endscript

script Achievements_PLATINUM_ROCKSTARS 
	printf \{'Achievements_PLATINUM_ROCKSTARS'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	<player> = 1
	begin
	GetPlayerInfo <player> difficulty
	GetPlayerInfo <player> notes_hit
	GetPlayerInfo <player> total_notes
	if ((<difficulty> != hard && <difficulty> != expert) ||
			<notes_hit> < <total_notes> ||
			<total_notes> = 0)
		return
	endif
	<player> = (<player> + 1)
	repeat 4
	Achievements_AwardBand \{achievement = PLATINUM_ROCKSTARS}
endscript

script Achievements_YOURE_A_TOOL 
	printf \{'Achievements_YOURE_A_TOOL'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($band1_status.score >= 444444 &&
			$current_song = Schism)
		Achievements_AwardBand \{achievement = YOURE_A_TOOL}
	endif
endscript

script Achievements_HEAVY_METALL 
	printf \{'Achievements_HEAVY_METALL'}
	if NOT Achievements_IsSongWon
		return
	endif
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($band1_status.score >= 444444 &&
			$current_song = trappedunderice)
		Achievements_AwardBand \{achievement = HEAVY_METALL}
	endif
endscript

script Achievements_SUPER_GROUP_UNITE 
	printf \{'Achievements_SUPER_GROUP_UNITE'}
	if NOT ($game_mode = p4_quickplay ||
			$game_mode = p4_career ||
			$game_mode = p8_pro_faceoff)
		return
	endif
	if ($Achievements_super_group_unite_flag = 1)
		Achievements_AwardBand \{achievement = SUPER_GROUP_UNITE}
		change \{Achievements_super_group_unite_flag = 0}
	endif
endscript

script Achievements_FEEDING_THE_BEAST 
	printf \{'Achievements_FEEDING_THE_BEAST'}
	if GotParam \{controller}
		WriteAchievements achievement = FEEDING_THE_BEAST controller_id = <controller>
	endif
endscript

script Achievements_THIS_IS_TOTALLY_LEGAL 
	printf \{'Achievements_THIS_IS_TOTALLY_LEGAL'}
	if GotParam \{controller}
		GetGlobalTags \{achievement_info}
		<new_total> = (<total_ghtunes_downloaded> + 1)
		SetGlobalTags achievement_info params = {total_ghtunes_downloaded = <new_total>}
		if (<new_total> > 2)
			WriteAchievements achievement = THIS_IS_TOTALLY_LEGAL controller_id = <controller>
		endif
	endif
endscript

script Achievements_MINE_IS_BIGGER_THAN_YOURS 
	printf \{'Achievements_MINE_IS_BIGGER_THAN_YOURS'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = p8_pro_faceoff && $is_network_game)
		Achievements_AwardBand \{achievement = MINE_IS_BIGGER_THAN_YOURS}
	endif
endscript

script Achievements_A_PAIR_BEATS_A_PAIR 
	printf \{'Achievements_A_PAIR_BEATS_A_PAIR'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = p4_pro_faceoff && $is_network_game)
		Achievements_AwardBand \{achievement = A_PAIR_BEATS_A_PAIR}
	endif
endscript

script Achievements_SURVIVAL_OF_THE_FITTEST 
	printf \{'Achievements_SURVIVAL_OF_THE_FITTEST'}
	if NOT Achievements_IsSongWon
		return
	endif
	if ($game_mode = p2_battle && $is_network_game)
		Achievements_AwardBand \{achievement = SURVIVAL_OF_THE_FITTEST}
	endif
endscript

script Achievements_ROCK_MAIDEN 
	printf \{'Achievements_ROCK_MAIDEN'}
	if GotParam \{controller}
		WriteAchievements achievement = ROCK_MAIDEN controller_id = <controller>
	endif
endscript

script Achievements_WARRIOR_OF_ROCK 
	printf \{'Achievements_WARRIOR_OF_ROCK'}
	if GotParam \{controller}
		WriteAchievements achievement = WARRIOR_OF_ROCK controller_id = <controller>
	endif
endscript

script Achievements_STAMP_OF_APPROVAL 
	printf \{'Achievements_STAMP_OF_APPROVAL'}
	if ($rich_presence_context = presence_music_studio)
		return
	endif
	if GotParam \{controller}
		WriteAchievements achievement = STAMP_OF_APPROVAL controller_id = <controller>
		change \{Achievements_modified_logo = 0}
	endif
endscript

script Achievements_ONE_OF_A_KIND_AXE 
	printf \{'Achievements_ONE_OF_A_KIND_AXE'}
	if GotParam \{controller}
		WriteAchievements achievement = ONE_OF_A_KIND_AXE controller_id = <controller>
	endif
endscript

script Achievements_CUSTOM_BEATS 
	printf \{'Achievements_CUSTOM_BEATS'}
	if GotParam \{controller}
		WriteAchievements achievement = CUSTOM_BEATS controller_id = <controller>
	endif
endscript

script Achievements_INKED 
	printf \{'Achievements_INKED'}
	if GotParam \{controller}
		WriteAchievements achievement = INKED controller_id = <controller>
	endif
endscript

script Achievements_BAD_TO_THE_BONE 
	printf \{'Achievements_BAD_TO_THE_BONE'}
	GameMode_GetNumPlayersShown
	<player> = 1
	begin
	GetPlayerInfo <player> character_id
	if (<character_id> = skeleton)
		Achievements_AwardPlayer achievement = BAD_TO_THE_BONE player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script Achievements_SHINY_METAL_THINGY 
	printf \{'Achievements_SHINY_METAL_THINGY'}
	GameMode_GetNumPlayersShown
	<player> = 1
	begin
	GetPlayerInfo <player> character_id
	if (<character_id> = Rockbot)
		Achievements_AwardPlayer achievement = SHINY_METAL_THINGY player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script Achievements_PUMPKIN_SMASHER 
	printf \{'Achievements_PUMPKIN_SMASHER'}
	GameMode_GetNumPlayersShown
	<player> = 1
	begin
	GetPlayerInfo <player> character_id
	if (<character_id> = Billy)
		Achievements_AwardPlayer achievement = PUMPKIN_SMASHER player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script Achievements_WYLDE_MAN 
	printf \{'Achievements_WYLDE_MAN'}
	GameMode_GetNumPlayersShown
	<player> = 1
	begin
	GetPlayerInfo <player> character_id
	if (<character_id> = ZakkWylde)
		Achievements_AwardPlayer achievement = WYLDE_MAN player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script Achievements_DONT_BLINK 
	printf \{'Achievements_DONT_BLINK'}
	GameMode_GetNumPlayersShown
	<player> = 1
	begin
	GetPlayerInfo <player> character_id
	if (<character_id> = travis)
		Achievements_AwardPlayer achievement = DONT_BLINK player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script Achievements_THE_EXPERIENCE 
	printf \{'Achievements_THE_EXPERIENCE'}
	GameMode_GetNumPlayersShown
	<player> = 1
	begin
	GetPlayerInfo <player> character_id
	if (<character_id> = Jimi)
		Achievements_AwardPlayer achievement = THE_EXPERIENCE player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script Achievements_MOTORCITY_MADMAN 
	printf \{'Achievements_MOTORCITY_MADMAN'}
	GameMode_GetNumPlayersShown
	<player> = 1
	begin
	GetPlayerInfo <player> character_id
	if (<character_id> = TedNugent)
		Achievements_AwardPlayer achievement = MOTORCITY_MADMAN player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script Achievements_LEADING_LADY 
	printf \{'Achievements_LEADING_LADY'}
	GameMode_GetNumPlayersShown
	<player> = 1
	begin
	GetPlayerInfo <player> character_id
	if (<character_id> = Hayley)
		Achievements_AwardPlayer achievement = LEADING_LADY player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script Achievements_THE_DARK_PRINCE 
	printf \{'Achievements_THE_DARK_PRINCE'}
	GameMode_GetNumPlayersShown
	<player> = 1
	begin
	GetPlayerInfo <player> character_id
	if (<character_id> = Ozzy)
		Achievements_AwardPlayer achievement = THE_DARK_PRINCE player = <player>
	endif
	<player> = (<player> + 1)
	repeat <num_players_shown>
endscript

script Achievements_MUSE_TO_MY_EARS 
	printf \{'Achievements_MUSE_TO_MY_EARS'}
	if NOT Achievements_IsSongWon
		return
	endif
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		return
	endif
	GetPlayerInfo \{1
		score}
	GetPlayerInfo \{1
		part}
	if (<score> >= 222222 &&
			<part> = drum &&
			$current_song = assassin)
		Achievements_AwardPlayer \{achievement = MUSE_TO_MY_EARS
			player = 1}
	endif
endscript

script Achievements_MIKE_CHECKA 
	printf \{'Achievements_MIKE_CHECKA'}
	if NOT Achievements_IsSongWon
		return
	endif
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		return
	endif
	GetPlayerInfo \{1
		score}
	GetPlayerInfo \{1
		part}
	if (<score> >= 222222 &&
			<part> = Vocals &&
			$current_song = beatit)
		Achievements_AwardPlayer \{achievement = MIKE_CHECKA
			player = 1}
	endif
endscript

script Achievements_GET_YOUR_BOOGIE_ON 
	printf \{'Achievements_GET_YOUR_BOOGIE_ON'}
	if NOT Achievements_IsSongWon
		return
	endif
	GameMode_GetNumPlayers
	if (<num_players> > 1)
		return
	endif
	GetPlayerInfo \{1
		score}
	GetPlayerInfo \{1
		part}
	if (<score> >= 222222 &&
			(<part> = guitar || <part> = Bass) &&
			$current_song = SatchBoogie)
		Achievements_AwardPlayer \{achievement = GET_YOUR_BOOGIE_ON
			player = 1}
	endif
endscript

script Achievements_AXE_MUSEUM 
	printf \{'Achievements_AXE_MUSEUM'}
	GetArraySize ($progression_guitar_rewards)
	<main_array_size> = <array_size>
	<i> = 0
	begin
	if StructureContains Structure = ($progression_guitar_rewards [<i>]) car_pieces
		GetArraySize ($progression_guitar_rewards [<i>].car_pieces)
		if (<array_size> > 0)
			<j> = 0
			begin
			get_savegame_from_controller controller = ($primary_controller)
			if NOT is_part_unlocked part = ($progression_guitar_rewards [<i>].car_pieces [<j>].part) desc_id = ($progression_guitar_rewards [<i>].car_pieces [<j>].desc_id) savegame = <savegame>
				return
			endif
			<j> = (<j> + 1)
			repeat <array_size>
		endif
	endif
	<i> = (<i> + 1)
	repeat <main_array_size>
	WriteAchievements achievement = AXE_MUSEUM controller_id = ($primary_controller)
endscript
