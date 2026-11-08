ps3_autosave_warning_shown = 0
save_message_start_time = -1

script ui_init_memcard 
	memcard_controller_reset
	if (<type> = autosave)
		stars
		if IsPs3
			printf \{'Regular PS3 save'}
			memcard_controller_add controller = ($primary_controller)
		else
			if GotParam \{event_params}
				if StructureContains Structure = <event_params> data
					if StructureContains Structure = (<event_params>.data) savegame
						printf 'Saving specific savegame %d' d = ((<event_params>.data).savegame)
						memcard_controller_add controller = ((<event_params>.data).savegame)
						done_something = 1
					elseif StructureContains Structure = (<event_params>.data) all_active_players
						memcard_controller_add_signed_in_and_valid
						done_something = 1
					endif
				endif
			endif
			if NOT GotParam \{done_something}
				printf 'Saving primary controller %d' d = ($primary_controller)
				memcard_controller_add controller = ($primary_controller)
			endif
		endif
		stars
	endif
endscript
memcard_after_func = none

script ui_create_memcard \{event_params = {
			event = menu_back
		}}
	startrendering
	printscriptinfo \{qs(0x2dee5317)}
	call = null
	save_or_load = null
	CreateScreenElement {
		type = ContainerElement
		parent = root_window
		id = current_menu
		pos = (0.0, 0.0)
		just = [left center]
		z_priority = 0
		tags = {
			type = <type>
			event_params = <event_params>
			signin_changed = ($respond_to_signin_changed)
		}
	}
	change \{respond_to_signin_changed = 1}
	if IsNgc
		switch <type>
			case boot
			printf \{qs(0x142a9fd4)}
			call = wii_memcard_sequence_begin_bootup
			StorageSelectorForce = 1
			<save_or_load> = loading
			case autosave
			printf \{qs(0xf82e74dc)}
			if ($enable_saving = 0)
				SetGlobalTags \{user_options
					params = {
						autosave = $enable_saving
					}}
			endif
			call = wii_memcard_sequence_begin_autosave
			<save_or_load> = Saving
			case autoload
			printf \{qs(0x9d6ee9cd)}
			call = wii_memcard_sequence_begin_autoload
			<save_or_load> = loading
			case save
			printf \{qs(0x05b00499)}
			call = wii_memcard_sequence_begin_save
			<save_or_load> = Saving
			case load
			printf \{qs(0x60f09988)}
			call = wii_memcard_sequence_begin_load
			<save_or_load> = loading
			case save_jam
			printf \{qs(0x3e382643)}
			call = wii_memcard_sequence_begin_save_jam
			<save_or_load> = Saving
			case load_jam
			printf \{qs(0x5ebcf25b)}
			call = wii_memcard_sequence_begin_load_jam
			<save_or_load> = loading
			case delete_jam
			printf \{qs(0xa07fe43f)}
			call = wii_memcard_sequence_begin_delete_jam
			<save_or_load> = deleting
			case rename_jam
			printf \{qs(0x627810d6)}
			call = wii_memcard_sequence_begin_rename_jam
			<save_or_load> = Saving
		endswitch
	else
		switch <type>
			case boot
			call = memcard_sequence_begin_bootup
			printf \{qs(0x137d1ac3)}
			StorageSelectorForce = 1
			case autosave
			printf \{qs(0xf7d56de4)}
			call = memcard_sequence_begin_autosave
			requested_autosave = 0
			if GotParam \{event_params}
				if StructureContains \{Structure = event_params
						data}
					requested_autosave = (<event_params>.data.requested_autosave)
				endif
			endif
			case autoload
			printf \{qs(0x9295f0f5)}
			call = memcard_sequence_begin_autoload
			case save
			printf \{qs(0x02e7818e)}
			call = memcard_sequence_begin_save
			case load
			printf \{qs(0x67a71c9f)}
			call = memcard_sequence_begin_load
			case save_jam
			call = memcard_sequence_begin_save_jam
			case load_jam
			call = memcard_sequence_begin_load_jam
			case delete_jam
			call = memcard_sequence_begin_delete_jam
			case rename_jam
			call = memcard_sequence_begin_rename_jam
			case secondary_signin_load
			call = memcard_sequence_begin_ss_load
			default
			ScriptAssert 'invalid type: %t' t = <type>
		endswitch
	endif
	if (<type> = autosave)
		if NOT memcard_controller_get_next
			ScriptAssert \{'This should never happen, there should always be a controller to use here'}
		endif
	endif
	if isXenon
		if NOT CheckForSignIn local controller_index = <controller>
			printf 'Controller %d not signed in, aborting' d = <controller>
			ui_event_wait <event_params>
			return
		endif
	endif
	if IsPs3
		if is_autosave_on \{savegame = 0}
			if ($ps3_autosave_warning_shown = 0)
				change \{ps3_autosave_warning_shown = 1}
				do_ps3_memcard_warning func = <call> func_params = <...>
				return
			endif
		endif
	endif
	spawnscriptnow display_and_continue_access params = {<...>}
