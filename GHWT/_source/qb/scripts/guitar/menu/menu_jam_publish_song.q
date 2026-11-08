jam_signin_upload = 0

script create_jam_publish_song_menu \{new_genre = -1}
	printf channel = jam_publish qs("\Lcreate_jam_publish_song_menu %s") s = <filename>
	NetSessionFunc \{func = storage_stats_uninit}
	NetSessionFunc \{func = storage_stats_init}
	if IsLoggedIn
		NetSessionFunc \{func = live_settings_init}
	endif
	change \{target_jam_camera_prop = jam_publish}
	jam_camera_wait
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = jam_publish_song_container}
	back_drop_color = [50 50 50 255]
	rot = 0
	header_x = 320
	header_y = 80
	header_foreground_color = <back_drop_color>
	header_background_color = [255 255 255 255]
	make_generic_menu {
		title = qs("Publish Song")
		pad_back_script = jam_publish_song_back_warning
		pad_back_params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
		vmenu_id = create_publish_song_menu
	}
	<new_song> = 0
	GetSongInfo
	if ((<file_id>.file_id [0]) = 0 && (<file_id>.file_id [1]) = 0)
		<new_song> = 1
	endif
	<unmodifiable_color> = [50 50 50 255]
	FormatText TextName = name qs("Name:     %s") s = <newfilename>
	if (<new_song> = 1)
		add_generic_menu_text_item {
			text = <name>
			choose_state = UIstate_jam_publish_text_entry
			choose_state_data = {choose_script = jam_name_choose_script text = <newfilename> choose_params = {filename = <filename>}}
		}
	else
		add_generic_menu_text_item {
			text = <name>
			additional_unfocus_script = unfocus_published_data
			additional_unfocus_params = {color = <unmodifiable_color>}
		}
		<item_container_id> :SetProps generic_menu_smenu_textitem_text_rgba = <unmodifiable_color>
	endif
	printf channel = jam_mode qs("\LNew Genre %s") s = <new_genre>
	GetArraySize \{$jam_genre_list}
	if ((<new_genre> >= 0) && (<new_genre> < <array_size>))
		FormatText TextName = genre qs("Genre:        %s") s = ($jam_genre_list [<new_genre>].name_text)
	else
		FormatText \{TextName = genre
			qs("Genre:        %s")
			s = qs("No Genre")}
	endif
	if (<new_song> = 1)
		add_generic_menu_text_item {
			text = <genre>
			choose_state = UIstate_jam_publish_genre
			choose_state_data = {choose_script = jam_genre_choose_script}
		}
	else
		add_generic_menu_text_item {
			text = <genre>
			additional_unfocus_script = unfocus_published_data
			additional_unfocus_params = {color = <unmodifiable_color>}
		}
		<item_container_id> :SetProps generic_menu_smenu_textitem_text_rgba = <unmodifiable_color>
	endif
	jam_publish_update_playback_track \{guitar_num = 1}
	jam_publish_update_playback_track \{guitar_num = 2}
	jam_publish_update_playback_drumvocal_track
	GetSongInfo
	if (<playback_track1> >= 0)
		FormatText TextName = guitar_playback_text qs("Guitar Track:     %s") s = ($jam_tracks [<playback_track1>].name_text)
	else
		FormatText \{TextName = guitar_playback_text
			qs("Guitar Track:     NONE")}
	endif
	if (<playback_track2> >= 0)
		FormatText TextName = bass_playback_text qs("Bass Track:     %s") s = ($jam_tracks [<playback_track2>].name_text)
	else
		FormatText \{TextName = bass_playback_text
			qs("Bass Track:     NONE")}
	endif
	add_generic_menu_text_item {
		text = <guitar_playback_text>
		choose_state = UIstate_jam_publish_track_select
		choose_state_data = {choose_script = jam_track_select_choose_script guitar_num = 1 playback_track1 = <playback_track1> playback_track2 = <playback_track2>}
	}
	add_generic_menu_text_item {
		text = <bass_playback_text>
		choose_state = UIstate_jam_publish_track_select
		choose_state_data = {choose_script = jam_track_select_choose_script guitar_num = 2 playback_track1 = <playback_track1> playback_track2 = <playback_track2>}
	}
	add_generic_menu_icon_item {
		icon = icon_jam_preview
		text = qs("Preview Song")
		pad_choose_script = jam_preview_song_choose_script
		pad_choose_params = {filename = <newfilename>}
	}
	GetArraySize ($edit_graphic_layer_infos)
	if (<array_size> <= 0)
		change editable_jam_album_cover = ($default_album_cover)
	endif
	FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
	GetGlobalTags <bandname_id> param = band_logo
	GetArraySize <band_logo>
	if ((<array_size>) > 0)
		local_struct = (($editable_jam_album_cover) [0])
		SetStructureParam struct_name = local_struct param = layers value = <band_logo>
		SetArrayElement ArrayName = editable_jam_album_cover GlobalArray index = 0 newvalue = <local_struct>
	endif
	change \{editable_jam_album_cover_size = 1}
	add_generic_menu_icon_item {
		icon = icon_save
		text = qs("Save and Quit")
		pad_choose_script = jam_save_and_quit_choose_script
		pad_choose_params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	}
	add_generic_menu_icon_item {
		icon = icon_jam_upload
		text = qs("Upload to GHTunes")
		pad_choose_script = jam_upload_song_choose_script
		pad_choose_params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	}
	add_generic_menu_icon_item {
		icon = icon_jam_upload
		text = qs("Manage GHTunes")
		pad_choose_script = jam_delete_song_choose_script
		pad_choose_params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	}
	LaunchEvent \{type = focus
		target = current_menu}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	if ($jam_signin_upload = 1)
		change \{jam_signin_upload = 0}
		spawnscriptnow jam_upload_song_choose_script params = {genre = <new_genre> filename = <filename> newfilename = <newfilename>}
	endif
	startrendering
