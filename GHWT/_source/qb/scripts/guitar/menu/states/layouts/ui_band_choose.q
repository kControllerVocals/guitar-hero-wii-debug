
script ui_create_band_choose 
	band_name1 = $wii_new_band
	FormatText \{checksumname = bandname_id
		'band1_info'}
	GetGlobalTags <bandname_id> param = name
	if NOT (<name> = qs("\L"))
		<band_name1> = <name>
	endif
	band_name2 = $wii_new_band
	FormatText \{checksumname = bandname_id
		'band2_info'}
	GetGlobalTags <bandname_id> param = name
	if NOT (<name> = qs("\L"))
		<band_name2> = <name>
	endif
	band_name3 = $wii_new_band
	FormatText \{checksumname = bandname_id
		'band3_info'}
	GetGlobalTags <bandname_id> param = name
	if NOT (<name> = qs("\L"))
		<band_name3> = <name>
	endif
	create_new_generic_popup {
		popup_type = band_choose
		title = $wii_band_choose
		options = [
			{
				func = menu_choose_band_make_selection
				func_params = {band_index = 1 from_options = <from_options>}
				text = <band_name1>
			}
			{
				func = menu_choose_band_make_selection
				func_params = {band_index = 2 from_options = <from_options>}
				text = <band_name2>
			}
			{
				func = menu_choose_band_make_selection
				func_params = {band_index = 3 from_options = <from_options>}
				text = <band_name3>
			}
		]
	}
	displaySprite \{parent = root_window
		id = band_choose_bg1
		tex = boot_brick_bg
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z = 0}
	displaySprite \{parent = root_window
		id = band_choose_bg2
		tex = gradient_256
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		z = 1
		alpha = 0.5
		blendMode = subtract
		flip_h}
	menu_finish \{no_back_button}
endscript

script ui_destroy_band_choose 
	edit_graphic_prepare_sprite_infos
	GenerateCAGTexture info_array = <sprite_infos> player = <currentSkaterProfileIndex> test = 0 slow_path = 1
	DestroyScreenElement \{id = band_choose_bg1}
	DestroyScreenElement \{id = band_choose_bg2}
	destroy_new_generic_popup
endscript
