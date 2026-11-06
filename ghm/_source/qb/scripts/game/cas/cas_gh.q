max_num_create_a_rockers = 8
max_num_instrument_saves = 8
max_num_logo_saves = 10
cas_current_player = 1
cas_current_player_name = cas_player1
cas_editing_new_character = false
charselect_previous_character_id = judy
cas_node_name = z_soundcheck_trg_waypoint_car_start
cas_empty_heap_score = 0.25

script get_section_index_from_desc_id 
	requireparams \{[
			part
			target_desc_id
		]
		all}
	if NOT getcasappearancepart part = <part>
		scriptassert '%s not found' s = <part> donotresolve
	endif
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		scriptassert '%s %t not found' s = <part> t = <desc_id>
	endif
	if gotparam \{sections}
		getarraysize \{sections}
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
	requireparams \{[
			deform_bones
			group_name
		]
		all}
	getarraysize <deform_bones> globalarray
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
	setcasappearancebones part = <part> bones = {}
	updatecurrentcasmodel \{buildscript = reskin_model_from_appearance}
endscript

script reset_additional_bone_deform_info 
	setcasappearanceadditionalbones part = <part> additional_bone_transforms = []
	updatecurrentcasmodel \{buildscript = reskin_model_from_appearance}
endscript

script exit_to_customize_character 
	ui_event \{event = menu_change
		data = {
			state = uistate_customize_character
		}}
endscript

script verify_genre_data 
	if cd
		foreachin \{$master_editable_list
			do = verify_genre_data_foreach}
	endif
endscript

script verify_genre_data_foreach 
	if globalexists name = <part> type = array
		foreachin ($<part>) do = verify_genre_data_foreach_part
	endif
endscript

script verify_genre_data_foreach_part 
	if gotparam \{genre}
		if NOT isarray (<genre>)
			softassert 'CAS Piece %d\'s genre parameter must be an array, using [ and ]' d = <desc_id>
		else
			foreachin <genre> do = verify_genre_data_foreach_part_genre params = {piece = <desc_id>}
		endif
	endif
endscript

script verify_genre_data_foreach_part_genre 
	if (<checksum> = any)
		scriptassert \{'Cannot use the :any: genre on CAS pieces'}
	endif
	verify_genre genre = <checksum> piece = <piece>
endscript

script verify_genre 
	i = 0
	getarraysize ($genre_list)
	begin
	if (((($genre_list) [<i>]).desc_id) = <genre>)
		found = 1
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if NOT gotparam \{found}
		if NOT gotparam \{piece}
			piece = none
		endif
		softassert '%p - Genre %g not found. Should match something in the cas_common_arrays.q list' p = <piece> g = <genre> donotresolve
	endif
endscript

script create_cas_cache_pak \{heap = heap_cas}
	if NOT compositeobjectexists \{name = global_cas_cache}
		createcompositeobject \{components = [
				{
					component = modelbuilder
					create_cache
				}
			]
			params = {
				name = global_cas_cache
			}}
		global_cas_cache :modelbuilder_createdynamicpak heap = <heap> size = <size> vram_size = <vram_size>
	else
		printf \{'Global CAS Cache already exists'}
	endif
endscript

script free_cas_cache_pak 
	if compositeobjectexists \{name = global_cas_cache}
		cascancelloading
		global_cas_cache :die
		flushdeadobjects
	endif
endscript

script cascacheflushvram 
	if compositeobjectexists \{name = global_cas_cache}
		global_cas_cache :modelbuilder_flushdynamicpakvram
	endif
endscript

script cascachemodel async = 0 object_name = ($cas_current_object)
	(<object_name>) :obj_cleargeoms
	if (<async> = 1)
		killspawnedscript \{name = ps2_cas_model_caching}
		spawnscriptlater ps2_cas_model_caching params = {heap = heap_musician1 asset_context = heap_musician1 <...>}
	else
		unloadappearancepaks asset_context = heap_musician1 appearance = <appearance>
		loadappearancepaks appearance = <appearance> heap = heap_musician1 asset_context = heap_musician1
		<callback> {<callbackparams> appearance = <appearance>}
	endif
endscript

script ps2_cas_model_caching 
	wait \{1
		seconds}
	unloadappearancepaks async = 1 <...>
	loadappearancepaks async = 1 <...>
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
	if compositeobjectexists \{name = global_cas_cache}
		global_cas_cache :modelbuilder_dumpdynamicpak
	endif
endscript

script cas_artist_flush 
	if cd
		if casartist
			if NOT ($cas_heap_state = in_game)
				stars
				printf \{'******* cas_artist_flush ********'}
				stars
				flush_cas_cache
				cas_rawpak_clear
				disablecasarchive
				cascancelloading
				casblockforcomposite
				casblockforloading
				cas_queue_wait
				getcurrentcasobject
				<cas_object> :obj_cleargeoms
				finishrendering
				<cas_object> :modelbuilder_unload
				rebuildcurrentcasmodel
			endif
		else
			stars
			printf \{'cas_artist=1 must be set in your personal.q file'}
			stars
		endif
	endif
