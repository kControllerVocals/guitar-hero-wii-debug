freestyle_stats_delta_y = 40
freestyle_stats_height = 0
freestyle_stats_offset_y = 0

script ui_create_freestyle_stats 
	fadetoblack \{off
		time = 0
		no_wait}
	change \{freestyle_stats_height = 0}
	change \{freestyle_stats_offset_y = 0}
	CreateScreenElement \{parent = root_window
		id = FreestyleStatsContainer
		type = DescInterface
		desc = 'freestyle_stats'}
	freestyle_stats_update_stars star_rating = ($freestyle_saved_stats.star_rating)
	if FreestyleStatsContainer :Desc_ResolveAlias \{name = alias_FreestyleStatsMenu}
		AssignAlias id = <resolved_id> alias = current_menu
		freestyle_add_stat text = $wii_freestyle_stats_song_length value = ($freestyle_saved_stats.song_length)
		if ($freestyle_saved_stats.human_guitarist = 1)
			freestyle_add_stat text = $wii_freestyle_stats_guitar_notes value = ($freestyle_saved_stats.guitar_notes)
		endif
		if ($freestyle_saved_stats.human_drummer = 1)
			freestyle_add_stat text = $wii_freestyle_stats_drum_notes value = ($freestyle_saved_stats.drum_notes)
		endif
		if ($freestyle_saved_stats.human_guitarist = 1)
			freestyle_add_stat text = $wii_freestyle_stats_training_cards value = ($freestyle_saved_stats.training_cards)
			freestyle_add_stat text = $wii_freestyle_stats_single_notes value = ($freestyle_saved_stats.single_notes)
			freestyle_add_stat text = $wii_freestyle_stats_chords value = ($freestyle_saved_stats.chords)
			freestyle_add_stat text = $wii_freestyle_stats_riffs value = ($freestyle_saved_stats.riffs)
			freestyle_add_stat text = $wii_freestyle_stats_licks value = ($freestyle_saved_stats.licks)
			freestyle_add_stat text = $wii_freestyle_stats_star_notes value = ($freestyle_saved_stats.star_notes)
		endif
		if ($freestyle_saved_stats.human_drummer = 1)
			freestyle_add_stat text = $wii_freestyle_stats_drums value = ($freestyle_saved_stats.Drums)
		endif
	endif
	CreateScreenElement \{type = TextElement
		parent = root_window
		id = continue_text
		scale = 0.8
		pos = (50.0, 23.0)
		font = fontgrid_text_a8
		rgba = [
			0
			0
			0
			255
		]
		just = [
			left
			center
		]
		z_priority = 101
		event_handlers = [
			{
				pad_back
				freestyle_stats_back
			}
			{
				pad_choose
				freestyle_stats_continue
			}
			{
				pad_down
				freestyle_stats_move_screen_up
			}
			{
				pad_up
				freestyle_stats_move_screen_down
			}
		]}
	LaunchEvent \{type = focus
		target = continue_text}
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 100}
	freestyle_stats_update_arrows
endscript

script freestyle_add_stat \{text = ''
		value = ''}
	FormatText TextName = value_text qs("%i") i = <value>
	CreateScreenElement {
		parent = current_menu
		type = DescInterface
		desc = 'freestyle_stat_entry'
		autoSizeDims = true
		Stat_Title = <text>
		Stat_Value = <value_text>
	}
	change freestyle_stats_height = ($freestyle_stats_height + 145)
endscript

script freestyle_stats_back 
endscript

script freestyle_stats_continue 
	generic_event_choose \{state = UIstate_freestyle_music
		data = {
			after_game = 1
		}}
endscript

