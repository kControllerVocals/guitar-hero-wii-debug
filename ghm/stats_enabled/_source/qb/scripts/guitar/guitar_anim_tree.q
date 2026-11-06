cache_build_band_members = 0
nondrummer_anim_node_ids = [
	body
	bodytimer
	moment_blend
	moment_branch
	momenttimer
	strumtimer
	frettimer
	fingertimer
	facialtimer
	ik
	lefthandpartial
	leftarm
	lefthand
	rightarm
	face
	strum_anim_mod
	fret_anim_mod
	chord_anim_mod
	maleanimadjust
	maleanimadjust_moment
	tweakbonesnode
	mirrornode
	femalediff
	vocal_face_mod
	heel
]
drummer_anim_node_ids = [
	body
	bodytimer
	facialtimer
	ik
	lefthandpartial
	leftarm
	lefthand
	rightarm
	face
	femalediff
	drumkit
	moment_branch
	moment_blend
	moment_timer
	faceoff_blend
	faceoff_branch
	faceoff_timer
	tweakbonesnode
	mirrornode
	heel
]
guitarist_appearance = {
}
bassist_appearance = {
}
vocalist_appearance = {
}
drummer_appearance = {
}

script create_band_member \{name = guitarist
		lightgroup = band
		async = 0
		pos = (0.0, 0.0, 0.0)
		dir = (0.0, 0.0, 1.0)}
	removeparameter \{profile_struct}
	ps2_get_musician_context_data name = <name>
	create_band_member_wait_for_lock
	printf qs(0xc143fb65) a = <name>
	pos = (0.0, 0.0, 0.0)
	dir = (0.0, 0.0, 1.0)
	if gotparam \{start_node}
		if doeswaypointexist name = <start_node>
			getwaypointpos name = <start_node>
			getwaypointdir name = <start_node>
		endif
	endif
	if compositeobjectexists <name>
		scriptassert '%s already exists' s = <name>
	endif
	if NOT gotparam \{no_appearance_pak_load}
		unloadappearancepaks appearance = ($<bandmember_appearance>) asset_context = <asset_heap> async = <async>
		change globalname = <bandmember_appearance> newvalue = {}
	endif
	if NOT gotparam \{asset_heap}
		asset_heap = heap_musician_anim
	endif
	anim_asset_context = <asset_heap>
	if get_key_from_appearance key = anim_struct appearance = (<profile>.appearance)
		if gotparam \{loading_into_song}
			get_anim_struct_member anim_struct = <anim_struct> loading_into_song = <loading_into_song> member = <instrument>
		else
		endif
		if NOT structurecontains structure = ($<anim_struct>) anim_asset_context
			scriptassert \{'anim_asset_context missing!'}
		endif
		anim_asset_context = (($<anim_struct>).anim_asset_context)
	else
		scriptassert \{'anim_struct not found in appearance'}
	endif
	removeparameter \{highway_texture}
	if gotparam \{loading_into_song}
		if gotparam \{player_status}
			if NOT (($<player_status>.part) = vocals)
				if NOT get_highway_struct_from_appearance part = ($<player_status>.part) appearance = (<profile>.appearance)
					scriptassert \{'Problem grabbing highway struct'}
				endif
				if (($is_attract_mode = 1) || ((<profile>.name) = emptyguy))
					highway_pak = highway_axel
					highway_texture = highway_axel
				endif
				if ($cheat_blackhighway = 1)
					highway_pak = highway_black
					highway_texture = highway_black
				endif
				mpm_object_load_pak pak = <highway_pak> owner = <name> async = <async>
			endif
		else
			if ((<profile>.name) = jimi)
				if (<name> = vocalist)
					if NOT get_highway_struct_from_appearance part = <instrument> appearance = (<profile>.appearance)
						scriptassert \{'Problem grabbing highway struct'}
					endif
					mpm_object_unload_paks owner = guitarist async = <async>
					mpm_object_load_pak pak = <highway_pak> owner = <name> async = <async>
					get_band_member_player_status \{part = guitar}
					if gotparam \{band_member_player_status}
						change structurename = <band_member_player_status> highway_texture = <highway_texture>
						change structurename = <band_member_player_status> band_member = vocalist
					endif
					removeparameter \{highway_texture}
				endif
			endif
			if ((<profile>.name) = travis)
				if (<name> = drummer)
					if NOT get_highway_struct_from_appearance part = <instrument> appearance = (<profile>.appearance)
						scriptassert \{'Problem grabbing highway struct'}
					endif
					mpm_object_unload_paks owner = drummer async = <async>
					mpm_object_load_pak pak = <highway_pak> owner = <name> async = <async>
					get_band_member_player_status \{part = drum}
					if gotparam \{band_member_player_status}
						change structurename = <band_member_player_status> highway_texture = <highway_texture>
						change structurename = <band_member_player_status> band_member = drummer
					endif
					removeparameter \{highway_texture}
				endif
			endif
		endif
	endif
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_viewer
		lightgroup = none
		default
		switch <name>
			case drummer
			case drummer2
			lightgroup = [band drummer]
			case bassist
			lightgroup = [band alt_band bassist]
			case guitarist
			case guitarist2
			lightgroup = [band alt_band guitarist]
			case vocalist
			case vocalist2
			lightgroup = [band alt_band vocalist]
			default
			lightgroup = [band alt_band]
		endswitch
	endswitch
	ik_params = hero_ik_params
	if gotparam \{player_status}
		if gotparam \{highway_texture}
			change structurename = <player_status> highway_texture = <highway_texture>
		endif
		change structurename = <player_status> band_member = <name>
	endif
	get_is_female_from_appearance appearance = (<profile>.appearance)
	switch (<instrument>)
		case drum
		if get_key_from_appearance key = drummer_skeleton appearance = (<profile>.appearance)
			formattext textname = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <drummer_skeleton>
			formattext checksumname = skeleton '%a' a = <drummer_skeleton>
		elseif (<is_female> = 1)
			formattext textname = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%af.pak' a = <asset_slot_num>
			formattext checksumname = skeleton 'drummer_skeleton%af' a = <asset_slot_num>
		else
			formattext textname = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%am.pak' a = <asset_slot_num>
			formattext checksumname = skeleton 'drummer_skeleton%am' a = <asset_slot_num>
		endif
		default
		if get_key_from_appearance key = rocker_skeleton appearance = (<profile>.appearance)
			formattext textname = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <rocker_skeleton>
			formattext checksumname = skeleton '%a' a = <rocker_skeleton>
		elseif (<is_female> = 1)
			formattext textname = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%af.pak' a = <asset_slot_num>
			formattext checksumname = skeleton 'guitarist_skeleton%af' a = <asset_slot_num>
		else
			formattext textname = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%am.pak' a = <asset_slot_num>
			formattext checksumname = skeleton 'guitarist_skeleton%am' a = <asset_slot_num>
		endif
	endswitch
	pushassetcontext context = <asset_heap>
	loadpak <skeleton_pak_name> heap = <asset_heap>
	popassetcontext
	if gotparam \{loading_into_song}
		maybe_use_song_or_venue_specific_instrument {song = $current_song venue = $current_level appearance = (<profile>.appearance) name = (<profile>.name)}
	else
		appearance = (<profile>.appearance)
	endif
	change globalname = <bandmember_appearance> newvalue = <appearance>
	temp_instrument = <instrument>
	if gotparam \{no_instrument_pak_load}
		temp_instrument = none
	endif
	if NOT gotparam \{no_appearance_pak_load}
		loadappearancepaks appearance = <appearance> heap = (<asset_heap>) instrument = <temp_instrument> asset_context = <asset_heap> async = <async>
	endif
	shadow_models = []
	get_key_from_appearance key = shadow_models appearance = (<profile>.appearance)
	createcompositeobject {
		components = [
			{
				component = skeleton
				skeletonname = <skeleton>
				allow_reset
			}
			{
				component = setdisplaymatrix
			}
			{
				component = animtree
				skeletonname = <skeleton>
			}
			{
				component = model
				lightgroup = <lightgroup>
			}
			{
				component = motion
			}
			{
				component = modelbuilder
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
	<name> :obj_setorientation dir = <dir>
	get_body_checksum_from_appearance appearance = (<profile>.appearance)
	get_is_female_from_appearance appearance = (<profile>.appearance)
	if NOT (gotparam is_female)
		is_female = 0
	endif
	<name> :settags asset_heap = <asset_heap>
	<name> :settags body_checksum = <body_checksum>
	<name> :settags is_female = <is_female>
	if gotparam \{anim_struct_member}
		<name> :settags anim_struct = (<anim_struct_member>.anim_set)
	endif
	generatechecksumfromstruct struct = (<profile>.appearance)
	<name> :settags appearance_checksum = <structure_checksum>
	<name> :settags geom_heap = <asset_heap>
	<name> :settags current_instrument = <temp_instrument>
	switch <name>
		case cas_musician1
		case cas_musician2
		case cas_musician3
		case cas_musician4
		default
		switch (<instrument>)
			case vocals
			desired_tree = vocalist_static_tree
			case drum
			desired_tree = drummer_static_tree
			default
			desired_tree = guitarist_static_tree
		endswitch
		if ((<profile>.name) = larsulrich)
			if (<desired_tree> = drummer_static_tree)
				desired_tree = 0x81b50002
				ik_params = 0x288fcdf4
			endif
		endif
	endswitch
	if is_current_band_metallica
		if ($current_song = entersandman && <instrument> = drum)
			<name> :cas_apply_bone_transforms bone_info = {bone = bone_pelvis translation = {value = (0.0, 0.025, 0.0)}}
			<name> :cas_apply_bone_transforms bone_info = {bone = bone_ik_foot_slave_l translation = {value = (0.0, 0.025, 0.0)}}
			<name> :cas_apply_bone_transforms bone_info = {bone = bone_ik_foot_slave_r translation = {value = (0.0, 0.025, 0.0)}}
		endif
	endif
	if (<instrument> = drum)
		node_ids = $drummer_anim_node_ids
	else
		node_ids = $nondrummer_anim_node_ids
	endif
	if ((<instrument> = guitar && <name> = guitarist))
		ik_params = 0x8a91d5fc
	endif
	<name> :anim_inittree {
		tree = $<desired_tree>
		nodeiddeclaration = <node_ids>
		params = {
			ik_params = <ik_params>
		}
	}
	if (<instrument> = drum)
		if (<is_female> = 1)
			<name> :anim_command target = femalediff command = modulate_setstrength params = {strength = 1.0}
		endif
	endif
	<name> :cas_reset_bones
	with_mic = 0
	if gotparam \{loading_into_song}
		get_song_struct song = <loading_into_song>
		if structurecontains structure = <song_struct> parts_with_mic
			if arraycontains array = (<song_struct>.parts_with_mic) contains = <name>
				with_mic = 1
			endif
		endif
	endif
	if (<name> = vocalist)
		if (<instrument> = guitar || <instrument> = bass)
			with_mic = 1
		endif
	endif
	extendcrc <name> '_Info' out = info_struct
	change structurename = <info_struct> part = <instrument>
	change structurename = <info_struct> playing = true
	if (<with_mic> = 1)
		loadpartpak appearance = (<profile>.appearance) part = cas_mic_stand heap = (<asset_heap>) instrument = vocals asset_context = <asset_heap> async = 0
		loadpartpak appearance = (<profile>.appearance) part = cas_mic heap = (<asset_heap>) instrument = vocals asset_context = <asset_heap> async = 0
	endif
	if NOT <name> :build_band_member_from_appearance {
			name = (<profile>.name)
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
	if gotparam \{cancelled}
		return \{false}
	endif
	return \{true}
endscript

script get_body_checksum_from_appearance 
	if structurecontains structure = <appearance> cas_body
		return body_checksum = ((<appearance>.cas_body).desc_id)
	endif
	if structurecontains structure = <appearance> cas_full_body
		return body_checksum = ((<appearance>.cas_full_body).desc_id)
	endif
	printstruct <appearance>
	scriptassert \{'Character has no body!'}
endscript

script get_is_female_from_appearance 
	if structurecontains structure = <appearance> cas_body
		getactualcasoptionstruct part = cas_body desc_id = ((<appearance>.cas_body).desc_id)
	endif
	if structurecontains structure = <appearance> cas_full_body
		getactualcasoptionstruct part = cas_full_body desc_id = ((<appearance>.cas_full_body).desc_id)
	endif
	if NOT gotparam \{is_female}
		scriptassert \{'Character has no body!'}
		<is_female> = 0
	endif
	return is_female = <is_female>
endscript

script build_band_member_from_appearance \{instrument = none
		with_mic = 0}
	if gotparam \{loading_into_song}
		maybe_use_song_or_venue_specific_instrument {song = $current_song venue = $current_level appearance = <appearance> name = <name>}
	endif
	if (<with_mic> = 1)
		if (<instrument> = guitar)
			instrument = guitar_and_vocals
		elseif (<instrument> = bass)
			instrument = bass_and_vocals
		elseif (<instrument> = vocals)
			instrument = guitar_and_vocals
		endif
	endif
	get_hat_hair_choice appearance = <appearance>
	buildscriptparams = {
		lightgroup = <lightgroup>
		temporary_heap = heap_cas
		instrument = <instrument>
		hat_hair_choice = <hat_hair_choice>
	}
	modelbuilder_preload {
		<...>
		geom_heap = <geom_heap>
		assetcontext = <assetcontext>
		appearance = <appearance>
		buildscriptparams = <buildscriptparams>
	}
	if NOT gotparam \{cancelled}
		obj_getid
		if (<with_mic> = 1 && <objid> != vocalist)
			if NOT (<instrument> = vocals)
			endif
		endif
		return \{true}
	endif
	return \{false}
endscript

script get_anim_struct_member 
	if NOT ($current_song = jamsession)
		if gotparam \{loading_into_song}
			get_song_prefix song = <loading_into_song>
			extendcrc <anim_struct> '_' out = song_anim_struct
			extendcrc <song_anim_struct> <song_prefix> out = song_anim_struct
			if globalexists name = <song_anim_struct> type = structure
				if use_alternate_anim_struct song = <loading_into_song>
					appendsuffixtochecksum base = <song_anim_struct> suffixstring = '_alt'
					if globalexists name = <appended_id> type = structure
						song_anim_struct = <appended_id>
					endif
				endif
				if structurecontains structure = ($<song_anim_struct>) <member>
					printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct> donotresolve
					printstruct <...>
					return true anim_struct_member = (($<song_anim_struct>).<member>)
				elseif (<member> = bass || <member> = rhythm)
					printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
					if structurecontains structure = ($<song_anim_struct>) guitar
						printf 'get_anim_struct_member - Using song anim struct : %s' s = <song_anim_struct> donotresolve
						return true anim_struct_member = (($<song_anim_struct>).guitar)
					endif
				endif
			endif
		endif
	endif
	if globalexists name = <anim_struct> type = structure
		if NOT ($guitar_character_loops_state = loop_paks_enabled)
			appendsuffixtochecksum base = <anim_struct> suffixstring = '_alt'
			if globalexists name = <appended_id> type = structure
				anim_struct = <appended_id>
			endif
		endif
		if structurecontains structure = ($<anim_struct>) <member>
			printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> donotresolve
			printstruct <...>
			return true anim_struct_member = (($<anim_struct>).<member>)
		elseif (<member> = bass || <member> = rhythm)
			printf \{'get_anim_struct_member - Dropping from bass to guitar struct'}
			if structurecontains structure = ($<anim_struct>) guitar
				printf 'get_anim_struct_member - Using global anim struct : %s' s = <anim_struct> donotresolve
				return true anim_struct_member = (($<anim_struct>).guitar)
			endif
		endif
	endif
	printf 'get_anim_struct_member - Failed! : %s' s = <anim_struct> donotresolve
	printstruct <...>
	return \{false}
endscript

script preload_band_member \{name = guitarist
		async = 0}
	create_band_member_wait_for_lock
	filename_crc = none
	instrument_crc = none
	create_band_member_unlock
	return filename_crc = <filename_crc> instrument_crc = <instrument_crc> true
endscript

script preload_band_member_finish \{name = guitarist
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
	waitonegameframe
	repeat
	change \{create_band_member_lock_queue = 1}
	begin
	if ($create_band_member_lock = 0)
		break
	endif
	waitonegameframe
	repeat
	change \{create_band_member_lock_queue = 0}
	change \{create_band_member_lock = 1}
endscript

script destroy_band 
	if ($in_tutorial_mode = 1)
		scriptassert \{'should not destroy band in tutorial mode'}
	endif
	cas_destroy_all_characters
	band_stop_anims
	destroy_band_member \{name = guitarist}
	destroy_band_member \{name = guitarist2}
	destroy_band_member \{name = bassist}
	destroy_band_member \{name = bassist2}
	destroy_band_member \{name = drummer}
	destroy_band_member \{name = drummer2}
	destroy_band_member \{name = vocalist}
	destroy_band_member \{name = vocalist2}
	band_unload_anim_paks
	if gotparam \{unload_paks}
		mpm_flush_all_paks
	endif
endscript

script destroy_band_member 
	ps2_get_musician_context_data name = <name>
	if compositeobjectexists name = <name>
		<name> :obj_resetbones
		bandmanager_removecharacter name = <name>
		<name> :die
		flushdeadobjects
		mpm_object_unload_paks owner = <name>
		flushdeadobjects
		if get_key_from_appearance key = drummer_skeleton appearance = ($<bandmember_appearance>)
			formattext textname = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <drummer_skeleton>
			pushassetcontext context = <asset_heap>
			unloadpak <skeleton_pak_name> heap = <asset_heap> sameheaps
			popassetcontext
		elseif get_key_from_appearance key = rocker_skeleton appearance = ($<bandmember_appearance>)
			formattext textname = skeleton_pak_name 'pak\\skeletons\\skeleton_%a.pak' a = <rocker_skeleton>
			pushassetcontext context = <asset_heap>
			unloadpak <skeleton_pak_name> heap = <asset_heap> sameheaps
			popassetcontext
		else
			get_is_female_from_appearance appearance = ($<bandmember_appearance>)
			if (<is_female> = 1)
				formattext textname = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%af.pak' a = <asset_slot_num>
				if ispakloaded <skeleton_pak_name> heap = <asset_heap>
					pushassetcontext context = <asset_heap>
					unloadpak <skeleton_pak_name> heap = <asset_heap> sameheaps
					popassetcontext
				else
					formattext textname = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%af.pak' a = <asset_slot_num>
					pushassetcontext context = <asset_heap>
					unloadpak <skeleton_pak_name> heap = <asset_heap> sameheaps
					popassetcontext
				endif
			else
				formattext textname = skeleton_pak_name 'pak\\skeletons\\drummer_skeleton%am.pak' a = <asset_slot_num>
				if ispakloaded <skeleton_pak_name> heap = <asset_heap>
					pushassetcontext context = <asset_heap>
					unloadpak <skeleton_pak_name> heap = <asset_heap> sameheaps
					popassetcontext
				else
					formattext textname = skeleton_pak_name 'pak\\skeletons\\guitarist_skeleton%am.pak' a = <asset_slot_num>
					pushassetcontext context = <asset_heap>
					unloadpak <skeleton_pak_name> heap = <asset_heap> sameheaps
					popassetcontext
				endif
			endif
		endif
		if NOT gotparam \{no_appearance_pak_unload}
			unloadappearancepaks appearance = ($<bandmember_appearance>) no_wait asset_context = <asset_heap>
			change globalname = <bandmember_appearance> newvalue = {}
		endif
	endif
endscript

script kill_character_scripts 
	printf \{qs(0x2498acb7)}
	if compositeobjectexists \{name = guitarist}
		guitarist :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = bassist}
		bassist :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_switchscript \{emptyscript}
	endif
	if compositeobjectexists \{name = drummer}
		drummer :obj_switchscript \{emptyscript}
	endif
endscript

script emptyscript 
endscript

script hero_pause_anim 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = timer_setspeed
			params = {
				speed = 0.0
			}}
	endif
endscript

script hero_unpause_anim 
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = timer_setspeed
			params = {
				speed = 1.0
			}}
	endif
endscript

script hero_enable_mirroring 
	if anim_animnodeexists \{id = mirrornode}
		anim_command \{target = mirrornode
			command = mirror_setstate
			params = {
				on
			}}
	endif
endscript

script hero_disable_mirroring 
	if anim_animnodeexists \{id = mirrornode}
		anim_command \{target = mirrornode
			command = mirror_setstate
			params = {
				off
			}}
	endif
endscript

script band_play_strum_anim 
	if compositeobjectexists name = <name>
		<name> :hero_play_strum_anim anim = <anim>
	endif
endscript

script band_play_fret_anim 
	if compositeobjectexists name = <name>
		<name> :hero_play_fret_anim anim = <anim>
	endif
endscript

script band_play_finger_anim 
	if compositeobjectexists name = <name>
		<name> :hero_play_finger_anim anim = <anim>
	endif
endscript

script hero_play_facial_anim \{blendduration = 0.0}
	if anim_animnodeexists \{id = face}
		obj_getid
		if ((<objid> = vocalist) || (<objid> = vocalist2))
			tree = $vocalist_face_branch
		else
			tree = $hero_face_branch
		endif
		anim_command {
			target = face
			command = degenerateblend_addbranch
			params = {
				tree = <tree>
				blendduration = <blendduration>
				params = {
					facial_anim = <anim>
				}
			}
		}
	endif
endscript

script hero_clear_facial_anim \{blendduration = 0.0}
	if anim_animnodeexists \{id = face}
		anim_command {
			target = face
			command = degenerateblend_addbranch
			params = {
				tree = $hero_empty_branch
				blendduration = <blendduration>
			}
		}
	endif
endscript

script hero_add_clothing_difference_anim 
	if NOT gotparam \{anim}
		return
	endif
	anim_command target = heel command = applyheeldifference_setanim params = {anim = <anim>}
endscript

script hero_wait_until_anim_finished \{timer = bodytimer}
	begin
	if hero_anim_complete timer = <timer>
		break
	endif
	waitonegameframe
	repeat
endscript

script hero_wait_until_anim_near_end \{timer = bodytimer
		time_from_end = 0.2}
	begin
	if hero_anim_near_end timer = <timer> time_from_end = <time_from_end>
		break
	endif
	waitonegameframe
	repeat
endscript

script hero_anim_near_end \{timer = bodytimer}
	if NOT anim_animnodeexists id = <timer>
		return \{true}
	else
		if anim_command target = <timer> command = timer_wait params = {secondsfromend = <time_from_end>}
			return \{true}
		else
			return \{false}
		endif
	endif
endscript

script hero_disable_arms \{blend_time = 0.0}
	obj_getid
	band_setikchain name = <objid> chain = slave
	return
endscript

script hero_enable_arms \{blend_time = 0.0}
	obj_getid
	band_setikchain name = <objid> chain = guitar
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
	if anim_animnodeexists \{id = ik}
		if anim_command \{target = ik
				command = ik_haschain
				params = {
					chain = bone_ik_hand_slave_l
				}}
			left_hand_bone = bone_ik_hand_slave_l
			right_hand_bone = bone_ik_hand_slave_r
		elseif anim_command \{target = ik
				command = ik_haschain
				params = {
					chain = bone_ik_hand_guitar_l
				}}
			left_hand_bone = bone_ik_hand_guitar_l
			right_hand_bone = bone_ik_hand_guitar_r
		else
			scriptassert \{'No valid IK chain to work with'}
		endif
	endif
	if (<disable_left_arm> = true)
		printf \{channel = newdebug
			qs(0xf9e6434b)}
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 0.0
					blendduration = <blend_time>
					chain = <left_hand_bone>
				}
			}
		else
			printf \{channel = newdebug
				qs(0x3e3968e0)}
		endif
	endif
	if (<disable_right_arm> = true)
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 0.0
					blendduration = <blend_time>
					chain = <right_hand_bone>
				}
			}
		endif
	endif
	if (<enable_left_arm> = true)
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 1.0
					blendduration = <blend_time>
					chain = <left_hand_bone>
				}
			}
		endif
	endif
	if (<enable_right_arm> = true)
		if anim_animnodeexists \{id = ik}
			anim_command {
				target = ik
				command = ik_setchainstrength
				params = {
					strength = 1.0
					blendduration = <blend_time>
					chain = <right_hand_bone>
				}
			}
		endif
	endif
