wii_saveload_successor = null_flow_state
wii_nosave_onboot = 0
wii_memcard_autosave = 0
wii_need_jamsession_scan = false

script wii_leave_saveload_flow 
	if ($wii_memcard_autosave = 0)
		printf \{qs(0xce230ea1)}
		return \{flow_state = options_data_settings_fs}
	else
		printf \{qs(0x5b882e0d)}
		ps2_get_saveload_successor
		return flow_state = <flow_state>
	endif
endscript

script wii_memcard_load \{boot = 0
		FileType = Progress}
	if ($wii_nosave_onboot = 1 && <boot> = 1)
		change \{MemcardSavingOrLoading = Saving}
	else
		change \{MemcardSavingOrLoading = loading}
	endif
	get_filename_from_filetype FileType = <FileType>
	printf qs(0xea1c23bd) a = <FileType> b = <filename>
	SetSaveFileName FileType = <FileType> name = <filename>
	GetGlobalTags \{globaltag_checksum
		params = globaltag_checksum}
	oldglobaltag_checksum = <globaltag_checksum>
	if ($wii_memcard_autosave = 1 || (<boot> = 1))
		loadFromOptions = false
	else
		loadFromOptions = true
	endif
	if NOT LoadFromMemoryCard FileType = <FileType> loadFromOptions = <loadFromOptions>
		if GotParam \{CorruptedData}
			printf qs(0xf1f0a647) a = <boot>
			if (<boot> = 1)
				return \{memcard_status = corrupt_boot}
			elseif (<boot> = 0)
				return \{memcard_status = load_corrupt_ingame}
			endif
		elseif GotParam \{NoSave}
			printf qs(0x6d7f0273) a = <boot>
			if (<boot> = 1)
				return \{memcard_status = load_no_save_boot}
			elseif (<boot> = 0)
				return \{memcard_status = load_no_save_ingame}
			endif
		else
			ScriptAssert \{qs(0xd3ef34a0)}
			if (<boot> = 1)
				return \{memcard_status = corrupt_boot}
			elseif (<boot> = 0)
				return \{memcard_status = load_corrupt_ingame}
			endif
		endif
	endif
	globaltag_checksum = invalid
	GetGlobalTags \{globaltag_checksum
		params = globaltag_checksum
		noassert = 1}
	if NOT (<globaltag_checksum> = <oldglobaltag_checksum>)
		printf \{qs(0xff2fd0d4)}
		ClearGlobalTags
		setup_globaltags
		printf qs(0x4cd59a7d) a = <boot>
		if (<boot> = 1)
			return \{memcard_status = corrupt_boot}
		elseif (<boot> = 0)
			return \{memcard_status = load_corrupt_ingame}
		endif
	endif
	scan_globaltag_downloads
	restore_globals_from_global_tags
	cheats_load
	printf qs(0x3cce5422) a = <boot>
	if (<boot> = 1)
		if ($wii_nosave_onboot = 1)
			return \{memcard_status = choose_proper_using_guitar_screen}
		else
			return \{memcard_status = press_any_button}
		endif
	elseif (<boot> = 0)
		wii_leave_saveload_flow
		return \{memcard_status = success}
	endif
endscript

script wii_memcard_check_for_space 
	theName = (($memcard_file_types [$saveFileTypeIndex]).file_name)
	theType = (($memcard_file_types [$saveFileTypeIndex]).name)
	if NOT GetMemCardSpaceAvailable name = <theName> FileType = <theType>
		if (<no_space> = true)
			return \{nospace = 1
				noinode = 0}
		elseif (<no_inodes> = true)
			return \{noinode = 1
				nospace = 0}
		endif
	endif
	return \{nospace = 0
		noinode = 0}
endscript

