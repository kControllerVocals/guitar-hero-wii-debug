
script get_musician_profile_size 
	RequireParams \{[
			savegame
		]
		all}
	size = 0
	if GotParam \{borrowed_from_band_leader}
		globaltag_getarraysize savegame = <borrowed_from_band_leader> array_name = custom_profiles
		size = (<array_size> + <size>)
	endif
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	size = (<array_size> + <size>)
	GetArraySize \{$Preset_Musician_Profiles_Modifiable}
	size = (<array_size> + <size>)
	GetArraySize \{$Preset_Musician_Profiles_Locked}
	size = (<array_size> + <size>)
	GetArraySize \{$Net_Musician_Profiles}
	size = (<array_size> + <size>)
	return array_size = <size>
endscript

script get_musician_profile_struct_by_index 
	RequireParams \{[
			index
			savegame
		]
		all}
	if GotParam \{borrowed_from_band_leader}
		globaltag_getarraysize savegame = <borrowed_from_band_leader> array_name = custom_profiles
		if (<index> < <array_size>)
			globaltag_getarrayelement savegame = <borrowed_from_band_leader> array_name = custom_profiles index = <index>
			return profile_struct = <element> character_savegame = <borrowed_from_band_leader>
		endif
		index = (<index> - <array_size>)
	endif
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	if (<index> < <array_size>)
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <index>
		profile_struct = <element>
	else
		index = (<index> - <array_size>)
		GetArraySize \{$Preset_Musician_Profiles_Modifiable}
		if (<index> < <array_size>)
			profile_struct = ($Preset_Musician_Profiles_Modifiable [<index>])
			globaltag_get_preset_musician savegame = <savegame> profile_struct = <profile_struct> index = <index>
		else
			index = (<index> - <array_size>)
			GetArraySize \{$Preset_Musician_Profiles_Locked}
			if (<index> < <array_size>)
				profile_struct = ($Preset_Musician_Profiles_Locked [<index>])
				resolve_random_appearance profile_struct = <profile_struct>
			else
				index = (<index> - <array_size>)
				GetArraySize \{$Net_Musician_Profiles}
				if (<index> < <array_size>)
					profile_struct = ($Net_Musician_Profiles [<index>])
				else
					ScriptAssert \{'profile index out of bounds'}
				endif
			endif
		endif
	endif
	if NOT StructureContains Structure = <profile_struct> appearance
		ScriptAssert \{'All profiles require an appearance'}
	endif
	if NOT StructureContains Structure = <profile_struct> name
		ScriptAssert \{'All profiles require a name'}
	endif
	return profile_struct = <profile_struct> character_savegame = <savegame>
endscript

script get_musician_profile_struct_by_id 
	RequireParams \{[
			id
			savegame
		]
		all}
	if SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Locked id = <id>
		profile_struct = ($Preset_Musician_Profiles_Locked [<index>])
		resolve_random_appearance profile_struct = <profile_struct>
		return true profile_struct = <profile_struct>
	endif
	if SearchMusicianProfileArray array_name = Net_Musician_Profiles id = <id>
		return true profile_struct = ($Net_Musician_Profiles [<index>])
	endif
	if SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Modifiable id = <id>
		globaltag_get_preset_musician savegame = <savegame> profile_struct = ($Preset_Musician_Profiles_Modifiable [<index>]) index = <index>
		return true profile_struct = <profile_struct>
	endif
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	i = 0
	if (<array_size> > 0)
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <i>
		if (<id> = (<element>.name))
			return true profile_struct = <element>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if NOT GotParam \{dont_assert}
		ScriptAssert 'Profile %d not found' d = <id>
	endif
	return \{false}
endscript

script profile_exists 
	RequireParams \{[
			id
			savegame
		]
		all}
	if SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Locked id = <id>
		return \{true}
	endif
	if SearchMusicianProfileArray array_name = Net_Musician_Profiles id = <id>
		return \{true}
	endif
	if SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Modifiable id = <id>
		return \{true}
	endif
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	i = 0
	if (<array_size> > 0)
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <i>
		if (<id> = (<element>.name))
			return \{true}
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script new_custom_character_name 
	RequireParams \{[
			savegame
		]
		all}
	i = 0
	begin
	FormatText checksumname = id_checksum 'custom_character_%d' d = <i> AddToStringLookup = true
	if NOT is_completely_custom_musician id = <id_checksum> savegame = <savegame>
		return new_character_id = <id_checksum>
	endif
	i = (<i> + 1)
	repeat 100
	ScriptAssert \{'Cannot make a new custom character id'}
