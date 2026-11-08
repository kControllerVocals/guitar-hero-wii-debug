
script GetCurrentCASObject 
	if cas_player_has_character_object player = ($cas_current_player)
		return true cas_object = <character_object>
	endif
	return \{false}
endscript

script GetCASAppearance 
	return true appearance = ($cas_current_appearance)
endscript

script GetCASAppearancePart 
	ResolveBodySpecificPartInAppearance part = <part>
	if StructureContains Structure = ($cas_current_appearance) <part>
		app_struct = (($cas_current_appearance).<part>)
		if StructureContains Structure = <app_struct> desc_id
			return true {<app_struct>}
		endif
	endif
	return \{false}
endscript

script GetCASAppearancePartInstance 
	RequireParams \{[
			part
		]
		all}
	ResolveBodySpecificPartInAppearance part = <part>
	if StructureContains Structure = ($cas_current_appearance) <part>
		app_struct = (($cas_current_appearance).<part>)
		if StructureContains Structure = <app_struct> desc_id
			return true part_instance = (<app_struct>)
		endif
	endif
	return \{false}
endscript

script SetCASAppearancePartInstance 
	RequireParams \{[
			part
			part_instance
		]
		all}
	ResolveBodySpecificPartInAppearance part = <part>
	if StructureContains Structure = (<part_instance>) desc_id
		if ps2_GetActualCASOptionStruct_as_struct part = <part> desc_id = (<part_instance>.desc_id)
			part_instance = {<ps2_part_struct> <part_instance>}
		endif
	endif
	AddParam name = <part> structure_name = part_struct value = <part_instance>
	change cas_current_appearance = {($cas_current_appearance)
		<part_struct>}
endscript
disable_cas_back = 0

script EditCASAppearance 
	CheckModelBuilderLock
	change \{disable_cas_back = 1}
	if ChecksumEquals a = <target> b = SetGenre
		change cas_current_appearance = {($cas_current_appearance) genre = (<targetParams>.genre)}
	else
		part = (<targetParams>.part)
		ResolveBodySpecificPartInAppearance part = <part>
		if ChecksumEquals a = <target> b = SetPart
			newstruct = {desc_id = (<targetParams>.desc_id)}
			add_chosen_materials_to_part part = <part> newstruct = <newstruct>
			UpdateStructElement struct = $cas_current_appearance element = <part> value = <newstruct>
			change cas_current_appearance = <newstruct>
		elseif ChecksumEquals a = <target> b = ClearPart
			loc_appearance = ($cas_current_appearance)
			RemoveComponent structure_name = loc_appearance name = <part>
			change cas_current_appearance = <loc_appearance>
		elseif ChecksumEquals a = <target> b = HideGeom
			hide_geom = (<targetParams>.hide_geom)
			if StructureContains Structure = ($cas_current_appearance) <part>
				newstruct = {(($cas_current_appearance).<part>)
					hide_geom = <hide_geom>}
				UpdateStructElement struct = $cas_current_appearance element = <part> value = <newstruct>
				change cas_current_appearance = <newstruct>
			endif
		else
			ScriptAssert 'EditCASAppearance - %s not supported' s = <target>
		endif
	endif
endscript

script add_chosen_materials_to_part 
	RequireParams \{[
			part
			newstruct
		]
		all}
	if NOT GetActualCASOptionStruct part = <part> desc_id = (<newstruct>.desc_id)
		ScriptAssert '%s %t not found' s = <part> t = (<newstruct>.desc_id)
	endif
	if GotParam \{chosen_materials}
		newstruct = {<newstruct>
			chosen_materials = <chosen_materials>}
		return newstruct = <newstruct>
	endif
endscript

script RebuildCurrentCASModel instrument = ($cas_current_instrument)
	if NOT ($cas_heap_state = in_cas)
		ScriptAssert \{'Needs to be in the CAS heap state'}
	endif
	cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) instrument = <instrument> in_cas
endscript

script UpdateCurrentCASModel instrument = ($cas_current_instrument)
	RequireParams \{[
			buildScript
		]
		all}
	if cas_queue_is_busy
		printf \{'Waiting for CAS queue to complete first'}
		RebuildCurrentCASModel instrument = <instrument>
		return
	endif
	KillSpawnedScript \{name = UpdateCurrentCASModelSpawned}
	spawnscriptnow UpdateCurrentCASModelSpawned params = {<...>}
endscript

