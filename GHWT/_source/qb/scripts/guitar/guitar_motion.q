guitar_motion_beat_accuracy = 0.25
guitar_motion_beat_credit = 1000
guitar_motion_beat_points = 10
guitar_motion_background_points = 1.0
guitar_motion_note_hit_points = 50.0
guitar_motion_new_motion_mult = [
	1.0
	0.5
	0.25
	0.1
]
guitar_motions = {
	bounce = {
		id = motion_bounce
		debug_text = qs("\LBounce!")
		score_logic = beat
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.6
					-0.4
				]
			}
			{
				axis = neck_lr
				wait_time = 200
				value = [
					-1.0
					-0.75
				]
			}
			{
				axis = neck_lr
				wait_time = 300
				value = [
					-0.3
					1.0
				]
			}
			{
				axis = neck_lr
				wait_time = 250
				value = [
					-1.0
					-0.75
				]
			}
		]
	}
	Jump = {
		id = motion_jump
		debug_text = qs("\LJump!")
		score_logic = beat
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.6
					-0.4
				]
			}
			{
				axis = neck_lr
				wait_time = 200
				value = [
					-1.0
					-0.75
				]
			}
			{
				axis = neck_lr
				wait_time = 300
				min_time = 250
				value = [
					-0.6
					1.0
				]
			}
			{
				axis = neck_lr
				wait_time = 100
				value = [
					-1.0
					-0.75
				]
			}
		]
	}
	big_jump = {
		id = motion_big_jump
		debug_text = qs("\LLeap!")
		score_logic = always
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.6
					-0.4
				]
			}
			{
				axis = neck_lr
				wait_time = 200
				value = [
					-1.0
					-0.75
				]
			}
			{
				axis = neck_lr
				wait_time = 300
				min_time = 400
				value = [
					-0.6
					1.0
				]
			}
			{
				axis = neck_lr
				wait_time = 500
				value = [
					-1.0
					-0.75
				]
			}
		]
	}
	behind_the_head_fast = {
		id = motion_behind_the_head
		debug_text = qs("\LBehind the Head!")
		score_logic = sustained
		sequence = [
			{
				axis = neck_lr
				value = [
					-1.0
					-0.6
				]
			}
			{
				axis = face_ud
				wait_time = 500
				delta_value = 0.2
			}
			{
				axis = neck_lr
				wait_time = 750
				value = [
					0.2
					1.0
				]
				min_time = 500
			}
		]
	}
	sniper = {
		id = motion_sniper
		debug_text = qs("\LSniper!")
		score_logic = sustained
		sequence = [
			{
				axis = neck_ud
				value = [
					0.01
					1.0
				]
			}
			{
				axis = face_ud
				value = [
					-0.4
					0.2
				]
			}
			{
				axis = face_ud
				wait_time = 720
				value = [
					-0.6
					-0.4
				]
			}
			{
				axis = neck_lr
				wait_time = 500
				value = [
					-0.2
					0.2
				]
				min_time = 500
			}
		]
	}
	invert = {
		id = motion_invert
		debug_text = qs("\LInverted!")
		score_logic = sustained
		no_repeat = 800
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.3
					0.0
				]
			}
			{
				axis = face_ud
				value = [
					-0.5
					0.0
				]
				wait_time = 250
			}
			{
				axis = neck_ud
				value = [
					0.5
					1.0
				]
				wait_time = 200
				min_time = 500
			}
		]
	}
	battlecry = {
		id = motion_battlecry
		debug_text = qs("\LBattle Cry!")
		score_logic = always
		sequence = [
			{
				axis = face_ud
				value = [
					-1.0
					-0.8
				]
			}
			{
				axis = neck_lr
				value = [
					0.7
					1.0
				]
				wait_time = 500
			}
			{
				axis = neck_lr
				value = [
					-0.2
					0.0
				]
				wait_time = 250
			}
			{
				axis = neck_lr
				value = [
					0.7
					1.0
				]
				wait_time = 250
			}
			{
				axis = neck_lr
				value = [
					-0.2
					0.0
				]
				wait_time = 250
			}
		]
	}
	snap = {
		id = motion_snap
		debug_text = qs("\LSnap!")
		score_logic = always
		sequence = [
			{
				axis = face_ud
				value = [
					-1.0
					-0.3
				]
			}
			{
				axis = neck_ud
				value = [
					-1.0
					-0.6
				]
				wait_time = 500
			}
			{
				axis = neck_lr
				value = [
					-0.6
					-0.4
				]
				wait_time = 500
			}
			{
				axis = neck_ud
				value = [
					0.0
					0.0
				]
				wait_time = 250
			}
		]
	}
	guitarspin = {
		id = motion_guitarspin
		debug_text = qs("\LGuitar Spin")
		score_logic = always
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.2
					0.2
				]
			}
			{
				axis = neck_lr
				value = [
					0.6
					1.0
				]
				wait_time = 250
			}
			{
				axis = face_ud
				value = [
					0.1
					0.5
				]
				wait_time = 250
			}
			{
				axis = neck_lr
				value = [
					-0.6
					-0.4
				]
				wait_time = 250
			}
		]
	}
	powerslide = {
		id = motion_powerslide
		debug_text = qs("\LPowerslide!")
		score_logic = sustained
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.3
					-0.1
				]
			}
			{
				axis = neck_lr
				value_delta = -0.6
				wait_time = 500
			}
			{
				axis = neck_lr
				value_delta = 0.2
				wait_time = 250
			}
			{
				axis = face_ud
				value = [
					-1.0
					-0.2
				]
				wait_time = 250
				min_time = 500
			}
		]
	}
	activate_starpower = {
		id = motion_activate_starpower
		debug_text = qs("\LActivate Star Power!")
		score_logic = sustained
		sequence = [
			{
				axis = neck_lr
				value = [
					-0.3
					-0.0
				]
			}
			{
				axis = neck_ud
				value = [
					-1.0
					-0.98999995
				]
				wait_time = 250
			}
		]
	}
	dig = {
		id = motion_dig
		debug_text = qs("\LDig!")
		score_logic = always
		no_repeat = 200
		sequence = [
			{
				axis = neck_ud
				value = [
					0.6
					1.0
				]
			}
			{
				axis = neck_lr
				value = [
					-1.0
					-0.6
				]
			}
			{
				axis = face_ud
				value = [
					-0.5
					-0.2
				]
				min_time = 100
				wait_time = 150
			}
		]
	}
	jam_dig = {
		id = jam_motion_dig
		debug_text = qs("\LStomp!")
		no_repeat = 1000
		score_logic = jam_mode
		sequence = [
			{
				axis = neck_ud
				value = [
					0.4
					1.0
				]
			}
			{
				axis = neck_ud
				wait_time = 300
				value = [
					-0.2
					0.2
				]
			}
		]
	}
	lefty = {
		id = motion_lefty
		debug_text = qs("\LLefty!")
		score_logic = sustained
		sequence = [
			{
				axis = neck_ud
				value = [
					-1.0
					-0.5
				]
			}
			{
				axis = neck_lr
				value = [
					0.4
					0.6
				]
				wait_time = 500
				min_time = 500
			}
		]
	}
}
guitar_motion_ids = {
	motion_behind_the_head = {
		text = qs("Behind the Head")
		score = 50.0
	}
	motion_sniper = {
		text = qs("Sniper")
		score = 50.0
	}
	motion_invert = {
		text = qs("Invert")
		score = 50.0
	}
	motion_battlecry = {
		text = qs("Battlecry")
		score = 50.0
	}
	motion_snap = {
		text = qs("Snap")
		score = 50.0
	}
	motion_guitarspin = {
		text = qs("Guitar Spin")
		score = 50.0
	}
	motion_powerslide = {
		text = qs("Powerslide")
		score = 50.0
	}
	motion_activate_starpower = {
		text = qs("Activate Starpower")
		score = 50.0
	}
	motion_dig = {
		text = qs("Dig")
		score = 50.0
	}
	motion_lefty = {
		text = qs("Lefty")
		score = 50.0
	}
	motion_bounce = {
		text = qs("Bounce")
		score = 10.0
	}
	motion_jump = {
		text = qs("Jump")
		score = 10.0
	}
	motion_big_jump = {
		text = qs("Big Jump")
		score = 10.0
	}
	jam_motion_dig = {
		text = qs("Jam Dig")
	}
}
guitar_motions_test_performed = {
}

