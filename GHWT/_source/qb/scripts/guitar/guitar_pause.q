
script setup_pause 
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	LaunchEvent \{type = focus
		target = root_window}
endscript
pause_enabled = 1

script disable_pause 
	if NOT GotParam \{nospam}
		printf \{'disable_pause'}
	endif
	kill_start_key_binding <...>
	change \{pause_enabled = 0}
endscript

script enable_pause 
	printf \{'enable_pause'}
	restore_start_key_binding
	change \{pause_enabled = 1}
endscript
homepausegame = 0
in_pause_menu = 0

script disc_error_pause 
	printf \{qs("\L--------------")}
	printf \{qs(0x05fc2931)}
	printf \{qs("\L--------------")}
	home_menu_pause \{disc_error = 1}
endscript

script disc_error_unpause 
	printf \{qs("\L--------------")}
	printf \{qs(0x5d94f5ea)}
	printf \{qs("\L--------------")}
	home_menu_unpause \{disc_error = 1}
endscript

script home_menu_pause \{disc_error = 0}
	printf \{qs("\L--------------")}
	printf \{qs(0xf8bc3b2a)
		a = $homepausegame}
	printf \{qs(0xba7386b5)
		a = $pause_enabled}
	printf \{qs("\L--------------")}
	freestyle_home_menu_pause
	if NOT ($pause_enabled = 1)
		if ui_event_exists_in_stack \{name = 'gameplay'}
			return
		endif
	endif
	if NOT ($homepausegame = 1)
		PauseGh3Sounds <...>
		if NOT IsGamePaused
			spawnscriptnow pausegh3 params = {home_menu from_handler disc_error = <disc_error>}
			change \{homepausegame = 1}
		endif
	endif
	if ($g_suspend_disc_eject_soundpause = 0)
		PauseAllSoundsHomeMenu
	endif
endscript

script home_menu_unpause \{disc_error = 0}
	printf \{qs("\L------------")}
	printf \{qs(0x82c345b1)
		a = $homepausegame}
	printf \{qs("\L------------")}
	freestyle_home_menu_unpause
	if ($homepausegame = 1)
		if (<disc_error> = 1)
			change \{recovering_from_disc_error = 1}
		endif
		spawnscriptnow unpausegh3 params = {home_menu from_handler disc_error = <disc_error>}
		BroadcastEvent \{type = event_unpause_game}
		change \{homepausegame = 0}
	endif
	UnPauseAllSoundsHomeMenu
	change \{g_suspend_disc_eject_soundpause = 0}
endscript
pausegh3_called = 0

script pausegh3 \{for_practice = 0
		disc_error = 0}
	printf \{qs("\L--------------")}
	printf \{qs("\LPausing Game")}
	printf \{qs("\L--------------")}
	if ($pausegh3_called = 1)
		return
	endif
	change \{pausegh3_called = 1}
	BroadcastEvent \{type = event_pause_game}
	if NOT GotParam \{home_menu}
		WaitOneGameFrame
		WaitOneGameFrame
	endif
	do_gh3_pause
	if NOT (CamAnimFinished name = cutscene)
		MovieMembFunc \{name = cutscene
			func = Cut_GEL_Pause}
	endif
	if ($practice_enabled)
		for_practice = 1
	endif
	if GotParam \{home_menu}
		ui_event_get_top
		if NOT (<base_name> = 'gameplay')
			printf \{qs(0x4b65e514)}
			return
		endif
	endif
	if GotParam \{from_handler}
		ui_event event = menu_change data = {state = UIstate_pausemenu for_practice = <for_practice>}
	endif
	WaitOneGameFrame
endscript

script do_gh3_pause 
	printf \{qs(0x3a5ecb2c)}
	if ($is_network_game && $playing_song)
		return
	endif
	change \{in_pause_menu = 1}
	PauseGh3Sounds <...>
	PauseFullScreenMovie
	PauseGame
	if IsMoviePlaying \{TextureSlot = 0}
		PauseMovie \{TextureSlot = 0}
	endif
	if IsMoviePlaying \{TextureSlot = 1}
		PauseMovie \{TextureSlot = 1}
	endif
	destroy_cameracut_ingame_menu
endscript
recovering_from_disc_error = 0

