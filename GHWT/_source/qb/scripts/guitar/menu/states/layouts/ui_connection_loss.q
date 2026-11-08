
script ui_create_connection_loss \{no_options = 0}
	printf \{qs("\Lui_create_connection_loss")}
	printstruct <...>
	destroy_popup_warning_menu
	if (<no_options> = 0)
		options = [
			{
				func = ui_connection_loss_continue
				text = qs("CONTINUE")
				scale = (1.0, 1.0)
			}
		]
	endif
	if isXenon
		text = qs("You must be signed in to Xbox LIVE to continue.")
	else
		text = qs("You must be signed in to the PLAYSTATION®Network to continue.")
	endif
	if GotParam \{cable_unplugged}
		text = qs("Your network connection has been disconnected. Returning to the main menu.")
	elseif GotParam \{lost_lobby_connection}
		text = qs("You have lost connection to the Lobby Server. Returning to the main menu.")
	endif
	create_popup_warning_menu {
		title = qs("CONNECTION LOST")
		title_props = {scale = 1.0}
		textblock = {
			text = <text>
			pos = (640.0, 380.0)
		}
		menu_pos = (600.0, 475.0)
		options = <options>
		use_all_controllers
	}
endscript

script ui_destroy_connection_loss 
	destroy_popup_warning_menu
endscript

script ui_deinit_connection_loss 
	change \{g_connection_loss_dialogue = 0}
endscript

script ui_connection_loss_continue 
	destroy_popup_warning_menu
	generic_event_choose \{state = UIstate_mainmenu
		data = {
			clear_previous_stack
		}}
endscript