endscript

script killanim 
	skeleton_getskeletonname
	extendcrc <skeletonname> '_default' out = anim
	obj_killallspawnedscripts
	hero_play_anim anim = <anim> blendduration = 0.0
endscript

script handle_moment_anim_blending 
	obj_getid
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			on
			blendduration = 0.0
		}}
	anim_command \{target = bodytimer
		command = 0x55c19624}
	stop_loop_cameras name = <objid>
	anim_command \{target = momenttimer
		command = timer_waitanimcomplete}
	wait \{2
		gameframes}
	end_moment_anim
endscript

script end_moment_anim 
	obj_getid
	obj_killspawnedscript \{name = handle_drummer_moment_anim_blending}
	if anim_animnodeexists \{id = moment_blend}
		anim_command \{target = moment_blend
			command = partialswitch_setstate
			params = {
				off
				blendduration = 0.0
			}}
		anim_command \{target = moment_branch
			command = degenerateblend_addbranch
			params = {
				tree = $hero_empty_branch
				blendduration = 0.0
			}}
	endif
	if anim_animnodeexists \{id = bodytimer}
		anim_command \{target = bodytimer
			command = 0x5cf61392}
	endif
	extendcrc <objid> '_Info' out = info_struct
	part = ($<info_struct>.part)
	getpakmancurrent \{map = zones}
	if (<pak> != z_soundcheck && <pak> != z_objviewer)
		if (<part> = guitar || <part> = bass || <part> = rhythm)
			chain = guitar
		else
			chain = slave
		endif
		band_setikchain name = <objid> chain = <chain>
	endif
	start_loop_cameras name = <objid>
	if compositeobjectexists \{name = guitarist}
		guitarist :obj_setboundingsphere \{10}
	endif
	if compositeobjectexists \{name = bassist}
		bassist :obj_setboundingsphere \{10}
	endif
	if compositeobjectexists \{name = vocalist}
		vocalist :obj_setboundingsphere \{10}
	endif
	wait \{1
		gameframe}
	getpakmancurrent \{map = zones}
	if (<pak> != z_soundcheck && <pak> != z_objviewer)
		band_movetostartnode name = <objid>
	endif
