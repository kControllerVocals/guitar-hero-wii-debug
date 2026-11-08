max_memcard_filename_length = 15
SavingOrLoading = Saving
memcard_using_new_save_system = 0
memcard_default_title = 'Guitar Hero World Tour'
memcard_content_name = 'Progress'
memcard_content_jamsession_name = 'CustomSongs'
damagedfile = qs(0xd66d8e40)
badversionnumber = qs(0xec29a683)
saveFileTypeIndex = 0
progressFileTypeIndex = 0
jamSessionFileTypeIndex = 1
memcard_file_types = [
	{
		name = Progress
		file_name = 'GH4Progress'
		prefix = 'GH4Prog'
		version = 70
		fixed_size = 900000
		use_temp_pools = false
		is_binary_file = true
		num_bytes_per_frame = 102400
	}
	{
		name = jamsession
		file_name = 'JamSave'
		file_temp = 'JamTemp'
		prefix = 'JamSave'
		version = 80
		fixed_size = 102000
		use_temp_pools = false
		is_binary_file = false
		num_bytes_per_frame = 102400
	}
]
memcard_file_types_PS2 = [
	{
		name = Progress
		file_name = 'GH4Progress'
		suffix = 'Progress'
		folder_name = 'GH World Tour'
		icon = 'memcard\\cas.png'
		version = 54
		fixed_size = 409600
		menu_text = qs(0x9d87ba69)
		menu_icon = logo_cas
		suffix = ''
	}
	{
		name = jamsession
		file_name = 'GH4JamSession'
		suffix = '-jam'
		folder_name = 'GH World Tour'
		icon = 'memcard\\cas.png'
		version = 80
		fixed_size = 102400
		menu_text = qs(0xfbf74b72)
		menu_icon = thpg
	}
]
memcard_folder_desc = {
	GuitarContent = {
		icon_xen = 'memcard\\gh.png'
		icon_ps3 = 'memcard\\ICON0.PNG'
		file_types = [
			{
				name = Progress
				slots_reserve = 1
			}
		]
	}
	JamSessionsContent = {
		icon_xen = 'memcard\\gh.png'
		icon_ps3 = 'memcard\\ICON0.PNG'
		file_types = [
			{
				name = jamsession
				slots_reserve = 0
			}
		]
	}
}

script get_filename_from_filetype 
	if NOT GotParam \{FileType}
		ScriptAssert \{qs(0xca083485)}
	endif
	switch <FileType>
		case Progress
		filename = ($memcard_file_types [$progressFileTypeIndex].file_name)
		case jamsession
		filename = ($memcard_file_types [$jamSessionFileTypeIndex].file_name)
		default
		ScriptAssert qs(0x9a976be9) a = <FileType>
	endswitch
	return filename = <filename>
endscript
MemcardDoneScript = nullscript
MemcardRetryScript = nullscript
MemcardSavingOrLoading = Saving
MemcardSuccess = false
MemcardController = $primary_controller
MemcardInitialBoot = false
MemcardJamOrDefault = `default`

script memcard_choose_storage_device \{StorageSelectorForce = 0}
	printf \{qs("\L==> memcard_choose_storage_device")}
	create_checking_memory_card_screen
	Wait \{1
		seconds}
	MC_SetActivePlayer userid = ($MemcardController)
	if NOT CardIsInSlot
		if (<StorageSelectorForce> = 0)
			goto \{create_storagedevice_warning_menu}
		endif
	endif
	dump
	ShowStorageSelector force = <StorageSelectorForce> FileType = Progress
endscript

script memcard_check_for_previously_used_folder 
	MC_WaitAsyncOpsFinished
	memcard_check_for_card
	if (<FileType> = jamsession)
		<FolderName> = $memcard_content_jamsession_name
	else
		<FolderName> = $memcard_content_name
	endif
	MC_SetActiveFolder FolderName = <FolderName>
	if MC_HasValidatedFolder
		printf \{qs("\LCard didn't change, re-using old data!")}
		return \{found = 1
			corrupt = 0}
	else
		memcard_enum_folders
		if NOT MC_FolderExists FolderName = <FolderName>
			printf \{qs("\L**************** fail 0")}
			return \{found = 0
				corrupt = 0}
		endif
		MC_SetActiveFolder FolderName = <FolderName>
		MC_LoadTOCInActiveFolder
		if (<result> = true)
			if MC_HasValidatedFolder
				printf \{qs("\LCard re-inserted, re-using old data!")}
				return \{found = 1
					corrupt = 0}
			else
				printf \{qs("\L**************** fail 1")}
				return \{found = 0
					corrupt = 0}
			endif
		else
			if (<ErrorCode> = corrupt)
				printf \{qs("\L**************** fail 2")}
				return \{found = 1
					corrupt = 1}
			else
				printf \{qs("\L**************** fail 3")}
				return \{found = 0
					corrupt = 0}
			endif
		endif
	endif
