
script ui_create_boot_download_scan 
	printf \{qs(0xea128e57)}
	change \{menu_flow_play_sound = 0}
	if ($downloadcontent_enabled = 0)
		spawnscriptnow \{ui_event_wait
			params = {
				event = menu_replace
				data = {
					state = uistate_mainmenu_intro
				}
			}}
		return
	endif
	change store_respond_to_signin_changed = ($respond_to_signin_changed)
	change \{respond_to_signin_changed = 1}
	GetPlatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = qs("Checking the HDD. Do not switch off your system.")
			}
			player_device = <controller>
		}
		case xenon
		create_popup_warning_menu {
			textblock = {
				text = qs("Checking for downloadable content. Please don't turn off your Xbox 360 console.")
			}
			player_device = <controller>
		}
		case ngc
		create_popup_warning_menu \{textblock = {
				text = $wii_check_dlc
			}}
	endswitch
	spawnscriptnow boot_download_scan params = {controller = <controller> <...>}
endscript

script boot_download_scan \{event_params = {
			event = menu_replace
			data = {
				state = uistate_mainmenu_intro
			}
		}}
	Wait \{1
		gameframes}
	Downloads_EnumContent controller = <controller>
	get_current_first_play
	Wait \{2
		seconds}
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	spawnscriptnow ui_event_wait params = <event_params>
	change respond_to_signin_changed = ($store_respond_to_signin_changed)
endscript

script ui_destroy_boot_download_scan 
	destroy_popup_warning_menu
endscript
