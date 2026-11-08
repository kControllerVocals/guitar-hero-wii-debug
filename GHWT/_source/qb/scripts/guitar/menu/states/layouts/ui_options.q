
script ui_create_options 
	change \{rich_presence_context = presence_menus}
	change \{respond_to_signin_changed = 1}
	change \{respond_to_signin_changed_func = none}
	make_menu_frontend \{screen = Guitarist
		title = qs("OPTIONS")
		spacing_between = 0
		item_scale = 1.1
		title_pos = (-25.0, 40.0)
		pos = (-30.0, -40.0)}
	add_menu_frontend_item \{text = $wii_DLC_visit_RA
		pad_choose_script = main_menu_select_rock_archive}
	add_menu_frontend_item \{text = qs("SETTINGS")
		choose_state = uistate_options_settings}
	add_menu_frontend_item \{text = qs("BAND INFO")
		choose_state = uistate_band_name_logo
		choose_state_data = {
			skip_destroy
		}}
	add_menu_frontend_item \{text = $wii_friend_roster
		pad_choose_script = launch_offline_friends_list}
	add_menu_frontend_item \{text = qs("LEADERBOARDS")
		choose_state = UIstate_top_rockers_mode}
	add_menu_frontend_item \{text = qs("CALIBRATE LAG")
		choose_state = UIstate_options_calibrate_lag}
	if NOT current_band_has_band_name
		<item_id> :SE_SetProps not_focusable text_rgba = [64 64 64 255]
	endif
	add_menu_frontend_item \{text = qs("SAVE / LOAD")
		choose_state = uistate_options_data}
	add_menu_frontend_item \{text = qs("VIDEOS")
		choose_state = uistate_bonus_videos}
	add_menu_frontend_item \{text = qs("CHEATS")
		choose_state = uistate_options_cheats}
	add_menu_frontend_item \{text = qs("GUITARHERO.COM")
		choose_state = UIstate_guitarhero_com}
	NetSessionFunc \{func = get_agora_token}
	if NOT GotParam \{token_valid}
		<item_id> :SE_SetProps not_focusable text_rgba = [64 64 64 255]
	elseif (<token_valid> = 0)
		<item_id> :SE_SetProps not_focusable text_rgba = [64 64 64 255]
	endif
	menu_finish
endscript

script ui_destroy_options 
	generic_ui_destroy
endscript

script ui_options_get_controller_type controller = ($primary_controller)
	type = guitar
	text = qs("GUITAR")
	if NOT IsGuitarController controller = <controller>
		type = Drums
		text = qs("DRUM")
		if NOT IsDrumController controller = <controller>
			type = Vocals
			text = qs("VOCAL")
		endif
	endif
	return {type = <type> text = <text>}
endscript

script ui_options_set_settings 
	if ScreenElementExists \{id = current_menu}
		GetGlobalTags \{user_options}
		current_menu :SetTags {user_options = <...>}
	endif
endscript

script ui_options_check_settings 
	RemoveParameter \{event}
	RemoveParameter \{controller}
	if NOT ($playing_song)
		if ScreenElementExists \{id = current_menu}
			GetGlobalTags \{user_options}
			new_user_options = <...>
			current_menu :GetSingleTag \{user_options}
			if GotParam \{user_options}
				if NOT CompareStructs struct1 = <new_user_options> struct2 = <user_options>
					spawnscriptnow \{ui_memcard_autosave_replace}
					return
				endif
			endif
		endif
	endif
	generic_event_back
endscript

script ui_options_leaderboard_choose 
	if NOT CheckForSignIn controller_index = ($primary_controller)
		if ScreenElementExists \{id = user_control_container}
			user_control_container :SE_SetProps \{alpha = 0}
		endif
		create_generic_popup \{ok_menu
			title = $wii_error
			message = $wii_options_leaderboard_choose
			ok_eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					ui_options_leaderboard_back
				}
			]}
	else
		generic_event_choose \{data = {
				state = UIstate_leaderboard_groups
			}}
	endif
endscript

script ui_options_leaderboard_back 
	destroy_generic_popup
	if ScreenElementExists \{id = user_control_container}
		user_control_container :SE_SetProps \{alpha = 1}
	endif
endscript
