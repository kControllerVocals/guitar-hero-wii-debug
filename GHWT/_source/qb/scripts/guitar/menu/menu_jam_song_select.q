
script create_jam_song_select_menu \{curr_tab = 0
		advanced_record = 0
		show_popup = 0}
	printf \{channel = jam_mode
		qs("\LCREATE SONG SELECT MENU")}
	jam_init_menu_light_show
	startrendering
	if (<show_popup> = 1)
		stoprendering
	endif
	ReloadSfx \{mode = jammode}
	if (<advanced_record> = 1)
		if NOT ($target_jam_camera_prop = jam_song_select)
			change \{target_jam_camera_prop = jam_ghmix_song_select}
			jam_camera_wait
		endif
	else
		if NOT ($target_jam_camera_prop = jam_song_select)
			change \{target_jam_camera_prop = jam_song_select}
			jam_camera_wait
		endif
	endif
	if ($jam_reverb = 0)
		jam_init_reverb
	endif
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = jam_song_select_container}
	if (<curr_tab> = 0)
		<line_pos> = (237.0, 510.0)
	else
		<line_pos> = (237.0, 480.0)
	endif
	change \{menu_focus_color = [
			255
			215
			0
			255
		]}
	change \{menu_unfocus_color = [
			255
			255
			255
			255
		]}
	song_text_params = {type = TextElement font = fontgrid_text_a8 just = [left center] scale = 0.8 rgba = [255 255 255 255]}
	song_info_text_params = {type = TextElement font = fontgrid_title_a1 just = [left center] scale = 0.35000002 rgba = ($default_color_scheme.text_color)}
	SetPlayerInfo 1 controller = ($primary_controller)
	if (<curr_tab> = 0)
		directorylisting = $jam_curr_directory_listing
		make_generic_menu \{title = qs("My Songs")
			pad_back_script = menu_jam_song_select_back
			vmenu_id = create_my_song_menu
			dims = (400.0, 600.0)
			tags = {
				debug_me
			}
			scrolling}
		GetArraySize <directorylisting>
		jam_get_num_songs
		if (<user_song_count> < ($jam_max_user_songs))
			if (<advanced_record> = 0)
				add_generic_menu_icon_item \{icon = icon_jam_create_new
					text = qs("Create New Song")
					choose_state = UIstate_jam_song_wizard
					additional_focus_script = menu_jam_create_song_focus
					additional_unfocus_script = menu_jam_create_song_unfocus}
			else
				change \{jam_current_recording_player = 1}
				SetPlayerInfo \{1
					jam_instrument = 0}
				add_generic_menu_icon_item {
					icon = icon_jam_create_new
					text = qs("Create New Song")
					choose_state = UIstate_recording
					choose_state_data = {back_to_jam_band = 0 current_instrument = 0 player = ($jam_current_recording_player)}
					additional_focus_script = menu_jam_create_song_focus
					additional_unfocus_script = menu_jam_create_song_unfocus
				}
			endif
		endif
		has_download_songs = 0
		first_local_song = 0
		if (<array_size> > 0)
			CreateScriptArray name = jam_download_songs size = <array_size> heap = heap_song
			index = 0
			begin
			show_local_song = 1
			if StructureContains Structure = (<directorylisting> [<index>]) downloaded
				if ((<directorylisting> [<index>].downloaded) = 1)
					<show_local_song> = 0
					<has_download_songs> = 1
					SetArrayElement ArrayName = jam_download_songs GlobalArray index = <index> newvalue = 1
				endif
			endif
			if (<show_local_song> = 1)
				if (<first_local_song> = 0)
					add_generic_menu_text_item \{text = qs("MY SONGS: ")
						heading}
					<first_local_song> = 1
				endif
				SetArrayElement ArrayName = jam_download_songs GlobalArray index = <index> newvalue = 0
				if ($enable_loading = 0)
					add_generic_menu_text_item {
						text = (<directorylisting> [<index>].filename)
						not_focusable
					}
				else
					if NOT ((<directorylisting> [<index>].song_version) = 0)
						add_generic_menu_text_item {
							text = (<directorylisting> [<index>].filename)
							pad_choose_script = jam_song_select_load_song
							pad_choose_params = {index = <index> filename = (<directorylisting> [<index>].filename) advanced_record = <advanced_record>}
							pad_start_script = delete_jam_song_confirm
							pad_start_params = {index = <index> filename = (<directorylisting> [<index>].filename) advanced_record = <advanced_record>}
						}
					endif
				endif
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
		if (<has_download_songs> = 1)
			if NetSessionFunc \{func = can_view_user_content}
				add_generic_menu_text_item \{text = qs("DOWNLOADED SONGS: ")
					heading}
				index = 0
				begin
				if ($jam_download_songs [<index>] = 1)
					add_generic_menu_text_item {
						text = (<directorylisting> [<index>].filename)
						pad_choose_script = jam_song_select_load_song
						pad_choose_params = {index = <index> filename = (<directorylisting> [<index>].filename) advanced_record = <advanced_record>}
						pad_start_script = delete_jam_song_confirm
						pad_start_params = {index = <index> filename = (<directorylisting> [<index>].filename) advanced_record = <advanced_record>}
					}
				endif
				<index> = (<index> + 1)
				repeat <array_size>
			endif
		endif
		if GlobalExists \{name = jam_download_songs
				type = array}
			printf \{channel = jam_mode
				qs("\Ldestroy jam_download_songs")}
			DestroyScriptArray \{name = jam_download_songs}
		endif
		GetArraySize ($jam_song_assets)
		num_assets = <array_size>
		add_generic_menu_text_item \{text = qs("EXAMPLE SONGS: ")
			heading}
		index = 0
		begin
		if NOT StructureContains Structure = ($jam_song_assets [<index>]) no_qp
			add_generic_menu_text_item {
				text = ($jam_song_assets [<index>].display_name)
				pad_choose_script = jam_song_select_load_song
				pad_choose_params = {index = <index> filename = ($jam_song_assets [<index>].filename) advanced_record = <advanced_record> example_song = 1}
				additional_focus_script = menu_jam_create_song_focus
				additional_unfocus_script = menu_jam_create_song_unfocus
			}
		endif
		<index> = (<index> + 1)
		repeat <num_assets>
	endif
	change \{jam_band_new_song = 0}
	destroy_jam_song_select_popup
	if (<show_popup> = 1)
		startrendering
		create_jam_song_select_popup advanced_record = <advanced_record>
	else
		LaunchEvent \{type = focus
			target = current_menu}
	endif
	create_viewport_ui \{texture = `tex\zones\Z_Studio\RM_Studio_Monitor_GH_Mix.dds`
		texdict = `zones/z_studio/Z_Studio.tex`
		keep_current_level}
	spawnscriptnow menu_jam_screensaver params = {window_id = <window_id>}
	<window_id> :Obj_SpawnScriptNow menu_jam_screensaver params = {window_id = <window_id>}
	destroy_loading_screen
endscript

script menu_jam_screensaver 
	CreateScreenElement {
		parent = <window_id>
		type = SpriteElement
		texture = load_record
		rgba = [200 200 200 255]
		dims = (20.0, 20.0)
		scale = 10
		alpha = 1
		pos = (320.0, 135.0)
		z_priority = 1000
		alpha = 0
	}
	if NOT GotParam \{no_fade}
		<id> :SE_SetProps alpha = 1 rot_angle = 360 time = 2
		<id> :SE_WaitProps
	else
		<id> :SE_SetProps alpha = 1
	endif
	begin
	<id> :SE_SetProps rot_angle = 0
	<id> :SE_SetProps rot_angle = 360 time = 2
	<id> :SE_WaitProps
	repeat
endscript

script menu_jam_screensaver_loading 
	CreateScreenElement {
		type = TextBlockElement
		parent = <window_id>
		font = fontgrid_text_a3
		just = [center center]
		internal_just = [center center]
		scale = 1
		rgba = [150 150 150 255]
		pos = (320.0, 135.0)
		dims = (170.0, 40.0)
		text = qs("LOADING")
		z_priority = 1000
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = Original
	}
	time_between = 0.1
	loading_text_base = qs("Loading")
	period_array = [qs("") qs("\L.") qs("\L..") qs("\L...")]
	count = 0
	begin
	FormatText TextName = loading_text qs("\L%s%a") s = <loading_text_base> a = (<period_array> [<count>])
	<id> :SetProps text = <loading_text>
	Wait <time_between> seconds
	<count> = (<count> + 1)
	if (<count> > 3)
		<count> = 0
	endif
	repeat
