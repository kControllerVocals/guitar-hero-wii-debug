freestyle_guitar_signin_pos = (860.0, 620.0)
freestyle_drum_signin_pos = (285.0, 620.0)
freestyle_beat_division = 0.5
freestyle_note_offset = 1.0
freestyle_catcher_offset_pixels = 80.0
freestyle_fretbar_offset = 0.25
freestyle_song_pak = 'songs/assassin.pak'
freestyle_mode = card_mode
freestyle_in_flow = 0
freestyle_music_type = none
freestyle_active = 0
freestyle_timer = 0
freestyle_rocking_out_too_hard = 0
freestyle_beat_this_frame = 0
freestyle_beat_counter = 1
freestyle_home_menu_paused = 0
freestyle_home_menu_already_paused = 0
freestyle_enable_signin = 0
freestyle_stop_playing_trigger = 0
freestyle_event_was_playing = 0
freestyle_check_controller_disconnect = 0

script freestyle_set_start_key_binding 
	printf \{qs(0xb526b91a)}
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				freestyle_start_pressed
			}
		]
		replace_handlers}
endscript

script freestyle_start_pressed 
	if freestyle_check_for_signin controller = <device_num>
		return
	endif
	freestyle_find_player_with_controller controller = <device_num>
	if (<player> = -1)
		return
	endif
	freestyle_show_pause_menu device_num = <device_num>
endscript

script freestyle_game_load 
	change \{freestyle_active = 1}
	change \{disable_note_input = 1}
	Unload_gempaks
	UnloadPak \{'pak/oogame/oogamevs.pak'}
	UnloadPak \{'pak/oogame/oogamebattle.pak'}
	UnloadPak \{'pak/oogame/oogameband.pak'}
	UnloadPak \{'pak/oogame/oogame.pak'}
	printf \{qs(0x9db5366d)}
	ReloadSfx \{mode = freestyle}
	printf \{qs(0x9ca06ec3)}
	DumpHeaps
	dumppaks
	printf \{qs(0x1ead0442)}
	LoadPak \{'pak/ui/controller_disconnect.pak'
		heap = heap_song}
	LoadPak \{'pak/freestyle/freestyle_highway.pak'
		heap = BottomUpHeap}
	if ($freestyle_mode = card_mode)
		LoadPak \{'pak/freestyle/freestyle_cards.pak'
			heap = heap_cas}
	endif
	LoadPak \{$freestyle_song_pak
		heap = heap_song}
	freestyle_load_options
	freestyle_calculate_player_count
	freestyle_choose_samples_based_on_music
	freestyle_assign_guitar_tunings
	printf \{qs(0x9a19361c)}
	freetyle_init_hud
	printf \{qs(0x586faaa4)}
	freestyle_init_guitar
	printf \{qs(0xd68f2914)}
	freestyle_init_drums
	printf \{qs(0xb792ec77)}
	FreestyleGameLoad
	if ($freestyle_mode = card_mode)
		printf \{qs(0x9b2adf98)}
		freestyle_load_card_system
	endif
	printf \{qs(0x0cf76a3d)}
	freestyle_init_tilt_meter
	printf \{qs(0xf3f90b11)}
	reset_song_time
	freestyle_setup_highway <...>
	player = 1
	player_status = player1_status
	player_text = ($<player_status>.text)
	change \{g_hud_2d_struct_used = $career_hud_2d_elements}
	set_song_section_array \{player = 1}
	reset_score \{player_status = player1_status}
	freestyle_start_gem_scroller song_name = assassin difficulty = easy difficulty2 = easy device_num = 0 <...>
	spawnscriptnow button_checker params = {<...>}
	printf \{qs(0xa9105de1)}
	freestyle_init_mii_scripts
	printf \{qs(0x5e5bae44)}
	begin
	samples_loaded = 0
	streams_loaded = 0
	if AreAllSamplesLoaded
		<samples_loaded> = 1
	endif
	if AreAllStreamsLoaded
		<streams_loaded> = 1
	endif
	if ((<samples_loaded> = 1) && (<streams_loaded> = 1))
		break
	else
		Wait \{1
			frame}
	endif
	repeat
	printf \{qs(0xccf085e4)}
	printf \{qs(0xd4c06685)}
	if ($freestyle_mode = card_mode)
		freestyle_init_card_system
		freestyle_enable_cards_changed
	endif
	printf \{qs(0xb52629e3)}
	freestyle_create_signin_ui
	if ($freestyle_player_data [0].controller = -1)
		freestyle_hide_guitar_ui
	endif
	if ($freestyle_player_data [1].controller = -1)
		freestyle_hide_drum_ui
	endif
	printf \{qs(0x1876ab20)}
	freestyle_set_mix_levels
	printf \{qs(0xff86dad2)}
	freestyle_reset_auto_help
	printf \{qs(0xbbe272da)}
	LightShow_InitEventMappings
	LightShow_SetTime \{time = 0.1}
	spawnscriptnow \{freestyle_play_lattice_lights}
	printf \{qs(0x9eaf2fdb)}
	freestyle_update_handedness
	DisableNgcFullscreenEffects
	printf \{qs(0xf024bb7f)}
