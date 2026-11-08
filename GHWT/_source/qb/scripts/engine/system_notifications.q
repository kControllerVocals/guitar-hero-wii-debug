paused_for_hardware = 0
blade_active = 0
pause_no_render = 0
sysnotify_wait_in_progress = 0
xenon_device_checked = -1
rocking_out_too_hard = 0

script sysnotify_wait_until_safe 
	begin
	<should_wait> = 0
	if SystemUIDelayed
		<should_wait> = 1
		printf \{qs("\LWAITING FOR SYSTEM UI")}
	endif
	if IsTrue \{$is_changing_levels}
		<should_wait> = 1
		printf \{qs("\LWAITING FOR ISCHANGINGLEVELS")}
	endif
	if IsTrue \{$igc_playing}
		<should_wait> = 1
		printf \{qs("\LWAITING FOR IGC")}
	endif
	if NOT CutsceneFinished \{name = cutscene}
		<should_wait> = 1
		printf \{qs("\LWAITING FOR CUTSCENE")}
	endif
	if ($ui_pro_success_screen_active = 0)
		if ScreenElementExists \{id = screenfader}
			<should_wait> = 1
			printf \{qs("\LWAITING FOR SCREENFADER")}
		endif
	endif
	if NOT GotParam \{ignore_connection_loss}
		if ScriptIsRunning \{sysnotify_handle_connection_loss}
			<should_wait> = 1
		endif
	endif
	if (<should_wait> = 1)
		change \{sysnotify_wait_in_progress = 1}
		Wait \{0.1
			seconds}
	else
		change \{sysnotify_wait_in_progress = 0}
		return
	endif
	repeat
endscript

script sysnotify_handle_pause_eject 
	PauseGh3Sounds \{no_seek}
	SetButtonEventMappings \{block_menu_input}
	sysnotify_handle_pause <...> seek_on_unpause
endscript

script sysnotify_handle_disconnect_mic 
	printf \{qs(0x1401745a)}
	printf \{qs(0x4deb27bc)}
	printf \{qs(0x1401745a)}
endscript

script sysnotify_handle_connect_mic 
	printf \{qs("\L----------------------------")}
	printf \{qs(0x0e8a25c1)}
	printf \{qs("\L----------------------------")}
endscript

script sysnotify_handle_pause_microphone 
	if IsNgc
		notify_box \{container_id = notify_controller_static_text_container
			line1 = $wii_rocking_too_hard
			line2 = $wii_microphone_unplugged
			menu_z = 510000}
		if (RenderingEnabled)
			change \{pause_no_render = 0}
			fade_overlay_on
		else
			change \{pause_no_render = 1}
			startrendering
			fade_overlay_on \{alpha = 1.0}
		endif
		SetButtonEventMappings \{block_menu_input}
	endif
	sysnotify_handle_pause <...>
endscript
sysnotify_paused_controllers = [
]

script sysnotify_handle_pause_controller \{is_mic = 0}
	SetScriptCannotPause
	printf \{qs("\L---------------------------------")}
	printf \{qs("\Lsysnotify_handle_pause_controller")}
	printf \{qs("\L---------------------------------")}
	if ($freestyle_active = 1)
		return
	endif
	if ui_event_exists_in_stack \{name = 'jam'}
		if NOT ui_event_exists_in_stack \{name = 'gameplay'}
			if NOT ($playing_song_for_real = 1)
				return
			endif
		endif
	endif
	get_player_num_from_controller controller_index = <device_num>
	if (<player_num> != -1)
		GetPlayerInfo <player_num> part
		if ((<part> = Vocals) && (<is_mic> = 0))
			printf \{'Ignoring vocal controller'}
			return
		endif
	endif
	GetArraySize \{$sysnotify_paused_controllers}
	original_array_size = <array_size>
	if (<array_size> > 0)
		i = 0
		begin
		if (($sysnotify_paused_controllers [<i>]) = <device_num>)
			return
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	array = $sysnotify_paused_controllers
	AddArrayElement array = <array> element = <device_num>
	change sysnotify_paused_controllers = <array>
	if (<original_array_size> > 0)
		return
	endif
	if ($g_in_tutorial = 0)
		if NOT ($playing_song)
			return
		endif
	endif
	if ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'song_unpause'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'fail_song'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'song_breakdown'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'controller_disconnect'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'options_calibrate_lag_warning'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'encore_confirmation'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu_quit_warning'}
		return
	elseif ($g_tutorial_pause_is_up = 1)
		tutorial_close_pause_window \{dont_unpause}
	elseif ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
		return
	elseif NOT ($MemcardDoneScript = nullscript)
		return
	endif
	KillSpawnedScript \{name = sysnotify_handle_pause_controller_spawned}
	spawnscriptnow sysnotify_handle_pause_controller_spawned params = {<...>}
