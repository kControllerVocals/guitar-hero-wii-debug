setting_up_freestyle = 0
freestyle_highway_position = (0.0, 50.0)
freestyle_highway_gem_masks = [
	65536
	4096
	256
	16
	1
	0
]
freestyle_highway_gem_names = [
	green
	red
	Yellow
	Blue
	Orange
	white
]
freestyle_highway_button_names = [
	qs(0x996060a6)
	qs(0xaed586b2)
	qs(0x4d215f79)
	qs(0xe41794e3)
	qs(0x51b9eaae)
	qs(0xd3a272f7)
]
freestyle_fretbars = [
]
freestyle_show_small_fretbars = 0
freestyle_purple_spawn_scale = (0.125, 0.25)
freestyle_catcher_center = (639.0, 478.0)
freestyle_catcher_gem_offset = 48

script freestyle_setup_highway \{player = 1
		StartTime = 0
		practice_intro = 0
		training_mode = 0
		endtime = 99999999
		devil_finish_restart = 0
		end_credits_restart = 0
		loading_transition = 0}
	change \{setting_up_freestyle = 1}
	change \{playing_song = 1}
	mark_unsafe_for_shutdown
	Menu_Music_Off \{setflag = 1}
	player = 1
	FormatText checksumname = player_status 'player%i_status' i = <player> AddToStringLookup
	change structurename = <player_status> part = guitar
	FormatText TextName = player_text 'p%i' i = <player> AddToStringLookup
	setup_hud <...>
	generate_pos_table player = <player>
	SetScreenElementLock \{id = root_window
		off}
	get_num_non_vocals_players
	get_non_vocalist_player_number player = <player>
	get_highway_pos_and_scale num_non_vocals_players = 2 non_vocalist_player = 1 player = <player>
	CreateScreenElement \{id = freestyle_highway_container
		type = ContainerElement
		parent = freestyle_root
		rgba = [
			255
			255
			255
			255
		]
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		internal_just = [
			center
			center
		]}
	<container_pos> = (<pos> + (0.0, 720.0))
	FormatText checksumname = container_id 'gem_container%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		type = ContainerElement
		id = <container_id>
		parent = freestyle_highway_container
		pos = <container_pos>
		just = [left top]
		scale = <scale>
		z_priority = 0
	}
	pos_table = ($highway_pos_table [(<player> -1)])
	hpos = ((640.0 - ((<pos_table>.highway_top_width) / 2.0)) * (1.0, 0.0))
	hdims = ((<pos_table>.highway_top_width) * (1.0, 0.0))
	<highway_material> = ($<player_status>.highway_material)
	highway_pair = (<player> * (1.0, 0.0) + $current_num_players * (0.0, 1.0))
	spawnscriptnow freestyle_update_highway_scroll_speed params = {<...>}
	pos = ((640 * (1.0, 0.0)) + ((<pos_table>.highway_playline) * (0.0, 1.0)))
	now_scale = (((<pos_table>.nowbar_scale_x) * (1.0, 0.0)) + ((<pos_table>.nowbar_scale_y) * (0.0, 1.0)))
	lpos = (($sidebar_x [(<player> -1)] * (1.0, 0.0)) + ($sidebar_y [(<player> -1)] * (0.0, 1.0)))
	langle = ($sidebar_angle [(<player> -1)])
	rpos = ((((640.0 - $sidebar_x [(<player> -1)]) + 640.0) * (1.0, 0.0)) + ($sidebar_y [(<player> -1)] * (0.0, 1.0)))
	rangle = (0.0 - ($sidebar_angle [(<player> -1)]))
	scale = (((<pos_table>.sidebar_x_scale) * (1.0, 0.0)) + ((<pos_table>.sidebar_y_scale) * (0.0, 1.0)))
	rscale = (((0 - (<pos_table>.sidebar_x_scale)) * (1.0, 0.0)) + ((<pos_table>.sidebar_y_scale) * (0.0, 1.0)))
	FormatText checksumname = cont 'sidebar_container_left%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		type = ContainerElement
		id = <cont>
		parent = <container_id>
		pos = <lpos>
		rot_angle = <langle>
		just = [center bottom]
		z_priority = 3
	}
	FormatText checksumname = name 'sidebar_left%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		type = SpriteElement
		id = <name>
		parent = <cont>
		material = sys_sidebar2D_sys_sidebar2D
		rgba = [255 255 255 255]
		pos = (0.0, 0.0)
		scale = <scale>
		just = [center bottom]
		z_priority = 3
	}
	Set2DHighwayFade start = <fs> end = <fe> id = <name> player = <player>
	freestyle_starpower <...>
	GetArraySize \{$gem_colors}
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	if StructureContains Structure = (($button_up_models [(<player> -1)]).<color>) name = name
		if ($<player_status>.lefthanded_button_ups = 1)
			<pos2d> = (($button_up_models [(<player> -1)]).<color>.left_pos_2d)
		else
			<pos2d> = (($button_up_models [(<player> -1)]).<color>.pos_2d)
		endif
		centerpos = ($freestyle_catcher_center)
		offset = ($freestyle_catcher_gem_offset)
		if (<color> = white)
			<offset> = 0
		endif
		<pos> = (<centerpos> + ((<offset> * (<array_count> -2)) * (1.0, 0.0)))
		if ($<player_status>.lefthanded_button_ups = 1)
			<playline_scale> = (((0 - <now_scale>.(1.0, 0.0)) * (1.0, 0.0)) + (<now_scale>.(0.0, 1.0) * (0.0, 1.0)))
		else
			<playline_scale> = <now_scale>
		endif
		<color_string> = ($gem_colors_text [<array_count>])
		FormatText checksumname = name_base '%s_base%p' s = <color_string> p = <player_text> AddToStringLookup = true
		FormatText checksumname = name_string '%s_string' s = <color_string> AddToStringLookup = true
		FormatText checksumname = name_up '%s_up' s = <color_string> AddToStringLookup = true
		FormatText checksumname = name_down '%s_down' s = <color_string> AddToStringLookup = true
		FormatText checksumname = name_flash '%s_flash' s = <color_string> AddToStringLookup = true
		FormatText checksumname = mat_up 'FreestyleNoteCatcher%sOff' s = <color_string> AddToStringLookup = true
		FormatText checksumname = mat_down 'FreestyleNoteCatcher%sOn' s = <color_string> AddToStringLookup = true
		CreateScreenElement {
			type = ContainerElement
			id = <name_base>
			parent = <container_id>
			pos = <pos>
			just = [center bottom]
			internal_just = [center bottom]
			scale = 1
		}
		CreateScreenElement {
			type = ContainerElement
			id = <name_flash>
			parent = <name_base>
			pos = (0.0, 0.0)
			z_priority = 3.9
		}
		if NOT (<color> = white)
			CreateScreenElement {
				type = SpriteElement
				id = <name_up>
				parent = <name_base>
				material = <mat_up>
				rgba = [255 255 255 255]
				pos = (0.0, 0.0)
				just = [center bottom]
				z_priority = 3.6
				hide
			}
			CreateScreenElement {
				type = SpriteElement
				id = <name_down>
				parent = <name_base>
				material = <mat_down>
				rgba = [255 255 255 255]
				pos = (0.0, 0.0)
				just = [center bottom]
				z_priority = 3.6
			}
			if (<array_count> < <array_size>)
				string_pos2d = ((($button_up_models [(<player> -1)]).<color>.pos_2d) + ((-12.0 + (6.0 * <array_count>)) * (1.0, 0.0)))
				<string_scale> = (((<pos_table>.string_scale_x) * (1.0, 0.0)) + ((<pos_table>.string_scale_y) * (0.0, 1.0)))
				<string_pos2d> = (<string_pos2d> + (0.0, 40.0))
				CreateScreenElement {
					type = SpriteElement
					id = <name_string>
					parent = <container_id>
					material = sys_String01_sys_String01
					rgba = [200 200 200 200]
					scale = <string_scale>
					rot_angle = (($button_models [(<player> -1)]).<color>.Angle)
					pos = <string_pos2d>
					just = [center bottom]
					z_priority = 2
				}
			endif
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	setup_highway_move <...>
	create_highway_prepass <...>
	SetScreenElementLock \{id = root_window
		on}
	if NOT ScreenElementExists \{id = dead_particle_container}
		CreateScreenElement \{type = ContainerElement
			id = dead_particle_container
			parent = root_window
			pos = (0.0, 0.0)}
		Init2DParticles \{parent = dead_particle_container}
	endif
	Transition_Play \{type = fastintro}
	setslomo \{$current_speedfactor}
	mark_safe_for_shutdown
	ResetWhammyCachedRows
	printf \{qs(0x898f16b5)}
