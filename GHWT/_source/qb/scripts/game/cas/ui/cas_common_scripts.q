
script cas_rotate_skater_left 
	KillSpawnedScript \{name = cas_rotate_skater}
	PlaySound \{Menu_ColorWheel_Rotate
		vol = -5
		pitch = 0.5
		buss = front_end}
	SpawnScriptLater \{cas_rotate_skater
		params = {
			Angle = -3
			button = L1
		}}
endscript

script cas_rotate_skater_option 
	KillSpawnedScript \{name = cas_rotate_skater}
	if IsPs3
		button = triangle
	else
		button = x
	endif
	SpawnScriptLater cas_rotate_skater params = {Angle = -3 button = <button>}
endscript

script cas_rotate_skater_right 
	KillSpawnedScript \{name = cas_rotate_skater}
	PlaySound \{Menu_ColorWheel_Rotate
		vol = -5
		pitch = -0.5
		buss = front_end}
	SpawnScriptLater \{cas_rotate_skater
		params = {
			Angle = 3
			button = R1
		}}
endscript

script cas_rotate_skater 
	begin
	if ControllerPressed <button>
		if GetCurrentCASObject
			if NOT (<cas_object> = BandLogoObject)
				<cas_object> :Obj_Rotate relative = ((<Angle> * (0.0, 1.0, 0.0)))
			endif
		endif
	else
		break
	endif
	Wait \{1
		frame}
	repeat
endscript

script cas_setup_rotating_camera \{FOV = 70}
	printf \{'cas_setup_rotating_camera'}
	cas_parts_pos_script = cas_get_part_camera_pos_bedroom
	if GotParam \{cam_anim}
		switch <cam_anim>
			case Hand
			case Torso
			case AdjTorso
			case Accessory
			case waist
			PlayVideo \{video = torsoselect}
			case Misc_Head
			case Misc
			case Head
			case HeadTop
			PlayVideo \{video = headselect}
			case Legs
			case pants
			case calves
			PlayVideo \{video = pantselect}
			case shoes
			PlayVideo \{video = shoeselect}
			case GuitarNeck
			case GuitarHead
			case GuitarBody
			case GuitarStart
			PlayVideo \{video = guitarselect}
			case DrumStart
			PlayVideo \{video = drumselect}
			default
			printf 'cam_anim=%c' c = <cam_anim>
		endswitch
	endif
	if GotParam \{cam_anim}
		<cas_parts_pos_script> cam_anim = <cam_anim>
	else
		<cas_parts_pos_script> cam_anim = none
	endif
	KillSkaterCamAnim \{all}
	PlayIGCCam {
		viewport = bg_viewport
		LockTo = world
		pos = <cam_pos>
		Quat = <cam_quat>
		FOV = <cam_fov>
		Play_hold = 1
		interrupt_current
		name = CASCamera
	}
endscript
cas_override_camera_time = -1

script cas_pull_back_camera \{button = R2}
	printf \{'cas_pull_back_camera'}
	RequireParams \{[
			zoom_camera
		]
		all}
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	if NOT ScriptIsRunning \{task_menu_default_anim_in}
		change \{pulled_back = 1}
		task_menu_retrieve_camera_base_name
		if (<zoom_camera> = <camera_name>)
			return
		endif
		change \{generic_menu_block_input = 1}
		change \{cas_override_camera_time = 0.0}
		task_menu_default_anim_in base_name = <zoom_camera> do_not_hide ignore_time = 1
		change \{generic_menu_block_input = 0}
		generic_menu_up_or_down_sound \{up}
		Wait \{0.1
			seconds}
		begin
		if NOT ControllerPressed <button> <device_num>
			break
		endif
		Wait \{1
			gameframe}
		repeat
		change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = <camera_name> do_not_hide ignore_time = 1
		change \{generic_menu_block_input = 0}
		generic_menu_up_or_down_sound \{down}
		change \{cas_override_camera_time = -1}
		change \{pulled_back = 0}
	endif
endscript

