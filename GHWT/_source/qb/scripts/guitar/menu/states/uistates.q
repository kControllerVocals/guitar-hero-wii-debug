
script RegisterUIStates 
	printf \{qs("\LUIState: RegisterUIStates")}
	MemPushContext \{FrontEndHeap}
	RegisterState \{name = UIstate_Null
		task = {
			name = Task_Menu
			params = {
				base_name = 'null'
			}
		}}
	RegisterUIStates_Boot
	RegisterUIStates_Options
	RegisterUIStates_Frontend
	RegisterUIStates_Debug
	RegisterUIStates_Profile
	RegisterUIStates_Career
	RegisterUIStates_Outro
	RegisterUIStates_Character
	RegisterUIStates_Pause
	RegisterUIStates_Practice
	RegisterUIStates_Jam
	RegisterUIStates_Freestyle
	RegisterUIStates_Select_Rocker
	RegisterUIStates_Outfit
	RegisterUIStates_CAP
	RegisterUIStates_CAG
	RegisterUIStates_Online
	RegisterUIStates_DWC
	RegisterUIStates_CADrm
	MemPopContext
endscript

script RegisterUIStates_Boot 
	RegisterState \{name = UIstate_boot_legal
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_legal'
			}
		}}
	RegisterState \{name = UIstate_boot_movie_atvi
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_movie_ATVI'
			}
		}}
	RegisterState \{name = UIstate_boot_movie_red_octane
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_movie_red_octane'
			}
		}}
	RegisterState \{name = UIstate_boot_movie_neversoft
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_movie_neversoft'
			}
		}}
	RegisterState \{name = UIstate_boot_movie_vvisions
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_movie_vvisions'
			}
		}}
	RegisterState \{name = UIstate_boot_movie_budcat
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_movie_budcat'
			}
		}}
	RegisterState \{name = UIstate_boot_movie_intro
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_movie_intro'
			}
		}}
	RegisterState \{name = UIstate_boot_iis
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_iis'
				do_not_hide
			}
		}}
	RegisterState \{name = UIstate_boot_attract
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_attract'
			}
		}}
	RegisterState \{name = uistate_boot_guitar
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_guitar'
			}
		}}
	RegisterState \{name = uistate_boot_download_scan
		task = {
			name = Task_Menu
			params = {
				base_name = 'boot_download_scan'
				pakname = 'wii_handle_trc'
			}
		}}
endscript

script RegisterUIStates_Profile 
	RegisterState \{name = uistate_signin
		task = {
			name = Task_Menu
			params = {
				base_name = 'signin'
			}
		}}
	RegisterState \{name = uistate_signin_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'signin_warning'
			}
		}}
	RegisterState \{name = UIstate_signin_complete
		task = {
			name = Task_Menu
			params = {
				base_name = 'signin_complete'
			}
		}}
	RegisterState \{name = uistate_memcard
		task = {
			name = Task_Menu
			params = {
				base_name = 'memcard'
				type = boot
			}
		}}
	RegisterState \{name = UIState_Wii_Handle_Trc
		task = {
			name = Task_Menu
			params = {
				base_name = 'wii_handle_trc'
				pakname = 'wii_handle_trc'
			}
		}}
	RegisterState \{name = uistate_signin_changed
		task = {
			name = Task_Menu
			params = {
				base_name = 'signin_changed'
			}
		}}
	RegisterState \{name = uistate_connection_loss
		task = {
			name = Task_Menu
			params = {
				base_name = 'connection_loss'
			}
		}}
endscript

script RegisterUIStates_Frontend 
	RegisterState \{name = UIstate_mainmenu
		task = {
			name = Task_Menu
			params = {
				base_name = 'mainmenu'
				pakname = 'motd'
			}
		}}
	RegisterState \{name = uistate_mainmenu_intro
		task = {
			name = Task_Menu
			params = {
				base_name = 'mainmenu_intro'
			}
		}}
	RegisterState \{name = UIstate_motd
		task = {
			name = Task_Menu
			params = {
				base_name = 'motd'
			}
		}}
	RegisterState \{name = uistate_select_difficulty
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_difficulty'
			}
		}}
	RegisterState \{name = uistate_band_difficulty
		task = {
			name = Task_Menu
			params = {
				base_name = 'band_difficulty'
				pakname = 'band_mode'
			}
		}}
	RegisterState \{name = uistate_setlist
		task = {
			name = Task_Menu
			params = {
				base_name = 'setlist'
				pakname = 'setlist'
				focus_id = none
			}
		}}
	RegisterState \{name = UIstate_setlist_prompt
		task = {
			name = Task_Menu
			params = {
				base_name = 'setlist_prompt'
			}
		}}
	RegisterState \{name = uistate_select_instrument_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_instrument_warning'
			}
		}}
	RegisterState \{name = uistate_setlist_quit_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'setlist_quit_warning'
			}
		}}
	RegisterState \{name = UIstate_generic_dialogue
		task = {
			name = Task_Menu
			params = {
				base_name = 'generic_dialogue'
				focus_id = pu_warning_vmenu
			}
		}}
	RegisterState \{name = UIstate_generic_alert_popup
		task = {
			name = Task_Menu
			params = {
				base_name = 'generic_alert_popup'
				focus_id = pu_warning_vmenu
			}
		}}
	RegisterState \{name = UIstate_helper_dialogue
		task = {
			name = Task_Menu
			params = {
				base_name = 'helper_dialogue'
				focus_id = helper_root
			}
		}}
	RegisterState \{name = UIstate_dialog_box
		task = {
			name = Task_Menu
			params = {
				base_name = 'dialog_box'
			}
		}}
