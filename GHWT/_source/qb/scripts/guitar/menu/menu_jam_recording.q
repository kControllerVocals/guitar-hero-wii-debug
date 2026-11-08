jam_highway_recording_mode = 0
jam_highway_song_length = 180000
jam_control_bar_offset = (25.0, 98.0)
jam_control_selected = 0
jam_highway_playing = 0
jam_highway_recording = 0
jam_highway_step_recording = 0
jam_current_recording_player = 1
jam_advanced_record = 0

script jam_recording_check_disconnect 
	<training> = 0
	if ($game_mode = training)
		<training> = 1
	endif
	if NOT CD
		if ($allow_controller_for_all_instruments = 1)
			return
		endif
	endif
	if ui_event_exists_in_stack \{name = 'recording'}
		return
	endif
	GetControllerType controller = ($primary_controller)
	begin
	prev_controller_type = <controller_type>
	GetControllerType controller = ($primary_controller)
	GetActiveControllers
	<is_active_controller> = (<active_controllers> [($primary_controller)])
	if NOT (<is_active_controller> = 1)
		ui_event_wait state = UIstate_recording_disconnect data = {training = <training> is_popup}
		return
	endif
	if NOT ((<controller_type> = guitar) || (<controller_type> = drum))
		ui_event_wait state = UIstate_recording_disconnect data = {training = <training> is_popup}
		return
	endif
	if NOT (<controller_type> = <prev_controller_type>)
		ui_event_wait state = UIstate_recording_disconnect data = {training = <training> is_popup}
		return
	endif
	Wait \{5
		gameframes}
	repeat
endscript

script create_jam_recording_menu \{song = dangerzone
		editing = 0
		back_to_jam_band = 1}
	Unload_gempaks
	printf \{qs(0x3a6084c0)
		a = $memcard_jamsession_actual_file_name}
	if (<editing> = 0)
		change \{memcard_jamsession_actual_file_name = ''}
		printf \{qs(0x70c93713)}
	endif
	printf channel = jam_mode qs("\LAdvanced Recording editing: %s") s = <editing>
	change \{select_shift = 0}
	change \{debug_show_analog_options = 0}
	create_viewport_ui \{texture = `tex\zones\Z_Studio\RM_Studio_Monitor_GH_Mix.dds`
		texdict = `zones/z_studio/Z_Studio.tex`
		keep_current_level}
	spawnscriptnow id = jam_band_spawns menu_jam_screensaver_loading params = {window_id = <window_id>}
	change \{target_jam_camera_prop = jam_advanced_recording}
	jam_camera_wait
	change \{jam_advanced_record = 1}
	destroy_bg_viewport
	setup_bg_viewport
	if GotParam \{current_instrument}
		change jam_current_track = <current_instrument>
		SetPlayerInfo <player> jam_instrument = <current_instrument>
	endif
	GetPlayerInfo <player> controller
	if IsDrumController controller = <controller>
		change \{jam_current_track = 3}
		SetPlayerInfo <player> part = drum
		SetPlayerInfo <player> jam_instrument = ($jam_current_track)
	else
		SetPlayerInfo <player> part = guitar
	endif
	Menu_Music_Off
	change \{jam_control_selected = 0}
	change \{jam_undo_track = -1}
	change \{jam_copy_bound_low = 0}
	change \{jam_copy_bound_high = 0}
	change \{jam_loop_bound_low = -1}
	change \{jam_loop_bound_high = -1}
	CreateScreenElement \{parent = root_window
		id = jam_studio_element
		type = DescInterface
		desc = 'adv_record'}
	KillSpawnedScript \{name = menu_jam_screensaver_loading}
	destroy_viewport_ui
	spawnscriptnow \{jam_recording_check_disconnect}
	<song> = jamsession
	change \{jam_highway_recording_mode = 1}
	jam_setup_song editing = <editing> advanced_record = 1
	change \{jam_current_quantize = 4}
	change \{no_marker_snap = 0}
	change \{no_precise_snap = 0}
	jam_studio_element :SetProps snap_text = ($jam_quantize [($jam_current_quantize)].name_text)
	jam_studio_hide_tilt_meter
	<saved_song_value> = <song>
	if NOT (<editing> = 1)
		jam_recording_get_unique_name
		change jam_selected_song = <song>
		change \{jam_current_bpm = 120}
		song_prefix = 'editable'
		FormatText checksumname = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup = true
		suffix = '_size'
		AppendSuffixToChecksum Base = <fretbar_array> SuffixString = <suffix>
		<fretbar_size> = <appended_id>
		change globalname = <fretbar_size> newvalue = 0
		jam_highway_create_fretbars
	endif
	<song> = <saved_song_value>
	FormatText \{TextName = title_text
		qs("\L%s (%b bpm)")
		s = $jam_selected_song
		b = $jam_current_bpm}
	jam_studio_element :SetProps SongTitleInfo_text = <title_text>
	create_jam_control_bar back_to_jam_band = <back_to_jam_band>
	AssignAlias \{id = jam_control_container
		alias = current_menu}
	LaunchEvent \{type = focus
		target = current_menu}
	create_studio_now_bar
	spawnscriptnow \{create_jam_multiple_highways
		id = jam_recording_spawns
		params = {
			song = editable
		}}
	spawnscriptnow \{jam_update_count
		id = jam_recording_spawns}
	reset_song_time \{StartTime = 0}
	change \{jam_highway_play_time = 0}
	change \{jam_highway_playing = 0}
	CreateScreenElement \{type = ContainerElement
		id = jam_pause_container
		parent = jam_studio_element
		pos = (329.0, 90.0)}
	jam_ghmix_note_quick_update player = ($jam_current_recording_player)
	jam_recording_add_user_control_helpers
	if (<editing> = 1)
		FormatText \{TextName = title_text
			qs("\L%s (%b bpm)")
			s = $jam_selected_song
			b = $jam_current_bpm}
		KillSpawnedScript \{name = jam_highway_select_quantize}
		spawnscriptnow \{jam_highway_select_quantize
			id = jam_recording_spawns}
	else
		FormatText TextName = title_text qs("New Song (%b bpm)") b = $jam_current_bpm c = ($jam_tracks [$jam_current_track].name_text)
		spawnscriptnow \{id = jam_recording_spawns
			show_change_bpm}
		KillSpawnedScript \{name = jam_recording_metronome}
		spawnscriptnow \{jam_recording_metronome
			id = jam_recording_spawns
			params = {
				bpm = $jam_current_bpm
				time = 0
				sound_only
			}}
	endif
	ReloadSfx \{mode = jammode}
	spawnscriptnow \{jam_recording_create_metaview
		id = jam_recording_spawns}
	BroadcastEvent \{type = ghmix_load_complete}
endscript

script jam_recording_update_note 
	<player> = ($jam_current_recording_player)
	GetPlayerInfo <player> controller
	<last_instrument> = -1
	begin
	GetPlayerInfo <player> jam_instrument
	if NOT (<last_instrument> = <jam_instrument>)
		GetPlayerInfo <player> jam_instrument
		switch (<jam_instrument>)
			case 0
			<note_func> = jam_input_rhythm_get_current_note
			case 1
			<note_func> = jam_input_lead_get_current_note
			case 2
			<note_func> = jam_input_bass_get_current_note
			case 3
			return
			case 4
			<note_func> = jam_input_melody_get_current_note
		endswitch
		<jam_instrument> = <last_instrument>
	endif
	GetHeldPattern controller = <controller> player = <player> nobrokenstring
	<note_func> player = <player> hold_pattern = <hold_pattern>
	if ScreenElementExists \{id = studio_pick_text}
		if NOT (<jam_instrument> = 3)
			studio_pick_text :SE_SetProps text = <single_note_text>
		else
			studio_pick_text :SE_SetProps \{text = qs("")}
		endif
	else
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script show_change_bpm 
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	KillSpawnedScript \{name = jam_highway_select_quantize}
	GetEnterButtonAssignment
	choose_button = <assignment>
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SET BPM")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("CHANGE BPM")
		button = strumbar
		z = 100}
	if ScreenElementExists \{id = jam_studio_element}
		FormatText \{TextName = curr_bpm_text
			qs("%s")
			s = $jam_current_bpm}
		jam_studio_element :SetProps bpm_number_text = <curr_bpm_text>
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = bpm_box}
		<resolved_id> :SetProps pos = (472.0, 800.0) time = 0.0
		<resolved_id> :SE_WaitProps
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = bpm_box}
		<resolved_id> :SetProps pos = (472.0, 47.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	GetPlayerInfo ($jam_current_recording_player) controller
	curr_bpm = $jam_current_bpm
	mid_up_strum = 0
	mid_down_strum = 0
	begin
	if NOT ui_event_exists_in_stack \{name = 'recording_disconnect'}
		if has_lefty_adj_control_press dir = up controller = <controller> player = $jam_current_recording_player
			if (<mid_up_strum> = 0)
				<curr_bpm> = (<curr_bpm> + 1)
				if (<curr_bpm> > 160)
					<curr_bpm> = 160
				endif
				generic_menu_up_or_down_sound \{up}
				KillSpawnedScript \{name = scale_bpm_arrows}
				spawnscriptnow \{scale_bpm_arrows
					id = jam_recording_spawns
					params = {
						up
					}}
				KillSpawnedScript \{name = jam_recording_metronome}
				reset_song_time \{StartTime = 0}
				spawnscriptnow jam_recording_metronome id = jam_recording_spawns params = {bpm = <curr_bpm> time = 0 sound_only}
			endif
			<mid_up_strum> = (<mid_up_strum> + 1)
			if (<mid_up_strum> > 10)
				<mid_up_strum> = 0
			endif
		else
			<mid_up_strum> = 0
		endif
		if has_lefty_adj_control_press dir = down controller = <controller> player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				<curr_bpm> = (<curr_bpm> - 1)
				if (<curr_bpm> < 80)
					<curr_bpm> = 80
				endif
				generic_menu_up_or_down_sound \{down}
				KillSpawnedScript \{name = scale_bpm_arrows}
				spawnscriptnow \{scale_bpm_arrows
					id = jam_recording_spawns
					params = {
						down
					}}
				KillSpawnedScript \{name = jam_recording_metronome}
				reset_song_time \{StartTime = 0}
				spawnscriptnow jam_recording_metronome id = jam_recording_spawns params = {bpm = <curr_bpm> time = 0 sound_only}
			endif
			<mid_down_strum> = (<mid_down_strum> + 1)
			if (<mid_down_strum> > 10)
				<mid_down_strum> = 0
			endif
		else
			<mid_down_strum> = 0
		endif
		FormatText TextName = curr_bpm_text qs("%s") s = <curr_bpm>
		jam_studio_element :SetProps bpm_number_text = <curr_bpm_text>
		if ControllerMake <choose_button> <controller>
			break
		endif
		if ControllerMake start <controller>
			break
		endif
	endif
	Wait \{1
		gameframe}
	repeat
	KillSpawnedScript \{name = jam_recording_metronome}
	ui_menu_select_sfx
	change jam_current_bpm = <curr_bpm>
	guitar_jam_settings_bpm_back \{no_sound
		player = $jam_current_recording_player}
	BroadcastEvent \{type = ghmix_bpm_selected}
	SetTrackInfo track = rhythm bpm = ($jam_current_bpm)
	SetTrackInfo track = lead bpm = ($jam_current_bpm)
	SetTrackInfo track = Bass bpm = ($jam_current_bpm)
	SetTrackInfo track = drum bpm = ($jam_current_bpm)
	if jam_studio_element :Desc_ResolveAlias \{name = bpm_box}
		<resolved_id> :SetProps pos = (472.0, 800.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	FormatText \{TextName = title_text
		qs("\L%s (%b bpm)")
		s = $jam_selected_song
		b = $jam_current_bpm}
	jam_studio_element :SetProps SongTitleInfo_text = <title_text>
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	KillSpawnedScript \{name = jam_highway_select_quantize}
	spawnscriptnow \{jam_highway_select_quantize
		id = jam_recording_spawns}
	LaunchEvent \{type = focus
		target = jam_control_container}
endscript

script scale_bpm_arrows 
	if GotParam \{up}
		jam_studio_element :SetProps \{bpm_arrow_up_scale = 2.0}
		jam_studio_element :SetProps \{bpm_arrow_up_scale = 1.5
			time = 0.15}
		jam_studio_element :SE_WaitProps
	endif
	if GotParam \{down}
		jam_studio_element :SetProps \{bpm_arrow_down_scale = 2.0}
		jam_studio_element :SetProps \{bpm_arrow_down_scale = 1.5
			time = 0.15}
		jam_studio_element :SE_WaitProps
	endif
endscript

script jam_recording_create_editable_arrays 
	song_prefix = 'editable'
	gemarraysize = ($gemarraysize)
	starsize = ($starsize)
	fretbarsize = ($fretbarsize)
	markerssize = ($markerssize)
	arraylistsize = ($arraylistsize)
	jamsession_array_action <...> func = CreateScriptArray
	FormatText checksumname = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	CreateScriptArray name = <arraylist> size = <arraylistsize> heap = heap_song type = checksum
	jamsession_array_action <...> func = jamsession_AddScriptArrayItem
endscript

script jam_recording_create_jamsession_arrays 
	song_prefix = 'jamsession'
	gemarraysize = ($gemarraysize)
	starsize = ($starsize)
	fretbarsize = ($fretbarsize)
	markerssize = ($markerssize)
	arraylistsize = ($arraylistsize)
	FormatText checksumname = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	CreateScriptArray name = <arraylist2> size = <arraylistsize> heap = heap_song type = checksum
	jamsession_array_action <...> func = jamsession_AddScriptArrayItem arraylist = <arraylist2>
endscript

script jam_highway_create_fretbars 
	song_prefix = 'editable'
	FormatText checksumname = fretbar_array '%s_fretbars' s = <song_prefix> AddToStringLookup = true
	song_length = $jam_highway_song_length
	time_interval = (60000.0 / $jam_current_bpm)
	song_time = 0.0
	song_time_int = 0
	begin
	AddScriptArrayItem name = <fretbar_array> Integer = <song_time_int>
	<song_time> = (<song_time> + <time_interval>)
	<new_time_rounding_check> = (<song_time> + 0.5)
	CastToInteger \{new_time_rounding_check}
	<song_time_int> = <song_time>
	CastToInteger \{song_time_int}
	if NOT (<new_time_rounding_check> = <song_time_int>)
		<song_time_int> = (<song_time_int> + 1)
	endif
	if (<song_time> > <song_length>)
		break
	endif
	repeat
endscript

script jam_recording_setup_timesig 
	song_prefix = 'editable'
	FormatText checksumname = timesig_array '%s_timesig' s = <song_prefix> AddToStringLookup = true
	timesig_to_add = [0 , 4 , 4]
	AddScriptArrayItem name = <timesig_array> array = <timesig_to_add>
endscript

script jam_control_bar_down 
	jam_studio_element :GetTags
	if GotParam \{block_updown}
		if (<block_updown> = 1)
			printf \{'blocking a bar down'
				channel = ghmix_tut}
			return
		endif
	endif
	generic_menu_up_or_down_sound \{down}
	GetArraySize \{$jam_controls}
	num_controls = (<array_size> - 1)
	change jam_control_selected = ($jam_control_selected + 1)
	if ($jam_control_selected > <num_controls>)
		change \{jam_control_selected = 0}
	endif
	if ($jam_control_selected = 10)
		jam_show_paste_highlight
	else
		if ScreenElementExists \{id = jam_paste_highlight}
			DestroyScreenElement \{id = jam_paste_highlight}
		endif
	endif
	jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
	if ($jam_control_selected = 2)
		if ($jam_highway_playing = 0)
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
		else
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].alt_name_text)
		endif
	endif
	jam_studio_element :SE_SetProps control_help_text = ($jam_controls [$jam_control_selected].help_text)
	if ScreenElementExists \{id = control_bg}
		spawnscriptnow \{jam_studio_animate_mouse}
		LegacyDoScreenElementMorph id = control_bg time = 0 pos = ($jam_control_bar_offset + ($jam_control_selected * $jam_control_offset)) rot_angle = <rotation>
	endif
endscript

script jam_control_bar_up 
	jam_studio_element :GetTags
	if GotParam \{block_updown}
		if (<block_updown> = 1)
			printf \{'blocking a bar up'
				channel = ghmix_tut}
			return
		endif
	endif
	generic_menu_up_or_down_sound \{up}
	GetArraySize \{$jam_controls}
	num_controls = (<array_size> - 1)
	change jam_control_selected = ($jam_control_selected - 1)
	if ($jam_control_selected < 0)
		change jam_control_selected = <num_controls>
	endif
	if ($jam_control_selected = 10)
		jam_show_paste_highlight
	else
		if ScreenElementExists \{id = jam_paste_highlight}
			DestroyScreenElement \{id = jam_paste_highlight}
		endif
	endif
	jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
	if ($jam_control_selected = 2)
		if ($jam_highway_playing = 0)
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
		else
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].alt_name_text)
		endif
	endif
	jam_studio_element :SE_SetProps control_help_text = ($jam_controls [$jam_control_selected].help_text)
	if ScreenElementExists \{id = control_bg}
		spawnscriptnow \{jam_studio_animate_mouse}
		LegacyDoScreenElementMorph id = control_bg time = 0 pos = ($jam_control_bar_offset + $jam_control_selected * $jam_control_offset) rot_angle = <rotation>
	endif
endscript

script jam_control_goto 
	GetArraySize \{$jam_controls}
	change jam_control_selected = <option_index>
	if ($jam_control_selected = 10)
		jam_show_paste_highlight
	else
		if ScreenElementExists \{id = jam_paste_highlight}
			DestroyScreenElement \{id = jam_paste_highlight}
		endif
	endif
	jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
	if ($jam_control_selected = 2)
		if ($jam_highway_playing = 0)
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].name_text)
		else
			jam_studio_element :SE_SetProps control_name_text = ($jam_controls [$jam_control_selected].alt_name_text)
		endif
	endif
	jam_studio_element :SE_SetProps control_help_text = ($jam_controls [$jam_control_selected].help_text)
	if ScreenElementExists \{id = control_bg}
		spawnscriptnow \{jam_studio_animate_mouse}
		LegacyDoScreenElementMorph id = control_bg time = 0 pos = ($jam_control_bar_offset + $jam_control_selected * $jam_control_offset) rot_angle = <rotation>
	endif
endscript

