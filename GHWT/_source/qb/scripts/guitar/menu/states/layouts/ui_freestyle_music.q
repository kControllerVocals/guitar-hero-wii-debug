
script ui_create_freestyle_music \{after_game = 0}
	fadetoblack \{off
		time = 0
		no_wait}
	CreateScreenElement \{parent = root_window
		id = Freestyle_Style_Select
		type = DescInterface
		desc = 'FreestyleStyleSelect'}
	if Freestyle_Style_Select :Desc_ResolveAlias \{name = alias_StyleMenu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SE_SetProps {
			event_handlers = [
				{pad_back freestyle_music_back params = {after_game = <after_game>}}
				{pad_up generic_menu_up_or_down_sound}
				{pad_down generic_menu_up_or_down_sound}
			]
		}
		AssignAlias \{alias = tmpRowItem
			id = {
				current_menu
				child = BluesText
			}}
		tmpRowItem :SE_SetProps \{event_handlers = [
				{
					pad_choose
					freestyle_select_blues
				}
				{
					focus
					freestyle_focus_style
					params = {
						style_index = 0
					}
				}
			]
			text = $wii_freestyle_style_blues}
		AssignAlias \{alias = tmpRowItem
			id = {
				current_menu
				child = RockText
			}}
		tmpRowItem :SE_SetProps \{event_handlers = [
				{
					pad_choose
					freestyle_select_rock
				}
				{
					focus
					freestyle_focus_style
					params = {
						style_index = 1
					}
				}
			]
			text = $wii_freestyle_style_rock}
		AssignAlias \{alias = tmpRowItem
			id = {
				current_menu
				child = MetalText
			}}
		tmpRowItem :SE_SetProps \{event_handlers = [
				{
					pad_choose
					freestyle_select_metal
				}
				{
					focus
					freestyle_focus_style
					params = {
						style_index = 2
					}
				}
			]
			text = $wii_freestyle_style_metal}
		CreateScreenElement \{type = SpriteElement
			id = freestyle_mii_header
			parent = root_window
			texture = FreestyleMiiHeader
			pos = (650.0, 90.0)
			z_priority = 300}
		if (<after_game> = 1)
			title = $wii_freestyle_retry
		else
			title = $wii_freestyle_select_music_title
		endif
		CreateScreenElement {
			type = TextBlockElement
			parent = root_window
			id = SelectStyleTitle
			font = fontgrid_title_a1
			text = <title>
			rgba = [255 255 255 255]
			scale = (1.0, 1.0)
			pos = $freestyle_title_text_pos
			just = [center center]
			z_priority = 303
			rot_angle = 0
			dims = (275.0, 75.0)
			fit_height = `scale down if larger`
			fit_width = `scale each line if larger`
			internal_just = [center center]
		}
		if Freestyle_Style_Select :Desc_ResolveAlias \{name = alias_QuitText}
			AssignAlias id = <resolved_id> alias = tmpRowItem
			tmpRowItem :SE_SetProps \{alpha = 0}
		endif
		Freestyle_Style_Select :SE_SetProps \{StatsBG_alpha = 0}
		Freestyle_Style_Select :SE_SetProps \{StatsMenuContainer_alpha = 1}
	endif
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 100}
	if (<after_game> = 1)
		add_user_control_helper \{text = $wii_freestyle_style_quit
			button = red
			z = 100}
	else
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 100}
	endif
	Menu_Music_Off
	FreestyleSetPauseSound \{Pause = false}
endscript

script freestyle_music_back 
	if (<after_game> = 1)
		generic_event_replace \{data = {
				state = UIstate_mainmenu
				clear_previous_stack
			}}
	else
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = 5000
			no_wait}
		generic_event_back
	endif
endscript

script freestyle_focus_style 
	if Freestyle_Style_Select :Desc_ResolveAlias \{name = alias_BluesHighlight}
		AssignAlias id = <resolved_id> alias = current_selection
		if (<style_index> = 0)
			current_selection :SE_SetProps \{alpha = 1}
		else
			current_selection :SE_SetProps \{alpha = 0}
		endif
	endif
	if Freestyle_Style_Select :Desc_ResolveAlias \{name = alias_RockHighlight}
		AssignAlias id = <resolved_id> alias = current_selection
		if (<style_index> = 1)
			current_selection :SE_SetProps \{alpha = 1}
		else
			current_selection :SE_SetProps \{alpha = 0}
		endif
	endif
	if Freestyle_Style_Select :Desc_ResolveAlias \{name = alias_MetalHighlight}
		AssignAlias id = <resolved_id> alias = current_selection
		if (<style_index> = 2)
			current_selection :SE_SetProps \{alpha = 1}
		else
			current_selection :SE_SetProps \{alpha = 0}
		endif
	endif
	if Freestyle_Style_Select :Desc_ResolveAlias \{name = alias_QuitHighlight}
		AssignAlias id = <resolved_id> alias = current_selection
		if (<style_index> = 3)
			current_selection :SE_SetProps \{alpha = 1}
		else
			current_selection :SE_SetProps \{alpha = 0}
		endif
	endif
	if (<style_index> < 3)
		freestyle_play_preview_stream style_index = <style_index>
	endif
endscript

script freestyle_select_metal 
	fadetoblack \{on
		time = 0
		alpha = 1.0
		z_priority = 5000
		no_wait}
	change \{freestyle_music_type = metal}
	generic_event_replace \{data = {
			state = UIstate_freestyle_game
			clear_previous_stack
		}}
endscript

script freestyle_select_rock 
	fadetoblack \{on
		time = 0
		alpha = 1.0
		z_priority = 5000
		no_wait}
	change \{freestyle_music_type = Rock}
	generic_event_replace \{data = {
			state = UIstate_freestyle_game
			clear_previous_stack
		}}
endscript

script freestyle_select_blues 
	fadetoblack \{on
		time = 0
		alpha = 1.0
		z_priority = 5000
		no_wait}
	change \{freestyle_music_type = Blues}
	generic_event_replace \{data = {
			state = UIstate_freestyle_game
			clear_previous_stack
		}}
endscript

script ui_destroy_freestyle_music 
	DestroyScreenElement \{id = Freestyle_Style_Select}
	if ScreenElementExists \{id = SelectStyleTitle}
		DestroyScreenElement \{id = SelectStyleTitle}
	endif
	if ScreenElementExists \{id = freestyle_mii_header}
		DestroyScreenElement \{id = freestyle_mii_header}
	endif
	generic_ui_destroy
	freestyle_stop_preview_stream
	clean_up_user_control_helpers
endscript
