
script create_quit_warning_menu \{player = 1
		option1_text = qs("CANCEL")
		option2_text = qs("QUIT")
		option1_func = generic_event_back
		option2_func = quit_warning_select_quit}
	disable_pause
	player_device = ($last_start_pressed_device)
	create_popup_warning_menu {
		textblock = {
			text = qs("You will lose all unsaved progress for this song if you quit. Are you sure you want to quit?")
			dims = (600.0, 400.0)
			scale = 0.6
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 480.0)
		options = [
			{
				func = <option1_func>
				text = <option1_text>
			}
			{
				func = <option2_func>
				text = <option2_text>
			}
		]
	}
endscript

script destroy_quit_warning_menu 
	destroy_popup_warning_menu
endscript

script quit_warning_select_quit \{player = 1
		callback = generic_event_choose
		data = {
			state = uistate_pausemenu_song_ended
		}}
	if GotParam \{quit_career_confirm}
		GameMode_GetType
		if (<type> = career)
			career_song_ended_select_quit
		endif
	endif
	if isXenon
		if NOT ($current_song = jamsession)
			WriteSongDataToFile \{incomplete = 1}
		endif
	endif
	spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
	ResetScoreUpdateReady
	GH3_SFX_fail_song_stop_sounds
	<callback> data = <data> no_sound
endscript