script jam_control_bar_choose 
	KillSpawnedScript \{name = jam_highway_play}
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	SetScreenElementProps \{id = control_playstop
		texture = icon_play}
	if ScreenElementExists \{id = jam_delete_highlight}
		DestroyScreenElement \{id = jam_delete_highlight}
	endif
	FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = ($jam_current_recording_player)
	spawnscriptnow \{jam_studio_animate_mouse}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :GetTags
		if GotParam \{controls_enabled}
			if ((<controls_enabled> [$jam_control_selected]) = 0)
				printf 'control denied %a' a = ($jam_control_selected) channel = ghmix_tut
				return
			endif
		endif
	endif
	change \{no_precise_snap = 0}
	change \{no_marker_snap = 0}
	switch $jam_control_selected
		case 0
		printf \{channel = jam_mode
			qs("\LCONTROL: End")}
		generic_menu_up_or_down_sound \{up}
		if ($jam_highway_recording_mode = 1)
			jam_highway_move_last_note
		else
			jam_highway_move_end
		endif
		change \{jam_highway_playing = 0}
		case 1
		printf \{channel = jam_mode
			qs("\LCONTROL: Skip Forward")}
		generic_menu_up_or_down_sound \{up}
		spawnscriptnow jam_highway_user_skip id = <jam_player_spawns> params = {forwards = 1}
		change \{jam_highway_playing = 0}
		case 2
		printf \{channel = jam_mode
			qs("\LCONTROL: Play")}
		ui_menu_select_sfx
		change \{jam_highway_playing = 1}
		if ($jam_highway_recording_mode = 0)
			begin_jam_song
		endif
		GetPlayerInfo ($jam_current_recording_player) controller
		ResolveScreenElementId \{id = {
				jam_studio_element
				child = {
					adv_record
					child = nowbar_bg
				}
			}}
		RunScriptOnScreenElement id = <resolved_id> jam_lightup_held_note_sprites params = {controller = <controller> player = ($jam_current_recording_player)}
		spawnscriptnow \{jam_studio_tilt_meter
			id = jam_recording_spawns}
		ResolveScreenElementId \{id = {
				jam_studio_element
				child = {
					adv_record
					child = control_name
				}
			}}
		SetScreenElementProps id = <resolved_id> text = ($jam_controls [$jam_control_selected].alt_name_text)
		spawnscriptnow \{jam_highway_play
			id = jam_recording_spawns}
		case 3
		printf \{channel = jam_mode
			qs("\LCONTROL: Record")}
		ui_menu_select_sfx
		change \{no_marker_snap = 1}
		GetPlayerInfo ($jam_current_recording_player) jam_instrument
		if (<jam_instrument> = 4)
			change \{jam_melody_last_pattern = 1}
		endif
		GetPlayerInfo ($jam_current_recording_player) controller
		ResolveScreenElementId \{id = {
				jam_studio_element
				child = {
					adv_record
					child = nowbar_bg
				}
			}}
		RunScriptOnScreenElement id = <resolved_id> jam_lightup_held_note_sprites params = {controller = <controller> player = ($jam_current_recording_player)}
		spawnscriptnow \{jam_studio_tilt_meter
			id = jam_recording_spawns}
		spawnscriptnow \{jam_highway_record
			id = jam_recording_spawns}
		change \{jam_highway_playing = 0}
		BroadcastEvent \{type = ghmix_start_rec}
		case 4
		printf \{channel = jam_mode
			qs("\LCONTROL: Step Record")}
		ui_menu_select_sfx
		change \{no_precise_snap = 1}
		change \{no_marker_snap = 1}
		GetPlayerInfo ($jam_current_recording_player) jam_instrument
		if (<jam_instrument> = 4)
			change \{jam_melody_last_pattern = 1}
		endif
		GetPlayerInfo ($jam_current_recording_player) controller
		ResolveScreenElementId \{id = {
				jam_studio_element
				child = {
					adv_record
					child = nowbar_bg
				}
			}}
		RunScriptOnScreenElement id = <resolved_id> jam_lightup_held_note_sprites params = {controller = <controller> player = ($jam_current_recording_player)}
		spawnscriptnow \{jam_studio_tilt_meter
			id = jam_recording_spawns}
		spawnscriptnow \{jam_highway_step_record
			id = jam_recording_spawns}
		change \{jam_highway_playing = 0}
		BroadcastEvent \{type = ghmix_start_step}
		case 5
		printf \{channel = jam_mode
			qs("\LCONTROL: Skip Backwards")}
		generic_menu_up_or_down_sound \{up}
		spawnscriptnow jam_highway_user_skip id = <jam_player_spawns> params = {forwards = 0}
		change \{jam_highway_playing = 0}
		case 6
		printf \{channel = jam_mode
			qs("\LCONTROL: Beginning")}
		generic_menu_up_or_down_sound \{up}
		jam_highway_move_beginning
		change \{jam_highway_playing = 0}
		case 7
		BroadcastEvent \{type = ghmix_start_loop}
		printf \{channel = jam_mode
			qs("\LCONTROL: Loop")}
		ui_menu_select_sfx
		jam_highway_loop
		change \{jam_highway_playing = 0}
		case 8
		BroadcastEvent \{type = ghmix_delete_start}
		printf \{channel = jam_mode
			qs("\LCONTROL: Delete Range")}
		ui_menu_select_sfx
		jam_highway_delete_section
		change \{jam_highway_playing = 0}
		case 9
		BroadcastEvent \{type = ghmix_start_copy}
		printf \{channel = jam_mode
			qs("\LCONTROL: Copy")}
		ui_menu_select_sfx
		jam_highway_copy
		change \{jam_highway_playing = 0}
		case 10
		BroadcastEvent \{type = ghmix_paste_start}
		printf \{channel = jam_mode
			qs("\LCONTROL: Paste")}
		ui_menu_select_sfx
		jam_highway_paste_control
		change \{jam_highway_playing = 0}
		case 11
		change \{no_marker_snap = 1}
		BroadcastEvent \{type = ghmix_start_nudge}
		printf \{channel = jam_mode
			qs("\LCONTROL: Note Nudge")}
		ui_menu_select_sfx
		spawnscriptnow jam_highway_note_nudge id = <jam_player_spawns>
		change \{jam_highway_playing = 0}
		case 12
		printf \{channel = jam_mode
			qs("\LCONTROL: Add Marker")}
		ui_menu_select_sfx
		LaunchEvent \{type = unfocus
			target = jam_control_container}
		GetPlayerInfo ($jam_current_recording_player) controller
		create_menu_jam_marker controller = <controller>
		change \{jam_highway_playing = 0}
		case 13
		printf \{channel = jam_mode
			qs("\LCONTROL: Switch Instrument")}
		ui_menu_select_sfx
		jam_recording_switch_instrument
		jam_clear_undo_clipboard
		change \{jam_undo_track = -1}
		jam_ghmix_note_quick_update player = ($jam_current_recording_player)
		change \{jam_highway_playing = 0}
	endswitch
endscript
jam_loop_bound_low = -1
jam_loop_bound_high = -1

script jam_highway_loop 
	printf \{channel = jam_mode
		qs("\LJAM_HIGHWAY_LOOP")}
	if ($jam_highway_recording_mode = 0)
		return
	endif
	tool_controls = []
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = Loop}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	orig_start_time = $jam_highway_play_time
	low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	orig_low_pos = <low_pos>
	loop_bound_low = 0
	loop_bound_high = 0
	mid_up_strum = 0
	mid_down_strum = 0
	<clear_button> = triangle
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	count = 0
	GetPlayerInfo ($jam_current_recording_player) controller
	loop_controls = [set_loop clear_loop select_area cancel]
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	if ArrayContains array = <loop_controls> contains = select_area
		if has_lefty_adj_control_press dir = up controller = <controller> player = $jam_current_recording_player
			if (<mid_up_strum> = 0)
				generic_menu_up_or_down_sound \{up}
				jam_highway_skip_forwards
			endif
			<mid_up_strum> = (<mid_up_strum> + 1)
			if (<mid_up_strum> > $jam_select_area_wait)
				<mid_up_strum> = 0
			endif
		else
			<mid_up_strum> = 0
		endif
		if has_lefty_adj_control_press dir = down controller = <controller> player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				generic_menu_up_or_down_sound \{down}
				jam_highway_skip_backwards
			endif
			<mid_down_strum> = (<mid_down_strum> + 1)
			if (<mid_down_strum> > $jam_select_area_wait)
				<mid_down_strum> = 0
			endif
		else
			<mid_down_strum> = 0
		endif
	endif
	if ArrayContains array = <loop_controls> contains = cancel
		if ControllerMake <break_button> <controller>
			GhMix_Pad_Back_Sound
			<broke> = 1
			break
		endif
	endif
	high_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	if ((<high_pos> [0] - <low_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> - (3000.0, 0.0))
	elseif ((<low_pos> [0] - <high_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> + (3000.0, 0.0))
	else
		<low_pos> = <orig_low_pos>
	endif
	if ScreenElementExists \{id = jam_loop_highlight}
		DestroyScreenElement \{id = jam_loop_highlight}
	endif
	if ($jam_highway_play_time < <orig_start_time>)
		highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
	else
		highlight_pos = <low_pos>
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		id = jam_loop_highlight
		texture = white
		just = [left top]
		rgba = [255 0 0 50]
		pos = (<highlight_pos> + (0.0, 55.0))
		dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
		z_priority = 10
	}
	if ArrayContains array = <loop_controls> contains = set_loop
		if ControllerMake start <controller>
			ui_menu_select_sfx
			if ($jam_highway_play_time < <orig_start_time>)
				<loop_bound_low> = $jam_highway_play_time
				<loop_bound_high> = <orig_start_time>
			elseif ($jam_highway_play_time > <orig_start_time>)
				<loop_bound_low> = <orig_start_time>
				<loop_bound_high> = $jam_highway_play_time
			elseif ($jam_highway_play_time = <orig_start_time>)
				<loop_bound_low> = (<orig_start_time>)
				<loop_bound_high> = (($jam_highway_play_time))
			endif
			BroadcastEvent \{type = ghmix_loop_set}
			break
		endif
	endif
	if ArrayContains array = <loop_controls> contains = clear_loop
		if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
			if ControllerMake <clear_button> <controller>
				<loop_bound_low> = -1
				<loop_bound_high> = -1
				break
			endif
		endif
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		break
	endif
	Wait \{1
		gameframe}
	repeat
	BroadcastEvent \{type = ghmix_stop_loop}
	ui_menu_select_sfx
	if ((<loop_bound_low> != <loop_bound_high>) || (<loop_bound_low> = -1 && <loop_bound_high> = -1))
		quantize_to = 1
		ms_per_beat = (60000.0 / $jam_current_bpm)
		ms_per_quarter = (<ms_per_beat> / <quantize_to>)
		if NOT (<loop_bound_low> = -1 && <loop_bound_high> = -1)
			if ((<loop_bound_high> - <loop_bound_low>) >= <ms_per_quarter>)
				change jam_loop_bound_low = <loop_bound_low>
				change jam_loop_bound_high = <loop_bound_high>
			else
				spawnscriptnow \{show_warning_message
					id = jam_recording_spawns
					params = {
						warning_text = qs("Loop error: Loop must be at least a quarter note in length.")
					}}
			endif
		else
			change jam_loop_bound_low = <loop_bound_low>
			change jam_loop_bound_high = <loop_bound_high>
		endif
	else
		if NOT GotParam \{broke}
			spawnscriptnow \{show_warning_message
				id = jam_recording_spawns
				params = {
					warning_text = qs("Loop error: Start time is the same as end time.")
				}}
		endif
	endif
	printf channel = jam_mode qs("\LLoop bound low %a, loop bound high %b") a = <loop_bound_low> b = <loop_bound_high>
	if ScreenElementExists \{id = jam_loop_highlight}
		DestroyScreenElement \{id = jam_loop_highlight}
	endif
	LaunchEvent \{type = focus
		target = jam_control_container}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
endscript

script jam_highway_add_marker 
	GhMix_Pad_Choose_Sound
	destroy_menu_jam_marker
	LaunchEvent \{type = focus
		target = jam_control_container}
	quantize_to = 1
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	intervals = ($jam_highway_play_time / <quantize>)
	CastToInteger \{intervals}
	new_time = (<intervals> * <quantize>)
	time_before = ($jam_highway_play_time - <new_time>)
	time_after = ((<new_time> + <quantize>) - $jam_highway_play_time)
	if (<time_after> <= <time_before>)
		<new_time> = (<new_time> + <quantize>)
	endif
	CastToInteger \{new_time}
	new_pos = ($jam_highway_play_line_pos - ((<new_time> / 1000.0) * $jam_highway_pixels_per_second))
	SetScreenElementProps id = jam_highway_container pos = (<new_pos>)
	if (<new_time> < $jam_highway_play_time)
		<new_low_bound> = ($jam_highway_low_bound - ($jam_highway_play_time - <new_time>))
		<new_high_bound> = ($jam_highway_high_bound - ($jam_highway_play_time - <new_time>))
	else
		<new_low_bound> = ($jam_highway_low_bound + (<new_time> - $jam_highway_play_time))
		<new_high_bound> = ($jam_highway_high_bound + (<new_time> - $jam_highway_play_time))
	endif
	CastToInteger \{new_low_bound}
	CastToInteger \{new_high_bound}
	change jam_highway_low_bound = <new_low_bound>
	change jam_highway_high_bound = <new_high_bound>
	jam_highway_reinit
	change jam_highway_play_time = <new_time>
	markers_array = editable_jam_markers
	suffix = '_size'
	AppendSuffixToChecksum Base = <markers_array> SuffixString = <suffix>
	<markers_size> = <appended_id>
	get_marker_count markers_array = <markers_array> markers_size = <markers_size> new_marker_time = ($jam_highway_play_time) new_marker_name = ($jam_markers [$jam_current_marker].name_text)
	AddMarkerItem name = <markers_array> time = ($jam_highway_play_time) marker_name = ($jam_markers [$jam_current_marker].name_text) marker_count = <marker_count> bpm = ($jam_current_marker_bpm) LightShow = ($jam_current_lightshow)
	jam_recording_update_metaview
	change \{no_marker_snap = 0}
endscript

script get_marker_count 
	GetArraySize ($<markers_array>)
	printf channel = jam_mode qs("\LMarkers size %s") s = <array_size>
	count = 0
	marker_count = 0
	begin
	if (($<markers_size>) <= 0)
		break
	endif
	curr_marker_name = ($<markers_array> [<count>].marker_name)
	curr_marker_time = ($<markers_array> [<count>].time)
	curr_marker_count = ($<markers_array> [<count>].marker_count)
	if (<curr_marker_name> = <new_marker_name>)
		if (<curr_marker_time> = <new_marker_time>)
			<marker_count> = <curr_marker_count>
			break
		else
			<marker_count> = (<marker_count> + 1)
		endif
	endif
	<count> = (<count> + 1)
	if (<count> >= ($<markers_size>))
		break
	endif
	repeat
	return marker_count = <marker_count>
endscript

script debug_print_markers 
	markers_array = editable_jam_markers
	suffix = '_size'
	AppendSuffixToChecksum Base = <markers_array> SuffixString = <suffix>
	<markers_size> = <appended_id>
	GetArraySize ($<markers_array>)
	printf channel = jam_mode qs("\LMarkers size %s") s = <array_size>
	count = 0
	begin
	printf qs("\LMarker %s") s = <count>
	printstruct ($<markers_array> [<count>])
	<count> = (<count> + 1)
	repeat <array_size>
endscript

script jam_highway_move_beginning 
	SetScreenElementProps \{id = jam_highway_container
		pos = $jam_highway_play_line_pos}
	initialize_jam_highway
	SetSeekPosition_Song \{position = 0}
	change \{jam_highway_play_time = 0}
	if ($jam_highway_recording_mode = 0)
		begin_song \{Pause = 1}
	endif
endscript

script jam_highway_move_end 
	end_pos = ($jam_highway_play_line_pos - ((($jam_highway_end_time) / 1000.0) * $jam_highway_pixels_per_second))
	SetScreenElementProps id = jam_highway_container pos = <end_pos>
	SetSeekPosition_Song position = ($jam_highway_end_time)
	change jam_highway_play_time = ($jam_highway_end_time)
	<new_low_bound> = ($jam_highway_start_low_bound + $jam_highway_end_time)
	<new_high_bound> = ($jam_highway_start_high_bound + $jam_highway_end_time)
	CastToInteger \{new_low_bound}
	CastToInteger \{new_high_bound}
	change jam_highway_low_bound = <new_low_bound>
	change jam_highway_high_bound = <new_high_bound>
	jam_highway_reinit
endscript

script jam_highway_move_last_note 
	gem_array = ($jam_tracks [$jam_current_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	if (<notetrack_size> > 0)
		end_time = ($<gem_array> [(<notetrack_size> - 2)])
		printf channel = jam_mode qs("\Lend time %s") s = <end_time>
	else
		return
	endif
	end_pos = ($jam_highway_play_line_pos - ((<end_time> / 1000.0) * $jam_highway_pixels_per_second))
	SetScreenElementProps id = jam_highway_container pos = <end_pos>
	change jam_highway_play_time = <end_time>
	<new_low_bound> = (<end_time> + $jam_highway_start_low_bound)
	<new_high_bound> = (<end_time> + $jam_highway_start_high_bound)
	CastToInteger \{new_low_bound}
	CastToInteger \{new_high_bound}
	change jam_highway_low_bound = <new_low_bound>
	change jam_highway_high_bound = <new_high_bound>
	jam_highway_reinit
endscript

script jam_highway_play 
	GetPlayerInfo ($jam_current_recording_player) jam_instrument
	tool_controls = []
	if (<jam_instrument> = 3)
		Wait \{20
			gameframes}
	endif
	change \{playing_song = 1}
	if ($jam_highway_recording_mode = 1)
		spawnscriptnow \{guitar_jam_playback_recording
			id = jam_recording_spawns
			params = {
				jam_instrument = 0
				start_time = $jam_highway_play_time
			}}
		spawnscriptnow \{guitar_jam_playback_recording
			id = jam_recording_spawns
			params = {
				jam_instrument = 1
				start_time = $jam_highway_play_time
			}}
		spawnscriptnow \{guitar_jam_playback_recording
			id = jam_recording_spawns
			params = {
				jam_instrument = 2
				start_time = $jam_highway_play_time
			}}
		spawnscriptnow \{guitar_jam_playback_recording
			id = jam_recording_spawns
			params = {
				jam_instrument = 4
				start_time = $jam_highway_play_time
			}}
		spawnscriptnow \{guitar_jam_drum_playback
			id = jam_recording_spawns
			params = {
				start_time = $jam_highway_play_time
			}}
	endif
	if GotParam \{jam_mode}
		begin_pos = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
		SetScreenElementProps id = jam_band_highway_playline pos = <begin_pos>
		pixels_per_frame = ($jam_band_pixels_per_second / 60)
		GetScreenElementPosition \{id = jam_band_highway_playline}
		end_pos = ($jam_band_playline_pos + ((($jam_band_song_length) / 1000.0) * $jam_band_pixels_per_second))
		begin
		new_pos = ($jam_band_playline_pos + ((($jam_highway_play_time) / 1000.0) * $jam_band_pixels_per_second))
		if NOT (<new_pos> [0] > <end_pos> [0])
			SetScreenElementProps id = jam_band_highway_playline pos = <new_pos>
			change jam_highway_play_time = ($jam_highway_play_time + ((1.0 / 60.0) * 1000.0))
		else
			break
		endif
		Wait \{1
			gameframe}
		repeat
		change \{jam_highway_playing = 0}
	else
		LaunchEvent \{type = unfocus
			target = jam_control_container}
		if StructureContains Structure = ($jam_tracks [$jam_current_track]) input_func
			GetPlayerInfo ($jam_current_recording_player) controller
			FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
			spawnscriptnow ($jam_tracks [$jam_current_track].input_func) id = <input_spawn> params = {show_hud = 0 controller = <controller> select_player = ($jam_current_recording_player) hammer_on = <hammer_on>}
			if (($jam_current_track) = 3)
				spawnscriptnow \{id = jam_recording_spawns
					jam_advanced_show_percussion_box}
			else
				if NOT (($jam_current_track) = 0)
					spawnscriptnow \{id = jam_recording_spawns
						jam_advanced_show_arpeggiator_box}
				endif
			endif
		endif
		clean_up_user_control_helpers
		jam_recording_add_user_control_helpers \{state = playing}
		can_loop = 0
		if ($jam_highway_play_time <= ($jam_loop_bound_high + 2))
			<can_loop> = 1
		endif
		pixels_per_frame = ($jam_highway_pixels_per_second / 60)
		GetScreenElementPosition \{id = jam_highway_container}
		count = 0
		begin
		if ($game_mode = training)
			jam_studio_element :GetTags
		endif
		GetSongTimeMs
		change jam_highway_play_time = <time>
		if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
			if (<can_loop> = 1)
				if ($jam_highway_play_time > ($jam_loop_bound_high - ((1000.0 / 60.0) * 2)))
					change \{jam_highway_play_time = $jam_loop_bound_low}
					KillSpawnedScript \{name = guitar_jam_playback_recording}
					KillSpawnedScript \{name = guitar_jam_drum_playback}
					spawnscriptnow \{guitar_jam_playback_recording
						id = jam_recording_spawns
						params = {
							jam_instrument = 0
							start_time = $jam_highway_play_time
						}}
					spawnscriptnow \{guitar_jam_playback_recording
						id = jam_recording_spawns
						params = {
							jam_instrument = 1
							start_time = $jam_highway_play_time
						}}
					spawnscriptnow \{guitar_jam_playback_recording
						id = jam_recording_spawns
						params = {
							jam_instrument = 2
							start_time = $jam_highway_play_time
						}}
					spawnscriptnow \{guitar_jam_playback_recording
						id = jam_recording_spawns
						params = {
							jam_instrument = 4
							start_time = $jam_highway_play_time
						}}
					spawnscriptnow \{guitar_jam_drum_playback
						id = jam_recording_spawns
						params = {
							start_time = $jam_highway_play_time
						}}
					jam_highway_reinit
				endif
			endif
		endif
		end_pos = ($jam_highway_play_line_pos - ((($jam_highway_end_time) / 1000.0) * $jam_highway_pixels_per_second))
		new_pos = ($jam_highway_play_line_pos - ((($jam_highway_play_time) / 1000.0) * $jam_highway_pixels_per_second))
		if NOT (<new_pos> [0] < <end_pos> [0])
			if NOT (<count> = 0)
				SetScreenElementProps id = jam_highway_container pos = <new_pos>
				<new_low_bound> = (($jam_highway_play_time) + ($jam_highway_start_low_bound))
				<new_high_bound> = (($jam_highway_play_time) + ($jam_highway_start_high_bound))
				CastToInteger \{new_low_bound}
				CastToInteger \{new_high_bound}
				change jam_highway_low_bound = <new_low_bound>
				change jam_highway_high_bound = <new_high_bound>
			endif
			<count> = (<count> + 1)
		else
			jam_highway_move_end
			break
		endif
		GetPlayerInfo ($jam_current_recording_player) controller
		if ControllerMake start <controller>
			ui_menu_select_sfx
			break
		endif
		if ArrayContains array = <tool_controls> contains = force_exit
			break
		endif
		Wait \{1
			gameframe}
		repeat
		jam_ghmix_note_quick_update player = ($jam_current_recording_player)
		spawnscriptnow \{id = jam_recording_spawns
			jam_advanced_hide_percussion_box}
		spawnscriptnow \{id = jam_recording_spawns
			jam_advanced_hide_arpeggiator_box}
		KillSpawnedScript \{name = jam_play_arpeggiator_loop}
		KillSpawnedScript \{name = jam_play_drum_loop}
		jam_stop_all_sound
		KillSpawnedScript \{name = jam_lightup_held_note_sprites}
		KillSpawnedScript \{name = jam_studio_tilt_meter}
		jam_studio_hide_tilt_meter
		jam_hide_all_held_note_sprites player = ($jam_current_recording_player)
		ResolveScreenElementId \{id = {
				jam_studio_element
				child = {
					adv_record
					child = {
						pitch_indicator
						child = pitch_dial
					}
				}
			}}
		LegacyDoScreenElementMorph id = <resolved_id> time = 0.2 rot_angle = 0
		DestroyPlayerServerJamInput player = ($jam_current_recording_player)
		FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
		KillSpawnedScript id = <input_spawn>
		KillSpawnedScript \{id = jam_input_spawns}
		jam_kill_update_note_length player = ($jam_current_recording_player)
		LaunchEvent \{type = focus
			target = jam_control_container}
		SetScreenElementProps \{id = control_playstop
			texture = icon_play}
		ResolveScreenElementId \{id = {
				jam_studio_element
				child = {
					adv_record
					child = control_name
				}
			}}
		SetScreenElementProps id = <resolved_id> text = ($jam_controls [$jam_control_selected].name_text)
		clean_up_user_control_helpers
		jam_recording_add_user_control_helpers
	endif
	change \{playing_song = 0}
	printf \{channel = jam_mode
		qs("\LCONTROL: Stop")}
	change \{jam_highway_playing = 0}
	if ($jam_highway_recording_mode = 0)
		begin_jam_song \{Pause = 1}
	endif
	if ($jam_highway_recording_mode = 1)
		KillSpawnedScript \{name = guitar_jam_playback_recording}
		KillSpawnedScript \{name = guitar_jam_drum_playback}
	endif
	jam_stop_all_sound
endscript

script jam_highway_record 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	tool_controls = []
	jam_update_undo_clipboard
	change \{jam_highway_recording = 1}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	GetPlayerInfo ($jam_current_recording_player) controller
	GetPlayerInfo ($jam_current_recording_player) jam_instrument
	if (<jam_instrument> = 3)
		Wait \{20
			gameframes}
	endif
	change \{playing_song = 1}
	show_countin_message
	jam_record_input
	spawnscriptnow \{guitar_jam_playback_recording
		id = jam_input_spawns
		params = {
			jam_instrument = 0
			start_time = $jam_highway_play_time
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		id = jam_input_spawns
		params = {
			jam_instrument = 1
			start_time = $jam_highway_play_time
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		id = jam_input_spawns
		params = {
			jam_instrument = 2
			start_time = $jam_highway_play_time
		}}
	spawnscriptnow \{guitar_jam_playback_recording
		id = jam_input_spawns
		params = {
			jam_instrument = 4
			start_time = $jam_highway_play_time
		}}
	spawnscriptnow \{guitar_jam_drum_playback
		id = jam_input_spawns
		params = {
			start_time = $jam_highway_play_time
		}}
	spawnscriptnow \{jam_recording_metronome
		id = jam_input_spawns
		params = {
			sound_only
		}}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = recording}
	can_loop = 0
	if ($jam_highway_play_time <= ($jam_loop_bound_high + 2))
		<can_loop> = 1
	endif
	pixels_per_frame = ($jam_highway_pixels_per_second / 60)
	GetScreenElementPosition \{id = jam_highway_container}
	count = 0
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	GetSongTimeMs
	change jam_highway_play_time = <time>
	if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
		if (<can_loop> = 1)
			if ($jam_highway_play_time > ($jam_loop_bound_high - ((1000.0 / 60.0) * 2)))
				change \{jam_highway_play_time = $jam_loop_bound_low}
				KillSpawnedScript \{name = guitar_jam_playback_recording}
				KillSpawnedScript \{name = guitar_jam_drum_playback}
				spawnscriptnow \{guitar_jam_playback_recording
					id = jam_recording_spawns
					params = {
						jam_instrument = 0
						start_time = $jam_highway_play_time
					}}
				spawnscriptnow \{guitar_jam_playback_recording
					id = jam_recording_spawns
					params = {
						jam_instrument = 1
						start_time = $jam_highway_play_time
					}}
				spawnscriptnow \{guitar_jam_playback_recording
					id = jam_recording_spawns
					params = {
						jam_instrument = 2
						start_time = $jam_highway_play_time
					}}
				spawnscriptnow \{guitar_jam_playback_recording
					id = jam_recording_spawns
					params = {
						jam_instrument = 4
						start_time = $jam_highway_play_time
					}}
				spawnscriptnow \{guitar_jam_drum_playback
					id = jam_recording_spawns
					params = {
						start_time = $jam_highway_play_time
					}}
				KillSpawnedScript \{name = jam_recording_metronome}
				spawnscriptnow \{jam_recording_metronome
					id = jam_input_spawns
					params = {
						sound_only
					}}
				jam_highway_reinit
			endif
		endif
	endif
	end_pos = ($jam_highway_play_line_pos - ((($jam_highway_end_time) / 1000.0) * $jam_highway_pixels_per_second))
	new_pos = ($jam_highway_play_line_pos - ((($jam_highway_play_time) / 1000.0) * $jam_highway_pixels_per_second))
	if NOT (<new_pos> [0] < <end_pos> [0])
		if NOT (<count> = 0)
			SetScreenElementProps id = jam_highway_container pos = <new_pos>
			<new_low_bound> = (($jam_highway_play_time) + ($jam_highway_start_low_bound))
			<new_high_bound> = (($jam_highway_play_time) + ($jam_highway_start_high_bound))
			CastToInteger \{new_low_bound}
			CastToInteger \{new_high_bound}
			change jam_highway_low_bound = <new_low_bound>
			change jam_highway_high_bound = <new_high_bound>
		endif
		<count> = (<count> + 1)
	else
		jam_highway_move_end
		break
	endif
	GetPlayerInfo ($jam_current_recording_player) controller
	<done> = 0
	if ControllerMake start <controller>
		<done> = 1
	elseif ArrayContains array = <tool_controls> contains = force_exit
		<done> = 1
	endif
	if (<done> = 1)
		SoundEvent \{event = GhMix_Select}
		if (<jam_instrument> = 4)
			jam_input_melody_stop_sound
		endif
		FormatText checksumname = msg_box 'jam_limit_msg_box_%a' a = ($jam_current_recording_player)
		if ScreenElementExists id = <msg_box>
			DestroyScreenElement id = <msg_box>
		endif
		break
	endif
	Wait \{1
		gameframe}
	repeat
	change \{playing_song = 0}
	jam_ghmix_note_quick_update player = ($jam_current_recording_player)
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	printf \{channel = jam_mode
		qs("\LRecording Done")}
	BroadcastEvent \{type = ghmix_stop_rec}
	jam_update_highway_infobox
	jam_recording_update_metaview
	spawnscriptnow \{id = jam_recording_spawns
		jam_advanced_hide_percussion_box}
	spawnscriptnow \{id = jam_recording_spawns
		jam_advanced_hide_arpeggiator_box}
	KillSpawnedScript \{name = jam_play_arpeggiator_loop}
	KillSpawnedScript \{name = jam_play_drum_loop}
	jam_stop_all_sound
	KillSpawnedScript \{name = jam_lightup_held_note_sprites}
	KillSpawnedScript \{name = jam_studio_tilt_meter}
	jam_studio_hide_tilt_meter
	jam_hide_all_held_note_sprites player = ($jam_current_recording_player)
	ResolveScreenElementId \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_dial
				}
			}
		}}
	LegacyDoScreenElementMorph id = <resolved_id> time = 0.2 rot_angle = 0
	DestroyPlayerServerJamInput player = ($jam_current_recording_player)
	FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	KillSpawnedScript id = <input_spawn>
	jam_recording_metronome_stop
	KillSpawnedScript \{id = jam_input_spawns}
	jam_kill_update_note_length player = ($jam_current_recording_player)
	LaunchEvent \{type = focus
		target = jam_control_container}
	if ScreenElementExists \{id = control_record}
		SetScreenElementProps \{id = control_record
			alpha = 1}
	endif
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	change \{jam_highway_recording = 0}
	change \{no_precise_snap = 0}
	change \{no_marker_snap = 0}