endscript

script menu_jam_song_select_back 
	destroy_jam_play_select_menu
	generic_event_back
endscript

script jam_tutorial_button_focus 
	retail_menu_focus \{id = jam_tutorial_button}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
endscript

script jam_tutorial_button_unfocus 
	retail_menu_unfocus \{id = jam_tutorial_button}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	add_user_control_helper \{text = qs("DELETE")
		button = start
		z = 100}
endscript

script menu_jam_create_song_focus 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
endscript

script menu_jam_create_song_unfocus 
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	add_user_control_helper \{text = qs("DELETE")
		button = start
		z = 100}
endscript

script delete_jam_song_confirm 
	LaunchEvent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	FormatText TextName = delete_dialog qs("Are you sure you want to delete the Song %s?") s = <filename>
	create_popup_warning_menu {
		textblock = {
			text = <delete_dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {cancel_delete_jam_song}
				text = qs("CANCEL")
			}
			{
				func = {delete_jam_song}
				func_params = {<...>}
				text = qs("DELETE")
			}
		]
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 10000}
endscript

script cancel_delete_jam_song 
	destroy_popup_warning_menu
	change \{menu_focus_color = [
			255
			215
			0
			255
		]}
	change \{menu_unfocus_color = [
			255
			255
			255
			255
		]}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	add_user_control_helper \{text = qs("DELETE")
		button = start
		z = 100}
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script delete_jam_song \{advanced_record = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	LaunchEvent \{type = unfocus
		target = pu_warning_vmenu}
	clean_up_user_control_helpers
	change memcard_jamsession_file_name = <filename>
	change memcard_jamsession_actual_file_name = ($jam_curr_directory_listing [<index>].actual_file_name)
	ui_memcard_delete_jam event = menu_back data = {state = UIstate_jam_select_song advanced_record = <advanced_record> show_popup = 0}
endscript

script destroy_jam_song_select_menu 
	KillSpawnedScript \{name = create_jam_song_select_menu}
	set_focus_color
	set_unfocus_color
	KillSpawnedScript \{name = menu_jam_screensaver}
	destroy_viewport_ui
	printf \{qs("\LDESTROY SONG SELECT MENU")}
	if ScreenElementExists \{id = jam_song_select_container}
		DestroyScreenElement \{id = jam_song_select_container}
	endif
	destroy_jam_play_select_menu
	destroy_generic_menu
	destroy_jam_song_select_popup
	jam_destroy_tutorial_menu
	KillSpawnedScript \{id = jam_song_select_spawns}
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript
jam_selected_song = $wii_jam_custom_song

script jam_song_select_load_song \{advanced_record = 0
		example_song = 0}
	printf \{channel = jam_mode
		qs("\Ljam_song_select_load_song")}
	ClearJamSession
	reset_quickplay_song_list
	jam_recording_create_editable_arrays
	if (<example_song> = 0)
		directorylisting = ($jam_curr_directory_listing)
		year = (<directorylisting> [<index>].year)
	else
		year = 2008
	endif
	change_jamsession_songlist_props_struct year = <year>
	if NOT (<example_song> = 1)
		change memcard_jamsession_file_name = <filename>
		change memcard_jamsession_actual_file_name = ($jam_curr_directory_listing [<index>].actual_file_name)
		ui_memcard_load_jam event = menu_back data = {show_popup = 1 example_song = <example_song>}
	else
		LoadJam file_name = <filename>
		change jam_selected_song = <filename>
		create_jam_song_select_popup example_song = <example_song> advanced_record = <advanced_record>
	endif
endscript

script create_jam_song_select_popup \{advanced_record = 0
		example_song = 0
		back_to_menu = 0}
	stoprendering
	if ScreenElementExists \{id = current_menu}
		current_menu :SE_SetProps \{block_events}
	endif
	GetSongInfo
	if NOT (<downloaded> = 1 || <example_song> = 1)
		destroy_popup_warning_menu
		create_popup_warning_menu {
			title = qs("SONG SELECT")
			textblock = {
				text = qs("")
				dims = (840.0, 600.0)
				pos = (640.0, 370.0)
				scale = 0.55
			}
			player_device = <player_device>
			options = [
				{
					func = jam_popup_play_song
					func_params = {advanced_record = <advanced_record> back_to_menu = <back_to_menu>}
					text = qs("PLAY SONG")
				}
				{
					func = jam_popup_edit_song
					func_params = {advanced_record = <advanced_record>}
					text = qs("EDIT SONG")
				}
				{
					func = jam_popup_publish_song
					func_params = {filename = ($jam_selected_song)}
					text = qs("PUBLISH SONG")
				}
			]
			back_button_script = jam_song_options_select_back
			back_button_params = {advanced_record = <advanced_record>}
		}
	else
		destroy_popup_warning_menu
		create_popup_warning_menu {
			title = qs("SONG SELECT")
			textblock = {
				text = qs("")
				dims = (840.0, 600.0)
				pos = (640.0, 370.0)
				scale = 0.55
			}
			player_device = <player_device>
			options = [
				{
					func = jam_popup_play_song
					func_params = {<...>}
					text = qs("PLAY SONG")
				}
			]
			back_button_script = jam_song_options_select_back
			back_button_params = {advanced_record = <advanced_record>}
		}
	endif
	if PopupElement :Desc_ResolveAlias \{name = alias_dlog_vmenu}
		<resolved_id> :SE_SetProps block_events
	endif
	GetTrackInfo \{track = rhythm}
	change jam_current_bpm = <bpm>
	change jam_current_tuning = <tuning>
	GetArraySize \{$drum_kits}
	printf channel = jam_mode qs("\Ldrum kit %s") s = <drum_kit>
	if ((<drum_kit> >= <array_size>) || (<drum_kit> < 0))
		<drum_kit> = 0
	endif
	if (<back_to_menu> = 0)
		change jam_current_drum_kit = <drum_kit>
		SetDrumKitAll drum_kit = ($drum_kits [<drum_kit>].string_id) percussion_kit = ($drum_kits [<drum_kit>].percussion_string_id) async = 0
		SetMelodyKit melody_kit = <melody_kit>
		jam_init_volumes
		jam_init_pan
		change \{jam_current_instrument_effects = [
				0
				0
				0
				0
				0
			]}
		change \{jam_current_active_effects = [
				0
				0
				0
				0
				0
			]}
		jam_load_scale
		jam_load_effect
	endif
	player_device = ($primary_controller)
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
	cas_update_band_logo \{album_art}
	PushAssetContext context = ($CAS_Band_Logo_Details.assetcontext)
	CreateScreenElement {
		type = SpriteElement
		parent = popup_warning_container
		texture = ($CAS_Band_Logo_Details.textureasset)
		just = [left center]
		rgba = [255 255 255 250]
		pos = (350.0, 305.0)
		dims = (170.0, 170.0)
		z_priority = 1000
	}
	PopAssetContext
	create_jam_song_info_text parent = popup_warning_container pos = (540.0, 288.0) rgba = [180 180 180 250] filename = ($jam_selected_song)
	if PopupElement :Desc_ResolveAlias \{name = alias_dlog_vmenu}
		<resolved_id> :SE_SetProps unblock_events
		<resolved_id> :Menu_ChangeSelection
		<resolved_id> :Menu_ChangeSelection up
	endif
	startrendering
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 10000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 10000}
endscript