script wii_memcard_save \{check_for_space = 1
		boot = 0
		FileType = Progress}
	printf qs(0xf5022901) a = <boot>
	printf qs(0x1c1c5b40) a = <check_for_space>
	change \{MemcardSavingOrLoading = Saving}
	get_filename_from_filetype FileType = <FileType>
	printf qs(0x47c2056f) a = <FileType> b = <filename>
	if (<check_for_space> = 1 && <boot> = 1)
		memcard_check_for_existing_save FileType = <FileType>
		if (<found> = 0)
			wii_memcard_check_for_space
			printf qs(0x9447f983) a = <found>
			printf qs(0xe865c7cf) a = <nospace>
			printf qs(0x5c35e2f6) a = <noinode>
			if (<nospace> = 1)
				printf \{qs(0xf01ae7a5)}
				if (<FileType> = jamsession)
					return \{memcard_status = insufficient_space_jam}
				elseif (<boot> = 1)
					return \{memcard_status = insufficient_space_boot}
				elseif (<boot> = 0)
					return \{memcard_status = insufficient_space_ingame}
				endif
			elseif (<noinode> = 1)
				if (<FileType> = jamsession)
					return \{memcard_status = insufficient_inode_jam}
				elseif (<boot> = 1)
					return \{memcard_status = insufficient_inode_boot}
				elseif (<boot> = 0)
					return \{memcard_status = insufficient_inode_ingame}
				endif
			endif
		endif
	endif
	if (($progression_pop_count = 1) && (<FileType> = Progress))
		pop_later = 1
		progression_push_current
	else
		pop_later = 0
	endif
	if (<FileType> = jamsession)
		jam_publish_update_playback_track \{guitar_num = 1}
		jam_publish_update_playback_track \{guitar_num = 2}
		jam_publish_update_playback_drumvocal_track
		downloaded = 0
		GetSongInfo
		change memcard_jamsession_song_version = <song_version>
		change memcard_jamsession_downloaded = <downloaded>
		if GotParam \{fileid}
			change memcard_jamsession_fileid = <fileid>
		endif
		change memcard_jamsession_playback_track1 = <playback_track1>
		change memcard_jamsession_playback_track2 = <playback_track2>
		change memcard_jamsession_playback_track_drums = <playback_track_drums>
		change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	endif
	SetSaveFileName FileType = <FileType> name = <filename>
	if (($wii_memcard_autosave = 1) || ((<boot>) = 1))
		saveFromOptions = false
	else
		saveFromOptions = true
	endif
	if NOT SaveToMemoryCard FileType = <FileType> saveFromOptions = <saveFromOptions>
		printf \{qs(0x9da901f3)}
		if (<boot> = 1)
			return \{memcard_status = save_error_boot}
		elseif (<boot> = 0)
			return \{memcard_status = save_error_ingame}
		endif
	endif
	if (<pop_later> = 1)
		progression_pop_current
	endif
	guitar_memcard_save_success_sound
	printf \{qs(0xbefb2963)}
	return \{memcard_status = success}
endscript

script wii_replace_file 
	ClearGlobalTags
	setup_globaltags
	DeleteMemCardFile \{FileType = Progress}
	wii_memcard_save \{boot = 1}
	return memcard_status = <memcard_status>
endscript

script wii_replace_file_ingame 
	ClearGlobalTags
	setup_globaltags
	DeleteMemCardFile \{FileType = Progress}
	wii_memcard_save \{boot = 0}
	return memcard_status = <memcard_status>
endscript

script wii_memcard_delete \{FileType = jamsession}
	get_filename_from_filetype FileType = <FileType>
	printf qs(0x578e9c9a) a = <FileType> b = <filename>
	SetSaveFileName FileType = <FileType> name = <filename>
	if (<FileType> = jamsession)
		jam_recording_create_editable_arrays
		ClearJamSession
		SetSongInfo \{genre = -1
			song_version = 0
			downloaded = 0
			drum_kit = 0
			file_id = {
				file_id = [
					0
					0
				]
			}}
		change \{memcard_jamsession_song_version = $jam_song_version_valid}
		change \{memcard_jamsession_downloaded = 0}
		change \{memcard_jamsession_playback_track1 = 0}
		change \{memcard_jamsession_playback_track2 = 0}
		change \{memcard_jamsession_playback_track_drums = 0}
		change \{memcard_jamsession_playback_track_vocals = 0}
		change \{memcard_jamsession_file_name = $wii_jam_custom_song}
		change \{memcard_jamsession_artist = qs("No Artist")}
		if NOT WriteDummyJamSong
			printf \{qs(0x6b7bc255)}
			return \{memcard_status = delete_error_ingame}
		endif
	else
		if NOT DeleteMemCardFile FileType = <FileType>
			printf \{qs(0x6b7bc255)}
			return \{memcard_status = delete_error_ingame}
		endif
	endif
	printf \{qs(0xe21f37eb)}
	return \{memcard_status = success}
