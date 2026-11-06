
script setup_pause 
	setscreenelementprops \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	launchevent \{type = focus
		target = root_window}
endscript
pause_enabled = 1

script disable_pause 
	if NOT gotparam \{nospam}
		printscriptinfo \{'disable_pause'}
	endif
	kill_start_key_binding <...>
	change \{pause_enabled = 0}
endscript

script enable_pause 
	if ($0x586466f5 = 1)
		return
	endif
	if NOT gotparam \{nospam}
		printscriptinfo \{'enable_pause'}
	endif
	restore_start_key_binding <...>
	change \{pause_enabled = 1}
endscript
homepausegame = 0
in_pause_menu = 0

script disc_error_pause 
	printf \{qs(0xa96cae1c)}
	printf \{qs(0x05fc2931)}
	printf \{qs(0xa96cae1c)}
	home_menu_pause \{disc_error = 1}
endscript

script disc_error_unpause 
	printf \{qs(0xa96cae1c)}
	printf \{qs(0x5d94f5ea)}
	printf \{qs(0xa96cae1c)}
	home_menu_unpause \{disc_error = 1}
endscript

script home_menu_pause \{disc_error = 0}
	printf \{qs(0xa96cae1c)}
	printf \{qs(0xf8bc3b2a)
		a = $homepausegame}
	printf \{qs(0xba7386b5)
		a = $pause_enabled}
	printf \{qs(0xa96cae1c)}
	if NOT ($pause_enabled = 1)
		if ui_event_exists_in_stack \{name = 'gameplay'}
			if ($g_suspend_disc_eject_soundpause = 0)
				pauseallsoundshomemenu
			endif
			return
		endif
	endif
	if NOT ($homepausegame = 1)
		pausegh3sounds <...>
		if NOT isgamepaused
			spawnscriptnow pausegh3 params = {home_menu from_handler disc_error = <disc_error>}
			change \{homepausegame = 1}
		endif
	endif
	if ($g_suspend_disc_eject_soundpause = 0)
		pauseallsoundshomemenu
	endif
endscript
0xe6223563 = 0

script home_menu_unpause \{disc_error = 0}
	printf \{qs(0xf6b8aa2b)}
	printf \{qs(0x82c345b1)
		a = $homepausegame}
	printf \{qs(0xf6b8aa2b)}
	if ($homepausegame = 1)
		if (<disc_error> = 1)
			change \{recovering_from_disc_error = 1}
		endif
		spawnscriptnow unpausegh3 params = {home_menu from_handler disc_error = <disc_error>}
		broadcastevent \{type = event_unpause_game}
		change \{homepausegame = 0}
	endif
	unpauseallsoundshomemenu
	change \{g_suspend_disc_eject_soundpause = 0}
	0x40dc204d
	change \{0xe6223563 = 1}
endscript
pausegh3_called = 0

script pausegh3 \{for_practice = 0
		disc_error = 0}
	printf \{qs(0xa96cae1c)}
	printf \{qs(0xf385348a)}
	printf \{qs(0xa96cae1c)}
	if ($pausegh3_called = 1)
		return
	endif
	change \{pausegh3_called = 1}
	broadcastevent \{type = event_pause_game}
	if NOT gotparam \{home_menu}
		waitonegameframe
		waitonegameframe
	endif
	do_gh3_pause
	if NOT (camanimfinished name = cutscene)
		moviemembfunc \{name = cutscene
			func = cut_gel_pause}
	endif
	if ($practice_enabled)
		for_practice = 1
	endif
	if ($transition_playing = true)
		if ($current_playing_transition = careerintro)
			setslomo \{1.0}
		endif
	endif
	if gotparam \{home_menu}
		ui_event_get_top
		if NOT (<base_name> = 'gameplay')
			printf \{qs(0x4b65e514)}
			return
		endif
	endif
	if gotparam \{from_handler}
		if ($transition_playing = true)
			if NOT ($current_playing_transition = careerintro)
				ui_event event = menu_change data = {state = uistate_pausemenu for_practice = <for_practice>}
			endif
		else
			ui_event event = menu_change data = {state = uistate_pausemenu for_practice = <for_practice>}
		endif
	endif
	waitonegameframe
endscript

script do_gh3_pause 
	if ($is_network_game && $playing_song)
		return
	endif
	change \{in_pause_menu = 1}
	pausegh3sounds <...>
	pausefullscreenmovie
	pausegame
	if ismovieplaying \{textureslot = 0}
		pausemovie \{textureslot = 0}
	endif
	if ismovieplaying \{textureslot = 1}
		pausemovie \{textureslot = 1}
	endif
	destroy_cameracut_ingame_menu
endscript
recovering_from_disc_error = 0