script unpausegh3 
	printf \{qs("\L------------")}
	printf \{qs("\LUnpausing Game")}
	printf \{qs("\L------------")}
	change \{toggleviewmode_enabled = true}
	change \{paused_for_hardware = 0}
	change \{pausegh3_called = 0}
	WaitOneGameFrame
	WaitOneGameFrame
	ui_event_get_top
	if NOT ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu'}
		do_gh3_unpause
		return
	endif
	if GotParam \{from_handler}
		if Is_ui_event_running
			printf \{qs(0x3fdd9ed4)}
			return
		endif
		GetGlobalTags \{user_options
			param = unpause_count}
		if (<unpause_count> = 0)
			ui_event \{event = menu_change
				event = menu_back
				data = {
					state = uistate_gameplay
				}}
			do_gh3_unpause
		else
			ui_event \{event = menu_replace
				data = {
					state = uistate_song_unpause
				}}
		endif
	else
		do_gh3_unpause
	endif
	WaitOneGameFrame
	if NOT (CamAnimFinished name = cutscene)
		MovieMembFunc \{name = cutscene
			func = Cut_GEL_Pause
			params = {
				off
			}}
	endif
	ResumeControllerChecking
	change \{sysnotify_paused_controllers = [
		]}
endscript

script do_gh3_unpause 
	printf \{qs(0xd97c5e4a)}
	UnPauseFullScreenMovie
	if ($recovering_from_disc_error = 1)
		printf \{qs(0x576e0cd2)}
		UnPauseGame
		Wait \{4
			gameframes}
		UnpauseGh3Sounds <...>
	else
		printf \{qs(0x22dce6a7)}
		UnpauseGh3Sounds <...>
		UnPauseGame
	endif
	change \{recovering_from_disc_error = 0}
	change \{in_pause_menu = 0}
	if IsMoviePlaying \{TextureSlot = 0}
		ResumeMovie \{TextureSlot = 0}
	endif
	if IsMoviePlaying \{TextureSlot = 1}
		ResumeMovie \{TextureSlot = 1}
	endif
	if ($force_sudden_death = 1)
		change \{force_sudden_death = 0}
		GuitarEvent_SongWon
	endif
	if (($cameracut_ingame_menu_on = 1))
		create_cameracut_ingame_menu
	endif
	change \{paused_for_hardware = 0}
endscript
last_start_pressed_device = 0
g_pause_is_busy = 0

script gh3_start_pressed \{device_num = -1}
	if ($is_attract_mode = 1)
		return
	endif
	if ($player1_status.bot_play = 1)
		if (<device_num> = ($primary_controller))
			device_num = -1
		else
			if GotParam \{from_handler}
				if GlobalExists \{name = debug_pause_control}
					ui_event_wait_for_safe
					if GameIsPaused
						ui_event_block \{event = menu_back
							data = {
								state = uistate_gameplay
							}}
						do_gh3_unpause
					else
						ui_event_block \{event = menu_change
							data = {
								state = uistate_debug
							}}
						do_gh3_pause
					endif
					return
				endif
			endif
			device_num = -1
		endif
	endif
	if (<device_num> = -1)
		if ($player1_status.bot_play = 1)
			start_pressed_device = ($primary_controller)
		else
			start_pressed_device = ($player1_status.controller)
		endif
	else
		i = 1
		begin
		FormatText checksumname = status 'player%n_status' n = <i>
		<controller> = (($<status>).controller)
		if (<device_num> = <controller>)
			start_pressed_device = <device_num>
			break
		endif
		i = (<i> + 1)
		repeat $current_num_players
		if ((<i> - 1) = $current_num_players)
			if NOT CD
				if GotParam \{from_handler}
					if GlobalExists \{name = debug_pause_control}
						ui_event_wait_for_safe
						if GameIsPaused
							ui_event_block \{event = menu_back
								data = {
									state = uistate_gameplay
								}}
							do_gh3_unpause
						else
							ui_event_block \{event = menu_change
								data = {
									state = uistate_debug
								}}
							do_gh3_pause
						endif
					endif
				endif
			endif
			return
		endif
	endif
	if GameIsPaused
		if NOT (<device_num> = -1)
			if NOT (<start_pressed_device> = $last_start_pressed_device)
				return
			endif
			SetInput controller = <device_num> pattern = 0 strum = 0
		endif
	else
		change last_start_pressed_device = <start_pressed_device>
	endif
	printstruct <...>
	spawnscriptnow gh3_start_pressed_spawned params = {<...>}
