
script ui_create_net_zero_search_results_popup 
	create_popup_warning_menu {
		title = qs("Searching")
		textblock = {
			text = qs("Couldn't find any bands. Do you want to search again?")
		}
		options = [
			{
				func = refresh_band_search
				text = qs("SEARCH")
			}
			{
				func = cancel_net_career_mode_search
				text = qs("CANCEL")
			}
		]
		no_background
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back cancel_net_career_mode_search}
		]
		player_device = <device_num>
	}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
endscript

script ui_destroy_net_zero_search_results_popup 
	destroy_popup_warning_menu
endscript

script ui_deinit_net_zero_search_results_popup 
	destroy_popup_warning_menu
endscript

script refresh_band_search 
	Obj_GetID
	<ObjID> :SE_SetProps block_events
	NetSessionFunc \{obj = match
		func = stop_server_list}
	cancel_join_server
	destroy_popup_warning_menu
	ui_create_net_career_join_popup device_num = <device_num>
endscript
