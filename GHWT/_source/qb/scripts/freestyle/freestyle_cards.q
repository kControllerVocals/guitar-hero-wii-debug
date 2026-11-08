freestyle_active_card_count = 3
freestyle_default_card_weight = 1.0
freestyle_card_weight_decay_ratio = 0.5
freestyle_min_card_weight = 0.1
freestyle_special_card_tilt = 0
freestyle_max_mini_deck_times_completed = 1
freestyle_card_completion_milestone = 10
freestyle_card_progression = null
freestyle_current_song_section = 0
freestyle_song_section_count = 0
freestyle_playing_final_song_section = 0
freestyle_card_tilt_showing = 0
freestyle_current_cards = [
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
	{
	}
]
freestyle_cards_completed = 0
freestyle_section_cards_completed = 0
freestyle_number_of_cards = 0
freestyle_card_info = {
}
freestyle_special_card_added = 0
freestyle_card_mode_state = none
freestyle_pattern_matching_enabled = 0
freestyle_card_player = 0
freestyle_enable_cards = 1
freestyle_section_start_time = 0
freestyle_song_start_time = 0
freestyle_song_end_time = 0
freestyle_special_card_time_added = 0
freestyle_choosing_cards = 0
freestyle_outro_anim_done = 0

script freestyle_load_card_system 
	if ($freestyle_music_type = metal)
		change \{freestyle_card_progression = freestyle_card_progression_metal}
	elseif ($freestyle_music_type = Rock)
		change \{freestyle_card_progression = freestyle_card_progression_rock}
	elseif ($freestyle_music_type = Blues)
		change \{freestyle_card_progression = freestyle_card_progression_blues}
	else
		change \{freestyle_card_progression = freestyle_card_progression_metal}
	endif
	freestyle_scan_card_progression
	progression_ptr = $freestyle_card_progression
	section = 0
	begin
	stream_set_ptr = ($<progression_ptr>.sections [<section>].stream_set)
	if NOT StreamSetExists id = <stream_set_ptr>
		LoadStreamSet id = <stream_set_ptr> stream_data = $<stream_set_ptr>
	endif
	if StructureContains Structure = ($<progression_ptr>.sections [<section>]) transition_stream_set
		transition_stream_set_ptr = ($<progression_ptr>.sections [<section>].transition_stream_set)
		if NOT StreamSetExists id = <transition_stream_set_ptr>
			LoadStreamSet id = <transition_stream_set_ptr> stream_data = $<transition_stream_set_ptr>
		endif
	endif
	<section> = (<section> + 1)
	repeat $freestyle_song_section_count
endscript

script freestyle_init_card_system 
	freestyle_init_card_visuals
	freestyle_init_card_effects
	change \{freestyle_current_song_section = 0}
	change \{freestyle_cards_completed = 0}
	change \{freestyle_playing_final_song_section = 0}
	change \{freestyle_card_player = 0}
	freestyle_reset_card_data
	change \{freestyle_choosing_cards = 0}
	change \{freestyle_special_card_added = 0}
	freestyle_card_goto_state_transition
endscript

script freestyle_reset_card_data 
	GetArraySize \{$freestyle_current_cards}
	i = 0
	begin
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <i>
		param = card
		value = {}
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <i>
		param = index
		value = -1
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <i>
		param = slots_played
		value = 0
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <i>
		param = completed
		value = 0
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <i>
		param = last_hit_event
		value = -1
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <i>
		param = last_hit_channel
		value = 0
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <i>
		param = last_hit_id
		value = 0
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <i>
		param = blank_card
		value = 1
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script freestyle_start_card_system 
	GetStartTime
	change freestyle_song_start_time = <StartTime>
endscript

script freestyle_destroy_card_system 
	freestyle_destroy_card_visuals
	freestyle_destroy_card_effects
	freestyle_destroy_you_rock
	KillSpawnedScript \{name = freestyle_card_wait_for_outro_then_exit}
	KillSpawnedScript \{name = freestyle_card_wait_then_start_playing}
	KillSpawnedScript \{name = freestyle_wait_then_select_next_card}
	KillSpawnedScript \{name = freestyle_card_display_ending_countdown}
	KillSpawnedScript \{name = freestyle_choose_section_cards}
	KillSpawnedScript \{name = freestyle_outro_anim_script}
	ClearStruct \{struct = freestyle_card_info
		globalstruct}
endscript

