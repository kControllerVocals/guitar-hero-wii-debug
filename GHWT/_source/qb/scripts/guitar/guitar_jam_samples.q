jam_num_strings_lead = 6
jam_num_strings_bass = 4
jam_num_strings_rhythm = 2
jam_num_frets_lead = 22
jam_num_frets_bass = 20
jam_num_frets_rhythm_0 = 5
jam_num_frets_rhythm_1 = 10
jam_num_samples = 2
jam_current_lead_position = null
jam_current_rhythm_position = null
jam_current_bass_position = null
lead_types = [
	'pk'
	'pk'
	'pk'
	'pm'
]
lead_types_num_samples = [
	3
	3
	3
	3
]
bass_types = [
	'fingered'
	'fingered'
	'fingered'
	'slap'
]
bass_types_num_samples = [
	2
	2
	2
	2
]
rhythm_types = [
	'chrd_down'
	'chrd_down'
]
rhythm_chord_types = [
	'5'
	'Maj'
	'Min'
	'pm'
	'Maj'
	'Min'
	'Maj'
	'Min'
	'Maj'
	'Min'
]
rhythm_types_num_samples = [
	3
	2
	2
	3
	2
	2
	2
	2
	1
	1
]
lead_string_notes = [
	0
	5
	10
	3
	7
	0
]
lead_string_octs = [
	2
	2
	2
	3
	3
	4
]
bass_string_octs = [
	1
	1
	1
	2
]
jam_checksum_notes = [
	'E'
	'F'
	'Gb'
	'G'
	'Ab'
	'A'
	'Bb'
	'B'
	'C'
	'Db'
	'D'
	'Eb'
]
jam_note_text = [
	qs("\LE")
	qs("\LF")
	qs("\LF#")
	qs("\LG")
	qs("\LG#")
	qs("\LA")
	qs("\LA#")
	qs("\LB")
	qs("\LC")
	qs("\LC#")
	qs("\LD")
	qs("\LD#")
]
Last_Rhythm_Jam_Set = ''
Last_Lead_Jam_Set = ''
Last_Melody_Jam_Set = ''
Rhythm_Jam_Set = 'Big_Tone'
Lead_Jam_Set = 'Big_Tone'
Melody_Jam_Set = 'rev_bass1'
jam_pitch_modifier = [
	-5
	-4
	-3
	-2
	-1
	0
	1
	2
	3
	4
	5
	-5
	-4
	-3
	-2
	-1
	0
	1
	2
	3
	4
	5
]
jam_pitch_modifier_rhythm_0 = [
	-3
	-2
	-1
	0
	1
	2
]
jam_pitch_modifier_rhythm_1 = [
	-3
	-2
	-1
	0
	1
	2
	3
	-2
	-1
	0
	1
	2
	3
]

script jam_get_sample_checksum 
	JamGetSampleChecksum_CFunc fret = <fret> string = <string> type = <type> jam_instrument = <jam_instrument> chord_type = <chord_type>
	return sample_checksum = <sample_checksum> note_text = <note_text> pitch_shift = <pitch_shift> note_id = <note_id>
endscript

script jam_get_sample_checksum_unoptimized \{fret = 0
		string = 0
		type = 0
		jam_instrument = 0
		chord_type = 0}
endscript

script test_all_samples 
	test_lead_samples
	test_rhythm_samples
	test_rhythm_special_samples
	test_bass_samples
endscript

script test_lead_samples 
	GetArraySize \{$lead_types}
	num_lead_types = <array_size>
	fret = 0
	string = 0
	type = 0
	sample_num = 1
	begin
	begin
	begin
	begin
	jam_get_sample_checksum fret = <fret> string = <string> type = <type> sample_num = <sample_num> jam_instrument = 1
	switch <type>
		case 0
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = JamMode_LeadGuitar
		case 1
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = -2 buss = JamMode_LeadGuitar attack_time = 0.055 attack_function = flat_middle ps2_attack = 1
		case 2
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = -3.5 buss = JamMode_LeadGuitar attack_time = 0.07 attack_function = flat_middle ps2_attack = 2
		case 3
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = JamMode_LeadGuitar
	endswitch
	if NOT issoundplaying <sample_checksum>
		printf channel = jam_samples qs("\LERRROR: missing sample for %s") s = <sample_checksum>
	endif
	if (<type> = 3)
		Wait \{0.5
			seconds}
	else
		Wait \{1.0
			seconds}
	endif
	StopSound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	Wait \{0.3
		seconds}
	<type> = (<type> + 1)
	repeat <num_lead_types>
	<type> = 0
	<sample_num> = (<sample_num> + 1)
	repeat 1
	<sample_num> = 1
	<fret> = (<fret> + 1)
	repeat $jam_num_frets_lead
	<fret> = 0
	<string> = (<string> + 1)
	repeat $jam_num_strings_lead
	printf \{channel = jam_samples
		qs("\LJAM LEAD, NECK SAMPLES TEST END")}