script freestyle_stats_move_screen_down 
	printf \{qs(0x1ba20d16)}
	if (($freestyle_stats_offset_y + $freestyle_stats_delta_y) < 0)
		printf \{qs(0x39f491e7)}
		change freestyle_stats_offset_y = ($freestyle_stats_offset_y + $freestyle_stats_delta_y)
		generic_menu_up_or_down_sound
	else
		change \{freestyle_stats_offset_y = 0}
	endif
	freestyle_stats_update_arrows
	current_menu :SE_SetProps pos = ((0.0, 1.0) * ($freestyle_stats_offset_y))
	freestyle_menu_ds_scroll_background
endscript

script freestyle_stats_move_screen_up 
	printf \{qs(0x5e29cf47)}
	stats_end = ($freestyle_stats_offset_y + $freestyle_stats_height)
	printf \{qs(0x3cc442fd)
		i = $freestyle_stats_height
		j = $freestyle_stats_offset_y}
	if FreestyleStatsContainer :Desc_ResolveAlias \{name = alias_ScrollWindow}
		AssignAlias id = <resolved_id> alias = stats_window
		GetScreenElementDims \{id = stats_window}
		bottom_end = ((<Height> * 2.0) - $freestyle_stats_delta_y)
		if ((<stats_end> - $freestyle_stats_delta_y) > (<bottom_end> -1))
			printf \{qs(0x4072beba)}
			change freestyle_stats_offset_y = ($freestyle_stats_offset_y - $freestyle_stats_delta_y)
			generic_menu_up_or_down_sound
		endif
		freestyle_stats_update_arrows
		current_menu :SE_SetProps pos = ((0.0, 1.0) * ($freestyle_stats_offset_y))
		freestyle_menu_ds_scroll_background
	endif
endscript

script freestyle_stats_update_arrows 
	if (($freestyle_stats_offset_y) = 0)
		FreestyleStatsContainer :SE_SetProps \{ArrowUp_alpha = 0}
	else
		FreestyleStatsContainer :SE_SetProps \{ArrowUp_alpha = 1}
	endif
	if FreestyleStatsContainer :Desc_ResolveAlias \{name = alias_ScrollWindow}
		AssignAlias id = <resolved_id> alias = stats_window
		GetScreenElementDims \{id = stats_window}
		if ((($freestyle_stats_offset_y + $freestyle_stats_height) - $freestyle_stats_delta_y) > (((<Height> * 2.0) - $freestyle_stats_delta_y) -1))
			FreestyleStatsContainer :SE_SetProps \{ArrowDown_alpha = 1}
		else
			FreestyleStatsContainer :SE_SetProps \{ArrowDown_alpha = 0}
		endif
	endif
endscript

script freestyle_menu_ds_scroll_background 
endscript

script freestyle_stats_update_stars \{star_rating = 0}
	texture = Stats_StarSilver
	if (<star_rating> = 6)
		texture = Stats_StarGold
	endif
	alpha = 0
	if (<star_rating> >= 1)
		alpha = 1
	endif
	FreestyleStatsContainer :SE_SetProps star1_alpha = <alpha> star1_texture = <texture>
	alpha = 0
	if (<star_rating> >= 2)
		alpha = 1
	endif
	FreestyleStatsContainer :SE_SetProps star2_alpha = <alpha> star2_texture = <texture>
	alpha = 0
	if (<star_rating> >= 3)
		alpha = 1
	endif
	FreestyleStatsContainer :SE_SetProps star3_alpha = <alpha> star3_texture = <texture>
	alpha = 0
	if (<star_rating> >= 4)
		alpha = 1
	endif
	FreestyleStatsContainer :SE_SetProps star4_alpha = <alpha> star4_texture = <texture>
	alpha = 0
	if (<star_rating> >= 5)
		alpha = 1
	endif
	FreestyleStatsContainer :SE_SetProps star5_alpha = <alpha> star5_texture = <texture>
endscript

script ui_destroy_freestyle_stats 
	DestroyScreenElement \{id = FreestyleStatsContainer}
	DestroyScreenElement \{id = continue_text}
	generic_ui_destroy
endscript