script create_jam_song_info_text \{column_offset = (220.0, 0.0)
		z_priority = 1000
		rgba = [
			210
			130
			0
			250
		]
		num_ratings = 0}
	note_count_text = [qs("") qs("") qs("") qs("") qs("")]
	tracks_recorded_text = qs("")
	count = 0
	last_end_time = 0
	all_tracks = 1
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
		FormatText TextName = note_count qs("\L%a: %b %s") a = ($jam_tracks [<count>].name_text) b = (($<notetrack_size>) / 2) s = qs("notes")
		FormatText TextName = tracks_recorded_text qs("\L%s%a ") s = <tracks_recorded_text> a = ($jam_tracks [<count>].name_text)
		SetArrayElement ArrayName = note_count_text index = <count> newvalue = <note_count>
	else
		FormatText TextName = note_count qs("\L%a: %s ") a = ($jam_tracks [<count>].name_text) s = qs("empty")
		SetArrayElement ArrayName = note_count_text index = <count> newvalue = <note_count>
		all_tracks = 0
	endif
	<count> = (<count> + 1)
	repeat 5
	if (<tracks_recorded_text> = qs(""))
		FormatText \{TextName = tracks_recorded_text
			qs("Empty Song")}
	endif
	if (<all_tracks> = 1)
		FormatText \{TextName = tracks_recorded_text
			qs("ALL TRACKS")}
	endif
	Mod a = <last_end_time> b = 60000
	<seconds> = (<Mod> / 1000)
	<minutes> = (<last_end_time> / 60000)
	<sec_check> = (<seconds> / 10)
	if (<sec_check> < 1)
		FormatText TextName = length_text qs("LENGTH: %a:0%b") a = <minutes> b = <seconds>
	else
		FormatText TextName = length_text qs("LENGTH: %a:%b") a = <minutes> b = <seconds>
	endif
	FormatText \{TextName = bpm_text
		qs("BPM: %a")
		a = $jam_current_bpm}
	GetSongInfo
	GetArraySize \{$jam_genre_list}
	if (<genre> < 0 || <genre> >= <array_size>)
		FormatText TextName = genre_text qs("No Genre") a = <genre>
	else
		FormatText TextName = genre_text qs("GENRE: %a") a = ($jam_genre_list [<genre>].name_text)
	endif
	if (<artist> = qs(""))
		<artist> = qs("No Artist")
	endif
	if ScreenElementExists \{id = song_preview_element}
		platform_prefix = qs("\L")
		if isXenon
			<platform_prefix> = qs("\Lx")
		elseif IsPs3
			<platform_prefix> = qs("\Lp")
		else
			<platform_prefix> = qs("\Lw")
		endif
		if ((<file_id>.file_id [0]) = 0)
			FormatText TextName = file_id_text qs("\LId: %p%a") a = (<file_id>.file_id [1]) p = <platform_prefix>
		else
			FormatText TextName = file_id_text qs("\LId: %p%a %b") a = (<file_id>.file_id [1]) b = (<file_id>.file_id [0]) p = <platform_prefix>
		endif
		if ((<file_id>.file_id [0]) = 0 && (<file_id>.file_id [1]) = 0)
			file_id_text = qs("\L")
		endif
		if NOT (<num_ratings> = 0)
			FormatText TextName = ratings_text qs("Total Votes: %a") a = <num_ratings>
		else
			ratings_text = qs("\L")
		endif
		song_preview_element :SE_SetProps {
			song_name_text = <filename>
			artist_name_text = <artist>
			note_count01_text = (<note_count_text> [0])
			note_count02_text = (<note_count_text> [1])
			note_count03_text = (<note_count_text> [2])
			note_count04_text = (<note_count_text> [3])
			note_count05_text = (<note_count_text> [4])
			length_text = <length_text>
			bpm_text = <bpm_text>
			genre_text = <genre_text>
			file_id_text = <file_id_text>
			num_ratings_text = <ratings_text>
		}
	else
		if (<genre> < 0 || <genre> >= <array_size>)
			FormatText TextName = length_text qs("\L%s, %b") s = <length_text> b = qs("No Genre")
		else
			FormatText TextName = length_text qs("\L%s, %b") s = <length_text> b = ($jam_genre_list [<genre>].name_text)
		endif
		CreateScreenElement {
			parent = <parent>
			type = DescInterface
			desc = 'jam_song_info_text'
			pos = (190.0, 115.0)
			scale = 0.75
			song_name_text = <filename>
			artist_name_text = <artist>
			tracks_recorded_text = <tracks_recorded_text>
			song_length_text = <length_text>
			bpm_text = <bpm_text>
			genre_text = <genre_text>
			z_priority = 1000
		}
	endif
	return song_length = <last_end_time>
endscript

script jam_song_options_select_back \{advanced_record = 0}
	ui_menu_select_sfx
	jamsession_unload \{song_prefix = 'editable'}
	ClearJamSession
	ui_event event = menu_replace data = {state = UIstate_jam_select_song show_popup = 0 advanced_record = <advanced_record> <...>}
endscript

script destroy_jam_song_select_popup 
	destroy_popup_warning_menu
endscript

script jam_popup_play_song 
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{type = unfocus
			target = current_menu}
	endif
	if (<back_to_menu> = 0)
		jam_recording_create_jamsession_arrays
		song_prefix = 'editable'
		FormatText checksumname = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
		song_prefix = 'jamsession'
		FormatText checksumname = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
		jamsession_copymarkerarrays \{song = editable}
		jamsession_copyfinalscriptarrays arraylist = <arraylist> arraylist2 = <arraylist2>
	endif
	create_jam_play_select_menu <...> advanced_record = <advanced_record>
endscript

script jam_popup_edit_song \{advanced_record = 0}
	printf \{channel = jam_mode
		qs("\Ljam_popup_edit_song")}
	printf channel = jam_mode qs("\LEdit Song %s (Advanced record? %a)") s = ($jam_selected_song) a = <advanced_record>
	if (<advanced_record> = 0)
		generic_event_choose state = UIstate_jam_band data = {editing = 1 advanced_record = <advanced_record>}
	else
		change \{jam_current_recording_player = 1}
		SetPlayerInfo \{1
			jam_instrument = 0}
		generic_event_choose state = UIstate_recording data = {back_to_jam_band = 0 editing = 1 current_instrument = 0 player = ($jam_current_recording_player)}
	endif
endscript

script jam_popup_publish_song 
	printf \{channel = jam_mode
		qs("\Ljam_popup_publish_song")}
	GetSongInfo
	printf channel = jam_mode qs("\Lgenre %a version %b") a = <genre> b = <song_version>
	generic_event_choose state = UIstate_jam_publish_song data = {filename = <filename> newfilename = <filename> new_genre = <genre>}
endscript

script load_jam_assets 
	GetArraySize <directorylisting>
	num_saves = <array_size>
	GetArraySize ($jam_song_assets)
	num_assets = <array_size>
	if (<num_assets> <= 0)
		return
	endif
	i = 0
	new_asset = 0
	begin
	curr_asset = ($jam_song_assets [<i>].filename)
	j = 0
	found_for_add = 0
	begin
	if (<num_saves> <= 0)
		break
	endif
	curr_save = (<directorylisting> [<j>].filename)
	if (<curr_save> = <curr_asset>)
		<found_for_add> = 1
	endif
	<j> = (<j> + 1)
	repeat <num_saves>
	if NOT (<found_for_add> = 1)
		FormatText TextName = curr_asset '%s' s = <curr_asset>
		LoadJam file_name = <curr_asset>
		<new_asset> = 1
	else
		printf channel = jam_mode qs("\L%s song allready exists") s = <curr_asset>
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return new_asset = <new_asset>
endscript

script LoadJam \{file_name = 'output'
		save = 1}
	prepend = 'pak/jams/'
	FormatText TextName = pak_path '%a%b.pak' a = <prepend> b = <file_name>
	LoadPak <pak_path>
	prepend = 'jams/'
	FormatText TextName = file_path '%a%b.jam' a = <prepend> b = <file_name>
	printf channel = jam_mode qs("\LLoad %s") s = <file_path>
	SetSearchAllAssetContexts
	LoadJamSessionFromPak jamname = <file_path>
	SetSearchAllAssetContexts \{off}
	SetSongInfo \{song_version = $jam_song_version}
	UnloadPak <pak_path>
	WaitUnloadPak <pak_path>
endscript

script SaveJam \{file_name = 'output'}
	SetSongInfo \{downloaded = 0}
	GetSongInfo
	printstruct channel = jam_mode <...>
	prepend = 'dumps\\'
	FormatText TextName = file_path '%a%b.jam' a = <prepend> b = <file_name>
	printf channel = jam_mode qs("\LSave %s") s = <file_path>
	SaveJamSessionToFile jamname = <file_path>
endscript

