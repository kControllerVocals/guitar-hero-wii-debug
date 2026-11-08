drum_sample_test = 0
drum_input_current_cymbal = null
drum_input_current_hihat = null
drum_input_current_kick = null
drum_input_current_snare = null
drum_input_current_tom = null
drum_pads = [
	{
		id = snare
		string_id = 'snare'
		name_text = qs("Snare")
	}
	{
		id = kick
		string_id = 'kick'
		name_text = qs("Kick")
	}
	{
		id = tom1
		string_id = 'tom1'
		name_text = qs("Tom1")
	}
	{
		id = tom2
		string_id = 'tom2'
		name_text = qs("Tom2")
	}
	{
		id = hihat
		string_id = 'hihat'
		name_text = qs("Hi-Hat")
	}
	{
		id = cymbal
		string_id = 'cymbal'
		name_text = qs("cymbal")
	}
]
drum_kits = [
	{
		id = heavyrock
		string_id = 'heavyrock'
		name_text = qs("\LHeavy Rock")
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = classicrock
		string_id = 'classicrock'
		name_text = qs("\LClassic Rock")
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = fusion
		string_id = 'fusion'
		name_text = qs("\LFusion")
		percussion_id = brazilianpercussion
		percussion_string_id = 'brazilianpercussion'
	}
	{
		id = hiphop
		string_id = 'hiphop'
		name_text = qs("\LHip Hop")
		percussion_id = hiphoppercussion
		percussion_string_id = 'hiphoppercussion'
	}
	{
		id = modernrock
		string_id = 'modernrock'
		name_text = qs("\LModern Rock")
		percussion_id = latinpercussion
		percussion_string_id = 'latinpercussion'
	}
	{
		id = Bliphop
		string_id = 'Bliphop'
		name_text = qs("\LBliphop")
		percussion_id = Robot
		percussion_string_id = 'robot'
	}
	{
		id = Electrobass
		string_id = 'Electro'
		name_text = qs("\LElectro")
		percussion_id = electropercussion
		percussion_string_id = 'electropercussion'
	}
	{
		id = Housekit
		string_id = 'House'
		name_text = qs("\LHouse")
		percussion_id = electropercussion
		percussion_string_id = 'electropercussion'
	}
	{
		id = Oldschool
		string_id = 'Oldschool'
		name_text = qs("\LOld School")
		percussion_id = oldschoolpercussion
		percussion_string_id = 'oldschoolpercussion'
	}
	{
		id = Cheesy
		string_id = 'Cheesy'
		name_text = qs("\LCheesy")
		percussion_id = Eightysdrums
		percussion_string_id = 'Eightys'
	}
	{
		id = Eightys
		string_id = 'Eightys'
		name_text = qs("\LEightys")
		percussion_id = Computight
		percussion_string_id = 'Computight'
	}
	{
		id = Computight
		string_id = 'Computight'
		name_text = qs("\LComputight")
		percussion_id = Robot
		percussion_string_id = 'robot'
	}
	{
		id = India
		string_id = 'India'
		name_text = qs("\LIndia")
		percussion_id = brazilianpercussion
		percussion_string_id = 'brazilianpercussion'
	}
	{
		id = Jazzy
		string_id = 'Jazzy'
		name_text = qs("\LJazzy")
		percussion_id = brazilianpercussion
		percussion_string_id = 'brazilianpercussion'
	}
	{
		id = Orchestral
		string_id = 'Orchestral'
		name_text = qs("\LOrchestral")
		percussion_id = latinpercussion
		percussion_string_id = 'latinpercussion'
	}
	{
		id = scratch
		string_id = 'scratch'
		name_text = qs("\LScratch")
		percussion_id = electro
		percussion_string_id = 'Electro'
	}
	{
		id = Scratch_Electro
		string_id = 'scratch_electro'
		name_text = qs("\LScratch Electro")
		percussion_id = electro
		percussion_string_id = 'Electro'
	}
	{
		id = dub
		string_id = 'dub'
		name_text = qs("\LDub")
		percussion_id = pigmy
		percussion_string_id = 'pigmy'
	}
	{
		id = conga
		string_id = 'conga'
		name_text = qs("\LLatin")
		percussion_id = latinpercussion
		percussion_string_id = 'latinpercussion'
	}
	{
		id = gunshot
		string_id = 'gunshot'
		name_text = qs("\LGunshot")
		percussion_id = rockpercussion
		percussion_string_id = 'rockpercussion'
	}
	{
		id = pigmy
		string_id = 'pigmy'
	}
	{
		id = Indiagirl
		string_id = 'Indiagirl'
	}
	{
		id = rockpercussion
		string_id = 'rockpercussion'
	}
	{
		id = monstervoice
		string_id = 'monstervoice'
	}
	{
		id = brazilianpercussion
		string_id = 'brazilianpercussion'
	}
	{
		id = hiphoppercussion
		string_id = 'hiphoppercussion'
	}
	{
		id = latinpercussion
		string_id = 'latinpercussion'
	}
	{
		id = oldschoolpercussion
		string_id = 'oldschoolpercussion'
	}
	{
		id = electropercussion
		string_id = 'electropercussion'
	}
	{
		id = Robot
		string_id = 'Robot'
	}
]

script play_drum_sample 
	if ($game_mode = training)
		if NOT ($current_speedfactor = 1.0)
			if NOT PlayerInfoEquals \{1
					part = drum}
				if ($current_time * 1000 < $current_starttime)
					return
				endif
			endif
		endif
	endif
	PlayDrumSample_CFunc <...>
	return drum_sample = <drum_sample>
endscript

script play_drum_sample_unoptimized \{drum_set = heavyrock
		pad = snare
		velocity = 127
		second_pedal_position = 127
		buss = Drums_InGame
		scale_volume = 5
		loop_pitch = 0
		pan_left = -1.0
		pan_right = 1.0
		pan_mono = 0.0}
	slot = 7
	if ((<buss> = Drums_InGame) || (<buss> = Drums_InGame_Kick) || (<buss> = Drums_InGame_Toms) || (<buss> = Drums_InGame_Hats) || (<buss> = Drums_InGame_Cymbals) || (<buss> = Drums_InGame_Snare))
		slot = 2
	endif
	if (<buss> = PracticeMode_Drums)
		return
	endif
	CastToInteger \{velocity}
	if (<velocity> < 0)
		<velocity> = 0
	endif
	if (<velocity> > 127)
		<velocity> = 127
	endif
	if IsTrue \{$DebugSoundFX}
		printf channel = sfx qs(0x2d388a61) s = <buss>
		printf channel = sfx qs("\LDrum Set = %s") s = <drum_set>
		printf channel = sfx qs("\LPad = %s") s = <pad>
	endif
	if (<velocity> < 0 || <velocity> > 127)
		printf \{channel = sfx
			qs(0xd20d5697)}
		return
	endif
	if NOT GotParam \{drum_checksum}
		if NOT GotParam \{drum_kit_string}
			GetArraySize \{$drum_kits}
			index = ($jam_current_drum_kit)
			drum_kit_string = ''
			<drum_kit_string> = ($drum_kits [<index>].string_id)
		endif
		if (<drum_kit_string> = '')
			printf \{channel = sfx
				qs(0xfa93a607)}
			return
		endif
		GetArraySize \{$drum_pads}
		index = 0
		pad_string = ''
		begin
		if (($drum_pads [<index>].id) = <pad>)
			<pad_string> = ($drum_pads [<index>].string_id)
		endif
		<index> = (<index> + 1)
		repeat <array_size>
		if (<pad_string> = '')
			printf \{channel = sfx
				qs(0x8c454bc4)}
			return
		endif
		FormatText checksumname = drum_sampleset_array '%a_%b_sampleset' a = <drum_kit_string> b = <pad_string>
	else
		drum_sampleset_array = <drum_checksum>
	endif
	GetArraySize ($<drum_sampleset_array>)
	if NOT GlobalExists name = <drum_sampleset_array> type = array
		printf \{channel = sfx
			qs(0x2db0057d)}
		return
	endif
	index = 0
	velocity_cutoff_low = 0.0
	velocity_cutoff_high = 0.0
	begin
	if (($<drum_sampleset_array> [<index>].velocity_cutoff) > <velocity>)
		<velocity_cutoff_high> = (1.0 * ($<drum_sampleset_array> [<index>].velocity_cutoff))
		break
	endif
	<velocity_cutoff_low> = (1.0 * ($<drum_sampleset_array> [<index>].velocity_cutoff))
	<velocity_index> = <index>
	<index> = (<index> + 1)
	if (<index> >= <array_size>)
		<velocity_cutoff_high> = 127.0
		break
	endif
	repeat
	adjusted_volume = 0.0
	adjusted_pitch = 0.0
	volume_low = ($<drum_sampleset_array> [<velocity_index>].volume_low)
	volume_high = ($<drum_sampleset_array> [<velocity_index>].volume_high)
	pitch_low = ($<drum_sampleset_array> [<velocity_index>].pitch_low)
	pitch_high = ($<drum_sampleset_array> [<velocity_index>].pitch_high)
	<adjusted_volume> = (((<volume_high> - <volume_low>) * ((<velocity> - <velocity_cutoff_low>) / (<velocity_cutoff_high> - <velocity_cutoff_low>))) + <volume_low>)
	<adjusted_pitch> = (((<pitch_high> - <pitch_low>) * ((<velocity> - <velocity_cutoff_low>) / (<velocity_cutoff_high> - <velocity_cutoff_low>))) + <pitch_low>)
	GetArraySize ($<drum_sampleset_array> [<velocity_index>].sample_array)
	GetRandomValue name = random_sample_index Integer a = 0 b = (<array_size> -1)
	random_sample = ($<drum_sampleset_array> [<velocity_index>].sample_array [<random_sample_index>])
	if ($drum_sample_test = 1)
		<random_sample> = Drum_Snare5
	endif
	if IsTrue \{$DebugSoundFX}
		<print_struct> = 1
	endif
	if ($jam_reverb = 1)
		if StructureContains Structure = ($<drum_sampleset_array> [<velocity_index>]) pan_left
			pan_left = ($<drum_sampleset_array> [<velocity_index>].pan_left)
			pan_right = ($<drum_sampleset_array> [<velocity_index>].pan_right)
			PlaySound print_struct = <print_struct> <random_sample> vol = (<adjusted_volume> + <scale_volume>) pitch = (<adjusted_pitch> + <loop_pitch>) pan1x = <pan_left> pan1y = 1.0 pan2x = <pan_right> pan2y = 1.0 buss = <buss> send_vol2 = -9 slot = <slot>
		elseif StructureContains Structure = ($<drum_sampleset_array> [<velocity_index>]) pan_mono
			pan_mono = ($<drum_sampleset_array> [<velocity_index>].pan_mono)
			PlaySound print_struct = <print_struct> <random_sample> vol = (<adjusted_volume> + <scale_volume>) pitch = (<adjusted_pitch> + <loop_pitch>) send_vol2 = -9 slot = <slot>
		else
			PlaySound print_struct = <print_struct> <random_sample> vol = (<adjusted_volume> + <scale_volume>) pitch = (<adjusted_pitch> + <loop_pitch>) buss = <buss> send_vol2 = -9 slot = <slot>
		endif
	else
		if StructureContains Structure = ($<drum_sampleset_array> [<velocity_index>]) pan_left
			pan_left = ($<drum_sampleset_array> [<velocity_index>].pan_left)
			pan_right = ($<drum_sampleset_array> [<velocity_index>].pan_right)
			PlaySound print_struct = <print_struct> <random_sample> vol = (<adjusted_volume> + <scale_volume>) pitch = (<adjusted_pitch> + <loop_pitch>) pan1x = <pan_left> pan1y = 1.0 pan2x = <pan_right> pan2y = 1.0 buss = <buss> slot = <slot>
		elseif StructureContains Structure = ($<drum_sampleset_array> [<velocity_index>]) pan_mono
			pan_mono = ($<drum_sampleset_array> [<velocity_index>].pan_mono)
			PlaySound print_struct = <print_struct> <random_sample> vol = (<adjusted_volume> + <scale_volume>) pitch = (<adjusted_pitch> + <loop_pitch>) buss = <buss> slot = <slot>
		else
			PlaySound print_struct = <print_struct> <random_sample> vol = (<adjusted_volume> + <scale_volume>) pitch = (<adjusted_pitch> + <loop_pitch>) buss = <buss> slot = <slot>
		endif
	endif
	if IsTrue \{$DebugSoundFX}
		printf channel = sfx qs(0x481304b4) a = <velocity_cutoff_low> b = <velocity_cutoff_high> c = <volume_low> d = <volume_high> e = <pitch_low> f = <pitch_high>
		printf channel = sfx qs(0xc86c799f) s = <random_sample_index> a = <adjusted_volume> b = <adjusted_pitch>
		printf \{channel = sfx
			qs("\L**********")}
	endif
	return drum_sample = <drum_sampleset_array>
endscript
LoadedDrumKitPaks_cymbal = 'none'
LoadedDrumKitPaks_floortom = 'none'
LoadedDrumKitPaks_hihat = 'none'
LoadedDrumKitPaks_hitom = 'none'
LoadedDrumKitPaks_kick = 'none'
LoadedDrumKitPaks_snare = 'none'
LoadedDrumKitPaks_cymbal_percussion = 'none'
LoadedDrumKitPaks_floortom_percussion = 'none'
LoadedDrumKitPaks_hihat_percussion = 'none'
LoadedDrumKitPaks_hitom_percussion = 'none'
LoadedDrumKitPaks_kick_percussion = 'none'
LoadedDrumKitPaks_snare_percussion = 'none'
DrumKitParts = {
	cymbal = 'cymbal'
	floortom = 'floortom'
	hihat = 'hihat'
	hitom = 'hitom'
	kick = 'kick'
	cymbal = 'cymbal'
	snare = 'snare'
}
last_drum_kit_loaded = 'none'
last_percussion_kit_loaded = 'none'
last_drum_kit_set = 'none'
last_percussion_kit_set = 'none'

script LoadDrumKitAll \{drum_kit = 'heavyrock'
		async = 1
		reset_percussion = 1
		heap = heap_bottom_up}
	if (<reset_percussion> = 1)
		change \{is_percussion_kit = 0}
	endif
	if (<drum_kit> = $last_drum_kit_loaded)
		if GotParam \{percussion_kit}
			if (<percussion_kit> = $last_percussion_kit_loaded)
				printf 'LoadDrumKitAll - %s and %p already loaded' s = <drum_kit> p = <percussion_kit>
				return
			endif
		else
			printf 'LoadDrumKitAll - %s already loaded' s = <drum_kit>
			return
		endif
	endif
	UnLoadDrumKitAll
	if NOT GotParam \{heap}
		<heap> = heap_bottom_up
	endif
	LoadDrumKit type = cymbal drum_kit = <drum_kit> async = <async> heap = <heap>
	LoadDrumKit type = floortom drum_kit = <drum_kit> async = <async> heap = <heap>
	LoadDrumKit type = hihat drum_kit = <drum_kit> async = <async> heap = <heap>
	LoadDrumKit type = hitom drum_kit = <drum_kit> async = <async> heap = <heap>
	LoadDrumKit type = kick drum_kit = <drum_kit> async = <async> heap = <heap>
	LoadDrumKit type = snare drum_kit = <drum_kit> async = <async> heap = <heap>
	change last_drum_kit_loaded = <drum_kit>
	change last_drum_kit_set = <drum_kit>
	if GotParam \{percussion_kit}
		LoadDrumKit type = cymbal drum_kit = <percussion_kit> async = <async> percussion heap = <heap>
		LoadDrumKit type = floortom drum_kit = <percussion_kit> async = <async> percussion heap = <heap>
		LoadDrumKit type = hihat drum_kit = <percussion_kit> async = <async> percussion heap = <heap>
		LoadDrumKit type = hitom drum_kit = <percussion_kit> async = <async> percussion heap = <heap>
		LoadDrumKit type = kick drum_kit = <percussion_kit> async = <async> percussion heap = <heap>
		LoadDrumKit type = snare drum_kit = <percussion_kit> async = <async> percussion heap = <heap>
		change last_percussion_kit_loaded = <percussion_kit>
		change last_percussion_kit_set = <percussion_kit>
	endif
