
script ui_create_online_quit_warning player_device = ($primary_controller)
	if NOT gotparam \{confirm_script}
		confirm_script = confirm_quit_online
	endif
	if NOT gotparam \{quit_script}
		quit_script = generic_event_back
	endif
	destroyscreenelement \{id = popup_warning_container}
	create_popup_warning_menu {
		title = qs(0xaa163738)
		textblock = {
			text = qs(0x3be02ff6)
		}
		parent = root_window
		no_background
		options = [
			{
				func = <quit_script>
				text = qs(0xf7723015)
			}
			{
				func = <confirm_script>
				text = qs(0x67d9c56d)
			}
		]
		player_device = <player_device>
	}
	assignalias id = <menu_id> alias = online_quit_menu
	launchevent \{type = focus
		target = online_quit_menu}
	if gotparam \{callback}
		online_quit_menu :settags {callback = <callback>}
	endif
	if gotparam \{callback_params}
		online_quit_menu :settags callback_params = <callback_params>
	endif
endscript

script ui_destroy_online_quit_warning 
	destroy_popup_warning_menu
endscript

script confirm_quit_online 
	spawn_player_drop_listeners \{drop_player_script = nullscript
		end_game_script = nullscript}
	create_loading_screen \{wait}
	online_quit_menu :gettags
	if gotparam \{callback}
		if gotparam \{callback_params}
			spawnscriptnow <callback> params = <callback_params>
		else
			spawnscriptnow <callback>
		endif
	endif
	gamemode_gettype
	if (<type> = career)
		if ($net_band_mode_menu = host)
			change \{is_network_game = 0}
			generic_event_back \{state = uistate_group_play}
			return
		else
			if ishost
				change \{net_band_mode_menu = host}
			else
				change \{net_band_mode_menu = join}
			endif
		endif
	else
		change \{net_new_matchmaking_ui_flag = 0}
	endif
	net_clear_all_remote_player_status
	quit_network_game_early
	destroy_all_exploding_text
	change \{net_pause = 0}
	if (<type> = career)
		change \{num_local_players = 0}
		quit_career_back_to_lobby
	else
		unpausegame
		if (<type> = quickplay)
			getglobaltags \{user_options}
			if (<autosave> = 1)
				ui_memcard_autosave_replace \{event = menu_back
					state = uistate_online
					data = {
						0x6d221ff1
					}}
			else
				unpausegame
				generic_event_back \{state = uistate_online}
			endif
		else
			generic_event_back \{state = uistate_online}
		endif
	endif
endscript

script quit_career_back_to_lobby 
	change \{num_players_in_band = 0}
	change \{net_band_members = [
		]}
	change \{net_num_joiners = 0}
	change \{0x0c2faa8d = 0}
	change \{career_matchmaking_complete = 0}
	found_state = 0
	ui_event_get_stack
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'band_mode')
		<found_state> = 1
		break
	endif
	i = (<i> + 1)
	repeat <stack_size>
	if (<found_state> = 1)
		generic_event_back data = {num_states = (<i> + 1)}
	else
		generic_event_back \{state = uistate_mainmenu}
	endif
	unpausegame
endscript
