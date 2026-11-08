track_last_song = none
ui_song_breakdown_players_rdy = [
	0
	0
	0
	0
]
ui_song_breakdown_wrote_tr = 0
ui_song_breakdown_pulsate_helper_pill = 0
ui_song_breakdown_helper_params = {
}

script ui_init_song_breakdown 
	change \{playing_song = 0}
	change \{my_trans_flag = 0}
	GameMode_GetType
	if (<type> = training)
		spawnscriptnow \{kill_gem_scroller}
		spawnscriptnow \{task_menu_default_anim_in
			params = {
				base_name = 'select_song_section'
			}}
		return
	endif
	if NOT (<type> = career || <type> = quickplay)
		ui_gig_cash_clear_gig_earnings
	endif
	change \{ui_song_breakdown_wrote_tr = 0}
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = song_breakdown_drop_player
			end_game_script = song_breakdown_end_game}
		change \{net_breakdown_next_song_msg_sent = 0}
	endif
	if (<type> = quickplay)
		if ($track_last_song != jamsession)
			menu_top_rockers_check_for_new_top_score \{nowrite = 1}
			if (<new_score> != -1)
				change \{ui_song_breakdown_pulsate_helper_pill = 1}
			endif
		endif
	endif
endscript

script ui_create_song_breakdown 
	change \{ui_song_breakdown_helper_params = {
		}}
	if should_use_all_buttons
		change \{ui_song_breakdown_helper_params = {
				all_buttons
			}}
	endif
	change \{song_breakdown_busy_flag = 1}
	destroy_loading_screen
	ui_song_breakdown_clear_ready_up_book_keeping
	set_focus_color
	set_unfocus_color
	if ScreenElementExists \{id = my_breakdown_id}
		DestroyScreenElement \{id = my_breakdown_id}
	endif
	get_current_band_info
	GetGlobalTags <band_info>
	bandname = <name>
	my_song = ($current_song)
	if NOT ($track_last_song = none)
		my_song = ($track_last_song)
	endif
	get_song_title song = <my_song>
	GameMode_GetType
	if (<type> = training)
		ui_create_song_breakdown_practice <...>
	else
		ui_create_song_breakdown_normal <...>
	endif
	DisablePerformanceDOF
	if NOT ScreenFX_FxInstanceExists \{viewport = bg_viewport
			name = venue_DOF}
		ScreenFX_AddFXInstance {
			viewport = bg_viewport
			name = venue_DOF
			($DOF_EndSongblur_tod_manager.screen_fx [0])
		}
	else
		ScreenFX_UpdateFXInstanceParams {
			viewport = bg_viewport
			name = venue_DOF
			($DOF_EndSongblur_tod_manager.screen_fx [0])
		}
	endif
endscript

script ui_create_song_breakdown_normal 
	GameMode_GetType
	if ((<type> = battle) || (<type> = faceoff) || (<type> = pro_faceoff))
		desc = 'song_complete_h2h'
	else
		desc = 'song_complete_4p'
	endif
	GameMode_GetNumPlayersShown
	trim_boss_from_num_players_show
	star_rgba = [254 204 55 255]
	p = 1
	begin
	get_percent_notes_hit player_index = <p>
	if GotParam \{percent_notes_hit}
		if (<percent_notes_hit> < 100)
			star_rgba = [255 255 255 255]
		endif
	endif
	p = (<p> + 1)
	repeat <num_players_shown>
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_breakdown_id
		type = DescInterface
		desc = <desc>
		title_text = <song_title>
		band_header_container_pos = {(0.0, -300.0) relative}
		strips_pos = {(-1100.0, 0.0) relative}
		band_info_alpha = 0
		song_complete_stars_alpha = 0
		song_complete_stars_rgba = <star_rgba>
		song_complete_leathershape_alpha = 0
		exclusive_device = <exclusive_device>
	}
	SoundEvent \{event = Menu_Song_Complete_In}
	num_players = <num_players_shown>
	strips_rel_pos = (0.0, 0.0)
	if (<num_players> = 3)
		strips_rel_pos = (0.0, 40.0)
	elseif (<num_players> = 2)
		strips_rel_pos = (0.0, 80.0)
	elseif (<num_players> = 1)
		strips_rel_pos = (0.0, 120.0)
	endif
	if (<type> = training)
		strips_rel_pos = (0.0, 220.0)
	endif
	SetScreenElementProps {
		id = my_breakdown_id
		strips_pos = {<strips_rel_pos> relative}
	}
	if (<type> = battle)
		<player1_health> = ($player1_status.current_health)
		<player2_health> = ($player2_status.current_health)
		if (<player1_health> > <player2_health>)
			<winner> = 1
		elseif (<player1_health> < <player2_health>)
			<winner> = 2
		else
			<winner> = -1
		endif
	elseif ((<type> = faceoff) || (<type> = pro_faceoff))
		<player1_score> = ($player1_status.score)
		<player2_score> = ($player2_status.score)
		if (<player1_score> > <player2_score>)
			<winner> = 1
		elseif (<player1_score> < <player2_score>)
			<winner> = 2
		else
			<winner> = -1
		endif
	endif
	ui_song_breakdown_hide_player_data
	song_breakdown_assign_strips_data winner = <winner>
	if ((<type> = battle) || (<type> = faceoff) || (<type> = pro_faceoff))
		song_breakdown_assign_player_data_faceoff
	else
		song_breakdown_assign_band_data band_cash = <band_cash> star_rgba = <star_rgba>
	endif
	if GotParam \{gig_complete}
		printf \{channel = mychannel
			qs("\Lsong breakdown gig_complete")}
		ui_song_breakdown_add_components_for_gig_complete
	endif
	if GotParam \{for_encore}
		printf \{channel = mychannel
			qs("\Lsong breakdown ready for encore")}
		ui_song_breakdown_add_components_for_encore
	endif
	if GotParam \{normal_breakdown}
		spawnscriptnow ui_song_breakdown_pause_between_songs params = <...>
	endif
	if (($my_trans_flag) = 1)
		ui_song_breakdown_pause_between_songs <...>
	endif
endscript

