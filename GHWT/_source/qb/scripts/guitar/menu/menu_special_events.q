special_event_alpha_out_gems = 0
special_event_previous_game_mode = none
special_event_stage = 0
special_event_next_state = none
special_event_song_index = 0
current_special_event = none
current_special_event_num = 1
current_special_event_challenge_num = 1
current_special_event_section = -1
current_special_event_completed = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
current_special_event_percentages = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
current_special_event_notes_total = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
current_special_event_miss_notes = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
total_special_event_time = 0

script debug_fill_out_special_event_percentages 
	i = 0
	GetArraySize \{$current_special_event_percentages}
	begin
	SetArrayElement ArrayName = current_special_event_percentages GlobalArray index = <i> newvalue = 100
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script debug_output_special_event_tags \{gignum = $current_gig_number}
	get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = <gignum>
	GetGlobalTags <gig_name>
	printstruct <...>
endscript

script debug_output_current_special_event_notes_total 
	i = 0
	GetArraySize \{$current_special_event_notes_total}
	begin
	printf qs("\Lcurrent_special_event_notes_total[%d] = %a") d = <i> a = ($current_special_event_notes_total [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script debug_output_current_special_event_completed 
	i = 0
	GetArraySize \{$current_special_event_completed}
	begin
	printf qs("\Lcurrent_special_event_completed[%d] = %a") d = <i> a = ($current_special_event_completed [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script debug_output_current_special_event_percentages 
	i = 0
	GetArraySize \{$current_special_event_percentages}
	begin
	printf qs("\Lcurrent_special_event_percentages[%d] = %a") d = <i> a = ($current_special_event_percentages [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script debug_output_current_special_event_miss_notes 
	i = 0
	GetArraySize \{$current_special_event_miss_notes}
	begin
	printf qs("\Lcurrent_special_event_miss_notes[%d] = %a") d = <i> a = ($current_special_event_miss_notes [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
endscript
Special_Events_Challenges = {
	special_event1 = {
		title = qs("Studio Musician")
		challenge1 = {
			title = qs("Bail us out!")
			info = qs("Studio Musicians! I need you, we've just signed a new band, and the deadline for their first album is coming up. They've got a great sound, but we're having trouble recording a few sections of one song. A member of the band isn't comfortable with the studio. We need an experienced studio musician to nail a few key parts as soon as possible. Give me a call.")
			state = uistate_select_song_section
			guitar_songs = [
				{
					song = theoneilove
					sections = [
						2
						5
						7
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = rebelyell
					sections = [
						2
						3
						7
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = rebelyell
					sections = [
						2
						3
						7
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = rebelyell
					sections = [
						2
						3
						7
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			name = se1c1_touchupsong
		}
		challenge2 = {
			title = qs("Insurance Policy Gig")
			info = qs("Studio Musicians! My record company needs you to record parts of a song. We just don't have faith our artist will be able to record them in time. The album is going over budget, and before it gets cancelled we're trying to secure some quality recordings of some important sections of one song. We have limited studio time, and need your help badly. Please contact me ASAP!")
			state = uistate_select_song_section
			guitar_songs = [
				{
					song = crazytrain
					sections = [
						2
						4
						5
						7
						8
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = crazytrain
					sections = [
						2
						4
						5
						7
						8
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = crazytrain
					sections = [
						2
						4
						5
						7
						8
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = crazytrain
					sections = [
						2
						4
						5
						7
						8
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			name = se1c2_cleanuptwosongs
		}
		challenge3 = {
			title = qs("Ghost Player")
			info = qs("Studio Musicians! I've been working with a high profile band on their latest album. We've got one track left to record on the new album, but one of the 'rock stars' had is in the hospital after a wild party mishap. I need you to record his entire part for the track. There will be no credit, but I'll make sure you're paid. Call my secretary today.")
			state = uistate_select_song_section
			guitar_songs = [
				{
					song = rebelyell
					sections = [
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = rebelyell
					sections = [
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = rebelyell
					sections = [
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = rebelyell
					sections = [
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			name = se1c3_ghostplayer
		}
	}
	special_event2 = {
		title = qs("Tribute Artist")
		challenge1 = {
			title = qs("Challenge 1")
			info = qs("Being the first challenge, the player should be capable of beating it relatively easily. The player will be allowed to practice the song as much as they want and then be allowed to try the challenge. To make this challenge easier, the section of song will be slower and very repetitive.")
			state = uistate_special_event_popup
			guitar_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			name = se2c1_tribute
		}
		challenge2 = {
			title = qs("Challenge 2")
			info = qs("The second challenge will give the player a more difficult task. The player will be allowed to practice the song as much as they want and then be allowed to try the challenge. This challenge will be made harder by picking a faster song with more notes but still very repetitive.")
			state = uistate_special_event_popup
			guitar_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			name = se2c2_tribute
		}
		challenge3 = {
			title = qs("Challenge 3")
			info = qs("The final challenge will still allow the player to practice as much as they would like but will be a much more difficult song section. The section will be quick, have a lot of notes, and not be very repetitive (possibly a solo).")
			state = uistate_special_event_popup
			guitar_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			bass_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			drum_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			vocals_songs = [
				{
					song = labamba
					sections = [
						2
					]
					allowedtomiss = [
						0
					]
					lead_in = 1000
					lead_out = 1000
				}
			]
			name = se2c3_tribute
		}
	}
	special_event3 = {
		title = qs("Song Writer")
		challenge1 = {
			name = se3c1_songwriter
			title = qs("Clean up this track!")
			info = qs("Edit this song for your demo CD")
			state = UIstate_jam_songwriter_event
			guitar_songs = [
			]
			bass_songs = [
			]
			drum_songs = [
			]
			vocals_songs = [
			]
			steps = [
				songwriter_c1_intro
				songwriter_c1_record_notes
				songwriter_c1_delete_notes
				songwriter_c1_copy_notes
				songwriter_c1_outro
			]
		}
		challenge2 = {
			title = qs("Rerecord the Guitar")
			info = qs("Your guitarist quit! Record a new Guitar track")
			state = UIstate_jam_songwriter_event
			guitar_songs = [
			]
			bass_songs = [
			]
			drum_songs = [
			]
			vocals_songs = [
			]
			steps = [
				songwriter_c2_intro
				songwriter_c2_effect
				songwriter_c2_sections
				songwriter_c2_playback
			]
			name = se3c2_songwriter
		}
		challenge3 = {
			title = qs("Challenge 3")
			guitar_songs = [
			]
			bass_songs = [
			]
			drum_songs = [
			]
			vocals_songs = [
			]
		}
	}
}

script is_special_event_completion_on \{index = 0}
	if ($current_special_event_completed [<index>] = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script set_special_event_completion_on \{index = 0}
	SetArrayElement ArrayName = current_special_event_completed GlobalArray index = <index> newvalue = 1
endscript

script reset_current_special_event_percentages 
	GetArraySize \{$current_special_event_percentages}
	index = 0
	begin
	SetArrayElement ArrayName = current_special_event_completed GlobalArray index = <index> newvalue = 0
	SetArrayElement ArrayName = current_special_event_percentages GlobalArray index = <index> newvalue = 0
	SetArrayElement ArrayName = current_special_event_notes_total GlobalArray index = <index> newvalue = 0
	SetArrayElement ArrayName = current_special_event_miss_notes GlobalArray index = <index> newvalue = 0
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script reset_current_special_event_miss_notes 
	GetArraySize \{$current_special_event_percentages}
	index = 0
	begin
	SetArrayElement ArrayName = current_special_event_miss_notes GlobalArray index = <index> newvalue = 0
	<index> = (<index> + 1)
	repeat <array_size>
endscript

script special_event_copy_over_stats_at_index \{entry = 0}
	GetPlayerInfo \{1
		current_song_section_array}
	get_section_stats section_index = <entry> section_array = <current_song_section_array>
	notes_hit = ((<notes_hit> [0]) * 1.0)
	notes_max = ((<notes_max> [0]) * 1.0)
	note_hit_percentage = ($current_special_event_percentages [<entry>])
	new_note_percentage = 0
	if (<notes_max> != 0)
		new_note_percentage = ((<notes_hit> / <notes_max>) * 100)
		CastToInteger \{new_note_percentage}
	endif
	GetArraySize \{$current_special_event_percentages}
	if (<entry> >= <array_size>)
		ScriptAssert qs("\Lcurrent_special_event_percentages array of size %a not large enough for song %s with array entry of %d") a = <array_size> s = $current_song d = <entry>
	endif
	if (<new_note_percentage> > <note_hit_percentage>)
		if (($current_special_event_miss_notes [<entry>]) < 1)
			SetArrayElement ArrayName = current_special_event_percentages GlobalArray index = <entry> newvalue = <new_note_percentage>
			<note_hit_percentage> = <new_note_percentage>
		endif
	endif
	GetArraySize ($<current_song_section_array>)
	if ((<entry> + 1) < <array_size>)
		section_time = (($<current_song_section_array> [(<entry> + 1)].time) - ($<current_song_section_array> [<entry>].time))
	else
		get_song_end_time \{song = $current_song}
		section_time = (<total_end_time> - ($<current_song_section_array> [<entry>].time))
	endif
	return note_hit_percentage = <note_hit_percentage> new_note_percentage = <new_note_percentage> section_name = <section_name> section_time = <section_time>
endscript

script special_event_copy_over_stats 
	GetPlayerInfo \{1
		current_song_section_array}
	entry = 0
	special_event_entry = 0
	GetArraySize ($<current_song_section_array>)
	section_array_size = <array_size>
	begin
	get_section_stats section_index = <entry> section_array = <current_song_section_array>
	notes_hit = ((<notes_hit> [0]) * 1.0)
	notes_max = ((<notes_max> [0]) * 1.0)
	note_hit_percentage = ($current_special_event_percentages [<entry>])
	new_note_percentage = 0
	if (<notes_max> != 0)
		new_note_percentage = ((<notes_hit> / <notes_max>) * 100)
		CastToInteger \{new_note_percentage}
	endif
	GetArraySize \{$current_special_event_percentages}
	if (<entry> >= <array_size>)
		ScriptAssert qs("\Lcurrent_special_event_percentages array of size %a not large enough for song %s with array entry of %d") a = <array_size> s = $current_song d = <entry>
	endif
	if (<new_note_percentage> > <note_hit_percentage>)
		if (($current_special_event_miss_notes [<entry>]) < 1)
			SetArrayElement ArrayName = current_special_event_percentages GlobalArray index = <entry> newvalue = <new_note_percentage>
		endif
	endif
	<entry> = (<entry> + 1)
	repeat <section_array_size>
endscript

script check_current_special_event_percentages 
	GetPlayerInfo \{1
		part}
	FormatText \{checksumname = event_num
		'special_event%d'
		d = $current_special_event_num}
	FormatText \{checksumname = challenge_num
		'challenge%d'
		d = $current_special_event_challenge_num}
	FormatText checksumname = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
	GetPlayerInfo \{1
		current_song_section_array}
	GetMarkerArraySize array = (<current_song_section_array>)
	song_section_size = <array_size>
	GetArraySize ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
	if StructureContains Structure = ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index]) allowedtomiss
		num_allowed_to_miss = ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].allowedtomiss [0])
	endif
	ret_val = true
	note_missed = 0
	total_time_left_in_sections = 0
	if GotParam \{section_to_check}
		if (($current_special_event_percentages [<section_to_check>]) != 100)
			<ret_val> = false
		endif
		if ($current_special_event_num = 2)
			if (($current_special_event_miss_notes [<section_to_check>]) > <num_allowed_to_miss>)
				<ret_val> = false
				<note_missed> = 1
			endif
		else
			if (($current_special_event_miss_notes [<section_to_check>]) > 0)
				<ret_val> = false
				<note_missed> = 1
			endif
		endif
		if (<ret_val> = false)
			if ((<section_to_check> + 1) < <song_section_size>)
				current_sec_time = (($<current_song_section_array> [<section_to_check>].time) / 1000)
				next_sec_time = (($<current_song_section_array> [(<section_to_check> + 1)].time) / 1000)
				<total_time_left_in_sections> = (<total_time_left_in_sections> + (<next_sec_time> - <current_sec_time>))
			else
				get_song_end_time \{song = $current_song}
				time_left = (<total_end_time> - (($<current_song_section_array> [<section_to_check>].time) / 1000))
				<total_time_left_in_sections> = (<total_time_left_in_sections> + <time_left>)
			endif
		endif
		if NOT GotParam \{dont_count_unplayed_sections}
			if ($current_special_event_notes_total [<section_to_check>] = 0)
				<ret_val> = true
			endif
		endif
	else
		index = 0
		if (<array_size> > 0)
			begin
			index_to_use = ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [<index>])
			can_check = 1
			if GotParam \{dont_count_unplayed_sections}
				if NOT (<index_to_use> >= $practice_start_index && <index_to_use> <= $practice_end_index)
					<can_check> = 0
				endif
			endif
			if (<can_check> = 1)
				if (($current_special_event_percentages [<index_to_use>]) != 100)
					<ret_val> = false
				else
					if GotParam \{dont_use_extra_notes}
						SetArrayElement ArrayName = current_special_event_miss_notes GlobalArray index = <index_to_use> newvalue = -1
					endif
				endif
				if ($current_special_event_num = 2)
					if (($current_special_event_miss_notes [<index_to_use>]) > <num_allowed_to_miss>)
						<ret_val> = false
						<note_missed> = 1
					endif
				else
					if (($current_special_event_miss_notes [<index_to_use>]) > 0)
						<ret_val> = false
						<note_missed> = 1
					endif
				endif
				if (<ret_val> = false)
					if ((<index_to_use> + 1) < <song_section_size>)
						current_sec_time = (($<current_song_section_array> [<index_to_use>].time) / 1000)
						next_sec_time = (($<current_song_section_array> [(<index_to_use> + 1)].time) / 1000)
						<total_time_left_in_sections> = (<total_time_left_in_sections> + (<next_sec_time> - <current_sec_time>))
					else
						get_song_end_time \{song = $current_song}
						time_left = (<total_end_time> - (($<current_song_section_array> [<index_to_use>].time) / 1000))
						<total_time_left_in_sections> = (<total_time_left_in_sections> + <time_left>)
					endif
				endif
				if ($current_special_event_notes_total [<index_to_use>] = 0)
					<ret_val> = true
				endif
			else
				<ret_val> = false
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		else
			begin
			if (($current_special_event_percentages [<index>]) != 100)
				<ret_val> = false
			endif
			if ($current_special_event_num = 2)
				if (($current_special_event_miss_notes [<index>]) > <num_allowed_to_miss>)
					<ret_val> = false
					<note_missed> = 1
				endif
			else
				if (($current_special_event_miss_notes [<index>]) > 0)
					<ret_val> = false
					<note_missed> = 1
				endif
			endif
			if (<ret_val> = false)
				if ((<index> + 1) < <song_section_size>)
					current_sec_time = (($<current_song_section_array> [<index>].time) / 1000)
					next_sec_time = (($<current_song_section_array> [(<index> + 1)].time) / 1000)
					<total_time_left_in_sections> = (<total_time_left_in_sections> + (<next_sec_time> - <current_sec_time>))
				else
					get_song_end_time \{song = $current_song}
					time_left = (<total_end_time> - (($<current_song_section_array> [<index>].time) / 1000))
					<total_time_left_in_sections> = (<total_time_left_in_sections> + <time_left>)
				endif
			endif
			if ($current_special_event_notes_total [<index>] = 0)
				<ret_val> = true
			endif
			<index> = (<index> + 1)
			repeat <song_section_size>
		endif
	endif
	return (<ret_val>) note_missed = <note_missed> total_time_left_in_sections = <total_time_left_in_sections>
endscript

script setup_special_event num = ($current_special_event_num)
	if (<num> = 1)
		GetSpecialEventTimer
		<time> = (<time> - ($special_event_total_expense_time / 1000))
		if (<time> < 0)
			<time> = 0
		endif
		SetSpecialEventTimer time = <time>
		reset_current_special_event_miss_notes
	elseif (<num> = 2)
		change \{practice_loop_section = 1}
	endif
	change \{hide_hud_elements = 1}
	change \{game_mode = training}
	change \{practice_enabled = 1}
endscript

script reset_all_special_events 
	if ($special_event_previous_game_mode != none)
		change game_mode = ($special_event_previous_game_mode)
	endif
	reset_special_event \{num = 1}
	reset_special_event \{num = 2}
	change \{practice_enabled = 0}
	change \{special_event_stage = 0}
	change \{special_event_next_state = none}
	change \{current_special_event = none}
	change \{current_special_event_num = 1}
	change \{current_special_event_challenge_num = 1}
	change \{special_event_song_index = 0}
	change \{current_special_event_section = -1}
	change \{special_event_alpha_out_gems = 0}
	change \{hide_hud_elements = 0}
	change \{gray_gems = 0}
	ResetNonGrayMarkers
endscript

script reset_special_event \{num = 1}
	if (<num> = 1)
		if ScreenElementExists \{id = special_event_recording_textp1}
			SetScreenElementProps \{id = special_event_recording_textp1
				hide}
		endif
	elseif (<num> = 2)
		if ScreenElementExists \{id = special_event_question_markp1}
			SetScreenElementProps \{id = special_event_question_markp1
				hide}
		endif
		if ScreenElementExists \{id = special_event_missed_note_textp1}
			SetScreenElementProps \{id = special_event_missed_note_textp1
				hide}
		endif
		change \{special_event_alpha_out_gems = 0}
		if ($practice_loop_section = 1)
			change \{practice_loop_section = 0}
		endif
	endif
endscript

script get_and_set_special_event_time song = ($current_song)
	if ($special_event_stage = 1 || $special_event_stage = 3)
		get_song_end_time song = <song>
		switch ($current_special_event)
			case se1c1_touchupsong
			time = (<total_end_time> * 3)
			case se1c2_cleanuptwosongs
			time = (<total_end_time> * 2)
			case se1c3_ghostplayer
			time = (<total_end_time> * 1.5)
			case se2c1_tribute
			time = (<total_end_time> * 2)
			default
			time = 0
		endswitch
		CastToInteger \{time}
		<time> = (<time> / 1000)
		SetSpecialEventTimer time = <time>
	elseif ($special_event_stage = 2)
		GetSpecialEventTimer
	endif
	return time = <time>
endscript

script format_time_from_seconds \{time = 0}
	CastToInteger \{time}
	Mod a = <time> b = 60
	minutes = (<time> / 60)
	seconds = <Mod>
	if (<seconds> < 10)
		FormatText TextName = time_formatted qs("%a:0%b") a = <minutes> b = <seconds>
	else
		FormatText TextName = time_formatted qs("%a:%b") a = <minutes> b = <seconds>
	endif
	return time_formatted = <time_formatted>
endscript

script get_special_event_time song = ($current_song) event = se1c1_touchupsong
	destroy_band
	unload_songqpak
	load_songqpak song_name = <song> async = 0
	set_song_section_array \{player = 1}
	get_song_end_time song = <song>
	switch (<event>)
		case se1c1_touchupsong
		time = (<total_end_time> * 3)
		case se1c2_cleanuptwosongs
		time = (<total_end_time> * 2)
		case se1c3_ghostplayer
		time = (<total_end_time> * 1.5)
		case se2c1_tribute
		time = (<total_end_time> * 2)
		default
		time = 0
	endswitch
	CastToInteger \{time}
	return time = <time>
endscript

script focus_special_event_show_desc 
	get_progression_globals <progression_flag>
	FormatText checksumname = tiernum 'tier%d' d = <gig_num>
	GetPlayerInfo \{1
		part}
	FormatText checksumname = special_event_num 'special_event%d' d = ($<tier_global>.<tiernum>.specialevent)
	FormatText checksumname = challenge 'challenge%d' d = <challenge_num>
	FormatText checksumname = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
	destroy_menu \{menu_id = special_events_container}
	CreateScreenElement \{type = ContainerElement
		parent = gig_posters_menu
		id = special_events_container
		pos = (15.0, 10.0)}
	GetArraySize ($Special_Events_Challenges.<special_event_num>.<challenge>.<songs_ar>)
	song_size = <array_size>
	total_time_left = 0
	entry = 0
	if (<song_size> > 0)
		begin
		song = ($Special_Events_Challenges.<special_event_num>.<challenge>.<songs_ar> [<entry>].song)
		get_special_event_time song = <song> event = ($Special_Events_Challenges.<special_event_num>.<challenge>.name)
		<total_time_left> = (<total_time_left> + <time>)
		<entry> = (<entry> + 1)
		repeat <song_size>
	endif
	<total_time_left> = (<total_time_left> / 1000)
	SetSpecialEventTimer time = <total_time_left>
	format_time_from_seconds time = <total_time_left>
	CreateScreenElement {
		type = TextBlockElement
		parent = special_events_container
		pos = <desc_pos>
		dims = (620.0, 800.0)
		text = <time_formatted>
		font = fontgrid_text_a3
		just = [left top]
		rgba = [20 200 20 255]
		scale = 0.6
	}
	CreateScreenElement \{parent = special_events_container
		id = special_event_info_di
		type = DescInterface
		desc = 'special_event_info'}
	<id> :SE_SetProps {
		special_event_info_container_alpha = 0.0
		special_event_info_text_text = ($Special_Events_Challenges.<special_event_num>.<challenge>.info)
	}
	Wait \{1
		gameframe}
	<id> :SE_SetProps {
		special_event_info_container_alpha = 1.0
		time = 0.75
	}
	Wait \{0.75
		seconds}
endscript