endscript

script sysnotify_handle_pause_controller_spawned 
	wait_required = 0
	begin
	if NOT ScreenElementExists \{id = loading_screen_background}
		if (<wait_required> = 1)
			Wait \{30
				gameframes}
		endif
		break
	endif
	wait_required = 1
	Wait \{1
		gameframe}
	repeat
	ui_event event = menu_change state = uistate_controller_disconnect data = {device_num = <device_num> is_popup}
endscript

script sysnotify_handle_pause_console 
	printf \{qs("\L------------------------------")}
	printf \{qs("\Lsysnotify_handle_pause_console")}
	printf \{qs("\L------------------------------")}
	if isps2
		if (RenderingEnabled)
			change \{pause_no_render = 0}
			fade_overlay_on \{alpha = 1.0}
		else
			if ($is_changing_levels = 0)
				change \{pause_no_render = 1}
			endif
			startrendering
			fade_overlay_on \{alpha = 1.0}
		endif
	endif
	sysnotify_handle_pause <...>
endscript

script sysnotify_handle_pause 
	printf \{qs("\L----------------------")}
	printf \{qs("\Lsysnotify_handle_pause")}
	printf \{qs("\L----------------------")}
	if ($allow_console_pause_for_cal_lag = 1)
		setup_calibration_lag_none
		ui_event \{event = menu_refresh}
	endif
	if ($paused_for_hardware = 1)
		return
	endif
	if (($is_network_game) || ($g_connection_loss_dialogue))
		return
	endif
	SetButtonEventMappings \{block_menu_input}
	sysnotify_wait_until_safe
	ui_event_wait_for_safe
	change \{paused_for_hardware = 1}
	change \{blade_active = 1}
	if GameIsPaused
		printf \{qs("\LGame is already paused")}
		if ui_event_exists_in_stack \{above = 'gameplay'
				name = 'song_unpause'}
			ui_song_unpause_repause \{from_system}
		endif
		return
	endif
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	if ScriptIsRunning \{GuitarEvent_SongWon_Spawned}
		return
	endif
	if ($is_attract_mode = 1)
		return
	endif
	if ($g_in_tutorial = 1)
		if NOT ScreenElementExists \{id = popup_warning_container}
			show_training_pause_screen <...>
		endif
	else
		if ($playing_song = 1)
			do_gh3_pause
		endif
	endif
endscript

script sysnotify_handle_unpause_eject 
	if isps2
		kill_notify_box \{container_id = notify_eject_static_text_container}
		if ($pause_no_render = 1)
			change \{pause_no_render = 0}
			stoprendering
		endif
		fade_overlay_off
	endif
	if (($is_network_game) || ($g_connection_loss_dialogue))
		UnpauseGh3Sounds \{seek_on_unpause}
	endif
	SetButtonEventMappings \{unblock_menu_input}
	sysnotify_handle_unpause <...> seek_on_unpause
endscript

script sysnotify_handle_unpause_microphone 
	if ((isps2) || (IsNgc))
		change \{rocking_out_too_hard = 0}
		kill_notify_box \{container_id = notify_controller_static_text_container}
		if ($pause_no_render = 1)
			change \{pause_no_render = 0}
			stoprendering
		endif
		fade_overlay_off
		SetButtonEventMappings \{unblock_menu_input}
	endif
	sysnotify_handle_unpause <...>