endscript

script RegisterUIStates_Options 
	RegisterState \{name = uistate_options
		task = {
			name = Task_Menu
			params = {
				base_name = 'options'
			}
		}}
	RegisterState \{name = uistate_options_audio
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_audio'
				pakname = 'options_audio'
			}
		}}
	RegisterState \{name = UIstate_options_calibrate_lag
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_calibrate_lag'
				pakname = 'options_calibrate_lag'
			}
		}}
	RegisterState \{name = uistate_options_calibrate_lag_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_calibrate_lag_warning'
				pakname = 'options_calibrate_lag_warning'
			}
		}}
	RegisterState \{name = UIstate_options_controller
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_controller'
			}
		}}
	RegisterState \{name = uistate_options_controller_whammy
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_controller_whammy'
			}
		}}
	RegisterState \{name = uistate_bonus_videos
		task = {
			name = Task_Menu
			params = {
				base_name = 'bonus_videos'
			}
		}}
	RegisterState \{name = uistate_bonus_videos_credits
		task = {
			name = Task_Menu
			params = {
				base_name = 'bonus_videos_credits'
				pakname = 'bonus_videos_credits'
			}
		}}
	RegisterState \{name = uistate_options_cheats
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_cheats'
			}
		}}
	RegisterState \{name = uistate_options_cheats_new
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_cheats_new'
				pakname = 'cheats'
			}
		}}
	RegisterState \{name = UIstate_top_rockers_mode
		task = {
			name = Task_Menu
			params = {
				base_name = 'top_rockers_mode'
			}
		}}
	RegisterState \{name = uistate_options_data
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_data'
			}
		}}
	RegisterState \{name = uistate_options_data_delete
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_data_delete'
			}
		}}
	RegisterState \{name = UIstate_options_manage_band
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_manage_band'
			}
		}}
	RegisterState \{name = UIstate_options_manage_band_logo
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_manage_band_logo'
				no_animate_in
			}
		}}
	RegisterState \{name = uistate_options_delete_band
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_delete_band'
			}
		}}
	RegisterState \{name = UIstate_options_controller_star_power
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_controller_star_power'
			}
		}}
	RegisterState \{name = uistate_options_controller_sensors
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_controller_sensors'
			}
		}}
	RegisterState \{name = uistate_options_settings
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_settings'
			}
		}}
	RegisterState \{name = UIstate_options_settings_lefty_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_settings_lefty_warning'
				focus_id = pu_warning_vmenu
			}
		}}
	RegisterState \{name = UIstate_options_calibrate
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_calibrate'
			}
		}}
	RegisterState \{name = UIstate_options_manage_band_font
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_manage_band_font'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_band_logo_choose
		task = {
			name = Task_Menu
			params = {
				base_name = 'band_logo_choose'
			}
		}}
	RegisterState \{name = uistate_band_name_logo
		task = {
			name = Task_Menu
			params = {
				base_name = 'band_name_logo'
				focus_id = band_name_menu
			}
		}}
	RegisterState \{name = UIstate_downloads
		task = {
			name = Task_Menu
			params = {
				base_name = 'downloads'
			}
		}}
	RegisterState \{name = uistate_options_vocals_view_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'options_vocals_view_warning'
			}
		}}
	RegisterState \{name = UIstate_guitarhero_com
		task = {
			name = Task_Menu
			params = {
				base_name = 'guitarhero_com'
				pakname = 'guitarhero_com'
			}
		}}
endscript

script RegisterUIStates_Debug 
	RegisterState \{name = uistate_debug
		task = {
			name = Task_Menu
			params = {
				base_name = 'debug'
			}
		}}
	RegisterState \{name = UIstate_debug_color_calibration
		task = {
			name = Task_Menu
			params = {
				base_name = 'debug_color_calibration'
			}
		}}
	RegisterState \{name = UIstate_viewport_test
		task = {
			name = Task_Menu
			params = {
				base_name = 'viewport_test'
			}
		}}
	RegisterState \{name = uistate_atom_unlock
		task = {
			name = Task_Menu
			params = {
				base_name = 'atom_unlock'
			}
		}}
	RegisterState \{name = UIstate_test
		task = {
			name = Task_Menu
			params = {
				base_name = 'test'
				pakname = 'testpak'
			}
		}}
	RegisterState \{name = UIstate_rockout
		task = {
			name = Task_Menu
			params = {
				base_name = 'rockout'
				pakname = 'rockout'
			}
		}}
