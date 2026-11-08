
script ui_create_freestyle_game 
	CreateScreenElement \{type = ContainerElement
		id = freestyle_root
		parent = root_window
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]}
	set_random_human_players
	SpawnScriptLater \{ui_freestyle_init}
endscript

script ui_deinit_freestyle_game 
	spawnscriptnow \{freestyle_destroy_gh4}
	KillSpawnedScript \{name = tilt_guitar}
	freestyle_game_unload
	if ScreenElementExists \{id = freestyle_root}
		DestroyScreenElement \{id = freestyle_root}
	endif
	printf \{'exiting for some reason...'}
endscript

script ui_freestyle_init 
	kill_start_key_binding
	SetScreenElementProps \{id = freestyle_root
		hide}
	freestyle_init_gh4
	spawnscriptnow \{freestyle_game_start}
	SetScreenElementProps \{id = freestyle_root
		unhide}
endscript

script freestyle_init_gh4 
	destroy_band
	GetCASAppearance
	UnloadAppearancePaks asset_context = heap_musician1 appearance = <appearance> no_wait async = 0
	LightShow_Shutdown
	Kill_LightShow_FX
	change \{current_level = load_Z_Freestyle}
	Menu_Music_Off \{setflag = 1}
	change \{freestyle_active = 1}
	($default_loading_screen.create)
	change \{g_hud_2d_struct_used = hud_1g1v}
	Load_Venue
	UnloadPak \{'pak/anims/perm_anims/perm_anims.pak'
		heap = heap_musician_anim}
	LoadPak \{'Pak\\anims\\ingame\\Loops\\mii\\mii_anims.pak'
		heap = heap_musician_anim}
	LoadPak \{'Pak\\anims\\ingame\\Loops\\mii\\mii_drummer_anims.pak'
		heap = heap_musician_anim}
	if NOT GotParam \{StartTime}
		if GotParam \{uselaststarttime}
			StartTime = ($current_starttime)
		else
			StartTime = 0
		endif
	endif
	if NOT GotParam \{difficulty2}
		difficulty2 = ($player2_status.difficulty)
	endif
	if NOT GotParam \{difficulty}
		difficulty = expert
	endif
	if NOT GotParam \{song_name}
		song_name = ($current_song)
	endif
	freestyle_create_characters
	disable_pause
	PauseGame
	LaunchEvent \{type = unfocus
		target = root_window}
	printf qs("\LStarting new song %s on %l") s = <song_name> l = <difficulty>
	GuitarEvent_EnterVenue
	init_play_log
	begin_singleplayer_game
	if ((isps2) || (IsNgc))
		get_progression_globals game_mode = ($game_mode)
		GetPakManCurrentName \{map = zones}
		switch <pakname>
			case 'z_dive'
			change \{Default_tod_manager = $Default_tod_manager_bloomNoBlur}
			case 'z_hell'
			change \{Default_tod_manager = $Default_tod_manager_bloomNoBlur}
			case 'z_budokan'
			change \{Default_tod_manager = $Default_tod_manager_bloomNoBlur}
			case 'z_wikker'
			change \{Default_tod_manager = $Default_tod_manager_bloomNoBlur}
			case 'z_credits'
			change \{Default_tod_manager = $Default_tod_manager_bloomNoBlur}
			case 'z_freestyle'
			change \{Default_tod_manager = $Default_tod_manager_freestyle}
			default
			change \{Default_tod_manager = $Default_tod_manager_bloomNoBlur}
		endswitch
	endif
	setup_bg_viewport
	enable_bg_viewport
	if ViewportExists \{id = ui}
		SetViewportProperties \{viewport = ui
			active = false}
	endif
	create_moment_cam_lock_targets
	freestyle_game_load
	LaunchEvent \{type = focus
		target = root_window}
	gh3_start_pressed
	($default_loading_screen.destroy)
	WaitOneGameFrame
	ui :UnPause
	PlayIGCCam \{id = freestyle_view_cam_id
		name = freestyle_view_cam
		viewport = bg_viewport
		LockTo = world
		pos = (-0.56, 2.5, 19.1)
		facing = (0.0106211, -0.36163202, -0.9322599)
		FOV = 70.0
		Play_hold = 1
		interrupt_current}
	change \{CameraCuts_Enabled = false}
	BandManager_AddGuitarist \{name = Guitarist
		player = 1}
	BandManager_AddDrummer \{name = Drummer
		player = 2}
	Guitarist :Obj_SwitchScript \{guitarist_idle}
	Drummer :Obj_SwitchScript \{guitarist_idle}
endscript