endscript

script stop_loop_cameras 
	if (<name> = drummer)
		return
	endif
	extendcrc <name> '_mocap_lock_target_01' out = camera1
	if compositeobjectexists name = <camera1>
		if <camera1> :anim_animnodeexists id = bodytimer
			<camera1> :anim_command target = bodytimer command = 0x55c19624
		endif
	endif
	extendcrc <name> '_mocap_lock_target_02' out = camera2
	if compositeobjectexists name = <camera2>
		if <camera2> :anim_animnodeexists id = bodytimer
			<camera2> :anim_command target = bodytimer command = 0x55c19624
		endif
	endif
endscript

script start_loop_cameras 
	extendcrc <name> '_mocap_lock_target_01' out = camera1
	if compositeobjectexists name = <camera1>
		if <camera1> :anim_animnodeexists id = bodytimer
			<camera1> :anim_command target = bodytimer command = 0x5cf61392
		endif
	endif
	extendcrc <name> '_mocap_lock_target_02' out = camera2
	if compositeobjectexists name = <camera2>
		if <camera2> :anim_animnodeexists id = bodytimer
			<camera2> :anim_command target = bodytimer command = 0x5cf61392
		endif
	endif
endscript

script set_timer_node_speed 
endscript

script handle_drummer_moment_anim_blending 
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			on
			blendduration = 0.1
		}}
	anim_command \{target = moment_timer
		command = timer_waitanimcomplete}
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			off
			blendduration = 0.1
		}}
