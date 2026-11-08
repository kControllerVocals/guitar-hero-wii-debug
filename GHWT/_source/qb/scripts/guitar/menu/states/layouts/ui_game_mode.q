
script ui_create_game_mode \{mode = career}
	reset_character_ids
	sanity_check_fix_deleted_characters
	band_builder_clear_random_appearances
	change \{game_mode = p1_quickplay}
	change \{current_num_players = 1}
	change \{in_join_band_screens = 0}
	change \{first_character_hub_enter = 1}
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_func = main_menu_signin_changed}
	clear_exclusive_devices
	change \{band_mode_menu_tags = none}
	change \{band_mode_mode = none}
	if (<mode> = career)
		choose_script = game_mode_select_career
		text = qs("CAREER")
	else
		choose_script = game_mode_select_quickplay
		text = qs("QUICKPLAY")
	endif
	spawnscriptnow game_mode_make_menu params = {<...>}
endscript

script ui_return_game_mode 
	clean_up_user_control_helpers
	add_user_control_helper \{text = $wii_RA_select
		button = green}
	add_user_control_helper \{text = $wii_back
		button = red}
endscript

script ui_destroy_game_mode 
	generic_ui_destroy
endscript

script game_mode_make_menu 
	make_menu_frontend {
		pad_back_script = ui_game_mode_back
		title = <text>
		use_all_controllers
	}
	add_menu_frontend_item text = qs("SINGLE") pad_choose_script = <choose_script>
	if (<mode> = quickplay)
		if are_multiple_controllers_connected
			add_menu_frontend_item text = qs("BAND") pad_choose_script = <choose_script> pad_choose_params = {Band}
			<window_id> :obj_spawnscript ui_game_mode_poll_for_band_mode params = {band_mode_allowed = 1 mode = <mode>}
		else
			add_menu_frontend_item text = qs("BAND") pad_choose_script = <choose_script> pad_choose_params = {Band} rgba = [50 44 35 255]
			<window_id> :obj_spawnscript ui_game_mode_poll_for_band_mode params = {band_mode_allowed = 0 mode = <mode>}
		endif
	else
		add_menu_frontend_item text = qs("BAND") pad_choose_script = <choose_script> pad_choose_params = {Band}
		<window_id> :obj_spawnscript ui_game_mode_poll_for_band_mode params = {band_mode_allowed = 0 mode = <mode>}
	endif
	add_menu_frontend_item \{text = qs("TRAINING")
		pad_choose_script = set_primary_controller
		pad_choose_params = {
			state = uistate_select_practice_mode
		}}
	menu_finish
	ui_event_spawned \{event = menu_focus}
endscript

script game_mode_select_career 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	if NOT GotParam \{Band}
		change \{game_mode = p1_career}
		change \{current_num_players = 1}
		change \{structurename = player1_status
			part = guitar}
		change structurename = player1_status controller = <device_num>
		change globalname = player1_device newvalue = <device_num>
		change primary_controller = <device_num>
		change \{structurename = player2_status
			part = guitar}
		change \{band_mode_mode = none}
	else
		change \{game_mode = p2_career}
		change \{current_num_players = 2}
		change \{band_mode_mode = career}
		change \{in_join_band_screens = 1}
		generic_event_choose \{state = uistate_group_play}
		return
	endif
	if ($band_mode_mode = none)
		change \{respond_to_signin_changed = 1}
		change \{respond_to_signin_changed_func = none}
		set_primary_controller device_num = <device_num> state = uistate_select_instrument
	elseif ($band_mode_mode = career)
		ui_memcard_secondary_siginin_load \{state = UIstate_band_mode}
	endif
endscript

script game_mode_select_quickplay 
	if NOT GotParam \{Band}
		change \{game_mode = p1_quickplay}
		change \{current_num_players = 1}
		change structurename = player1_status controller = <device_num>
		change globalname = player1_device newvalue = <device_num>
		change primary_controller = <device_num>
		change \{respond_to_signin_changed = 1}
		change \{respond_to_signin_changed_func = none}
		set_primary_controller device_num = <device_num> state = uistate_select_instrument
	else
		if NOT are_multiple_controllers_connected
			ui_event \{event = menu_change
				data = {
					is_popup
					state = UIstate_generic_alert_popup
					title = qs("Warning")
					text = qs("You must have at least two controllers plugged in to continue.")
				}}
			return
		else
			change \{band_mode_mode = quickplay}
			change \{game_mode = p2_quickplay}
			change \{current_num_players = 2}
			change \{in_join_band_screens = 1}
			ui_memcard_secondary_siginin_load \{state = UIstate_band_mode}
		endif
	endif
endscript

script ui_game_mode_back 
	generic_event_back
endscript

script ui_game_mode_poll_for_band_mode 
	begin
	if NOT are_multiple_controllers_connected
		if (<band_mode_allowed> = 1)
			printf \{qs(0x9c4f2af0)}
			ui_event event = menu_replace data = {state = uistate_game_mode mode = <mode>}
			Block
		endif
	else
		if (<band_mode_allowed> = 0)
			printf \{qs(0xa5d7d6dd)}
			ui_event event = menu_replace data = {state = uistate_game_mode mode = <mode>}
			Block
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript
