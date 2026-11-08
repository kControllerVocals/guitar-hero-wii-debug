
script ui_create_options_data_delete 
	if IsLoggedIn
		create_new_generic_popup \{popup_type = yes_no_menu
			title = $wii_error_lowercase
			text = $wii_bandlogo_no_connect
			yes_func = reset_data_online_confirmation
			yes_func_params = {
				logoff
			}
			no_func = reset_data_online_confirmation
			no_func_params = {
				go_back
			}}
	elseif NOT GotParam \{really}
		create_popup_warning_menu \{textblock = {
				text = qs("Are you sure you want to reset your progress and overwrite your current save??")
			}
			options = [
				{
					func = generic_event_back
					text = qs("CANCEL")
				}
				{
					func = generic_event_replace
					func_params = {
						state = uistate_options_data_delete
						data = {
							really = 1
						}
					}
					text = qs("I'M SURE")
				}
			]}
	elseif NOT GotParam \{confirm}
		create_popup_warning_menu \{textblock = {
				text = qs("Are you really sure you want to reset your progress and overwrite your current save?  All career progress, cash earned, items unlocked, rock stars created, etc. will be lost!")
			}
			options = [
				{
					func = generic_event_back
					text = qs("CANCEL")
				}
				{
					func = generic_event_replace
					func_params = {
						state = uistate_options_data_delete
						data = {
							really = 1
							confirm = 1
						}
					}
					text = qs("I'M REALLY SURE")
				}
			]}
	else
		spawnscriptnow \{ui_options_data_delete}
		Menu_Music_Off
	endif
endscript

script ui_destroy_options_data_delete 
	destroy_popup_warning_menu
endscript

script ui_options_data_delete 
	create_popup_warning_menu \{textblock = {
			text = qs("Clearing all of your save data...\nDo not switch off power during this time.")
		}}
	Wait \{1
		second}
	get_savegame_from_controller controller = ($primary_controller)
	GetGlobalTags \{user_options
		params = {
			autosave
		}}
	FormatText TextName = bandname_id 'band%i' i = ($current_band)
	get_progression_globals \{Career_Guitar}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = guitar bandname_id = <bandname_id>
	get_progression_globals \{Career_Bass}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Bass bandname_id = <bandname_id>
	get_progression_globals \{Career_Drum}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = drum bandname_id = <bandname_id>
	get_progression_globals \{Career_Vocals}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Vocals bandname_id = <bandname_id>
	get_progression_globals \{Career_Band}
	setup_gigtags savegame = <savegame> SetList_Songs = <tier_global> globaltag_checksum = <globaltag_checksum> part = Band bandname_id = <bandname_id>
	FormatText checksumname = default_bandname 'band%i_info' i = ($current_band) AddToStringLookup = true
	SetGlobalTags savegame = <savegame> <default_bandname> params = {($default_bandtags)}
	DeleteDWCProfile index = ($current_band - 1)
	SetGlobalTags user_options params = {autosave = <autosave>}
	ui_event_wait_for_safe
	ui_memcard_save \{event = menu_change
		state = UIstate_boot_iis
		data = {
			clear_previous_stack
		}}
endscript

script reset_data_online_confirmation 
	destroy_generic_popup
	if GotParam \{logoff}
		LogOut
		generic_event_replace \{state = uistate_options_data_delete}
	endif
	if GotParam \{go_back}
		generic_event_back
	endif
endscript