script get_percent_notes_hit 
	ui_song_breakdown_get_basic_player_data player_index = <player_index>
	if NOT PlayerInfoEquals <player_index> part = Vocals
		if (<max_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
	else
		if (<vocal_phrase_max_qual> > 0)
			<percent_notes_hit> = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
	endif
	return percent_notes_hit = <percent_notes_hit>
endscript

script ui_destroy_song_breakdown 
	clean_up_user_control_helpers
	KillSpawnedScript \{name = pulsate_helper_pill}
	GameMode_GetType
	if (<type> = training)
		DestroyScreenElement \{id = my_breakdown_practice_id}
	else
		DestroyScreenElement \{id = my_breakdown_id}
		ui_destroy_encore_confirmation
	endif
endscript

script ui_deinit_song_breakdown 
	printf \{channel = mychannel
		qs("\L****** DEINIT SONG BREAKDOWN CLEAR DETAILED STATS FOR GIG *****")}
	if ($track_last_song != jamsession)
		song_breakdown_auto_write_top_rockers
	endif
	ui_song_breakdown_clean_up_highest_multipliers
	clear_cash_milestones_per_song
	ui_gig_cash_increase_earnings_for_all
	Progression_ClearNewCash
endscript

script song_breakdown_assign_strips_data \{winner = -1}
	if NOT my_breakdown_id :Desc_ResolveAlias \{name = alias_player_stats_element}
		ScriptAssert \{qs("\LProblem resolving alias in song breakdown")}
	endif
	GameMode_GetNumPlayersShown
	trim_boss_from_num_players_show
	GetScreenElementChildren id = <resolved_id>
	band_cash = 0
	player = 1
	begin
	ui_song_breakdown_get_basic_player_data player_index = <player>
	band_cash = (<band_cash> + <new_cash>)
	arrow_alpha = <cash_rank_up>
	cut_alpha_val = 1
	GameMode_GetType
	if NOT (<type> = career || <type> = quickplay)
		cash_text = qs("")
		cut_alpha_val = 0
	endif
	if (<player> = <winner>)
		<winner_alpha> = 1
		<loser_alpha> = 0
	else
		<winner_alpha> = 0
		<loser_alpha> = 1
	endif
	SetScreenElementProps {
		id = (<children> [(<player> - 1)])
		player_name_text = <player_text>
		notes_hit_text = <percent_text>
		note_streak_text = <streak_text>
		cut_text = <cash_text>
		mixer_icon_guitar_texture = <icon_texture>
		cash_milestones_icon_pho_texture = <cash_icon_id>
		number_text_text = <rank_text>
		icon_difficulty_texture = <diff_texture>
		level_up_alpha = <arrow_alpha>
		check_mark_alpha = 0
		hand_devil_horn_alpha = <winner_alpha>
		hand_thumb_down_alpha = <loser_alpha>
	}
	SetScreenElementProps {
		id = my_breakdown_id
		cut_alpha = <cut_alpha_val>
	}
	player = (<player> + 1)
	repeat <num_players_shown>
	return band_cash = <band_cash>
endscript

script song_breakdown_assign_player_data_faceoff 
	GameMode_GetType
	<player_index> = 1
	begin
	FormatText checksumname = player_patch 'alias_song_complete_h2h_player_patch_%p' p = <player_index>
	my_breakdown_id :Desc_ResolveAlias name = <player_patch>
	if NOT GotParam \{resolved_id}
		ScriptSoftAssert \{qs("Could not find my_breakdown_id")}
		return
	endif
	ui_song_breakdown_get_basic_player_data player_index = <player_index>
	GetPlayerInfo <player_index> highest_multiplier
	FormatText TextName = score_text qs("SCORE: %n") n = <score> DecimalPlaces = 0 usecommas
	FormatText TextName = multiplier_text qs("HIGHEST MULTIPLIER: %nx") n = <highest_multiplier>
	FormatText TextName = high_note_streak qs("NOTE STREAK: %n") n = <best_run>
	GetPlayerInfo <player_index> current_health
	if (<current_health> = 1.0)
		<winner_alpha> = 1
	else
		<winner_alpha> = 0
	endif
	SetScreenElementProps {
		id = <resolved_id>
		notestreak_entry_text = <high_note_streak>
		score_entry_text = <score_text>
		multiplier_entry_text = <multiplier_text>
		player_name_text = <player_text>
		hand_devil_horn_alpha = <winner_alpha>
		hand_thumb_down_alpha = (1.0 - <winner_alpha>)
	}
	<player_index> = (<player_index> + 1)
	if (<type> = battle)
		SetScreenElementProps {
			id = <resolved_id>
			alpha = 0
		}
	endif
	repeat 2
endscript

script song_breakdown_assign_band_data 
	if (($current_num_players) = 1 || (($current_num_players) = 2 && ($boss_battle) = 1))
		GameMode_GetType
		if (<type> = career || <type> = quickplay)
			getScoreFromDetailedStats \{player = 1}
			getStarsFromDetailedStats \{player = 1}
		else
			GetPlayerInfo \{1
				score}
			GetPlayerInfo \{1
				stars}
		endif
		GetPlayerInfo \{1
			highest_multiplier}
		FormatText TextName = band_score_text qs("SCORE: %n") n = <score> DecimalPlaces = 0 usecommas
		FormatText TextName = multiplier_text qs("HIGHEST MULTIPLIER: %nx") n = <highest_multiplier>
		SetScreenElementProps {
			id = my_breakdown_id
			cash_entry_alpha = 0
			notestreak_entry_alpha = 0
			score_entry_text = <band_score_text>
			multiplier_entry_text = <multiplier_text>
		}
	else
		GameMode_GetNumPlayersShown
		trim_boss_from_num_players_show
		b_note_streak = ($gig_detailed_stats_band.high_2p_streak)
		if (($gig_detailed_stats_band.high_3p_streak) > <b_note_streak>)
			b_note_streak = ($gig_detailed_stats_band.high_3p_streak)
		endif
		if (($gig_detailed_stats_band.high_4p_streak) > <b_note_streak>)
			b_note_streak = ($gig_detailed_stats_band.high_4p_streak)
		endif
		score = ($gig_detailed_stats_band.score)
		b_high_mult = ($gig_detailed_stats_band.high_mult)
		CastToInteger \{b_high_mult}
		CastToInteger \{score}
		FormatText TextName = band_score_text qs("SCORE: %n") n = <score> DecimalPlaces = 0 usecommas
		FormatText TextName = band_cash_entry_text $wii_song_breakdown_cash n = <band_cash> DecimalPlaces = 0 usecommas
		FormatText TextName = band_high_mult_text qs("HIGHEST MULTIPLIER: %nx") n = <b_high_mult>
		FormatText TextName = band_high_note_streak qs("NOTE STREAK: %n") n = <b_note_streak>
		SetScreenElementProps {
			id = my_breakdown_id
			score_entry_text = <band_score_text>
			cash_entry_text = <band_cash_entry_text>
			multiplier_entry_text = <band_high_mult_text>
			notestreak_entry_text = <band_high_note_streak>
		}
		stars = ($gig_detailed_stats_band.stars)
	endif
	if (<stars> > 3)
		if my_breakdown_id :Desc_ResolveAlias \{name = alias_song_complete_stars}
		else
			ScriptAssert \{qs("\LProblem resolving alias in song breakdown assign band data")}
		endif
		CreateScreenElement {
			parent = <resolved_id>
			type = SpriteElement
			texture = song_complete_star
			dims = (40.0, 40.0)
			rgba = <star_rgba>
		}
		if (<stars> > 4)
			CreateScreenElement {
				parent = <resolved_id>
				type = SpriteElement
				texture = song_complete_star
				dims = (40.0, 40.0)
				rgba = <star_rgba>
			}
		endif
	endif
endscript

script ui_song_breakdown_hide_player_data 
	num_players = ($current_num_players)
	b_battle = ($boss_battle)
	if (<b_battle> = 1)
		num_players = 1
	endif
	if (<num_players> < 4)
		SetScreenElementProps \{id = my_breakdown_id
			leather_strips_mask_p4_alpha = 0
			song_complete_player_stats_p4_alpha = 0}
	endif
	if (<num_players> < 3)
		SetScreenElementProps \{id = my_breakdown_id
			leather_strips_mask_p3_alpha = 0
			song_complete_player_stats_p3_alpha = 0}
	endif
	if (<num_players> < 2)
		SetScreenElementProps \{id = my_breakdown_id
			leather_strips_mask_p2_alpha = 0
			song_complete_player_stats_p2_alpha = 0}
	endif
endscript

script ui_song_breakdown_get_basic_player_data \{player_index = 1}
	GameMode_GetType
	if ($is_network_game = 1)
		GetPlayerInfo <player_index> best_run
		GetPlayerInfo <player_index> score
		GetPlayerInfo <player_index> max_notes
		GetPlayerInfo <player_index> notes_hit
		GetPlayerInfo <player_index> stars
		GetPlayerInfo <player_index> cash_rank_up
		GetPlayerInfo <player_index> vocal_streak_phrases
		GetPlayerInfo <player_index> vocal_phrase_quality
		GetPlayerInfo <player_index> vocal_phrase_max_qual
		GetPlayerInfo <player_index> total_notes
		GetPlayerInfo <player_index> career_earnings
	elseif (<type> = career || <type> = quickplay)
		getScoreFromDetailedStats player = <player_index>
		getBestRunFromDetailedStats player = <player_index>
		getMaxNotesFromDetailedStats player = <player_index>
		getNotesHitFromDetailedStats player = <player_index>
		getStarsFromDetailedStats player = <player_index>
		getVocalStreakPhrasesFromDetailedStats player = <player_index>
		getVocalPhraseQualityFromDetailedStats player = <player_index>
		getVocalPhraseMaxQualFromDetailedStats player = <player_index>
		getCashRankUpFromDetailedStats player = <player_index>
		getTotalNotesFromDetailedStats player = <player_index>
		getCareerEarningsFromDetailedStats player = <player_index>
	else
		GetPlayerInfo <player_index> best_run
		GetPlayerInfo <player_index> score
		GetPlayerInfo <player_index> max_notes
		GetPlayerInfo <player_index> notes_hit
		GetPlayerInfo <player_index> stars
		GetPlayerInfo <player_index> cash_rank_up
		GetPlayerInfo <player_index> vocal_streak_phrases
		GetPlayerInfo <player_index> vocal_phrase_quality
		GetPlayerInfo <player_index> vocal_phrase_max_qual
		GetPlayerInfo <player_index> total_notes
		GetPlayerInfo <player_index> career_earnings
	endif
	GetPlayerInfo <player_index> part
	GetPlayerInfo <player_index> difficulty
	GetPlayerInfo <player_index> new_cash
	if (<cash_rank_up> = 1)
		SetPlayerInfo <player_index> cash_rank_up = 0
	endif
	if (<max_notes> = 0)
		max_notes = 1
	endif
	if (<stars> < 3)
		stars = 3
	endif
	switch <player_index>
		case 1
		get_difficulty_text difficulty = ($player1_status.difficulty)
		case 2
		get_difficulty_text difficulty = ($player2_status.difficulty)
		case 3
		get_difficulty_text difficulty = ($player3_status.difficulty)
		case 4
		get_difficulty_text difficulty = ($player4_status.difficulty)
	endswitch
	cash_get_info_from_earnings earnings = <career_earnings>
	CastToInteger \{score}
	<name> = qs("")
	if ($is_network_game = 1)
		GetPlayerInfo <player_index> gamertag
		name = $<gamertag>
	else
		if isXenon
			GetPlayerInfo <player_index> controller
			if NOT ((<controller> < 0) || (<controller> > 3))
				if GetLocalGamerTag controller = <controller>
					<name> = <gamertag>
				endif
			endif
		endif
	endif
	if (<name> = qs(""))
		FormatText TextName = player_text qs("Player %p") p = <player_index>
	else
		<player_text> = <name>
	endif
	FormatText TextName = score_text qs("\L%s") s = <score> usecommas
	if NOT PlayerInfoEquals <player_index> part = Vocals
		if (<type> = training)
			if (<total_notes> > 0)
				<percent_notes_hit> = (((<notes_hit> * 1.0) / <total_notes>) * 100.0)
			else
				<percent_notes_hit> = 0
			endif
		else
			if (<max_notes> > 0)
				<percent_notes_hit> = (((<notes_hit> * 1.0) / <max_notes>) * 100.0)
			else
				<percent_notes_hit> = 0
			endif
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
		FormatText TextName = percent_text qs("\L%p\%") p = <percent_notes_hit>
		FormatText TextName = streak_text qs("\L%n") n = <best_run> DecimalPlaces = 0
	else
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			MathFloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			FormatText TextName = percent_text qs("\L%p\%") p = <percent_notes_hit> DecimalPlaces = 0
		else
			<percent_text> = qs("NA")
		endif
		FormatText TextName = streak_text qs("\L%n") n = <vocal_streak_phrases> DecimalPlaces = 0
	endif
	FormatText TextName = cash_text qs("\L$%n") n = <new_cash> usecommas
	FormatText TextName = rank_text qs("\L%n") n = <rank>
	switch (<part>)
		case guitar
		icon_texture = mixer_icon_guitar
		case Bass
		icon_texture = mixer_icon_bass
		case drum
		icon_texture = mixer_icon_drums
		case Vocals
		icon_texture = mixer_icon_vox
	endswitch
	switch (<difficulty>)
		case easy_rhythm
		diff_texture = icon_difficulty_beginner
		case easy
		diff_texture = icon_difficulty_easy
		case medium
		diff_texture = icon_difficulty_medium
		case hard
		diff_texture = icon_difficulty_hard
		case expert
		diff_texture = icon_difficulty_expert
	endswitch
	return <...>
endscript

script ui_song_breakdown_show_continue_button 
	ui_song_breakdown_add_components_for_continue
endscript

script ui_song_breakdown_someone_signed_in 
	if IsLoggedIn
		return \{true}
	else
		return \{false}
	endif
endscript

script show_signin_warning 
	create_new_generic_popup \{popup_type = error_menu
		text = $wii_not_signed_in
		error_func = destroy_show_signin_warning}
endscript

script destroy_show_signin_warning 
	destroy_generic_popup
endscript

script ui_song_breakdown_add_components_for_continue 
	GameMode_GetType
	if ($is_network_game = 1)
		array = [
			{pad_choose net_ui_song_breakdown_continue_to_next_screen_gig_complete}
		]
	else
		array = [
			{pad_back generic_event_choose params = {state = uistate_song_summary_details}}
			{pad_choose ui_song_breakdown_continue_to_next_screen_gig_complete}
		]
		if NOT ((<type> = battle) || (<type> = faceoff) || (<type> = pro_faceoff))
			if NOT is_boss_battle_song song = ($track_last_song)
				if ui_song_breakdown_someone_signed_in
				else
				endif
			endif
		endif
		if (<type> = quickplay)
			AddArrayElement array = <array> element = {pad_option song_breakdown_run_top_rockers}
		endif
		if ($current_song = jamsession)
			array = [
				{pad_choose ui_song_breakdown_continue_to_next_screen_gig_complete}
			]
		endif
	endif
	SetScreenElementProps {
		id = my_breakdown_id
		event_handlers = <array>
	}
	add_user_control_helper ($ui_song_breakdown_helper_params) text = qs("CONTINUE") button = green z = 100000
	if ($is_network_game = 0)
		if ($track_last_song != jamsession)
			add_user_control_helper ($ui_song_breakdown_helper_params) text = qs("MORE STATS") button = red z = 100000
			if NOT ((<type> = battle) || (<type> = faceoff) || (<type> = pro_faceoff))
				if NOT is_boss_battle_song song = ($track_last_song)
				endif
			endif
			if (<type> = quickplay)
				add_user_control_helper ($ui_song_breakdown_helper_params) text = qs("TOP ROCKERS") button = Blue z = 100000
				if (($ui_song_breakdown_pulsate_helper_pill) = 1)
					SpawnScriptLater pulsate_helper_pill params = {id = <helper_pill_ID> time = 0.5}
				endif
			endif
		endif
	endif
	AssignAlias \{id = my_breakdown_id
		alias = current_menu}
endscript

script ui_song_breakdown_add_components_for_gig_complete 
	ui_song_breakdown_add_components_for_continue
endscript

script ui_song_breakdown_add_components_for_encore 
	GameMode_GetType
	array = []
	if ($is_network_game = 1)
		array = [
			{pad_choose ui_song_breakdown_continue_to_next_screen_encore}
		]
	else
		array = [
			{pad_back song_breakdown_go_to_stats_from_transition}
			{pad_choose ui_song_breakdown_continue_to_next_screen_encore}
		]
		if NOT is_boss_battle_song song = ($track_last_song)
			if ui_song_breakdown_someone_signed_in
			else
			endif
		endif
	endif
	SetScreenElementProps {
		id = my_breakdown_id
		event_handlers = <array>
	}
	if ($is_network_game = 1)
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs("CONTINUE") button = green z = 100000
	else
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs("CONTINUE") button = green z = 100000
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs("MORE STATS") button = red z = 100000
		if NOT is_boss_battle_song song = ($track_last_song)
		endif
	endif
	AssignAlias \{id = my_breakdown_id
		alias = current_menu}
endscript

script song_breakdown_run_top_rockers_from_transition 
	if NOT (($song_breakdown_busy_flag) = 0)
		return
	endif
	change \{my_trans_flag = 1}
	change \{song_breakdown_busy_flag = 1}
	ui_event_wait_for_safe
	song_breakdown_run_top_rockers
endscript

script song_breakdown_run_top_rockers 
	printf \{channel = mychannel
		qs("\Lcalling top rockers from song summary")}
	if (($ui_song_breakdown_wrote_tr) = 0)
		change \{ui_song_breakdown_wrote_tr = 1}
		change \{ui_song_breakdown_pulsate_helper_pill = 0}
		generic_event_choose \{state = uistate_top_rockers}
	else
		generic_event_choose \{state = uistate_top_rockers
			data = {
				for_options = 1
			}}
	endif
endscript

script song_breakdown_auto_write_top_rockers 
	GameMode_GetType
	if (<type> = quickplay)
		if (($ui_song_breakdown_wrote_tr) = 0)
			change \{ui_song_breakdown_wrote_tr = 1}
			change \{ui_song_breakdown_pulsate_helper_pill = 0}
			menu_top_rockers_check_for_new_top_score \{nowrite = 0}
			printf \{channel = mychannel
				qs("\Lwriting top scores")}
		endif
	endif
endscript

script ui_song_breakdown_anim_in_script 
	SetScriptCannotPause
	GameMode_GetType
	if (<type> = training)
		return
	endif
	stars_alpha = 1.0
	if is_boss_battle_song song = ($track_last_song)
		stars_alpha = 0.0
	endif
	startrendering \{reason = menu_transition}
	if ScreenElementExists \{id = my_breakdown_id}
		SetScreenElementProps {
			id = my_breakdown_id
			band_info_alpha = 1 time = 0.1 Anim = gentle
			song_complete_stars_alpha = <stars_alpha> time = 0.1 Anim = gentle
			band_header_container_pos = {(0.0, 300.0) relative} time = 0.1 Anim = gentle
			strips_pos = {(1100.0, 0.0) relative} time = 0.1 Anim = gentle
			song_complete_leather_shape_alpha = 1 time = 0.1
		}
		Wait \{0.3
			second}
	endif
	change \{song_breakdown_busy_flag = 0}
endscript

script ui_song_breakdown_anim_out_script 
	SetScriptCannotPause
	GameMode_GetType
	if (<type> = training)
		return
	endif
	clean_up_user_control_helpers
	if ScreenElementExists \{id = my_breakdown_id}
		SetScreenElementProps \{id = my_breakdown_id
			band_info_alpha = 0
			time = 0.05
			Anim = gentle
			song_complete_stars_alpha = 0
			time = 0.05
			Anim = gentle
			band_header_container_pos = {
				(0.0, -330.0)
				relative
			}
			time = 0.1
			Anim = gentle
			strips_pos = {
				(1100.0, 0.0)
				relative
			}
			time = 0.1
			Anim = gentle
			song_complete_leather_shape_alpha = 0
			time = 0.05}
		Wait \{0.3
			second}
	endif
endscript

script song_breakdown_anim_band_banner_up 
	SetScreenElementProps \{id = my_breakdown_id
		band_header_container_pos = {
			(0.0, -30.0)
			relative
		}
		time = 0.08
		Anim = gentle}
endscript
got_sponsored_last_gig = 0
got_sponsored_tier_number = 0
got_sponsored_tier_catagory = 'guitar'

script ui_song_breakdown_continue_to_next_screen_gig_complete 
	printf \{channel = mychannel
		'continue on from song breakdown after gig complete'}
	ui_song_breakdown_ready_up device_num = <device_num>
	if (<everyone_is_ready> = 0)
		return
		GetPakManCurrent \{map = zones}
		printf \{channel = mychannel
			'continue on from song breakdown after gig complete'}
		if (<pak> != z_studio && <pak> != z_studio2 && <pak> != z_tool && <pak> != z_credits && <pak> != z_training)
			spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
				params = {
					BG_SFX_Area = FrontEnd_Menu_Music
				}}
		endif
	endif
	printf \{qs("\LUnpausing the songtime")}
	change \{songtime_paused = 0}
	GameMode_GetType
	if (<type> = career || <type> = quickplay)
		SoundEvent \{event = Menu_Song_Complete_Out}
		GetPakManCurrent \{map = zones}
		printf \{channel = mychannel
			'continue on from song breakdown after gig complete'}
		if (<pak> != z_studio && <pak> != z_studio2 && <pak> != z_tool && <pak> != z_credits && <pak> != z_training)
			spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
				params = {
					BG_SFX_Area = FrontEnd_Menu_Music
				}}
		endif
		if (($current_num_players) = 1)
			generic_event_replace \{state = uistate_cash_rewards_3
				data = {
					from_song_complete = 1
				}}
		else
			generic_event_replace \{state = UIstate_gig_cash_summary
				data = {
					from_song_complete = 1
				}}
		endif
	else
		ui_win_song_continue_next_menu
	endif