endscript

script RegisterUIStates_Career 
	RegisterState \{name = uistate_play_song
		task = {
			name = Task_Menu
			params = {
				base_name = 'play_song'
			}
		}}
	RegisterState \{name = uistate_gameplay
		task = {
			name = Task_Menu
			params = {
				base_name = 'gameplay'
			}
		}}
	RegisterState \{name = uistate_game_mode
		task = {
			name = Task_Menu
			params = {
				base_name = 'game_mode'
			}
		}}
	RegisterState \{name = uistate_select_instrument
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_instrument'
			}
		}}
	RegisterState \{name = uistate_band_name_enter
		task = {
			name = Task_Menu
			params = {
				base_name = 'band_name_enter'
			}
		}}
	RegisterState \{name = UIstate_band_choose
		task = {
			name = Task_Menu
			params = {
				base_name = 'band_choose'
			}
		}}
	RegisterState \{name = uistate_select_controller
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_controller'
				pakname = 'select_controller'
			}
		}}
	RegisterState \{name = UIstate_select_mp_mode
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_mp_mode'
			}
		}}
	RegisterState \{name = uistate_fail_song
		task = {
			name = Task_Menu
			params = {
				base_name = 'fail_song'
				pakname = 'fail_song'
			}
		}}
	RegisterState \{name = UIstate_band_mode
		task = {
			name = Task_Menu
			params = {
				base_name = 'band_mode'
				focus_id = band_mode_menu
				pakname = 'band_mode'
			}
		}}
	RegisterState \{name = uistate_battle_helper
		task = {
			name = Task_Menu
			params = {
				base_name = 'battle_helper'
				pakname = 'battle_helper'
			}
		}}
	RegisterState \{name = UIstate_boss_wuss_out
		task = {
			name = Task_Menu
			params = {
				base_name = 'boss_wuss_out'
			}
		}}
	RegisterState \{name = uistate_choose_part
		task = {
			name = Task_Menu
			params = {
				base_name = 'choose_part'
			}
		}}
	RegisterState \{name = uistate_controller_disconnect
		task = {
			name = Task_Menu
			params = {
				base_name = 'controller_disconnect'
			}
		}}
	RegisterState \{name = UIstate_encore_confirmation
		task = {
			name = Task_Menu
			params = {
				base_name = 'encore_confirmation'
			}
		}}
	RegisterState \{name = uistate_beat_game
		task = {
			name = Task_Menu
			params = {
				base_name = 'beat_game'
			}
		}}
	RegisterState \{name = uistate_gig_posters
		task = {
			name = Task_Menu
			params = {
				base_name = 'gig_posters'
				focus_id = gig_posters_menu
			}
		}}
	RegisterState \{name = UIstate_special_events
		task = {
			name = Task_Menu
			params = {
				base_name = 'special_events'
				pakname = 'special_events'
			}
		}}
	RegisterState \{name = uistate_special_event_popup
		task = {
			name = Task_Menu
			params = {
				base_name = 'special_event_popup'
			}
		}}
	RegisterState \{name = UIstate_special_event_win
		task = {
			name = Task_Menu
			params = {
				base_name = 'special_event_win'
			}
		}}
	RegisterState \{name = uistate_group_play
		task = {
			name = Task_Menu
			params = {
				base_name = 'group_play'
			}
		}}
	RegisterState \{name = UIstate_cash_milestones
		task = {
			name = Task_Menu
			params = {
				base_name = 'cash_milestones'
				pakname = 'cash_milestones'
			}
		}}
	RegisterState \{name = uistate_song_breakdown
		task = {
			name = Task_Menu
			params = {
				base_name = 'song_breakdown'
				pakname = 'song_breakdown'
				anim_in_script = ui_song_breakdown_anim_in_script
				anim_out_script = ui_song_breakdown_anim_out_script
			}
		}}
	RegisterState \{name = uistate_cash_rewards_3
		task = {
			name = Task_Menu
			params = {
				base_name = 'cash_rewards_3'
				pakname = 'cash_rewards_3'
			}
		}}
endscript

script RegisterUIStates_Character 
	RegisterState \{name = uistate_character_hub
		task = {
			name = Task_Menu
			params = {
				base_name = 'character_hub'
				pakname = 'band_mode'
			}
		}}
	RegisterState \{name = UIstate_singleplayer_character_hub
		task = {
			name = Task_Menu
			params = {
				base_name = 'singleplayer_character_hub'
			}
		}}
	RegisterState \{name = uistate_character_select
		task = {
			name = Task_Menu
			params = {
				base_name = 'character_select'
				pakname = 'characterselect'
			}
		}}
	RegisterState \{name = UIstate_select_outfit
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_outfit'
			}
		}}
	RegisterState \{name = UIstate_select_outfit_style
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_outfit_style'
			}
		}}
	RegisterState \{name = UIstate_select_guitar
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_guitar'
			}
		}}
	RegisterState \{name = uistate_select_venue
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_venue'
			}
		}}
endscript

