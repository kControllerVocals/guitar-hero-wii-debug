freestyle_guitar_lights_on = [
	[
		Guitarist_Green_on01
		Guitarist_Green_on02
		Guitarist_Green_on03
		Guitarist_Green_on04
		Guitarist_Green_on05
		Guitarist_Green_on06
	]
	[
		Guitarist_Red_on01
		Guitarist_Red_on02
		Guitarist_Red_on03
		Guitarist_Red_on04
		Guitarist_Red_on05
		Guitarist_Red_on06
	]
	[
		Guitarist_Yellow_on01
		Guitarist_Yellow_on02
		Guitarist_Yellow_on03
		Guitarist_Yellow_on04
		Guitarist_Yellow_on05
		Guitarist_Yellow_on06
	]
	[
		Guitarist_Blue_on01
		Guitarist_Blue_on02
		Guitarist_Blue_on03
		Guitarist_Blue_on04
		Guitarist_Blue_on05
		Guitarist_Blue_on06
	]
	[
		Guitarist_Orange_on01
		Guitarist_Orange_on02
		Guitarist_Orange_on03
		Guitarist_Orange_on04
		Guitarist_Orange_on05
		Guitarist_Orange_on06
	]
	[
		Guitarist_Purple_on01
		Guitarist_Purple_on02
		Guitarist_Purple_on03
		Guitarist_Purple_on04
		Guitarist_Purple_on05
		Guitarist_Purple_on06
	]
]
freestyle_guitar_lights_off = [
	[
		Guitarist_Green_off01
		Guitarist_Green_off02
		Guitarist_Green_off03
		Guitarist_Green_off04
		Guitarist_Green_off05
		Guitarist_Green_off06
	]
	[
		Guitarist_Red_off01
		Guitarist_Red_off02
		Guitarist_Red_off03
		Guitarist_Red_off04
		Guitarist_Red_off05
		Guitarist_Red_off06
	]
	[
		Guitarist_Yellow_off01
		Guitarist_Yellow_off02
		Guitarist_Yellow_off03
		Guitarist_Yellow_off04
		Guitarist_Yellow_off05
		Guitarist_Yellow_off06
	]
	[
		Guitarist_Blue_off01
		Guitarist_Blue_off02
		Guitarist_Blue_off03
		Guitarist_Blue_off04
		Guitarist_Blue_off05
		Guitarist_Blue_off06
	]
	[
		Guitarist_Orange_off01
		Guitarist_Orange_off02
		Guitarist_Orange_off03
		Guitarist_Orange_off04
		Guitarist_Orange_off05
		Guitarist_Orange_off06
	]
	[
		Guitarist_Purple_off01
		Guitarist_Purple_off02
		Guitarist_Purple_off03
		Guitarist_Purple_off04
		Guitarist_Purple_off05
		Guitarist_Purple_off06
	]
]
freestyle_drummer_lights_on = [
	[
		Drummer_Green_on01
		Drummer_Green_on02
		Drummer_Green_on03
		Drummer_Green_on04
		Drummer_Green_on05
		Drummer_Green_on06
	]
	[
		Drummer_Red_on01
		Drummer_Red_on02
		Drummer_Red_on03
		Drummer_Red_on04
		Drummer_Red_on05
		Drummer_Red_on06
	]
	[
		Drummer_Yellow_on01
		Drummer_Yellow_on02
		Drummer_Yellow_on03
		Drummer_Yellow_on04
		Drummer_Yellow_on05
		Drummer_Yellow_on06
	]
	[
		Drummer_Blue_on01
		Drummer_Blue_on02
		Drummer_Blue_on03
		Drummer_Blue_on04
		Drummer_Blue_on05
		Drummer_Blue_on06
	]
	[
		Drummer_Orange_on01
		Drummer_Orange_on02
		Drummer_Orange_on03
		Drummer_Orange_on04
		Drummer_Orange_on05
		Drummer_Orange_on06
	]
	[
		Drummer_Purple_on01
		Drummer_Purple_on02
		Drummer_Purple_on03
		Drummer_Purple_on04
		Drummer_Purple_on05
		Drummer_Purple_on06
	]
]
freestyle_drummer_lights_off = [
	[
		Drummer_Green_off01
		Drummer_Green_off02
		Drummer_Green_off03
		Drummer_Green_off04
		Drummer_Green_off05
		Drummer_Green_off06
	]
	[
		Drummer_Red_off01
		Drummer_Red_off02
		Drummer_Red_off03
		Drummer_Red_off04
		Drummer_Red_off05
		Drummer_Red_off06
	]
	[
		Drummer_Yellow_off01
		Drummer_Yellow_off02
		Drummer_Yellow_off03
		Drummer_Yellow_off04
		Drummer_Yellow_off05
		Drummer_Yellow_off06
	]
	[
		Drummer_Blue_off01
		Drummer_Blue_off02
		Drummer_Blue_off03
		Drummer_Blue_off04
		Drummer_Blue_off05
		Drummer_Blue_off06
	]
	[
		Drummer_Orange_off01
		Drummer_Orange_off02
		Drummer_Orange_off03
		Drummer_Orange_off04
		Drummer_Orange_off05
		Drummer_Orange_off06
	]
	[
		Drummer_Purple_off01
		Drummer_Purple_off02
		Drummer_Purple_off03
		Drummer_Purple_off04
		Drummer_Purple_off05
		Drummer_Purple_off06
	]
]
freestyle_lattice_snapshots = [
	Lattice01
	Lattice02
	Lattice03
	Lattice04
	Lattice05
]
freestyle_transition_snapshots = [
	trans01
	trans02
	trans03
]
freestyle_card_snapshots = [
	Card_complete_01
	Card_complete_02
	Card_complete_03
	Card_complete_04
	Card_complete_05
]

