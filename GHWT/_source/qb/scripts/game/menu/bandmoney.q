
script create_band_money_display 
	destroy_band_money_display
	CreateScreenElement \{parent = root_window
		type = DescInterface
		id = band_money_id
		desc = 'band_money'}
	refresh_band_money_display
endscript

script destroy_band_money_display 
	if ScreenElementExists \{id = band_money_id}
		DestroyScreenElement \{id = band_money_id}
	endif
endscript

script refresh_band_money_display 
	get_current_band_info
	GetGlobalTags <band_info>
	FormatText TextName = cash_text qs("\L$%i") i = <Cash>
	FormatText TextName = earnings_text qs("\L$%i") i = <career_earnings>
	if ScreenElementExists \{id = band_money_id}
		SetScreenElementProps {
			id = band_money_id
			cash_available_value_text = <cash_text>
			career_earnings_value_text = <earnings_text>
		}
	endif
endscript

script decrease_band_money 
	RequireParams \{[
			price
		]
		all}
	get_current_band_info
	GetGlobalTags <band_info>
	Cash = (<Cash> - <price>)
	SetGlobalTags <band_info> params = {Cash = <Cash>}
	refresh_band_money_display
endscript

script increase_band_money 
	RequireParams \{[
			amount
		]
		all}
	get_current_band_info
	GetGlobalTags <band_info>
	Cash = (<Cash> + <amount>)
	SetGlobalTags <band_info> params = {Cash = <Cash>}
	refresh_band_money_display
endscript

script increase_band_money_by_1000 
	increase_band_money \{amount = 1000}
endscript

script bankrupt_band 
	set_band_money \{value = 0}
endscript

script set_band_money 
	RequireParams \{[
			value
		]
		all}
	get_current_band_info
	SetGlobalTags <band_info> params = {Cash = <value>}
	refresh_band_money_display
endscript

script get_band_money \{Cash = 0}
	get_current_band_info
	GetGlobalTags <band_info>
	return Cash = <Cash>
endscript

script has_enough_money 
	RequireParams \{[
			price
		]
		all}
	get_current_band_info
	GetGlobalTags <band_info>
	if (<price> > <Cash>)
		return \{false}
	else
		return \{true}
	endif
endscript

script increase_career_earnings 
	RequireParams \{[
			amount
		]
		all}
	get_current_band_info
	GetGlobalTags <band_info>
	career_earnings = (<career_earnings> + <amount>)
	SetGlobalTags <band_info> params = {career_earnings = <career_earnings>}
	refresh_band_money_display
endscript

script increase_band_cash_and_earnings 
	RequireParams \{[
			amount
		]
		all}
	increase_career_earnings amount = <amount>
	increase_band_money amount = <amount>
endscript
