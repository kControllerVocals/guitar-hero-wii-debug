
script check_if_part_deformable 
	if GetCASAppearancePart part = <part>
		GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		if GotParam \{deform_bones}
			return \{is_enabled = 1}
		endif
	endif
	return \{is_enabled = 0}
endscript

script is_part_capable 
	RequireParams \{[
			part
		]
		all}
	if GetCASAppearancePart part = <part>
		GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		if GotParam \{sections}
			return \{true}
		endif
	endif
	return \{false}
endscript

script check_if_part_editable 
	<retVal> = 0
	if GotParam \{part}
		if GetCASAppearancePart part = <part>
			if (<desc_id> = none)
				<retVal> = 0
			else
				<retVal> = 1
			endif
		endif
	endif
	if (<retVal>)
		if GotParam \{extra_script}
			<extra_script> <extra_script_params> part = <part>
			<retVal> = <is_enabled>
		endif
	endif
	return is_enabled = <retVal>
endscript

script check_if_parts_editable 
	<retVal> = 0
	if GotParam \{parts}
		GetArraySize <parts>
		<index> = 0
		begin
		if GetCASAppearancePart part = (<parts> [<index>])
			if (<desc_id> = none)
				<retVal> = 0
			else
				<retVal> = 1
				break
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retVal>
endscript

script check_if_part_logoable 
	<retVal> = 0
	if GotParam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	if GotParam \{parts}
		GetArraySize <parts>
		<index> = 0
		begin
		character_part = (<parts> [<index>])
		if GetCASAppearancePart part = <character_part>
			GetActualCASOptionStruct part = <character_part> desc_id = <desc_id>
			if GotParam \{supports_logo}
				<retVal> = 1
				break
			else
				<retVal> = 0
				break
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retVal>
endscript

script check_if_part_front_logoable 
	if GotParam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	check_if_part_logoable <...>
	if (<is_enabled> = 1)
		if GotParam \{parts}
			GetArraySize <parts>
			<index> = 0
			begin
			character_part = (<parts> [<index>])
			if GetCASAppearancePart part = <character_part>
				GetActualCASOptionStruct part = <character_part> desc_id = <desc_id>
				if GotParam \{no_front_logo}
					return \{is_enabled = 0}
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	return is_enabled = <is_enabled>
endscript

script check_if_part_back_logoable 
	if GotParam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	check_if_part_logoable <...>
	if (<is_enabled> = 1)
		if GotParam \{parts}
			GetArraySize <parts>
			<index> = 0
			begin
			character_part = (<parts> [<index>])
			if GetCASAppearancePart part = <character_part>
				GetActualCASOptionStruct part = <character_part> desc_id = <desc_id>
				if GotParam \{no_back_logo}
					return \{is_enabled = 0}
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
	endif
	return is_enabled = <is_enabled>
endscript

script check_if_part_back_logo_adjustable 
	check_if_part_back_logoable <...>
	if (<is_enabled> = 1)
		check_if_part_logo_adjustable <...>
		return is_enabled = <is_enabled>
	endif
	return is_enabled = <is_enabled>
endscript

script check_if_part_front_logo_adjustable 
	check_if_part_front_logoable <...>
	if (<is_enabled> = 1)
		check_if_part_logo_adjustable <...>
		return is_enabled = <is_enabled>
	endif
	return is_enabled = <is_enabled>
endscript

script check_if_part_logo_adjustable 
	GetArraySize \{parts}
	if NOT (<array_size> = 1)
		ScriptAssert \{'check_if_part_logo_adjustable assumes parts=[] list has one entry'}
	endif
	if GetCASAppearancePart part = <logo_part>
		if (<desc_id> = none)
			return \{is_enabled = 0}
		endif
	else
		return \{is_enabled = 0}
	endif
	character_part = (<parts> [0])
	if GetCASAppearancePart part = <character_part>
		GetActualCASOptionStruct part = <character_part> desc_id = <desc_id>
		ExtendCRC <logo_part> '_Adjust' out = adjustcrc
		if GotParam <adjustcrc>
			if NOT StructureContains Structure = <adjustcrc> material
				SoftAssert '%s should contain a material and pass' s = <adjustcrc>
			elseif NOT StructureContains Structure = <adjustcrc> pass
				SoftAssert '%s should contain a material and pass' s = <adjustcrc>
			endif
			return \{is_enabled = 1}
		endif
	endif
	return \{is_enabled = 0}
