freestyle_title_text_pos = (640.0, 80.0)
freestyle_active_mii = -1
freestyle_active_controller = -1
freestyle_max_miis_on_screen = 3
freestyle_mii_scroll_margin = 1
freestyle_mii_list_position = [
	(330.0, 250.0)
	(940.0, 250.0)
]
freestyle_mii_off_bg = [
	128
	128
	128
	0
]
freestyle_mii_on_bg = [
	128
	128
	128
	0
]
freestyle_mii_highlight_bg = [
	255
	255
	255
	0
]
freestyle_num_miis_on_screen = -1
freestyle_current_mii_display = [
	-1
	-1
]
freestyle_current_highlight = [
	-1
	-1
]
freestyle_current_menu = [
	0
	0
]
freestyle_warned_no_miis = 0

script ui_create_freestyle 
	if NOT ($freestyle_in_flow = 1)
		freestyle_enter_flow
	endif
	change \{game_mode = freestyle}
	change primary_controller = <device_num>
	freestyle_create_sign_in_menu
	freestyle_process_choose device_num = <device_num>
endscript

script freestyle_create_sign_in_menu 
	fadetoblack \{off
		time = 0
		no_wait}
	disable_pause
	GetMiiCount
	make_menu \{menu_id = freestyle_menu_container
		vmenu_id = freestyle_menu
		use_all_controllers
		noTitleBG
		noBG
		pos = (640.0, 500.0)
		pad_back_script = freestyle_process_back
		title_pos = (640.0, 50.0)
		no_helper_text}
	CreateScreenElement \{type = TextBlockElement
		parent = root_window
		id = SelectStyleTitle
		font = fontgrid_title_a1
		text = $wii_freestyle_form_band_title
		rgba = [
			255
			255
			255
			255
		]
		scale = (1.0, 1.0)
		pos = $freestyle_title_text_pos
		just = [
			center
			center
		]
		z_priority = 303
		rot_angle = 0
		dims = (275.0, 75.0)
		fit_height = `scale down if larger`
		fit_width = `scale each line if larger`
		internal_just = [
			center
			center
		]}
	add_menu_item \{id = freestyle_menu_processor
		text = qs("")
		pad_choose_script = {
			freestyle_process_choose
		}}
	menu_finish
	SetScreenElementProps \{id = freestyle_menu
		event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
				params = {
					up = 1
				}
			}
			{
				pad_up
				freestyle_process_tick
				params = {
					up
				}
			}
			{
				pad_down
				generic_menu_up_or_down_sound
				params = {
					down = 2
				}
			}
			{
				pad_down
				freestyle_process_tick
				params = {
					down
				}
			}
			{
				pad_start
				freestyle_process_choose
			}
		]
		replace_handlers}
	CreateScreenElement \{type = SpriteElement
		id = freestyle_signin_header
		parent = freestyle_menu_container
		texture = FreestyleMiiHeader
		pos = (650.0, 90.0)
		z_priority = 2}
	CreateScreenElement \{id = freestyle_player_background
		type = SpriteElement
		parent = freestyle_menu_container
		pos = (0.0, 0.0)
		texture = FreestyleMenuBG
		just = [
			left
			top
		]
		dims = (1280.0, 720.0)}
	CreateScreenElement \{id = freestyle_sign_in_container
		type = ContainerElement
		parent = freestyle_menu_container
		rgba = [
			255
			255
			255
			255
		]
		pos = (630.0, 295.0)
		dims = (1024.0, 256.0)
		just = [
			center
			center
		]
		internal_just = [
			left
			top
		]
		rot_angle = -1
		scale = 1.0}
	CreateScreenElement \{id = freestyle_player_guitarist_text
		type = TextElement
		parent = freestyle_sign_in_container
		text = qs("")
		font = fontgrid_title_a1
		rgba = [
			49
			49
			49
			255
		]
		just = [
			center
			center
		]
		pos = (416.0, 160.0)
		dims = (20.0, 400.0)
		scale = 0.6
		z_priority = 24
		rot_angle = -12}
	CreateScreenElement \{id = freestyle_player_guitarist_bg
		type = SpriteElement
		parent = freestyle_sign_in_container
		texture = FreestyleGuitaristOff
		rgba = [
			255
			255
			255
			255
		]
		just = [
			center
			center
		]
		pos = (370.0, 180.0)
		z_priority = 21}
	if (<mii_count> > 0)
		CreateScreenElement \{id = freestyle_player_guitarist_mii
			type = MiiIconElement
			parent = freestyle_sign_in_container
			just = [
				center
				center
			]
			z_priority = 100
			mii_index = 0
			mii_expression = Normal
			mii_bgcolor = $freestyle_mii_on_bg
			mii_dims = (256.0, 256.0)
			pos = (368.0, 195.0)
			z_priority = 24
			rot_angle = -2
			scale = 0.75}
	endif
	CreateScreenElement \{id = freestyle_player_guitarist_mii_random
		type = SpriteElement
		parent = freestyle_sign_in_container
		just = [
			center
			center
		]
		z_priority = 100
		texture = FreestyleMiiRandomSelected
		pos = (368.0, 195.0)
		z_priority = 24
		rot_angle = -2
		scale = 1}
	CreateScreenElement {
		id = freestyle_player_guitarist_signin_text
		type = TextElement
		parent = freestyle_sign_in_container
		text = $wii_freestyle_guitar_join
		font = ($user_control_text_font)
		rgba = [49 49 49 255]
		just = [center center]
		pos = (378.0, 113.0)
		scale = 0.8
		z_priority = 28
	}
	CreateScreenElement \{id = freestyle_player_drummer_text
		type = TextElement
		parent = freestyle_sign_in_container
		text = qs("")
		font = fontgrid_title_a1
		rgba = [
			49
			49
			49
			255
		]
		just = [
			center
			center
		]
		pos = (550.0, 248.0)
		scale = 0.6
		z_priority = 24
		rot_angle = 15.34}
	CreateScreenElement \{id = freestyle_player_drummer_bg
		type = SpriteElement
		parent = freestyle_sign_in_container
		texture = FreestyleDrummerOff
		rgba = [
			255
			255
			255
			255
		]
		just = [
			center
			center
		]
		pos = (670.0, 185.0)
		z_priority = 21}
	if (<mii_count> > 0)
		CreateScreenElement \{id = freestyle_player_drummer_mii
			type = MiiIconElement
			parent = freestyle_sign_in_container
			just = [
				center
				center
			]
			z_priority = 100
			mii_index = 0
			mii_expression = Normal
			mii_bgcolor = $freestyle_mii_on_bg
			mii_dims = (256.0, 256.0)
			pos = (670.0, 210.0)
			z_priority = 24
			rot_angle = 2
			scale = 0.75}
	endif
	CreateScreenElement \{id = freestyle_player_drummer_mii_random
		type = SpriteElement
		parent = freestyle_sign_in_container
		just = [
			center
			center
		]
		z_priority = 100
		texture = FreestyleMiiRandomSelected
		pos = (670.0, 210.0)
		z_priority = 24
		rot_angle = 2
		scale = 1}
	CreateScreenElement {
		id = freestyle_player_drummer_signin_text
		type = TextElement
		parent = freestyle_sign_in_container
		text = $wii_freestyle_drummer_join
		font = ($user_control_text_font)
		rgba = [49 49 49 255]
		just = [center center]
		pos = (665.0, 119.0)
		scale = 0.8
		z_priority = 28
	}
	CreateScreenElement \{id = freestyle_player_done_container
		type = ContainerElement
		parent = freestyle_menu_container
		rgba = [
			255
			255
			255
			255
		]
		pos = (660.0, 470.0)
		dims = (1024.0, 128.0)
		just = [
			center
			center
		]
		internal_just = [
			left
			top
		]
		scale = 1}
	CreateScreenElement \{id = freestyle_player_done_text
		type = TextElement
		parent = freestyle_player_done_container
		text = $wii_freestyle_form_band_waiting
		font = fontgrid_title_a1
		rgba = [
			49
			49
			49
			255
		]
		just = [
			center
			center
		]
		pos = (503.0, 177.0)
		scale = 0.65000004
		z_priority = 28}
	CreateScreenElement \{id = freestyle_player_done_banner
		type = SpriteElement
		parent = freestyle_player_done_container
		texture = FreestyleBannerOff
		rgba = [
			255
			255
			255
			255
		]
		just = [
			center
			center
		]
		pos = (500.0, 160.0)
		z_priority = 27}
	freestyle_update_current_mii
	LaunchEvent \{type = focus
		target = freestyle_menu
		data = {
			child_id = freestyle_menu_processor
		}}
	SetArrayElement \{ArrayName = freestyle_current_menu
		GlobalArray
		index = 0
		newvalue = 0}
	SetArrayElement \{ArrayName = freestyle_current_menu
		GlobalArray
		index = 1
		newvalue = 0}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
