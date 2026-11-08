debug_allow_modify_preset_characters = 0
has_entered_CAR_before = 1
enter_CAR_with_money = -1

script ui_create_customize_character 
	change \{disallow_band_edit_char_spam = 0}
	change \{rich_presence_context = presence_rockstar_creator}
	set_cas_loading_setup \{setup = single}
	cas_set_object_node_pos player = ($cas_current_player) node = Z_SoundCheck_TRG_Waypoint_CAR_Start
	KillSkaterCamAnim \{all}
	make_generic_menu \{vmenu_id = create_customize_character_vmenu
		pad_back_script = customize_character_save_prompt
		title = qs("Edit Character")
		show_history
		num_icons = 0}
	spawnscriptnow \{generic_menu_animate_in}
	setup_cas_menu_handlers \{vmenu_id = create_customize_character_vmenu
		camera_list = [
			'customize_character_body'
			'customize_character_R'
			'customize_character_B'
			'customize_character_L'
		]
		no_zoom}
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	if is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
		custom_musician = 1
	else
		focusable_flags = {not_focusable}
	endif
	if is_from_singleplayer_hub
		add_generic_menu_icon_item \{text = qs("READY TO ROCK")
			pad_choose_script = return_to_singleplayer_hub
			icon = ready2rock}
	endif
	if English
		icon = icon_name
	elseif German
		icon = icon_name_german
	elseif French
		icon = icon_name_french
	elseif Italian
		icon = icon_name_italian
	elseif Spanish
		icon = icon_name_spanish
	endif
	add_generic_menu_icon_item {
		icon = <icon>
		text = (<profile_struct>.fullname)
		choose_state = UIstate_cas_text_entry
		choose_state_data = {choose_script = name_entry_choose_script text = (<profile_struct>.fullname) num_icons = 1 cam_name = 'customize_character'}
		<focusable_flags>
		text_case = Original
	}
	if ((GotParam custom_musician) || ($debug_allow_modify_preset_characters = 1))
		add_generic_menu_icon_item \{text = qs("HEAD")
			choose_state = UIstate_customize_character_head
			icon = icon_head}
		add_generic_menu_icon_item \{text = qs("BODY")
			choose_state = UIstate_customize_character_body
			icon = icon_body}
		Height = 0
		find_physique_height
		if (<Height> > 0)
			if is_female_char
				hair_cam_name = 'customize_character_hair'
			else
				hair_cam_name = 'customize_character_hair'
			endif
		else
			if is_female_char
				hair_cam_name = 'customize_character_hair'
			else
				hair_cam_name = 'customize_character_hair'
			endif
		endif
		add_generic_menu_icon_item {
			icon = icon_hair
			text = qs("HAIR")
			choose_state = UIstate_popout_select_part
			choose_state_data = {
				text = qs("SELECT HAIR STYLE")
				cam_name = <hair_cam_name>
				camera_list = ['customize_character_hair' 'customize_character_hair_R' 'customize_character_hair_B' 'customize_character_hair_L']
				part = CAS_Hair
				num_icons = 1
				color_wheel = ($hair_colorwheel)
				hist_tex = icon_hair
				is_popup
				stance = Stance_Select_Hair
				only_rotate
			}
		}
	endif
	add_generic_menu_icon_item \{text = qs("OUTFIT")
		choose_state = UIstate_customize_character_outfit
		icon = icon_outfit}
	add_generic_menu_icon_item \{icon = icon_instrument
		text = qs("INSTRUMENT")
		choose_state = UIstate_customize_character_instrument}
	GetCurrentCASObject
	if GotParam \{cas_object}
		BandManager_ChangeStance name = <cas_object> stance = stance_frontend
	endif
	menu_finish \{car_helper_text
		no_zoom_text}
	if is_from_singleplayer_hub
		LaunchEvent \{type = focus
			target = create_customize_character_vmenu
			data = {
				child_index = 0
			}}
	else
		LaunchEvent type = focus target = create_customize_character_vmenu data = {child_index = <selected_index>}
	endif
	if (($has_entered_CAR_before) = 0)
		generic_event_choose \{state = UIstate_helper_dialogue
			data = {
				is_popup
			}}
		change \{has_entered_CAR_before = 1}
	endif
endscript

script ui_return_customize_character 
	menu_finish \{car_helper_text
		no_zoom_text}
endscript

script ui_destroy_customize_character 
	destroy_generic_menu
endscript
start_edit_character = 0

script ui_init_customize_character 
	change \{start_edit_character = 1}
	create_band_money_display
	get_band_money
	if NOT (($enter_CAR_with_money) = -1)
		ScriptAssert \{qs(0x09d1c46e)}
	endif
	change enter_CAR_with_money = <Cash>
endscript

script ui_deinit_customize_character 
	change \{start_edit_character = 0}
	if ($cas_heap_state = in_game)
		ScriptAssert \{'Should in in_cas heap state!'}
	endif
	if ($shutdown_game_for_signin_change_flag = 1)
		cas_free_resources \{spawn
			block_scripts = 1
			no_fix_camera}
	else
		spawnscriptnow \{cas_free_resources
			no_fix_camera}
	endif
	destroy_band_money_display
	change \{cas_current_savegame = -1}
	change \{cas_current_profile = none}
	change \{enter_CAR_with_money = -1}
endscript

script name_entry_choose_script 
	modify_custom_profile_fullname id = ($cas_current_profile) fullname = <text> savegame = ($cas_current_savegame)
	ui_event \{event = menu_back}
endscript

script get_genre_name 
	GetArraySize ($Genre_List)
	i = 0
	begin
	if ((($Genre_List) [<i>].desc_id) = <genre>)
		return genre_name = (($Genre_List) [<i>].frontend_desc)
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script ui_return 
	ui_event \{event = menu_back}
endscript

script customize_character_save_prompt 
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	struct1 = (<profile_struct>.appearance)
	struct2 = ($cas_current_appearance)
	if (($cas_editing_new_character) = false && CompareStructs struct1 = <struct1> struct2 = <struct2>)
		exit_discard_changes \{no_changes}
	else
		ui_event \{event = menu_change
			data = {
				state = UIstate_save_changes_dialogue
				is_popup
			}}
	endif
endscript

script is_from_singleplayer_hub 
	ui_event_get_stack
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'singleplayer_character_hub')
		return \{true}
	endif
	i = (<i> + 1)
	repeat <stack_size>
	return \{false}
endscript

script return_to_singleplayer_hub 
	get_musician_profile_struct_by_id id = ($cas_current_profile) savegame = ($cas_current_savegame)
	change \{first_character_hub_enter = 0}
	struct1 = (<profile_struct>.appearance)
	struct2 = ($cas_current_appearance)
	if (($cas_editing_new_character) = false && CompareStructs struct1 = <struct1> struct2 = <struct2>)
		exit_skip_save
	else
		cas_get_player_status
		if isXenon
			if CheckForSignIn local controller_index = ($<player_status>.controller)
				exit_save_changes
			else
				exit_skip_save
			endif
		else
			exit_save_changes
		endif
	endif
endscript
