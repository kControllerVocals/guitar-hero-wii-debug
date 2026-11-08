attract_disabled = 0
attract_wait_time = 30
invalid_controller_lock = 0

script ui_init_boot_iis 
	ReAcquireControllers
	change \{primary_controller_assigned = 0}
	change \{respond_to_signin_changed = 0}
	SoundEvent \{event = Menu_Guitar_Lick_SFX}
	spawnscriptnow \{menu_music_on
		params = {
			waitforguitarlick = 1
		}}
	UnPauseGame
endscript

script ui_create_boot_iis 
	clean_up_user_control_helpers
	dumpcompactpoolprofile \{0}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = current_menu
		pos = (0.0, 0.0)
		just = [
			left
			center
		]
		z_priority = 0
		event_handlers = [
		]}
	CreateScreenElement \{type = SpriteElement
		parent = current_menu
		id = bG
		texture = boot_copyright_bg_1
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 0}
	CreateScreenElement \{type = SpriteElement
		parent = current_menu
		id = bg2
		texture = boot_copyright_bg_2
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 0.5
		alpha = 1}
	RunScriptOnScreenElement boot_bg_swap id = <id>
	CreateScreenElement \{type = TextBlockElement
		parent = current_menu
		font = fontgrid_text_a6
		text = qs("PRESS ANY BUTTON TO ROCK...")
		dims = (450.0, 240.0)
		pos = (755.0, 450.0)
		just = [
			left
			top
		]
		internal_just = [
			center
			center
		]
		rgba = [
			220
			220
			220
			255
		]
		scale = 0.6
		fit_width = wrap
		fit_height = `scale down if larger`}
	fadetoblack \{off
		time = 0.0
		no_wait}
	startrendering
	if ($attract_disabled = 0)
		RunScriptOnScreenElement \{ui_boot_iis_attract_wait
			id = current_menu}
	endif
	RunScriptOnScreenElement \{ui_boot_iis_input
		id = current_menu}
endscript

script boot_bg_swap 
	begin
	SE_SetProps \{alpha = 0
		time = 0}
	Wait \{0.25
		seconds}
	SE_SetProps \{alpha = 1
		time = 0}
	Wait \{0.4
		seconds}
	repeat
endscript

script ui_destroy_boot_iis 
	fadetoblack \{on
		alpha = 1.0
		time = 0.0
		z_priority = -100
		no_wait}
	if ScreenElementExists \{id = current_menu}
		current_menu :Die
	endif
	kill_notify_box \{container_id = notify_invalid_device}
endscript

script ui_boot_iis_attract_wait 
	wait_time = ($attract_wait_time)
	begin
	printf qs("\LWait_time for begin attract %i") i = <wait_time> channel = attract
	if (<wait_time> = 0)
		break
	endif
	Wait \{1
		second
		ignoreslomo}
	wait_time = (<wait_time> - 1)
	repeat
	if ($invalid_controller_lock = 1)
		begin
		if ($invalid_controller_lock = 0)
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	KillSpawnedScript \{name = ui_boot_iis_input}
	ui_event \{event = menu_change
		data = {
			state = UIstate_boot_attract
		}}
endscript

script ui_boot_iis_input \{button1 = {
		}
		button2 = {
		}}
	get_handlers_for_all_buttons \{event_script = ui_boot_iis_continue}
	begin
	RemoveParameter \{makes}
	RemoveParameter \{device_num}
	current_menu :SetProps event_handlers = <event_handlers> replace_handlers
	Wait \{1
		gameframe}
	repeat
endscript

script ui_boot_iis_continue 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	if ($invalid_controller_lock = 0)
		generic_menu_pad_choose_sound
		get_handlers_for_all_buttons
		current_menu :SetProps event_handlers = <event_handlers> replace_handlers
		KillSpawnedScript \{name = ui_boot_iis_input}
		change primary_controller = <device_num>
		ui_event \{event = menu_replace
			data = {
				state = uistate_boot_guitar
			}}
	endif
endscript