endscript

script sysnotify_handle_unpause_controller \{is_mic = 0}
	printf \{qs("\L-----------------------------------")}
	printf \{qs("\Lsysnotify_handle_unpause_controller")}
	printf \{qs("\L-----------------------------------")}
	if ($freestyle_active = 1)
		return
	endif
	get_player_num_from_controller controller_index = <device_num>
	if (<player_num> != -1)
		GetPlayerInfo <player_num> part
		if ((<part> = Vocals) && (<is_mic> = 0))
			printf \{'Ignoring vocal controller'}
			return
		endif
	endif
	GetArraySize \{$sysnotify_paused_controllers}
	if (<array_size> > 0)
		i = 0
		begin
		if (($sysnotify_paused_controllers [<i>]) = <device_num>)
			array = $sysnotify_paused_controllers
			RemoveArrayElement array = <array> index = <i>
			change sysnotify_paused_controllers = <array>
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<i> = <array_size>)
			return
		endif
	endif
	GetArraySize \{$sysnotify_paused_controllers}
	if (<array_size> > 0)
		return
	endif
	if NOT ($playing_song)
		return
	endif
endscript

script sysnotify_handle_unpause_console 
	printf \{qs("\L--------------------------------")}
	printf \{qs("\Lsysnotify_handle_unpause_console")}
	printf \{qs("\L--------------------------------")}
	if isps2
		if ($pause_no_render = 1)
			change \{pause_no_render = 0}
			stoprendering
		endif
		fade_overlay_off
		ReAcquireControllers
	endif
	sysnotify_handle_unpause <...>
endscript

script sysnotify_handle_unpause 
	printf \{qs("\L------------------------")}
	printf \{qs("\Lsysnotify_handle_unpause")}
	printf \{qs("\L------------------------")}
	change \{wait_for_sysnotify_unpause_flag = 1}
	SetButtonEventMappings \{unblock_menu_input}
	sysnotify_wait_until_safe
	if ($end_credits = 1)
		do_gh3_unpause
	endif
	ui_event_wait_for_safe
	change \{paused_for_hardware = 0}
	change \{blade_active = 0}
	if (($is_network_game) || ($g_connection_loss_dialogue))
		return
	endif
	if ShouldGameBePausedDueToSysNotification
		return
	endif
	if NOT GameIsPaused
		return
	elseif ($is_attract_mode = 1)
		return
	elseif ($g_in_tutorial = 1)
		return
	elseif ($end_credits = 1)
		do_gh3_unpause
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'controller_disconnect'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'pausemenu_quit_warning'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'song_breakdown'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'fail_song'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'options_calibrate_lag'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'options_calibrate_lag_warning'}
		return
	elseif ui_event_exists_in_stack \{above = 'gameplay'
			name = 'encore_confirmation'}
		return
	endif
	if ($playing_song = 1)
		GetGlobalTags \{user_options
			param = unpause_count}
		if (<unpause_count> = 0)
			do_gh3_unpause
		else
			ui_event_wait \{event = menu_change
				data = {
					state = uistate_song_unpause
				}}
		endif
	endif
endscript
fade_overlay_count = 0
ps3_fade_overlay_z = 509000

script fade_overlay_on \{alpha = 0.9}
	if ((isps2) || (IsNgc))
		if NOT ScreenElementExists \{id = pause_fader}
			CreateScreenElement {
				type = SpriteElement
				id = pause_fader
				parent = root_window
				texture = black
				rgba = [0 0 0 255]
				pos = (640.0, 360.0)
				dims = (1280.0, 720.0)
				just = [center center]
				z_priority = $ps3_fade_overlay_z
				alpha = <alpha>
			}
		endif
		printscriptinfo \{'fade_overlay_on'}
		change fade_overlay_count = ($fade_overlay_count + 1)
		if ($fade_overlay_count > 16)
			ScriptAssert \{'fade_overlay_count is suspiciously high'}
		endif
	endif
