
script ui_create_att_ballpark 
	CreateScreenElement \{parent = root_window
		id = my_att_ballpark
		type = DescInterface
		desc = 'song_summary_att_ad'
		event_handlers = [
			{
				pad_choose
				ui_att_ballpark_continue
			}
		]}
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 100000}
	AssignAlias \{id = my_att_ballpark
		alias = current_menu}
endscript

script ui_destroy_att_ballpark 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_att_ballpark}
endscript

script ui_att_ballpark_continue 
	generic_menu_pad_choose_sound
	ui_win_song_continue_next_menu
endscript

script ui_att_ballpark_should_i_show_ad 
	return \{show_att_ad = 0}
	lvl = ($current_level)
	if NOT (<lvl> = load_z_Ballpark)
		return \{show_att_ad = 0}
	endif
	GameMode_GetType
	if NOT (<type> = career)
		return \{show_att_ad = 0}
	endif
	pc = ($primary_controller)
	GameMode_GetNumPlayersShown
	if (($current_num_players) > 1)
		my_checksum = att_ballpark_band
		get_savegame_from_controller controller = ($primary_controller)
	else
		GetPlayerInfo \{1
			controller}
		get_savegame_from_controller controller = <controller>
		GetPlayerInfo \{1
			part}
		switch <part>
			case guitar
			my_checksum = att_ballpark_guitar
			case Bass
			my_checksum = att_ballpark_bass
			case drum
			my_checksum = att_ballpark_drum
			case Vocals
			my_checksum = att_ballpark_vocals
		endswitch
	endif
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame> param = <my_checksum>
	flag = (<...>.<my_checksum>)
	if (<flag> = 1)
		return \{show_att_ad = 0}
	endif
	player_idx = 1
	begin
	GetPlayerInfo <player_idx> controller
	get_savegame_from_controller controller = <controller>
	AddParam name = <my_checksum> structure_name = my_flag value = 1
	SetGlobalTags <band_info> savegame = <savegame> params = <my_flag>
	player_idx = (<player_idx> + 1)
	repeat <num_players_shown>
	printstruct channel = mychannel <...>
	return \{show_att_ad = 1}
endscript
