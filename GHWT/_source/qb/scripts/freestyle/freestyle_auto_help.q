freestyle_auto_help_tilt_time = 30000
freestyle_auto_help_tilt_changes_to_disable = 2
freestyle_auto_help_tilt_repeat_time = 90000
freestyle_auto_help_hopo_time = 50000
freestyle_auto_help_hopo_notes_to_disable = 3
freestyle_auto_help_hopo_repeat_time = 120000
freestyle_auto_help_loops_time = 30000
freestyle_auto_help_loops_repeat_time = 90000
freestyle_auto_help_transition_time = 30000
freestyle_auto_help_transition_repeat_time = 90000
freestyle_auto_help_drum_records_to_disable = 1
freestyle_auto_help_drum_record_time = 60000
freestyle_auto_help_drum_record_repeat_time = 120000
freestyle_auto_help_drum_crashes_to_disable = 2
freestyle_auto_help_drum_crash_time = 40000
freestyle_auto_help_drum_crash_repeat_time = 120000
freestyle_auto_help_drum_toms_to_disable = 2
freestyle_auto_help_drum_tom_time = 80000
freestyle_auto_help_drum_tom_repeat_time = 120000
freestyle_auto_help_drum_delete_time = 30000
freestyle_auto_help_drum_delete_repeat_time = 90000
freestyle_auto_help_tag_transition = 0
freestyle_auto_help_enabled = 1
freestyle_auto_help_enabled_last = 1
freestyle_auto_help_last_transition_msg = 0

script freestyle_reset_auto_help 
	player = 0
	begin
	freestyle_reset_player_auto_help player = <player>
	<player> = (<player> + 1)
	repeat $freestyle_max_players
	change \{freestyle_auto_help_last_transition_msg = 0}
endscript

script freestyle_reset_player_auto_help 
	GetStartTime
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = last_triggered_tilt value = -1
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = tilt_changed_count value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = tilt_help_time value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = tilt_interval_time value = <StartTime>
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = hopo_count value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = hopo_help_time value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = hopo_interval_time value = <StartTime>
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = last_loop_time value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = loop_help_time value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_record_count value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_record_interval_time value = <StartTime>
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_record_help_time value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_crash_count value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_crash_interval_time value = <StartTime>
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_crash_help_time value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_tom_count value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_tom_interval_time value = <StartTime>
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_tom_help_time value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_last_record_time value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_last_delete_time value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_delete_help_time value = 0
endscript

script freestyle_update_auto_help 
	if ($freestyle_auto_help_enabled != $freestyle_auto_help_enabled_last)
		if ($freestyle_auto_help_enabled = 1)
			freestyle_reset_auto_help
		endif
		change freestyle_auto_help_enabled_last = ($freestyle_auto_help_enabled)
	endif
	if ($freestyle_auto_help_enabled = 0)
		return
	endif
	player = 0
	begin
	if has_valid_controller player = <player>
		switch ($freestyle_player_data [<player>].instrument)
			case guitar
			freestyle_update_auto_help_guitar player = <player>
			case Drums
			freestyle_update_auto_help_drums player = <player>
		endswitch
	endif
	<player> = (<player> + 1)
	repeat $freestyle_max_players
	if is_guitarist_human
		human = 1
	else
		human = 0
	endif
	if (($freestyle_special_card_added = 1) && (<human> = 1))
		GetElapsedTime StartTime = ($freestyle_auto_help_last_transition_msg)
		if (($freestyle_auto_help_last_transition_msg = 0) || (<ElapsedTime> > $freestyle_auto_help_transition_repeat_time))
			GetElapsedTime StartTime = ($freestyle_special_card_time_added)
			if (<ElapsedTime> > $freestyle_auto_help_transition_time)
				freestyle_hud_show_help_text \{text = $wii_freestyle_transition_help
					tag = $freestyle_auto_help_tag_transition}
				GetStartTime
				change freestyle_auto_help_last_transition_msg = <StartTime>
			endif
		endif
	endif
endscript

script freestyle_update_auto_help_guitar 
	if GetGuitarEventTriggered player = <player> all
		was_event_triggered = 1
	else
		was_event_triggered = 0
	endif
	if GetGuitarEventPlaying player = <player> all
		is_event_playing = 1
	else
		is_event_playing = 0
	endif
	GetArraySize <event_triggered_array>
	if (<was_event_triggered> = 1)
		if GetGuitarActiveTilt player = <player>
			if (<active_tilt> != ($freestyle_player_data [<player>].last_triggered_tilt))
				tilt_changed_count = ($freestyle_player_data [<player>].tilt_changed_count + 1)
				SetStructureParam array_name = freestyle_player_data array_index = <player> param = last_triggered_tilt value = <active_tilt>
				SetStructureParam array_name = freestyle_player_data array_index = <player> param = tilt_changed_count value = <tilt_changed_count>
			endif
		endif
		i = 0
		begin
		event_triggered = (<event_triggered_array> [<i>].event_triggered)
		modifier_triggered = (<event_triggered_array> [<i>].modifier_triggered)
		if ((<modifier_triggered> = hammer_on) || (<modifier_triggered> = pull_off))
			hopo_count = ($freestyle_player_data [<player>].hopo_count + 1)
			SetStructureParam array_name = freestyle_player_data array_index = <player> param = hopo_count value = <hopo_count>
		endif
		if ((<i> = 1) && (<event_triggered> >= 0))
			GetStartTime
			SetStructureParam array_name = freestyle_player_data array_index = <player> param = last_loop_time value = <StartTime>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	freestyle_auto_help_value_based_trigger {
		player = <player>
		interval_stamp_param = tilt_interval_time
		help_stamp_param = tilt_help_time
		interval_time = $freestyle_auto_help_tilt_time
		repeat_time = $freestyle_auto_help_tilt_repeat_time
		value_param = tilt_changed_count
		disable_value = $freestyle_auto_help_tilt_changes_to_disable
		message = $wii_freestyle_tilt_help
	}
	freestyle_auto_help_value_based_trigger {
		player = <player>
		interval_stamp_param = hopo_interval_time
		help_stamp_param = hopo_help_time
		interval_time = $freestyle_auto_help_hopo_time
		repeat_time = $freestyle_auto_help_hopo_repeat_time
		value_param = hopo_count
		disable_value = $freestyle_auto_help_hopo_notes_to_disable
		message = $wii_freestyle_hopo_help
	}
	if (<event_playing_array> [1].event_playing >= 0)
		freestyle_auto_help_time_based_trigger {
			player = <player>
			stamp_param = last_loop_time
			help_stamp_param = loop_help_time
			time_limit = $freestyle_auto_help_loops_time
			repeat_time = $freestyle_auto_help_loops_repeat_time
			message = $wii_freestyle_loop_help
		}
	endif