endscript

script show_countin_message 
	count_wait = (60.0 / $jam_current_bpm)
	curr_time = $jam_highway_play_time
	CastToInteger \{curr_time}
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias \{name = metronome_box}
			<resolved_id> :SetProps pos = (54.0, 800.0) time = 0.0
		endif
	endif
	quantize_to = 1
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize_fretbar = (<ms_per_beat> / <quantize_to>)
	intervals = (<curr_time> / <quantize_fretbar>)
	CastToInteger \{intervals}
	new_time_fretbar = (<intervals> * <quantize_fretbar>)
	wait_for_next_fretbar = (<curr_time> - <new_time_fretbar>)
	<wait_for_next_fretbar> = (<wait_for_next_fretbar> / 1000.0)
	toggle_advanced_record_metronome \{left}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{countin_number_text = qs("1")}
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = countin_box}
		<resolved_id> :SetProps pos = (357.0, 800.0) time = 0.0
		<resolved_id> :SE_WaitProps
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = countin_box}
		<resolved_id> :SetProps pos = (357.0, 178.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	toggle_advanced_record_metronome \{right}
	SoundEvent \{event = Jam_Mode_Metronome}
	Wait <count_wait> seconds
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{countin_number_text = qs("2")}
	endif
	toggle_advanced_record_metronome \{left}
	SoundEvent \{event = Jam_Mode_Metronome}
	Wait <count_wait> seconds
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{countin_number_text = qs("3")}
	endif
	toggle_advanced_record_metronome \{right}
	SoundEvent \{event = Jam_Mode_Metronome}
	Wait <count_wait> seconds
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{countin_number_text = qs("4")}
	endif
	toggle_advanced_record_metronome \{right}
	SoundEvent \{event = Jam_Mode_Metronome}
	if (<wait_for_next_fretbar> = 0)
		Wait <count_wait> seconds
		SoundEvent \{event = Jam_Mode_Metronome}
	else
		Wait <wait_for_next_fretbar> seconds
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = countin_box}
		<resolved_id> :SetProps pos = (357.0, 800.0) time = 0.2
	endif
endscript

script jam_update_count 
	begin
	quantize_to = 0.25
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	intervals = ($jam_highway_play_time / <quantize>)
	CastToInteger \{intervals}
	FormatText TextName = measure_text qs("\L%s") s = (<intervals> + 1)
	jam_studio_element :SetProps measure_count_text = <measure_text>
	if NOT ($jam_current_quantize < 2)
		quantize_to = ($jam_quantize [$jam_current_quantize].value)
		ms_per_beat = (60000.0 / $jam_current_bpm)
		quantize = (<ms_per_beat> / <quantize_to>)
		fintervals = ($jam_highway_play_time / <quantize>)
		<intervals_rounding_check> = (<fintervals> + 0.5)
		CastToInteger \{intervals_rounding_check}
		<intervals> = <fintervals>
		CastToInteger \{intervals}
		if NOT (<intervals_rounding_check> = <intervals>)
			<intervals> = (<intervals> + 1)
		endif
		begin
		if (<intervals> > ((<quantize_to> * 4) - 1))
			<intervals> = (<intervals> - (<quantize_to> * 4))
		else
			break
		endif
		repeat
		CastToInteger \{intervals}
		FormatText TextName = snap_text qs("\L%s") s = (<intervals> + 1)
		jam_studio_element :SetProps note_count_text = <snap_text>
	else
		jam_studio_element :SetProps \{note_count_text = qs("")}
	endif
	Wait \{5
		gameframes}
	repeat
endscript

script jam_advanced_show_percussion_box 
	if ($is_drum_machine = 1)
		jam_studio_element :SE_SetProps \{drum_machine_glow_alpha = 0.65000004}
	else
		jam_studio_element :SE_SetProps \{drum_machine_glow_alpha = 0}
	endif
	box = percussion_box
	end_pos = (188.0, 447.0)
	if IsDrumController controller = <controller>
		box = percussion_box_small
		end_pos = (188.0, 462.0)
	endif
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias name = <box>
			<resolved_id> :SetProps pos = (188.0, 800.0) time = 0.0
		endif
		if jam_studio_element :Desc_ResolveAlias name = <box>
			<resolved_id> :SetProps pos = <end_pos> time = 0.2
		endif
	endif
endscript

script jam_advanced_hide_percussion_box 
	box = percussion_box
	if IsDrumController controller = <controller>
		box = percussion_box_small
	endif
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias name = <box>
			<resolved_id> :SetProps pos = (188.0, 800.0) time = 0.2
		endif
	endif
endscript

script jam_advanced_show_arpeggiator_box 
	if (($is_arpeggiator [$jam_current_track]) = 1)
		jam_studio_element :SE_SetProps \{arpeggiator_glow_alpha = 0.65000004}
	else
		jam_studio_element :SE_SetProps \{arpeggiator_glow_alpha = 0}
	endif
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias \{name = arpeggiator_box}
			<resolved_id> :SetProps pos = (188.0, 800.0) time = 0.0
		endif
		if jam_studio_element :Desc_ResolveAlias \{name = arpeggiator_box}
			<resolved_id> :SetProps pos = (188.0, 498.0) time = 0.2
		endif
	endif
endscript

script jam_advanced_hide_arpeggiator_box 
	if ScreenElementExists \{id = jam_studio_element}
		if jam_studio_element :Desc_ResolveAlias \{name = arpeggiator_box}
			<resolved_id> :SetProps pos = (188.0, 800.0) time = 0.2
		endif
	endif
endscript

script jam_record_input \{step_record = 0
		show_box = 1}
	hammer_on = 1
	if (<step_record> = 1)
		<hammer_on> = 0
	endif
	if StructureContains Structure = ($jam_tracks [$jam_current_track]) input_func
		GetPlayerInfo ($jam_current_recording_player) controller
		FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
		spawnscriptnow ($jam_tracks [$jam_current_track].input_func) id = <input_spawn> params = {show_hud = 0 controller = <controller> select_player = ($jam_current_recording_player) hammer_on = <hammer_on>}
	endif
	if (<show_box> = 1)
		if (($jam_current_track) = 3)
			spawnscriptnow \{id = jam_recording_spawns
				jam_advanced_show_percussion_box}
		else
			if NOT (($jam_current_track) = 0)
				spawnscriptnow \{id = jam_recording_spawns
					jam_advanced_show_arpeggiator_box}
			endif
		endif
	endif
endscript