script freestyle_update_card_system 
	switch $freestyle_card_mode_state
		case playing
		freestyle_card_do_state_playing
		case wait_before_transition
		freestyle_card_do_state_wait_before_transition
		case transition
		freestyle_card_do_state_transition
		case Ending
		freestyle_card_do_state_ending
		case outro
		freestyle_card_do_state_outro
	endswitch
endscript

script freestyle_choose_new_card 
	freestyle_get_tilt_cards tilt = <tilt>
	freestyle_get_current_card_index card = <card> tilt = <tilt>
	GetArraySize $<tilt_cards_ptr>
	mini_deck_count = <array_size>
	weight_total = 0
	chosen_mini_deck = -1
	mini_deck = 0
	begin
	if freestyle_is_mini_deck_pickable tilt = <tilt> mini_deck = <mini_deck>
		freestyle_get_mini_deck_info tilt = <tilt> mini_deck = <mini_deck> param = weight
		<weight_total> = (<weight_total> + <weight>)
	endif
	<mini_deck> = (<mini_deck> + 1)
	repeat <mini_deck_count>
	if (<weight_total> > 0)
		GetRandomValue a = 0.0 b = <weight_total> name = random_weight
		range_start = 0.0
		<mini_deck> = 0
		begin
		if freestyle_is_mini_deck_pickable tilt = <tilt> mini_deck = <mini_deck>
			freestyle_get_mini_deck_info tilt = <tilt> mini_deck = <mini_deck> param = weight
			range_end = (<range_start> + <weight>)
			if ((<random_weight> >= <range_start>) && (<random_weight> <= <range_end>))
				<chosen_mini_deck> = <mini_deck>
				break
			endif
			<range_start> = <range_end>
		endif
		<mini_deck> = (<mini_deck> + 1)
		repeat <mini_deck_count>
		if (<chosen_mini_deck> = -1)
			ScriptAssert qs(0xf090adfd) a = <random_weight>
		endif
	endif
	freestyle_set_current_card {
		tilt = <tilt>
		mini_deck = <chosen_mini_deck>
		card = 0
		slot = <card>
		update_mini_deck = 1
	}
endscript

script freestyle_is_mini_deck_pickable 
	freestyle_get_mini_deck_info tilt = <tilt> mini_deck = <mini_deck> param = using
	freestyle_get_mini_deck_info tilt = <tilt> mini_deck = <mini_deck> param = times_completed
	freestyle_get_tilt_cards tilt = <tilt>
	if (<using> = 1)
		return \{false}
	endif
	if StructureContains Structure = ($<tilt_cards_ptr> [<mini_deck>]) transition_deck
		return \{false}
	endif
	if (<times_completed> >= $freestyle_max_mini_deck_times_completed)
		return \{false}
	endif
	return \{true}
endscript

script freestyle_scan_card_progression 
	printf \{qs(0x2541cafe)
		a = $freestyle_card_progression}
	progression_ptr = $freestyle_card_progression
	GetArraySize ($<progression_ptr>.sections)
	section_count = <array_size>
	section = 0
	change freestyle_song_section_count = <section_count>
	change \{freestyle_number_of_cards = 0}
	begin
	tilt = 0
	begin
	freestyle_get_tilt_cards section = <section> tilt = <tilt>
	if (<tilt_cards_ptr> != null)
		GetArraySize $<tilt_cards_ptr>
		mini_deck_count = <array_size>
		mini_deck = 0
		if (<mini_deck_count> < ($freestyle_active_card_count + 1))
			ScriptAssert {
				qs(0x3f2f6b0d)
				a = <tilt_cards_ptr>
				b = ($freestyle_active_card_count + 1)
				c = <mini_deck_count>
				DoNotResolve
			}
		endif
		begin
		GetArraySize ($<tilt_cards_ptr> [<mini_deck>].cards)
		card_count = <array_size>
		card = 0
		if StructureContains Structure = ($<tilt_cards_ptr> [<mini_deck>]) weight
			weight = ($<tilt_cards_ptr> [<mini_deck>].weight)
		else
			weight = $freestyle_default_card_weight
		endif
		freestyle_get_mini_deck_id section = <section> tilt = <tilt> mini_deck = <mini_deck>
		freestyle_set_mini_deck_info mini_deck_id = <mini_deck_id> param = weight value = <weight>
		freestyle_set_mini_deck_info mini_deck_id = <mini_deck_id> param = using value = 0
		freestyle_set_mini_deck_info mini_deck_id = <mini_deck_id> param = times_completed value = 0
		begin
		StringLength string = ($<tilt_cards_ptr> [<mini_deck>].cards [<card>].notes)
		if (<str_len> != $freestyle_card_max_gems)
			ScriptAssert {
				qs(0x486258c6)
				a = <tilt_cards_ptr>
				b = <mini_deck>
				c = <card>
				d = <str_len>
				e = $freestyle_card_max_gems
				DoNotResolve
			}
		endif
		freestyle_get_card_id section = <section> tilt = <tilt> mini_deck = <mini_deck> card = <card>
		freestyle_set_card_info card_id = <card_id> param = card_number value = ($freestyle_number_of_cards)
		freestyle_set_card_info card_id = <card_id> param = times_completed value = 0
		change freestyle_number_of_cards = ($freestyle_number_of_cards + 1)
		<card> = (<card> + 1)
		repeat <card_count>
		<mini_deck> = (<mini_deck> + 1)
		repeat <mini_deck_count>
	endif
	<tilt> = (<tilt> + 1)
	repeat $freestyle_guitar_tilt_count
	<section> = (<section> + 1)
	repeat <section_count>
	printf \{qs(0xcf33b596)
		a = $freestyle_number_of_cards}
	printf \{qs(0x884d1693)
		a = $freestyle_song_section_count}
