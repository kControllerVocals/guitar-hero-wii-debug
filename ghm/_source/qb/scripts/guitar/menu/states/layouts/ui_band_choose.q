
script ui_create_band_choose 
	band_name1 = qs(0x1f0c041a)
	formattext \{checksumname = bandname_id
		'band1_info'}
	getglobaltags <bandname_id> param = name
	if NOT (<name> = qs(0x03ac90f0))
		<band_name1> = <name>
	endif
	band_name2 = qs(0x1f0c041a)
	formattext \{checksumname = bandname_id
		'band2_info'}
	getglobaltags <bandname_id> param = name
	if NOT (<name> = qs(0x03ac90f0))
		<band_name2> = <name>
	endif
	band_name3 = qs(0x1f0c041a)
	formattext \{checksumname = bandname_id
		'band3_info'}
	getglobaltags <bandname_id> param = name
	if NOT (<name> = qs(0x03ac90f0))
		<band_name3> = <name>
	endif
	create_popup_warning_menu {
		title = qs(0x1c3067d4)
		menu_pos = (640.0, 265.0)
		dialog_pos = (640.0, 255.0)
		no_helpers
		list
		options = [
			{
				func = {menu_choose_band_make_selection params = {band_index = 1 from_options = <from_options>}}
				text = <band_name1>
			}
			{
				func = {menu_choose_band_make_selection params = {band_index = 2 from_options = <from_options>}}
				text = <band_name2>
			}
			{
				func = {menu_choose_band_make_selection params = {band_index = 3 from_options = <from_options>}}
				text = <band_name3>
			}
		]
	}
	menu_finish \{no_back_button}
endscript

script ui_destroy_band_choose 
	edit_graphic_prepare_sprite_infos
	generatecagtexture info_array = <sprite_infos> player = <currentskaterprofileindex> test = 0 slow_path = 1
	destroyscreenelement \{id = band_choose_bg1}
	destroyscreenelement \{id = band_choose_bg2}
	destroy_popup_warning_menu
endscript