endscript

script test_rhythm_samples 
	printf \{channel = jam_samples
		qs("\LJAM RHYTHM, NECK SAMPLES TEST START")}
	GetArraySize \{$rhythm_types}
	num_rhythm_types = <array_size>
	GetArraySize \{$rhythm_chord_types}
	num_rhythm_chord_types = <array_size>
	num_frets_rhythm = $jam_num_frets_rhythm_0
	fret = 0
	string = 0
	type = 0
	chord_type = 0
	sample_num = 1
	begin
	begin
	begin
	begin
	begin
	jam_get_sample_checksum fret = <fret> string = <string> type = <type> sample_num = <sample_num> jam_instrument = 0 chord_type = <chord_type>
	switch <type>
		case 0
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = JamMode_RhythmGuitar
		case 1
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = JamMode_RhythmGuitar
	endswitch
	if NOT issoundplaying <sample_checksum>
		printf channel = jam_samples qs("\LERRROR: missing sample for %s") s = <sample_checksum>
	endif
	Wait \{0.1
		seconds}
	StopSound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	<type> = (<type> + 1)
	repeat <num_rhythm_types>
	<type> = 0
	<chord_type> = (<chord_type> + 1)
	repeat <num_rhythm_chord_types>
	chord_type = 0
	<sample_num> = (<sample_num> + 1)
	repeat 2
	<sample_num> = 1
	<fret> = (<fret> + 1)
	repeat <num_frets_rhythm>
	<fret> = 0
	<string> = (<string> + 1)
	if (<string> = 1)
		<num_frets_rhythm> = $jam_num_frets_rhythm_1
	endif
	repeat $jam_num_strings_rhythm
	printf \{channel = jam_samples
		qs("\LJAM RHYTHM, NECK SAMPLES TEST END")}
endscript

script test_rhythm_special_samples 
	GetArraySize \{$jam_special_chords}
	special_chord = 0
	begin
	dir = 2
	begin
	sample_num = 1
	begin
	jam_get_sample_checksum fret = 0 string = 0 type = <dir> sample_num = <sample_num> jam_instrument = 0 chord_type = <special_chord>
	PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = JamMode_LeadGuitar
	if NOT issoundplaying <sample_checksum>
		printf channel = jam_samples qs("\LERRROR: missing sample for %s") s = <sample_checksum>
	endif
	Wait \{0.1
		seconds}
	StopSound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	<sample_num> = (<sample_num> + 1)
	repeat 2
	<dir> = (<dir> + 1)
	repeat 2
	<special_chord> = (<special_chord> + 1)
	repeat <array_size>
endscript

script test_bass_samples 
	printf \{channel = jam_samples
		qs("\LJAM BASS, NECK SAMPLES TEST START")}
	GetArraySize \{$bass_types}
	num_bass_types = <array_size>
	fret = 0
	string = 0
	type = 0
	sample_num = 1
	begin
	begin
	begin
	begin
	jam_get_sample_checksum fret = <fret> string = <string> type = <type> sample_num = <sample_num> jam_instrument = 2
	switch <type>
		case 0
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = JamMode_Bass
		case 1
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = -2 buss = JamMode_Bass attack_time = 0.055 attack_function = flat_middle ps2_attack = 1
		case 2
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = -3.5 buss = JamMode_Bass attack_time = 0.07 attack_function = flat_middle ps2_attack = 2
		case 3
		PlaySound <sample_checksum> pitch = <pitch_shift> vol = 0 buss = JamMode_Bass
	endswitch
	if NOT issoundplaying <sample_checksum>
		printf channel = jam_samples qs("\LERRROR: missing sample for %s") s = <sample_checksum>
	endif
	Wait \{0.1
		seconds}
	StopSound <sample_checksum> fade_type = linear fade_time = $jam_fade_time
	<type> = (<type> + 1)
	repeat <num_bass_types>
	<type> = 0
	<sample_num> = (<sample_num> + 1)
	repeat 2
	<sample_num> = 1
	<fret> = (<fret> + 1)
	repeat $jam_num_frets_bass
	<fret> = 0
	<string> = (<string> + 1)
	repeat $jam_num_strings_bass
	printf \{channel = jam_samples
		qs("\LJAM BASS, NECK SAMPLES TEST END")}
endscript