endscript

script freestyle_update_highway_scroll_speed 
	begin
	GetMetronomeLengthOfBeat
	if (<length_of_beat> > 0.0)
		break
	endif
	WaitOneGameFrame
	repeat
	FormatText \{checksumname = highway_name
		'Highway_2Dp1'
		AddToStringLookup = true}
	CreateScreenElement {
		type = SpriteElement
		id = <highway_name>
		parent = <container_id>
		texture = FreestyleHighwayBG
		clonematerial = <highway_material>
		pos = <hpos>
		dims = <hdims>
		just = [left left]
		z_priority = 0.1
		highway_player = <player>
		highway_speed = 0.5
	}
	if ($freestyle_music_type = metal)
		change structurename = player1_status scroll_time = ((((<length_of_beat>) / 1000.0) * 2.0) + 1.0)
		change \{freestyle_show_small_fretbars = 1}
		change \{freestyle_beat_division = 0.5}
		change \{freestyle_note_offset = 0.75}
		change \{freestyle_fretbar_offset = 0.22}
	elseif ($freestyle_music_type = Rock)
		change structurename = player1_status scroll_time = ((((<length_of_beat>) / 1000.0) * 4.0) + 1.0)
		change \{freestyle_show_small_fretbars = 0}
		change \{freestyle_beat_division = 0.5}
		change \{freestyle_note_offset = 1.15}
		change \{freestyle_fretbar_offset = 0.22}
	elseif ($freestyle_music_type = Blues)
		change structurename = player1_status scroll_time = ((((<length_of_beat>) / 1000.0) * 2.0) + 1.0)
		change \{freestyle_show_small_fretbars = 1}
		change freestyle_beat_division = (1.0 / 3.0)
		change \{freestyle_note_offset = 1.15}
		change \{freestyle_fretbar_offset = 0.5}
	else
		printf \{qs(0x8515ac5e)}
	endif
	highway_speed = (0.0 - ((<pos_table>.gHighwayTiling) / ($player1_status.scroll_time - $destroy_time)))
	Set2DHighwaySpeed Speed = <highway_speed> id = <highway_name> player_status = player1_status player = <player>
	fe = ((<pos_table>.highway_playline) - (<pos_table>.highway_height))
	fs = (<fe> + (<pos_table>.highway_fade))
	Set2DHighwayFade start = <fs> end = <fe> id = <highway_name> player = <player>