script UpdateCurrentCASModelSpawned 
	CASBlockForLoading
	CASWaitForComposite
	if NOT ($cas_override_object = none)
		cas_object = ($cas_override_object)
	else
		GetCurrentCASObject
	endif
	if GotParam \{cas_object}
		if CompositeObjectExists name = <cas_object>
			<cas_object> :GetSingleTag lightgroup
			get_hat_hair_choice appearance = ($cas_current_appearance)
			<cas_object> :ModelBuilder_Build {
				appearance = ($cas_current_appearance)
				buildScript = <buildScript>
				buildscriptparams = {
					<buildscriptparams>
					temporary_heap = heap_cas
					instrument = <instrument>
					lightgroup = <lightgroup>
					hat_hair_choice = <hat_hair_choice>
				}
			}
		endif
	endif
endscript

script printcurrentappearance 
	ReorderStructForCAS struct = ($cas_current_appearance)
	printcompactstruct <out>
endscript

script GetCASMaterialValue 
	RequireParams \{[
			part
			material
		]
		all}
	if StructureContains Structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		if StructureContains Structure = <str> chosen_materials
			if StructureContains Structure = (<str>.chosen_materials) <material>
				return true value = ((<str>.chosen_materials).<material>)
			endif
		endif
	endif
	return \{false}
endscript

script SetCASAppearanceColor 
	CheckModelBuilderLock
	ResolveBodySpecificPartInAppearance part = <part>
	if GotParam \{h}
		CastToInteger \{h}
	endif
	if GotParam \{s}
		CastToInteger \{s}
	endif
	if GotParam \{v}
		CastToInteger \{v}
	endif
	if StructureContains Structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		AppendStruct struct = cas_current_appearance field = <part> params = {<str> h = <h> s = <s> v = <v> use_default_diffuse = <use_default_diffuse>} globalstruct
	endif
endscript

script SetCASAppearanceMaterial 
	RequireParams \{[
			part
			material
			value
		]
		all}
	CheckModelBuilderLock
	if StructureContains Structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		if StructureContains Structure = <str> chosen_materials
			chosen_materials = (<str>.chosen_materials)
		else
			chosen_materials = {}
		endif
		UpdateStructElement struct = <chosen_materials> element = <material> value = <value>
		chosen_materials = {
			<chosen_materials> <newstruct>
		}
		AppendStruct struct = cas_current_appearance field = <part> params = {<str> chosen_materials = <chosen_materials>} globalstruct
	endif
endscript

script GetCASPartMaterials 
	if NOT GetCASAppearancePart part = <part>
		return \{false}
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	if GotParam \{materials}
		GetArraySize <materials>
		if (<array_size> > 0)
			array = []
			i = 0
			begin
			FormatText checksumname = desc_id 'material%d' d = (<i> + 1)
			AddArrayElement array = <array> element = <desc_id>
			i = (<i> + 1)
			repeat <array_size>
			return true part_materials = <array>
		endif
	else
		if GotParam \{material_groups}
			GetArraySize <material_groups>
			if (<array_size> > 0)
				array = []
				i = 0
				begin
				if StructureContains Structure = (<material_groups> [<i>]) desc_id
					desc_id = ((<material_groups> [<i>]).desc_id)
				else
					FormatText checksumname = desc_id 'material%d' d = (<i> + 1)
				endif
				AddArrayElement array = <array> element = <desc_id>
				i = (<i> + 1)
				repeat <array_size>
				return true part_materials = <array>
			endif
		else
			if GotParam \{modify_all_materials}
				return \{true
					part_materials = [
						material1
					]}
			endif
		endif
		return \{false}
	endif
endscript

script SetCASAppearanceBones 
	CheckModelBuilderLock
	if StructureContains Structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		AppendStruct struct = cas_current_appearance field = <part> params = {<str> bones = <bones>} globalstruct
	endif
endscript

script SetCASAppearanceAdditionalBones 
	CheckModelBuilderLock
	if StructureContains Structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		AppendStruct struct = cas_current_appearance field = <part> params = {<str> additional_bone_transforms = <additional_bone_transforms>} globalstruct
	endif
endscript

script SetCASAppearanceCAP 
	CheckModelBuilderLock
	if StructureContains Structure = ($cas_current_appearance) <part>
		str = (($cas_current_appearance).<part>)
		if GotParam \{cap}
			AppendStruct struct = cas_current_appearance field = <part> params = {<str> cap = <cap>} globalstruct
		else
			RemoveComponent \{name = cap
				structure_name = str}
			AppendStruct struct = cas_current_appearance field = <part> params = {<str>} globalstruct
		endif
	endif