script jam_highway_step_record 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	tool_controls = []
	jam_update_undo_clipboard
	change \{jam_highway_recording = 1}
	change \{jam_highway_step_recording = 1}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	GetPlayerInfo ($jam_current_recording_player) controller
	GetPlayerInfo ($jam_current_recording_player) jam_instrument
	if (<jam_instrument> = 3 || <jam_instrument> = 4)
		Wait \{30
			gameframes}
	endif
	jam_record_input \{step_record = 1}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = step_recording}
	mid_up_strum = 0
	mid_down_strum = 0
	wait_before_sustain = 15
	hold_frames = 0
	old_quantize = ($jam_current_quantize)
	input_spawned = 1
	whammy_hold_count = 0
	if IsGuitarController controller = <controller>
		KillSpawnedScript \{name = show_warning_message}
		spawnscriptnow \{show_jam_helper_box
			id = jam_input_spawns
			params = {
				text = qs("Step recording. Hold whammy bar to skip.")
			}}
	endif
	FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	spawnscriptnow id = <input_spawn> jam_step_wait
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	count = 0
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	step_strum = 0
	if IsGuitarController controller = <controller>
		if ($blade_active = 0)
			if GuitarGetAnalogueInfo controller = <controller>
				if (<rightx> > 0.3)
					if (<whammy_hold_count> > 3)
						if (<input_spawned> = 1)
							DestroyPlayerServerJamInput player = ($jam_current_recording_player)
							FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
							KillSpawnedScript id = <input_spawn>
							KillSpawnedScript \{id = jam_input_spawns}
							jam_kill_update_note_length player = ($jam_current_recording_player)
							KillSpawnedScript \{name = jam_step_wait}
							<input_spawned> = 0
							clean_up_user_control_helpers
							jam_recording_add_user_control_helpers \{state = step_rec_skip}
						endif
						if ControllerMake <break_button> <controller>
							SoundEvent \{event = Enter_Band_Name_Back}
							jam_delete_range track = <track> low_bound = (($jam_highway_play_time) -5) high_bound = (($jam_highway_play_time) + 5)
						endif
						if ScreenElementExists \{id = jam_studio_element}
							if NOT ScriptIsRunning \{show_warning_message}
								jam_studio_element :SetProps \{dialog_text = qs("Skipping. Release whammy bar to step record.")}
							endif
						endif
					endif
					<whammy_hold_count> = (<whammy_hold_count> + 1)
				else
					<whammy_hold_count> = 0
					if (<input_spawned> = 0)
						jam_record_input \{step_record = 1
							show_box = 0}
						spawnscriptnow id = <input_spawn> jam_step_wait
						<input_spawned> = 1
						clean_up_user_control_helpers
						jam_recording_add_user_control_helpers \{state = step_recording}
					endif
					if ScreenElementExists \{id = jam_studio_element}
						if NOT ScriptIsRunning \{show_warning_message}
							jam_studio_element :SetProps \{dialog_text = qs("Step recording. Hold whammy bar for skip control.")}
						endif
					endif
				endif
			endif
		endif
	endif
	if has_lefty_adj_control_press dir = up controller = <controller> player = $jam_current_recording_player
		if (<mid_up_strum> = 0)
			if (<input_spawned> = 0)
				GhMix_Pad_Up_Down
				jam_highway_skip_forwards
			endif
		endif
		<mid_up_strum> = (<mid_up_strum> + 1)
		if (<input_spawned> = 0)
			if (<mid_up_strum> > $jam_select_area_wait)
				<mid_up_strum> = 0
			endif
		endif
	else
		<mid_up_strum> = 0
	endif
	if (<jam_instrument> != 4 || <input_spawned> = 0)
		if has_lefty_adj_control_press dir = down controller = <controller> player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				if (<input_spawned> = 0)
					GhMix_Pad_Up_Down
					jam_highway_skip_backwards
				endif
			endif
			<mid_down_strum> = (<mid_down_strum> + 1)
			if (<input_spawned> = 0)
				if (<mid_down_strum> > $jam_select_area_wait)
					<mid_down_strum> = 0
				endif
			endif
		else
			<mid_down_strum> = 0
		endif
	else
		if issoundplaying \{$jam_input_current_melody}
			<mid_down_strum> = (<mid_down_strum> + 1)
		else
			<mid_down_strum> = 0
		endif
	endif
	if (<mid_up_strum> = 0 && <mid_down_strum> = 0)
		KillSpawnedScript \{name = jam_sustain_step}
	endif
	if (<mid_up_strum> > <wait_before_sustain>)
		if NOT ScriptIsRunning \{jam_sustain_step}
			<old_quantize> = $jam_current_quantize
			spawnscriptnow jam_sustain_step params = {old_quantize = <old_quantize>}
		endif
	elseif (<mid_down_strum> > <wait_before_sustain>)
		if NOT ScriptIsRunning \{jam_sustain_step}
			<old_quantize> = $jam_current_quantize
			if (<whammy_hold_count> > 3)
				spawnscriptnow jam_sustain_step params = {old_quantize = <old_quantize> dir = backwards}
			else
				spawnscriptnow jam_sustain_step params = {old_quantize = <old_quantize>}
			endif
		endif
	endif
	<done> = 0
	if ControllerMake start <controller>
		<done> = 1
	elseif ($jam_tutorial_status = section_done)
		<done> = 1
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		<done> = 1
	endif
	if (<done> = 1)
		FormatText checksumname = msg_box 'jam_limit_msg_box_%a' a = ($jam_current_recording_player)
		if ScreenElementExists id = <msg_box>
			DestroyScreenElement id = <msg_box>
		endif
		if (<jam_instrument> = 4)
			jam_input_melody_stop_sound
		endif
		ui_menu_select_sfx
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_ghmix_note_quick_update player = ($jam_current_recording_player)
	spawnscriptnow \{id = jam_recording_spawns
		remove_jam_helper_box}
	printf \{channel = jam_mode
		qs("\LStep Recording Done")}
	BroadcastEvent \{type = ghmix_stop_step}
	jam_update_highway_infobox
	jam_recording_update_metaview
	spawnscriptnow \{id = jam_recording_spawns
		jam_advanced_hide_percussion_box}
	spawnscriptnow \{id = jam_recording_spawns
		jam_advanced_hide_arpeggiator_box}
	KillSpawnedScript \{name = jam_play_arpeggiator_loop}
	KillSpawnedScript \{name = jam_play_drum_loop}
	jam_stop_all_sound
	KillSpawnedScript \{name = jam_lightup_held_note_sprites}
	KillSpawnedScript \{name = jam_studio_tilt_meter}
	jam_studio_hide_tilt_meter
	jam_hide_all_held_note_sprites player = ($jam_current_recording_player)
	ResolveScreenElementId \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_dial
				}
			}
		}}
	LegacyDoScreenElementMorph id = <resolved_id> time = 0.2 rot_angle = 0
	DestroyPlayerServerJamInput player = ($jam_current_recording_player)
	FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	KillSpawnedScript id = <input_spawn>
	KillSpawnedScript \{name = jam_step_wait}
	KillSpawnedScript \{id = jam_input_spawns}
	jam_kill_update_note_length player = ($jam_current_recording_player)
	LaunchEvent \{type = focus
		target = jam_control_container}
	if ScreenElementExists \{id = control_record}
		SetScreenElementProps \{id = control_record
			alpha = 1}
	endif
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	change \{jam_highway_recording = 0}
	change \{jam_highway_step_recording = 0}
	change \{no_precise_snap = 0}
	change \{no_marker_snap = 0}
endscript

