
script ui_create_cash_milestones 
	if (($current_num_players) = 1)
		ui_cash_milestones_build_page_for_1p
	else
		ui_cash_milestones_build_page_for_mp
	endif
endscript

script ui_destroy_cash_milestones 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_milestones_id}
endscript

script ui_deinit_cash_milestones 
	Progression_CashMilestonesClear
endscript

script ui_cash_milestones_build_page_for_mp 
	get_current_band_info
	GetGlobalTags <band_info>
	if ScreenElementExists \{id = my_milestones_id}
		DestroyScreenElement \{id = my_milestones_id}
	endif
	CreateScreenElement \{parent = root_window
		id = my_milestones_id
		type = DescInterface
		desc = 'cash_milestones_mp_band'}
	if my_milestones_id :Desc_ResolveAlias \{name = alias_cash_milestones_mp_list}
	else
		ScriptAssert \{qs("\LProblem resolving list alias in UIstate_cash_milestones")}
	endif
	cnt = 0
	begin
	p_cash = (($cash_milestones_band_ui) [<cnt>])
	gig_cash_earned = (<p_cash>.total_cash)
	FormatText TextName = gig_cash qs("$%d") d = <gig_cash_earned>
	cash_ranks_get_rank player = (<cnt> + 1)
	cash_ranks_get_icon_id player = (<cnt> + 1)
	FormatText TextName = player_name qs("Player%d") d = (<cnt> + 1)
	GetPlayerInfo (<cnt> + 1) part
	switch (<part>)
		case guitar
		icon_texture = mixer_icon_guitar
		case Bass
		icon_texture = mixer_icon_bass
		case drum
		icon_texture = mixer_icon_drums
		case Vocals
		icon_texture = mixer_icon_vox
	endswitch
	FormatText TextName = car_earnings_txt qs("$%d") d = (<career_earnings> + <gig_cash_earned>)
	FormatText TextName = rank_txt qs("%d") d = <rank>
	CreateScreenElement {
		parent = <resolved_id>
		type = DescInterface
		desc = 'cash_milestones_row_mp'
		autoSizeDims = true
		gig_cash_text = <gig_cash>
		career_earnings_text = qs("fix me")
		cash_milestones_icon_texture = <cash_icon_id>
		player_name_text = <player_name>
		mixer_icon_guitar_texture = <icon_texture>
		career_earnings_text = <car_earnings_txt>
		number_text_text = <rank_txt>
		event_handlers = [
			{pad_back generic_event_back}
		]
	}
	cnt = (<cnt> + 1)
	repeat ($current_num_players)
	spawnscriptnow ui_milestones_set_focus_to_menu params = {menu_id = <resolved_id>}
endscript

script ui_cash_milestones_build_page_for_1p 
	my_get_player_data
	gig_earnings = ($cash_milestones_gig_total)
	cash_ranks_get_rank
	cash_ranks_get_patch_id
	FormatText TextName = car_earn qs("CAREER:$%d") d = <career_earnings> usecommas
	FormatText TextName = car_rank qs("Milestone #%d") d = <rank>
	FormatText TextName = gig_earn qs("GIG:$%d") d = <gig_earnings> usecommas
	if ScreenElementExists \{id = my_milestones_id}
		DestroyScreenElement \{id = my_milestones_id}
	endif
	get_current_band_info
	GetGlobalTags <band_info> param = name
	CreateScreenElement {
		parent = root_window
		id = my_milestones_id
		type = DescInterface
		desc = 'cash_milestones'
		cash_milestone_player_name_text = <name>
		cash_milestones_career_total_text = <car_earn>
		cash_milestones_title_text = <car_rank>
		cash_milestones_patch_texture = <cash_patch_id>
	}
	if (<turnovers> > 0)
		ui_cash_milestones_build_cash_rank_list_elite <...>
	else
		ui_cash_milestones_build_cash_rank_list <...>
	endif
	if (<turnovers> > 0)
		blurb = (($cash_rank_blurbs) [(49 + <turnovers>)])
	else
		blurb = (($cash_rank_blurbs) [(<rank> -1)])
	endif
	SetScreenElementProps {
		id = my_milestones_id
		cash_milestones_title_text = <blurb>
	}
	spawnscriptnow ui_milestones_set_focus_to_menu params = {menu_id = <resolved_id> focus_index = <focus_index>}
endscript

