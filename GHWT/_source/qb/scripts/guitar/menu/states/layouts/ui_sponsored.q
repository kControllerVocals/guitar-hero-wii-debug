
script ui_create_sponsored 
	get_tier_from_song \{song = $current_song}
	FormatText checksumname = tier 'tier%d' d = <tier_number>
	sponsor = ($sponsor_info.<tier>)
	sponsorship_value = (<sponsor>.sponsorship_value)
	get_current_band_info
	GetGlobalTags <band_info>
	<Cash> = (<Cash> + <sponsorship_value>)
	sponsorship_value = (<sponsorship_value> + $player1_status.new_cash)
	change \{structurename = player1_status
		new_cash = 0}
	FormatText TextName = Cash qs("\L$%a") a = <sponsorship_value>
	CreateScreenElement \{parent = root_window
		id = MyInterfaceElement
		type = DescInterface
		desc = 'sponsor'}
	MyInterfaceElement :SetProps {
		logo_texture = (<sponsor>.logo_texture)
		description_text = (<sponsor>.sponsorship_desc)
		cash_text = <Cash>
		photo_texture = (<sponsor>.product_texture)
		event_handlers = [{pad_choose generic_event_back params = {state = uistate_gig_posters}}]
	}
	ui_gig
	AssignAlias \{id = MyInterfaceElement
		alias = current_menu}
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 100000}
endscript

script ui_destroy_sponsored 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :Die
	endif
	clean_up_user_control_helpers
endscript
sponsor_info = {
	tier1 = {
		logo_texture = Sponsor_Logo_AT
		product_texture = sponsor_photo_AT
		sponsorship_desc = qs("Audio-Technica was impressed with the show! Time to take it to the next level! They're handing you a sponsorship deal, and setting you up with their legendary microphones.")
		sponsorship_value = 1440
	}
	tier2 = {
		logo_texture = Sponsor_Logo_Line6
		product_texture = sponsor_photo_line6
		sponsorship_desc = qs("Line 6 thought you slayed at that last show, so now it's time to turn it up! They're handing you a sponsorship deal, and sweet Line 6 gear so you can nail your tone.")
		sponsorship_value = 1440
	}
	tier3 = {
		logo_texture = Sponsor_Logo_ErnieBall
		product_texture = sponsor_photo_ernieBall
		sponsorship_desc = qs("Ernie Ball thinks you're going places. They want to help you get there! They're handing you a sponsorship deal, and all the strings you can break, so play hard!")
		sponsorship_value = 1440
	}
	tier4 = {
		logo_texture = Sponsor_Logo_Mackie
		product_texture = sponsor_photo_mackie
		sponsorship_desc = qs("Mackie thinks you're the next big thing. Don't let your head outgrow your body! They're sponsoring you with some shred-tastic monitors so you can hear yourself over the drums.")
		sponsorship_value = 1440
	}
	tier5 = {
		logo_texture = Sponsor_Logo_Zildjian
		product_texture = sponsor_photo_zildjian
		sponsorship_desc = qs("The brass at Zildjian thinks you're heading to the top--so you better know how to ''crash!'' They're handing you their line of cymbals with a sponsorship deal, so make some noise!")
		sponsorship_value = 1440
	}
	tier6 = {
		logo_texture = Sponsor_Logo_Crate
		product_texture = sponsor_photo_crate
		sponsorship_desc = qs("Crate Amps is convinced you're hot. It's time to turn up the heat! Your eardrums may hurt, but your wallet won't--they're sponsoring you with all the amps you can eat!")
		sponsorship_value = 1440
	}
	tier7 = {
		logo_texture = Sponsor_Logo_Krank
		product_texture = sponsor_photo_krank
		sponsorship_desc = qs("Krank Amplification thought your solos were on fire! They say if you play with Krank you'll be hooked. Good thing you have a free supply! Can you say ''sponsorship rules?''")
		be
		sponsorship_value = 1440
	}
}
