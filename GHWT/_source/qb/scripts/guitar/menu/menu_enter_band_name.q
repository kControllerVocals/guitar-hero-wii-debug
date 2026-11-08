new_band_name = [
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
	qs("\L")
]
new_band_flashing_char = qs("A")
new_band_flashing_index = 0
new_band_flashing_index_prev = 0
new_band_index = 0
max_band_characters = 19
ebn_transitioning_back = 0
default_band_characters = [
	qs("\LA")
	qs("\LB")
	qs("\LC")
	qs("\LD")
	qs("\LE")
	qs("\LF")
	qs("\LG")
	qs("\LH")
	qs("\LI")
	qs("\LJ")
	qs("\LK")
	qs("\LL")
	qs("\LM")
	qs("\LN")
	qs("\LO")
	qs("\LP")
	qs("\LQ")
	qs("\LR")
	qs("\LS")
	qs("\LT")
	qs("\LU")
	qs("\LV")
	qs("\LW")
	qs("\LX")
	qs("\LY")
	qs("\LZ")
	qs("\L1")
	qs("\L2")
	qs("\L3")
	qs("\L4")
	qs("\L5")
	qs("\L6")
	qs("\L7")
	qs("\L8")
	qs("\L9")
	qs("\L0")
	qs("\L!")
	qs("\L@")
	qs("\L#")
	qs("\L$")
	qs("\L&")
	qs("\L*")
	qs("\L(")
	qs("\L)")
	qs("\L_")
	qs("\L+")
	qs("\L-")
	qs("\L=")
	qs("\L/")
	qs("\L ")
]
band_name_position = (725.0, 345.0)
default_band_indexes = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
enter_band_name_big_vals = {
	text_scale = 2.0
	text_pos = (250.0, 150.0)
	background_pos = (640.0, 360.0)
	background_dims = (1280.0, 720.0)
	header_pos = (640.0, 250.0)
	header_scale = 0.8
	tour_pos = (625.0, 410.0)
	tour_scale = 1.0
	address_pos = (625.0, 445.0)
	address_scale = 1.0
	date_pos = (640.0, 500.0)
	date_scale = 0.85
	sponsor_pos = (925.0, 402.0)
	sponsor_scale = 0.7
	sponsor_dims = (128.0, 128.0)
	sponsor_offset = (0.0, 20.0)
	right_side_img_pos = (1160.0, 330.0)
	right_side_img_dims = (196.0, 408.0)
}
enter_band_name_small_vals = {
	text_scale = 1.1
	text_pos = (250.0, 150.0)
	background_pos = (540.0, 360.0)
	background_dims = (1600.0, 900.0)
	header_pos = (652.0, 85.0)
	header_scale = 1.3
	tour_pos = (500.0, 425.0)
	tour_scale = 1.375
	address_pos = (500.0, 480.0)
	address_scale = 1.375
	date_pos = (500.0, 555.0)
	date_scale = 1.222
	sponsor_pos = (900.0, 410.0)
	sponsor_scale = 1.0
	sponsor_dims = (164.0, 164.0)
	sponsor_offset = (0.0, 26.0)
	right_side_img_pos = (1190.0, 330.0)
	right_side_img_dims = (245.0, 510.0)
}
us_month_names = [
	qs("January")
	qs("February")
	qs("March")
	qs("April")
	qs("May")
	qs("June")
	qs("July")
	qs("August")
	qs("September")
	qs("October")
	qs("November")
	qs("December")
]

