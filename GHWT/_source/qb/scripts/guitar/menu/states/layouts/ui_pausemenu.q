
script ui_init_pausemenu 
	if ($is_network_game)
		EnableAllInput \{off}
	endif
	if ScreenElementExists \{id = celeb_intro_ui_cont}
		celeb_intro_ui_cont :SE_SetProps \{alpha = 0.0
			time = 0.1}
	endif
endscript

script ui_create_pausemenu \{for_practice = 0}
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = pause_drop_player
			end_game_script = pause_end_game}
	endif
	enable_pause
	player_device = ($last_start_pressed_device)
	player = 1
	i = 1
	begin
	GetPlayerInfo <i> controller
	if (<controller> = <player_device>)
		player = <i>
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	SoundEvent \{event = Pause_Menu_SFX}
	vocals_mute_all_mics \{mute = true}
	if NOT ($guitar_motion_enable_test = 1)
		if (<controller> >= 4)
			title_text = qs("AUTOPLAY PAUSED")
		else
			if ($g_in_tutorial = 1)
				title_text = <tutorial_pause_title>
			else
				title_text = qs("PAUSED")
			endif
			if NOT isSinglePlayerGame
				FormatText TextName = title_text qs("P%p PAUSED") p = <player>
			endif
		endif
		if ($g_in_tutorial = 1)
			if (<tutorial_failed> = 0)
				<pad_back_script> = tutorial_resume
			else
				<pad_back_script> = nullscript
			endif
		else
			<pad_back_script> = ui_pausemenu_exit
		endif
		ui_pausemenu_create_bg title_text = <title_text>
		if pausemenu_bg :Desc_ResolveAlias \{name = alias_menu}
			<parent> = <resolved_id>
		endif
		make_menu {
			parent = <parent>
			centered_offset = (-400.0, -275.0)
			pad_back_script = <pad_back_script>
			exclusive_device = <player_device>
			extra_z = 600
			centered
			spacing_between = -10
			noBG
		}
	else
		make_menu {
			pad_back_script = ui_pausemenu_exit
			exclusive_device = <player_device>
			centered
			noBG
			centered_offset = (400.0, 0.0)
			spacing_between = 0
		}
	endif
	if ($special_event_stage != 0)
		if ($current_special_event_num = 1)
			format_time_from_seconds time = ($total_special_event_time)
			total_time = <time_formatted>
			GetSpecialEventTimer
			format_time_from_seconds time = <time>
			time_left = <time_formatted>
			FormatText TextName = Timer_text qs("STUDIO TIME: %a (%b)") a = <total_time> b = <time_left>
			add_menu_item {
				text = <Timer_text>
				not_focusable
			}
			format_time_from_seconds time = ($special_event_total_expense_time / 1000)
			add_menu_item {
				text = (qs("SECTION LENGTH: ") + <time_formatted>)
				not_focusable
			}
			add_menu_item \{text = qs("RESUME")
				pad_choose_script = ui_pausemenu_exit}
			add_menu_item \{text = qs("START AGAIN")
				pad_choose_script = paused_special_event_start_again}
			add_menu_item \{text = qs("QUIT SEGMENT")
				pad_choose_script = paused_special_event_quit_segment}
			add_menu_item \{text = qs("QUIT CHALLENGE")
				pad_choose_script = paused_special_event_quit_challenge}
		elseif ($current_special_event_num = 2)
			GetSpecialEventTimer
			format_time_from_seconds time = <time>
			add_menu_item {
				text = (qs("TIME LEFT: ") + <time_formatted>)
				not_focusable
			}
			continue_practicing_text = qs("CONTINUE PRACTICING")
			if ($special_event_stage = 2)
				<continue_practicing_text> = qs("RESUME TEST")
			endif
			add_menu_item {
				text = <continue_practicing_text>
				pad_choose_script = ui_pausemenu_exit
			}
			if ($special_event_stage = 1)
				add_menu_item \{text = qs("TAKE THE TEST")
					pad_choose_script = special_event_2_ingame_setup}
			endif
			add_menu_item \{text = qs("QUIT CHALLENGE")
				pad_choose_script = paused_special_event_quit_challenge}
		endif
	else
		if ($g_in_tutorial = 1)
			if (<tutorial_failed> = 1)
				add_menu_item \{text = qs("RETRY")
					pad_choose_script = tutorial_restart}
				add_menu_item \{text = qs("SKIP LESSON")
					pad_choose_script = tutorial_skip_lesson}
			else
				add_menu_item \{text = qs("RESUME")
					pad_choose_script = tutorial_resume}
				add_menu_item \{text = qs("RESTART")
					pad_choose_script = tutorial_restart_warning}
				add_menu_item \{text = qs("SKIP LESSON")
					pad_choose_script = tutorial_skip_lesson}
			endif
		else
			add_menu_item \{text = qs("RESUME")
				pad_choose_script = ui_pausemenu_exit}
			if ($is_network_game = 0)
				if ($battle_do_or_die = 0)
					if ($end_credits = 0)
						add_menu_item \{text = qs("RESTART")
							choose_state = uistate_pausemenu_restart_warning}
					endif
				endif
			endif
		endif
		if (<for_practice> = 1 || $game_mode = training)
			if NOT PlayerInfoEquals \{1
					part = Vocals}
				add_menu_item \{text = qs("CHANGE SPEED")
					choose_state = uistate_pausemenu_quit_warning
					choose_state_data = {
						option2_text = qs("CHANGE SPEED")
						option2_func = {
							quit_warning_select_quit
							params = {
								callback = generic_event_back
								data = {
									state = uistate_practice_select_speed
								}
							}
						}
					}}
			endif
			add_menu_item \{text = qs("CHANGE SECTION")
				choose_state = uistate_pausemenu_quit_warning
				choose_state_data = {
					option2_text = qs("CHANGE SECTION")
					option2_func = {
						quit_warning_select_quit
						params = {
							callback = generic_event_back
							data = {
								state = uistate_select_song_section
							}
						}
					}
				}}
			if ($came_to_practice_from = main_menu)
				add_menu_item \{text = qs("NEW SONG")
					choose_state = uistate_pausemenu_quit_warning
					choose_state_data = {
						option2_text = qs("NEW SONG")
						option2_func = {
							quit_warning_select_quit
							params = {
								callback = song_ended_menu_select_new_song
							}
						}
					}}
			endif
			add_menu_item {
				text = qs("OPTIONS")
				choose_state = uistate_pause_options
				choose_state_data = {player_device = <player_device> player = <player>}
			}
		elseif NOT ($g_in_tutorial = 1)
			if ($is_network_game = 0)
				GameMode_GetType
				if ($current_song = jamsession)
					if NOT ui_event_exists_in_stack \{name = 'jam'}
						if (<type> = quickplay)
							if ($num_quickplay_song_list > 1)
								add_menu_item \{choose_state = uistate_pausemenu_quit_warning
									choose_state_data = {
										option2_text = qs("SKIP SONG")
										option2_func = quickplay_skip_song
										failed_song
									}
									text = qs("SKIP SONG")}
							endif
						endif
					endif
				else
					if NOT ($game_mode = p2_pro_faceoff || $game_mode = p2_faceoff || $game_mode = p2_battle)
						if ($end_credits = 0)
							add_menu_item {
								text = qs("DIFFICULTY")
								choose_state = UIstate_pausemenu_change_difficulty
								choose_state_data = {player_device = <player_device> player = <player>}
							}
						endif
					endif
					if (<type> = quickplay)
						if ($num_quickplay_song_list > 1)
							add_menu_item \{choose_state = uistate_pausemenu_quit_warning
								choose_state_data = {
									option2_text = qs("SKIP SONG")
									option2_func = quickplay_skip_song
									failed_song
								}
								text = qs("SKIP SONG")}
						endif
					endif
					if ($current_num_players = 1)
						if ($end_credits = 0)
							add_menu_item \{text = qs("PRACTICE")
								choose_state = uistate_practice_warning}
						endif
					endif
				endif
				if ($end_credits = 0)
					if ($battle_do_or_die = 0)
						add_menu_item {
							text = qs("OPTIONS")
							choose_state = uistate_pause_options
							choose_state_data = {player_device = <player_device> player = <player>}
						}
					endif
				endif
			endif
		endif
		quit_script = generic_event_choose no_sound = no_sound
		quit_script_params = {state = uistate_pausemenu_quit_warning}
		if ($is_in_debug)
			if ($end_credits = 1)
				quit_script = debug_quitcredits
				quit_script_params = {}
			else
				quit_script = generic_event_back
				quit_script_params = {state = uistate_debug}
			endif
		elseif ($is_network_game = 1)
			quit_script = select_quit_network_game
			quit_script_params = {}
		elseif ($g_in_tutorial = 1)
			quit_script = tutorial_quit_warning
			quit_script_params = {}
		endif
		if ($end_credits = 0)
			add_menu_item {
				text = qs("QUIT")
				pad_choose_script = <quit_script>
				pad_choose_params = <quit_script_params>
			}
		endif
	endif
	if ($enable_debug = 1)
		add_menu_item \{text = qs("\LDebug Menu")
			choose_state = uistate_debug
			choose_state_data = {
				from_gameplay = 1
			}
			scale = (0.4, 0.36)}
	endif
	if ($g_in_tutorial = 1)
		if (<tutorial_failed> = 0)
			<event_handlers> = [{pad_start tutorial_resume}]
			current_menu :SE_SetProps event_handlers = <event_handlers>
		else
			menu_finish \{no_back_button = 1}
			return
		endif
	endif
	menu_finish