endscript

script profile_can_be_modified 
	RequireParams \{[
			id
			savegame
		]
		all}
	if SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Modifiable id = <id>
		return \{true}
	endif
	if is_completely_custom_musician id = <id> savegame = <savegame>
		return \{true}
	endif
	return \{false}
endscript

script is_completely_custom_musician 
	RequireParams \{[
			id
			savegame
		]
		all}
	globaltag_getarraysize savegame = <savegame> array_name = custom_profiles
	i = 0
	if (<array_size> > 0)
		begin
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <i>
		if (<id> = (<element>.name))
			return true custom_musician_index = <i>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return \{false}
endscript

script modify_custom_profile_appearance 
	RequireParams \{[
			id
			savegame
			appearance
		]
		all}
	if is_completely_custom_musician id = <id> savegame = <savegame>
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index>
		globaltag_setarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index> element = {
			<element>
			appearance = <appearance>
		}
	elseif SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Modifiable id = <id>
		globaltag_set_preset_musician savegame = <savegame> appearance = <appearance> index = <index>
	endif
endscript

script modify_custom_profile_fullname 
	RequireParams \{[
			id
			savegame
			fullname
		]
		all}
	if is_completely_custom_musician id = <id> savegame = <savegame>
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index>
		globaltag_setarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index> element = {
			<element>
			fullname = <fullname>
		}
	endif
endscript

script modify_custom_profile_blurb 
	RequireParams \{[
			id
			savegame
			blurb
		]
		all}
	if is_completely_custom_musician id = <id> savegame = <savegame>
		globaltag_getarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index>
		globaltag_setarrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index> element = {
			<element>
			blurb = <blurb>
		}
	endif
endscript

script add_new_custom_profile 
	RequireParams \{[
			savegame
			profile
		]
		all}
	globaltag_addarrayelement savegame = <savegame> array_name = custom_profiles element = <profile>
endscript

script delete_custom_profile 
	RequireParams \{[
			savegame
			id
		]
		all}
	if is_completely_custom_musician id = <id> savegame = <savegame>
		globaltag_removearrayelement savegame = <savegame> array_name = custom_profiles index = <custom_musician_index>
	endif
endscript

script restore_custom_musician_parts 
	RequireParams \{[
			savegame
			id
		]
		all}
	if SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Modifiable id = <id>
		globaltag_set_preset_musician savegame = <savegame> index = <index> appearance = ($Preset_Musician_Profiles_Modifiable [<index>].appearance)
	endif
endscript

script get_savegame_from_player_status 
	return \{savegame = 0
		owns_savegame = 1}
endscript

script get_savegame_from_controller 
	return \{savegame = 0
		owns_savegame = 1}
endscript

script resolve_random_appearance 
	RequireParams \{[
			profile_struct
		]
		all}
	if StructureContains Structure = <profile_struct> random_appearance_lookup
		band_builder_get_random_appearance character_id = (<profile_struct>.name)
		profile_struct = {
			<profile_struct>
			appearance = <appearance>
		}
	endif
	return profile_struct = <profile_struct>
endscript

script is_selectable_profile 
	RequireParams \{[
			profile_struct
		]
		all}
	if StructureContains Structure = <profile_struct> selection_not_allowed
		return \{false}
	else
		return \{true}
	endif
endscript

script is_allowed_part 
	if ((<part> = Bass) || (<part> = guitar) || (<part> = drum) || (<part> = Vocals))
		i = 0
		GetArraySize (<profile_struct>.allowed_parts)
		if (<array_size> > 0)
			begin
			if ((<profile_struct>.allowed_parts) [<i>] = <part>)
				return \{true}
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
		return \{false}
	endif
	if ($allow_controller_for_all_instruments = 1)
		return \{true}
	else
		ScriptAssert 'is_allowed_part - %d unrecognized' d = <part>
	endif
endscript

