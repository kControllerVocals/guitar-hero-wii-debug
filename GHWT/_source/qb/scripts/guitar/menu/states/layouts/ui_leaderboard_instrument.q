
script ui_create_leaderboard_instrument 
	make_menu_frontend {
		screen = Guitarist
		title = qs("INSTRUMENT")
		item_scale = 1.5
		title_pos = (0.0, 60.0)
		pos = (-30.0, 0.0)
		exclusive_device = ($primary_controller)
	}
	add_menu_frontend_item \{text = qs("GUITAR")
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'guitar'
		}}
	add_menu_frontend_item \{text = qs("BASS")
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'backup'
		}}
	add_menu_frontend_item \{text = qs("DRUMS")
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'drums'
		}}
	add_menu_frontend_item \{text = qs("VOCALS")
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'mic'
		}}
	add_menu_frontend_item \{text = qs("BAND")
		pad_choose_script = ui_leaderboard_instrument_select
		pad_choose_params = {
			instrument = 'band'
		}}
	menu_finish
endscript

script ui_destroy_leaderboard_instrument 
	generic_ui_destroy
endscript

script ui_leaderboard_instrument_select 
	if (<instrument> = 'band')
		change \{game_mode = p4_quickplay}
	else
		change \{game_mode = p1_quickplay}
		switch (<instrument>)
			case 'guitar'
			SetPlayerInfo \{1
				part = guitar}
			case 'backup'
			SetPlayerInfo \{1
				part = Bass}
			case 'drums'
			SetPlayerInfo \{1
				part = drum}
			case 'mic'
			SetPlayerInfo \{1
				part = Vocals}
		endswitch
	endif
	FormatText checksumname = instrument_checksum '%i' i = <instrument>
	change current_leaderboard_instrument = <instrument_checksum>
	generic_event_choose \{state = uistate_setlist
		data = {
			from_leaderboard = 1
		}}
endscript