endscript

script net_ui_song_breakdown_continue_to_next_screen_gig_complete 
	SoundEvent \{event = Menu_Song_Complete_Out}
	if IsHost
		if ($net_breakdown_continue_msg_sent = 0)
			change \{net_breakdown_continue_msg_sent = 1}
			SendStructure \{callback = ui_win_song_continue_next_menu
				data_to_send = {
					none
				}}
		else
			return
		endif
	else
		SendStructure \{callback = net_ui_song_breakdown_continue_to_next_screen_gig_complete
			data_to_send = {
				none
			}}
		return
	endif
	ui_win_song_continue_next_menu
endscript

script song_breakdown_check_for_sponsor 
	RequireParams \{[
			player
		]
		all}
	player_num = <player>
	did_player_get_sponsored_last_gig player = <player_num>
	if (<got_sponsored> = 1)
		grab_sponsor_given_tier_and_type tier = <tier_number> type = <tier_catagory>
		sponsorship_value = (<sponsor>.sponsorship_value)
		Progression_SetCashMilestone player = <player> milestone = got_sponsored sponsorship_value = <sponsorship_value>
		GetPlayerInfo <player_num> controller
		change \{got_sponsored_last_gig = 1}
		change got_sponsored_tier_number = <tier_number>
		change got_sponsored_tier_catagory = <tier_catagory>
	endif