endscript

script freestyle_notify_card_completion 
	if NOT freestyle_are_cards_enabled
		return
	endif
	if ($freestyle_pattern_matching_enabled = 0)
		return
	endif
	freestyle_get_current_card_index card = <card_index>
	if ($freestyle_current_cards [<current_card_index>].completed = 1)
		return
	endif
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = completed
		value = 1
	}
	SpawnScriptLater {
		freestyle_wait_then_select_next_card
		params = {
			card_index = <card_index>
			tilt = ($freestyle_card_tilt_showing)
		}
	}
endscript

script freestyle_select_next_card 
	freestyle_get_current_card_index card = <card_index> tilt = <tilt>
	card = ($freestyle_current_cards [<current_card_index>].index)
	next_card = (<card> + 1)
	mini_deck = ($freestyle_current_cards [<current_card_index>].mini_deck)
	progression_ptr = $freestyle_card_progression
	freestyle_get_tilt_cards tilt = <tilt>
	change freestyle_cards_completed = ($freestyle_cards_completed + 1)
	change freestyle_section_cards_completed = ($freestyle_section_cards_completed + 1)
	freestyle_get_card_info tilt = <tilt> mini_deck = <mini_deck> card = <card> param = times_completed
	freestyle_set_card_info tilt = <tilt> mini_deck = <mini_deck> card = <card> param = times_completed value = (<times_completed> + 1)
	if (<next_card> < $freestyle_current_cards [<current_card_index>].mini_deck_size)
		completed_mini_deck = 0
	else
		completed_mini_deck = 1
		freestyle_get_mini_deck_info tilt = <tilt> mini_deck = <mini_deck> param = times_completed
		freestyle_set_mini_deck_info tilt = <tilt> mini_deck = <mini_deck> param = times_completed value = (<times_completed> + 1)
	endif
	if (<completed_mini_deck> = 1)
		if StructureContains Structure = ($<tilt_cards_ptr> [<mini_deck>]) transition_deck
			freestyle_card_goto_state_wait_before_transition
			return
		endif
	endif
	pick_transition_card = 0
	if ($freestyle_special_card_added = 0)
		seconds_before_transition = ($<progression_ptr>.sections [$freestyle_current_song_section].seconds_before_transition)
		cards_before_transition = ($<progression_ptr>.sections [$freestyle_current_song_section].cards_before_transition)
		GetElapsedTime \{StartTime = $freestyle_section_start_time}
		elapsed_seconds = (<ElapsedTime> / 1000)
		if (<elapsed_seconds> >= <seconds_before_transition>)
			<pick_transition_card> = 1
		elseif ($freestyle_section_cards_completed >= <cards_before_transition>)
			<pick_transition_card> = 1
		endif
	endif
	skip_card_picking = 0
	if (<pick_transition_card> = 1)
		if ((<tilt> = $freestyle_special_card_tilt) && (<tilt> = $freestyle_card_tilt_showing))
			<skip_card_picking> = 1
		endif
		freestyle_choose_transition_card slot = <card_index>
	endif
	if (<skip_card_picking> = 0)
		if (<completed_mini_deck> = 0)
			freestyle_set_current_card {
				tilt = <tilt>
				mini_deck = <mini_deck>
				card = <next_card>
				slot = <card_index>
				update_mini_deck = 0
			}
		else
			freestyle_choose_new_card card = <card_index> tilt = <tilt>
		endif
	endif
	if (<pick_transition_card> = 0)
		Mod \{a = $freestyle_cards_completed
			b = $freestyle_card_completion_milestone}
		if (<Mod> = 0)
			FormatText \{TextName = milestone_text
				$wii_freestyle_card_complete_milestone_msg
				a = $freestyle_cards_completed}
			freestyle_hud_show_flashy_text text = <milestone_text> duration = 2.0
		endif
	endif
	if (<tilt> = $freestyle_card_tilt_showing)
		freestyle_display_new_card card = <card_index> effect = Burn
	endif
	freestyle_play_card_lights
