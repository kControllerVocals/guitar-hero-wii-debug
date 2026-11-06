max_memcard_filename_length = 15
savingorloading = saving
memcard_default_title = 'Guitar Hero Metallica'
memcard_content_name = 'Progress'
memcard_content_jamsession_name = 'CustomSongs'
damagedfile = qs(0xd66d8e40)
badversionnumber = qs(0xec29a683)
save_data_dirty = 0
0x64fa86d1 = 0x00000000
memcard_file_types = {
	progress = {
		file_name = 'GH4Progress'
		prefix = 'GH4Prog'
		version = 70
		fixed_size = 900000
	}
	jamsession = {
		file_name = 'JamSave'
		file_temp = 'JamTemp'
		prefix = 'JamSave'
		version = 80
		fixed_size = 102000
	}
}
memcard_file_types_ps2 = {
	progress = {
		file_name = 'GH4Progress'
		suffix = 'Progress'
		folder_name = 'GH Metallica'
		icon = 'memcard\\cas.png'
		version = 54
		fixed_size = 409600
		menu_text = qs(0x9d87ba69)
		menu_icon = logo_cas
		suffix = ''
	}
	jamsession = {
		file_name = 'GH4JamSession'
		suffix = '-jam'
		folder_name = 'GH Metallica'
		icon = 'memcard\\cas.png'
		version = 80
		fixed_size = 102400
		menu_text = qs(0xfbf74b72)
		menu_icon = thpg
	}
}
memcard_folder_desc = {
	guitarcontent = {
		icon_xen = 'memcard\\gh.png'
		icon_ps3 = 'memcard\\ICON0.PNG'
		file_types = [
			{
				name = progress
				slots_reserve = 1
			}
		]
	}
	jamsessionscontent = {
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
	if NOT gotparam \{filetype}
		scriptassert \{qs(0xca083485)}
	endif
	switch <filetype>
		case progress
		filename = ($memcard_file_types.progress.file_name)
		case jamsession
		filename = ($memcard_file_types.jamsession.file_name)
		default
		scriptassert qs(0x9a976be9) a = <filetype>
	endswitch
	return filename = <filename>
endscript
memcarddonescript = nullscript
memcardretryscript = nullscript
memcardsavingorloading = saving
memcardsuccess = false
memcardcontroller = $primary_controller
memcardinitialboot = false
memcardjamordefault = `default`

script memcard_choose_storage_device \{storageselectorforce = 0}
	printscriptinfo \{'==> memcard_choose_storage_device'}
	create_checking_memory_card_screen
	wait \{1
		seconds}
	mc_setactiveplayer userid = ($memcardcontroller)
	if NOT cardisinslot
		if (<storageselectorforce> = 0)
			goto \{create_storagedevice_warning_menu}
		endif
	endif
	dump
	showstorageselector force = <storageselectorforce> filetype = progress
endscript

script memcard_check_for_previously_used_folder 
	mc_waitasyncopsfinished
	memcard_check_for_card
	if (<filetype> = jamsession)
		<foldername> = $memcard_content_jamsession_name
	else
		<foldername> = $memcard_content_name
	endif
	mc_setactivefolder foldername = <foldername>
	if mc_hasvalidatedfolder
		printf \{qs(0xa0f86458)}
		return \{found = 1
			corrupt = 0}
	else
		memcard_enum_folders
		if NOT mc_folderexists foldername = <foldername>
			printf \{qs(0x16bcd50d)}
			return \{found = 0
				corrupt = 0}
		endif
		mc_setactivefolder foldername = <foldername>
		mc_loadtocinactivefolder
		if (<result> = true)
			if mc_hasvalidatedfolder
				printf \{qs(0xdc39d0c1)}
				return \{found = 1
					corrupt = 0}
			else
				printf \{qs(0x0fa7e44c)}
				return \{found = 0
					corrupt = 0}
			endif
		else
			if (<errorcode> = corrupt)
				printf \{qs(0x248ab78f)}
				return \{found = 1
					corrupt = 1}
			else
				printf \{qs(0x3d9186ce)}
				return \{found = 0
					corrupt = 0}
			endif
		endif
	endif
endscript

script memcard_enum_folders 
	mc_enumeratefolders
	if (<result> = false)
		memcard_error \{error = create_storagedevice_warning_menu}
	endif
endscript

script memcard_check_for_existing_save \{filetype = null}
	if (filetype = null)
		filetype = $0x64fa86d1
	endif
	if memcardfileexists name = $memcard_file_name filetype = <filetype>
		return \{found = 1
			corrupt = 0}
	else
		return \{found = 0
			corrupt = 0}
	endif
	return \{found = 0
		corrupt = 0}
endscript

script memcard_wait_for_timer \{time = 3.0}
	begin
	if timegreaterthan <time>
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script is_autosave_on 
	requireparams \{[
			savegame
		]}
	getglobaltags user_options savegame = <savegame>
	if (<autosave> = 1)
		return \{true}
	endif
	return \{false}
endscript

script memcard_save_file \{overwriteconfirmed = 0}
	printf \{qs(0x63276b9b)}
	mark_unsafe_for_shutdown
	change \{memcardsavingorloading = saving}
	memcard_check_for_card
	resettimer
	<overwrite> = 0
	if mc_folderexists \{foldername = $memcard_content_name}
		if (<overwriteconfirmed> = 1)
			<overwrite> = 1
			create_overwrite_menu
			resettimer
			mc_setactivefolder \{foldername = $memcard_content_name}
		else
			goto \{create_confirm_overwrite_menu}
		endif
	else
		create_save_menu
		resettimer
		mc_createfolder \{name = $memcard_content_name
			desc = guitarcontent}
		if (<result> = false)
			if (<errorcode> = outofspace)
				memcard_error \{error = create_out_of_space_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
		get_savegame_from_controller controller = ($memcardcontroller)
		setglobaltags user_options savegame = <savegame> params = {autosave = 1}
	endif
	mc_setactivefolder \{foldername = $memcard_content_name}
	mc_loadtocinactivefolder
	memcard_pre_save_progress
	write_globals_to_global_tags
	pushtempmemcardpools \{heap = heap_bink}
	savetomemorycard \{filename = $memcard_file_name
		filetype = progress
		usepaddingslot = always}
	poptempmemcardpools
	if (<result> = false)
		if (<errorcode> = outofspace)
			memcard_error \{error = create_out_of_space_menu}
		else
			if (<errorcode> = corrupt)
				memcard_error \{error = create_corrupted_data_menu}
			elseif (<overwrite> = 1)
				memcard_error \{error = create_overwrite_failed_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	if (<overwrite> = 1)
		create_overwrite_success_menu
	else
		create_save_success_menu
	endif
	guitar_memcard_save_success_sound
	wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_delete_file \{file_type = `default`}
	printf \{qs(0x810fae7c)}
	mark_unsafe_for_shutdown
	create_delete_file_menu
	mc_waitasyncopsfinished
	if isps3
		createscreenelement \{type = spriteelement
			id = ps3_delete_fader
			parent = root_window
			texture = black
			rgba = [
				0
				0
				0
				255
			]
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = $ps3_fade_overlay_z
			alpha = 1.0}
		mc_startps3forcedelete
		begin
		if mc_isps3forcedeletefinished
			break
		endif
		wait \{1
			gameframes}
		repeat
		refresh_jam_directory_contents
		if NOT (<file_type> = jam_file)
			mc_setactivefolder \{foldername = $memcard_content_name}
			mc_loadtocinactivefolder
		endif
		destroyscreenelement \{id = ps3_delete_fader}
	else
		if (<file_type> = `default`)
			if mc_folderexists \{foldername = $memcard_content_name}
				resettimer
				mc_deletefolder \{foldername = $memcard_content_name}
				if (<result> = false)
					memcard_error \{error = create_delete_failed_menu}
				endif
				memcard_wait_for_timer
			endif
		endif
		if (<file_type> = jam_file)
			if mc_folderexists \{foldername = $memcard_content_jamsession_name}
				resettimer
				mc_deletefolder \{foldername = $memcard_content_jamsession_name}
				if (<result> = false)
					memcard_error \{error = create_delete_failed_menu}
				endif
				memcard_wait_for_timer
				create_delete_success_menu
			endif
		endif
		wait \{1
			seconds}
	endif
	if cd
		deleteallsongdatafromfile
	endif
	memcard_check_for_card
	memcard_sequence_retry
endscript

script memcard_load_file \{loadconfirmed = 0}
	mark_unsafe_for_shutdown
	printf \{qs(0x03a3bf83)}
	change \{memcardsavingorloading = loading}
	mc_waitasyncopsfinished
	memcard_check_for_card
	resettimer
	if mc_folderexists \{foldername = $memcard_content_name}
		if (<loadconfirmed> = 1)
			mc_setactivefolder \{foldername = $memcard_content_name}
		else
			goto \{create_confirm_load_menu}
		endif
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	mc_setactivefolder \{foldername = $memcard_content_name}
	create_load_file_menu
	pushtempmemcardpools \{heap = heap_bink}
	loadfrommemorycard \{filename = $memcard_file_name
		filetype = progress}
	poptempmemcardpools
	if (<result> = false)
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
		mc_loadtocinactivefolder
		getmemcarddirectorylisting
		if (<result> = false)
			if (<errorcode> = corrupt)
				memcard_error \{error = create_corrupted_data_menu
					params = {
						file_type = jam_file
					}}
			else
				memcard_error \{error = create_load_failed_menu}
			endif
		endif
		if gotparam \{directorylisting}
			change jam_curr_directory_listing = <directorylisting>
		else
			change \{jam_curr_directory_listing = [
				]}
		endif
	else
		change \{jam_curr_directory_listing = [
			]}
	endif
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	create_load_success_menu
	memcard_post_load_progress
	wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_pre_save_progress 
endscript

script memcard_post_load_progress 
	if (($primary_controller) = $memcardcontroller)
		restore_globals_from_global_tags
	endif
	scan_globaltag_downloads
	refresh_autokick_cheat
	get_savegame_from_controller \{controller = $memcardcontroller}
	reset_transient_tags savegame = <savegame>
endscript

script refresh_autokick_cheat 
	controller = 0
	max_controllers = 4
	getsavegamefromcontroller controller = <controller>
	getglobaltags user_options savegame = <savegame>
	if (<unlock_cheat_zombband> = 1)
		if (<cheat_index0> = 1)
			turn_on_zombie = 1
		elseif (<cheat_index0> = 2)
			turn_on_alt = 1
		endif
	endif
	if (<unlock_cheat_autokick> = 1 && <cheat_index9> = 1)
		turn_on_autokick = 1
	endif
	if (<unlock_cheat_alwaysslide> = 1 && <cheat_index2> = 1)
		turn_on_autoslide = 1
	endif
	if (<unlock_cheat_performancemode> = 1 && <cheat_index5> = 1)
		turn_on_preformance = 1
	endif
	if (<unlock_cheat_freedrum> = 1 && <cheat_index1> = 1)
		turn_on_drumfill = 1
	endif
	if (<unlock_cheat_blackhighway> = 1 && <cheat_index10> = 1)
		turn_on_blackhighway = 1
	endif
	if (<unlock_cheat_line6unlock> = 1)
		turn_on_line6 = 1
	endif
	if gotparam \{turn_on_zombie}
		change \{cheat_zombband = 1}
	else
		change \{cheat_zombband = 0}
	endif
	if gotparam \{turn_on_alt}
		change \{cheat_altband = 1}
	else
		change \{cheat_altband = 0}
	endif
	if gotparam \{turn_on_autokick}
		change \{cheat_autokick = 1}
	else
		change \{cheat_autokick = 2}
	endif
	if gotparam \{turn_on_autoslide}
		change \{cheat_alwaysslide = 1}
	else
		change \{cheat_alwaysslide = 2}
	endif
	if gotparam \{turn_on_preformance}
		change \{cheat_performancemode = 1}
	else
		change \{cheat_performancemode = 2}
	endif
	if gotparam \{turn_on_drumfill}
		change \{cheat_freedrum = 1}
	else
		change \{cheat_freedrum = 2}
	endif
	if gotparam \{turn_on_blackhighway}
		change \{cheat_blackhighway = 1}
	else
		change \{cheat_blackhighway = 2}
	endif
	if gotparam \{turn_on_line6}
		change \{cheat_line6unlock = 1}
	else
		change \{cheat_line6unlock = 0}
	endif
	printstruct <...>
endscript

script memcard_cleanup_messages 
	destroy_popup_warning_menu
endscript

script memcard_sequence_generic_done 
	if ($memcardsavingorloading = saving)
		if ($memcardsuccess = true)
			printf \{qs(0xe2a29101)}
			ui_memcard_finish success = save controller = ($memcardcontroller)
		else
			printf \{qs(0x9f566822)}
			mc_setactivefolder \{folderindex = -1}
			ui_memcard_finish failed = save controller = ($memcardcontroller)
		endif
	else
		if ($memcardsuccess = true)
			printf \{qs(0x0e63bd4a)}
			ui_memcard_finish success = load controller = ($memcardcontroller)
		else
			printf \{qs(0x264adb01)}
			mc_setactivefolder \{folderindex = -1}
			ui_memcard_finish failed = load controller = ($memcardcontroller)
		endif
	endif
	if ($0x64fa86d1 = jamsession)
		change \{jam_selected_song = $memcard_jamsession_file_name}
	endif
endscript

script memcard_sequence_retry 
	printf \{qs(0x879b8ee7)}
	mc_waitasyncopsfinished
	goto $memcardretryscript params = {<...> controller = ($memcardcontroller)}
endscript

script memcard_disable_saves_and_quit 
	get_savegame_from_controller controller = ($memcardcontroller)
	setglobaltags user_options savegame = <savegame> params = {autosave = 0}
	memcard_sequence_quit
endscript

script memcard_sequence_quit 
	printf \{qs(0x5dba2148)}
	mark_safe_for_shutdown
	goto $memcarddonescript params = <...>
endscript

script memcard_check_for_card 
	if NOT cardisinslot
		goto create_storagedevice_warning_menu params = <...>
	endif
endscript

script memcard_error 
	printf \{qs(0x81c80e89)}
	requireparams \{[
			error
		]
		all}
	memcard_check_for_card
	goto <error> params = <params>
endscript

script memcard_sequence_cleanup_generic 
	mc_waitasyncopsfinished
	memcard_cleanup_messages
	change \{memcarddonescript = nullscript}
	change \{memcardretryscript = nullscript}
	change \{memcardcontroller = $primary_controller}
	mc_setactiveplayer \{querydefault}
endscript

script memcard_validate_card_data \{storageselectorforce = 0
		validateprev = 0
		filetype = progress}
	mc_setactiveplayer userid = ($memcardcontroller)
	memcard_choose_storage_device storageselectorforce = <storageselectorforce>
	memcard_check_for_card <...>
	if (<validateprev> = 1)
		memcard_check_for_previously_used_folder filetype = <filetype>
	else
		memcard_check_for_existing_save
	endif
	requireparams \{[
			found
			corrupt
		]
		all}
	if (<corrupt> = 1)
		if (<filetype> = progress)
			refresh_jam_directory_contents
			mc_setactivefolder \{foldername = $memcard_content_name}
			mc_loadtocinactivefolder
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
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
		mc_loadtocinactivefolder
		getmemcarddirectorylisting
		if NOT (<result> = false)
			if gotparam \{directorylisting}
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
	printf \{qs(0xf46a9374)}
	mc_waitasyncopsfinished
	mark_unsafe_for_shutdown
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_bootup_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = true}
	change \{memcardjamordefault = `default`}
	change \{0x64fa86d1 = progress}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_load_check_status_boot_fs
		}}
	return
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
	if (<found> = 1)
		goto \{memcard_load_file
			params = {
				loadconfirmed = 1
			}}
	else
		goto \{memcard_save_file
			params = {
				boot = 1
			}}
	endif
endscript

script memcard_sequence_begin_save_logic \{storageselectorforce = 1
		controller = $primary_controller}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = `default`}
	ps2_memcard_set_autosave \{autosave = 0}
	change \{0x64fa86d1 = progress}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}}
	return
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
	goto \{memcard_save_file}
