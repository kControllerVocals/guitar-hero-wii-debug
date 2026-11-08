
script ui_create_pausemenu_change_difficulty_confirm 
	create_pausemenu_change_difficulty_confirm <...>
endscript

script ui_destroy_pausemenu_change_difficulty_confirm 
	destroy_popup_warning_menu
endscript

script create_pausemenu_change_difficulty_confirm 
	player_device = ($last_start_pressed_device)
	create_popup_warning_menu {
		textblock = {
			text = qs("Your difficulty has now been changed permanently until you change it again.")
			dims = (800.0, 400.0)
			scale = 0.55
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 520.0)
		options = [
			{
				func = {pausemenu_change_difficulty_confirm_ok params = {<...>}}
				text = qs("OK")
			}
		]
	}
endscript

script pausemenu_change_difficulty_confirm_ok 
	player = 1
	if ($current_num_players > 1)
		player_device = ($last_start_pressed_device)
		i = 1
		begin
		GetPlayerInfo <i> controller
		if (<controller> = <player_device>)
			player = <i>
			break
		endif
		i = (<i> + 1)
		repeat ($current_num_players)
	endif
	SetPlayerInfo <player> difficulty = <difficulty>
	SetArrayElement ArrayName = default_difficulty GlobalArray index = ($last_start_pressed_device) newvalue = <difficulty>
	change \{should_reset_gig_posters_selection = 1}
	restart_warning_select_restart player = <player>
endscript