endscript

script unfocus_published_data 
	<id> :SetProps generic_menu_smenu_textitem_text_rgba = <color>
endscript

script jam_publish_draw_album_cover 
	stoprendering
	cas_update_band_logo \{album_art}
	ensure_band_logo_object_created
	SetCASAppearance \{appearance = {
			CAS_Band_Logo = {
				desc_id = CAS_Band_Logo_id
			}
		}}
	change \{cas_override_object = BandLogoObject}
	BandLogoObject :Obj_SetPosition \{position = (-0.89, 0.76, 16.68)}
	BandLogoObject :Obj_SetOrientation \{dir = (0.0, 0.0, -1.0)}
	BandLogoObject :SwitchOnAtomic \{CAS_Band_Logo}
	BandLogoObject :Obj_ApplyScaling \{scale = 1.0}
	BandLogoObject :Obj_SetBoundingSphere \{10.0}
	Wait \{1
		gameframe}
	startrendering
endscript

script jam_preview_song_choose_script 
	printf \{channel = jam_publish
		qs("\LPreview Song")}
	create_song_preview_menu filename = <filename>
endscript

script jam_album_art_choose_script 
	if ($cas_heap_state = in_cas)
		ScriptAssert \{'Should in in_game heap state!'}
	endif
	CASBlockForLoading
	cas_load_and_setup_resources \{album_art}
	change \{cas_editing_new_character = false}
	ensure_band_logo_object_created
	if StructureContains Structure = (($editable_jam_album_cover) [0]) base_tex
		SetCASAppearance appearance = {
			CAS_Band_Logo = {
				desc_id = CAS_Band_Logo_id
				cap = ($editable_jam_album_cover)
			}
		}
	else
		SetCASAppearance \{appearance = {
				CAS_Band_Logo = {
					desc_id = CAS_Band_Logo_id
				}
			}}
	endif
	change \{cas_override_object = BandLogoObject}
	BandLogoObject :Obj_SetPosition \{position = (-0.89, 0.76, 16.68)}
	BandLogoObject :Obj_SetOrientation \{dir = (0.0, 0.0, -1.0)}
	BandLogoObject :SwitchOnAtomic \{CAS_Band_Logo}
	BandLogoObject :Obj_ApplyScaling \{scale = 1.0}
	BandLogoObject :Obj_SetBoundingSphere \{10.0}
	get_savegame_from_controller controller = ($primary_controller)
	ui_event event = menu_change data = {state = UIstate_cap_main text = qs("Edit Album Art") savegame = <savegame> part = CAS_Band_Logo num_icons = 0 album_cover = 1}
	printf \{channel = jam_publish
		qs("\LAlbum Art")}
endscript

script jam_go_back_from_album_art 
	KillCamAnim \{all}
	change \{target_jam_camera_prop = jam_publish}
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{name = jam_view_cam
		viewport = bg_viewport
		controlscript = jam_camera_script
		params = {
			start_camera = jam_publish
		}
		Play_hold = 1}
	change \{jam_view_cam_created = 1}
	if NOT GetCASAppearance
		ScriptAssert \{qs("\LUnable to retrieve appearance in band logo management")}
	endif
	if StructureContains Structure = (<appearance>.CAS_Band_Logo) cap
		change editable_jam_album_cover = ((<appearance>.CAS_Band_Logo).cap)
		change \{editable_jam_album_cover_size = 1}
	endif
	change \{cas_override_object = none}
	generic_event_back
endscript

script jam_genre_choose_script 
	printf channel = jam_publish qs("\LGenre %s") s = <genre>
	SetSongInfo genre = <genre>
	ui_event event = menu_back data = {new_genre = <genre>}
endscript

