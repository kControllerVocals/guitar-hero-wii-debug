cache_build_band_members = 0
nondrummer_anim_node_ids = [
	Body
	BodyTimer
	moment_blend
	moment_branch
	momenttimer
	StrumTimer
	FretTimer
	FingerTimer
	FacialTimer
	Ik
	LeftHandPartial
	LeftArm
	LeftHand
	RightArm
	Face
	strum_anim_mod
	fret_anim_mod
	chord_anim_mod
	MaleAnimAdjust
	MaleAnimAdjust_Moment
	TweakBonesNode
	MirrorNode
	FemaleDiff
	vocal_face_mod
	Heel
]
drummer_anim_node_ids = [
	Body
	BodyTimer
	FacialTimer
	Ik
	LeftArmPartial
	LeftHandPartial
	RightArmPartial
	LeftArm
	LeftHand
	RightArm
	Face
	FemaleDiff
	DrumKit
	kick
	snare
	tom1
	tom2
	crash1
	crash2
	hihat
	moment_branch
	moment_blend
	moment_timer
	faceoff_blend
	faceoff_branch
	faceoff_timer
	TweakBonesNode
	MirrorNode
	DrumTimer
	DrumTimerRight
	DrumTimerLeft
	Heel
]
guitarist_appearance = {
}
bassist_appearance = {
}
vocalist_appearance = {
}
drummer_appearance = {
}