endscript

script freestyle_update_current_mii 
	if ($freestyle_current_menu [0] = 0)
		if ScreenElementExists \{id = freestyle_player_guitarist_mii}
			SetScreenElementProps \{id = freestyle_player_guitarist_mii
				hide}
		endif
		SetScreenElementProps \{id = freestyle_player_guitarist_mii_random
			hide}
		SetScreenElementProps \{id = freestyle_player_guitarist_bg
			texture = FreestyleGuitaristOff
			unhide}
		SetScreenElementProps \{id = freestyle_player_guitarist_text
			unhide}
		SetScreenElementProps \{id = freestyle_player_guitarist_signin_text
			unhide}
	elseif ($freestyle_current_menu [0] = 1)
		SetScreenElementProps \{id = freestyle_player_guitarist_mii_random
			hide}
		if ScreenElementExists \{id = freestyle_player_guitarist_mii}
			SetScreenElementProps \{id = freestyle_player_guitarist_mii
				hide}
		endif
		SetScreenElementProps \{id = freestyle_player_guitarist_bg
			texture = FreestyleGuitaristWaiting
			unhide}
		SetScreenElementProps \{id = freestyle_player_guitarist_text
			unhide}
		SetScreenElementProps \{id = freestyle_player_guitarist_signin_text
			hide}
	else
		if ($freestyle_player_data [0].mii_index >= 0)
			if ScreenElementExists \{id = freestyle_player_guitarist_mii}
				SetScreenElementProps id = freestyle_player_guitarist_mii unhide mii_index = ($freestyle_player_data [0].mii_index) mii_bgcolor = $freestyle_mii_on_bg
			endif
		else
			SetScreenElementProps \{id = freestyle_player_guitarist_mii_random
				unhide}
		endif
		SetScreenElementProps \{id = freestyle_player_guitarist_bg
			texture = FreestyleGuitaristReady
			unhide}
		SetScreenElementProps \{id = freestyle_player_guitarist_text
			hide}
		SetScreenElementProps \{id = freestyle_player_guitarist_signin_text
			hide}
	endif
	if ($freestyle_current_menu [1] = 0)
		if ScreenElementExists \{id = freestyle_player_drummer_mii}
			SetScreenElementProps \{id = freestyle_player_drummer_mii
				hide}
		endif
		SetScreenElementProps \{id = freestyle_player_drummer_mii_random
			hide}
		SetScreenElementProps \{id = freestyle_player_drummer_bg
			texture = FreestyleDrummerOff
			unhide}
		SetScreenElementProps \{id = freestyle_player_drummer_text
			unhide}
		SetScreenElementProps \{id = freestyle_player_drummer_signin_text
			unhide}
	elseif ($freestyle_current_menu [1] = 1)
		if ScreenElementExists \{id = freestyle_player_drummer_mii}
			SetScreenElementProps \{id = freestyle_player_drummer_mii
				hide}
		endif
		SetScreenElementProps \{id = freestyle_player_drummer_mii_random
			hide}
		SetScreenElementProps \{id = freestyle_player_drummer_bg
			texture = FreestyleDrummerWaiting
			unhide}
		SetScreenElementProps \{id = freestyle_player_drummer_text
			unhide}
		SetScreenElementProps \{id = freestyle_player_drummer_signin_text
			hide}
	else
		if ($freestyle_player_data [1].mii_index >= 0)
			if ScreenElementExists \{id = freestyle_player_drummer_mii}
				SetScreenElementProps id = freestyle_player_drummer_mii unhide mii_index = ($freestyle_player_data [1].mii_index) mii_bgcolor = $freestyle_mii_on_bg
			endif
		else
			SetScreenElementProps \{id = freestyle_player_drummer_mii_random
				unhide}
		endif
		SetScreenElementProps \{id = freestyle_player_drummer_bg
			texture = FreestyleDrummerReady
			unhide}
		SetScreenElementProps \{id = freestyle_player_drummer_text
			hide}
		SetScreenElementProps \{id = freestyle_player_drummer_signin_text
			hide}
	endif
	if (($freestyle_current_menu [0] = 1 || $freestyle_current_menu [1] = 1) || ($freestyle_current_menu [0] = 0 && $freestyle_current_menu [1] = 0))
		freestyle_disable_done
	else
		freestyle_enable_done
	endif
