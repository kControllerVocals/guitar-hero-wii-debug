
script ui_create_leaderboard_filter 
	CreateScreenElement {
		parent = root_window
		id = leaderboard_popup
		type = DescInterface
		desc = 'leaderboard_filters'
		exclusive_device = ($lb_controller)
		z_priority = 10000
		alpha = 0.0
	}
	GetArraySize ($FilterTypes.search.values)
	if (($LeaderboardSearchValue >= <array_size>) || ($LeaderboardSearchValue < 0))
		change \{LeaderboardSearchValue = 0}
	endif
	if leaderboard_popup :Desc_ResolveAlias \{name = alias_item}
		AssignAlias id = <resolved_id> alias = filter_menu
		filter_menu :SE_SetProps {
			text = ($FilterTypes.search.values [($LeaderboardSearchValue)])
			event_handlers = [
				{pad_back generic_event_back}
				{pad_choose ui_leaderboard_filter_choose}
				{pad_up ui_leaderboard_filter_change}
				{pad_down ui_leaderboard_filter_change params = {down}}
			]
			tags = {index = $LeaderboardSearchValue}
		}
	endif
	if leaderboard_popup :Desc_ResolveAlias \{name = alias_alert_title}
		split_text_into_menu {
			text = qs("FILTERS")
			dims = (330.0, 120.0)
			fit_major = `fit content`
			fit_minor = `fit content`
			text_params = {
				z_priority = 525.0
				rgba = [90 , 150 , 200 , 255]
				font = ($popup_warning_menu_font)
				use_shadow = true
				shadow_rgba =
				[
					0 , 0 , 0 , 255
				]
				shadow_offs = (-3.0, -3.0)
			}
			pos_anchor = [center center]
			just = [center , center]
			internal_just = [center center]
			parent = <resolved_id>
			spacing_between = 0
			pos = (150.0, 40.0)
		}
		letter_scale = [1.8 1.5 1.2 1.5]
		if NOT GotParam \{title_effect_index}
			<title_effect_index> = Random (@ 0 @ 1 )
		endif
		s = <title_effect_index>
		i = 0
		begin
		text_element = (<text_element_array> [<i>])
		<text_element> :SE_SetProps internal_scale = (<letter_scale> [<s>])
		s = (<s> + 1)
		if (<s> > 3)
			s = 0
		endif
		i = (<i> + 1)
		repeat <text_element_array_size>
	endif
	clean_up_user_control_helpers
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs("SEARCH") button = green <all_button_params> z = 100000
	add_user_control_helper text = qs("BACK") button = red <all_button_params> z = 100000
endscript

script ui_destroy_leaderboard_filter 
	DestroyScreenElement \{id = leaderboard_popup}
	clean_up_user_control_helpers
endscript

script ui_leaderboard_filter_change 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	GetTags
	current_menu :GetSingleTag \{my_data}
	current_menu :GetSingleTag \{friendList}
	GetArraySize ($FilterTypes.search.values)
	if IsPs3
		<array_size> = (<array_size> - 1)
	else
		if NOT GotParam \{friendList}
			<array_size> = (<array_size> - 1)
		endif
	endif
	if GotParam \{down}
		index = (<index> + 1)
		if NOT GotParam \{my_data}
			if (<index> = 1)
				index = (<index> + 1)
			endif
		endif
		if (<index> >= <array_size>)
			index = 0
		endif
		generic_menu_up_or_down_sound \{down}
		leaderboard_popup :SE_SetProps \{arrow_dn_scale = 1.5
			time = 0.1
			motion = ease_in}
		SE_SetProps \{scale = (1.0, 0.0)
			time = 0.1
			motion = ease_out
			just = [
				center
				top
			]}
	else
		index = (<index> - 1)
		if (<index> < 0)
			index = (<array_size> - 1)
		endif
		if NOT GotParam \{my_data}
			if (<index> = 1)
				index = (<index> - 1)
			endif
		endif
		generic_menu_up_or_down_sound
		leaderboard_popup :SE_SetProps \{arrow_up_scale = 1.5
			time = 0.1
			motion = ease_in}
		SE_SetProps \{scale = (1.0, 0.0)
			time = 0.1
			motion = ease_out
			just = [
				center
				bottom
			]}
	endif
	SE_SetProps text = ($FilterTypes.search.values [<index>])
	Wait \{0.1
		seconds}
	SE_SetProps \{scale = (1.0, 1.0)
		time = 0.1
		motion = ease_out}
	leaderboard_popup :SE_SetProps \{arrow_up_scale = 1.0
		arrow_dn_scale = 1.0
		time = 0.1
		motion = ease_in}
	SetTags index = <index>
	Wait \{0.1
		seconds}
endscript

script ui_leaderboard_filter_choose 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	SE_SetProps \{block_events}
	GetTags
	if NOT (<index> = $LeaderboardSearchValue)
		change LeaderboardSearchValue = <index>
	endif
	switch ($LeaderboardSearchValue)
		case 0
		change \{lb_list_type = 0}
		case 1
		change \{lb_list_type = me}
		case 2
		change \{lb_list_type = friends}
	endswitch
	change \{lb_offset = 1}
	generic_event_replace \{state = UIstate_leaderboard_load
		data = {
			is_popup
		}}
endscript