endscript

script end_drummer_moment_anim 
	obj_killspawnedscript \{name = handle_drummer_moment_anim_blending}
	anim_command \{target = moment_blend
		command = partialswitch_setstate
		params = {
			off
			blendduration = 0.0
		}}
endscript

script drummer_faceoff_rest 
	anim = drum_hth_loop_notempo
	anim_command {
		target = faceoff_branch
		command = degenerateblend_addbranch
		params = {
			tree = $faceoff_drummer_notempo
			blendduration = 0.0
			params = {
				anim = <anim>
			}
		}
	}
	anim_command \{target = faceoff_blend
		command = partialswitch_setstate
		params = {
			on
			blendduration = 0.3
		}}
endscript

script drummer_faceoff_play 
	anim_command \{target = faceoff_blend
		command = partialswitch_setstate
		params = {
			off
			blendduration = 0.3
		}}
endscript
faceoff_drummer_notempo = {
	type = cycle
	id = faceoff_timer
	anim = anim
	[
		{
			type = source
			anim = anim
		}
	]
}

script hide_mic 
	switchoffatomic \{cas_mic}
	switchoffatomic \{cas_mic_stand}
endscript

script show_mic 
	switchonatomic \{cas_mic}
	switchonatomic \{cas_mic_stand}
endscript

