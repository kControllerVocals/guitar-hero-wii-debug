
script ui_create_practice_select_speed 
	if GotParam \{from_pause}
		make_generic_menu {
			title = qs("PRACTICE SPEED")
			exclusive_device = <player_device>
			centered
			extra_z = 1000
			bg_pos = (200.0, 0.0)
			title_bg_pos = (620.0, 50.0)
		}
	else
		make_generic_menu \{title = qs("PRACTICE SPEED")}
	endif
	<speeds> = [
		{
			text = qs("Full Speed")
			Speed = full
		}
		{
			text = qs("Slow")
			Speed = Slow
		}
		{
			text = qs("Slower")
			Speed = slower
		}
		{
			text = qs("Slowest")
			Speed = slowest
		}
	]
	GetPlayerInfo \{1
		part}
	GetArraySize <speeds>
	i = 0
	begin
	if (<part> = Vocals && (<speeds> [<i>].Speed) != full)
		focusable = {not_focusable}
	else
		RemoveParameter \{focusable}
	endif
	add_generic_menu_text_item {
		text = (<speeds> [<i>].text)
		pad_choose_script = menu_choose_practice_speed_set_speed
		pad_choose_params = {Speed = (<speeds> [<i>].Speed) from_pause = <from_pause>}
		<focusable>
	}
	i = (<i> + 1)
	repeat <array_size>
	menu_finish
endscript

script ui_destroy_practice_select_speed 
	generic_ui_destroy
endscript

script ui_deinit_practice_select_speed 
	create_loading_screen \{force_predisplay = 1}
endscript

script menu_choose_practice_speed_set_speed \{Speed = full}
	switch <Speed>
		case full
		change \{current_speedfactor = 1.0}
		case Slow
		change \{current_speedfactor = 0.8}
		case slower
		change \{current_speedfactor = 0.66666675}
		case slowest
		change \{current_speedfactor = 0.5}
	endswitch
	if NOT GotParam \{from_pause}
		generic_event_choose \{state = uistate_play_song}
	else
		restart_warning_select_restart \{dont_save_song_data}
	endif
endscript