script jam_track_select_choose_script 
	if (<guitar_num> = 1)
		SetSongInfo playback_track1 = <track>
	else
		SetSongInfo playback_track2 = <track>
	endif
	ui_event \{event = menu_back}
endscript

script jam_upload_song_choose_script 
	if ($ghtunes_killswitch = 1)
		jam_upload_song_failed \{dialog = 16}
		return
	endif
	if NOT IsLoggedIn
		jam_upload_song_failed \{dialog = 8}
		return
	endif
	show_ghtunes_connecting_popup
	LaunchEvent \{type = unfocus
		target = current_menu}
	NetSessionFunc \{func = storage_stats_uninit}
	NetSessionFunc \{func = storage_stats_init}
	if NOT IsLoggedIn controller_index = ($primary_controller)
		if IsLoggedIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = IsCableUnplugged}
				destroy_popup_warning_menu
				jam_upload_song_failed \{dialog = 5}
				return
			endif
		else
			destroy_popup_warning_menu
			jam_upload_song_failed \{dialog = 19}
			return
		endif
	endif
	begin
	if NetSessionFunc \{func = is_lobby_available}
		destroy_popup_warning_menu
		break
	else
		if (<is_connecting> = 0)
			destroy_popup_warning_menu
			jam_upload_song_failed \{dialog = 13}
			return
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if NOT NetSessionFunc \{func = can_view_user_content}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	if (<genre> < 0)
		jam_upload_song_failed \{dialog = 1}
		return
	endif
	if ($ghtunes_verified = 0)
		VerifyJamUserContent controller = ($primary_controller)
		Block \{type = verify_jam_user_content}
		printf \{channel = jam_mode
			qs("\LGHTUNES VERIFIED")}
		change \{ghtunes_verified = 1}
	endif
	IsAcceptableString string = <newfilename>
	show_ghtunes_connecting_popup
	Block \{type = check_profanity_result}
	if (2 = <event_data>.result)
		destroy_popup_warning_menu
		jam_upload_song_failed \{dialog = 13}
		return
	endif
	if (1 = <event_data>.result)
		printf channel = jam_publish qs("\LACCEPTABLE NAME %s") s = <newfilename>
	else
		destroy_popup_warning_menu
		printf channel = jam_publish qs("\LUNACCEPTABLE NAME %s") s = <newfilename>
		jam_upload_song_failed dialog = 10 filename = <newfilename>
		return
	endif
	get_current_band_info
	GetGlobalTags <band_info>
	IsAcceptableString string = <name>
	Block \{type = check_profanity_result}
	if (2 = <event_data>.result)
		destroy_popup_warning_menu
		jam_upload_song_failed \{dialog = 13}
		return
	endif
	destroy_popup_warning_menu
	if (1 = <event_data>.result)
		printf channel = jam_publish qs("\LACCEPTABLE NAME %s") s = <name>
	else
		printf channel = jam_publish qs("\LUNACCEPTABLE NAME %s") s = <name>
		jam_upload_song_failed dialog = 10 filename = <name>
		return
	endif
	jam_upload_song_dialog \{dialog = 3}
	JamUserCanUpload controller = ($primary_controller)
	Block \{type = jam_user_can_upload}
	if (<event_data>.failed = 1)
		if (<event_data>.fail_type = 1)
			jam_upload_song_failed \{dialog = 14}
		else
			jam_upload_song_failed \{dialog = 13}
		endif
		return
	endif
	GetJamUserContentList controller = ($primary_controller)
	Block \{type = get_jam_user_content_list}
	if (<event_data>.failed = 1)
		jam_upload_song_failed \{dialog = 16}
	else
		GetSongInfo
		<file_id> = (<file_id>.file_id)
		if (((<file_id> [0]) = 0) && ((<file_id> [1]) = 0))
			slot_array = $jam_curr_slot_array
			stoprendering
			generic_event_choose state = UIstate_jam_publish_slot data = {choose_script = jam_upload_song_legal_check
				genre = <genre>
				filename = <filename>
				newfilename = <newfilename>
				slot_array = <slot_array>}
			jam_upload_song_dialog_destroy
		else
			UpdateJamUserContent controller = ($primary_controller)
			Block \{type = update_jam_user_content}
			jam_upload_song_dialog_destroy
			if (<event_data>.failed = 0)
				jam_upload_song_success dialog = 2 filename = <filename> newfilename = <newfilename> genre = <genre>
			elseif (<event_data>.failed = 2)
				jam_upload_song_failed dialog = 12 filename = <filename> newfilename = <newfilename> genre = <genre>
			else
				jam_upload_song_failed dialog = 11 filename = <filename> newfilename = <newfilename> genre = <genre>
			endif
		endif
	endif
endscript

