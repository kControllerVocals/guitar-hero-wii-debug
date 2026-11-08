calibrate_lag_miss_avg_threshold_ms = 200
calibrate_lag_miss_threshold_max_ms = 500
calibrate_lag_failed_num = 0
calibrate_lag_fail_threshold_num = 3
calibrate_lag_menu_line_pos = (420.0, 360.0)
calibrate_lag_menu_circle_dims = (96.0, 96.0)
calibrate_lag_menu_circle_velocity = 300
calibrate_lag_menu_circle_inital_pos = (420.0, -146.0)
calibrate_lag_menu_circle_separation = 320
calibrate_lag_menu_num_circles = 10
calibrate_lag_results = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
calibrate_lag_circle_index = 0
calibrate_lag_real_time_requirement = 0
calibrate_lag_dirty = 0
calibrate_lag_end_checks = 0
calibrate_lag_started_finish = 0
calibrate_lag_cap = 200
calibrate_lag_early_window = -100
calibrate_lag_late_window = 400
cl_ready_for_input = 0
calibrate_lag_most_recent_in_game_setting = 0
calibrate_lag_most_recent_controller = 0
calibrate_lag_section = audio
allow_console_pause_for_cal_lag = 0
calibrate_lag_error_fix_audio = 25
calibrate_lag_error_fix_video = 12
calibrate_lag_error_fix_drums = 10

script setup_calibrate_lag_audio_test 
	change \{calibrate_lag_section = audio}
endscript

script setup_calibrate_lag_video_test 
	change \{calibrate_lag_section = video}
endscript

script setup_calibration_lag_dialog_1 
	change \{calibrate_lag_section = dialog_1}
endscript

script setup_calibration_lag_dialog_2 
	change \{calibrate_lag_section = dialog_2}
endscript

script setup_calibration_lag_none 
	change \{calibrate_lag_section = none}
endscript

script create_calibrate_lag_dialog_menu 
	Menu_Music_Off
	if (<dialog> = 1)
		setup_calibration_lag_dialog_1
		<title> = qs("Audio Test")
	elseif (<dialog> = 2)
		setup_calibration_lag_dialog_2
		<title> = qs("Video Test")
	endif
	menu_calibrate_lag_create_background \{z = 700}
	memcard_cleanup_messages
	create_popup_warning_menu {
		no_background
		title = <title>
		textblock = {
			text = <body_text>
		}
		player_device = $calibrate_lag_most_recent_controller
		options = [
			{
				func = {ui_event}
				func_params = {event = menu_back data = {state = UIstate_options_calibrate_lag}}
				text = qs("CONTINUE")
			}
		]
	}
endscript

script destroy_calibrate_lag_dialog_menu 
	destroy_menu \{menu_id = cl_container}
	memcard_cleanup_messages
	destroy_popup_warning_menu
endscript

script create_calibrate_lag_menu \{from_in_game = 1}
	change calibrate_lag_most_recent_in_game_setting = <from_in_game>
	disable_pause
	Menu_Music_Off
	if ViewportExists \{id = bg_viewport}
		disable_bg_viewport
	endif
	change \{calibrate_lag_end_checks = 0}
	change \{calibrate_lag_started_finish = 0}
	set_focus_color \{rgba = [
			224
			224
			224
			255
		]}
	set_unfocus_color \{rgba = [
			224
			224
			224
			255
		]}
	<z> = 700
	if (<from_in_game>)
		change calibrate_lag_most_recent_controller = ($last_start_pressed_device)
	else
		change calibrate_lag_most_recent_controller = ($primary_controller)
	endif
	menu_calibrate_lag_create_background <...>
	menu_calibrate_lag_setup_vmenu <...>
	menu_calibrate_lag_update_text
	CreateScreenElement {
		type = SpriteElement
		parent = cl_container
		id = calibrate_lag_target
		texture = options_calibrate_lag_target
		pos = ($calibrate_lag_menu_line_pos + ($calibrate_lag_menu_circle_dims * 0.5))
		just = [center center]
		dims = (96.0, 96.0)
		z_priority = (<z> + 50)
		alpha = 0.75
	}
	CreateScreenElement {
		type = SpriteElement
		parent = cl_container
		id = cl_ping_ID
		texture = options_calibrate_lag_ping
		pos = (468.0, 406.0)
		just = [center center]
		scale = 5
		z_priority = (<z> + 80)
		alpha = 0
	}
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 10000}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 10000}
	printf \{qs("\L$calibrate_lag_section = %a")
		a = $calibrate_lag_section}
	if (($calibrate_lag_section = video) || ($calibrate_lag_section = audio))
		if ScreenElementExists \{id = cl_vmenu}
			change \{allow_console_pause_for_cal_lag = 1}
			GetScreenElementChildren \{id = cl_vmenu}
			<id> = (<children> [0])
			RunScriptOnScreenElement id = <id> menu_calibrate_lag_create_circles params = {z = <z> device_num = $calibrate_lag_most_recent_controller}
		endif
	endif