script show_jam_helper_box \{title = qs("Step Record Tool")
		text = qs("HELP")}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps dialog_title_text = <title>
	endif
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps dialog_text = <text>
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps pos = (21.0, 800.0) time = 0.0
		<resolved_id> :SE_WaitProps
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps pos = (21.0, -94.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
endscript

script jam_step_wait 
	begin
	Block \{type = jam_note_hit}
	Wait \{4
		gameframes}
	jam_highway_skip_forwards
	repeat
endscript

script remove_jam_helper_box 
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps pos = (5.0, 800.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
endscript

script jam_sustain_step \{dir = forwards}
	quantize_to = ($jam_quantize [5].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	Wait ((<quantize> / ((1.0 / 60.0) * 1000)) * 2) gameframes
	change \{jam_current_quantize = 5}
	if (<dir> = forwards)
		jam_highway_skip_forwards
	else
		jam_highway_skip_backwards
	endif
	change jam_current_quantize = <old_quantize>
endscript

script jam_highway_user_skip \{forwards = 1}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	GetPlayerInfo ($jam_current_recording_player) controller
	GetEnterButtonAssignment
	choose_button = <assignment>
	mid_button_press = 0
	begin
	if ControllerPressed <choose_button> <controller>
		if (<mid_button_press> = 0)
			if (<forwards> = 1)
				jam_highway_skip_forwards
			else
				jam_highway_skip_backwards
			endif
		endif
		<mid_button_press> = (<mid_button_press> + 1)
		if (<mid_button_press> > $jam_skip_wait)
			<mid_button_press> = 0
		endif
	else
		break
	endif
	Wait \{1
		gameframe}
	repeat
	LaunchEvent \{type = focus
		target = jam_control_container}
endscript

script jam_highway_skip_forwards 
	GetScreenElementPosition \{id = jam_highway_container}
	end_pos = ($jam_highway_play_line_pos - ((($jam_highway_end_time) / 1000.0) * $jam_highway_pixels_per_second))
	if NOT StructureContains Structure = ($jam_quantize [$jam_current_quantize]) marker
		quantize_to = ($jam_quantize [$jam_current_quantize].value)
		ms_per_beat = (60000.0 / $jam_current_bpm)
		quantize = (<ms_per_beat> / <quantize_to>)
		fintervals = ($jam_highway_play_time / <quantize>)
		<intervals_rounding_check> = (<fintervals> + 0.5)
		CastToInteger \{intervals_rounding_check}
		<intervals> = <fintervals>
		CastToInteger \{intervals}
		if NOT (<intervals_rounding_check> = <intervals>)
			<intervals> = (<intervals> + 1)
		endif
		<intervals> = (<intervals> + 1)
		new_time = (<intervals> * <quantize>)
		<new_time_rounding_check> = (<new_time> + 0.5)
		CastToInteger \{new_time_rounding_check}
		<new_time_int> = <new_time>
		CastToInteger \{new_time_int}
		if NOT (<new_time_rounding_check> = <new_time_int>)
			<new_time_int> = (<new_time_int> + 1)
		endif
		if GotParam \{amount}
			<new_time> = ($jam_highway_play_time + <amount>)
			<new_time_int> = <new_time>
			CastToInteger \{new_time_int}
		endif
	else
		song = editable
		suffix = '_jam_markers'
		AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
		song_jam_markers = <appended_id>
		suffix = '_size'
		AppendSuffixToChecksum Base = <song_jam_markers> SuffixString = <suffix>
		<jam_markers_size> = <appended_id>
		<new_time_int> = $jam_highway_play_time
		count = 0
		begin
		if (($<jam_markers_size>) = 0)
			break
		endif
		curr_time = ($<song_jam_markers> [<count>].time)
		if (<curr_time> > $jam_highway_play_time)
			<new_time_int> = <curr_time>
			break
		endif
		<count> = (<count> + 1)
		if (<count> > (($<jam_markers_size>) - 1))
			break
		endif
		repeat
	endif
	new_pos = ($jam_highway_play_line_pos - ((<new_time_int> / 1000.0) * $jam_highway_pixels_per_second))
	if (<new_pos> [0] < <end_pos> [0])
		jam_highway_move_end
	else
		SetScreenElementProps id = jam_highway_container pos = (<new_pos>)
		<new_low_bound> = ($jam_highway_low_bound + (<new_time_int> - $jam_highway_play_time))
		<new_high_bound> = ($jam_highway_high_bound + (<new_time_int> - $jam_highway_play_time))
		CastToInteger \{new_low_bound}
		CastToInteger \{new_high_bound}
		change jam_highway_low_bound = <new_low_bound>
		change jam_highway_high_bound = <new_high_bound>
		jam_highway_reinit
		if ($jam_highway_recording_mode = 0)
			begin_jam_song \{Pause = 1}
		endif
		change jam_highway_play_time = <new_time_int>
		play_time = $jam_highway_play_time
		CastToInteger \{play_time}
		SetSeekPosition_Song position = <play_time>
	endif
endscript

script jam_highway_skip_backwards 
	GetScreenElementPosition \{id = jam_highway_container}
	if NOT StructureContains Structure = ($jam_quantize [$jam_current_quantize]) marker
		quantize_to = ($jam_quantize [$jam_current_quantize].value)
		ms_per_beat = (60000.0 / $jam_current_bpm)
		quantize = (<ms_per_beat> / <quantize_to>)
		fintervals = ($jam_highway_play_time / <quantize>)
		<intervals_rounding_check> = (<fintervals> + 0.5)
		CastToInteger \{intervals_rounding_check}
		<intervals> = <fintervals>
		CastToInteger \{intervals}
		if NOT (<intervals_rounding_check> = <intervals>)
			<intervals> = (<intervals> + 1)
		endif
		<intervals> = (<intervals> - 1)
		new_time = (<intervals> * <quantize>)
		<new_time_rounding_check> = (<new_time> + 0.5)
		CastToInteger \{new_time_rounding_check}
		<new_time_int> = <new_time>
		CastToInteger \{new_time_int}
		if NOT (<new_time_rounding_check> = <new_time_int>)
			<new_time_int> = (<new_time_int> + 1)
		endif
		if GotParam \{amount}
			<new_time> = ($jam_highway_play_time - <amount>)
			<new_time_int> = <new_time>
			CastToInteger \{new_time_int}
		endif
	else
		song = editable
		suffix = '_jam_markers'
		AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
		song_jam_markers = <appended_id>
		suffix = '_size'
		AppendSuffixToChecksum Base = <song_jam_markers> SuffixString = <suffix>
		<jam_markers_size> = <appended_id>
		<new_time_int> = $jam_highway_play_time
		count = (($<jam_markers_size>) - 1)
		begin
		if (($<jam_markers_size>) = 0)
			break
		endif
		curr_time = ($<song_jam_markers> [<count>].time)
		if (<curr_time> < $jam_highway_play_time)
			<new_time_int> = <curr_time>
			break
		endif
		<count> = (<count> - 1)
		if (<count> < 0)
			break
		endif
		repeat
	endif
	new_pos = ($jam_highway_play_line_pos - ((<new_time_int> / 1000.0) * $jam_highway_pixels_per_second))
	if (<new_pos> [0] > $jam_highway_play_line_pos [0])
		jam_highway_move_beginning
	else
		SetScreenElementProps id = jam_highway_container pos = (<new_pos>)
		<low_bound> = ($jam_highway_low_bound - ($jam_highway_play_time - <new_time_int>))
		<high_bound> = ($jam_highway_high_bound - ($jam_highway_play_time - <new_time_int>))
		CastToInteger \{low_bound}
		CastToInteger \{high_bound}
		change jam_highway_low_bound = <low_bound>
		change jam_highway_high_bound = <high_bound>
		jam_highway_reinit
		if ($jam_highway_recording_mode = 0)
			begin_jam_song \{Pause = 1}
		endif
		change jam_highway_play_time = <new_time_int>
		play_time = $jam_highway_play_time
		CastToInteger \{play_time}
		SetSeekPosition_Song position = <play_time>
	endif
endscript

script jam_highway_delete_section 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	delete_controls = [delete delete_toggle select cancel]
	tool_controls = []
	jam_update_undo_clipboard
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = delete}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	orig_start_time = $jam_highway_play_time
	low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	orig_low_pos = <low_pos>
	delete_bound_low = 0
	delete_bound_high = 0
	mid_up_strum = 0
	mid_down_strum = 0
	delete_all = 0
	count = 0
	done = 0
	cancel = 0
	GetPlayerInfo ($jam_current_recording_player) controller
	<delete_button> = triangle
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	if ControllerMake <break_button> <controller>
		if ArrayContains array = <delete_controls> contains = cancel
			<cancel> = 1
			break
		endif
	elseif ControllerMake start <controller>
		if ArrayContains array = <delete_controls> contains = delete
			<done> = 1
		endif
	endif
	if (<done> = 1)
		ui_menu_select_sfx
		if ($jam_highway_play_time < <orig_start_time>)
			<delete_bound_low> = $jam_highway_play_time
			<delete_bound_high> = <orig_start_time>
		elseif ($jam_highway_play_time > <orig_start_time>)
			<delete_bound_low> = <orig_start_time>
			<delete_bound_high> = $jam_highway_play_time
		elseif ($jam_highway_play_time = <orig_start_time>)
			<delete_bound_low> = (<orig_start_time> -50)
			<delete_bound_high> = (($jam_highway_play_time) + 50)
		endif
		break
	endif
	if ArrayContains array = <delete_controls> contains = select
		if has_lefty_adj_control_press dir = up controller = <controller> player = $jam_current_recording_player
			if (<mid_up_strum> = 0)
				generic_menu_up_or_down_sound \{up}
				jam_highway_skip_forwards
			endif
			<mid_up_strum> = (<mid_up_strum> + 1)
			if (<mid_up_strum> > $jam_select_area_wait)
				<mid_up_strum> = 0
			endif
		else
			<mid_up_strum> = 0
		endif
		if has_lefty_adj_control_press dir = down controller = <controller> player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				generic_menu_up_or_down_sound \{down}
				jam_highway_skip_backwards
			endif
			<mid_down_strum> = (<mid_down_strum> + 1)
			if (<mid_down_strum> > $jam_select_area_wait)
				<mid_down_strum> = 0
			endif
		else
			<mid_down_strum> = 0
		endif
	endif
	if ArrayContains array = <delete_controls> contains = delete_toggle
		if ControllerMake <delete_button> <controller>
			ui_menu_select_sfx
			clean_up_user_control_helpers
			if (<delete_all> = 1)
				<delete_all> = 0
				jam_recording_add_user_control_helpers \{state = delete}
			else
				<delete_all> = 1
				jam_recording_add_user_control_helpers \{state = delete
					delete_one}
			endif
		endif
	endif
	high_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	if ((<high_pos> [0] - <low_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> - (3000.0, 0.0))
	elseif ((<low_pos> [0] - <high_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> + (3000.0, 0.0))
	else
		<low_pos> = <orig_low_pos>
	endif
	if ScreenElementExists \{id = jam_delete_highlight}
		DestroyScreenElement \{id = jam_delete_highlight}
	endif
	if ($jam_highway_play_time < <orig_start_time>)
		highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
	else
		highlight_pos = <low_pos>
	endif
	if (<delete_all> = 1)
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_delete_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			pos = (<highlight_pos> + (0.0, 55.0))
			dims = ((0.0, 650.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
			z_priority = 10
		}
	else
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_delete_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			pos = (<highlight_pos> + (0.0, 55.0))
			dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
			z_priority = 10
		}
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if NOT (<cancel> = 1)
		if NOT (<delete_bound_low> = <delete_bound_high>)
			if (<delete_all> = 1)
				GetArraySize \{$jam_tracks}
				track_count = 0
				begin
				jam_delete_range track = <track_count> low_bound = <delete_bound_low> high_bound = <delete_bound_high>
				<track_count> = (<track_count> + 1)
				repeat <array_size>
			else
				jam_delete_range low_bound = <delete_bound_low> high_bound = <delete_bound_high>
			endif
		endif
	else
		GhMix_Pad_Back_Sound
	endif
	jam_highway_reinit
	BroadcastEvent \{type = ghmix_delete_done}
	if ScreenElementExists \{id = jam_delete_highlight}
		DestroyScreenElement \{id = jam_delete_highlight}
	endif
	LaunchEvent \{type = focus
		target = jam_control_container}
	jam_update_highway_infobox
	jam_recording_update_metaview
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
endscript
jam_copy_bound_low = 0
jam_copy_bound_high = 0

script jam_highway_copy 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = copy}
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	orig_start_time = $jam_highway_play_time
	low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	orig_low_pos = <low_pos>
	GetPlayerInfo ($jam_current_recording_player) controller
	<copy_button> = triangle
	<loop_copy_button> = square
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	mid_up_strum = 0
	mid_down_strum = 0
	copy_all = 0
	count = 0
	done = 0
	copy_controls = [copy copy_toggle cancel strum]
	tool_controls = []
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	if ControllerMake <break_button> <controller>
		if ArrayContains array = <copy_controls> contains = cancel
			GhMix_Pad_Back_Sound
			break
		endif
	endif
	if ControllerMake start <controller>
		if ArrayContains array = <copy_controls> contains = copy
			<done> = 1
		endif
	endif
	if (<done> = 1)
		ui_menu_select_sfx
		if NOT ($jam_highway_play_time = <orig_start_time>)
			if ($jam_highway_play_time < <orig_start_time>)
				change jam_copy_bound_low = ($jam_highway_play_time)
				change jam_copy_bound_high = (<orig_start_time>)
			else
				change jam_copy_bound_low = (<orig_start_time>)
				change jam_copy_bound_high = ($jam_highway_play_time)
			endif
			SetScreenElementProps \{id = control_paste
				rgba = [
					255
					255
					255
					255
				]}
		endif
		break
	endif
	if ArrayContains array = <copy_controls> contains = strum
		step_strum = 0
		if has_lefty_adj_control_press dir = up controller = <controller> player = $jam_current_recording_player
			if (<mid_up_strum> = 0)
				generic_menu_up_or_down_sound \{up}
				jam_highway_skip_forwards
			endif
			<mid_up_strum> = (<mid_up_strum> + 1)
			if (<mid_up_strum> > $jam_select_area_wait)
				<mid_up_strum> = 0
			endif
		else
			<mid_up_strum> = 0
		endif
		if has_lefty_adj_control_press dir = down controller = <controller> player = $jam_current_recording_player
			if (<mid_down_strum> = 0)
				generic_menu_up_or_down_sound \{down}
				jam_highway_skip_backwards
			endif
			<mid_down_strum> = (<mid_down_strum> + 1)
			if (<mid_down_strum> > $jam_select_area_wait)
				<mid_down_strum> = 0
			endif
		else
			<mid_down_strum> = 0
		endif
	endif
	if ArrayContains array = <copy_controls> contains = copy_toggle
		if ControllerMake <copy_button> <controller>
			SoundEvent \{event = GhMix_Select}
			clean_up_user_control_helpers
			if (<copy_all> = 1)
				<copy_all> = 0
				jam_recording_add_user_control_helpers \{state = copy}
			else
				<copy_all> = 1
				jam_recording_add_user_control_helpers \{state = copy
					copy_one}
			endif
		endif
	endif
	high_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	if ((<high_pos> [0] - <low_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> - (3000.0, 0.0))
	elseif ((<low_pos> [0] - <high_pos> [0]) >= 3000.0)
		low_pos = (<high_pos> + (3000.0, 0.0))
	else
		<low_pos> = <orig_low_pos>
	endif
	if ScreenElementExists \{id = jam_copy_highlight}
		DestroyScreenElement \{id = jam_copy_highlight}
	endif
	if ($jam_highway_play_time < <orig_start_time>)
		highlight_pos = (<low_pos> + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
	else
		highlight_pos = <low_pos>
	endif
	if (<copy_all> = 1)
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_copy_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			pos = (<highlight_pos> + (0.0, 55.0))
			dims = ((0.0, 650.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
			z_priority = 10
			enable_clipping
		}
	else
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_copy_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			pos = (<highlight_pos> + (0.0, 55.0))
			dims = ((0.0, 175.0) + ((1.0, 0.0) * (<high_pos> [0] - <low_pos> [0])))
			z_priority = 10
			enable_clipping
		}
	endif
	if ControllerMake <loop_copy_button> <controller>
		if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
			change jam_copy_bound_low = ($jam_loop_bound_low)
			change jam_copy_bound_high = ($jam_loop_bound_high)
			SetScreenElementProps \{id = control_paste
				rgba = [
					255
					255
					255
					255
				]}
			break
		endif
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		break
	endif
	Wait \{1
		gameframe}
	repeat
	jam_clear_clipboards
	BroadcastEvent \{type = ghmix_stop_copy}
	if (<copy_all> = 1)
		GetArraySize \{$jam_tracks}
		track_count = 0
		begin
		jam_copy_track track = <track_count>
		<track_count> = (<track_count> + 1)
		repeat <array_size>
	else
		jam_copy_track \{track = $jam_current_track}
	endif
	jam_debug_print_clipboards
	printf \{channel = jam_mode
		qs("\LCOPY %a to %b")
		a = $jam_copy_bound_low
		b = $jam_copy_bound_high}
	if ScreenElementExists \{id = jam_copy_highlight}
		DestroyScreenElement \{id = jam_copy_highlight}
	endif
	LaunchEvent \{type = focus
		target = jam_control_container}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
endscript

script jam_copy_track \{track = 0}
	printf channel = jam_mode qs("\LCopying %s") s = ($jam_tracks [<track>].name_text)
	gem_array = ($jam_tracks [<track>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	gem_count = 0
	if (<notetrack_size> > 0)
		notetrack_index = 0
		begin
		time = ($<gem_array> [<notetrack_index>])
		if (<time> >= ($jam_copy_bound_low - 2) && <time> <= ($jam_copy_bound_high + 2))
			gem_count = (<gem_count> + 1)
		endif
		<notetrack_index> = (<notetrack_index> + 2)
		if (<notetrack_index> >= <notetrack_size>)
			break
		endif
		repeat
	endif
	gemarraysize = <gem_count>
	FormatText checksumname = clipboard_array '%s_clipboard' s = ($jam_tracks [<track>].name_text)
	if GlobalExists name = <clipboard_array> type = array
		DestroyScriptArray name = <clipboard_array>
	endif
	CreateScriptArray name = <clipboard_array> size = ((2 * <gem_count>) + 2) heap = heap_song <...>
	suffix = '_size'
	AppendSuffixToChecksum Base = <clipboard_array> SuffixString = <suffix>
	clipboard_size = ($<appended_id>)
	FormatText checksumname = clipboard_track '%s_clipboard_track' s = ($jam_tracks [<track>].name_text)
	if (<gem_count> > 0)
		notetrack_index = 0
		begin
		GetNoteTrackItem name = <gem_array> index = <notetrack_index>
		if (<gem_time> >= ($jam_copy_bound_low - 2) && <gem_time> <= ($jam_copy_bound_high + 2))
			AddNoteTrackItem name = <clipboard_array> time = <gem_time> length = <gem_length> pattern = <gem_pattern>
			GetJamSessionSound track = ($jam_tracks [<track>].id) index = (<notetrack_index> / 2)
			AddJamSessionSound track = <clipboard_track> time = <gem_time> string = <note_string> fret = <note_fret> type = <note_type> chord_type = <chord_type> effect = <effect> velocity = <velocity>
		endif
		<notetrack_index> = (<notetrack_index> + 2)
		if (<notetrack_index> >= <notetrack_size>)
			break
		endif
		repeat
	endif
endscript

script jam_debug_print_clipboards 
	GetArraySize \{$jam_tracks}
	track_count = 0
	begin
	FormatText checksumname = clipboard_array '%s_clipboard' s = ($jam_tracks [<track_count>].name_text)
	suffix = '_size'
	AppendSuffixToChecksum Base = <clipboard_array> SuffixString = <suffix>
	clipboard_size = ($<appended_id>)
	clipboard_index = 0
	if GlobalExists name = <clipboard_array> type = array
		jamsession_debug_print_script_array gem_array = <clipboard_array>
	endif
	FormatText checksumname = clipboard_track '%s_clipboard_track' s = ($jam_tracks [<track_count>].name_text)
	GetJamSessionSize track = <clipboard_track>
	printf channel = jam_mode qs("\L%a Clipboard Track Size: %s") s = <track_size> a = ($jam_tracks [<track_count>].name_text)
	track_index = 0
	if (<track_size> > 0)
		begin
		GetJamSessionSound track = <clipboard_track> index = <track_index>
		<track_index> = (<track_index> + 1)
		repeat <track_size>
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_size>
endscript

script jam_clear_clipboards 
	GetArraySize \{$jam_tracks}
	track_count = 0
	begin
	FormatText checksumname = clipboard_track '%s_clipboard_track' s = ($jam_tracks [<track_count>].name_text)
	FormatText checksumname = clipboard_array '%s_clipboard' s = ($jam_tracks [<track_count>].name_text)
	if GlobalExists name = <clipboard_array> type = array
		DestroyScriptArray name = <clipboard_array> type = array
	endif
	GetJamSessionSize track = <clipboard_track>
	if (<track_size> > 0)
		begin
		DeleteJamSessionSound track = <clipboard_track> index = 0
		GetJamSessionSize track = <clipboard_track>
		if NOT (<track_size> > 0)
			break
		endif
		repeat
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_size>
endscript

script jam_highway_paste_control 
	if ($jam_highway_recording_mode = 0)
		return
	endif
	if ($jam_copy_bound_low = $jam_copy_bound_high)
		return
	endif
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	jam_update_undo_clipboard
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = paste}
	Wait \{5
		gameframes}
	GetEnterButtonAssignment
	choose_button = <assignment>
	switch <choose_button>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	paste_multiple_button = triangle
	paste_controls = [paste_one paste_multi cancel]
	tool_controls = []
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	if ArrayContains array = <paste_controls> contains = paste_one
		if ControllerMake <choose_button> <controller>
			GHMix_scroll \{adv_record}
			jam_highway_paste
			printf \{channel = jam_mode
				qs("\LPaste One")}
			BroadcastEvent \{type = ghmix_paste_pasted}
		endif
	endif
	if ArrayContains array = <paste_controls> contains = paste_multi
		if ControllerMake <paste_multiple_button> <controller>
			SoundEvent \{event = GhMix_Select}
			show_paste_multiple
			return
		endif
	endif
	if ArrayContains array = <paste_controls> contains = cancel
		if ControllerMake <break_button> <controller>
			ui_menu_select_sfx
			break
		endif
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		break
	endif
	Wait \{1
		gameframe}
	repeat
	BroadcastEvent \{type = ghmix_paste_done}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	LaunchEvent \{type = focus
		target = jam_control_container}
endscript

script show_paste_multiple 
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = paste_multiple}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{paste_number_text = qs("1")}
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = paste_box}
		<resolved_id> :SetProps pos = (468.0, 800.0) time = 0.0
		<resolved_id> :SE_WaitProps
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = paste_box}
		<resolved_id> :SetProps pos = (468.0, 18.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	GetEnterButtonAssignment
	choose_button = <assignment>
	switch <choose_button>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	paste_count = 1
	delay = 8
	max_num_pastes = 20
	begin
	if ControllerMake <break_button>
		if jam_studio_element :Desc_ResolveAlias \{name = paste_box}
			GhMix_Pad_Back_Sound
			<resolved_id> :SetProps pos = (468.0, 800.0) time = 0.2
			<resolved_id> :SE_WaitProps
		endif
		clean_up_user_control_helpers
		jam_recording_add_user_control_helpers
		LaunchEvent \{type = focus
			target = jam_control_container}
		return
	endif
	if ControllerPressed up <controller>
		GHMix_scroll \{adv_record}
		<paste_count> = (<paste_count> + 1)
		if (<paste_count> > <max_num_pastes>)
			<paste_count> = <max_num_pastes>
		endif
		KillSpawnedScript \{name = scale_paste_arrows}
		spawnscriptnow \{scale_paste_arrows
			id = jam_recording_spawns
			params = {
				up
			}}
		Wait <delay> frames
	endif
	if ControllerPressed down <controller>
		GHMix_scroll \{adv_record}
		<paste_count> = (<paste_count> - 1)
		if (<paste_count> < 1)
			<paste_count> = 1
		endif
		KillSpawnedScript \{name = scale_paste_arrows}
		spawnscriptnow \{scale_paste_arrows
			id = jam_recording_spawns
			params = {
				down
			}}
		Wait <delay> frames
	endif
	FormatText TextName = loop_count_text qs("\L%s") s = <paste_count>
	jam_studio_element :SetProps paste_number_text = <loop_count_text>
	if ControllerMake start <controller>
		SoundEvent \{event = GhMix_Select}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	FormatText TextName = paste_text qs("Pasting clipboard %s times") s = <paste_count>
	create_popup_warning_menu {
		player_device = ($MemcardController)
		title = qs("PASTING...")
		textblock = {
			text = <paste_text>
		}
	}
	CreateScreenElement \{type = SpriteElement
		parent = popup_warning_container
		id = loading_record
		texture = load_record
		pos = (640.0, 512.0)
		z_priority = 10000
		rot_angle = 0}
	popup_warning_container :obj_spawnscript \{jam_recording_animate_spinning_record}
	Wait \{1
		second}
	count = 0
	begin
	if (<count> = (<paste_count> - 1))
		jam_highway_paste \{dont_skip = 0}
	else
		jam_highway_paste \{dont_skip = 1}
	endif
	Wait \{1
		gameframe}
	<count> = (<count> + 1)
	repeat <paste_count>
	destroy_popup_warning_menu
	if jam_studio_element :Desc_ResolveAlias \{name = paste_box}
		<resolved_id> :SetProps pos = (468.0, 800.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	LaunchEvent \{type = focus
		target = jam_control_container}
endscript

script jam_recording_animate_spinning_record 
	if NOT ScreenElementExists \{id = loading_record}
		if ScreenElementExists \{id = popup_warning_container}
			CreateScreenElement \{type = SpriteElement
				parent = popup_warning_container
				id = loading_record
				texture = load_record
				pos = (640.0, 512.0)
				z_priority = 10000
				rot_angle = 0}
		endif
	endif
	begin
	loading_record :SE_GetProps
	loading_record :SE_SetProps rot_angle = (<rot_angle> + 360) time = 1
	loading_record :SE_WaitProps
	repeat
endscript

script scale_paste_arrows 
	if GotParam \{up}
		jam_studio_element :SetProps \{paste_arrow_up_scale = 2.0}
		jam_studio_element :SetProps \{paste_arrow_up_scale = 1.5
			time = 0.15}
		jam_studio_element :SE_WaitProps
	endif
	if GotParam \{down}
		jam_studio_element :SetProps \{paste_arrow_down_scale = 2.0}
		jam_studio_element :SetProps \{paste_arrow_down_scale = 1.5
			time = 0.15}
		jam_studio_element :SE_WaitProps
	endif
endscript

script jam_highway_paste \{dont_skip = 0}
	GetArraySize \{$jam_tracks}
	track_count = 0
	copy_count = 0
	begin
	FormatText checksumname = clipboard_array '%s_clipboard' s = ($jam_tracks [<track_count>].name_text)
	suffix = '_size'
	AppendSuffixToChecksum Base = <clipboard_array> SuffixString = <suffix>
	clipboard_size = ($<appended_id>)
	if GlobalExists name = <clipboard_array> type = array
		if (<clipboard_size> > 0)
			copy_count = (<copy_count> + 1)
		endif
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_size>
	copy_size = ($jam_copy_bound_high - $jam_copy_bound_low)
	copy_distance = ($jam_highway_play_time - $jam_copy_bound_low)
	end_time = ($jam_highway_play_time + <copy_size>)
	if (<copy_count> > 1)
		GetArraySize \{$jam_tracks}
		track_count = 0
		begin
		jam_paste_track track = <track_count>
		<track_count> = (<track_count> + 1)
		repeat <array_size>
	else
		jam_paste_track \{track = $jam_current_track}
	endif
	jam_update_highway_infobox
	jam_recording_update_metaview
	quantize_to = ($jam_quantize [7].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	intervals = (<end_time> / <quantize>)
	CastToInteger \{intervals}
	low_end_time = (<intervals> * <quantize>)
	high_end_time = ((<intervals> + 1) * <quantize>)
	if ((<end_time> - <low_end_time>) > (<high_end_time> - <end_time>))
		<end_time> = <high_end_time>
	else
		<end_time> = <low_end_time>
	endif
	CastToInteger \{end_time}
	new_pos = ($jam_highway_play_line_pos - ((<end_time> / 1000.0) * $jam_highway_pixels_per_second))
	end_pos = ($jam_highway_play_line_pos - ((($jam_highway_end_time) / 1000.0) * $jam_highway_pixels_per_second))
	if (<new_pos> [0] < <end_pos> [0])
		jam_highway_move_end
	else
		SetScreenElementProps id = jam_highway_container pos = <new_pos>
		change jam_highway_play_time = <end_time>
		<new_low_bound> = ($jam_highway_start_low_bound + <end_time>)
		<new_high_bound> = ($jam_highway_start_high_bound + <end_time>)
		CastToInteger \{new_low_bound}
		CastToInteger \{new_high_bound}
		change jam_highway_low_bound = <new_low_bound>
		change jam_highway_high_bound = <new_high_bound>
		if (<dont_skip> = 0)
			jam_highway_reinit
		endif
	endif
	if (<dont_skip> = 0)
		jam_show_paste_highlight
	endif
endscript

script jam_paste_track \{track = 0}
	printf channel = jam_mode qs("\LPASTING %s Track") s = ($jam_tracks [<track>].name_text)
	copy_size = ($jam_copy_bound_high - $jam_copy_bound_low)
	copy_distance = ($jam_highway_play_time - $jam_copy_bound_low)
	end_time = ($jam_highway_play_time + <copy_size>)
	jam_delete_range track = <track> low_bound = (($jam_highway_play_time) -5) high_bound = (<end_time> + 5)
	gem_array = ($jam_tracks [<track>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	printf channel = jam_mode qs("\Lnotetrack_size %s") s = <notetrack_size>
	if (<notetrack_size> > 0)
		<count> = 0
		begin
		GetNoteTrackItem name = <gem_array> index = <count>
		if ((<gem_time> <= $jam_highway_play_time) && ((<gem_time> + <gem_length>) > $jam_highway_play_time))
			<new_length> = ((($jam_highway_play_time) - <gem_time>))
			CastToInteger \{new_length}
			AddNoteTrackItem name = <gem_array> time = <gem_time> length = <new_length> pattern = <gem_pattern>
			if (<count> = 0)
				GetJamSessionSound track = ($jam_tracks [<track>].id) index = (<count>)
			else
				GetJamSessionSound track = ($jam_tracks [<track>].id) index = ((<count> -2) / 2)
			endif
			FindJamSessionSound track = ($jam_tracks [<track>].id) time = <time>
			if (<index> >= 0)
				DeleteJamSessionSound track = ($jam_tracks [<track>].id) index = <index>
			endif
			AddJamSessionSound track = ($jam_tracks [<track>].id) time = <time> string = <note_string> fret = <note_fret> type = <note_type> chord_type = <chord_type> effect = <effect> velocity = <velocity>
			break
		endif
		<count> = (<count> + 2)
		if (<count> >= <notetrack_size>)
			break
		endif
		repeat
	endif
	FormatText checksumname = clipboard_array '%s_clipboard' s = ($jam_tracks [<track>].name_text)
	suffix = '_size'
	AppendSuffixToChecksum Base = <clipboard_array> SuffixString = <suffix>
	clipboard_size = ($<appended_id>)
	FormatText checksumname = clipboard_track '%s_clipboard_track' s = ($jam_tracks [<track>].name_text)
	GetJamSessionSize track = <clipboard_track>
	<notes_in_clip> = <track_size>
	GetJamSessionSize track = ($jam_tracks [<track>].id)
	if ((<notes_in_clip> + <track_size>) >= (($gemarraysize) - 1))
		<notes_in_clip> = (<notes_in_clip> - ((<notes_in_clip> + <track_size>) - (($gemarraysize) - 1)))
		if ($jam_advanced_record = 1)
			if NOT ScriptIsRunning \{show_warning_message}
				spawnscriptnow \{show_warning_message
					id = jam_recording_spawns
					params = {
						warning_text = qs("Maximum Note Limit Reached!")
						start_pos = (15.0, 800.0)
						end_pos = (15.0, -50.0)
					}}
			endif
		else
			spawnscriptnow jam_note_limit_hit id = <limit_msg> params = {player = ($jam_current_recording_player)}
		endif
	endif
	if (<notes_in_clip> = 0)
		return
	endif
	session_sound_index = 0
	begin
	if (GetJamSessionSound track = <clipboard_track> index = <session_sound_index>)
		new_time = (<time> + <copy_distance>)
		CastToInteger \{new_time}
		if (<new_time> <= $jam_highway_end_time)
			if (<new_time> < $jam_highway_play_time)
				<new_time> = $jam_highway_play_time
			endif
			if (<new_time> > <end_time>)
				<new_time> = <end_time>
			endif
			GetJamSessionSound track = <clipboard_track> index = <session_sound_index>
			AddJamSessionSound track = ($jam_tracks [<track>].id) time = <new_time> string = <note_string> fret = <note_fret> chord_type = <chord_type> type = <note_type> effect = <effect> velocity = <velocity>
		endif
	endif
	<session_sound_index> = (<session_sound_index> + 1)
	if (<session_sound_index> >= <notes_in_clip>)
		break
	endif
	repeat
	clipboard_index = 0
	if GlobalExists name = <clipboard_array> type = array
		if (<clipboard_size> > 0)
			begin
			GetNoteTrackItem name = <clipboard_array> index = <clipboard_index>
			new_time = (<gem_time> + <copy_distance>)
			CastToInteger \{new_time}
			if (<new_time> <= $jam_highway_end_time)
				if (<new_time> < $jam_highway_play_time)
					<new_time> = $jam_highway_play_time
				endif
				if (<new_time> > <end_time>)
					<new_time> = <end_time>
				endif
				if (<new_time> + <gem_length> > $jam_highway_end_time)
					<gem_length> = ($jam_highway_end_time - <new_time>)
					CastToInteger \{gem_length}
				endif
				if (<gem_length> > 0)
					AddNoteTrackItem name = <gem_array> time = <new_time> length = <gem_length> pattern = <gem_pattern>
					<check_sustain> = 0
					if (<notes_in_clip> = 1)
						<check_sustain> = 1
					elseif (<clipboard_index> = ((<notes_in_clip> * 2) -2))
						<check_sustain> = 1
					endif
					suffix = '_size'
					AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
					<gem_array_size> = ($<appended_id>)
					if (<index> >= (<gem_array_size> -2))
						<check_sustain> = 0
					endif
					if (<check_sustain> = 1)
						<cur_gem_time> = <new_time>
						<cur_gem_len> = <gem_length>
						<cur_gem_pattern> = <gem_pattern>
						GetNoteTrackItem name = <gem_array> index = (<index> + 2)
						if ((<cur_gem_time> + <cur_gem_len>) > <gem_time>)
							<new_length> = (<gem_time> - <cur_gem_time>)
							CastToInteger \{new_length}
							AddNoteTrackItem name = <gem_array> time = <cur_gem_time> length = <new_length> pattern = <cur_gem_pattern>
						endif
					endif
				endif
			endif
			<clipboard_index> = (<clipboard_index> + 2)
			if (<clipboard_index> >= (<notes_in_clip> * 2))
				break
			endif
			repeat
		endif
	endif
endscript

script jam_show_paste_highlight 
	if ($jam_copy_bound_low = $jam_copy_bound_high)
		return
	endif
	GetArraySize \{$jam_tracks}
	track_count = 0
	copy_count = 0
	begin
	FormatText checksumname = clipboard_array '%s_clipboard' s = ($jam_tracks [<track_count>].name_text)
	suffix = '_size'
	AppendSuffixToChecksum Base = <clipboard_array> SuffixString = <suffix>
	clipboard_size = ($<appended_id>)
	if GlobalExists name = <clipboard_array> type = array
		if (<clipboard_size> > 0)
			copy_count = (<copy_count> + 1)
		endif
	endif
	<track_count> = (<track_count> + 1)
	repeat <array_size>
	copy_size = ($jam_copy_bound_high - $jam_copy_bound_low)
	highlight_low_pos = (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second)
	highlight_high_pos = ((($jam_highway_play_time + <copy_size>) / 1000.0) * $jam_highway_pixels_per_second)
	if ScreenElementExists \{id = jam_paste_highlight}
		DestroyScreenElement \{id = jam_paste_highlight}
	endif
	if (<copy_count> > 1)
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_paste_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			pos = (<highlight_low_pos> + (0.0, 55.0))
			dims = ((0.0, 650.0) + ((1.0, 0.0) * (<highlight_high_pos> [0] - <highlight_low_pos> [0])))
			z_priority = 10
		}
	else
		CreateScreenElement {
			type = SpriteElement
			parent = jam_highway_container
			id = jam_paste_highlight
			texture = white
			just = [left top]
			rgba = [255 0 0 50]
			pos = (<highlight_low_pos> + (0.0, 55.0))
			dims = ((0.0, 175.0) + ((1.0, 0.0) * (<highlight_high_pos> [0] - <highlight_low_pos> [0])))
			z_priority = 10
		}
	endif
endscript

script jam_highway_note_nudge 
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	nudge_controls = [nudge nudge_all cancel]
	tool_controls = []
	jam_update_undo_clipboard
	gem_array = ($jam_tracks [$jam_current_track].gem_array)
	track = ($jam_tracks [$jam_current_track].id)
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers \{state = nudge}
	Wait \{5
		gameframes}
	GetEnterButtonAssignment
	choose_button = <assignment>
	switch <choose_button>
		case circle
		break_button = x
		case x
		break_button = circle
	endswitch
	nudge_all_button = triangle
	begin
	if ($game_mode = training)
		jam_studio_element :GetTags
	endif
	quantize_to = ($jam_quantize [$jam_current_quantize].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	if NOT ($jam_current_quantize = 0)
		if ArrayContains array = <nudge_controls> contains = nudge
			if ControllerMake <choose_button> <controller>
				SoundEvent \{event = GhMix_Scroll_Up_Down}
				if NoteNudge time = ($jam_highway_play_time) nudge = <quantize> song_length = ($jam_highway_song_length) gem_array = <gem_array> track = <track>
					jam_highway_skip_forwards amount = <quantize>
					Wait \{1
						gameframe}
				else
					KillSpawnedScript \{name = show_warning_message}
					spawnscriptnow \{show_warning_message
						id = jam_recording_spawns
						params = {
							warning_text = qs("Note nudge error: Can't nudge a note past an existing note.")
						}}
				endif
			endif
		endif
		if ArrayContains array = <nudge_controls> contains = nudge_all
			if ControllerMake <nudge_all_button> <controller>
				SoundEvent \{event = GhMix_Scroll_Up_Down}
				if NoteNudge time = ($jam_highway_play_time) nudge = <quantize> song_length = ($jam_highway_song_length) gem_array = <gem_array> track = <track> all
					jam_highway_skip_forwards amount = <quantize>
					Wait \{1
						gameframe}
				endif
			endif
		endif
	endif
	if ArrayContains array = <nudge_controls> contains = cancel
		if ControllerMake <break_button> <controller>
			ui_menu_select_sfx
			break
		endif
	endif
	if ArrayContains array = <tool_controls> contains = force_exit
		break
	endif
	Wait \{1
		gameframe}
	repeat
	BroadcastEvent \{type = ghmix_stop_nudge}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	LaunchEvent \{type = focus
		target = jam_control_container}
	change \{no_precise_snap = 0}
	change \{no_marker_snap = 0}
endscript

script show_warning_message \{warning_text = qs("Warning")
		start_pos = (21.0, 800.0)
		end_pos = (21.0, -94.0)}
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps \{dialog_title_text = qs("WARNING")}
	endif
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :SetProps dialog_text = <warning_text>
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps pos = <start_pos> time = 0.0
		<resolved_id> :SE_WaitProps
	endif
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps pos = <end_pos> time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	Wait \{3
		seconds}
	if jam_studio_element :Desc_ResolveAlias \{name = dialog_box}
		<resolved_id> :SetProps pos = <start_pos> time = 0.2
		<resolved_id> :SE_WaitProps
	endif
endscript

script initialize_jam_highway 
	seconds_per_screen = ((720.0 / $jam_highway_pixels_per_second [0]) * 1000)
	change \{jam_highway_start_low_bound = -800}
	change \{jam_highway_start_high_bound = 1250}
	<new_low_bound> = ($jam_highway_start_low_bound)
	<new_high_bound> = ($jam_highway_start_high_bound)
	CastToInteger \{new_low_bound}
	CastToInteger \{new_high_bound}
	change jam_highway_low_bound = <new_low_bound>
	change jam_highway_high_bound = <new_high_bound>
	jam_highway_reinit
endscript
jam_highway_low_bound = 0.0
jam_highway_high_bound = 0.0
jam_highway_start_low_bound = -800.0
jam_highway_start_high_bound = 1250.0
jam_highway_end_time = 0.0
jam_highway_pixels_per_second = (250.0, 0.0)
start_at_index_bars = 0
start_at_index_markers = 0
jam_start_at_index_array = [
	0
	0
	0
	0
	0
]
jam_highway_hammer_on_tolerance = 0
jam_highway_play_time = 0
jam_highway_rotation = -90
jam_highway_play_line_pos_master = (450.0, 389.0)
jam_highway_play_line_pos = (0.0, 0.0)

script jam_recording_switch_instrument 
	player = ($jam_current_recording_player)
	GetPlayerInfo <player> controller
	if IsDrumController controller = <controller>
		spawnscriptnow \{show_warning_message
			id = jam_recording_spawns
			params = {
				warning_text = qs("Error: You may only edit drum tracks with a drum kit.")
			}}
		return
	endif
	stoprendering
	change \{jam_copy_bound_low = 0}
	change \{jam_copy_bound_high = 0}
	jam_input_melody_stop_sound
	jam_clear_clipboards
	if ScreenElementExists \{id = jam_highway_container_master}
		DestroyScreenElement \{id = jam_highway_container_master}
	endif
	KillSpawnedScript \{name = create_jam_highway_notetrack}
	KillSpawnedScript \{name = create_jam_highway_fretbars}
	GetArraySize \{$jam_tracks}
	if ($jam_current_track = (<array_size> - 1))
		change \{jam_current_track = 0}
	else
		change jam_current_track = ($jam_current_track + 1)
	endif
	SetPlayerInfo <player> jam_instrument = ($jam_current_track)
	create_studio_now_bar
	jam_highway_reinit
	spawnscriptnow \{create_jam_multiple_highways
		id = jam_recording_spawns
		params = {
			song = editable
		}}
	new_pos = ($jam_highway_play_line_pos - (($jam_highway_play_time / 1000.0) * $jam_highway_pixels_per_second))
	SetScreenElementProps id = jam_highway_container pos = (<new_pos>)
	<new_low_bound> = ($jam_highway_play_time + $jam_highway_start_low_bound)
	<new_high_bound> = ($jam_highway_play_time + $jam_highway_start_high_bound)
	CastToInteger \{new_low_bound}
	CastToInteger \{new_high_bound}
	change jam_highway_low_bound = <new_low_bound>
	change jam_highway_high_bound = <new_high_bound>
	jam_highway_reinit
	Wait \{10
		gameframes}
	startrendering
endscript

script jam_highway_reinit 
	change \{start_at_index_bars = 0}
	change \{start_at_index_markers = 0}
	change \{jam_start_at_index_array = [
			0
			0
			0
			0
			0
		]}
endscript

script create_jam_multiple_highways 
	z_priority = 5
	ResolveScreenElementId \{id = jam_studio_element}
	if ScreenElementExists \{id = highway_window_element}
		DestroyScreenElement \{id = highway_window_element}
	endif
	CreateScreenElement \{type = WindowElement
		parent = jam_studio_element
		id = highway_window_element
		pos = (394.0, 115.0)
		dims = (717.0, 482.0)}
	CreateScreenElement {
		type = ContainerElement
		parent = highway_window_element
		id = jam_highway_container_master
		just = [center center]
		pos = ($jam_highway_play_line_pos_master - (437.0, 96.0))
		scale = 1
		rot_angle = $jam_highway_rotation
	}
	CreateScreenElement \{type = ContainerElement
		parent = jam_highway_container_master
		id = jam_highway_container
		pos = $jam_highway_play_line_pos
		scale = 1}
	initialize_jam_highway
	suffix = '_fretbars'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_fretbars = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_fretbars> SuffixString = <suffix>
	fretbar_size = <appended_id>
	suffix = '_timesig'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_timesig = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_timesig> SuffixString = <suffix>
	timesig_size = <appended_id>
	suffix = '_jam_markers'
	AppendSuffixToChecksum Base = <song> SuffixString = <suffix>
	song_jam_markers = <appended_id>
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_jam_markers> SuffixString = <suffix>
	<jam_markers_size> = <appended_id>
	bar_size = ((($<song_fretbars> [(($<fretbar_size>) - 1)]) / 1000.0) * $jam_highway_pixels_per_second)
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		texture = white
		just = [left top]
		rgba = [80 80 80 255]
		pos = (0.0, 56.0)
		dims = ((0.0, 680.0) + <bar_size>)
		z_priority = <z_priority>
	}
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		texture = white
		just = [left top]
		rgba = [60 60 60 255]
		pos = (0.0, 240.0)
		dims = ((0.0, 680.0) + <bar_size>)
		z_priority = (<z_priority> + 1)
	}
	CreateScreenElement \{parent = jam_highway_container
		id = loop_start_marker
		type = DescInterface
		pos = (0.0, -1000.0)
		rot_angle = 90
		desc = 'jam_loop_marker'}
	loop_start_marker :SetProps \{loop_text = qs("LOOP START")}
	CreateScreenElement \{parent = jam_highway_container
		id = loop_end_marker
		type = DescInterface
		pos = (0.0, -1000.0)
		rot_angle = 90
		desc = 'jam_loop_marker'}
	loop_end_marker :SetProps \{loop_text = qs("LOOP END")}
	change jam_highway_end_time = ($<song_fretbars> [($<fretbar_size> - 1)])
	spawnscriptnow create_jam_highway_fretbars id = jam_recording_spawns params = {<...>}
	if jam_studio_element :Desc_ResolveAlias \{name = alias_main_inst_text}
		<resolved_id> :SE_SetProps text = ($jam_tracks [$jam_current_track].name_text)
	endif
	spawnscriptnow \{create_jam_highway_notetrack
		id = jam_recording_spawns
		params = {
			track = $jam_current_track
			pos = (0.0, 0.0)
			gem_offset = (0.0, 32.0)
			gem_scale = 0.8
		}}
	GetArraySize \{$jam_tracks}
	<small_gems_begin_pos> = (0.0, 192.0)
	track = ($jam_current_track + 1)
	<count> = 1
	begin
	if (<track> > (<array_size> - 1))
		<track> = 0
	endif
	spawnscriptnow create_jam_highway_notetrack id = jam_recording_spawns params = {track = <track> pos = <small_gems_begin_pos> gem_offset = (0.0, 20.0) gem_scale = 0.55 small_view = 1}
	FormatText checksumname = alias_id 'alias_inst_text%s' s = <count>
	if jam_studio_element :Desc_ResolveAlias name = <alias_id>
		<resolved_id> :SE_SetProps text = ($jam_tracks [<track>].name_text)
	endif
	<small_gems_begin_pos> = (<small_gems_begin_pos> + (0.0, 115.5))
	<track> = (<track> + 1)
	<count> = (<count> + 1)
	repeat (<array_size> - 1)
endscript

script create_jam_highway_fretbars 
	<whole_measure_dims> = (7.0, 680.0)
	<quarter_measure_dims> = (4.0, 680.0)
	<bar_offset> = (0.0, 58.0)
	begin
	if ScreenElementExists \{id = jam_highway_bars_container}
		DestroyScreenElement \{id = jam_highway_bars_container}
	endif
	CreateScreenElement \{type = ContainerElement
		parent = jam_highway_container
		id = jam_highway_bars_container
		pos = (0.0, 0.0)}
	loop_offset = (22.0, 268.0)
	if ($jam_loop_bound_low < 0)
		loop_marker_pos = (0.0, -1000.0)
	else
		loop_marker_pos = (((($jam_loop_bound_low) / 1000.0) * $jam_highway_pixels_per_second) + <loop_offset>)
	endif
	if ScreenElementExists \{id = loop_start_marker}
		loop_start_marker :SetProps pos = <loop_marker_pos>
	endif
	if ($jam_loop_bound_high < 0)
		loop_marker_pos = (0.0, -1000.0)
	else
		loop_marker_pos = (((($jam_loop_bound_high) / 1000.0) * $jam_highway_pixels_per_second) + <loop_offset>)
	endif
	if ScreenElementExists \{id = loop_start_marker}
		loop_end_marker :SetProps pos = <loop_marker_pos>
	endif
	count = $start_at_index_markers
	begin
	if (($<jam_markers_size>) = 0)
		break
	endif
	curr_time = ($<song_jam_markers> [<count>].time)
	if (<curr_time> > $jam_highway_high_bound)
		break
	endif
	curr_marker_name = ($<song_jam_markers> [<count>].marker_name)
	curr_marker_count = ($<song_jam_markers> [<count>].marker_count)
	curr_bpm = ($<song_jam_markers> [<count>].bpm)
	curr_marker_lightshow = ($<song_jam_markers> [<count>].LightShow)
	if (<curr_time> < $jam_highway_low_bound)
		change start_at_index_markers = <count>
	else
		<marker_offset> = (28.0, 395.0)
		<marker_pos> = (((<curr_time> / 1000.0) * $jam_highway_pixels_per_second) + <marker_offset>)
		if (<curr_marker_count> > 0)
			FormatText TextName = marker qs("\L%s %c  (%b)") s = <curr_marker_name> c = <curr_marker_count> b = ($jam_lightshow [<curr_marker_lightshow>].name_text)
		else
			FormatText TextName = marker qs("\L%s  (%b)") s = <curr_marker_name> b = ($jam_lightshow [<curr_marker_lightshow>].name_text)
		endif
		CreateScreenElement {
			parent = jam_highway_bars_container
			type = DescInterface
			pos = <marker_pos>
			rot_angle = 90
			desc = 'jam_marker'
		}
		<id> :SetProps marker_text = <marker>
	endif
	<count> = (<count> + 1)
	if (<count> > (($<jam_markers_size>) - 1))
		break
	endif
	repeat
	count = $start_at_index_bars
	begin
	curr_time = ($<song_fretbars> [<count>])
	if (<curr_time> > $jam_highway_high_bound)
		break
	endif
	song_beat_time = 0
	note_len = 0
	if ((<count> + 1) <= ($<fretbar_size> - 1))
		song_beat_time = ($<song_fretbars> [(<count> + 1)] - $<song_fretbars> [<count>])
		note_len = (4 / 4)
		change jam_highway_hammer_on_tolerance = ((<song_beat_time> / $default_hammer_on_measure_scale) * <note_len>)
	endif
	if (<curr_time> >= $jam_highway_low_bound)
		bar_pos = ((($<song_fretbars> [<count>]) / 1000.0) * $jam_highway_pixels_per_second)
		Mod a = <count> b = 4
		if (<Mod> = 0)
			CreateScreenElement {
				type = SpriteElement
				parent = jam_highway_bars_container
				texture = white
				just = [center top]
				rgba = ($jam_highway_measurebar_color)
				pos = (<bar_pos> + <bar_offset>)
				dims = <whole_measure_dims>
				z_priority = 7
			}
		else
			CreateScreenElement {
				type = SpriteElement
				parent = jam_highway_bars_container
				texture = white
				just = [center top]
				rgba = ($jam_highway_fretbar_color)
				pos = (<bar_pos> + <bar_offset>)
				dims = <quarter_measure_dims>
				z_priority = 7
			}
		endif
		if (<Mod> = 0)
			CreateScreenElement {
				type = SpriteElement
				parent = jam_highway_bars_container
				texture = measure_number_bg
				just = [center center]
				scale = (2.5, 3.5)
				pos = ((<bar_pos>) + (0.0, 13.0))
				z_priority = 13
			}
			if (<count> = ($<fretbar_size> - 1))
				FormatText \{TextName = marker
					qs("END")}
			else
				FormatText TextName = marker qs("\L%s") s = ((<count> / 4) + 1)
			endif
			CreateScreenElement {
				type = TextElement
				parent = jam_highway_bars_container
				font = fontgrid_text_a8
				just = [center center]
				scale = 0.6
				rgba = [220 220 220 255]
				pos = ((<bar_pos>) + (1.0, 14.0))
				text = <marker>
				rot_angle = (($jam_highway_rotation) * -1)
				z_priority = 14
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
			}
		endif
	else
		change start_at_index_bars = <count>
	endif
	<count> = (<count> + 1)
	if (<count> > ($<fretbar_size> - 1))
		break
	endif
	repeat
	if ($jam_highway_playing = 1)
		Wait \{5
			gameframes}
	else
		Wait \{5
			gameframes}
	endif
	repeat
endscript

script cleanup_jam_highway_notetrack 
	JamHighwayNotes_Cleanup track = <track>
endscript

script create_jam_highway_notetrack \{small_view = 0}
	OnExitRun cleanup_jam_highway_notetrack params = {track = <track>}
	song_notetrack = ($jam_tracks [<track>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <song_notetrack> SuffixString = <suffix>
	notetrack_size = <appended_id>
	FormatText checksumname = notetrack_cont 'jam_highway_notetrack_containter_%s' s = <track>
	<drum> = 0
	GetPlayerInfo \{$jam_current_recording_player
		controller}
	if IsDrumController controller = <controller>
		<drum> = 1
	endif
	jam_menu_get_lefty \{player = $jam_current_recording_player}
	if (<drum> = 1)
		<lefty> = 0
		<gem_textures> = [
			{
				texture = red_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = yellow_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = blue_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = orange_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = green_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = kick_bar_purple
				dims = (256.0, 32.0)
			}
		]
	else
		<gem_textures> = [
			{
				texture = green_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = red_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = yellow_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = blue_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = orange_top_gem
				dims = (64.0, 64.0)
			}
			{
				texture = kick_bar_purple
				dims = (256.0, 32.0)
			}
		]
	endif
	if ScreenElementExists id = <notetrack_cont>
		DestroyScreenElement id = <notetrack_cont>
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = jam_highway_container
		id = <notetrack_cont>
		pos = <pos>
	}
	JamHighwayNotes_Init {
		track = <track>
		container = <notetrack_cont>
		gem_textures = <gem_textures>
		song_notetrack = <song_notetrack>
		notetrack_size = <notetrack_size>
		gem_textures = <gem_textures>
		lefty = <lefty>
		small_view = <small_view>
		controller = <controller>
		gem_offset = <gem_offset>
		gem_scale = <gem_scale>
	}
	GetPlayerInfo ($jam_current_recording_player) jam_instrument
	begin
	JamHighwayNotes_Process track = <track> jam_instrument = <jam_instrument>
	Wait \{1
		gameframes}
	repeat
endscript

script jam_create_song_info_boxes 
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		id = studio_highway_infobox
		texture = white
		just = [right top]
		rgba = [50 50 50 255]
		dims = (510.0, 120.0)
		pos = (0.0, 510.0)
		scale = 1
		rot_angle = 90
		z_priority = (<z_priority> + 1)
	}
	CreateScreenElement {
		type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_name
		font = fontgrid_text_a8
		just = [left center]
		scale = 0.8
		rgba = [210 130 0 250]
		pos = (35.0, 35.0)
		text = ($jam_selected_song)
		z_priority = (<z_priority> + 1)
	}
	<count> = 0
	<last_end_time> = 0
	<total_notes> = 0
	begin
	gem_array = ($jam_tracks [<count>].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	notetrack_size = ($<appended_id>)
	if (<notetrack_size> > 0)
		end_time = ($<gem_array> [(<notetrack_size> - 2)])
		if (<end_time> > <last_end_time>)
			<last_end_time> = <end_time>
		endif
		<total_notes> = (<total_notes> + <notetrack_size>)
	endif
	<count> = (<count> + 1)
	repeat 4
	<total_notes> = (<total_notes> / 2)
	Mod a = <last_end_time> b = 60000
	<seconds> = (<Mod> / 1000)
	<minutes> = (<last_end_time> / 60000)
	<sec_check> = (<seconds> / 10)
	if (<sec_check> < 1)
		FormatText TextName = song_len qs("Length %a:0%b") a = <minutes> b = <seconds>
	else
		FormatText TextName = song_len qs("Length %a:%b") a = <minutes> b = <seconds>
	endif
	CreateScreenElement {
		type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_length
		font = fontgrid_text_a8
		just = [left center]
		scale = 0.6
		rgba = [210 130 0 250]
		pos = (35.0, 85.0)
		text = <song_len>
		z_priority = (<z_priority> + 1)
	}
	FormatText TextName = song_bpm qs("%a bpm") a = ($jam_current_bpm)
	CreateScreenElement {
		type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_bpm
		font = fontgrid_text_a8
		just = [left center]
		scale = 0.6
		rgba = [210 130 0 250]
		pos = (185.0, 85.0)
		text = <song_bpm>
		z_priority = (<z_priority> + 1)
	}
	FormatText TextName = num_notes qs("Total Notes %a") a = <total_notes>
	CreateScreenElement {
		type = TextElement
		parent = studio_highway_infobox
		id = studio_highway_infobox_notes
		font = fontgrid_text_a8
		just = [left center]
		scale = 0.6
		rgba = [210 130 0 250]
		pos = (300.0, 85.0)
		text = <num_notes>
		z_priority = (<z_priority> + 1)
	}
	bar_size = ((($<song_fretbars> [(<fretbar_size> - 1)]) / 1000.0) * $jam_highway_pixels_per_second)
	CreateScreenElement {
		type = SpriteElement
		parent = jam_highway_container
		id = studio_highway_endbox
		texture = white
		just = [right top]
		rgba = [50 50 50 255]
		dims = (510.0, 370.0)
		pos = ((370.0, 500.0) + <bar_size>)
		scale = 1
		rot_angle = 90
		z_priority = (<z_priority> + 1)
	}
	CreateScreenElement {
		type = TextElement
		parent = studio_highway_endbox
		font = fontgrid_text_a11
		just = [left center]
		scale = 2.2
		rgba = [210 130 0 250]
		pos = (63.0, 270.0)
		text = qs("END OF SONG")
		z_priority = (<z_priority> + 1)
	}
endscript

script jam_update_highway_infobox 
endscript
jam_controls = [
	{
		id = control_end
		texture = icon_jump_end
		name_text = qs("Skip to last note")
		help_text = $wii_jam_help_skip_to_last
	}
	{
		id = control_skip_forwards
		texture = icon_forward
		name_text = qs("Skip forward")
		help_text = $wii_jam_help_skip_forward
	}
	{
		id = control_playstop
		texture = icon_play
		name_text = qs("Play")
		alt_name_text = qs("Stop")
		help_text = $wii_jam_help_play
	}
	{
		id = control_record
		texture = icon_record
		name_text = qs("Live Record")
		help_text = $wii_jam_help_live_record
	}
	{
		id = control_step_record
		texture = icon_step_record
		name_text = qs("Step Record")
		help_text = $wii_jam_help_step_note
	}
	{
		id = control_skip_backwards
		texture = icon_back
		name_text = qs("Skip backward")
		help_text = $wii_jam_help_skip_backward
	}
	{
		id = control_beginning
		texture = icon_jump_begin
		name_text = qs("Skip to beginning")
		help_text = $wii_jam_help_skip_to_beginning
	}
	{
		id = control_loop
		texture = icon_loop
		name_text = qs("Loop")
		help_text = $wii_jam_help_loop
	}
	{
		id = control_delete
		texture = icon_delete
		name_text = qs("Delete")
		help_text = $wii_jam_help_delete
	}
	{
		id = control_copy
		texture = icon_copy
		name_text = qs("Copy")
		help_text = $wii_jam_help_copy
	}
	{
		id = control_paste
		texture = icon_paste
		name_text = qs("Paste")
		help_text = $wii_jam_help_paste
	}
	{
		id = control_note_nudge
		texture = icon_nudge
		name_text = qs("Note Nudge")
		help_text = $wii_jam_help_note_nudge
	}
	{
		id = control_marker
		texture = icon_add_marker
		name_text = qs("Add Marker")
		alt_name_text = qs("Remove Marker")
		help_text = $wii_jam_help_remove_marker
	}
	{
		id = control_switch_instrument
		texture = icon_swap_instrument
		name_text = qs("Switch Instrument")
		help_text = $wii_jam_help_switch_instrument
	}
]
jam_control_offset = (0.0, 33.0)

script create_jam_control_bar 
	z_priority = 31
	ResolveScreenElementId \{id = {
			jam_studio_element
			child = {
				adv_record
				child = toolbar
			}
		}}
	CreateScreenElement {
		type = SpriteElement
		id = control_bg
		parent = <resolved_id>
		texture = highlighted_button
		just = [left top]
		rgba = [255 255 255 255]
		dims = (39.0, 39.0)
		rot_angle = -90
		pos = ($jam_control_bar_offset)
		z_priority = (<z_priority> + 2)
	}
	CreateScreenElement {
		type = SpriteElement
		id = selection_arrow
		parent = <resolved_id>
		texture = selection_arrow
		just = [left top]
		rgba = [255 255 255 255]
		scale = 1
		pos = (($jam_control_bar_offset + ($jam_control_selected * $jam_control_offset)) + (25.0, -28.0))
		z_priority = (<z_priority> + 5)
	}
	GetPlayerInfo ($jam_current_recording_player) controller
	CreateScreenElement {
		type = ContainerElement
		parent = <resolved_id>
		id = jam_control_container
		exclusive_device = <controller>
		scale = 1
		just = [center center]
		pos = (0.0, 0.0)
		event_handlers = [
			{pad_up jam_control_bar_up}
			{pad_down jam_control_bar_down}
			{pad_option jam_control_bar_skip_forwards}
			{pad_option2 jam_control_bar_skip_backwards}
			{pad_choose jam_control_bar_choose}
			{pad_start jam_recording_pause params = {back_to_jam_band = <back_to_jam_band>}}
			{focus jam_recording_add_user_control_helpers_on_focus}
		]
	}
	GetArraySize \{$jam_controls}
	count = 0
	<button_pos> = (25.0, 98.0)
	<y_off> = ($jam_control_offset)
	begin
	CreateScreenElement {
		type = SpriteElement
		parent = jam_control_container
		texture = toolbar_button
		just = [left top]
		rgba = [255 255 255 255]
		dims = (39.0, 39.0)
		rot_angle = -90
		pos = (<button_pos> + <count> * <y_off>)
		z_priority = (<z_priority> + 2)
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <id>
		id = ($jam_controls [<count>].id)
		texture = ($jam_controls [<count>].texture)
		just = [left top]
		scale = 1.2750001
		pos = (42.5, -2.0)
		rot_angle = 90
		z_priority = (<z_priority> + 3)
	}
	<count> = (<count> + 1)
	repeat <array_size>
	jam_studio_element :SE_SetProps control_name_text = ($jam_controls [0].name_text)
	jam_studio_element :SE_SetProps control_help_text = ($jam_controls [0].help_text)
endscript

script create_studio_now_bar 
	ResolveScreenElementId \{id = {
			jam_studio_element
			child = {
				adv_record
				child = nowbar_bg
			}
		}}
	if ScreenElementExists \{id = studio_nowbar_container}
		DestroyScreenElement \{id = studio_nowbar_container}
	endif
	CreateScreenElement {
		type = ContainerElement
		id = studio_nowbar_container
		parent = <resolved_id>
		pos = (-4.0, 12.5)
		scale = (0.78, 0.78)
		z_priority = 100
	}
	<gem_params> = {type = SpriteElement parent = studio_nowbar_container just = [center center] scale = 1 z_priority = 13}
	<drum> = 0
	<rb_drum> = 0
	GetPlayerInfo \{$jam_current_recording_player
		controller}
	if IsDrumController controller = <controller>
		if isRBDrum controller = <controller>
			<rb_drum> = 1
		endif
		<drum> = 1
	endif
	jam_menu_get_lefty \{player = $jam_current_recording_player}
	if (<drum> = 1)
		<lefty> = 0
		<gem_positions> = [
			(184.0, 24.0) ,
			(20.0, 24.0) ,
			(61.0, 24.0) ,
			(102.0, 24.0) ,
			(143.0, 24.0) ,
		]
	elseif (<lefty> = 1)
		<gem_positions> = [
			(184.0, 24.0)
			(143.0, 24.0) ,
			(102.0, 24.0) ,
			(61.0, 24.0) ,
			(20.0, 24.0) ,
		]
	else
		<gem_positions> = [
			(20.0, 24.0) ,
			(61.0, 24.0) ,
			(102.0, 24.0) ,
			(143.0, 24.0) ,
			(184.0, 24.0)
		]
	endif
	CreateScreenElement {
		<gem_params>
		texture = green_now_off
		dims = (64.0, 64.0)
		pos = (<gem_positions> [0])
	}
	CreateScreenElement {
		<gem_params>
		texture = red_now_off
		dims = (64.0, 64.0)
		pos = (<gem_positions> [1])
	}
	CreateScreenElement {
		<gem_params>
		texture = yellow_now_off
		dims = (64.0, 64.0)
		pos = (<gem_positions> [2])
	}
	CreateScreenElement {
		<gem_params>
		texture = blue_now_off
		dims = (64.0, 64.0)
		pos = (<gem_positions> [3])
	}
	if NOT (<rb_drum> = 1)
		CreateScreenElement {
			<gem_params>
			texture = orange_now_off
			dims = (64.0, 64.0)
			pos = (<gem_positions> [4])
		}
	else
		CreateScreenElement {
			<gem_params>
			texture = orange_now_off
			dims = (64.0, 64.0)
			pos = (<gem_positions> [4])
			rgba = [80 80 80 255]
		}
	endif
	<player> = ($jam_current_recording_player)
	<gem_on_params> = {type = SpriteElement parent = studio_nowbar_container just = [center center] scale = 1 z_priority = 14}
	FormatText checksumname = gem_id 'jam_now_on_gr_%s' s = <player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = green_now_on
		dims = (64.0, 64.0)
		pos = (<gem_positions> [0])
	}
	safe_hide id = <gem_id>
	FormatText checksumname = gem_id 'jam_now_on_re_%s' s = <player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = red_now_on
		dims = (64.0, 64.0)
		pos = (<gem_positions> [1])
	}
	safe_hide id = <gem_id>
	FormatText checksumname = gem_id 'jam_now_on_ye_%s' s = <player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = yellow_now_on
		dims = (64.0, 64.0)
		pos = (<gem_positions> [2])
	}
	safe_hide id = <gem_id>
	FormatText checksumname = gem_id 'jam_now_on_bl_%s' s = <player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = blue_now_on
		dims = (64.0, 64.0)
		pos = (<gem_positions> [3])
	}
	safe_hide id = <gem_id>
	FormatText checksumname = gem_id 'jam_now_on_or_%s' s = <player>
	CreateScreenElement {
		<gem_on_params>
		id = <gem_id>
		texture = orange_now_on
		dims = (64.0, 64.0)
		pos = (<gem_positions> [4])
	}
	safe_hide id = <gem_id>
endscript

script jam_highway_select_quantize 
	z_priority = 30
	jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
	jam_menu_get_lefty \{player = $jam_current_recording_player}
	GetPlayerInfo ($jam_current_recording_player) controller
	<last_note_count> = 0
	<no_snap> = 0
	begin
	<disallow_snap> = 0
	if ScreenElementExists \{id = jam_studio_element}
		jam_studio_element :GetTags
		if GotParam \{block_snap}
			<disallow_snap> = <block_snap>
		endif
	endif
	if NOT (($is_arpeggiator [$jam_current_track] = 1 || $is_drum_machine = 1) && ($jam_highway_recording = 1 && $jam_highway_step_recording != 1))
		if (<disallow_snap> = 0)
			if GuitarControllerBreak left <controller>
				if (<lefty> = 1)
					change_quantize_right
				else
					change_quantize_left
				endif
			endif
			if GuitarControllerBreak right <controller>
				if (<lefty> = 1)
					change_quantize_left
				else
					change_quantize_right
				endif
			endif
			markers_size = ($editable_jam_markers_size)
			if (<markers_size> <= 0)
				change \{no_marker_snap = 1}
			endif
			if (($no_marker_snap = 1) && ($jam_current_quantize = 0))
				change \{jam_current_quantize = 1}
				jam_studio_element :SetProps snap_text = ($jam_quantize [1].name_text)
			endif
			if (($no_precise_snap = 1) && ($jam_current_quantize = 7))
				change \{jam_current_quantize = 6}
				jam_studio_element :SetProps snap_text = ($jam_quantize [6].name_text)
			endif
		endif
	else
		change \{jam_current_quantize = 5}
		<no_snap> = 1
		jam_studio_element :SetProps \{snap_text = qs("No Snap")}
	endif
	if (<no_snap> = 1)
		if ($jam_highway_recording = 0)
			jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript
no_marker_snap = 0
no_precise_snap = 0

script change_quantize_left 
	next_quantize = ($jam_current_quantize - 1)
	GetArraySize ($jam_quantize)
	GhMix_Pad_Back_Sound
	min_quantize = 0
	if ($no_marker_snap = 1)
		<min_quantize> = 1
	endif
	max_quantize = 7
	if ($no_precise_snap = 1)
		<max_quantize> = 6
	endif
	if (<next_quantize> < <min_quantize>)
		<next_quantize> = <max_quantize>
	endif
	change jam_current_quantize = <next_quantize>
	jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
	jam_studio_element :SE_SetProps \{snap_arrow_left_scale = 2.0}
	jam_studio_element :SE_SetProps \{snap_arrow_left_scale = 1.3
		time = 0.15}
	jam_studio_element :SE_WaitProps
	BroadcastEvent \{type = ghmix_snap_changed}
endscript

script change_quantize_right 
	next_quantize = ($jam_current_quantize + 1)
	GetArraySize ($jam_quantize)
	GhMix_Pad_Back_Sound
	min_quantize = 0
	if ($no_marker_snap = 1)
		<min_quantize> = 1
	endif
	max_quantize = 7
	if ($no_precise_snap = 1)
		<max_quantize> = 6
	endif
	if (<next_quantize> > <max_quantize>)
		<next_quantize> = <min_quantize>
	endif
	change jam_current_quantize = <next_quantize>
	jam_studio_element :SetProps snap_text = ($jam_quantize [$jam_current_quantize].name_text)
	jam_studio_element :SE_SetProps \{snap_arrow_right_scale = 2.0}
	jam_studio_element :SE_SetProps \{snap_arrow_right_scale = 1.3
		time = 0.15}
	jam_studio_element :SE_WaitProps
	BroadcastEvent \{type = ghmix_snap_changed}
endscript
jam_undo_track = -1

script jam_advanced_recording_undo 
	if ($jam_undo_track < 0)
		return
	endif
	gem_array = ($jam_tracks [$jam_undo_track].gem_array)
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	old_gem_count = ($<appended_id>)
	change globalname = <appended_id> newvalue = 0
	GetJamSessionSize track = ($jam_tracks [$jam_undo_track].id)
	if (<track_size> > 0)
		begin
		DeleteJamSessionSound track = ($jam_tracks [$jam_undo_track].id) index = 0
		GetJamSessionSize track = ($jam_tracks [$jam_undo_track].id)
		if NOT (<track_size> > 0)
			break
		endif
		repeat
	endif
	FormatText \{checksumname = undo_clipboard_array
		'undo_clipboard'}
	suffix = '_size'
	AppendSuffixToChecksum Base = <undo_clipboard_array> SuffixString = <suffix>
	new_gem_count = ($<appended_id>)
	notetrack_index = 0
	if (<new_gem_count> > 0)
		begin
		GetNoteTrackItem name = <undo_clipboard_array> index = <notetrack_index>
		AddNoteTrackItem name = <gem_array> time = <gem_time> length = <gem_length> pattern = <gem_pattern>
		index = -1
		FindJamSessionSound track = undo_clipboard time = <gem_time>
		if (<index> >= 0)
			GetJamSessionSound track = undo_clipboard index = <index>
			AddJamSessionSound track = ($jam_tracks [$jam_undo_track].id) time = <time> string = <note_string> fret = <note_fret> type = <note_type> chord_type = <chord_type> effect = <effect> velocity = <velocity>
		endif
		<notetrack_index> = (<notetrack_index> + 2)
		if (<notetrack_index> >= <new_gem_count>)
			break
		endif
		repeat
	endif
	if GlobalExists name = <undo_clipboard_array> type = array
		DestroyScriptArray name = <undo_clipboard_array>
	endif
	change \{jam_undo_track = -1}
	jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = <respawn_input>
	jam_highway_reinit
endscript

script jam_clear_undo_clipboard 
	GetJamSessionSize \{track = undo_clipboard}
	if (<track_size> > 0)
		begin
		DeleteJamSessionSound \{track = undo_clipboard
			index = 0}
		GetJamSessionSize \{track = undo_clipboard}
		if NOT (<track_size> > 0)
			break
		endif
		repeat
	endif
endscript

script jam_update_undo_clipboard 
	jam_clear_undo_clipboard
	gem_array = ($jam_tracks [$jam_current_track].gem_array)
	GetArraySize ($<gem_array>)
	notetrack_size = <array_size>
	suffix = '_size'
	AppendSuffixToChecksum Base = <gem_array> SuffixString = <suffix>
	gem_count = ($<appended_id>)
	if (<notetrack_size> <= 0)
		return
	endif
	FormatText \{checksumname = undo_clipboard_array
		'undo_clipboard'}
	if GlobalExists name = <undo_clipboard_array> type = array
		DestroyScriptArray name = <undo_clipboard_array>
	endif
	CreateScriptArray name = <undo_clipboard_array> size = <notetrack_size> heap = heap_song <...>
	if (<gem_count> > 0)
		notetrack_index = 0
		begin
		GetNoteTrackItem name = <gem_array> index = <notetrack_index>
		AddNoteTrackItem name = <undo_clipboard_array> time = <gem_time> length = <gem_length> pattern = <gem_pattern>
		index = -1
		FindJamSessionSound track = ($jam_tracks [$jam_current_track].id) time = <gem_time>
		if (<index> >= 0)
			GetJamSessionSound track = ($jam_tracks [$jam_current_track].id) index = <index>
			AddJamSessionSound track = undo_clipboard time = <time> string = <note_string> fret = <note_fret> type = <note_type> chord_type = <chord_type> effect = <effect> velocity = <velocity>
		endif
		<notetrack_index> = (<notetrack_index> + 2)
		if (<notetrack_index> >= <gem_count>)
			break
		endif
		repeat
	endif
	change \{jam_undo_track = $jam_current_track}
endscript

script jam_advanced_recording_init_undo 
	if ($jam_undo_track < 0)
		<option_text_id> :SE_SetProps rgba = [50 50 50 255]
		<option_id> :SE_SetProps not_focusable
	else
		<option_text_id> :SE_SetProps rgba = ($menu_unfocus_color)
		<option_id> :SE_SetProps focusable
	endif
endscript

script jam_clear_track_check 
	GetPlayerInfo <select_player> jam_instrument
	if ($jam_advanced_record = 1)
		LaunchEvent \{type = unfocus
			target = jam_pause_container}
		FormatText TextName = dialog qs("Are you sure you want to clear the entire %s track?") s = ($jam_tracks [$jam_current_track].alt_text)
		controller = ($primary_controller)
	else
		LaunchEvent type = unfocus target = <vmenu_id>
		destroy_jam_band_menu
		FormatText TextName = dialog qs("Are you sure you want to clear the entire %s track?") s = ($jam_tracks [<jam_instrument>].alt_text)
		GetPlayerInfo <select_player> controller
	endif
	clean_up_user_control_helpers
	create_popup_warning_menu {
		title = qs("CLEAR TRACK")
		textblock = {
			text = <dialog>
			pos = (640.0, 370.0)
		}
		player_device = <controller>
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_clear_track_go_back}
				func_params = {<...>}
				text = qs("GO BACK")
			}
			{
				func = jam_clear_track
				func_params = {<...>}
				text = qs("CLEAR TRACK")
			}
		]
	}
