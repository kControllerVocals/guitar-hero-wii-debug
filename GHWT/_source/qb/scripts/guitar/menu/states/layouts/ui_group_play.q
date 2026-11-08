
script ui_create_group_play 
	change \{band_mode_menu_tags = none}
	spawnscriptnow ui_create_group_play_spawned params = <...>
endscript

script ui_create_group_play_spawned 
	change \{rich_presence_context = presence_menus}
	cas_reset_random_human_picking
	frontend_load_soundcheck \{loadingscreen}
	cas_destroy_all_characters
	make_menu_frontend \{title = qs("BAND")
		use_all_controllers
		pad_back_script = ui_group_play_back}
	if has_enough_controllers_for_band
		add_menu_frontend_item \{text = qs("BAND PLAY")
			pad_choose_script = ui_group_play_select_local}
		<window_id> :obj_spawnscript ui_group_play_poll_for_band_mode params = {local_mode_allowed = 1}
	else
		add_menu_frontend_item \{text = qs("BAND PLAY")
			pad_choose_script = ui_group_play_select_local
			rgba = [
				50
				44
				35
				255
			]}
		<window_id> :obj_spawnscript ui_group_play_poll_for_band_mode params = {local_mode_allowed = 0}
	endif
	<window_id> :SetTags local_mode_id = <item_id>
	if has_only_regular_controller_no_mic
		add_menu_frontend_item \{text = $wii_band_join_online
			pad_choose_script = ui_group_play_select_online_career
			pad_choose_params = {
				action = join
			}
			rgba = [
				50
				44
				35
				255
			]}
	else
		add_menu_frontend_item \{text = $wii_band_join_online
			pad_choose_script = ui_group_play_select_online_career
			pad_choose_params = {
				action = join
			}}
	endif
	<window_id> :SetTags join_id = <item_id>
	if has_only_regular_controller_no_mic
		add_menu_frontend_item \{text = $wii_band_host_online
			pad_choose_script = ui_group_play_select_online_career
			pad_choose_params = {
				action = HOST
			}
			rgba = [
				50
				44
				35
				255
			]}
	else
		add_menu_frontend_item \{text = $wii_band_host_online
			pad_choose_script = ui_group_play_select_online_career
			pad_choose_params = {
				action = HOST
			}}
	endif
	menu_finish
	ui_event \{event = menu_replace
		data = {
			state = uistate_group_play
		}}
endscript

script ui_destroy_group_play 
	generic_ui_destroy
endscript

script ui_group_play_select_local 
	change \{is_network_game = 0}
	NetSessionFunc \{func = RemoveAllControllers}
	if has_only_regular_controller_no_mic
		if isXenon
			ui_event \{event = menu_change
				data = {
					is_popup
					state = UIstate_generic_alert_popup
					title = qs("Warning")
					text = qs(0x2ded972d)
				}}
		else
			ui_event \{event = menu_change
				data = {
					is_popup
					state = UIstate_generic_alert_popup
					title = qs("Warning")
					text = $wii_plug_in_mic
				}}
		endif
	elseif are_multiple_controllers_connected
		ui_event \{event = menu_change
			data = {
				state = UIstate_band_mode
			}}
	else
		ui_event \{event = menu_change
			data = {
				is_popup
				state = UIstate_generic_alert_popup
				title = qs("Warning")
				text = qs("You must have at least two controllers plugged in to continue.")
			}}
	endif
endscript

script ui_group_play_select_online_career 
	change \{num_local_players = 0}
	if NOT has_only_regular_controller_no_mic
		check_net_privaleges action = <action> device_num = <device_num>
	else
		if isXenon
			ui_event \{event = menu_change
				data = {
					is_popup
					state = UIstate_generic_alert_popup
					title = qs("Warning")
					text = qs(0x2ded972d)
				}}
		else
			ui_event \{event = menu_change
				data = {
					is_popup
					state = UIstate_generic_alert_popup
					title = qs("Warning")
					text = $wii_plug_in_mic
				}}
		endif
	endif
endscript

script ui_group_play_select_host 
	ui_group_play_select_join action = <action>
endscript

script ui_group_play_back 
	change \{is_network_game = 0}
	generic_event_back
endscript

script check_net_privaleges 
	printf \{qs("\Lcheck_net_privaleges")}
	RequireParams \{[
			device_num
			action
		]
		all}
	printf qs(0x37917242) d = <device_num>
	if IsLoggedIn
		change \{game_mode = p4_career}
		NetOptions :Pref_Choose \{name = game_modes
			checksum = p4_career}
		ui_event event = menu_change data = {state = uistate_net_setup action = <action> controller = <device_num>}
	else
		ui_event \{event = menu_change
			data = {
				state = UIstate_net_signin_popup
				is_popup
			}}
	endif
endscript

script are_multiple_controllers_connected 
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	endif
	GetActiveControllers
	GetArraySize <active_controllers>
	total_active = 0
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		<total_active> = (<total_active> + 1)
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_size>
	if (<total_active> > 1)
		return \{true}
	endif
	return \{false}
endscript

script ui_group_play_poll_for_band_mode 
	begin
	if NOT has_enough_controllers_for_band
		if (<local_mode_allowed> = 1)
			ui_event \{event = menu_replace
				data = {
					state = uistate_group_play
				}}
			Block
		endif
	else
		if (<local_mode_allowed> = 0)
			ui_event \{event = menu_replace
				data = {
					state = uistate_group_play
				}}
			Block
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script has_only_regular_controller_no_mic 
	if ($allow_controller_for_all_instruments = 1)
		return \{false}
	endif
	get_num_mics_plugged_in
	if (<num_mics_plugged_in> > 0)
		return \{false}
	endif
	GetActiveControllers
	GetArraySize <active_controllers>
	total_active = 0
	controller_index = 0
	begin
	if (<active_controllers> [<controller_index>] = 1)
		<total_active> = (<total_active> + 1)
		if NOT is_regular_controller controller = <controller_index>
			return \{false}
		elseif controller_has_headset controller = <controller_index>
			return \{false}
		endif
	endif
	<controller_index> = (<controller_index> + 1)
	repeat <array_size>
	return \{true}
endscript

script has_enough_controllers_for_band 
	if are_multiple_controllers_connected
		if NOT has_only_regular_controller_no_mic
			return \{true}
		endif
	endif
	return \{false}
endscript