endscript

script menu_calibrate_lag_create_background \{z = 700}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = cl_container
		pos = (0.0, 0.0)}
	CreateScreenElement {
		parent = cl_container
		id = CalibrateLag
		type = DescInterface
		desc = 'calibrate_lag'
		z_priority = <z>
	}
endscript

script menu_calibrate_lag_setup_vmenu 
	if GotParam \{go_back_script}
		calib_eh = [
			{pad_back menu_calibrate_go_back params = {go_back_script = <go_back_script>}}
		]
	else
		calib_eh = [
			{pad_back menu_calibrate_go_back}
		]
	endif
	if NOT CalibrateLag :Desc_ResolveAlias \{name = alias_calibrate_lag_vmenu}
		ScriptAssert \{qs("\LSomething's wrong with calibrate lag menu: Don't have alias_calibrate_lag_vmenu")}
	endif
	AssignAlias id = <resolved_id> alias = cl_vmenu
	cl_vmenu :SE_SetProps event_handlers = <calib_eh> exclusive_device = $calibrate_lag_most_recent_controller
	if NOT GetScreenElementChildren \{id = cl_vmenu}
		ScriptAssert \{qs("\LSomething's wrong with calibrate lag menu: Vmenu doesn't have children")}
	endif
	GetArraySize <children>
	if (<array_size> != 4)
		ScriptAssert \{qs("\LSomething's wrong with calibrate lag menu: Incorrect number of children")}
	endif
	if CalibrateLag :Desc_ResolveAlias \{name = alias_calibrate_lag_option_audio_text}
		AssignAlias id = <resolved_id> alias = cl_option_audio_text
	endif
	if CalibrateLag :Desc_ResolveAlias \{name = alias_calibrate_lag_option_audio_ms}
		AssignAlias id = <resolved_id> alias = cl_option_audio_ms
	endif
	if CalibrateLag :Desc_ResolveAlias \{name = alias_calibrate_lag_option_video_text}
		AssignAlias id = <resolved_id> alias = cl_option_video_text
	endif
	if CalibrateLag :Desc_ResolveAlias \{name = alias_calibrate_lag_option_video_ms}
		AssignAlias id = <resolved_id> alias = cl_option_video_ms
	endif
	if CalibrateLag :Desc_ResolveAlias \{name = alias_calibrate_lag_option_audio_arrow_top}
		AssignAlias id = <resolved_id> alias = cl_option_audio_arrow_top
	endif
	if CalibrateLag :Desc_ResolveAlias \{name = alias_calibrate_lag_option_audio_arrow_bottom}
		AssignAlias id = <resolved_id> alias = cl_option_audio_arrow_bottom
	endif
	if CalibrateLag :Desc_ResolveAlias \{name = alias_calibrate_lag_option_video_arrow_top}
		AssignAlias id = <resolved_id> alias = cl_option_video_arrow_top
	endif
	if CalibrateLag :Desc_ResolveAlias \{name = alias_calibrate_lag_option_video_arrow_bottom}
		AssignAlias id = <resolved_id> alias = cl_option_video_arrow_bottom
	endif
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 0}}
		{unfocus menu_calibrate_unfocus params = {index = 0}}
		{pad_choose menu_calibrate_lag_create_circles params = {z = <z> device_num = $calibrate_lag_most_recent_controller}}
	]
	(<children> [0]) :SE_SetProps event_handlers = <event_handlers>
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 1}}
		{unfocus menu_calibrate_unfocus params = {index = 1}}
		{pad_choose menu_calibrate_lag_reset_lag params = {z = <z>}}
	]
	(<children> [1]) :SE_SetProps event_handlers = <event_handlers>
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 2}}
		{unfocus menu_calibrate_unfocus params = {index = 2}}
		{pad_choose menu_calibrate_lag_manual_choose params = {audio}}
	]
	(<children> [2]) :SE_SetProps event_handlers = <event_handlers>
	event_handlers = [
		{focus menu_calibrate_focus params = {index = 3}}
		{unfocus menu_calibrate_unfocus params = {index = 3}}
		{pad_choose menu_calibrate_lag_manual_choose}
	]
	(<children> [3]) :SE_SetProps event_handlers = <event_handlers>
	SetScreenElementLock \{id = cl_vmenu
		on}
	if ($calibrate_lag_section = none)
		LaunchEvent \{type = focus
			target = cl_vmenu}
	endif
endscript

script destroy_calibrate_lag_menu 
	if ($failed_song = 0)
		if ViewportExists \{id = bg_viewport}
			enable_bg_viewport
		endif
	endif
	clean_up_user_control_helpers
	KillSpawnedScript \{name = do_calibration_update}
	destroy_menu \{menu_id = cl_container}
	if ScreenElementExists \{id = cl_manual_adjust_handler}
		DestroyScreenElement \{id = cl_manual_adjust_handler}
	endif
	set_focus_color \{rgba = $default_focus_color}
	set_unfocus_color \{rgba = $default_unfocus_color}
	LaunchEvent \{type = focus
		target = root_window}
endscript

script menu_calibrate_go_back 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	Wait \{3
		gameframes}
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	if ScreenElementExists \{id = cl_vmenu}
		LaunchEvent \{type = unfocus
			target = cl_vmenu}
	endif
	if ($calibrate_lag_dirty = 1)
		change \{calibrate_lag_dirty = 0}
		SetGlobalTags \{user_options
			params = {
				has_calibrated = 1
			}}
		if ($playing_song = 1)
			if NOT ($game_mode = training)
				change \{gameplay_restart_song = 1}
			else
				change \{memcard_after_func = practice_restart_song}
			endif
			generic_menu_pad_back_sound
			ui_memcard_autosave \{state = uistate_gameplay}
		else
			generic_menu_pad_back_sound
			ui_memcard_autosave_replace
		endif
	else
		if GotParam \{go_back_script}
			<go_back_script>
		else
			if ($playing_song = 1)
				if NOT ($game_mode = training)
					change \{gameplay_restart_song = 1}
				else
					practice_restart_song
				endif
				generic_event_back \{state = uistate_gameplay}
			else
				generic_event_back
			endif
		endif
	endif
endscript

script menu_calibrate_focus 
	generic_menu_up_or_down_sound
	if (<index> = 0)
		retail_menu_focus
	elseif (<index> = 1)
		retail_menu_focus
	elseif (<index> = 2)
		retail_menu_focus \{id = cl_option_audio_text}
	else
		retail_menu_focus \{id = cl_option_video_text}
	endif
endscript

script menu_calibrate_unfocus 
	if (<index> = 0)
		retail_menu_unfocus
	elseif (<index> = 1)
		retail_menu_unfocus
	elseif (<index> = 2)
		retail_menu_unfocus \{id = cl_option_audio_text}
	else
		retail_menu_unfocus \{id = cl_option_video_text}
	endif
endscript

script menu_calibrate_lag_update_text 
	GetGlobalTags \{user_options}
	CastToInteger \{lag_calibration}
	if (<lag_calibration> = 0.0)
		<lag_calibration> = 1000
	endif
	audio_lag = ((<lag_calibration> / 1000) - 1)
	CastToInteger \{audio_lag}
	FormatText TextName = lag_value_text qs("\L%d ms") d = <audio_lag>
	cl_option_audio_ms :SE_SetProps text = <lag_value_text>
	Mod a = <lag_calibration> b = 1000
	FormatText TextName = lag_value_text qs("\L%d ms") d = <Mod>
	cl_option_video_ms :SE_SetProps text = <lag_value_text>
endscript

