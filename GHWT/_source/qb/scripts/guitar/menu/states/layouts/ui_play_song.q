last_career_song_count = 0
last_quickplay_song_count = 0

script ui_create_play_song \{type = quickplay}
	printf \{'ui_create_play_song'}
	Menu_Music_Off
	change \{band_builder_current_gig_genre = none}
	band_anim_reset_loading
	if ($is_network_game = 1)
		change \{net_ready_to_start = 0}
		spawn_player_drop_listeners \{drop_player_script = play_song_drop_player
			end_game_script = play_song_game_over}
	endif
	GetGlobalTags \{Progression
		params = current_song_count}
	if GotParam \{progression_flag}
		change current_progression_flag = <progression_flag>
		change current_gig_number = <gig_num>
		get_progression_globals <progression_flag>
		FormatText checksumname = tiername 'tier%d' d = <gig_num>
		if GotParam \{song_checksum}
			SetGlobalTags Progression params = {current_tier = <gig_num> current_song_count = <song_index>}
			change current_song = <song_checksum>
		else
			SetGlobalTags Progression params = {current_tier = <gig_num> current_song_count = 0}
			change current_song = ($<tier_global>.<tiername>.songs [0])
		endif
		if GotParam \{selected_level}
			change current_level = <selected_level>
		else
			change current_level = ($<tier_global>.<tiername>.level)
		endif
		printstruct ($<tier_global>.<tiername>)
		if StructureContains Structure = ($<tier_global>.<tiername>) genre
			change band_builder_current_gig_genre = ($<tier_global>.<tiername>.genre)
		endif
		Progression_CashMilestonesClear
		Progression_ClearDetailedStatsForGig
		progression_reset_new_unlocks
	else
		if GotParam \{selected_level}
			change current_level = <selected_level>
		endif
		if ((($quickplay_song_list_current) = 0) && (($last_career_song_count) = <current_song_count>))
			Progression_CashMilestonesClear
		elseif ((<current_song_count> = 0) && (($last_quickplay_song_count) = ($quickplay_song_list_current)))
			Progression_CashMilestonesClear
		endif
		ui_gig_cash_clear_gig_earnings
	endif
	change last_career_song_count = <current_song_count>
	change last_quickplay_song_count = <current_song_count>
	spawnscriptnow ui_create_play_song_spawned params = <...>
endscript

script ui_destroy_play_song 
	if ($is_network_game = 0)
		if ($kickingToMain = 0)
			($default_loading_screen.destroy)
		endif
	endif
	destroy_player_drop_events
endscript

script ui_create_play_song_spawned 
	($default_loading_screen.create)
	if NOT SD_Load_Song song = ($current_song)
		return
	endif
	change \{agora_failed_attempts = 0}
	if ($practice_enabled)
		practice_start_song <...>
	else
		if ($is_network_game)
			load_and_sync_timing
		else
			switch ($game_mode)
				case p1_quickplay
				case p2_quickplay
				case p3_quickplay
				case p4_quickplay
				<current_song> = ($quickplay_song_list [($quickplay_song_list_current)])
				if (<current_song> = jamsession)
					<jam_directory_index> = ($temp_jamsession_song_list [($quickplay_song_list_current)])
					<example_song> = 0
					if (<jam_directory_index> >= 1000)
						<jam_directory_index> = (<jam_directory_index> - 1000)
						<example_song> = 1
						<filename> = (($jam_song_assets) [<jam_directory_index>].filename)
						<actual_filename> = <filename>
					else
						<filename> = ($jam_curr_directory_listing [<jam_directory_index>].filename)
						<actual_filename> = ($jam_curr_directory_listing [<jam_directory_index>].actual_file_name)
					endif
					printf 'filename  = %a, start from quick..' a = <filename> channel = jamset
					if ($band_mode_mode = none)
						set_random_single_player_quickplay
					endif
					quickplay_choose_random_venue <...>
					if NOT (($quickplay_venue) = none)
						change current_level = ($quickplay_venue)
					endif
					($default_loading_screen.destroy)
					jam_start_song_from_quickplay <...>
					return
				else
					quickplay_start_song <...>
				endif
				case p2_faceoff
				case p2_pro_faceoff
				case p2_battle
				quickplay_choose_random_venue <...>
				start_song <...>
				case p1_career
				default
				start_song <...>
			endswitch
		endif
	endif
	if ($is_network_game = 0)
		if ($kickingToMain = 0)
			($default_loading_screen.destroy)
		endif
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_gameplay
			}}
	else
		enable_pause
	endif
endscript

script play_song_drop_player 
	printf \{qs("\L---play_song_drop_player")}
	spawnscriptnow play_song_drop_player_spawned params = {<...>}
endscript

script play_song_drop_player_spawned 
	if (<is_game_over> = 0)
		wait_for_safe_shutdown
		gameplay_drop_player <...>
	endif
endscript

script play_song_game_over 
	spawnscriptnow play_song_game_over_spawned params = {<...>}
endscript

script play_song_game_over_spawned 
	printf \{qs(0x3210f61b)}
	begin
	if ($net_ready_to_start = 1)
		break
	endif
	WaitOneGameFrame
	repeat
	spawnscriptnow gameplay_end_game params = {<...>}
endscript

script wait_and_drop_player 
	blockuntilevent \{type = done_loading}
	spawnscriptnow \{gameplay_drop_player}
endscript