endscript

script SetDrumKitAll 
	SetDrumKit type = cymbal drum_kit = <drum_kit> async = <async>
	SetDrumKit type = floortom drum_kit = <drum_kit> async = <async>
	SetDrumKit type = hihat drum_kit = <drum_kit> async = <async>
	SetDrumKit type = hitom drum_kit = <drum_kit> async = <async>
	SetDrumKit type = kick drum_kit = <drum_kit> async = <async>
	SetDrumKit type = snare drum_kit = <drum_kit> async = <async>
	change last_drum_kit_set = <drum_kit>
	if GotParam \{percussion_kit}
		SetDrumKit type = cymbal drum_kit = <percussion_kit> async = <async> percussion
		SetDrumKit type = floortom drum_kit = <percussion_kit> async = <async> percussion
		SetDrumKit type = hihat drum_kit = <percussion_kit> async = <async> percussion
		SetDrumKit type = hitom drum_kit = <percussion_kit> async = <async> percussion
		SetDrumKit type = kick drum_kit = <percussion_kit> async = <async> percussion
		SetDrumKit type = snare drum_kit = <percussion_kit> async = <async> percussion
		change last_percussion_kit_set = <percussion_kit>
	endif
endscript

script SetDrumKit \{type = snare
		drum_kit = 'heavyrock'}
	if StructureContains Structure = $DrumKitParts <type>
		if GotParam \{percussion}
			FormatText checksumname = global_pak_crc 'LoadedDrumKitPaks_%s_percussion' s = ($DrumKitParts.<type>)
			FormatText TextName = global_pak_txt 'LoadedDrumKitPaks_%s_percussion' s = ($DrumKitParts.<type>)
		else
			FormatText checksumname = global_pak_crc 'LoadedDrumKitPaks_%s' s = ($DrumKitParts.<type>)
			FormatText TextName = global_pak_txt 'LoadedDrumKitPaks_%s' s = ($DrumKitParts.<type>)
		endif
		FormatText checksumname = drumkit_function '%s_%t_startup' s = <drum_kit> t = ($DrumKitParts.<type>)
		change globalname = <global_pak_crc> newvalue = <drumkit_function>
		printf 'Set %a to %b' a = <global_pak_txt> b = <drumkit_function>
		return drum_kit_crc = <global_pak_crc> drum_kit_func = <drumkit_function>
	else
		printscriptinfo \{qs(0x21d31641)}
		ScriptAssert \{qs("\LInvalid Drumkit type")}
		return \{drum_kit_crc = none
			drum_kit_func = none}
	endif
endscript

script LoadDrumKit \{type = snare
		drum_kit = 'heavyrock'
		async = 1
		heap = heap_bottom_up}
	SetDrumKit <...>
	if NOT (<drum_kit_crc> = none)
		if (<heap> = heap_bottom_up)
			<drum_kit_func> ActionFunc = LoadSoundOnBottomUpHeap
		elseif (<heap> = fmod_heap)
			<drum_kit_func> ActionFunc = LoadSoundOnFModHeap
		else
			ScriptAssert \{qs(0x2dd19cb3)}
		endif
	endif
endscript

script UnLoadDrumKitAll 
	UnLoadDrumKit \{type = cymbal}
	UnLoadDrumKit \{type = floortom}
	UnLoadDrumKit \{type = hihat}
	UnLoadDrumKit \{type = hitom}
	UnLoadDrumKit \{type = kick}
	UnLoadDrumKit \{type = snare}
	UnLoadDrumKit \{type = cymbal
		percussion}
	UnLoadDrumKit \{type = floortom
		percussion}
	UnLoadDrumKit \{type = hihat
		percussion}
	UnLoadDrumKit \{type = hitom
		percussion}
	UnLoadDrumKit \{type = kick
		percussion}
	UnLoadDrumKit \{type = snare
		percussion}
	change \{last_drum_kit_loaded = 'none'}
	change \{last_percussion_kit_loaded = 'none'}
endscript

script UnsetDrumKit \{type = snare}
	if StructureContains Structure = $DrumKitParts <type>
		if GotParam \{percussion}
			FormatText checksumname = global_pak_crc 'LoadedDrumKitPaks_%s_percussion' s = ($DrumKitParts.<type>)
			FormatText TextName = global_pak_txt 'LoadedDrumKitPaks_%s_percussion' s = ($DrumKitParts.<type>)
		else
			FormatText checksumname = global_pak_crc 'LoadedDrumKitPaks_%s' s = ($DrumKitParts.<type>)
			FormatText TextName = global_pak_txt 'LoadedDrumKitPaks_%s' s = ($DrumKitParts.<type>)
		endif
		if GotParam \{percussion}
			FormatText checksumname = drumkit_function '%s_%t_startup' s = $last_percussion_kit_loaded t = ($DrumKitParts.<type>)
		else
			FormatText checksumname = drumkit_function '%s_%t_startup' s = $last_drum_kit_loaded t = ($DrumKitParts.<type>)
		endif
		change globalname = <global_pak_crc> newvalue = 'none'
		printf 'Set %a to %b' a = <global_pak_txt> b = 'none'
		return drum_kit_crc = <global_pak_crc> drum_kit_func = <drumkit_function>
	else
		printscriptinfo \{qs(0xafcca493)}
		ScriptAssert \{qs("\LInvalid Drumkit type")}
		return \{drum_kit_crc = none
			drum_kit_func = none}
	endif
endscript

script UnLoadDrumKit \{type = snare}
	UnsetDrumKit <...>
	if NOT (<drum_kit_crc> = none)
		if NOT (<drum_kit_crc> = 'none')
			(<drum_kit_func>) ActionFunc = UnLoadSoundDebug
		else
			if GotParam \{percussion}
				printf qs(0xf9aaff68) a = <type>
			else
				printf qs(0x0fbf5224) a = <type>
			endif
		endif
	endif
endscript

script UnLoadSoundDebug 
	UnloadSound <...>
endscript

script LoadSoundOnFModHeap 
	LoadSound <...> heap = fmod_heap
endscript

script LoadSoundOnBottomUpHeap 
	LoadSound <...> heap = heap_bottom_up
endscript

script heavyrock_cymbal_startup 
	<ActionFunc> 'HeavyRockCrash_Lvl_10_01'
	<ActionFunc> 'HeavyRockCrash_Lvl_8_01'
	<ActionFunc> 'HeavyRockCrash_Lvl_6_01'
	<ActionFunc> 'HeavyRockRide_Lvl_10_01'
	<ActionFunc> 'HeavyRockRide_Lvl_8_01'
	<ActionFunc> 'HeavyRockRide_Lvl_6_01'
endscript

script heavyrock_floortom_startup 
	<ActionFunc> 'HeavyRockFlTom_Lvl_10_01'
	<ActionFunc> 'HeavyRockFlTom_Lvl_8_01'
	<ActionFunc> 'HeavyRockFlTom_Lvl_6_01'
	<ActionFunc> 'HeavyRockFlTom_Lvl_4_01'
endscript

