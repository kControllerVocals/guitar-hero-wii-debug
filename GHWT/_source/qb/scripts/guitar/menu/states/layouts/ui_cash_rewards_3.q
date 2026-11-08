row_count_for_sb = 0

script ui_create_cash_rewards_3 
	ReloadSfx \{mode = postgig
		noreset = 1}
	if ScreenElementExists \{id = my_cash_rewards_id}
		DestroyScreenElement \{id = my_cash_rewards_id}
	endif
	change \{row_count_for_sb = 0}
	GetEarningsFromGlobalCashMilestoneCollection
	FormatText TextName = gig_earn qs("\L$%d") d = <earned_cash> usecommas
	get_current_band_info
	GetGlobalTags <band_info>
	FormatText TextName = car_earn qs("\L$%d") d = <career_earnings> usecommas
	SoundEvent \{event = Menu_Purchase_Item}
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_cash_rewards_id
		type = DescInterface
		desc = 'cash_reward_3'
		cash_money_text = qs("\L$$$$")
		this_gig_entry_text = <gig_earn>
		career_entry_text = <car_earn>
		exclusive_device = <exclusive_device>
	}
	my_cash_rewards_id :Desc_SetChildProps \{child = title
		z_priority = 20}
	my_cash_rewards_id :Desc_SetChildProps \{child = this_gig
		z_priority = 20}
	my_cash_rewards_id :Desc_SetChildProps \{child = career
		z_priority = 20}
	my_cash_rewards_id :Desc_SetChildProps \{child = cash_money
		z_priority = 20}
	CreateScreenElement \{type = WindowElement
		parent = my_cash_rewards_id
		id = my_current_menu
		dims = (612.0, 310.0)
		pos = (80.0, 195.0)
		just = [
			left
			top
		]
		pos_anchor = [
			left
			top
		]
		child_anchor = [
			left
			top
		]
		tags = {
			current = 0
			fit = 7
			total = 9
		}}
	if (($current_num_players) > 1)
		my_event_handlers = [
			{pad_up ui_cash_rewards_shift params = {up}}
			{pad_down ui_cash_rewards_shift params = {down}}
			{pad_back generic_event_back}
		]
		SetScreenElementProps \{id = my_cash_rewards_id
			patch_alpha = 0
			cash_reward_image_placeholder_alpha = 1
			this_gig_entry_alpha = 0
			career_entry_alpha = 0
			career_alpha = 0
			this_gig_alpha = 0}
	else
		my_event_handlers = [
			{pad_up ui_cash_rewards_shift params = {up}}
			{pad_down ui_cash_rewards_shift params = {down}}
			{pad_choose cash_rewards_continue_from_cash_rewards_sp}
		]
		cash_ranks_get_rank
		cash_ranks_get_patch_id
		FormatText TextName = next_rock_rank_txt qs("\L$%d") d = <cash_to_next_rank> usecommas
		FormatText TextName = rock_rank_txt qs("\L%d") d = <rank>
		SetScreenElementProps {
			id = my_cash_rewards_id
			cash_milestones_patch_texture = <cash_patch_id>
			text_rock_rank_entry_text = <rock_rank_txt>
			cash_to_next_entry_text = <next_rock_rank_txt>
		}
	endif
	<id> :SE_SetProps event_handlers = <my_event_handlers>
	CreateScreenElement \{type = VMenu
		parent = my_current_menu
		id = stat_vmenu
		dims = (512.0, 0.0)
		just = [
			left
			top
		]
		internal_just = [
			center
			top
		]
		spacing_between = -50}
	i = 0
	begin
	GetPlayerInfo (<i> + 1) part
	switch <part>
		case guitar
		<part_text> = qs("Guitar")
		case Bass
		<part_text> = qs("Bass")
		case drum
		<part_text> = qs("Drums")
		case Vocals
		<part_text> = qs("Vocals")
	endswitch
	CreateScreenElement {
		parent = stat_vmenu
		type = DescInterface
		desc = 'cash_reward_row_3'
		autoSizeDims = true
		cash_reward_item_text_text = <part_text>
		cash_reward_check_alpha = 0
		cash_reward_item_text_rgba = (($g_menu_colors).brick)
	}
	change row_count_for_sb = (($row_count_for_sb) + 1)
	<collection> = ($cash_milestones_collection [<i>])
	ForEachIn <collection> do = cash_rewards_3_add_individual_rewards params = {menu = stat_vmenu}
	i = (<i> + 1)
	repeat ($current_num_players)
	AssignAlias \{id = my_current_menu
		alias = current_menu}
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	if (($current_num_players) > 1)
		add_user_control_helper text = qs("BACK") button = red <all_button_params> z = 1000
	else
		add_user_control_helper text = qs("CONTINUE") button = green <all_button_params> z = 1000
	endif
	SetScreenElementProps {
		id = my_current_menu
		tags = {current = 0 fit = 6 total = ($row_count_for_sb)}
	}
	printf channel = mychannel qs("\LRows = %d") d = ($row_count_for_sb)