endscript

script jam_clear_track_go_back 
	if ($jam_advanced_record = 1)
		destroy_popup_warning_menu
		set_focus_color \{rgba = [
				255
				255
				255
				255
			]}
		set_unfocus_color \{rgba = [
				210
				130
				0
				255
			]}
		jam_recording_add_user_control_helpers
		jam_band_remove_pause player_pause = <player_pause> scrolling_options = <scrolling_options> event_cont = <event_cont> select_player = <select_player> respawn_input = <respawn_input>
	else
		destroy_popup_warning_menu
		ui_event \{event = menu_refresh}
	endif
endscript

script jam_clear_track 
	GetPlayerInfo <select_player> jam_instrument
	if ($jam_advanced_record = 1)
		jam_update_undo_clipboard
		jam_delete_range \{low_bound = 0
			high_bound = $jam_highway_song_length}
		jam_highway_reinit
		jam_highway_move_beginning
		jam_update_highway_infobox
		jam_recording_update_metaview
	else
		jam_delete_range low_bound = 0 track = <jam_instrument> high_bound = $jam_highway_song_length
	endif
	jam_clear_track_go_back <...>
endscript

script destroy_jam_recording_menu 
	jam_stop_all_sound
	change \{jam_advanced_record = 0}
	destroy_popup_warning_menu
	KillSpawnedScript \{name = jam_recording_check_disconnect}
	KillSpawnedScript \{id = jam_recording_spawns}
	FormatText checksumname = jam_player_spawns 'jam_player_spawns_%s' s = ($jam_current_recording_player)
	KillSpawnedScript id = <jam_player_spawns>
	FormatText checksumname = input_spawn 'input_spawn_%s' s = ($jam_current_recording_player)
	KillSpawnedScript id = <input_spawn>
	KillSpawnedScript \{name = jam_step_wait}
	DestroyPlayerServerJamInput player = ($jam_current_recording_player)
	KillSpawnedScript \{name = fade_out_note_text}
	KillSpawnedScript \{id = jam_input_spawns}
	KillSpawnedScript \{name = guitar_jam_playback_recording}
	KillSpawnedScript \{name = guitar_jam_drum_playback}
	KillSpawnedScript \{name = jam_play_arpeggiator_loop}
	KillSpawnedScript \{name = jam_play_drum_loop}
	jam_kill_update_note_length player = ($jam_current_recording_player)
	if ScreenElementExists \{id = jam_studio_element}
		DestroyScreenElement \{id = jam_studio_element}
	endif
	jam_clear_clipboards
	FormatText \{checksumname = clipboard_array
		'clipboard'}
	if GlobalExists name = <clipboard_array> type = array
		DestroyScriptArray name = <clipboard_array>
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
	if ($jam_highway_recording_mode = 1)
	else
		end_song
	endif
	change \{jam_highway_recording_mode = 0}
	change \{jam_highway_recording = 0}
	change \{jam_highway_step_recording = 0}