script jam_delete_song_choose_script 
	if ($ghtunes_killswitch = 1)
		jam_upload_song_failed \{dialog = 16}
		return
	endif
	if NOT IsLoggedIn
		jam_upload_song_failed \{dialog = 8}
		return
	endif
	LaunchEvent \{type = unfocus
		target = current_menu}
	NetSessionFunc \{func = storage_stats_uninit}
	NetSessionFunc \{func = storage_stats_init}
	if NOT IsLoggedIn controller_index = ($primary_controller)
		if IsLoggedIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = is_cable_unplugged}
				jam_upload_song_failed \{dialog = 5}
				return
			endif
		else
			jam_upload_song_failed \{dialog = 19}
			return
		endif
	endif
	show_ghtunes_connecting_popup
	begin
	if NetSessionFunc \{func = is_lobby_available}
		destroy_popup_warning_menu
		break
	else
		if (<is_connecting> = 0)
			destroy_popup_warning_menu
			jam_upload_song_failed \{dialog = 13}
			return
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if NOT NetSessionFunc \{func = can_view_user_content}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	jam_upload_song_dialog \{dialog = 3}
	GetJamUserContentList controller = ($primary_controller)
	Block \{type = get_jam_user_content_list}
	if (<event_data>.failed = 1)
		jam_upload_song_failed \{dialog = 5}
	else
		slot_array = $jam_curr_slot_array
		stoprendering
		generic_event_choose state = UIstate_jam_publish_slot data = {choose_script = jam_upload_song_legal_check
			genre = <genre>
			filename = <filename>
			newfilename = <newfilename>
			slot_array = <slot_array>
			delete_only}
		jam_upload_song_dialog_destroy
	endif
endscript

script UpdateJamUserContent_callback 
	BroadcastEvent type = update_jam_user_content data = {failed = <fail_type>}
endscript

script UpdateJamUserContent_failed_callback 
	BroadcastEvent type = update_jam_user_content data = {failed = <fail_type>}
endscript

script DWC_CheckProfanityCallback 
	BroadcastEvent type = check_profanity_result data = {result = <result>}
endscript

script jam_remove_song_from_slot_check \{slot = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	jam_upload_check_dialog dialog = 1 slot = <slot> genre_chk = <genre_chk>
endscript

script jam_remove_song_from_slot \{slot = 0}
	destroy_popup_warning_menu
	NetSessionFunc \{func = storage_stats_uninit}
	NetSessionFunc \{func = storage_stats_init}
	if NOT IsLoggedIn controller_index = ($primary_controller)
		if IsLoggedIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = is_cable_unplugged}
				jam_upload_song_failed \{dialog = 5}
				return
			endif
		else
			jam_upload_song_failed \{dialog = 19}
			return
		endif
	endif
	show_ghtunes_connecting_popup
	begin
	if NetSessionFunc \{func = is_lobby_available}
		destroy_popup_warning_menu
		break
	else
		if (<is_connecting> = 0)
			destroy_popup_warning_menu
			jam_upload_song_failed \{dialog = 13}
			return
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if NOT NetSessionFunc \{func = can_view_user_content}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	jam_upload_song_dialog \{dialog = 1}
	RemoveJamUserContent controller = ($primary_controller) slot = <slot> genre = <genre_chk>
	Block \{type = remove_jam_user_content}
	jam_upload_song_dialog_destroy
	printstruct channel = jam_mode ($jam_curr_slot_array)
	printstruct channel = jam_mode ($jam_curr_directory_listing)
	curr_slot_file_id = ($jam_curr_slot_array [<slot>].file_id.file_id)
	GetArraySize ($jam_curr_directory_listing) param = directory_size
	j = 0
	begin
	curr_directory_file_id = ($jam_curr_directory_listing [<j>].fileid.fileid)
	if NOT (<curr_directory_file_id> = 0)
		<curr_directory_file_id> = ($jam_curr_directory_listing [<j>].fileid.fileid)
		if (<curr_slot_file_id> [1] = <curr_directory_file_id> [1])
			if (<curr_slot_file_id> [0] = <curr_directory_file_id> [0])
				stoprendering
				ClearJamSession
				jam_recording_create_editable_arrays
				change memcard_jamsession_file_name = ($jam_curr_directory_listing [<j>].filename)
				change \{memcard_after_func = stoprendering}
				ui_memcard_load_jam \{event = menu_replace
					data = {
						state = UIstate_jam_publish_update_fileid
					}}
				return
			endif
		endif
	endif
	<j> = (<j> + 1)
	repeat <directory_size>
	jam_upload_song_success \{dialog = 1}
endscript

script file_id_test 
	GetSongInfo
	printstruct channel = jam_mode <file_id>
endscript

script jam_upload_song_legal_check 
	jam_upload_check_dialog dialog = 2 <...>
endscript

