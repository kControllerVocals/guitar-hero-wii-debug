
script create_song_preview_menu \{ghtunes = 0
		num_ratings = 0}
	Menu_Music_Off
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
	endif
	if (<ghtunes> = 0)
		LaunchEvent \{type = unfocus
			target = current_menu}
	endif
	if (<ghtunes> = 0)
		CreateScreenElement {
			parent = root_window
			id = song_preview_element
			type = DescInterface
			desc = 'gh_tunes_preview'
			event_handlers = [
				{pad_back song_preview_menu_back params = {ghtunes = <ghtunes>}}
				{pad_choose song_preview_play_pause params = {ghtunes = <ghtunes>}}
			]
			exclusive_device = ($primary_controller)
			helper_text_ghtunes_alpha = 0
			helper_text_preview_alpha = 1
			just = [bottom right]
			rot_angle = 90
			z_priority = 100
		}
	else
		event_handlers = [
			{pad_back song_preview_menu_back params = {ghtunes = <ghtunes> board_index = <board_index> start_at = <start_at>}}
			{pad_choose song_preview_play_pause params = {ghtunes = <ghtunes>}}
			{pad_option2 song_preview_save_song params = {ghtunes = <ghtunes> filename = <filename> board_index = <board_index> start_at = <start_at>}}
			{pad_option ghtunes_view_user_content params = {selected_index = <selected_index> ghtunes = <ghtunes> filename = <filename> board_index = <board_index> start_at = <start_at> user_id = <user_id> user_name = <user_name>}}
			{pad_start song_preview_show_gamercard params = {user_id = <user_id>}}
			{pad_l1 ghtunes_show_terms_of_service params = {parent_menu = song_preview_element user_id = <user_id> selected_index = <selected_index>}}
		]
		CreateScreenElement {
			parent = root_window
			id = song_preview_element
			type = DescInterface
			desc = 'gh_tunes_preview'
			event_handlers = <event_handlers>
			exclusive_device = ($primary_controller)
			helper_text_ghtunes_alpha = 1
			helper_text_preview_alpha = 0
			just = [bottom right]
			rot_angle = 90
		}
	endif
	LaunchEvent \{type = unfocus
		target = song_preview_element}
	if NOT GotParam \{file_id}
		GetSongInfo
	endif
	create_jam_song_info_text parent = song_preview_element pos = (485.0, 332.0) column_offset = (215.0, 0.0) z_priority = 60 filename = <filename> file_id = <file_id> num_ratings = <num_ratings>
	song_preview_draw_album_cover
	if (<ghtunes> = 0)
		jam_publish_draw_album_cover
	endif
	if ScreenElementExists \{id = song_preview_element}
		SoundEvent \{event = GHTunes_On}
		song_preview_element :SetProps \{playbar_dims = (0.0, 14.0)}
		song_preview_element :SetProps \{rot_angle = -1
			time = 0.2}
		song_preview_element :SE_WaitProps
		song_preview_element :SetProps \{rot_angle = 1
			time = 0.02}
		song_preview_element :SE_WaitProps
		song_preview_element :SetProps \{rot_angle = -0.5
			time = 0.02}
		song_preview_element :SE_WaitProps
		song_preview_element :SetProps \{rot_angle = 0.5
			time = 0.02}
		song_preview_element :SE_WaitProps
		song_preview_element :SetProps \{rot_angle = 0
			time = 0.02}
		song_preview_element :SE_WaitProps
	endif
	GetSongInfo
	GetArraySize \{$drum_kits}
	printf channel = jam_mode qs("\Ldrum kit %s") s = <drum_kit>
	if ((<drum_kit> >= <array_size>) || (<drum_kit> < 0))
		<drum_kit> = 0
	endif
	change jam_current_drum_kit = <drum_kit>
	LoadDrumKitAll drum_kit = ($drum_kits [<drum_kit>].string_id) percussion_kit = ($drum_kits [<drum_kit>].percussion_string_id) async = 0
	Wait \{1
		gameframe}
	GetArraySize \{$pause_melody_kit_options}
	if ((<melody_kit> >= <array_size>) || (<melody_kit> < 0))
		<melody_kit> = 0
	endif
	change jam_current_melody_kit = <melody_kit>
	LoadMelodyKit melody_kit = <melody_kit>
	spawnscriptnow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 0
			start_time = 0
			in_game = 0
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 1
			start_time = 0
			in_game = 0
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 2
			start_time = 0
			in_game = 0
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		params = {
			jam_instrument = 4
			start_time = 0
			in_game = 0
		}}
	spawnscriptnow \{guitar_jam_drum_playback
		params = {
			start_time = 0
		}}
	spawnscriptnow song_preview_update_playbar params = {song_length = <song_length>}
	change song_preview_curr_song_length = <song_length>
	if ScreenElementExists \{id = song_preview_element}
		song_preview_element :SetProps \{Timer_text = qs("0:00")}
	endif
	clean_up_user_control_helpers
	if (<ghtunes> = 0)
		add_user_control_helper \{text = qs("PLAY/PAUSE")
			button = green
			z = 100000}
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 100000}
	else
		add_user_control_helper \{text = qs("PLAY/PAUSE")
			button = green
			z = 100000}
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 100000}
		add_user_control_helper \{text = qs("SAVE")
			button = Yellow
			z = 100000}
		add_user_control_helper \{text = qs("TERMS OF USE")
			button = Orange
			z = 100000}
		if isXenon
			if GotParam \{user_id}
				add_user_control_helper \{text = qs("GAMER CARD")
					button = start
					z = 100000}
			endif
		endif
		add_user_control_helper \{text = qs("VIEW ALL BY ARTIST")
			button = Blue
			z = 100000}
	endif
	LaunchEvent \{type = focus
		target = song_preview_element}