endscript

script freestyle_get_tilt_cards 
	if NOT GotParam \{section}
		section = $freestyle_current_song_section
	endif
	if NOT GotParam \{tilt}
		tilt = $freestyle_card_tilt_showing
	endif
	progression_ptr = $freestyle_card_progression
	FormatText checksumname = tilt_param 'tilt%a_cards' a = (<tilt> + 1)
	tilt_cards_ptr = null
	if StructureContains Structure = ($<progression_ptr>.sections [<section>]) <tilt_param>
		<tilt_cards_ptr> = ($<progression_ptr>.sections [<section>].<tilt_param>)
	endif
	return tilt_cards_ptr = <tilt_cards_ptr>
endscript

script freestyle_get_current_card_index 
	if NOT GotParam \{tilt}
		tilt = $freestyle_card_tilt_showing
	endif
	return current_card_index = (<card> + (<tilt> * $freestyle_active_card_count))
endscript

script freestyle_get_card_id 
	if NOT GotParam \{section}
		section = $freestyle_current_song_section
	endif
	if NOT GotParam \{tilt}
		tilt = $freestyle_card_tilt_showing
	endif
	FormatText {
		checksumname = card_id
		'card_%a_%b_%c_%d'
		a = <section>
		b = <tilt>
		c = <mini_deck>
		d = <card>
	}
	return card_id = <card_id>
endscript

script freestyle_get_mini_deck_id 
	if NOT GotParam \{section}
		section = $freestyle_current_song_section
	endif
	if NOT GotParam \{tilt}
		tilt = $freestyle_card_tilt_showing
	endif
	FormatText {
		checksumname = mini_deck_id
		'mini_deck_%a_%b_%c'
		a = <section>
		b = <tilt>
		c = <mini_deck>
	}
	return mini_deck_id = <mini_deck_id>
endscript

script freestyle_get_card_info 
	if NOT GotParam \{card_id}
		freestyle_get_card_id <...>
	endif
	return_params = {}
	SetStructureParam struct_name = return_params param = <param> value = ($freestyle_card_info.<card_id>.<param>)
	return <return_params>
endscript

script freestyle_set_card_info 
	if NOT GotParam \{card_id}
		freestyle_get_card_id <...>
	endif
	if StructureContains Structure = $freestyle_card_info <card_id>
		card_info = ($freestyle_card_info.<card_id>)
	else
		card_info = {}
	endif
	SetStructureParam struct_name = card_info param = <param> value = <value>
	SetStructureParam struct_name = freestyle_card_info param = <card_id> value = <card_info>
endscript

script freestyle_get_mini_deck_info 
	if NOT GotParam \{mini_deck_id}
		freestyle_get_mini_deck_id <...>
	endif
	return_params = {}
	SetStructureParam struct_name = return_params param = <param> value = ($freestyle_card_info.<mini_deck_id>.<param>)
	return <return_params>
endscript

script freestyle_set_mini_deck_info 
	if NOT GotParam \{mini_deck_id}
		freestyle_get_mini_deck_id <...>
	endif
	if StructureContains Structure = $freestyle_card_info <mini_deck_id>
		mini_deck_info = ($freestyle_card_info.<mini_deck_id>)
	else
		mini_deck_info = {}
	endif
	SetStructureParam struct_name = mini_deck_info param = <param> value = <value>
	SetStructureParam struct_name = freestyle_card_info param = <mini_deck_id> value = <mini_deck_info>
endscript