endscript

script check_if_has_belt 
	<retVal> = 0
	if GetCASAppearancePart \{part = CAS_Belt}
		if NOT (<desc_id> = none)
			<retVal> = 1
		endif
	endif
	return is_enabled = <retVal>
endscript

script check_if_part_colorable 
	<retVal> = 0
	if GotParam \{extra_script}
		<extra_script> <extra_script_params>
		if (<is_enabled> = 0)
			return is_enabled = <is_enabled>
		endif
	endif
	if GotParam \{parts}
		GetArraySize <parts>
		<index> = 0
		begin
		character_part = (<parts> [<index>])
		if GetCASAppearancePart part = <character_part>
			if (<desc_id> = none)
				<retVal> = 0
				break
			else
				if GetActualCASOptionStruct part = <character_part> desc_id = <desc_id> dont_assert
					if GotParam \{color_all_materials}
						<retVal> = 1
						break
					else
						if GotParam \{materials}
							GetArraySize <materials>
							if (<array_size> > 0)
								<retVal> = 1
							else
								<retVal> = 0
							endif
						else
							<retVal> = 0
						endif
						break
					endif
				endif
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retVal>
endscript

script check_if_secondary_colorable 
	check_if_part_colorable <...>
	if (<is_enabled> = 0)
		return is_enabled = <is_enabled>
	endif
	if GotParam \{parts}
		GetArraySize <parts>
		<index> = 0
		begin
		character_part = (<parts> [<index>])
		if GetCASAppearancePart part = <character_part>
			GetActualCASOptionStruct part = <character_part> desc_id = <desc_id>
			if GotParam \{color_all_materials}
				<retVal> = 1
				break
			endif
			if GotParam \{materials}
				GetArraySize <materials>
				if (<array_size> > 1)
					<retVal> = 1
				else
					<retVal> = 0
				endif
			else
				<retVal> = 0
			endif
			break
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	return is_enabled = <retVal>
endscript

script cas_item_is_visible 
	if IsTrue \{$worst_case_cas_debug}
		return \{true}
	endif
	if StructureContains Structure = ($<part> [<part_index>]) hidden
		return \{false}
	endif
	return \{true}
endscript

script cas_item_rebuild 
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if NOT GotParam \{no_rebuild}
		return \{true}
	else
		return \{false}
	endif
endscript

script cas_item_matches_genre 
endscript

script get_part_current_desc_id 
	if GetCASAppearancePart part = <part>
		if GotParam \{desc_id}
			return true current_desc_id = <desc_id>
		endif
	endif
	return \{false
		current_desc_id = none}
endscript

script get_is_wearing_cas_item 
	if get_part_current_desc_id part = <part>
		if (<current_desc_id> = <desc_id>)
			return \{true}
		endif
	endif
	return \{false}
endscript

script get_key_from_appearance 
	GetArraySize \{$master_editable_list}
	i = 0
	begin
	part_name = ((($master_editable_list) [<i>]).part)
	if StructureContains Structure = <appearance> <part_name>
		if StructureContains Structure = (<appearance>.<part_name>) desc_id
			if GetActualCASOptionStruct part = <part_name> desc_id = ((<appearance>.<part_name>).desc_id)
				if GotParam <key>
					ret_struct = {}
					UpdateStructElement struct = <ret_struct> element = <key> value = ((<...>).<key>)
					return true {<newstruct>}
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script get_part_key_from_appearance 
	if StructureContains Structure = <appearance> <part>
		if StructureContains Structure = (<appearance>.<part>) desc_id
			if GetActualCASOptionStruct part = <part> desc_id = ((<appearance>.<part>).desc_id)
				if GotParam <key>
					ret_struct = {}
					UpdateStructElement struct = <ret_struct> element = <key> value = ((<...>).<key>)
					return true {<newstruct>}
				endif
			endif
		endif
	endif
	return \{false}
