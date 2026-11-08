g_spc_check_pow_bool = 1
g_spc_whammy_is_popup = 0
g_spc_sp_is_popup = 0
SHOULD_WE_PLAY_WHAMMY_SOUND = 1

script create_whammy_bar_calibration_menu \{controller = 0
		popup = 0}
	disable_pause
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = wbc_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if (<popup>)
		change \{g_spc_whammy_is_popup = 1}
		controller = ($last_start_pressed_device)
		<z> = 100
	else
		change \{g_spc_whammy_is_popup = 0}
		controller = ($primary_controller)
		<z> = 2
	endif
	if NOT (<popup>)
		create_menu_backdrop \{texture = menu_venue_bg}
	endif
	displaySprite {
		id = wbc_poster_1
		parent = wbc_container
		tex = Options_Whammy_Poster_1
		pos = (286.0, 15.0)
		dims = (896.0, 896.0)
		rot_angle = -2
		z = <z>
	}
	displaySprite {
		id = wbc_poster_2
		parent = wbc_container
		tex = Options_Whammy_Poster_2
		pos = (286.0, 15.0)
		dims = (896.0, 896.0)
		rot_angle = -2
		z = (<z> - 1)
	}
	if NOT (<popup>)
		displaySprite {
			parent = wbc_container
			tex = tape_01
			pos = (1010.0, 450.0)
			dims = (192.0, 92.0)
			z = (<z> + 1)
			flip_v
			rot_angle = 90
		}
		displaySprite {
			parent = wbc_container
			tex = tape_02
			pos = (350.0, 200.0)
			z = (<z> + 1)
			rot_angle = 90
			dims = (192.0, 92.0)
			flip_v
			flip_h
		}
	endif
	text_block_scale = 0.65000004
	text_block_type_scale = 0.8
	text_block_1_pos = (630.0, 70.0)
	text_block_1_dims = (910.0, 200.0)
	text_block_2_pos = (650.0, 140.0)
	text_block_2_dims = (840.0, 100.0)
	text_block_3_pos = (750.0, 195.0)
	text_block_3_dims = (525.0, 300.0)
	<text_1> = qs("Press  the  whammy  bar  completely  down, and  gently  allow  it  to  return  to  its  resting  position.")
	button_color = qs("Green")
	FormatText TextName = text_2 qs("Press  the  %a  Button  to  calibrate  using  this  position.") a = <button_color>
	<text_3> = qs("Repeat  the  process  until  you  see  the  \c1''Resting  position  calibrated'' \c0message  every  time  you  return  the  whammy  bar  to  its  resting  position.")
	CreateScreenElement {
		type = TextBlockElement
		font = fontgrid_text_a3
		pos = <text_block_1_pos>
		parent = wbc_container
		text = <text_1>
		rgba = [0 0 0 255]
		z_priority = (<z> + 1)
		dims = <text_block_1_dims>
		just = [center top]
		internal_just = [left top]
		scale = <text_block_scale>
		internal_scale = <text_block_type_scale>
		rot_angle = -2
		line_spacing = 0.8
	}
	CreateScreenElement {
		type = TextBlockElement
		font = fontgrid_text_a3
		pos = <text_block_2_pos>
		parent = wbc_container
		text = <text_2>
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		dims = <text_block_2_dims>
		just = [center top]
		internal_just = [left top]
		scale = <text_block_scale>
		internal_scale = <text_block_type_scale>
		rot_angle = -3
		line_spacing = 0.8
	}
	CreateScreenElement {
		type = TextBlockElement
		font = fontgrid_text_a3
		pos = <text_block_3_pos>
		parent = wbc_container
		text = <text_3>
		rgba = [0 0 0 255]
		z_priority = (<z> + 1)
		dims = <text_block_3_dims>
		just = [center top]
		internal_just = [left top]
		scale = <text_block_scale>
		internal_scale = <text_block_type_scale>
		rot_angle = -2
		line_spacing = 0.8
	}
	CreateScreenElement {
		type = TextElement
		font = fontgrid_text_a6
		pos = (760.0, 315.0)
		parent = wbc_container
		text = qs("Calibrate")
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		just = [center top]
		scale = 1.6
		rot_angle = -4
	}
	CreateScreenElement {
		type = TextElement
		font = fontgrid_text_a6
		pos = (800.0, 365.0)
		parent = wbc_container
		text = qs("Whammy")
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		just = [center top]
		scale = 1.6
		rot_angle = -4
	}
	CreateScreenElement {
		type = TextBlockElement
		font = fontgrid_text_a3
		rgba = [140 235 170 255]
		pos = (810.0, 408.0)
		text = qs("RESTING POSITION CALIBRATED")
		just = [center top]
		internal_just = [center center]
		dims = (400.0, 200.0)
		scale = 0.6
		line_spacing = 0.8
		parent = wbc_container
		z_priority = (<z> + 2)
		rot_angle = -4
		id = current_menu
		font_spacing = 50
		space_spacing = 20
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		event_handlers = [
			{pad_choose menu_whammy_bar_calibration_enter_sample}
			{pad_back generic_event_back}
		]
		exclusive_device = <controller>
	}
	spawnscriptnow menu_whammy_bar_update_current_menu params = {controller = <controller>}
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
	add_user_control_helper text = qs("SELECT") button = green z = (<z> + 100)
	add_user_control_helper text = qs("BACK") button = red z = (<z> + 100)
