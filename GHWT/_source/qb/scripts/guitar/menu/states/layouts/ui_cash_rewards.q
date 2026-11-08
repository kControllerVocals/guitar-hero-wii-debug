
script ui_create_cash_rewards 
	<collection> = $cash_milestones_collection
	if ScreenElementExists \{id = my_cash_rewards_id}
		DestroyScreenElement \{id = my_cash_rewards_id}
	endif
	CreateScreenElement \{parent = root_window
		id = my_cash_rewards_id
		type = DescInterface
		desc = 'cash_reward'}
	SetScreenElementProps \{id = my_cash_rewards_id
		cash_money_text = qs("$$$$")
		this_gig_entry_text = qs("\L$00000$")
		career_entry_text = qs("\L$FIX-ME$")}
	if my_cash_rewards_id :Desc_ResolveAlias \{name = alias_cash_reward_items_list
			param = menu}
	else
		ScriptAssert \{'Problem resolving alias in cash rewards'}
	endif
	cnt = 0
	GetArraySize <collection>
	if (<array_size> > 0)
		total_cash = 0
		GameMode_GetNumPlayers
		i = 1
		begin
		GetPlayerInfo <i> part
		ui_get_instrument_text part = <part>
		CreateScreenElement {
			parent = <menu>
			type = DescInterface
			desc = 'cash_reward_row'
			autoSizeDims = true
			cash_reward_item_text_text = <instrument_text>
			cash_reward_item_text_rgba = [192 0 0 255]
			cash_reward_check_alpha = 0
		}
		GetArraySize (<collection> [(<i> -1)])
		sum = 0
		j = 0
		begin
		sum = (<sum> + (((<collection> [(<i> -1)]) [<j>]).Cash))
		repeat <array_size>
		total_cash = (<total_cash> + <sum>)
		ForEachIn (<collection> [(<i> -1)]) do = cash_rewards_add_reward params = {menu = <menu>}
		i = (<i> + 1)
		repeat <num_players>
		FormatText TextName = tot_cash qs("$%d") d = <total_cash>
		SetScreenElementProps {id = my_cash_rewards_id this_gig_entry_text = <tot_cash>}
	endif
	AssignAlias id = <menu> alias = current_menu
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 1000}
	SetScreenElementProps {
		id = <menu>
		event_handlers = [
			{pad_choose ui_cash_rewards_continue}
		]
	}
endscript

script ui_destroy_cash_rewards 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_cash_rewards_id}
endscript

script cash_rewards_add_reward 
	Random (@ element = cash_reward_bubble01 @ element = cash_reward_bubble02 @ element = cash_reward_bubble03 )
	<label> = ($cash_milestones.<milestone>.text)
	FormatText TextName = reward qs("$%d - %s") d = <Cash> s = <label>
	CreateScreenElement {
		parent = <menu>
		type = DescInterface
		desc = 'cash_reward_row'
		autoSizeDims = true
		cash_reward_item_text_text = <reward>
		cash_reward_bubble_texture = <element>
	}
	if (<Band> = true)
		SetScreenElementProps {
			id = <id>
			cash_reward_check_rgba = [40 40 210 255]
		}
	endif
endscript

script ui_cash_rewards_continue 
	printf \{channel = mychannel
		qs("\Lcontinue on from cash rewards")}
	GameMode_GetType
	printf channel = mychannel qs("\Lgame mode TYPE = %t") t = <type>
	if (<type> = career)
		ui_win_song_career_continue
	else
		ui_win_song_continue
	endif
endscript