script freestyle_play_lattice_lights 
	snapshot = 0
	GetArraySize ($freestyle_lattice_snapshots)
	begin
	LightShow_SetTime \{time = 0.5}
	LightShow_PlaySnapshot name = ($freestyle_lattice_snapshots [<snapshot>]) UseSnapshotPositions = true save = false
	<snapshot> = (<snapshot> + 1)
	if (<snapshot> >= <array_size>)
		<snapshot> = 0
	endif
	Wait \{3
		seconds}
	repeat
endscript

script freestyle_play_card_lights 
	GetRandomArrayElement ($freestyle_card_snapshots)
	LightShow_SetTime \{time = 0.25}
	LightShow_PlaySnapshot name = (<element>) UseSnapshotPositions = true save = false
endscript

script freestyle_play_transition_lights 
	GetRandomArrayElement ($freestyle_transition_snapshots)
	LightShow_SetTime \{time = 0.25}
	LightShow_PlaySnapshot name = (<element>) UseSnapshotPositions = true save = false
endscript

script freestyle_play_guitar_light \{event_triggered = 0
		on_array = freestyle_guitar_lights_on
		off_array = freestyle_guitar_lights_off
		pulse_script = freestyle_pulse_light_guitar}
	lights_on_array_array = []
	lights_off_array_array = []
	gem = 0
	begin
	gem_mask = ($freestyle_highway_gem_masks [<gem>])
	if (((<gem_mask> = 0) && (<event_triggered> = 0)) || (<gem_mask> && <event_triggered>))
		AddArrayElement array = <lights_on_array_array> element = ($<on_array> [<gem>])
		lights_on_array_array = <array>
		AddArrayElement array = <lights_off_array_array> element = ($<off_array> [<gem>])
		lights_off_array_array = <array>
	endif
	<gem> = (<gem> + 1)
	repeat 6
	max_lights = 0
	cur_light = 0
	GetArraySize <lights_on_array_array>
	num_light_arrays = <array_size>
	begin
	tmp_arry = (<lights_on_array_array> [<cur_light>])
	GetArraySize (<tmp_arry>)
	if (<array_size> > <max_lights>)
		max_lights = <array_size>
	endif
	on_size = <array_size>
	tmp_arry = (<lights_off_array_array> [<cur_light>])
	GetArraySize (<tmp_arry>)
	if NOT (<on_size> = <array_size>)
		ScriptAssert qs(0x272a875a) d = <cur_light>
	endif
	cur_light = (<cur_light> + 1)
	repeat <num_light_arrays>
	begin
	KillSpawnedScript name = <pulse_script>
	repeat <max_lights>
	cur_light = 0
	begin
	cur_light_array = 0
	Mod a = <cur_light> b = <num_light_arrays>
	cur_light_array = <Mod>
	tmp_arry = (<lights_on_array_array> [<cur_light_array>])
	GetArraySize (<tmp_arry>)
	if (<array_size> > <cur_light>)
		spawnscriptnow {
			<pulse_script>
			params = {
				snapshot_on = (<lights_on_array_array> [<cur_light_array>] [<cur_light>])
				snapshot_off = (<lights_off_array_array> [<cur_light_array>] [<cur_light>])
			}
		}
	endif
	cur_light = (<cur_light> + 1)
	repeat <max_lights>
endscript

