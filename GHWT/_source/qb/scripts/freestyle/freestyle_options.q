
script freestyle_save_options 
	SetGlobalTags user_options params = {
		freestyle_auto_help = ($freestyle_auto_help_enabled)
		freestyle_whammy_reverse = ($freestyle_player_data [0].whammy_reverse)
	}
endscript

script freestyle_load_options 
	freestyle_find_gh_player \{player = 0}
	if (<gh_player> != -1)
		GetPlayerInfo <gh_player> lefty_flip
		int_to_bool bool_name = lefty_bool int_value = <lefty_flip>
		SetStructureParam array_name = freestyle_player_data array_index = 0 param = lefty value = <lefty_bool>
	endif
	GetGlobalTags \{user_options}
	SetStructureParam array_name = freestyle_player_data array_index = 0 param = whammy_reverse value = <freestyle_whammy_reverse>
	change freestyle_auto_help_enabled = <freestyle_auto_help>
endscript

script freestyle_find_gh_player 
	player_controller = ($freestyle_player_data [<player>].controller)
	i = 1
	begin
	FormatText checksumname = player_status 'player%d_status' d = <i>
	if ($<player_status>.controller = <player_controller>)
		return gh_player = <i>
	endif
	<i> = (<i> + 1)
	repeat 4
	return \{gh_player = -1}
endscript