script menu_calibrate_lag_create_circles 
	GetTags
	Obj_GetID
	<id> = <ObjID>
	StartPinkNoiseLoopForCalirateLagScreen
	if ($transitions_locked = 1 || $menu_flow_locked = 1)
		return
	endif
	user_control_helper_get_buttonchar button = green controller = <device_num>
	if ($calibrate_lag_section = none)
		if IsGuitarController controller = <device_num>
			body_text = qs("First, we will do an audio only calibration. Just strum to the beat of the note. Try to make your strum bar click at exactly the same time as the audible note.")
		elseif IsDrumController controller = <device_num>
			body_text = qs("First, we will do an audio only calibration. Hit the tom drum to the beat of the note. Try to hit the tom at exactly the same time as the audible note.")
		else
			body_text = $wii_calibrate_lag_audio_instructions_wiimote
		endif
		generic_event_choose data = {
			state = uistate_options_calibrate_lag_warning
			body_text = <body_text>
			dialog = 1
			complete_script = setup_calibrate_lag_audio_test
		}
		return
	endif
	CreateScreenElement {
		type = TextElement
		parent = cl_container
		id = clm_dummy_event_handler
		text = qs("\L")
		font = text_a4
		z_priority = <z>
	}
	LaunchEvent \{type = focus
		target = clm_dummy_event_handler}
	LaunchEvent \{type = unfocus
		target = cl_vmenu}
	clean_up_user_control_helpers
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	if ($calibrate_lag_section = video)
		if IsGuitarController controller = <device_num>
			CalibrateLag :SE_SetProps \{calibrate_lag_bottom_text_text = qs("Strum your guitar when the targets are perfectly aligned.")}
			add_user_control_helper \{text = qs("STRUM")
				button = strumbar
				z = 10000}
		elseif IsDrumController controller = <device_num>
			CalibrateLag :SE_SetProps \{calibrate_lag_bottom_text_text = qs("Hit the tom when the targets are perfectly aligned.")}
			add_user_control_helper \{text = qs("BEAT")
				button = DRUM_GREEN
				z = 10000}
		else
			CalibrateLag :SE_SetProps calibrate_lag_bottom_text_text = (qs("Press ") + <buttonchar> + qs(" when the targets are perfectly aligned."))
			add_user_control_helper \{text = qs("PRESS")
				button = green
				z = 10000}
		endif
	elseif ($calibrate_lag_section = audio)
		if IsGuitarController controller = <device_num>
			CalibrateLag :SE_SetProps \{calibrate_lag_bottom_text_text = qs("Strum your guitar to the beat of the audible note.")}
			add_user_control_helper \{text = qs("STRUM")
				button = strumbar
				z = 10000}
		elseif IsDrumController controller = <device_num>
			CalibrateLag :SE_SetProps \{calibrate_lag_bottom_text_text = qs("Hit the tom to the beat of the audible note.")}
			add_user_control_helper \{text = qs("BEAT")
				button = DRUM_GREEN
				z = 10000}
		else
			CalibrateLag :SE_SetProps \{calibrate_lag_bottom_text_text = $wii_calibrate_lag_audio_bottom_text_wiimote}
			add_user_control_helper \{text = qs("PRESS")
				button = green
				z = 10000}
		endif
	endif
	CalibrateLag :SE_SetProps \{calibrate_lag_vmenu_cont_alpha = 0.0}
	CalibrateLag :SE_SetProps \{calibrate_lag_bottom_text_alpha = 1.0
		time = 0.25}
	CalibrateLag :SE_WaitProps
	kill_debug_elements
	init_play_log
	CreateScreenElement {
		type = SpriteElement
		parent = cl_container
		id = cl_countdown_circle
		texture = 2p_song_summary_circle
		pos = ($calibrate_lag_menu_line_pos + (13.0, 14.0))
		rgba = [220 220 220 208]
		just = [left top]
		dims = (72.0, 72.0)
		z_priority = 799
	}
	CreateScreenElement {
		type = TextElement
		id = cl_countdown_text
		parent = cl_container
		pos = ($calibrate_lag_menu_line_pos + (47.0, 48.0))
		scale = (1.0, 1.0)
		text = qs("\L")
		font = fontgrid_text_a8
		rgba = [0 0 0 255]
		z_priority = 800
	}
	<sep> = ($calibrate_lag_menu_circle_separation * 1.0)
	<vel> = ($calibrate_lag_menu_circle_velocity * 1.0)
	<seconds_between_circles> = (<sep> / <vel>)
	<i> = 0
	begin
	cl_container :Obj_SpawnScriptNow \{cl_do_ping
		params = {
			time = 0.6
		}}
	Wait \{0.6
		seconds}
	FormatText TextName = tex qs("\L%t") t = (3 - <i>)
	SetScreenElementProps id = cl_countdown_text text = <tex>
	BeatSound
	Wait (<seconds_between_circles> - 0.6) seconds
	<i> = (<i> + 1)
	repeat 3
	change \{calibrate_lag_circle_index = 0}
	half_circle_width = 0
	GetFPS
	circle_index = 0
	begin
	FormatText checksumname = circle_id 'circle%d' d = <circle_index>
	<circle_pos> = (($calibrate_lag_menu_circle_inital_pos) - ((0.0, 1.0) * <circle_index> * ($calibrate_lag_menu_circle_separation)))
	<one_frame> = ((1.0 / <fps>) * $calibrate_lag_menu_circle_velocity)
	CastToInteger \{one_frame}
	<y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - <circle_pos>.(0.0, 1.0))
	<steps> = (<y_off> / <one_frame>)
	CastToInteger \{steps}
	<new_y_off> = ($calibrate_lag_menu_line_pos.(0.0, 1.0) - (<steps> * <one_frame>))
	<circle_pos> = ((<circle_pos>.(1.0, 0.0) * (1.0, 0.0)) + (<new_y_off> * (0.0, 1.0)))
	<circle_alpha> = 0.5
	if ($calibrate_lag_section = audio)
		<circle_alpha> = 0
	endif
	CreateScreenElement {
		type = SpriteElement
		parent = cl_container
		texture = options_calibrate_lag_note
		id = <circle_id>
		pos = <circle_pos>
		dims = ($calibrate_lag_menu_circle_dims)
		just = [left top]
		rgba = [255 255 255 255]
		z_priority = (<z> + 51)
		alpha = <circle_alpha>
	}
	<circle_id> :SetTags existence = 0 hit = 0 check = 1
	<circle_id> :SetTags initial_position = <circle_pos>
	<circle_id> :SetTags time_requirement = (<steps> * (1.0 / <fps>))
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	LaunchEvent \{type = unfocus
		target = root_window}
	change \{cl_ready_for_input = 0}
	cl_container :Obj_SpawnScriptNow \{cl_do_ping
		params = {
			time = 0.6
		}}
	cl_container :Obj_SpawnScriptNow do_calibration_update params = {device_num = <device_num>}
	Wait \{0.6
		seconds}
	cl_countdown_text :SE_SetProps \{text = qs("GO!")
		scale = 0.7}
	BeatSound
	cl_ping_ID :SE_SetProps \{alpha = 0}
	Wait \{0.4
		seconds}
	cl_countdown_circle :SE_SetProps \{alpha = 0}
	change \{cl_ready_for_input = 1}
	calibrate_lag_target :SE_SetProps \{alpha = 1}
	Wait \{1
		gameframe}
	cl_countdown_text :SE_SetProps \{alpha = 0}