endscript

script wii_disable_autosave 
	if NOT (<boot> = 1)
		create_wii_saveload_screen <...>
		Wait \{3
			seconds}
	endif
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
	spawnscriptnow \{ui_wii_trc_handle_action
		params = {
			action = leave_saveload_flow
		}}
endscript

script wii_memcard_saveload_complete 
	printstruct <...>
	printf \{qs(0x09346280)}
	wii_scan_jamsession_files
	directorylisting = $jam_curr_directory_listing
	GetArraySize <directorylisting>
	index = 0
	corruptJamFile = 0
	if NOT (<array_size> = $jam_max_user_songs)
		<corruptJamFile> = 1
	elseif (<array_size> > 0)
		begin
		if StructureContains Structure = (<directorylisting> [<index>]) corrupt
			<corruptJamFile> = 1
			break
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	if (<corruptJamFile> = 1)
		ui_event_wait event = menu_replace data = {state = UIState_Wii_Handle_Trc event_params = {memcard_status = corrupt_boot event_params = <event_params> type = boot}}
	else
		if NOT ($save_message_start_time = -1)
			GetElapsedTime \{StartTime = $save_message_start_time}
			printf qs(0x3701f241) a = <ElapsedTime>
			if (<ElapsedTime> < 2000)
				<added_delay> = ((2500 - <ElapsedTime>) / 1000)
				Wait <added_delay> seconds
			endif
			change \{save_message_start_time = -1}
		endif
		if ($wii_nosave_onboot = 1)
			jam_save_song_unload
			change \{wii_nosave_onboot = 0}
		endif
		memcard_cleanup_messages
		destroy_wii_saveload_screen
		create_wii_saveload_screen <...>
		Wait \{3
			frames}
		Wait \{2
			seconds}
		memcard_cleanup_messages
		SpawnScriptLater \{ui_wii_trc_handle_action
			params = {
				action = leave_saveload_flow
			}}
	endif
endscript

script wii_goto_system_menu 
	ResetToIPL
endscript

script wii_delete_file_toggle_autosave 
	destroy_generic_popup
	DeleteMemCardFile \{FileType = Progress}
endscript

script wii_scan_jamsession_files \{force = 0}
	if (($wii_need_jamsession_scan = true) || (force != 0))
		printf \{qs(0x00a6754e)}
		SetSaveFileName FileType = jamsession name = ($memcard_file_types [$jamSessionFileTypeIndex].file_name)
		GetMemCardDirectoryListing \{FileType = jamsession}
		change jam_curr_directory_listing = <directorylisting>
		change \{wii_need_jamsession_scan = false}
	endif
endscript

script wifi_nand_continue_without_saving 
	destroy_generic_popup
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
endscript

script open_insufficient_space_dialog 
	destroy_generic_popup
	FormatText TextName = message_text ($wii_wifi_nand_insufficient_space_text) d = (<fsblocks>)
	create_generic_popup {
		title = $wii_error_header
		message = <message_text>
		option_menu = 2
		option1 = {
			title = $wii_saveload_continuenosave
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wifi_nand_continue_without_saving}
			]
		}
		option2 = {
			title = $wii_saveload_wiimenu
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wii_goto_system_menu}
			]
		}
	}
endscript