script cas_pull_back_camera_adaptive \{button = R2
		pull_back_distance = 1.0}
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	change \{pulled_back = 1}
	task_menu_retrieve_camera_base_name
	task_menu_retrieve_camera_params camera_name = <camera_name>
	task_menu_retrieve_camera_DOF_params camera_name = <camera_name>
	if GotParam \{camera_params}
		pos = (<camera_params>.pos)
		Quat = (<camera_params>.Quat)
		RotateVector vector = (0.0, 0.0, -1.0) Quat = <Quat>
		back_pos = (<pos> + <pull_back_distance> * <result_vector>)
		PlayIGCCam {
			id = cs_view_cam_id
			name = menu_view_cam_pullback
			viewport = bg_viewport
			LockTo = world
			pos = <back_pos>
			Quat = <Quat>
			FOV = (<camera_params>.FOV)
			Play_hold = 1
			interrupt_current
		}
		if GotParam \{dof_params}
			GetDistance posA = <pos> PosB = <back_pos>
			increase_dof_distance distance = <dist_atob> dof_params = <dof_params>
		endif
		SoundEvent \{event = Menu_CAR_ZoomOut}
		Wait \{0.3
			seconds}
		begin
		if NOT ControllerPressed <button> <device_num>
			break
		endif
		Wait \{1
			gameframe}
		repeat
		KillCamAnim \{name = menu_view_cam_pullback}
		if GotParam \{dof_params}
			spawnscriptnow ApplyMenuDOF params = {dofParam = <dof_params>}
		endif
		SoundEvent \{event = Menu_CAR_ZoomIn}
		Wait \{0.3
			seconds}
	endif
	change \{pulled_back = 0}
endscript

script increase_dof_distance 
	RequireParams \{[
			distance
			dof_params
		]
		all}
	new_dof_params = {
		<dof_params>
		farblurbegin = ((<dof_params>.farblurbegin) + <distance>)
		farblurend = ((<dof_params>.farblurend) + <distance>)
	}
	spawnscriptnow ApplyMenuDOF params = {dofParam = <new_dof_params>}
endscript

script cleanup_cas_menu_handlers 
	printf \{'cleanup_cas_menu_handlers'}
	if ScriptIsRunning \{cas_pull_back_camera_adaptive}
		KillSpawnedScript \{name = cas_pull_back_camera_adaptive}
	endif
	if ScriptIsRunning \{cas_pull_back_camera}
		KillSpawnedScript \{name = cas_pull_back_camera}
	endif
	change \{generic_menu_block_input = 0}
	KillCamAnim \{name = menu_view_cam_pullback}
	KillCamAnim \{name = CASCamera}
	change \{current_camera_cut_num = 0}
endscript

script generic_pause_exit_sound 
	ui_menu_select_sfx
endscript