endscript

script memcard_sequence_begin_autosave_logic \{controller = $primary_controller}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	disable_pause
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = `default`}
	get_savegame_from_controller controller = <controller>
	getglobaltags user_options savegame = <savegame>
	if (<autosave> = 0 && <requested_autosave> = 0)
		printf \{qs(0x4c1699ec)}
		goto \{memcard_sequence_quit}
	endif
	if (<requested_autosave> = 1)
		ps2_memcard_set_autosave \{autosave = 0}
	else
		ps2_memcard_set_autosave \{autosave = 1}
	endif
	change \{0x64fa86d1 = progress}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}}
	return
	mc_setactiveplayer userid = <controller>
	if NOT cardisinslot
		goto \{create_storagedevice_warning_menu}
	endif
	memcard_validate_card_data \{storageselectorforce = 0
		validateprev = 1}
	if (<found> = 1)
		goto \{memcard_save_file
			params = {
				overwriteconfirmed = 1
			}}
	else
		memcard_sequence_retry
	endif
endscript

script memcard_sequence_begin_load_logic \{storageselectorforce = 1
		controller = $primary_controller}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_load_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = `default`}
	change \{0x64fa86d1 = progress}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_load_check_status_ingame_fs
		}}
	return
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
	goto \{memcard_load_file}
