
script career_enter_band_name_flow_state_func 
	get_current_first_play
	if (<first_play>)
		return \{flow_state = main_menu_fs}
	else
		return \{flow_state = career_choose_band_fs}
	endif
endscript

script get_current_first_play 
	get_band_game_mode_name
	FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
	GetGlobalTags <bandname_id>
	return first_play = <first_play>
endscript

script career_select_difficulty_flow_state_func 
	if ($game_mode = p1_career)
		register_new_progression_atoms
	endif
	get_current_first_play
	generic_event_choose \{data = {
			state = UIstate_singleplayer_character_hub
			player = 1
		}}
endscript

script lefty_flip_func 
	GetGlobalTags \{user_options}
	change structurename = player1_status lefthanded_gems = <lefty_flip_p1>
	change structurename = player1_status lefthanded_button_ups = <lefty_flip_p1>
	if (<lefty_flip_p1>)
		change \{pad_event_up_inversion = true}
	else
		change \{pad_event_up_inversion = false}
	endif
	change structurename = player2_status lefthanded_gems = <lefty_flip_p2>
	change structurename = player2_status lefthanded_button_ups = <lefty_flip_p2>
	if ($game_mode = training)
		practice_restart_song
	else
		career_restart_song
	endif
endscript

script career_restart_song 
	KillSpawnedScript \{name = GuitarEvent_SongWon_Spawned}
	KillSpawnedScript \{name = Failed_Song_Pitch_Down}
	destroy_menu \{menu_id = yourock_text}
	destroy_menu \{menu_id = yourock_text_2}
	destroy_menu \{menu_id = yourock_text_legend}
	restart_song
endscript

script career_song_ended_select_quit 
	if ($debug_playcredits_active = 1)
		change \{debug_playcredits_active = 0}
	endif
	kill_gem_scroller <...>
endscript

script start_encore 
	printf \{qs("\Lstart_encore")}
	if ($is_network_game = 0)
		xenon_singleplayer_session_init
	endif
	GetGlobalTags \{Progression
		params = encore_song}
	SetGlobalTags Progression params = {current_tier = <next_tier>}
	SetGlobalTags Progression params = {current_song_count = <next_song_count>}
	if ($is_network_game = 1)
		change current_song = <encore_song>
		change \{net_ready_to_start = 0}
	else
		change current_song = <encore_song>
	endif
endscript
default_loading_screen = {
	create = create_loading_screen
	destroy = destroy_loading_screen
}

script should_play_boss_intro 
	if NOT GotParam \{song}
		song = ($current_song)
	endif
	return_val = false
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_bayou
		if (<song> = bosszakk)
			return_val = true
		endif
		case z_fairgrounds
		if (<song> = bossted)
			return_val = true
		endif
	endswitch
	return <return_val>
endscript

script start_boss 
	disable_pause
	destroy_loading_screen
	create_loading_screen \{mode = play_boss}
	GetGlobalTags \{Progression
		params = boss_song}
	SetGlobalTags Progression params = {current_tier = <next_tier>}
	SetGlobalTags Progression params = {current_song_count = <next_song_count>}
	if ($show_boss_helper_screen = 1)
		change \{current_transition = boss}
	else
		change \{current_transition = fastintro}
	endif
	change \{boss_battle = 1}
	change \{current_num_players = 2}
	spawnscriptnow restart_gem_scroller params = {song_name = <boss_song> difficulty = ($player1_status.difficulty) difficulty2 = ($player2_status.difficulty) StartTime = ($current_starttime) device_num = ($player1_status.controller)}
endscript

script get_current_battle_first_play 
	FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
	GetGlobalTags <bandname_id>
	return first_battle_play = <first_battle_play>
endscript

script set_current_battle_first_play \{first_play = 0}
	FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
	SetGlobalTags <bandname_id> params = {first_battle_play = <first_play>}
	GetGlobalTags <bandname_id>
endscript