script generic_menu_update_arrows \{menu_id = current_menu}
	if NOT ObjectExists id = <up_arrow_id>
		return
	endif
	if NOT ObjectExists id = <down_arrow_id>
		return
	endif
	if <menu_id> :Menu_SelectedIndexIs first
		SetScreenElementProps {
			id = <up_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		SetScreenElementProps {
			id = <up_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
	if <menu_id> :Menu_SelectedIndexIs last
		SetScreenElementProps {
			id = <down_arrow_id>
			rgba = [128 128 128 0]
		}
	else
		SetScreenElementProps {
			id = <down_arrow_id>
			rgba = [128 128 128 128]
		}
	endif
endscript
cas_free_cam_active = 0

script cas_toggle_free_cam 
	if (($cas_free_cam_active) = 0)
		change \{cas_free_cam_active = 1}
	else
		change \{cas_free_cam_active = 0}
	endif
	printf \{'cas_toggle_free_cam'}
	if NOT CD
		if NOT IsGuitarController controller = <device_num>
			change \{toggleviewmode_enabled = 1}
			if ($view_mode = 0)
				ToggleViewMode \{no_reload}
			else
				change \{view_mode = 2}
				ToggleViewMode \{no_reload}
			endif
		endif
	endif
endscript

script setup_cas_menu_handlers controller = ($primary_controller)
	RequireParams \{[
			vmenu_id
		]
		all}
	if NOT (($menu_over_ride_exclusive_device) = -1)
		controller = ($menu_over_ride_exclusive_device)
	endif
	event_handlers = []
	if IsGuitarController controller = <controller>
		if NOT GotParam \{no_rotate}
			if GotParam \{camera_list}
				AddArrayElement array = <event_handlers> element = {pad_option cas_change_camera_cut params = {camera_list = <camera_list> right}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_option cas_rotate_skater_option}
				event_handlers = <array>
			endif
		endif
		if NOT GotParam \{no_zoom}
			if GotParam \{zoom_camera}
				AddArrayElement array = <event_handlers> element = {pad_l1 cas_pull_back_camera params = {button = L1 zoom_camera = <zoom_camera>}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_l1 cas_pull_back_camera_adaptive params = {button = L1 pull_back_distance = <pull_back_distance>}}
				event_handlers = <array>
			endif
		endif
	elseif IsDrumController controller = <controller>
		if NOT GotParam \{no_rotate}
			if GotParam \{camera_list}
				AddArrayElement array = <event_handlers> element = {pad_option cas_change_camera_cut params = {camera_list = <camera_list> right}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_option cas_rotate_skater_option}
				event_handlers = <array>
			endif
		endif
		if NOT GotParam \{no_zoom}
			if GotParam \{zoom_camera}
				AddArrayElement array = <event_handlers> element = {pad_l1 cas_pull_back_camera params = {button = sqaure zoom_camera = <zoom_camera>}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_l1 cas_pull_back_camera_adaptive params = {button = square pull_back_distance = <pull_back_distance>}}
				event_handlers = <array>
			endif
		endif
	else
		event_handlers = [
			{pad_l3 cas_artist_flush}
			{pad_alt2 cas_toggle_free_cam}
		]
		if NOT GotParam \{no_rotate}
			if GotParam \{camera_list}
				AddArrayElement array = <event_handlers> element = {pad_option cas_change_camera_cut params = {camera_list = <camera_list> left}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_option cas_rotate_skater_left}
				event_handlers = <array>
			endif
		endif
		if NOT GotParam \{no_zoom}
			if GotParam \{zoom_camera}
				AddArrayElement array = <event_handlers> element = {pad_l1 cas_pull_back_camera params = {button = L1 zoom_camera = <zoom_camera>}}
				event_handlers = <array>
			else
				AddArrayElement array = <event_handlers> element = {pad_l1 cas_pull_back_camera_adaptive params = {button = L1 pull_back_distance = <pull_back_distance>}}
				event_handlers = <array>
			endif
		endif
	endif
	GetArraySize \{event_handlers}
	if (<array_size> > 0)
		SetScreenElementProps {
			id = <vmenu_id>
			event_handlers = <event_handlers>
			replace_handlers
		}
	endif
endscript
current_camera_cut_num = 0

script cas_change_camera_cut 
	RequireParams \{[
			camera_list
		]
		all}
	printf \{'cas_change_camera_cut'}
	if NOT ((ScriptIsRunning task_menu_default_anim_in) || (ScriptIsRunning cas_pull_back_camera))
		change \{cas_override_camera_time = -1}
		GetArraySize <camera_list>
		if (<array_size> = 0)
			return
		endif
		if GotParam \{right}
			SoundEvent \{event = GigBoard_Zoom_right}
			change current_camera_cut_num = (($current_camera_cut_num) + 1)
		else
			SoundEvent \{event = GigBoard_Zoom_Left}
			change current_camera_cut_num = (($current_camera_cut_num) -1)
		endif
		if (($current_camera_cut_num) > (<array_size> -1))
			change \{current_camera_cut_num = 0}
		elseif (($current_camera_cut_num) < 0)
			change current_camera_cut_num = (<array_size> -1)
		endif
		change \{generic_menu_block_input = 1}
		task_menu_default_anim_in base_name = (<camera_list> [($current_camera_cut_num)]) do_not_hide
		change \{generic_menu_block_input = 0}
	endif
endscript

script setup_cas_menu_handlers_restricted 
	RequireParams \{[
			vmenu_id
		]
		all}
	SetScreenElementProps {
		id = <vmenu_id>
		event_handlers =
		[
			{pad_l1 cas_rotate_skater_left}
			{pad_r1 cas_rotate_skater_right}
			{pad_l3 cas_artist_flush}
			{pad_alt2 cas_toggle_free_cam}
		]
		replace_handlers
	}
endscript

script GetInstrumentNodeName 
	if (<instrument> = none)
		return \{false}
	endif
	node = z_SoundCheck_TRG_Waypoint_Guitar_Start
	switch (<instrument>)
		case guitar
		case Bass
		<node> = z_SoundCheck_TRG_Waypoint_Guitar_Start
		case drum
		<node> = Z_Soundcheck_TRG_Waypoint_Drum_Start
		case Vocals
		<node> = Z_Soundcheck_TRG_Waypoint_Microphone_Start
	endswitch
	return instrument_node_name = <node> true
endscript

script is_female_char 
	GetCurrentCASObject
	cas_get_is_female player = ($cas_current_player)
	if (<is_female> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script create_font_arrays 
	GetArraySize ($car_font_list)
	font_list_size = <array_size>
	i = 0
	begin
	FormatText checksumname = new_global_name 'car_%i' i = ((($car_font_list) [<i>]).font)
	new_global_value = ($car_char_list)
	GetArraySize (<new_global_value>)
	j = 0
	begin
	FormatText checksumname = font '%i' i = ((($car_font_list) [<i>]).font)
	newstruct = {(<new_global_value> [<j>]) font = <font>}
	SetArrayElement ArrayName = new_global_value index = <j> newvalue = <newstruct>
	j = (<j> + 1)
	repeat <array_size>
	NewGlobal name = <new_global_name> value = <new_global_value>
	i = (<i> + 1)
	repeat <font_list_size>
endscript