endscript

script ui_destroy_freestyle 
	generic_ui_destroy
	if ScreenElementExists \{id = SelectStyleTitle}
		DestroyScreenElement \{id = SelectStyleTitle}
	endif
	DestroyScreenElement \{id = freestyle_sign_in_container}
	DestroyScreenElement \{id = freestyle_player_done_container}
	clean_up_user_control_helpers
endscript

script freestyle_process_tick 
	GetWiiControllerType controller = <device_num>
	if (((<controller_type> = guitar) && ($freestyle_player_data [0].controller = <device_num>)) && ($freestyle_current_menu [0] = 1))
		if GotParam \{up}
			freestyle_mii_process_tick \{player = 0
				up}
		elseif GotParam \{down}
			freestyle_mii_process_tick \{player = 0
				down}
		endif
	elseif ((((<controller_type> = nunchuk) || (<controller_type> = DrumKit)) && ($freestyle_player_data [1].controller = <device_num>)) && ($freestyle_current_menu [1] = 1))
		if GotParam \{up}
			freestyle_mii_process_tick \{player = 1
				up}
		elseif GotParam \{down}
			freestyle_mii_process_tick \{player = 1
				down}
		endif
	endif
endscript

script freestyle_process_choose 
	GetWiiControllerType controller = <device_num>
	GetMiiCount
	if (<controller_type> = guitar)
		if ($freestyle_player_data [0].controller = -1 || $freestyle_current_menu [0] = 0)
			if (<mii_count> > 0)
				SetArrayElement \{ArrayName = freestyle_current_menu
					GlobalArray
					index = 0
					newvalue = 1}
			else
				SetArrayElement \{ArrayName = freestyle_current_menu
					GlobalArray
					index = 0
					newvalue = 2}
			endif
			SetStructureParam array_name = freestyle_player_data array_index = 0 param = controller value = <device_num>
			freestyle_spawn_mii_select_menu \{player = 0}
		elseif ($freestyle_player_data [0].controller = <device_num>)
			if ($freestyle_current_menu [0] = 1)
				freestyle_mii_process_choose \{player = 0}
			elseif ($freestyle_current_menu [1] != 1)
				freestyle_process_menu_advance device_num = <device_num>
			endif
		endif
	elseif ((<controller_type> = nunchuk) || (<controller_type> = DrumKit))
		if ($freestyle_player_data [1].controller = -1 || $freestyle_current_menu [1] = 0)
			if (<mii_count> > 0)
				SetArrayElement \{ArrayName = freestyle_current_menu
					GlobalArray
					index = 1
					newvalue = 1}
			else
				SetArrayElement \{ArrayName = freestyle_current_menu
					GlobalArray
					index = 1
					newvalue = 2}
			endif
			SetStructureParam array_name = freestyle_player_data array_index = 1 param = controller value = <device_num>
			if (<controller_type> = DrumKit)
				SetStructureParam \{array_name = freestyle_player_data
					array_index = 1
					param = instrument
					value = DrumKit}
			elseif (<controller_type> = nunchuk)
				SetStructureParam \{array_name = freestyle_player_data
					array_index = 1
					param = instrument
					value = Drums}
			endif
			freestyle_spawn_mii_select_menu \{player = 1}
		elseif ($freestyle_player_data [1].controller = <device_num>)
			if ($freestyle_current_menu [1] = 1)
				freestyle_mii_process_choose \{player = 1}
			elseif ($freestyle_current_menu [0] != 1)
				freestyle_process_menu_advance device_num = <device_num>
			endif
		endif
	else
		create_new_generic_popup \{popup_type = ok_menu
			title = $wii_freestyle_notice
			text = $wii_freestyle_wrong_controller
			ok_func = destroy_generic_popup
			title_effect
			back_script = destroy_generic_popup}
	endif
	freestyle_update_current_mii
