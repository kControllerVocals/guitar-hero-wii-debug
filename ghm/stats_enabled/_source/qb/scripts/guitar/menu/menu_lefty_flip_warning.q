lefty_flip_warning_menu_font = fontgrid_title_a1

script create_lefty_flip_warning_menu 
	disable_pause
	player_device = ($last_start_pressed_device)
	i = 1
	begin
	getplayerinfo <i> controller
	if (<controller> = <player_device>)
		player = <i>
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	create_popup_warning_menu {
		textblock = {
			text = qs(0x2ba14213)
			dims = (800.0, 400.0)
			scale = 0.55
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 520.0)
		options = [
			{
				func = generic_event_back
				text = qs(0xf7723015)
			}
			{
				func = {menu_lefty_flip_warning_select_yes params = {player = <player>}}
				text = qs(0xb8790f2f)
			}
		]
	}
endscript

script destroy_lefty_flip_warning_menu 
	destroy_popup_warning_menu
endscript

script menu_lefty_flip_warning_select_yes 
	generic_event_back \{state = uistate_gameplay}
	resetscoreupdateready
	getplayerinfo <player> lefty_flip
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
	formattext checksumname = player_status 'player%i_status' i = <player> addtostringlookup
	change structurename = <player_status> lefty_flip = <new_flip>
	gh3_sfx_fail_song_stop_sounds
	monitorcontrollerstates
	spawnscriptnow lefty_flip_func params = {player = <player>}
endscript
