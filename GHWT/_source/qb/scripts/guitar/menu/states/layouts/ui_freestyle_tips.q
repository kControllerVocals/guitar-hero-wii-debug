freestyle_tips_rgba_unfocus = [
	255
	255
	255
	255
]
freestyle_tips_rgba_focus = [
	255
	255
	0
	255
]
freestyle_current_tips_array = [
]

script ui_create_freestyle_tips 
	CreateScreenElement {
		parent = root_window
		id = Freestyle_Tips
		type = DescInterface
		desc = 'freestyle_tips'
		exclusive_device = <device_num>
		TipsTitle_text = $wii_freestyle_tips_name
		z_priority = $freestyle_pause_z
	}
	if Freestyle_Tips :Desc_ResolveAlias \{name = alias_TipsMenu}
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
	freestyle_find_player_with_controller controller = <device_num>
	switch ($freestyle_player_data [<player>].instrument)
		case guitar
		change \{freestyle_current_tips_array = $wii_freestyle_tips_guitar}
		case Drums
		change \{freestyle_current_tips_array = $wii_freestyle_tips_drums}
		case DrumKit
		change \{freestyle_current_tips_array = $wii_freestyle_tips_drumkit}
		default
		ScriptAssert \{qs(0x00bfb804)}
	endswitch
	if Freestyle_Tips :Desc_ResolveAlias \{name = alias_TipsMenu}
		AssignAlias id = <resolved_id> alias = current_menu
		tip_index = 0
		GetArraySize \{$freestyle_current_tips_array}
		begin
		CreateScreenElement {
			parent = current_menu
			type = DescInterface
			desc = 'freestyle_tips_entry'
			autoSizeDims = true
			FreestyleTip_text = ($freestyle_current_tips_array [<tip_index>].title)
			FreestyleTip_rgba = $freestyle_tips_rgba_unfocus
			event_handlers = [
				{pad_back freestyle_tips_back params = {device_num = <device_num>}}
				{focus freestyle_tips_select params = {tip_index = <tip_index>}}
				{unfocus freestyle_tips_unfocus}
			]
		}
		<tip_index> = (<tip_index> + 1)
		repeat <array_size>
		CreateScreenElement {
			parent = current_menu
			type = DescInterface
			desc = 'freestyle_tips_entry'
			autoSizeDims = true
			FreestyleTip_text = $wii_freestyle_options_back
			FreestyleTip_rgba = $freestyle_tips_rgba_unfocus
			event_handlers = [
				{pad_back freestyle_tips_back params = {device_num = <device_num>}}
				{focus freestyle_tips_back_select}
				{unfocus freestyle_tips_unfocus}
				{pad_choose freestyle_tips_back params = {device_num = <device_num>}}
			]
		}
	endif
	create_screen_blackout \{z = 99}
	add_user_control_helper text = qs("SELECT") button = green z = 100 controller = <device_num>
	add_user_control_helper text = qs("BACK") button = red z = 100 controller = <device_num>
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script freestyle_tips_back_select 
	SE_SetProps \{FreestyleTip_rgba = $freestyle_tips_rgba_focus}
	Freestyle_Tips :SE_SetProps \{TipsText_text = qs("")}
endscript

script freestyle_tips_unfocus 
	SE_SetProps \{FreestyleTip_rgba = $freestyle_tips_rgba_unfocus}
endscript

script freestyle_tips_select 
	SE_SetProps \{FreestyleTip_rgba = $freestyle_tips_rgba_focus}
	Freestyle_Tips :SE_SetProps TipsText_text = ($freestyle_current_tips_array [<tip_index>].desc)
endscript

script freestyle_tips_back 
	generic_menu_pad_back_sound
	if ScreenElementExists \{id = Freestyle_Tips}
		DestroyScreenElement \{id = Freestyle_Tips}
	endif
	clean_up_user_control_helpers
	destroy_screen_blackout
	freestyle_show_pause_menu device_num = <device_num>
endscript
