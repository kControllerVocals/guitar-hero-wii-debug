jam_curr_directory_listing = [
]
jam_controller_directory_listing_0 = [
]
jam_controller_directory_listing_1 = [
]
jam_controller_directory_listing_2 = [
]
jam_controller_directory_listing_3 = [
]

script print_jam_directory_listings 
	printf \{channel = directory_listing
		qs("\L")}
	printf \{channel = directory_listing
		qs("\L***********************")}
	printf \{channel = directory_listing
		qs("\L")}
	printf \{channel = directory_listing
		qs("\LCURR DIRECTORY LISTING")}
	GetArraySize ($jam_curr_directory_listing)
	printf channel = directory_listing qs("\LNum songs = %s") s = <array_size>
	printf \{channel = directory_listing
		qs("\L")}
	printf \{channel = directory_listing
		qs("\LCONTROLLER 0 DIRECTORY LISTING")}
	GetArraySize ($jam_controller_directory_listing_0)
	printf channel = directory_listing qs("\LNum songs = %s") s = <array_size>
	printf \{channel = directory_listing
		qs("\L")}
	printf \{channel = directory_listing
		qs("\LCONTROLLER 1 DIRECTORY LISTING")}
	GetArraySize ($jam_controller_directory_listing_1)
	printf channel = directory_listing qs("\LNum songs = %s") s = <array_size>
	printf \{channel = directory_listing
		qs("\L")}
	printf \{channel = directory_listing
		qs("\LCONTROLLER 2 DIRECTORY LISTING")}
	GetArraySize ($jam_controller_directory_listing_2)
	printf channel = directory_listing qs("\LNum songs = %s") s = <array_size>
	printf \{channel = directory_listing
		qs("\L")}
	printf \{channel = directory_listing
		qs("\LCONTROLLER 3 DIRECTORY LISTING")}
	GetArraySize ($jam_controller_directory_listing_3)
	printf channel = directory_listing qs("\LNum songs = %s") s = <array_size>
	printf \{channel = directory_listing
		qs("\L")}
	printf \{channel = directory_listing
		qs("\L***********************")}
endscript

script jam_get_controller_directory_listing \{controller = 0}
	get_savegame_from_controller controller = <controller>
	FormatText checksumname = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	directorylisting = ($<controller_directory_listing>)
	return directorylisting = <directorylisting>
endscript

script jam_reset_controller_directory_listing \{controller = 0}
	if NOT GotParam \{savegame}
		get_savegame_from_controller controller = <controller>
	endif
	FormatText checksumname = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	if GlobalExists name = <controller_directory_listing>
		change globalname = <controller_directory_listing> newvalue = []
	endif
	printf \{channel = directory_listing
		qs("\Ljam_reset_controller_directory_listing")}
	print_jam_directory_listings
endscript

script jam_update_controller_directory_listing \{controller = 0}
	if NOT GotParam \{savegame}
		get_savegame_from_controller controller = <controller>
	endif
	FormatText checksumname = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	if GlobalExists name = <controller_directory_listing>
		change globalname = <controller_directory_listing> newvalue = <directorylisting>
	endif
	printf \{channel = directory_listing
		qs("\Ljam_update_controller_directory_listing")}
	print_jam_directory_listings
endscript

script jam_update_curr_directory_listing \{controller = 0}
	print_jam_directory_listings
	if NOT GotParam \{savegame}
		get_savegame_from_controller controller = <controller>
	endif
	FormatText checksumname = controller_directory_listing 'jam_controller_directory_listing_%s' s = <savegame>
	if GlobalExists name = <controller_directory_listing>
		directorylisting = ($<controller_directory_listing>)
		change jam_curr_directory_listing = <directorylisting>
	endif
	printf \{channel = directory_listing
		qs("\Ljam_update_curr_directory_listing")}
	print_jam_directory_listings
endscript

script jam_get_num_songs 
	user_song_count = 0
	downloaded_song_count = 0
	GetArraySize ($jam_curr_directory_listing)
	if (<array_size> > 0)
		index = 0
		begin
		if NOT (($jam_curr_directory_listing [<index>].song_version) = $jam_song_version_valid)
			if StructureContains Structure = ($jam_curr_directory_listing [<index>]) downloaded
				if (($jam_curr_directory_listing [<index>].downloaded) = 1)
					<user_song_count> = (<user_song_count> + 1)
				else
					<user_song_count> = (<user_song_count> + 1)
				endif
			else
				<user_song_count> = (<user_song_count> + 1)
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	printf channel = jam_mode qs("\LUser song count %a, Downloaded songs count %b") a = <user_song_count> b = <downloaded_song_count>
	return user_song_count = <user_song_count>
endscript
memcard_jamsession_file_name = $wii_jam_custom_song
memcard_jamsession_new_file_name = $wii_jam_custom_song
memcard_jamsession_artist = qs("No Artist")
memcard_jamsession_actual_file_name = ''
memcard_jamsession_song_version = 0
memcard_jamsession_downloaded = 0
memcard_jamsession_fileid = {
	fileid = [
		0
		0
	]
}
memcard_jamsession_playback_track1 = 0
memcard_jamsession_playback_track2 = 0
memcard_jamsession_playback_track_drums = 0
memcard_jamsession_playback_track_vocals = 0
memcard_jamsession_content_name = qs("CustomSongs")