endscript

script destroy_whammy_bar_calibration_menu 
	KillSpawnedScript \{name = menu_whammy_bar_update_current_menu}
	destroy_menu \{menu_id = wbc_container}
	clean_up_user_control_helpers
	if NOT ($g_spc_whammy_is_popup)
		destroy_menu_backdrop
	endif
endscript

script create_star_power_trigger_calibration_menu \{controller = 0
		popup = 0}
	disable_pause
	CreateScreenElement \{id = spc_container
		type = ContainerElement
		parent = root_window
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if (<popup>)
		<z> = 100
	else
		controller = ($last_start_pressed_device)
		<z> = -4
	endif
	if NOT (<popup>)
		create_menu_backdrop \{texture = Options_Calibrate_Starpower_Posterwall}
	else
		displaySprite \{parent = spc_container
			tex = Options_Calibrate_Starpower_Posterwall
			pos = (0.0, 0.0)
			dims = (1280.0, 720.0)
			z = 107}
	endif
	displaySprite {
		parent = spc_container
		tex = Options_Calibrate_Starpower_BG
		pos = (326.0, 0.0)
		dims = (512.0, 512.0)
		rot_angle = -2
		z = <z>
	}
	displaySprite {
		id = spc_rotating_bg_lines
		parent = spc_container
		tex = Options_Calibrate_Starpower_BG2
		pos = (578.0, 156.0)
		dims = (640.0, 640.0)
		just = [center center]
		rot_angle = 25
		z = (<z> + 1)
	}
	displaySprite {
		id = spc_rotating_bg_planes
		parent = spc_container
		tex = Options_Calibrate_Starpower_BG3
		pos = (568.0, 114.0)
		dims = (512.0, 384.0)
		just = [center center]
		rot_angle = 20
		z = (<z> + 2)
	}
	if English
		starpower_pow_tex = Options_Calibrate_Starpower_Pow
	elseif French
		starpower_pow_tex = options_calibrate_starpower_pow_fr
	elseif Spanish
		starpower_pow_tex = options_calibrate_starpower_pow_sp
	elseif German
		starpower_pow_tex = options_calibrate_starpower_pow_de
	elseif Italian
		starpower_pow_tex = options_calibrate_starpower_pow_fr
	endif
	displaySprite {
		id = spc_pow
		parent = spc_container
		tex = <starpower_pow_tex>
		pos = (0.0, 0.0)
		scale = 1.0
		relative_scale
		z = (<z> + 3)
	}
	SetScreenElementProps id = <id> hide
	button_color = qs("Green")
	FormatText TextName = element_text qs("Raise the Guitar up to the point at which you would like Star Power to be triggered and press the %a Button to set this value.") a = <button_color>
	CreateScreenElement {
		type = TextBlockElement
		id = current_menu
		parent = spc_container
		font = fontgrid_text_a6
		pos = (608.0, 520.0)
		just = [center top]
		internal_just = [left top]
		line_spacing = 0.85
		dims = (940.0, 300.0)
		scale = (0.5, 0.65000004)
		rgba = [225 200 120 255]
		text = <element_text>
		event_handlers = [
			{pad_choose menu_star_power_trigger_enter_position params = {controller = <controller>}}
			{pad_back generic_event_back}
		]
		z_priority = (<z> + 6.1)
		rot_angle = -2
	}
	spawnscriptnow menu_star_power_trigger_pow_check params = {controller = <controller>}
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 110}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 110}
endscript

script destroy_star_power_trigger_calibration_menu 
	destroy_menu \{menu_id = spc_container}
	clean_up_user_control_helpers
	KillSpawnedScript \{name = menu_star_power_trigger_pow_check}
	destroy_menu_backdrop