endscript

script memcard_sequence_begin_autoload_logic \{controller = $primary_controller}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_bootup_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = `default`}
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 0
	if (<found> = 1)
		goto \{memcard_load_file
			params = {
				loadconfirmed = 1
			}}
	else
		goto \{memcard_save_file}
	endif
endscript

script jam_memcard_validate_card_data \{storageselectorforce = 0}
	memcard_validate_card_data storageselectorforce = <storageselectorforce> validateprev = 1 filetype = jamsession
	return <...>
endscript

script memcard_sequence_begin_save_jam_logic \{storageselectorforce = 0
		controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0x3ab2ee1c)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_jam_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = jam}
	jam_publish_update_playback_track \{guitar_num = 1}
	jam_publish_update_playback_track \{guitar_num = 2}
	downloaded = 0
	getsonginfo
	change memcard_jamsession_song_version = <song_version>
	change memcard_jamsession_downloaded = <downloaded>
	if gotparam \{fileid}
		change memcard_jamsession_fileid = <fileid>
	endif
	change memcard_jamsession_playback_track1 = <playback_track1>
	change memcard_jamsession_playback_track2 = <playback_track2>
	change memcard_jamsession_playback_track_drums = <playback_track_drums>
	change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	ps2_memcard_set_autosave \{autosave = 0}
	change \{0x64fa86d1 = jamsession}
	spawnscriptnow \{start_flow_manager
		params = {
			flow_state = ps2_memcard_save_check_status_ingame_fs
		}}
	return
	<card_was_in_slot> = false
	if cardisinslot
		<card_was_in_slot> = true
	endif
	jam_memcard_validate_card_data <...>
	if (<corrupt> = 0)
		goto memcard_save_jam params = {card_was_in_slot = <card_was_in_slot>}
	endif
