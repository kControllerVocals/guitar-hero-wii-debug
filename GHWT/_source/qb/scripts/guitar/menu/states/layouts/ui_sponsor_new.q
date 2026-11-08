
script ui_create_sponsor_new 
	RequireParams \{[
			tier_number
			tier_catagory
		]
		all}
	grab_sponsor_given_tier_and_type tier = <tier_number> type = <tier_catagory>
	sponsorship_value = (<sponsor>.sponsorship_value)
	FormatText TextName = Cash qs("\L$%a") a = <sponsorship_value> usecommas
	menu_get_sponsor_sound
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_sponsor_id
		type = DescInterface
		desc = 'sponsor_new'
		exclusive_device = <exclusive_device>
	}
	my_sponsor_id :SetProps {
		logo_texture = (<sponsor>.logo_texture)
		description_text = (<sponsor>.sponsorship_desc)
		cash_text = <Cash>
		photo_texture = (<sponsor>.product_texture)
		event_handlers = [
			{pad_choose continue_from_sponsors_screen}
		]
	}
	AssignAlias \{id = my_sponsor_id
		alias = current_menu}
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 100000}
endscript

script ui_sponsors_award_sponsor_cash 
	RequireParams \{[
			amount
		]
		all}
	Progression_GetNumLocalPlayers
	if (<num_local_players> > 1)
		amount = (<amount> / <num_local_players>)
		CastToInteger \{amount}
		printf 'ui_sponsors_award_sponsor_cash - amount after division is %f' f = <amount>
	endif
	GameMode_GetNumPlayersShown
	i = 1
	begin
	GetPlayerInfo <i> is_local_client
	if (<is_local_client> = 1)
		cash_ranks_get_rank player = <i>
		old_rank = <rank>
		GetPlayerInfo <i> controller
		get_savegame_from_controller controller = <controller>
		get_current_band_info
		GetGlobalTags savegame = <savegame> <band_info> param = Cash
		SetGlobalTags savegame = <savegame> <band_info> params = {Cash = (<Cash> + <amount>)}
		GetGlobalTags savegame = <savegame> <band_info> param = career_earnings
		SetGlobalTags savegame = <savegame> <band_info> params = {career_earnings = (<career_earnings> + <amount>)}
		SetPlayerInfo <i> career_earnings = (<career_earnings> + <amount>)
		cash_ranks_get_rank player = <i>
		new_rank = <rank>
		if NOT (<new_rank> = <old_rank>)
			SetPlayerInfo <i> cash_rank_up = 1
			printf 'Rank up %d from sponsor money' d = <i>
			someone_ranked_up = 1
		endif
	endif
	i = (<i> + 1)
	repeat <num_players_shown>
	if GotParam \{someone_ranked_up}
		i = 1
		begin
		GetPlayerInfo <i> is_local_client
		if (<is_local_client> = 1)
			SetPlayerInfo <i> cash_rank_up = 1
			printf 'someone_ranked_up - Rank up %d from sponsor money' d = <i>
		endif
		i = (<i> + 1)
		repeat <num_players_shown>
	endif
endscript

script ui_destroy_sponsor_new 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_sponsor_id}
endscript

script continue_from_sponsors_screen 
	printf \{channel = test
		qs("\Lcontinue on from the sponsors screen")}
	progression_get_new_unlocks
	GetArraySize <new_unlocks>
	if (<array_size> > 0)
		generic_event_replace \{state = uistate_rewards}
	else
		ui_att_ballpark_should_i_show_ad
		if (<show_att_ad> = 1)
			generic_event_choose \{state = uistate_att_ballpark}
		else
			ui_win_song_continue_next_menu
		endif
	endif
endscript

script grab_sponsor_given_tier_and_type 
	RequireParams \{[
			tier
			type
		]
		all}
	FormatText checksumname = tier 'tier%d' d = <tier>
	FormatText checksumname = spons_info 'sponsor_info_%d' d = <type>
	sponsor = ($<spons_info>.<tier>)
	return sponsor = <sponsor>
endscript

