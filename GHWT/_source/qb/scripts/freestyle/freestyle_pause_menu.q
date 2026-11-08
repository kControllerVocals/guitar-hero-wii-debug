freestyle_pause_rgba_title = [
	0
	0
	0
	255
]
freestyle_pause_rgba_unfocus = [
	129
	129
	129
	255
]
freestyle_pause_rgba_focus = [
	255
	192
	0
	255
]
freestyle_pause_item_count = 1

script freestyle_show_pause_menu 
	freestyle_pause
	change last_start_pressed_device = <device_num>
	CreateScreenElement {
		parent = root_window
		id = freestyle_pause_menu
		type = DescInterface
		desc = 'freestyle_pause'
		exclusive_device = <device_num>
		PauseTitle_rgba = $freestyle_pause_rgba_title
	}
	if freestyle_pause_menu :Desc_ResolveAlias \{name = alias_PauseMenu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SE_SetProps \{event_handlers = [
				{
					pad_up
					generic_menu_up_or_down_sound
				}
				{
					pad_down
					generic_menu_up_or_down_sound
				}
			]}
	endif
	freestyle_pause_menu :SE_SetProps \{PauseTitle_text = $wii_freestyle_pause_title}
	freestyle_display_pause_banner device_num = <device_num>
	change \{freestyle_pause_item_count = 1}
	if freestyle_pause_menu :Desc_ResolveAlias \{name = alias_PauseMenu}
		AssignAlias id = <resolved_id> alias = current_menu
		freestyle_add_pause_option \{text = $wii_freestyle_pause_resume
			choose_params = freestyle_hide_pause_menu}
		freestyle_add_pause_option \{text = $wii_freestyle_pause_options
			choose_params = freestyle_select_options_menu}
		freestyle_add_pause_option \{text = $wii_freestyle_pause_tips
			choose_params = freestyle_select_tips_menu}
		freestyle_add_pause_option \{text = $wii_freestyle_pause_quit
			choose_params = freestyle_select_quit}
	endif
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				freestyle_hide_pause_menu
			}
		]
		replace_handlers}
	create_screen_blackout \{z = 99}
	add_user_control_helper text = qs("SELECT") button = green z = 100 controller = <device_num>
	add_user_control_helper text = qs("BACK") button = red z = 100 controller = <device_num>
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script freestyle_add_pause_option \{text = qs(0x9f261b43)}
	FormatText \{checksumname = id_text
		'option%d'
		d = $freestyle_pause_item_count}
	if GotParam \{back_params}
	else
		back_params = freestyle_hide_pause_menu
	endif
	CreateScreenElement {
		parent = current_menu
		type = DescInterface
		desc = 'freestyle_pause_entry'
		autoSizeDims = true
		id = <id_text>
		PauseText = <text>
		PauseText_rgba = $freestyle_pause_rgba_unfocus
		event_handlers = [
			{focus freestyle_pause_focus}
			{unfocus freestyle_pause_unfocus}
			{pad_back generic_menu_pad_back_sound}
			{pad_back <back_params>}
			{pad_choose <choose_params>}
		]
	}
	change freestyle_pause_item_count = ($freestyle_pause_item_count + 1)
endscript

script freestyle_pause_focus 
	SE_SetProps \{PauseText_rgba = $freestyle_pause_rgba_focus}
endscript

script freestyle_pause_unfocus 
	SE_SetProps \{PauseText_rgba = $freestyle_pause_rgba_unfocus}
endscript

script freestyle_hide_pause_menu 
	generic_menu_pad_back_sound
	freestyle_close_pause_menu
	freestyle_set_start_key_binding
	freestyle_unpause
endscript

script freestyle_select_quit 
	generic_menu_pad_back_sound
	freestyle_close_pause_menu
	freestyle_end_song
	ui_memcard_autosave_replace \{event = menu_replace
		state = UIstate_freestyle_stats}
endscript

script freestyle_select_options_menu 
	generic_menu_pad_choose_sound
	freestyle_close_pause_menu
	ui_create_freestyle_options device_num = <device_num>
endscript

script freestyle_select_tips_menu 
	generic_menu_pad_choose_sound
	freestyle_close_pause_menu
	kill_start_key_binding
	ui_create_freestyle_tips device_num = <device_num>
endscript

script freestyle_close_pause_menu 
	if ScreenElementExists \{id = freestyle_pause_menu}
		DestroyScreenElement \{id = freestyle_pause_menu}
	endif
	clean_up_user_control_helpers
	destroy_screen_blackout
endscript

script freestyle_display_pause_banner 
	freestyle_find_player_with_controller controller = <device_num>
	switch ($freestyle_player_data [<player>].instrument)
		case guitar
		freestyle_pause_menu :SE_SetProps \{GuitarContainer_alpha = 1}
		case Drums
		case DrumKit
		freestyle_pause_menu :SE_SetProps \{DrumContainer_alpha = 1}
		default
		ScriptAssert \{qs(0x00bfb804)}
	endswitch
endscript