endscript

script song_preview_save_song 
	printf \{channel = jam_mode
		qs("\Lsong_preview_save_song")}
	if ScreenElementExists \{id = song_preview_element}
		LaunchEvent \{type = unfocus
			target = song_preview_element}
	endif
	if (<ghtunes> = 0)
		return
	endif
	jam_get_num_songs
	if (<user_song_count> >= ($jam_max_user_songs))
		song_preview_save_song_failed dialog = 1 <...>
		return
	endif
	directorylisting = $jam_curr_directory_listing
	GetArraySize <directorylisting>
	if (<array_size> > 0)
		index = 0
		begin
		if ((<directorylisting> [<index>].filename) = <filename>)
			song_preview_save_song_failed dialog = 0 <...>
			return
		endif
		<index> = (<index> + 1)
		repeat <array_size>
	endif
	SoundEvent \{event = GHTunes_UI_Select}
	destroy_song_preview_menu \{ghtunes = 1}
	change \{memcard_after_func = song_preview_unload}
	change memcard_jamsession_file_name = <filename>
	index = (<array_size> - 1)
	begin
	if ((<directorylisting> [<index>].song_version) = 0)
		change memcard_jamsession_actual_file_name = (<directorylisting> [<index>].actual_file_name)
		break
	endif
	<index> = (<index> -1)
	repeat <array_size>
	ui_memcard_save_jam event = menu_back data = {state = UIstate_jam_ghtunes straight_to_leaderbrd = {index = <board_index> start_at = <start_at>}}
endscript

script song_preview_save_song_failed \{dialog = 0}
	LaunchEvent \{type = unfocus
		target = song_preview_element}
	SoundEvent \{event = Menu_Warning_SFX}
	clean_up_user_control_helpers
	jam_stop_all_sound
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	KillSpawnedScript \{name = song_preview_update_playbar}
	switch <dialog>
		case 0
		FormatText \{TextName = dialog
			qs("GHTunes Save failed. You already have a song with the same filename as the one you are attempting to save. Please delete or rename this song before trying again.")}
		case 1
		FormatText \{TextName = dialog
			qs(0x214955d6)
			s = $jam_max_user_songs}
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs("SAVE FAILED")
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {song_preview_menu_back}
				func_params = {<...>}
				text = qs("GO BACK")
			}
		]
	}
endscript