endscript

script memcard_enum_folders 
	MC_EnumerateFolders
	if (<result> = false)
		memcard_error \{error = create_storagedevice_warning_menu}
	endif
endscript

script memcard_check_for_existing_save \{FileType = null}
	if (FileType = null)
		FileType = (($memcard_file_types [$saveFileTypeIndex]).name)
	endif
	if ($memcard_using_new_save_system = 0)
		if IsPs3
			return \{found = 0}
		endif
		if IsNgc
			if MemCardFileExists name = $memcard_file_name FileType = <FileType>
				return \{found = 1
					corrupt = 0}
			else
				return \{found = 0
					corrupt = 0}
			endif
		else
			memcard_choose_storage_device
			GetMemCardDirectoryListing FileType = <FileType>
			if (<totalthps4filesoncard> = 1)
				printf \{qs(0xdf35c056)}
				return \{found = 1
					corrupt = 0}
			endif
		endif
	else
		memcard_enum_folders
		MC_WaitAsyncOpsFinished
		memcard_check_for_card
		if MC_FolderExists \{FolderName = $memcard_content_name}
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
			MC_LoadTOCInActiveFolder
			if (<result> = false)
				return \{found = 1
					corrupt = 1}
			endif
			if MemCardFileExists filename = $memcard_file_name FileType = <FileType>
				return \{found = 1
					corrupt = 0}
			else
				return \{found = 1
					corrupt = 1}
			endif
		endif
	endif
	return \{found = 0
		corrupt = 0}
endscript

script memcard_wait_for_timer \{time = 3.0}
	begin
	if TimeGreaterThan <time>
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script is_autosave_on 
	RequireParams \{[
			savegame
		]}
	GetGlobalTags user_options savegame = <savegame>
	if (<autosave> = 1)
		return \{true}
	endif
	return \{false}
endscript