endscript

script ui_song_breakdown_continue_to_next_screen_encore 
	if ($is_network_game = 0)
		ui_song_breakdown_ready_up device_num = <device_num>
		if (<everyone_is_ready> = 0)
			return
		endif
	else
		if IsHost
			if ($net_encore_msg_start_sent = 0)
				change \{net_encore_msg_start_sent = 1}
				SendStructure \{callback = encore_play
					data_to_send = {
						none
					}}
			else
				return
			endif
		else
			SendStructure \{callback = ui_song_breakdown_continue_to_next_screen_encore
				data_to_send = {
					none
				}}
			SoundEvent \{event = Menu_Song_Complete_Out}
			return
		endif
	endif
	printf \{channel = mychannel
		'continue on to encore after song complete'}
	SoundEvent \{event = Menu_Song_Complete_Out}
	encore_play
endscript

script ui_create_song_breakdown_practice 
	Progression_UpdateDetailedStatsForGig
	get_song_title song = ($current_song)
	ui_song_breakdown_get_basic_player_data
	if NOT PlayerInfoEquals <player_index> part = Vocals
		if (<total_notes> > 0)
			<percent_notes_hit> = (((<notes_hit> * 1.0) / <total_notes>) * 100.0)
		else
			<percent_notes_hit> = 0
		endif
		MathFloor <percent_notes_hit>
		<percent_notes_hit> = <floor>
		FormatText TextName = percent_text qs("\L%p") p = <percent_notes_hit>
	else
		if (<vocal_phrase_max_qual> > 0)
			percent_notes_hit = (((<vocal_phrase_quality> * 1.0) / <vocal_phrase_max_qual>) * 100.0)
			MathFloor <percent_notes_hit>
			<percent_notes_hit> = <floor>
			FormatText TextName = percent_text qs("\L%p\%") p = <percent_notes_hit> DecimalPlaces = 0
		else
			<percent_text> = qs("\L0")
		endif
	endif
	CreateScreenElement {
		parent = root_window
		id = my_breakdown_practice_id
		type = DescInterface
		desc = 'dialog_box_continue'
		dlog_title_text = <song_title>
		dlog_continue_notes_entry_text = <percent_text>
		dlog_continue_streak_entry_text = <streak_text>
		icon_difficulty_medium_texture = <diff_texture>
		dlog_fail_song_difficulty_text = <difficulty_text>
		exclusive_device = ($primary_controller)
	}
	disable_pause
	my_breakdown_practice_id :Desc_ResolveAlias \{name = alias_dlog_vmenu}
	SetScreenElementProps {
		id = <resolved_id>
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
		]
	}
	CreateScreenElement {
		parent = <resolved_id>
		type = TextElement
		font = fontgrid_text_a6
		text = qs("CONTINUE")
		scale = 0.75
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose ui_song_summary_continue_next_screen params = {for_practice = 1}}
		]
	}
	CreateScreenElement {
		parent = <resolved_id>
		type = TextElement
		font = fontgrid_text_a6
		text = qs("DETAILED STATS")
		scale = 0.75
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose generic_event_choose params = {state = uistate_song_summary_details}}
		]
	}
	CreateScreenElement {
		parent = <resolved_id>
		type = TextElement
		font = fontgrid_text_a6
		text = qs("REPLAY")
		scale = 0.75
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose practice_restart_song}
		]
	}
	if NOT PlayerInfoEquals \{1
			part = Vocals}
		CreateScreenElement {
			parent = <resolved_id>
			type = TextElement
			font = fontgrid_text_a6
			text = qs("SELECT SPEED")
			scale = 0.75
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose generic_event_choose params = {state = uistate_practice_select_speed data = {from_song_breakdown = 1}}}
			]
		}
	endif
	CreateScreenElement {
		parent = <resolved_id>
		type = TextElement
		font = fontgrid_text_a6
		text = qs("SELECT SECTION")
		scale = 0.75
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose generic_event_back params = {state = uistate_select_song_section}}
		]
	}
	AssignAlias id = <resolved_id> alias = current_menu
	add_user_control_helper ($ui_song_breakdown_helper_params) text = qs("SELECT") button = green z = 100000
