
script ui_create_net_signin_popup 
	if isXenon
		if NetSessionFunc \{func = IsCableUnplugged}
			text = qs("You are not currently connected to Xbox LIVE. Please connect and try again.")
		else
			text = qs("The current gamer profile is not Xbox LIVE multiplayer enabled. Please sign into an Xbox LIVE multiplayer enabled gamer profile to continue.")
		endif
	else
		text = $wii_not_signed_in
	endif
	create_popup_warning_menu {
		title = qs("Sign In")
		textblock = {
			text = <text>
		}
		options = [
			{
				func = generic_event_back
				text = qs("Continue")
			}
		]
		no_background
		popup_event_handlers = [
			{pad_back generic_event_back}
		]
	}
	AssignAlias id = <menu_id> alias = net_signin_popup
endscript

script ui_destroy_net_signin_popup 
	destroy_popup_warning_menu
endscript