script create_enter_band_name_menu 
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				null_script
			}
		]
		replace_handlers}
	NetSessionFunc \{func = stats_init}
	enter_band_name_reset_variables
	rotation_angle = -2
	create_viewport_ui \{texture = `tex/zones/Sound_stage/Alpha_texture_drummer.png`}
	CreateScreenElement {
		parent = <window_id>
		id = EnterNameInterface
		type = DescInterface
		desc = 'viewport_drummer'
		title_text = qs("Enter Name")
	}
	if EnterNameInterface :Desc_ResolveAlias \{name = alias_body}
		AssignAlias id = <resolved_id> alias = ebn_container
	endif
	black = [200 200 200 255]
	Blue = [30 110 150 255]
	nameColor = [180 70 35 255]
	activeColor = [230 130 65 255]
	GetLocalSystemTime
	if English
		GetUpperCaseString (($us_month_names) [(<localsystemtime>.month)])
		FormatText TextName = date_text qs(0xeb6a86cb) m = (<UpperCaseString>) d = (<localsystemtime>.dayofmonth) y = (<localsystemtime>.year)
	else
		GetUpperCaseString (($us_month_names) [(<localsystemtime>.month)])
		FormatText TextName = date_text qs(0x3c57c31a) d = (<localsystemtime>.dayofmonth) m = (<UpperCaseString>) y = (<localsystemtime>.year)
	endif
	CreateScreenElement {
		type = TextElement
		parent = ebn_container
		font = fontgrid_text_a3
		text = <date_text>
		id = ebn_date_text
		pos = (250.0, 450.0)
		rgba = <black>
		just = [center top]
		scale = 1.5
	}
	CreateScreenElement \{type = ContainerElement
		parent = ebn_container
		id = band_name_text_container}
	CreateScreenElement {
		type = TextElement
		parent = band_name_text_container
		font = fontgrid_text_a3
		scale = (($enter_band_name_big_vals).text_scale)
		rgba = <nameColor>
		id = band_name_text
		text = qs("\L")
		pos = (($enter_band_name_big_vals).text_pos)
		just = [center center]
	}
	CreateScreenElement {
		type = TextElement
		parent = band_name_text_container
		font = fontgrid_text_a3
		scale = (($enter_band_name_big_vals).text_scale)
		rgba = <activeColor>
		text = qs("\LA")
		id = band_name_entry_char
		just = [center center]
	}
	exclusive_mp_controllers = [0 , 0 , 0 , 0]
	SetArrayElement ArrayName = exclusive_mp_controllers index = 0 newvalue = ($player1_device)
	SetArrayElement ArrayName = exclusive_mp_controllers index = 1 newvalue = ($player2_device)
	SetArrayElement ArrayName = exclusive_mp_controllers index = 2 newvalue = ($player3_device)
	SetArrayElement ArrayName = exclusive_mp_controllers index = 3 newvalue = ($player4_device)
	exclusive_device = <exclusive_mp_controllers>
	printf \{qs(0x703af7dd)}
	CreateScreenElement {
		type = SpriteElement
		parent = band_name_text_container
		id = ebn_marker
		texture = band_name_underline
		just = [center center]
		event_handlers = [
			{pad_up enter_band_name_change_character params = {up}}
			{pad_down enter_band_name_change_character params = {down}}
			{pad_choose band_advance_pointer}
			{pad_back band_retreat_pointer}
			{pad_start confirm_band_name params = {from_options = <from_options>}}
		]
		rgba = <activeColor>
		exclusive_device = <exclusive_device>
	}
	RunScriptOnScreenElement \{id = ebn_marker
		blinker
		params = {
			id = ebn_marker
			time = 0.5
		}}
	RunScriptOnScreenElement \{id = band_name_entry_char
		blinker
		params = {
			id = band_name_entry_char
			time = 0.5
		}}
	change \{ebn_transitioning_back = 0}
	menu_ebn_update_marker
	enter_band_name_reset_user_control_helpers
endscript

script enter_band_name_reset_user_control_helpers 
	add_user_control_helper \{button = green
		text = qs("NEXT")}
	add_user_control_helper \{button = red
		text = qs("BACK")}
	add_user_control_helper \{button = start
		text = qs("ACCEPT")}
endscript

script enter_band_name_reset_variables 
	change \{new_band_name = [
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
			qs("\L")
		]}
	change \{new_band_index = 0}
	change \{default_band_indexes = [
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
			0
		]}
	change \{new_band_flashing_char = qs("\LA")}
	change \{new_band_flashing_index = 0}
endscript

script destroy_enter_band_name_menu 
	destroy_menu \{menu_id = ebn_container}
	destroy_menu_backdrop
	clean_up_user_control_helpers
	destroy_popup_warning_menu
	generic_ui_destroy
endscript

script blinker 
	if NOT ScreenElementExists id = <id>
		return
	endif
	begin
	LegacyDoScreenElementMorph id = <id> alpha = 0 time = <time>
	Wait <time> seconds
	LegacyDoScreenElementMorph id = <id> alpha = 1.0
	Wait <time> seconds
	repeat
endscript