script create_band_member \{name = Guitarist
		lightgroup = Band
		async = 0
		pos = (0.0, 0.0, 0.0)
		dir = (0.0, 0.0, 1.0)}
	RemoveParameter \{profile_struct}
	ps2_get_musician_context_data name = <name>
	create_band_member_wait_for_lock
	printf qs("\LCreate_Band_Member name=%a.............") a = <name>
	pos = (0.0, 0.0, 0.0)
	dir = (0.0, 0.0, 1.0)
	if GotParam \{start_node}
		if DoesWayPointExist name = <start_node>
			GetWaypointPos name = <start_node>
			GetWaypointDir name = <start_node>
		endif
	endif
	if CompositeObjectExists <name>
		ScriptAssert '%s already exists' s = <name>
	endif
	if NOT GotParam \{no_appearance_pak_load}
		UnloadAppearancePaks appearance = ($<bandmember_appearance>) asset_context = <asset_heap> async = <async>
		change globalname = <bandmember_appearance> newvalue = {}
	endif
	if NOT GotParam \{asset_heap}
		asset_heap = heap_musician_anim
	endif
	anim_asset_context = <asset_heap>
	if get_key_from_appearance key = anim_struct appearance = (<profile>.appearance)
		if GotParam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument>
		else
		endif
		if NOT StructureContains Structure = ($<anim_struct>) anim_asset_context
			ScriptAssert \{'anim_asset_context missing!'}
		endif
		anim_asset_context = (($<anim_struct>).anim_asset_context)
	else
		ScriptAssert \{'anim_struct not found in appearance'}
	endif
	RemoveParameter \{highway_texture}
	if GotParam \{loading_into_song}
		if GotParam \{player_status}
			if NOT (<instrument> = Vocals)
				if NOT get_highway_struct_from_appearance part = <instrument> appearance = (<profile>.appearance)
					ScriptAssert \{'Problem grabbing highway struct'}
				endif
				if (($is_attract_mode = 1) || ((<profile>.name) = EmptyGuy))
					highway_pak = highway_axel
					highway_texture = highway_axel
				endif
				mpm_object_load_pak pak = <highway_pak> owner = <name> async = <async>
			endif
		else
			if ((<profile>.name) = Jimi)
				if (<name> = vocalist)
					if NOT get_highway_struct_from_appearance part = <instrument> appearance = (<profile>.appearance)
						ScriptAssert \{'Problem grabbing highway struct'}
					endif
					mpm_object_unload_paks owner = Guitarist async = <async>
					mpm_object_load_pak pak = <highway_pak> owner = <name> async = <async>
					get_band_member_player_status \{part = guitar}
					if GotParam \{band_member_player_status}
						change structurename = <band_member_player_status> highway_texture = <highway_texture>
						change structurename = <band_member_player_status> band_member = vocalist
					endif
					RemoveParameter \{highway_texture}
				endif
			endif
		endif
	endif
	GetPakManCurrent \{map = zones}
	switch <name>
		case Guitarist
		lightgroup = Guitarist
		case bassist
		lightgroup = bassist
		case Drummer
		lightgroup = Drummer
		case vocalist
		lightgroup = vocalist
		default
		lightgroup = Band
	endswitch
	if ($soundcheck_in_store = 1)
		<lightgroup> = Guitar_center_band
	endif
	ik_params = Hero_Ik_params
	if NOT get_key_from_appearance key = skeleton appearance = (<profile>.appearance)
		ScriptAssert \{'Missing skeleton in appearance'}
	endif
	if NOT get_key_from_appearance key = skeleton_path appearance = (<profile>.appearance)
		ScriptAssert \{'Missing skeleton_path in appearance'}
	endif
	get_key_from_appearance key = ik_params appearance = (<profile>.appearance)
	if GotParam \{loading_into_song}
		switch (<instrument>)
			case Vocals
			if get_key_from_appearance key = ik_params_vocals appearance = (<profile>.appearance)
				ik_params = <ik_params_vocals>
				printf 'Using ik_params_vocals - %s' s = <ik_params> DoNotResolve
			endif
			case drum
			if get_key_from_appearance key = ik_params_drum appearance = (<profile>.appearance)
				ik_params = <ik_params_drum>
				printf 'Using ik_params_drum - %s' s = <ik_params> DoNotResolve
			endif
			default
			if get_key_from_appearance key = ik_params_guitar appearance = (<profile>.appearance)
				ik_params = <ik_params_guitar>
				printf 'Using ik_params_guitar - %s - %d' s = <ik_params> DoNotResolve d = <instrument>
			endif
		endswitch
	else
		if get_key_from_appearance key = ik_params_frontend appearance = (<profile>.appearance)
			ik_params = <ik_params_frontend>
			printf 'Using ik_params_frontend - %s' s = <ik_params> DoNotResolve
		endif
	endif
	if GotParam \{player_status}
		if GotParam \{highway_texture}
			change structurename = <player_status> highway_texture = <highway_texture>
		endif
		change structurename = <player_status> band_member = <name>
	endif
	if NOT GotParam \{create_mii}
		get_is_female_from_appearance appearance = (<profile>.appearance)
		switch (<instrument>)
			case drum
			if (<is_female> = 1)
				FormatText TextName = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%af.pak' a = <asset_slot_num>
				FormatText checksumname = skeleton 'drummer_skeleton%af' a = <asset_slot_num>
			else
				FormatText TextName = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%am.pak' a = <asset_slot_num>
				FormatText checksumname = skeleton 'drummer_skeleton%am' a = <asset_slot_num>
			endif
			default
			if (<is_female> = 1)
				FormatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%af.pak' a = <asset_slot_num>
				FormatText checksumname = skeleton 'guitarist_skeleton%af' a = <asset_slot_num>
			else
				FormatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%am.pak' a = <asset_slot_num>
				FormatText checksumname = skeleton 'guitarist_skeleton%am' a = <asset_slot_num>
			endif
		endswitch
		PushAssetContext context = <asset_heap>
		LoadPak <skeleton_pak_name> heap = <asset_heap>
		PopAssetContext
	endif
	change globalname = <bandmember_appearance> newvalue = (<profile>.appearance)
	with_mic = 0
	if GotParam \{loading_into_song}
		get_song_struct song = <loading_into_song>
		if StructureContains Structure = <song_struct> parts_with_mic
			if ArrayContains array = (<song_struct>.parts_with_mic) contains = <name>
				printf qs(0xd5b7f7a6) s = <name>
				with_mic = 1
			endif
		endif
	endif
	if (<name> = vocalist)
		if (<instrument> = guitar || <instrument> = Bass)
			with_mic = 1
		endif
	endif
	temp_instrument = <instrument>
	if GotParam \{no_instrument_pak_load}
		temp_instrument = none
	else
		if (<with_mic> = 1)
			if (<temp_instrument> = guitar)
				temp_instrument = Guitar_And_Vocals
			elseif (<temp_instrument> = Bass)
				temp_instrument = Bass_And_Vocals
			elseif (<temp_instrument> = Vocals)
				temp_instrument = Guitar_And_Vocals
			endif
		endif
	endif
	if NOT GotParam \{no_appearance_pak_load}
		LoadAppearancePaks appearance = (<profile>.appearance) heap = (<asset_heap>) instrument = <temp_instrument> asset_context = <asset_heap> async = <async>
	endif
	shadow_models = []
	get_key_from_appearance key = shadow_models appearance = (<profile>.appearance)
	if GotParam \{create_mii}
		mii_index = ($freestyle_player_data [<freestyle_player>].mii_index)
		mii_is_random = ($freestyle_player_data [<freestyle_player>].mii_is_random)
		CreateCompositeObject {
			Components = [
				{
					Component = skeleton
					SkeletonName = <skeleton>
					allow_reset
				}
				{
					Component = SetDisplayMatrix
				}
				{
					Component = AnimTree
					SkeletonName = <skeleton>
				}
				{
					Component = Model
					lightgroup = <lightgroup>
				}
				{
					Component = motion
				}
				{
					Component = ModelBuilder
				}
				{
					Component = MiiHead
					Attach_Bone = Bone_Head
					mii_index = <mii_index>
					mii_is_random = <mii_is_random>
				}
			]
			params = {
				<profile>
				pos = <pos>
				assetcontext = <asset_heap>
				object_type = bandmember
				profilebudget = 800
				name = <name>
			}
		}
	else
		CreateCompositeObject {
			Components = [
				{
					Component = skeleton
					SkeletonName = <skeleton>
					allow_reset
				}
				{
					Component = SetDisplayMatrix
				}
				{
					Component = AnimTree
					SkeletonName = <skeleton>
				}
				{
					Component = Model
					lightgroup = <lightgroup>
				}
				{
					Component = motion
				}
				{
					Component = ModelBuilder
				}
			]
			params = {
				<profile>
				pos = <pos>
				assetcontext = <asset_heap>
				object_type = bandmember
				profilebudget = 800
				name = <name>
			}
		}
	endif
	<name> :Obj_SetOrientation dir = <dir>
	if (<name> = $anim_debug_target)
		set_new_anim_debug_target target = <name>
	endif
	get_body_checksum_from_appearance appearance = (<profile>.appearance)
	if NOT GotParam \{create_mii}
		get_is_female_from_appearance appearance = (<profile>.appearance)
		if NOT (GotParam is_female)
			is_female = 0
		endif
	else
		is_female = 0
	endif
	<name> :SetTags asset_heap = <asset_heap>
	<name> :SetTags body_checksum = <body_checksum>
	<name> :SetTags is_female = <is_female>
	GenerateChecksumFromStruct struct = (<profile>.appearance)
	<name> :SetTags appearance_checksum = <structure_checksum>
	<name> :SetTags geom_heap = <asset_heap>
	<name> :SetTags current_instrument = <temp_instrument>
	if GotParam \{create_mii}
		switch (<instrument>)
			case drum
			desired_tree = mii_drummer_static_tree
			default
			desired_tree = mii_guitarist_static_tree
		endswitch
	else
		switch (<instrument>)
			case Vocals
			desired_tree = vocalist_static_tree
			case drum
			desired_tree = drummer_static_tree
			default
			desired_tree = guitarist_static_tree
		endswitch
	endif
	if (<instrument> = drum)
		node_ids = $drummer_anim_node_ids
	else
		node_ids = $nondrummer_anim_node_ids
	endif
	<name> :Anim_InitTree {
		Tree = $<desired_tree>
		NodeIdDeclaration = <node_ids>
		params = {
			ik_params = <ik_params>
		}
	}
	if (<instrument> = drum)
		if (<is_female> = 1)
			<name> :Anim_Command target = FemaleDiff command = Modulate_SetStrength params = {strength = 1.0}
		endif
	endif
	ExtendCRC <name> '_Info' out = info_struct
	change structurename = <info_struct> part = <instrument>
	change structurename = <info_struct> playing = true
	if NOT <name> :build_band_member_from_appearance {
			appearance = (<profile>.appearance)
			lightgroup = <lightgroup>
			async = <async>
			instrument = <instrument>
			loading_into_song = <loading_into_song>
			with_mic = <with_mic>
			geom_heap = <asset_heap>
			assetcontext = <asset_heap>
		}
		cancelled = 1
	endif
	printf 'anim_asset_context context=%c' c = <anim_asset_context>
	create_band_member_unlock
	if GotParam \{cancelled}
		return \{false}
	endif
	return \{true}
endscript

script get_body_checksum_from_appearance 
	if StructureContains Structure = <appearance> CAS_Body
		return body_checksum = ((<appearance>.CAS_Body).desc_id)
	endif
	if StructureContains Structure = <appearance> musician_body
		return body_checksum = ((<appearance>.musician_body).desc_id)
	endif
	if StructureContains Structure = <appearance> CAS_Full_Body
		return body_checksum = ((<appearance>.CAS_Full_Body).desc_id)
	endif
	printstruct <appearance>
	ScriptAssert \{'Character has no body!'}