script memcard_save_file \{OverwriteConfirmed = 0
		boot = 0}
	printf \{qs("\L==> memcard_save_file")}
	mark_unsafe_for_shutdown
	change \{MemcardSavingOrLoading = Saving}
	memcard_check_for_card
	ResetTimer
	<overwrite> = 0
	if MC_FolderExists \{FolderName = $memcard_content_name}
		if (<OverwriteConfirmed> = 1)
			<overwrite> = 1
			create_overwrite_menu
			ResetTimer
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
		else
			goto \{create_confirm_overwrite_menu}
		endif
	else
		if IsPs3
			if NOT MC_SpaceForNewFolder \{desc = GuitarContent}
				memcard_error \{error = create_out_of_space_menu}
			endif
		endif
		create_save_menu
		ResetTimer
		MC_CreateFolder \{name = $memcard_content_name
			desc = GuitarContent}
		if (<result> = false)
			if (<ErrorCode> = OutOfSpace)
				memcard_error \{error = create_out_of_space_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	MC_SetActiveFolder \{FolderName = $memcard_content_name}
	MC_LoadTOCInActiveFolder
	memcard_pre_save_progress
	write_globals_to_global_tags
	PushTempMemCardPools \{heap = heap_bink}
	SaveToMemoryCard \{filename = $memcard_file_name
		FileType = Progress
		usepaddingslot = always}
	PopTempMemCardPools
	if (<result> = false)
		if (<ErrorCode> = OutOfSpace)
			memcard_error \{error = create_out_of_space_menu}
		else
			if (<ErrorCode> = corrupt)
				memcard_error \{error = create_corrupted_data_menu}
			elseif (<overwrite> = 1)
				memcard_error \{error = create_overwrite_failed_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	change \{MemcardSuccess = true}
	memcard_wait_for_timer
	if (<overwrite> = 1)
		create_overwrite_success_menu
	else
		create_save_success_menu
	endif
	guitar_memcard_save_success_sound
	Wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_delete_file \{file_type = `default`}
	printf \{qs("\L==> memcard_delete_file")}
	mark_unsafe_for_shutdown
	create_delete_file_menu
	MC_WaitAsyncOpsFinished
	if IsPs3
		fade_overlay_on \{alpha = 1.0}
		MC_StartPS3ForceDelete
		begin
		if MC_IsPS3ForceDeleteFinished
			break
		endif
		Wait \{1
			gameframes}
		repeat
		refresh_jam_directory_contents
		if NOT (<file_type> = jam_file)
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
			MC_LoadTOCInActiveFolder
		endif
		fade_overlay_off
	else
		if (<file_type> = `default`)
			if MC_FolderExists \{FolderName = $memcard_content_name}
				ResetTimer
				MC_DeleteFolder \{FolderName = $memcard_content_name}
				if (<result> = false)
					memcard_error \{error = create_delete_failed_menu}
				endif
				memcard_wait_for_timer
			endif
		endif
		if (<file_type> = jam_file)
			if MC_FolderExists \{FolderName = $memcard_content_jamsession_name}
				ResetTimer
				MC_DeleteFolder \{FolderName = $memcard_content_jamsession_name}
				if (<result> = false)
					memcard_error \{error = create_delete_failed_menu}
				endif
				memcard_wait_for_timer
				create_delete_success_menu
			endif
		endif
		Wait \{1
			seconds}
	endif
	if NotCD
		DeleteAllSongDataFromFile
	endif
	memcard_check_for_card
	memcard_sequence_retry
endscript

script memcard_load_file \{LoadConfirmed = 0}
	mark_unsafe_for_shutdown
	printf \{qs("\L==> memcard_load_file")}
	change \{MemcardSavingOrLoading = loading}
	MC_WaitAsyncOpsFinished
	memcard_check_for_card
	ResetTimer
	if MC_FolderExists \{FolderName = $memcard_content_name}
		if (<LoadConfirmed> = 1)
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
		else
			goto \{create_confirm_load_menu}
		endif
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	MC_SetActiveFolder \{FolderName = $memcard_content_name}
	create_load_file_menu
	PushTempMemCardPools \{heap = heap_bink}
	LoadFromMemoryCard \{filename = $memcard_file_name
		FileType = Progress}
	PopTempMemCardPools
	if (<result> = false)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
		MC_LoadTOCInActiveFolder
		GetMemCardDirectoryListing
		if (<result> = false)
			if (<ErrorCode> = corrupt)
				memcard_error \{error = create_corrupted_data_menu
					params = {
						file_type = jam_file
					}}
			else
				memcard_error \{error = create_load_failed_menu}
			endif
		endif
		if GotParam \{directorylisting}
			change jam_curr_directory_listing = <directorylisting>
		else
			change \{jam_curr_directory_listing = [
				]}
		endif
	else
		change \{jam_curr_directory_listing = [
			]}
	endif
	change \{MemcardSuccess = true}
	memcard_wait_for_timer
	create_load_success_menu
	memcard_post_load_progress
	Wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_pre_save_progress 
endscript

script memcard_post_load_progress 
	if (($primary_controller) = $MemcardController)
		restore_globals_from_global_tags
	endif
	scan_globaltag_downloads
endscript

script memcard_cleanup_messages 
	destroy_popup_warning_menu
endscript

script memcard_sequence_generic_done 
	if ($MemcardSavingOrLoading = Saving)
		if ($MemcardSuccess = true)
			printf \{qs("\L==> Memcard sequence finished (save success)")}
			ui_memcard_finish success = save controller = ($MemcardController)
		else
			printf \{qs("\L==> Memcard sequence finished (save failed)")}
			MC_SetActiveFolder \{FolderIndex = -1}
			ui_memcard_finish failed = save controller = ($MemcardController)
		endif
	else
		if ($MemcardSuccess = true)
			printf \{qs("\L==> Memcard sequence finished (load success)")}
			ui_memcard_finish success = load controller = ($MemcardController)
		else
			printf \{qs("\L==> Memcard sequence finished (load failed)")}
			MC_SetActiveFolder \{FolderIndex = -1}
			ui_memcard_finish failed = load controller = ($MemcardController)
		endif
	endif
	if ($saveFileTypeIndex = $jamSessionFileTypeIndex)
		change \{jam_selected_song = $memcard_jamsession_file_name}
	endif
endscript

script memcard_sequence_retry 
	printf \{qs("\Lmemcard_sequence_retry")}
	MC_WaitAsyncOpsFinished
	goto $MemcardRetryScript params = {<...> controller = ($MemcardController)}
endscript

script memcard_disable_saves_and_quit 
	get_savegame_from_controller controller = ($MemcardController)
	SetGlobalTags user_options savegame = <savegame> params = {autosave = 0}
	memcard_sequence_quit
endscript

script memcard_sequence_quit 
	printf \{qs("\Lmemcard_sequence_quit")}
	mark_safe_for_shutdown
	goto $MemcardDoneScript params = <...>
endscript

script memcard_check_for_card 
	if NOT CardIsInSlot
		goto create_storagedevice_warning_menu params = <...>
	endif
endscript

script memcard_error 
	printf \{qs("\Lmemcard_error")}
	RequireParams \{[
			error
		]
		all}
	memcard_check_for_card
	goto <error> params = <params>
endscript

script memcard_sequence_cleanup_generic 
	if isps2
		if ($restartMenuMusic = 1)
			change \{restartMenuMusic = 0}
			printf \{qs(0xd177b3fe)}
			spawnscriptnow \{menu_music_on
				params = {
					setflag = 1
				}}
		endif
		return
	endif
	MC_WaitAsyncOpsFinished
	memcard_cleanup_messages
	memcard_sequence_reset_flags
	MC_SetActivePlayer \{QueryDefault}
endscript

script memcard_sequence_reset_flags 
	change \{MemcardDoneScript = nullscript}
	change \{MemcardRetryScript = nullscript}
	change \{MemcardController = $primary_controller}
endscript

script memcard_validate_card_data \{StorageSelectorForce = 0
		ValidatePrev = 0
		FileType = Progress}
	MC_SetActivePlayer userid = ($MemcardController)
	memcard_choose_storage_device StorageSelectorForce = <StorageSelectorForce>
	memcard_check_for_card <...>
	if (<ValidatePrev> = 1)
		memcard_check_for_previously_used_folder FileType = <FileType>
	else
		memcard_check_for_existing_save
	endif
	RequireParams \{[
			found
			corrupt
		]
		all}
	if (<corrupt> = 1)
		if (<FileType> = Progress)
			refresh_jam_directory_contents
			MC_SetActiveFolder \{FolderName = $memcard_content_name}
			MC_LoadTOCInActiveFolder
			memcard_error \{error = create_corrupted_data_menu}
		else
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		endif
	endif
	return found = <found> corrupt = <corrupt>
endscript

script refresh_jam_directory_contents 
	printf \{'refresh_jam_directory_contents'}
	change \{jam_curr_directory_listing = [
		]}
	memcard_enum_folders
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
		MC_LoadTOCInActiveFolder
		GetMemCardDirectoryListing
		if NOT (<result> = false)
			if GotParam \{directorylisting}
				change jam_curr_directory_listing = <directorylisting>
			endif
		endif
	endif
endscript

script memcard_sequence_begin_bootup 
	spawnscriptnow memcard_sequence_begin_bootup_logic params = <...>
endscript

script memcard_sequence_begin_save 
	spawnscriptnow memcard_sequence_begin_save_logic params = <...>
endscript

script memcard_sequence_begin_autosave 
	spawnscriptnow memcard_sequence_begin_autosave_logic params = <...>
endscript

script memcard_sequence_begin_load 
	spawnscriptnow memcard_sequence_begin_load_logic params = <...>
endscript

script memcard_sequence_begin_autoload 
	spawnscriptnow memcard_sequence_begin_autoload_logic params = <...>
endscript

script memcard_sequence_begin_save_jam 
	spawnscriptnow memcard_sequence_begin_save_jam_logic params = <...>
endscript

script memcard_sequence_begin_load_jam 
	spawnscriptnow memcard_sequence_begin_load_jam_logic params = <...>
endscript

script memcard_sequence_begin_rename_jam 
	spawnscriptnow memcard_sequence_begin_rename_jam_logic params = <...>
endscript

script memcard_sequence_begin_delete_jam 
	spawnscriptnow memcard_sequence_begin_delete_jam_logic params = <...>
endscript

script memcard_sequence_begin_ss_load 
	spawnscriptnow memcard_sequence_begin_ss_load_logic params = <...>
endscript

script memcard_sequence_begin_bootup_logic \{controller = $primary_controller}
	printf \{qs("\Lmemcard_sequence_begin_bootup")}
	printstruct <...>
	MC_WaitAsyncOpsFinished
	mark_unsafe_for_shutdown
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_bootup_logic}
	change \{MemcardSavingOrLoading = Saving}
	change \{MemcardSuccess = false}
	change MemcardController = <controller>
	change \{MemcardInitialBoot = true}
	change \{MemcardJamOrDefault = `default`}
	change \{saveFileTypeIndex = $progressFileTypeIndex}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_load_check_status_boot_fs
		}}
	return
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	if (<found> = 1)
		goto \{memcard_load_file
			params = {
				LoadConfirmed = 1
			}}
	else
		goto \{memcard_save_file
			params = {
				boot = 1
			}}
	endif