script unpausegh3 
	printf \{qs(0xf6b8aa2b)}
	printf \{qs(0x293a99c4)}
	printf \{qs(0xf6b8aa2b)}
	change \{toggleviewmode_enabled = true}
	change \{paused_for_hardware = 0}
	change \{pausegh3_called = 0}
	waitonegameframe
	waitonegameframe
	ui_event_get_top
	printstruct <...>
	if NOT ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu'}
		do_gh3_unpause
		return
	endif
	if gotparam \{from_handler}
		if is_ui_event_running
			return
		endif
	endif
	getglobaltags \{user_options
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
	waitonegameframe
	if NOT (camanimfinished name = cutscene)
		moviemembfunc \{name = cutscene
			func = cut_gel_pause
			params = {
				off
			}}
	endif
	resumecontrollerchecking
	change \{sysnotify_paused_controllers = [
		]}
	if ($transition_playing = true)
		if ($current_playing_transition = careerintro)
			setslomo ($careerintro_current_slomo)
		endif
	endif
endscript

script do_gh3_unpause 
	unpausefullscreenmovie
	if ($recovering_from_disc_error = 1)
		printf \{qs(0x576e0cd2)}
		unpausegame
		wait \{4
			gameframes}
		unpausegh3sounds <...>
	else
		printf \{qs(0x22dce6a7)}
		unpausegh3sounds <...>
		unpausegame
	endif
	change \{recovering_from_disc_error = 0}
	change \{in_pause_menu = 0}
	if ismovieplaying \{textureslot = 0}
		resumemovie \{textureslot = 0}
	endif
	if ismovieplaying \{textureslot = 1}
		resumemovie \{textureslot = 1}
	endif
	if ($force_sudden_death = 1)
		change \{force_sudden_death = 0}
		guitarevent_songwon
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
			if gotparam \{from_handler}
				if globalexists \{name = debug_pause_control}
					ui_event_wait_for_safe
					if gameispaused
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
		status = ($0x2994109a [<i>])
		<controller> = (($<status>).controller)
		if (<device_num> = <controller>)
			start_pressed_device = <device_num>
			break
		endif
		i = (<i> + 1)
		repeat $current_num_players
		if ((<i> - 1) = $current_num_players)
			if cd
				if gotparam \{from_handler}
					if globalexists \{name = debug_pause_control}
						ui_event_wait_for_safe
						if gameispaused
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
	if gameispaused
		if NOT (<device_num> = -1)
			if NOT (<start_pressed_device> = $last_start_pressed_device)
				return
			endif
			setinput controller = <device_num> pattern = 0 strum = 0
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
	printf \{qs(0x2c46a642)}
	if NOT ($view_mode = 0)
		if gameispaused
			unpausegh3sounds <...>
			unpausegame
		else
			pausegh3sounds <...>
			pausegame
			unpausespawnedscript \{update_crowd_model_cam}
		endif
		change \{g_pause_is_busy = 0}
		return
	endif
	if gameispaused
		spawnscriptnow \{block_input_on_exit}
		unpausegh3 <...>
		broadcastevent \{type = event_unpause_game}
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
		setbuttoneventmappings \{block_menu_input}
		change \{input_blocked = 1}
		wait \{0.25
			seconds}
		setbuttoneventmappings \{unblock_menu_input}
		change \{input_blocked = 0}
	endif
endscript

script block_input_on_exit 
	if ($fade_overlay_count = 0)
		setbuttoneventmappings \{block_menu_input}
		change \{input_blocked = 1}
		wait \{0.25
			seconds}
		setbuttoneventmappings \{unblock_menu_input}
		change \{input_blocked = 0}
	endif
endscript

script create_gh3_pause_menu 
	change \{toggleviewmode_enabled = false}
	createscreenelement \{type = containerelement
		parent = root_window
		id = pause_menu
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		z_priority = 100}
endscript

script destroy_gh3_pause_menu 
	if screenelementexists \{id = pause_menu}
		destroyscreenelement \{id = pause_menu}
	endif
	legacydoscreenelementmorph \{id = hud_window
		alpha = 1}
	change \{g_pause_is_busy = 0}
endscript

script safe_create_gh3_pause_menu 
	if NOT screenelementexists \{id = pause_menu}
		create_gh3_pause_menu <...>
	endif
endscript

script create_generic_backdrop 
	if NOT screenelementexists \{id = generic_backdrop_container}
		createscreenelement \{type = containerelement
			parent = root_window
			id = generic_backdrop_container
			pos = (0.0, 0.0)
			just = [
				left
				top
			]}
		createscreenelement \{type = spriteelement
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
		legacydoscreenelementmorph \{id = hud_window
			alpha = 0
			time = 0.5}
	endif
endscript

script destroy_generic_backdrop 
	if screenelementexists \{id = generic_backdrop_container}
		destroyscreenelement \{id = generic_backdrop_container}
	endif
endscript

script clear_input_block 
	if ($input_blocked = 1)
		setbuttoneventmappings \{unblock_menu_input}
		change \{input_blocked = 0}
	endif
endscript

script handle_pause_event 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if is_ui_event_running
		return
	elseif ($playing_song = 0)
		return
	elseif scriptisrunning \{sysnotify_handle_pause_controller}
		return
	elseif scriptisrunning \{sysnotify_handle_pause}
		return
	elseif scriptisrunning \{sysnotify_handle_unpause}
		return
	endif
	if ($0x586466f5 = 1)
		return
	endif
	gamemode_gettype
	if (<type> = career)
		if NOT progression_check_intro_complete
			if ($transition_playing = true)
				if ($current_playing_transition = careerintro)
					return
				endif
			endif
		endif
	endif
	if NOT gameispaused
		if ($transition_playing = true)
			if (($current_playing_transition = songlost) || ($current_playing_transition = songwon))
				disable_pause
				return
			endif
		endif
	endif
	if ui_event_exists_in_stack \{above = 'gameplay'
			name = 'song_unpause'}
		return
	endif
	printf \{qs(0xf173f764)}
	if gameispaused
		if ($is_attract_mode = 0)
			printf \{'KeepControllersAlive - unpause'}
			keepcontrollersalive
		endif
	endif
	spawnscriptnow gh3_start_pressed params = {<...> from_handler}
endscript
