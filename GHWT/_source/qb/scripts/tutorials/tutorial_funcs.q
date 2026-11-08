g_training_arrow_life = 5
g_training_arrow_movement_distance = 30
g_training_arrow_bounce_time = 0.5
g_training_last_lesson = 1
g_tutorial_pause_is_up = 0
g_in_tutorial = 0

script training_create_narrator_icons \{parent = training_container}
	<narrator> = 0
	begin
	<expression> = 0
	begin
	switch <narrator>
		case 0
		<narrator_text> = 'guitarist'
		case 1
		<narrator_text> = 'bassist'
		case 2
		<narrator_text> = 'drummer'
		case 3
		<narrator_text> = 'vocalist'
		default
		<narrator_text> = 'drummer'
	endswitch
	FormatText checksumname = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator_text> e = <expression>
	CreateScreenElement {
		parent = <parent>
		type = SpriteElement
		id = <narrator_texture>
		just = [center center]
		texture = <narrator_texture>
		dims = (200.0, 200.0)
		pos = (213.0, 182.0)
		z_priority = 79
	}
	safe_hide id = <id>
	<expression> = (<expression> + 1)
	repeat 3
	<narrator> = (<narrator> + 1)
	repeat 4
endscript

script training_show_narrator \{narrator = 'drummer'
		new_pos = (213.0, 182.0)}
	training_hide_narrator \{no_placeholder}
	if NOT GotParam \{expression}
		<expression> = Random (@ 0 @ 1 @ 2 )
	else
		if (<expression> < 0 || <expression> > 2)
			ScriptAssert \{qs("\LInvalid expression value for creating tutorial narrator")}
		endif
	endif
	FormatText checksumname = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator> e = <expression>
	if (<new_pos> = (213.0, 182.0))
		training_container :GetTags
		if ((<type> = studio) || (<type> = ghmix))
			<hflip> = 1
		endif
		if ScreenElementExists \{id = LessonHeader}
			LessonHeader :SE_GetProps
			if GotParam \{tutorial_narrator_placeholder_pos}
				<new_pos> = (<tutorial_narrator_placeholder_pos> + (188.0, 132.0))
			endif
		endif
	endif
	<narrator_texture> :SE_GetProps pos
	if NOT (<new_pos> = <pos>)
		<narrator_texture> :SE_SetProps pos = <new_pos>
	endif
	if ScreenElementExists \{id = LessonHeader}
		LessonHeader :SE_SetProps \{tutorial_narrator_placeholder_alpha = 0
			time = 0.1}
	endif
	if GotParam \{hflip}
		<scale> = (-1.0, 1.0)
	else
		<scale> = (1.0, 1.0)
	endif
	<narrator_texture> :SE_SetProps scale = <scale>
	safe_show_over_time id = <narrator_texture> time = 0.1
	if ScreenElementExists \{id = tutorial_lesson_container}
		tutorial_lesson_container :GetTags
		tutorial_lesson_container :SE_GetProps \{pos}
		if (<pos> = <pos2>)
			tutorial_lesson_container :SE_SetProps pos = <pos1>
		endif
	endif
endscript

script training_hide_narrator 
	if GotParam \{narrator}
		<expression> = 0
		begin
		FormatText checksumname = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator> e = <expression>
		safe_hide_over_time id = <narrator_texture> time = 0.1
		<expression> = (<expression> + 1)
		repeat 3
	else
		<narrator> = 0
		begin
		<expression> = 0
		begin
		switch <narrator>
			case 0
			<narrator_text> = 'guitarist'
			case 1
			<narrator_text> = 'bassist'
			case 2
			<narrator_text> = 'drummer'
			case 3
			<narrator_text> = 'vocalist'
			default
			<narrator_text> = 'drummer'
		endswitch
		FormatText checksumname = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator_text> e = <expression>
		if ScreenElementExists id = <narrator_texture>
			<narrator_texture> :SE_GetProps
			if (<alpha> != 0)
				safe_hide_over_time id = <narrator_texture> time = 0.1
			endif
		endif
		<expression> = (<expression> + 1)
		repeat 3
		<narrator> = (<narrator> + 1)
		repeat 4
	endif
	if NOT GotParam \{no_placeholder}
		if ScreenElementExists \{id = LessonHeader}
			training_header_container :SE_GetProps
			if (<alpha> != 0)
				LessonHeader :SE_SetProps \{tutorial_narrator_placeholder_alpha = 1
					time = 0.1}
			endif
		endif
	else
		if ScreenElementExists \{id = tutorial_lesson_container}
			tutorial_lesson_container :GetTags
			tutorial_lesson_container :SE_GetProps \{pos}
			if (<pos> = <pos1>)
				tutorial_lesson_container :SE_SetProps pos = <pos2>
			endif
		endif
	endif
endscript

script training_destroy_narrator_icons 
	<narrator> = 0
	begin
	<expression> = 0
	begin
	switch <narrator>
		case 0
		<narrator_text> = 'guitarist'
		case 1
		<narrator_text> = 'bassist'
		case 2
		<narrator_text> = 'drummer'
		case 3
		<narrator_text> = 'vocalist'
		default
		<narrator_text> = 'drummer'
	endswitch
	FormatText checksumname = narrator_texture 'tutorial_narrator_%n_%e' n = <narrator_text> e = <expression>
	DestroyScreenElement id = <narrator_texture>
	<expression> = (<expression> + 1)
	repeat 3
	<narrator> = (<narrator> + 1)
	repeat 4