script freestyle_start_song_section \{loop_streams = true
		show_text = 1}
	GetStartTime
	change freestyle_section_start_time = <StartTime>
	change \{freestyle_section_cards_completed = 0}
	change \{freestyle_special_card_added = 0}
	progression_ptr = $freestyle_card_progression
	PlayStreamSet id = ($<progression_ptr>.sections [$freestyle_current_song_section].stream_set) Loop = <loop_streams>
	StartMetronome {
		metronome_type = synchronized
		stream_id = ($<progression_ptr>.sections [$freestyle_current_song_section].stream_set)
	}
	if ((<show_text> = 1) && freestyle_are_cards_enabled)
		freestyle_hud_show_flashy_text text = ($<progression_ptr>.sections [$freestyle_current_song_section].name) duration = 2.0
	endif
	SetScreenElementProps id = freestyle_guitar_gui_section text = ($<progression_ptr>.sections [$freestyle_current_song_section].name)
endscript

script freestyle_choose_special_card 
	freestyle_get_tilt_cards \{tilt = $freestyle_special_card_tilt}
	GetArraySize $<tilt_cards_ptr>
	mini_deck = 0
	begin
	if StructureContains Structure = ($<tilt_cards_ptr> [<mini_deck>]) <card_type>
		freestyle_set_current_card {
			tilt = $freestyle_special_card_tilt
			mini_deck = <mini_deck>
			card = 0
			slot = <slot>
			update_mini_deck = 1
		}
		change \{freestyle_special_card_added = 1}
		GetStartTime
		change freestyle_special_card_time_added = <StartTime>
	endif
	<mini_deck> = (<mini_deck> + 1)
	repeat <array_size>
	if ($freestyle_special_card_added = 0)
		ScriptAssert qs(0x2f2291ff) a = <card_type>
	endif
endscript

script freestyle_set_current_card 
	freestyle_get_tilt_cards tilt = <tilt>
	freestyle_get_current_card_index card = <slot> tilt = <tilt>
	if (<mini_deck> >= 0)
		blank_card = 0
		card_structure = ($<tilt_cards_ptr> [<mini_deck>].cards [<card>])
	else
		blank_card = 1
		card_structure = {}
	endif
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = card
		value = <card_structure>
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = index
		value = <card>
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = slots_played
		value = 0
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = completed
		value = 0
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = last_hit_event
		value = -1
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = last_hit_channel
		value = 0
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = last_hit_id
		value = 0
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = blank_card
		value = <blank_card>
	}
	if (<update_mini_deck> = 1)
		if StructureContains Structure = ($freestyle_current_cards [<current_card_index>]) mini_deck
			<last_mini_deck> = ($freestyle_current_cards [<current_card_index>].mini_deck)
			freestyle_set_mini_deck_info tilt = <tilt> mini_deck = <last_mini_deck> param = using value = 0
		endif
		SetStructureParam array_name = freestyle_current_cards array_index = <current_card_index> param = mini_deck value = <mini_deck>
		if (<blank_card> = 0)
			GetArraySize ($<tilt_cards_ptr> [<mini_deck>].cards)
			SetStructureParam array_name = freestyle_current_cards array_index = <current_card_index> param = mini_deck_size value = <array_size>
			freestyle_get_mini_deck_id tilt = <tilt> mini_deck = <mini_deck>
			freestyle_set_mini_deck_info mini_deck_id = <mini_deck_id> param = using value = 1
			freestyle_get_mini_deck_info mini_deck_id = <mini_deck_id> param = weight
			new_weight = (<weight> * $freestyle_card_weight_decay_ratio)
			if (<new_weight> < $freestyle_min_card_weight)
				<new_weight> = $freestyle_min_card_weight
			endif
			freestyle_set_mini_deck_info mini_deck_id = <mini_deck_id> param = weight value = <new_weight>
		else
			SetStructureParam array_name = freestyle_current_cards array_index = <current_card_index> param = mini_deck_size value = 0
		endif
	endif
	if (<tilt> = $freestyle_card_tilt_showing)
		ResetCardPattern card = <slot>
	endif
endscript

script freestyle_advance_song_section 
	if ($freestyle_playing_final_song_section = 1)
		ScriptAssert \{qs(0x3b7ddbff)}
	endif
	progression_ptr = $freestyle_card_progression
	StopStreamSet id = ($<progression_ptr>.sections [$freestyle_current_song_section].stream_set)
	StopMetronome
	change freestyle_current_song_section = ($freestyle_current_song_section + 1)
	if ($freestyle_current_song_section = ($freestyle_song_section_count - 1))
		change \{freestyle_playing_final_song_section = 1}
	endif
	if ($freestyle_playing_final_song_section = 1)
		freestyle_card_goto_state_ending
	else
		freestyle_card_goto_state_transition
	endif
endscript