endscript

script memcard_sequence_begin_save_logic \{StorageSelectorForce = 1
		controller = $primary_controller}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	change \{MemcardSavingOrLoading = Saving}
	change \{MemcardSuccess = false}
	change MemcardController = <controller>
	change \{MemcardInitialBoot = false}
	change \{MemcardJamOrDefault = `default`}
	ps2_memcard_set_autosave \{autosave = 0}
	change \{saveFileTypeIndex = $progressFileTypeIndex}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}}
	return
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	goto \{memcard_save_file}
endscript

script memcard_sequence_begin_autosave_logic \{controller = $primary_controller}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	disable_pause
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	change \{MemcardSavingOrLoading = Saving}
	change \{MemcardSuccess = false}
	change MemcardController = <controller>
	change \{MemcardInitialBoot = false}
	change \{MemcardJamOrDefault = `default`}
	get_savegame_from_controller controller = <controller>
	GetGlobalTags user_options savegame = <savegame>
	if (<autosave> = 0 && <requested_autosave> = 0)
		printf \{qs("\LAborting autosave due to option being off")}
		goto \{memcard_sequence_quit}
	endif
	if (<requested_autosave> = 1)
		ps2_memcard_set_autosave \{autosave = 0}
	else
		ps2_memcard_set_autosave \{autosave = 1}
	endif
	change \{saveFileTypeIndex = $progressFileTypeIndex}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}}
	return
	MC_SetActivePlayer userid = <controller>
	if NOT CardIsInSlot
		goto \{create_storagedevice_warning_menu}
	endif
	memcard_validate_card_data \{StorageSelectorForce = 0
		ValidatePrev = 1}
	if (<found> = 1)
		goto \{memcard_save_file
			params = {
				OverwriteConfirmed = 1
			}}
	else
		memcard_sequence_retry
	endif