script RegisterUIStates_Pause 
	RegisterState \{name = UIstate_pausemenu
		task = {
			name = Task_Menu
			params = {
				base_name = 'pausemenu'
			}
		}}
	RegisterState \{name = uistate_pause_options
		task = {
			name = Task_Menu
			params = {
				base_name = 'pause_options'
			}
		}}
	RegisterState \{name = uistate_pausemenu_restart_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'pausemenu_restart_warning'
			}
		}}
	RegisterState \{name = UIstate_pausemenu_change_difficulty
		task = {
			name = Task_Menu
			params = {
				base_name = 'pausemenu_change_difficulty'
			}
		}}
	RegisterState \{name = UIstate_pausemenu_change_difficulty_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'pausemenu_change_difficulty_warning'
			}
		}}
	RegisterState \{name = UIstate_pausemenu_change_difficulty_confirm
		task = {
			name = Task_Menu
			params = {
				base_name = 'pausemenu_change_difficulty_confirm'
			}
		}}
	RegisterState \{name = uistate_pausemenu_lefty_flip_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'pausemenu_lefty_flip_warning'
			}
		}}
	RegisterState \{name = uistate_pausemenu_quit_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'pausemenu_quit_warning'
			}
		}}
	RegisterState \{name = uistate_pausemenu_song_ended
		task = {
			name = Task_Menu
			params = {
				base_name = 'pausemenu_song_ended'
				pakname = 'fail_song'
			}
		}}
	RegisterState \{name = uistate_song_unpause
		task = {
			name = Task_Menu
			params = {
				base_name = 'song_unpause'
				pakname = 'song_unpause'
			}
		}}
endscript

script RegisterUIStates_Outro 
	RegisterState \{name = UIstate_win_song
		task = {
			name = Task_Menu
			params = {
				base_name = 'win_song'
				pakname = 'win_song'
			}
		}}
	RegisterState \{name = UIstate_song_statistic
		task = {
			name = Task_Menu
			params = {
				base_name = 'song_statistic'
				pakname = 'song_statistic'
			}
		}}
	RegisterState \{name = UIstate_song_summary
		task = {
			name = Task_Menu
			params = {
				base_name = 'song_summary'
				pakname = 'song_summary'
			}
		}}
	RegisterState \{name = uistate_detailed_stats
		task = {
			name = Task_Menu
			params = {
				base_name = 'detailed_stats'
			}
		}}
	RegisterState \{name = uistate_top_rockers
		task = {
			name = Task_Menu
			params = {
				base_name = 'top_rockers'
				pakname = 'top_rockers'
			}
		}}
	RegisterState \{name = uistate_cash_reward
		task = {
			name = Task_Menu
			params = {
				base_name = 'cash_reward'
				pakname = 'cash_reward'
			}
		}}
	RegisterState \{name = uistate_sponsored
		task = {
			name = Task_Menu
			params = {
				base_name = 'sponsored'
				pakname = 'sponsor'
			}
		}}
	RegisterState \{name = uistate_unlock
		task = {
			name = Task_Menu
			params = {
				base_name = 'unlock'
			}
		}}
	RegisterState \{name = uistate_rewards
		task = {
			name = Task_Menu
			params = {
				base_name = 'rewards'
				pakname = 'rewards'
			}
		}}
	RegisterState \{name = uistate_song_summary_details
		task = {
			name = Task_Menu
			params = {
				base_name = 'song_summary_details'
				pakname = 'song_summary_details'
				anim_in_script = ui_song_summary_details_anim_in
				anim_out_script = ui_song_summary_details_anim_out
			}
		}}
	RegisterState \{name = uistate_sponsor_new
		task = {
			name = Task_Menu
			params = {
				base_name = 'sponsor_new'
				pakname = 'sponsor_new'
			}
		}}
	RegisterState \{name = UIstate_cash_rewards
		task = {
			name = Task_Menu
			params = {
				base_name = 'cash_rewards'
				pakname = 'cash_rewards'
			}
		}}
	RegisterState \{name = uistate_magazine_cover
		task = {
			name = Task_Menu
			params = {
				base_name = 'magazine_cover'
				pakname = 'magazine_cover'
				anim_in_script = ui_magazine_cover_anim_in
				anim_out_script = ui_magazine_cover_anim_out
			}
		}}
	RegisterState \{name = UIstate_gig_cash_summary
		task = {
			name = Task_Menu
			params = {
				base_name = 'gig_cash_summary'
				pakname = 'gig_cash_summary'
				anim_in_script = ui_gig_cash_summary_anim_in_script
			}
		}}
	RegisterState \{name = UIstate_top_5_rockers
		task = {
			name = Task_Menu
			params = {
				base_name = 'top_5_rockers'
			}
		}}
	RegisterState \{name = uistate_att_ballpark
		task = {
			name = Task_Menu
			params = {
				base_name = 'att_ballpark'
				pakname = 'att_ballpark'
			}
		}}
endscript