endscript

script get_body_key_from_appearance 
	if StructureContains Structure = <appearance> CAS_Body
		GetActualCASOptionStruct part = CAS_Body desc_id = (<appearance>.CAS_Body.desc_id)
		if GotParam <key>
			ret_struct = {}
			UpdateStructElement struct = <ret_struct> element = <key> value = ((<...>).<key>)
			return true {<newstruct>}
		endif
	elseif StructureContains Structure = <appearance> CAS_Full_Body
		GetActualCASOptionStruct part = CAS_Full_Body desc_id = (<appearance>.CAS_Full_Body.desc_id)
		if GotParam <key>
			ret_struct = {}
			UpdateStructElement struct = <ret_struct> element = <key> value = ((<...>).<key>)
			return true {<newstruct>}
		endif
	else
		ScriptAssert \{'No body part in appearance'}
	endif
	return \{false}
endscript

script FindFrontEndDescFromChecksum 
	part_struct = ($<part>)
	GetArraySize <part_struct>
	<i> = 0
	begin
	if ((<part_struct> [<i>].desc_id) = <desc_id>)
		if StructureContains Structure = (<part_struct> [<i>]) frontend_desc
			<return_val> = (<part_struct> [<i>].frontend_desc)
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	ScriptAssert \{'frontend_desc not found'}
endscript

script check_need_to_block_back 
	switch <part>
		case CAS_Male_Intro_Anim
		case CAS_Male_Win_Anim
		case CAS_Male_Lose_Anim
		case CAS_Female_Intro_Anim
		case CAS_Female_Win_Anim
		case CAS_Female_Lose_Anim
		case CAS_Guitar_Highway
		case CAS_Bass_Highway
		case CAS_Drums_Highway
		return \{true}
	endswitch
	return \{false}
endscript

script cas_add_item_to_appearance 
	RequireParams \{[
			part
			desc_id
		]
		all}
	cas_handle_disqualifications part = <part> desc_id = <desc_id>
	if GotParam \{new_desc_id}
		desc_id = <new_desc_id>
		printf 'Disqualification told us to use this instead: %d' d = <desc_id>
	endif
	EditCASAppearance target = SetPart targetParams = {part = <part> desc_id = <desc_id>}
	if NOT GotParam \{no_rebuild}
		if GotParam \{incremental}
			RebuildCurrentCASModel \{buildscriptparams = {
					build_incremental
				}}
		else
			RebuildCurrentCASModel
		endif
	else
		if check_need_to_block_back part = <part>
			change \{disable_cas_back = 0}
		endif
	endif
	if IsTrue \{$cas_debug}
		DumpHeaps
	endif
endscript

script cas_find_tex_swap_parts \{tex_swap_parts = [
		]}
	RequireParams \{[
			appearance
			part_list
		]
		all}
	GetArraySize <part_list>
	i = 0
	begin
	if StructureContains Structure = (<part_list> [<i>]) part
		part_name = (<part_list> [<i>].part)
		if StructureContains Structure = <appearance> <part_name>
			part_desc = ((<appearance>).<part_name>)
			if StructureContains Structure = <part_desc> desc_id
				if cas_has_tex_replace part = <part_name> desc_id = ((<part_desc>).desc_id)
					if NOT ArrayContains array = <tex_swap_parts> contains = <part_name>
						ve_convert_checksum_to_array checksum = <part_name>
						tex_swap_parts = (<tex_swap_parts> + <checksum_array>)
					endif
				endif
			endif
		endif
		if StructureContains Structure = (<part_list> [<i>]) desc_id
			if cas_has_tex_replace part = <part_name> desc_id = ((<part_list> [<i>]).desc_id)
				if NOT ArrayContains array = <tex_swap_parts> contains = <part_name>
					ve_convert_checksum_to_array checksum = <part_name>
					tex_swap_parts = (<tex_swap_parts> + <checksum_array>)
				endif
			endif
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return tex_swap_parts = <tex_swap_parts>
endscript