endscript

script freestyle_game_start 
	GetStartTime
	player = 0
	begin
	if has_valid_controller player = <player>
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = signin_time value = <StartTime>
	endif
	<player> = (<player> + 1)
	repeat $freestyle_max_players
	freestyle_reset_stats
	freestyle_start_card_system
	FreestyleGameStart
	Wait \{1
		second}
	printf \{qs(0x35265046)}
	freestyle_set_start_key_binding
	change \{freestyle_enable_signin = 1}
	change \{freestyle_check_controller_disconnect = 1}
endscript

script freestyle_game_unload 
	change \{freestyle_active = 0}
	kill_start_key_binding
	FreestyleGameUnload
	StopMetronome
	if ($freestyle_mode = card_mode)
		freestyle_destroy_card_system
	endif
	freestyle_destroy_tilt_meter
	freestyle_destroy_guitar
	freestyle_destroy_drums
	freestyle_deinit_mii_scripts
	freestyle_deinit_hud
	freestyle_cleanup_highway
	freestyle_kill_light_scripts
	freestyle_kill_anim_scripts
	destroy_screen_blackout
	UnloadPak \{'pak/ui/controller_disconnect.pak'}
	UnloadPak \{'pak/freestyle/freestyle_highway.pak'}
	if ($freestyle_mode = card_mode)
		UnloadPak \{'pak/freestyle/freestyle_cards.pak'}
	endif
	UnloadPak \{$freestyle_song_pak}
	change \{freestyle_beat_counter = 1}
	change \{disable_note_input = 0}
	change \{freestyle_enable_signin = 0}
	change \{freestyle_check_controller_disconnect = 0}
	EnableNgcFullscreenEffects
endscript

script freestyle_game_update 
	GetDeltaTime
	change freestyle_timer = ($freestyle_timer + <delta_time>)
	if ($freestyle_mode = card_mode)
		freestyle_update_card_system
	endif
	if is_guitarist_human
		freestyle_update_guitar
	endif
	if is_drummer_human
		freestyle_update_drums
	else
		freestyle_update_auto_drummer
	endif
	IsMetronomeEnabled
	if (<metronome_enabled> = 1)
		if (MetronomeBeatThisFrame division = $freestyle_beat_division)
			change \{freestyle_beat_this_frame = 1}
			num_beats = (1.0 / $freestyle_beat_division)
			if ($freestyle_beat_counter >= <num_beats>)
				change \{freestyle_beat_counter = 1}
			else
				change freestyle_beat_counter = ($freestyle_beat_counter + 1)
			endif
		else
			change \{freestyle_beat_this_frame = 0}
		endif
	else
		change \{freestyle_beat_this_frame = 0}
		change \{freestyle_beat_counter = 1}
	endif
	freestyle_update_mii_scripts
	freestyle_update_auto_help
	LightShow_Update
	freestyle_check_controllers
endscript

script freestyle_game_update_paused 
endscript

script freestyle_pause 
	FreestyleGamePause
	PauseGame
