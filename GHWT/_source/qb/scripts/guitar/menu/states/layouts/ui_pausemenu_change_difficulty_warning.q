
script ui_create_pausemenu_change_difficulty_warning 
	create_pausemenu_change_difficulty_warning <...>
endscript

script ui_destroy_pausemenu_change_difficulty_warning 
	destroy_popup_warning_menu
endscript

script create_pausemenu_change_difficulty_warning 
	disable_pause
	create_popup_warning_menu {
		textblock = {
			text = qs("To change the difficulty setting, this song must be restarted. You will lose all unsaved progress if you restart. Are you sure you want to continue?")
			dims = (800.0, 400.0)
			scale = 0.55
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 520.0)
		options = [
			{
				func = generic_event_back
				text = qs("CANCEL")
			}
			{
				func = {pausemenu_change_difficulty_warning_yes params = {difficulty = <difficulty>}}
				text = qs("RESTART")
			}
		]
	}
endscript

script pausemenu_change_difficulty_warning_yes 
	kill_intro_celeb_ui
	generic_event_choose state = UIstate_pausemenu_change_difficulty_confirm data = {<...> difficulty = <difficulty>}
endscript
