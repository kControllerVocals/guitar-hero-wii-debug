
script ui_init_jam_song_wizard 
endscript
jam_auto_drum_loops_A = [
	{
		name_text = qs("\LMetal")
		Loop = Metal1_drum_loop
		drum_kit_index = 0
	}
	{
		name_text = qs("\LHip Hop")
		Loop = Hip_Hop1_drum_loop
		drum_kit_index = 3
	}
	{
		name_text = qs("\LPop")
		Loop = Pop2_drum_loop
		drum_kit_index = 2
	}
	{
		name_text = qs("\LRock")
		Loop = Rock3_drum_loop
		drum_kit_index = 1
	}
	{
		name_text = qs("\LAlternative")
		Loop = Alternative1_drum_loop
		drum_kit_index = 4
	}
	{
		name_text = qs("\LBollywood")
		Loop = andyloop2_1_drum_loop
		drum_kit_index = 12
	}
	{
		name_text = qs("\LElectro")
		Loop = andyloop1_2_drum_loop
		drum_kit_index = 6
	}
	{
		name_text = qs("\LDub")
		Loop = breakbeat4_drum_loop
		drum_kit_index = 17
	}
	{
		name_text = qs("\LBig Band")
		Loop = andyloop4_5_drum_loop
		drum_kit_index = 13
	}
	{
		name_text = qs("\LComputer")
		Loop = Hip_Hop3_drum_loop
		drum_kit_index = 10
	}
	{
		name_text = qs("\LModern")
		Loop = andyloop5_2_drum_loop
		drum_kit_index = 4
	}
	{
		name_text = qs("\LBombay")
		Loop = andyloop6_4_drum_loop
		drum_kit_index = 12
	}
	{
		name_text = qs("\LFusion")
		Loop = andyloop4_5_drum_loop
		drum_kit_index = 2
	}
	{
		name_text = qs("\LTight Blip")
		Loop = breakbeat1_drum_loop
		drum_kit_index = 11
	}
	{
		name_text = qs("\LClassic")
		Loop = Rock2_drum_loop
		drum_kit_index = 1
	}
	{
		name_text = qs("\LSluggish")
		Loop = Rock4_drum_loop
		drum_kit_index = 1
	}
	{
		name_text = qs("\LBreak")
		Loop = breakbeat9_drum_loop
		drum_kit_index = 7
	}
	{
		name_text = qs("\LHeavy")
		Loop = breakbeat8_drum_loop
		drum_kit_index = 0
	}
	{
		name_text = qs("\LJazzy")
		Loop = andyloop5_3_drum_loop
		drum_kit_index = 13
	}
	{
		name_text = qs("\LFrantic")
		Loop = andyloop6_1_drum_loop
		drum_kit_index = 2
	}
	{
		name_text = qs("\LNONE")
		Loop = none
	}
]
jam_auto_bass_loops_A = [
	{
		name_text = qs("\LMetal")
		Loop = Metal1_bass_loop
	}
	{
		name_text = qs("\LHip Hop")
		Loop = hiphop1_bass_loop
	}
	{
		name_text = qs("\LPop")
		Loop = classic_3_bass_loop
	}
	{
		name_text = qs("\LRock")
		Loop = modern_rock_3_bass_loop
	}
	{
		name_text = qs("\LFunky")
		Loop = funky_1_bass_loop
	}
	{
		name_text = qs("\LPunk")
		Loop = punky_1_bass_loop
	}
	{
		name_text = qs("\LHeavy")
		Loop = Meta3_bass_loop
	}
	{
		name_text = qs("\LModern Rock")
		Loop = modern_rock_1_bass_loop
	}
	{
		name_text = qs("\LClassic Rock")
		Loop = classic_1_bass_loop
	}
	{
		name_text = qs("\LMetal B")
		Loop = Metal2_bass_loop
	}
	{
		name_text = qs("\LHip Hop B")
		Loop = hiphop3_bass_loop
	}
	{
		name_text = qs("\LPop B")
		Loop = classic_2_bass_loop
	}
	{
		name_text = qs("\LRock B")
		Loop = classic_4_bass_loop
	}
	{
		name_text = qs("\LFunky B")
		Loop = funky_2_bass_loop
	}
	{
		name_text = qs("\LPunk B")
		Loop = modern_rock_4_bass_loop
	}
	{
		name_text = qs("\LHeavy B")
		Loop = Meta3_bass_loop
	}
	{
		name_text = qs("\LModern Rock B")
		Loop = Meta4_bass_loop
	}
	{
		name_text = qs("\LClassic Rock B")
		Loop = classic_5_bass_loop
	}
	{
		name_text = qs("\LCountry")
		Loop = country_bass_loop
	}
	{
		name_text = qs("\LNONE")
		Loop = none
	}
]