script heavyrock_hihat_startup 
	<ActionFunc> 'HeavyRockHHClosed_Lvl_10_01'
	<ActionFunc> 'HeavyRockHHClosed_Lvl_8_01'
	<ActionFunc> 'HeavyRockHHClosed_Lvl_6_01'
	<ActionFunc> 'HeavyRockHHClosed_Lvl_6_02'
	<ActionFunc> 'HeavyRockHHClosed_Lvl_4_01'
	<ActionFunc> 'HeavyRockHHClosed_Lvl_4_02'
	<ActionFunc> 'HeavyRockHHOpen_Lvl_10_01'
	<ActionFunc> 'HeavyRockHHOpen_Lvl_9_01'
	<ActionFunc> 'HeavyRockHHOpen_Lvl_6_01'
	<ActionFunc> 'HeavyRockHHOpen_Lvl_6_02'
	<ActionFunc> 'HeavyRockHHOpen_Lvl_2_01'
endscript

script heavyrock_hitom_startup 
	<ActionFunc> 'HeavyRockHiTom_Lvl_10_01'
	<ActionFunc> 'HeavyRockHiTom_Lvl_8_01'
	<ActionFunc> 'HeavyRockHiTom_Lvl_6_01'
	<ActionFunc> 'HeavyRockHiTom_Lvl_4_01'
endscript

script heavyrock_kick_startup 
	<ActionFunc> 'HeavyRockKick_Lvl_10_01'
	<ActionFunc> 'HeavyRockKick_Lvl_6_01'
	<ActionFunc> 'HeavyRockKick_Lvl_2_01'
endscript

script heavyrock_snare_startup 
	<ActionFunc> 'HeavyRockSnare_Lvl_12_01'
	<ActionFunc> 'HeavyRockSnare_Lvl_12_02'
	<ActionFunc> 'HeavyRockSnare_Lvl_12_03'
	<ActionFunc> 'HeavyRockSnare_Lvl_10_01'
	<ActionFunc> 'HeavyRockSnare_Lvl_8_01'
	<ActionFunc> 'HeavyRockSnare_Lvl_6_01'
	<ActionFunc> 'HeavyRockSnare_Lvl_4_01'
	<ActionFunc> 'HeavyRockSnare_Lvl_2_01'
endscript

script classicrock_cymbal_startup 
	<ActionFunc> 'classicRockCrash_Lvl_10_01'
	<ActionFunc> 'classicRockCrash_Lvl_8_01'
	<ActionFunc> 'classicRockCrash_Lvl_6_01'
	<ActionFunc> 'classicRockRide_Lvl_10_01'
	<ActionFunc> 'classicRockRide_Lvl_8_01'
	<ActionFunc> 'classicRockRide_Lvl_6_01'
endscript

script classicrock_floortom_startup 
	<ActionFunc> 'classicRockFlTom_Lvl_10_01'
	<ActionFunc> 'classicRockFlTom_Lvl_8_01'
	<ActionFunc> 'classicRockFlTom_Lvl_6_01'
	<ActionFunc> 'classicRockFlTom_Lvl_4_01'
endscript

script classicrock_hihat_startup 
	<ActionFunc> 'classicRockHHClosed_Lvl_10_01'
	<ActionFunc> 'classicRockHHClosed_Lvl_8_01'
	<ActionFunc> 'classicRockHHClosed_Lvl_6_01'
	<ActionFunc> 'classicRockHHClosed_Lvl_4_01'
	<ActionFunc> 'classicRockHHOpen_Lvl_10_01'
	<ActionFunc> 'classicRockHHOpen_Lvl_9_01'
	<ActionFunc> 'classicRockHHOpen_Lvl_6_01'
	<ActionFunc> 'classicRockHHOpen_Lvl_2_01'
endscript

script classicrock_hitom_startup 
	<ActionFunc> 'classicRockHiTom_Lvl_10_01'
	<ActionFunc> 'classicRockHiTom_Lvl_8_01'
	<ActionFunc> 'classicRockHiTom_Lvl_6_01'
	<ActionFunc> 'classicRockHiTom_Lvl_4_01'
endscript

script classicrock_kick_startup 
	<ActionFunc> 'classicRockKick_Lvl_10_01'
	<ActionFunc> 'classicRockKick_Lvl_6_01'
	<ActionFunc> 'classicRockKick_Lvl_2_01'
endscript

script classicrock_snare_startup 
	<ActionFunc> 'classicRockSnare_Lvl_12_01'
	<ActionFunc> 'classicRockSnare_Lvl_12_02'
	<ActionFunc> 'classicRockSnare_Lvl_12_03'
	<ActionFunc> 'classicRockSnare_Lvl_10_01'
	<ActionFunc> 'classicRockSnare_Lvl_8_01'
	<ActionFunc> 'classicRockSnare_Lvl_6_01'
	<ActionFunc> 'classicRockSnare_Lvl_4_01'
	<ActionFunc> 'classicRockSnare_Lvl_2_01'
endscript

script Fusion_cymbal_startup 
	<ActionFunc> 'FusionCrash_Lvl_10_01'
	<ActionFunc> 'FusionCrash_Lvl_8_01'
	<ActionFunc> 'FusionCrash_Lvl_6_01'
	<ActionFunc> 'FusionRide_Lvl_10_01'
	<ActionFunc> 'FusionRide_Lvl_8_01'
	<ActionFunc> 'FusionRide_Lvl_6_01'
endscript

script Fusion_floortom_startup 
	<ActionFunc> 'FusionFlTom_Lvl_10_01'
	<ActionFunc> 'FusionFlTom_Lvl_8_01'
	<ActionFunc> 'FusionFlTom_Lvl_6_01'
	<ActionFunc> 'FusionFlTom_Lvl_4_01'
endscript

script Fusion_hihat_startup 
	<ActionFunc> 'FusionHHClosed_Lvl_10_01'
	<ActionFunc> 'FusionHHClosed_Lvl_8_01'
	<ActionFunc> 'FusionHHClosed_Lvl_6_01'
	<ActionFunc> 'FusionHHClosed_Lvl_4_01'
	<ActionFunc> 'FusionHHOpen_Lvl_10_01'
	<ActionFunc> 'FusionHHOpen_Lvl_9_01'
	<ActionFunc> 'FusionHHOpen_Lvl_6_01'
	<ActionFunc> 'FusionHHOpen_Lvl_2_01'
endscript

script Fusion_hitom_startup 
	<ActionFunc> 'FusionHiTom_Lvl_10_01'
	<ActionFunc> 'FusionHiTom_Lvl_8_01'
	<ActionFunc> 'FusionHiTom_Lvl_6_01'
	<ActionFunc> 'FusionHiTom_Lvl_4_01'
endscript

script Fusion_kick_startup 
	<ActionFunc> 'FusionKick_Lvl_10_01'
	<ActionFunc> 'FusionKick_Lvl_6_01'
	<ActionFunc> 'FusionKick_Lvl_2_01'
endscript

script Fusion_snare_startup 
	<ActionFunc> 'FusionSnare_Lvl_12_01'
	<ActionFunc> 'FusionSnare_Lvl_12_02'
	<ActionFunc> 'FusionSnare_Lvl_12_03'
	<ActionFunc> 'FusionSnare_Lvl_10_01'
	<ActionFunc> 'FusionSnare_Lvl_8_01'
	<ActionFunc> 'FusionSnare_Lvl_6_01'
	<ActionFunc> 'FusionSnare_Lvl_4_01'
	<ActionFunc> 'FusionSnare_Lvl_2_01'
endscript

script hiphop_cymbal_startup 
	<ActionFunc> 'HipHopCrash_Lvl_10_01'
endscript

script hiphop_floortom_startup 
	<ActionFunc> 'HipHopFlTom_Lvl_10_01'
endscript

script hiphop_hihat_startup 
	<ActionFunc> 'HipHopHHOpen_Lvl_10_01'