endscript

script training_create_and_hide_headers \{type = standard}
	training_create_lesson_and_task_headers type = <type>
	training_hide_lesson_header
endscript

script training_create_lesson_and_task_headers \{type = standard}
	if NOT ScreenElementExists \{id = training_container}
		CreateScreenElement \{type = ContainerElement
			id = training_container
			parent = root_window
			pos = (0.0, 0.0)}
	endif
	if ScreenElementExists \{id = training_header_container}
		return
	endif
	z = 80
	training_container :SetTags type = <type>
	CreateScreenElement {
		type = ContainerElement
		id = training_header_container
		parent = training_container
		pos = (0.0, 0.0)
		z_priority = <z>
	}
	switch <type>
		case standard
		CreateScreenElement \{parent = training_header_container
			id = LessonHeader
			type = DescInterface
			desc = 'tutorial_header_2'}
		lesson_header_frame_width = 586
		lesson_header_frame_height = 220
		center_pos = (630.0, 180.0)
		case battle
		CreateScreenElement \{parent = training_header_container
			id = LessonHeader
			type = DescInterface
			desc = 'tutorial_header_battle'}
		lesson_header_frame_width = 486
		lesson_header_frame_height = 220
		center_pos = (648.0, 200.0)
		case ghmix
		CreateScreenElement \{parent = training_header_container
			id = LessonHeader
			type = DescInterface
			desc = 'tutorial_header_ghmix'}
		lesson_header_frame_width = 436
		lesson_header_frame_height = 320
		center_pos = (883.0, 265.0)
		case studio
		CreateScreenElement \{parent = training_header_container
			id = LessonHeader
			type = DescInterface
			desc = 'tutorial_header_studio'}
		lesson_header_frame_width = 386
		lesson_header_frame_height = 420
		center_pos = (677.0, 280.0)
		default
		CreateScreenElement \{parent = training_header_container
			id = LessonHeader
			type = DescInterface
			desc = 'tutorial_header_2'}
		lesson_header_frame_width = 586
		lesson_header_frame_height = 220
		center_pos = (630.0, 180.0)
	endswitch
	if LessonHeader :Desc_ResolveAlias \{name = alias_tutorial_lesson_container}
		AssignAlias id = <resolved_id> alias = tutorial_lesson_container
		tutorial_lesson_container :SE_GetProps \{pos}
		tutorial_lesson_container :SetTags {pos1 = <pos> pos2 = (<pos> + (194.0, 0.0))}
	endif
	lesson_header_frame_dims = (<lesson_header_frame_width> * (1.0, 0.0) + <lesson_header_frame_height> * (0.0, 1.0))
	create_UI_frame {
		frame_dims = <lesson_header_frame_dims>
		center_pos = <center_pos>
		parent = training_header_container
		frame_rgba = [50 30 30 150]
		fill_rgba = [0 0 0 150]
		z_priority = (<z> - 0.1)
		offset_top = 32
		offset_side = 32
		min_fill_pad_width = 73
		min_fill_pad_height = 129
		tex_param = 'simple'
		suffix = 0
	}
	AssignAlias id = <id> alias = lesson_header_frame
endscript

script training_change_header_type \{type = standard}
	DestroyScreenElement \{id = training_header_container}
	training_create_lesson_and_task_headers type = <type>
	training_hide_lesson_header
endscript

script training_destroy_lesson_and_task_headers 
	destroy_menu \{menu_id = training_container}
endscript

script training_hide_lesson_header 
	if ScreenElementExists \{id = training_header_container}
		training_header_container :SE_SetProps \{alpha = 0}
	endif
	training_clear_lesson_body_text
	training_hide_task_header
endscript

script training_show_lesson_header 
	training_header_container :SE_SetProps \{alpha = 1}
	training_hide_task_header \{clear_text = 0}
endscript

script training_hide_task_header \{clear_text = 1}
	LessonHeader :SE_SetProps \{task_container_alpha = 0
		task_notes_remaining_text = qs("\L")}
	if (<clear_text> = 1)
		LessonHeader :SE_SetProps \{task_text_text = qs("\L")}
	endif
endscript

script training_show_task_header 
	LessonHeader :SE_SetProps \{task_container_alpha = 1.0
		time = 0.25}
	LessonHeader :SE_WaitProps
	LessonHeader :Obj_KillSpawnedScript \{name = training_blink_task}
	LessonHeader :Obj_SpawnScriptLater \{training_blink_task}
endscript

script training_blink_task 
	LessonHeader :SE_SetProps \{task_word_alpha = 0.0
		time = 0.2}
	LessonHeader :SE_WaitProps
	LessonHeader :SE_SetProps \{task_word_alpha = 1.0
		time = 0.2}
	LessonHeader :SE_WaitProps
	LessonHeader :SE_SetProps \{task_word_alpha = 0.0
		time = 0.2}
	LessonHeader :SE_WaitProps
	LessonHeader :SE_SetProps \{task_word_alpha = 1.0
		time = 0.2}
	LessonHeader :SE_WaitProps
	LessonHeader :SE_SetProps \{task_word_alpha = 0.0
		time = 0.2}
	LessonHeader :SE_WaitProps
	LessonHeader :SE_SetProps \{task_word_alpha = 1.0
		time = 0.2}