endscript

script SetCASAppearance 
	CheckModelBuilderLock
	change cas_current_appearance = {<appearance>}
endscript

script ResolveBodySpecificPart 
	if GetActualCASOptionStruct part = <body_part> desc_id = <desc_id> no_resolve
		if GotParam \{body_specific_parts}
			if StructureContains Structure = <body_specific_parts> <part>
				return true part = (<body_specific_parts>.<part>)
			endif
		endif
	endif
	return \{false}
endscript

script ResolveBodySpecificPartInAppearance appearance = ($cas_current_appearance)
	if StructureContains Structure = <appearance> CAS_Body
		if ResolveBodySpecificPart part = <part> desc_id = ((<appearance>.CAS_Body).desc_id) body_part = CAS_Body
			return true part = <part>
		endif
	elseif StructureContains Structure = <appearance> CAS_Full_Body
		if ResolveBodySpecificPart part = <part> desc_id = ((<appearance>.CAS_Full_Body).desc_id) body_part = CAS_Full_Body
			return true part = <part>
		endif
	endif
	return false part = <part>
endscript

script RememberTemporaryCASAppearance 
	change cas_temporary_appearance = ($cas_current_appearance)
endscript

script RestoreTemporaryCASAppearance 
	change cas_current_appearance = ($cas_temporary_appearance)
endscript

script RememberSecondTemporaryCASAppearance 
	change cas_second_temporary_appearance = ($cas_current_appearance)
endscript

script RestoreSecondTemporaryCASAppearance 
	ChangeAppearancePaks current_appearance = ($cas_current_appearance) new_appearance = ($cas_second_temporary_appearance) heap = heap_musician1
	change cas_current_appearance = ($cas_second_temporary_appearance)
endscript

