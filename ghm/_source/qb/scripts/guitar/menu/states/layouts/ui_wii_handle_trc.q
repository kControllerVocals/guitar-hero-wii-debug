
script ui_create_wii_handle_trc \{event_params = {
			event = menu_back
		}}
	caller_event_params = (<event_params>.event_params)
	caller_type = (<event_params>.type)
	printstruct <...>
	createscreenelement {
		type = containerelement
		parent = root_window
		id = current_menu
		pos = (0.0, 0.0)
		just = [left center]
		z_priority = 0
		tags = {
			type = <caller_type>
			event_params = <caller_event_params>
		}
	}
	show_wii_handle_trc <...> separate_state = 1
endscript

script show_wii_handle_trc \{separate_state = 0}
	if isngc
		if structurecontains \{structure = event_params
				memcard_status}
			memcard_status = (<event_params>.memcard_status)
			printf qs(0xceb16a92) s = <memcard_status>
			printstruct <memcard_status>
			switch <memcard_status>
				case corrupt_boot
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_corrupt_boot_fs
				case load_corrupt_ingame
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_load_corrupt_ingame_fs
				case load_no_save_boot
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_load_no_save_boot_ingame_fs
				case load_no_save_ingame
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_load_no_save_ingame_fs
				case insufficient_space_boot
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_space_boot_fs
				case insufficient_space_ingame
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_space_ingame_fs
				case insufficient_space_jam
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_space_jam_fs
				case insufficient_inode_boot
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_inode_boot_fs
				case insufficient_inode_ingame
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_inode_ingame_fs
				case insufficient_inode_jam
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_inode_jam_fs
				case save_error_boot
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_save_error_boot_fs
				case save_error_ingame
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_save_error_ingame_fs
				case insufficient_space_boot_wfc_only
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_space_boot_wfc_only_fs
				case insufficient_inode_boot_wfc_only
				script_func = refresh_wii_trc_menu
				script_param = $wii_memcard_insufficient_inode_boot_wfc_only_fs
				case delete_error_ingame
				script_func = wii_memcard_saveload_complete
				window_header = qs(0x902ddf05)
				window_message = delete_failed
				script_param = {create_params = {header = <window_header> message = <window_message>}}
				case choose_proper_using_guitar_screen
				case press_any_button
				case success
				window_header = qs(0x9853e050)
				if ($memcardsavingorloading = loading)
					window_message = load_successful
				elseif ($memcardsavingorloading = deleting)
					window_message = delete_successful
				else
					window_message = save_successful
				endif
				script_func = wii_memcard_saveload_complete
				script_param = {create_params = {header = <window_header> message = <window_message>}}
				case none
				ui_memcard_finish \{success = wii}
				default
				scriptassert \{qs(0x772214d4)}
			endswitch
		endif
		if structurecontains \{structure = event_params
				mii_lib_status}
			mii_lib_status = (<event_params>.mii_lib_status)
			printf \{qs(0x78499ec8)
				s = mii_lib_status}
			switch (<mii_lib_status>)
				case corrupt
				script_func = refresh_wii_trc_menu
				script_param = $wii_mii_lib_corrupt
				default
				scriptassert \{qs(0x58dc5be7)}
			endswitch
		endif
		if structurecontains \{structure = event_params
				menu_to_load}
			menu_to_load = (<event_params>.menu_to_load)
			switch (<menu_to_load>)
				case overwrite_menu
				script_func = refresh_wii_trc_menu
				script_param = (wii_memcard_overwrite_warning_ingame_fs)
			endswitch
		endif
		if gotparam \{script_param}
			printstruct <script_param>
			params_script = (<script_param>.create_params)
			if gotparam \{0x6d221ff1}
				params_script = {<params_script> 0x6d221ff1}
			endif
			spawnscriptnow <script_func> params = (<params_script>)
		endif
	endif
endscript