script song_preview_play_pause 
	printf \{channel = jam_mode
		qs("\LSong Preview Play Pause")}
	SoundEvent \{event = GHTunes_UI_Select}
	if ScriptIsRunning \{guitar_jam_playback_recording}
		GetSongTimeMs
		change song_preview_curr_song_time = <time>
		KillSpawnedScript \{name = guitar_jam_playback_recording}
		KillSpawnedScript \{name = guitar_jam_drum_playback}
		KillSpawnedScript \{name = song_preview_update_playbar}
	elseif ScriptIsRunning \{guitar_jam_drum_playback}
		GetSongTimeMs
		change song_preview_curr_song_time = <time>
		KillSpawnedScript \{name = guitar_jam_playback_recording}
		KillSpawnedScript \{name = guitar_jam_drum_playback}
		KillSpawnedScript \{name = song_preview_update_playbar}
	else
		spawnscriptnow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 0
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		spawnscriptnow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 1
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		spawnscriptnow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 2
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		spawnscriptnow \{guitar_jam_playback_recording
			params = {
				jam_instrument = 4
				start_time = $song_preview_curr_song_time
				in_game = 0
			}}
		spawnscriptnow \{guitar_jam_drum_playback
			params = {
				start_time = $song_preview_curr_song_time
			}}
		spawnscriptnow \{song_preview_update_playbar
			params = {
				song_length = $song_preview_curr_song_length
			}}
	endif
	StopSound unique_id = ($jam_input_current_chord) fade_type = linear fade_time = $jam_fade_time
	StopSound unique_id = ($jam_input_current_lead) fade_type = log_fast fade_time = 0.3
	StopSound unique_id = ($jam_input_current_bass) fade_type = linear fade_time = $jam_fade_time
	StopSound unique_id = ($jam_input_current_melody) fade_type = linear fade_time = $jam_fade_time
endscript
song_preview_curr_song_length = 0
song_preview_curr_song_time = 0

script song_preview_update_playbar 
	if NOT ScreenElementExists \{id = song_preview_element}
		return
	endif
	song_preview_element :SetProps \{playbar_dims = (0.0, 14.0)}
	playbar_max_x = 344
	begin
	GetSongTimeMs
	if (<time> >= <song_length>)
		change \{song_preview_curr_song_time = 0}
		break
	endif
	playbar_x = ((<time> / <song_length>) * <playbar_max_x>)
	song_preview_element :SetProps playbar_dims = ((0.0, 14.0) + ((1.0, 0.0) * <playbar_x>))
	CastToInteger \{time}
	Mod a = <time> b = 60000
	<seconds> = (<Mod> / 1000)
	<minutes> = (<time> / 60000)
	<sec_check> = (<seconds> / 10)
	if (<sec_check> < 1)
		FormatText TextName = song_time_text qs("%a:0%b") a = <minutes> b = <seconds>
	else
		FormatText TextName = song_time_text qs("%a:%b") a = <minutes> b = <seconds>
	endif
	song_preview_element :SetProps Timer_text = <song_time_text>
	Wait \{1
		gameframe}
	repeat
endscript

script song_preview_draw_album_cover 
	cas_update_band_logo \{album_art}
	PushAssetContext context = ($CAS_Band_Logo_Details.assetcontext)
	if ScreenElementExists \{id = jam_preview_album_cover}
		DestroyScreenElement \{id = jam_preview_album_cover}
	endif
	get_current_band_info
	GetGlobalTags <band_info> param = <allow_ghtunes_logo>
	if (<allow_ghtunes_logo> = 1)
		CreateScreenElement {
			type = SpriteElement
			parent = song_preview_element
			id = jam_preview_album_cover
			texture = ($CAS_Band_Logo_Details.textureasset)
			dims = (256.0, 256.0)
			pos = (346.0, 353.0)
			just = [center center]
			z_priority = 60
		}
	else
		CreateScreenElement \{type = SpriteElement
			parent = song_preview_element
			id = jam_preview_album_cover
			texture = default_band_logo
			dims = (256.0, 256.0)
			pos = (346.0, 353.0)
			just = [
				center
				center
			]
			z_priority = 60}
	endif
	PopAssetContext
endscript

script song_preview_menu_back 
	destroy_popup_warning_menu
	KillSpawnedScript \{name = song_preview_update_playbar}
	SoundEvent \{event = GHTunes_off}
	clean_up_user_control_helpers
	if ScreenElementExists \{id = song_preview_element}
		song_preview_element :SetProps \{rot_angle = 90
			time = 0.2}
		song_preview_element :SE_WaitProps
	endif
	destroy_song_preview_menu ghtunes = <ghtunes>
	if (<ghtunes> = 1)
		song_preview_unload
		ui_event event = menu_back state = UIstate_jam_ghtunes data = {straight_to_leaderbrd = {index = <board_index> start_at = <start_at>}}
	endif
endscript

script song_preview_unload 
	jamsession_unload \{song_prefix = 'editable'}
	ClearJamSession
endscript

script destroy_song_preview_menu \{ghtunes = 0}
	jam_stop_all_sound
	if ScreenElementExists \{id = song_preview_element}
		DestroyScreenElement \{id = song_preview_element}
	endif
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	KillSpawnedScript \{name = song_preview_update_playbar}
	if (<ghtunes> = 0)
		if ScreenElementExists \{id = current_menu}
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
	endif
endscript