script create_jam_play_select_menu 
	LaunchEvent \{type = unfocus
		target = current_menu}
	destroy_popup_warning_menu
	destroy_jam_song_select_menu
	make_generic_menu {
		title = qs("Track Select")
		pad_back_script = jam_play_select_menu_go_back
		pad_back_params = {advanced_record = <advanced_record> <...>}
		menu_id = jam_play_select_menu
		vmenu_id = jam_play_select_vmenu
		dims = (400.0, 300.0)
	}
	<has_guitar> = 0
	<has_drums> = 0
	<has_melody> = 0
	<normal_controller> = 0
	if NOT IsGuitarController \{controller = $primary_controller}
		if NOT IsDrumController \{controller = $primary_controller}
			<normal_controller> = 1
		endif
	endif
	guitar_end_time = 0
	bass_end_time = 0
	drum_end_time = 0
	melody_end_time = 0
	suffix = '_size'
	GetSongInfo
	if ((IsGuitarController controller = $primary_controller) || ($allow_controller_for_all_instruments = 1 && <normal_controller> = 1))
		if IsGuitarController \{controller = $primary_controller}
			SetPlayerInfo \{1
				part = guitar}
		endif
		if (<playback_track1> >= 0)
			guitar_gem_array = ($jam_tracks [<playback_track1>].gem_array)
			AppendSuffixToChecksum Base = <guitar_gem_array> SuffixString = <suffix>
			guitar_gem_array_size = ($<appended_id>)
			if (<guitar_gem_array_size> > 0)
				<end_time> = ($<guitar_gem_array> [(<guitar_gem_array_size> - 2)])
				<guitar_end_time> = <end_time>
				Mod a = <end_time> b = 60000
				<seconds> = (<Mod> / 1000)
				<minutes> = (<end_time> / 60000)
				<sec_check> = (<seconds> / 10)
				if (<sec_check> < 1)
					FormatText TextName = txt qs("Play Guitar (%s %a:0%b)") a = <minutes> b = <seconds> s = ($jam_tracks [<playback_track1>].name_text)
				else
					FormatText TextName = txt qs("Play Guitar (%s %a:%b)") a = <minutes> b = <seconds> s = ($jam_tracks [<playback_track1>].name_text)
				endif
				add_generic_menu_text_item {
					text = <txt>
					pad_choose_script = create_jam_difficulty_select_menu
					pad_choose_params = {inst = 0 end_time = <guitar_end_time> advanced_record = <advanced_record> example_song = <example_song>}
				}
				<has_guitar> = 1
			endif
		endif
		if (<playback_track2> >= 0)
			bass_gem_array = ($jam_tracks [<playback_track2>].gem_array)
			AppendSuffixToChecksum Base = <bass_gem_array> SuffixString = <suffix>
			bass_gem_array_size = ($<appended_id>)
			if (<bass_gem_array_size> > 0)
				<end_time> = ($<bass_gem_array> [(<bass_gem_array_size> - 2)])
				<bass_end_time> = <end_time>
				Mod a = <end_time> b = 60000
				<seconds> = (<Mod> / 1000)
				<minutes> = (<end_time> / 60000)
				<sec_check> = (<seconds> / 10)
				if (<sec_check> < 1)
					FormatText TextName = txt qs("Play Bass (%s %a:0%b)") a = <minutes> b = <seconds> s = ($jam_tracks [<playback_track2>].name_text)
				else
					FormatText TextName = txt qs("Play Bass (%s %a:%b)") a = <minutes> b = <seconds> s = ($jam_tracks [<playback_track2>].name_text)
				endif
				add_generic_menu_text_item {
					text = <txt>
					pad_choose_script = create_jam_difficulty_select_menu
					pad_choose_params = {inst = 2 end_time = <bass_end_time> advanced_record = <advanced_record> example_song = <example_song>}
				}
				<has_guitar> = 1
			endif
		endif
	endif
	if ((IsDrumController controller = $primary_controller) || ($allow_controller_for_all_instruments = 1 && <normal_controller> = 1))
		if IsDrumController \{controller = $primary_controller}
			SetPlayerInfo \{1
				part = drum}
		endif
		<drum_array> = ($jam_tracks [3].gem_array)
		AppendSuffixToChecksum Base = <drum_array> SuffixString = <suffix>
		if (($<appended_id>) > 0)
			<end_time> = ($<drum_array> [($<appended_id> - 2)])
			<drum_end_time> = <end_time>
			Mod a = <end_time> b = 60000
			<seconds> = (<Mod> / 1000)
			<minutes> = (<end_time> / 60000)
			<sec_check> = (<seconds> / 10)
			if (<sec_check> < 1)
				FormatText TextName = txt qs("Play Drums (%a:0%b)") a = <minutes> b = <seconds>
			else
				FormatText TextName = txt qs("Play Drums (%a:%b)") a = <minutes> b = <seconds>
			endif
			add_generic_menu_text_item {
				text = <txt>
				pad_choose_script = create_jam_difficulty_select_menu
				pad_choose_params = {inst = 3 end_time = <drum_end_time> advanced_record = <advanced_record> example_song = <example_song>}
			}
			<has_drums> = 1
		endif
	endif
	if (<normal_controller> = 1)
		<melody_array> = ($jam_tracks [4].gem_array)
		AppendSuffixToChecksum Base = <melody_array> SuffixString = <suffix>
		if (($<appended_id>) > 0)
			<end_time> = ($<melody_array> [($<appended_id> - 2)])
			<melody_end_time> = <end_time>
			Mod a = <end_time> b = 60000
			<seconds> = (<Mod> / 1000)
			<minutes> = (<end_time> / 60000)
			<sec_check> = (<seconds> / 10)
			if (<sec_check> < 1)
				FormatText TextName = txt qs("Sing Melody (%a:0%b)") a = <minutes> b = <seconds>
			else
				FormatText TextName = txt qs("Sing Melody (%a:%b)") a = <minutes> b = <seconds>
			endif
			add_generic_menu_text_item {
				text = <txt>
				pad_choose_script = create_jam_difficulty_select_menu
				pad_choose_params = {inst = 4 end_time = <melody_end_time> advanced_record = <advanced_record> example_song = <example_song>}
			}
		endif
	endif
	if ((IsGuitarController controller = $primary_controller) && (<has_guitar> = 0))
		<txt> = qs("No guitar tracks, go back")
		add_generic_menu_text_item {
			text = <txt>
			pad_choose_script = jam_play_select_menu_go_back
			pad_choose_params = {example_song = <example_song>}
		}
	elseif ((IsDrumController controller = $primary_controller) && (<has_drums> = 0))
		<txt> = qs("No drum tracks, go back")
		add_generic_menu_text_item {
			text = <txt>
			pad_choose_script = jam_play_select_menu_go_back
			pad_choose_params = {example_song = <example_song>}
		}
	endif
	if NOT (IsGuitarController controller = $primary_controller)
		if NOT (IsDrumController controller = $primary_controller)
			if (<has_melody> = 0)
				<txt> = qs("No playable tracks, go back")
				add_generic_menu_text_item {
					text = <txt>
					pad_choose_script = jam_play_select_menu_go_back
					pad_choose_params = {example_song = <example_song>}
				}
			endif
		endif
	endif
	LaunchEvent \{type = focus
		target = jam_play_select_vmenu}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 110}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 110}
endscript

script destroy_jam_play_select_menu 
	if ScreenElementExists \{id = jam_play_select_menu}
		DestroyScreenElement \{id = jam_play_select_menu}
	endif
	change \{menu_unfocus_color = [
			255
			255
			255
			255
		]}
	change \{menu_focus_color = [
			255
			215
			0
			255
		]}
	if ScreenElementExists \{id = current_menu}
		LaunchEvent \{type = focus
			target = current_menu}
	endif
endscript

script jam_play_select_menu_go_back 
	stoprendering
	destroy_jam_play_select_menu
	destroy_popup_warning_menu
	create_jam_song_select_popup <...> example_song = <example_song> back_to_menu = 1
endscript