script cas_has_tex_replace 
	GetActualCASOptionStruct part = <part> desc_id = <desc_id>
	if ((GotParam replace) || (GotParam replace1) || (GotParam replace2) || (GotParam replace3))
		return \{true}
	endif
	return \{false}
endscript

script cas_desc_id_is_excluded \{part_name = none
		part_desc_id = none}
	if ChecksumEquals a = <part_desc_id> b = none
		return \{false}
	endif
	if cas_part_is_excluded part_name = <part_name>
		return true conflict_part = <conflict_part>
	endif
	GetArraySize ($master_editable_list)
	i = 0
	begin
	list_part_name = ((($master_editable_list) [<i>]).part)
	if NOT ChecksumEquals a = <list_part_name> b = <part_name>
		if cas_desc_id_is_excluded_part list_part_name = <list_part_name> change_part_name = <part_name> change_part_desc_id = <part_desc_id>
			return true conflict_part = <conflict_part>
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script cas_desc_id_is_excluded_part 
	if GetCASAppearancePart part = <list_part_name>
		if GetActualCASOptionStruct part = <list_part_name> desc_id = <desc_id>
			if GotParam \{exclusions}
				conflict_part = {part = <list_part_name> desc_id = <desc_id>}
				if StructureContains Structure = <exclusions> <change_part_name>
					exclusion = (<exclusions>.<change_part_name>)
					if NOT StructureContains Structure = <exclusion> reverse
						if cas_disq_matches_change_from exclusion = <exclusion> desc_id = <change_part_desc_id>
							return true conflict_part = <conflict_part>
						endif
					endif
				endif
			endif
		endif
	endif
	return \{false}
endscript

script cas_part_is_excluded \{part_name = none}
	GetArraySize ($master_editable_list)
	i = 0
	begin
	list_part_name = ((($master_editable_list) [<i>]).part)
	if NOT ChecksumEquals a = <list_part_name> b = <part_name>
		if cas_part_is_excluded_part list_part_name = <list_part_name> change_part_name = <part_name> change_part_desc_id = <part_desc_id>
			return true conflict_part = <conflict_part>
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script cas_part_is_excluded_part 
	if GetCASAppearancePart part = <list_part_name>
		if GetActualCASOptionStruct part = <list_part_name> desc_id = <desc_id>
			conflict_part = {part = <list_part_name> desc_id = <desc_id>}
			if GotParam \{exclusions}
				if StructureContains Structure = <exclusions> <change_part_name>
					exclusion = (<exclusions>.<change_part_name>)
					if NOT StructureContains Structure = <exclusion> reverse
						if NOT StructureContains Structure = <exclusion> change_from
							return true conflict_part = <conflict_part>
						endif
					endif
				endif
			endif
			if GotParam \{hide_parts}
				i = 0
				GetArraySize <hide_parts>
				if (<array_size> > 0)
					begin
					if ChecksumEquals a = (<hide_parts> [<i>]) b = <change_part_name>
						return true conflict_part = <conflict_part>
					endif
					i = (<i> + 1)
					repeat <array_size>
				endif
			endif
		endif
	endif
	return \{false}
endscript