endscript

script hiphop_hitom_startup 
	<ActionFunc> 'HipHopHiTom_Lvl_10_01'
endscript

script hiphop_kick_startup 
	<ActionFunc> 'HipHopKick_Lvl_10_01'
endscript

script hiphop_snare_startup 
	<ActionFunc> 'HipHopSnare_Lvl_10_01'
endscript

script modernrock_cymbal_startup 
	<ActionFunc> 'modernrockCrash_Lvl_10_01'
	<ActionFunc> 'modernrockCrash_Lvl_8_01'
	<ActionFunc> 'modernrockCrash_Lvl_6_01'
	<ActionFunc> 'modernrockCrash_Lvl_4_01'
	<ActionFunc> 'modernrockRide_Lvl_10_01'
	<ActionFunc> 'modernrockRide_Lvl_8_01'
	<ActionFunc> 'modernrockRide_Lvl_6_01'
	<ActionFunc> 'modernrockRide_Lvl_4_01'
endscript

script modernrock_floortom_startup 
	<ActionFunc> 'modernrockFlTom_Lvl_10_01'
	<ActionFunc> 'modernrockFlTom_Lvl_8_01'
	<ActionFunc> 'modernrockFlTom_Lvl_6_01'
	<ActionFunc> 'modernrockFlTom_Lvl_4_01'
endscript

script modernrock_hihat_startup 
	<ActionFunc> 'modernrockHHClosed_Lvl_10_01'
	<ActionFunc> 'modernrockHHClosed_Lvl_9_01'
	<ActionFunc> 'modernrockHHClosed_Lvl_8_01'
	<ActionFunc> 'modernrockHHClosed_Lvl_6_01'
	<ActionFunc> 'modernrockHHClosed_Lvl_4_01'
	<ActionFunc> 'modernrockHHClosed_Lvl_2_01'
	<ActionFunc> 'modernrockHHOpen_Lvl_10_01'
	<ActionFunc> 'modernrockHHOpen_Lvl_9_01'
	<ActionFunc> 'modernrockHHOpen_Lvl_8_01'
	<ActionFunc> 'modernrockHHOpen_Lvl_6_01'
	<ActionFunc> 'modernrockHHOpen_Lvl_4_01'
	<ActionFunc> 'modernrockHHOpen_Lvl_2_01'
endscript

script modernrock_hitom_startup 
	<ActionFunc> 'modernrockHiTom_Lvl_10_01'
	<ActionFunc> 'modernrockHiTom_Lvl_8_01'
	<ActionFunc> 'modernrockHiTom_Lvl_6_01'
	<ActionFunc> 'modernrockHiTom_Lvl_4_01'
endscript

script modernrock_kick_startup 
	<ActionFunc> 'modernrockKick_Lvl_10_01'
	<ActionFunc> 'modernrockKick_Lvl_6_01'
	<ActionFunc> 'modernrockKick_Lvl_2_01'
endscript

script modernrock_snare_startup 
	<ActionFunc> 'modernrockSnare_Lvl_12_01'
	<ActionFunc> 'modernrockSnare_Lvl_12_02'
	<ActionFunc> 'modernrockSnare_Lvl_12_03'
	<ActionFunc> 'modernrockSnare_Lvl_10_01'
	<ActionFunc> 'modernrockSnare_Lvl_8_01'
	<ActionFunc> 'modernrockSnare_Lvl_6_01'
	<ActionFunc> 'modernrockSnare_Lvl_4_01'
	<ActionFunc> 'modernrockSnare_Lvl_2_01'
endscript

script rockpercussion_cymbal_startup 
	<ActionFunc> 'RockPercussion_Gong_Lvl_10_01'
	<ActionFunc> 'RockPercussion_Gong_Lvl_6_01'
endscript

script rockpercussion_floortom_startup 
	<ActionFunc> 'RockPercussion_RotoTomMed_Lvl_10_01'
	<ActionFunc> 'RockPercussion_RotoTomMed_Lvl_8_01'
	<ActionFunc> 'RockPercussion_RotoTomMed_Lvl_6_01'
	<ActionFunc> 'RockPercussion_RotoTomMed_Lvl_4_01'
	<ActionFunc> 'RockPercussion_RotoTomMed_Lvl_2_01'
endscript

script rockpercussion_hihat_startup 
	<ActionFunc> 'RockPercussion_Tambourine_Lvl_12_01'
	<ActionFunc> 'RockPercussion_Tambourine_Lvl_12_02'
	<ActionFunc> 'RockPercussion_Tambourine_Lvl_12_03'
	<ActionFunc> 'RockPercussion_Tambourine_Lvl_10_01'
	<ActionFunc> 'RockPercussion_Tambourine_Lvl_10_02'
	<ActionFunc> 'RockPercussion_Tambourine_Lvl_10_03'
endscript

script rockpercussion_hitom_startup 
	<ActionFunc> 'RockPercussion_RotoTomHi_Lvl_10_01'
	<ActionFunc> 'RockPercussion_RotoTomHi_Lvl_8_01'
	<ActionFunc> 'RockPercussion_RotoTomHi_Lvl_6_01'
	<ActionFunc> 'RockPercussion_RotoTomHi_Lvl_4_01'
	<ActionFunc> 'RockPercussion_RotoTomHi_Lvl_2_01'
endscript

script rockpercussion_kick_startup 
	<ActionFunc> 'RockPercussion_ConcertBassDrum_Lvl_10_01'
	<ActionFunc> 'RockPercussion_ConcertBassDrum_Lvl_8_01'
	<ActionFunc> 'RockPercussion_ConcertBassDrum_Lvl_6_01'
	<ActionFunc> 'RockPercussion_ConcertBassDrum_Lvl_4_01'
endscript

script rockpercussion_snare_startup 
	<ActionFunc> 'RockPercussion_HandClap_Lvl_10_01'
	<ActionFunc> 'RockPercussion_HandClap_Lvl_10_02'
	<ActionFunc> 'RockPercussion_HandClap_Lvl_10_03'
	<ActionFunc> 'RockPercussion_HandClap_Lvl_10_04'
	<ActionFunc> 'RockPercussion_HandClap_Lvl_10_05'
endscript

script latinpercussion_cymbal_startup 
	<ActionFunc> 'LatinPercussion_Clave_Lvl_10_01'
	<ActionFunc> 'LatinPercussion_Clave_Lvl_10_02'
	<ActionFunc> 'LatinPercussion_Clave_Lvl_10_03'
	<ActionFunc> 'LatinPercussion_Clave_Lvl_10_04'
endscript

script latinpercussion_floortom_startup 
	<ActionFunc> 'LatinPercussion_LowTimbale_Lvl_10_01'
	<ActionFunc> 'LatinPercussion_LowTimbale_Lvl_10_02'
	<ActionFunc> 'LatinPercussion_LowTimbale_Lvl_8_01'
	<ActionFunc> 'LatinPercussion_LowTimbale_Lvl_6_01'
	<ActionFunc> 'LatinPercussion_LowTimbale_Lvl_4_01'
	<ActionFunc> 'LatinPercussion_LowTimbale_Lvl_2_01'
endscript

script latinpercussion_hihat_startup 
	<ActionFunc> 'LatinPercussion_Maraca_Lvl_10_01'
	<ActionFunc> 'LatinPercussion_Maraca_Lvl_10_02'
	<ActionFunc> 'LatinPercussion_Maraca_Lvl_10_03'
endscript

script latinpercussion_hitom_startup 
	<ActionFunc> 'LatinPercussion_HighTimbale_Lvl_10_01'
	<ActionFunc> 'LatinPercussion_HighTimbale_Lvl_10_02'
	<ActionFunc> 'LatinPercussion_HighTimbale_Lvl_8_01'
	<ActionFunc> 'LatinPercussion_HighTimbale_Lvl_6_01'
	<ActionFunc> 'LatinPercussion_HighTimbale_Lvl_4_01'
	<ActionFunc> 'LatinPercussion_HighTimbale_Lvl_2_01'