script jam_create_song_failed_dialog \{dialog = 0}
	LaunchEvent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	switch <dialog>
		case 0
		FormatText \{TextName = dialog
			qs("Create song failed. You've exceeded the limit of %s user songs. Please delete some songs and try again.")
			s = $jam_max_user_songs}
	endswitch
	destroy_popup_warning_menu
	create_popup_warning_menu {
		title = qs("CREATE SONG FAILED")
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_create_song_failed_go_back}
				text = qs("GO BACK")
			}
		]
		Long
	}
endscript

script jam_create_song_failed_go_back 
	destroy_popup_warning_menu
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script jam_auto_generate_guitar_gem_array 
	rhythm_gem_array = ($jam_tracks [0].gem_array)
	lead_gem_array = ($jam_tracks [1].gem_array)
	AppendSuffixToChecksum Base = <rhythm_gem_array> SuffixString = '_size'
	rhythm_array_size = <appended_id>
	AppendSuffixToChecksum Base = <lead_gem_array> SuffixString = '_size'
	lead_array_size = <appended_id>
	FormatText \{checksumname = guitar_gem_array
		'guitar_gem_array'}
	if GlobalExists name = <guitar_gem_array> type = array
		DestroyScriptArray name = <guitar_gem_array>
	endif
	CreateScriptArray name = <guitar_gem_array> size = (($gemarraysize) * 4) heap = heap_song <...>
	AppendSuffixToChecksum Base = <guitar_gem_array> SuffixString = '_size'
	guitar_gem_array_size = <appended_id>
	ms_per_beat = (60000.0 / $jam_current_bpm)
	measure_quantize = (<ms_per_beat> * 4)
	quarter_quantize = <ms_per_beat>
	lead_index = 0
	rhythm_index = 0
	curr_time = 0
	record_lead = 0
	lead_done = 0
	rhythm_done = 0
	begin
	GetNoteTrackItem name = <rhythm_gem_array> index = <rhythm_index>
	rhythm_gem_time = <gem_time>
	rhythm_gem_length = <gem_length>
	rhythm_gem_pattern = <gem_pattern>
	GetNoteTrackItem name = <lead_gem_array> index = <lead_index>
	lead_gem_time = <gem_time>
	lead_gem_length = <gem_length>
	lead_gem_pattern = <gem_pattern>
	lead_note_end = (<lead_gem_time> + <lead_gem_length>)
	rhythm_note_end = (<rhythm_gem_time> + <rhythm_gem_length>)
	rhythm_measure = (<rhythm_gem_time> / <measure_quantize>)
	lead_measure = (<lead_gem_time> / <measure_quantize>)
	CastToInteger \{rhythm_measure}
	CastToInteger \{lead_measure}
	next_lead_measure_time = ((<lead_measure> + 1) * <measure_quantize>)
	next_rhythm_measure_time = ((<rhythm_measure> + 1) * <measure_quantize>)
	if (<next_rhythm_measure_time> < <next_lead_measure_time>)
		<record_lead> = 0
	else
		<record_lead> = 1
	endif
	if (<lead_done> = 1)
		<record_lead> = 0
	endif
	if (<rhythm_done> = 1)
		<record_lead> = 1
	endif
	if (<record_lead> = 0)
		<curr_time> = <rhythm_note_end>
		AddNoteTrackItem name = <guitar_gem_array> time = <rhythm_gem_time> length = <rhythm_gem_length> pattern = <rhythm_gem_pattern>
	else
		<curr_time> = <lead_note_end>
		AddNoteTrackItem name = <guitar_gem_array> time = <lead_gem_time> length = <lead_gem_length> pattern = <lead_gem_pattern>
	endif
	begin
	if (<rhythm_index> < $<rhythm_array_size>)
		GetNoteTrackItem name = <rhythm_gem_array> index = <rhythm_index>
		rhythm_gem_time = <gem_time>
		rhythm_gem_length = <gem_length>
		rhythm_gem_pattern = <gem_pattern>
		if NOT (<rhythm_gem_length> > 0)
			if (<rhythm_gem_time> > <curr_time>)
				break
			endif
		elseif (<rhythm_gem_time> >= <curr_time>)
			break
		endif
	else
		<rhythm_done> = 1
		break
	endif
	<rhythm_index> = (<rhythm_index> + 2)
	repeat
	begin
	if (<lead_index> < $<lead_array_size>)
		GetNoteTrackItem name = <lead_gem_array> index = <lead_index>
		lead_gem_time = <gem_time>
		lead_gem_length = <gem_length>
		lead_gem_pattern = <gem_pattern>
		if NOT (<lead_gem_length> > 0)
			if (<lead_gem_time> > <curr_time>)
				break
			endif
		elseif (<lead_gem_time> >= <curr_time>)
			break
		endif
	else
		<lead_done> = 1
		break
	endif
	<lead_index> = (<lead_index> + 2)
	repeat
	if (<lead_done> = 1)
		if (<rhythm_done> = 1)
			break
		endif
	endif
	repeat
	printf \{channel = jam_mode
		qs("\Lend jam_auto_generate_guitar_gem_array")}
endscript

script jam_auto_generate_melody_gem_array 
	melody_gem_array = ($jam_tracks [4].gem_array)
	AppendSuffixToChecksum Base = <melody_gem_array> SuffixString = '_size'
	melody_array_size = <appended_id>
	vocal_gem_array = temp_vocal_array
	if GlobalExists name = <vocal_gem_array> type = Integer
		DestroyScriptArray name = <vocal_gem_array>
	endif
	CreateScriptArray name = <vocal_gem_array> size = ($gemarraysize * 3) heap = heap_song
	AppendSuffixToChecksum Base = <vocal_gem_array> SuffixString = '_size'
	vocal_gem_array_size = <appended_id>
	<midi_low> = 999
	<midi_high> = -1
	<counter> = 0
	<melody_index> = 0
	GetJamSessionSize track = ($jam_tracks [4].id)
	default_phrase_array = [0 3 1000 3]
	change jamsession_vocals_phrases = <default_phrase_array>
	<phrases> = <default_phrase_array>
	if (<track_size> > 0)
		begin
		GetNoteTrackItem name = <melody_gem_array> index = (<counter> * 2)
		melody_gem_time = <gem_time>
		melody_gem_length = <gem_length>
		GetJamSessionSound track = melody index = <counter>
		jam_get_single_sample_for_melody string = <note_string> fret = <note_fret>
		<final_midi_note> = (68 + <pitch_shift>)
		if (<final_midi_note> < <midi_low>)
			<midi_low> = <final_midi_note>
		elseif (<final_midi_note> > <midi_high>)
			<midi_high> = <final_midi_note>
		endif
		SetArrayElement ArrayName = <vocal_gem_array> GlobalArray index = <melody_index> newvalue = <gem_time>
		SetArrayElement ArrayName = <vocal_gem_array> GlobalArray index = (<melody_index> + 1) newvalue = <gem_length>
		SetArrayElement ArrayName = <vocal_gem_array> GlobalArray index = (<melody_index> + 2) newvalue = <final_midi_note>
		<melody_index> = (<melody_index> + 3)
		<counter> = (<counter> + 1)
		repeat (<track_size>)
	endif
	SetArrayElement ArrayName = jamsession_vocals_phrases GlobalArray index = 2 newvalue = (<gem_time> + <gem_length>)
	change globalname = <vocal_gem_array_size> newvalue = (<track_size> * 3)
	SetArrayElement ArrayName = jamsession_vocals_note_range GlobalArray index = 0 newvalue = <midi_low>
	SetArrayElement ArrayName = jamsession_vocals_note_range GlobalArray index = 1 newvalue = <midi_high>
	if GlobalExists \{name = jamsession_song_vocals
			type = array}
		DestroyScriptArray \{name = jamsession_song_vocals}
	endif
	CreateScriptArray name = jamsession_song_vocals size = ($gemarraysize * 3) heap = heap_song
	CopyFinalScriptArray \{sourcename = temp_vocal_array
		destname = jamsession_song_vocals}
	if GlobalExists name = <vocal_gem_array> type = array
		DestroyScriptArray name = <vocal_gem_array>
	endif