endscript

script ui_song_breakdown_ready_up 
	GameMode_GetNumPlayersShown
	trim_boss_from_num_players_show
	player = 1
	begin
	GetPlayerInfo <player> controller
	if (<device_num> = <controller>)
		rdyArray = ($ui_song_breakdown_players_rdy)
		SetArrayElement ArrayName = rdyArray index = (<player> - 1) newvalue = 1
		ui_song_breakdown_set_player_ready dev_num = (<player> - 1)
		change ui_song_breakdown_players_rdy = <rdyArray>
	endif
	player = (<player> + 1)
	repeat <num_players_shown>
	ui_song_breakdown_is_everyone_ready
	return everyone_is_ready = <everyone_is_ready>
endscript

script ui_song_breakdown_num_players_ready 
	num_players_rdy = 0
	GameMode_GetNumPlayersShown
	trim_boss_from_num_players_show
	player = 1
	begin
	GetPlayerInfo <player> bot_play
	if (<bot_play> = 1)
		num_players_rdy = (<num_players_rdy> + 1)
	endif
	player = (<player> + 1)
	repeat <num_players_shown>
	rdy_up = ($ui_song_breakdown_players_rdy)
	i = 0
	begin
	num_players_rdy = (<num_players_rdy> + (<rdy_up> [<i>]))
	i = (<i> + 1)
	repeat <num_players_shown>
	return players_ready = <num_players_rdy>