endscript

script menu_star_power_trigger_pow_check 
	begin
	if GuitarGetAnalogueInfo controller = <controller>
		<spc_v_dist> = <RightY>
		if (<spc_v_dist> > 0)
			<spc_v_dist> = 0
		endif
		GetGlobalTags \{user_options}
		if (<controller> = $player1_status.controller)
			if (<lefty_flip_p1> = 1)
				<line_rot> = (25.0 -30.0 * ((<spc_v_dist>) * -1))
			else
				<line_rot> = (25.0 -30.0 * <spc_v_dist>)
			endif
		else
			if (<lefty_flip_p2> = 1)
				<line_rot> = (25.0 -30.0 * ((<spc_v_dist>) * -1))
			else
				<line_rot> = (25.0 -30.0 * <spc_v_dist>)
			endif
		endif
		SetScreenElementProps id = spc_rotating_bg_lines rot_angle = <line_rot>
		SetScreenElementProps id = spc_rotating_bg_planes rot_angle = (<line_rot> - 5.0)
		get_star_power_position controller = <controller>
		<spc_pos_dev> = <star_power_position>
		Wait \{0.05
			seconds}
		if (<spc_v_dist> <= <spc_pos_dev>)
			if ($g_spc_check_pow_bool = 1)
				SoundEvent \{event = POW_SFX}
				<spc_pow_rand_x> = 0
				<spc_pow_rand_y> = 0
				<spc_pow_rand_scale> = 0
				<spc_pow_rand_rot> = 0
				GetRandomValue \{name = spc_pow_rand_x
					Integer
					a = 380
					b = 470}
				GetRandomValue \{name = spc_pow_rand_y
					Integer
					a = 50
					b = 80}
				GetRandomValue \{name = spc_pow_rand_scale
					a = 0.6
					b = 1.0}
				GetRandomValue \{name = spc_pow_rand_rot
					a = -3.0
					b = 3.0}
				SetScreenElementProps {
					id = spc_pow
					unhide
					pos = (((1.0, 0.0) * <spc_pow_rand_x>) + ((0.0, 1.0) * <spc_pow_rand_y>))
					rot_angle = <spc_pow_rand_rot>
					scale = <spc_pow_rand_scale>
					relative_scale
				}
				change \{g_spc_check_pow_bool = 0}
			endif
		else
			SetScreenElementProps \{id = spc_pow
				hide}
			change \{g_spc_check_pow_bool = 1}
		endif
	else
		Wait \{0.05
			seconds}
	endif
	repeat
endscript

script menu_star_power_trigger_enter_position 
	if GuitarGetAnalogueInfo controller = <device_num>
		if (<RightY> > 0)
			<RightY> = 0
		endif
		switch (<device_num>)
			case 0
			SetGlobalTags user_options params = {star_power_position_device_0 = <RightY>}
			SoundEvent \{event = POW_SFX}
			case 1
			SetGlobalTags user_options params = {star_power_position_device_1 = <RightY>}
			SoundEvent \{event = POW_SFX}
			case 2
			SetGlobalTags user_options params = {star_power_position_device_2 = <RightY>}
			SoundEvent \{event = POW_SFX}
			case 3
			SetGlobalTags user_options params = {star_power_position_device_3 = <RightY>}
			SoundEvent \{event = POW_SFX}
		endswitch
		GetMaxPlayers
		get_star_power_position controller = <device_num>
		<player> = 1
		begin
		GetPlayerInfo <player> controller
		if (<device_num> = <controller>)
			SetPlayerInfo <player> star_tilt_threshold = <star_power_position>
			break
		endif
		<player> = (<player> + 1)
		repeat <max_players>
	endif
endscript