endscript

script cas_edit_character_profile 
	requireparams \{[
			character_id
			savegame
		]
		all}
	change \{cas_current_instrument = none}
	get_musician_profile_struct_by_id id = <character_id> savegame = <savegame>
	setcasappearance appearance = (<profile_struct>.appearance)
	change cas_current_profile = <character_id>
	change cas_current_savegame = <savegame>
endscript

script cas_get_player_status 
	<player_status> = ($0x2994109a [$cas_current_player])
	return player_status = <player_status>
endscript

script cas_print_player_status 
	cas_get_player_status
	printstruct ($<player_status>.character_id)
endscript

script cas_fix_cameras_for_game 
	killcamanim \{all}
	destroy_bg_viewport
	setup_bg_viewport
	restore_dummy_bg_camera
endscript

script cas_load_and_setup_resources 
	mark_unsafe_for_shutdown
	caswaitforunloads \{block}
	finishrendering
	if NOT ((gotparam album_art) || (gotparam band_logo))
		getpakmancurrent \{map = zones}
		if checksumequals a = <pak> b = z_soundcheck
			if ($autolaunch_cas_artist = 1)
				setpakmancurrentblock \{map = zones
					pak = z_objviewer_cas
					block_scripts = 1}
				lightshow_initeventmappings \{force_pakname = 'z_objviewer'}
				lightshow_dummyloop
			else
				setpakmancurrentblock \{map = zones
					pak = z_soundcheck_cas
					block_scripts = 1}
			endif
		else
			scriptassert \{'Should be in z_soundcheck here!'}
		endif
		set_cas_heap_state \{state = in_cas}
	endif
	setshadowrenderingflags \{enable = 'true'
		object = 'skin'}
	setshadowmapparams \{far = 16.0}
	if NOT gotparam \{no_cam}
		destroy_bg_viewport
		setup_bg_viewport
		restore_dummy_bg_camera
		if NOT gotparam \{album_art}
			playigccam \{id = cas_view_cam_id
				name = cas_view_cam
				viewport = bg_viewport
				lockto = world
				pos = (2.028921, 0.879576, -0.059630997)
				quat = (-0.000911, 0.9990699, 0.027344998)
				fov = 72.0
				play_hold = 1
				interrupt_current}
		else
			playigccam \{id = cas_view_cam_id
				name = cas_view_cam
				viewport = bg_viewport
				lockto = world
				pos = (-0.536864, 2.1043458, 15.148574)
				quat = (0.0052940003, 0.02768, -0.000218)
				fov = 72.0
				play_hold = 1
				interrupt_current}
		endif
	endif
	if NOT ((gotparam album_art) || (gotparam band_logo))
		cas_rawpak_setup
	endif
	mark_safe_for_shutdown
endscript

script cas_free_resources \{block_scripts = 0}
	setscriptcannotpause
	mark_unsafe_for_shutdown
	finishrendering
	casblockforloading
	killallcompositetextures
	castemporariesflush
	caswaitforunloads \{block}
	cas_rawpak_free
	set_cas_heap_state \{state = in_game}
	if NOT gotparam \{album_art}
		if NOT gotparam \{band_logo}
			setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = <block_scripts>
		endif
	endif
	if ($shutdown_game_for_signin_change_flag = 0)
		printf \{'cas_free_resources - destroy_loading_screen'}
		if NOT pakfilesarecached
			destroy_loading_screen
		endif
	endif
	if NOT gotparam \{no_fix_camera}
		cas_fix_cameras_for_game
	endif
	mark_safe_for_shutdown
	change \{cas_free_cam_active = 0}
endscript

script refreshcasprofile 
	if not cd
		return
	endif
	if NOT casartist
		stars
		printf \{'cas_artist=1 must be set in your personal.q file'}
		stars
		return
	endif
	if ($cas_heap_state = in_game)
		printf \{'Only works in CAS'}
	endif
	if NOT getcurrentcasobject
		printf \{'Only works in CAS'}
	endif
	cas_queue_new_character_profile id = ($cas_current_profile) player = ($cas_current_player) savegame = ($cas_current_savegame)
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	setcasappearance appearance = (<profile_struct>.appearance)
endscript

script createassetstoragefrombudgetblock 
	if NOT gotparam \{slopheap}
		slopheap = <name>
	endif
	if NOT gotparam \{assetcontext}
		assetcontext = <name>
	endif
	cassetupassetstorage name = <name> params = {
		allocator = budget
		blockname = <name>
		assetcontext = <assetcontext>
		slopheap = <slopheap>
	}