endscript

script memcard_sequence_begin_load_logic \{StorageSelectorForce = 1
		controller = $primary_controller}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_load_logic}
	change \{MemcardSavingOrLoading = loading}
	change \{MemcardSuccess = false}
	change MemcardController = <controller>
	change \{MemcardInitialBoot = false}
	change \{MemcardJamOrDefault = `default`}
	change \{saveFileTypeIndex = $progressFileTypeIndex}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_load_check_status_ingame_fs
		}}
	return
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	goto \{memcard_load_file}
endscript

script memcard_sequence_begin_autoload_logic \{controller = $primary_controller}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_bootup_logic}
	change \{MemcardSavingOrLoading = loading}
	change \{MemcardSuccess = false}
	change MemcardController = <controller>
	change \{MemcardInitialBoot = false}
	change \{MemcardJamOrDefault = `default`}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 0
	if (<found> = 1)
		goto \{memcard_load_file
			params = {
				LoadConfirmed = 1
			}}
	else
		goto \{memcard_save_file}
	endif
endscript

script jam_memcard_validate_card_data \{StorageSelectorForce = 0}
	memcard_validate_card_data StorageSelectorForce = <StorageSelectorForce> ValidatePrev = 1 FileType = jamsession
	return <...>
endscript

script memcard_sequence_begin_save_jam_logic \{StorageSelectorForce = 0
		controller = $primary_controller}
	printf \{channel = jam_mode
		qs("\Lmemcard_sequence_begin_save_jam_logic")}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_save_jam_logic}
	change \{MemcardSavingOrLoading = Saving}
	change \{MemcardSuccess = false}
	change MemcardController = <controller>
	change \{MemcardInitialBoot = false}
	change \{MemcardJamOrDefault = jam}
	jam_publish_update_playback_track \{guitar_num = 1}
	jam_publish_update_playback_track \{guitar_num = 2}
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
	ps2_memcard_set_autosave \{autosave = 0}
	change \{saveFileTypeIndex = $jamSessionFileTypeIndex}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}}
	return
	<card_was_in_slot> = false
	if CardIsInSlot
		<card_was_in_slot> = true
	endif
	jam_memcard_validate_card_data <...>
	if (<corrupt> = 0)
		goto memcard_save_jam params = {card_was_in_slot = <card_was_in_slot>}
	endif
endscript

script memcard_save_jam \{OverwriteConfirmed = 0
		card_was_in_slot = true}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardSavingOrLoading = Saving}
	memcard_check_for_card
	ResetTimer
	printf \{channel = jam_mode
		qs("\Lmemcard_save_jam")}
	memcard_enum_folders
	create_save_menu
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		if (<card_was_in_slot> = false)
			if (<OverwriteConfirmed> = 1)
				<overwrite> = 1
				create_overwrite_menu
				ResetTimer
				MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
			else
				goto \{create_confirm_overwrite_menu}
			endif
		else
			MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
		endif
	else
		if IsPs3
			if NOT MC_SpaceForNewFolder \{desc = GuitarContent}
				memcard_error \{error = create_out_of_space_menu}
			endif
		endif
		MC_CreateFolder \{name = $memcard_jamsession_content_name
			desc = JamSessionsContent}
		if (<result> = false)
			if (<ErrorCode> = OutOfSpace)
				memcard_error \{error = create_out_of_space_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	MC_LoadTOCInActiveFolder
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
	change memcard_jamsession_artist = <artist>
	change memcard_jamsession_playback_track1 = <playback_track1>
	change memcard_jamsession_playback_track2 = <playback_track2>
	change memcard_jamsession_playback_track_drums = <playback_track_drums>
	change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	SaveToMemoryCard \{filename = $memcard_jamsession_file_name
		FileType = jamsession
		usepaddingslot = never}
	if (<result> = false)
		if (<ErrorCode> = OutOfSpace)
			memcard_error \{error = create_out_of_space_menu}
		elseif (<ErrorCode> = badfolder)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_save_failed_menu}
		endif
	endif
	LoadFromMemoryCard \{filename = $memcard_jamsession_file_name
		FileType = jamsession}
	if (<result> = false)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	change \{jam_selected_song = $memcard_jamsession_file_name}
	GetMemCardDirectoryListing
	change jam_curr_directory_listing = <directorylisting>
	printf \{channel = jam_mode
		qs("\Lmemcard_save_jam end")}
	change \{MemcardSuccess = true}
	memcard_wait_for_timer
	create_save_success_menu
	guitar_memcard_save_success_sound
	Wait \{1
		seconds}
	if NOT MC_FolderExists \{FolderName = $memcard_content_name}
		if NOT MC_SpaceForNewFolder \{desc = GuitarContent}
			memcard_error \{error = create_out_of_space_menu
				params = {
					message_type = Progress
				}}
		endif
	endif
	memcard_sequence_quit
	printf \{channel = jam_mode
		qs("\Lmemcard_save_jam quit")}