endscript

script training_set_lesson_header_text \{number = qs("\L")
		text = qs("\L")}
	LessonHeader :SE_SetProps {
		lesson_number_text = <number>
		lesson_text_text = <text>
	}
endscript

script training_add_lesson_body_text \{number = 0
		text = qs("\L")
		type = standard}
	if LessonHeader :Desc_ResolveAlias \{name = alias_tutorial_body_vmenu}
		AssignAlias id = <resolved_id> alias = tutorial_body_vmenu
		FormatText TextName = lesson_body_num qs("\L%n") n = <number>
		training_container :GetTags
		switch <type>
			case standard
			CreateScreenElement {
				parent = tutorial_body_vmenu
				type = DescInterface
				desc = 'tutorial_body_info'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autoSizeDims = true
			}
			case battle
			CreateScreenElement {
				parent = tutorial_body_vmenu
				type = DescInterface
				desc = 'tutorial_body_info_battle'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				just = [top left]
				autoSizeDims = true
			}
			case ghmix
			CreateScreenElement {
				parent = tutorial_body_vmenu
				type = DescInterface
				desc = 'tutorial_body_info_ghmix'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autoSizeDims = true
			}
			case studio
			CreateScreenElement {
				parent = tutorial_body_vmenu
				type = DescInterface
				desc = 'tutorial_body_info_studio'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autoSizeDims = true
			}
			default
			CreateScreenElement {
				parent = tutorial_body_vmenu
				type = DescInterface
				desc = 'tutorial_body_info'
				tutorial_body_info_num_text = <lesson_body_num>
				tutorial_body_info_text_text = <text>
				autoSizeDims = true
			}
		endswitch
		<id> :Desc_RefreshContentDims
	endif
endscript

script training_clear_lesson_body_text 
	if ScreenElementExists \{id = tutorial_body_vmenu}
		if GetScreenElementChildren \{id = tutorial_body_vmenu}
			GetArraySize <children>
			if NOT (<array_size> = 0)
				<i> = 0
				begin
				DestroyScreenElement id = (<children> [<i>])
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
	endif
endscript

script training_set_task_header_body \{text = qs("")}
	LessonHeader :SE_SetProps {
		task_text_text = <text>
	}
endscript

script training_hide_vo_sub 
endscript

script training_show_vo_sub 
endscript

script training_add_arrow \{pos = (640.0, 360.0)
		rot = 0
		z = 99
		scale = 1.0}
	if NOT GotParam \{life}
		life = ($g_training_arrow_life)
	endif
	SetSearchAllAssetContexts
	if NOT ScreenElementExists \{id = training_arrow_container}
		CreateScreenElement \{type = ContainerElement
			id = training_arrow_container
			parent = training_container
			pos = (0.0, 0.0)}
	endif
	CreateScreenElement {
		parent = training_arrow_container
		type = SpriteElement
		just = [center bottom]
		texture = tutorial_arrow
		pos = <pos>
		rot_angle = <rot>
		scale = <scale>
		rgba = [255 255 255 255]
		z_priority = <z>
		alpha = 0
	}
	arrow_id = <id>
	SetSearchAllAssetContexts \{off}
	<arrow_id> :SetTags phase_change = 1
	cos <rot>
	sin <rot>
	<arrow_id> :SetTags phase_direction = ((1.0, 0.0) * <sin> + (0.0, -1.0) * <cos>)
	<arrow_id> :SetTags alive = 0.0
	<arrow_id> :SetTags initial_pos = <pos>
	<arrow_id> :SetTags motion = ease_in
	<arrow_id> :SetTags initial_fade = 0
	<arrow_id> :SetTags final_fade = 0
	spawnscriptnow training_make_pointer_point_now params = {id = <arrow_id> life = <life>} id = training_spawned_script
endscript

script training_make_pointer_point_now 
	if NOT GotParam \{id}
		ScriptAssert \{qs("\LNeed Pointer ID!")}
	endif
	<fade_time> = 0.5
	begin
	GetDeltaTime \{ignore_slomo}
	<id> :GetTags
	arrow_age = (<alive> + <delta_time>)
	if (<arrow_age> > <life>)
		break
	endif
	if (<motion> = ease_out)
		<motion> = ease_in
		<id> :SetTags motion = ease_in
	else
		<motion> = ease_out
		<id> :SetTags motion = ease_out
	endif
	<new_pos> = (<initial_pos> + <phase_direction> * ($g_training_arrow_movement_distance) * <phase_change>)
	if (<initial_fade> = 0)
		<id> :SE_SetProps pos = <new_pos> alpha = 1 time = ($g_training_arrow_bounce_time) motion = <motion>
		<id> :SetTags initial_fade = 1
	elseif (<arrow_age> > <life> - <fade_time>)
		if (<final_fade> = 0)
			<id> :SE_SetProps pos = <new_pos> alpha = 0 time = ($g_training_arrow_bounce_time) motion = <motion>
			<id> :SetTags final_fade = 1
		endif
	else
		<id> :SE_SetProps pos = <new_pos> time = ($g_training_arrow_bounce_time) motion = <motion>
	endif
	Wait ($g_training_arrow_bounce_time) seconds ignoreslomo
	<phase_change> = (<phase_change> * -1)
	<arrow_age> = (<arrow_age> + ($g_training_arrow_bounce_time))
	<id> :SetTags alive = (<arrow_age>)
	<id> :SetTags phase_change = (<phase_change>)
	Wait \{1
		gameframe}
	repeat
	DestroyScreenElement id = <id>
