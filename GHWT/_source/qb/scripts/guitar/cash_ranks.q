cash_rank_thresholds = [
	500
	1000
	2000
	3000
	4500
	6000
	8000
	11000
	15000
	20000
	25000
	30000
	40000
	50000
	60000
	70000
	80000
	90000
	105000
	120000
	135000
	150000
	165000
	180000
	200000
	220000
	240000
	260000
	280000
	305000
	330000
	355000
	380000
	410000
	440000
	470000
	500000
	530000
	565000
	600000
	635000
	670000
	705000
	745000
	785000
	825000
	865000
	910000
	955000
	1000000
]
cash_rank_blurbs = [
	qs("Saved some money")
	qs("Got some kicks")
	qs("Got a look")
	qs("Became a rebel")
	qs("Found your roots")
	qs("Got a pet")
	qs("Signed your first deal")
	qs("Got an ego")
	qs("Blew your dough")
	qs("Had to show off")
	qs("Signed an endorsement deal")
	qs("Got some cold, hard, cash")
	qs("Upgraded your look")
	qs("Got fancier taste")
	qs("Partied in Cannes")
	qs("Vacationed in Egypt")
	qs("Brought back a pet lion")
	qs("'Hear me Roar' became a gold record")
	qs("Split up the band")
	qs("Ate only the finest")
	qs("Bought your own island")
	qs("Decided to go solo")
	qs("Got richer")
	qs("Became increasingly more reclusive.")
	qs("Had a cameo in a hip-hop track")
	qs("Collected rare muscle cars")
	qs("Bought a Venus de Milo knock off")
	qs("Built an enormous fish tank for the new pet shark")
	qs("Won the 'Best rock performance in a Hip-Hop cameo' award")
	qs("Wrecked your car driving home from the after party")
	qs("Went to rehab in Palm Springs")
	qs("Decided to move to Arizona to 'clear your head'")
	qs("'Toms of Life' becomes a worldwide hit.")
	qs("Did a major credit card commercial")
	qs("Got a weekend gig in Vegas")
	qs("Got married in Vegas")
	qs("Leased a private jet")
	qs("Bought a sarcophagus to sleep in")
	qs("Imported a Bengal tiger")
	qs("Got a star in Hollywood Blvd")
	qs("Burned one million dollars to make a statement")
	qs("Started your own beverage company")
	qs("Bought a castle in France")
	qs("Bought a guitar manufacturer")
	qs("Demanded to get paid in gold bricks")
	qs("Got a cult following in Norway")
	qs("Became blinded by success")
	qs("Bought a decommissioned submarine from Russia")
	qs("Commissioned a self portrait")
	qs("Replaced your butler with a robot")
	qs("Immortalized your guitar in frozen carbonite")
	qs("Became 'the bomb' literally")
	qs("Got your own scent - 'Eau de Shred'")
	qs("Performed in the space station, millions watched")
	qs("Received the Fiddle of Gold from Lou")
]

script cash_ranks_get_rank \{player = 1}
	GetPlayerInfo <player> controller
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	GetGlobalTags <band_info> savegame = <savegame> param = career_earnings
	passes = 0
	i = 0
	rank = 1
	begin
	Mod a = <i> b = 50
	index = <Mod>
	if (<index> = 0)
		if NOT (<rank> = 1)
			passes = (<passes> + 1)
		endif
	endif
	t1 = ($cash_rank_thresholds [<index>])
	t2 = (<passes> * ($cash_rank_thresholds) [49])
	thresh = (<t1> + <t2>)
	if (<career_earnings> >= <thresh>)
		rank = (<rank> + 1)
	else
		next_rank = <thresh>
		break
	endif
	i = (<i> + 1)
	repeat 250
	if (<rank> >= 251)
		next_rank = (5 * ($cash_rank_thresholds) [49])
		passes = 5
	endif
	return rank = <rank> cash_to_next_rank = <next_rank> turnovers = <passes> career_earnings = <career_earnings>
endscript

script cash_ranks_get_patch_id \{player = 1}
	cash_ranks_get_rank player = <player>
	if (<rank> < 10)
		FormatText checksumname = patch_id 'cash_milestones_patch_00%d' d = <rank>
	elseif (<rank> < 51)
		FormatText checksumname = patch_id 'cash_milestones_patch_0%d' d = <rank>
	else
		FormatText checksumname = patch_id 'cash_milestones_patch_05%d' d = <turnovers>
	endif
	printf channel = mychannel qs("\LCalled get_patch_id player = %d") d = <player>
	return cash_patch_id = <patch_id>
endscript

script cash_ranks_get_icon_id \{player = 1}
	cash_ranks_get_rank player = <player>
	if (<rank> < 10)
		FormatText checksumname = icon_id 'cash_milestone_icon_00%d' d = <rank>
	elseif (<rank> < 51)
		FormatText checksumname = icon_id 'cash_milestone_icon_0%d' d = <rank>
	else
		FormatText checksumname = icon_id 'cash_milestone_icon_05%d' d = <turnovers>
	endif
	printf channel = mychannel qs("\LCalled get_icon_id player = %d") d = <player>
	return cash_icon_id = <icon_id>
endscript

script cash_get_info_from_earnings \{earnings = 0}
	passes = 0
	i = 0
	rank = 1
	begin
	Mod a = <i> b = 50
	index = <Mod>
	if (<index> = 0)
		if NOT (<rank> = 1)
			passes = (<passes> + 1)
		endif
	endif
	t1 = ($cash_rank_thresholds [<index>])
	t2 = (<passes> * ($cash_rank_thresholds) [49])
	thresh = (<t1> + <t2>)
	if (<earnings> >= <thresh>)
		rank = (<rank> + 1)
	else
		next_rank = <thresh>
		break
	endif
	i = (<i> + 1)
	repeat 250
	if (<rank> >= 251)
		next_rank = (5 * ($cash_rank_thresholds) [49])
		passes = 5
	endif
	if (<rank> < 10)
		FormatText checksumname = icon_id 'cash_milestone_icon_00%d' d = <rank>
	elseif (<rank> < 51)
		FormatText checksumname = icon_id 'cash_milestone_icon_0%d' d = <rank>
	else
		FormatText checksumname = icon_id 'cash_milestone_icon_05%d' d = <passes>
	endif
	printstruct channel = mychannel <...>
	return rank = <rank> cash_icon_id = <icon_id>
endscript