endscript

script ui_song_breakdown_is_everyone_ready 
	everyone_is_ready = 1
	GameMode_GetNumPlayersShown
	trim_boss_from_num_players_show
	ui_song_breakdown_num_players_ready
	if (<num_players_shown> > <players_ready>)
		everyone_is_ready = 0
	endif
	return everyone_is_ready = <everyone_is_ready>
endscript

script ui_song_breakdown_set_player_ready 
	if my_breakdown_id :Desc_ResolveAlias \{name = alias_player_stats_element}
	else
		ScriptAssert \{qs("\LProblem resolving alias in song breakdown")}
	endif
	GetScreenElementChildren id = <resolved_id>
	GetScreenElementProps id = (<children> [<dev_num>])
	if (<check_mark_alpha> = 0)
		if (($game_mode = p1_career) || ($game_mode = training) || ($game_mode = tutorial) || ($game_mode = p1_quickplay))
			generic_menu_pad_choose_sound
		else
			SoundEvent \{event = Box_Check_SFX}
		endif
	endif
	SetScreenElementProps {
		id = (<children> [<dev_num>])
		check_mark_alpha = 1
	}
endscript
cash_milestones_collection_per_song = [
]

script clear_cash_milestones_per_song 
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
endscript

script ui_song_breakdown_clear_ready_up_book_keeping 
	change \{ui_song_breakdown_players_rdy = [
			0
			0
			0
			0
		]}