endscript

script ui_destroy_pausemenu 
	generic_ui_destroy
	ui_pausemenu_destroy_bg
	if ScreenElementExists \{id = celeb_intro_ui_cont}
		celeb_intro_ui_cont :SE_SetProps \{alpha = 1.0
			time = 0.1}
	endif
endscript

script ui_deinit_pausemenu 
	if ($is_network_game)
		EnableAllInput
	endif
endscript

script ui_pausemenu_exit 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	if Is_ui_event_running
		return
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :SE_SetProps \{block_events}
	endif
	Wait \{1
		gameframe}
	handle_pause_event \{force}
endscript

script ui_pausemenu_create_bg 
	CreateScreenElement {
		parent = root_window
		id = pausemenu_bg
		type = DescInterface
		desc = 'pause_menu'
		title_text = <title_text>
		alpha = 0
	}
	RunScriptOnScreenElement id = <id> ui_pausemenu_animate_in
endscript

script ui_pausemenu_destroy_bg 
	SoundEvent \{event = Pause_Menu_Exit_SFX}
	if ScreenElementExists \{id = pausemenu_bg}
		pausemenu_bg :Die
	endif
endscript

script ui_pausemenu_animate_in 
	SoundEvent \{event = Pause_Menu_Enter_SFX}
	Desc_ResolveAlias \{name = alias_pause_fist_container}
	SE_SetProps \{alpha = 1}
	<resolved_id> :SE_SetProps pos = (100.0, 800.0)
	<resolved_id> :SE_SetProps pos = (0.0, 0.0) time = 0.2 motion = ease_in
	<resolved_id> :SE_WaitProps
	<resolved_id> :SE_SetProps pos = (20.0, 40.0) time = 0.2 motion = ease_out
	<resolved_id> :SE_WaitProps
	<resolved_id> :SE_SetProps pos = (0.0, 0.0) time = 0.2 motion = ease_in
	<resolved_id> :SE_WaitProps
	begin
	SE_SetProps glow_alpha = Random (@ 0.4 @ 0.6 @ 0.8 )time = Random (@ 0.2 @ 0.3 @ 0.4 )motion = Random (@ ease_in @ ease_out )
	SE_WaitProps
	repeat
endscript

script EnableAllInput 
	i = 1
	begin
	GetPlayerInfo <i> controller
	if GotParam \{off}
		EnableInput controller = <controller> off
	else
		EnableInput controller = <controller>
	endif
	i = (<i> + 1)
	repeat $current_num_players
endscript

script ui_return_pausemenu 
	if ($is_network_game)
		add_gamertag_helper \{exclusive_device = $last_start_pressed_device}
		menu_finish
	endif
endscript

script pause_drop_player 
	printf \{qs("\L---pause_drop_player")}
	spawnscriptnow unpause_and_drop_player params = <...>
endscript

script unpause_and_drop_player 
	gameplay_drop_player <...>
endscript

script pause_end_game 
	printf \{qs("\L---pause_end_game")}
	spawnscriptnow unpause_and_endgame params = <...>
endscript

script unpause_and_endgame 
	ui_pausemenu_exit
	gameplay_end_game <...>
endscript