endscript

script freestyle_starpower 
	FormatText checksumname = cont 'starpower_container_left%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		type = ContainerElement
		id = <cont>
		parent = <container_id>
		pos = <lpos>
		rot_angle = <langle>
		just = [center bottom]
		z_priority = 3
	}
	<starpower_fx_scale> = (<pos_table>.starpower_fx_scale)
	GetPlayerInfo <player> part
	if (<part> = drum)
		lightning_rgba = [128 0 0 128]
		lightning_material = sys_Big_Bolt01_Red_sys_Big_Bolt01_Red
	else
		lightning_rgba = [0 0 128 128]
		lightning_material = sys_Big_Bolt01_sys_Big_Bolt01
	endif
	starpower_pos = (((-55.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((55.0 * <starpower_fx_scale>) * (0.0, 1.0)))
	starpower_scale = (((1.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((1.1 * <starpower_fx_scale>) * (0.0, 1.0)))
	<starpower_scale> = (4.0 * <starpower_scale>)
	FormatText checksumname = name 'sidebar_left_glow%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		type = SpriteElement
		id = <name>
		parent = <cont>
		material = sys_Starpower_SDGLOW_sys_Starpower_SDGLOW
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		scale = <starpower_scale>
		just = [center bottom]
		z_priority = 0
	}
	sidebar_lightning_animation_frame_length = 0.08
	starpower_pos = (((0.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((0.0 * <starpower_fx_scale>) * (0.0, 1.0)))
	starpower_scale = (((2.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((0.9 * <starpower_fx_scale>) * (0.0, 1.0)))
	FormatText checksumname = name 'sidebar_left_Lightning02%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		type = SpriteElement
		id = <name>
		parent = <cont>
		material = <lightning_material>
		blend = Add
		use_animated_uvs = true
		top_down_v
		frame_length = <sidebar_lightning_animation_frame_length>
		num_uv_frames = (8.0, 1.0)
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		rot_angle = (180)
		scale = <starpower_scale>
		just = [center top]
		z_priority = 0.02
	}
	FormatText checksumname = cont 'sidebar_container_right%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		type = ContainerElement
		id = <cont>
		parent = <container_id>
		pos = <rpos>
		rot_angle = <rangle>
		just = [center bottom]
		z_priority = 3
	}
	FormatText checksumname = name 'sidebar_right%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		type = SpriteElement
		id = <name>
		parent = <cont>
		material = sys_sidebar2D_sys_sidebar2D
		rgba = [255 255 255 255]
		pos = (0.0, 0.0)
		scale = <rscale>
		just = [center bottom]
		z_priority = 3
	}
	Set2DHighwayFade start = <fs> end = <fe> id = <name> player = <player>
	FormatText checksumname = cont 'starpower_container_right%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		type = ContainerElement
		id = <cont>
		parent = <container_id>
		pos = <rpos>
		rot_angle = <rangle>
		just = [center bottom]
		z_priority = 3
	}
	starpower_pos = (((55.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((55.0 * <starpower_fx_scale>) * (0.0, 1.0)))
	starpower_scale = (((-1.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((1.1 * <starpower_fx_scale>) * (0.0, 1.0)))
	<starpower_scale> = (4.0 * <starpower_scale>)
	FormatText checksumname = name 'sidebar_Right_glow%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		type = SpriteElement
		id = <name>
		parent = <cont>
		material = sys_Starpower_SDGLOW_sys_Starpower_SDGLOW
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		scale = <starpower_scale>
		just = [center bottom]
		z_priority = 0
	}
	starpower_pos = (((0.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((0.0 * <starpower_fx_scale>) * (0.0, 1.0)))
	starpower_scale = (((2.0 * <starpower_fx_scale>) * (1.0, 0.0)) + ((0.9 * <starpower_fx_scale>) * (0.0, 1.0)))
	FormatText checksumname = name 'sidebar_Right_Lightning02%p' p = <player_text> AddToStringLookup = true
	CreateScreenElement {
		type = SpriteElement
		id = <name>
		parent = <cont>
		material = <lightning_material>
		blend = Add
		use_animated_uvs = true
		top_down_v
		frame_length = <sidebar_lightning_animation_frame_length>
		num_uv_frames = (8.0, 1.0)
		rgba = [255 255 255 255]
		pos = <starpower_pos>
		rot_angle = (180)
		scale = <starpower_scale>
		just = [center top]
		z_priority = 0.02
	}
	FormatText checksumname = cont 'starpower_container_left%p' p = <player_text> AddToStringLookup = true
	LegacyDoScreenElementMorph id = <cont> alpha = 0
	FormatText checksumname = cont 'starpower_container_right%p' p = <player_text> AddToStringLookup = true
	LegacyDoScreenElementMorph id = <cont> alpha = 0
endscript

script freestyle_start_gem_scroller \{StartTime = 0
		practice_intro = 0
		training_mode = 0
		endtime = 99999999}
	mark_unsafe_for_shutdown
	enable_bg_viewport
	Yield \{'enable_bg_viewport'}
	spawnscriptnow freestyle_gem_scroller params = {<...>}
	Yield \{'ss freestyle_gem_scroller'}
	mark_safe_for_shutdown
endscript

script freestyle_gem_scroller \{player = 1
		training_mode = 0}
	setup_gemarrays song_name = <song_name> difficulty = <difficulty> player_status = <player_status>
	FormatText checksumname = input_array 'input_array%p' p = <player_text>
	InputArrayCreate name = <input_array>
	<gem_offset> = ($time_gem_offset * $current_speedfactor)
	<input_offset> = ($time_input_offset * $current_speedfactor)
	GetGlobalTags \{user_options}
	if (<lag_calibration> > 999)
		Mod a = <lag_calibration> b = 1000
		<video_offset> = <Mod>
		<audio_offset> = ((<lag_calibration> / 1000) - 1)
		<input_offset> = (<input_offset> - <audio_offset>)
		<gem_offset> = (<gem_offset> - <audio_offset>)
		<gem_offset> = (<gem_offset> - <video_offset>)
	else
		<input_offset> = (<input_offset> - <lag_calibration>)
	endif
	FormatText checksumname = input_array 'input_array%p' p = <player_text>
	get_song_prefix song = <song_name>
	FormatText checksumname = guitar_stream '%s_guitar' s = <song_prefix> AddToStringLookup
	CreatePlayerServer id = <player_status> player = <player>
	AddPlayerServerInput {id = <player_status>
		player = <player>
		controller = ($<player_status>.controller)
		difficulty = <difficulty>
		guitar_stream = <guitar_stream>
		time_offset = ((($<player_status>.check_time_early) * 1000.0) + <input_offset>)
		song_name = assassin
	}
	AddPlayerServerHighway id = <player_status> player = <player>
	AddPlayerServerFretbarIterator {fretbar_id = CreateFretbar id = <player_status> song_name = <song_name> difficulty = <difficulty>
		time_offset = ((($<player_status>.scroll_time - $destroy_time) * 1000.0) + <gem_offset>) fretbar_function = Create2DFretbar skipleadin = ($<player_status>.scroll_time * 1000.0)
		player = <player> player_status = <player_status> player_text = <player_text>}
endscript

script freestyle_make_gem \{color = green
		accent = false}
	CreateIndependent2DGem {
		player_status = player1_status
		player = 1
		color = <color>
		marker = 0
		time = $freestyle_timer
		accent = <accent>
	}
endscript

script freestyle_spawn_gems \{event_mask = 0
		accent = false}
	gem = 0
	begin
	gem_mask = ($freestyle_highway_gem_masks [<gem>])
	add_gem = 0
	if (((<gem_mask> = 0) && (<event_mask> = 0)) || (<gem_mask> && <event_mask>))
		add_gem = 1
		FormatText checksumname = element_id 'freestyle_guitar_hit_%a' a = <gem> AddToStringLookup = true
		if (ScreenElementExists id = <element_id>)
			restart_animation id = <element_id>
		else
			SpawnScriptLater freestyle_guitar_hit_animation params = {note = <gem>}
		endif
	endif
	if (<add_gem> = 1)
		freestyle_make_gem color = ($freestyle_highway_gem_names [<gem>]) accent = <accent>
	endif
	<gem> = (<gem> + 1)
	repeat 6
endscript

script freestyle_reset_whammy \{event_mask = 0}
	gem = 0
	begin
	gem_mask = ($freestyle_highway_gem_masks [<gem>])
	add_gem = 0
	if ((<gem_mask> = 0) && (<event_mask> = 0))
		add_gem = 1
	elseif (<gem_mask> && <event_mask>)
		add_gem = 1
	endif
	if (<add_gem> = 1)
		FormatText \{checksumname = player_status
			'player%i_status'
			i = 1
			AddToStringLookup}
		ResetWhammy player_status = <player_status> player = 1 color = ($freestyle_highway_gem_names [<gem>])
	endif
	<gem> = (<gem> + 1)
	repeat 6
endscript

script freestyle_update_notes 
	button = 0
	if (<pattern_held> = -1)
		begin
		FormatText checksumname = name_up '%s_up' s = ($gem_colors_text [<button>]) AddToStringLookup = true
		FormatText checksumname = name_down '%s_down' s = ($gem_colors_text [<button>]) AddToStringLookup = true
		SetScreenElementProps id = <name_up> unhide
		SetScreenElementProps id = <name_down> hide
		<button> = (<button> + 1)
		repeat 5
	else
		begin
		button_mask = ($freestyle_highway_gem_masks [<button>])
		FormatText checksumname = name_up '%s_up' s = ($gem_colors_text [<button>]) AddToStringLookup = true
		FormatText checksumname = name_down '%s_down' s = ($gem_colors_text [<button>]) AddToStringLookup = true
		if (<button_mask> && <pattern_held>)
			SetScreenElementProps id = <name_up> hide
			SetScreenElementProps id = <name_down> unhide
		else
			SetScreenElementProps id = <name_up> unhide
			SetScreenElementProps id = <name_down> hide
		endif
		<button> = (<button> + 1)
		repeat 5
	endif
endscript

script freestyle_guitar_hit_animation \{note = -1}
	FormatText checksumname = parent_id '%s_flash' s = ($gem_colors_text [<note>]) AddToStringLookup = true
	FormatText checksumname = element_id 'freestyle_guitar_hit_%a' a = <note> AddToStringLookup = true
	if (<note> = 5)
		CreateScreenElement {
			type = SpriteElement
			id = <element_id>
			parent = <parent_id>
			material = FreestyleGemCreationPurple
			blend = Add
			use_animated_uvs = true
			top_down_v
			frame_length = 0.01
			num_uv_frames = (2.0, 8.0)
			rgba = [255 255 255 255]
			z_priority = 4
			loop_animated_uvs = false
			scale = $freestyle_purple_spawn_scale
			just = [center bottom]
		}
	else
		FormatText checksumname = element_texture 'FreestyleGemCreation%a' a = ($gem_colors_text [<note>]) AddToStringLookup = true
		CreateScreenElement {
			type = SpriteElement
			id = <element_id>
			parent = <parent_id>
			material = <element_texture>
			blend = Add
			use_animated_uvs = true
			top_down_v
			frame_length = 0.01
			num_uv_frames = (4.0, 4.0)
			rgba = [255 255 255 255]
			z_priority = 4
			loop_animated_uvs = false
			scale = 0.6
			just = [center bottom]
		}
	endif
	wait_for_animation id = <element_id>
	if (ScreenElementExists id = <element_id>)
		DestroyScreenElement id = <element_id>
	endif
endscript

script freestyle_update_handedness 
	freestyle_update_guitar_gui_lefty lefty = ($freestyle_player_data [0].lefty)
	if (($freestyle_player_data [0].lefty) = true)
		flip = 1
	else
		flip = -1
	endif
	bool_to_int int_name = lefty_int bool_value = ($freestyle_player_data [0].lefty)
	SetPlayerInfo 1 lefty_flip = <lefty_int>
	SetPlayerInfo 1 lefthanded_gems = <lefty_int>
	SetPlayerInfo 1 lefthanded_button_ups = <lefty_int>
	SetPlayerInfo 1 lefthanded_gems_flip_save = <lefty_int>
	SetPlayerInfo 1 lefthanded_button_ups_flip_save = <lefty_int>
	GetArraySize \{$gem_colors}
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	centerpos = ($freestyle_catcher_center)
	offset = ($freestyle_catcher_gem_offset)
	if (<color> = white)
		<offset> = 0
	endif
	<pos> = (<centerpos> + ((<offset> * ((<array_count> -2) * (-1 * <flip>))) * (1.0, 0.0)))
	<color_string> = ($gem_colors_text [<array_count>])
	FormatText checksumname = name_base '%s_basep1' s = <color_string> p = <player_text> AddToStringLookup = true
	FormatText checksumname = name_up '%s_up' s = <color_string> AddToStringLookup = true
	FormatText checksumname = name_down '%s_down' s = <color_string> AddToStringLookup = true
	SetScreenElementProps id = <name_base> pos = <pos>
	color = ($gem_colors [<array_count>])
	if NOT (<color> = white)
		SetScreenElementProps id = <name_up> flip_v = ($freestyle_player_data [0].lefty)
		SetScreenElementProps id = <name_down> flip_v = ($freestyle_player_data [0].lefty)
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script freestyle_star_power_on 
	if ScreenElementExists \{id = starpower_container_leftp1}
		LegacyDoScreenElementMorph \{id = starpower_container_leftp1
			alpha = 1}
	endif
	if ScreenElementExists \{id = starpower_container_rightp1}
		LegacyDoScreenElementMorph \{id = starpower_container_rightp1
			alpha = 1}
	endif
endscript

script freestyle_star_power_off 
	if ScreenElementExists \{id = starpower_container_leftp1}
		LegacyDoScreenElementMorph \{id = starpower_container_leftp1
			alpha = 0}
	endif
	if ScreenElementExists \{id = starpower_container_rightp1}
		LegacyDoScreenElementMorph \{id = starpower_container_rightp1
			alpha = 0}
	endif
endscript

script freestyle_cleanup_highway 
	KillSpawnedScript \{name = freestyle_update_highway_scroll_speed}
	KillSpawnedScript \{name = freestyle_gem_scroller}
	KillSpawnedScript \{name = freestyle_guitar_hit_animation}
endscript