endscript

script display_and_continue_access 
	if (<call> != null)
		destroy_wii_saveload_screen
		GetStartTime
		change save_message_start_time = <StartTime>
		if NOT ProgressFileExists
			<save_or_load> = Saving
		endif
		if NOT ($enable_saving = 0)
			create_wii_saveload_screen header = $wii_working message = <save_or_load>
			Wait \{3
				frames}
		endif
	endif
	<call> <...>
	if IsNgc
		memcard_sequence_reset_flags
		show_wii_handle_trc event_params = {memcard_status = <memcard_status> event_params = <event_params> type = <type>}
	endif
endscript

script ui_destroy_memcard 
	if ScreenElementExists \{id = wii_trc_container}
		destroy_wii_trc_menu
	endif
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	spawnscriptnow \{memcard_sequence_cleanup_generic}
endscript

script ui_deinit_memcard 
	ui_options_audio_set_dolby_digital
	update_all_volumes
endscript

script ui_memcard_finish 
	ui_event_get_stack
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	current_menu :GetTags
	if (<type> = autosave)
		if memcard_controller_has_next
			MC_WaitAsyncOpsFinished
			memcard_cleanup_messages
			if ScreenElementExists \{id = current_menu}
				current_menu :Die
			endif
			ui_create_memcard {
				controller = <controller>
				type = <type>
				event_params = <event_params>
			}
			return
		endif
	endif
	switch <type>
		case boot
		if GotParam \{success}
			if any_band_has_band_name controller = <controller>
				if NOT GotParam \{boot_disable_saveload}
					printf \{qs(0x0fb1e1cf)}
					ui_event_wait \{event = menu_replace
						data = {
							state = UIstate_band_choose
						}}
				else
					printf \{qs(0x16aad08e)}
					hide_glitch \{num_frames = 5}
					ui_event_wait \{event = menu_replace
						data = {
							state = uistate_band_name_logo
							from_boot
						}}
				endif
			else
				printf \{qs(0x16aad08e)}
				hide_glitch \{num_frames = 5}
				ui_event_wait \{event = menu_replace
					data = {
						state = uistate_band_name_logo
						from_boot
					}}
			endif
		elseif GotParam \{failed}
			printf \{qs(0x0b38c7dd)}
			hide_glitch \{num_frames = 5}
			ui_event_wait \{event = menu_replace
				data = {
					state = uistate_band_name_logo
					from_boot = 1
					do_not_hide = 1
				}}
		endif
		case autosave
		if GotParam \{event_params}
			if StructureContains Structure = <event_params> data
				if StructureContains Structure = (<event_params>.data) pass_to_gigboard
					create_loading_screen \{destroy_state = 'gig_posters'}
				endif
			endif
		endif
		if GotParam \{success}
			ui_event_wait <event_params>
		elseif GotParam \{failed}
			ui_event_wait <event_params>
		endif
		case autoload
		if GotParam \{success}
			if current_band_has_band_name controller = <controller>
				ui_event_wait event = menu_replace data = {state = uistate_boot_download_scan event_params = <event_params> controller = <controller>}
			else
				ui_event_wait event = menu_replace data = {state = uistate_band_name_logo event_params = <event_params> from_save = 1}
			endif
		elseif GotParam \{failed}
			ui_event_wait <event_params>
		endif
		case save
		if GotParam \{success}
			ui_event_wait <event_params>
		elseif GotParam \{failed}
			ui_event_wait <event_params>
		endif
		case load
		if GotParam \{success}
			ui_event_wait <event_params>
		elseif GotParam \{failed}
			ui_event_wait \{event = menu_back}
		endif
		case save_jam
		if GotParam \{success}
			ui_event <event_params>
		elseif GotParam \{failed}
			ui_event <event_params>
		endif
		case load_jam
		if GotParam \{success}
			ui_event <event_params>
			change \{jam_selected_song = $memcard_jamsession_file_name}
		elseif GotParam \{failed}
			ui_event \{event = menu_back}
		endif
		case delete_jam
		if GotParam \{success}
			ui_event <event_params>
		elseif GotParam \{failed}
			ui_event \{event = menu_back}
		endif
		case rename_jam
		if GotParam \{success}
			ui_event <event_params>
		elseif GotParam \{failed}
			ui_event \{event = menu_back}
		endif
		case secondary_signin_load
		if GotParam \{success}
			ui_event_wait <event_params>
		elseif GotParam \{failed}
			ui_event_wait \{event = menu_back}
		endif
		default
		printf qs(0x6c0b4ff6) t = <type>
		ScriptAssert \{qs(0x68b00d96)}
	endswitch
	if ($memcard_after_func != none)
		if GotParam \{success}
			($memcard_after_func) success
		elseif GotParam \{failed}
			($memcard_after_func) failed
		else
			ScriptAssert \{'Yeah, something is wrong'}
		endif
		change \{memcard_after_func = none}
	endif
