
script ui_create_jam_ghtunes 
	change \{is_network_game = 1}
	spawnscriptnow create_jam_ghtunes_menu params = <...>
endscript

script ui_destroy_jam_ghtunes 
	change \{is_network_game = 0}
	destroy_popup_warning_menu
	killspawnedscript \{name = create_song_preview_menu}
	killspawnedscript \{id = ghtunes_spawns}
	killspawnedscript \{name = ghtunes_signin_check}
	killspawnedscript \{name = ghtunes_animate_spinning_record}
	killspawnedscript \{name = ghtunes_update_loading_text}
	killspawnedscript \{name = ghtunes_animate_5stars}
	killspawnedscript \{name = ghtunes_add_leaderboard_screen}
	killspawnedscript \{name = ghtunes_create_genre_menu}
	killspawnedscript \{name = ghtunes_string_search}
	killspawnedscript \{name = ghtunes_create_alphasearch_menu}
	killspawnedscript \{name = ghtunes_add_header}
	killspawnedscript \{name = ghtunes_spam_lock}
	killspawnedscript \{name = ghtunes_remove_header}
	killspawnedscript \{name = ghtunes_add_watermark}
	killspawnedscript \{name = ghtunes_remove_watermark}
	killspawnedscript \{name = guitar_jam_playback_recording}
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{name = song_preview_update_playbar}
	destroy_jam_ghtunes_menu
endscript

script ui_init_jam_ghtunes 
	set_home_button_notallowed
endscript

script ui_deinit_jam_ghtunes 
	killspawnedscript \{name = create_jam_ghtunes_menu}
	if isloggedin
		0xd7b863a3
	endif
	destroy_popup_warning_menu
	change \{jam_ghtunes_last_search_text = qs(0x00000000)}
	killspawnedscript \{name = create_song_preview_menu}
	killspawnedscript \{name = guitar_jam_playback_recording}
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{name = song_preview_update_playbar}
	killspawnedscript \{id = ghtunes_spawns}
	killspawnedscript \{name = ghtunes_signin_check}
	killspawnedscript \{name = ghtunes_animate_spinning_record}
	killspawnedscript \{name = ghtunes_update_loading_text}
	killspawnedscript \{name = ghtunes_animate_5stars}
	killspawnedscript \{name = ghtunes_add_leaderboard_screen}
	killspawnedscript \{name = ghtunes_create_genre_menu}
	killspawnedscript \{name = ghtunes_string_search}
	killspawnedscript \{name = ghtunes_create_alphasearch_menu}
	killspawnedscript \{name = ghtunes_add_header}
	killspawnedscript \{name = ghtunes_spam_lock}
	killspawnedscript \{name = ghtunes_remove_header}
	killspawnedscript \{name = ghtunes_add_watermark}
	killspawnedscript \{name = ghtunes_remove_watermark}
	killspawnedscript \{name = getjamusercontentstats_callback}
	killspawnedscript \{name = getjamusercontentstats_failed_callback}
	killspawnedscript \{name = getjamtopartiststats_callback}
	killspawnedscript \{name = jamusercanupload_callback}
	killspawnedscript \{name = jamusercanupload_callback_failed}
	killspawnedscript \{name = jamupdatetermsofuse_callback}
	killspawnedscript \{name = jamupdatetermsofuse_failed_callback}
	killspawnedscript \{name = jamupdatesubmissionagreement_callback}
	killspawnedscript \{name = jamupdatesubmissionagreement_failed_callback}
	if screenelementexists \{id = ghtunes_terms_dialog_box}
		destroyscreenelement \{id = ghtunes_terms_dialog_box}
	endif
	if screenelementexists \{id = song_preview_element}
		destroyscreenelement \{id = song_preview_element}
	endif
	jamsession_unload \{song_prefix = 'editable'}
	clearjamsession
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
