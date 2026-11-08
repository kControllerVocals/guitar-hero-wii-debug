
script ui_create_leaderboard_timeout 
	if isXenon
		text = qs("You must be signed in to Xbox LIVE to access leaderboards.")
	else
		text = $wii_not_signed_in
	endif
	if GotParam \{cable_unplugged}
		text = (<text> + qs("\L ") + qs("Your network connection has been disconnected."))
	elseif GotParam \{lost_lobby_connection}
		text = (<text> + qs("\L ") + qs("You have lost connection to the Lobby Server."))
	endif
	text = (<text> + qs("\L ") + qs("Please connect and try again."))
	create_popup_warning_menu {
		player_device = ($lb_controller)
		title = qs("WARNING")
		textblock = {
			text = <text>
		}
		options = [
			{
				func = generic_event_back
				text = qs("CONTINUE")
				sound_func = nullscript
			}
		]
	}
endscript

script ui_destroy_leaderboard_timeout 
	destroy_popup_warning_menu
endscript