endscript

script get_is_female_from_appearance 
	if StructureContains Structure = <appearance> CAS_Body
		GetActualCASOptionStruct part = CAS_Body desc_id = ((<appearance>.CAS_Body).desc_id)
	endif
	if StructureContains Structure = <appearance> CAS_Full_Body
		GetActualCASOptionStruct part = CAS_Full_Body desc_id = ((<appearance>.CAS_Full_Body).desc_id)
	endif
	if NOT GotParam \{is_female}
		ScriptAssert \{'Character has no body!'}
	endif
	return is_female = <is_female>
endscript

script build_band_member_from_appearance \{instrument = none
		with_mic = 0}
	if (<with_mic> = 1)
		if (<instrument> = guitar)
			instrument = Guitar_And_Vocals
		elseif (<instrument> = Bass)
			instrument = Bass_And_Vocals
		elseif (<instrument> = Vocals)
			instrument = Guitar_And_Vocals
		endif
	endif
	get_hat_hair_choice appearance = <appearance>
	buildscriptparams = {
		lightgroup = <lightgroup>
		temporary_heap = heap_cas
		instrument = <instrument>
		hat_hair_choice = <hat_hair_choice>
	}
	ModelBuilder_Preload {
		<...>
		geom_heap = <geom_heap>
		assetcontext = <assetcontext>
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	if NOT GotParam \{cancelled}
		Obj_GetID
		if (<with_mic> = 1 && <ObjID> != vocalist)
			if NOT (<instrument> = Vocals)
			endif
		endif
		return \{true}
	endif
	return \{false}
endscript

script get_anim_struct_member_check_song 
	if ($current_song = purplehaze || $current_song = windcriesmary)
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
			return \{false}
		endif
	endif
	return \{true}
endscript

script get_anim_struct_member 
	if NOT ($current_song = jamsession)
		if GotParam \{loading_into_song}
			if get_anim_struct_member_check_song
				if ($current_song_qpak != none)
					printf 'get_anim_struct_member - Using cached anim struct for %s' s = <member> DoNotResolve
					ExtendCRC <anim_struct> '_' out = song_anim_struct
					if (<member> = guitar)
						ExtendCRC <song_anim_struct> 'guitar' out = song_anim_struct
						return true anim_struct_member = ($<song_anim_struct>)
					elseif (<member> = Bass)
						ExtendCRC <song_anim_struct> 'bass' out = song_anim_struct
						return true anim_struct_member = ($<song_anim_struct>)
					elseif (<member> = drum)
						ExtendCRC <song_anim_struct> 'drum' out = song_anim_struct
						return true anim_struct_member = ($<song_anim_struct>)
					else
						ExtendCRC <song_anim_struct> 'vocals' out = song_anim_struct
						return true anim_struct_member = ($<song_anim_struct>)
					endif
				endif
				if GotParam \{loading_into_song}
					printf 'get_anim_struct_member - Using cached anim struct for %s' s = <member> DoNotResolve
					ExtendCRC <anim_struct> '_' out = song_anim_struct
					if (<member> = guitar)
						ExtendCRC <song_anim_struct> 'guitar' out = song_anim_struct
						return true anim_struct_member = ($<song_anim_struct>)
					elseif (<member> = Bass)
						ExtendCRC <song_anim_struct> 'bass' out = song_anim_struct
						return true anim_struct_member = ($<song_anim_struct>)
					elseif (<member> = drum)
						ExtendCRC <song_anim_struct> 'drum' out = song_anim_struct
						return true anim_struct_member = ($<song_anim_struct>)
					else
						ExtendCRC <song_anim_struct> 'vocals' out = song_anim_struct
						return true anim_struct_member = ($<song_anim_struct>)
					endif
				endif
			endif
		endif
	endif
	if GlobalExists name = <anim_struct> type = Structure
		if StructureContains Structure = ($<anim_struct>) <member>
			printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> DoNotResolve
			return true anim_struct_member = (($<anim_struct>).<member>)
		elseif (<member> = Bass)
			printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
			if StructureContains Structure = ($<anim_struct>) guitar
				printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> DoNotResolve
				return true anim_struct_member = (($<anim_struct>).guitar)
			endif
		endif
	endif
	printf 'get_anim_struct_member - Failed! : %s' s = <anim_struct> DoNotResolve
	printstruct <...>
	return \{false}
endscript

script preload_band_member \{name = Guitarist
		async = 0}
	create_band_member_wait_for_lock
	filename_crc = none
	instrument_crc = none
	create_band_member_unlock
	return filename_crc = <filename_crc> instrument_crc = <instrument_crc> true
endscript

script preload_band_member_finish \{name = Guitarist
		async = 0}
	create_band_member_wait_for_lock
	create_band_member_unlock
endscript
create_band_member_lock_queue = 0
create_band_member_lock = 0

script create_band_member_unlock 
	change \{create_band_member_lock = 0}
endscript

script create_band_member_wait_for_lock 
	begin
	if ($create_band_member_lock_queue = 0)
		break
	endif
	WaitOneGameFrame
	repeat
	change \{create_band_member_lock_queue = 1}
	begin
	if ($create_band_member_lock = 0)
		break
	endif
	WaitOneGameFrame
	repeat
	change \{create_band_member_lock_queue = 0}
	change \{create_band_member_lock = 1}
endscript

script destroy_band 
	if ($in_tutorial_mode = 1)
		ScriptAssert \{'should not destroy band in tutorial mode'}
	endif
	cas_destroy_all_characters
	band_stop_anims
	destroy_band_member \{name = Guitarist}
	destroy_band_member \{name = guitarist2}
	destroy_band_member \{name = bassist}
	destroy_band_member \{name = bassist2}
	destroy_band_member \{name = Drummer}
	destroy_band_member \{name = drummer2}
	destroy_band_member \{name = vocalist}
	destroy_band_member \{name = vocalist2}
	band_unload_anim_paks
	if GotParam \{unload_paks}
		mpm_flush_all_paks
	endif
endscript

script destroy_band_member 
	ps2_get_musician_context_data name = <name>
	if CompositeObjectExists name = <name>
		printf \{qs(0x9a373b29)}
		<name> :Obj_ResetBones
		<name> :Die
		mpm_object_unload_paks owner = <name>
		FlushDeadObjects
		if ($freestyle_active = 0)
			get_is_female_from_appearance appearance = ($<bandmember_appearance>)
			if (<is_female> = 1)
				FormatText TextName = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%af.pak' a = <asset_slot_num>
				if IsPakLoaded <skeleton_pak_name> heap = <asset_heap>
					PushAssetContext context = <asset_heap>
					UnloadPak <skeleton_pak_name> heap = <asset_heap> SameHeaps
					PopAssetContext
				else
					FormatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%af.pak' a = <asset_slot_num>
					PushAssetContext context = <asset_heap>
					UnloadPak <skeleton_pak_name> heap = <asset_heap> SameHeaps
					PopAssetContext
				endif
			else
				FormatText TextName = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%am.pak' a = <asset_slot_num>
				if IsPakLoaded <skeleton_pak_name> heap = <asset_heap>
					PushAssetContext context = <asset_heap>
					UnloadPak <skeleton_pak_name> heap = <asset_heap> SameHeaps
					PopAssetContext
				else
					FormatText TextName = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%am.pak' a = <asset_slot_num>
					PushAssetContext context = <asset_heap>
					UnloadPak <skeleton_pak_name> heap = <asset_heap> SameHeaps
					PopAssetContext
				endif
			endif
		endif
		if NOT GotParam \{no_appearance_pak_unload}
			UnloadAppearancePaks appearance = ($<bandmember_appearance>) no_wait asset_context = <asset_heap>
		endif
		change globalname = <bandmember_appearance> newvalue = {}
	endif
endscript

script kill_character_scripts 
	printf \{qs("\Lkill character scripts.......")}
	if CompositeObjectExists \{name = Guitarist}
		Guitarist :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = bassist}
		bassist :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = vocalist}
		vocalist :Obj_SwitchScript \{EmptyScript}
	endif
	if CompositeObjectExists \{name = Drummer}
		Drummer :Obj_SwitchScript \{EmptyScript}
	endif
