max_num_create_a_rockers = 8
max_num_instrument_saves = 8
max_num_logo_saves = 10
cas_current_player = 1
cas_current_player_name = cas_player1
cas_editing_new_character = false
charselect_previous_character_id = judy
CAS_node_name = Z_SoundCheck_TRG_Waypoint_CAR_Start
cas_empty_heap_score = 0.25

script get_section_index_from_desc_id 
	RequireParams \{[
			part
			target_desc_id
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{sections}
		GetArraySize \{sections}
		i = 0
		begin
		if ((<sections> [<i>].desc_id) = <target_desc_id>)
			return section_index = <i>
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script find_bone_deform_info 
	RequireParams \{[
			deform_bones
			group_name
		]
		all}
	GetArraySize <deform_bones> GlobalArray
	i = 0
	begin
	if (((($<deform_bones>) [<i>]).group_name) = <group_name>)
		return true bone_deform_info = (($<deform_bones>) [<i>])
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script reset_bone_deform_info 
	SetCASAppearanceBones part = <part> bones = {}
	UpdateCurrentCASModel \{buildScript = reskin_model_from_appearance}
endscript

script reset_additional_bone_deform_info 
	SetCASAppearanceAdditionalBones part = <part> additional_bone_transforms = []
	UpdateCurrentCASModel \{buildScript = reskin_model_from_appearance}
endscript

script exit_to_customize_character 
	ui_event \{event = menu_change
		data = {
			state = UIstate_customize_character
		}}
endscript

script verify_genre_data 
	if NOT CD
		ForEachIn \{$master_editable_list
			do = verify_genre_data_foreach}
	endif
endscript

script verify_genre_data_foreach 
	if GlobalExists name = <part> type = array
		ForEachIn ($<part>) do = verify_genre_data_foreach_part
	endif
endscript

script verify_genre_data_foreach_part 
	if GotParam \{genre}
		if NOT IsArray (<genre>)
			SoftAssert 'CAS Piece %d\'s genre parameter must be an array, using [ and ]' d = <desc_id>
		else
			ForEachIn <genre> do = verify_genre_data_foreach_part_genre params = {piece = <desc_id>}
		endif
	endif
endscript

script verify_genre_data_foreach_part_genre 
	if (<checksum> = any)
		ScriptAssert \{'Cannot use the :any: genre on CAS pieces'}
	endif
	verify_genre genre = <checksum> piece = <piece>
endscript

script verify_genre 
	i = 0
	GetArraySize ($Genre_List)
	begin
	if (((($Genre_List) [<i>]).desc_id) = <genre>)
		found = 1
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if NOT GotParam \{found}
		if NOT GotParam \{piece}
			piece = none
		endif
		SoftAssert '%p - Genre %g not found. Should match something in the cas_common_arrays.q list' p = <piece> g = <genre> DoNotResolve
	endif
endscript

script create_cas_cache_pak \{heap = heap_cas}
	if NOT CompositeObjectExists \{name = Global_Cas_Cache}
		CreateCompositeObject \{Components = [
				{
					Component = ModelBuilder
					create_cache
				}
			]
			params = {
				name = Global_Cas_Cache
			}}
		Global_Cas_Cache :ModelBuilder_CreateDynamicPak heap = <heap> size = <size> vram_size = <vram_size>
	else
		printf \{'Global CAS Cache already exists'}
	endif
endscript

script free_cas_cache_pak 
	if CompositeObjectExists \{name = Global_Cas_Cache}
		CasCancelLoading
		Global_Cas_Cache :Die
		FlushDeadObjects
	endif
endscript

script CASCacheFlushVRAM 
	if CompositeObjectExists \{name = Global_Cas_Cache}
		Global_Cas_Cache :ModelBuilder_FlushDynamicPakVRAM
	endif
endscript

script CASCacheModel async = 0 object_name = ($cas_current_object)
	(<object_name>) :Obj_ClearGeoms
	if (<async> = 1)
		KillSpawnedScript \{name = ps2_cas_model_caching}
		SpawnScriptLater ps2_cas_model_caching params = {heap = heap_musician1 asset_context = heap_musician1 <...>}
	else
		UnloadAppearancePaks asset_context = heap_musician1 appearance = <appearance>
		LoadAppearancePaks appearance = <appearance> heap = heap_musician1 asset_context = heap_musician1
		<callback> {<callbackparams> appearance = <appearance>}
	endif
endscript

script ps2_cas_model_caching 
	Wait \{1
		seconds}
	UnloadAppearancePaks async = 1 <...>
	LoadAppearancePaks async = 1 <...>
	<callback> {<callbackparams> appearance = <appearance>}
endscript

script flush_cas_cache 
	get_heap_sizes
	free_cas_cache_pak
	if ($cas_heap_state = in_game)
		create_cas_cache_pak size = <cas_cache_size> vram_size = <cas_cache_size_vram>
	else
		create_cas_cache_pak size = <cas_cache_size_in_cas> vram_size = <cas_cache_size_vram_in_cas>
	endif
endscript

script dump_cas_cache 
	if CompositeObjectExists \{name = Global_Cas_Cache}
		Global_Cas_Cache :ModelBuilder_DumpDynamicPak
	endif
endscript

script cas_artist_flush 
	if NOT CD
		if CasArtist
			if NOT ($cas_heap_state = in_game)
				stars
				printf \{'******* cas_artist_flush ********'}
				stars
				flush_cas_cache
				cas_rawpak_clear
				DisableCASArchive
				CasCancelLoading
				CasBlockForComposite
				CASBlockForLoading
				cas_queue_wait
				GetCurrentCASObject
				<cas_object> :Obj_ClearGeoms
				FinishRendering
				<cas_object> :ModelBuilder_Unload
				RebuildCurrentCASModel
			endif
		else
			stars
			printf \{'cas_artist=1 must be set in your personal.q file'}
			stars
		endif
	endif
endscript

script cas_edit_character_profile 
	RequireParams \{[
			character_id
			savegame
		]
		all}
	change \{cas_current_instrument = none}
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	SetCASAppearance appearance = (<profile_struct>.appearance)
	change cas_current_profile = <character_id>
	change cas_current_savegame = <savegame>
endscript

script cas_get_player_status 
	FormatText checksumname = player_status 'player%d_status' d = ($cas_current_player)
	return player_status = <player_status>
endscript

script cas_print_player_status 
	cas_get_player_status
	printstruct ($<player_status>.character_id)
endscript

script cas_fix_cameras_for_game 
	KillCamAnim \{all}
	destroy_bg_viewport
	setup_bg_viewport
	restore_dummy_bg_camera
endscript

script cas_load_and_setup_resources 
	mark_unsafe_for_shutdown
	CASWaitForUnloads \{Block}
	FinishRendering
	if NOT ((GotParam album_art) || (GotParam band_logo))
		GetPakManCurrent \{map = zones}
		if ChecksumEquals a = <pak> b = z_soundcheck
			SetPakManCurrentBlock \{map = zones
				pak = z_soundcheck_cas
				block_scripts = 1}
		else
			ScriptAssert \{'Should be in z_soundcheck here!'}
		endif
		set_cas_heap_state \{state = in_cas}
	endif
	SetShadowRenderingFlags \{enable = 'true'
		object = 'skin'}
	SetShadowMapParams \{far = 16.0}
	if NOT GotParam \{no_cam}
		destroy_bg_viewport
		setup_bg_viewport
		restore_dummy_bg_camera
		if NOT GotParam \{album_art}
			PlayIGCCam \{id = cas_view_cam_id
				name = cas_view_cam
				viewport = bg_viewport
				LockTo = world
				pos = (2.028921, 0.879576, -0.059630997)
				Quat = (-0.000911, 0.9990699, 0.027344998)
				FOV = 72.0
				Play_hold = 1
				interrupt_current}
		else
			PlayIGCCam \{id = cas_view_cam_id
				name = cas_view_cam
				viewport = bg_viewport
				LockTo = world
				pos = (-0.536864, 2.1043458, 15.148574)
				Quat = (0.0052940003, 0.02768, -0.000218)
				FOV = 72.0
				Play_hold = 1
				interrupt_current}
		endif
	endif
	if NOT ((GotParam album_art) || (GotParam band_logo))
		cas_rawpak_setup
	endif
	mark_safe_for_shutdown
endscript

script cas_free_resources \{block_scripts = 0}
	mark_unsafe_for_shutdown
	FinishRendering
	CASBlockForLoading
	KillAllCompositeTextures
	CASTemporariesFlush
	CASWaitForUnloads \{Block}
	cas_rawpak_free
	set_cas_heap_state \{state = in_game}
	if NOT GotParam \{album_art}
		if NOT GotParam \{band_logo}
			SetPakManCurrentBlock map = zones pak = z_soundcheck block_scripts = <block_scripts>
		endif
	endif
	if ($shutdown_game_for_signin_change_flag = 0)
		printf \{'cas_free_resources - destroy_loading_screen'}
		destroy_loading_screen
	endif
	if NOT GotParam \{no_fix_camera}
		cas_fix_cameras_for_game
	endif
	mark_safe_for_shutdown
	change \{cas_free_cam_active = 0}
endscript

script RefreshCASProfile 
	if CD
		return
	endif
	if NOT CasArtist
		stars
		printf \{'cas_artist=1 must be set in your personal.q file'}
		stars
		return
	endif
	if ($cas_heap_state = in_game)
		printf \{'Only works in CAS'}
	endif
	if NOT GetCurrentCASObject
		printf \{'Only works in CAS'}
	endif
	cas_queue_new_character_profile id = ($cas_current_profile) player = ($cas_current_player) savegame = ($cas_current_savegame)
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	SetCASAppearance appearance = (<profile_struct>.appearance)
endscript

script CreateAssetStorageFromBudgetBlock 
	if NOT GotParam \{slopheap}
		slopheap = <name>
	endif
	if NOT GotParam \{assetcontext}
		assetcontext = <name>
	endif
	CASSetupAssetStorage name = <name> params = {
		Allocator = Budget
		blockname = <name>
		assetcontext = <assetcontext>
		slopheap = <slopheap>
	}
endscript

script generate_random_appearance 
	RequireParams \{[
			is_female
			genre
		]}
	if GotParam \{new_car_character}
		if (<is_female> = 1)
			change cas_current_appearance = ($default_custom_musician_profile_female.appearance)
		else
			change cas_current_appearance = ($default_custom_musician_profile_male.appearance)
		endif
		new_car_character_flag = {new_car_character random_instruments}
	endif
	cas_set_random_appearance genre = <genre> <new_car_character_flag>
endscript

script generate_random_name 
	RequireParams \{[
			is_female
		]}
	if (<is_female> = 1)
		GetRandomArrayElement ($gh_random_car_female_names)
	else
		GetRandomArrayElement ($gh_random_car_male_names)
	endif
	return random_name = <element>
endscript

script generate_random_genre 
	takeaway = 2
	if GotParam \{allow_mixed}
		takeaway = 1
	endif
	GetArraySize \{$Genre_List}
	GetRandomValue a = 0 b = (<array_size> - <takeaway>) name = genre_index Integer
	return genre = ($Genre_List [<genre_index>].desc_id)
endscript

script cas_change_current_character_gender 
	genre = (($cas_current_appearance).genre)
	generate_random_name is_female = <is_female>
	generate_random_appearance is_female = <is_female> genre = <genre> new_car_character
	modify_custom_profile_fullname id = ($cas_current_profile) fullname = <random_name> savegame = ($cas_current_savegame)
	if (is_female = 0)
		modify_custom_profile_blurb id = ($cas_current_profile) savegame = ($cas_current_savegame) blurb = (($default_custom_musician_profile_male).blurb)
	else
		modify_custom_profile_blurb id = ($cas_current_profile) savegame = ($cas_current_savegame) blurb = (($default_custom_musician_profile_female).blurb)
	endif
	cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) in_cas
endscript

script ui_load_cas_rawpak \{async = 1}
	return
endscript

script cas_soak_test 
	Randomize \{1980}
	begin
	get_musician_profile_size \{savegame = 0}
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = 0
	this_id = (<profile_struct>.name)
	if is_selectable_profile profile_struct = <profile_struct>
		cas_queue_new_character_profile player = RandomInteger (1.0, 4.0) id = <this_id> savegame = 0
		if (RandomInteger (0.0, 5.0) = 0)
			cas_queue_wait
		else
			if (RandomInteger (0.0, 3.0) > 0)
				frames = Random (@ 1 @ 5 @ 40 @ 100 )
				Wait <frames> gameframes
			endif
			CasCancelLoading
		endif
		frames = Random (@ 0 @ 1 @ 2 )
		if (<frames> > 0)
			Wait <frames> gameframes
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	repeat 100
endscript
Highway_Instrument_map = {
	guitar = CAS_Guitar_Highway
	Bass = CAS_Bass_Highway
	drum = CAS_Drums_Highway
}

script get_highway_struct_from_appearance 
	if StructureContains Structure = ($Highway_Instrument_map) <part>
		highway_part = ($Highway_Instrument_map.<part>)
		printf 'Highway part is %s' s = <highway_part> DoNotResolve
		if StructureContains Structure = <appearance> <highway_part>
			GetActualCASOptionStruct part = <highway_part> desc_id = (<appearance>.<highway_part>.desc_id)
		else
			GetActualCASOptionStruct part = <highway_part> desc_id = AxelHighway
		endif
		return true frontend_img = <frontend_img> highway_pak = <highway_pak> highway_texture = <highway_texture>
	else
		printf 'Part %s not found in highway->inst map' s = <part> DoNotResolve
		return \{false}
	endif
endscript

script cas_free_resources_camera_fix 
	if ScriptIsRunning \{cas_free_resources}
		begin
		if NOT ScriptIsRunning \{cas_free_resources}
			break
		endif
		Wait \{1
			gameframe}
		repeat
		spawnscriptnow task_menu_default_anim_in params = {base_name = <base_name>}
	elseif GotParam \{alwaysfix}
		spawnscriptnow task_menu_default_anim_in params = {base_name = <base_name>}
	endif
endscript

script is_part_editable 
	RequireParams \{[
			part
			desc_id
		]
		all}
	GetActualCASOptionStruct part = <part> desc_id = <desc_id>
	if part_has_sections part = <part> desc_id = <desc_id>
		return \{true}
	elseif part_has_materials part = <part> desc_id = <desc_id>
		return \{true}
	else
		if ((GotParam color_all_materials) || (GotParam materials))
			return \{true}
		endif
		return \{false}
	endif
endscript

script part_has_sections 
	RequireParams \{[
			part
			desc_id
		]
		all}
	GetActualCASOptionStruct part = <part> desc_id = <desc_id>
	if GotParam \{sections}
		return \{true}
	endif
	return \{false}
endscript

script part_has_materials 
	RequireParams \{[
			part
			desc_id
		]
		all}
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	if GotParam \{materials}
		GetArraySize <materials>
		if (<array_size> > 0)
			return \{true}
		endif
	else
		if GotParam \{material_groups}
			GetArraySize <material_groups>
			if (<array_size> > 0)
				return \{true}
			endif
		else
			if GotParam \{modify_all_materials}
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript
