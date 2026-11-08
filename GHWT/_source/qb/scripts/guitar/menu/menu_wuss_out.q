
script create_wuss_out_menu 
	change \{boss_wuss_out = 0}
	player_device = ($last_start_pressed_device)
	if ($current_song = bosstom)
		warning_text = qs("Wow, Tom Morello is really kicking your butt. Are you O.K.? Do you want to just skip past him? You'll always know that he got the better of you, but don't worry. You can always come back. He'll be waiting.")
	elseif ($current_song = bossslash)
		warning_text = qs("Man, is Slash taking advantage of you? Do you need a hug? Maybe you should stick to playing bass. You wanna just pass him?  Maybe later you'll have what it takes to hang with a real guitar hero.")
	endif
	disable_pause
	create_popup_warning_menu {
		title = qs("WUSS OUT?")
		textblock = {
			text = <warning_text>
			dims = (880.0, 600.0)
			pos = (640.0, 387.0)
			scale = 0.55
		}
		player_device = <player_device>
		no_background
		menu_pos = (640.0, 470.0)
		options = [
			{
				func = wuss_out_menu_continue
				text = qs("CONTINUE")
			}
			{
				func = wuss_out_menu_wuss_out
				text = qs("WUSS OUT")
			}
		]
	}
endscript

script destroy_wuss_out_menu 
	destroy_popup_warning_menu
endscript

script wuss_out_menu_continue 
	generic_event_choose \{event = menu_replace
		state = uistate_fail_song}
endscript

script wuss_out_menu_wuss_out 
	generic_event_back \{state = uistate_setlist
		data = {
			no_jamsession
		}}
endscript
