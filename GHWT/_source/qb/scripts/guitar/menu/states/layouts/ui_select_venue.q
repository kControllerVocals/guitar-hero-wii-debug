
script ui_create_select_venue 
	spawnscriptnow ui_create_select_venue_spawned params = {<...>}
endscript

script ui_create_select_venue_spawned 
	RemoveParameter \{base_name}
	if GotParam \{from_gig_board}
		change \{target_menu_camera = 'gigposters_0'}
		wait_for_camera_anim
	endif
	make_generic_menu \{title = qs("Select Venue")
		pad_back_script = ui_event
		pad_back_params = {
			event = menu_back
			data = {
				ignore_camera
			}
		}
		extra_z = 42000
		scrolling}
	GetArraySize \{$LevelZoneArray}
	level_zone_array_size = <array_size>
	index = 0
	begin
	get_LevelZoneArray_checksum index = <index>
	if NOT StructureContains Structure = ($LevelZones.<level_checksum>) debug_only
		get_progression_globals (<progression_flag>)
		FormatText {
			checksumname = venue_checksum
			'%s_%i'
			s = ($LevelZones.<level_checksum>.name)
			i = ($instrument_list.($<tier_global>.part).text_nl)
			AddToStringLookup = true
		}
		GetGlobalTags <venue_checksum> param = unlocked
		printf 'venue_checksum = %v .. unlocked = %u' v = <venue_checksum> u = <unlocked>
		add_venue = 0
		if (<unlocked> = 1)
			add_venue = 1
		endif
		if ($Cheat_UnlockATTBallpark = 1)
			if (<level_checksum> = load_z_Ballpark)
				add_venue = 1
			endif
		endif
		if (<add_venue> = 1)
			add_generic_menu_text_item {
				text = ($LevelZones.<level_checksum>.title)
				pad_choose_script = venue_select_play_song
				pad_choose_params = {<...> selected_level = <level_checksum>}
			}
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	menu_finish
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script ui_destroy_select_venue 
	generic_ui_destroy
endscript

script venue_select_play_song 
	destroy_menu \{menu_id = GigBoardVenueSelectInterface}
	generic_event_choose state = uistate_play_song data = {<...>}
endscript