script cas_part_will_conflict \{part_name = none
		part_desc_id = none}
	if ChecksumEquals a = <part_desc_id> b = none
		return \{false}
	endif
	if ChecksumEquals a = <part_name> b = none
		return \{false}
	endif
	GetActualCASOptionStruct part = <part_name> desc_id = <part_desc_id>
	change_parts = []
	conflict = false
	if GotParam \{inclusion}
		GetArraySize \{inclusion}
		inclusion_size = <array_size>
		if (<inclusion_size> > 0)
			i = 0
			begin
			if GetCASAppearancePart part = (<inclusion> [<i>].part)
				valid = (<inclusion> [<i>].valid)
				if NOT ((ChecksumEquals a = <desc_id> b = none) || (ArrayContains array = <valid> contains = <desc_id>))
					GetArraySize <valid>
					j = 0
					begin
					if is_part_unlocked_purchased part = (<inclusion> [<i>].part) desc_id = ((<inclusion> [<i>].valid) [<j>]) savegame = ($cas_current_savegame)
						AddArrayElement array = <change_parts> element = {part = (<inclusion> [<i>].part) desc_id = ((<inclusion> [<i>].valid) [<j>])}
						change_parts = <array>
						conflict = true
						break
					else
						if ((<j> + 1) = <array_size>)
							ScriptAssert qs("\LThe %p %d doesn't have an entry in its valid list for %s that is both purchased and unlocked.") p = <part_name> d = <part_desc_id> s = (<inclusion> [<i>].part) DoNotResolve
						endif
					endif
					j = (<j> + 1)
					repeat <array_size>
				endif
			endif
			i = (<i> + 1)
			repeat <inclusion_size>
		endif
	endif
	GetArraySize \{change_parts}
	if (<array_size> > 0)
		return change_parts = <change_parts>
	else
		return
	endif
endscript

script cas_in_inclusion_list 
	if GotParam \{inclusion}
		GetArraySize \{inclusion}
		matched_part = 0
		if (<array_size> > 0)
			i = 0
			begin
			inc_part = (<inclusion> [<i>].part)
			if (ChecksumEquals a = <inc_part> b = <part_name>)
				matched_part = 1
				if ArrayContains array = (<inclusion> [<i>].valid) contains = <part_desc_id>
					printf \{qs("\LIn Inclusion List")}
					return \{true}
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
			if (<matched_part> = 0)
				return \{true}
			endif
		endif
	else
		return \{true}
	endif
	return \{false}
endscript

script is_part_unlocked 
	RequireParams \{[
			part
			desc_id
			savegame
		]
		all}
	if ((<part> = CAS_Guitar_Strings) || (<part> = CAS_Bass_Strings))
		return \{true}
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		printf '%s %t not found' s = <part> t = <desc_id>
		return \{false}
	endif
	if GotParam \{locked}
		get_current_band_part_flags part = <part> desc_id = <desc_id> savegame = <savegame>
		if GotParam \{part_flags}
			if StructureContains Structure = <part_flags> unlocked
				return \{true}
			else
				return \{false}
			endif
		else
			return \{false}
		endif
	else
		return \{true}
	endif
endscript

script is_part_purchased 
	RequireParams \{[
			part
			desc_id
			savegame
		]
		all}
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		printf '%s %t not found' s = <part> t = <desc_id>
		return \{false}
	endif
	if GotParam \{price}
		get_current_band_part_flags part = <part> desc_id = <desc_id> savegame = <savegame>
		if GotParam \{part_flags}
			if StructureContains Structure = <part_flags> purchased
				return \{true}
			else
				return \{false}
			endif
		else
			return \{false}
		endif
	else
		return \{true}
	endif
endscript

script is_part_unlocked_purchased 
	RequireParams \{[
			part
			desc_id
			savegame
		]
		all}
	if is_part_unlocked part = <part> desc_id = <desc_id> savegame = <savegame>
		if is_part_purchased part = <part> desc_id = <desc_id> savegame = <savegame>
			return \{true}
		endif
	endif
	return \{false}
endscript
ps2_part_pak_unloading = 0

script IncrementPartPakUnloading 
	printf \{qs(0x5e14792a)
		d = $ps2_part_pak_unloading}
	change ps2_part_pak_unloading = ($ps2_part_pak_unloading + 1)
endscript

script DecrementPartPakUnloading 
	printf \{qs(0x1502922e)
		d = $ps2_part_pak_unloading}
	change ps2_part_pak_unloading = ($ps2_part_pak_unloading - 1)
endscript