endscript

script freestyle_process_menu_advance 
	if NOT (($freestyle_current_menu [0] = 1) && ($freestyle_current_menu [1] = 1))
		if ($freestyle_player_data [0].character = none)
			SetStructureParam \{array_name = freestyle_player_data
				array_index = 0
				param = character
				value = Guitarist}
		endif
		if ($freestyle_player_data [1].character = none)
			SetStructureParam \{array_name = freestyle_player_data
				array_index = 1
				param = character
				value = Drummer}
		endif
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = 5000
			no_wait}
		change primary_controller = <device_num>
		generic_event_choose \{state = UIstate_freestyle_music}
	endif
endscript

script freestyle_process_back 
	GetWiiControllerType controller = <device_num>
	GetMiiCount
	if (<controller_type> = guitar)
		if ($freestyle_player_data [0].controller = <device_num>)
			if (($freestyle_current_menu [0] = 2) && (<mii_count> > 0))
				SetArrayElement \{ArrayName = freestyle_current_menu
					GlobalArray
					index = 0
					newvalue = 1}
				freestyle_spawn_mii_select_menu \{player = 0}
			elseif (($freestyle_current_menu [0] = 1) || ((<mii_count> = 0) && ($freestyle_current_menu [0] = 2)))
				SetArrayElement \{ArrayName = freestyle_current_menu
					GlobalArray
					index = 0
					newvalue = 0}
				freestyle_mii_process_back player = 0 device_num = <device_num>
				SetStructureParam \{array_name = freestyle_player_data
					array_index = 0
					param = controller
					value = -1}
				SetStructureParam \{array_name = freestyle_player_data
					array_index = 0
					param = mii_index
					value = -1}
				SetStructureParam \{array_name = freestyle_player_data
					array_index = 0
					param = mii_is_random
					value = 1}
			endif
		else
			ui_event \{event = menu_back}
		endif
	elseif ((<controller_type> = nunchuk) || (<controller_type> = DrumKit))
		if ($freestyle_player_data [1].controller = <device_num>)
			if (($freestyle_current_menu [1] = 2) && (<mii_count> > 0))
				SetArrayElement \{ArrayName = freestyle_current_menu
					GlobalArray
					index = 1
					newvalue = 1}
				freestyle_spawn_mii_select_menu \{player = 1}
			elseif (($freestyle_current_menu [1] = 1) || ((<mii_count> = 0) && ($freestyle_current_menu [1] = 2)))
				SetArrayElement \{ArrayName = freestyle_current_menu
					GlobalArray
					index = 1
					newvalue = 0}
				freestyle_mii_process_back player = 1 device_num = <device_num>
				SetStructureParam \{array_name = freestyle_player_data
					array_index = 1
					param = controller
					value = -1}
				SetStructureParam \{array_name = freestyle_player_data
					array_index = 1
					param = mii_index
					value = -1}
				SetStructureParam \{array_name = freestyle_player_data
					array_index = 1
					param = mii_is_random
					value = 1}
			endif
		else
			ui_event \{event = menu_back}
		endif
	else
		ui_event \{event = menu_back}
	endif
	freestyle_update_current_mii