endscript

script gh3_start_pressed_spawned 
	if ($g_pause_is_busy = 1)
		return
	endif
	change \{g_pause_is_busy = 1}
	if NOT ($view_mode = 0)
		if GameIsPaused
			UnpauseGh3Sounds <...>
			UnPauseGame
		else
			PauseGame
			PauseGh3Sounds <...>
			unpausespawnedscript \{update_crowd_model_cam}
		endif
		change \{g_pause_is_busy = 0}
		return
	endif
	if GameIsPaused
		spawnscriptnow \{block_input_on_exit}
		unpausegh3 <...>
		BroadcastEvent \{type = event_unpause_game}
		change \{viewer_buttons_enabled = 1}
	else
		if ($net_pause = 1)
			net_unpausegh
			change \{g_pause_is_busy = 0}
			return
		elseif ($is_network_game && $playing_song)
			net_pausegh
			change \{g_pause_is_busy = 0}
			return
		endif
		pausegh3 <...>
		change \{viewer_buttons_enabled = 0}
		spawnscriptnow \{block_input}
	endif
	change \{g_pause_is_busy = 0}
endscript
input_blocked = 0

script block_input 
	if ($fade_overlay_count = 0)
		SetButtonEventMappings \{block_menu_input}
		change \{input_blocked = 1}
		Wait \{0.25
			seconds}
		SetButtonEventMappings \{unblock_menu_input}
		change \{input_blocked = 0}
	endif
endscript

script block_input_on_exit 
	if ($fade_overlay_count = 0)
		SetButtonEventMappings \{block_menu_input}
		change \{input_blocked = 1}
		Wait \{0.25
			seconds}
		SetButtonEventMappings \{unblock_menu_input}
		change \{input_blocked = 0}
	endif
endscript

script create_gh3_pause_menu 
	change \{toggleviewmode_enabled = false}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = Pause_Menu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		z_priority = 100}
endscript

script destroy_gh3_pause_menu 
	if ScreenElementExists \{id = Pause_Menu}
		DestroyScreenElement \{id = Pause_Menu}
	endif
	LegacyDoScreenElementMorph \{id = hud_window
		alpha = 1}
	change \{g_pause_is_busy = 0}
endscript

script safe_create_gh3_pause_menu 
	if NOT ScreenElementExists \{id = Pause_Menu}
		create_gh3_pause_menu <...>
	endif
endscript

script create_generic_backdrop 
	if NOT ScreenElementExists \{id = generic_backdrop_container}
		CreateScreenElement \{type = ContainerElement
			parent = root_window
			id = generic_backdrop_container
			pos = (0.0, 0.0)
			just = [
				left
				top
			]}
		CreateScreenElement \{type = SpriteElement
			id = pause_backdrop
			parent = generic_backdrop_container
			texture = menu_venue_bg
			rgba = [
				255
				255
				255
				255
			]
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 0
			alpha = 1}
		LegacyDoScreenElementMorph \{id = hud_window
			alpha = 0
			time = 0.5}
	endif
endscript

script destroy_generic_backdrop 
	if ScreenElementExists \{id = generic_backdrop_container}
		DestroyScreenElement \{id = generic_backdrop_container}
	endif
endscript

script clear_input_block 
	if ($input_blocked = 1)
		SetButtonEventMappings \{unblock_menu_input}
		change \{input_blocked = 0}
	endif
endscript
g_pause_event_time = 0

script handle_pause_event 
	if Is_ui_event_running
		return
	endif
	GetLocalSystemTime
	seconds = (<localsystemtime>.second)
	if NOT GotParam \{force}
		if (<seconds> >= ($g_pause_event_time) && <seconds> < ($g_pause_event_time + 2))
			return
		endif
	endif
	change g_pause_event_time = <seconds>
	printf \{qs("\Lhandle_pause_event")}
	spawnscriptnow gh3_start_pressed params = {<...> from_handler}
endscript