script RegisterUIStates_Practice 
	RegisterState \{name = uistate_select_practice_mode
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_practice_mode'
			}
		}}
	RegisterState \{name = uistate_select_tutorial
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_tutorial'
			}
		}}
	RegisterState \{name = uistate_play_tutorial_guitar
		task = {
			name = Task_Menu
			params = {
				base_name = 'play_tutorial'
				pakname = 'play_tutorial_guitar'
				anim_out_script = ui_play_tutorial_anim_out
			}
		}}
	RegisterState \{name = uistate_play_tutorial_drum
		task = {
			name = Task_Menu
			params = {
				base_name = 'play_tutorial'
				pakname = 'play_tutorial_drum'
				anim_out_script = ui_play_tutorial_anim_out
			}
		}}
	RegisterState \{name = UIstate_play_tutorial_vocals
		task = {
			name = Task_Menu
			params = {
				base_name = 'play_tutorial'
				pakname = 'play_tutorial_vocals'
				anim_out_script = ui_play_tutorial_anim_out
			}
		}}
	RegisterState \{name = UIstate_practice_select_part
		task = {
			name = Task_Menu
			params = {
				base_name = 'practice_select_part'
			}
		}}
	RegisterState \{name = uistate_select_song_section
		task = {
			name = Task_Menu
			params = {
				base_name = 'select_song_section'
				pakname = 'select_song_section'
			}
		}}
	RegisterState \{name = uistate_practice_select_speed
		task = {
			name = Task_Menu
			params = {
				base_name = 'practice_select_speed'
			}
		}}
	RegisterState \{name = uistate_practice_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'practice_warning'
			}
		}}
	RegisterState \{name = uistate_practice_select_difficulty
		task = {
			name = Task_Menu
			params = {
				base_name = 'practice_select_difficulty'
			}
		}}
	RegisterState \{name = UIstate_tutorial_prompt
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_prompt'
				focus_id = pu_warning_vmenu
			}
		}}
	RegisterState \{name = UIstate_tutorial_prompt_easy
		task = {
			name = Task_Menu
			params = {
				base_name = 'tutorial_prompt_easy'
				focus_id = pu_warning_vmenu
			}
		}}
	RegisterState \{name = UIstate_setlist_prompt
		task = {
			name = Task_Menu
			params = {
				base_name = 'setlist_prompt'
				pakname = 'setlist'
				focus_id = pu_warning_vmenu
			}
		}}
endscript

script RegisterUIStates_Jam 
	RegisterState \{name = uistate_jam
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam'
				pakname = 'jam'
			}
		}}
	RegisterState \{name = UIstate_jam_select_song
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_select_song'
			}
		}}
	RegisterState \{name = UIstate_jam_song_wizard
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_song_wizard'
			}
		}}
	RegisterState \{name = UIstate_jam_band
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_band'
				pakname = 'jam_band'
			}
		}}
	RegisterState \{name = UIstate_jam_band_tut
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_band_tut'
				pakname = 'jam_band_tut'
			}
		}}
	RegisterState \{name = uistate_jam_band_tut_recording
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_band_tut_recording'
				pakname = 'jam_band_tut_recording'
			}
		}}
	RegisterState \{name = UIstate_recording
		task = {
			name = Task_Menu
			params = {
				base_name = 'recording'
			}
		}}
	RegisterState \{name = UIstate_recording_disconnect
		task = {
			name = Task_Menu
			params = {
				base_name = 'recording_disconnect'
				focus_id = pu_warning_vmenu
			}
		}}
	RegisterState \{name = UIstate_jam_publish_song
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_publish_song'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_genre
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_publish_genre'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_track_select
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_publish_track_select'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_slot
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_publish_slot'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_download_slot
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_download_slot'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_title_entry
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_publish_title_entry'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_update_fileid
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_publish_update_fileid'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_text_entry
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_publish_text_entry'
				pakname = 'jam'
			}
		}}
	RegisterState \{name = UIstate_jam_publish_signin
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_publish_signin'
				pakname = 'jam'
			}
		}}
	RegisterState \{name = UIstate_jam_ghtunes
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_ghtunes'
				pakname = 'jam_ghtunes'
			}
		}}
	RegisterState \{name = UIstate_gh_tunes_share
		task = {
			name = Task_Menu
			params = {
				base_name = 'gh_tunes_share'
				pakname = 'gh_tunes_share'
			}
		}}
	RegisterState \{name = UIstate_jam_ratesong
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_ratesong'
				pakname = 'jam_ratesong'
			}
		}}
	RegisterState \{name = UIstate_jam_songwriter_event
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_songwriter_event'
				pakname = 'jam_songwriter'
			}
		}}
	RegisterState \{name = UIstate_jam_quickplay_event
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_quickplay_event'
			}
		}}
	RegisterState \{name = uistate_jam_tutorials
		task = {
			name = Task_Menu
			params = {
				base_name = 'jam_tutorials'
			}
		}}
endscript