script ui_destroy_wii_handle_trc 
	if screenelementexists \{id = current_menu}
		current_menu :die
	endif
	memcard_sequence_cleanup_generic
	if isngc
		if screenelementexists \{id = wii_trc_container}
			destroy_wii_trc_menu
		endif
	endif
endscript

script ui_wii_trc_handle_action \{action = unknown_action
		ingame = 1
		check_for_space = 0
		boot = 0}
	if screenelementexists \{id = wii_trc_container}
		destroy_wii_trc_menu
	endif
	switch <action>
		case continue_to_menu
		if (<no_space_wfc> = 1)
			wii_memcard_load \{boot = 1}
			wii_scan_jamsession_files \{force = 1}
		endif
		ui_memcard_finish \{success = wii}
		case delete_file
		if (<ingame> = 1)
			wii_replace_file_ingame
		else
			wii_replace_file
		endif
		ui_memcard_finish \{success = wii}
		case delete_all_file
		wii_replace_file \{0x67f4a21c}
		ui_memcard_finish \{success = wii}
		case disable_autosave
		wii_disable_autosave header = qs(0xb3d16ef9) message = disable_autosave boot = <boot>
		ui_memcard_finish \{success = wii}
		case disable_saveload
		change \{enable_saving = 0}
		change \{enable_loading = 0}
		change \{disable_wifi = 1}
		if (<boot> = 1)
			ui_memcard_finish \{success = wii
				boot_disable_saveload}
		else
			ui_memcard_finish \{success = wii}
		endif
		case leave_saveload_flow
		memcard_cleanup_messages
		if gotparam \{0x6d221ff1}
			ui_memcard_finish \{success = wii
				0x6d221ff1}
		else
			ui_memcard_finish \{success = wii}
		endif
		case load
		spawnscriptlater ui_memcard_load params = {this_event = menu_replace event = menu_back check_for_space = <check_for_space> boot = <boot>}
		case load_complete
		wii_memcard_saveload_complete \{header = qs(0x9853e050)
			message = load_successful}
		ui_memcard_finish \{success = wii}
		case overwrite_warning
		ui_event \{event = menu_replace
			data = {
				state = uistate_wii_handle_trc
				event_params = {
					menu_to_load = overwrite_menu
				}
			}}
		case save
		spawnscriptlater ui_memcard_save params = {check_for_space = <check_for_space> boot = <boot>}
		case save_complete
		wii_memcard_saveload_complete \{header = qs(0x9853e050)
			message = save_successful}
		ui_memcard_finish \{success = wii}
		case jam_failed
		memcard_cleanup_messages
		ui_memcard_finish \{failed = wii}
		case wii_menu
		wii_goto_system_menu
		ui_memcard_finish \{success = wii}
		case generic_back
		ui_event \{event = menu_back}
	endswitch
endscript

script 0x724c4dfb 
	if NOT screenelementexists \{id = 0x0243084d}
		createscreenelement {
			type = textelement
			parent = <parent_id>
			id = 0x0243084d
			text = qs(0x28a2b598)
			font = fontgrid_text_a6
			rgba = [200 200 200 255]
			scale = 1
			just = [left top]
			pos = (605.0, 450.0)
			z_priority = <z_priority>
		}
		spawnscriptnow \{0x35e662c1}
	endif
endscript

script 0x35e662c1 
	0x4113f513 = 0
	begin
	if NOT screenelementexists \{id = 0x0243084d}
		break
	endif
	0x4113f513 = (<0x4113f513> + 1)
	new_text = qs(0xcfca9e55)
	switch (<0x4113f513>)
		case 1
		new_text = qs(0xefb47879)
		case 2
		new_text = qs(0x57fce4b9)
		case 3
		new_text = qs(0x28a2b598)
		0x4113f513 = 0
	endswitch
	setscreenelementprops id = 0x0243084d text = <new_text>
	wait \{0.5
		seconds}
	repeat
endscript
