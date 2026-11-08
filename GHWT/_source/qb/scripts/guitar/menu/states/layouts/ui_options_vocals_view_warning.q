
script ui_create_options_vocals_view_warning 
	vocals_get_highway_view player = <player>
	<vocals_highway_view> = <highway_view>
	if (<vocals_highway_view> = static)
		<other_view> = qs("SCROLLING")
	else
		<other_view> = qs("STATIC")
	endif
	FormatText {
		TextName = message
		qs("Changing the vocals view will require you to restart the song. Do you want to switch to %s?")
		s = <other_view>
	}
	create_popup_warning_menu {
		no_background
		title = qs("WARNING")
		textblock = {text = <message>}
		options = [
			{
				func = generic_event_back
				text = qs("CANCEL")
			}
			{
				func = options_change_vocals_highway_view
				func_params = {controller = <controller> player = <player>}
				text = qs("CONTINUE")
			}
		]
		player_device = <controller>
	}
endscript

script ui_destroy_options_vocals_view_warning 
	destroy_popup_warning_menu
endscript