endscript

script freestyle_enable_done 
	SetScreenElementProps \{id = freestyle_player_done_text
		rgba = [
			15
			10
			0
			255
		]
		text = $wii_freestyle_form_band_done
		scale = 0.8}
	SetScreenElementProps \{id = freestyle_player_done_banner
		texture = FreestyleBannerSelected}
endscript

script freestyle_disable_done 
	SetScreenElementProps \{id = freestyle_player_done_text
		rgba = [
			49
			49
			49
			255
		]
		text = $wii_freestyle_form_band_waiting
		scale = 0.65000004}
	SetScreenElementProps \{id = freestyle_player_done_banner
		texture = FreestyleBannerOff}
endscript

script freestyle_is_signed_in 
	if (($freestyle_player_data [0].controller = <device_num>) || ($freestyle_player_data [1].controller = <device_num>))
		return \{true}
	endif
	return \{false}
endscript

script freestyle_spawn_mii_select_menu \{player = 0}
	GetMiiCount
	if ((<mii_count> + 1) < $freestyle_max_miis_on_screen)
		change freestyle_num_miis_on_screen = (<mii_count> + 1)
	else
		change \{freestyle_num_miis_on_screen = $freestyle_max_miis_on_screen}
	endif
	SetArrayElement ArrayName = freestyle_current_highlight GlobalArray index = <player> newvalue = 0
	SetArrayElement ArrayName = freestyle_current_mii_display GlobalArray index = <player> newvalue = -1
	if (<mii_count> > 0)
		change freestyle_active_mii = <player>
		FormatText checksumname = freestyle_mii_menu_container 'freestyle_mii_menu_container%i' i = <player> AddToStringLookup = true
		CreateScreenElement {
			type = ContainerElement
			id = <freestyle_mii_menu_container>
			parent = freestyle_menu_container
		}
		FormatText checksumname = MiiSelectBG 'MiiSelectBG%i' i = <player> AddToStringLookup = true
		FormatText checksumname = MiiSelectBGTexture 'FreestyleMiiScrollBG%i' i = <player> AddToStringLookup = true
		CreateScreenElement {
			type = SpriteElement
			id = <MiiSelectBG>
			z_priority = 29
			pos = ($freestyle_mii_list_position [<player>] - (132.0, 145.0))
			texture = <MiiSelectBGTexture>
			parent = <freestyle_mii_menu_container>
			just = [left , top]
			scale = (1.0, 1.0)
		}
		if (<player> = 0)
			CreateScreenElement {
				type = SpriteElement
				id = FreestyleMiiInstrumentGuitar
				z_priority = 28
				pos = (($freestyle_mii_list_position [0]) - (96.0, 0.0))
				texture = FreestyleScrollGuitar
				parent = <freestyle_mii_menu_container>
				just = [center , center]
			}
		else
			CreateScreenElement {
				type = SpriteElement
				id = FreestyleMiiInstrumentDrums
				z_priority = 28
				pos = (($freestyle_mii_list_position [1]) + (112.0, 0.0))
				texture = FreestyleScrollDrums
				parent = <freestyle_mii_menu_container>
				just = [center , center]
			}
		endif
		i = 0
		begin
		pos = ($freestyle_mii_list_position [<player>] + ((128 * <i>) * (0.0, 1.0)))
		FormatText checksumname = mii_element_name 'freestyle_mii_face_%n_p%i' n = <i> i = <player> AddToStringLookup = true
		FormatText checksumname = random_element_name 'freestyle_mii_random_%n_p%i' n = <i> i = <player> AddToStringLookup = true
		if (<i> = 0)
			CreateScreenElement {
				id = <random_element_name>
				type = SpriteElement
				parent = <freestyle_mii_menu_container>
				just = [center center]
				pos = <pos>
				z_priority = 30
				texture = FreestyleMiiRandomOff
			}
			if ($freestyle_num_miis_on_screen > 1)
				CreateScreenElement {
					id = <mii_element_name>
					type = MiiIconElement
					parent = <freestyle_mii_menu_container>
					just = [center center]
					pos = <pos>
					z_priority = 30
					mii_expression = Normal
					mii_bgcolor = $freestyle_mii_on_bg
					mii_dims = (128.0, 128.0)
				}
			endif
		else
			CreateScreenElement {
				id = <mii_element_name>
				type = MiiIconElement
				parent = <freestyle_mii_menu_container>
				just = [center center]
				pos = <pos>
				z_priority = 30
				mii_expression = Normal
				mii_bgcolor = $freestyle_mii_on_bg
				mii_dims = (128.0, 128.0)
			}
		endif
		i = (<i> + 1)
		repeat $freestyle_num_miis_on_screen
		FormatText checksumname = MiiSelectBracket 'MiiSelectBracket%i' i = <player> AddToStringLookup = true
		FormatText checksumname = random_element_name 'freestyle_mii_random_0_p%i' i = <player> AddToStringLookup = true
		CreateScreenElement {
			type = SpriteElement
			id = <MiiSelectBracket>
			parent = <random_element_name>
			z_priority = 31
			pos = (0.0, 0.0)
			texture = FreestyleMiiSelectBracket
		}
		highlight_index = ($freestyle_player_data [$freestyle_active_mii].mii_index + 1)
		SetArrayElement ArrayName = freestyle_current_mii_display GlobalArray index = <player> newvalue = (<highlight_index> - 2)
		if (($freestyle_current_mii_display [<player>]) > (<mii_count> - ($freestyle_num_miis_on_screen)))
			SetArrayElement ArrayName = freestyle_current_mii_display GlobalArray index = <player> newvalue = (<mii_count> - ($freestyle_num_miis_on_screen))
		elseif (($freestyle_current_mii_display [<player>]) < 0)
			SetArrayElement ArrayName = freestyle_current_mii_display GlobalArray index = <player> newvalue = -1
		endif
		if (<highlight_index> <= 0)
			<highlight_index> = 1
		endif
		if (<highlight_index> > <mii_count>)
			<highlight_index> = <mii_count>
		endif
		SetArrayElement ArrayName = freestyle_current_highlight GlobalArray index = <player> newvalue = (<highlight_index> - (($freestyle_current_mii_display [<player>]) + 1))
		freestyle_refresh_miis player = <player>
		freestyle_mii_highlight_element element = ($freestyle_current_highlight [<player>]) player = <player>
	else
		if ($freestyle_warned_no_miis = 0)
			change \{freestyle_warned_no_miis = 1}
			create_new_generic_popup \{popup_type = ok_menu
				title = $wii_freestyle_notice
				text = $wii_freestyle_no_miis
				ok_func = destroy_generic_popup
				title_effect
				back_script = destroy_generic_popup}
		endif
	endif
