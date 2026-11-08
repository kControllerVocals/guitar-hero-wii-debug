band_builder_anims = {
}

script band_anim_reset_loading 
	printf \{'band_anim_reset_loading'}
	change \{band_builder_anims = {
		}}
endscript

script band_anim_set_star_power_anim 
	RequireParams \{[
			star_power_anim
		]
		all}
	change band_builder_anims = {($band_builder_anims) starpower = <star_power_anim>}
endscript

script band_anim_check_star_power_anim 
	if StructureContains \{Structure = $band_builder_anims
			starpower}
		return true star_power_anim = (($band_builder_anims).starpower)
	endif
	return \{false}
endscript

script band_anim_set_appearance 
	RequireParams \{[
			info_struct
			appearance_checksum
		]
		all}
	struct = ($band_builder_anims)
	AddParam name = <info_struct> structure_name = struct value = <appearance_checksum>
	change band_builder_anims = <struct>
endscript

script band_anim_check_appearance 
	RequireParams \{[
			info_struct
			appearance_checksum
		]
		all}
	if StructureContains Structure = $band_builder_anims <info_struct>
		if (<appearance_checksum> = (($band_builder_anims).<info_struct>))
			return \{true}
		endif
	endif
	return \{false}
endscript

script band_ensure_flushed_frontend_pak 
	RequireParams \{[
			pak
		]
		all}
	if mpm_find_existing_loaded_pak pak = <pak>
		mpm_flush_all_paks_eachlink checksum = <links>
	endif
endscript

script band_load_anim_paks 
	band_ensure_flushed_frontend_pak \{pak = frontend_anims_guit1}
	band_ensure_flushed_frontend_pak \{pak = frontend_anims_guit2}
	band_ensure_flushed_frontend_pak \{pak = frontend_anims_sing}
	band_ensure_flushed_frontend_pak \{pak = frontend_anims_drum}
	is_training = 0
	GetArraySize \{$band_builder_current_setup}
	if (<array_size> > 0)
		i = 0
		begin
		RemoveParameter \{player_status}
		if StructureContains Structure = ($band_builder_current_setup [<i>]) player_status
			player_status = (($band_builder_current_setup [<i>]).player_status)
		endif
		band_load_single_anim_pak {
			character_id = (($band_builder_current_setup [<i>]).character_id)
			part = (($band_builder_current_setup [<i>]).real_part)
			name = (($band_builder_current_setup [<i>]).name)
			savegame = (($band_builder_current_setup [<i>]).name)
			async = <async>
			player_status = <player_status>
		}
		if ((($band_builder_current_setup [<i>]).character_id) = EmptyGuy)
			is_training = 1
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if (($is_attract_mode = 1) || (<is_training> = 1))
		change \{group_starpower = none}
		return
	endif
	if NOT band_anim_check_star_power_anim
		GetRandomArrayElement ($starpower_anim_sets)
		GetArraySize \{$starpower_anim_sets}
		if (<array_size> = 0)
			change \{group_starpower = none}
			return
		endif
		GetRandomValue name = newindex Integer a = 0 b = (<array_size> - 1)
		printf channel = AnimInfo qs("\LSelected %a for group starpower") a = ($starpower_anim_sets [<index>]) DoNotResolve
		starpower_pak = ($starpower_anim_sets [<index>])
		band_anim_set_star_power_anim star_power_anim = <starpower_pak>
	else
		printf 'Keeping star power pak from previous song %s' s = <starpower_pak>
		starpower_pak = <star_power_anim>
	endif
	ExtendCRC <starpower_pak> '_clip' out = starpower_clip
	change group_starpower = <starpower_clip>
	printf channel = AnimInfo qs("\Lattempting to load pak %a ") a = <starpower_pak> DoNotResolve
	mpm_load_pak pak = <starpower_pak> owner = band_anim_pak async = <async> links = Anim_StarPower_Pakman_Links
endscript
group_starpower = none