script RegisterUIStates_Freestyle 
	RegisterState \{name = UIstate_freestyle
		task = {
			name = Task_Menu
			params = {
				base_name = 'freestyle'
			}
		}}
	RegisterState \{name = UIstate_freestyle_mii
		task = {
			name = Task_Menu
			params = {
				base_name = 'freestyle_mii'
			}
		}}
	RegisterState \{name = UIstate_freestyle_music
		task = {
			name = Task_Menu
			params = {
				base_name = 'freestyle_music'
				pakname = 'freestyle_music'
			}
		}}
	RegisterState \{name = UIstate_freestyle_stats
		task = {
			name = Task_Menu
			params = {
				base_name = 'freestyle_stats'
				pakname = 'freestyle_stats'
			}
		}}
	RegisterState \{name = UIstate_freestyle_band_mii
		task = {
			name = Task_Menu
			params = {
				base_name = 'freestyle_band_mii'
			}
		}}
	RegisterState \{name = UIstate_freestyle_band_instrument
		task = {
			name = Task_Menu
			params = {
				base_name = 'freestyle_band_instrument'
			}
		}}
	RegisterState \{name = UIstate_freestyle_band_music
		task = {
			name = Task_Menu
			params = {
				base_name = 'freestyle_band_music'
			}
		}}
	RegisterState \{name = UIstate_freestyle_game
		task = {
			name = Task_Menu
			params = {
				base_name = 'freestyle_game'
			}
		}}
endscript

