
script ui_create_save_changes_dialogue 
	prompt_for_save_or_confirm = save
	cas_get_player_status
	if isXenon
		if NOT CheckForSignIn local controller_index = ($<player_status>.controller)
			prompt_for_save_or_confirm = confirm
		endif
	endif
	GetGlobalTags \{user_options}
	if (<autosave> = 0)
		prompt_for_save_or_confirm = confirm
	endif
	switch <prompt_for_save_or_confirm>
		case save
		confirm_title_text = qs("Save Changes?")
		confirm_option_text = qs("SAVE")
		confirm_func = exit_save_changes
		confirm_dialog_text = qs("Do you want to save the changes made to your appearance? Selecting DISCARD will cause all unsaved appearance changes to be lost.")
		case confirm
		confirm_title_text = qs("Retain Changes?")
		confirm_option_text = qs("RETAIN")
		confirm_func = exit_skip_save
		confirm_dialog_text = qs("Do you want to retain the changes made to your appearance? Selecting DISCARD will cause all unsaved appearance changes to be lost.")
	endswitch
	create_popup_warning_menu {
		title = <confirm_title_text>
		textblock = {
			text = <confirm_dialog_text>
		}
		no_background
		options = [
			{
				func = <confirm_func>
				text = <confirm_option_text>
			}
			{
				func = exit_discard_changes
				text = qs("DISCARD")
			}
			{
				func = generic_event_back
				text = qs("CANCEL")
			}
		]
		popup_event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
			{pad_back generic_event_back}]
	}
	add_user_control_helper \{text = qs("CANCEL")
		button = red
		z = 100000}
endscript

script ui_destroy_save_changes_dialogue 
	destroy_popup_warning_menu
endscript

script exit_save_changes 
	if is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
		cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame)
	endif
	clean_up_menu_history_screen_elements
	GetCASAppearance
	modify_custom_profile_appearance id = ($cas_current_profile) appearance = <appearance> savegame = ($cas_current_savegame)
	cas_get_player_status
	change structurename = <player_status> character_id = ($cas_current_profile)
	if is_from_singleplayer_hub
		SetGlobalTags savegame = ($cas_current_savegame) last_singleplayer_character params = {last_singleplayer_character = ($cas_current_profile)}
	endif
	if ($Achievements_creating_character = 1)
		if ((<appearance>.cas_physique.desc_id) = FemalePhysique)
			Achievements_ROCK_MAIDEN controller = ($primary_controller)
		elseif ((<appearance>.cas_physique.desc_id) = MalePhysique)
			Achievements_WARRIOR_OF_ROCK controller = ($primary_controller)
		endif
	endif
	if ($cas_from_main_menu = 1)
		cas_destroy_all_characters
	endif
	ui_event_get_stack
	data = {savegame = ($cas_current_savegame) requested_autosave = 1}
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'character_hub')
		cas_set_object_node_pos player = ($cas_current_player) node = z_Soundcheck_TRG_Waypoint_Player1_Start
		ui_memcard_autosave_replace event = menu_back state = uistate_character_hub data = <data>
		return
	elseif ((<stack> [<i>].base_name) = 'singleplayer_character_hub')
		cas_set_object_node_pos player = ($cas_current_player) node = z_Soundcheck_TRG_Waypoint_Player1_Start
		ui_memcard_autosave_replace event = menu_back state = UIstate_singleplayer_character_hub data = <data>
		return
	elseif ((<stack> [<i>].base_name) = 'band_mode')
		ui_memcard_autosave_replace event = menu_back state = UIstate_band_mode data = <data>
		return
	endif
	i = (<i> + 1)
	repeat <stack_size>
	printf \{qs("\L#################### exit_save_changes didn't find a state to go back to, go to character selection ####################")}
	ui_memcard_autosave_replace event = menu_back state = uistate_character_selection data = <data>
endscript

script exit_discard_changes 
	clean_up_menu_history_screen_elements
	cas_get_player_status
	if (($cas_editing_new_character) = true)
		cas_destroy_all_characters
		delete_custom_profile id = ($cas_current_profile) savegame = ($cas_current_savegame)
		cas_get_player_status
		if NOT get_musician_profile_struct_by_id dont_assert id = ($charselect_previous_character_id) savegame = ($cas_current_savegame)
			change structurename = <player_status> character_id = axel
		else
			change structurename = <player_status> character_id = ($charselect_previous_character_id)
		endif
	else
		if GotParam \{no_changes}
			if ($cas_from_main_menu = 1)
				cas_destroy_all_characters
			endif
		else
			cas_destroy_all_characters
			cas_queue_new_character_profile id = ($charselect_previous_character_id) player = ($cas_current_player) savegame = ($cas_current_savegame) force_update = 1 hide_old_character = 1
		endif
		change structurename = <player_status> character_id = ($charselect_previous_character_id)
	endif
	ui_event_get_stack
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'character_hub')
		cas_set_object_node_pos player = ($cas_current_player) node = z_Soundcheck_TRG_Waypoint_Player1_Start
		generic_event_back \{state = uistate_character_hub}
		return
	elseif ((<stack> [<i>].base_name) = 'singleplayer_character_hub')
		cas_set_object_node_pos player = ($cas_current_player) node = z_Soundcheck_TRG_Waypoint_Player1_Start
		generic_event_back \{state = UIstate_singleplayer_character_hub}
		return
	elseif ((<stack> [<i>].base_name) = 'band_mode')
		generic_event_back \{state = UIstate_band_mode}
		return
	endif
	i = (<i> + 1)
	repeat <stack_size>
	printf \{qs("\L#################### exit_discard_changes didn't find a state to go back to, go to character selection ####################")}
	generic_event_back \{state = uistate_character_selection}
endscript

script exit_skip_save 
	if is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
		cas_save_photo_of_car character_name = ($cas_current_profile) savegame = ($cas_current_savegame)
	endif
	clean_up_menu_history_screen_elements
	GetCASAppearance
	modify_custom_profile_appearance id = ($cas_current_profile) appearance = <appearance> savegame = ($cas_current_savegame)
	cas_get_player_status
	change structurename = <player_status> character_id = ($cas_current_profile)
	if is_from_singleplayer_hub
		SetGlobalTags savegame = ($cas_current_savegame) last_singleplayer_character params = {last_singleplayer_character = ($cas_current_profile)}
	endif
	if ($cas_from_main_menu = 1)
		cas_destroy_all_characters
	endif
	ui_event_get_stack
	i = 0
	begin
	if ((<stack> [<i>].base_name) = 'character_hub')
		cas_set_object_node_pos player = ($cas_current_player) node = z_Soundcheck_TRG_Waypoint_Player1_Start
		generic_event_back \{state = uistate_character_hub}
		return
	elseif ((<stack> [<i>].base_name) = 'singleplayer_character_hub')
		cas_set_object_node_pos player = ($cas_current_player) node = z_Soundcheck_TRG_Waypoint_Player1_Start
		generic_event_back \{state = UIstate_singleplayer_character_hub}
		return
	elseif ((<stack> [<i>].base_name) = 'band_mode')
		generic_event_back \{state = UIstate_band_mode}
		return
	endif
	i = (<i> + 1)
	repeat <stack_size>
	generic_event_back \{state = uistate_character_selection}
endscript