endscript

script menu_calibrate_lag_destroy_circles 
	circle_index = 0
	begin
	FormatText checksumname = circle_id 'circle%d' d = <circle_index>
	destroy_menu menu_id = <circle_id>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	destroy_menu \{menu_id = clm_dummy_event_handler}
endscript

script do_calibration_update 
	<circle_index> = 0
	begin
	FormatText checksumname = circle_id 'circle%d' d = <circle_index>
	<circle_id> :SetTags sounded = 0 pinged = 0
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	GetFPS
	begin
	circle_index = 0
	num_circles_gone = 0
	delta_time = (1.0 / <fps>)
	begin
	FormatText checksumname = circle_id 'circle%d' d = <circle_index>
	<circle_id> :GetTags
	<existence> = (<existence> + <delta_time>)
	update_difference = (<delta_time>)
	position_change = (<update_difference> * ($calibrate_lag_menu_circle_velocity))
	CastToInteger \{position_change}
	GetScreenElementPosition id = <circle_id>
	<screenelementpos> = (<screenelementpos> + (0.0, 1.0) * <position_change>)
	<target_pos> = ($calibrate_lag_menu_line_pos)
	diff = ((<screenelementpos>.(0.0, 1.0)) - (<target_pos>.(0.0, 1.0)))
	if (<diff> < 0)
		<diff> = (0 - <diff>)
	endif
	<cl_tweak> = ($calibrate_lag_tick_ms_offset / 1000.0)
	if ((($calibrate_lag_menu_circle_velocity) * <cl_tweak>) >= <diff>)
		if (<sounded> = 0)
			if ($calibrate_lag_section = audio)
				BeatSound
			endif
			<circle_id> :SetTags sounded = 1
		endif
	endif
	if (<diff> < <position_change>)
		<circle_alpha> = 1
		if ($calibrate_lag_section = audio)
			<circle_alpha> = 0
		endif
		<circle_id> :SE_SetProps rgba = [135 0 180 255] alpha = <circle_alpha>
	endif
	if ((<screenelementpos>.(0.0, 1.0)) > ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.0))))
		if (<hit> = 0 && <check> = 1)
			change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
			<circle_id> :SetTags check = 0
		endif
		<num_circles_gone> = (<num_circles_gone> + 1)
		<circle_id> :Obj_SpawnScriptNow cl_fade_circle params = {id = <circle_id>}
	endif
	<circle_id> :SE_SetProps pos = (<screenelementpos>)
	<circle_id> :SetTags existence = <existence>
	<circle_index> = (<circle_index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_circles_gone> = $calibrate_lag_menu_num_circles)
		cl_container :Obj_SpawnScriptLater kill_off_and_finish_calibration params = {device_num = <device_num>}
	endif
	if (($calibrate_lag_end_checks = 0) && $cl_ready_for_input)
		<check_lines_are_even> = 0
		if IsGuitarController controller = <device_num>
			if ControllerMake up <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake down <device_num>
				<check_lines_are_even> = 1
			endif
		elseif IsDrumController controller = <device_num>
			if ControllerMake x <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake circle <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake square <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake triangle <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake R1 <device_num>
				<check_lines_are_even> = 1
			endif
			if ControllerMake L1 <device_num>
				<check_lines_are_even> = 1
			endif
		else
			GetEnterButtonAssignment
			if ControllerMake <assignment> <device_num>
				<check_lines_are_even> = 1
			endif
		endif
		if (<check_lines_are_even>)
			cl_container :Obj_SpawnScriptNow \{menu_calibrate_lag_say_lines_are_even}
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script cl_fade_circle 
	if ($calibrate_lag_section = video)
		<id> :SE_SetProps rgba = [0 0 0 255] alpha = 0.5 time = 0.009
	endif