script hide_mic_stand 
	switchoffatomic \{cas_mic_stand}
endscript

script show_mic_stand 
	switchonatomic \{cas_mic_stand}
endscript

script hide_mic_microphone 
	switchoffatomic \{cas_mic}
endscript

script show_mic_microphone 
	switchonatomic \{cas_mic}
endscript

script hide_drumkit 
	switchoffatomic \{cas_drums}
endscript

script show_drumkit 
	switchonatomic \{cas_drums}
endscript

script vocalist_facial_animations_start \{blendtime = 0.3}
	anim_command target = vocal_face_mod command = modulate_startblend params = {blendtime = <blendtime> blendcurve = [1 0]}
endscript

script vocalist_facial_animations_stop \{blendtime = 0.3}
	anim_command target = vocal_face_mod command = modulate_startblend params = {blendtime = <blendtime> blendcurve = [0 1]}
endscript
generic_static_tree = {
	type = degenerateblend
	id = body
}
guitarist_static_tree = {
	type = applyheeldifference
	id = heel
	[
		{
			type = ik
			two_bone_chains = ik_params
			id = ik
			[
				{
					type = tweakbones
					id = tweakbonesnode
					[
						{
							type = partialswitch
							state = on
							[
								{
									type = degenerateblend
									id = face
								}
								{
									type = applydifference
									id = lefthandpartial
									[
										{
											$hero_arm_branch
										}
										{
											type = partialswitch
											state = off
											id = moment_blend
											[
												{
													type = applyfemaledifference
													id = maleanimadjust_moment
													anim = gh_rocker_female_guitarraise_d
													[
														{
															type = degenerateblend
															id = moment_branch
														}
													]
												}
												{
													type = applyfemaledifference
													id = maleanimadjust
													anim = gh_rocker_female_guitarraise_d
													[
														{
															type = degenerateblend
															id = body
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
	type = applyheeldifference
	id = heel
	[
		{
			type = ik
			two_bone_chains = ik_params
			id = ik
			[
				{
					type = applyfemaledifference
					id = maleanimadjust
					anim = gh_rocker_female_guitarraise_d
					[
						{
							type = tweakbones
							id = tweakbonesnode
							[
								{
									type = partialswitch
									state = on
									[
										{
											type = degenerateblend
											id = face
										}
										{
											type = applydifference
											id = lefthandpartial
											[
												{
													$hero_arm_branch
												}
												{
													type = degenerateblend
													type = partialswitch
													state = off
													id = moment_blend
													[
														{
															type = degenerateblend
															id = moment_branch
														}
														{
															type = degenerateblend
															id = body
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
	type = add
	[
		{
			type = add
			[
				{
					type = modulate
					strength = 1.0
					id = fret_anim_mod
					[
						{
							type = degenerateblend
							id = leftarm
						}
					]
				}
				{
					type = modulate
					strength = 1.0
					id = chord_anim_mod
					[
						{
							type = degenerateblend
							id = lefthand
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
					type = degenerateblend
					id = rightarm
				}
			]
		}
	]
}
hero_body_branch = {
	type = timer_type
	id = bodytimer
	anim = anim_name
	speed = speed
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
			anim = anim_name
		}
	]
}
hero_moment_branch = {
	type = timer_type
	id = momenttimer
	anim = anim_name
	speed = speed
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
			anim = anim_name
		}
	]
}
hero_strumming_branch = {
	type = play
	id = strumtimer
	anim = strum_name
	[
		{
			type = source
			anim = strum_name
		}
	]
}
hero_fret_branch = {
	type = play
	id = frettimer
	anim = fret_anim
	[
		{
			type = source
			anim = fret_anim
		}
	]
}
hero_finger_branch = {
	type = play
	id = fingertimer
	anim = finger_anim
	[
		{
			type = source
			anim = finger_anim
		}
	]
}
hero_face_branch = {
	type = play
	id = facialtimer
	anim = facial_anim
	[
		{
			type = source
			anim = facial_anim
		}
	]
}
vocalist_face_branch = {
	type = play
	id = facialtimer
	anim = facial_anim
	[
		{
			type = source
			anim = facial_anim
		}
	]
}
hero_play_branch = {
	type = play
	id = timer_id
	anim = anim_name
	[
		{
			type = source
			anim = anim_name
		}
	]
}
hero_empty_branch = {
	type = blank
}
hero_drumming_branch = {
	type = timer_type
	id = timer_id
	anim = anim_name
	speed = speed
	[
		{
			type = source
			anim = anim_name
		}
	]
}
vocalist_static_tree = {
	type = ik
	two_bone_chains = singer_ik_params_arms
	id = ik
	[
		{
			type = applyheeldifference
			id = heel
			[
				{
					type = tweakbones
					id = tweakbonesnode
					[
						{
							type = partialswitch
							state = on
							[
								{
									type = modulate
									id = vocal_face_mod
									strength = 1
									[
										{
											type = degenerateblend
											id = face
										}
									]
								}
								{
									type = partialswitch
									state = off
									id = moment_blend
									[
										{
											type = degenerateblend
											id = moment_branch
										}
										{
											type = degenerateblend
											id = body
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
	type = applyheeldifference
	id = heel
	[
		{
			type = ik
			two_bone_chains = drummer_ik_params
			id = ik
			[
				{
					type = applydifference
					[
						{
							type = modulate
							id = femalediff
							strength = 0.0
							[
								{
									type = source
									anim = gh_rocker_female_drummer_d
								}
							]
						}
						{
							type = tweakbones
							id = tweakbonesnode
							[
								{
									type = partialswitch
									state = on
									[
										{
											type = degenerateblend
											id = face
										}
										{
											type = partialswitch
											state = off
											id = faceoff_blend
											[
												{
													type = degenerateblend
													id = faceoff_branch
												}
												{
													type = applydrumkitdifference
													id = drumkit
													drum_kit_channel_list = $drum_kit_channel_list
													[
														{
															type = partialswitch
															state = off
															id = moment_blend
															[
																{
																	type = degenerateblend
																	id = moment_branch
																}
																{
																	type = degenerateblend
																	id = body
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
0x81b50002 = {
	type = applyheeldifference
	id = heel
	[
		{
			type = ik
			two_bone_chains = 0x288fcdf4
			id = ik
			[
				{
					type = applydifference
					[
						{
							type = modulate
							id = femalediff
							strength = 0.0
							[
								{
									type = source
									anim = gh_rocker_female_drummer_d
								}
							]
						}
						{
							type = tweakbones
							id = tweakbonesnode
							[
								{
									type = partialswitch
									state = on
									[
										{
											type = degenerateblend
											id = face
										}
										{
											type = partialswitch
											state = off
											id = faceoff_blend
											[
												{
													type = degenerateblend
													id = faceoff_branch
												}
												{
													type = applydrumkitdifference
													id = drumkit
													drum_kit_channel_list = $drum_kit_channel_list
													[
														{
															type = partialswitch
															state = off
															id = moment_blend
															[
																{
																	type = degenerateblend
																	id = moment_branch
																}
																{
																	type = degenerateblend
																	id = body
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
	anim = anim_name
	speed = speed
	start = start
	end = end
	skip_beats = skip_beats
	tempo_anim = tempo_anim
	anim_events = on
	[
		{
			type = source_type
			anim = anim_name
		}
	]
}
hero_cymbal_branch = {
	type = play
	id = cymbal_timer_id
	anim = cymbal_anim
	[
		{
			type = source
			anim = cymbal_anim
		}
	]
}
drum_kit_channel_list = [
	{
		name = tom_1
		bones = [
			bone_mic_adjust_height
		]
	}
	{
		name = tom_2
		bones = [
			bone_mic_adjust_angle
		]
	}
	{
		name = snare
		bones = [
			bone_mic_stand
		]
	}
	{
		name = cymbal_hh
		bones = [
			bone_guitar_string_3
			bone_guitar_string_4
		]
	}
	{
		name = cymbal_1
		bones = [
			bone_ik_hand_guitar_l
		]
	}
	{
		name = cymbal_2
		bones = [
			bone_ik_hand_guitar_r
		]
	}
	{
		name = cymbal_3
		bones = [
			bone_guitar_string_1
		]
	}
	{
		name = kick
		bones = [
			bone_toe_r
			bone_ik_foot_slave_r
			bone_mic_adjust_height
			bone_mic_adjust_angle
			bone_mic_microphone
		]
	}
]
empty_ik_params = [
]
car_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.1483, 0.0, 0.98889995)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (-0.1483, 0.0, 0.98889995)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
0x8a91d5fc = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_r
		newtarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.1, -0.9949869)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_l
		newtarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.1483, 0.0, 0.98889995)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (-0.1483, 0.0, 0.98889995)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
hero_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_r
		newtarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_guitar_l
		newtarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.1483, 0.0, 0.98889995)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (-0.1483, 0.0, 0.98889995)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
singer_ik_params_arms = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.1483, 0.0, 0.98889995)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (-0.1483, 0.0, 0.98889995)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
drummer_ik_params = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.447, 0.0, 0.894)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (-0.3511, 0.0, 0.9362999)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_r
	}
]
0x288fcdf4 = [
	{
		bone0 = bone_bicep_r
		bone1 = bone_forearm_r
		bone2 = bone_palm_r
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_r
		stretch = 1.0
	}
	{
		bone0 = bone_bicep_l
		bone1 = bone_forearm_l
		bone2 = bone_palm_l
		hingeaxis = (0.0, 0.0, -1.0)
		cosmaxhingeangle = -0.96999997
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_hand_slave_l
		stretch = 1.0
	}
	{
		bone0 = bone_thigh_l
		bone1 = bone_knee_l
		bone2 = bone_ankle_l
		hingeaxis = (0.0, 0.0, 1.0)
		cosmaxhingeangle = -0.98999995
		cosminhingeangle = 0.96999997
		bonetarget = bone_ik_foot_slave_l
	}
	{
		bone0 = bone_thigh_r
		bone1 = bone_knee_r
		bone2 = bone_ankle_r
		hingeaxis = (-0.65000004, 0.0, 0.7599)
		cosmaxhingeangle = -0.78999996
		cosminhingeangle = 0.77
		bonetarget = bone_ik_foot_slave_r
	}
]

script ps2_get_musician_context_data 
	switch (<name>)
		case guitarist
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
		case drummer
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
0xf0013d4c = 1

script 0x9d143d55 
	printf \{qs(0x960d5626)}
	change \{0xf0013d4c = 1}
	0x3f7d7f1b \{enabled = 1}
endscript

script 0x0bd5cb7f 
	printf \{qs(0x4931c2f5)}
	change \{0xf0013d4c = 0}
	0x3f7d7f1b \{enabled = 0}
endscript

script 0x5d519a4b 
	return \{enabled = $0xf0013d4c}
endscript