script ui_cash_milestones_build_cash_rank_list 
	if my_milestones_id :Desc_ResolveAlias \{name = alias_cash_milestones_list}
	else
		ScriptAssert \{qs("\LProblem resolving alias in UIstate_cash_milestones")}
	endif
	focus_index = 0
	i = 1
	begin
	FormatText TextName = num_text qs("%d.") d = <i>
	CreateScreenElement {
		parent = <resolved_id>
		type = DescInterface
		desc = 'cash_milestones_row'
		autoSizeDims = true
		list_highlight_alpha = 0
		number_text_text = <num_text>
		tags = {
			index = (<i> - 1)
		}
		event_handlers = [
			{pad_back generic_event_back}
		]
	}
	if (<i> = 1)
		<thresh> = 0
	else
		<thresh> = (($cash_rank_thresholds) [(<i> -2)])
	endif
	if (<i> < 10)
		FormatText checksumname = tex_name 'cash_milestone_icon_00%d' d = <i>
	else
		FormatText checksumname = tex_name 'cash_milestone_icon_0%d' d = <i>
	endif
	FormatText TextName = amnt qs("$%d") d = <thresh>
	SetScreenElementProps {
		id = <id>
		cash_milestones_icon_pho_texture = <tex_name>
		cash_milestone_item_name_text = <amnt>
		event_handlers = [
			{focus ui_cash_milestones_set_focus params = {id = <id>}}
			{unfocus ui_cash_milestones_set_unfocus params = {id = <id>}}
		]
	}
	if (<career_earnings> < <thresh>)
		SetScreenElementProps {
			id = <id>
			cash_milestone_check_alpha = 0
		}
	else
		focus_index = (<focus_index> + 1)
	endif
	i = (<i> + 1)
	repeat 50
	return <...>
endscript

script ui_cash_milestones_build_cash_rank_list_elite 
	if my_milestones_id :Desc_ResolveAlias \{name = alias_cash_milestones_list}
	else
		ScriptAssert \{qs("\LProblem resolving alias in UIstate_cash_milestones")}
	endif
	focus_index = 0
	i = 1
	begin
	FormatText TextName = num_text qs("%d.") d = (1 + (<i> * 50))
	CreateScreenElement {
		parent = <resolved_id>
		type = DescInterface
		desc = 'cash_milestones_row'
		autoSizeDims = true
		list_highlight_alpha = 0
		number_text_text = <num_text>
		tags = {
			index = (<i> - 1)
		}
	}
	<thresh> = (<i> * (($cash_rank_thresholds) [49]))
	FormatText checksumname = tex_name 'cash_milestone_icon_05%d' d = <i>
	FormatText TextName = amnt qs("$%d") d = <thresh>
	SetScreenElementProps {
		id = <id>
		cash_milestones_icon_pho_texture = <tex_name>
		cash_milestone_item_name_text = <amnt>
		event_handlers = [
			{pad_back generic_event_back}
			{focus ui_cash_milestones_set_focus params = {id = <id>}}
			{unfocus ui_cash_milestones_set_unfocus params = {id = <id>}}
		]
	}
	if (<career_earnings> < <thresh>)
		SetScreenElementProps {
			id = <id>
			cash_milestone_check_alpha = 0
		}
	else
		focus_index = (<focus_index> + 1)
	endif
	i = (<i> + 1)
	repeat 5
	return <...>
endscript

script ui_cash_milestones_continue_to_next_screen 
	printf \{channel = mychannel
		qs("\Lcontinue on from cash milestones")}
	GameMode_GetType
	printf channel = mychannel qs("\Lgame mode TYPE = %t") t = <type>
	if (<type> = career)
		ui_win_song_career_continue
	else
		ui_win_song_continue
	endif
endscript

script ui_cash_milestones_set_focus 
	GetTags
	printf channel = mychannel qs("\Lindex = %i") i = <index>
	<ratio> = (<index> / 55.0)
	pos = ((402.0, -38.0) + ((0.0, 1.0) * (<ratio> * 160)))
	my_milestones_id :SE_SetProps thumb_piece_pos = <pos>
	SetScreenElementProps {
		id = <id>
		list_highlight_alpha = 255
	}
	generic_menu_up_or_down_sound
endscript

script ui_cash_milestones_set_unfocus 
	SetScreenElementProps {
		id = <id>
		list_highlight_alpha = 0
	}
endscript

script ui_milestones_set_focus_to_menu 
	if GotParam \{focus_index}
		LaunchEvent type = focus target = <menu_id> data = {child_index = (<focus_index> -1)}
	else
		LaunchEvent type = focus target = <menu_id>
	endif
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100000}
endscript