endscript

script EmptyScript 
endscript

script hero_pause_anim 
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			command = Timer_SetSpeed
			params = {
				Speed = 0.0
			}}
	endif
endscript

script hero_unpause_anim 
	if Anim_AnimNodeExists \{id = BodyTimer}
		Anim_Command \{target = BodyTimer
			command = Timer_SetSpeed
			params = {
				Speed = 1.0
			}}
	endif
endscript

script hero_enable_mirroring 
	if Anim_AnimNodeExists \{id = MirrorNode}
		Anim_Command \{target = MirrorNode
			command = Mirror_SetState
			params = {
				on
			}}
	endif
endscript

script hero_disable_mirroring 
	if Anim_AnimNodeExists \{id = MirrorNode}
		Anim_Command \{target = MirrorNode
			command = Mirror_SetState
			params = {
				off
			}}
	endif
endscript

script band_play_strum_anim 
	if CompositeObjectExists name = <name>
		<name> :hero_play_strum_anim Anim = <Anim>
	endif
endscript

script band_play_fret_anim 
	if CompositeObjectExists name = <name>
		<name> :hero_play_fret_anim Anim = <Anim>
	endif
endscript

script band_play_finger_anim 
	if CompositeObjectExists name = <name>
		<name> :hero_play_finger_anim Anim = <Anim>
	endif
endscript

script hero_play_facial_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = Face}
		Obj_GetID
		FormatText checksumname = animdebug_checksum '%s' s = ($debug_animdebug)
		if (($debug_camanimdebug) = 0)
			if (<ObjID> = <animdebug_checksum>)
				y = 8
				if (debug_animdebug = 'vocalist' || debug_animdebug = 'drummer')
					<y> = 5
				endif
				PrintDebugText x = 0 y = <y> str = qs(0x42fe08d6)
				PrintDebugText x = 2 y = <y> str = qs(0x10839713)
				PrintDebugText x = 32 y = <y> str = <Anim>
			endif
		endif
		Obj_GetID
		if ((<ObjID> = vocalist) || (<ObjID> = vocalist2))
			Tree = $vocalist_face_branch
		else
			Tree = $hero_face_branch
		endif
		Anim_Command {
			target = Face
			command = DegenerateBlend_AddBranch
			params = {
				Tree = <Tree>
				BlendDuration = <BlendDuration>
				params = {
					facial_anim = <Anim>
				}
			}
		}
	endif
endscript

script hero_clear_facial_anim \{BlendDuration = 0.0}
	if Anim_AnimNodeExists \{id = Face}
		Anim_Command {
			target = Face
			command = DegenerateBlend_AddBranch
			params = {
				Tree = $hero_empty_branch
				BlendDuration = <BlendDuration>
			}
		}
	endif
endscript

script hero_add_clothing_difference_anim 
	if NOT GotParam \{Anim}
		return
	endif
	hero_play_anim Anim = <Anim> target = Heel timer_id = ClothingDiff_Timer Tree = $hero_play_branch BlendDuration = 0.0
endscript

script hero_wait_until_anim_finished \{Timer = BodyTimer}
	begin
	if hero_anim_complete Timer = <Timer>
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script hero_wait_until_anim_near_end \{Timer = BodyTimer
		time_from_end = 0.2}
	begin
	if hero_anim_near_end Timer = <Timer> time_from_end = <time_from_end>
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script hero_anim_near_end \{Timer = BodyTimer}
	if NOT Anim_AnimNodeExists id = <Timer>
		return \{true}
	else
		if Anim_Command target = <Timer> command = Timer_Wait params = {SecondsFromEnd = <time_from_end>}
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script hero_disable_arms \{blend_time = 0.0}
	Obj_GetID
	Band_SetIKChain name = <ObjID> chain = slave
	return
endscript

script hero_enable_arms \{blend_time = 0.0}
	Obj_GetID
	Band_SetIKChain name = <ObjID> chain = guitar
	return
endscript