script RememberTemporaryCAPAppearance 
	RequireParams \{[
			part
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if GotParam \{cap}
		change cap_temporary_appearance = <cap>
	else
		change \{cap_temporary_appearance = [
			]}
	endif
endscript

script RestoreTemporaryCAPAppearance 
	RequireParams \{[
			part
		]
		all}
	SetCASAppearanceCAP part = <part> cap = ($cap_temporary_appearance)
endscript

script RememberTemporaryBoneAppearance 
	RequireParams \{[
			part
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve
	endif
	if GotParam \{bones}
		change bone_temporary_appearance = <bones>
	else
		change \{bone_temporary_appearance = {
			}}
	endif
endscript

script RestoreTemporaryBoneAppearance 
	RequireParams \{[
			part
		]
		all}
	SetCASAppearanceBones part = <part> bones = ($bone_temporary_appearance)
endscript

script HideInstrument 
	ForEachIn (($instrument_part_sets).guitar) do = HideInstrument_Foreach
	ForEachIn (($instrument_part_sets).Bass) do = HideInstrument_Foreach
	ForEachIn (($instrument_part_sets).drum) do = HideInstrument_Foreach
	ForEachIn (($instrument_part_sets).Vocals) do = HideInstrument_Foreach
endscript

script HideInstrument_Foreach 
	SwitchOffAtomic <checksum>
endscript

script UnHideInstrument 
	ForEachIn (($instrument_part_sets).guitar) do = UnhideInstrument_Foreach
	ForEachIn (($instrument_part_sets).Bass) do = UnhideInstrument_Foreach
	ForEachIn (($instrument_part_sets).drum) do = UnhideInstrument_Foreach
	ForEachIn (($instrument_part_sets).Vocals) do = UnhideInstrument_Foreach
endscript

script UnhideInstrument_Foreach 
	SwitchOnAtomic <checksum>
endscript

script HideMusician 
	ForEachIn \{$body_parts
		do = HideMusician_Foreach}
	ForEachIn \{$body_parts
		do = HideMusician_Foreach}
	ForEachIn \{$body_parts
		do = HideMusician_Foreach}
	ForEachIn \{$body_parts
		do = HideMusician_Foreach}
endscript

script HideMusician_Foreach 
	SwitchOffAtomic <checksum>
endscript

script get_hat_hair_choice 
	if ResolveBodySpecificPartInAppearance appearance = <appearance> part = CAS_Hat_Hair
		if StructureContains Structure = <appearance> <part>
			if StructureContains Structure = (<appearance>.<part>) desc_id
				return \{hat_hair_choice = hat_hair}
			endif
		endif
	endif
	return \{hat_hair_choice = hair}
endscript

script CASWaitForComposite 
	printf \{qs(0x73b35a0f)}
endscript

script CasBlockForComposite 
	if ModelBuilderIsCompositingActive
		ModelBuilderBlockForCompositing
	endif
endscript

script PushTemporaryCASAppearance 
	AddArrayElement array = ($cas_temporary_appearance_stack) element = ($cas_current_appearance)
	change cas_temporary_appearance_stack = <array>
endscript

script PrintTemporaryCASAppearanceStack 
	printcompactstruct ($cas_temporary_appearance_stack)
endscript

script PopTemporaryCASAppearance 
	GetArraySize ($cas_temporary_appearance_stack)
	if (<array_size> > 0)
		RemoveArrayElement array = ($cas_temporary_appearance_stack) index = (<array_size> -1)
		change cas_temporary_appearance_stack = <array>
	endif
endscript

script RestoreTopTemporaryCASAppearance 
	GetArraySize ($cas_temporary_appearance_stack)
	if (<array_size> > 0)
		change cas_current_appearance = (($cas_temporary_appearance_stack) [(<array_size> -1)])
	endif
	if GotParam \{update_cap}
		UpdateCASModelCAP part = <part>
	elseif GotParam \{update_color}
		UpdateCurrentCASModel \{buildScript = color_model_from_appearance}
	elseif NOT GotParam \{no_rebuild}
		RebuildCurrentCASModel
	endif
endscript

script MergePartIntoTemporaryCASAppearance 
	RequireParams \{[
			part_list
		]
		all}
	part_list_instances = []
	GetArraySize <part_list>
	i = 0
	begin
	if GetCASAppearancePartInstance part = (<part_list> [<i>])
		AddArrayElement array = <part_list_instances> element = <part_instance>
		part_list_instances = <array>
	else
		RemoveArrayElement array = <part_list> index = <i>
		part_list = <array>
		i = (<i> -1)
	endif
	i = (<i> + 1)
	repeat <array_size>
	GetArraySize ($cas_temporary_appearance_stack)
	if (<array_size> > 0)
		change cas_current_appearance = (($cas_temporary_appearance_stack) [(<array_size> -1)])
		RemoveArrayElement array = ($cas_temporary_appearance_stack) index = (<array_size> -1)
		change cas_temporary_appearance_stack = <array>
		GetArraySize <part_list>
		if (<array_size> > 0)
			i = 0
			begin
			SetCASAppearancePartInstance part = (<part_list> [<i>]) part_instance = (<part_list_instances> [<i>])
			i = (<i> + 1)
			repeat <array_size>
		endif
		RebuildCurrentCASModel
	endif
endscript

script CompareTopTemporaryCASAppearance 
	GetArraySize ($cas_temporary_appearance_stack)
	if CompareStructs struct1 = (($cas_temporary_appearance_stack) [(<array_size> -1)]) struct2 = ($cas_current_appearance)
		return \{true}
	else
		return \{false}
	endif
endscript

script generic_exit_restore 
	RestoreTopTemporaryCASAppearance
	ui_event \{event = menu_back}
endscript

script generic_exit_restore_refresh 
	RestoreTopTemporaryCASAppearance
	ui_event \{event = menu_back
		data = {
			refresh_previous_state
		}}
endscript

script get_best_heap_for_appearance \{exclusions = [
		]}
	best_heap = none
	best_score = -1.0
	GetArraySize \{$musician_heaps}
	i = 0
	begin
	heap_name = ($musician_heaps [<i>])
	get_appearance_heap_score appearance = <appearance> heap_name = <heap_name>
	if (<score> >= <best_score>)
		best_score = <score>
		best_heap = <heap_name>
	endif
	i = (<i> + 1)
	repeat <array_size>
	printstruct {best_heap = <best_heap> best_score = <best_score>}
	if (<best_score> < 0.0)
		ScriptAssert \{'No available heaps'}
	endif
	if CASIsAssetStorageUsed name = <best_heap>
		ScriptAssert 'Asset storage %s is already used' s = <best_heap>
	endif
	return best_heap = <best_heap>
endscript

script get_appearance_heap_score 
	if CASIsAssetStorageUsed name = <heap_name>
		printf 'get_appearance_heap_score - %s is being used!' s = <heap_name>
		return \{score = -1.0}
	else
		CASCompareAssetStorage name = <heap_name> appearance = <appearance>
		return score = <comparevalue>
	endif
endscript