script freestyle_do_drummer_lights \{index = 0}
	freestyle_pulse_drummer_light_array {
		index = <index>
		use_half
		script_prefix = 'freestyle_pulse_light_drum_'
		on_array = freestyle_drummer_lights_on
		off_array = freestyle_drummer_lights_off
	}
	if NOT is_guitarist_human
		freestyle_pulse_drummer_light_array {
			index = <index>
			use_half
			use_half_no_change
			script_prefix = 'freestyle_pulse_light_guitar_'
			on_array = freestyle_guitar_lights_on
			off_array = freestyle_guitar_lights_off
		}
	endif
endscript
freestyle_drummer_evens = 0

script freestyle_pulse_drummer_light_array \{index = 0
		script_prefix = 'freestyle_pulse_light_drum_'
		on_array = freestyle_drummer_lights_on
		off_array = freestyle_drummer_lights_off}
	GetArraySize ($<on_array> [<index>])
	if GotParam \{use_half}
		<array_size> = (<array_size> / 2)
	endif
	evens = 'even'
	if ($freestyle_drummer_evens = 0)
		if NOT GotParam \{use_half_no_change}
			change \{freestyle_drummer_evens = 1}
		endif
		<evens> = 'even'
	else
		if NOT GotParam \{use_half_no_change}
			change \{freestyle_drummer_evens = 0}
		endif
		<evens> = 'odd'
	endif
	light = 0
	if NOT ($freestyle_drummer_evens = 1)
		<light> = 1
	endif
	FormatText checksumname = pulse_script '%s%a' a = <evens> s = <script_prefix>
	begin
	KillSpawnedScript name = <pulse_script>
	repeat <array_size>
	begin
	lights_on_array = ($<on_array> [<index>])
	lights_off_array = ($<off_array> [<index>])
	spawnscriptnow {
		<pulse_script>
		params = {
			snapshot_on = (<lights_on_array> [<light>])
			snapshot_off = (<lights_off_array> [<light>])
		}
	}
	if GotParam \{use_half}
		light = (<light> + 2)
	else
		light = (<light> + 1)
	endif
	repeat <array_size>
endscript

script freestyle_pulse_light_guitar \{snapshot_on = purple_on
		snapshot_off = purple_off}
	LightShow_SetTime \{time = 0.2}
	LightShow_PlaySnapshot name = <snapshot_on> UseSnapshotPositions = true save = false
	Wait \{0.5
		seconds}
	LightShow_SetTime \{time = 1.0}
	LightShow_PlaySnapshot name = <snapshot_off> UseSnapshotPositions = true save = false
endscript

script freestyle_pulse_light_drum_even \{snapshot_on = purple_on
		snapshot_off = purple_off}
	LightShow_SetTime \{time = 0.2}
	LightShow_PlaySnapshot name = <snapshot_on> UseSnapshotPositions = true save = false
	Wait \{0.5
		seconds}
	LightShow_SetTime \{time = 1.0}
	LightShow_PlaySnapshot name = <snapshot_off> UseSnapshotPositions = true save = false
endscript

script freestyle_pulse_light_drum_odd \{snapshot_on = purple_on
		snapshot_off = purple_off}
	LightShow_SetTime \{time = 0.2}
	LightShow_PlaySnapshot name = <snapshot_on> UseSnapshotPositions = true save = false
	Wait \{0.5
		seconds}
	LightShow_SetTime \{time = 1.0}
	LightShow_PlaySnapshot name = <snapshot_off> UseSnapshotPositions = true save = false
endscript

script freestyle_pulse_light_guitar_odd \{snapshot_on = purple_on
		snapshot_off = purple_off}
	LightShow_SetTime \{time = 0.2}
	LightShow_PlaySnapshot name = <snapshot_on> UseSnapshotPositions = true save = false
	Wait \{0.5
		seconds}
	LightShow_SetTime \{time = 1.0}
	LightShow_PlaySnapshot name = <snapshot_off> UseSnapshotPositions = true save = false
endscript

script freestyle_pulse_light_guitar_even \{snapshot_on = purple_on
		snapshot_off = purple_off}
	LightShow_SetTime \{time = 0.2}
	LightShow_PlaySnapshot name = <snapshot_on> UseSnapshotPositions = true save = false
	Wait \{0.5
		seconds}
	LightShow_SetTime \{time = 1.0}
	LightShow_PlaySnapshot name = <snapshot_off> UseSnapshotPositions = true save = false
endscript

script freestyle_kill_light_scripts 
	KillSpawnedScript \{name = freestyle_pulse_light_guitar_even}
	KillSpawnedScript \{name = freestyle_pulse_light_guitar_odd}
	KillSpawnedScript \{name = freestyle_pulse_light_drum_odd}
	KillSpawnedScript \{name = freestyle_pulse_light_drum_even}
	KillSpawnedScript \{name = freestyle_play_lattice_lights}
	KillSpawnedScript \{name = freestyle_pulse_light_guitar}
endscript