script confirm_band_name 
	if NOT band_name_is_valid <...>
		SoundEvent \{event = Menu_Warning_SFX}
		enter_band_name_reset_variables
		menu_ebn_refresh_band_name
		menu_ebn_update_marker
		if ScreenElementExists \{id = ebn_marker}
			LaunchEvent \{type = unfocus
				target = ebn_marker}
			if (<need_unique> = 1)
				create_popup_warning_menu \{create_popup_warning_menu
					textblock = {
						text = $wii_name_already_exists
					}
					options = [
						{
							func = enter_band_name_remove_warning
							text = qs("CONTINUE")
						}
					]}
			else
				create_popup_warning_menu \{create_popup_warning_menu
					textblock = {
						text = $wii_enter_band_name
					}
					options = [
						{
							func = enter_band_name_remove_warning
							text = qs("CONTINUE")
						}
					]}
			endif
		endif
	else
		if IsNgc
			NetSessionFunc \{func = stats_uninit}
			NetSessionFunc \{func = stats_init}
		endif
		menu_ebn_get_band_name_text
		StringRemoveTrailingWhitespace string = <band_name_text_string>
		FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
		GetTrueStartTime
		FormatText checksumname = band_unique_id 'band_info_%d' d = <StartTime>
		SetGlobalTags <bandname_id> params = {name = <new_string> band_unique_id = <band_unique_id>}
		agora_update name = <new_string> new_band
		if ($options_for_manage_band = 1)
			generic_event_choose \{event = menu_change
				state = UIstate_options_manage_band_logo}
		else
			if GotParam \{from_options}
				generic_event_choose \{event = menu_replace
					state = UIstate_options_manage_band_logo}
			else
				generic_event_choose \{event = menu_replace
					state = uistate_game_mode}
			endif
		endif
	endif
endscript

script enter_band_name_remove_warning 
	destroy_popup_warning_menu
	enter_band_name_reset_user_control_helpers
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script enter_band_name_change_character 
	if GotParam \{device_num}
		if IsGuitarController controller = <device_num>
			if GotParam \{up}
				change_character_down
			else
				change_character_up
			endif
		else
			if GotParam \{up}
				change_character_up
			else
				change_character_down
			endif
		endif
	endif
endscript

script enter_band_name_remove_focus 
	LaunchEvent \{type = unfocus
		target = scrolling_enter_band_name}
endscript

script enter_band_name_refocus 
	LaunchEvent \{type = focus
		target = scrolling_enter_band_name}
endscript

script change_character_up 
	generic_menu_up_or_down_sound \{up}
	change new_band_flashing_index = ($new_band_flashing_index + 1)
	GetArraySize \{$default_band_characters}
	if ($new_band_flashing_index > (<array_size> -1))
		change \{new_band_flashing_index = 0}
	endif
	change new_band_flashing_char = ($default_band_characters [$new_band_flashing_index])
	menu_ebn_update_marker
endscript

script change_character_down 
	generic_menu_up_or_down_sound \{down}
	change new_band_flashing_index = ($new_band_flashing_index -1)
	if ($new_band_flashing_index < 0)
		GetArraySize \{$default_band_characters}
		change new_band_flashing_index = (<array_size> -1)
	endif
	change new_band_flashing_char = ($default_band_characters [$new_band_flashing_index])
	menu_ebn_update_marker
endscript

script band_advance_pointer 
	if (($new_band_index + 1) < $max_band_characters)
		SoundEvent \{event = ui_sfx_select}
		SetArrayElement \{ArrayName = new_band_name
			GlobalArray
			index = $new_band_index
			newvalue = $new_band_flashing_char}
		change \{new_band_flashing_index_prev = $new_band_flashing_index}
		change \{new_band_flashing_index = 0}
		change \{new_band_flashing_char = qs("\LA")}
		change new_band_index = ($new_band_index + 1)
		menu_ebn_refresh_band_name
		if (($new_band_index + 1) = $max_band_characters)
			ebn_take_away_blinker
		endif
	endif
endscript

script ebn_take_away_blinker 
	clean_up_user_control_helpers
	add_user_control_helper \{button = red
		text = qs("BACK")}
	add_user_control_helper \{button = start
		text = qs("ACCEPT")}
	SetScreenElementProps \{id = band_name_entry_char
		hide}
	SetScreenElementProps \{id = ebn_marker
		hide}