endscript

script freestyle_mii_process_choose 
	mii_index = (($freestyle_current_mii_display [<player>]) + ($freestyle_current_highlight [<player>]))
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = mii_index value = <mii_index>
	if (<mii_index> = -1)
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = mii_is_random value = 1
	else
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = mii_is_random value = 0
	endif
	freestyle_mii_destroy player = <player>
	SetArrayElement ArrayName = freestyle_current_menu GlobalArray index = <player> newvalue = 2
endscript

script freestyle_mii_process_back 
	freestyle_mii_destroy player = <player>
endscript

script freestyle_mii_destroy 
	FormatText checksumname = freestyle_mii_menu_container 'freestyle_mii_menu_container%i' i = <player> AddToStringLookup = true
	if ScreenElementExists id = <freestyle_mii_menu_container>
		DestroyScreenElement id = <freestyle_mii_menu_container>
	endif
	freestyle_update_current_mii
endscript

script freestyle_mii_process_tick 
	GetMiiCount
	if (GotParam up)
		if ((($freestyle_current_mii_display [<player>]) = -1) && (($freestyle_current_highlight [<player>]) = 0))
			freestyle_mii_unhighlight_element element = 0 player = <player>
			freestyle_mii_highlight_element element = ($freestyle_num_miis_on_screen - 1) player = <player>
			SetArrayElement ArrayName = freestyle_current_mii_display GlobalArray index = <player> newvalue = (<mii_count> - $freestyle_num_miis_on_screen)
			SetArrayElement ArrayName = freestyle_current_highlight GlobalArray index = <player> newvalue = ($freestyle_num_miis_on_screen - 1)
			freestyle_refresh_miis player = <player>
		elseif ((($freestyle_current_mii_display [<player>]) != -1) && (($freestyle_current_highlight [<player>]) = $freestyle_mii_scroll_margin))
			SetArrayElement ArrayName = freestyle_current_mii_display GlobalArray index = <player> newvalue = (($freestyle_current_mii_display [<player>]) - 1)
			freestyle_refresh_miis player = <player>
		else
			freestyle_mii_unhighlight_element element = ($freestyle_current_highlight [<player>]) player = <player>
			freestyle_mii_highlight_element element = (($freestyle_current_highlight [<player>]) - 1) player = <player>
			SetArrayElement ArrayName = freestyle_current_highlight GlobalArray index = <player> newvalue = (($freestyle_current_highlight [<player>]) - 1)
		endif
	elseif (GotParam down)
		if ((($freestyle_current_mii_display [<player>]) = (<mii_count> - $freestyle_num_miis_on_screen)) && (($freestyle_current_highlight [<player>]) = ($freestyle_num_miis_on_screen - 1)))
			freestyle_mii_unhighlight_element element = ($freestyle_current_highlight [<player>]) player = <player>
			freestyle_mii_highlight_element element = 0 player = <player>
			SetArrayElement ArrayName = freestyle_current_mii_display GlobalArray index = <player> newvalue = -1
			SetArrayElement ArrayName = freestyle_current_highlight GlobalArray index = <player> newvalue = 0
			freestyle_refresh_miis player = <player>
		elseif ((($freestyle_current_mii_display [<player>]) != (<mii_count> - $freestyle_num_miis_on_screen)) && (($freestyle_current_highlight [<player>]) = (($freestyle_num_miis_on_screen - 1) - $freestyle_mii_scroll_margin)))
			SetArrayElement ArrayName = freestyle_current_mii_display GlobalArray index = <player> newvalue = (($freestyle_current_mii_display [<player>]) + 1)
			freestyle_refresh_miis player = <player>
		else
			freestyle_mii_unhighlight_element element = ($freestyle_current_highlight [<player>]) player = <player>
			freestyle_mii_highlight_element element = (($freestyle_current_highlight [<player>]) + 1) player = <player>
			SetArrayElement ArrayName = freestyle_current_highlight GlobalArray index = <player> newvalue = (($freestyle_current_highlight [<player>]) + 1)
		endif
	endif