script UnloadAppearancePaks \{asset_context = 0
		async = 0}
	RequireParams \{[
			appearance
			asset_context
		]
		all}
	if GotParam \{appearance}
		SetCASAppearance appearance = <appearance>
	endif
	if (<async> = 1)
		change \{ps2_part_pak_unloading = 0}
		foreachincas do = UnloadPartPak params = {asset_context = <asset_context> <...>}
		begin
		if IsPartPakUnloadDone
			break
		endif
		BCSND_UpdateSound
		Wait \{1
			gameframe}
		repeat
	else
		foreachincas do = UnloadPartPak params = {asset_context = <asset_context> <...>}
	endif
endscript
ps2_part_pak_loading = 0

script IncrementPartPakLoading 
	change ps2_part_pak_loading = ($ps2_part_pak_loading + 1)
endscript

script DecrementPartPakLoading 
	change ps2_part_pak_loading = ($ps2_part_pak_loading - 1)
endscript
ps2_loading_appearance_paks = 0

script LoadAppearancePaks \{reload = 0
		async = 0}
	printf qs(0xa0c9fdd5) c = <asset_context> r = <reload>
	change \{ps2_loading_appearance_paks = 1}
	RequireParams \{[
			appearance
			heap
			asset_context
		]
		all}
	if (<reload> = 1)
		UnloadAppearancePaks {asset_context = <asset_context>}
	endif
	if GotParam \{appearance}
		SetCASAppearance appearance = <appearance>
	endif
	if (<async> = 1)
		change \{ps2_part_pak_loading = 0}
		GetArraySize ($master_editable_list)
		i = 0
		begin
		part_struct = ($master_editable_list [(<i>)])
		part_slot = (<part_struct>.part)
		LoadPartPak {part = <part_slot> asset_context = <asset_context> <...>}
		begin
		if IsPartPakLoadDone
			break
		endif
		BCSND_UpdateSound
		Wait \{5
			gameframes}
		repeat
		i = (<i> + 1)
		repeat <array_size>
	else
		foreachincas do = LoadPartPak params = {asset_context = <asset_context> <...>}
	endif
	change \{ps2_loading_appearance_paks = 0}
endscript

script LoadPartPak \{instrument = none
		asset_context = 0
		async = 0
		instrument = none}
	SetCASAppearance appearance = <appearance>
	if GetCASAppearancePart part = <part>
		if GetActualCASOptionStruct part = <part> desc_id = <desc_id>
			if GotParam \{pak}
				if FilterPartByInstrument part = <part> instrument = <instrument>
					return
				endif
				if (<part> = CAS_Male_Hair || <part> = CAS_Female_Hair)
					get_hat_hair_choice appearance = <appearance>
					if (<hat_hair_choice> = hat_hair)
						return
					endif
				endif
				PushAssetContext context = <asset_context>
				if (<async> = 1)
					IncrementPartPakLoading
					LoadPak <pak> heap = <heap> load_callback = LoadPartPak_Done callback_data = none
				else
					LoadPak <pak> heap = <heap>
				endif
				PopAssetContext
				BCSND_UpdateSound
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script LoadPartPak_Done 
	if ($ps2_part_pak_loading > 0)
		DecrementPartPakLoading
	endif
endscript

script IsPartPakLoadDone 
	if ($ps2_part_pak_loading > 0)
		return \{false}
	endif
	return \{true}
endscript

script UnloadPartPak \{asset_context = 0
		async = 0}
	SetCASAppearance appearance = <appearance>
	if GetCASAppearancePart part = <part>
		if GetActualCASOptionStruct part = <part> desc_id = <desc_id>
			if GotParam \{pak}
				if (<async> = 1)
					IncrementPartPakUnloading
					SpawnScriptLater UnloadAppearancePak_Async params = {asset_context = <asset_context> pak = <pak>}
				else
					PushAssetContext context = <asset_context>
					UnloadPak <pak> SameHeaps
					BCSND_UpdateSound
					if NOT GotParam \{no_wait}
						WaitUnloadPak <pak> Block
					endif
					PopAssetContext
				endif
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript

script UnloadAppearancePak_Async 
	PushAssetContext context = <context>
	UnloadPak <pak> SameHeaps
	begin
	if WaitUnloadPak <pak> noblock
		break
	endif
	BCSND_UpdateSound
	Wait \{1
		gameframe}
	repeat
	DecrementPartPakUnloading
	PopAssetContext