endscript

script memcard_sequence_begin_load_jam_logic \{StorageSelectorForce = 0
		controller = $primary_controller}
	printf \{channel = jam_mode
		qs("\Lmemcard_sequence_begin_load_jam_logic")}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_load_jam_logic}
	change \{MemcardSavingOrLoading = loading}
	change \{MemcardSuccess = false}
	change MemcardController = <controller>
	change \{MemcardInitialBoot = false}
	change \{MemcardJamOrDefault = jam}
	change \{saveFileTypeIndex = $jamSessionFileTypeIndex}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_load_check_status_ingame_fs
		}}
	return
	jam_memcard_validate_card_data <...>
	goto \{memcard_load_jam}
endscript

script memcard_load_jam 
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardSavingOrLoading = loading}
	memcard_check_for_card
	ResetTimer
	printf \{channel = jam_mode
		qs("\Lmemcard_load_jam")}
	memcard_enum_folders
	create_load_file_menu
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	MC_LoadTOCInActiveFolder
	if (<result> = false)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	LoadFromMemoryCard \{filename = $memcard_jamsession_file_name
		FileType = jamsession}
	if (<result> = false)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	change \{jam_selected_song = $memcard_jamsession_file_name}
	printf \{channel = jam_mode
		qs("\Lmemcard_load_jam end")}
	change \{MemcardSuccess = true}
	memcard_wait_for_timer
	create_load_success_menu
	Wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_sequence_begin_rename_jam_logic \{controller = $primary_controller}
	printf \{channel = jam_mode
		qs("\Lmemcard_sequence_begin_load_jam_logic")}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_rename_jam_logic}
	change \{MemcardSavingOrLoading = Saving}
	change \{MemcardSuccess = false}
	change MemcardController = <controller>
	change \{MemcardInitialBoot = false}
	change \{MemcardJamOrDefault = jam}
	jam_memcard_validate_card_data <...>
	goto \{memcard_rename_jam}
endscript

script memcard_rename_jam 
	printf \{channel = jam_mode
		qs("\Lmemcard_rename_jam")}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardSavingOrLoading = loading}
	memcard_check_for_card
	ResetTimer
	printf \{channel = jam_mode
		qs("\Ljamsession_renamememcardfile")}
	memcard_enum_folders
	create_save_menu
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	MC_LoadTOCInActiveFolder
	MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	RenameMemCardFile \{filename = $memcard_jamsession_file_name
		FileType = jamsession
		newfilename = $memcard_jamsession_new_file_name}
	if (<result> = false)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	SaveToMemoryCard \{filename = $memcard_jamsession_new_file_name
		FileType = jamsession
		usepaddingslot = never}
	if (<result> = false)
		if (<ErrorCode> = OutOfSpace)
			memcard_error \{error = create_out_of_space_menu}
		else
			if (<overwrite> = 1)
				memcard_error \{error = create_overwrite_failed_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	change \{jam_selected_song = $memcard_jamsession_new_file_name}
	change \{memcard_jamsession_file_name = $memcard_jamsession_new_file_name}
	GetMemCardDirectoryListing
	change jam_curr_directory_listing = <directorylisting>
	printf \{channel = jam_mode
		qs("\Ljamsession_renamememcardfile end")}
	change \{MemcardSuccess = true}
	memcard_wait_for_timer
	create_rename_success_menu
	guitar_memcard_save_success_sound
	Wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_sequence_begin_delete_jam_logic \{controller = $primary_controller}
	printf \{channel = jam_mode
		qs("\Lmemcard_sequence_begin_delete_jam_logic")}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_delete_jam_logic}
	change \{MemcardSavingOrLoading = Saving}
	change \{MemcardSuccess = false}
	change MemcardController = <controller>
	change \{MemcardInitialBoot = false}
	change \{MemcardJamOrDefault = jam}
	change \{saveFileTypeIndex = $jamSessionFileTypeIndex}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_delete_check_status_ingame_fs
		}}
	return
	jam_memcard_validate_card_data <...>
	goto \{memcard_delete_jam}
endscript