endscript

script memcard_save_jam \{overwriteconfirmed = 0
		card_was_in_slot = true}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcardsavingorloading = saving}
	memcard_check_for_card
	resettimer
	printf \{channel = jam_mode
		qs(0xf6157763)}
	memcard_enum_folders
	create_save_menu
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		if (<card_was_in_slot> = false)
			if (<overwriteconfirmed> = 1)
				<overwrite> = 1
				create_overwrite_menu
				resettimer
				mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
			else
				goto \{create_confirm_overwrite_menu}
			endif
		else
			mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
		endif
	else
		mc_createfolder \{name = $memcard_jamsession_content_name
			desc = jamsessionscontent}
		if (<result> = false)
			if (<errorcode> = outofspace)
				memcard_error \{error = create_out_of_space_menu}
			else
				memcard_error \{error = create_save_failed_menu}
			endif
		endif
	endif
	mc_loadtocinactivefolder
	jam_publish_update_playback_track \{guitar_num = 1}
	jam_publish_update_playback_track \{guitar_num = 2}
	jam_publish_update_playback_drumvocal_track
	downloaded = 0
	getsonginfo
	change memcard_jamsession_song_version = <song_version>
	change memcard_jamsession_downloaded = <downloaded>
	if gotparam \{fileid}
		change memcard_jamsession_fileid = <fileid>
	endif
	change memcard_jamsession_artist = <artist>
	change memcard_jamsession_playback_track1 = <playback_track1>
	change memcard_jamsession_playback_track2 = <playback_track2>
	change memcard_jamsession_playback_track_drums = <playback_track_drums>
	change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	savetomemorycard \{filename = $memcard_jamsession_file_name
		filetype = jamsession
		usepaddingslot = never}
	if (<result> = false)
		if (<errorcode> = outofspace)
			memcard_error \{error = create_out_of_space_menu}
		elseif (<errorcode> = badfolder)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_save_failed_menu}
		endif
	endif
	loadfrommemorycard \{filename = $memcard_jamsession_file_name
		filetype = jamsession}
	if (<result> = false)
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	change \{jam_selected_song = $memcard_jamsession_file_name}
	getmemcarddirectorylisting
	change jam_curr_directory_listing = <directorylisting>
	printf \{channel = jam_mode
		qs(0x98e3ad04)}
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	create_save_success_menu
	guitar_memcard_save_success_sound
	wait \{1
		seconds}
	if NOT mc_folderexists \{foldername = $memcard_content_name}
		if NOT mc_spacefornewfolder \{desc = guitarcontent}
			memcard_error \{error = create_out_of_space_menu
				params = {
					message_type = progress
				}}
		endif
	endif
	memcard_sequence_quit
	printf \{channel = jam_mode
		qs(0xe4d22b14)}