endscript

script training_destroy_all_arrows 
	KillSpawnedScript \{name = training_make_pointer_point_now}
	if ScreenElementExists \{id = training_arrow_container}
		training_arrow_container :SE_SetProps alpha = 0 time = ($g_training_arrow_bounce_time)
		if ScreenElementExists \{id = training_arrow_container}
			DestroyScreenElement \{id = training_arrow_container}
		endif
	endif
endscript

script set_vo_sub_text 
	SetScreenElementProps id = temp_vo_sub_body text = <text>
endscript

script training_init_session \{header_type = standard}
	change \{game_mode = tutorial}
	change \{g_in_tutorial = 1}
	Menu_Music_Off
	destroy_bg_viewport
	setup_bg_viewport
	destroy_crowd_models
	SafeKill \{nodeName = Z_SoundCheck_GFX_TRG_LH_HotSpot_P2}
	UnPauseGame
	change \{current_num_players = 1}
	GameMode_UpdateNumPlayers \{num_players = 1}
	ResumeControllerChecking
	change \{sysnotify_paused_controllers = [
		]}
	change \{check_for_unplugged_controllers = 1}
	training_create_and_hide_headers type = <header_type>
	training_hide_vo_sub
	PlayIGCCam \{id = cs_view_cam_id
		name = ch_view_cam
		viewport = bg_viewport
		LockTo = world
		pos = (-0.068807, 1.5990009, 5.7975965)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		Play_hold = 1
		interrupt_current}
	change \{current_crowd = 1.0}
	change \{structurename = player1_status
		current_health = 1.0}
	SetPlayerInfo 1 controller = ($primary_controller)
	hide_band
endscript

script training_kill_session 
	if NOT GotParam \{from_restart}
		change \{g_in_tutorial = 0}
		training_stop_HUD_flashing_red
	endif
	tutorial_disable_botplay
	training_clear_out_star_power
	PauseGame
	KillSpawnedScript \{name = create_exploding_text}
	destroy_all_exploding_text
	KillCamAnim \{name = ch_view_cam}
	destroy_bg_viewport
	training_destroy_lesson_and_task_headers
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	change \{disable_note_input = 0}
	change \{tutorial_disable_hud = 0}
	change \{g_revert_p2_bot_to_off = 0}
	KillSpawnedScript \{name = update_score_fast}
	unpausespawnedscript \{training_script_update}
	band_unload_anim_paks
	SetPlayerInfo 1 controller = ($primary_controller)
	UnPauseGame
endscript

script training_clear_out_star_power 
	printf \{qs("\Lstarting training_clear_out_star_power")}
	<i> = 1
	begin
	GetPlayerInfo <i> checksum
	GetPlayerInfo <i> player
	GetPlayerInfo <i> text
	change structurename = <checksum> star_power_amount = 0
	Kill_StarPower_StageFX player_text = <text> player_status = <checksum> ifEmpty = 0
	<i> = (<i> + 1)
	repeat $current_num_players
endscript

script training_are_notes_flipped 
	if ($player1_status.lefty_flip = 1)
		return \{true}
	endif
	return \{false}
endscript

script show_training_pause_screen 
	if ($g_tutorial_pause_is_up)
		return
	endif
	PauseGame
	PauseGh3Sounds
	training_create_pause_menu <...>
endscript

script create_training_pause_handler 
	event_handlers = [{pad_start show_training_pause_screen}]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	LaunchEvent \{type = focus
		target = menu_tutorial}
endscript
tutorial_okay_to_create_pause_handler = 1

script enable_tutorial_pause 
	change \{tutorial_okay_to_create_pause_handler = 1}
endscript
training_prev_paused_title = none

script training_create_pause_menu 
	if NOT ScreenElementExists \{id = pausemenu_bg}
		if ScreenElementExists \{id = menu_tutorial}
			LaunchEvent \{type = unfocus
				target = menu_tutorial}
		endif
		if GotParam \{UseLastTitle}
			if ($training_prev_paused_title = failed)
				<tutorial_pause_title> = qs("FAILED")
				<tutorial_failed> = 1
			else
				<tutorial_pause_title> = qs("PAUSED")
				<tutorial_failed> = 0
			endif
		else
			if GotParam \{SongFailed}
				<tutorial_pause_title> = qs("FAILED")
				change \{training_prev_paused_title = failed}
				<tutorial_failed> = 1
			else
				<tutorial_pause_title> = qs("PAUSED")
				change \{training_prev_paused_title = paused}
				<tutorial_failed> = 0
			endif
		endif
		change last_start_pressed_device = ($primary_controller)
		ui_create_pausemenu tutorial_pause_title = <tutorial_pause_title> tutorial_failed = <tutorial_failed>
		LaunchEvent \{type = focus
			target = current_menu}
	endif
	change \{g_tutorial_pause_is_up = 1}
