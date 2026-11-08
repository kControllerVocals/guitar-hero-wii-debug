freestyle_mii_expression_settings = none
freestyle_mii_nps_start_time = 0
freestyle_mii_nps_updated = 0
freestyle_mii_expression_guitar_notes_to_trigger = 3
freestyle_mii_expression_min_time_before_change = 10000
freestyle_mii_playing_fast_nps_drums = 10
freestyle_mii_normal_stance_guitar_notes_to_trigger = 3
freestyle_mii_awesome_stance_guitar_notes_to_trigger = 5
freestyle_mii_stance_min_time_before_change = 1000

script freestyle_init_mii_scripts 
	switch ($freestyle_music_type)
		case Blues
		change \{freestyle_mii_expression_settings = freestyle_mii_expression_settings_blues}
		case Rock
		change \{freestyle_mii_expression_settings = freestyle_mii_expression_settings_rock}
		case metal
		change \{freestyle_mii_expression_settings = freestyle_mii_expression_settings_metal}
		default
		change \{freestyle_mii_expression_settings = freestyle_mii_expression_settings_blues}
	endswitch
	GetStartTime
	change freestyle_mii_nps_start_time = <StartTime>
	change \{freestyle_mii_nps_updated = 0}
	player = 0
	begin
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = expression_notes value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = last_expression_time value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = notes_per_second value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = nps_counter value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = playing_fast value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = last_stance_time value = 0
	<player> = (<player> + 1)
	repeat $freestyle_max_players
	freestyle_spawn_mii_expression_scripts
endscript

script freestyle_deinit_mii_scripts 
	freestyle_kill_mii_expression_scripts
endscript