endscript

script latinpercussion_kick_startup 
	<ActionFunc> 'LatinPercussion_BoxDrum_Lvl_10_01'
	<ActionFunc> 'LatinPercussion_BoxDrum_Lvl_8_01'
	<ActionFunc> 'LatinPercussion_BoxDrum_Lvl_6_01'
	<ActionFunc> 'LatinPercussion_BoxDrum_Lvl_4_01'
	<ActionFunc> 'LatinPercussion_BoxDrum_Lvl_2_01'
endscript

script latinpercussion_snare_startup 
	<ActionFunc> 'LatinPercussion_Conga_Lvl_12_01'
	<ActionFunc> 'LatinPercussion_Conga_Lvl_12_02'
	<ActionFunc> 'LatinPercussion_Conga_Lvl_12_03'
	<ActionFunc> 'LatinPercussion_Conga_Lvl_10_01'
	<ActionFunc> 'LatinPercussion_Conga_Lvl_8_01'
	<ActionFunc> 'LatinPercussion_Conga_Lvl_7_01'
	<ActionFunc> 'LatinPercussion_Conga_Lvl_5_01'
	<ActionFunc> 'LatinPercussion_Conga_Lvl_4_01'
	<ActionFunc> 'LatinPercussion_Conga_Lvl_2_01'
endscript

script Brazilianpercussion_cymbal_startup 
	<ActionFunc> 'BrazilianPercussion_WhistleHi_Lvl_10_01'
	<ActionFunc> 'BrazilianPercussion_WhistleHi_Lvl_10_02'
	<ActionFunc> 'BrazilianPercussion_WhistleHi_Lvl_10_03'
	<ActionFunc> 'BrazilianPercussion_WhistleLow_Lvl_10_01'
	<ActionFunc> 'BrazilianPercussion_WhistleLow_Lvl_10_02'
	<ActionFunc> 'BrazilianPercussion_WhistleLow_Lvl_10_03'
endscript

script Brazilianpercussion_floortom_startup 
	<ActionFunc> 'BrazilianPercussion_QuicaLow_Lvl_10_01'
	<ActionFunc> 'BrazilianPercussion_QuicaLow_Lvl_8_01'
	<ActionFunc> 'BrazilianPercussion_QuicaLow_Lvl_6_01'
endscript

script Brazilianpercussion_hihat_startup 
	<ActionFunc> 'BrazilianPercussion_Pandiero_Lvl_10_01'
	<ActionFunc> 'BrazilianPercussion_Pandiero_Lvl_8_01'
	<ActionFunc> 'BrazilianPercussion_Pandiero_Lvl_6_01'
	<ActionFunc> 'BrazilianPercussion_Pandiero_Lvl_4_01'
endscript

script Brazilianpercussion_hitom_startup 
	<ActionFunc> 'BrazilianPercussion_QuicaHigh_Lvl_10_01'
	<ActionFunc> 'BrazilianPercussion_QuicaHigh_Lvl_8_01'
	<ActionFunc> 'BrazilianPercussion_QuicaHigh_Lvl_6_01'
endscript

script Brazilianpercussion_kick_startup 
	<ActionFunc> 'BrazilianPercussion_Surdo_Lvl_10_01'
	<ActionFunc> 'BrazilianPercussion_Surdo_Lvl_8_01'
	<ActionFunc> 'BrazilianPercussion_Surdo_Lvl_6_01'
endscript

script Brazilianpercussion_snare_startup 
	<ActionFunc> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_12_01'
	<ActionFunc> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_12_02'
	<ActionFunc> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_12_03'
	<ActionFunc> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_10_01'
	<ActionFunc> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_8_01'
	<ActionFunc> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_6_01'
	<ActionFunc> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_4_01'
	<ActionFunc> 'BrazilianPercussion_CiaxaDeGuerra_Lvl_2_01'
endscript

script HipHopPercussion_cymbal_startup 
	<ActionFunc> 'HipHopPercussion_Cymbal_Lvl_10_01'
	<ActionFunc> 'HipHopPercussion_Cymbal_Lvl_8_01'
	<ActionFunc> 'HipHopPercussion_Cymbal_Lvl_6_01'
	<ActionFunc> 'HipHopPercussion_Cymbal_Lvl_4_01'
endscript

script HipHopPercussion_floortom_startup 
	<ActionFunc> 'HipHopPercussion_Scratch_Lvl_10_01'
	<ActionFunc> 'HipHopPercussion_Scratch_Lvl_8_01'
	<ActionFunc> 'HipHopPercussion_Scratch_Lvl_6_01'
	<ActionFunc> 'HipHopPercussion_Scratch_Lvl_4_01'
	<ActionFunc> 'HipHopPercussion_Scratch_Lvl_2_01'
endscript

script HipHopPercussion_hihat_startup 
	<ActionFunc> 'HipHopPercussion_HiHat_Lvl_10_01'
	<ActionFunc> 'HipHopPercussion_HiHat_Lvl_8_01'
	<ActionFunc> 'HipHopPercussion_HiHat_Lvl_6_01'
	<ActionFunc> 'HipHopPercussion_HiHat_Lvl_4_01'
	<ActionFunc> 'HipHopPercussion_HiHat_Lvl_2_01'
endscript

script HipHopPercussion_hitom_startup 
	<ActionFunc> 'HipHopPercussion_Vocal_Lvl_10_01'
	<ActionFunc> 'HipHopPercussion_Vocal_Lvl_8_01'
	<ActionFunc> 'HipHopPercussion_Vocal_Lvl_6_01'
endscript

script HipHopPercussion_kick_startup 
	<ActionFunc> 'HipHopPercussion_Kick_Lvl_10_01'
	<ActionFunc> 'HipHopPercussion_Kick_Lvl_8_01'
	<ActionFunc> 'HipHopPercussion_Kick_Lvl_6_01'
endscript

script HipHopPercussion_snare_startup 
	<ActionFunc> 'HipHopPercussion_Snare_Lvl_10_01'
	<ActionFunc> 'HipHopPercussion_Snare_Lvl_8_01'
	<ActionFunc> 'HipHopPercussion_Snare_Lvl_6_01'
endscript

script Bliphop_cymbal_startup 
	<ActionFunc> 'Bliphop_Crash'
endscript

script Bliphop_floortom_startup 
	<ActionFunc> 'Bliphop_Tom2'
endscript

script Bliphop_hihat_startup 
	<ActionFunc> 'Bliphop_Hihat_10'
endscript

script Bliphop_hitom_startup 
	<ActionFunc> 'Bliphop_Tom1'
endscript

script Bliphop_kick_startup 
	<ActionFunc> 'Bliphop_kick_10'
endscript

script Bliphop_snare_startup 
	<ActionFunc> 'Bliphop_snare_10'
endscript

script Electro_cymbal_startup 
	<ActionFunc> 'Electro_cowbell'
endscript

script Electro_floortom_startup 
	<ActionFunc> 'Electro_tomlow'
endscript

script Electro_hihat_startup 
	<ActionFunc> 'Electro_hhclose'
	<ActionFunc> 'Electro_hhopen'
endscript

script Electro_hitom_startup 
	<ActionFunc> 'Electro_tommed'
	<ActionFunc> 'Electro_tomhigh'
endscript

script Electro_kick_startup 
	<ActionFunc> 'Electro_kick'
endscript

script Electro_snare_startup 
	<ActionFunc> 'Electro_snare'
endscript

script Electropercussion_cymbal_startup 
	<ActionFunc> 'Elecperc_clap'
endscript

script Electropercussion_floortom_startup 
	<ActionFunc> 'Elecperc_conga'
endscript

script Electropercussion_hihat_startup 
	<ActionFunc> 'Elecperc_cabasa'