endscript

script tutorial_resume 
	tutorial_close_pause_window
endscript

script tutorial_cheat_skip \{lesson = 1}
	change g_training_last_lesson = <lesson>
	tutorial_restart
endscript

script tutorial_skip_lesson 
	change g_training_last_lesson = ($g_training_last_lesson + 1)
	tutorial_restart
endscript

script tutorial_restart 
	tutorial_close_pause_window
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_gem_scroller \{delay = 0.0}
	training_kill_session \{from_restart}
	kill_training_script_system
	StopSoundsByBuss \{Training_VO}
	KeyOffAllSfx
	UnPauseGame
	UnpauseGh3Sounds
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	enable_pause
	run_training_script \{Restart_Lesson}
endscript

script tutorial_shutdown 
	tutorial_close_pause_window
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_gem_scroller \{delay = 0.0
		still_in_training = 0}
	training_kill_session \{shutdown}
	kill_training_script_system
	StopSoundsByBuss \{Training_VO}
	change \{disable_note_input = 0}
	change \{tutorial_disable_hud = 0}
	change \{g_revert_p2_bot_to_off = 0}
	change \{g_in_tutorial = 0}
	training_stop_HUD_flashing_red
	KillSpawnedScript \{name = update_score_fast}
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	band_unload_anim_paks
endscript

script tutorial_setup_band \{players = 1}
	if NOT GotParam \{part}
		part = guitar
		if NOT IsGuitarController controller = ($primary_controller)
			part = drum
			if NOT IsDrumController controller = ($primary_controller)
				part = Vocals
			endif
		endif
	endif
	change current_num_players = <players>
	GameMode_UpdateNumPlayers num_players = <players>
	change structurename = player1_status part = <part>
	change \{structurename = player1_status
		character_id = EmptyGuy}
	<instrument_array> = [guitar Bass drum Vocals]
	<band_member_array> = [Guitarist bassist Drummer vocalist]
	<i> = 0
	begin
	if (<part> = (<instrument_array> [<i>]))
		change structurename = player1_status band_member = (<band_member_array> [<i>])
		RemoveArrayElement array = <instrument_array> index = <i>
		<instrument_array> = <array>
		RemoveArrayElement array = <band_member_array> index = <i>
		<band_member_array> = <array>
		break
	endif
	<i> = (<i> + 1)
	repeat 4
	<loop_cnt> = 0
	if (($current_num_players = 4) || ($current_num_players = 8))
		<loop_cnt> = 3
	elseif ($current_num_players = 2)
		<loop_cnt> = 1
	endif
	if (<loop_cnt> > 0)
		<player> = 2
		<inst> = 0
		begin
		FormatText checksumname = player_status 'player%i_status' i = <player>
		change structurename = <player_status> character_id = EmptyGuy
		change structurename = <player_status> part = (<instrument_array> [<inst>])
		change structurename = <player_status> band_member = (<band_member_array> [<inst>])
		<player> = (<player> + 1)
		<inst> = (<inst> + 1)
		repeat <loop_cnt>
	endif
	if ($current_num_players = 4 || $current_num_players = 8)
		<i> = 1
		begin
		FormatText checksumname = player_status 'player%i_status' i = <i>
		if ($<player_status>.part = drum)
			change structurename = <player_status> four_lane_highway = 0
		endif
		<i> = (<i> + 1)
		repeat 4
	endif
endscript

script tutorial_enable_botplay \{bot_array = [
			1
			1
			1
			1
		]}
	tutorial_disable_botplay
	<i> = 1
	begin
	if (<bot_array> [(<i> - 1)] = 1)
		SetPlayerInfo <i> bot_play = 1
	endif
	<i> = (<i> + 1)
	repeat 4
endscript

script tutorial_disable_botplay 
	SetPlayerInfo \{1
		bot_play = 0}
	SetPlayerInfo \{2
		bot_play = 0}
	SetPlayerInfo \{3
		bot_play = 0}
	SetPlayerInfo \{4
		bot_play = 0}
endscript

script tutorial_quit 
	tutorial_shutdown
	UnPauseGame
	UnpauseGh3Sounds
	enable_pause
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	change \{game_mode = training}
	change \{check_for_unplugged_controllers = 0}
	if GotParam \{state}
		generic_event_back state = <state>
	else
		generic_event_back
	endif
endscript

script tutorial_quit_warning 
	tutorial_close_pause_window \{dont_unpause}
	training_create_quit_warning_popup
endscript

script tutorial_restart_warning 
	tutorial_close_pause_window \{dont_unpause}
	training_create_restart_warning_popup
endscript

script tutorial_close_pause_window 
	if ScreenElementExists \{id = pausemenu_bg}
		LaunchEvent \{type = unfocus
			target = current_menu}
	else
		return
	endif
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = focus
			target = menu_tutorial}
	endif
	ui_destroy_pausemenu
	if NOT GotParam \{dont_unpause}
		UnPauseGame
		UnpauseGh3Sounds
	endif
	change \{g_tutorial_pause_is_up = 0}
