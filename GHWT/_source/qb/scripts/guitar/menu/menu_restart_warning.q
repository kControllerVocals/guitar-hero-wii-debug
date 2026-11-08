
script create_restart_warning_menu \{player = 1}
	disable_pause
	player_device = ($last_start_pressed_device)
	create_popup_warning_menu {
		textblock = {
			text = qs("You will lose all unsaved progress if you restart. Are you sure you want to restart this song?")
			dims = (600.0, 400.0)
			scale = 0.6
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 480.0)
		options = [
			{
				func = generic_event_back
				text = qs("CANCEL")
			}
			{
				func = restart_warning_select_restart
				text = qs("RESTART")
			}
		]
	}
endscript

script destroy_restart_warning_menu 
	destroy_popup_warning_menu
endscript
g_suspend_disc_eject_soundpause = 0

script restart_warning_select_restart \{player = 1}
	kill_intro_celeb_ui
	if NOT GotParam \{dont_save_song_data}
		if isXenon
			if ($playing_song = 1)
				if NOT ($current_song = jamsession)
					WriteSongDataToFile \{incomplete = 1}
				endif
			endif
		endif
	endif
	generic_event_back \{state = uistate_gameplay}
	ResetScoreUpdateReady
	change \{g_suspend_disc_eject_soundpause = 1}
	GH3_SFX_fail_song_stop_sounds
	StopSoundsByBuss \{Encore_Events}
	if ($game_mode = training)
		spawnscriptnow \{practice_restart_song}
	else
		spawnscriptnow \{career_restart_song}
	endif
endscript
