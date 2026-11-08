ps2_band_logo_texture = 'tex\\cag_logo_64'
test_16bit_cap = 0

script create_model_from_appearance 
	if ($ps2_cas_load_canceled = 1)
		change \{ps2_cas_load_canceled = 0}
		return
	endif
	LockForModelBuilder \{lock = 1}
	if NOT GotParam \{hat_hair_choice}
		hat_hair_choice = hair
	endif
	if NOT GotParam \{instrument}
		instrument = none
	endif
	FilterAppearancePartSet part_set = $instrument_part_sets chosen_set = <instrument>
	FilterAppearancePartSet part_set = $hair_part_sets chosen_set = <hat_hair_choice>
	if NOT GotParam \{caching}
		if GotParam \{preload}
			ModelRunScript \{ScriptName = cas_reset_bones}
			ModelRunScript ScriptName = cas_skeleton_reset params = {skeleton = <modelbuilder_skeleton>}
			ModelRunScript ScriptName = cas_ragdoll_reset params = {skeleton = <modelbuilder_skeleton> ragdoll = <modelbuilder_ragdoll>}
		endif
		ModelClearAllGeoms
	endif
	foreachincas \{do = ModelAddGeom}
	foreachincas \{do = GeomReplaceTexture}
	GeomSetCreatedTexture
	if NOT GotParam \{viewerobj}
		if NOT GotParam \{preload}
			foreachincas \{do = ModelReskinPart
				params = {
					ScriptName = cas_part_reskin
				}}
			ModelUpdateMainRigForReskinning \{part = CAS_Body
				ScriptName = cas_lowres_rig_reskin}
			foreachincas \{do = ModelCopyGeom
				params = {
					materials = $cas_reskin_materials
				}}
			foreachincas \{do = ModelDeleteReskinTemporaries}
			ModelRunScript \{ScriptName = cas_reset_bones}
			foreachincas \{do = DeformMainSkeleton
				params = {
					ScriptName = cas_main_skel_scale
				}}
		endif
	endif
	ModelRemovePolys
	foreachincas \{do = GeomModulateColor}
	set_uv_from_appearance
	if GotParam \{new_object}
		ModelExpandBoundingSphere
	endif
	ModelUpdateSkinningPolyRemoval
	foreachincas \{do = CreateAPieceComposite}
	if NOT GotParam \{caching}
		if NOT GotParam \{preload}
			GetModelBuilderAppearance
			if (<instrument> = drum)
				ModelRunScript ScriptName = cas_merge_in_drummer_bones params = {skeleton = <modelbuilder_skeleton>}
			elseif ((<instrument> = guitar) || (<instrument> = Bass))
				ModelRunScript ScriptName = cas_merge_in_guitar_ragdoll params = {skeleton = <modelbuilder_skeleton>}
			endif
			if NOT GotParam \{new_object}
				ModelRunScript ScriptName = cas_update_accessory_bones params = {appearance = <appearance>}
			endif
			ModelRunScript \{ScriptName = cas_update_pose}
			ModelRunScript ScriptName = cas_set_difference_anim params = {appearance = <appearance> instrument = <instrument>}
		endif
	endif
	LockForModelBuilder \{lock = 0}
endscript
ps2_body_color_h = 0
ps2_body_color_s = 0
ps2_body_color_v = 0
ps2_body_color_use_default_diffuse = 0
ps2_fleshy_parts = {
	CAS_Female_Base_Face
	CAS_Female_Base_Arms
	CAS_Female_Base_Hands
	CAS_Female_Base_Legs
	CAS_Female_Base_Shoes
	CAS_Female_Base_Torso
	CAS_Male_Base_Face
	CAS_Male_Base_Arms
	CAS_Male_Base_Hands
	CAS_Male_Base_Legs
	CAS_Male_Base_Shoes
	CAS_Male_Base_Torso
}
ps2_fleshy_parts_array = [
	CAS_Female_Base_Face
	CAS_Female_Base_Arms
	CAS_Female_Base_Hands
	CAS_Female_Base_Legs
	CAS_Female_Base_Shoes
	CAS_Female_Base_Torso
	CAS_Male_Base_Face
	CAS_Male_Base_Arms
	CAS_Male_Base_Hands
	CAS_Male_Base_Legs
	CAS_Male_Base_Shoes
	CAS_Male_Base_Torso
]

