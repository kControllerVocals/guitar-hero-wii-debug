
script ui_create_special_event_popup 
	destroy_popup_warning_menu
	create_popup_warning_menu \{title = qs("SPECIAL EVENT")
		header_offset = (0.0, -50.0)
		textblock = {
			text = qs("So you think you're ready to join the band? Well we're not going to let you in just like that. You're going to have to prove you can play... from memory. We're going to play this song during our next show. We'll let you practice it for a while and then ask you to play a part from memory. Think you can do that?")
			pos = (640.0, 370.0)
			scale = 0.475
			dims = (1000.0, 500.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {
					special_event_popup_continue
				}
				text = qs("CONTINUE")
			}
			{
				func = {
					generic_event_back
				}
				text = qs("GO BACK")
			}
		]}
endscript

script ui_destroy_special_event_popup 
	destroy_popup_warning_menu
endscript

script special_event_popup_continue 
	ui_event event = menu_change data = {state = uistate_select_song_section <...>}
endscript

script special_event_2_ingame_setup 
	GetPlayerInfo \{1
		part}
	FormatText \{checksumname = event_num
		'special_event%d'
		d = $current_special_event_num}
	FormatText \{checksumname = challenge_num
		'challenge%d'
		d = $current_special_event_challenge_num}
	FormatText checksumname = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
	if (($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [0]) > 0)
		start_index = (($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [0]))
	else
		start_index = 0
	endif
	end_index = (<start_index> + 1)
	get_song_section_array
	GetMarkerArraySize array = (<song_section_array>)
	if (<array_size> > 0 && <start_index> >= 0)
		change practice_start_time = (($<song_section_array> [<start_index>]).time)
		change practice_start_index = <start_index>
		if (<end_index> = <array_size> + 1)
			setup_gemarrays song_name = ($current_song) difficulty = ($player1_status.difficulty) player_status = player1_status
			get_song_end_time song = ($current_song) for_practice = 1
			change practice_end_time = <total_end_time>
		else
			change practice_end_time = (($<song_section_array> [<end_index>]).time)
			change practice_end_index = <end_index>
		endif
	else
		change \{practice_start_time = 0}
		get_song_end_time song = ($current_song) for_practice = 1
		change practice_end_time = <total_end_time>
	endif
	setup_special_event \{num = $current_special_event_num}
	change \{gameplay_restart_song = 1}
	generic_event_back \{state = uistate_gameplay}
endscript
