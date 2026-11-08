ps2_saveload_successor = null_flow_state
ps2_saveload_successor_action_state = {
}
GH4ProgressIconSpaceRequired = 74
GH4JamSessionIconSpaceRequired = 74
restartMenuMusic = 0

script ps2_leave_saveload_flow 
	Wait \{5
		gameframe}
	destroy_ps2_trc_menu
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = leave_saveload_flow
		}}
	if ($restartMenuMusic = 1)
		change \{restartMenuMusic = 0}
		spawnscriptnow \{menu_music_on
			params = {
				setflag = 1
			}}
	endif
endscript

script ps2_memcard_load_check_status 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{3
		seconds}
	if NOT CardIsInSlot
		printf \{qs(0x01c0a07d)}
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = no_memcard
			}}
		return
	endif
	GetMemCardDirectoryListing \{FileType = jamsession}
	change jam_curr_directory_listing = <directorylisting>
	printstruct \{$jam_curr_directory_listing}
	if ($saveFileTypeIndex = $progressFileTypeIndex)
		printf \{qs(0x39797e05)}
		memcard_check_for_existing_save
		if (<found> = 0)
			change \{MemcardSavingOrLoading = Saving}
			printf \{qs(0x857634d4)}
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = no_save
				}}
			return
		else
			change \{MemcardSavingOrLoading = loading}
		endif
	endif
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = status_ok
		}}
endscript

script ps2_memcard_load 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{5
		gameframe}
	SetSaveFileName FileType = (($memcard_file_types_PS2 [$saveFileTypeIndex]).name) name = ($memcard_file_types_PS2 [$saveFileTypeIndex].file_name)
	GetGlobalTags \{globaltag_checksum
		params = globaltag_checksum}
	oldglobaltag_checksum = <globaltag_checksum>
	unload_songqpak
	MemPushContext \{heap_song}
	if LoadFromMemoryCard FileType = (($memcard_file_types_PS2 [$saveFileTypeIndex]).name)
		MemPopContext
		memcard_post_load_progress
		change \{MemcardSuccess = true}
	else
		MemPopContext
		if NOT CardIsInSlot
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = no_memcard
				}}
			return
		elseif GotParam \{CorruptedData}
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = corrupt_save
				}}
			return
		else
			printstruct x = <...>
			ScriptAssert \{qs(0xd3ef34a0)}
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = no_save
				}}
			return
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
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = corrupt_save
			}}
		return
	endif
	restore_options_from_global_tags
	scan_globaltag_downloads
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = load_complete
		}}
endscript

script ps2_memcard_delete_check_status 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{3
		seconds}
	if NOT CardIsInSlot
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = no_memcard
			}}
		return
	endif
	if NOT ($saveFileTypeIndex = $jamSessionFileTypeIndex)
		ScriptAssert \{qs(0x5d90db59)}
	endif
	if MemCardFileExists \{type = jamsession
			name = $memcard_jamsession_ps2_file_name}
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = status_ok
			}}
	else
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = no_save
			}}
	endif
endscript

script ps2_memcard_delete 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{5
		gameframe}
	SetSaveFileName FileType = (($memcard_file_types_PS2 [$saveFileTypeIndex]).name) name = ($memcard_file_types_PS2 [$saveFileTypeIndex].file_name)
	if DeleteMemCardFile FileType = (($memcard_file_types_PS2 [$saveFileTypeIndex]).name)
		printf \{qs(0x44d67523)}
		change \{MemcardSuccess = true}
	else
		if NOT CardIsInSlot
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = no_memcard
				}}
			return
		else
			printstruct x = <...>
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = corrupt_save
				}}
			return
		endif
	endif
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = delete_complete
		}}
endscript

script ps2_memcard_delete_complete 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{1
		second}
	if ($saveFileTypeIndex = $jamSessionFileTypeIndex)
		GetMemCardDirectoryListing \{FileType = jamsession}
		change jam_curr_directory_listing = <directorylisting>
		printstruct \{$jam_curr_directory_listing}
	endif
	ps2_leave_saveload_flow
endscript

script ps2_memcard_save_check_status \{no_check = 0
		check_for_existing = 0}
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{5
		gameframe}
	if ScreenElementExists \{id = gh3c_fade_box}
		DestroyScreenElement \{id = gh3c_fade_box}
	endif
	if (<no_check> = 0)
		if CardIsNew
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = new_memcard
				}}
			return
		endif
	endif
	if NOT CardIsInSlot
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = no_memcard
			}}
		return
	endif
	if NOT CardIsFormatted
		Wait \{5
			gameframe}
		if NOT CardIsFormatted
			if NOT CardIsInSlot
				spawnscriptnow \{ui_flow_manager_respond_to_action
					params = {
						action = no_memcard
					}}
				return
			endif
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = not_formatted
				}}
			return
		endif
	endif
	if ($saveFileTypeIndex = $progressFileTypeIndex)
		if (<check_for_existing> = 1)
			memcard_check_for_existing_save
			if NOT (<found> = 0)
				if NOT CardIsInSlot
					spawnscriptnow \{ui_flow_manager_respond_to_action
						params = {
							action = no_memcard
						}}
					return
				endif
				spawnscriptnow \{ui_flow_manager_respond_to_action
					params = {
						action = existing_save
					}}
				return
			endif
		endif
	endif
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = status_ok
		}}