endscript

script fade_overlay_off 
	if ((isps2) || (IsNgc))
		printscriptinfo \{'fade_overlay_off'}
		if ($fade_overlay_count <= 0)
			return
		endif
		change fade_overlay_count = ($fade_overlay_count - 1)
		if ($fade_overlay_count <= 0)
			if ScreenElementExists \{id = pause_fader}
				DestroyScreenElement \{id = pause_fader}
			endif
		endif
	endif
endscript
signin_change_happening = 0

script sysnotify_handle_signin_change 
	printf \{qs("\L--------------------------------")}
	printf qs("\Lsysnotify_handle_signin_change %d") d = <controller>
	printf \{qs("\L--------------------------------")}
	change \{invite_controller = -1}
	if ($signin_change_happening = 1)
		printf \{qs("\LALREADY BEING PROCESSED")}
		return
	endif
	change \{signin_change_happening = 1}
	sysnotify_wait_until_safe
	if ($ui_x360_sign_in_checked = 1)
		change \{ui_x360_sign_in_checked = 0}
		change \{signin_change_happening = 0}
		return
	endif
	switch <message>
		case live_connection_lost
		if NOT ($is_network_game)
			change \{signin_change_happening = 0}
			return
		else
			sysnotify_handle_connection_loss
		endif
		case live_connection_gained
		if (($playing_song) && ($is_network_game = 0))
			xenon_singleplayer_session_init
			change \{signin_change_happening = 0}
			return
		else
			change \{signin_change_happening = 0}
			return
		endif
		case user_changed
		printf \{qs("\Lsysnotify_handle_signin_change - user changed")}
		if ($respond_to_signin_changed = 1)
			if (<controller> = ($primary_controller))
				printf \{qs("\Lsysnotify_handle_signin_change - user changed - primary")}
				handle_signin_changed
			elseif ($respond_to_signin_changed_all_players = 1)
				printf \{qs(0x9c177bb4)}
				GameMode_GetNumPlayersShown
				index = 1
				begin
				FormatText checksumname = player_status 'player%d_status' d = <index>
				printstruct <...>
				if ($<player_status>.controller = <controller>)
					printf qs("\Lsysnotify_handle_signin_change - user changed - secondary %i %c") i = <index> c = <controller>
					handle_signin_changed
				endif
				index = (<index> + 1)
				repeat <num_players_shown>
			endif
		else
			if NOT ($respond_to_signin_changed_func = none)
				func = ($respond_to_signin_changed_func)
				<func> <...>
			endif
		endif
		default
		printf \{qs("\L- no response required")}
		change \{signin_change_happening = 0}
		return
	endswitch
	change \{signin_change_happening = 0}
endscript
sysnotify_allow_invite = 1

script sysnotify_handle_game_invite 
	printf \{qs("\L----------------------------")}
	printf \{qs("\Lsysnotify_handle_game_invite")}
	printf \{qs("\L----------------------------")}
	sysnotify_invite_go <...>
endscript

script sysnotify_invite_cancel 
	sysnotify_handle_unpause
	dialog_box_exit
endscript

script sysnotify_invite_go 
	printf \{qs("\L----sysnotify_invite_go")}
	if GotParam \{cross_game}
		cross_game_invite_accepted <...>
	else
		sysnotify_wait_until_safe
		invite_accepted <...>
	endif
endscript

script cross_game_invite_accepted 
endscript
g_connection_loss_dialogue = 0

script sysnotify_handle_connection_loss 
	printf \{qs("\L--------------------------------")}
	printf \{qs("\Lsysnotify_handle_connection_loss")}
	printf \{qs("\L--------------------------------")}
	printstruct <...>
	change \{g_connection_loss_dialogue = 1}
	destroy_player_drop_events
	change \{net_ready_to_start = 1}
	sysnotify_wait_until_safe \{ignore_connection_loss}
	wait_for_safe_shutdown
	displaySprite \{parent = root_window
		tex = boot_brick_bg
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z = 95}
	disable_pause
	cleanup_sessionfuncs
	xboxlive_lost_connection_ui_cleanup
	ui_event_block event = menu_replace data = {state = uistate_connection_loss clear_previous_stack <...>}
	<id> :Die