script band_load_single_anim_pak 
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	ExtendCRC <name> '_Info' out = info_struct
	if get_body_key_from_appearance key = anim_struct appearance = (<profile_struct>.appearance)
		if get_anim_struct_member anim_struct = <anim_struct> loading_into_song = ($current_song) member = <part>
			if StructureContains Structure = <anim_struct_member> pak
				pakname = (<anim_struct_member>.pak)
				mpm_load_pak pak = <pakname> owner = band_anim_pak async = <async>
			else
				printf 'No animation pak specified for %s' s = <name>
			endif
		endif
	endif
	GenerateChecksumFromStruct struct = (<profile_struct>.appearance)
	appearance_checksum = <structure_checksum>
	if NOT band_anim_check_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
		printf 'New anims for %s' s = <info_struct> DoNotResolve
		win_anim_name = none
		lose_anim_name = none
		intro_anim_name = none
		if get_cas_custom_anim instrument = <part> appearance = (<profile_struct>.appearance) part = CAS_Win_Anim
			win_anim_name = <custom_anim_name>
		else
			printf channel = AnimInfo qs("\Lwin anim not found for %a") a = <character_id>
		endif
		if get_cas_custom_anim instrument = <part> appearance = (<profile_struct>.appearance) part = CAS_Lose_Anim
			lose_anim_name = <custom_anim_name>
		else
			printf channel = AnimInfo qs("\Llose anim not found for %a") a = <character_id>
		endif
		if get_cas_custom_anim instrument = <part> appearance = (<profile_struct>.appearance) part = CAS_Intro_Anim
			intro_anim_name = <custom_anim_name>
		else
			printf channel = AnimInfo qs("\Lintro anim not found for %a") a = <character_id>
		endif
		if NOT GotParam \{player_status}
			band_get_human_players
			GetArraySize <human_players>
			if (<array_size> > 0)
				pointing_anim_set = default_pointing_anims
				get_key_from_appearance key = pointing_anim_set appearance = (<profile_struct>.appearance)
				GetRandomArrayElement <human_players>
				point_to = <element>
				if get_pointing_anim struct = ($<pointing_anim_set>) type = Win_Anims from = <part> to = <point_to>
					win_anim_name = <pointing_anim>
				endif
				GetRandomArrayElement <human_players>
				point_to = <element>
				if get_pointing_anim struct = ($<pointing_anim_set>) type = Lose_Anims from = <part> to = <point_to>
					lose_anim_name = <pointing_anim>
				endif
			endif
		endif
		if (($is_attract_mode = 1) || (<character_id> = EmptyGuy))
			win_anim_name = none
			lose_anim_name = none
			if (<character_id> = EmptyGuy)
				intro_anim_name = none
			endif
		endif
		change structurename = <info_struct> intro_anim_name = <intro_anim_name>
		change structurename = <info_struct> win_anim_name = <win_anim_name>
		change structurename = <info_struct> lose_anim_name = <lose_anim_name>
		band_anim_set_appearance appearance_checksum = <appearance_checksum> info_struct = <info_struct>
	else
		printf 'Avoiding rerandomizing anims for %s' s = <info_struct> DoNotResolve
		win_anim_name = ($<info_struct>.win_anim_name)
		lose_anim_name = ($<info_struct>.lose_anim_name)
		intro_anim_name = ($<info_struct>.intro_anim_name)
	endif
	printf 'win_anim_name = %w' w = <win_anim_name>
	printf 'lose_anim_name = %w' w = <lose_anim_name>
	printf 'intro_anim_name = %w' w = <intro_anim_name>
	if NOT (<win_anim_name> = none)
		mpm_load_pak pak = <win_anim_name> owner = band_anim_pak async = <async> links = Anim_Intro_Win_Pakman_Links
	endif
	if NOT (<lose_anim_name> = none)
		mpm_load_pak pak = <lose_anim_name> owner = band_anim_pak async = <async> links = Anim_Lose_Pakman_Links
	endif
	if NOT (<intro_anim_name> = none)
		mpm_load_pak pak = <intro_anim_name> owner = band_anim_pak async = <async> links = Anim_Intro_Win_Pakman_Links
	endif