script jam_upload_song_to_slot_check \{slot = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	if jam_verify_publishing_rules filename = <newfilename> slot = <slot>
		if GotParam \{replace}
			jam_upload_check_dialog dialog = 0 slot = <slot> filename = <filename> newfilename = <newfilename> genre = <genre>
		else
			jam_upload_song_to_slot slot = <slot> filename = <filename> newfilename = <newfilename> genre = <genre>
		endif
	endif
endscript

script jam_upload_song_to_slot 
	jam_upload_song_dialog \{dialog = 4}
	NetSessionFunc \{func = storage_stats_uninit}
	NetSessionFunc \{func = storage_stats_init}
	SetSongInfo genre = <genre>
	get_current_band_name
	SetSongInfo artist = <band_name>
	if GotParam \{replace}
		if NOT IsLoggedIn controller_index = ($primary_controller)
			if IsLoggedIn local controller_index = ($primary_controller)
				if NetSessionFunc \{func = is_cable_unplugged}
					jam_upload_song_failed \{dialog = 5}
					return
				endif
			else
				jam_upload_song_failed \{dialog = 19}
				return
			endif
		endif
		show_ghtunes_connecting_popup
		begin
		if NetSessionFunc \{func = is_lobby_available}
			destroy_popup_warning_menu
			break
		else
			if (<is_connecting> = 0)
				destroy_popup_warning_menu
				jam_upload_song_failed \{dialog = 13}
				return
			endif
		endif
		Wait \{1
			gameframe}
		repeat
		if NOT NetSessionFunc \{func = can_view_user_content}
			jam_upload_song_failed \{dialog = 6}
			return
		endif
		jam_upload_song_dialog \{dialog = 1}
		RemoveJamUserContent controller = ($primary_controller) slot = <slot> genre = ($jam_genre_list [<genre>].checksum)
		Block \{type = remove_jam_user_content}
		jam_upload_song_dialog_destroy
	endif
	if NOT IsLoggedIn controller_index = ($primary_controller)
		if IsLoggedIn local controller_index = ($primary_controller)
			if NetSessionFunc \{func = IsCableUnplugged}
				jam_upload_song_failed \{dialog = 5}
				return
			endif
		else
			jam_upload_song_failed \{dialog = 19}
			return
		endif
	endif
	show_ghtunes_connecting_popup
	begin
	if NetSessionFunc \{func = is_lobby_available}
		destroy_popup_warning_menu
		break
	else
		if (<is_connecting> = 0)
			destroy_popup_warning_menu
			jam_upload_song_failed \{dialog = 13}
			return
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	if NOT NetSessionFunc \{func = can_view_user_content}
		jam_upload_song_failed \{dialog = 6}
		return
	endif
	jam_upload_song_dialog \{dialog = 0}
	printf channel = jam_publish qs("\Lfilename = %s genre = %a") s = <newfilename> a = <genre>
	FormatText TextName = newfilename_nonlocal '%s' s = <newfilename>
	AddJamUserContent controller = ($primary_controller) slot = <slot> filename = <newfilename_nonlocal> genre = ($jam_genre_list [<genre>].checksum)
	Block \{type = add_jam_user_content}
	jam_upload_song_dialog_destroy
	if (<event_data>.failed = 0)
		jam_save_and_quit_choose_script filename = <filename> newfilename = <newfilename> genre = <genre>
	else
		if (<event_data>.failed = 1)
			jam_upload_song_failed dialog = 4 filename = <filename> newfilename = <newfilename> genre = <genre>
		else
			jam_upload_song_failed dialog = 15 filename = <filename> newfilename = <newfilename> genre = <genre>
		endif
	endif
endscript

script jam_verify_publishing_rules 
	count = 0
	verified_note_count = 0
	last_end_time = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = <appended_id>
	if (($<notetrack_size>) > 0)
		end_time = ($<gem_array> [(($<notetrack_size>) - 2)])
		if (<end_time> > <last_end_time>)
			<last_end_time> = <end_time>
		endif
	endif
	if ((($<notetrack_size>) / 2) >= $ghtunes_minimum_note_count)
		<verified_note_count> = 1
	endif
	<count> = (<count> + 1)
	repeat 5
	if (<verified_note_count> = 0)
		jam_upload_song_failed \{dialog = 2}
		return \{false}
	endif
	if (<last_end_time> < $ghtunes_minimum_song_time)
		jam_upload_song_failed \{dialog = 3}
		return \{false}
	endif
	GetArraySize \{$jam_curr_slot_array}
	index = 0
	begin
	if (($jam_curr_slot_array [<index>].has_content) = 1)
		slot_filename = ($jam_curr_slot_array [<index>].filename)
		FormatText TextName = filename_nonlocal '%s' s = <filename>
		if (<filename_nonlocal> = <slot_filename>)
			if NOT (<slot> = <index>)
				jam_upload_song_failed \{dialog = 7}
				return \{false}
			endif
		endif
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	return \{true}
endscript

script AddJamUserContent_callback 
	printf \{channel = jam_publish
		qs("\LUpload Success")}
	BroadcastEvent \{type = add_jam_user_content
		data = {
			failed = 0
		}}
endscript

script AddJamUserContent_failed_callback 
	printf \{channel = jam_publish
		qs("\LUpload Failed")}
	BroadcastEvent \{type = add_jam_user_content
		data = {
			failed = 1
		}}
endscript

script AddJamUserContent_failed_size_callback 
	printf \{channel = jam_publish
		qs("\LUpload Failed, file size limit")}
	BroadcastEvent \{type = add_jam_user_content
		data = {
			failed = 2
		}}
endscript
jam_curr_slot_array = [
	0
	0
	0
	0
	0
]

script GetJamUserContentList_callback 
	printf \{channel = jam_mode
		qs("\LGetJamUserContentList_callback")}
	change jam_curr_slot_array = <slot_array>
	BroadcastEvent \{type = get_jam_user_content_list
		data = {
			failed = 0
		}}
endscript

script GetJamUserContentList_failed_callback 
	printf \{channel = jam_mode
		qs("\LGetJamUserContentList_failed_callback")}
	BroadcastEvent \{type = get_jam_user_content_list
		data = {
			failed = 1
		}}
endscript

script JamUserCanUpload_callback 
	BroadcastEvent \{type = jam_user_can_upload
		data = {
			failed = 0
		}}
endscript

script JamUserCanUpload_callback_failed 
	BroadcastEvent type = jam_user_can_upload data = {failed = 1 fail_type = <fail_type>}
endscript

script RemoveJamUserContent_callback 
	BroadcastEvent \{type = remove_jam_user_content}
endscript

script jam_upload_song_dialog \{dialog = 0
		ghtunes = 0}
	if (<ghtunes> = 0)
		LaunchEvent \{type = unfocus
			target = current_menu}
	endif
	destroy_popup_warning_menu
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = upload_dialog
			qs("Uploading Song...")}
		case 1
		FormatText \{TextName = upload_dialog
			qs("Removing Song...")}
		case 2
		FormatText \{TextName = upload_dialog
			qs("Downloading Song...")}
		case 3
		FormatText \{TextName = upload_dialog
			qs("Retrieving Slot Info...")}
		case 4
		FormatText \{TextName = upload_dialog
			qs("Saving Song Info...")}
		case 5
		FormatText \{TextName = upload_dialog
			qs("Rating Song...")}
	endswitch
	create_popup_warning_menu {
		title = qs("GHTunes")
		textblock = {
			text = <upload_dialog>
		}
	}
	popup_warning_container :obj_spawnscript \{jam_recording_animate_spinning_record}
	if (<dialog> = 3)
		popup_warning_container :obj_spawnscript \{jam_publish_timeout}
	endif