script get_num_gigs_complete_for_sponsor 
	RequireParams \{[
			player
		]
		all}
	GameMode_GetType
	if NOT (<type> = career)
		printstruct channel = mychannel <...>
		ScriptAssert \{qs("\Lui_Sponsors_new should never get shown in any mode other than career!!")}
	endif
	GetPlayerInfo <player> controller
	get_savegame_from_controller controller = <controller>
	GetPlayerInfo <player> part
	if (($current_num_players) > 1)
		my_mode = Career_Band
	else
		switch (<part>)
			case guitar
			my_mode = Career_Guitar
			case Bass
			my_mode = Career_Bass
			case drum
			my_mode = Career_Drum
			case Vocals
			my_mode = Career_Vocals
		endswitch
	endif
	get_progression_globals <my_mode>
	songlist = <tier_global>
	setlist_prefix = ($<tier_global>.prefix)
	tier = 1
	complete_count = 0
	begin
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gignum = <tier>
	GetGlobalTags <gig_name> savegame = <savegame>
	if (<completed> = 1)
		complete_count = (<complete_count> + 1)
	endif
	tier = (<tier> + 1)
	repeat ($<songlist>.num_tiers)
	format_globaltag_gigname setlist_prefix = <setlist_prefix> gignum = ($current_gig_number)
	GetGlobalTags <gig_name> savegame = <savegame>
	if (<completed> = 0)
		complete_count = (<complete_count> + 1)
	endif
	printf channel = mychannel qs("\Lplayer %d has completed %g gigs") d = <player> g = <complete_count>
	return num_gigs_beaten = <complete_count>
endscript

script did_player_get_sponsored_last_gig 
	RequireParams \{[
			player
		]
		all}
	get_num_gigs_complete_for_sponsor player = <player>
	GameMode_GetNumPlayersShown
	if (<num_players_shown> > 1)
		str = 'band'
	else
		GetPlayerInfo <player> part
		switch (<part>)
			case guitar
			str = 'guitar'
			case Bass
			str = 'bass'
			case drum
			str = 'drum'
			case Vocals
			str = 'vocals'
		endswitch
	endif
	if (<num_gigs_beaten> > 12 || <num_gigs_beaten> < 1)
		return \{got_sponsored = 0}
	elseif (<num_gigs_beaten> > 6)
		if (<str> = 'vocals')
			return \{got_sponsored = 0}
		endif
	endif
	GetPlayerInfo <player> controller
	get_savegame_from_controller controller = <controller>
	get_current_band_info
	FormatText checksumname = sponsor_flags_chk 'got_sponsored_%s_t%d' s = <str> d = <num_gigs_beaten>
	GetGlobalTags <band_info> savegame = <savegame> param = <sponsor_flags_chk>
	flag = (<...>.<sponsor_flags_chk>)
	been_sponsored = <flag>
	if NOT (<been_sponsored> = 0)
		return \{got_sponsored = 0}
	endif
	AddParam name = <sponsor_flags_chk> structure_name = my_flag value = 1
	SetGlobalTags <band_info> savegame = <savegame> params = <my_flag>
	printf channel = mychannel qs("\LPlayer %s Got Sponsored!") s = <player>
	return got_sponsored = 1 tier_number = <num_gigs_beaten> tier_catagory = <str>