endscript

script memcard_sequence_begin_load_jam_logic \{storageselectorforce = 0
		controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0x1be7f8f0)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_load_jam_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = jam}
	change \{0x64fa86d1 = jamsession}
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
	mc_waitasyncopsfinished
	change \{memcardsavingorloading = loading}
	memcard_check_for_card
	resettimer
	printf \{channel = jam_mode
		qs(0xc201140a)}
	memcard_enum_folders
	create_load_file_menu
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	mc_loadtocinactivefolder
	if (<result> = false)
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	loadfrommemorycard \{filename = $memcard_jamsession_file_name
		filetype = jamsession}
	if (<result> = false)
		if (<errorcode> = corrupt)
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
		qs(0x21ff1e27)}
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	create_load_success_menu
	wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_sequence_begin_rename_jam_logic \{controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0x1be7f8f0)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_rename_jam_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = jam}
	jam_memcard_validate_card_data <...>
	goto \{memcard_rename_jam}
endscript

script memcard_rename_jam 
	printf \{channel = jam_mode
		qs(0x2e8352e2)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcardsavingorloading = loading}
	memcard_check_for_card
	resettimer
	printf \{channel = jam_mode
		qs(0x56078b7d)}
	memcard_enum_folders
	create_save_menu
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	mc_loadtocinactivefolder
	mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	renamememcardfile \{filename = $memcard_jamsession_file_name
		filetype = jamsession
		newfilename = $memcard_jamsession_new_file_name}
	if (<result> = false)
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_load_failed_menu}
		endif
	endif
	savetomemorycard \{filename = $memcard_jamsession_new_file_name
		filetype = jamsession
		usepaddingslot = never}
	if (<result> = false)
		if (<errorcode> = outofspace)
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
	getmemcarddirectorylisting
	change jam_curr_directory_listing = <directorylisting>
	printf \{channel = jam_mode
		qs(0x6c35e2b6)}
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	create_rename_success_menu
	guitar_memcard_save_success_sound
	wait \{1
		seconds}
	memcard_sequence_quit