script freestyle_spawn_mii_expression_scripts 
	player = 0
	begin
	character = ($freestyle_player_data [<player>].character)
	if (<character> != none)
		freestyle_get_mii_expression_script_id character = <character>
		spawnscriptnow {
			freestyle_mii_expression_blink_loop
			params = {character = <character>}
			id = <expression_script_id>
		}
	endif
	<player> = (<player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_kill_mii_expression_scripts 
	player = 0
	begin
	character = ($freestyle_player_data [<player>].character)
	freestyle_get_mii_expression_script_id character = <character>
	KillSpawnedScript id = <expression_script_id>
	<player> = (<player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_mii_expression_blink_loop 
	begin
	settings_ptr = $freestyle_mii_expression_settings
	<character> :Mii_SetExpression expression = ($<settings_ptr>.default_expression)
	GetRandomValue \{a = 3.0
		b = 8.0
		name = random_wait}
	Wait <random_wait> seconds
	<character> :Mii_SetExpression expression = blink
	Wait \{0.1
		seconds}
	repeat
endscript

script freestyle_mii_expression_wait_then_begin_blinking 
	Wait <duration> seconds
	freestyle_get_mii_expression_script_id character = <character>
	SpawnScriptLater {
		freestyle_mii_expression_blink_loop
		params = {character = <character>}
		id = <expression_script_id>
	}
endscript

script freestyle_change_mii_expression \{duration = 3}
	freestyle_get_mii_expression_script_id character = <character>
	KillSpawnedScript id = <expression_script_id>
	<character> :Mii_SetExpression expression = <expression>
	spawnscriptnow {
		freestyle_mii_expression_wait_then_begin_blinking
		params = {character = <character> duration = <duration>}
		id = <expression_script_id>
	}
endscript

script freestyle_update_mii_scripts 
	GetElapsedTime StartTime = ($freestyle_mii_nps_start_time)
	if (<ElapsedTime> >= 1000)
		player = 0
		begin
		notes_per_second = ($freestyle_player_data [<player>].nps_counter)
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = notes_per_second value = <notes_per_second>
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = nps_counter value = 0
		<player> = (<player> + 1)
		repeat $freestyle_max_players
		GetStartTime
		change freestyle_mii_nps_start_time = <StartTime>
		change \{freestyle_mii_nps_updated = 1}
	else
		change \{freestyle_mii_nps_updated = 0}
	endif
	player = 0
	begin
	switch ($freestyle_player_data [<player>].instrument)
		case guitar
		freestyle_update_mii_guitarist player = <player>
		case Drums
		freestyle_update_mii_drummer player = <player>
	endswitch
	<player> = (<player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_update_mii_guitarist 
	freestyle_update_guitarist_hands player = <player>
	settings_ptr = $freestyle_mii_expression_settings
	if GetGuitarEventTriggered player = <player> all
		GetArraySize <event_triggered_array>
		channel_count = <array_size>
		channel = 0
		begin
		event_triggered = (<event_triggered_array> [<channel>].event_triggered)
		if (<event_triggered> >= 0)
			freestyle_mii_notify_note_played player = <player>
			freestyle_play_guitar_light {
				event_triggered = <event_triggered>
				on_array = freestyle_guitar_lights_on
				off_array = freestyle_guitar_lights_off
				pulse_script = freestyle_pulse_light_guitar
			}
			if NOT is_drummer_human
				freestyle_play_guitar_light {
					event_triggered = <event_triggered>
					on_array = freestyle_drummer_lights_on
					off_array = freestyle_drummer_lights_off
					pulse_script = freestyle_pulse_light_drum_even
				}
			endif
			expression_notes = ($freestyle_player_data [<player>].expression_notes + 1)
			if (<expression_notes> >= $freestyle_mii_expression_guitar_notes_to_trigger)
				last_expression_time = ($freestyle_player_data [<player>].last_expression_time)
				GetElapsedTime StartTime = <last_expression_time>
				if (<ElapsedTime> >= $freestyle_mii_expression_min_time_before_change)
					GetGuitarActiveTilt player = <player>
					expression = ($<settings_ptr>.guitar_tilt_expressions [<active_tilt>])
					freestyle_change_mii_expression expression = <expression> character = ($freestyle_player_data [<player>].character)
					GetStartTime
					SetStructureParam {
						array_name = freestyle_player_data
						array_index = <player>
						param = last_expression_time
						value = <StartTime>
					}
					<expression_notes> = 0
				endif
			endif
			SetStructureParam {
				array_name = freestyle_player_data
				array_index = <player>
				param = expression_notes
				value = <expression_notes>
			}
		endif
		<channel> = (<channel> + 1)
		repeat <channel_count>
	endif
	reset_stance_timer = 0
	notes_per_second = ($freestyle_player_data [<player>].notes_per_second)
	last_stance_time = ($freestyle_player_data [<player>].last_stance_time)
	GetElapsedTime StartTime = <last_stance_time>
	verse_stance = Rock_Idle_Verse
	chorus_stance = Rock_Idle_Chorus
	solo_stance = Rock_Idle_Solo
	switch ($freestyle_music_type)
		case metal
		<verse_stance> = Metal_Idle_Verse
		<chorus_stance> = Metal_Idle_Chorus
		<solo_stance> = Metal_Idle_Solo
		case Rock
		<verse_stance> = Rock_Idle_Verse
		<chorus_stance> = Rock_Idle_Chorus
		<solo_stance> = Rock_Idle_Solo
		case Blues
		<verse_stance> = Blues_Idle_Verse
		<chorus_stance> = Blues_Idle_Chorus
		<solo_stance> = Blues_Idle_Solo
		default
		ScriptAssert \{qs(0x80a13847)
			a = $freestyle_music_type}
	endswitch
	if (<ElapsedTime> > $freestyle_mii_stance_min_time_before_change)
		if (<notes_per_second> < $freestyle_mii_normal_stance_guitar_notes_to_trigger)
			change structurename = guitarist_info next_stance = <verse_stance>
		elseif (<notes_per_second> < $freestyle_mii_awesome_stance_guitar_notes_to_trigger)
			<reset_stance_timer> = 1
			change structurename = guitarist_info next_stance = <chorus_stance>
		else
			<reset_stance_timer> = 1
			change structurename = guitarist_info next_stance = <solo_stance>
		endif
	endif
	if (<reset_stance_timer> = 1)
		GetStartTime
		SetStructureParam {
			array_name = freestyle_player_data
			array_index = <player>
			param = last_stance_time
			value = <StartTime>
		}
	endif
endscript

script freestyle_update_mii_drummer 
	if ($freestyle_mii_nps_updated = 1)
		notes_per_second = ($freestyle_player_data [<player>].notes_per_second)
		playing_fast = ($freestyle_player_data [<player>].playing_fast)
		if (<notes_per_second> >= $freestyle_mii_playing_fast_nps_drums)
			freestyle_change_mii_expression {
				expression = open_mouth
				character = ($freestyle_player_data [<player>].character)
				duration = 1.1
			}
			SetStructureParam array_name = freestyle_player_data array_index = <player> param = playing_fast value = 1
		elseif (<playing_fast> = 1)
			freestyle_change_mii_expression expression = smile character = ($freestyle_player_data [<player>].character)
			SetStructureParam array_name = freestyle_player_data array_index = <player> param = playing_fast value = 0
		endif
	endif
endscript

script freestyle_get_mii_expression_script_id 
	MangleChecksums a = <character> b = mii_expression_script
	return expression_script_id = <mangled_ID>
endscript

script freestyle_mii_notify_note_played 
	nps_counter = ($freestyle_player_data [<player>].nps_counter + 1)
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = nps_counter value = <nps_counter>
endscript