script freestyle_destroy_gh4 
	change \{CameraCuts_Enabled = true}
	KillCamAnim \{name = freestyle_view_cam}
	vv_stop_camera_cuts
	change \{playing_song_for_real = 0}
	mark_unsafe_for_shutdown
	printf \{qs("\Lkill_gem_scroller - Start")}
	if NOT GotParam \{restarting}
		stoprendering
	endif
	DestroyPlayerServer \{id = all}
	SongUnLoadFSBIfDownloaded
	disable_highway_prepass
	Unload_Full_Guitarist_Anims
	Kill_StarPower_Camera \{changecamera = 0}
	Kill_Walk_Camera \{changecamera = 0}
	change \{structurename = player1_status
		star_power_amount = 0}
	change \{structurename = player2_status
		star_power_amount = 0}
	Kill_StarPower_StageFX player_text = ($player1_status.text) player_status = $player1_status ifEmpty = 0
	Kill_StarPower_StageFX player_text = ($player2_status.text) player_status = $player2_status ifEmpty = 0
	if ScreenElementExists \{id = starpower_container_leftp1}
		LegacyDoScreenElementMorph \{id = starpower_container_leftp1
			alpha = 0}
	endif
	if ScreenElementExists \{id = starpower_container_leftp2}
		LegacyDoScreenElementMorph \{id = starpower_container_leftp2
			alpha = 0}
	endif
	if ScreenElementExists \{id = starpower_container_rightp1}
		LegacyDoScreenElementMorph \{id = starpower_container_rightp1
			alpha = 0}
	endif
	if ScreenElementExists \{id = starpower_container_rightp2}
		LegacyDoScreenElementMorph \{id = starpower_container_rightp2
			alpha = 0}
	endif
	change \{showing_raise_axe = 0}
	kill_debug_elements
	GuitarEvent_ExitVenue
	destroy_cameracuts
	practicemode_deinit
	notemap_deinit
	LaunchGemEvent \{event = kill_objects}
	destroy_credits_menu
	deinit_star_power_debug
	destroy_battle_alert_frames
	KillSpawnedScript \{name = create_gem}
	KillSpawnedScript \{name = move_2d_elements_to_default}
	KillSpawnedScript \{name = wait_and_play_you_rock_movie}
	KillSpawnedScript \{name = update_score_fast}
	KillSpawnedScript \{name = check_for_star_power}
	KillSpawnedScript \{name = wait_for_inactive}
	KillSpawnedScript \{name = pulsate_all_star_power_bulbs}
	KillSpawnedScript \{name = pulsate_star_power_bulb}
	KillSpawnedScript \{name = rock_meter_star_power_on}
	KillSpawnedScript \{name = rock_meter_star_power_off}
	KillSpawnedScript \{name = star_power_activate_and_drain}
	KillSpawnedScript \{name = hud_activated_star_power}
	KillSpawnedScript \{name = hud_move_note_scorebar}
	KillSpawnedScript \{name = hud_flash_red_bg_p1}
	KillSpawnedScript \{name = hud_flash_red_bg_p2}
	KillSpawnedScript \{name = hud_flash_red_bg_kill}
	KillSpawnedScript \{name = hud_lightning_alert}
	KillSpawnedScript \{name = hud_show_note_streak_combo}
	KillSpawnedScript \{name = highway_pulse_multiplier_loss}
	kill_pulsate_star_power_bulbs \{player = 1}
	kill_pulsate_star_power_bulbs \{player = 2}
	KillSpawnedScript \{name = guitar_motion_test}
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	KillSpawnedScript \{name = jam_input_whammy}
	GetMaxPlayers
	player = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player> AddToStringLookup
	FormatText TextName = player_text 'p%i' i = <player> AddToStringLookup
	change structurename = <player_status> star_power_used = 0
	change structurename = <player_status> whammy_on = 0
	destroy_hud player_text = <player_text> player = <player>
	destroy_highway <...>
	hud_destroy_vocals player = <player>
	battlemode_deinit <...>
	bossbattle_deinit <...>
	faceoff_deinit <...>
	faceoff_volumes_deinit <...>
	player = (<player> + 1)
	repeat <max_players>
	if ViewportExists \{id = ui}
		SetViewportProperties \{viewport = ui
			active = true}
	endif
	new_destroy_hud
	kill_startup_script <...>
	KillSpawnedScript \{name = freestyle_drummer_play_idle_right_hand}
	KillSpawnedScript \{name = freestyle_drummer_play_idle_left_hand}
	KillSpawnedScript \{name = GuitarEvent_MissedNote}
	KillSpawnedScript \{name = GuitarEvent_UnnecessaryNote}
	KillSpawnedScript \{name = GuitarEvent_HitNotes}
	KillSpawnedScript \{name = GuitarEvent_HitNote}
	KillSpawnedScript \{name = GuitarEvent_StarPowerOn}
	KillSpawnedScript \{name = GuitarEvent_StarPowerOff}
	KillSpawnedScript \{name = GuitarEvent_StarHitNote}
	KillSpawnedScript \{name = GuitarEvent_StarSequenceBonus}
	KillSpawnedScript \{name = GuitarEvent_StarMissNote}
	KillSpawnedScript \{name = GuitarEvent_WhammyOn}
	KillSpawnedScript \{name = GuitarEvent_WhammyOff}
	KillSpawnedScript \{name = GuitarEvent_StarWhammyOn}
	KillSpawnedScript \{name = GuitarEvent_StarWhammyOff}
	KillSpawnedScript \{name = GuitarEvent_Note_Window_Open}
	KillSpawnedScript \{name = GuitarEvent_Note_Window_Close}
	KillSpawnedScript \{name = GuitarEvent_crowd_poor_medium}
	KillSpawnedScript \{name = GuitarEvent_crowd_medium_good}
	KillSpawnedScript \{name = GuitarEvent_crowd_medium_poor}
	KillSpawnedScript \{name = GuitarEvent_crowd_good_medium}
	KillSpawnedScript \{name = GuitarEvent_CreateFirstGem}
	KillSpawnedScript \{name = highway_pulse_black}
	KillSpawnedScript \{name = GuitarEvent_HitNote_Spawned}
	KillSpawnedScript \{name = GuitarEvent_HitNote}
	KillSpawnedScript \{name = hit_note_fx}
	KillSpawnedScript \{name = Do_StarPower_StageFX}
	KillSpawnedScript \{name = Do_StarPower_Camera}
	KillSpawnedScript \{name = first_gem_fx}
	KillSpawnedScript \{name = gem_iterator}
	KillSpawnedScript \{name = gem_array_stepper}
	KillSpawnedScript \{name = gem_array_events}
	KillSpawnedScript \{name = gem_step}
	KillSpawnedScript \{name = gem_step_end}
	KillSpawnedScript \{name = fretbar_iterator}
	KillSpawnedScript \{name = Strum_iterator}
	KillSpawnedScript \{name = FretPos_iterator}
	KillSpawnedScript \{name = FretFingers_iterator}
	KillSpawnedScript \{name = Drum_iterator}
	KillSpawnedScript \{name = Drum_cymbal_iterator}
	KillSpawnedScript \{name = WatchForStartPlaying_iterator}
	KillSpawnedScript \{name = tempo_matching_iterator}
	ClearMeasureCallbacks
	ClearBeatCallbacks
	KillSpawnedScript \{name = gem_scroller}
	KillSpawnedScript \{name = button_checker}
	KillSpawnedScript \{name = check_buttons}
	KillSpawnedScript \{name = net_check_buttons}
	KillSpawnedScript \{name = fretbar_update_tempo}
	KillSpawnedScript \{name = fretbar_update_hammer_on_tolerance}
	KillSpawnedScript \{name = move_whammy}
	KillSpawnedScript \{name = create_fretbar}
	KillSpawnedScript \{name = move_highway_2d}
	KillSpawnedScript \{name = move_highway_2d_off}
	KillSpawnedScript \{name = move_highway_prepass}
	KillSpawnedScript \{name = GuitarEvent_PreFretbar}
	KillSpawnedScript \{name = GuitarEvent_Fretbar}
	KillSpawnedScript \{name = GuitarEvent_StarPowerClapOnBeat}
	KillSpawnedScript \{name = check_note_hold}
	KillSpawnedScript \{name = net_check_note_hold}
	KillSpawnedScript \{name = star_power_whammy}
	KillSpawnedScript \{name = show_star_power_ready}
	KillSpawnedScript \{name = hud_glowburst_alert}
	change \{star_power_ready_on_p1 = 0}
	change \{star_power_ready_on_p2 = 0}
	KillSpawnedScript \{name = event_iterator}
	KillSpawnedScript \{name = win_song}
	KillSpawnedScript \{name = hand_note_iterator}
	KillSpawnedScript \{name = kill_object_later}
	KillSpawnedScript \{name = waitAndKillHighway}
	KillSpawnedScript \{name = testlevel_debug}
	KillSpawnedScript \{name = show_coop_raise_axe_for_starpower}
	KillSpawnedScript \{name = net_whammy_pitch_shift}
	KillSpawnedScript \{name = Crowd_AllPlayAnim}
	KillSpawnedScript \{name = hud_activated_star_power_spawned}
	KillSpawnedScript \{name = dispatch_player_state}
	KillSpawnedScript \{name = network_events}
	KillSpawnedScript \{name = online_win_song}
	destroy_net_popup
	destroy_gamertags
	KillSpawnedScript \{name = freestyle_play_lattice_lights}
	LightShow_Shutdown
	Kill_LightShow_FX
	DestroyParticlesByGroupID \{groupID = zoneparticles}
	Transition_KillAll
	KillSpawnedScript \{name = GuitarEvent_SongFailed_Spawned}
	KillSpawnedScript \{name = play_intro}
	KillSpawnedScript \{name = begin_song_after_intro}
	hud_flash_red_bg_kill \{player = 1}
	hud_flash_red_bg_kill \{player = 2}
	printf \{qs("\Lkill_gem_scroller - Killing Event Scripts")}
	KillSpawnedScript \{id = song_event_scripts}
	printf \{qs("\Lkill_gem_scroller - Killing Event Scripts Finished")}
	KillSpawnedScript \{id = zone_scripts}
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = zone_killsong '%s_KillSong' s = <pakname>
	if ScriptExists <zone_killsong>
		<zone_killsong>
	endif
	Destroy_AllWhammyFX
	LS_ResetVenueLights
	destroy_movie_viewport
	destroy_crowd_models
	destroy_bg_viewport
	destroy_intro
	destroy_band
	destroy_vocalist_dummy
	destroy_all_camera_lock_targets
	BandManager_RemoveAllCharacters
	if ($debug_showmeasures = on)
		if ScreenElementExists \{id = debug_measures_text}
			debug_measures_text :SE_SetProps \{hide}
		else
			change \{debug_showmeasures = off}
			toggle_showmeasures \{for_autolaunch}
		endif
	endif
	if ($debug_showsongtime = on)
		if ScreenElementExists \{id = debug_songtime_text}
			debug_songtime_text :SE_SetProps \{hide}
		else
			change \{debug_showsongtime = off}
			toggle_showsongtime
		endif
	endif
	if ($debug_showsongstars = on)
		if ScreenElementExists \{id = debug_songstars_text}
			debug_songstars_text :SE_SetProps \{hide}
		else
			change \{debug_showsongstars = off}
			toggle_showsongstars
		endif
	endif
	change \{structurename = guitarist_info
		stance = stance_b}
	change \{structurename = guitarist_info
		next_stance = stance_b}
	change \{structurename = guitarist_info
		current_anim = Idle}
	change \{structurename = guitarist_info
		cycle_anim = true}
	change \{structurename = guitarist_info
		next_anim = none}
	change \{structurename = guitarist_info
		playing_missed_note = false}
	change \{structurename = bassist_info
		stance = stance_frontend}
	change \{structurename = bassist_info
		next_stance = stance_frontend}
	change \{structurename = bassist_info
		current_anim = Idle}
	change \{structurename = bassist_info
		cycle_anim = true}
	change \{structurename = bassist_info
		next_anim = none}
	change \{structurename = bassist_info
		playing_missed_note = false}
	destroy_debug_measure_text
	kill_character_scripts
	change \{check_for_unplugged_controllers = 0}
	shut_down_practice_mode
	destroy_menu \{menu_id = you_rock_container}
	KillMovie \{TextureSlot = 1}
	printf \{qs("\Lkill_gem_scroller - waiting for dead objects")}
	Wait \{2
		gameframes}
	printf \{qs("\Lkill_gem_scroller - waiting for dead objects End")}
	if NOT GotParam \{restarting}
		if ExistsPakManMap \{map = guitar_hud}
			SetPakManCurrentBlock \{map = guitar_hud
				pak = none
				block_scripts = 1}
			DestroyPakManMap \{map = guitar_hud}
		endif
		UnloadPak \{'pak/oogame/oogame.pak'}
		UnloadPak \{'Pak\\anims\\ingame\\Loops\\mii\\mii_anims.pak'}
		UnloadPak \{'Pak\\anims\\ingame\\Loops\\mii\\mii_drummer_anims.pak'}
		LoadPak \{'pak/anims/perm_anims/perm_anims.pak'
			heap = heap_musician_anim
			no_vram}
		if ($game_mode = tutorial)
			printf \{qs(0xa1c7857c)}
		else
			ReloadSfx \{mode = FrontEnd}
		endif
	endif
	if NOT GotParam \{restarting}
		end_song
	endif
	if ($shutdown_game_for_signin_change_flag = 0)
		startrendering
	endif
	printf \{qs("\Lkill_gem_scroller - End")}
	mark_safe_for_shutdown
	change \{playing_song = 0}
	BroadcastEvent \{type = kill_gem_scroller_done}
endscript