endscript

script notify_box \{scale1 = 0.75
		scale2 = 0.6
		container_pos = (0.0, 0.0)}
	if ScreenElementExists id = <container_id>
		return
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = root_window
		id = <container_id>
		pos = <container_pos>
	}
	menu_font = fontgrid_title_a1
	if GotParam \{line3}
		displaySprite parent = <container_id> tex = dialog_menu_bg pos = (640.0, 24.0) scale = (3.0, 2.0) z = <menu_z> just = [center top]
		displaySprite parent = <container_id> tex = dialog_menu_bg flip_h pos = (640.0, 120.0) scale = (3.0, 2.0) z = <menu_z> just = [center top]
	else
		displaySprite parent = <container_id> tex = dialog_menu_bg pos = (640.0, 32.0) scale = (3.0, 1.5) z = <menu_z> just = [center top]
		displaySprite parent = <container_id> tex = dialog_menu_bg flip_h pos = (640.0, 112.0) scale = (3.0, 1.5) z = <menu_z> just = [center top]
	endif
	CreateScreenElement {
		type = TextElement
		parent = <container_id>
		font = <menu_font>
		scale = <scale1>
		rgba = [180 50 50 255]
		text = <line1>
		just = [center top]
		z_priority = (<menu_z> + 0.2)
		pos = (640.0, 80.0)
	}
	CreateScreenElement {
		type = TextElement
		parent = <container_id>
		font = <menu_font>
		scale = <scale2>
		rgba = [0 0 0 255]
		text = <line2>
		just = [center top]
		z_priority = (<menu_z> + 0.2)
		pos = (640.0, 124.0)
	}
	if GotParam \{line3}
		CreateScreenElement {
			type = TextElement
			parent = <container_id>
			font = <menu_font>
			scale = <scale2>
			rgba = [0 0 0 255]
			text = <line3>
			just = [center top]
			z_priority = (<menu_z> + 0.2)
			pos = (640.0, 160.0)
		}
	endif
endscript

script kill_notify_box \{container_id = notify_static_text_container}
	if ScreenElementExists id = <container_id>
		DestroyScreenElement id = <container_id>
	endif
endscript
wait_for_sysnotify_unpause_flag = 0

script wait_for_sysnotify_unpause 
	change \{wait_for_sysnotify_unpause_flag = 0}
	printf \{qs("\LWaiting for sysnotify Pause Off")
		channel = sysnotify}
	begin
	printf qs("\LWaiting for sysnotify paused_for_hardware = %i") i = ($paused_for_hardware) channel = sysnotify
	if (($wait_for_sysnotify_unpause_flag = 1) && ($paused_for_hardware = 0))
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script xboxlive_lost_connection_ui_cleanup 
	if ($is_network_game)
		cancel_join_server
		destroy_connection_dialog_scroller
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = 20000
			id = invite_screenfader}
		Wait \{1
			gameframe}
		stoprendering
		shutdown_game_for_signin_change \{unloadcontent = 0}
		startrendering
		Wait \{60
			gameframes}
		fadetoblack \{off
			time = 0
			id = invite_screenfader}
		Wait \{1
			gameframe}
	endif
endscript

script sysnotify_handle_pause_mic 
	stars
	printf \{'sysnotify_handle_pause_mic'}
	printstruct <...>
	stars
	if isps2
		if NOT ($playing_song)
			return
		endif
	endif
	ui_event_wait event = menu_change state = uistate_mic_disconnect data = {controller = <device_num>}
endscript

script sysnotify_handle_unpause_mic 
	stars
	printf \{'sysnotify_handle_unpause_mic'}
	printstruct <...>
	stars
	if isps2
		if NOT ($playing_song)
			return
		endif
	endif
endscript