script create_guitar_diagnostic_menu 
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = gd_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	CreateScreenElement \{type = SpriteElement
		parent = gd_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		dims = (1280.0, 1024.0)
		rgba = [
			80
			80
			80
			255
		]
		z_priority = -1}
	font = fontgrid_text_a8
	text_params = {type = TextElement parent = gd_container font = <font> just = [left top]}
	CreateScreenElement {
		<text_params>
		id = title_text
		text = qs("Guitar info")
		pos = (540.0, 100.0)
	}
	CreateScreenElement {
		<text_params>
		id = leftx
		text = qs("Left X ")
		pos = (580.0, 200.0)
	}
	CreateScreenElement {
		<text_params>
		id = rightx
		text = qs("Right X ")
		pos = (580.0, 240.0)
	}
	CreateScreenElement {
		<text_params>
		id = lefty
		text = qs("Left Y ")
		pos = (580.0, 280.0)
	}
	CreateScreenElement {
		<text_params>
		id = RightY
		text = qs("Right Y ")
		pos = (580.0, 320.0)
	}
	CreateScreenElement {
		<text_params>
		id = leftlength
		text = qs("Left Length ")
		pos = (580.0, 360.0)
	}
	CreateScreenElement {
		<text_params>
		id = rightlength
		text = qs("Right Length ")
		pos = (580.0, 400.0)
	}
	CreateScreenElement {
		<text_params>
		id = lefttrigger
		text = qs("Left Trigger ")
		pos = (580.0, 440.0)
	}
	CreateScreenElement {
		<text_params>
		id = righttrigger
		text = qs("Right Trigger ")
		pos = (580.0, 480.0)
	}
	CreateScreenElement {
		<text_params>
		id = VerticalDist
		text = qs("Vertical Dist ")
		pos = (580.0, 520.0)
	}
	spawnscriptnow \{update_guitar_diagnostic_menu}
endscript

script destroy_guitar_diagnostic_menu 
	KillSpawnedScript \{name = update_guitar_diagnostic_menu}
	destroy_menu \{menu_id = gd_container}
endscript

script update_guitar_diagnostic_menu 
	begin
	if GuitarGetAnalogueInfo \{controller = 0}
		FormatText TextName = leftxtext qs("Left X - %v") v = <leftx>
		FormatText TextName = rightxtext qs("Whammy position - %v") v = <rightx>
		FormatText TextName = leftytext qs("Left Y - %v") v = <lefty>
		FormatText TextName = rightytext qs("Right Y - %v") v = <RightY>
		FormatText TextName = leftlengthtext qs("Left Length - %v") v = <leftlength>
		FormatText TextName = rightlengthtext qs("Right Length - %v") v = <rightlength>
		FormatText TextName = lefttriggertext qs("Left Trigger - %v") v = <lefttrigger>
		FormatText TextName = righttriggertext qs("Right Trigger - %v") v = <righttrigger>
		FormatText TextName = verticaldisttext qs("Vertical orientation - %v") v = <VerticalDist>
		SetScreenElementProps id = leftx text = <leftxtext>
		SetScreenElementProps id = rightx text = <rightxtext>
		SetScreenElementProps id = lefty text = <leftytext>
		SetScreenElementProps id = RightY text = <rightytext>
		SetScreenElementProps id = leftlength text = <leftlengthtext>
		SetScreenElementProps id = rightlength text = <rightlengthtext>
		SetScreenElementProps id = lefttrigger text = <lefttriggertext>
		SetScreenElementProps id = righttrigger text = <righttriggertext>
		SetScreenElementProps id = VerticalDist text = <verticaldisttext>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script create_guitar_sensors_calibration_menu \{controller = 0
		popup = 0}
	disable_pause
	if (<popup>)
		change \{g_spc_whammy_is_popup = 1}
		<z> = 100
		controller = ($last_start_pressed_device)
	else
		controller = ($primary_controller)
		change \{g_spc_whammy_is_popup = 0}
		<z> = 2
	endif
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = gsc_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT (<popup>)
		create_menu_backdrop \{texture = menu_venue_bg}
	endif
	RunScriptOnScreenElement id = gsc_container menu_guitar_sensors_calibration_sequence params = {controller = <controller> z = <z>}
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
	add_user_control_helper text = qs("SELECT") button = green z = (<z> + 100)
	add_user_control_helper text = qs("BACK") button = red z = (<z> + 100)
endscript