endscript
JamSession_DiffCrunchParams = {
	drum = {
		easy = {
			filter_note_time_array = [
				{
					type = 4096
					time = 4
				}
				{
					type = 256
					time = 4
				}
				{
					type = 16
					time = 4
				}
				{
					type = 1
					time = 4
				}
				{
					type = 65536
					time = 4
				}
				{
					type = 1048576
					time = 1
				}
			]
			chord_filter = standard_drum_filter
		}
		medium = {
			filter_note_time_array = [
				{
					type = 4096
					time = 16
				}
				{
					type = 256
					time = 8
				}
				{
					type = 16
					time = 4
				}
				{
					type = 1
					time = 8
				}
				{
					type = 65536
					time = 4
				}
				{
					type = 1048576
					time = 0.5
				}
			]
			chord_filter = standard_drum_filter
		}
		hard = {
			filter_note_time_array = [
				{
					type = 4096
					time = 32
				}
				{
					type = 256
					time = 16
				}
				{
					type = 16
					time = 8
				}
				{
					type = 1
					time = 16
				}
				{
					type = 65536
					time = 8
				}
				{
					type = 1048576
					time = 4
				}
			]
			chord_filter = standard_drum_filter
		}
		expert = {
			filter_note_time_array = [
				{
					type = 4096
					time = 32
				}
				{
					type = 256
					time = 32
				}
				{
					type = 16
					time = 32
				}
				{
					type = 1
					time = 32
				}
				{
					type = 65536
					time = 32
				}
				{
					type = 1048576
					time = 32
				}
			]
			chord_filter = standard_drum_filter
		}
	}
	guitar = {
		easy = {
			convert_note_mask = 69632
			convert_note_to = 256
			filter_note_time = 4
			chord_filter = lowest_single_note
		}
		medium = {
			convert_note_mask = 65536
			convert_note_to = 4096
			filter_note_time = 8
			chord_filter = lowest_single_chord_medium
		}
		hard = {
			filter_note_time = 16
			chord_filter = lowest_single_chord_hard
		}
		expert = {
			filter_note_time = 32
		}
	}
	Bass = {
		easy = {
			convert_note_mask = 69632
			convert_note_to = 256
			convert_note_mask2 = 1048576
			convert_note_to2 = 1
			filter_note_time = 4
			chord_filter = lowest_single_note
		}
		medium = {
			convert_note_mask = 65536
			convert_note_to = 4096
			convert_note_mask2 = 1048576
			convert_note_to2 = 1
			filter_note_time = 8
			chord_filter = lowest_single_chord_medium
		}
		hard = {
			filter_note_time = 16
			chord_filter = lowest_single_chord_hard
		}
		expert = {
			filter_note_time = 32
		}
	}
}