script modify_net_appearance 
	if ((<player> < 1) || (<player> > 4))
		ScriptAssert \{'Out of range'}
	endif
	index = (<player> - 1)
	new_entry = {(($Net_Musician_Profiles) [<index>]) appearance = <appearance> fullname = <fullname>}
	SetArrayElement ArrayName = Net_Musician_Profiles GlobalArray index = <index> newvalue = <new_entry>
endscript

script fill_local_appearance_data 
	printf \{qs("\Lfill_local_appearance_data")}
	printstruct <...>
	FormatText checksumname = player_status 'player%p_status' p = <player_number>
	if ($<player_status>.is_local_client = 1)
		my_character_id = ($<player_status>.character_id)
		get_savegame_from_player_status player_status = <player_status>
		if isXenon
			get_fullname_of_character id = <my_character_id> savegame = <savegame>
		else
			if get_musician_profile_struct_by_id id = <my_character_id> savegame = <savegame> dont_assert
				if StructureContains Structure = <profile_struct> fullname
					fullname = (<profile_struct>.fullname)
				endif
			endif
			if SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Locked id = <my_character_id>
				printf qs("\LNAME OF CHARACTER FOR PLAYER %d is %c") , d = <player_number> c = <fullname>
			elseif SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Modifiable id = <my_character_id>
				printf qs("\LNAME OF CHARACTER FOR PLAYER %d is %c") , d = <player_number> c = <fullname>
			else
				fullname = qs("Custom Character")
			endif
		endif
		get_musician_profile_struct_by_id id = <my_character_id> savegame = <savegame>
		resolve_guest_character_id id = <my_character_id>
		if (($<player_status>.part = drum) || ($<player_status>.part = Vocals))
			printf \{qs("\LWe should be filtering here but somehow my params are wrong")}
		endif
		return character_id = <my_character_id> appearance = {(<profile_struct>.appearance) fullname = <fullname> old_character_id = <id>}
	endif
endscript

script start_song_got_net_appearance 
	printf 'start_song_got_net_appearance %d' d = <netplayer>
	printcompactstruct <...>
	if (<netplayer> > 1)
		if (<netplayer> < 5)
			FormatText checksumname = player_status 'player%p_status' p = <netplayer>
			appearance_num = (<netplayer> -1)
			FormatText checksumname = netappearance_id 'netappearance%d' d = <appearance_num>
			change structurename = <player_status> character_id = <netappearance_id>
			modify_net_appearance player = <appearance_num> appearance = <appearance> fullname = (<appearance>.fullname)
			ui_event_get_top
			can_continue = 0
			if (<base_name> = 'band_mode')
				can_continue = 1
			elseif (<base_name> = 'net_career_join_popup')
				can_continue = 1
			endif
			if IsHost
				FormatText checksumname = player_status 'player%p_status' p = <netplayer>
				get_savegame_from_player_status player_status = <player_status>
				if (<can_continue> = 1)
					if ScreenElementExists \{id = MyInterfaceElement}
						MyInterfaceElement :GetSingleTag \{menus}
						(<menus> [(<netplayer> -1)]) :obj_spawnscript ui_band_mode_update_menu
					endif
					cas_queue_new_character_profile player = <netplayer> id = ($<player_status>.character_id) savegame = <savegame>
				endif
			endif
		endif
	endif
endscript

script check_for_dupe_profiles \{savegame = 0}
	if CD
		return
	endif
	get_musician_profile_size savegame = <savegame>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame>
	iname = (<profile_struct>.name)
	if NOT IsChecksum <iname>
		ScriptAssert \{'Profile names should be checksums now'}
	endif
	j = 0
	begin
	if NOT (<i> = <j>)
		get_musician_profile_struct_by_index index = <j> savegame = <savegame>
		jname = (<profile_struct>.name)
		if (<iname> = <jname>)
			ScriptAssert 'Profile name %s appears twice!' s = <iname>
		endif
	endif
	j = (<j> + 1)
	repeat <array_size>
	i = (<i> + 1)
	repeat <array_size>
endscript

script is_profile_unlocked 
	RequireParams \{[
			profile_struct
			savegame
		]
		all}
	if NOT StructureContains Structure = <profile_struct> locked
		return \{true}
	else
		get_current_band_info
		GetGlobalTags <band_info> savegame = <savegame>
		if NOT GotParam \{unlocked_profiles}
			return \{false}
		else
			if ArrayContains array = <unlocked_profiles> contains = (<profile_struct>.name)
				return \{true}
			else
				return \{false}
			endif
		endif
	endif