endscript

script ui_song_breakdown_clean_up_highest_multipliers 
	GameMode_GetNumPlayersShown
	trim_boss_from_num_players_show
	player_idx = 1
	begin
	SetPlayerInfo <player_idx> highest_multiplier = 1
	player_idx = (<player_idx> + 1)
	repeat <num_players_shown>
endscript

script ui_song_breakdown_pause_between_songs 
	ui_song_breakdown_add_components_for_transitions <...>
endscript

script ui_song_breakdown_add_components_for_transitions 
	if GotParam \{for_encore}
		return
	endif
	printf \{channel = mychannel
		qs("\LUI Transitioning between songs")}
	GameMode_GetType
	array = []
	if ($track_last_song = jamsession)
		printf \{'in song breakdown add components, song is jam'
			channel = jrdebug}
		array = [
			{pad_choose ui_song_breakdown_continue_to_next_screen_song_transition}
		]
		add_user_control_helper ($ui_song_breakdown_helper_params) text = qs("CONTINUE") button = green z = 100000
	else
		if ($is_network_game = 1)
			array = [
				{pad_choose ui_song_breakdown_continue_to_next_screen_song_transition}
			]
		else
			array = [
				{pad_back song_breakdown_go_to_stats_from_transition}
				{pad_choose ui_song_breakdown_continue_to_next_screen_song_transition}
			]
			GetPlayerInfo \{1
				controller}
			if CheckForSignIn controller_index = <controller>
			else
			endif
		endif
		if ($is_network_game = 1)
			add_user_control_helper \{text = qs("CONTINUE")
				button = green
				z = 100000}
		else
			add_user_control_helper \{text = qs("CONTINUE")
				button = green
				z = 100000}
			add_user_control_helper \{text = qs("MORE STATS")
				button = red
				z = 100000}
			GetPlayerInfo \{1
				controller}
			if CheckForSignIn controller_index = <controller>
			else
			endif
		endif
		if (<type> = quickplay)
			add_user_control_helper ($ui_song_breakdown_helper_params) text = qs("TOP ROCKERS") button = Blue z = 100000
			AddArrayElement array = <array> element = {pad_option song_breakdown_run_top_rockers_from_transition}
			if (($ui_song_breakdown_pulsate_helper_pill) = 1)
				SpawnScriptLater pulsate_helper_pill params = {id = <helper_pill_ID> time = 0.5}
			endif
		endif
	endif
	get_all_exclusive_devices
	SetScreenElementProps {
		id = my_breakdown_id
		event_handlers = <array>
		exclusive_device = <exclusive_device>
	}
	if (($my_trans_flag) = 1)
		change \{my_trans_flag = 0}
	else
		Wait \{10
			gameframes}
	endif
	LaunchEvent \{type = focus
		target = my_breakdown_id}
endscript
my_trans_flag = 0
song_breakdown_busy_flag = 0

script song_breakdown_go_to_leaderboard_from_transition 
	if NOT (($song_breakdown_busy_flag) = 0)
		return
	endif
	change \{my_trans_flag = 1}
	change \{song_breakdown_busy_flag = 1}
	ui_event_wait_for_safe
	ui_leaderboard_view_current_song my_song = ($track_last_song) device_num = <device_num>
endscript

script song_breakdown_go_to_stats_from_transition 
	if NOT (($song_breakdown_busy_flag) = 0)
		return
	endif
	change \{song_breakdown_busy_flag = 1}
	ui_event_wait_for_safe
	change \{my_trans_flag = 1}
	generic_event_choose \{state = uistate_song_summary_details}
endscript

script ui_song_breakdown_continue_to_next_screen_song_transition 
	if NOT (($song_breakdown_busy_flag) = 0)
		return
	endif
	if ($is_network_game = 0)
		ui_song_breakdown_ready_up device_num = <device_num>
		if (<everyone_is_ready> = 0)
			return
		endif
	else
		if IsHost
			if ($net_breakdown_next_song_msg_sent = 0)
				change \{net_breakdown_next_song_msg_sent = 1}
				SendStructure \{callback = ui_song_breakdown_continue_to_next_screen_song_transition_part_2
					data_to_send = {
						none
					}}
			else
				return
			endif
		else
			SendStructure \{callback = ui_song_breakdown_continue_to_next_screen_song_transition
				data_to_send = {
					none
				}}
			SoundEvent \{event = Menu_Song_Complete_Out}
			return
		endif
	endif
	ui_song_breakdown_continue_to_next_screen_song_transition_part_2
endscript

script ui_song_breakdown_continue_to_next_screen_song_transition_part_2 
	generic_menu_pad_choose_sound
	SoundEvent \{event = Menu_Song_Complete_Out}
	change \{songtime_paused = 0}
	change \{gameplay_loading_transition = 1}
	change \{net_ready_to_start = 0}
	if search_for_tool_in_quickplay_list
		can_change_level = 0
	else
		can_change_level = 1
	endif
	generic_event_replace nosound state = uistate_play_song data = {can_change_level = <can_change_level>}
endscript

script trim_boss_from_num_players_show 
	b_battle = ($boss_battle)
	if NOT (<b_battle> = 1)
		return
	endif
	return \{num_players_shown = 1}
endscript

script my_is_active_controller \{dev_num = 0}
	GameMode_GetNumPlayersShown
	i = 1
	begin
	GetPlayerInfo <i> controller
	if (<dev_num> = <controller>)
		return \{is_active = 1}
	endif
	i = (<i> + 1)
	repeat <num_players_shown>
	return \{is_active = 0}
endscript

script my_get_active_devices 
	GameMode_GetNumPlayersShown
	trim_boss_from_num_players_show
	devices = []
	player = 1
	begin
	GetPlayerInfo <player> controller
	AddArrayElement array = <devices> element = <controller>
	devices = <array>
	player = (<player> + 1)
	repeat <num_players_shown>
	return devices = <devices>