endscript

script ps2_memcard_save 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{5
		gameframe}
	if ($progression_pop_count = 1)
		pop_later = 1
		progression_push_current
	else
		pop_later = 0
	endif
	SetSaveFileName FileType = (($memcard_file_types_PS2 [$saveFileTypeIndex]).name) name = (($memcard_file_types_PS2 [$saveFileTypeIndex]).file_name)
	memcard_pre_save_progress
	write_globals_to_global_tags
	unload_songqpak
	MemPushContext \{heap_song}
	if SaveToMemoryCard FileType = (($memcard_file_types_PS2 [$saveFileTypeIndex]).name)
		MemPopContext
		change \{MemcardSuccess = true}
	else
		MemPopContext
		printstruct x = <...>
		if SaveFailedDueToInsufficientSpace
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = insufficient_space
				}}
		else
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = error
				}}
		endif
		return
	endif
	if ($saveFileTypeIndex = $jamSessionFileTypeIndex)
		GetMemCardDirectoryListing \{FileType = jamsession}
		change jam_curr_directory_listing = <directorylisting>
	endif
	if (<pop_later> = 1)
		progression_pop_current
	endif
	destroy_ps2_saveload_screen
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = save_complete
		}}
endscript

script ps2_memcard_format_check_status 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{5
		gameframe}
	if CardIsNew
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = new_memcard
			}}
		return
	endif
	if CardIsFormatted
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = is_formatted
			}}
		return
	endif
	Wait \{5
		gameframe}
	if CardIsFormatted
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = is_formatted
			}}
		return
	endif
	if NOT CardIsInSlot
		spawnscriptnow \{ui_flow_manager_respond_to_action
			params = {
				action = no_memcard
			}}
		return
	endif
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = status_ok
		}}
endscript

script ps2_memcard_format 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{5
		gameframe}
	if NOT FormatCard
		if NOT CardIsInSlot
			spawnscriptnow \{ui_flow_manager_respond_to_action
				params = {
					action = no_memcard
				}}
			return
		else
			ScriptAssert \{qs(0xb47ceb35)}
		endif
	endif
	destroy_ps2_saveload_screen
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = success
		}}
endscript

script ps2_replace_file 
	ClearGlobalTags
	setup_globaltags
	DeleteMemCardFile FileType = (($memcard_file_types_PS2 [$saveFileTypeIndex]).name)
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = return_to_save
		}}
endscript

script ps2_disable_autosave 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{3
		seconds}
	SetGlobalTags \{user_options
		params = {
			autosave = 0
		}}
	ps2_leave_saveload_flow
endscript

script ps2_set_saveload_successor 
	get_flow_manager_action_state \{action = continue}
	change ps2_saveload_successor = <state>
	HACK_ps2_set_saveload_successor_checksum <state>
endscript

script ps2_get_saveload_successor 
	return \{flow_state = HACK_ps2_saveload_successor}
endscript

script ps2_memcard_set_options_as_successor 
	ps2_memcard_set_autosave \{autosave = 0}
	change \{ps2_saveload_successor = options_data_settings_fs}
	HACK_ps2_set_saveload_successor_checksum \{options_data_settings_fs}
endscript

script ps2_memcard_saveload_complete 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{1
		second}
	ps2_leave_saveload_flow
endscript

script ps2_memcard_format_complete 
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	Wait \{1
		second}
	spawnscriptnow \{ui_flow_manager_respond_to_action
		params = {
			action = continue
		}}
endscript

script ps2_memcard_message 
	change \{check_for_unplugged_controllers = 1}
	destroy_ps2_saveload_screen
	create_ps2_saveload_screen <...>
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 1006}
	CreateScreenElement \{type = SpriteElement
		parent = ps2_trc_container
		rgba = [
			0
			0
			0
			0
		]
		event_handlers = [
			{
				pad_choose
				ui_flow_manager_respond_to_action
				params = {
					action = continue
				}
			}
		]}
	LaunchEvent type = focus target = <id>
endscript
ps2_memcard_autosave = 0

script ps2_memcard_set_autosave 
	change ps2_memcard_autosave = <autosave>
endscript

script ps2_memcard_save_successor 
	if (($ps2_memcard_autosave) = 0)
		return \{flow_state = ps2_memcard_save_ingame_fs}
	else
		return \{flow_state = ps2_memcard_autosave_ingame_fs}
	endif
endscript

script ps2_memcard_existing_save_successor 
	if (($ps2_memcard_autosave) = 0)
		return \{flow_state = ps2_memcard_overwrite_confirm_ingame_fs}
	else
		ps2_memcard_save_successor
		return flow_state = <flow_state>
	endif
endscript