script memcard_delete_jam 
	printf \{channel = jam_mode
		qs("\Lmemcard_delete_jam")}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardSavingOrLoading = Saving}
	memcard_check_for_card
	ResetTimer
	memcard_enum_folders
	create_delete_menu
	if MC_FolderExists \{FolderName = $memcard_jamsession_content_name}
		MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	MC_LoadTOCInActiveFolder
	MC_SetActiveFolder \{FolderName = $memcard_jamsession_content_name}
	DeleteMemCardFile \{filename = $memcard_jamsession_file_name
		FileType = jamsession}
	if (<result> = false)
		if (<ErrorCode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_save_failed_menu}
		endif
	endif
	GetMemCardDirectoryListing
	change jam_curr_directory_listing = <directorylisting>
	change \{MemcardSuccess = true}
	memcard_wait_for_timer
	create_delete_success_menu
	guitar_memcard_save_success_sound
	Wait \{1
		seconds}
	memcard_sequence_quit
	printf \{channel = jam_mode
		qs("\Lmemcard_delete_jam end")}
endscript

script memcard_sequence_begin_ss_load_logic \{controller = $primary_controller}
	printf \{'memcard_sequence_begin_ss_load_logic'}
	mark_unsafe_for_shutdown
	MC_WaitAsyncOpsFinished
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_ss_load_logic}
	change \{MemcardSavingOrLoading = loading}
	change \{MemcardInitialBoot = false}
	change \{MemcardJamOrDefault = `default`}
	if memcard_get_new_secondary_signin
		change \{MemcardSuccess = false}
		change MemcardController = <controller>
		if GotParam \{more_to_come}
			change \{MemcardDoneScript = memcard_sequence_begin_ss_load_logic}
		endif
	else
		change \{MemcardSuccess = true}
		mark_safe_for_shutdown
		memcard_sequence_generic_done
		return
	endif
	memcard_validate_card_data \{StorageSelectorForce = 0
		ValidatePrev = 0}
	if (<found> = 1)
		goto \{memcard_load_file
			params = {
				LoadConfirmed = 1
			}}
	else
		goto \{memcard_save_file}
	endif
endscript
new_secondary_signin_states = [
	none
	none
	none
	none
]

script memcard_secondary_signin_first_press 
	printf \{'memcard_secondary_signin_first_press'}
	if IsPs3
		return \{false}
	endif
	if ($primary_controller_assigned = 1)
		GetArraySize \{$new_secondary_signin_states}
		i = 0
		begin
		if NOT (<i> = $primary_controller)
			if CheckForSignIn local controller_index = <i>
				SetArrayElement ArrayName = new_secondary_signin_states GlobalArray index = <i> newvalue = signin
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script memcard_handle_secondary_signin 
	printf 'memcard_handle_secondary_signin %d' d = <controller>
	if IsPs3
		return \{false}
	endif
	if CheckForSignIn local controller_index = <controller>
		SetArrayElement ArrayName = new_secondary_signin_states GlobalArray index = <controller> newvalue = signin
	else
		get_savegame_from_controller controller = <controller>
		reset_globaltags savegame = <savegame>
		SetArrayElement ArrayName = new_secondary_signin_states GlobalArray index = <controller> newvalue = none
	endif
	KillSpawnedScript \{name = memcard_handle_secondary_signin_spawned}
	spawnscriptnow \{memcard_handle_secondary_signin_spawned}
endscript

script memcard_handle_secondary_signin_spawned 
	wait_for_blade_complete
	ui_event_get_stack
	if NOT ((<stack> [0].base_name) = 'band_mode')
		return
	endif
	memcard_load_any_secondary_signins
endscript

script memcard_load_any_secondary_signins 
	printf \{'memcard_load_any_secondary_signins'}
	if IsPs3
		return \{false}
	endif
	GetArraySize \{$new_secondary_signin_states}
	i = 0
	begin
	if (($new_secondary_signin_states) [<i>] = signin)
		ui_memcard_secondary_siginin_load \{event = menu_back}
		return \{true}
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script memcard_get_new_secondary_signin 
	printf \{'memcard_get_new_secondary_signin'}
	if IsPs3
		return \{false}
	endif
	GetArraySize \{$new_secondary_signin_states}
	i = 0
	begin
	if (($new_secondary_signin_states) [<i>] = signin)
		if GotParam \{controller}
			more_to_come = 1
		else
			SetArrayElement ArrayName = new_secondary_signin_states GlobalArray index = <i> newvalue = none
			controller = <i>
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	if GotParam \{controller}
		return true more_to_come = <more_to_come> controller = <controller>
	endif
	return \{false}
endscript

script guitar_memcard_save_success_sound 
	SoundEvent \{event = Save_Confirmed_SFX}
endscript

script memcard_set_options_as_successor 
	if IsNgc
		wii_memcard_set_options_as_successor
	else
		ps2_memcard_set_options_as_successor
	endif
endscript