endscript

script freestyle_refresh_miis 
	i = 0
	begin
	freestyle_mii_change_element element = <i> mii = (($freestyle_current_mii_display [<player>]) + <i>) player = <player>
	i = (<i> + 1)
	repeat $freestyle_num_miis_on_screen
endscript

script freestyle_mii_highlight_element 
	if (<element> >= $freestyle_num_miis_on_screen)
		return
	endif
	if (<element> = 0)
		FormatText checksumname = mii_to_select 'freestyle_mii_random_0_p%i' i = <player> AddToStringLookup = true
		FormatText checksumname = MiiSelectBracket 'MiiSelectBracket%i' i = <player> AddToStringLookup = true
		<MiiSelectBracket> :SE_SetProps parent = <mii_to_select> pos = (64.0, 64.0)
	else
		FormatText checksumname = mii_element_name 'freestyle_mii_face_%n_p%i' n = <element> i = <player> AddToStringLookup = true
		FormatText checksumname = MiiSelectBracket 'MiiSelectBracket%i' i = <player> AddToStringLookup = true
		<MiiSelectBracket> :SE_SetProps parent = <mii_element_name> pos = (0.0, 0.0)
		SetScreenElementProps id = <mii_element_name> mii_bgcolor = $freestyle_mii_highlight_bg
	endif