endscript

script freestyle_update_auto_help_drums 
	freestyle_auto_help_value_based_trigger {
		player = <player>
		interval_stamp_param = drum_record_interval_time
		help_stamp_param = drum_record_help_time
		interval_time = $freestyle_auto_help_drum_record_time
		repeat_time = $freestyle_auto_help_drum_record_repeat_time
		value_param = drum_record_count
		disable_value = $freestyle_auto_help_drum_records_to_disable
		message = $wii_freestyle_drum_record_help
	}
	freestyle_auto_help_value_based_trigger {
		player = <player>
		interval_stamp_param = drum_crash_interval_time
		help_stamp_param = drum_crash_help_time
		interval_time = $freestyle_auto_help_drum_crash_time
		repeat_time = $freestyle_auto_help_drum_crash_repeat_time
		value_param = drum_crash_count
		disable_value = $freestyle_auto_help_drum_crashes_to_disable
		message = $wii_freestyle_drum_crash_help
	}
	freestyle_auto_help_value_based_trigger {
		player = <player>
		interval_stamp_param = drum_tom_interval_time
		help_stamp_param = drum_tom_help_time
		interval_time = $freestyle_auto_help_drum_tom_time
		repeat_time = $freestyle_auto_help_drum_tom_repeat_time
		value_param = drum_tom_count
		disable_value = $freestyle_auto_help_drum_toms_to_disable
		message = $wii_freestyle_drum_tom_help
	}
	if (($freestyle_player_data [<player>].drum_last_record_time != 0) && ($freestyle_player_data [<player>].drum_last_delete_time = 0))
		freestyle_auto_help_time_based_trigger {
			player = <player>
			stamp_param = drum_last_record_time
			help_stamp_param = drum_delete_help_time
			time_limit = $freestyle_auto_help_drum_delete_time
			repeat_time = $freestyle_auto_help_drum_delete_repeat_time
			message = $wii_freestyle_drum_delete_help
		}
	endif
endscript

script freestyle_auto_help_time_based_trigger 
	GetElapsedTime StartTime = ($freestyle_player_data [<player>].<stamp_param>)
	if (<ElapsedTime> > <time_limit>)
		help_stamp = ($freestyle_player_data [<player>].<help_stamp_param>)
		GetElapsedTime StartTime = <help_stamp>
		if ((<help_stamp> = 0) || (<ElapsedTime> > <repeat_time>))
			freestyle_hud_show_help_text text = <message> player = <player>
			GetStartTime
			SetStructureParam array_name = freestyle_player_data array_index = <player> param = <help_stamp_param> value = <StartTime>
		endif
	endif
endscript

script freestyle_auto_help_value_based_trigger 
	GetElapsedTime StartTime = ($freestyle_player_data [<player>].<interval_stamp_param>)
	if (<ElapsedTime> > <interval_time>)
		GetStartTime
		if (($freestyle_player_data [<player>].<value_param>) < <disable_value>)
			help_stamp = ($freestyle_player_data [<player>].<help_stamp_param>)
			GetElapsedTime StartTime = <help_stamp>
			if ((<help_stamp> = 0) || (<ElapsedTime> > <repeat_time>))
				freestyle_hud_show_help_text text = <message> player = <player>
				SetStructureParam array_name = freestyle_player_data array_index = <player> param = <help_stamp_param> value = <StartTime>
			endif
		else
			SetStructureParam array_name = freestyle_player_data array_index = <player> param = <help_stamp_param> value = <StartTime>
		endif
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = <value_param> value = 0
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = <interval_stamp_param> value = <StartTime>
	endif
endscript

script freestyle_auto_help_notify_drum_hit 
	switch (<drum>)
		case 4
		drum_crash_count = ($freestyle_player_data [<player>].drum_crash_count)
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_crash_count value = (<drum_crash_count> + 1)
		case 3
		case 5
		drum_tom_count = ($freestyle_player_data [<player>].drum_tom_count)
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_tom_count value = (<drum_tom_count> + 1)
	endswitch
endscript

script freestyle_auto_help_notify_drum_record 
	drum_record_count = ($freestyle_player_data [<player>].drum_record_count)
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_record_count value = (<drum_record_count> + 1)
	GetStartTime
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_last_record_time value = <StartTime>
endscript

script freestyle_auto_help_notify_drum_delete 
	GetStartTime
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = drum_last_delete_time value = <StartTime>
endscript