endscript

script training_get_language_prefix 
	if English
		return \{language_prefix = 'EN'}
	elseif German
		return \{language_prefix = 'GR'}
	elseif French
		return \{language_prefix = 'FR'}
	elseif FrenchCan
		return \{language_prefix = 'FR'}
	elseif Italian
		return \{language_prefix = 'IT'}
	elseif Spanish
		return \{language_prefix = 'SP'}
	endif
	return \{language_prefix = 'EN'}
endscript

script training_play_sound 
	if NOT GotParam \{Sound}
		printf \{qs("\Ltraining_play_sound called without sound param")}
		return
	endif
	training_get_language_prefix
	FormatText TextName = lang_postfix '_%a' a = <language_prefix>
	FormatText checksumname = sound_crc '%a' a = <Sound>
	ExtendCRC <sound_crc> <lang_postfix> out = sound_id
	PlaySound <sound_id> buss = Training_VO
	if GotParam \{Wait}
		begin
		if NOT issoundplaying <sound_id>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
endscript

script training_wait_for_sound 
	if NOT GotParam \{Sound}
		printf \{qs("\Ltraining_wait_for_sound called without sound param")}
		return
	endif
	training_get_language_prefix
	FormatText TextName = lang_postfix '_%a' a = <language_prefix>
	FormatText checksumname = sound_crc '%a' a = <Sound>
	ExtendCRC <sound_crc> <lang_postfix> out = sound_id
	begin
	if NOT issoundplaying <sound_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_is_sound_playing 
	if NOT GotParam \{Sound}
		printf \{qs("\Ltraining_is_sound_playing called without sound param")}
		return
	endif
	training_get_language_prefix
	FormatText TextName = lang_postfix '_%a' a = <language_prefix>
	FormatText checksumname = sound_crc '%a' a = <Sound>
	ExtendCRC <sound_crc> <lang_postfix> out = sound_id
	if issoundplaying <sound_id>
		return \{true}
	else
		return \{false}
	endif
endscript

script training_play_positive \{who = god}
	if (<who> = god)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_01'}
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_02'}
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_03'}
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_05'}
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_06'}
			@ training_play_sound \{Sound = 'Tutorial_God_Positive_07'}
			)
	elseif (<who> = Guitarist)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_01_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_02_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_03_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_04_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_05_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_06_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_07_GTR'}
			@ training_play_sound \{Sound = 'Tut_Gtr_Positive_08_GTR'}
			)
	elseif (<who> = vocalist)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tut_Vox_HitNotes_09_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_08_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_09_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_10_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Words_11_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_09_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_Freeform_10_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_09_VOX'}
			@ training_play_sound \{Sound = 'Tut_Vox_StarPower_10_VOX'}
			)
	elseif (<who> = bassist)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tut_Gtr_OpenNotes_06_BAS'}
			@ training_play_sound \{Sound = 'Tut_Gtr_OpenNotes_07_BAS'}
			@ training_play_sound \{Sound = 'Tut_Gtr_OpenNotes_08_BAS'}
			@ training_play_sound \{Sound = 'Tut_Gtr_OpenNotes_09_BAS'}
			@ training_play_sound \{Sound = 'Tut_Vs_Battle_03_BAS'}
			@ training_play_sound \{Sound = 'Tut_RS_AdvGtr_10_BAS'}
			@ training_play_sound \{Sound = 'Tut_RS_StepRec_05_BAS'}
			)
	elseif (<who> = Drummer)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_01_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_02_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_03_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_04_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_05_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_06_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_07_DRM'}
			@ training_play_sound \{Sound = 'Tut_Dru_Positive_08_DRM'}
			)
	elseif (<who> = lou)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_01'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_02'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_03'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_04'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_05'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_06'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Positive_07'}
			)
	endif
endscript

script training_play_negative \{who = god}
	if (<who> = god)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_01'}
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_02'}
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_03'}
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_04'}
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_05'}
			@ training_play_sound \{Sound = 'Tutorial_God_Negative_06'}
			)
	elseif (<who> = lou)
		RandomNoRepeat (
			@ training_play_sound \{Sound = 'Tutorial_Lou_Negative_01'}
			@ training_play_sound \{Sound = 'Tutorial_Lou_Negative_02'}
			)
	endif
endscript
g_optimized_safe_show = 1

script safe_show 
	if ScreenElementExists id = <id>
		<id> :SE_SetAlphaInstant alpha = 1
	endif
endscript

script safe_hide 
	if ScreenElementExists id = <id>
		<id> :SE_SetAlphaInstant alpha = 0
	endif
endscript

script safe_show_over_time 
	if ScreenElementExists id = <id>
		<id> :SE_SetProps alpha = 1 time = <time>
	endif
endscript

script safe_hide_over_time 
	if ScreenElementExists id = <id>
		<id> :SE_SetProps alpha = 0 time = <time>
	endif
endscript

script safe_destroy 
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
endscript

