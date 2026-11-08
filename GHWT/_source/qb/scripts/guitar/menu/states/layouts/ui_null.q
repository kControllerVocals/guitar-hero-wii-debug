
script ui_create_null \{object = 1}
	if NOT CD
		if ScreenElementExists \{id = root_window}
			if (<object> = 1)
				spawnscriptnow \{ui_null_warning_spawned}
			endif
		endif
	endif
endscript

script ui_destroy_null 
	if NOT CD
		if ScreenElementExists \{id = root_window}
			KillSpawnedScript \{name = ui_null_warning_spawned}
			destroy_popup_warning_menu
		endif
	endif
endscript

script ui_null_warning_spawned 
	Wait \{5
		seconds}
	create_popup_warning_menu \{textblock = {
			text = qs("\Luistate_null entered. This usually implies menu_back was called on a state that didn't exist in the current stack.")
			dims = (600.0, 400.0)
			scale = 0.6
		}
		menu_pos = (640.0, 480.0)
		options = [
			{
				func = {
					generic_event_choose
					params = {
						state = UIstate_mainmenu
						data = {
							clear_previous_stack
						}
					}
				}
				text = qs(0xb100a40e)
			}
		]
		use_all_controllers}
endscript