endscript

script cl_do_ping \{time = 0.066}
	cl_ping_ID :SE_SetProps \{scale = 10
		alpha = 0}
	cl_ping_ID :SE_SetProps scale = 1 alpha = 1 motion = ease_in time = <time>
	cl_ping_ID :SE_WaitProps
	cl_ping_ID :SE_SetProps \{alpha = 0
		motion = ease_in
		time = 0.1}
	cl_ping_ID :SE_WaitProps
endscript

script menu_calibrate_lag_say_lines_are_even 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	FormatText checksumname = circle_id 'circle%d' d = ($calibrate_lag_circle_index)
	if NOT ScreenElementExists id = <circle_id>
		return
	endif
	if NOT ScreenElementExists \{id = calibrate_lag_target}
		return
	endif
	<circle_id> :GetTags
	GetScreenElementPosition id = <circle_id>
	GetScreenElementDims id = <circle_id>
	input_difference = (<time_requirement> - <existence>)
	new_input_diff = (<input_difference> * 1000)
	<new_input_diff> = (0 - <new_input_diff>)
	printf 'lag=%a' a = <new_input_diff>
	if IsPs3
		<new_input_diff> = (<new_input_diff> - 16)
	endif
	if isXenon
		if ($calibrate_lag_section = video)
			<new_input_diff> = (<new_input_diff> - 12)
		endif
	endif
	if (<new_input_diff> < $calibrate_lag_early_window)
		printf \{'too early'}
		return
	endif
	if (<new_input_diff> > $calibrate_lag_late_window)
		printf \{'too late'}
		return
	endif
	SetArrayElement ArrayName = calibrate_lag_results GlobalArray index = ($calibrate_lag_circle_index) newvalue = <new_input_diff>
	output_log_text qs("Calibrate: %o") o = <new_input_diff> color = white
	get_closest_circle_above_line
	<circle_id> :SetTags hit = 1
	change calibrate_lag_circle_index = (($calibrate_lag_circle_index) + 1)
	<closest_id> :SE_SetProps hide
	CalibrateLag :SE_SetProps \{calibrate_lag_shock_alpha = 1.0}
	CalibrateLag :SE_SetProps \{calibrate_lag_shock_alpha = 0.0
		time = 0.5}
	calibrate_lag_target :SE_SetProps \{scale = 1.5
		relative_scale
		time = 0.05}
	calibrate_lag_target :SE_WaitProps
	calibrate_lag_target :SE_SetProps \{scale = 1.0
		relative_scale
		time = 0.05}
	calibrate_lag_target :SE_WaitProps
	if (($calibrate_lag_circle_index) = ($calibrate_lag_menu_num_circles))
		change \{calibrate_lag_end_checks = 1}
		kill_off_and_finish_calibration
	endif
endscript

script cl_create_particles 
	Create2DParticleSystem {
		id = cl_particles
		pos = ($calibrate_lag_menu_line_pos + ($calibrate_lag_menu_circle_dims * 0.5))
		parent = cl_container
		z_priority = 10000
		material = Ball_Particle_01
		start_color = [255 66 0 255]
		end_color = [128 0 0 0]
		start_scale = (1.0, 1.0)
		end_scale = (0.25, 0.25)
		start_angle_spread = 0.0
		min_rotation = 0.0
		max_rotation = 0.0
		emit_start_radius = 20.0
		emit_radius = 20.0
		emit_rate = 0.001
		emit_dir = 0
		emit_spread = 360.0
		velocity = 16.0
		friction = (0.0, 20.0)
		time = 1.5
	}
	Wait \{1.5
		seconds}
	Destroy2DParticleSystem \{id = cl_particles
		kill_when_empty}
endscript

script kill_off_and_finish_calibration device_num = ($calibrate_lag_most_recent_controller)
	LaunchEvent \{type = unfocus
		target = clm_dummy_event_handler}
	KillSpawnedScript \{name = do_calibration_update}
	menu_calibrate_lag_finish_up_calibration
	menu_calibrate_lag_destroy_circles
	user_control_helper_get_buttonchar button = green controller = <controller>
	if ($calibrate_lag_section = dialog_2)
		if IsGuitarController controller = <device_num>
			body_text = $wii_calibrate_lag_next
		elseif IsDrumController controller = <device_num>
			body_text = qs("Next, we will do a video only calibration test. Hit the tom drum when the targets are perfectly aligned.")
		else
			body_text = (qs("Next, we will do a video only calibration test. Press ") + <buttonchar> + qs(" when the targets are perfectly aligned."))
		endif
		generic_event_choose data = {
			state = uistate_options_calibrate_lag_warning
			body_text = <body_text>
			dialog = 2
			complete_script = setup_calibrate_lag_video_test
		}
	else
		change \{allow_console_pause_for_cal_lag = 0}
		ui_event \{event = menu_refresh}
	endif
