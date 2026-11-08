gender_create_script_done = 0

script ui_create_create_character_gender 
	change \{gender_create_script_done = 0}
	change \{Achievements_creating_character = 1}
	KillSkaterCamAnim \{all}
	cas_set_object_node_pos player = ($cas_current_player) node = Z_SoundCheck_TRG_Waypoint_CAR_Start
	make_generic_menu \{title = qs("Select Gender")
		vmenu_id = create_create_character_gender_vmenu
		pad_back_script = exit_gender_cleanup}
	ResolveBodySpecificPartInAppearance \{part = CAS_Body}
	current_part = 0
	GetArraySize ($CAS_Body)
	i = 0
	begin
	get_part_current_desc_id \{part = CAS_Body}
	if GotParam \{current_desc_id}
		if (((($CAS_Body) [<i>]).desc_id) = <current_desc_id>)
			current_part = <i>
		endif
	endif
	if cas_item_is_visible part = CAS_Body part_index = <i>
		add_generic_menu_icon_item {
			icon = ((($CAS_Body) [<i>]).icon)
			text = ((($CAS_Body) [<i>]).frontend_desc)
			choose_state = UIstate_create_character_genre
			additional_focus_script = cas_gender_focus_change
			additional_focus_params = {part = CAS_Body new_desc_id = (($CAS_Body) [<i>].desc_id) price = (($CAS_Body) [<i>].price)}
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
	menu_finish \{no_rotate_zoom_text}
	LaunchEvent type = focus target = create_create_character_gender_vmenu data = {child_index = <current_part>}
	change \{gender_create_script_done = 1}
	cas_get_is_female player = ($cas_current_player)
	change cas_current_is_female = <is_female>
endscript

script ui_destroy_create_character_gender 
	destroy_generic_menu
endscript

script ui_deinit_create_character_gender 
	KillSpawnedScript \{name = random_character_throttled_spawned}
endscript

script exit_gender_cleanup 
	KillSpawnedScript \{name = random_character_throttled_spawned}
	destroy_generic_menu
	if Is_ui_event_running
		return \{false}
	endif
	if ($cas_heap_state = in_game)
		ScriptAssert \{'Should in in_cas heap state!'}
	endif
	cas_free_resources \{no_fix_camera}
	exit_discard_changes
	change \{cas_current_savegame = -1}
	change \{cas_current_profile = none}
endscript

script cas_gender_focus_change 
	if ($gender_create_script_done = 0)
		return
	endif
	if (<new_desc_id> = GH4_CAR_Female)
		change \{cas_current_is_female = 1}
	else
		change \{cas_current_is_female = 0}
	endif
	generate_random_genre
	random_character_throttled is_female = ($cas_current_is_female) genre = <genre>
endscript

script cas_gender_rerandomize 
	generate_random_genre
	random_character_throttled is_female = ($cas_current_is_female) genre = <genre>
endscript

script random_character_throttled 
	if ScriptIsRunning \{random_character_throttled_spawned}
		do_wait = 1
	endif
	KillSpawnedScript \{name = random_character_throttled_spawned}
	spawnscriptnow random_character_throttled_spawned params = <...>
endscript

script random_character_throttled_spawned 
	if GotParam \{do_wait}
		Wait \{5
			gameframes}
	endif
	wanted_is_female = <is_female>
	cas_get_is_female player = ($cas_current_player)
	if (<wanted_is_female> = <is_female>)
		generate_random_appearance is_female = <is_female> genre = <genre> new_car_character
		cas_queue_add_request appearance = ($cas_current_appearance) player = ($cas_current_player) in_cas
	else
		cas_change_current_character_gender is_female = <wanted_is_female>
	endif
	cas_queue_wait
	if GotParam \{Anim}
		if GetCurrentCASObject
			Band_PlayAnim name = <cas_object> Anim = <Anim> no_wait
		endif
	endif
	Wait \{5
		gameframes}
endscript