endscript

script getScoreFromDetailedStats \{player = 1}
	score = ($gig_detailed_stats [(<player> - 1)] [0].score)
	return score = <score>
endscript

script getBestRunFromDetailedStats \{player = 1}
	best_run = ($gig_detailed_stats [(<player> - 1)] [0].best_run)
	return best_run = <best_run>
endscript

script getStarsFromDetailedStats \{player = 1}
	stars = ($gig_detailed_stats [(<player> - 1)] [0].stars)
	return stars = <stars>
endscript

script getNotesHitFromDetailedStats \{player = 1}
	notes_hit = ($gig_detailed_stats [(<player> - 1)] [0].notes_hit)
	return notes_hit = <notes_hit>
endscript

script getMaxNotesFromDetailedStats \{player = 1}
	max_notes = ($gig_detailed_stats [(<player> - 1)] [0].max_notes)
	return max_notes = <max_notes>
endscript

script getTotalNotesFromDetailedStats \{player = 1}
	total_notes = ($gig_detailed_stats [(<player> - 1)] [0].total_notes)
	return total_notes = <total_notes>
endscript

script getSpPhrasesHitFromDetailedStats \{player = 1}
	sp_phrases_hit = ($gig_detailed_stats [(<player> - 1)] [0].sp_phrases_hit)
	return sp_phrases_hit = <sp_phrases_hit>
endscript

script getSpPhrasesTotalFromDetailedStats \{player = 1}
	sp_phrases_total = ($gig_detailed_stats [(<player> - 1)] [0].sp_phrases_total)
	return sp_phrases_total = <sp_phrases_total>
endscript

script getAvgMultiplierFromDetailedStats \{player = 1}
	avg_multiplier = ($gig_detailed_stats [(<player> - 1)] [0].avg_multiplier)
	return avg_multiplier = <avg_multiplier>
endscript

script getVocalStreakPhrasesFromDetailedStats \{player = 1}
	vocal_streak_phrases = ($gig_detailed_stats [(<player> - 1)] [0].vocal_streak_phrases)
	return vocal_streak_phrases = <vocal_streak_phrases>
endscript

script getVocalPhraseQualityFromDetailedStats \{player = 1}
	vocal_phrase_quality = ($gig_detailed_stats [(<player> - 1)] [0].vocal_phrase_quality)
	return vocal_phrase_quality = <vocal_phrase_quality>
endscript

script getVocalPhraseMaxQualFromDetailedStats \{player = 1}
	vocal_phrase_max_qual = ($gig_detailed_stats [(<player> - 1)] [0].vocal_phrase_max_qual)
	return vocal_phrase_max_qual = <vocal_phrase_max_qual>
endscript

script getCashRankUpFromDetailedStats \{player = 1}
	cash_rank_up = ($gig_detailed_stats [(<player> - 1)] [0].cash_rank_up)
	return cash_rank_up = <cash_rank_up>
endscript

script getNewCashFromDetailedStats \{player = 1}
	new_cash = ($gig_detailed_stats [(<player> - 1)] [0].new_cash)
	return new_cash = <new_cash>
endscript

script getCareerEarningsFromDetailedStats \{player = 1}
	career_earnings = ($gig_detailed_stats [(<player> - 1)] [0].career_earnings)
	return career_earnings = <career_earnings>
endscript

script song_breakdown_drop_player 
	printf \{qs("\Lsong_breakdown_drop_player")}
	printstruct <...>
	if (<is_game_over> = 0)
		GameMode_GetType
		if (<type> = career)
			wait_for_safe_shutdown
			spawnscriptnow gameplay_drop_player params = {<...>}
		endif
	endif
endscript

script song_breakdown_end_game 
	printf \{qs("\L---song_breakdown_end_game")}
	printstruct <...>
	destroy_popup_warning_menu
	if ((<is_game_over> = 1) && ($net_popup_active = 0))
		net_disable_pause
		switch <drop_reason>
			case net_message_player_quit
			FormatText TextName = first_msg qs("%s has quit.") s = <name_string>
			case net_message_player_dropped
			case net_message_player_timed_out
			FormatText TextName = first_msg qs("Lost connection to %s.") s = <name_string>
			default
			first_msg = qs("")
		endswitch
		FormatText TextName = msg qs("%s\nThere are not enough players to continue.") s = <first_msg>
		create_net_popup title = qs("GAME OVER") popup_text = <msg>
		if ScreenElementExists \{id = popup_warning_container}
			popup_warning_container :SE_SetProps \{z_priority = 1500.2}
		endif
		if ScreenElementExists \{id = PopupElement}
			PopupElement :Obj_SpawnScriptNow song_breakdown_end_game_spawned id = not_ui_player_drop_scripts params = <...>
		endif
	endif
endscript

script song_breakdown_end_game_spawned 
	change \{net_ready_to_start = 1}
	printf \{qs("\L---song_breakdown_end_game_spawned")}
	Wait \{3
		seconds}
	printf \{qs("\Lmade it past 3 seconds")}
	destroy_net_popup
	change \{Achievements_early_quit_flag = 1}
	GameMode_GetType
	if (<type> = career)
		if ($playing_song = 1)
			kill_gem_scroller
		endif
		GetGlobalTags \{user_options}
		if (<autosave> = 1)
			if ui_event_exists_in_stack \{name = 'group_play'}
				printf \{qs(0x26ffae70)}
				change \{is_network_game = 0}
				ui_memcard_autosave \{event = menu_back
					state = uistate_group_play
					data = {
						all_active_players = true
					}}
			else
				printf \{qs(0x7a510fef)}
				ui_memcard_autosave \{event = menu_back
					state = uistate_online
					data = {
						all_active_players = true
					}}
			endif
		else
			if ui_event_exists_in_stack \{name = 'group_play'}
				printf \{qs(0x26ffae70)}
				change \{is_network_game = 0}
				ui_event \{event = menu_back
					state = uistate_group_play}
			else
				printf \{qs(0x7a510fef)}
				ui_event \{event = menu_back
					state = uistate_online}
			endif
		endif
	endif
endscript