script freestyle_card_goto_state_playing 
	change \{freestyle_card_mode_state = playing}
	change \{freestyle_pattern_matching_enabled = 1}
	GetGuitarActiveTilt \{player = $freestyle_card_player}
	change freestyle_card_tilt_showing = <active_tilt>
	freestyle_start_song_section
	freestyle_spawn_new_cards
endscript

script freestyle_card_do_state_playing 
	GetGuitarActiveTilt \{player = $freestyle_card_player}
	if ($freestyle_card_tilt_showing != <active_tilt>)
		if ($freestyle_card_tilt_showing < <active_tilt>)
			effect = slide_down
		else
			effect = slide_up
		endif
		change freestyle_card_tilt_showing = <active_tilt>
		card = 0
		begin
		freestyle_display_new_card card = <card> effect = <effect>
		<card> = (<card> + 1)
		repeat $freestyle_active_card_count
	endif
	GetGuitarInputProperties \{player = $freestyle_card_player}
	GetGuitarEventPlaying \{player = $freestyle_card_player
		all}
	card = 0
	begin
	if freestyle_is_card_line_burning card_id = ($freestyle_active_card_ids [<card>])
		freestyle_get_current_card_index card = <card>
		last_hit_event = ($freestyle_current_cards [<current_card_index>].last_hit_event)
		last_hit_channel = ($freestyle_current_cards [<current_card_index>].last_hit_channel)
		last_hit_id = ($freestyle_current_cards [<current_card_index>].last_hit_id)
		if (((<pattern_held> && <last_hit_event>) != <last_hit_event>) || (<event_playing_array> [<last_hit_channel>].id_playing != <last_hit_id>))
			freestyle_destroy_card_line_burn_effect card_id = ($freestyle_active_card_ids [<card>])
			freestyle_card_create_gems {
				card = ($freestyle_current_cards [<current_card_index>].card)
				card_id = ($freestyle_active_card_ids [<card>])
				gem_effect = played
				gem_slot_begin = 0
				gem_slot_end = ($freestyle_current_cards [<current_card_index>].slots_played)
			}
		endif
	endif
	<card> = (<card> + 1)
	repeat $freestyle_active_card_count
endscript

script freestyle_card_goto_state_wait_before_transition 
	change \{freestyle_card_mode_state = wait_before_transition}
	change \{freestyle_pattern_matching_enabled = 0}
	StopGuitarLoops \{player = $freestyle_card_player}
	spawnscriptnow \{freestyle_play_reward_anim}
	freestyle_play_transition_lights
	freestyle_tilt_meter_stop_flame
	freestyle_destroy_active_card_visuals
	SpawnScriptLater \{freestyle_transition_card_burn_effect}
endscript

script freestyle_card_do_state_wait_before_transition 
	if MetronomeBeatThisFrame
		freestyle_advance_song_section
	endif
endscript

script freestyle_card_goto_state_transition 
	change \{freestyle_card_mode_state = transition}
	change \{freestyle_pattern_matching_enabled = 0}
	StopGuitarLoops \{player = $freestyle_card_player}
	progression_ptr = $freestyle_card_progression
	PlayStreamSet id = ($<progression_ptr>.sections [$freestyle_current_song_section].transition_stream_set) Loop = false
	StartMetronome {
		metronome_type = synchronized
		stream_id = ($<progression_ptr>.sections [$freestyle_current_song_section].transition_stream_set)
	}
	freestyle_hud_remove_help_text_tagged \{tag = $freestyle_auto_help_tag_transition}
	spawnscriptnow \{freestyle_choose_section_cards}
endscript

script freestyle_card_do_state_transition 
	progression_ptr = $freestyle_card_progression
	if NOT IsStreamSetPlaying id = ($<progression_ptr>.sections [$freestyle_current_song_section].transition_stream_set)
		freestyle_card_goto_state_playing
	endif
endscript

script freestyle_card_goto_state_ending 
	change \{freestyle_card_mode_state = Ending}
	change \{freestyle_pattern_matching_enabled = 0}
	StopGuitarLoops \{player = $freestyle_card_player}
	freestyle_start_song_section \{loop_streams = false
		show_text = 1}
	SpawnScriptLater \{freestyle_card_display_ending_countdown}
endscript

script freestyle_card_do_state_ending 
	progression_ptr = $freestyle_card_progression
	stream_id = ($<progression_ptr>.sections [$freestyle_current_song_section].stream_set)
	end_offset = ($<progression_ptr>.ending_offset)
	GetStreamSetTimeRemaining id = <stream_id>
	if ((<time_remaining> - <end_offset>) <= 0)
		freestyle_card_goto_state_outro
	endif