script training_display_notes_hit \{notes_required = 8}
	if (<notes_hit> < <notes_required>)
		FormatText TextName = hit_text qs("%h") h = (<notes_required> - <notes_hit>)
	else
		<hit_text> = qs("DONE!")
	endif
	LessonHeader :SE_SetProps {
		task_notes_remaining_text = <hit_text>
	}
endscript

script training_start_gem_scroller \{players = 1
		part = guitar
		bot_array = [
			0
			1
			0
			0
		]
		difficulty = easy}
	printf 'training_start_gem_scroller %d' d = <players>
	tutorial_setup_band players = <players> part = <part>
	vocals_distribute_mics
	if ((<players> = 4) || (<players> = 8))
		tutorial_enable_botplay \{bot_array = [
				1
				1
				1
				1
			]}
	elseif (<players> = 2)
		tutorial_enable_botplay <...>
	else
		tutorial_enable_botplay <...>
	endif
	SetPlayerInfo 1 controller = ($primary_controller)
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	disable_pause
	change \{tutorial_okay_to_create_pause_handler = 0}
	change \{current_transition = fastintro}
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 1.0
		}
		id = training_spawned_script}
	training_set_score \{score = 0
		player_status = player1_status}
	training_set_score \{score = 0
		player_status = player2_status}
	training_set_score \{score = 0
		player_status = player3_status}
	training_set_score \{score = 0
		player_status = player4_status}
	if (<players> = 1)
		start_gem_scroller song_name = <song> difficulty = <difficulty> difficulty2 = easy StartTime = 0 device_num = ($player1_status.controller) training_mode = 1 <...>
	elseif (<players> = 2)
		start_gem_scroller song_name = <song> difficulty = hard difficulty2 = hard StartTime = 0 training_mode = 1 <...>
	elseif ((<players> = 4) || (<players> = 8))
		start_gem_scroller song_name = <song> difficulty = <difficulty> difficulty2 = <difficulty> difficulty3 = <difficulty> difficulty4 = <difficulty> StartTime = 0 training_mode = 1 <...>
	endif
	begin
	if ($tutorial_okay_to_create_pause_handler = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_training_pause_handler
	change \{structurename = player1_status
		current_health = 1.0}
	change \{structurename = player2_status
		current_health = 1.0}
	change \{structurename = player1_status
		star_power_amount = 0.0}
	change \{structurename = player1_status
		star_power_used = 0}
	change \{structurename = player1_status
		current_num_powerups = 0}
	change \{current_crowd = 1.0}
	change \{training_song_over = 0}
	change \{notes_hit = 0}
	change \{notes_missed = 0}
	change \{disable_note_input = 1}
endscript

script training_destroy_gem_scroller \{delay = 0.5
		still_in_training = 1}
	PauseGame
	if (<delay> > 0)
		Wait <delay> seconds ignoreslomo
	endif
	KillCamAnim \{name = ch_view_cam}
	kill_gem_scroller training_mode = 1 still_in_training = <still_in_training>
	change \{check_for_unplugged_controllers = 1}
	destroy_bg_viewport
	setup_bg_viewport
	PlayIGCCam \{id = cs_view_cam_id
		name = ch_view_cam
		viewport = bg_viewport
		LockTo = world
		pos = (-0.068807, 1.5990009, 5.7975965)
		Quat = (0.000506, 0.99942994, -0.017537998)
		FOV = 72.0
		Play_hold = 1
		interrupt_current}
	UnpauseGh3Sounds
	UnPauseGame
endscript

script training_pause_gem_scroller 
	SongSetMasterVolume \{vol = -100
		time = 0.2}
	Wait \{0.25
		seconds}
	SongPause
	setslomo \{0.0}
	setslomo_song \{slomo = 0.0}
endscript

script training_resume_gem_scroller 
	SongSetMasterVolume \{vol = 0
		time = 0.2}
	Wait \{0.25
		seconds
		ignoreslomo}
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	SongUnPause
	change \{disable_note_input = 0}
endscript

script training_set_health \{player_status = player1_status}
	inc = 0.03
	begin
	current_health = ($<player_status>.current_health)
	if (<current_health> < <health>)
		if ((<health> - <current_health>) < <inc>)
			<new_health> = <health>
		else
			<new_health> = (<current_health> + <inc>)
		endif
	else
		if ((<current_health> - <health>) < <inc>)
			<new_health> = <health>
		else
			<new_health> = (<current_health> - <inc>)
		endif
	endif
	change structurename = <player_status> current_health = <new_health>
	if NOT GotParam \{ignore_band_members}
		if ($current_num_players = 4)
			change structurename = player2_status current_health = <new_health>
			change structurename = player3_status current_health = <new_health>
			change structurename = player4_status current_health = <new_health>
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_show_title 
	if ScreenElementExists \{id = tutorial_title}
		DestroyScreenElement \{id = tutorial_title}
	endif
	CreateScreenElement \{parent = training_container
		id = tutorial_title
		type = DescInterface
		desc = 'tutorial_title'}
	tutorial_title :SE_SetProps {
		tutorial_title_container_alpha = 0
		tutorial_title_text_text = <title>
	}
	tutorial_title :SE_SetProps \{tutorial_title_container_alpha = 1
		time = 0.75}
	tutorial_title :SE_WaitProps
endscript

script training_destroy_title 
	if ScreenElementExists \{id = tutorial_title}
		tutorial_title :SE_SetProps \{tutorial_title_container_alpha = 0
			time = 0.75}
		tutorial_title :SE_WaitProps
		if GotParam \{ignoreslomo}
			Wait \{0.75
				seconds
				ignoreslomo}
		else
			Wait \{0.75
				seconds}
		endif
		DestroyScreenElement \{id = tutorial_title}
	endif
endscript

script training_wait_for_gem_scroller_time 
	begin
	GetSongTime
	if (<songtime> >= <time>)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_create_quit_warning_popup 
	if NOT ScreenElementExists \{id = popup_warning_container}
		create_popup_warning_menu \{title = qs("WARNING")
			textblock = {
				text = qs("You will lose all unsaved progress if you quit. Are you sure you want to quit this tutorial?")
			}
			no_background
			options = [
				{
					func = tutorial_quit_warning_resume
					text = qs("CANCEL")
				}
				{
					func = tutorial_quit_warning_choose
					text = qs("QUIT")
				}
			]}
		if ScreenElementExists \{id = menu_tutorial}
			LaunchEvent \{type = unfocus
				target = menu_tutorial}
		endif
	endif
endscript

script training_create_restart_warning_popup 
	if NOT ScreenElementExists \{id = popup_warning_container}
		create_popup_warning_menu \{title = qs("WARNING")
			textblock = {
				text = qs("You will lose all unsaved progress if you restart. Are you sure you want to restart this tutorial?")
			}
			no_background
			options = [
				{
					func = tutorial_restart_warning_resume
					text = qs("CANCEL")
				}
				{
					func = tutorial_restart_warning_choose
					text = qs("RESTART")
				}
			]}
		if ScreenElementExists \{id = menu_tutorial}
			LaunchEvent \{type = unfocus
				target = menu_tutorial}
		endif
	endif
endscript

script tutorial_quit_warning_resume 
	tutorial_close_quit_warning_screen
	training_create_pause_menu \{UseLastTitle}
endscript

script tutorial_quit_warning_choose 
	tutorial_close_quit_warning_screen
	tutorial_quit
endscript

script tutorial_restart_warning_resume 
	tutorial_close_restart_warning_screen
	training_create_pause_menu \{UseLastTitle}
endscript

script tutorial_restart_warning_choose 
	tutorial_close_restart_warning_screen
	tutorial_restart
endscript

script tutorial_close_quit_warning_screen 
	if ScreenElementExists \{id = popup_warning_container}
		LaunchEvent \{type = unfocus
			target = pu_warning_vmenu}
	else
		return
	endif
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = focus
			target = menu_tutorial}
	endif
	destroy_popup_warning_menu
