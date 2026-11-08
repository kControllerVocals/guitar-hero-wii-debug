freestyle_drum_expert_mode = 0

script ui_create_freestyle_options 
	GetWiiControllerType controller = <device_num>
	CreateScreenElement {
		parent = root_window
		id = freestyle_pause_menu
		type = DescInterface
		desc = 'freestyle_pause'
		exclusive_device = <device_num>
		PauseTitle_rgba = $freestyle_pause_rgba_title
		event_handlers = [{pad_start freestyle_hide_pause_menu}]
		z_priority = $freestyle_pause_z
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
	freestyle_pause_menu :SE_SetProps \{PauseTitle_text = $wii_freestyle_options}
	freestyle_display_pause_banner device_num = <device_num>
	change \{freestyle_pause_item_count = 1}
	freestyle_find_player_with_controller controller = <device_num>
	switch ($freestyle_player_data [<player>].instrument)
		case guitar
		if freestyle_pause_menu :Desc_ResolveAlias \{name = alias_PauseMenu}
			AssignAlias id = <resolved_id> alias = current_menu
			freestyle_add_pause_option text = $wii_freestyle_options_backing_tracks choose_params = freestyle_toggle_backing_tracks params = {device_num = <device_num>} back_params = freestyle_options_back
			freestyle_add_pause_option text = $wii_freestyle_options_lefty_flip choose_params = freestyle_toggle_lefty_flip params = {device_num = <device_num>} back_params = freestyle_options_back
			freestyle_add_pause_option text = $wii_freestyle_options_whammy_reverse choose_params = freestyle_toggle_whammy_reverse params = {device_num = <device_num>} back_params = freestyle_options_back
			freestyle_add_pause_option text = $wii_freestyle_options_auto_help choose_params = freestyle_toggle_auto_help params = {device_num = <device_num>} back_params = freestyle_options_back
			freestyle_add_pause_option text = $wii_freestyle_options_back choose_params = freestyle_options_back params = {device_num = <device_num>} back_params = freestyle_options_back
		endif
		case Drums
		if freestyle_pause_menu :Desc_ResolveAlias \{name = alias_PauseMenu}
			AssignAlias id = <resolved_id> alias = current_menu
			freestyle_add_pause_option text = $wii_freestyle_options_backing_tracks choose_params = freestyle_toggle_backing_tracks params = {device_num = <device_num>} back_params = freestyle_options_back params = {device_num = <device_num>}
			freestyle_add_pause_option text = $wii_freestyle_options_expert choose_params = freestyle_toggle_expert params = {device_num = <device_num>} back_params = freestyle_options_back params = {device_num = <device_num>}
			freestyle_add_pause_option text = $wii_freestyle_options_auto_help choose_params = freestyle_toggle_auto_help params = {device_num = <device_num>} back_params = freestyle_options_back
			freestyle_add_pause_option text = $wii_freestyle_options_back choose_params = freestyle_options_back params = {device_num = <device_num>} back_params = freestyle_options_back params = {device_num = <device_num>}
		endif
		case DrumKit
		if freestyle_pause_menu :Desc_ResolveAlias \{name = alias_PauseMenu}
			AssignAlias id = <resolved_id> alias = current_menu
			freestyle_add_pause_option text = $wii_freestyle_options_backing_tracks choose_params = freestyle_toggle_backing_tracks params = {device_num = <device_num>} back_params = freestyle_options_back params = {device_num = <device_num>}
			freestyle_add_pause_option text = $wii_freestyle_options_auto_help choose_params = freestyle_toggle_auto_help params = {device_num = <device_num>} back_params = freestyle_options_back
			freestyle_add_pause_option text = $wii_freestyle_options_back choose_params = freestyle_options_back params = {device_num = <device_num>} back_params = freestyle_options_back params = {device_num = <device_num>}
		endif
		default
		ScriptAssert \{qs(0x00bfb804)}
	endswitch
	freestyle_update_options_text device_num = <device_num>
	create_screen_blackout \{z = 99}
	add_user_control_helper text = qs("SELECT") button = green z = 100 controller = <device_num>
	add_user_control_helper text = qs("BACK") button = red z = 100 controller = <device_num>
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script freestyle_update_options_text 
	freestyle_find_player_with_controller controller = <device_num>
	switch ($freestyle_player_data [<player>].instrument)
		case guitar
		freestyle_update_text \{option_val = option1
			option_text = $wii_freestyle_options_backing_tracks
			is_on = $freestyle_enable_backing_streams}
		freestyle_update_text option_val = option2 option_text = $wii_freestyle_options_lefty_flip is_on = ($freestyle_player_data [<player>].lefty = true)
		freestyle_update_text option_val = option3 option_text = $wii_freestyle_options_whammy_reverse is_on = ($freestyle_player_data [<player>].whammy_reverse = true)
		freestyle_update_text option_val = option4 option_text = $wii_freestyle_options_auto_help is_on = ($freestyle_auto_help_enabled = 1)
		case Drums
		freestyle_update_text \{option_val = option1
			option_text = $wii_freestyle_options_backing_tracks
			is_on = $freestyle_enable_backing_streams}
		freestyle_update_text \{option_val = option2
			option_text = $wii_freestyle_options_expert
			is_on = $freestyle_drum_expert_mode}
		freestyle_update_text option_val = option3 option_text = $wii_freestyle_options_auto_help is_on = ($freestyle_auto_help_enabled = 1)
		case DrumKit
		freestyle_update_text \{option_val = option1
			option_text = $wii_freestyle_options_backing_tracks
			is_on = $freestyle_enable_backing_streams}
		freestyle_update_text option_val = option2 option_text = $wii_freestyle_options_auto_help is_on = ($freestyle_auto_help_enabled = 1)
		default
		ScriptAssert \{qs(0x00bfb804)}
	endswitch
endscript

script freestyle_update_text 
	if (<is_on> = 1)
		FormatText TextName = menu_text qs("%a: %b") a = <option_text> b = $wii_freestyle_options_on
		<option_val> :SE_SetProps PauseText = <menu_text>
	else
		FormatText TextName = menu_text qs("%a: %b") a = <option_text> b = $wii_freestyle_options_off
		<option_val> :SE_SetProps PauseText = <menu_text>
	endif
endscript

script freestyle_toggle_backing_tracks 
	generic_menu_pad_choose_sound
	if ($freestyle_enable_backing_streams = 1)
		change \{freestyle_enable_backing_streams = 0}
	else
		change \{freestyle_enable_backing_streams = 1}
	endif
	freestyle_update_options_text device_num = <device_num>
endscript

script freestyle_toggle_lefty_flip 
	generic_menu_pad_choose_sound
	freestyle_find_player_with_controller controller = <device_num>
	if (($freestyle_player_data [<player>].lefty) = true)
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = lefty value = false
	else
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = lefty value = true
	endif
	freestyle_find_gh_player player = <player>
	if (<gh_player> != -1)
		bool_to_int int_name = lefty_int bool_value = ($freestyle_player_data [<player>].lefty)
		SetPlayerInfo <gh_player> lefty_flip = <lefty_int>
	endif
	freestyle_update_options_text device_num = <device_num>
endscript

script freestyle_toggle_whammy_reverse 
	generic_menu_pad_choose_sound
	freestyle_find_player_with_controller controller = <device_num>
	if (($freestyle_player_data [<player>].whammy_reverse) = true)
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = whammy_reverse value = false
	else
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = whammy_reverse value = true
	endif
	freestyle_update_options_text device_num = <device_num>
endscript

script freestyle_toggle_expert 
	generic_menu_pad_choose_sound
	if ($freestyle_drum_expert_mode = 1)
		change \{freestyle_drum_expert_mode = 0}
	else
		change \{freestyle_drum_expert_mode = 1}
	endif
	freestyle_update_options_text device_num = <device_num>
endscript

script freestyle_options_back 
	generic_menu_pad_back_sound
	destroy_screen_blackout
	freestyle_close_pause_menu
	freestyle_show_pause_menu device_num = <device_num>
	freestyle_save_options
endscript

script freestyle_toggle_auto_help 
	generic_menu_pad_choose_sound
	if ($freestyle_auto_help_enabled = 1)
		change \{freestyle_auto_help_enabled = 0}
	else
		change \{freestyle_auto_help_enabled = 1}
	endif
	freestyle_update_options_text device_num = <device_num>
endscript