script ui_create_jam_song_wizard 
	spawnscriptnow create_jam_song_wizard_menu params = {<...>}
endscript

script create_jam_song_wizard_menu 
	change \{memcard_jamsession_actual_file_name = ''}
	printf \{qs(0xae191bfe)}
	if NOT ($target_jam_camera_prop = jam_advanced_recording)
		change \{target_jam_camera_prop = jam_song_wizard}
		Wait \{0.8
			seconds}
		SoundEvent \{event = Song_Wizard_On}
	endif
	CreateScreenElement {
		parent = root_window
		id = jam_song_wizard
		type = DescInterface
		pos = (1280.0, 0.0)
		desc = 'song_wizard'
		exclusive_device = ($primary_controller)
		bass_arrow_up_alpha = 0
		bass_arrow_down_alpha = 0
		drum_arrow_up_alpha = 0
		drum_arrow_down_alpha = 0
	}
	jam_song_wizard :SetTags \{bass_bank = 0}
	jam_song_wizard :SetTags \{drum_bank = 0}
	LaunchEvent \{type = unfocus
		target = jam_song_wizard}
	jam_song_wizard :SE_SetProps \{tempo_hilite_alpha = 0}
	jam_song_wizard :SE_SetProps \{bass_hilite_alpha = 0}
	jam_song_wizard :SE_SetProps \{drum_hilite_alpha = 0}
	jam_song_wizard :SE_SetProps \{pos = (-20.0, 0.0)
		time = 0.15}
	jam_song_wizard :SE_WaitProps
	jam_song_wizard :SE_SetProps \{pos = (15.0, 0.0)
		time = 0.1}
	jam_song_wizard :SE_WaitProps
	jam_song_wizard :SE_SetProps \{pos = (-10.0, 0.0)
		time = 0.1}
	jam_song_wizard :SE_WaitProps
	jam_song_wizard :SE_SetProps \{pos = (0.0, 0.0)
		time = 0.1}
	jam_song_wizard :SE_WaitProps
	jam_init_volumes \{no_tracks}
	jam_song_wizard :SetTags \{tempo_index = 1
		bass_index = 0
		drums_index = 0}
	if jam_song_wizard :Desc_ResolveAlias \{name = new_song_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SE_SetProps \{event_handlers = [
				{
					pad_back
					generic_event_back
				}
				{
					pad_up
					sound_options_scroll
				}
				{
					pad_down
					sound_options_scroll
				}
			]}
		if GetScreenElementChildren \{id = current_menu}
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			if (<i> = 3)
				choose_func = new_song_create_choose
			else
				choose_func = new_song_sub_menu_choose
			endif
			<current_item> :SE_SetProps {
				event_handlers = [
					{focus ui_new_song_menu_focus}
					{unfocus ui_new_song_menu_unfocus}
					{pad_choose <choose_func>}
				]
				replace_handlers
				tags = {
					index = <i>
					first_select = 1
				}
			}
			i = (<i> + 1)
			repeat <array_size>
			<current_item> = (<children> [0])
		endif
	endif
	index = 1
	begin
	if (<index> = 1)
		loop_array = jam_auto_bass_loops_A
		target_menu = bass_menu
	else
		loop_array = jam_auto_drum_loops_A
		target_menu = drums_menu
	endif
	if jam_song_wizard :Desc_ResolveAlias name = <target_menu>
		AssignAlias id = <resolved_id> alias = sub_menu
		GetArraySize ($<loop_array>)
		i = 0
		begin
		CreateScreenElement {
			type = ContainerElement
			parent = sub_menu
			dims = (100.0, 60.0)
			exclusive_device = ($primary_controller)
			event_handlers = [
				{focus new_song_sub_menu_button_focus params = {parent_menu_index = <index>}}
				{unfocus new_song_sub_menu_button_unfocus params = {parent_menu_index = <index>}}
			]
			replace_handlers
			tags = {
				index = <i>
			}
		}
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	<index> = (<index> + 1)
	repeat 2
	LaunchEvent \{type = focus
		target = current_menu
		data = {
			child_index = 3
		}}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
endscript

script jam_setup_new_song 
	change \{jam_band_new_song = 1}
	change \{jam_current_quantize = 7}
	change \{jam_current_tuning = 0}
	jam_recording_create_editable_arrays
	jam_init_scales
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
	jam_recording_setup_timesig
	jam_highway_create_fretbars
	ClearJamSession
	guitar_jam_effects_toggle_active \{jam_instrument = 0
		force_state = on}
	guitar_jam_effects_toggle_active \{jam_instrument = 1
		force_state = on}
	guitar_jam_effects_toggle_active \{jam_instrument = 2
		force_state = on}
	guitar_jam_effects_toggle_active \{jam_instrument = 4
		force_state = on}
	SetSongInfo \{genre = -1
		song_version = $jam_song_version
		downloaded = 0
		drum_kit = 0
		file_id = {
			file_id = [
				0
				0
			]
		}}
	if NOT GotParam \{no_drum}
		change \{jam_current_drum_kit = 0}
		LoadDrumKitAll drum_kit = ($drum_kits [0].string_id) percussion_kit = ($drum_kits [($jam_current_drum_kit)].percussion_string_id) async = 0
	else
		UnLoadDrumKitAll
	endif
	change \{jam_melody_pan = 0}
	change \{jam_current_melody_kit = 0}
	LoadMelodyKit \{melody_kit = 0
		async = 0}
	GetArraySize \{$jam_tracks}
	index = 0
	begin
	switch <index>
		case 0
		pan = ($jam_rhythm_pan)
		case 1
		pan = ($jam_lead_pan)
		case 2
		pan = ($jam_bass_pan)
		case 4
		pan = ($jam_melody_pan)
		default
		pan = 0
	endswitch
	SetTrackInfo track = ($jam_tracks [<index>].id) volume = 8 pan = <pan> tuning = 0 bpm = ($jam_current_bpm) effect = ($jam_current_instrument_effects [<index>])
	<index> = (<index> + 1)
	repeat <array_size>
	jam_init_volumes
	jam_init_pan
	reset_song_time \{StartTime = 0}
endscript

script ui_new_song_menu_focus 
	GetTags
	if (<index> = 3)
		if jam_song_wizard :Desc_ResolveAlias \{name = new_song_button}
			if GetScreenElementChildren id = <resolved_id>
				GetArraySize <children>
				i = 0
				begin
				<current_item> = (<children> [<i>])
				<current_item> :SE_SetProps {texture = ($jam_wizard_button_on_textures [<i>])}
				<i> = (<i> + 1)
				repeat <array_size>
			endif
			<resolved_id> :obj_spawnscript pulse_song_button
		endif
		SE_SetProps \{rgba = [
				128
				64
				0
				255
			]}
	else
		SE_SetProps \{rgba = [
				220
				140
				0
				255
			]}
	endif
endscript

script ui_new_song_menu_unfocus 
	GetTags
	if (<index> = 3)
		if jam_song_wizard :Desc_ResolveAlias \{name = new_song_button}
			if GetScreenElementChildren id = <resolved_id>
				GetArraySize <children>
				i = 0
				begin
				<current_item> = (<children> [<i>])
				<current_item> :SE_SetProps {texture = ($jam_wizard_button_off_textures [<i>])}
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
		KillSpawnedScript \{name = pulse_song_button}
		jam_song_wizard :SE_SetProps \{button_song_rgba = [
				240
				240
				240
				255
			]}
		SE_SetProps \{rgba = [
				0
				0
				0
				255
			]}
	else
		SE_SetProps \{rgba = [
				0
				0
				0
				255
			]}
	endif
endscript

script pulse_song_button 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	begin
	jam_song_wizard :SE_SetProps \{button_song_rgba = [
			255
			220
			150
			255
		]
		time = 0.5
		motion = ease_out}
	jam_song_wizard :SE_WaitProps
	jam_song_wizard :SE_SetProps \{button_song_rgba = [
			208
			144
			80
			255
		]
		time = 0.5
		motion = ease_out}
	jam_song_wizard :SE_WaitProps
	repeat
endscript

script new_song_sub_menu_choose 
	SoundEvent \{event = Sound_Options_Select}
	if NOT GotParam \{index}
		GetTags
	endif
	switch <index>
		case 0
		jam_song_wizard :SE_SetProps \{tempo_hilite_alpha = 0.6}
		target_menu = tempo_menu
		case 1
		jam_song_wizard :SE_SetProps \{bass_hilite_alpha = 0.6
			bass_bank_text_rgba = [
				220
				220
				220
				255
			]
			bass_arrow_up_alpha = 1
			bass_arrow_down_alpha = 1}
		target_menu = bass_menu
		case 2
		jam_song_wizard :SE_SetProps \{drum_hilite_alpha = 0.6
			drum_bank_text_rgba = [
				220
				220
				220
				255
			]
			drum_arrow_up_alpha = 1
			drum_arrow_down_alpha = 1}
		target_menu = drums_menu
	endswitch
	LaunchEvent \{type = unfocus
		target = current_menu}
	if (<index> = 0)
		if jam_song_wizard :Desc_ResolveAlias name = <target_menu>
			AssignAlias id = <resolved_id> alias = sub_menu
			sub_menu :Menu_GetSelectedIndex
			if (<first_select> = 1)
				<selected_index> = 1
			endif
			sub_menu :SE_SetProps {
				replace_handlers
				event_handlers = [
					{pad_back new_song_sub_menu_cancel params = {target_menu = <target_menu> parent_menu_index = <index> original_index = <selected_index>}}
					{pad_choose new_song_sub_menu_back params = {target_menu = <target_menu> parent_menu_index = <index>}}
					{pad_up sound_options_scroll}
					{pad_down sound_options_scroll}
				]
			}
			if GetScreenElementChildren \{id = sub_menu}
				GetArraySize <children>
				i = 0
				begin
				<current_item> = (<children> [<i>])
				<current_item> :SE_SetProps {
					event_handlers = [
						{focus new_song_sub_menu_button_focus params = {parent_menu_index = <index>}}
						{unfocus new_song_sub_menu_button_unfocus params = {parent_menu_index = <index>}}
					]
					replace_handlers
					tags = {
						index = <i>
					}
				}
				i = (<i> + 1)
				repeat <array_size>
				<current_item> = (<children> [0])
			endif
		endif
	else
		if jam_song_wizard :Desc_ResolveAlias name = <target_menu>
			AssignAlias id = <resolved_id> alias = sub_menu
			printf \{channel = jam_mode
				qs("\LAUTO CHOOSE")}
			sub_menu :Menu_GetSelectedIndex
			if (<selected_index> < 0)
				<selected_index> = 0
			endif
			sub_menu :SE_SetProps {
				replace_handlers
				event_handlers = [
					{pad_back new_song_sub_menu_cancel params = {target_menu = <target_menu> parent_menu_index = <index> original_index = <selected_index>}}
					{pad_choose new_song_sub_menu_back params = {target_menu = <target_menu> parent_menu_index = <index>}}
					{pad_up jam_wizard_auto_up params = {index = <index>}}
					{pad_down jam_wizard_auto_down params = {index = <index>}}
				]
			}
		endif
	endif
	if (<index> = 0 && <first_select> = 1)
		LaunchEvent \{type = focus
			target = sub_menu
			data = {
				child_index = 1
			}}
		SetTags \{first_select = 0}
	else
		LaunchEvent \{type = focus
			target = sub_menu}
	endif
endscript

script jam_wizard_auto_up 
	printf \{channel = jam_mode
		qs("\Ljam_wizard_auto_up")}
	sound_options_scroll
	KillSpawnedScript \{name = scale_auto_arrows}
	spawnscriptnow scale_auto_arrows id = jam_song_wizard_spawns params = {index = <index> up}
endscript

script jam_wizard_auto_down 
	printf \{channel = jam_mode
		qs("\Ljam_wizard_auto_down")}
	sound_options_scroll
	KillSpawnedScript \{name = scale_auto_arrows}
	spawnscriptnow scale_auto_arrows id = jam_song_wizard_spawns params = {index = <index> down}
endscript

script scale_auto_arrows \{index = 1}
	if (<index> = 1)
		if GotParam \{up}
			jam_song_wizard :SetProps \{bass_arrow_up_scale = 1.4}
			jam_song_wizard :SetProps \{bass_arrow_up_scale = 1.0
				time = 0.15}
			jam_song_wizard :SE_WaitProps
		endif
		if GotParam \{down}
			jam_song_wizard :SetProps \{bass_arrow_down_scale = 1.4}
			jam_song_wizard :SetProps \{bass_arrow_down_scale = 1.0
				time = 0.15}
			jam_song_wizard :SE_WaitProps
		endif
	else
		if GotParam \{up}
			jam_song_wizard :SetProps \{drum_arrow_up_scale = 1.4}
			jam_song_wizard :SetProps \{drum_arrow_up_scale = 1.0
				time = 0.15}
			jam_song_wizard :SE_WaitProps
		endif
		if GotParam \{down}
			jam_song_wizard :SetProps \{drum_arrow_down_scale = 1.4}
			jam_song_wizard :SetProps \{drum_arrow_down_scale = 1.0
				time = 0.15}
			jam_song_wizard :SE_WaitProps
		endif
	endif
endscript
jam_wizard_button_on_textures = [
	button_on_left
	button_on_middle
	button_on_right
]
jam_wizard_button_off_textures = [
	button_off_left
	button_off_middle
	button_off_right
]

script new_song_sub_menu_button_focus 
	GetTags
	Obj_GetID
	if (<parent_menu_index> = 0)
		SE_SetProps \{texture = button_on}
		if GetScreenElementChildren id = <ObjID>
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			if (<i> = 3)
				<current_item> :SE_SetProps {rgba = [128 , 64 , 0 , 255]}
			else
				<current_item> :SE_SetProps {texture = ($jam_wizard_button_on_textures [<i>])}
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
	jam_song_wizard :GetTags
	switch <tempo_index>
		case 0
		curr_selected_bpm = 100
		case 1
		curr_selected_bpm = 120
		case 2
		curr_selected_bpm = 140
	endswitch
	GetTags
	switch <parent_menu_index>
		case 0
		KillSpawnedScript \{name = jam_recording_metronome}
		switch <index>
			case 0
			tempo_bpm = 100
			case 1
			tempo_bpm = 120
			case 2
			tempo_bpm = 140
		endswitch
		reset_song_time \{StartTime = 0}
		SoundEvent \{event = Jam_Mode_Metronome
			downbeat = 1}
		spawnscriptnow jam_recording_metronome id = jam_song_wizard_spawns params = {bpm = <tempo_bpm> time = 0 sound_only}
		case 1
		KillSpawnedScript \{name = jam_auto_bass_preview}
		if NOT (<index> = 0)
			jam_song_wizard :SetProps bass_text = ($jam_auto_bass_loops_A [(<index> - 1)].name_text)
			reset_song_time \{StartTime = 0}
			spawnscriptnow jam_auto_bass_preview id = jam_song_wizard_spawns params = {bass_loop = ($jam_auto_bass_loops_A [(<index> - 1)].Loop) bpm = <curr_selected_bpm>}
		else
			jam_song_wizard :SetProps \{bass_text = qs("NONE")}
		endif
		case 2
		KillSpawnedScript \{name = jam_play_drum_loop}
		if NOT (<index> = 0)
			jam_song_wizard :SetProps drum_text = ($jam_auto_drum_loops_A [(<index> - 1)].name_text)
			change jam_current_drum_kit = ($jam_auto_drum_loops_A [(<index> - 1)].drum_kit_index)
			LoadDrumKitAll drum_kit = ($drum_kits [($jam_current_drum_kit)].string_id) async = 0
			reset_song_time \{StartTime = 0}
			spawnscriptnow jam_play_drum_loop id = jam_song_wizard_spawns params = {loop_velocity ignore_touch drum_loop = ($jam_auto_drum_loops_A [(<index> - 1)].Loop) bpm = <curr_selected_bpm> loop_repeat = 1 time = 0}
		else
			jam_song_wizard :SetProps \{drum_text = qs("NONE")}
		endif
	endswitch
endscript

script new_song_sub_menu_button_unfocus 
	Obj_GetID
	if (<parent_menu_index> = 0)
		SE_SetProps \{texture = button_off}
		if GetScreenElementChildren id = <ObjID>
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			if (<i> = 3)
				<current_item> :SE_SetProps {rgba = [100 , 100 , 100 , 255]}
			else
				<current_item> :SE_SetProps {texture = ($jam_wizard_button_off_textures [<i>])}
			endif
			<i> = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script new_song_sub_menu_back 
	SoundEvent \{event = Recording_Start}
	GetTags
	switch <parent_menu_index>
		case 0
		jam_song_wizard :SetTags {tempo_index = <tag_selected_index>}
		KillSpawnedScript \{name = jam_recording_metronome}
		case 1
		jam_song_wizard :SE_SetProps \{bass_arrow_up_alpha = 0
			bass_arrow_down_alpha = 0}
		jam_song_wizard :SetTags {bass_index = <tag_selected_index>}
		KillSpawnedScript \{name = jam_auto_bass_preview}
		case 2
		jam_song_wizard :SE_SetProps \{drum_arrow_up_alpha = 0
			drum_arrow_down_alpha = 0}
		jam_song_wizard :SetTags {drums_index = <tag_selected_index>}
		KillSpawnedScript \{name = jam_play_drum_loop}
	endswitch
	LaunchEvent \{type = unfocus
		target = sub_menu}
	if GetScreenElementChildren \{id = sub_menu}
		if (<parent_menu_index> = 0)
			(<children> [<tag_selected_index>]) :SE_SetProps texture = button_on
			if GetScreenElementChildren id = (<children> [<tag_selected_index>])
				GetArraySize <children>
				i = 0
				begin
				<current_item> = (<children> [<i>])
				if (<i> = 3)
					<current_item> :SE_SetProps {rgba = [128 , 64 , 0 , 255]}
				else
					<current_item> :SE_SetProps {texture = ($jam_wizard_button_on_textures [<i>])}
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			endif
		endif
	endif
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script new_song_sub_menu_cancel 
	printstruct channel = jam_mode <...>
	SoundEvent \{event = Recording_Stop}
	GetTags
	LaunchEvent \{type = unfocus
		target = sub_menu}
	LaunchEvent type = focus target = sub_menu data = {child_index = <original_index>}
	LaunchEvent \{type = unfocus
		target = sub_menu}
	switch <parent_menu_index>
		case 0
		KillSpawnedScript \{name = jam_recording_metronome}
		case 1
		jam_song_wizard :SE_SetProps \{bass_arrow_up_alpha = 0
			bass_arrow_down_alpha = 0}
		KillSpawnedScript \{name = jam_auto_bass_preview}
		case 2
		jam_song_wizard :SE_SetProps \{drum_arrow_up_alpha = 0
			drum_arrow_down_alpha = 0}
		KillSpawnedScript \{name = jam_play_drum_loop}
	endswitch
	if GetScreenElementChildren \{id = sub_menu}
		if (<parent_menu_index> = 0)
			if GetScreenElementChildren id = (<children> [<tag_selected_index>])
				GetArraySize <children>
				i = 0
				begin
				<current_item> = (<children> [<i>])
				if (<i> = 3)
					<current_item> :SE_SetProps {rgba = [100 , 100 , 100 , 255]}
				else
					<current_item> :SE_SetProps {texture = ($jam_wizard_button_off_textures [<i>])}
				endif
				<i> = (<i> + 1)
				repeat <array_size>
			endif
			if GetScreenElementChildren \{id = sub_menu}
				if GetScreenElementChildren id = (<children> [<original_index>])
					GetArraySize <children>
					i = 0
					begin
					<current_item> = (<children> [<i>])
					if (<i> = 3)
						<current_item> :SE_SetProps {rgba = [128 , 64 , 0 , 255]}
					else
						<current_item> :SE_SetProps {texture = ($jam_wizard_button_on_textures [<i>])}
					endif
					<i> = (<i> + 1)
					repeat <array_size>
				endif
			endif
		else
			if (<parent_menu_index> = 1)
				if NOT (<original_index> = 0)
					jam_song_wizard :SetProps bass_text = ($jam_auto_bass_loops_A [(<original_index> - 1)].name_text)
				else
					jam_song_wizard :SetProps \{bass_text = qs("NONE")}
				endif
			else
				if NOT (<original_index> = 0)
					jam_song_wizard :SetProps drum_text = ($jam_auto_drum_loops_A [(<original_index> - 1)].name_text)
				else
					jam_song_wizard :SetProps \{drum_text = qs("NONE")}
				endif
			endif
		endif
	endif
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script new_song_create_choose 
	LaunchEvent \{type = unfocus
		target = current_menu}
	SoundEvent \{event = Recording_Start}
	jam_song_wizard :GetTags
	spawnscriptnow \{jam_wizard_show_loading_screen
		id = jam_song_wizard_spawns}
	Wait \{1
		second}
	switch <tempo_index>
		case 0
		change \{jam_current_bpm = 100}
		case 1
		change \{jam_current_bpm = 120}
		case 2
		change \{jam_current_bpm = 140}
	endswitch
	jam_setup_new_song \{no_drum}
	SetTrackInfo track = rhythm bpm = ($jam_current_bpm)
	if NOT (<bass_index> = 0)
		jam_copy_bass_loop_to_track bass_loop = ($jam_auto_bass_loops_A [(<bass_index> - 1)].Loop) bpm = ($jam_current_bpm)
	endif
	if NOT (<drums_index> = 0)
		change jam_current_drum_kit = ($jam_auto_drum_loops_A [(<drums_index> - 1)].drum_kit_index)
		jam_copy_drum_loop_to_track drum_loop = ($jam_auto_drum_loops_A [(<drums_index> - 1)].Loop) bpm = ($jam_current_bpm)
		SetSongInfo \{drum_kit = $jam_current_drum_kit}
	endif
	Wait \{1
		seconds}
	LoadDrumKitAll drum_kit = ($drum_kits [($jam_current_drum_kit)].string_id) percussion_kit = ($drum_kits [($jam_current_drum_kit)].percussion_string_id) async = 0
	generic_event_choose \{state = UIstate_jam_band}
endscript

script jam_copy_drum_loop_to_track \{bpm = 120}
	loop_midi_notes = [38 46 48 49 45 36]
	if NOT GlobalExists name = <drum_loop> type = array
		return
	endif
	GetArraySize ($<drum_loop>)
	jam_drum_loop_bpm = 125.0
	time_scale_percentage = (<jam_drum_loop_bpm> / <bpm>)
	ms_per_beat = (60000.0 / <bpm>)
	ms_per_loop = (<ms_per_beat> * (4 * 4))
	last_fretbar_time = ($editable_fretbars [(($editable_fretbars_size) - 17)])
	index = 0
	num_loops = 0
	begin
	note_time = ($<drum_loop> [<index>] [0])
	<note_time> = (<note_time> * <time_scale_percentage>)
	<note_time> = (<note_time> + (<num_loops> * <ms_per_loop>))
	note_type = ($<drum_loop> [<index>] [1])
	note_velocity = ($<drum_loop> [<index>] [2])
	switch <note_type>
		case (<loop_midi_notes> [0])
		<hold_pattern> = 65536
		case (<loop_midi_notes> [1])
		<hold_pattern> = 4096
		case (<loop_midi_notes> [2])
		<hold_pattern> = 256
		case (<loop_midi_notes> [3])
		<hold_pattern> = 16
		case (<loop_midi_notes> [4])
		<hold_pattern> = 1
		case (<loop_midi_notes> [5])
		<hold_pattern> = 1048576
	endswitch
	if (<note_time> >= <last_fretbar_time>)
		break
	endif
	jam_input_drum_sound velocity = <note_velocity> hold_pattern = <hold_pattern> time = <note_time> auto
	<index> = (<index> + 1)
	if (<index> >= <array_size>)
		<num_loops> = (<num_loops> + 1)
		<index> = 0
	endif
	repeat
endscript

script jam_copy_bass_loop_to_track \{bpm = 120}
	if NOT GlobalExists name = <bass_loop> type = array
		return
	endif
	GetArraySize ($<bass_loop>)
	jam_bass_loop_bpm = 125.0
	time_scale_percentage = (<jam_bass_loop_bpm> / <bpm>)
	ms_per_beat = (60000.0 / <bpm>)
	ms_per_loop = (<ms_per_beat> * (4 * 4))
	last_fretbar_time = ($editable_fretbars [(($editable_fretbars_size) - 17)])
	bass_index = 0
	num_loops = 0
	note_count = 0
	begin
	note_time = ($<bass_loop> [<bass_index>] [0])
	<note_time> = (<note_time> * <time_scale_percentage>)
	<note_time> = (<note_time> + (<num_loops> * <ms_per_loop>))
	CastToInteger \{note_time}
	note_type = ($<bass_loop> [<bass_index>] [1])
	note_velocity = ($<bass_loop> [<bass_index>] [2])
	note_length = ($<bass_loop> [<bass_index>] [3])
	<note_length> = (<note_length> * <time_scale_percentage>)
	CastToInteger \{note_length}
	if (<note_time> >= <last_fretbar_time>)
		break
	endif
	if (<note_count> >= (($gemarraysize) - 1))
		break
	endif
	quantize_to = ($jam_quantize [$jam_current_quantize].value)
	ms_per_beat = (60000.0 / $jam_current_bpm)
	quantize = (<ms_per_beat> / <quantize_to>)
	intervals = (<note_time> / <quantize>)
	CastToInteger \{intervals}
	new_time = (<intervals> * <quantize>)
	time_before = (<note_time> - <new_time>)
	time_after = ((<new_time> + <quantize>) - <note_time>)
	if (<time_after> <= <time_before>)
		<new_time> = (<new_time> + <quantize>)
	endif
	CastToInteger \{new_time}
	jam_get_bass_string_fret midi_note = <note_type>
	type = 0
	if (<note_velocity> <= 1)
		<type> = 3
	endif
	AddJamSessionSound track = ($jam_tracks [2].id) time = <new_time> string = <string> fret = <fret> type = <type> effect = 0 chord_type = 0 velocity = 127
	gem_array = ($jam_tracks [2].gem_array)
	AddNoteTrackItem name = <gem_array> time = <new_time> length = <note_length> pattern = <pattern>
	<bass_index> = (<bass_index> + 1)
	<note_count> = (<note_count> + 1)
	if (<bass_index> >= <array_size>)
		<num_loops> = (<num_loops> + 1)
		<bass_index> = 0
	endif
	repeat
endscript

script jam_auto_bass_preview \{bpm = 120}
	curr_song_time = 0
	if NOT GlobalExists name = <bass_loop> type = array
		return
	endif
	GetArraySize ($<bass_loop>)
	jam_bass_loop_bpm = 125.0
	time_scale_percentage = (<jam_bass_loop_bpm> / <bpm>)
	ms_per_beat = (60000.0 / <bpm>)
	ms_per_loop = (<ms_per_beat> * (4 * 4))
	index = 0
	begin
	GetSongTimeMs
	CastToInteger \{time}
	curr_song_time = <time>
	note_time = ($<bass_loop> [<index>] [0])
	<note_time> = (<note_time> * <time_scale_percentage>)
	note_type = ($<bass_loop> [<index>] [1])
	note_velocity = ($<bass_loop> [<index>] [2])
	note_length = ($<bass_loop> [<index>] [3])
	<note_length> = (<note_length> * <time_scale_percentage>)
	CastToInteger \{note_length}
	if (<curr_song_time> >= <note_time>)
		KillSpawnedScript \{name = jam_auto_bass_stop_note}
		if (<note_velocity> = 0)
			jam_auto_bass_play_note midi_note = <note_type> type = 3
		else
			jam_auto_bass_play_note midi_note = <note_type> type = 0
		endif
		spawnscriptnow jam_auto_bass_stop_note id = jam_song_wizard_spawns params = {note_length = <note_length>}
		<index> = (<index> + 1)
	endif
	if (<index> >= <array_size>)
		begin
		GetSongTimeMs
		CastToInteger \{time}
		curr_song_time = <time>
		if (<curr_song_time> >= <ms_per_loop>)
			reset_song_time \{StartTime = 1}
			curr_song_time = 0
			index = 0
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script jam_auto_bass_stop_note 
	Wait (<note_length> / 1000.0) seconds
	StopSound \{$jam_input_current_bass
		fade_type = linear
		fade_time = $jam_fade_time}
endscript

script jam_auto_bass_play_note 
	if (<midi_note> < 64)
		printf \{channel = jam_mode
			qs("\LBASS MIDI NOTE OUT OF RANGE")}
	endif
	jam_get_bass_string_fret midi_note = <midi_note>
	jam_get_sample_checksum string = <string> fret = <fret> type = <type> jam_instrument = 2
	StopSound \{$jam_input_current_bass
		fade_type = linear
		fade_time = 0.05}
	PlaySound <sample_checksum> pitch = (<pitch_shift> + (($jam_current_tuning) / 10.0)) vol = 5 buss = JamMode_Bass send_vol2 = -24
	change jam_input_current_bass = <sample_checksum>
endscript

script jam_get_bass_string_fret 
	fret = (<midi_note> - 64)
	orig_fret = <fret>
	string = 0
	begin
	if (<fret> > 4)
		fret = (<fret> - 5)
	else
		break
	endif
	<string> = (<string> + 1)
	repeat 3
	Mod a = <orig_fret> b = 6
	gem_patterns = [32 1 2 4 8 16]
	pattern = (<gem_patterns> [<Mod>])
	return fret = <fret> string = <string> pattern = <pattern>
endscript

script jam_wizard_show_loading_screen 
	clean_up_user_control_helpers
	spawnscriptnow \{jam_wizard_update_loading_text
		id = jam_song_wizard_spawns}
	spawnscriptnow \{jam_wizard_animate_loading_image
		id = jam_song_wizard_spawns}
	jam_song_wizard :SetProps \{loading_alpha = 1
		time = 0.3}
	jam_song_wizard :SE_WaitProps
endscript

script jam_wizard_remove_loading_screen 
	jam_song_wizard :SetProps \{loading_alpha = 0
		time = 0.3}
	jam_song_wizard :SE_WaitProps
	KillSpawnedScript \{name = ghtunes_update_loading_text}
	KillSpawnedScript \{name = jam_wizard_animate_loading_image}
endscript

script jam_wizard_animate_loading_image 
	time_between = 0.15
	if jam_song_wizard :Desc_ResolveAlias \{name = lightbar}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			<current_item> :SE_SetProps {texture = loading_light_on}
			Wait <time_between> seconds
			<current_item> :SE_SetProps {texture = loading_light_off}
			<i> = (<i> + 1)
			if (<i> = <array_size>)
				<i> = 0
			endif
			repeat
		endif
	endif
endscript

script jam_wizard_update_loading_text 
	time_between = 0.3
	loading_text_base = qs("Creating Song")
	period_array = [qs("") qs("\L.") qs("\L..") qs("\L...")]
	count = 0
	begin
	FormatText TextName = loading_text qs("\L%s%a") s = <loading_text_base> a = (<period_array> [<count>])
	jam_song_wizard :SetProps loading_text = <loading_text>
	Wait <time_between> seconds
	<count> = (<count> + 1)
	if (<count> > 3)
		<count> = 0
	endif
	repeat
endscript

script ui_destroy_jam_song_wizard 
	spawnscriptnow destroy_jam_song_wizard_menu params = {<...>}
endscript

script destroy_jam_song_wizard_menu 
	KillSpawnedScript \{name = create_jam_song_wizard_menu}
	SoundEvent \{event = Song_Wizard_Off}
	KillSpawnedScript \{id = jam_song_wizard_spawns}
	clean_up_user_control_helpers
	jam_song_wizard :SE_SetProps \{pos = (1280.0, 0.0)
		time = 0.15}
	jam_song_wizard :SE_WaitProps
	if ScreenElementExists \{id = jam_song_wizard}
		DestroyScreenElement \{id = jam_song_wizard}
	endif
endscript

script ui_deinit_jam_song_wizard 
endscript