endscript

script jam_upload_song_dialog_destroy 
	destroy_popup_warning_menu
endscript

script jam_publish_timeout 
	Wait \{20
		seconds}
	jam_upload_song_failed \{dialog = 5}
endscript

script jam_upload_song_success \{dialog = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = title
			qs("UPLOAD SUCCESS")}
		FormatText \{TextName = upload_dialog
			qs("Upload successful, song uploaded to GHTunes.")}
		<dialog> = 0
		case 1
		FormatText \{TextName = title
			qs("REMOVE SUCCESS")}
		FormatText \{TextName = upload_dialog
			qs("Remove successful, song removed from GHTunes.")}
		<dialog> = 1
		case 2
		FormatText \{TextName = title
			qs("UPDATE SUCCESS")}
		FormatText \{TextName = upload_dialog
			qs("Update successful, song updated on GHTunes.")}
		<dialog> = 0
	endswitch
	destroy_popup_warning_menu
	if (<dialog> = 0)
		create_popup_warning_menu {
			title = <title>
			textblock = {
				text = <upload_dialog>
				pos = (640.0, 370.0)
			}
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = {jam_save_and_quit_choose_script}
					func_params = {dialog = <dialog> filename = <filename> newfilename = <newfilename> genre = <genre>}
					text = qs("CONTINUE")
				}
			]
		}
	else
		create_popup_warning_menu {
			title = <title>
			textblock = {
				text = <upload_dialog>
				pos = (640.0, 370.0)
			}
			menu_pos = (640.0, 465.0)
			options = [
				{
					func = {jam_upload_song_success_go_back}
					func_params = {dialog = <dialog>}
					text = qs("CONTINUE")
				}
			]
		}
	endif
endscript

script jam_upload_song_success_go_back 
	if (<dialog> = 0)
		jamsession_unload \{song_prefix = 'editable'}
		ClearJamSession
		destroy_popup_warning_menu
		generic_event_back \{state = UIstate_jam_select_song
			data = {
				show_popup = 0
			}}
	else
		destroy_popup_warning_menu
		generic_event_back
	endif
	destroy_generic_menu
