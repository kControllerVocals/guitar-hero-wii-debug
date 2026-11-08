top_rockers_enabled = 0

script ui_init_top_rockers_mode 
	change \{top_rockers_enabled = 1}
endscript

script ui_return_top_rockers_mode 
	menu_finish
endscript

script ui_create_top_rockers_mode 
	change lb_controller = ($primary_controller)
	make_menu_frontend \{screen = Guitarist
		title = qs("LEADERBOARDS")
		title_pos = (-30.0, 60.0)
		title_dims = (600.0, 200.0)
		pos = (-40.0, 0.0)
		item_scale = 1.2}
	if isXenon
		add_menu_frontend_item {
			text = qs("Xbox LIVE:")
			rgba = (($g_menu_colors).menu_subhead)
			not_focusable
		}
	else
		add_menu_frontend_item {
			text = $wii_wifi_colon
			rgba = (($g_menu_colors).menu_subhead)
			not_focusable
			item_height = 75
		}
	endif
	add_menu_frontend_item \{text = qs("SONGS")
		pad_choose_script = check_leaderboards_online
		pad_choose_params = {
			pass_script = ui_leaderboard_group_select
			params = {
				group = song
			}
		}
		item_height = 75}
	add_menu_frontend_item \{text = qs("CAREER")
		pad_choose_script = check_leaderboards_online
		pad_choose_params = {
			pass_script = ui_leaderboard_group_select
			params = {
				group = career
			}
		}
		item_height = 75}
	add_menu_frontend_item \{text = qs("ROCK RANK")
		pad_choose_script = check_leaderboards_online
		pad_choose_params = {
			pass_script = ui_leaderboard_list_cash
			params = {
			}
		}
		item_height = 75}
	add_menu_frontend_item {
		text = qs("LOCAL:")
		rgba = (($g_menu_colors).menu_subhead)
		not_focusable
		item_height = 75
	}
	add_menu_frontend_item \{text = qs("TOP ROCKERS")
		pad_choose_script = setup_top_rockers_single
		item_height = 75}
	menu_finish
endscript

script check_leaderboards_online 
	if NOT IsLoggedIn
		ui_event \{event = menu_change
			data = {
				state = UIstate_net_signin_popup
				is_popup
			}}
		return
	else
		<pass_script> <params>
	endif
endscript

script ui_destroy_top_rockers_mode 
	generic_ui_destroy
endscript

script ui_deinit_top_rockers_mode 
	change \{top_rockers_enabled = 0}
endscript