endscript

script freestyle_card_goto_state_outro 
	change \{freestyle_card_mode_state = outro}
	StopMetronome
	KillSpawnedScript \{name = freestyle_card_display_ending_countdown}
	freestyle_hud_stop_countdown
	freestyle_hud_hide
	SetScreenElementProps \{id = freestyle_highway_container
		hide}
	player = 0
	begin
	InstrumentSetEnabled player = <player> enable = false
	<player> = (<player> + 1)
	repeat $freestyle_max_players
	freestyle_end_song
	change \{freestyle_enable_signin = 0}
	change \{freestyle_check_controller_disconnect = 0}
	spawnscriptnow \{freestyle_you_rock_effect}
	spawnscriptnow \{freestyle_outro_anim_script}
	SpawnScriptLater \{freestyle_card_wait_for_outro_then_exit}
endscript

script freestyle_card_do_state_outro 
endscript

script freestyle_card_wait_for_outro_then_exit 
	begin
	if (($freestyle_you_rock_playing = 0) && ($freestyle_outro_anim_done = 1))
		break
	endif
	Wait \{1
		frame}
	repeat
	ui_memcard_autosave_replace \{event = menu_replace
		state = UIstate_freestyle_stats}
endscript

script freestyle_outro_anim_script 
	change \{freestyle_outro_anim_done = 0}
	Wait \{3
		seconds}
	switch ($freestyle_music_type)
		case metal
		freestyle_play_outro_anim \{Anim = GH4_Guitarist_mii_Metal_outro}
		case Rock
		freestyle_play_outro_anim \{Anim = GH4_Guitarist_mii_Rock_Outro}
		case Blues
		freestyle_play_outro_anim \{Anim = GH4_Guitarist_mii_Blue_outro}
		default
		ScriptAssert \{qs(0x80a13847)
			a = $freestyle_music_type}
	endswitch
	change \{freestyle_outro_anim_done = 1}
endscript

script freestyle_enable_cards_changed 
	if NOT freestyle_are_cards_enabled
		freestyle_hide_card_effects
		SetScreenElementProps \{id = $freestyle_card_container_id
			hide}
	else
		SetScreenElementProps \{id = $freestyle_card_container_id
			unhide}
	endif
endscript

script freestyle_notify_card_note_played 
	if NOT freestyle_are_cards_enabled
		return
	endif
	if ($freestyle_pattern_matching_enabled = 0)
		return
	endif
	freestyle_get_current_card_index card = <card_index>
	if ($freestyle_current_cards [<current_card_index>].completed = 1)
		return
	endif
	previous_slots_played = ($freestyle_current_cards [<current_card_index>].slots_played)
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = slots_played
		value = <gem_slot_end>
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = last_hit_event
		value = <note_event>
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = last_hit_channel
		value = <note_channel>
	}
	SetStructureParam {
		array_name = freestyle_current_cards
		array_index = <current_card_index>
		param = last_hit_id
		value = <note_id>
	}
	freestyle_destroy_card_line_burn_effect card_id = ($freestyle_active_card_ids [<card_index>])
	freestyle_card_create_gems {
		card = ($freestyle_current_cards [<current_card_index>].card)
		card_id = ($freestyle_active_card_ids [<card_index>])
		gem_effect = played
		gem_slot_begin = 0
		gem_slot_end = (<previous_slots_played>)
	}
	freestyle_card_create_gems {
		card = ($freestyle_current_cards [<current_card_index>].card)
		card_id = ($freestyle_active_card_ids [<card_index>])
		gem_effect = played_now
		gem_slot_begin = <gem_slot_begin>
		gem_slot_end = (<gem_slot_begin> + 1)
	}
	if (<gem_slot_end> > (<gem_slot_begin> + 1))
		freestyle_card_create_line_burn_effect {
			card = ($freestyle_current_cards [<current_card_index>].card)
			card_id = ($freestyle_active_card_ids [<card_index>])
			gem_slot_begin = <gem_slot_begin>
			gem_slot_end = <gem_slot_end>
		}
	endif
	freestyle_stats_guitar_note_played \{player = $freestyle_card_player
		on_card = 1}
endscript

script freestyle_notify_non_card_note_played 
	freestyle_stats_guitar_note_played \{player = $freestyle_card_player
		on_card = 0}
endscript