endscript

script Electropercussion_hitom_startup 
	<ActionFunc> 'Elecperc_conga2'
endscript

script Electropercussion_kick_startup 
	<ActionFunc> 'Elecperc_kick'
endscript

script Electropercussion_snare_startup 
	<ActionFunc> 'Elecperc_rimshot'
endscript

script Oldschoolpercussion_cymbal_startup 
	<ActionFunc> 'Oldschoolperc_clap'
endscript

script Oldschoolpercussion_floortom_startup 
	<ActionFunc> 'Oldschoolperc_timbalelow'
endscript

script Oldschoolpercussion_hihat_startup 
	<ActionFunc> 'Oldschoolperc_hhclose'
	<ActionFunc> 'Oldschoolperc_hhopen'
endscript

script Oldschoolpercussion_hitom_startup 
	<ActionFunc> 'Oldschoolperc_timbalemed'
endscript

script Oldschoolpercussion_kick_startup 
	<ActionFunc> 'Oldschoolperc_kick'
endscript

script Oldschoolpercussion_snare_startup 
	<ActionFunc> 'Oldschoolperc_timbalehigh'
endscript

script Computight_cymbal_startup 
	<ActionFunc> 'Compukit_cowbell'
endscript

script Computight_floortom_startup 
	<ActionFunc> 'Compukit_woodlow'
endscript

script Computight_hihat_startup 
	<ActionFunc> 'Compukit_hhclose'
	<ActionFunc> 'Compukit_hhopen'
endscript

script Computight_hitom_startup 
	<ActionFunc> 'Compukit_woodhigh'
endscript

script Computight_kick_startup 
	<ActionFunc> 'Compukit_kick'
endscript

script Computight_snare_startup 
	<ActionFunc> 'Compukit_snare'
endscript

script Cheesy_cymbal_startup 
	<ActionFunc> 'Cheesy_scratch2'
	<ActionFunc> 'Cheesy_scratch1'
	<ActionFunc> 'Cheesy_cowbell'
endscript

script Cheesy_floortom_startup 
	<ActionFunc> 'Cheesy_vocode1'
	<ActionFunc> 'Cheesy_vocode2'
endscript

script Cheesy_hihat_startup 
	<ActionFunc> 'Cheesy_hhat1'
	<ActionFunc> 'Cheesy_hhat2'
endscript

script Cheesy_hitom_startup 
	<ActionFunc> 'Cheesy_brass'
	<ActionFunc> 'Cheesy_orch'
endscript

script Cheesy_kick_startup 
	<ActionFunc> 'Cheesy_kick'
endscript

script Cheesy_snare_startup 
	<ActionFunc> 'Cheesy_snare'
endscript

script Eightys_cymbal_startup 
	<ActionFunc> 'Eightys_crash3'
	<ActionFunc> 'Eightys_crash2'
	<ActionFunc> 'Eightys_crash1'
endscript

script Eightys_floortom_startup 
	<ActionFunc> 'Eightys_tomlow'
endscript

script Eightys_hihat_startup 
	<ActionFunc> 'Eightys_hhclosed'
	<ActionFunc> 'Eightys_hhopen'
endscript

script Eightys_hitom_startup 
	<ActionFunc> 'Eightys_tomhigh'
	<ActionFunc> 'Eightys_tommed'
endscript

script Eightys_kick_startup 
	<ActionFunc> 'Eightys_kick'
endscript

script Eightys_snare_startup 
	<ActionFunc> 'Eightys_snare1'
	<ActionFunc> 'Eightys_snare2'
endscript

script Oldschool_cymbal_startup 
	<ActionFunc> 'Oldschool_crash'
	<ActionFunc> 'Oldschool_ride'
endscript

script Oldschool_floortom_startup 
	<ActionFunc> 'Oldschool_tomlow'
endscript

script Oldschool_hihat_startup 
	<ActionFunc> 'Oldschool_hhclose'
	<ActionFunc> 'Oldschool_hhopen'
endscript

script Oldschool_hitom_startup 
	<ActionFunc> 'Oldschool_tomhi'
	<ActionFunc> 'Oldschool_tommed'
endscript

script Oldschool_kick_startup 
	<ActionFunc> 'Oldschool_kick1'
	<ActionFunc> 'Oldschool_kick2'
endscript

script Oldschool_snare_startup 
	<ActionFunc> 'Oldschool_snare1'
	<ActionFunc> 'Oldschool_snare2'
	<ActionFunc> 'Oldschool_snare3'
endscript

script House_cymbal_startup 
	<ActionFunc> 'House_crash'
	<ActionFunc> 'House_ride'
endscript

script House_floortom_startup 
	<ActionFunc> 'House_tomlow'
endscript

script House_hihat_startup 
	<ActionFunc> 'House_hhclose'
	<ActionFunc> 'House_hhopen'
endscript

script House_hitom_startup 
	<ActionFunc> 'House_tomhigh'
	<ActionFunc> 'House_tommed'
endscript

script House_kick_startup 
	<ActionFunc> 'House_kick1'
	<ActionFunc> 'House_kick2'
	<ActionFunc> 'House_kick3'
endscript

script House_snare_startup 
	<ActionFunc> 'House_snare1'
	<ActionFunc> 'House_snare2'
	<ActionFunc> 'House_clap'
endscript

script India_kick_startup 
	<ActionFunc> 'india_kick'
endscript

script India_hitom_startup 
	<ActionFunc> 'india_tom1'
endscript

script India_cymbal_startup 
	<ActionFunc> 'india_crash'
endscript

script India_hihat_startup 
	<ActionFunc> 'india_ping'
endscript

script India_snare_startup 
	<ActionFunc> 'india_snare'
endscript

script India_floortom_startup 
	<ActionFunc> 'india_tom2'
endscript

script Indiagirl_kick_startup 
	<ActionFunc> 'India_girlkick'
endscript

script Indiagirl_hitom_startup 
	<ActionFunc> 'India_girl4'
endscript

script Indiagirl_cymbal_startup 
	<ActionFunc> 'India_girl_longer2'
endscript

script Indiagirl_hihat_startup 
	<ActionFunc> 'India_girl2'
	<ActionFunc> 'India_girl_longer'
endscript

script Indiagirl_snare_startup 
	<ActionFunc> 'India_girl1'
endscript

script Indiagirl_floortom_startup 
	<ActionFunc> 'India_girl3'
endscript

script Orchestral_kick_startup 
	<ActionFunc> 'orch_kick'
endscript

script Orchestral_hitom_startup 
	<ActionFunc> 'orch_tom1'
endscript

script Orchestral_cymbal_startup 
	<ActionFunc> 'orch_crash'
endscript

script Orchestral_hihat_startup 
	<ActionFunc> 'orch_hihat'
endscript

script Orchestral_snare_startup 
	<ActionFunc> 'orch_snare'
endscript

script Orchestral_floortom_startup 
	<ActionFunc> 'orch_tom2'
endscript

script Jazzy_kick_startup 
	<ActionFunc> 'j_kick'
endscript

script Jazzy_hitom_startup 
	<ActionFunc> 'j_tom1'
endscript

script Jazzy_cymbal_startup 
	<ActionFunc> 'j_crash'
endscript

script Jazzy_hihat_startup 
	<ActionFunc> 'j_hihat'
endscript

script Jazzy_snare_startup 
	<ActionFunc> 'j_snare'
endscript

script Jazzy_floortom_startup 
	<ActionFunc> 'j_tom2'
endscript

script Scratch_floortom_startup 
	<ActionFunc> 'DJ_aahh1'
	<ActionFunc> 'DJ_aahh7'
	<ActionFunc> 'DJ_Laser10'
	<ActionFunc> 'DJ_ugh14'
	<ActionFunc> 'DJ_blast18'
endscript

