
script ui_create_boot_download_scan 
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
	getplatform
	switch <platform>
		case ps3
		create_popup_warning_menu {
			textblock = {
				text = qs(0x75e1afbf)
			}
			player_device = <controller>
		}
		case xenon
		create_popup_warning_menu {
			textblock = {
				text = qs(0xeef4272c)
			}
			player_device = <controller>
		}
		case ngc
		create_popup_warning_menu \{textblock = {
				text = qs(0xe5e5b51e)
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
	wait \{1
		gameframes}
	downloads_enumcontent controller = <controller>
	get_current_first_play
	wait \{2
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