endscript

script ui_memcard_autosave \{event = menu_back
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {type = autosave event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_autosave_replace \{event = menu_back
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	ui_event event = menu_replace data = {state = uistate_memcard type = autosave event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_autoload \{this_event = menu_change
		event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose no_sound event = <this_event> state = uistate_memcard data = {type = autoload event_params = {event = <event> data = <data>} controller = <controller>}
endscript

script ui_memcard_save \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {type = save event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_load \{this_event = menu_change
		event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose event = <this_event> state = uistate_memcard data = {type = load event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_save_jam \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose no_sound state = uistate_memcard data = {type = save_jam event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_rename_jam \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {type = rename_jam event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_delete_jam \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {type = delete_jam event_params = {event = <event> data = <data>}}
endscript

script ui_memcard_secondary_siginin_load \{event = menu_replace
		data = {
		}}
	generic_event_choose state = <state>
endscript
memcard_controller_iterator = 0
memcard_controller_list = [
]

script memcard_controller_reset 
	change \{memcard_controller_iterator = 0}
	change \{memcard_controller_list = [
		]}
endscript

script memcard_controller_add 
	if NOT ArrayContains array = $memcard_controller_list contains = <controller>
		AddArrayElement array = $memcard_controller_list element = <controller>
		change memcard_controller_list = <array>
	endif
endscript

script memcard_controller_add_signed_in_and_valid 
	memcard_controller_add controller = ($primary_controller)
	printf 'memcard_controller_add_signed_in_and_valid - Saving %d' d = ($primary_controller)
	if isXenon
		GameMode_GetNumPlayersShown
		if (($current_num_players) > 0)
			i = 0
			begin
			FormatText checksumname = player_status 'player%d_status' d = (<i> + 1)
			controller = ($<player_status>.controller)
			GetSavegameFromController controller = <controller>
			if CheckForSignIn local controller_index = <savegame>
				printf 'memcard_controller_add_signed_in_and_valid - Saving %d' d = <savegame>
				memcard_controller_add controller = <savegame>
			endif
			i = (<i> + 1)
			repeat <num_players_shown>
		endif
	endif
endscript

script memcard_controller_has_next 
	GetArraySize \{$memcard_controller_list}
	if ($memcard_controller_iterator < <array_size>)
		return \{true}
	endif
	return \{false}
endscript

script memcard_controller_get_next 
	GetArraySize \{$memcard_controller_list}
	if ($memcard_controller_iterator < <array_size>)
		ctl = ($memcard_controller_list [($memcard_controller_iterator)])
		change memcard_controller_iterator = ($memcard_controller_iterator + 1)
		return true controller = <ctl>
	endif
	return \{false}
endscript

script memcard_guest_profile_warning 
	change \{MemcardDoneScript = memcard_sequence_generic_done}
	<options_array> = [
		{
			func = memcard_disable_saves_and_quit
			text = qs("CONTINUE WITHOUT SAVING")
		}
		{
			func = {generic_event_replace params = {state = UIstate_boot_iis}}
			text = qs("CANCEL")
		}
	]
	create_popup_warning_menu {
		textblock = {
			text = qs("You are signed in as a guest. Guest profiles cannot save their progress or settings. Do you wish to continue without saving?")
			pos = (640.0, 380.0)
			scale = 0.6
		}
		player_device = ($primary_controller)
		menu_pos = (640.0, 465.0)
		dialog_pos = (640.0, 455.0)
		options = <options_array>
	}
endscript