endscript

script jam_recording_add_user_control_helpers_on_focus 
	if NOT ScreenElementExists \{id = user_control_container}
		jam_recording_add_user_control_helpers
	endif
endscript

script jam_recording_add_user_control_helpers \{state = null}
	clean_up_user_control_helpers
	if ($game_mode = training)
		if ScreenElementExists \{id = jam_band_container}
			<skip_button> = start
		elseif ScreenElementExists \{id = jam_studio_element}
			<skip_button> = back
		endif
		add_user_control_helper text = qs("SKIP") button = <skip_button> z = 100
	endif
	switch <state>
		case Loop
		if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
			add_user_control_helper \{text = qs("CLEAR LOOP")
				button = Yellow
				z = 100}
		endif
		add_user_control_helper \{text = qs("SET LOOP")
			button = start
			z = 100}
		add_user_control_helper \{text = qs("SELECT AREA")
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs("CANCEL")
			button = red
			z = 100}
		case playing
		add_user_control_helper \{text = qs("STOP")
			button = start
			z = 100}
		if ($jam_current_track = 3)
			add_user_control_helper \{text = qs(0xd97f21c5)
				button = back
				z = 100}
		endif
		case recording
		add_user_control_helper \{text = qs("STOP RECORDING")
			button = start
			z = 100}
		if ($jam_current_track = 3)
			add_user_control_helper \{text = qs(0xd97f21c5)
				button = back
				z = 100}
		endif
		case step_recording
		add_user_control_helper \{text = qs("HOLD TO SUSTAIN")
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs("STOP RECORDING")
			button = start
			z = 100}
		if ($jam_current_track = 3)
			add_user_control_helper \{text = qs(0xd97f21c5)
				button = back
				z = 100}
		endif
		case step_rec_skip
		add_user_control_helper \{text = qs("SKIP")
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs("DELETE NOTE")
			button = red
			z = 100}
		add_user_control_helper \{text = qs("STOP RECORDING")
			button = start
			z = 100}
		case delete
		add_user_control_helper \{text = qs("DELETE")
			button = start
			z = 100}
		add_user_control_helper \{text = qs("SELECT AREA")
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs("CANCEL")
			button = red
			z = 100}
		if GotParam \{delete_one}
			add_user_control_helper \{text = qs("DELETE ONE")
				button = Yellow
				z = 100}
		else
			add_user_control_helper \{text = qs("DELETE ALL")
				button = Yellow
				z = 100}
		endif
		case copy
		if ($jam_loop_bound_low > -1 && $jam_loop_bound_high > -1)
			add_user_control_helper \{text = qs("COPY LOOP")
				button = Blue
				z = 100}
		endif
		add_user_control_helper \{text = qs("COPY")
			button = start
			z = 100}
		add_user_control_helper \{text = qs("SELECT AREA")
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs("CANCEL")
			button = red
			z = 100}
		if GotParam \{copy_one}
			add_user_control_helper \{text = qs("COPY ONE")
				button = Yellow
				z = 100}
		else
			add_user_control_helper \{text = qs("COPY ALL TRACKS")
				button = Yellow
				z = 100}
		endif
		case paste
		add_user_control_helper \{text = qs("PASTE ONE")
			button = green
			z = 100}
		add_user_control_helper \{text = qs("DONE")
			button = red
			z = 100}
		add_user_control_helper \{text = qs("PASTE MULTIPLE")
			button = Yellow
			z = 100}
		case paste_multiple
		add_user_control_helper \{text = qs("PASTE MULTIPLE")
			button = start
			z = 100}
		add_user_control_helper \{text = qs("NUMBER OF PASTES")
			button = strumbar
			z = 100}
		add_user_control_helper \{text = qs("CANCEL")
			button = red
			z = 100}
		case nudge
		add_user_control_helper \{text = qs("NUDGE ONE")
			button = green
			z = 100}
		add_user_control_helper \{text = qs("DONE")
			button = red
			z = 100}
		add_user_control_helper \{text = qs("NUDGE ALL")
			button = Yellow
			z = 100}
		default
		if ScreenElementExists \{id = jam_studio_element}
			add_user_control_helper \{text = qs("SELECT")
				button = green
				z = 100}
			if NOT ($game_mode = training)
				add_user_control_helper \{text = qs("PAUSE")
					button = start
					z = 100}
			endif
			add_user_control_helper \{text = $wii_skip_backward
				button = Yellow
				z = 100}
			add_user_control_helper \{text = $wii_skip_forward
				button = Blue
				z = 100}
		elseif ScreenElementExists \{id = jam_band_container}
			if NOT ($game_mode = training)
				add_user_control_helper \{text = qs("PAUSE")
					button = start
					z = 100}
				add_user_control_helper \{text = qs("PALM / PERC")
					button = back
					z = 100}
			endif
		endif
	endswitch