script open_insufficient_inodes_dialog 
	destroy_generic_popup
	create_generic_popup \{title = $wii_error_header
		message = $wii_wifi_nand_insufficient_inodes_text
		option_menu = 2
		option1 = {
			title = $wii_saveload_continuenosave
			eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					wifi_nand_continue_without_saving
				}
			]
		}
		option2 = {
			title = $wii_saveload_wiimenu
			eventhandlers = [
				{
					focus
					popup_menu_focus
				}
				{
					unfocus
					popup_menu_unfocus
				}
				{
					pad_choose
					wii_goto_system_menu
				}
			]
		}}
endscript

script open_corrupt_save_dialog 
	destroy_generic_popup
	get_string_wii \{message = corrupt_boot}
	create_generic_popup {
		title = $wii_error_header
		message = <localized_string>
		option_menu = 2
		font_scale = 0.6
		option1 = {
			title = $wii_saveload_continuecorrupt
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wifi_nand_continue_without_saving}
			]
		}
		option2 = {
			title = $wii_saveload_deletefile
			eventhandlers = [
				{focus popup_menu_focus}
				{unfocus popup_menu_unfocus}
				{pad_choose wii_delete_file_toggle_autosave}
			]
		}
	}
endscript

script wii_data_check_and_load 
	if ((ProgressFileExists) && (WFCFileExists))
		wii_memcard_load boot = <boot>
	else
		change \{wii_nosave_onboot = 1}
		wii_create_missing_files boot = <boot>
	endif
	return memcard_status = <memcard_status>
endscript
disable_wifi = 0

script wii_create_missing_files 
	if ($progression_pop_count = 1)
		pop_later = 1
		progression_push_current
	else
		pop_later = 0
	endif
	jam_recording_create_editable_arrays
	ClearJamSession
	SetSongInfo \{genre = -1
		song_version = $jam_song_version_valid
		downloaded = 0
		drum_kit = 0
		file_id = {
			file_id = [
				0
				0
			]
		}}
	if AttemptToCreateMissingFiles
		printf \{qs(0x269fa249)}
	else
		printf qs(0x40b357f1) a = <check_failed>
		printf qs(0xfa907d39) a = <no_progressFile>
		printf qs(0x46e69ace) a = <no_wfcFile>
		printf qs(0x3a5bcff4) a = <no_space>
		printf qs(0x8589e9cb) a = <no_inodes>
		if (<check_failed> = true)
			printf \{qs(0x7c7d2f7c)}
			return \{memcard_status = save_error_boot}
		elseif ((<no_progressFile> = true) && (<no_wfcFile> = true))
			printf \{qs(0xd6b7c4dc)}
			if (<no_space> = true)
				printf \{qs(0x7192f298)}
				change \{enable_saving = 0}
				change \{disable_wifi = 1}
				return \{memcard_status = insufficient_space_boot}
			else
				printf \{qs(0x39fe5ec9)}
				change \{enable_saving = 0}
				change \{disable_wifi = 1}
				return \{memcard_status = insufficient_inode_boot}
			endif
		elseif (<no_wfcFile> = true)
			printf \{qs(0xc5c4ebc7)}
			WifiNandDisableSaving
			if (<no_space> = true)
				printf \{qs(0x7192f298)}
				change \{enable_saving = 1}
				change \{disable_wifi = 1}
				return \{memcard_status = insufficient_space_boot_wfc_only}
			else
				printf \{qs(0x39fe5ec9)}
				change \{enable_saving = 1}
				change \{disable_wifi = 1}
				return \{memcard_status = insufficient_inode_boot_wfc_only}
			endif
		elseif (<no_progressFile> = true)
			printf \{qs(0xf34b61b9)}
			get_filename_from_filetype \{FileType = Progress}
			SetSaveFileName FileType = Progress name = <filename>
			return \{memcard_status = corrupt_boot}
		else
			printf \{qs(0x9e85554a)}
			return \{memcard_status = save_error_boot}
		endif
	endif
	if (<pop_later> = 1)
		progression_pop_current
	endif
	wii_memcard_load boot = <boot>
	return flow_state = <flow_state> memcard_status = <memcard_status>
endscript
