
script ui_create_jam_ghtunes 
	change \{is_network_game = 1}
	spawnscriptnow create_jam_ghtunes_menu params = <...>
endscript

script ui_destroy_jam_ghtunes 
	change \{is_network_game = 0}
	destroy_popup_warning_menu
	KillSpawnedScript \{name = create_song_preview_menu}
	KillSpawnedScript \{id = ghtunes_spawns}
	KillSpawnedScript \{name = ghtunes_signin_check}
	KillSpawnedScript \{name = ghtunes_animate_spinning_record}
	KillSpawnedScript \{name = ghtunes_update_loading_text}
	KillSpawnedScript \{name = ghtunes_animate_5stars}
	KillSpawnedScript \{name = ghtunes_add_leaderboard_screen}
	KillSpawnedScript \{name = ghtunes_create_genre_menu}
	KillSpawnedScript \{name = ghtunes_string_search}
	KillSpawnedScript \{name = ghtunes_create_alphasearch_menu}
	KillSpawnedScript \{name = ghtunes_add_header}
	KillSpawnedScript \{name = ghtunes_spam_lock}
	KillSpawnedScript \{name = ghtunes_remove_header}
	KillSpawnedScript \{name = ghtunes_add_watermark}
	KillSpawnedScript \{name = ghtunes_remove_watermark}
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	KillSpawnedScript \{name = song_preview_update_playbar}
	destroy_jam_ghtunes_menu
endscript

script ui_init_jam_ghtunes 
	set_home_button_notallowed
endscript

script ui_deinit_jam_ghtunes 
	KillSpawnedScript \{name = create_jam_ghtunes_menu}
	if IsLoggedIn
		ClearGHTunesCache
	endif
	destroy_popup_warning_menu
	change \{jam_ghtunes_last_search_text = qs("")}
	KillSpawnedScript \{name = create_song_preview_menu}
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	KillSpawnedScript \{name = song_preview_update_playbar}
	KillSpawnedScript \{id = ghtunes_spawns}
	KillSpawnedScript \{name = ghtunes_signin_check}
	KillSpawnedScript \{name = ghtunes_animate_spinning_record}
	KillSpawnedScript \{name = ghtunes_update_loading_text}
	KillSpawnedScript \{name = ghtunes_animate_5stars}
	KillSpawnedScript \{name = ghtunes_add_leaderboard_screen}
	KillSpawnedScript \{name = ghtunes_create_genre_menu}
	KillSpawnedScript \{name = ghtunes_string_search}
	KillSpawnedScript \{name = ghtunes_create_alphasearch_menu}
	KillSpawnedScript \{name = ghtunes_add_header}
	KillSpawnedScript \{name = ghtunes_spam_lock}
	KillSpawnedScript \{name = ghtunes_remove_header}
	KillSpawnedScript \{name = ghtunes_add_watermark}
	KillSpawnedScript \{name = ghtunes_remove_watermark}
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	KillSpawnedScript \{name = song_preview_update_playbar}
	KillSpawnedScript \{name = GetJamUserContentStats_callback}
	KillSpawnedScript \{name = GetJamUserContentStats_failed_callback}
	KillSpawnedScript \{name = GetJamTopArtistStats_callback}
	KillSpawnedScript \{name = JamUserCanUpload_callback}
	KillSpawnedScript \{name = JamUserCanUpload_callback_failed}
	KillSpawnedScript \{name = JamUpdateTermsOfUse_callback}
	KillSpawnedScript \{name = JamUpdateTermsOfUse_failed_callback}
	KillSpawnedScript \{name = JamUpdateSubmissionAgreement_callback}
	KillSpawnedScript \{name = JamUpdateSubmissionAgreement_failed_callback}
	if ScreenElementExists \{id = ghtunes_terms_dialog_box}
		DestroyScreenElement \{id = ghtunes_terms_dialog_box}
	endif
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
	endif
	jamsession_unload \{song_prefix = 'editable'}
	ClearJamSession
	set_home_button_allowed
endscript

script ui_return_jam_ghtunes 
	if (<old_base_name> = 'generic_alert_popup')
		set_focus_color \{rgba = [
				220
				220
				220
				255
			]}
		set_unfocus_color \{rgba = [
				64
				64
				64
				255
			]}
		clean_up_user_control_helpers
		ui_cas_text_entry_helper_text
	endif
endscript