endscript

script get_closest_circle_above_line 
	if ($calibrate_lag_end_checks = 1)
		return
	endif
	i = 0
	begin
	FormatText checksumname = circle_id 'circle%d' d = <i>
	GetScreenElementPosition id = <circle_id>
	if ((<screenelementpos>.(0.0, 1.0)) < ($calibrate_lag_menu_line_pos.(0.0, 1.0) + ($calibrate_lag_menu_circle_dims.(0.0, 1.25))))
		<circle_id> :GetTags
		if NOT (<hit>)
			return closest_id = <circle_id> hit = 1
		endif
	endif
	<i> = (<i> + 1)
	repeat $calibrate_lag_menu_num_circles hit = 0
	return closest_id = <circle_id>
endscript

script menu_calibrate_lag_finish_up_calibration 
	if ($calibrate_lag_started_finish = 1)
		return
	endif
	change \{calibrate_lag_started_finish = 1}
	<min> = 50000.0
	<max> = -50000.0
	index = 0
	num_hit = 0
	total_val = 0.0
	begin
	FormatText checksumname = circle_id 'circle%d' d = <index>
	if NOT ScreenElementExists id = <circle_id>
		return
	endif
	<circle_id> :GetTags
	if (<hit>)
		<num_hit> = (<num_hit> + 1)
		val = ($calibrate_lag_results [<index>])
		if (<val> < <min>)
			<min> = (<val>)
		endif
		if (<val> > <max>)
			<max> = (<val>)
		endif
		<total_val> = (<total_val> + <val>)
	endif
	<index> = (<index> + 1)
	repeat ($calibrate_lag_menu_num_circles)
	if (<num_hit> > 2)
		<total_val> = (<total_val> - <min>)
		<total_val> = (<total_val> - <max>)
		avg = (<total_val> / (<num_hit> - 2))
		printf 'calibration before=%a' a = <avg>
		if ($calibrate_lag_section = audio)
			<avg> = (<avg> - $calibrate_lag_error_fix_audio)
		elseif ($calibrate_lag_section = video)
			<avg> = (<avg> - $calibrate_lag_error_fix_video)
		endif
		if IsDrumController controller = ($calibrate_lag_most_recent_controller)
			<avg> = (<avg> - $calibrate_lag_error_fix_drums)
		endif
		printf 'calibration after=%a' a = <avg>
		if (<avg> < 0)
			<avg> = 0
		elseif (<avg> > $calibrate_lag_cap)
			<avg> = $calibrate_lag_cap
		endif
		CastToInteger \{avg}
		GetGlobalTags \{user_options}
		if ($calibrate_lag_section = audio)
			old_lag = <lag_calibration>
			SetGlobalTags user_options params = {lag_calibration = ((<avg> * 1000) + 1000)}
		elseif ($calibrate_lag_section = video)
			StopPinkNoiseLoopForCalirateLagScreen
			old_lag = <lag_calibration>
			SetGlobalTags user_options params = {lag_calibration = (<old_lag> + <avg>)}
		endif
	endif
	if ($calibrate_lag_section = audio)
		change \{calibrate_lag_section = dialog_2}
	elseif ($calibrate_lag_section = video)
		change \{calibrate_lag_section = none}
	endif
	LaunchEvent \{type = focus
		target = root_window}
	Wait \{30
		gameframes}
	StopPinkNoiseLoopForCalirateLagScreen
	if GotParam \{avg}
		if GotParam \{old_lag}
			CastToInteger \{avg}
			if NOT (<old_lag> = <avg>)
				change \{calibrate_lag_dirty = 1}
			endif
		endif
	endif
endscript

script menu_calibrate_lag_reset_lag 
	GetGlobalTags \{user_options}
	if (<lag_calibration> = 1000)
		SoundEvent \{event = UI_SFX_Negative_Select}
		return
	endif
	SoundEvent \{event = QuickPlay_Remove_All_Songs}
	SetGlobalTags \{user_options
		params = {
			lag_calibration = 1000
		}}
	menu_calibrate_lag_update_text
	change \{calibrate_lag_dirty = 1}
endscript