endscript

script memcard_sequence_begin_delete_jam_logic \{controller = $primary_controller}
	printf \{channel = jam_mode
		qs(0xb777ae6b)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_delete_jam_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change memcardcontroller = <controller>
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = jam}
	change \{0x64fa86d1 = jamsession}
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
		qs(0x45db1907)}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcardsavingorloading = saving}
	memcard_check_for_card
	resettimer
	memcard_enum_folders
	create_delete_menu
	if mc_folderexists \{foldername = $memcard_jamsession_content_name}
		mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	else
		memcard_error \{error = create_no_save_found_menu}
	endif
	mc_loadtocinactivefolder
	mc_setactivefolder \{foldername = $memcard_jamsession_content_name}
	deletememcardfile \{filename = $memcard_jamsession_file_name
		filetype = jamsession}
	if (<result> = false)
		if (<errorcode> = corrupt)
			memcard_error \{error = create_corrupted_data_menu
				params = {
					file_type = jam_file
				}}
		else
			memcard_error \{error = create_save_failed_menu}
		endif
	endif
	getmemcarddirectorylisting
	change jam_curr_directory_listing = <directorylisting>
	change \{memcardsuccess = true}
	memcard_wait_for_timer
	create_delete_success_menu
	guitar_memcard_save_success_sound
	wait \{1
		seconds}
	memcard_sequence_quit
	printf \{channel = jam_mode
		qs(0x6b4e39fd)}