script jam_save_song_setup 
	printf \{channel = jam_mode
		qs("\LSAVING CUSTOM SONG")}
	FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
	<name> = qs("No Artist")
	GetGlobalTags <bandname_id> param = name
	SetSongInfo artist = <name>
	if NOT GotParam \{song}
		if ($jam_band_new_song = 0)
			create_overwrite_menu
			clean_up_user_control_helpers
			song = $jam_selected_song
		else
			create_save_menu
			clean_up_user_control_helpers
			jam_recording_get_unique_name
		endif
	else
		create_save_menu
		clean_up_user_control_helpers
	endif
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	gem_array = ($jam_tracks [<index>].gem_array)
	ProcessHammerOns name = <gem_array> name_fretbar = editable_fretbars
	<index> = (<index> + 1)
	repeat (<array_size> - 1)
	jam_save_scale
	jam_save_effect
	jam_clear_clipboards
	FormatText \{checksumname = undo_clipboard_array
		'undo_clipboard'}
	if GlobalExists name = <undo_clipboard_array> type = array
		printf \{channel = jam_mode
			qs("\Ldestroy undo clipboard")}
		DestroyScriptArray name = <undo_clipboard_array>
	endif
	change memcard_jamsession_file_name = <song>
endscript

script jam_save_song_unload 
	jamsession_unload \{song_prefix = 'editable'}
	ClearJamSession
endscript

script jam_recording_get_unique_name \{prefix = $wii_jam_custom_song}
	<song_name> = <prefix>
	directorylisting = $jam_curr_directory_listing
	GetArraySize <directorylisting>
	if (<array_size> > 0)
		unique_name = 1
		index = 0
		begin
		if (<song_name> = (<directorylisting> [<index>].filename) &&
				(<directorylisting> [<index>].song_version) != 0)
			<unique_name> = 0
			break
		endif
		<index> = (<index> + 1)
		repeat <array_size>
		if NOT (<unique_name> = 1)
			name_count = 1
			begin
			FormatText TextName = song_name qs("%a%s") a = <prefix> s = <name_count>
			unique_name = 1
			index = 0
			begin
			if (<song_name> = (<directorylisting> [<index>].filename) &&
					(<directorylisting> [<index>].song_version) != 0)
				<unique_name> = 0
				break
			endif
			<index> = (<index> + 1)
			repeat <array_size>
			<name_count> = (<name_count> + 1)
			if (<unique_name> = 1)
				break
			endif
			repeat
		endif
		index = (<array_size> - 1)
		begin
		if ((<directorylisting> [<index>].song_version) = 0)
			change memcard_jamsession_actual_file_name = (<directorylisting> [<index>].actual_file_name)
			break
		endif
		<index> = (<index> -1)
		repeat <array_size>
	endif
	StringLength string = <song_name>
	printf channel = jam_mode qs("\Ljam_recording_get_unique_name: newname %a length %b") a = <song_name> b = <str_len>
	if (<str_len> > 17)
		StringLength string = <prefix>
		StringNCopy string = <prefix> length = (<str_len> - 1)
		jam_recording_get_unique_name prefix = <new_string>
		<song_name> = <song>
	else
		printf channel = jam_mode qs("\LFINAL NAME %s") s = <song_name>
	endif
	return song = <song_name>
endscript

script debug_create_max_jam_songs 
	debug_create_multiple_jam_songs \{num_songs = 50
		downloaded = 0}
	debug_create_multiple_jam_songs \{num_songs = 100
		downloaded = 1}
endscript

script debug_create_multiple_jam_songs \{num_songs = 1
		downloaded = 0}
	count = 0
	begin
	jam_setup_new_song
	SetSongInfo \{playback_track1 = 0}
	SetSongInfo \{playback_track2 = 2}
	SetSongInfo \{playback_track_drums = 1}
	SetSongInfo \{playback_track_vocals = 1}
	SetSongInfo downloaded = <downloaded>
	if (<downloaded> = 1)
		d = 'D'
	else
		d = 'L'
	endif
	FormatText TextName = filename qs("DEBUGSONG_%d%s") s = <count> d = <d>
	printf channel = jam_mode qs("\LSAVING %s") s = <filename>
	change memcard_jamsession_file_name = <filename>
	change \{memcard_after_func = debug_create_jam_song_after_func}
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = UIstate_jam_select_song
			show_popup = 0
		}}
	Block \{type = debug_create_jam_song}
	printf channel = jam_mode qs("\LSAVE COMPLETE %s") s = <filename>
	jam_recording_cleanup
	Wait \{1
		second}
	<count> = (<count> + 1)
	repeat <num_songs>
endscript

script debug_create_jam_song_after_func 
	BroadcastEvent \{type = debug_create_jam_song}
endscript