script menu_calibrate_lag_manual_choose 
	SetScreenElementProps \{id = cl_vmenu
		block_events}
	cl_arrow_color = [200 100 0 255]
	if GotParam \{audio}
		retail_menu_unfocus \{id = cl_option_audio_text}
		retail_menu_focus \{id = cl_option_audio_ms}
		cl_option_audio_arrow_top :SE_SetProps rgba = <cl_arrow_color>
		cl_option_audio_arrow_bottom :SE_SetProps rgba = <cl_arrow_color>
	else
		retail_menu_unfocus \{id = cl_option_video_text}
		retail_menu_focus \{id = cl_option_video_ms}
		cl_option_video_arrow_top :SE_SetProps rgba = <cl_arrow_color>
		cl_option_video_arrow_bottom :SE_SetProps rgba = <cl_arrow_color>
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = cl_container
		id = cl_manual_adjust_handler
		event_handlers = [
			{pad_up menu_calibrate_lag_manual_up params = {<...>}}
			{pad_down menu_calibrate_lag_manual_down params = {<...>}}
			{pad_choose menu_calibrate_lag_manual_back params = {<...>}}
			{pad_back menu_calibrate_lag_manual_back params = {<...>}}
		]
	}
	LaunchEvent \{type = focus
		target = cl_manual_adjust_handler}
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_back 
	SetScreenElementProps \{id = cl_vmenu
		unblock_events}
	DestroyScreenElement \{id = cl_manual_adjust_handler}
	if GotParam \{audio}
		retail_menu_unfocus \{id = cl_option_audio_ms}
		retail_menu_focus \{id = cl_option_audio_text}
		cl_option_audio_arrow_top :SE_SetProps \{rgba = [
				224
				224
				224
				255
			]}
		cl_option_audio_arrow_bottom :SE_SetProps \{rgba = [
				224
				224
				224
				255
			]}
	else
		retail_menu_unfocus \{id = cl_option_video_ms}
		retail_menu_focus \{id = cl_option_video_text}
		cl_option_video_arrow_top :SE_SetProps \{rgba = [
				224
				224
				224
				255
			]}
		cl_option_video_arrow_bottom :SE_SetProps \{rgba = [
				224
				224
				224
				255
			]}
	endif
	generic_menu_pad_choose_sound
endscript

script menu_calibrate_lag_manual_up 
	<do_morph> = 0
	if GotParam \{audio}
		<arrow_id> = cl_option_audio_arrow_top
		if menu_calibrate_lag_adjust \{value = 1
				for_audio = 1}
			<do_morph> = 1
		endif
	else
		<arrow_id> = cl_option_video_arrow_top
		if menu_calibrate_lag_adjust \{value = 1}
			<do_morph> = 1
		endif
	endif
	if (<do_morph> = 1)
		<arrow_id> :SE_SetProps alpha = 0
		<arrow_id> :SE_SetProps alpha = 1 time = 0.15
		SoundEvent \{event = Enter_Band_Name_Scroll_Up}
	endif
endscript

script menu_calibrate_lag_manual_down 
	<do_morph> = 0
	if GotParam \{audio}
		<arrow_id> = cl_option_audio_arrow_bottom
		if menu_calibrate_lag_adjust \{value = -1
				for_audio = 1}
			<do_morph> = 1
		endif
	else
		<arrow_id> = cl_option_video_arrow_bottom
		if menu_calibrate_lag_adjust \{value = -1}
			<do_morph> = 1
		endif
	endif
	if (<do_morph> = 1)
		<arrow_id> :SE_SetProps alpha = 0
		<arrow_id> :SE_SetProps alpha = 1 time = 0.15
		SoundEvent \{event = Enter_Band_Name_Scroll_Down}
	endif
endscript

script menu_calibrate_lag_adjust \{value = 1
		for_audio = 0}
	GetGlobalTags \{user_options}
	if (<lag_calibration> = 0)
		<audio_calibration> = 0.0
	else
		<audio_calibration> = ((<lag_calibration> / 1000) - 1)
	endif
	CastToInteger \{audio_calibration}
	<video_calibration> = <lag_calibration>
	CastToInteger \{video_calibration}
	Mod a = <video_calibration> b = 1000
	<video_calibration> = <Mod>
	if (<for_audio> = 1)
		<audio_calibration> = (<audio_calibration> + <value>)
		if (<audio_calibration> > $calibrate_lag_cap)
			return \{false}
		elseif (<audio_calibration> < 0)
			return \{false}
		endif
	else
		<video_calibration> = (<video_calibration> + <value>)
		if (<video_calibration> > $calibrate_lag_cap)
			return \{false}
		elseif (<video_calibration> < 0)
			return \{false}
		endif
	endif
	<new_lag_calibration> = ((<audio_calibration> * 1000) + 1000)
	<new_lag_calibration> = (<new_lag_calibration> + <video_calibration>)
	change \{calibrate_lag_dirty = 1}
	SetGlobalTags user_options params = {lag_calibration = <new_lag_calibration>}
	menu_calibrate_lag_update_text
	return \{true}
endscript

script BeatSound 
	SoundEvent \{event = GH_SFX_Calibration_BeatSoundEvent}
endscript