endscript

script memcard_sequence_begin_ss_load_logic \{controller = $primary_controller}
	printf \{'memcard_sequence_begin_ss_load_logic'}
	mark_unsafe_for_shutdown
	mc_waitasyncopsfinished
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_ss_load_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardinitialboot = false}
	change \{memcardjamordefault = `default`}
	if memcard_get_new_secondary_signin
		change \{memcardsuccess = false}
		change memcardcontroller = <controller>
		if gotparam \{more_to_come}
			change \{memcarddonescript = memcard_sequence_begin_ss_load_logic}
		endif
	else
		change \{memcardsuccess = true}
		mark_safe_for_shutdown
		memcard_sequence_generic_done
		return
	endif
	memcard_validate_card_data \{storageselectorforce = 0
		validateprev = 0}
	if (<found> = 1)
		goto \{memcard_load_file
			params = {
				loadconfirmed = 1
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
	if isps3
		return \{false}
	endif
	if ($primary_controller_assigned = 1)
		getarraysize \{$new_secondary_signin_states}
		i = 0
		begin
		if NOT (<i> = $primary_controller)
			if checkforsignin local controller_index = <i>
				setarrayelement arrayname = new_secondary_signin_states globalarray index = <i> newvalue = signin
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script memcard_handle_secondary_signin 
	printf 'memcard_handle_secondary_signin %d' d = <controller>
	if isps3
		return \{false}
	endif
	if checkforsignin local controller_index = <controller>
		setarrayelement arrayname = new_secondary_signin_states globalarray index = <controller> newvalue = signin
	else
		get_savegame_from_controller controller = <controller>
		reset_globaltags savegame = <savegame>
		setarrayelement arrayname = new_secondary_signin_states globalarray index = <controller> newvalue = none
	endif
	killspawnedscript \{name = memcard_handle_secondary_signin_spawned}
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
	scriptassert \{qs(0x2c2b1078)}
	printf \{'memcard_load_any_secondary_signins'}
	if isps3
		return \{false}
	endif
	getarraysize \{$new_secondary_signin_states}
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
	if isps3
		return \{false}
	endif
	getarraysize \{$new_secondary_signin_states}
	i = 0
	begin
	if (($new_secondary_signin_states) [<i>] = signin)
		if gotparam \{controller}
			more_to_come = 1
		else
			setarrayelement arrayname = new_secondary_signin_states globalarray index = <i> newvalue = none
			controller = <i>
		endif
	endif
	i = (<i> + 1)
	repeat <array_size>
	if gotparam \{controller}
		return true more_to_come = <more_to_come> controller = <controller>
	endif
	return \{false}
endscript

script guitar_memcard_save_success_sound 
	soundevent \{event = save_confirmed_sfx}
endscript

script dim_save_option_for_guest 
endscript

script memcard_set_options_as_successor 
	if isngc
		0xfa4566a5
	else
		ps2_memcard_set_options_as_successor
	endif
endscript

script memcard_overwrite_warning_ingame 
	if isngc
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
			setsavefilename filetype = progress name = ($memcard_file_types.progress.file_name)
			if issavecorrupt \{filetype = progress}
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
	if isngc
		return \{flow_state = wii_memcard_load_lose_progress_ingame_fs}
	else
		return \{flow_state = ps2_memcard_load_lose_progress_ingame_fs}
	endif
endscript

script wii_memcard_sequence_begin_bootup 
	printf \{qs(0x2312b375)}
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_bootup_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change \{0x64fa86d1 = progress}
	change \{wii_need_jamsession_scan = true}
	wii_data_check_and_load \{boot = 1}
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_save 
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change \{0x64fa86d1 = progress}
	local_check_for_space = (<event_params>.check_for_space)
	local_boot = (<event_params>.boot)
	0x8dbdaee4 \{qs(0xaec0694a)}
	0xe6b61ea6 <...>
	wii_memcard_save check_for_space = <local_check_for_space> boot = <local_boot> 0xc6b6bd22 = 'yes'
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_autosave 
	disable_pause
	mark_unsafe_for_shutdown
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change \{0x64fa86d1 = progress}
	getglobaltags \{user_options}
	if (<autosave> = 0)
		printf \{qs(0x4c1699ec)}
		return \{memcard_status = none}
	endif
	wii_memcard_save
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_load \{event_params = {
			boot = 0
		}}
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_load_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardsuccess = false}
	change \{0x64fa86d1 = progress}
	local_boot = (<event_params>.boot)
	wii_memcard_load boot = <local_boot>
	printf qs(0xdfd29571) a = <memcard_status>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_autoload 
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_bootup_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change \{0x64fa86d1 = progress}
	wii_data_check_and_load
	return memcard_status = <memcard_status>
endscript

script 0x83865a30 
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change \{0x64fa86d1 = progress}
	wii_replace_file \{boot = 0}
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_save_jam 
	mark_unsafe_for_shutdown
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_save_jam_logic}
	change \{memcardsavingorloading = saving}
	change \{memcardsuccess = false}
	change \{0x64fa86d1 = jamsession}
	change \{wii_need_jamsession_scan = true}
	getsonginfo
	change memcard_jamsession_song_version = <song_version>
	change memcard_jamsession_downloaded = <downloaded>
	if gotparam \{fileid}
		change memcard_jamsession_fileid = <fileid>
	endif
	change memcard_jamsession_artist = <artist>
	change memcard_jamsession_playback_track1 = <playback_track1>
	change memcard_jamsession_playback_track2 = <playback_track2>
	change memcard_jamsession_playback_track_drums = <playback_track_drums>
	change memcard_jamsession_playback_track_vocals = <playback_track_vocals>
	local_check_for_space = (<event_params>.check_for_space)
	local_boot = (<event_params>.boot)
	wii_memcard_save filetype = jamsession check_for_space = <local_check_for_space> boot = <local_boot>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_load_jam 
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_load_logic}
	change \{memcardsavingorloading = loading}
	change \{memcardsuccess = false}
	change \{0x64fa86d1 = jamsession}
	local_boot = (<event_params>.boot)
	wii_memcard_load boot = <local_boot> filetype = jamsession
	printf qs(0xdfd29571) a = <memcard_status>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_delete_jam 
	change \{memcarddonescript = memcard_sequence_generic_done}
	change \{memcardretryscript = memcard_sequence_begin_load_logic}
	change \{memcardsavingorloading = deleting}
	change \{memcardsuccess = false}
	change \{0x64fa86d1 = jamsession}
	change \{wii_need_jamsession_scan = true}
	wii_memcard_delete \{filetype = jamsession}
	printf qs(0xf4e8c5d2) a = <memcard_status>
	return memcard_status = <memcard_status>
endscript

script wii_memcard_sequence_begin_rename_jam 
	spawnscriptnow memcard_sequence_begin_rename_jam_logic params = <...>
endscript

script guitar_memcard_save_success_sound 
	soundevent \{event = generic_menu_up_or_down_sound}
endscript