endscript

script tutorial_close_restart_warning_screen 
	tutorial_close_quit_warning_screen
endscript

script rotate_highlight_sparkle_glow \{time = 3}
	printf \{qs("\Lstarting rotate_highlight_sparkle_glow")}
	<rot1> = 360
	<rot2> = 180
	<alpha1> = 0.6
	<alpha2> = 0.4
	if <id> :Desc_ResolveAlias name = alias_highlight_sparkle_glow
		AssignAlias id = <resolved_id> alias = highlight_sparkle_glow
		<id> = highlight_sparkle_glow
	endif
	begin
	<id> :SE_SetProps {
		highlight_glow_rot_angle = <rot1>
		highlight_glow_alpha = <alpha1>
		highlight_sparkle_rot_angle = <rot2>
		highlight_sparkle_alpha = <alpha2>
		time = <time>
	}
	<rot1> = (<rot1> + 360)
	<rot2> = (<rot2> + 180)
	if NOT (<alpha1> = 0)
		<alpha1> = 0
	else
		<alpha1> = 0.6
	endif
	if NOT (<alpha2> = 0)
		<alpha2> = 0
	else
		<alpha2> = 0.4
	endif
	Wait <time> seconds ignoreslomo
	repeat
endscript

script training_set_score \{score = 10000
		player_status = player1_status}
	change structurename = <player_status> score = <score>
	SpawnScriptLater update_score_fast params = {<...>} id = training_spawned_script
	Wait \{1
		frames
		ignoreslomo}
	KillSpawnedScript \{name = update_score_fast}
endscript

script training_start_HUD_flashing_red 
	setslomo \{1.0}
	setslomo_song \{slomo = 1.0}
	KillSpawnedScript \{name = training_set_health}
	spawnscriptnow \{training_set_health
		params = {
			health = 0.0
		}
		id = training_spawned_script}
	change \{current_crowd = 0.0}
	HUD_start_blink_rock_meter
endscript

script training_stop_HUD_flashing_red \{reset_crowd = 1
		pause_highway = 1}
	if (<reset_crowd>)
		change \{current_crowd = 1.0}
	endif
	if (<pause_highway>)
		setslomo \{0.0}
		setslomo_song \{slomo = 0.0}
	endif
	HUD_stop_blink_rock_meter
endscript

script ps2_training_set_task_header_body_props \{color = [
			255
			255
			255
			255
		]
		scale = (0.9, 0.9)}
	LessonHeader :Desc_SetChildProps child = task_text {
		rgba = (<color>)
		scale = (<scale>)
	}
endscript