script RegisterUIStates_Select_Rocker 
	RegisterState \{name = uistate_character_selection
		task = {
			name = Task_Menu
			params = {
				base_name = 'character_selection'
			}
		}}
	RegisterState \{name = UIstate_character_purchase
		task = {
			name = Task_Menu
			params = {
				base_name = 'character_purchase'
				focus_id = character_purchase_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character'
				hist_tex = icon_EditCharacter
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_head
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_head'
				hist_tex = icon_head
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_body
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_body'
				hist_tex = icon_body
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_proportions
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_proportions'
				hist_tex = icon_size
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_body_art
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_body_art'
				hist_tex = icon_graphics
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_sub_sections
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_sub_sections'
				hist_tex = icon_graphics
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_stage_presence
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_stage_presence'
				hist_tex = icon_presence
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_character_face_deformation
		task = {
			name = Task_Menu
			params = {
				base_name = 'character_face_deformation'
				hist_tex = icon_face
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_character_face_deformation_options
		task = {
			name = Task_Menu
			params = {
				base_name = 'character_face_deformation_options'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_color_edit
		task = {
			name = Task_Menu
			params = {
				base_name = 'cas_color_edit'
			}
		}}
	RegisterState \{name = UIstate_save_changes_dialogue
		task = {
			name = Task_Menu
			params = {
				base_name = 'save_changes_dialogue'
				focus_id = pu_warning_vmenu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_genre
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_genre'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_gender
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_gender'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_create_character_gender
		task = {
			name = Task_Menu
			params = {
				base_name = 'create_character_gender'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_create_character_genre
		task = {
			name = Task_Menu
			params = {
				base_name = 'create_character_genre'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_discard_changes
		task = {
			name = Task_Menu
			params = {
				base_name = 'cas_discard_changes'
				focus_id = pu_warning_vmenu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_mic
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_mic'
				hist_tex = icon_mic_2
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_mic_main
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_mic_main'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_select_part
		task = {
			name = Task_Menu
			params = {
				base_name = 'cas_select_part'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_select_part_options
		task = {
			name = Task_Menu
			params = {
				base_name = 'cas_select_part_options'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_popout_select_part
		task = {
			name = Task_Menu
			params = {
				base_name = 'popout_select_part'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_select_part_color_options
		task = {
			name = Task_Menu
			params = {
				base_name = 'cas_select_part_color_options'
			}
		}}
	RegisterState \{name = UIstate_cas_text_entry
		task = {
			name = Task_Menu
			params = {
				base_name = 'cas_text_entry'
				hist_tex = icon_name
			}
		}}
	RegisterState \{name = uistate_end_credits
		task = {
			name = Task_Menu
			params = {
				base_name = 'end_credits'
			}
		}}
endscript

script RegisterUIStates_CAP 
	RegisterState \{name = UIstate_cagr
		taks = {
			name = Task_Menu
			params = {
				base_name = 'cagr'
			}
		}}
	RegisterState \{name = UIstate_cap_main
		task = {
			name = Task_Menu
			params = {
				base_name = 'cagr'
			}
		}}
	RegisterState \{name = UIstate_cap_layers_list
		task = {
			name = Task_Menu
			params = {
				base_name = 'cap_layers_list'
				pakname = 'cas_ui'
				hist_tex = icon_current
			}
		}}
	RegisterState \{name = UIstate_cap_shape_list
		task = {
			name = Task_Menu
			params = {
				base_name = 'cap_shape_list'
				pakname = 'cas_ui'
				hist_tex = category
			}
		}}
	RegisterState \{name = UIstate_cap_shape_list_subset
		task = {
			name = Task_Menu
			params = {
				base_name = 'cap_shape_list_subset'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cap_color_wheel
		task = {
			name = Task_Menu
			params = {
				base_name = 'cap_color_wheel'
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cap_shape_edit
		task = {
			name = Task_Menu
			params = {
				base_name = 'cap_shape_edit'
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cap_artist_layer
		task = {
			name = Task_Menu
			params = {
				base_name = 'cap_artist_layer'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cap_layers_options
		task = {
			name = Task_Menu
			params = {
				base_name = 'cap_layers_options'
				pakname = 'cas_ui'
				focus_id = layers_options_vmenu
			}
		}}
	RegisterState \{name = UIstate_cap_artist_layer_options
		task = {
			name = Task_Menu
			params = {
				base_name = 'cap_artist_layer_options'
				hist_tex = menu_history_color_edit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cap_artist_layer_popout
		task = {
			name = Task_Menu
			params = {
				base_name = 'cap_artist_layer_popout'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cas_save_slots
		task = {
			name = Task_Menu
			params = {
				base_name = 'cas_save_slots'
			}
		}}
endscript

script RegisterUIStates_Outfit 
	RegisterState \{name = UIstate_customize_character_outfit
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_outfit'
				hist_tex = icon_outfit
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_customize_character_outfit_accessories
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_outfit_accessories'
				hist_tex = Accessories
				pakname = 'cas_ui'
			}
		}}
endscript

script RegisterUIStates_CAG 
	RegisterState \{name = UIstate_customize_character_instrument
		task = {
			name = Task_Menu
			params = {
				base_name = 'customize_character_instrument'
				hist_tex = icon_instrument
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_main
		task = {
			name = Task_Menu
			params = {
				base_name = 'cag_main'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom
		task = {
			name = Task_Menu
			params = {
				base_name = 'cag_custom'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_body
		task = {
			name = Task_Menu
			params = {
				base_name = 'cag_custom_body'
				hist_tex = icon_cag_body
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_body_types
		task = {
			name = Task_Menu
			params = {
				base_name = 'cag_custom_body_types'
				focus_id = current_list_menu
				hist_tex = icon_cag_type
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_select_part_inclusion
		task = {
			name = Task_Menu
			params = {
				base_name = 'cag_select_part_inclusion'
				focus_id = current_list_menu
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_select_part_inclusion_options
		task = {
			name = Task_Menu
			params = {
				base_name = 'cag_select_part_inclusion_options'
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_hardware
		task = {
			name = Task_Menu
			params = {
				base_name = 'cag_custom_hardware'
				hist_tex = icon_cag_hardware
				pakname = 'cag_custom_hardware'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_head
		task = {
			name = Task_Menu
			params = {
				base_name = 'cag_custom_head'
				hist_tex = icon_cag_head
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_strings
		task = {
			name = Task_Menu
			params = {
				base_name = 'cag_custom_strings'
				focus_id = current_list_menu
				hist_tex = icon_cag_strings
				pakname = 'cag_custom_hardware'
			}
		}}
	RegisterState \{name = UIstate_cag_custom_highway
		task = {
			name = Task_Menu
			params = {
				base_name = 'cag_custom_highway'
			}
		}}
endscript

script RegisterUIStates_Online 
	RegisterState \{name = uistate_online
		task = {
			name = Task_Menu
			params = {
				base_name = 'online'
				pakname = 'online_lobby'
			}
		}}
	RegisterState \{name = UIstate_net_setlist
		task = {
			name = Task_Menu
			params = {
				base_name = 'net_setlist'
				pakname = 'net_setlist'
			}
		}}
	RegisterState \{name = UIstate_net_custom_search
		task = {
			name = Task_Menu
			params = {
				base_name = 'net_custom_search'
				pakname = 'net_custom_search'
			}
		}}
	RegisterState \{name = UIstate_net_serverlist
		task = {
			name = Task_Menu
			params = {
				base_name = 'net_serverlist'
			}
		}}
	RegisterState \{name = UIstate_net_joining
		task = {
			name = Task_Menu
			params = {
				base_name = 'net_joining'
			}
		}}
	RegisterState \{name = UIstate_net_debug_lobby
		task = {
			name = Task_Menu
			params = {
				base_name = 'net_debug_lobby'
			}
		}}
	RegisterState \{name = UIstate_net_debug_lobby_join
		task = {
			name = Task_Menu
			params = {
				base_name = 'net_debug_lobby_join'
			}
		}}
	RegisterState \{name = UIstate_net_signin_popup
		task = {
			name = Task_Menu
			params = {
				base_name = 'net_signin_popup'
				focus_id = net_signin_popup
			}
		}}
	RegisterState \{name = UIstate_net_career_join_popup
		task = {
			name = Task_Menu
			params = {
				base_name = 'net_career_join_popup'
				focus_id = career_join_popup
			}
		}}
	RegisterState \{name = UIstate_leaderboard
		task = {
			name = Task_Menu
			params = {
				base_name = 'leaderboard'
				pakname = 'leaderboard'
			}
		}}
	RegisterState \{name = UIstate_leaderboard_groups
		task = {
			name = Task_Menu
			params = {
				base_name = 'leaderboard_groups'
				pakname = 'leaderboard'
			}
		}}
	RegisterState \{name = UIstate_leaderboard_list
		task = {
			name = Task_Menu
			params = {
				base_name = 'leaderboard_list'
				pakname = 'leaderboard'
			}
		}}
	RegisterState \{name = UIstate_leaderboard_load
		task = {
			name = Task_Menu
			params = {
				base_name = 'leaderboard_load'
				pakname = 'leaderboard'
				focus_id = leaderboard_load
			}
		}}
	RegisterState \{name = UIstate_leaderboard_filter
		task = {
			name = Task_Menu
			params = {
				base_name = 'leaderboard_filter'
				pakname = 'leaderboard'
				focus_id = filter_menu
				anim_in_script = ui_leaderboard_popup_anim_in
				anim_out_script = ui_leaderboard_popup_anim_out
			}
		}}
	RegisterState \{name = UIstate_leaderboard_me
		task = {
			name = Task_Menu
			params = {
				base_name = 'leaderboard_me'
				pakname = 'leaderboard'
				focus_id = leaderboard_popup
				anim_in_script = ui_leaderboard_popup_anim_in
				anim_out_script = ui_leaderboard_popup_anim_out
			}
		}}
	RegisterState \{name = UIstate_leaderboard_instrument
		task = {
			name = Task_Menu
			params = {
				base_name = 'leaderboard_instrument'
				pakname = 'leaderboard'
			}
		}}
	RegisterState \{name = UIstate_leaderboard_timeout
		task = {
			name = Task_Menu
			params = {
				base_name = 'leaderboard_timeout'
			}
		}}
	RegisterState \{name = UIstate_leaderboard_empty
		task = {
			name = Task_Menu
			params = {
				base_name = 'leaderboard_empty'
			}
		}}
	RegisterState \{name = UIstate_net_zero_search_results_popup
		task = {
			name = Task_Menu
			params = {
				base_name = 'net_zero_search_results_popup'
				focus_id = net_zero_popup
			}
		}}
	RegisterState \{name = UIstate_friends_list
		task = {
			name = Task_Menu
			params = {
				base_name = 'friends_list'
				focus_id = friends_list_popup
			}
		}}
	RegisterState \{name = UIstate_net_preferences
		task = {
			name = Task_Menu
			params = {
				base_name = 'net_preferences'
				focus_id = net_preferences_popup
			}
		}}
	RegisterState \{name = uistate_online_post_game_lobby
		task = {
			name = Task_Menu
			params = {
				base_name = 'online_post_game_lobby'
				pakname = 'online_lobby'
			}
		}}
	RegisterState \{name = uistate_net_setup
		task = {
			name = Task_Menu
			params = {
				base_name = 'net_setup'
			}
		}}
	RegisterState \{name = uistate_online_quit_warning
		task = {
			name = Task_Menu
			params = {
				base_name = 'online_quit_warning'
				focus_id = online_quit_menu
			}
		}}
	RegisterState \{name = UIstate_motd
		task = {
			name = Task_Menu
			params = {
				base_name = 'motd'
			}
		}}
	RegisterState \{name = UIstate_DLC_menu
		task = {
			name = Task_Menu
			params = {
				base_name = 'DLC_menu'
				pakname = 'DLC_Menu'
				focus_id = none
			}
		}}
	RegisterState \{name = UIstate_Rock_Archive
		task = {
			name = Task_Menu
			params = {
				base_name = 'Rock_Archive'
				pakname = 'DLC_Menu'
			}
		}}
endscript

script RegisterUIStates_DWC 
	RegisterState \{name = UIstate_profile_menu
		task = {
			name = Task_Menu
			params = {
				base_name = 'profile_menu'
				pakname = 'profile_menu'
			}
		}}
	RegisterState \{name = UIstate_wii_friends_list
		task = {
			name = Task_Menu
			params = {
				base_name = 'wii_friends_list'
				pakname = 'wii_friends_list'
			}
		}}
	RegisterState \{name = UIstate_wii_invite_players
		task = {
			name = Task_Menu
			params = {
				base_name = 'wii_invite_players'
				pakname = 'wii_sign_in'
			}
		}}
	RegisterState \{name = UIstate_wii_sign_in
		task = {
			name = Task_Menu
			params = {
				base_name = 'wii_sign_in'
				pakname = 'wii_sign_in'
			}
		}}
	RegisterState \{name = UIstate_enter_friend_num
		task = {
			name = Task_Menu
			params = {
				base_name = 'enter_friend_num'
				pakname = 'band_name_enter'
			}
		}}
endscript

script RegisterUIStates_CADrm 
	RegisterState \{name = UIstate_cadrm_main
		task = {
			name = Task_Menu
			params = {
				base_name = 'cadrm_main'
				hist_tex = icon_cadrm_drum
				pakname = 'cas_ui'
			}
		}}
	RegisterState \{name = UIstate_cadrm_hub
		task = {
			name = Task_Menu
			params = {
				base_name = 'cadrm_hub'
				hist_tex = icon_customize
				pakname = 'cas_ui'
			}
		}}
endscript
