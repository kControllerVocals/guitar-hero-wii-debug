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
	if gotparam \{new_state}
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
	if gotparam \{first_press}
		change \{respond_to_signin_changed_func = ui_signin_changed_first_press}
		memcard_secondary_signin_first_press
	endif
	netsessionfunc \{func = removeallcontrollers}
	netsessionfunc func = addcontrollers params = {controller = <device_num>}
endscript

script ui_signin_changed_first_press 
	printf \{qs(0x23492f74)}
	if NOT (<controller> = $primary_controller)
		if islocallysignedin controller = <controller>
			printf \{qs(0xac06c05e)}
			change alternative_primary_selected = <controller>
		endif
	endif
endscript
ps3_done_signin_check = 0

script ui_signin_check \{primary = 1
		force_signin = 0
		boot = 0}
	change \{enable_saving = 1}
	if ($invite_controller != -1)
		printf 'Load soundcheck for non-primary player invite - controller %c' c = ($invite_controller)
		frontend_load_soundcheck \{loadingscreen
			async = 0}
	endif
	if (<primary> = 1)
		if gotparam \{device_num}
			assign_new_primary_controller device_num = <device_num>
		endif
	endif
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_memcard
		}}
endscript

script ui_signin_process_complete \{controller = -1}
	refreshsigninstatus
	if (<controller> = -1)
		controller = ($primary_controller)
	endif
	if isxenon
		startgameprofilesettingsread controller = <controller>
		begin
		if gameprofilesettingsfinished controller = <controller>
			break
		endif
		repeat
	endif
	start_checking_for_signin_change
	if checksumequals a = ($signin_continue_state) b = uistate_mainmenu_intro
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

script ui_init_signin_warning 
	change store_respond_to_signin_changed = ($respond_to_signin_changed)
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_func = ui_signin_changed_func}
	change \{alternative_primary_selected = -1}
endscript

script ui_create_signin_warning 
	create_signin_warning_menu <...>
endscript

script ui_destroy_signin_warning 
	destroy_signin_warning_menu
endscript

script ui_deinit_signin_warning 
	change respond_to_signin_changed = ($store_respond_to_signin_changed)
	change \{respond_to_signin_changed_func = none}
endscript

script ui_signin_warning_back 
	change \{force_mainmenu_signin = 1}
	generic_event_back \{nosound}
endscript

script ui_signin_handle_warnings 
	if NOT ($alternative_primary_selected = -1)
		device_num = ($alternative_primary_selected)
		change \{alternative_primary_selected = -1}
		assign_new_primary_controller device_num = <device_num>
	endif
	if gotparam \{require_live}
		if NOT checkforsignin controller_index = <device_num>
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
			return \{warnings = 1}
		elseif netsessionfunc func = xenonisguest params = {controller_index = <device_num>}
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> require_live = <require_live>}
			return \{warnings = 1}
		endif
	endif
	if gotparam \{downloads}
		if NOT checkforsignin local controller_index = <device_num>
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> downloads = <downloads>}
			return \{warnings = 1}
		endif
	endif
	if NOT checkforsignin local controller_index = <device_num>
		ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> jam = <jam> boot = <boot>}
		return \{warnings = 1}
	endif
	if gotparam \{jam}
		if netsessionfunc func = xenonisguest params = {controller_index = <device_num>}
			ui_event_wait event = menu_replace data = {state = uistate_signin_warning player_device = <device_num> allow_back = <allow_back> jam = <jam> boot = <boot>}
			return \{warnings = 1}
		endif
	endif
	return \{warnings = 0}
endscript