script create_jam_difficulty_select_menu \{example_song = 0}
	destroy_jam_play_select_menu
	destroy_popup_warning_menu
	curr_default_difficulty = ($default_difficulty [$primary_controller])
	focus_index = 0
	if GotParam \{curr_default_difficulty}
		switch (<curr_default_difficulty>)
			case easy
			focus_index = 1
			case medium
			focus_index = 2
			case hard
			focus_index = 3
			case expert
			focus_index = 4
		endswitch
	endif
	make_generic_menu {
		title = qs("DIFFICULTY")
		pad_back_script = jam_difficulty_select_go_back
		pad_back_params = {advanced_record = <advanced_record> example_song = <example_song>}
		menu_id = jam_difficulty_select_menu
		vmenu_id = jam_difficulty_select_vmenu
		dims = (400.0, 300.0)
	}
	add_generic_menu_text_item {
		text = qs("BEGINNER")
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = easy_rhythm inst = <inst> end_time = <end_time>}
	}
	add_generic_menu_text_item {
		text = qs("EASY")
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = easy inst = <inst> end_time = <end_time>}
	}
	add_generic_menu_text_item {
		text = qs("MEDIUM")
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = medium inst = <inst> end_time = <end_time>}
	}
	add_generic_menu_text_item {
		text = qs("HARD")
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = hard inst = <inst> end_time = <end_time> end_time = <end_time>}
	}
	add_generic_menu_text_item {
		text = qs("EXPERT")
		pad_choose_script = start_jam_song
		pad_choose_params = {difficulty = expert inst = <inst> end_time = <end_time>}
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	LaunchEvent type = focus target = jam_difficulty_select_vmenu data = {child_index = <focus_index>}
endscript

script jam_difficulty_select_go_back 
	destroy_popup_warning_menu
	destroy_jam_play_select_menu
	if ScreenElementExists \{id = jam_difficulty_select_menu}
		DestroyScreenElement \{id = jam_difficulty_select_menu}
	endif
	create_jam_play_select_menu advanced_record = <advanced_record> example_song = <example_song>
endscript

script process_gem_times 
	<ms_per_beat> = (60000.0 / $jam_current_bpm)
	<offset_time> = (<ms_per_beat> * 2.0)
	ProcessGemTimes name = <editable_dest> name_fretbar = editable_fretbars offset_time = <offset_time>
endscript

script process_sound_times 
	<ms_per_beat> = (60000.0 / $jam_current_bpm)
	<offset_time> = (<ms_per_beat> * 2.0)
	ProcessSoundTimes offset_time = <offset_time>
endscript

script make_hand_anims 
	GetSongInfo
	if (<playback_track1> > -1)
		Source = ($jam_tracks [<playback_track1>].gem_array)
		FormatText \{checksumname = jamsession_dest_exp
			'jamsession_song_expert'}
		CopyFinalScriptArray sourcename = <Source> destname = <jamsession_dest_exp>
	endif
endscript

script make_hand_anims2 
	GetSongInfo
	if (<playback_track2> > -1)
		Source = ($jam_tracks [<playback_track2>].gem_array)
		FormatText \{checksumname = jamsession_dest_exp
			'jamsession_song_rhythm_expert'}
		CopyFinalScriptArray sourcename = <Source> destname = <jamsession_dest_exp>
	endif
endscript

script setup_jam_song \{difficulty = hard}
	get_difficulty_text_nl difficulty = <difficulty> no_rhythm
	<difficulty_text> = <difficulty_text_nl>
	<difficulty_real> = <difficulty>
	if (<difficulty> = easy_rhythm)
		<difficulty_real> = easy
	endif
	time_interval = (60000.0 / $jam_current_bpm)
	last_fretbar_time = ($editable_fretbars [(($editable_fretbars_size) - 1)])
	i = 1
	begin
	new_fretbar_time = (<last_fretbar_time> + (<time_interval> * <i>))
	CastToInteger \{new_fretbar_time}
	AddScriptArrayItem name = editable_fretbars Integer = <new_fretbar_time>
	<i> = (<i> + 1)
	repeat 12
	CopyFinalScriptArray \{sourcename = editable_fretbars
		destname = jamsession_fretbars}
	count = 0
	last_end_time = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	process_gem_times editable_dest = <gem_array>
	<count> = (<count> + 1)
	repeat 5
	process_sound_times
	get_difficulty_text_nl difficulty = <difficulty> no_rhythm
	<difficulty_text> = <difficulty_text_nl>
	<difficulty_real> = <difficulty>
	if (<difficulty> = easy_rhythm)
		<difficulty_real> = easy
	endif
	GetSongInfo
	jam_copy_in_game_playback_arrays
	make_hand_anims
	make_hand_anims2
	switch (<inst>)
		case 0
		Source = ($jam_tracks [<playback_track1>].gem_array)
		FormatText checksumname = editable_dest 'editable_song_%s' s = <difficulty_text>
		FormatText checksumname = jamsession_dest 'jamsession_song_%s' s = <difficulty_text>
		GenerateDiffScriptArray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = guitar
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		ProcessHammerOns name = <editable_dest> name_fretbar = editable_fretbars guitar
		CopyFinalScriptArray sourcename = <editable_dest> destname = <jamsession_dest>
		if GlobalExists \{name = guitar_gem_array
				type = array}
			DestroyScriptArray \{name = guitar_gem_array}
		endif
		SetPlayerInfo 1 jam_instrument = <playback_track1>
		change jam_playback_instrument = <playback_track1>
		set_jam_song_star_sequence {
			output_array = jamsession_expert_star
			editable_array = editable_expert_star
			gem_array = <Source>
		}
		case 2
		Source = ($jam_tracks [<playback_track2>].gem_array)
		FormatText checksumname = editable_dest 'editable_song_guitarcoop_%s' s = <difficulty_text>
		FormatText checksumname = jamsession_dest 'jamsession_song_rhythm_%s' s = <difficulty_text>
		GenerateDiffScriptArray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = Bass
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		ProcessHammerOns name = <editable_dest> name_fretbar = editable_fretbars
		CopyFinalScriptArray sourcename = <editable_dest> destname = <jamsession_dest>
		SetPlayerInfo \{1
			part = Bass}
		SetPlayerInfo 1 jam_instrument = <playback_track2>
		change jam_playback_instrument = <playback_track2>
		set_jam_song_star_sequence {
			output_array = jamsession_rhythm_expert_star
			editable_array = editable_rhythm_expert_star
			gem_array = <Source>
		}
		case 3
		Source = editable_song_drum_expert
		FormatText \{checksumname = editable_dest
			'editable_song_drum_%s'
			s = 'hard'}
		FormatText checksumname = jamsession_dest 'jamsession_song_drum_%s' s = <difficulty_text>
		GenerateDiffScriptArray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = drum
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		ProcessDrumVelocity name = <editable_dest>
		CopyFinalScriptArray sourcename = <editable_dest> destname = <jamsession_dest>
		SetPlayerInfo \{1
			part = drum}
		SetPlayerInfo \{1
			jam_instrument = 3}
		change \{jam_playback_instrument = 3}
		set_jam_song_star_sequence {
			output_array = jamsession_drum_expert_star
			editable_array = editable_drum_expert_star
			gem_array = <Source>
		}
		case 4
		GenerateDiffScriptArray {sourcename = ($jam_tracks [4].gem_array)
			destname = ($jam_tracks [4].gem_array)
			diff = hard
			type = guitar
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		jam_auto_generate_melody_gem_array end_time = <end_time>
		CopyFinalScriptArray \{sourcename = editable_song_expert
			destname = jamsession_song_hard}
		SetPlayerInfo \{1
			part = Vocals}
		vocals_distribute_mics
		SetPlayerInfo \{1
			jam_instrument = 4}
		change \{jam_playback_instrument = 4}
	endswitch
	jam_add_end_of_song_marker
	jamsession_unload \{song_prefix = 'editable'}
	song_name = jamsession
	<songlist> = ($jamsession_songlist_props)
	<song_struct> = (<songlist>.jamsession)
	return <...>
endscript

script setup_jam_song_QP 
	time_interval = (60000.0 / $jam_current_bpm)
	last_fretbar_time = ($editable_fretbars [(($editable_fretbars_size) - 1)])
	i = 1
	begin
	new_fretbar_time = (<last_fretbar_time> + (<time_interval> * <i>))
	CastToInteger \{new_fretbar_time}
	AddScriptArrayItem name = editable_fretbars Integer = <new_fretbar_time>
	<i> = (<i> + 1)
	repeat 12
	CopyFinalScriptArray \{sourcename = editable_fretbars
		destname = jamsession_fretbars}
	count = 0
	last_end_time = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	process_gem_times editable_dest = <gem_array>
	<count> = (<count> + 1)
	repeat 5
	process_sound_times
	jam_copy_in_game_playback_arrays
	GetSongInfo
	<i> = 1
	begin
	GetPlayerInfo <i> difficulty
	get_difficulty_text_nl difficulty = <difficulty> no_rhythm
	<difficulty_text> = <difficulty_text_nl>
	<difficulty_real> = <difficulty>
	if (<difficulty> = easy_rhythm)
		<difficulty_real> = easy
	endif
	GetPlayerInfo <i> part
	switch (<part>)
		case guitar
		inst = 0
		case Bass
		inst = 2
		case drum
		inst = 3
		case Vocals
		inst = 4
		default
		inst = -1
	endswitch
	switch (<inst>)
		case 0
		<blank_guitar> = 0
		if (<playback_track1> = -1)
			<playback_track1> = <inst>
			<blank_guitar> = 1
		endif
		Source = ($jam_tracks [<playback_track1>].gem_array)
		FormatText checksumname = editable_dest 'editable_song_%s' s = <difficulty_text>
		FormatText checksumname = jamsession_dest 'jamsession_song_%s' s = <difficulty_text>
		if (<blank_guitar> = 1)
			AddNoteTrackItem name = <Source> time = (<end_time> + 100) length = 0 pattern = 16
		endif
		GenerateDiffScriptArray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = guitar
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		ProcessHammerOns name = <editable_dest> name_fretbar = editable_fretbars guitar
		CopyFinalScriptArray sourcename = <editable_dest> destname = <jamsession_dest>
		if GlobalExists \{name = guitar_gem_array
				type = array}
			DestroyScriptArray \{name = guitar_gem_array}
		endif
		SetPlayerInfo <i> jam_instrument = <playback_track1>
		set_jam_song_star_sequence {
			output_array = jamsession_expert_star
			editable_array = editable_expert_star
			gem_array = <Source>
		}
		case 2
		<blank_bass> = 0
		if (<playback_track2> = -1)
			<playback_track2> = <inst>
			<blank_bass> = 1
		endif
		Source = ($jam_tracks [<playback_track2>].gem_array)
		FormatText checksumname = editable_dest 'editable_song_guitarcoop_%s' s = <difficulty_text>
		FormatText checksumname = jamsession_dest 'jamsession_song_rhythm_%s' s = <difficulty_text>
		if (<blank_bass> = 1)
			AddNoteTrackItem name = <Source> time = (<end_time> + 100) length = 0 pattern = 16
		endif
		GenerateDiffScriptArray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = Bass
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		ProcessHammerOns name = <editable_dest> name_fretbar = editable_fretbars
		CopyFinalScriptArray sourcename = <editable_dest> destname = <jamsession_dest>
		SetPlayerInfo <i> part = Bass
		SetPlayerInfo <i> jam_instrument = <playback_track2>
		set_jam_song_star_sequence {
			output_array = jamsession_rhythm_expert_star
			editable_array = editable_rhythm_expert_star
			gem_array = <Source>
		}
		case 3
		Source = editable_song_drum_expert
		FormatText checksumname = editable_dest 'editable_song_drum_%s' s = <difficulty_text>
		FormatText checksumname = jamsession_dest 'jamsession_song_drum_%s' s = <difficulty_text>
		GenerateDiffScriptArray {sourcename = <Source>
			destname = <editable_dest>
			diff = <difficulty_real>
			type = drum
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		ProcessDrumVelocity name = <editable_dest>
		CopyFinalScriptArray sourcename = <editable_dest> destname = <jamsession_dest>
		SetPlayerInfo <i> part = drum
		SetPlayerInfo <i> jam_instrument = 3
		set_jam_song_star_sequence {
			output_array = jamsession_drum_expert_star
			editable_array = editable_drum_expert_star
			gem_array = <Source>
		}
		case 4
		GenerateDiffScriptArray {sourcename = ($jam_tracks [4].gem_array)
			destname = ($jam_tracks [4].gem_array)
			diff = hard
			type = guitar
			fretbars = editable_fretbars
			timesig = editible_timesig
		}
		jam_auto_generate_melody_gem_array end_time = <end_time>
		CopyFinalScriptArray \{sourcename = editable_song_expert
			destname = jamsession_song_hard}
		SetPlayerInfo <i> part = Vocals
		vocals_distribute_mics
		SetPlayerInfo <i> jam_instrument = 4
		default
		printf 'error invalid inst %a' a = <inst> channel = jrdebug
	endswitch
	<i> = (<i> + 1)
	repeat <players>
	jam_add_end_of_song_marker
	jamsession_unload \{song_prefix = 'editable'}
	song_name = jamsession
	<songlist> = ($jamsession_songlist_props)
	<song_struct> = (<songlist>.jamsession)
	return <...>
endscript

script change_jamsession_songlist_props_struct \{title = qs("\LJam Session")
		artist = qs("Custom")
		year = 2008}
	temp0 = {
		(($jamsession_songlist_props).jamsession)
		title = <title>
		artist = <artist>
		year_num = <year>
	}
	temp1 = {
		jamsession = <temp0>
	}
	change jamsession_songlist_props = <temp1>
endscript

script start_jam_song \{difficulty = hard}
	Progression_CashMilestonesClear
	setup_jam_song difficulty = <difficulty> inst = <inst> end_time = <end_time>
	difficulty = <difficulty>
	change structurename = player1_status difficulty = <difficulty>
	change structurename = player2_status difficulty = <difficulty>
	change structurename = player3_status difficulty = <difficulty>
	change structurename = player4_status difficulty = <difficulty>
	change \{game_mode = p1_quickplay}
	KillCamAnim \{name = jam_view_cam}
	change \{jam_view_cam_created = 0}
	destroy_jam_song_select_menu
	change player1_device = ($primary_controller)
	change structurename = player1_status controller = ($primary_controller)
	create_loading_screen \{jam_mode = 1
		extra_wait = 30}
	change \{current_level = load_z_studio}
	GetSongInfo
	change_jamsession_songlist_props_struct title = $jam_selected_song artist = <artist>
	i = 1
	begin
	UseFourLaneHighway {player = <i> reset}
	i = (<i> + 1)
	repeat ($current_num_players)
	ResumeControllerChecking
	change \{sysnotify_paused_controllers = [
		]}
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd_Menu_Music}
	start_song song_name = <song_name> device_num = ($primary_controller) difficulty = <difficulty> difficulty2 = <difficulty2> difficulty3 = <difficulty3> difficulty4 = <difficulty4>
	destroy_loading_screen
	generic_event_choose \{state = uistate_gameplay}
endscript

script jam_copy_in_game_playback_arrays 
	FormatText \{checksumname = jamsession_dest_in_game
		'jamsession_song_in_game'}
	CopyFinalScriptArray sourcename = editable_song_expert destname = <jamsession_dest_in_game>
	FormatText \{checksumname = jamsession_dest_in_game
		'jamsession_song_rhythm_in_game'}
	CopyFinalScriptArray sourcename = editable_song_rhythm_expert destname = <jamsession_dest_in_game>
	FormatText \{checksumname = jamsession_dest_in_game
		'jamsession_song_guitarcoop_in_game'}
	CopyFinalScriptArray sourcename = editable_song_guitarcoop_expert destname = <jamsession_dest_in_game>
	FormatText \{checksumname = jamsession_dest_in_game
		'jamsession_song_drum_in_game'}
	CopyFinalScriptArray sourcename = editable_song_drum_expert destname = <jamsession_dest_in_game>
	FormatText \{checksumname = jamsession_dest_in_game
		'jamsession_song_rhythmcoop_in_game'}
	CopyFinalScriptArray sourcename = editable_song_rhythmcoop_expert destname = <jamsession_dest_in_game>
endscript
current_jam_camera_prop = none
target_jam_camera_prop = none
jam_camera_changing = 0
jam_view_cam_created = 0
jam_view_cam_morph_time = 0.6

script jam_camera_script \{start_camera = jam_look_at_mixer}
	change current_jam_camera_prop = <start_camera>
	CCam_DoMorph {
		($jam_camera_props.<start_camera>)
	}
	begin
	if NOT ($current_jam_camera_prop = $target_jam_camera_prop)
		change \{jam_camera_changing = 1}
		local_camera_prop = ($target_jam_camera_prop)
		CCam_DoMorph {
			($jam_camera_props.<local_camera_prop>)
			time = ($jam_view_cam_morph_time)
			motion = smooth
		}
		CCam_WaitMorph
		change current_jam_camera_prop = <local_camera_prop>
		change \{jam_camera_changing = 0}
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_camera_wait 
	Wait \{2
		gameframe}
	begin
	if ($jam_camera_changing = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_start_song_from_quickplay 
	RequireParams \{[
			filename
			actual_filename
		]
		all}
	unload_songqpak
	ClearJamSession
	jam_recording_create_editable_arrays
	if (<example_song> = 0)
		change memcard_jamsession_file_name = <filename>
		change memcard_jamsession_actual_file_name = <actual_filename>
		new_data = {event = menu_replace state = UIstate_jam_quickplay_event}
		ui_event_wait event = menu_replace data = {state = uistate_memcard type = load_jam event_params = <new_data>}
	else
		change jam_selected_song = <filename>
		LoadJam file_name = <filename>
		ui_event_wait \{event = menu_replace
			state = UIstate_jam_quickplay_event}
	endif
endscript

script jam_quickplay_do_next_song 
	if ($quickplay_song_list_current >= $num_quickplay_song_list)
		if ScreenElementExists \{id = jam_ratesong_dialog}
			DestroyScreenElement \{id = jam_ratesong_dialog}
		endif
		ui_memcard_autosave \{state = uistate_setlist}
		return
	endif
	if (($current_song) = jamsession)
		jam_quickplay_get_and_start_song
	else
		ui_event \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
	endif
endscript

script jam_quickplay_get_and_start_song 
	<jam_directory_index> = ($temp_jamsession_song_list [($quickplay_song_list_current)])
	<example_song> = 0
	if (<jam_directory_index> >= 1000)
		<jam_directory_index> = (<jam_directory_index> - 1000)
		<example_song> = 1
		<filename> = (($jam_song_assets) [<jam_directory_index>].filename)
		<actual_filename> = <filename>
	else
		<filename> = ($jam_curr_directory_listing [<jam_directory_index>].filename)
		<actual_filename> = ($jam_curr_directory_listing [<jam_directory_index>].actual_file_name)
	endif
	jam_start_song_from_quickplay filename = <filename> actual_filename = <actual_filename> example_song = <example_song>
endscript

script jam_quickplay_save_song_score 
	<jam_directory_index> = ($temp_jamsession_song_list [($quickplay_song_list_current)])
	<example_song> = 0
	if (<jam_directory_index> >= 1000)
		<jam_directory_index> = (<jam_directory_index> - 1000)
		<example_song> = 1
		<filename> = (($jam_song_assets) [<jam_directory_index>].filename)
	else
		<filename> = ($jam_curr_directory_listing [<jam_directory_index>].filename)
	endif
	GetPlayerInfo \{1
		difficulty}
	GetPlayerInfo \{1
		part}
	GetPlayerInfo \{1
		score}
	new_score = <score>
	get_difficulty_text_nl difficulty = <difficulty>
	get_formatted_songname_for_jam_mode song_prefix = <filename> difficulty_text_nl = <difficulty_text_nl> part = ($part_list_props.<part>.text_nl)
	score = 0
	GetGlobalTags <songname> params = score noassert = 1
	if (<new_score> > <score>)
		CastToInteger \{new_score}
		SetGlobalTags <songname> params = {score = <new_score>}
	endif
endscript

script ui_memcard_load_jam \{event = menu_replace
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	generic_event_choose state = uistate_memcard data = {type = load_jam event_params = {event = <event> data = <data>}}
endscript
jamsession_max_star_sequences = 6

script set_jam_song_star_sequence 
	AppendSuffixToChecksum Base = <gem_array> SuffixString = '_size'
	size = ($<appended_id>)
	index = 0
	output_index = 0
	target_time = 30000
	begin
	if (($<gem_array> [<index>]) > <target_time>)
		sub_index = <index>
		notes = 0
		if NOT (<sub_index> < 2)
			begin
			if (<sub_index> < 2)
				break
			endif
			if (($<gem_array> [<sub_index> - 2]) > <target_time> - 3000)
				sub_index = (<sub_index> - 2)
				notes = (<notes> + 1)
			else
				break
			endif
			repeat 10
			start = ($<gem_array> [<sub_index>])
			end = (($<gem_array> [<index> - 2]) - <start>)
			if (<end> > 0)
				printf channel = jam_mode qs("\LAdding STAR SEQUENCE start: %a end: %b") a = <start> b = <end>
				new_element = [0 0 0]
				SetArrayElement ArrayName = new_element index = 0 newvalue = <start>
				SetArrayElement ArrayName = new_element index = 1 newvalue = <end>
				SetArrayElement ArrayName = new_element index = 2 newvalue = <notes>
				SetArrayElement ArrayName = <editable_array> GlobalArray index = <output_index> newvalue = <new_element>
				output_index = (<output_index> + 1)
			endif
		endif
		target_time = (<target_time> + 30000)
	endif
	index = (<index> + 2)
	repeat (<size> / 2)
	AppendSuffixToChecksum Base = <editable_array> SuffixString = '_size'
	change globalname = <appended_id> newvalue = ($jamsession_max_star_sequences)
	CopyFinalScriptArray sourcename = <editable_array> destname = <output_array>
endscript