endscript

script jam_upload_song_failed \{dialog = 0}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{type = unfocus
			target = current_menu}
	endif
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		upload_dialog = $wii_jam_publish_login
		case 1
		upload_dialog = qs("You must select a genre to upload a song to GHTunes. Please select a genre.")
		case 2
		FormatText TextName = text qs("Your song does not meet GHTunes upload qualifications. Uploaded songs must have at least one track recorded with at least %s notes.") s = ($ghtunes_minimum_note_count)
		upload_dialog = <text>
		case 3
		minimum_seconds = ($ghtunes_minimum_song_time / 1000)
		CastToInteger \{minimum_seconds}
		FormatText TextName = text qs("Your song does not meet GHTunes upload qualifications. Uploaded songs must be at least %s seconds long.") s = <minimum_seconds>
		upload_dialog = <text>
		case 4
		upload_dialog = qs("Song upload failed. Error uploading song to GHTunes, please try again.")
		case 5
		upload_dialog = qs(0x258a8305)
		case 6
		upload_dialog = $wii_ghtunes_parental
		case 7
		upload_dialog = qs("Song upload failed. The song you are trying to upload already exists in one of your slots. Please rename and try again.")
		case 8
		upload_dialog = $wii_ghtunes_must_be_signed
		case 9
		upload_dialog = qs(0x044a9da2)
		case 10
		FormatText TextName = text qs("The name you have selected, %s, has been flagged as inappropriate. Please rename and try again.") s = <filename>
		upload_dialog = <text>
		case 11
		upload_dialog = qs("Song update failed. Error updating song on GHTunes, please try again.")
		case 12
		upload_dialog = $wii_ghtunes_not_permitted
		case 13
		upload_dialog = $wii_ghtunes_must_be_signed
		case 14
		upload_dialog = $wii_ghtunes_no_longer_permitted
		case 15
		upload_dialog = qs("Song upload failed. The file you are attempting to upload to GHTunes is too large, please remove notes and try again.")
		case 16
		upload_dialog = qs("Unable to connect to GHTunes. Please check your network connection and settings and try again.")
		case 17
		upload_dialog = qs("The page you are attempting to access failed to load. Please try again in a few minutes.")
		case 18
		upload_dialog = qs("Unable to connect to GHTunes. Please check your network connection and settings and try again.")
		case 19
		upload_dialog = $wii_ghtunes_communication_error
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs("UPLOAD FAILED")
		textblock = {
			text = <upload_dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_upload_song_failed_go_back}
				func_params = {dialog = <dialog> <...>}
				text = qs("GO BACK")
			}
		]
		Long
	}
endscript

script jam_upload_song_failed_go_back 
	if (<dialog> = 4)
		generic_event_back \{state = UIstate_jam_publish_song}
		destroy_popup_warning_menu
	elseif (<dialog> = 2 || <dialog> = 3)
		destroy_popup_warning_menu
		generic_event_back
	elseif (<dialog> = 7 || <dialog> = 18)
		destroy_popup_warning_menu
		generic_event_back
	else
		destroy_popup_warning_menu
		LaunchEvent \{type = focus
			target = current_menu}
	endif
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
endscript

script jam_upload_check_dialog \{dialog = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	NetSessionFunc \{func = storage_stats_uninit}
	NetSessionFunc \{func = storage_stats_init}
	show_ghtunes_connecting_popup
	begin
	if NetSessionFunc \{func = is_lobby_available}
		destroy_popup_warning_menu
		break
	else
		if (<is_connecting> = 0)
			destroy_popup_warning_menu
			jam_upload_song_failed \{dialog = 13}
			return
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = title
			qs("REPLACING SONG")}
		FormatText TextName = upload_dialog qs("Are you sure you want to replace your GHTunes song in slot %s?") s = (<slot> + 1)
		func = jam_upload_song_to_slot
		func_params = {<...> replace}
		case 1
		FormatText \{TextName = title
			qs("REMOVING SONG")}
		FormatText TextName = upload_dialog qs("Are you sure you want to remove your GHTunes song in slot %s?") s = (<slot> + 1)
		func = jam_remove_song_from_slot
		func_params = {<...>}
		case 2
		show_ghtunes_connecting_popup
		JamUpdateSubmissionAgreement controller = ($primary_controller)
		Block \{type = verify_update_submission_agreement}
		destroy_popup_warning_menu
		submission_error = 0
		if (<event_data>.failed = 1)
			<submission_error> = 1
		endif
		if NOT GlobalExists \{name = ghtunes_submission_agreement_array}
			<submission_error> = 1
		else
			GetArraySize \{$ghtunes_submission_agreement_array}
			if (<array_size> <= 0)
				<submission_error> = 1
			endif
		endif
		if (<submission_error> = 1)
			jam_upload_song_failed \{dialog = 17}
			return
		endif
		ghtunes_show_submission_agreement slot = <slot> filename = <filename> newfilename = <newfilename> genre = <genre>
		return
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = <title>
		textblock = {
			text = <upload_dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_upload_check_dialog_go_back}
				text = qs("GO BACK")
			}
			{
				func = {<func>}
				func_params = <func_params>
				text = qs("CONTINUE")
			}
		]
	}