endscript

script set_new_car_preset_physique 
	if NOT getcasappearancepart \{part = cas_physique}
		scriptassert \{'%s not found'
			s = cas_physique}
	endif
	if NOT getactualcasoptionstruct part = cas_physique desc_id = <desc_id>
		scriptassert '%s %t not found' s = cas_physique t = <desc_id>
	endif
	if NOT gotparam \{preset_builds}
		scriptassert \{'preset_builds not found'}
	endif
	if NOT gotparam \{default_car_preset_build_index}
		scriptassert \{'default_car_preset_build_index not found'}
	endif
	chosen = (<preset_builds> [<default_car_preset_build_index>])
	setcasappearanceadditionalbones part = cas_physique additional_bone_transforms = (<chosen>.additional_bone_transforms)
	return preset_physique_index = <default_car_preset_build_index>
endscript

script generate_random_appearance 
	requireparams \{[
			is_female
			genre
		]}
	if gotparam \{new_car_character}
		if (<is_female> = 1)
			change cas_current_appearance = ($default_custom_musician_profile_female.appearance)
		else
			change cas_current_appearance = ($default_custom_musician_profile_male.appearance)
		endif
		set_new_car_preset_physique
		new_car_character_flag = {new_car_character random_instruments from_car}
	endif
	cas_set_random_appearance genre = <genre> <new_car_character_flag>
endscript

script generate_random_name 
	requireparams \{[
			is_female
		]}
	if (<is_female> = 1)
		getrandomarrayelement ($gh_random_car_female_names)
	else
		getrandomarrayelement ($gh_random_car_male_names)
	endif
	return random_name = <element>
endscript

script generate_random_genre 
	takeaway = 2
	if gotparam \{allow_mixed}
		takeaway = 1
	endif
	getarraysize \{$genre_list}
	getrandomvalue a = 0 b = (<array_size> - <takeaway>) name = genre_index integer
	return genre = ($genre_list [<genre_index>].desc_id)
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
	cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player)
endscript

script ui_load_cas_rawpak \{async = 1}
	return
endscript

script cas_soak_test 
	randomize \{1980}
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
				wait <frames> gameframes
			endif
			cascancelloading
		endif
		frames = Random (@ 0 @ 1 @ 2 )
		if (<frames> > 0)
			wait <frames> gameframes
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	repeat 100
endscript
highway_instrument_map = {
	guitar = cas_guitar_highway
	bass = cas_bass_highway
	drum = cas_drums_highway
}

script get_highway_struct_from_appearance 
	if structurecontains structure = ($highway_instrument_map) <part>
		highway_part = ($highway_instrument_map.<part>)
		printf 'Highway part is %s' s = <highway_part> donotresolve
		if structurecontains structure = <appearance> <highway_part>
			getactualcasoptionstruct part = <highway_part> desc_id = (<appearance>.<highway_part>.desc_id)
		else
			getactualcasoptionstruct part = <highway_part> desc_id = axelhighway
		endif
		return true frontend_img = <frontend_img> highway_pak = <highway_pak> highway_texture = <highway_texture>
	else
		printf 'Part %s not found in highway->inst map' s = <part> donotresolve
		return \{false}
	endif
endscript

script cas_free_resources_camera_fix 
	if scriptisrunning \{cas_free_resources}
		begin
		if NOT scriptisrunning \{cas_free_resources}
			break
		endif
		wait \{1
			gameframe}
		repeat
		spawnscriptnow task_menu_default_anim_in params = {base_name = <base_name>}
	elseif gotparam \{alwaysfix}
		spawnscriptnow task_menu_default_anim_in params = {base_name = <base_name>}
	endif
endscript

script is_part_editable 
	requireparams \{[
			part
			desc_id
		]
		all}
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if part_has_sections part = <part> desc_id = <desc_id>
		return \{true}
	elseif part_has_materials part = <part> desc_id = <desc_id>
		return \{true}
	else
		if ((gotparam color_all_materials) || (gotparam materials))
			return \{true}
		endif
		return \{false}
	endif
endscript

script part_has_sections 
	requireparams \{[
			part
			desc_id
		]
		all}
	getactualcasoptionstruct part = <part> desc_id = <desc_id>
	if gotparam \{sections}
		return \{true}
	endif
	return \{false}
endscript

script part_has_materials 
	requireparams \{[
			part
			desc_id
		]
		all}
	if NOT getactualcasoptionstruct part = <part> desc_id = <desc_id>
		return \{false}
	endif
	if gotparam \{materials}
		getarraysize <materials>
		if (<array_size> > 0)
			return \{true}
		endif
	else
		if gotparam \{material_groups}
			getarraysize <material_groups>
			if (<array_size> > 0)
				return \{true}
			endif
		else
			if gotparam \{modify_all_materials}
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript
