is_shutdown_safe = 1

script mark_unsafe_for_shutdown 
	printf \{'mark_unsafe_for_shutdown'}
	change \{is_shutdown_safe = 0}
endscript

script mark_safe_for_shutdown 
	printf \{'mark_safe_for_shutdown'}
	change \{is_shutdown_safe = 1}
	unpausespawnedscript \{wait_for_safe_shutdown}
endscript

script wait_for_safe_shutdown 
	begin
	if ($is_shutdown_safe = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script handle_signin_changed 
	printf \{qs("\Lhandle_signin_changed")}
	change \{respond_to_signin_changed = 0}
	change \{shutdown_game_for_signin_change_flag = 1}
	wait_for_safe_shutdown
	LaunchEvent \{type = unfocus
		target = root_window}
	printf \{qs("\Lhandle_signin_changed started")}
	disable_pause
	create_loading_screen \{no_bink}
	ui_event_block \{event = menu_back
		data = {
			state = UIstate_Null
		}}
	shutdown_game_for_signin_change \{signin_change = 1}
	ui_event_block \{event = menu_change
		data = {
			state = uistate_signin_changed
			clear_previous_stack
		}}
	destroy_loading_screen
	startrendering
	SetButtonEventMappings \{unblock_menu_input}
	printf \{qs("\Lhandle_signin_changed end")}
endscript

script signing_change_confirm_reboot 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	printf \{qs("\Lsigning_change_confirm_reboot")}
	if ScreenElementExists \{id = pu_warning_vmenu}
		LaunchEvent \{type = unfocus
			target = pu_warning_vmenu}
	endif
	ui_event \{event = menu_change
		data = {
			state = UIstate_boot_iis
			clear_previous_stack
		}}
	printf \{qs("\Lsigning_change_confirm_reboot end")}
endscript
shutdown_game_for_signin_change_flag = 0

script shutdown_game_for_signin_change \{unloadcontent = 1
		signin_change = 0}
	printf \{qs("\Lshutdown_game_for_signin_change")}
	change \{shutdown_game_for_signin_change_flag = 1}
	StopAllSounds
	KillMenuMusic
	change \{net_pause = 0}
	KillSpawnedScript \{name = net_init}
	KillSpawnedScript \{name = do_calibration_update}
	KillSpawnedScript \{name = cl_do_ping}
	KillSpawnedScript \{name = kill_off_and_finish_calibration}
	KillSpawnedScript \{name = menu_calibrate_lag_create_circles}
	KillSpawnedScript \{name = gameplay_end_game}
	KillSpawnedScript \{name = accept_invite}
	set_demonware_failed
	destroy_player_drop_events
	destroy_alert_popup \{force = 1}
	end_practice_song_slomo
	memcard_sequence_cleanup_generic
	destroy_leaving_lobby_dialog
	kill_intro_celeb_ui
	KillSpawnedScript \{name = create_exploding_text}
	destroy_all_exploding_text
	quit_network_game_early \{signin_change}
	KillSpawnedScript \{name = gameplay_end_game}
	KillSpawnedScript \{name = play_song_game_over_spawned}
	setup_sessionfuncs
	if NetSessionFunc \{obj = session
			func = has_active_session}
		NetSessionFunc \{obj = session
			func = stop_singleplayer_session}
	endif
	if ($in_tutorial_mode = 1)
		tutorial_shutdown
	endif
	DeRegisterAtoms
	kill_gem_scroller \{no_render = 1
		restarting}
	clean_up_user_control_helpers
	Menu_Music_Off \{setflag = 1}
	unload_songqpak
	GetPakManCurrent \{map = zones}
	if NOT (<pak> = z_soundcheck)
		SetPakManCurrentBlock \{map = zones
			pak = none
			block_scripts = 1}
	endif
	destroy_band \{unload_paks}
	destroy_downloads_EnumContent
	if (<unloadcontent> = 1)
		Downloads_UnloadContent
		RemoveContentFiles \{playerid = -1}
		reset_globaltags_all
	endif
	if ScreenElementExists \{id = ready_container_p2}
		DestroyScreenElement \{id = ready_container_p2}
	endif
	set_default_misc_globals
	cleanup_songwon_event
	clear_wait_for_net_match_available_items
	UnPauseGame
	change \{shutdown_game_for_signin_change_flag = 0}
	printf \{qs("\Lshutdown_game_for_signin_change end")}
endscript

script cleanup_songwon_event 
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	destroy_menu \{menu_id = yourock_text_legend}
	KillSpawnedScript \{name = jiggle_text_array_elements}
	KillSpawnedScript \{name = You_Rock_Waiting_Crowd_SFX}
	KillSpawnedScript \{name = GuitarEvent_SongWon_Spawned}
endscript

script set_default_misc_globals 
	change \{show_boss_helper_screen = 0}
	change \{use_last_player_scores = 0}
	change \{old_song = none}
	change \{devil_finish = 0}
	change \{end_credits = 0}
	change \{battle_do_or_die = 0}
	change \{battle_do_or_die_speed_scale = 1.0}
	change \{battle_do_or_die_attack_scale = 1.0}
	change \{menu_flow_locked = 0}
	change \{coop_dlc_active = 0}
	change \{current_song_qpak_performance = 0}
	change \{songtime_paused = 0}
endscript

script wii_leave_bootup_signin 
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = continue
		}}
endscript

script wii_bootup_skip_login 
	destroy_generic_popup
	wii_leave_bootup_signin
endscript

script wii_bootup_handle_connection_error 
	if ($ui_flow_manager_state [0] = bootup_press_any_button_fs)
		wii_leave_bootup_signin
	endif
endscript