script freestyle_notify_card_reset 
	if ($freestyle_pattern_matching_enabled = 0)
		return
	endif
	tilt = 0
	begin
	freestyle_get_current_card_index tilt = <tilt> card = <card_index>
	if ($freestyle_current_cards [<current_card_index>].completed = 0)
		gem_slot_begin = 0
		gem_slot_end = ($freestyle_current_cards [<current_card_index>].slots_played)
		SetStructureParam {
			array_name = freestyle_current_cards
			array_index = <current_card_index>
			param = slots_played
			value = 0
		}
		if (<tilt> = $freestyle_card_tilt_showing)
			if ScreenElementExists id = ($freestyle_active_card_ids [<card_index>])
				freestyle_destroy_card_line_burn_effect card_id = ($freestyle_active_card_ids [<card_index>])
				freestyle_card_create_gems {
					card = ($freestyle_current_cards [<current_card_index>].card)
					card_id = ($freestyle_active_card_ids [<card_index>])
					gem_effect = respawn
					gem_slot_begin = <gem_slot_begin>
					gem_slot_end = <gem_slot_end>
				}
			endif
		endif
	endif
	<tilt> = (<tilt> + 1)
	repeat $freestyle_guitar_tilt_count
endscript

script freestyle_wait_then_select_next_card 
	calculate_animation_time \{num_uv_frames = $freestyle_card_gem_burn_frames
		frame_length = $freestyle_card_gem_burn_frame_length}
	Wait <anim_time> seconds
	begin
	if NOT freestyle_is_card_line_burning card_id = ($freestyle_active_card_ids [<card_index>])
		break
	endif
	Wait \{1
		frame}
	repeat
	if ($freestyle_card_mode_state = playing)
		freestyle_select_next_card card_index = <card_index> tilt = <tilt>
	endif
endscript

script freestyle_choose_transition_card \{slot = -1}
	if ($freestyle_special_card_added != 0)
		return
	endif
	if (<slot> = -1)
		GetRandomValue a = 0 b = ($freestyle_active_card_count - 1) name = random_slot Integer
		<slot> = <random_slot>
	endif
	freestyle_choose_special_card card_type = transition_deck slot = <slot>
	if freestyle_are_cards_enabled
		progression_ptr = $freestyle_card_progression
		next_section = ($freestyle_current_song_section + 1)
		FormatText {
			TextName = transition_text
			$wii_freestyle_transition_ready
			a = ($<progression_ptr>.sections [<next_section>].name)
		}
		freestyle_hud_show_flashy_text text = <transition_text> duration = 2.0
		freestyle_tilt_meter_start_flame
	endif
endscript

script freestyle_card_display_ending_countdown 
	begin
	Wait \{1
		frame}
	if ($freestyle_flashy_text_showing = 0)
		break
	endif
	repeat
	progression_ptr = $freestyle_card_progression
	stream_id = ($<progression_ptr>.sections [$freestyle_current_song_section].stream_set)
	end_offset = ($<progression_ptr>.ending_offset)
	GetStreamSetTimeRemaining id = <stream_id>
	freestyle_hud_start_countdown time = (<time_remaining> - <end_offset>)
	begin
	Wait \{1
		frame}
	GetStreamSetTimeRemaining id = <stream_id>
	freestyle_hud_update_countdown time = (<time_remaining> - <end_offset>)
	repeat
endscript

script freestyle_end_song 
	GetStartTime
	change freestyle_song_end_time = <StartTime>
	freestyle_save_stats
endscript

script freestyle_are_cards_enabled 
	if ($freestyle_enable_cards = 0)
		return \{false}
	endif
	if NOT is_guitarist_human
		return \{false}
	endif
	return \{true}
endscript

script freestyle_choose_section_cards 
	change \{freestyle_choosing_cards = 1}
	card = 0
	begin
	tilt = 0
	begin
	Wait \{3
		frames}
	freestyle_choose_new_card card = <card> tilt = <tilt>
	<tilt> = (<tilt> + 1)
	repeat $freestyle_guitar_tilt_count
	<card> = (<card> + 1)
	repeat $freestyle_active_card_count
	change \{freestyle_choosing_cards = 0}
endscript

script freestyle_spawn_new_cards 
	if ($freestyle_choosing_cards = 1)
		ScriptAssert \{qs(0x92c1fd7a)}
	endif
	card = 0
	begin
	freestyle_display_new_card card = <card> effect = spawn
	<card> = (<card> + 1)
	repeat $freestyle_active_card_count
endscript