endscript

script IsPartPakUnloadDone 
	if ($ps2_part_pak_unloading = 0)
		return \{true}
	endif
	return \{false}
endscript
ps2_changing_appearance_paks = 0

script ChangeAppearancePaks \{current_instrument = none
		new_instrument = none}
	change \{ps2_changing_appearance_paks = 1}
	DiffAppearances <...>
	if (<diff_array_size> = 0)
		change \{ps2_changing_appearance_paks = 0}
		return
	endif
	SetCASAppearance appearance = <current_appearance>
	i = 0
	begin
	part = (<diff_array> [<i>])
	if StructureContains Structure = current_appearance <part>
		UnloadPartPak part = <part> no_wait asset_context = <asset_context> appearance = <current_appearance>
	endif
	i = (<i> + 1)
	repeat <diff_array_size>
	SetCASAppearance appearance = <new_appearance>
	i = 0
	begin
	if ($ps2_cas_load_canceled = 1)
		change \{ps2_changing_appearance_paks = 0}
		return
	endif
	part = (<diff_array> [<i>])
	if StructureContains Structure = new_appearance <part>
		LoadPartPak part = <part> heap = <heap> instrument = <new_instrument> asset_context = <asset_context> appearance = <new_appearance>
	endif
	i = (<i> + 1)
	repeat <diff_array_size>
	change \{ps2_changing_appearance_paks = 0}
endscript

script IfPartInArray 
	GetArraySize (<array>)
	upper_array_size = <array_size>
	i = 0
	begin
	subArray = (<array> [<i>])
	GetArraySize (<subArray>)
	j = 0
	begin
	if ((<subArray> [<j>].desc_id) = <part>)
		return \{true}
	endif
	j = (<j> + 1)
	repeat <array_size>
	i = (<i> + 1)
	repeat <upper_array_size>
	return \{false}
endscript

script PS2_Instrument_Filter 
	if IfPartInArray part = <part> array = (($instrument_part_sets).guitar)
		if NOT (<instrument> = guitar)
			return \{true}
		endif
	endif
	if IfPartInArray part = <part> array = (($instrument_part_sets).Bass)
		if NOT (<instrument> = Bass)
			return \{true}
		endif
	endif
	if IfPartInArray part = <part> array = (($instrument_part_sets).drum)
		if NOT (<instrument> = drum)
			return \{true}
		endif
	endif
	if IfPartInArray part = <part> array = (($instrument_part_sets).Vocals)
		if NOT (<instrument> = Vocals)
			return \{true}
		endif
	endif
	return \{false}
endscript
ps2_car_part_scripts_loaded = 0

script ps2_load_car_part_script \{heap = heap_song}
	if (<heap> = heap_song)
		if NOT ($current_song_qpak = none)
			ScriptAssert \{qs(0xf6b1018f)}
		endif
	endif
	PushAssetContext context = <heap>
	LoadPak 'pak\\car_parts\\car_parts.pak' heap = <heap>
	PopAssetContext
	change \{ps2_car_part_scripts_loaded = 1}
endscript

script ps2_unload_car_part_script \{heap = heap_song}
	PushAssetContext context = <heap>
	UnloadPak \{'pak\\car_parts\\car_parts.pak'}
	PopAssetContext
	change \{ps2_car_part_scripts_loaded = 0}
endscript
ps2_cas_load_canceled = 0

script CasCancelLoading 
	if cas_queue_is_busy
		change \{ps2_cas_load_canceled = 1}
	endif
endscript

script ps2_GetActualCASOptionStruct_as_struct 
	if GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		RemoveParameter \{part}
		return true ps2_part_struct = {<...>}
	endif
	return \{false}
endscript

script CASWaitForLoading 
	begin
	if ($ps2_changing_appearance_paks = 0 && $ps2_loading_appearance_paks = 0)
		break
	endif
	Wait \{1
		seconds}
	repeat
endscript