script Scratch_snare_startup 
	<ActionFunc> 'DJ_aahh2'
	<ActionFunc> 'DJ_aahh8'
	<ActionFunc> 'DJ_Laser11'
	<ActionFunc> 'DJ_ugh15'
	<ActionFunc> 'DJ_blast19'
endscript

script Scratch_hihat_startup 
	<ActionFunc> 'DJ_aahh3'
	<ActionFunc> 'DJ_aahh9'
	<ActionFunc> 'DJ_stab12'
	<ActionFunc> 'DJ_ugh16'
	<ActionFunc> 'DJ_ahhya20'
endscript

script Scratch_hitom_startup 
	<ActionFunc> 'DJ_aahh4'
	<ActionFunc> 'DJ_whew26'
	<ActionFunc> 'DJ_stab13'
	<ActionFunc> 'DJ_ugh17'
	<ActionFunc> 'DJ_ahhya21'
endscript

script Scratch_cymbal_startup 
	<ActionFunc> 'DJ_aahh5'
	<ActionFunc> 'DJ_aahh6'
	<ActionFunc> 'DJ_shortbaby23'
	<ActionFunc> 'DJ_ugh26'
	<ActionFunc> 'DJ_whistle28'
endscript

script Scratch_kick_startup 
	<ActionFunc> 'DJ_aahhfull31'
	<ActionFunc> 'DJ_rewind29'
	<ActionFunc> 'DJ_backspin22'
	<ActionFunc> 'DJ_fastrewind24'
	<ActionFunc> 'DJ_backforth25'
endscript

script robot_kick_startup 
	<ActionFunc> 'robot_zero'
	<ActionFunc> 'robot_one'
	<ActionFunc> 'robot_two'
	<ActionFunc> 'robot_three'
	<ActionFunc> 'robot_rock'
endscript

script robot_floortom_startup 
	<ActionFunc> 'robot_technology'
	<ActionFunc> 'robot_beat'
	<ActionFunc> 'robot_harder'
	<ActionFunc> 'robot_baby'
	<ActionFunc> 'robot_bionic'
endscript

script robot_cymbal_startup 
	<ActionFunc> 'robot_energize'
	<ActionFunc> 'robot_jam'
	<ActionFunc> 'robot_on'
	<ActionFunc> 'robot_it'
	<ActionFunc> 'robot_future'
endscript

script robot_hihat_startup 
	<ActionFunc> 'robot_electro'
	<ActionFunc> 'robot_fire'
	<ActionFunc> 'robot_faster'
	<ActionFunc> 'robot_floor'
	<ActionFunc> 'robot_freak'
endscript

script robot_snare_startup 
	<ActionFunc> 'robot_boy'
	<ActionFunc> 'robot_compute'
	<ActionFunc> 'robot_better'
	<ActionFunc> 'robot_drop'
	<ActionFunc> 'robot_electricity'
endscript

script robot_hitom_startup 
	<ActionFunc> 'robot_fresh'
	<ActionFunc> 'robot_funky'
	<ActionFunc> 'robot_stronger'
	<ActionFunc> 'robot_get'
	<ActionFunc> 'robot_girl'
endscript

script scratch_electro_kick_startup 
	<ActionFunc> 'scratch_electro_kick'
endscript

script scratch_electro_hitom_startup 
	<ActionFunc> 'scratch_electro_tom1'
endscript

script scratch_electro_cymbal_startup 
	<ActionFunc> 'scratch_electro_crash'
endscript

script scratch_electro_hihat_startup 
	<ActionFunc> 'scratch_electro_hihat'
endscript

script scratch_electro_snare_startup 
	<ActionFunc> 'scratch_electro_snare'
endscript

script scratch_electro_floortom_startup 
	<ActionFunc> 'scratch_electro_tom2'
endscript

script dub_kick_startup 
	<ActionFunc> 'dub_kick'
endscript

script dub_hitom_startup 
	<ActionFunc> 'dub_tom1'
endscript

script dub_cymbal_startup 
	<ActionFunc> 'dub_cymbal'
endscript

script dub_hihat_startup 
	<ActionFunc> 'dub_hihat'
endscript

script dub_snare_startup 
	<ActionFunc> 'dub_snare'
endscript

script dub_floortom_startup 
	<ActionFunc> 'dub_tom2'
endscript

script pigmy_kick_startup 
	<ActionFunc> 'pigmy_kick'
endscript

script pigmy_hitom_startup 
	<ActionFunc> 'pigmy_tom1'
endscript

script pigmy_cymbal_startup 
	<ActionFunc> 'pigmy_cymbal'
endscript

script pigmy_hihat_startup 
	<ActionFunc> 'pigmy_hihat'
endscript

script pigmy_snare_startup 
	<ActionFunc> 'pigmy_snare'
endscript

script pigmy_floortom_startup 
	<ActionFunc> 'pigmy_tom2'
endscript

script conga_kick_startup 
	<ActionFunc> 'conga_kick'
endscript

script conga_hitom_startup 
	<ActionFunc> 'conga_tom1'
endscript

script conga_cymbal_startup 
	<ActionFunc> 'conga_cymbal'
	<ActionFunc> 'conga_crash'
endscript

script conga_hihat_startup 
	<ActionFunc> 'conga_hihat'
endscript

script conga_snare_startup 
	<ActionFunc> 'conga_snare'
endscript

script conga_floortom_startup 
	<ActionFunc> 'conga_tom2'
endscript

script Gunshot_cymbal_startup 
	<ActionFunc> 'Gun_ricocrash'
	<ActionFunc> 'Gun_ricochet'
endscript

script Gunshot_floortom_startup 
	<ActionFunc> 'Gun_tom2'
endscript

script Gunshot_hihat_startup 
	<ActionFunc> 'Gun_hihat'
	<ActionFunc> 'Gun_hihat_open'
endscript

script Gunshot_hitom_startup 
	<ActionFunc> 'Gun_tom1'
endscript

script Gunshot_kick_startup 
	<ActionFunc> 'Gun_kickheavy'
	<ActionFunc> 'Gun_kickheavy2'
endscript

script Gunshot_snare_startup 
	<ActionFunc> 'Gun_robosnare'
	<ActionFunc> 'Gun_heavysnare'
	<ActionFunc> 'Gun_snare'
endscript

script Play_All_Drum_Samples 
	waittime = 0.3
	velocity = 7
	pad = snare
	printf channel = sfx qs("\LDrum Set = %s") s = <drumset>
	printf channel = sfx qs("\LPad = %s") s = <pad_type>
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waittime> seconds
	if (<velocity> = 127)
		if (<pad> = snare)
			<pad> = kick
			velocity = 7
		elseif (<pad> = kick)
			<pad> = tom1
			velocity = 7
		elseif (<pad> = tom1)
			<pad> = tom2
			velocity = 7
		elseif (<pad> = tom2)
			<pad> = hihat
			velocity = 7
		elseif (<pad> = hihat)
			<pad> = cymbal
			velocity = 7
		elseif (<pad> = cymbal)
			break
		endif
	endif
	repeat
endscript

script Play_Kick_Samples 
	waittime = 0.3
	velocity = 7
	pad = kick
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script Play_Snare_Samples 
	waittime = 0.3
	velocity = 7
	pad = snare
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script Play_hitom_Samples 
	waittime = 0.3
	velocity = 7
	pad = tom1
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script Play_FlTom_Samples 
	waittime = 0.3
	velocity = 7
	pad = tom2
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script Play_hihat_Samples 
	waittime = 0.3
	velocity = 7
	pad = hihat
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript

script Play_cymbal_Samples 
	waittime = 0.3
	velocity = 7
	pad = cymbal
	begin
	play_drum_sample drum_set = <drumset> pad = <pad> velocity = <velocity>
	<velocity> = (<velocity> + 2)
	Wait <waittime> seconds
	if (<velocity> = 127)
		break
	endif
	repeat
endscript