endscript

script band_retreat_pointer 
	if ($new_band_index = 0)
		change \{ebn_transitioning_back = 1}
		destroy_enter_band_name_menu
		generic_event_back
		return
	endif
	if (($new_band_index -1) > -1)
		generic_menu_pad_back_sound
		change new_band_index = ($new_band_index -1)
		change new_band_flashing_char = ($new_band_name [$new_band_index])
		SetArrayElement \{ArrayName = new_band_name
			GlobalArray
			index = $new_band_index
			newvalue = qs("\L")}
		change \{new_band_flashing_index = $new_band_flashing_index_prev}
		menu_ebn_refresh_band_name
		if (($new_band_index + 2) = $max_band_characters)
			ebn_put_back_blinker
		endif
	endif
endscript

script ebn_put_back_blinker 
	clean_up_user_control_helpers
	enter_band_name_reset_user_control_helpers
	SetScreenElementProps \{id = band_name_entry_char
		unhide}
	SetScreenElementProps \{id = ebn_marker
		unhide}
endscript

script menu_ebn_get_band_name_text 
	FormatText TextName = band_name_text_string qs(0x15edabf9) a = ($new_band_name [0]) b = ($new_band_name [1]) c = ($new_band_name [2]) d = ($new_band_name [3]) e = ($new_band_name [4]) f = ($new_band_name [5]) g = ($new_band_name [6]) h = ($new_band_name [7]) i = ($new_band_name [8]) j = ($new_band_name [9]) k = ($new_band_name [10]) l = ($new_band_name [11]) m = ($new_band_name [12]) n = ($new_band_name [13]) o = ($new_band_name [14]) p = ($new_band_name [15]) q = ($new_band_name [16]) r = ($new_band_name [17]) s = ($new_band_name [18]) t = ($new_band_name [19])
	return band_name_text_string = <band_name_text_string>
endscript
menu_ebn_width_threshold = 609
menu_ebn_backdrop_pos_change_factor = (100.0, 0.0)

script menu_ebn_refresh_band_name 
	menu_ebn_get_band_name_text
	vals_struct = ($enter_band_name_big_vals)
	if ($new_band_index > 9)
		<vals_struct> = ($enter_band_name_small_vals)
	endif
	SetScreenElementProps id = band_name_text text = (<band_name_text_string>) scale = (<vals_struct>.text_scale) pos = (<vals_struct>.text_pos)
	SetScreenElementProps id = band_name_entry_char scale = (<vals_struct>.text_scale)
	GetScreenElementDims \{id = band_name_text}
	menu_ebn_update_marker
endscript

script menu_ebn_update_marker 
	vals_struct = ($enter_band_name_big_vals)
	if ($new_band_index > 9)
		<vals_struct> = ($enter_band_name_small_vals)
	endif
	SetScreenElementProps \{id = band_name_entry_char
		text = $new_band_flashing_char}
	GetScreenElementDims \{id = band_name_entry_char}
	new_width = <width>
	new_height = <Height>
	fastscreenelementpos \{id = band_name_text}
	GetScreenElementDims \{id = band_name_text}
	new_pos = (<screenelementpos> + (1.0, 0.0) * 0.5 * <width> + (1.0, 0.0) * <new_width> * 0.5)
	SetScreenElementProps id = band_name_entry_char text = $new_band_flashing_char pos = <new_pos>
	GetScreenElementDims \{id = ebn_marker}
	SetScreenElementProps id = ebn_marker dims = ((1.0, 0.0) * <new_width> + (0.0, 1.0) * <Height>) pos = (<new_pos> + (<new_height> * 0.4 * (0.0, 1.0)))
endscript

script band_name_is_valid 
	if ($ebn_transitioning_back)
		return
	endif
	num_spaces = 0
	array_entry = 0
	<valid> = 0
	<need_unique> = 0
	begin
	if NOT ($new_band_name [<array_entry>] = qs("\L"))
		if NOT ($new_band_name [<array_entry>] = qs("\L "))
			<valid> = 1
			break
		endif
	endif
	<array_entry> = (<array_entry> + 1)
	repeat ($max_band_characters)
	if (<valid> = 0)
		return false need_unique = <need_unique>
	else
		return true need_unique = <need_unique>
	endif
endscript