script hero_toggle_arms \{num_arms = 2
		prev_num_arms = 0
		blend_time = 0.25}
	disable_left_arm = false
	enable_left_arm = false
	disable_right_arm = false
	enable_right_arm = false
	if (<num_arms> = 0)
		if (<prev_num_arms> = 1)
			disable_right_arm = true
		elseif (<prev_num_arms> = 2)
			disable_left_arm = true
			disable_right_arm = true
		endif
	elseif (<num_arms> = 1)
		if (<prev_num_arms> = 2)
			disable_right_arm = true
			enable_left_arm = true
		endif
	elseif (<num_arms> = 2)
		if (<prev_num_arms> = 0)
			enable_left_arm = true
			enable_right_arm = true
		elseif (<prev_num_arms> = 1)
			enable_right_arm = true
		endif
	endif
	if Anim_AnimNodeExists \{id = Ik}
		if Anim_Command \{target = Ik
				command = IK_HasChain
				params = {
					chain = Bone_IK_Hand_Slave_L
				}}
			left_hand_bone = Bone_IK_Hand_Slave_L
			right_hand_bone = Bone_IK_Hand_Slave_R
		elseif Anim_Command \{target = Ik
				command = IK_HasChain
				params = {
					chain = Bone_IK_Hand_Guitar_L
				}}
			left_hand_bone = Bone_IK_Hand_Guitar_L
			right_hand_bone = Bone_IK_Hand_Guitar_R
		else
			ScriptAssert \{'No valid IK chain to work with'}
		endif
	endif
	if (<disable_left_arm> = true)
		printf \{channel = newdebug
			qs("\Ldisable_left_arm is true ")}
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				command = IK_SetChainStrength
				params = {
					strength = 0.0
					BlendDuration = <blend_time>
					chain = <left_hand_bone>
				}
			}
		else
			printf \{channel = newdebug
				qs("\Lik node doesn't exist.......")}
		endif
	endif
	if (<disable_right_arm> = true)
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				command = IK_SetChainStrength
				params = {
					strength = 0.0
					BlendDuration = <blend_time>
					chain = <right_hand_bone>
				}
			}
		endif
	endif
	if (<enable_left_arm> = true)
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				command = IK_SetChainStrength
				params = {
					strength = 1.0
					BlendDuration = <blend_time>
					chain = <left_hand_bone>
				}
			}
		endif
	endif
	if (<enable_right_arm> = true)
		if Anim_AnimNodeExists \{id = Ik}
			Anim_Command {
				target = Ik
				command = IK_SetChainStrength
				params = {
					strength = 1.0
					BlendDuration = <blend_time>
					chain = <right_hand_bone>
				}
			}
		endif
	endif
endscript

script killanim 
	Skeleton_GetSkeletonName
	ExtendCRC <SkeletonName> '_default' out = Anim
	obj_killallspawnedscripts
	hero_play_anim Anim = <Anim> BlendDuration = 0.0
endscript

script handle_moment_anim_blending 
	Obj_GetID
	Anim_Command \{target = moment_blend
		command = PartialSwitch_SetState
		params = {
			on
			BlendDuration = 0.0
		}}
	Anim_Command \{target = BodyTimer
		command = Timer_Pause}
	Anim_Command \{target = momenttimer
		command = Timer_WaitAnimComplete}
	end_moment_anim
endscript

script end_moment_anim 
	Obj_GetID
	Obj_KillSpawnedScript \{name = handle_drummer_moment_anim_blending}
	Anim_Command \{target = moment_blend
		command = PartialSwitch_SetState
		params = {
			off
			BlendDuration = 0.0
		}}
	Anim_Command \{target = BodyTimer
		command = Timer_Unpause}
	ExtendCRC <ObjID> '_Info' out = info_struct
	part = ($<info_struct>.part)
	if (<part> = guitar || <part> = Bass)
		Band_SetIKChain name = <ObjID> chain = guitar
	else
		Band_SetIKChain name = <ObjID> chain = slave
	endif
	wait_after_anim_before_position_update
	GetPakManCurrent \{map = zones}
	if (<pak> != z_soundcheck)
		Band_MoveToStartNode name = <ObjID>
	endif
endscript

script set_timer_node_speed 
endscript

script handle_drummer_moment_anim_blending 
	Anim_Command \{target = moment_blend
		command = PartialSwitch_SetState
		params = {
			on
			BlendDuration = 0.1
		}}
	Anim_Command \{target = moment_timer
		command = Timer_WaitAnimComplete}
	Anim_Command \{target = moment_blend
		command = PartialSwitch_SetState
		params = {
			off
			BlendDuration = 0.1
		}}
endscript

script end_drummer_moment_anim 
	Obj_KillSpawnedScript \{name = handle_drummer_moment_anim_blending}
	Anim_Command \{target = moment_blend
		command = PartialSwitch_SetState
		params = {
			off
			BlendDuration = 0.1
		}}
endscript

script drummer_faceoff_rest 
	Anim = Drum_HTH_Loop_NoTempo
	Anim_Command {
		target = faceoff_branch
		command = DegenerateBlend_AddBranch
		params = {
			Tree = $faceoff_drummer_notempo
			BlendDuration = 0.0
			params = {
				Anim = <Anim>
			}
		}
	}
	Anim_Command \{target = faceoff_blend
		command = PartialSwitch_SetState
		params = {
			on
			BlendDuration = 0.3
		}}
endscript

script drummer_faceoff_play 
	Anim_Command \{target = faceoff_blend
		command = PartialSwitch_SetState
		params = {
			off
			BlendDuration = 0.3
		}}
endscript
faceoff_drummer_notempo = {
	type = Cycle
	id = faceoff_timer
	Anim = Anim
	[
		{
			type = Source
			Anim = Anim
		}
	]
}

script hide_mic 
	SwitchOffAtomic \{CAS_Mic}
	SwitchOffAtomic \{CAS_Mic_Stand}
endscript

script show_mic 
	SwitchOnAtomic \{CAS_Mic}
	SwitchOnAtomic \{CAS_Mic_Stand}
endscript

script hide_mic_stand 
	SwitchOffAtomic \{CAS_Mic_Stand}
endscript

script show_mic_stand 
	SwitchOnAtomic \{CAS_Mic_Stand}
endscript

script hide_mic_microphone 
	SwitchOffAtomic \{CAS_Mic}
endscript

script show_mic_microphone 
	SwitchOnAtomic \{CAS_Mic}
endscript

script hide_Drumkit 
	SwitchOffAtomic \{CAS_Drums}
endscript

script show_Drumkit 
	SwitchOnAtomic \{CAS_Drums}
endscript

script vocalist_facial_animations_start \{Blendtime = 0.3}
	Anim_Command target = vocal_face_mod command = Modulate_StartBlend params = {Blendtime = <Blendtime> blendcurve = [1 0]}
endscript

script vocalist_facial_animations_stop \{Blendtime = 0.3}
	Anim_Command target = vocal_face_mod command = Modulate_StartBlend params = {Blendtime = <Blendtime> blendcurve = [0 1]}