endscript

script freestyle_unpause 
	if ($freestyle_mode = card_mode)
		freestyle_enable_cards_changed
		freestyle_refresh_card_visuals
	endif
	ReloadInstrumentConfigurations
	freestyle_set_mix_levels
	freestyle_update_handedness
	freestyle_assign_guitar_tunings
	FreestyleGameUnpause
	UnPauseGame
endscript

script freestyle_home_menu_pause 
	if (($freestyle_in_flow = 1) && ($freestyle_home_menu_paused = 0))
		if FreestyleGameIsStarted
			if FreestyleGameIsPaused
				change \{freestyle_home_menu_already_paused = 1}
			else
				change \{freestyle_home_menu_already_paused = 0}
				FreestyleGamePause
				PauseGame
			endif
		else
			FreestyleSetPauseSound \{Pause = true}
		endif
		change \{freestyle_home_menu_paused = 1}
	endif
endscript

script freestyle_home_menu_unpause 
	if (($freestyle_in_flow = 1) && ($freestyle_home_menu_paused = 1))
		if FreestyleGameIsStarted
			if ($freestyle_home_menu_already_paused = 0)
				FreestyleGameUnpause
				UnPauseGame
			endif
		else
			FreestyleSetPauseSound \{Pause = false}
		endif
		change \{freestyle_home_menu_paused = 0}
	endif
endscript

script freestyle_enter_flow 
	printf \{qs(0x4360a3c5)}
	freestyle_set_default_player_data
	change \{freestyle_in_flow = 1}
endscript

script freestyle_leave_flow 
	printf \{qs(0xedb413e5)}
	UninitMiiLib
	change \{freestyle_in_flow = 0}
endscript

script freestyle_create_signin_ui 
	freestyle_hud_create_button_prompt \{id = freestyle_guitar_signin
		pos = $freestyle_guitar_signin_pos
		text = $wii_freestyle_sign_in
		buttonchar = qs("\L\ba")}
	SetScreenElementProps \{id = freestyle_guitar_signin
		hide}
	freestyle_hud_create_button_prompt \{id = freestyle_drum_signin
		pos = $freestyle_drum_signin_pos
		text = $wii_freestyle_sign_in
		buttonchar = qs("\L\bk")}
	SetScreenElementProps \{id = freestyle_drum_signin
		hide}
endscript