endscript

script unlock_profile 
	RequireParams \{[
			id
			savegame
		]
		all}
	get_musician_profile_struct_by_id id = <id> savegame = <savegame>
	if NOT StructureContains Structure = <profile_struct> locked
		return
	else
		get_current_band_info
		GetGlobalTags <band_info> savegame = <savegame>
		if NOT GotParam \{unlocked_profiles}
			AddArrayElement array = [] element = <id>
			LockGlobalTags \{off}
			SetGlobalTags <band_info> params = {unlocked_profiles = <array>} savegame = <savegame>
			LockGlobalTags
		else
			if NOT ArrayContains array = <unlocked_profiles> contains = <id>
				AddArrayElement array = <unlocked_profiles> element = <id>
				LockGlobalTags \{off}
				SetGlobalTags <band_info> params = {unlocked_profiles = <array>} savegame = <savegame>
				LockGlobalTags
			endif
		endif
	endif
endscript

script unlock_all_profiles 
	get_savegame_from_controller controller = ($primary_controller)
	get_musician_profile_size savegame = <savegame>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame>
	this_id = (<profile_struct>.name)
	if NOT ChecksumEquals a = <this_id> b = Jimi
		unlock_profile id = <this_id> savegame = <savegame>
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script is_profile_purchased 
	RequireParams \{[
			id
			savegame
		]
		all}
	get_musician_profile_struct_by_id id = <id> savegame = <savegame>
	if NOT StructureContains Structure = <profile_struct> price
		return \{true}
	else
		get_current_band_info
		GetGlobalTags <band_info> savegame = <savegame>
		if NOT GotParam \{purchased_profiles}
			return \{false}
		else
			if ArrayContains array = <purchased_profiles> contains = <id>
				return \{true}
			else
				return \{false}
			endif
		endif
	endif
endscript

script purchase_profile 
	RequireParams \{[
			id
			savegame
		]
		all}
	get_musician_profile_struct_by_id id = <id> savegame = <savegame>
	if NOT StructureContains Structure = <profile_struct> price
		return
	else
		get_current_band_info
		GetGlobalTags <band_info> savegame = <savegame>
		if NOT GotParam \{purchased_profiles}
			AddArrayElement array = [] element = <id>
			SetGlobalTags <band_info> params = {purchased_profiles = <array>} savegame = <savegame>
		else
			if NOT ArrayContains array = <purchased_profiles> contains = <id>
				AddArrayElement array = <purchased_profiles> element = <id>
				SetGlobalTags <band_info> params = {purchased_profiles = <array>} savegame = <savegame>
			endif
		endif
	endif
endscript

script purchase_all_profiles 
	get_savegame_from_controller controller = ($primary_controller)
	get_musician_profile_size savegame = <savegame>
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = <savegame>
	this_id = (<profile_struct>.name)
	purchase_profile id = <this_id> savegame = <savegame>
	i = (<i> + 1)
	repeat <array_size>
endscript

script get_fullname_of_character 
	RequireParams \{[
			id
			savegame
		]
		all}
	fullname = qs("Custom Character")
	if band_builder_is_finalized_random character_id = <id>
		if StructureContains Structure = ($guest_character_fullnames) <id>
			fullname = (($guest_character_fullnames).<id>)
		endif
	elseif get_musician_profile_struct_by_id id = <id> savegame = <savegame> dont_assert
		if StructureContains Structure = <profile_struct> fullname
			fullname = (<profile_struct>.fullname)
		endif
	endif
	if SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Locked id = <id>
		return fullname = <fullname>
	endif
	if SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Modifiable id = <id>
		return fullname = <fullname>
	endif
	if NOT GotParam \{fullname}
		fullname = qs("Custom Character")
	endif
	return fullname = <fullname>
endscript

script resolve_guest_character_id 
	RequireParams \{[
			id
		]
		all}
	if band_builder_is_finalized_random character_id = <id>
		if StructureContains Structure = ($guest_character_names) <id>
			return id = (($guest_character_names).<id>)
		endif
	endif
	return id = <id>
endscript