endscript

script GetEarningsFromGlobalCashMilestoneCollection 
	<collection> = $cash_milestones_collection
	GetArraySize <collection>
	if (<array_size> > 0)
		total_cash = 0
		GameMode_GetNumPlayers
		i = 1
		begin
		GetArraySize (<collection> [(<i> -1)])
		sum = 0
		j = 0
		if (<array_size> > 0)
			begin
			sum = (<sum> + (((<collection> [(<i> -1)]) [<j>]).Cash))
			j = (<j> + 1)
			repeat <array_size>
		endif
		total_cash = (<total_cash> + <sum>)
		i = (<i> + 1)
		repeat <num_players>
	endif
	return earned_cash = <total_cash>
endscript

script ui_destroy_cash_rewards_3 
	if (($current_num_players) = 1)
		ui_gig_cash_clear_gig_earnings
		Progression_CashMilestonesClear
	endif
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_cash_rewards_id}
endscript

script ui_cash_rewards_shift 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	GetTags
	if GotParam \{down}
		if (<current> >= (<total> - <fit>))
			return
		endif
		stat_vmenu :SetProps \{pos = {
				(0.0, -51.0)
				relative
			}
			time = 0.1}
		SetTags current = (<current> + 1)
		generic_menu_up_or_down_sound \{down}
	else
		if (<current> <= 0)
			return
		endif
		stat_vmenu :SetProps \{pos = {
				(0.0, 51.0)
				relative
			}
			time = 0.1}
		SetTags current = (<current> - 1)
		generic_menu_up_or_down_sound \{up}
	endif
	GetTags
	<max> = (<total> - <fit>)
	<dx> = (193.0 / <max>)
	printstruct channel = mychannel <...>
	pos = ((397.0, -45.0) + ((0.0, 1.0) * (<current> * <dx>)))
	my_cash_rewards_id :SE_SetProps thumb_piece_pos = <pos> time = 0.1
endscript

script cash_rewards_3_add_band_rewards 
	if (<Band> = true)
		<label> = ($cash_milestones.<milestone>.text)
		if (<Cash> = 0)
			FormatText TextName = reward qs("\L%s") s = <label>
		else
			FormatText TextName = reward qs("\L$%d - %s") d = <Cash> s = <label>
		endif
		CreateScreenElement {
			parent = stat_vmenu
			type = DescInterface
			desc = 'cash_reward_row_3'
			autoSizeDims = true
			cash_reward_item_text_text = <reward>
		}
		change row_count_for_sb = (($row_count_for_sb) + 1)
	endif
endscript

script cash_rewards_3_add_individual_rewards 
	if (<Band> = false)
		<label> = ($cash_milestones.<milestone>.text)
		if (<Cash> = 0)
			FormatText TextName = reward qs("\L%s") s = <label>
		else
			FormatText TextName = reward qs("\L$%d - %s") d = <Cash> s = <label>
		endif
		CreateScreenElement {
			parent = stat_vmenu
			type = DescInterface
			desc = 'cash_reward_row_3'
			autoSizeDims = true
			cash_reward_item_text_text = <reward>
		}
		change row_count_for_sb = (($row_count_for_sb) + 1)
	endif
endscript

script cash_rewards_continue_from_cash_rewards_sp 
	GameMode_GetType
	if (<type> = career)
		generic_event_replace \{state = uistate_magazine_cover}
	else
		ui_win_song_continue_next_menu
	endif
endscript