endscript

script jam_recording_cleanup 
	song_prefix = 'editable'
	FormatText checksumname = arraylist '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	song_prefix = 'jamsession'
	FormatText checksumname = arraylist2 '%s_arraylist' s = <song_prefix> AddToStringLookup = true
	ClearJamSession
	jamsession_unload \{song_prefix = 'editable'}
endscript

script jam_recording_pause 
	if ($game_mode = training)
		return
	endif
	LaunchEvent \{type = unfocus
		target = jam_control_container}
	jam_band_pause select_player = ($jam_current_recording_player) player_cont = jam_pause_container event_cont = jam_control_container adv_record back_to_jam_band = <back_to_jam_band> shake = 0
endscript

script jam_advanced_recording_quit 
	generic_event_back \{data = {
			editing = 1
		}}
endscript

script jam_recording_create_metaview 
	begin
	if NOT ScreenElementExists \{id = jam_studio_element}
		return
	endif
	<metaview_pixels_per_second> = (($jam_recording_metaview_length) / (($jam_highway_end_time) / 1000))
	<new_pos> = (<metaview_pixels_per_second> * (($jam_highway_play_time) / 1000))
	<new_pos> = (($jam_recording_metaview_length) - <new_pos>)
	<new_pos> = ((0.0, 1.0) * <new_pos>)
	<new_pos> = (<new_pos> + (376.0, 35.0))
	jam_studio_element :SE_SetProps time_marker_pos = <new_pos>
	Wait \{10
		gameframes}
	repeat
endscript

script jam_recording_update_metaview 
endscript

script jam_recording_destroy_metaview 
	if ScreenElementExists \{id = jam_metaview_cont}
		DestroyScreenElement \{id = jam_metaview_cont}
	endif
endscript

script jam_studio_hide_tilt_meter 
	ResolveScreenElementId \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_dial
				}
			}
		}}
	pitch_indicator = <resolved_id>
	ResolveScreenElementId \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_meter
				}
			}
		}}
	pitch_meter = <resolved_id>
	if ScreenElementExists id = <pitch_indicator>
		<pitch_indicator> :SE_SetProps alpha = 0
	endif
	if ScreenElementExists id = <pitch_meter>
		<pitch_meter> :SE_SetProps alpha = 0
	endif
endscript

script jam_studio_tilt_meter 
	<player> = ($jam_current_recording_player)
	ResolveScreenElementId \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_dial
				}
			}
		}}
	pitch_indicator = <resolved_id>
	ResolveScreenElementId \{id = {
			jam_studio_element
			child = {
				adv_record
				child = {
					pitch_indicator
					child = pitch_meter
				}
			}
		}}
	pitch_meter = <resolved_id>
	GetPlayerInfo <player> jam_instrument
	switch (<jam_instrument>)
		case 0
		<tilt_var> = jam_tilt_rhythm
		case 1
		<tilt_var> = jam_tilt_lead
		case 2
		<tilt_var> = jam_tilt_bass
		case 3
		<pitch_indicator> :SE_SetProps alpha = 1
		<pitch_meter> :SE_SetProps alpha = 1 texture = pitch_meter_whole
		return
		case 4
		<tilt_var> = jam_tilt_melody
	endswitch
	<chosen_scales_array> = ($jam_track_scaleindex)
	<chosen_scale_index> = (<chosen_scales_array> [<jam_instrument>])
	<chosen_scale> = ($jam_scales_new [<chosen_scale_index>])
	if StructureContains Structure = <chosen_scale> chromatic
		<chromatic> = 1
	else
		<chromatic> = 0
	endif
	if (<chromatic> = 1)
		if (<jam_instrument> = 0)
			<pitch_indicator> :SE_SetProps alpha = 1
			<pitch_meter> :SE_SetProps alpha = 1 texture = pitch_meter
		else
			<pitch_indicator> :SE_SetProps alpha = 1
			<pitch_meter> :SE_SetProps alpha = 1 texture = pitch_meter_quarter
		endif
	else
		if (<jam_instrument> = 0)
			<pitch_indicator> :SE_SetProps alpha = 0
			<pitch_meter> :SE_SetProps alpha = 0
		else
			<pitch_indicator> :SE_SetProps alpha = 1
			<pitch_meter> :SE_SetProps alpha = 1 texture = pitch_meter
		endif
	endif
	<last_tilt> = -1
	begin
	if NOT (<last_tilt> = ($<tilt_var>))
		<last_tilt> = ($<tilt_var>)
		if ((<chromatic> = 0) || <jam_instrument> = 0)
			switch (<last_tilt>)
				case 0
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = -20
				case 1
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = 20
			endswitch
		else
			switch (<last_tilt>)
				case 0
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = -45
				case 1
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = -15
				case 2
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = 15
				case 3
				LegacyDoScreenElementMorph id = <pitch_indicator> time = 0.15 rot_angle = 45
			endswitch
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_studio_animate_mouse time = 0.1 pos = (($jam_control_bar_offset + ($jam_control_selected * $jam_control_offset)) + (25.0, -28.0)) rotation = 0.0
	LegacyDoScreenElementMorph id = selection_arrow time = <time> pos = <pos> rot_angle = <rotation>
endscript

script jam_control_bar_skip_forwards 
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> * 2)
	jam_highway_skip_forwards amount = <quantize>
	GhMix_Pad_Up_Down
endscript

script jam_control_bar_skip_backwards 
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> * 2)
	jam_highway_skip_backwards amount = <quantize>
	GhMix_Pad_Up_Down
endscript

script jam_update_curr_note_text 
	GetJamSessionSound track = ($jam_tracks [<jam_instrument>].id) index = <sound_index>
	if (<jam_instrument> != 3)
		jam_get_sample_checksum fret = <note_fret> string = <note_string> type = 0 chord_dir = 0 chord_type = 0 jam_instrument = <jam_instrument>
	endif
	switch <jam_instrument>
		case 0
		if (<note_type> >= 2)
			curr_note_text = ($jam_note_text_string_special)
		else
			if (<chord_type> = 0)
				chord_type_text = ($jam_note_text_string_power)
			elseif (<chord_type> = 3)
				chord_type_text = ($jam_note_text_string_mute)
			else
				FormatText TextName = chord_type_text qs("\L%a") a = ($rhythm_chord_types [<chord_type>])
			endif
			FormatText TextName = curr_note_text qs("\L%a %b") a = <note_text> b = <chord_type_text>
		endif
		case 1
		case 2
		num_octaves = 0
		begin
		if (<note_string> > 0)
			if (<note_string> = 4)
				<note_fret> = (<note_fret> - 8)
			else
				<note_fret> = (<note_fret> - 7)
			endif
			<note_string> = (<note_string> -1)
			<note_fret> = (<note_fret> + 12)
		endif
		if (<note_string> = 0)
			break
		endif
		repeat
		curr_octave = (<note_fret> / 12)
		CastToInteger \{curr_octave}
		FormatText TextName = curr_note_text qs("\L%a %s %b") s = ($jam_note_text_string_octave) a = <note_text> b = (<curr_octave> + 1)
		case 4
		curr_melody_note = (<note_fret> + <velocity>)
		curr_octave = (<curr_melody_note> / 12)
		CastToInteger \{curr_octave}
		FormatText TextName = curr_note_text qs("\L%a %s %b") s = ($jam_note_text_string_octave) a = <note_text> b = (<curr_octave> + 1)
		case 3
		if (<note_type> = 0)
			FormatText TextName = curr_note_text qs("\L%s (%a)") s = ($jam_note_text_string_normal) a = <velocity>
		else
			FormatText TextName = curr_note_text qs("\L%s (%a)") s = ($jam_note_text_string_perc) a = <velocity>
		endif
	endswitch
	KillSpawnedScript \{name = fade_out_note_text}
	jam_studio_element :SE_SetProps playline_note_text = <curr_note_text>
	jam_studio_element :SE_SetProps \{playline_note_alpha = 1}
endscript

script jam_clear_curr_note_text 
	if NOT ScriptIsRunning \{fade_out_note_text}
		spawnscriptnow \{fade_out_note_text}
	endif
endscript

script fade_out_note_text 
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / 2)
	Wait (<quantize> / 1000.0) seconds
	jam_studio_element :SE_SetProps \{playline_note_alpha = 0
		time = 0.25}
endscript
