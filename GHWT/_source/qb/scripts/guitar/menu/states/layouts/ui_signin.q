signin_continue_state = uistate_mainmenu_intro
signin_continue_data = {
}
signin_jam_mode = 0
alternative_primary_selected = -1

script ui_init_signin 
	change \{signin_continue_state = uistate_mainmenu_intro}
	change \{signin_continue_data = {
		}}
	change \{respond_to_signin_changed = 0}
	change \{alternative_primary_selected = -1}
endscript

script ui_create_signin \{new_data = {
		}}
	if GotParam \{new_state}
		change signin_continue_state = <new_state>
		change signin_continue_data = <new_data>
	endif
	spawnscriptnow ui_signin_check params = <...>
endscript

script ui_destroy_signin 
	destroy_popup_warning_menu
endscript

script ui_deinit_signin 
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
endscript

script assign_new_primary_controller 
	if ($primary_controller_assigned = 0)
		first_press = 1
	endif
	change primary_controller = <device_num>
	change \{primary_controller_assigned = 1}
	change structurename = player1_status controller = ($primary_controller)
	change globalname = player1_device newvalue = ($primary_controller)
	if GotParam \{first_press}
		change \{respond_to_signin_changed_func = ui_signin_changed_first_press}
		memcard_secondary_signin_first_press
	endif
	NetSessionFunc \{func = RemoveAllControllers}
	NetSessionFunc func = AddControllers params = {controller = <device_num>}
endscript

script ui_signin_changed_first_press 
	printf \{qs("\Lui_signin_changed_first_press")}
	if NOT (<controller> = $primary_controller)
		if IsLocallySignedIn controller = <controller>
			printf \{qs("\Lalternative primary controller selected")}
			change alternative_primary_selected = <controller>
		endif
	endif
endscript
ps3_done_signin_check = 0

script ui_signin_check \{primary = 1
		force_signin = 0}
	change \{enable_saving = 1}
	if ($invite_controller != -1)
		printf 'Load soundcheck for non-primary player invite - controller %c' c = ($invite_controller)
		frontend_load_soundcheck \{loadingscreen
			async = 0}
	endif
	if (<primary> = 1)
		if GotParam \{device_num}
			assign_new_primary_controller device_num = <device_num>
		endif
	endif
	if IsPs3
		if ($ps3_done_signin_check = 1)
			if GotParam \{require_live}
				if NOT CheckForSignIn controller_index = <device_num>
					ui_event_wait event = menu_replace data = {state = uistate_signin_warning allow_back = <allow_back> require_live = <require_live>}
					return
				endif
			endif
			if NOT GotParam \{jam}
				if current_band_has_band_name controller = <device_num>
					destroy_popup_warning_menu
					ui_event_wait event = menu_replace state = $signin_continue_state data = ($signin_continue_data)
					return
				endif
			endif
			ui_signin_process_complete
			<callback> <callback_params>
			return
		endif
		change \{ps3_done_signin_check = 1}
	endif
	if isXenon
		ui_signin_process_complete
		<callback> <callback_params>
	elseif ((isps2) || (IsNgc))
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_memcard
			}}
	else
		ui_event_wait \{event = menu_replace
			data = {
				state = UIstate_signin_complete
			}}
	endif
endscript

script ui_signin_process_complete \{controller = -1}
	RefreshSigninStatus
	if (<controller> = -1)
		controller = ($primary_controller)
	endif
	if isXenon
		StartGameProfileSettingsRead
		begin
		if GameProfileSettingsFinished
			break
		endif
		repeat
	endif
	start_checking_for_signin_change
	if ChecksumEquals a = ($signin_continue_state) b = uistate_mainmenu_intro
		callback = ui_event
		callback_params = {event = menu_replace data = {state = uistate_memcard}}
	else
		callback = ui_memcard_autoload
		callback_params = {this_event = menu_replace state = $signin_continue_state data = ($signin_continue_data)}
	endif
	ui_event_wait_for_safe
	return callback = <callback> callback_params = <callback_params>
endscript

script ui_create_signin_complete 
	create_signin_complete_menu
endscript

script ui_destroy_signin_complete 
	destroy_signin_complete_menu
endscript

script ui_create_signin_warning 
	create_signin_warning_menu <...>
endscript

script ui_destroy_signin_warning 
	destroy_signin_warning_menu
endscript

script ui_signin_warning_back 
	change \{force_mainmenu_signin = 1}
	generic_event_back
endscript

script ui_signin_handle_warnings 
	if NOT ($alternative_primary_selected = -1)
		device_num = ($alternative_primary_selected)
		change \{alternative_primary_selected = -1}
		assign_new_primary_controller device_num = <device_num>
	endif
	if GotParam \{require_live}
		if NOT CheckForSignIn controller_index = <device_num>
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
			return \{warnings = 1}
		elseif NetSessionFunc func = XenonIsGuest params = {controller_index = <device_num>}
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
			return \{warnings = 1}
		endif
	endif
	if GotParam \{downloads}
		if NOT CheckForSignIn local controller_index = <device_num>
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> downloads = <downloads>}
			return \{warnings = 1}
		endif
	endif
	if NOT CheckForSignIn local controller_index = <device_num>
		ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> jam = <jam> boot = <boot>}
		return \{warnings = 1}
	endif
	return \{warnings = 0}
endscript