script memcard_overwrite_warning_ingame 
	if IsNgc
		memcard_check_for_existing_save
		if (<found> = 0)
			printf \{qs(0x857634d4)}
			wii_memcard_check_for_space
			if (<nospace> = 1)
				return \{flow_state = wii_memcard_insufficient_space_ingame_fs}
			elseif (<noinode> = 1)
				return \{flow_state = wii_memcard_insufficient_inode_ingame_fs}
			endif
			return \{flow_state = wii_memcard_no_save_ingame_fs}
		else
			SetSaveFileName FileType = Progress name = ($memcard_file_types [$progressFileTypeIndex].file_name)
			if IsSaveCorrupt \{FileType = Progress}
				return \{flow_state = wii_memcard_corrupt_ingame_fs}
			elseif
				return \{flow_state = wii_memcard_overwrite_warning_ingame_fs}
			endif
		endif
	else
		return \{flow_state = ps2_memcard_overwrite_warning_ingame_fs}
	endif
endscript

script memcard_load_lose_progress_ingame 
	if IsNgc
		return \{flow_state = wii_memcard_load_lose_progress_ingame_fs}
	else
		return \{flow_state = ps2_memcard_load_lose_progress_ingame_fs}
	endif
endscript

script wii_memcard_sequence_begin_bootup 
	printf \{qs(0x2312b375)}
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_bootup_logic}
	change \{MemcardSavingOrLoading = Saving}
	change \{MemcardSuccess = false}
	change \{saveFileTypeIndex = $progressFileTypeIndex}
	change \{wii_need_jamsession_scan = true}
	wii_data_check_and_load \{boot = 1}
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_save 
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	change \{MemcardSavingOrLoading = Saving}
	change \{MemcardSuccess = false}
	change \{saveFileTypeIndex = $progressFileTypeIndex}
	local_check_for_space = (<event_params>.check_for_space)
	local_boot = (<event_params>.boot)
	wii_memcard_save check_for_space = <local_check_for_space> boot = <local_boot>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_autosave 
	disable_pause
	mark_unsafe_for_shutdown
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_save_logic}
	change \{MemcardSavingOrLoading = Saving}
	change \{MemcardSuccess = false}
	change \{saveFileTypeIndex = $progressFileTypeIndex}
	GetGlobalTags \{user_options}
	if (<autosave> = 0)
		printf \{qs("\LAborting autosave due to option being off")}
		return \{memcard_status = none}
	endif
	wii_memcard_save
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_load \{event_params = {
			boot = 0
		}}
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_load_logic}
	change \{MemcardSavingOrLoading = loading}
	change \{MemcardSuccess = false}
	change \{saveFileTypeIndex = $progressFileTypeIndex}
	local_boot = (<event_params>.boot)
	wii_memcard_load boot = <local_boot>
	printf qs(0xdfd29571) a = <memcard_status>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_autoload 
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_bootup_logic}
	change \{MemcardSavingOrLoading = Saving}
	change \{MemcardSuccess = false}
	change \{saveFileTypeIndex = $progressFileTypeIndex}
	wii_data_check_and_load
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_save_jam 
	mark_unsafe_for_shutdown
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_save_jam_logic}
	change \{MemcardSavingOrLoading = Saving}
	change \{MemcardSuccess = false}
	change \{saveFileTypeIndex = $jamSessionFileTypeIndex}
	change \{wii_need_jamsession_scan = true}
	GetSongInfo
	change memcard_jamsession_song_version = <song_version>
	change memcard_jamsession_downloaded = <downloaded>
	if GotParam \{fileid}
		change memcard_jamsession_fileid = <fileid>
	endif
	change memcard_jamsession_artist = <artist>
	change memcard_jamsession_playback_track1 = <playback_track1>
	change memcard_jamsession_playback_track2 = <playback_track2>
	change memcard_jamsession_playback_track_drums = <playback_track_drums>
	change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	local_check_for_space = (<event_params>.check_for_space)
	local_boot = (<event_params>.boot)
	wii_memcard_save FileType = jamsession check_for_space = <local_check_for_space> boot = <local_boot>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_load_jam 
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_load_logic}
	change \{MemcardSavingOrLoading = loading}
	change \{MemcardSuccess = false}
	change \{saveFileTypeIndex = $jamSessionFileTypeIndex}
	local_boot = (<event_params>.boot)
	wii_memcard_load boot = <local_boot> FileType = jamsession
	printf qs(0xdfd29571) a = <memcard_status>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_delete_jam 
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	change \{MemcardRetryScript = memcard_sequence_begin_load_logic}
	change \{MemcardSavingOrLoading = deleting}
	change \{MemcardSuccess = false}
	change \{saveFileTypeIndex = $jamSessionFileTypeIndex}
	change \{wii_need_jamsession_scan = true}
	wii_memcard_delete \{FileType = jamsession}
	printf qs(0xf4e8c5d2) a = <memcard_status>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_rename_jam 
	spawnscriptnow memcard_sequence_begin_rename_jam_logic params = <...>
endscript

script guitar_memcard_save_success_sound 
	SoundEvent \{event = generic_menu_up_or_down_sound}
endscript