script menu_guitar_sensors_calibration_sequence 
	text_block_type_scale = 0.8
	button_color = qs("Green")
	<idles> = [
		{text = qs("neck left") position = guitar_motion_neck_left_idle}
		{text = qs("neck right") position = guitar_motion_neck_right_idle}
		{text = qs("face up") position = guitar_motion_face_up_idle}
		{text = qs("face down") position = guitar_motion_face_down_idle}
		{text = qs("neck left") position = guitar_motion_neck_left_idle}
	]
	GetArraySize <idles>
	<i> = 0
	begin
	<Idle> = (<idles> [<i>])
	FormatText TextName = calibrate_now_text qs("Press  the  %a  Button  to  calibrate  %b.") a = <button_color> b = (<Idle>.text)
	CreateScreenElement {
		id = gsc_text
		type = TextBlockElement
		font = fontgrid_text_a3
		pos = (650.0, 140.0)
		parent = gsc_container
		text = <calibrate_now_text>
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		dims = (840.0, 100.0)
		just = [center top]
		internal_just = [left top]
		internal_scale = <text_block_type_scale>
		rot_angle = -3
		line_spacing = 0.8
		event_handlers = [
			{pad_choose menu_guitar_sensors_calibration_enter_sample params = <Idle>}
			{pad_back generic_event_back}
		]
		exclusive_device = <controller>
	}
	LaunchEvent type = focus target = <id>
	WaitForEvent \{type = guitar_sensor_calibration_done}
	SetScreenElementProps \{id = gsc_text
		event_handlers = [
			{
				pad_choose
				nullscript
			}
		]
		replace_handlers}
	Wait \{2
		seconds}
	DestroyScreenElement \{id = gsc_text}
	<i> = (<i> + 1)
	repeat <array_size>
	CreateScreenElement {
		id = gsc_text
		type = TextBlockElement
		font = fontgrid_text_a3
		pos = (650.0, 140.0)
		parent = gsc_container
		text = qs("Done! Restart the song to feel your changes.")
		rgba = [220 220 220 255]
		z_priority = (<z> + 1)
		dims = (840.0, 100.0)
		just = [center top]
		internal_just = [left top]
		internal_scale = <text_block_type_scale>
		rot_angle = -3
		line_spacing = 0.8
		event_handlers = [
			{pad_choose generic_event_back}
			{pad_back generic_event_back}
		]
		exclusive_device = <controller>
	}
	LaunchEvent type = focus target = <id>
endscript

script destroy_guitar_sensors_calibration_menu 
	destroy_menu \{menu_id = gsc_container}
	clean_up_user_control_helpers
	if NOT ($g_spc_whammy_is_popup)
		destroy_menu_backdrop
	endif
endscript

script menu_guitar_sensors_calibration_enter_sample 
	if GuitarGetAnalogueInfo controller = <device_num>
		GuitarMotion_Calibrate {
			neck_left_idle = <righttrigger>
			neck_right_idle = <righttrigger>
			face_up_idle = <lefttrigger>
			face_down_idle = <lefttrigger>
		}
		switch <position>
			case guitar_motion_neck_left_idle
			AddParam name = value value = <guitar_motion_neck_left_idle> type = float
			<changeparams> = {guitar_motion_neck_left_idle = <guitar_motion_neck_left_idle>}
			case guitar_motion_neck_right_idle
			AddParam name = value value = <guitar_motion_neck_right_idle> type = float
			<changeparams> = {guitar_motion_neck_right_idle = <guitar_motion_neck_right_idle>}
			case guitar_motion_face_up_idle
			AddParam name = value value = <guitar_motion_face_up_idle> type = float
			<changeparams> = {guitar_motion_face_up_idle = <guitar_motion_face_up_idle>}
			case guitar_motion_face_down_idle
			AddParam name = value value = <guitar_motion_face_down_idle> type = float
			<changeparams> = {guitar_motion_face_down_idle = <guitar_motion_face_down_idle>}
		endswitch
		GetMaxPlayers
		<player> = 1
		begin
		FormatText checksumname = player_status 'player%p_status' p = <player>
		if (<device_num> = $<player_status>.controller)
			printf \{'calibrating guitar sensor with:'}
			printstruct <...>
			change structurename = <player_status> <changeparams>
			spawnscriptnow menu_guitar_sensors_calibration_gg params = {value = <value>}
			break
		endif
		<player> = (<player> + 1)
		repeat <max_players>
	endif
	LaunchEvent \{broadcast
		type = guitar_sensor_calibration_done}
endscript

script menu_guitar_sensors_calibration_gg 
	FormatText TextName = debug_text '%v' v = <value>
	FormatText TextName = gg_text qs("Good!\n%v") v = <value>
	CreateScreenElement {
		parent = gsc_container
		type = TextBlockElement
		dims = (200.0, 100.0)
		font = fontgrid_text_a3
		rgba = [128 255 128 255]
		just = [center center]
		internal_just = [center center]
		pos = (640.0, 360.0)
		z_priority = 1100
		text = <gg_text>
		scale = 0.1
		rot_angle = 135
	}
	RunScriptOnScreenElement id = <id> menu_guitar_sensors_calibration_gg_anim
endscript

script menu_guitar_sensors_calibration_gg_anim 
	SE_SetProps \{scale = 1.2
		rot_angle = 0
		time = 0.2}
	SE_WaitProps
	SE_SetProps \{scale = 1.0
		time = 0.1}
	SE_WaitProps
	Wait \{2
		seconds}
	Die
endscript
