lefty_flip_warning_menu_font = fontgrid_title_a1

script create_lefty_flip_warning_menu 
	disable_pause
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
	create_popup_warning_menu {
		textblock = {
			text = qs("TO CHANGE THE LEFTY FLIP SETTING, THIS SONG MUST BE RESTARTED. YOU WILL LOSE ALL UNSAVED PROGRESS IF YOU RESTART. ARE YOU SURE YOU WANT TO CONTINUE?")
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
				func = {menu_lefty_flip_warning_select_yes params = {player = <player>}}
				text = qs("RESTART")
			}
		]
	}
endscript

script destroy_lefty_flip_warning_menu 
	destroy_popup_warning_menu
endscript

script menu_lefty_flip_warning_select_yes 
	generic_event_back \{state = uistate_gameplay}
	ResetScoreUpdateReady
	GetPlayerInfo <player> lefty_flip
	if (<lefty_flip> = 1)
		new_flip = 0
		if (<player> = 1)
			change \{pad_event_up_inversion = true}
		endif
	else
		new_flip = 1
		if (<player> = 1)
			change \{pad_event_up_inversion = false}
		endif
	endif
	FormatText checksumname = player_status 'player%i_status' i = <player> AddToStringLookup
	change structurename = <player_status> lefty_flip = <new_flip>
	GH3_SFX_fail_song_stop_sounds
	MonitorControllerStates
	spawnscriptnow lefty_flip_func params = {player = <player>}
endscript
