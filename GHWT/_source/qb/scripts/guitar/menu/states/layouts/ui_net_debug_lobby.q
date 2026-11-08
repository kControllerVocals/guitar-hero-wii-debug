
script ui_create_net_debug_lobby \{mode = HOST}
	if (<mode> = HOST)
		text = qs("Host")
	else
		text = qs("Client")
	endif
	make_menu {
		title = (<text> + qs(" waiting for players"))
		menu_bg = menu_bg_1
		noTitleBG
		centered
		centered_offset = (0.0, 200.0)
	}
	if NOT (<mode> = HOST)
		SetScreenElementProps \{id = current_menu
			event_handlers = [
				{
					pad_square
					al_refresh
				}
			]}
	endif
	menu_finish
endscript

script ui_destroy_net_debug_lobby 
	generic_ui_destroy
endscript

script ui_create_net_debug_lobby_join \{server_name = qs("\Lunknown")}
	make_menu {
		title = (qs("Joining ") + <server_name>)
		menu_bg = menu_bg_1
		noTitleBG
		centered
		centered_offset = (0.0, 200.0)
	}
endscript

script ui_destroy_net_debug_lobby_join 
	generic_ui_destroy
endscript