endscript

script jam_upload_check_dialog_go_back 
	destroy_popup_warning_menu
	add_user_control_helper \{text = qs("REMOVE")
		button = start
		z = 100000}
	menu_finish
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script jam_name_choose_script 
	printf channel = jam_publish qs("\Lrenamed to: %s") s = <text>
	directorylisting = $jam_curr_directory_listing
	GetArraySize <directorylisting>
	if (<array_size> > 0)
		index = 0
		begin
		if ((<directorylisting> [<index>].filename) = <text>)
			if NOT (<text> = <filename>)
				jam_rename_song_failed dialog = 0 <...>
				return
			endif
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	ui_event event = menu_back data = {filename = <filename> newfilename = <text>}
endscript

script jam_rename_song_failed \{dialog = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = dialog
			qs("You already have a song with the same name. Please select a different name or delete the duplicate song.")}
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs("RENAME FAILED")
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_rename_song_failed_go_back}
				func_params = {<...>}
				text = qs("GO BACK")
			}
		]
	}
endscript

script jam_rename_song_failed_go_back 
	destroy_popup_warning_menu
	ui_event event = menu_back data = {filename = <filename> newfilename = <filename>}
endscript

script jam_save_and_quit_choose_script 
	printf channel = jam_publish qs("\LAttempting to save genre %s") s = <genre>
	printf channel = jam_mode qs("\Lset %s") s = <genre>
	get_current_band_name
	SetSongInfo artist = <band_name>
	stoprendering
	if (<filename> != <newfilename>)
		change memcard_jamsession_file_name = <newfilename>
		printf qs(0x1502b647) a = <filename> b = <newfilename> c = $memcard_jamsession_actual_file_name
	else
		change memcard_jamsession_file_name = <filename>
	endif
	jam_publish_save_song
endscript

script jam_publish_save_song 
	change \{memcard_after_func = jam_publish_unload}
	ui_memcard_save_jam \{event = menu_back
		data = {
			state = UIstate_jam_select_song
			show_popup = 0
		}}
endscript

script jam_publish_unload 
	jamsession_unload \{song_prefix = 'editable'}
	ClearJamSession
endscript

script jam_publish_reinit_band_logo 
endscript

script jam_publish_song_back_warning 
	RequireParams \{[
			filename
			newfilename
			genre
		]
		all}
	LaunchEvent \{type = unfocus
		target = current_menu}
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs("WARNING")
		no_background
		textblock = {
			text = qs("Unsaved edits will be lost. Do you want to continue?")
		}
		options = [
			{
				func = {jam_publish_song_back_cancel}
				func_params = {}
				text = qs("CANCEL")
			}
			{
				func = {jam_save_and_quit_choose_script}
				func_params = {dialog = <dialog> filename = <filename> newfilename = <newfilename> genre = <genre>}
				text = qs("SAVE AND QUIT")
			}
			{
				func = {jam_publish_song_back_no_save}
				func_params = {}
				text = qs("CONTINUE WITHOUT SAVING")
			}
		]
	}
endscript

script jam_publish_song_back_cancel 
	destroy_popup_warning_menu
	LaunchEvent \{type = focus
		target = current_menu}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
endscript

script jam_publish_song_back_no_save 
	destroy_popup_warning_menu
	jam_publish_song_back
endscript

script jam_publish_song_back 
	jam_publish_unload
	generic_event_back \{state = UIstate_jam_select_song
		data = {
			show_popup = 0
		}}
endscript

script destroy_jam_publish_song_menu 
	destroy_song_preview_menu
	destroy_popup_warning_menu
	set_focus_color
	set_unfocus_color
	if ScreenElementExists \{id = jam_publish_song_container}
		DestroyScreenElement \{id = jam_publish_song_container}
	endif
	destroy_generic_menu
	KillSpawnedScript \{id = jam_publish_song_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
	clean_up_user_control_helpers
endscript

script ui_create_jam_publish_signin 
	change \{jam_signin_upload = 1}
	spawnscriptnow \{ui_create_jam_publish_signin_spawned}
endscript

script ui_create_jam_publish_signin_spawned 
	Wait \{5
		gameframes}
	generic_event_back \{params = {
			state = UIstate_jam_publish_song
		}}
endscript
