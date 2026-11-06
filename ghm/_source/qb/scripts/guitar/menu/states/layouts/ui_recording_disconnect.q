
script ui_create_recording_disconnect \{training = 0}
	player = 1
	begin
	formattext checksumname = volume_event_handler 'jam_volume_event_handler_%s' s = <player>
	if screenelementexists id = <volume_event_handler>
		destroyscreenelement id = <volume_event_handler>
	endif
	formattext checksumname = pan_event_handler 'jam_pan_event_handler_%s' s = <player>
	if screenelementexists id = <pan_event_handler>
		destroyscreenelement id = <pan_event_handler>
	endif
	formattext checksumname = bpm_event_handler 'jam_bpm_event_handler_%s' s = <player>
	if screenelementexists id = <bpm_event_handler>
		destroyscreenelement id = <bpm_event_handler>
	endif
	formattext checksumname = tuning_event_handler 'jam_tuning_event_handler_%s' s = <player>
	if screenelementexists id = <tuning_event_handler>
		destroyscreenelement id = <tuning_event_handler>
	endif
	player = (<player> + 1)
	repeat 4
	if screenelementexists \{id = vmenu_marker}
		launchevent \{type = unfocus
			target = vmenu_marker}
	endif
	if jam_studio_element :desc_resolvealias \{name = marker_box}
		if screenelementexists id = <resolved_id>
			<resolved_id> :setprops pos = (-27.0, 800.0)
		endif
	endif
	if screenelementexists \{id = jam_marker_container}
		destroyscreenelement \{id = jam_marker_container}
	endif
	if screenelementexists \{id = change_marker_option_event_handler}
		destroyscreenelement \{id = change_marker_option_event_handler}
	endif
	if screenelementexists \{id = popup_warning_container}
		ui_destroy_recording_disconnect
	endif
	if (($in_pause_menu) = 1)
		jam_band_remove_pause
	endif
	if 0x8658e568
		destroy_loading_screen
	endif
	if (<training> = 1)
		options = [
			{
				func = ui_recording_disconnect_quit
				func_params = {<...>}
				text = qs(0x67d9c56d)
				sound_func = nullscript
			}
		]
	elseif gotparam \{recording_studio}
		options = [
			{
				func = ui_recording_disconnect_continue
				func_params = {<...>}
				text = qs(0x0e41fe46)
				sound_func = nullscript
			}
		]
	else
		options = [
			{
				func = ui_recording_disconnect_continue
				func_params = {<...>}
				text = qs(0x182f0173)
				sound_func = nullscript
			}
			{
				func = ui_recording_disconnect_quit
				text = qs(0x67d9c56d)
				sound_func = nullscript
			}
		]
	endif
	create_popup_warning_menu {
		title = qs(0xaa163738)
		textblock = {
			text = qs(0x00000000)
		}
		options = <options>
		player_device = ($primary_controller)
	}
	popupelement :settags \{is_disconnect_warning = true}
	if (<training> = 1)
		killspawnedscript \{id = jam_tutorial_topic_spawn}
		killspawnedscript \{id = jam_tutorial_spawns}
		training_destroy_narrator_icons
		change \{jam_tutorial_status = inactive}
	endif
	if gotparam \{recording_studio}
		if (<training> = 1)
			popupelement :obj_spawnscript ui_recording_studio_disconnect_update params = {training = <training>}
		else
			popupelement :obj_spawnscript \{ui_recording_studio_disconnect_update}
		endif
	else
		if gotparam \{0x9b5d183a}
			popupelement :obj_spawnscript \{ui_recording_studio_disconnect_update
				params = {
					0x9b5d183a
				}}
		else
			popupelement :obj_spawnscript \{ui_recording_studio_disconnect_update}
		endif
	endif
endscript

script ui_destroy_recording_disconnect 
	destroy_popup_warning_menu
	0x807481eb
endscript

script ui_recording_disconnect_update \{training = 0}
	old_text = qs(0x52122f6e)
	begin
	text = qs(0x00000000)
	getcontrollertype controller = ($primary_controller)
	getactivecontrollers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	if (((<controller_type> != guitar) && (<controller_type> != drum)) || <is_active_controller> != 1)
		if (<training> = 1)
			text = qs(0x89985c62)
		else
			text = qs(0x50744810)
		endif
	else
		if (<controller_type> = guitar)
			text = (<text> + qs(0x6bb8afcf))
		elseif (<controller_type> = drum)
			if isrbdrum controller = ($primary_controller)
				text = (<text> + qs(0x764e9343))
			else
				text = (<text> + qs(0xa2d3a7a1))
			endif
		endif
	endif
	if NOT (<old_text> = <text>)
		se_setprops {popupbody_text = <text>}
		old_text = <text>
	endif
	wait \{5
		gameframes}
	repeat
endscript

script ui_recording_studio_disconnect_update 
	old_text = qs(0x52122f6e)
	begin
	text = qs(0x00000000)
	getcontrollertype controller = ($primary_controller)
	getactivecontrollers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	if (<is_active_controller> != 1)
		if gotparam \{0x9b5d183a}
			text = qs(0x89985c62)
		else
			text = qs(0x50744810)
		endif
	else
		if (<controller_type> = guitar)
			text = (<text> + qs(0x6bb8afcf))
		elseif (<controller_type> = drum)
			if isrbdrum controller = ($primary_controller)
				text = (<text> + qs(0x764e9343))
			else
				text = (<text> + qs(0xa2d3a7a1))
			endif
		else
			if gotparam \{0x9b5d183a}
				text = qs(0x89985c62)
			else
				text = qs(0x50744810)
			endif
		endif
	endif
	if NOT (<old_text> = <text>)
		se_setprops {popupbody_text = <text>}
		old_text = <text>
	endif
	wait \{5
		gameframes}
	repeat
endscript

script ui_recording_disconnect_continue 
	getcontrollertype controller = ($primary_controller)
	if NOT ((<controller_type> = guitar) || (<controller_type> = drum))
		menu_scroll_end_sound
		return
	endif
	getactivecontrollers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	if (<is_active_controller> != 1)
		menu_scroll_end_sound
		return
	endif
	if ui_event_exists_in_stack \{name = 'jam_tutorials'}
		generic_event_back \{state = uistate_jam_tutorials}
	elseif screenelementexists \{id = jam_song_select_container}
		destroy_jam_song_select_menu
		generic_event_back \{state = uistate_jam_select_song}
		create_loading_screen
	else
		generic_event_back \{data = {
				editing = 1
			}}
	endif
endscript

script ui_recording_disconnect_quit 
	if ui_event_exists_in_stack \{name = 'jam_tutorials'}
		change \{g_in_tutorial = 0}
		change \{0x902aade3 = 0}
		generic_event_back \{state = uistate_jam_tutorials}
	elseif ui_event_exists_in_stack \{name = 'extras'}
		generic_event_back \{state = uistate_extras}
	else
		create_loading_screen
		wait \{3
			gameframes}
		generic_event_back \{state = uistate_mainmenu}
	endif
endscript