script freestyle_check_controllers 
	if ($freestyle_check_controller_disconnect = 0)
		return
	endif
	player = 0
	begin
	if has_valid_controller player = <player>
		controller = ($freestyle_player_data [<player>].controller)
		last_controller_type = ($freestyle_player_data [<player>].controller_type)
		GetWiiControllerType controller = <controller>
		signout = 0
		signin_player = -1
		error_msg = none
		if (<controller_type> = none)
			printf qs(0x95267ca3) p = <player>
			<signout> = 1
			<error_msg> = controller_off
		elseif (<last_controller_type> != <controller_type>)
			if freestyle_player_has_proper_controller player = <player> controller_type = <controller_type>
				printf qs(0xcfbbd82e) p = <player>
				<signout> = 1
				<signin_player> = <player>
			else
				switched_player = 0
				if ($freestyle_player_count = 1)
					if (<player> = 0)
						other_player = 1
					else
						other_player = 0
					endif
					if freestyle_player_has_proper_controller player = <other_player> controller_type = <controller_type>
						printf qs(0xad96a55f) p = <player>
						<signout> = 1
						<signin_player> = <other_player>
						<switched_player> = 1
					endif
				endif
				if (<switched_player> = 0)
					printf qs(0x5108f278) p = <player>
					<signout> = 1
					<error_msg> = perhipheral_not_connected
				endif
			endif
		endif
		if (<signout> = 1)
			freestyle_signout_instrument player = <player>
		endif
		if (<signin_player> != -1)
			freestyle_signin_instrument player = <signin_player> controller = <controller>
		endif
		if ((<error_msg> != none) && ($freestyle_player_count = 0) && ($freestyle_rocking_out_too_hard = 0))
			ui_create_freestyle_controller_disconnect error = <error_msg>
		endif
	endif
	<player> = (<player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_check_for_signin 
	if ($freestyle_enable_signin = 0)
		return \{false}
	endif
	GetWiiControllerType controller = <controller>
	if (<controller_type> = guitar)
		if NOT has_valid_controller \{player = 0}
			freestyle_signin_instrument player = 0 controller = <controller>
			return \{true}
		endif
	elseif ((<controller_type> = nunchuk) || (<controller_type> = DrumKit))
		if NOT has_valid_controller \{player = 1}
			freestyle_signin_instrument player = 1 controller = <controller>
			return \{true}
		endif
	endif
	return \{false}
endscript

script freestyle_signout_instrument 
	freestyle_signin_instrument player = <player> signout = 1 controller = -1
endscript

script freestyle_signin_instrument \{signout = 0}
	if (<signout> = 1)
		printf qs(0xcecce511) p = <player>
		controller_type = none
		freestyle_hud_remove_help_text_for_player player = <player>
	else
		printf qs(0x708d6176) p = <player> c = <controller>
		GetWiiControllerType controller = <controller>
	endif
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = controller value = <controller>
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = controller_type value = <controller_type>
	if ((<player> = 1) && (<signout> = 0))
		if (<controller_type> = DrumKit)
			SetStructureParam array_name = freestyle_player_data array_index = <player> param = instrument value = DrumKit
		elseif (<controller_type> = nunchuk)
			SetStructureParam array_name = freestyle_player_data array_index = <player> param = instrument value = Drums
		endif
	endif
	freestyle_load_options
	freestyle_calculate_player_count
	ReloadInstrumentConfigurations
	freestyle_set_mix_levels
	freestyle_enable_cards_changed
	freestyle_reset_player_auto_help player = <player>
	if (<player> = 0)
		if (<signout> = 1)
			freestyle_hide_guitar_ui
		else
			freestyle_show_guitar_ui
		endif
	elseif (<player> = 1)
		if (<signout> = 1)
			freestyle_hide_drum_ui
		else
			freestyle_show_drum_ui
		endif
	endif
	if (<signout> = 0)
		GetStartTime
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = signin_time value = <StartTime>
	endif
endscript

script freestyle_update_guitar 
	freestyle_update_tilt_meter
	GetGuitarInputProperties \{player = 0}
	freestyle_update_notes pattern_held = <pattern_held>
	GetGuitarEventTriggered \{player = 0}
	if ((<event_triggered> > -1))
		freestyle_reset_whammy \{event_mask = 69905}
		freestyle_spawn_gems event_mask = <event_triggered> accent = <accent_held>
	endif
	GetGuitarEventTriggered \{player = 0
		loops}
	if ((<event_triggered>) > -1)
		freestyle_reset_whammy \{event_mask = 69905}
		freestyle_spawn_gems event_mask = <event_triggered> accent = <accent_held>
		freestyle_reset_whammy event_mask = <event_triggered>
	endif
	GetGuitarEventPlaying \{player = 0}
	if NOT ((<event_playing> > -1))
		if ($freestyle_stop_playing_trigger = 0)
			freestyle_reset_whammy \{event_mask = $freestyle_event_was_playing}
			change \{freestyle_stop_playing_trigger = 1}
		endif
	else
		change \{freestyle_stop_playing_trigger = 0}
		change freestyle_event_was_playing = <event_playing>
	endif
	GetGuitarEventPlaying \{player = 0
		loops}
	freestyle_update_loops event_mask = <event_playing>
	if (<accent_held> = true)
		freestyle_star_power_on
	else
		freestyle_star_power_off
	endif
endscript

script freestyle_hide_2D_elements 
	freestyle_hud_hide
	SetScreenElementProps \{id = freestyle_highway_container
		hide}
	SetScreenElementProps \{id = $freestyle_card_container_id
		hide}
endscript

script freestyle_show_2D_elements 
	freestyle_hud_show
	SetScreenElementProps \{id = freestyle_highway_container
		unhide}
	SetScreenElementProps \{id = $freestyle_card_container_id
		unhide}
endscript
