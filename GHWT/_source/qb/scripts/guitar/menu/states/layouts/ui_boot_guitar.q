
script ui_create_boot_guitar 
	GetEnterButtonAssignment
	switch <assignment>
		case circle
		green_button_text = qs("BACK")
		red_button_text = qs("CONTINUE")
		default
		green_button_text = qs("CONTINUE")
		red_button_text = qs("BACK")
	endswitch
	fadetoblack \{on
		alpha = 1.0
		time = 0.0
		no_wait}
	ui_get_controller_parts_allowed controller = ($primary_controller)
	instrument = mic
	if isXenon
		desc = 'boot_usingMic_360'
	elseif IsNgc
		desc = 'boot_usingMic_Wii'
	else
		desc = 'boot_usingMic_PS3'
	endif
	if StructureContains Structure = <allowed> guitar
		instrument = guitar
		desc = 'boot_usingGuitar'
	endif
	if StructureContains Structure = <allowed> drum
		instrument = drum
		desc = 'boot_usingDrum'
	endif
	if StructureContains Structure = <allowed> Vocals
		if IsMicrophonePluggedIn
			instrument = mic
			if isXenon
				desc = 'boot_usingMic_360'
			elseif IsNgc
				desc = 'boot_usingMic_Wii'
			else
				desc = 'boot_usingMic_PS3'
			endif
		elseif is_regular_controller controller = ($primary_controller)
			instrument = mic
			if isXenon
				desc = 'boot_usingMic_360'
			elseif IsNgc
				desc = 'boot_usingMic_Wii'
			else
				desc = 'boot_usingMic_PS3'
			endif
		endif
	endif
	CreateScreenElement {
		parent = root_window
		id = current_menu
		type = DescInterface
		desc = <desc>
		exclusive_device = ($primary_controller)
		event_handlers = [
			{pad_start ui_boot_guitar_sound params = {instrument = <instrument>}}
			{pad_choose ui_boot_guitar_sound params = {instrument = <instrument>}}
			{pad_start ui_event params = {event = menu_replace data = {state = uistate_signin params = {device_num = <device_num> boot = 1}}}}
			{pad_choose ui_event params = {event = menu_replace data = {state = uistate_signin params = {device_num = <device_num> boot = 1}}}}
		]
		z_priority = 9000
		green_button_text = <green_button_text>
		red_button_text = <red_button_text>
	}
	spawnscriptnow \{load_soundcheck}
	if isRBDrum controller = ($primary_controller)
		spawnscriptnow \{create_rb_drum_notification}
	endif
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 100000}
endscript

script load_soundcheck 
	frontend_load_soundcheck
	z_soundcheck_UIAnimationPre
endscript

script create_rb_drum_notification 
	CreateScreenElement \{parent = root_window
		id = notification_box
		type = DescInterface
		desc = 'notification_box'}
	Wait \{3
		seconds}
	DestroyScreenElement \{id = notification_box}
endscript

script ui_destroy_boot_guitar 
	DestroyScreenElement \{id = current_menu}
	clean_up_user_control_helpers
endscript

script ui_boot_guitar_sound 
	switch (<instrument>)
		case guitar
		generic_menu_pad_choose_sound
		case drum
		generic_menu_pad_choose_sound
		case mic
		generic_menu_pad_choose_sound
	endswitch
endscript

script is_regular_controller 
	if IsGuitarController controller = <controller>
		return \{false}
	elseif IsDrumController controller = <controller>
		return \{false}
	endif
	return \{true}
endscript