endscript

script get_pointing_anim 
	if StructureContains Structure = <struct> <type>
		struct = (<struct>.<type>)
		if StructureContains Structure = <struct> <from>
			struct = (<struct>.<from>)
			if StructureContains Structure = <struct> <to>
				return true pointing_anim = (<struct>.<to>)
			endif
		endif
	endif
	return \{false}
endscript

script grab_custom_anim_name_from_key 
	RequireParams \{[
			part
			desc_id
			key
			who
		]
		all}
	GetActualCASOptionStruct part = <part> desc_id = <desc_id>
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		if GotParam \{headtohead_anim_name}
			if NOT (<who> = Drummer)
				printf 'headtohead_anim_name = %s' s = <headtohead_anim_name>
				key = headtohead_anim_name
			endif
		endif
	endif
	if GotParam <key>
		custom_anim_name = (<...>.<key>)
	endif
	if NOT GotParam \{custom_anim_name}
		printf 'Could not find key %p %d %k' p = <part> d = <desc_id> k = <key>
		return \{false}
	endif
	if IsArray <custom_anim_name>
		GetRandomArrayElement <custom_anim_name>
		custom_anim_name = <element>
	endif
	return true custom_anim_name = <custom_anim_name>
endscript

script get_cas_custom_anim 
	ResolveBodySpecificPartInAppearance part = <part> appearance = <appearance>
	switch <instrument>
		case guitar
		who = Guitarist
		case Bass
		who = bassist
		case drum
		who = Drummer
		case Vocals
		who = singer
		default
		return \{false}
	endswitch
	ExtendCRC <who> '_anim_name' out = key
	if StructureContains Structure = <appearance> <part>
		if grab_custom_anim_name_from_key part = <part> desc_id = (<appearance>.<part>.desc_id) key = <key> who = <who>
			return true custom_anim_name = <custom_anim_name>
		endif
	endif
	if NOT GotParam \{custom_anim_name}
		printf 'Profile doesnt have custom anim %p specified' p = <part> DoNotResolve
		begin
		if GetRandomArrayElement ($<part>)
			if NOT StructureContains Structure = <element> hidden
				if grab_custom_anim_name_from_key part = <part> desc_id = (<element>.desc_id) key = <key> who = <who>
					return true custom_anim_name = <custom_anim_name>
				endif
			endif
		endif
		repeat 50
	endif
	return \{false}
endscript

script band_start_anims 
	GetArraySize \{$band_builder_current_setup}
	if (<array_size> > 0)
		i = 0
		begin
		part = (($band_builder_current_setup [<i>]).part)
		real_part = (($band_builder_current_setup [<i>]).real_part)
		name = (($band_builder_current_setup [<i>]).name)
		character_id = (($band_builder_current_setup [<i>]).character_id)
		savegame = (($band_builder_current_setup [<i>]).savegame)
		get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
		params = {
			name = <name>
			character_id = <character_id>
			instrument = <real_part>
			loading_into_song = ($current_song)
			savegame = <savegame>
			profile_struct = <profile_struct>
		}
		start_anims = ($band_builder_part_constants.<real_part>.start_anims)
		printf channel = AnimInfo qs("\Lstarting anims on %a") a = <name>
		<start_anims> <params>
		i = (<i> + 1)
		repeat <array_size>
	endif
	Band_PlayTransitionIdles
endscript

script band_stop_anims 
	GetArraySize \{$band_builder_current_setup}
	if (<array_size> > 0)
		i = 0
		begin
		name = (($band_builder_current_setup [<i>]).name)
		if CompositeObjectExists name = <name>
			<name> :obj_killallspawnedscripts
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	BandManager_RemoveAllCharacters
endscript

script band_unload_anim_paks 
	mpm_object_unload_paks \{owner = band_anim_pak}
endscript
