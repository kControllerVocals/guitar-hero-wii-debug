freestyle_star_rating_cutoffs = [
	60
	85
	95
]
freestyle_min_star_rating = 3
freestyle_max_star_rating = 6
freestyle_note_counters = [
	{
	}
	{
	}
]
freestyle_saved_stats = {
}

script freestyle_reset_stats 
	player = 0
	begin
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = total_notes_played value = 0
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = card_notes_played value = 0
	SetArrayElement ArrayName = freestyle_note_counters index = <player> newvalue = {} GlobalArray
	<player> = (<player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_stats_guitar_note_played 
	if (<on_card> = 1)
		freestyle_increment_stat player = <player> stat_name = card_notes_played
	endif
	freestyle_increment_stat player = <player> stat_name = total_notes_played
	GetGuitarEventPlaying player = <player> all
	GetArraySize <event_playing_array>
	i = 0
	begin
	if ((<event_playing_array> [<i>].event_playing) >= 0)
		freestyle_increment_note_count {
			player = <player>
			note_name = (<event_playing_array> [<i>].note_playing)
			note_modifier = (<event_playing_array> [<i>].modifier_playing)
		}
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script freestyle_stats_drum_note_played 
	freestyle_increment_stat player = <player> stat_name = total_notes_played
	freestyle_increment_note_count player = <player> note_name = <note_name>
endscript

script freestyle_increment_stat 
	Stat_Value = ($freestyle_player_data [<player>].<stat_name>)
	SetStructureParam array_name = freestyle_player_data array_index = <player> param = <stat_name> value = (<Stat_Value> + 1)
endscript

script freestyle_increment_note_count \{note_modifier = none}
	count_structure = {}
	count_updated = 0
	if StructureContains Structure = ($freestyle_note_counters [<player>]) <note_name>
		<count_structure> = ($freestyle_note_counters [<player>].<note_name>)
		if StructureContains Structure = <count_structure> <note_modifier>
			count_value = (<count_structure>.<note_modifier>)
			SetStructureParam struct_name = count_structure param = <note_modifier> value = (<count_value> + 1)
			<count_updated> = 1
		endif
	endif
	if (<count_updated> = 0)
		SetStructureParam struct_name = count_structure param = <note_modifier> value = 1
	endif
	printf qs(0xe1379d09) {
		a = <note_name>
		b = <note_modifier>
		c = (<count_structure>.<note_modifier>)
		d = <player>
	}
	SetStructureParam array_name = freestyle_note_counters array_index = <player> param = <note_name> value = <count_structure>
endscript

script freestyle_get_note_count \{note_modifier = none}
	note_count = 0
	if StructureContains Structure = ($freestyle_note_counters [<player>]) <note_name>
		count_structure = ($freestyle_note_counters [<player>].<note_name>)
		if StructureContains Structure = <count_structure> <note_modifier>
			<note_count> = (<count_structure>.<note_modifier>)
		endif
	endif
	return note_count = <note_count>
endscript

script freestyle_calculate_total_note_count 
	GetArraySize \{$freestyle_note_modifiers}
	i = 0
	total_note_count = 0
	begin
	current_modifier = ($freestyle_note_modifiers [<i>])
	freestyle_get_note_count {
		player = <player>
		note_name = <note_name>
		note_modifier = <current_modifier>
	}
	<total_note_count> = (<total_note_count> + <note_count>)
	<i> = (<i> + 1)
	repeat <array_size>
	return total_note_count = <total_note_count>
endscript

script freestyle_save_stats 
	if is_guitarist_human
		human_guitarist = 1
	else
		human_guitarist = 0
	endif
	if is_drummer_human
		human_drummer = 1
	else
		human_drummer = 0
	endif
	star_rating = $freestyle_min_star_rating
	if (<human_guitarist> = 1)
		percent_freestyle = 0
		card_notes = ($freestyle_player_data [0].card_notes_played * 1.0)
		total_notes = ($freestyle_player_data [0].total_notes_played * 1.0)
		if (<total_notes> > 0)
			<percent_freestyle> = ((1 - (<card_notes> / <total_notes>)) * 100)
		endif
		freestyle_calculate_star_rating percentage = <percent_freestyle>
	else
		if ($freestyle_player_data [1].total_notes_played > 0)
			<star_rating> = $freestyle_max_star_rating
		endif
	endif
	elapsed_time = ($freestyle_song_end_time - $freestyle_song_start_time)
	format_time Ms = <elapsed_time>
	freestyle_count_guitar_note_class_totals \{player = 0}
	FormatText TextName = single_notes_text '%a / %b' a = <singles_played> b = <singles_total>
	FormatText TextName = chords_text '%a / %b' a = <chords_played> b = <chords_total>
	FormatText TextName = riffs_text '%a / %b' a = <riffs_played> b = <riffs_total>
	FormatText TextName = licks_text '%a / %b' a = <licks_played> b = <licks_total>
	FormatText TextName = star_notes_text '%a / %b' a = <accents_played> b = <accents_total>
	FormatText TextName = guitar_notes_text qs("%a") a = ($freestyle_player_data [0].total_notes_played) usecommas
	freestyle_count_drum_note_totals \{player = 1}
	FormatText TextName = drums_text '%a / %b' a = <drums_played> b = <Drums_Total>
	FormatText TextName = drum_notes_text qs("%a") a = ($freestyle_player_data [1].total_notes_played) usecommas
	SetStructureParam struct_name = freestyle_saved_stats param = star_rating value = <star_rating>
	SetStructureParam struct_name = freestyle_saved_stats param = song_length value = <formatted_time>
	SetStructureParam struct_name = freestyle_saved_stats param = guitar_notes value = <guitar_notes_text>
	SetStructureParam struct_name = freestyle_saved_stats param = drum_notes value = <drum_notes_text>
	SetStructureParam \{struct_name = freestyle_saved_stats
		param = training_cards
		value = $freestyle_cards_completed}
	SetStructureParam struct_name = freestyle_saved_stats param = single_notes value = <single_notes_text>
	SetStructureParam struct_name = freestyle_saved_stats param = chords value = <chords_text>
	SetStructureParam struct_name = freestyle_saved_stats param = riffs value = <riffs_text>
	SetStructureParam struct_name = freestyle_saved_stats param = licks value = <licks_text>
	SetStructureParam struct_name = freestyle_saved_stats param = star_notes value = <star_notes_text>
	SetStructureParam struct_name = freestyle_saved_stats param = Drums value = <drums_text>
	SetStructureParam struct_name = freestyle_saved_stats param = human_guitarist value = <human_guitarist>
	SetStructureParam struct_name = freestyle_saved_stats param = human_drummer value = <human_drummer>
	printstruct \{$freestyle_saved_stats}
endscript

script freestyle_calculate_star_rating 
	GetArraySize \{$freestyle_star_rating_cutoffs}
	stars = 0
	begin
	if (<percentage> <= $freestyle_star_rating_cutoffs [<stars>])
		break
	endif
	<stars> = (<stars> + 1)
	repeat <array_size>
	return star_rating = (<stars> + $freestyle_min_star_rating)
endscript

script freestyle_count_guitar_note_class_totals 
	unique_set = {}
	guitar_tuning = ($freestyle_guitar_tunings [0])
	GetArraySize $<guitar_tuning>
	i = 0
	singles_played = 0
	singles_total = 0
	chords_played = 0
	chords_total = 0
	riffs_played = 0
	riffs_total = 0
	licks_played = 0
	licks_total = 0
	accents_played = 0
	accents_total = 0
	begin
	current_note = ($<guitar_tuning> [<i>].note)
	if NOT StructureContains Structure = <unique_set> <current_note>
		GetGuitarNoteClass player = <player> note_name = <current_note>
		freestyle_get_note_count player = <player> note_name = <current_note> note_modifier = accent
		accent_count = <note_count>
		freestyle_calculate_total_note_count player = <player> note_name = <current_note>
		everything_else_count = (<total_note_count> - <accent_count>)
		switch (<note_class>)
			case single
			if (<everything_else_count> > 0)
				<singles_played> = (<singles_played> + 1)
			endif
			<singles_total> = (<singles_total> + 1)
			case chord
			if (<everything_else_count> > 0)
				<chords_played> = (<chords_played> + 1)
			endif
			<chords_total> = (<chords_total> + 1)
			case Riff
			if (<everything_else_count> > 0)
				<riffs_played> = (<riffs_played> + 1)
			endif
			<riffs_total> = (<riffs_total> + 1)
			case lick
			if (<everything_else_count> > 0)
				<licks_played> = (<licks_played> + 1)
			endif
			<licks_total> = (<licks_total> + 1)
		endswitch
		if (<note_class> != Riff)
			if (<accent_count> > 0)
				<accents_played> = (<accents_played> + 1)
			endif
			<accents_total> = (<accents_total> + 1)
		endif
		SetStructureParam struct_name = unique_set param = <current_note> value = 1
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return {
		singles_played = <singles_played>
		singles_total = <singles_total>
		chords_played = <chords_played>
		chords_total = <chords_total>
		riffs_played = <riffs_played>
		riffs_total = <riffs_total>
		licks_played = <licks_played>
		licks_total = <licks_total>
		accents_played = <accents_played>
		accents_total = <accents_total>
	}
endscript

script freestyle_count_drum_note_totals 
	if ($freestyle_player_data [1].instrument = DrumKit)
		DrumKit = 1
	else
		DrumKit = 0
	endif
	note_bank_ptr = ($freestyle_note_banks.Drums)
	GetArraySize ($<note_bank_ptr>.notes)
	Drums_Total = <array_size>
	i = 0
	drums_played = 0
	begin
	current_note = ($<note_bank_ptr>.notes [<i>].name)
	freestyle_get_note_count player = <player> note_name = <current_note>
	if (<note_count> > 0)
		<drums_played> = (<drums_played> + 1)
	endif
	<i> = (<i> + 1)
	repeat <Drums_Total>
	if (<DrumKit> = 1)
		<Drums_Total> = (<Drums_Total> - 1)
	endif
	return drums_played = <drums_played> Drums_Total = <Drums_Total>
endscript