script ps2_propegate_body_color 
	if ($ps2_body_color_use_default_diffuse = 1)
		return
	endif
	if StructureContains Structure = $ps2_fleshy_parts <part>
		SetCASAppearanceColor part = <part> h = ($ps2_body_color_h) s = ($ps2_body_color_s) v = ($ps2_body_color_v) use_default_diffuse = ($ps2_body_color_use_default_diffuse)
	endif
endscript

script poly_removal_from_appearance 
	foreachincas \{do = GeomPolyRemoval}
endscript

script create_ped_model_from_appearance 
	LockForModelBuilder \{lock = 1}
	ModelClearAllGeoms
	ForEachInEditableList \{do = ModelAddGeom}
	ModelRunScript \{ScriptName = cas_reset_bones}
	ModelApplyObjectScale
	ModelRemovePolys
	ForEachInEditableList \{do = GeomModulateColor}
	LockForModelBuilder \{lock = 0}
endscript

script color_model_from_appearance 
	FilterAppearancePartSet part_set = $instrument_part_sets chosen_set = <instrument>
	if GetCASAppearancePart \{part = CAS_Body}
		if GotParam \{h}
			change ps2_body_color_h = (<h>)
			change ps2_body_color_s = (<s>)
			change ps2_body_color_v = (<v>)
			change ps2_body_color_use_default_diffuse = (<use_default_diffuse>)
			ForEachIn ($master_editable_list) do = ps2_propegate_body_color
		endif
	endif
	cas_propogate_color_to_other_parts \{part = CAS_Body
		other_parts = $ps2_fleshy_parts_array}
	foreachincas \{do = GeomModulateColor}
endscript

script update_cap_part 
	CreateAPieceComposite part = <part> incremental
endscript

script reskin_model_from_appearance 
	if NOT GotParam \{kill_objects}
		do_not_kill_flags = {do_not_kill}
	endif
	FilterAppearancePartSet part_set = $instrument_part_sets chosen_set = <instrument>
	GetModelBuilderSkeleton
	ModelRunScript \{ScriptName = cas_reset_bones}
	ModelRunScript ScriptName = cas_skeleton_reset params = {skeleton = <modelbuilder_skeleton>}
	foreachincas \{do = ModelReskinPart
		params = {
			ScriptName = cas_part_reskin
			force_reskin
		}}
	ModelUpdateMainRigForReskinning \{part = CAS_Body
		ScriptName = cas_lowres_rig_reskin
		force_reskin}
	foreachincas \{do = ModelCopyGeom
		params = {
			materials = $cas_reskin_materials
		}}
	foreachincas do = ModelDeleteReskinTemporaries params = <do_not_kill_flags>
	foreachincas \{do = DeformMainSkeleton
		params = {
			ScriptName = cas_main_skel_scale
		}}
	GetModelBuilderAppearance
	ModelRunScript ScriptName = cas_update_accessory_bones params = {appearance = <appearance> do_ragdoll = 0}
endscript

script set_uv_from_appearance 
	GetArraySize \{$master_uv_list}
	if (<array_size> > 0)
		<index> = 0
		begin
		part = (($master_uv_list [<index>]).part)
		parent_part = (($master_uv_list [<index>]).parent_part)
		GeomSetUVMatrix part = <part> parent_part = <parent_part>
		<index> = (<index> + 1)
		repeat <array_size>
	endif
endscript

script cas_set_difference_anim 
	if NOT get_part_key_from_appearance key = diff_anim appearance = <appearance> part = CAS_Female_Shoes
		get_part_key_from_appearance key = diff_anim appearance = <appearance> part = CAS_Male_Shoes
	endif
	if NOT GotParam \{diff_anim}
		GetSingleTag \{is_female}
		if GotParam \{is_female}
			if (<is_female> = 1)
				diff_anim_name = GH_Rocker_Female_Empty_D
			else
				diff_anim_name = GH_Rocker_Male_Empty_D
			endif
		endif
	else
		if NOT GotParam \{instrument}
			instrument = none
		endif
		if (<instrument> = drum)
			FormatText checksumname = diff_anim_name 'GH_Drummer_%s' s = <diff_anim>
		else
			FormatText checksumname = diff_anim_name 'GH_Rocker_%s' s = <diff_anim>
		endif
	endif
	if GotParam \{diff_anim_name}
		printf 'Clothing difference anim = %s' s = <diff_anim_name> DoNotResolve
		hero_add_clothing_difference_anim Anim = <diff_anim_name>
	endif