endscript
mii_guitarist_static_tree = {
	type = Ik
	two_bone_chains = ik_params
	id = Ik
	[
		{
			type = addn
			[
				{
					type = DegenerateBlend
					id = LeftArm
				}
				{
					type = DegenerateBlend
					id = RightArm
				}
				{
					type = DegenerateBlend
					id = Body
				}
			]
		}
	]
}
mii_guitarist_play_hand_branch = {
	type = Play
	id = StrumTimer
	Anim = hand_anim
	[
		{
			type = Source
			Anim = hand_anim
		}
	]
}
mii_drummer_static_tree = {
	type = addn
	[
		{
			type = DegenerateBlend
			id = Body
		}
		{
			type = DegenerateBlend
			id = tom1
		}
		{
			type = DegenerateBlend
			id = tom2
		}
		{
			type = DegenerateBlend
			id = crash1
		}
		{
			type = DegenerateBlend
			id = crash2
		}
		{
			type = DegenerateBlend
			id = kick
		}
		{
			type = DegenerateBlend
			id = snare
		}
		{
			type = DegenerateBlend
			id = hihat
		}
		{
			type = DegenerateBlend
			id = RightArmPartial
		}
		{
			type = DegenerateBlend
			id = LeftArmPartial
		}
	]
}
mii_drummer_play_drum_branch_none = {
	type = Play
	id = DrumTimer
	Anim = drum_anim
	[
		{
			type = Source
			Anim = drum_anim
		}
	]
}
mii_drummer_play_drum_branch_left = {
	type = Play
	id = DrumTimerLeft
	Anim = drum_anim
	[
		{
			type = Source
			Anim = drum_anim
		}
	]
}
mii_drummer_play_drum_branch_right = {
	type = Play
	id = DrumTimerRight
	Anim = drum_anim
	[
		{
			type = Source
			Anim = drum_anim
		}
	]
}
generic_static_tree = {
	type = DegenerateBlend
	id = Body
}
guitarist_static_tree = {
	type = applydifference
	[
		{
			type = DegenerateBlend
			id = Heel
		}
		{
			type = Ik
			two_bone_chains = ik_params
			id = Ik
			[
				{
					type = TweakBones
					id = TweakBonesNode
					[
						{
							type = PartialSwitch
							state = on
							[
								{
									type = DegenerateBlend
									id = Face
								}
								{
									type = applydifference
									id = LeftHandPartial
									[
										{
											$hero_arm_branch
										}
										{
											type = PartialSwitch
											state = off
											id = moment_blend
											[
												{
													type = ApplyFemaleDifference
													id = MaleAnimAdjust_Moment
													Anim = GH_Rocker_Female_GuitarRaise_D
													[
														{
															type = DegenerateBlend
															id = moment_branch
														}
													]
												}
												{
													type = ApplyFemaleDifference
													id = MaleAnimAdjust
													Anim = GH_Rocker_Female_GuitarRaise_D
													[
														{
															type = DegenerateBlend
															id = Body
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
frontend_static_tree = {
	type = applydifference
	[
		{
			type = DegenerateBlend
			id = Heel
		}
		{
			type = Ik
			two_bone_chains = ik_params
			id = Ik
			[
				{
					type = ApplyFemaleDifference
					id = MaleAnimAdjust
					Anim = GH_Rocker_Female_GuitarRaise_D
					[
						{
							type = TweakBones
							id = TweakBonesNode
							[
								{
									type = PartialSwitch
									state = on
									[
										{
											type = DegenerateBlend
											id = Face
										}
										{
											type = applydifference
											id = LeftHandPartial
											[
												{
													$hero_arm_branch
												}
												{
													type = DegenerateBlend
													type = PartialSwitch
													state = off
													id = moment_blend
													[
														{
															type = DegenerateBlend
															id = moment_branch
														}
														{
															type = DegenerateBlend
															id = Body
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
hero_arm_branch = {
	type = Add
	[
		{
			type = Add
			[
				{
					type = modulate
					strength = 1.0
					id = fret_anim_mod
					[
						{
							type = DegenerateBlend
							id = LeftArm
						}
					]
				}
				{
					type = modulate
					strength = 1.0
					id = chord_anim_mod
					[
						{
							type = DegenerateBlend
							id = LeftHand
						}
					]
				}
			]
		}
		{
			type = modulate
			strength = 1.0
			id = strum_anim_mod
			[
				{
					type = DegenerateBlend
					id = RightArm
				}
			]
		}
	]
}
hero_body_branch = {
	type = timer_type
	id = BodyTimer
	Anim = anim_name
	Speed = Speed
	start = start
	end = end
	tempo_anim = tempo_anim
	min_time_factor = min_time_factor
	max_time_factor = max_time_factor
	allow_beat_skipping = allow_beat_skipping
	allow_tempo_override = allow_tempo_override
	anim_events = on
	[
		{
			type = source_type
			Anim = anim_name
		}
	]
}
hero_moment_branch = {
	type = timer_type
	id = momenttimer
	Anim = anim_name
	Speed = Speed
	start = start
	end = end
	tempo_anim = tempo_anim
	min_time_factor = min_time_factor
	max_time_factor = max_time_factor
	allow_beat_skipping = allow_beat_skipping
	allow_tempo_override = allow_tempo_override
	anim_events = on
	[
		{
			type = source_type
			Anim = anim_name
		}
	]
}
hero_strumming_branch = {
	type = Play
	id = StrumTimer
	Anim = strum_name
	[
		{
			type = Source
			Anim = strum_name
		}
	]
}
hero_fret_branch = {
	type = Play
	id = FretTimer
	Anim = fret_anim
	[
		{
			type = Source
			Anim = fret_anim
		}
	]
}
hero_finger_branch = {
	type = Play
	id = FingerTimer
	Anim = finger_anim
	[
		{
			type = Source
			Anim = finger_anim
		}
	]
}
hero_face_branch = {
	type = Play
	id = FacialTimer
	Anim = facial_anim
	[
		{
			type = Source
			Anim = facial_anim
		}
	]
}
vocalist_face_branch = {
	type = Play
	id = FacialTimer
	Anim = facial_anim
	[
		{
			type = Source
			Anim = facial_anim
		}
	]
}
hero_play_branch = {
	type = Play
	id = timer_id
	Anim = anim_name
	[
		{
			type = Source
			Anim = anim_name
		}
	]
}
hero_empty_branch = {
	type = Blank
}
hero_drumming_branch = {
	type = timer_type
	id = timer_id
	Anim = anim_name
	Speed = Speed
	[
		{
			type = Source
			Anim = anim_name
		}
	]
}
vocalist_static_tree = {
	type = Ik
	two_bone_chains = Singer_IK_Params_Arms
	id = Ik
	[
		{
			type = applydifference
			[
				{
					type = DegenerateBlend
					id = Heel
				}
				{
					type = Ik
					two_bone_chains = Singer_IK_Params_Legs
					id = Ik
					[
						{
							type = TweakBones
							id = TweakBonesNode
							[
								{
									type = PartialSwitch
									state = on
									[
										{
											type = modulate
											id = vocal_face_mod
											strength = 1
											[
												{
													type = DegenerateBlend
													id = Face
												}
											]
										}
										{
											type = PartialSwitch
											state = off
											id = moment_blend
											[
												{
													type = DegenerateBlend
													id = moment_branch
												}
												{
													type = DegenerateBlend
													id = Body
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
drummer_static_tree = {
	type = applydifference
	[
		{
			type = DegenerateBlend
			id = Heel
		}
		{
			type = Ik
			two_bone_chains = drummer_IK_params
			id = Ik
			[
				{
					type = applydifference
					[
						{
							type = modulate
							id = FemaleDiff
							strength = 0.0
							[
								{
									type = Source
									Anim = GH_Rocker_Female_Drummer_D
								}
							]
						}
						{
							type = TweakBones
							id = TweakBonesNode
							[
								{
									type = PartialSwitch
									state = on
									[
										{
											type = DegenerateBlend
											id = Face
										}
										{
											type = PartialSwitch
											state = off
											id = faceoff_blend
											[
												{
													type = DegenerateBlend
													id = faceoff_branch
												}
												{
													type = ApplyDrumKitDifference
													id = DrumKit
													drum_kit_channel_list = $drum_kit_channel_list
													[
														{
															type = PartialSwitch
															state = off
															id = moment_blend
															[
																{
																	type = DegenerateBlend
																	id = moment_branch
																}
																{
																	type = DegenerateBlend
																	id = Body
																}
															]
														}
													]
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}
drummer_moment_branch = {
	type = timer_type
	id = moment_timer
	Anim = anim_name
	Speed = Speed
	start = start
	end = end
	skip_beats = skip_beats
	tempo_anim = tempo_anim
	anim_events = on
	[
		{
			type = source_type
			Anim = anim_name
		}
	]
}
hero_cymbal_branch = {
	type = Play
	id = cymbal_timer_id
	Anim = cymbal_anim
	[
		{
			type = Source
			Anim = cymbal_anim
		}
	]
}
drum_kit_channel_list = [
	{
		name = tom_1
		bones = [
			Bone_Mic_Adjust_Height
		]
	}
	{
		name = tom_2
		bones = [
			Bone_Mic_Adjust_Angle
		]
	}
	{
		name = snare
		bones = [
			Control_Root
		]
	}
	{
		name = cymbal_hh
		bones = [
			Bone_Guitar_String_3
		]
	}
	{
		name = cymbal_1
		bones = [
			Bone_IK_Hand_Guitar_L
		]
	}
	{
		name = cymbal_2
		bones = [
			Bone_IK_Hand_Guitar_R
		]
	}
	{
		name = cymbal_3
		bones = [
			Bone_Guitar_String_1
		]
	}
	{
		name = kick
		bones = [
			Bone_Thigh_R
			Bone_Mic_Microphone
			Bone_Mic_Adjust_Height
			Bone_Mic_Adjust_Angle
			Bone_IK_Foot_Slave_R
		]
	}
]
empty_ik_params = [
]
CAR_IK_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
mii_IK_Params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_L
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, 1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_R
	}
]
Hero_Ik_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Guitar_L
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
Singer_IK_Params_Arms = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
	}
]
Singer_IK_Params_Legs = [
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.1483, 0.0, 0.98889995)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]
drummer_IK_params = [
	{
		bone0 = Bone_Bicep_R
		bone1 = Bone_Forearm_R
		bone2 = Bone_Palm_R
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_R
		stretch = 1.0
	}
	{
		bone0 = Bone_Bicep_L
		bone1 = Bone_Forearm_L
		bone2 = Bone_Palm_L
		HingeAxis = (0.0, 0.0, -1.0)
		CosMaxHingeAngle = -0.96999997
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Hand_Slave_L
		stretch = 1.0
	}
	{
		bone0 = Bone_Thigh_L
		bone1 = Bone_Knee_L
		bone2 = Bone_Ankle_L
		HingeAxis = (0.447, 0.0, 0.894)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_L
	}
	{
		bone0 = Bone_Thigh_R
		bone1 = Bone_Knee_R
		bone2 = Bone_Ankle_R
		HingeAxis = (-0.3511, 0.0, 0.9362999)
		CosMaxHingeAngle = -0.98999995
		CosMinHingeAngle = 0.96999997
		boneTarget = Bone_IK_Foot_Slave_R
	}
]

script ps2_get_musician_context_data 
	switch (<name>)
		case Guitarist
		case cas_musician1
		case bassist2
		case vocalist2
		case drummer2
		asset_heap = heap_musician1
		bandmember_appearance = guitarist_appearance
		asset_slot_num = 0
		case bassist
		case cas_musician2
		case guitarist2
		asset_heap = heap_musician2
		bandmember_appearance = bassist_appearance
		asset_slot_num = 1
		case vocalist
		case cas_musician3
		asset_heap = heap_musician3
		bandmember_appearance = vocalist_appearance
		asset_slot_num = 2
		case Drummer
		case cas_musician4
		asset_heap = heap_musician4
		bandmember_appearance = drummer_appearance
		asset_slot_num = 3
		default
		printf qs(0x654293d1) n = <name>
		asset_heap = heap_musician1
		bandmember_appearance = guitarist_appearance
		asset_slot_num = 0
	endswitch
	return <...>
endscript
half_animation_enabled = 1

script enable_half_animation 
	printf \{qs(0x960d5626)}
	change \{half_animation_enabled = 1}
	SetHalfAnimationState \{enabled = 1}
endscript

script disable_half_animation 
	printf \{qs(0x4931c2f5)}
	change \{half_animation_enabled = 0}
	SetHalfAnimationState \{enabled = 0}
endscript

script get_half_animation_state 
	return \{enabled = $half_animation_enabled}
endscript
anim_debug_targets = [
	Body
	Heel
	Face
	LeftArm
	LeftHand
	RightArm
	moment_branch
	Body
	LastBody
]
anim_debug_targets_strings = [
	'Camera'
	'Heel'
	'Face'
	'LeftArm'
	'LeftHand'
	'RightArm'
	'Moment_Branch'
	'Body'
	'LastBody'
]
anim_debug_target = none

script set_new_anim_debug_target \{target = none}
	if ($anim_debug_target != none)
		DestroyScreenElement \{id = anim_debug_container}
		($anim_debug_target) :Obj_KillSpawnedScript name = anim_debug_poller
	endif
	change \{Debug_LastBodyAnim = none}
	change anim_debug_target = <target>
	if (<target> != none)
		anim_debug_pak_toggle \{load}
		CreateScreenElement \{id = anim_debug_container
			parent = root_window
			type = MenuElement
			dims = (1024.0, 700.0)
			pos = (0.0, -20.0)
			pos_anchor = [
				center
				bottom
			]
			just = [
				center
				bottom
			]
			internal_just = [
				center
				bottom
			]
			isVertical = true
			position_children = true
			fit_major = `fit content if larger`
			fit_minor = `keep dims`
			spacing_between = 0
			z_priority = 500000}
		GetArraySize ($anim_debug_targets)
		begin
		CreateScreenElement \{type = TextBlockElement
			font = fontgrid_text_a6
			text = qs("")
			just = [
				center
				center
			]
			dims = (1000.0, 30.0)
			parent = anim_debug_container
			internal_scale = (0.5, 0.5)
			rgba = [
				255
				255
				255
				255
			]
			fit_width = `scale each line if larger`
			fit_height = `scale down if larger`
			scale_mode = `per axis`
			shadow
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [
				0
				0
				0
				255
			]}
		repeat (<array_size> + 1)
		<target> :obj_spawnscript anim_debug_poller
	else
		anim_debug_pak_toggle \{unload}
	endif
endscript
Debug_Last_Camera_Struct = {
}
Debug_LastBodyAnim_Display = none
Debug_LastBodyAnim = none

script anim_debug_pak_toggle 
	if NOT GlobalExists \{name = Debug_Anim_Name_Struct
			type = Structure}
		if GotParam \{load}
			LoadPakAsync \{pak_name = 'pak/anims/debug_anim_struct.pak'
				heap = BottomUpHeap
				async = 0}
		endif
	else
		if GotParam \{unload}
			UnloadPakAsync \{pak_name = 'pak/anims/debug_anim_struct.pak'
				heap = BottomUpHeap
				async = 0}
		endif
	endif
endscript

script anim_debug_poller 
	begin
	ResolveScreenElementId \{id = {
			anim_debug_container
			child = 0
		}
		param = TextElement}
	<AnimName> = qs("NONE")
	<lock_to> = none
	<cam_struct> = ($Debug_Last_Camera_Struct)
	if StructureContains Structure = <cam_struct> LockToBone
		if (((<cam_struct>).LockToBone) = bone_camera)
			if StructureContains Structure = (<cam_struct>) LockTo
				<lock_to> = ((<cam_struct>).LockTo)
			endif
		endif
	endif
	RemoveParameter \{Duration_String}
	<TimeStr> = qs("")
	if (<lock_to> = none)
		<AnimName> = qs(0x14fdda0e)
	else
		<lock_to> :Anim_Command target = ($anim_debug_targets [0]) command = DegenerateBlend_FindSource
		if GotParam \{Duration_String}
			if (<IsDone> = true)
				FormatText TextName = TimeStr qs(0xe5b8dbbe) t = <CurrentTime_String> d = <Duration_String>
			else
				FormatText TextName = TimeStr qs(0x02433bf3) t = <CurrentTime_String> d = <Duration_String>
			endif
		endif
	endif
	if NOT GlobalExists \{name = Debug_Anim_Name_Struct
			type = Structure}
		FormatText TextName = text qs(0x6ab84b92) t = ($anim_debug_targets_strings [0]) a = (<AnimName>) s = <TimeStr> DontAssertForChecksums
	else
		if StructureContains Structure = $Debug_Anim_Name_Struct (<AnimName>)
			FormatText TextName = text qs(0x6ab84b92) t = ($anim_debug_targets_strings [0]) a = (($Debug_Anim_Name_Struct).(<AnimName>)) s = <TimeStr>
		else
			FormatText TextName = text qs(0x6ab84b92) t = ($anim_debug_targets_strings [0]) a = (<AnimName>) s = <TimeStr> DontAssertForChecksums
		endif
	endif
	<TextElement> :SE_SetProps {
		text = <text>
	}
	GetArraySize ($anim_debug_targets)
	<i> = 1
	begin
	ResolveScreenElementId id = {anim_debug_container child = <i>} param = TextElement
	<AnimName> = qs("NONE")
	<TimeStr> = qs("")
	RemoveParameter \{Duration_String}
	Anim_Command target = ($anim_debug_targets [<i>]) command = DegenerateBlend_FindSource
	if GotParam \{Duration_String}
		if (<IsDone> = true)
			FormatText TextName = TimeStr qs(0xe5b8dbbe) t = <CurrentTime_String> d = <Duration_String>
		else
			FormatText TextName = TimeStr qs(0x02433bf3) t = <CurrentTime_String> d = <Duration_String>
		endif
	endif
	if NOT GlobalExists \{name = Debug_Anim_Name_Struct
			type = Structure}
		FormatText TextName = text qs(0x6ab84b92) t = ($anim_debug_targets_strings [<i>]) a = (<AnimName>) s = <TimeStr> DontAssertForChecksums
	else
		if StructureContains Structure = $Debug_Anim_Name_Struct (<AnimName>)
			FormatText TextName = text qs(0x6ab84b92) t = ($anim_debug_targets_strings [<i>]) a = (($Debug_Anim_Name_Struct).(<AnimName>)) s = <TimeStr>
		else
			FormatText TextName = text qs(0x6ab84b92) t = ($anim_debug_targets_strings [<i>]) a = (<AnimName>) s = <TimeStr> DontAssertForChecksums
		endif
	endif
	<TextElement> :SE_SetProps {
		text = <text>
	}
	<i> = (<i> + 1)
	repeat (<array_size> -2)
	if ((<AnimName>) != ($Debug_LastBodyAnim))
		change Debug_LastBodyAnim_Display = ($Debug_LastBodyAnim)
		change Debug_LastBodyAnim = <AnimName>
	endif
	ResolveScreenElementId id = {anim_debug_container child = <i>} param = TextElement
	<AnimName> = ($Debug_LastBodyAnim_Display)
	if (<AnimName> = none)
		<AnimName> = qs("NONE")
	endif
	if NOT GlobalExists \{name = Debug_Anim_Name_Struct
			type = Structure}
		FormatText TextName = text qs(0x03b1fff3) t = ($anim_debug_targets_strings [<i>]) a = (<AnimName>) DontAssertForChecksums
	else
		if StructureContains Structure = $Debug_Anim_Name_Struct (<AnimName>)
			FormatText TextName = text qs(0x03b1fff3) t = ($anim_debug_targets_strings [<i>]) a = (($Debug_Anim_Name_Struct).(<AnimName>))
		else
			FormatText TextName = text qs(0x03b1fff3) t = ($anim_debug_targets_strings [<i>]) a = (<AnimName>) DontAssertForChecksums
		endif
	endif
	<TextElement> :SE_SetProps {
		text = <text>
	}
	WaitOneGameFrame
	repeat
endscript