script guitar_motion_test 
	SetScriptCannotPause
	OnExitRun \{guitar_motion_test_end}
	change \{guitar_motions_test_performed = {
		}}
	DestroyScreenElement \{id = guitar_motion_test_bg}
	CreateScreenElement \{id = guitar_motion_test_bg
		parent = root_window
		type = SpriteElement
		pos = (0.0, 0.0)
		dims = (1280.0, 250.0)
		texture = white
		rgba = [
			0
			0
			0
			192
		]
		just = [
			left
			top
		]
		z_priority = 1004}
	DestroyScreenElement \{id = guitar_motion_test_text}
	CreateScreenElement \{id = guitar_motion_test_text
		parent = root_window
		type = ContainerElement
		pos = (250.0, 120.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 1005}
	CreateScreenElement \{parent = guitar_motion_test_text
		type = TextBlockElement
		text = qs("neck (up/down)")
		pos = (300.0, -70.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a8
		scale = 0.6}
	CreateScreenElement \{parent = guitar_motion_test_text
		type = TextBlockElement
		text = qs("neck (left/right)")
		pos = (500.0, -70.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a8
		scale = 0.6}
	CreateScreenElement \{parent = guitar_motion_test_text
		type = TextBlockElement
		text = qs("face (up/down)")
		pos = (700.0, -70.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a8
		scale = 0.6}
	CreateScreenElement \{id = guitar_motion_test_text_up
		parent = guitar_motion_test_text
		type = TextBlockElement
		text = qs("\L")
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a8
		scale = 0.7}
	CreateScreenElement \{id = guitar_motion_test_text_left
		parent = guitar_motion_test_text
		type = TextBlockElement
		text = qs("\L")
		pos = (0.0, 30.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a8
		scale = 0.7}
	CreateScreenElement \{id = guitar_motion_test_text_face
		parent = guitar_motion_test_text
		type = TextBlockElement
		text = qs("\L")
		pos = (0.0, 60.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		font = fontgrid_text_a8
		scale = 0.7}
	begin
	if NOT GuitarMotion_Test \{func = prototype
			player = 1}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script guitar_motion_test_end 
	GuitarMotion_Test \{func = prototype_end
		player = 1}
	DestroyScreenElement \{id = guitar_motion_test_text}
	DestroyScreenElement \{id = guitar_motion_test_bg}
endscript

script guitar_motion_got_pattern 
	GetPlayerInfo <player> text
	FormatText checksumname = points_id 'guitar_performance_debug_%s' s = <text>
	if NOT ScreenElementExists id = <points_id>
		return
	endif
	if GotParam \{pattern}
		if StructureContains Structure = $guitar_motions_test_performed <pattern>
			<pattern_count> = ($guitar_motions_test_performed.<pattern>.value + 1)
		else
			<pattern_count> = 1
		endif
		<gmtp> = $guitar_motions_test_performed
		<pattern_struct> = {value = <pattern_count>}
		AddParam name = <pattern> value = <pattern_struct> type = Structure structure_name = gmtp
		change guitar_motions_test_performed = <gmtp>
		guitar_motion_message text = ($guitar_motions.<pattern>.debug_text)
	elseif GotParam \{pattern_id}
		if StructureContains Structure = $guitar_motion_ids <pattern_id>
			guitar_motion_message text = ($guitar_motion_ids.<pattern_id>.text)
		else
			printf 'WARNING: unknown guitar motion pattern id %s' s = <pattern_id>
			guitar_motion_message \{text = qs("Motion")}
		endif
	endif
endscript

script guitar_motion_message 
	CreateScreenElement {
		parent = root_window
		type = TextElement
		text = <text>
		font = fontgrid_text_a8
		just = [left center]
		pos = (270.0, 400.0)
		rgba = [192 255 0 255]
		dims = (400.0, 200.0)
		scale = 0.65000004
		z_priority = 1000
		shadow
		shadow_offs = (3.0, 3.0)
	}
	RunScriptOnScreenElement guitar_motion_message_wait_and_die id = <id>
endscript

script guitar_motion_message_wait_and_die 
	SE_SetProps \{alpha = 0.1
		pos = {
			(0.0, -70.0)
			relative
		}
		time = 1}
	SE_WaitProps
	Die
endscript

script guitar_motion_show_performance_tally 
	FormatText TextName = tally_text qs("%s %v times.") s = ($guitar_motions.<foreachin_name>.debug_text) v = <value>
	CreateScreenElement {
		parent = guitar_motion_performance_menu
		type = TextElement
		dims = (100.0, 10.0)
		text = <tally_text>
		font = fontgrid_text_a8
		just = [top left]
		scale = 0.65000004
		allow_expansion
	}
endscript

script guitar_performance_debug_points 
	GetPlayerInfo <player> text
	FormatText checksumname = points_id 'guitar_performance_debug_%s' s = <text>
	if NOT ScreenElementExists id = <points_id>
		return
	endif
	FormatText TextName = text qs("\L%p") p = <points>
	CreateScreenElement {
		parent = <points_id>
		type = TextBlockElement
		text = <text>
		font = fontgrid_text_a8
		just = [top left]
		pos = (0.0, -34.0)
		rgba = [192 255 0 255]
		dims = (400.0, 0.0)
		z_priority = 1000
		scale = 0.7
		allow_expansion
		shadow
		shadow_offs = (3.0, 3.0)
	}
	RunScriptOnScreenElement guitar_performance_debug_points_wait_and_die id = <id>
endscript

script guitar_performance_debug_points_wait_and_die 
	SE_SetProps \{alpha = 0.0
		pos = {
			(0.0, -50.0)
			relative
		}
		motion = ease_in
		time = 1}
	SE_WaitProps
	Die
endscript

script guitar_performance_debug_display 
	FormatText checksumname = points_id 'guitar_performance_debug_%s' s = ($<player_status>.text)
	if ScreenElementExists id = <points_id>
		DestroyScreenElement id = <points_id>
	endif
	CreateScreenElement {
		id = <points_id>
		parent = <parent>
		type = TextBlockElement
		dims = (200.0, 80.0)
		text = qs("\L")
		rgba = [192 255 0 255]
		pos = (240.0, 370.0)
		font = fontgrid_text_a8
		just = [top left]
		scale = 0.65000004
		allow_expansion
		shadow
		shadow_offs = (3.0, 3.0)
	}
	CreateScreenElement {
		parent = <parent>
		type = TextBlockElement
		dims = (200.0, 80.0)
		text = qs("\Lperformance")
		rgba = [192 255 0 255]
		pos = (240.0, 250.0)
		font = fontgrid_text_a8
		just = [top left]
		scale = 0.65000004
		allow_expansion
		shadow
		shadow_offs = (3.0, 3.0)
	}
endscript