endscript

script cas_update_pose 
	Anim_UpdatePose
endscript

script LockForModelBuilder 
	change model_builder_lock = <lock>
endscript

script CheckModelBuilderLock 
	if NOT ($model_builder_lock = 0)
		ScriptAssert \{'Profile/appearance modification functions should not be called during a modelbuild'}
	endif
endscript

script BuildCASModel 
	RequireParams \{[
			async
			buildscriptparams
			appearance
		]
		all}
	Obj_GetID
	MangleChecksums a = <ObjID> b = RagdollUpdateScript
	ragdoll_script_id = <mangled_ID>
	KillSpawnedScript id = <ragdoll_script_id>
	printf 'BuildCASModel %a %o' a = <async> o = <ObjID> DoNotResolve
	GetSingleTag \{asset_heap}
	GetSingleTag \{lightgroup}
	get_hat_hair_choice appearance = <appearance>
	buildscriptparams = {
		<buildscriptparams>
		lightgroup = <lightgroup>
		temporary_heap = heap_cas
		hat_hair_choice = <hat_hair_choice>
	}
	if GotParam \{use_cache}
		CASCacheFlushVRAM
		CASWaitForUnloads
		if GotParam \{cancelled}
			return \{false}
		endif
		CASCacheModel {
			appearance = <appearance>
			buildscriptparams = <buildscriptparams>
			async = <async>
			global_storage = <asset_heap>
		}
		if NOT BuildCASModel_LoadWait async = <async>
			return \{false}
		endif
		async = 0
	endif
	if (<async> = 0)
	else
		hide
	endif
	ModelBuilder_Preload {
		async = <async>
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	if NOT BuildCASModel_UnloadWait async = <async>
		CASTemporariesFlush
		return \{false}
	endif
	ModelBuilder_LoadAssets {
		async = <async>
	}
	if NOT BuildCASModel_LoadWait async = <async>
		CASTemporariesFlush
		return \{false}
	endif
	CASTemporariesLoadPending
	if NOT BuildCASModel_LoadWait async = <async>
		CASTemporariesFlush
		return \{false}
	endif
	ModelBuilder_Build {
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	BuildCASModel_CompositeWait async = <async>
	if NOT StructureContains Structure = <buildscriptparams> build_incremental
		FlushAllCompositeTextures \{no_block}
		CASTemporariesFlush
		if NOT BuildCASModel_UnloadWait async = <async>
			return \{false}
		endif
	endif
	if StructureContains Structure = <buildscriptparams> new_object
		if (<async> = 1)
			BuildCASModel_UpdateRagdoll appearance = <appearance>
		else
			Obj_SpawnScriptNow BuildCASModel_UpdateRagdoll id = <ragdoll_script_id> params = {appearance = <appearance>}
		endif
	endif
	GenerateChecksumFromStruct struct = <appearance>
	SetTags appearance_checksum = <structure_checksum>
	if (<async> = 1)
		unhide
	endif
	return \{true}
endscript

script BuildCASModel_LoadWait 
	if (<async> = 1)
		CASWaitForLoading
	else
		CASBlockForLoading
	endif
	if GotParam \{cancelled}
		return \{false}
	endif
	return \{true}
endscript

script BuildCASModel_CompositeWait 
	if (<async> = 1)
		CASWaitForComposite
	else
		CasBlockForComposite
	endif
endscript

script BuildCASModel_UnloadWait 
	if (<async> = 1)
		CASWaitForUnloads
	else
		CASWaitForUnloads \{Block}
	endif
	if GotParam \{cancelled}
		return \{false}
	endif
	return \{true}
endscript

script BuildCASModel_UpdateRagdoll 
	Wait \{2
		gameframes}
	cas_update_accessory_bones appearance = <appearance>
endscript

script model_apply_created_texture 
	GeomSetCreatedTexture
endscript

script foreachincas \{params = {
		}}
	ForEachIn $master_editable_list do = <do> params = <params>
endscript