endscript
sponsor_info_band = {
	tier1 = {
		logo_texture = Sponsor_Logo_ErnieBall
		product_texture = sponsor_photo_ernieBall
		sponsorship_desc = qs("Ernie Ball thinks you shred!  Join forces with the world's most famous guitar string brand as you continue your journey to rock's elite status.  A full sponsorship has been offered!")
		sponsorship_value = 200
	}
	tier2 = {
		logo_texture = Sponsor_Logo_evans
		product_texture = sponsor_photo_evans
		sponsorship_desc = qs("Evans likes the way your drummer pounds the skins.  So they're throwing down a drum head sponsorship.  So don't be afraid to pound 'em.")
		sponsorship_value = 250
	}
	tier3 = {
		logo_texture = Sponsor_Logo_Line6
		product_texture = sponsor_photo_line6
		sponsorship_desc = qs("Line 6 thought you slayed at that last show, so now it's time to turn it up! They're handing you a sponsorship deal, and sweet Line 6 gear so you can nail your tone.")
		sponsorship_value = 300
	}
	tier4 = {
		logo_texture = Sponsor_Logo_sabian
		product_texture = sponsor_photo_sabian
		sponsorship_desc = qs("The brass at Sabian thinks you're heading to the top--so you better know how to ''crash!'' They're handing you their line of cymbals with a sponsorship deal, so make some noise!")
		sponsorship_value = 350
	}
	tier5 = {
		logo_texture = Sponsor_Logo_vox
		product_texture = sponsor_photo_vox
		sponsorship_desc = qs("Vox Amps is convinced you're hot. It's time to turn up the heat! Your eardrums may hurt, but your wallet won't--they're sponsoring you with all the amps you can eat!")
		sponsorship_value = 400
	}
	tier6 = {
		logo_texture = Sponsor_Logo_AT
		product_texture = sponsor_photo_AT
		sponsorship_desc = qs("Audio-Technica was impressed with the show! Time to take it to the next level! They're handing you a sponsorship deal, and setting you up with their legendary microphones.")
		sponsorship_value = 450
	}
	tier7 = {
		logo_texture = Sponsor_Logo_oc_drums
		product_texture = sponsor_photo_oc
		sponsorship_desc = qs("OC drums has had their eye on you.  They think your drummer is the next 'Tommy Lee Bonham' and they're putting their money where their mouth is by giving you a drum sponsorship deal.")
		sponsorship_value = 500
	}
	tier8 = {
		logo_texture = Sponsor_Logo_Krank
		product_texture = sponsor_photo_krank
		sponsorship_desc = qs("Krank Amplification thought your solos were on fire! They say if you play with Krank you'll be hooked. Good thing you have a free supply! Can you say ''sponsorship rules?''")
		sponsorship_value = 550
	}
	tier9 = {
		logo_texture = Sponsor_Logo_Marshall
		product_texture = sponsor_photo_marshall
		sponsorship_desc = qs("Marshall amps thinks it's time they saw you in front of a wall of Marshall Stacks!  They're kicking down an amp sponsorship deal so you can continue to melt faces with your solos.")
		sponsorship_value = 600
	}
	tier10 = {
		logo_texture = Sponsor_Logo_Mackie
		product_texture = sponsor_photo_mackie
		sponsorship_desc = qs("Mackie thinks you're the next big thing. Don't let your head outgrow your body! They're sponsoring you with some shred-tastic monitors so you can hear yourself over the drums.")
		sponsorship_value = 650
	}
	tier11 = {
		logo_texture = Sponsor_Logo_pork_pie
		product_texture = sponsor_photo_porkpie
		sponsorship_desc = qs("Pork Pie drums was blown away by the performance.  As an up-and-coming brand, Pork Pie thinks sponsoring you would be a great way to take their brand to the next level!  Enjoy!")
		sponsorship_value = 750
	}
	tier12 = {
		logo_texture = Sponsor_Logo_ampeg
		product_texture = sponsor_photo_ampeg
		sponsorship_desc = qs("Ampeg is worried your bass player isn't getting heard.  They're giving you a bass amp sponsorship so he can turn it up and blow some eardrums.")
		sponsorship_value = 1000
	}
}
sponsor_info_guitar = {
	tier1 = {
		logo_texture = Sponsor_Logo_ErnieBall
		product_texture = sponsor_photo_ernieBall
		sponsorship_desc = qs("Ernie Ball thinks you shred!  Join forces with the world's most famous guitar string brand as you continue your journey to rock's elite status.  A full sponsorship has been offered!")
		sponsorship_value = 500
	}
	tier3 = {
		logo_texture = Sponsor_Logo_emg
		product_texture = sponsor_photo_emg
		sponsorship_desc = qs("EMG pickups thinks you're the hottest thing around.  So they're going to sponsor you with a truckload of free pickups for your guitar.")
		sponsorship_value = 750
	}
	tier5 = {
		logo_texture = Sponsor_Logo_Line6
		product_texture = sponsor_photo_line6
		sponsorship_desc = qs("Line 6 thought you slayed at that last show, so now it's time to turn it up! They're handing you a sponsorship deal, and sweet Line 6 gear so you can nail your tone.")
		sponsorship_value = 900
	}
	tier6 = {
		logo_texture = Sponsor_Logo_vox
		product_texture = sponsor_photo_vox
		sponsorship_desc = qs("Vox Amps is convinced you're hot. It's time to turn up the heat! Your eardrums may hurt, but your wallet won't--they're sponsoring you with all the amps you can eat!")
		sponsorship_value = 1000
	}
	tier8 = {
		logo_texture = Sponsor_Logo_Krank
		product_texture = sponsor_photo_krank
		sponsorship_desc = qs("Krank Amplification thought your solos were on fire! They say if you play with Krank you'll be hooked. Good thing you have a free supply! Can you say ''sponsorship rules?''")
		sponsorship_value = 1350
	}
	tier10 = {
		logo_texture = Sponsor_Logo_Marshall
		product_texture = sponsor_photo_marshall
		sponsorship_desc = qs("Marshall amps thinks it's time they saw you in front of a wall of Marshall Stacks!  They're kicking down an amp sponsorship deal so you can continue to melt faces with your solos.")
		sponsorship_value = 1500
	}
}
sponsor_info_bass = {
	tier1 = {
		logo_texture = Sponsor_Logo_ErnieBall
		product_texture = sponsor_photo_ernieBall
		sponsorship_desc = qs("Ernie Ball thinks you shred!  Join forces with the world's most famous guitar string brand as you continue your journey to rock's elite status.  A full sponsorship has been offered!")
		sponsorship_value = 500
	}
	tier3 = {
		logo_texture = Sponsor_Logo_emg
		product_texture = sponsor_photo_emg
		sponsorship_desc = qs("EMG pickups thinks you're the hottest thing around.  So they're going to sponsor you with a truckload of free pickups for your bass.")
		sponsorship_value = 750
	}
	tier5 = {
		logo_texture = Sponsor_Logo_Line6
		product_texture = sponsor_photo_line6
		sponsorship_desc = qs("Line 6 thought you slayed at that last show, so now it's time to turn it up! They're handing you a sponsorship deal, and sweet Line 6 gear so you can nail your tone.")
		sponsorship_value = 900
	}
	tier6 = {
		logo_texture = Sponsor_Logo_Krank
		product_texture = sponsor_photo_krank
		sponsorship_desc = qs("Krank Amplification thought your solos were on fire! They say if you play with Krank you'll be hooked. Good thing you have a free supply! Can you say ''sponsorship rules?''")
		sponsorship_value = 1000
	}
	tier8 = {
		logo_texture = Sponsor_Logo_ampeg
		product_texture = sponsor_photo_ampeg
		sponsorship_desc = qs("Ampeg is worried your bass isn't getting heard.  They're giving you a bass amp sponsorship so you can turn it up and blow some eardrums.")
		sponsorship_value = 1350
	}
	tier10 = {
		logo_texture = Sponsor_Logo_Marshall
		product_texture = sponsor_photo_marshall
		sponsorship_desc = qs("Marshall amps thinks it's time they saw you in front of a wall of Marshall Stacks!  They're kicking down an amp sponsorship deal so you can continue to melt faces with your solos.")
		sponsorship_value = 1500
	}
}
sponsor_info_drum = {
	tier1 = {
		logo_texture = Sponsor_Logo_Zildjian
		product_texture = sponsor_photo_zildjian
		sponsorship_desc = qs("Zildjian has noticed you've been breaking sticks as much as breaking a sweat when you play.  So they're sponsoring you and giving you all the drum sticks you can handle.")
		sponsorship_value = 500
	}
	tier2 = {
		logo_texture = Sponsor_Logo_regal
		product_texture = sponsor_photo_regal
		sponsorship_desc = qs("Regal Tip sticks digs the way you can lock into a groove.  They're giving you a sponsorship deal to show their appreciation.")
		sponsorship_value = 750
	}
	tier3 = {
		logo_texture = Sponsor_Logo_pork_pie
		product_texture = sponsor_photo_porkpie
		sponsorship_desc = qs("Pork Pie drums was blown away by the performance.  As an up-and-coming brand, Pork Pie thinks sponsoring you would be a great way to take their brand to the next level!  Enjoy!")
		sponsorship_value = 900
	}
	tier6 = {
		logo_texture = Sponsor_Logo_sabian
		product_texture = sponsor_photo_sabian
		sponsorship_desc = qs("The brass at Sabian thinks you're heading to the top--so you better know how to ''crash!'' They're handing you their line of cymbals with a sponsorship deal, so make some noise!")
		sponsorship_value = 1000
	}
	tier8 = {
		logo_texture = Sponsor_Logo_oc_drums
		product_texture = sponsor_photo_oc
		sponsorship_desc = qs("OC drums has had their eye on you.  They think your drummer is the next 'Tommy Lee Bonham' and they're putting their money where their mouth is by giving you a drum sponsorship deal.")
		sponsorship_value = 1350
	}
	tier10 = {
		logo_texture = Sponsor_Logo_evans
		product_texture = sponsor_photo_evans
		sponsorship_desc = qs("Evans likes the way you pound the skins.  So they're throwing down a drum head sponsorship.  So don't be afraid to pound 'em.")
		sponsorship_value = 1500
	}
}
sponsor_info_vocals = {
	tier1 = {
		logo_texture = Sponsor_Logo_AT
		product_texture = sponsor_photo_AT
		sponsorship_desc = qs("Audio-Technica was impressed with the show! Time to take it to the next level! They're handing you a sponsorship deal, and setting you up with their legendary microphones.")
		sponsorship_value = 2000
	}
	tier6 = {
		logo_texture = Sponsor_Logo_Mackie
		product_texture = sponsor_photo_mackie
		sponsorship_desc = qs("Mackie thinks you're the next big thing. Don't let your head outgrow your body! They're sponsoring you with some shred-tastic monitors so you can hear yourself over the drums.")
		sponsorship_value = 4000
	}
}
