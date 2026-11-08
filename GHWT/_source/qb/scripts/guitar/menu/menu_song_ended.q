
script create_song_ended_menu \{player = 1}
	if IsMoviePlaying \{TextureSlot = 1}
		PauseMovie \{TextureSlot = 1}
	endif
	disable_pause
	completion = 0
	get_song_end_time song = ($current_song)
	GetSongTimeMs
	if (<time> < 0)
		time = 0
	elseif (<time> > <total_end_time>)
		time = <total_end_time>
	endif
	if (<total_end_time> > 0)
		completion = (100 * <time> / <total_end_time>)
	endif
	CastToInteger \{completion}
	get_difficulty_text_upper difficulty = ($player1_status.difficulty)
	get_song_title song = ($current_song)
	GetUpperCaseString <song_title>
	FormatText TextName = completion_text qs("\L%d") d = <completion>
	<title> = qs("SONG ENDED")
	if ($game_mode = training)
		<text> = qs("PRACTICE AGAIN")
	else
		<text> = qs("RETRY SONG")
	endif
	popup_options = [
		{
			func = fail_song_menu_select_retry_song
			text = <text>
		}
	]
	GameMode_GetType
	if ($game_mode = training)
		if ($came_to_practice_from = main_menu)
			<new_song_option> = {
				func = song_ended_menu_select_new_song
				text = qs("NEW SONG")
			}
			AddArrayElement array = <popup_options> element = <new_song_option>
			<popup_options> = <array>
		else
			if ($came_to_practice_from = p1_career)
				<text> = qs("BACK TO CAREER")
			else
				<text> = qs("BACK TO QUICKPLAY")
			endif
			<new_song_option> = {
				func = song_ended_menu_select_back_to_game
				text = <text>
			}
			AddArrayElement array = <popup_options> element = <new_song_option>
			<popup_options> = <array>
		endif
	else
		if (<type> = career)
			<new_song_option> = {
				func = song_ended_menu_select_new_song
				text = qs("NEW GIG")
			}
		else
			<new_song_option> = {
				func = song_ended_menu_select_new_song
				text = qs("NEW SONG")
			}
		endif
		AddArrayElement array = <popup_options> element = <new_song_option>
		<popup_options> = <array>
	endif
	GameMode_GetType
	if (<type> = quickplay)
		if NOT ui_event_exists_in_stack \{name = 'jam'}
			<skip_song_option> = {
				func = quickplay_skip_song
				text = qs("SKIP SONG")
			}
			AddArrayElement array = <popup_options> element = <skip_song_option>
			<popup_options> = <array>
		endif
	endif
	<quit_option> = {
		func = song_ended_menu_select_quit
		text = qs("MAIN MENU")
	}
	AddArrayElement array = <popup_options> element = <quit_option>
	<popup_options> = <array>
	create_popup_warning_menu {
		title = <title>
		player_device = ($last_start_pressed_device)
		no_background
		options = <popup_options>
		fail_song_props = {
			song_title = <UpperCaseString>
			percent_text = <completion_text>
			difficulty_text = <difficulty_text>
		}
	}
endscript

script destroy_song_ended_menu 
	GH3_SFX_fail_song_stop_sounds
	if IsMoviePlaying \{TextureSlot = 1}
		ResumeMovie \{TextureSlot = 1}
	endif
	destroy_popup_warning_menu
endscript

script song_ended_menu_select_retry_song 
	if ($special_event_stage != 0)
		reset_special_event \{num = $current_special_event_num}
	endif
	generic_event_back \{state = uistate_gameplay}
	spawnscriptnow \{restart_song}
endscript

script song_ended_menu_select_new_song 
	create_loading_screen \{force_predisplay = 1}
	Wait \{3
		gameframes}
	if ($practice_enabled = 1)
		if ($special_event_stage != 0)
			generic_event_back state = uistate_gig_posters player = <player>
			change game_mode = ($special_event_previous_game_mode)
		else
			generic_event_back state = uistate_setlist player = <player>
		endif
		return
	endif
	if ($current_song = jamsession)
		if ui_event_exists_in_stack \{name = 'jam'}
			if NOT ($jam_view_cam_created = 1)
				destroy_bg_viewport
				setup_bg_viewport
				PlayIGCCam \{name = jam_view_cam
					viewport = bg_viewport
					controlscript = jam_camera_script
					params = {
						start_camera = jam_song_select
					}
					Play_hold = 1}
				change \{jam_view_cam_created = 1}
				change \{target_jam_camera_prop = failed_song_cam}
			endif
			generic_event_back state = UIstate_jam_select_song player = <player> data = {show_popup = 0}
		elseif ui_event_exists_in_stack \{name = 'setlist'}
			generic_event_back state = uistate_setlist player = <player>
		endif
	else
		if ui_event_exists_in_stack \{name = 'setlist'}
			generic_event_back state = uistate_setlist player = <player>
			return
		endif
		ui_memcard_autosave \{state = uistate_gig_posters
			data = {
				all_active_players = true
			}}
	endif
endscript

script song_ended_menu_select_quit 
	if ScreenElementExists \{id = intro_container}
		DestroyScreenElement \{id = intro_container}
	endif
	if ($game_mode = training)
		change \{practice_enabled = 0}
		change game_mode = ($came_to_practice_from)
		change \{current_num_players = 1}
		GameMode_UpdateNumPlayers \{num_players = 1}
	endif
	if ($is_network_game = 1)
		quit_network_game
		change \{is_network_game = 0}
	endif
	change \{should_reset_gig_posters_selection = 1}
	ui_memcard_autosave_replace \{state = UIstate_mainmenu
		data = {
			all_active_players = true
		}}
endscript

script song_ended_menu_select_back_to_game 
	change \{practice_enabled = 0}
	change game_mode = ($came_to_practice_from)
	change \{current_num_players = 1}
	GameMode_UpdateNumPlayers \{num_players = 1}
	unload_songqpak
	destroy_band
	if ($came_to_practice_from = p1_career)
		ui_event \{event = menu_back
			state = UIstate_singleplayer_character_hub
			data = {
				pass_to_gigboard = true
			}}
	else
		ui_event_wait_for_safe
		spawnscriptnow \{return_to_quickplay_from_practice}
	endif
endscript
