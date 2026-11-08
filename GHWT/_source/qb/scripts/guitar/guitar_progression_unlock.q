new_unlockables = [
]
Unlock_Atoms = [
]

script setup_unlock_atoms 
	progression_reset_new_unlocks
	change \{Unlock_Atoms = [
		]}
	if GotParam \{Career_Band}
		setup_unlock_atoms_band
	elseif GotParam \{Career_Guitar}
		setup_unlock_atoms_guitar
	elseif GotParam \{Career_Bass}
		setup_unlock_atoms_bass
	elseif GotParam \{Career_Drum}
		setup_unlock_atoms_drums
	elseif GotParam \{Career_Vocals}
		setup_unlock_atoms_vocals
	endif
endscript

script setup_unlock_atoms_generic 
	RequireParams \{[
			part
		]
		all}
	atoms = ($Unlock_Atoms)
	switch (<part>)
		case 'band'
		bonus_params = {Career_Band}
		reward_array = $progression_band_rewards
		case 'guitar'
		bonus_params = {Career_Guitar}
		reward_array = $progression_guitar_rewards
		case 'bass'
		bonus_params = {Career_Bass}
		reward_array = $progression_bass_rewards
		case 'drum'
		bonus_params = {Career_Drum}
		reward_array = $progression_drum_rewards
		case 'vocals'
		bonus_params = {Career_Vocals}
		reward_array = $progression_vocals_rewards
	endswitch
	depend_atoms = []
	j = 1
	begin
	FormatText checksumname = depend_atom '%p_career_gig%n_complete' p = <part> n = <j>
	AddArrayElement array = <depend_atoms> element = <depend_atom>
	depend_atoms = <array>
	j = (<j> + 1)
	repeat 13
	index = 0
	i = 1
	begin
	FormatText checksumname = name '%p_gig%n_reward' p = <part> n = <i> AddToStringLookup = true
	depends_on = []
	AddArrayElement array = <depends_on> element = {type = atom atoms = <depend_atoms> depend_func = count count = <i>}
	depends_on = <array>
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) name = <name>}
		depends_on = <depends_on>
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	i = (<i> + 1)
	repeat 13
	FormatText checksumname = name '%p_every_gig_reward' p = <part> AddToStringLookup = true
	depends_on = []
	AddArrayElement array = <depends_on> element = {type = atom atoms = <depend_atoms>}
	depends_on = <array>
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) name = <name>}
		depends_on = <depends_on>
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	FormatText checksumname = name '%p_five_star_reward' p = <part> AddToStringLookup = true
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) name = <name>}
		depends_on = [
			{
				type = Scr
				Scr = progression_check_for_5_stars
				params = {part = <part>}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	change Unlock_Atoms = <atoms>
	return {index = <index> bonus_params = <bonus_params> reward_array = <reward_array>}
endscript

script setup_unlock_atoms_band 
	setup_unlock_atoms_generic \{part = 'band'}
	atoms = ($Unlock_Atoms)
	FormatText \{checksumname = name
		'%p_Today_reward'
		p = 'band'
		AddToStringLookup = true}
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) name = <name>}
		depends_on = [
			{
				type = Scr
				Scr = progression_check_for_song_complete
				params = {song = Today part = 'band'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	change Unlock_Atoms = <atoms>
endscript

script setup_unlock_atoms_guitar 
	setup_unlock_atoms_generic \{part = 'guitar'}
	atoms = ($Unlock_Atoms)
	FormatText \{checksumname = name
		'%p_BossZakk_reward'
		p = 'guitar'
		AddToStringLookup = true}
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) name = <name>}
		depends_on = [
			{
				type = Scr
				Scr = progression_check_for_song_complete
				params = {song = bosszakk part = 'guitar'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	FormatText \{checksumname = name
		'%p_BossTed_reward'
		p = 'guitar'
		AddToStringLookup = true}
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) name = <name>}
		depends_on = [
			{
				type = Scr
				Scr = progression_check_for_song_complete
				params = {song = bossted part = 'guitar'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	change Unlock_Atoms = <atoms>
endscript

script setup_unlock_atoms_bass 
	setup_unlock_atoms_generic \{part = 'bass'}
	atoms = ($Unlock_Atoms)
	FormatText \{checksumname = name
		'%p_DemolitionMan_reward'
		p = 'bass'
		AddToStringLookup = true}
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) name = <name>}
		depends_on = [
			{
				type = Scr
				Scr = progression_check_for_song_complete
				params = {song = DemolitionMan part = 'bass'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	change Unlock_Atoms = <atoms>
endscript

script setup_unlock_atoms_drums 
	setup_unlock_atoms_generic \{part = 'drum'}
	atoms = ($Unlock_Atoms)
	FormatText \{checksumname = name
		'%p_Dammit_reward'
		p = 'drum'
		AddToStringLookup = true}
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) name = <name>}
		depends_on = [
			{
				type = Scr
				Scr = progression_check_for_song_complete
				params = {song = Dammit part = 'drum'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	change Unlock_Atoms = <atoms>
endscript

script setup_unlock_atoms_vocals 
	setup_unlock_atoms_generic \{part = 'vocals'}
	atoms = ($Unlock_Atoms)
	FormatText \{checksumname = name
		'%p_MiseryBusiness_reward'
		p = 'vocals'
		AddToStringLookup = true}
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) name = <name>}
		depends_on = [
			{
				type = Scr
				Scr = progression_check_for_song_complete
				params = {song = miserybusiness part = 'vocals'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	FormatText \{checksumname = name
		'%p_CrazyTrain_reward'
		p = 'vocals'
		AddToStringLookup = true}
	atom = {
		name = <name>
		type = Scr
		atom_script = progression_add_new_unlocks
		atom_params = {(<reward_array> [<index>]) name = <name>}
		depends_on = [
			{
				type = Scr
				Scr = progression_check_for_song_complete
				params = {song = crazytrain part = 'vocals'}
			}
		]
	}
	AddArrayElement array = <atoms> element = <atom>
	atoms = <array>
	index = (<index> + 1)
	change Unlock_Atoms = <atoms>
endscript
car_part_already_loaded = 0

script progression_add_new_unlocks 
	printf channel = mychannel 'progression_add_new_unlocks %n' n = <name> DontAssertForChecksums channel = atom
	printf \{qs(0x82c6b2f8)
		d = $car_part_already_loaded}
	if NOT IsPakLoaded \{'pak\\car_parts\\car_parts.pak'
			heap = heap_song}
		ps2_load_car_part_script \{heap = BottomUpHeap}
		change \{car_part_already_loaded = 0}
	else
		change \{car_part_already_loaded = 1}
		printf \{qs(0x82c6b2f8)
			d = $car_part_already_loaded}
	endif
	new_unlockables_array = ($new_unlockables)
	if GotParam \{car_pieces}
		GetArraySize <car_pieces>
		my_array = []
		if (<array_size> > 0)
			i = 0
			begin
			get_savegame_from_controller controller = ($primary_controller)
			if NOT is_part_unlocked part = ((<car_pieces> [<i>]).part) desc_id = ((<car_pieces> [<i>]).desc_id) savegame = <savegame>
				AddArrayElement array = <my_array> element = (<car_pieces> [<i>])
				my_array = <array>
			endif
			j = 0
			begin
			get_savegame_from_controller controller = <j>
			set_current_band_part_flags part = ((<car_pieces> [<i>]).part) desc_id = ((<car_pieces> [<i>]).desc_id) unlocked savegame = <savegame>
			j = (<j> + 1)
			repeat ($current_num_players)
			i = (<i> + 1)
			repeat <array_size>
		endif
		GetArraySize <my_array>
		if (<array_size> > 0)
			if GotParam \{group_name}
				AddArrayElement array = <new_unlockables_array> element = {type = car_pieces group_name = <group_name> char_pieces = <my_array>}
			else
				AddArrayElement array = <new_unlockables_array> element = {type = car_pieces char_pieces = <my_array>}
			endif
			new_unlockables_array = <array>
			changed = 1
		endif
	endif
	if GotParam \{characters}
		GetArraySize <characters>
		if (<array_size> > 0)
			i = 0
			begin
			get_savegame_from_controller controller = ($primary_controller)
			get_musician_profile_struct_by_id id = (<characters> [<i>]) savegame = <savegame>
			if NOT is_profile_unlocked savegame = <savegame> profile_struct = <profile_struct>
				AddArrayElement array = <new_unlockables_array> element = {type = character item = (<characters> [<i>])}
				new_unlockables_array = <array>
			endif
			j = 0
			begin
			get_savegame_from_controller controller = <j>
			unlock_profile id = (<characters> [<i>]) savegame = <savegame>
			j = (<j> + 1)
			repeat ($current_num_players)
			i = (<i> + 1)
			repeat <array_size>
			changed = 1
		endif
	endif
	if GotParam \{changed}
		change new_unlockables = <new_unlockables_array>
	endif
	printf \{qs(0x82c6b2f8)
		d = $car_part_already_loaded}
	if (($car_part_already_loaded = 0))
		ps2_unload_car_part_script \{heap = BottomUpHeap}
	endif
endscript

script progression_get_new_unlocks 
	return {new_unlocks = ($new_unlockables)}
endscript

script progression_reset_new_unlocks 
	change \{new_unlockables = [
		]}
endscript

script progression_check_for_5_stars \{part = 'guitar'}
	FormatText checksumname = tier_global 'gh4_career_%p_songs' p = <part>
	setlist_prefix = ($<tier_global>.prefix)
	songs_completed = 0
	num_songs = 0
	tier_num = 1
	begin
	FormatText checksumname = tier 'tier%d' d = <tier_num>
	GetArraySize ($<tier_global>.<tier>.songs)
	songlist_size = <array_size>
	song_count = 0
	begin
	<song> = ($<tier_global>.<tier>.songs [<song_count>])
	if NOT (<tier> = tier19)
		if NOT (<tier> = tier20)
			if NOT progression_check_for_song_5_stars song = <song> part = <part>
				return \{false}
			endif
		endif
	endif
	<song_count> = (<song_count> + 1)
	repeat <songlist_size>
	tier_num = (<tier_num> + 1)
	repeat ($<tier_global>.num_tiers)
	return \{true}
endscript

script progression_check_for_song_5_stars 
	RequireParams \{[
			song
		]
		all}
	if NOT StructureContains Structure = ($gh_songlist_props.<song>) never_show_in_setlist
		get_song_saved_in_globaltags song = <song>
		get_song_allowed_in_quickplay song = <song>
		if NOT ((<saved_in_globaltags> = 1) && (<allowed_in_quickplay> = 1))
			return \{true}
		endif
	else
		return \{true}
	endif
	difficulties = ['Easy_Rhythm' , 'Easy' , 'Medium' , 'Hard' , 'Expert']
	<song_name> = ($permanent_songlist_props.<song>.name)
	i = 0
	begin
	FormatText checksumname = song_checksum '%s%p%d' s = <song_name> p = <part> d = (<difficulties> [<i>])
	GetGlobalTags <song_checksum> params = {stars}
	if (<stars> = 5)
		return \{true}
	endif
	i = (<i> + 1)
	repeat 5
	return \{false}
endscript

script progression_check_for_song_complete 
	RequireParams \{[
			song
		]
		all}
	difficulties = ['Easy_Rhythm' , 'Easy' , 'Medium' , 'Hard' , 'Expert']
	<song_name> = ($permanent_songlist_props.<song>.name)
	i = 0
	begin
	FormatText checksumname = song_checksum '%s%p%d' s = <song_name> p = <part> d = (<difficulties> [<i>])
	GetGlobalTags <song_checksum> params = {stars}
	if (<stars> >= 3)
		return \{true}
	endif
	i = (<i> + 1)
	repeat 5
	return \{false}
endscript
