
script ui_create_leaderboard_groups 
	change \{rich_presence_context = presence_leaderboards}
	make_generic_menu {
		title = qs("LEADERBOARDS")
		exclusive_device = ($primary_controller)
	}
	add_generic_menu_text_item \{text = qs("INDIVIDUAL SONGS")
		pad_choose_script = ui_leaderboard_group_select
		pad_choose_params = {
			group = song
		}}
	add_generic_menu_text_item \{text = qs("CAREER MODE")
		pad_choose_script = ui_leaderboard_group_select
		pad_choose_params = {
			group = career
		}}
	menu_finish
endscript

script ui_destroy_leaderboard_groups 
	generic_ui_destroy
endscript

script ui_leaderboard_group_select 
	change current_leaderboard_group = <group>
	if (<group> = song)
		if isXenon
			change \{current_leaderboard_array = $master_leaderboard_song_list}
		else
			change \{current_leaderboard_array = $master_leaderboard_song_list_ps3}
		endif
		generic_event_choose \{state = UIstate_leaderboard_instrument}
	else
		if isXenon
			change \{current_leaderboard_array = $master_leaderboard_career_list}
		else
			change \{current_leaderboard_array = $master_leaderboard_career_list_ps3}
		endif
		generic_event_choose \{state = UIstate_leaderboard_list}
	endif
endscript