endscript

script freestyle_mii_unhighlight_element 
	if (<element> >= $freestyle_num_miis_on_screen)
		return
	endif
	if (<element> = 0)
	else
		FormatText checksumname = mii_element_name 'freestyle_mii_face_%n_p%i' n = <element> i = <player> AddToStringLookup = true
		SetScreenElementProps id = <mii_element_name> mii_bgcolor = $freestyle_mii_off_bg
	endif
endscript

script freestyle_mii_change_element 
	if (<element> >= $freestyle_num_miis_on_screen)
		return
	endif
	FormatText checksumname = mii_element_name 'freestyle_mii_face_%n_p%i' n = <element> i = <player> AddToStringLookup = true
	FormatText checksumname = random_element_name 'freestyle_mii_random_%n_p%i' n = <element> i = <player> AddToStringLookup = true
	if (<element> = 0)
		if (<mii> = -1)
			SetScreenElementProps id = <random_element_name> unhide
			if ($freestyle_num_miis_on_screen > 1)
				SetScreenElementProps id = <mii_element_name> hide
			endif
		else
			SetScreenElementProps id = <mii_element_name> unhide mii_index = <mii>
			SetScreenElementProps id = <random_element_name> hide
		endif
	else
		SetScreenElementProps id = <mii_element_name> mii_index = <mii>
	endif
endscript
