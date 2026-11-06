
script create_snazzy_dialog_box \{title = qs(0x904123d5)
		text = qs(0xa271135e)
		anchor_id = dialog_box_anchor
		vmenu_id = dialog_box_vmenu
		container_id = dialog_box_container
		title_font = text_a1
		font = text_a1
		text_font = text_a1
		pos = (320.0, 230.0)
		just = [
			center
			top
		]
		scale = 0.8
		line_spacing = 1
		title_scale = 0.7
		text_scale = 0.6
		text_dims = (530.0, 0.0)
		exclusive_device = -1
		pos_tweak = (0.0, -50.0)
		bg_rgba = [
			8
			15
			24
			170
		]
		title_rgba = [
			90
			90
			70
			255
		]
		text_rgba = [
			90
			70
			50
			255
		]
		bg_scale = 1
		hmenu_pos = (0.0, 50.0)
		z_priority = 40
		no_bg
		destroy_on_event = 1}
	if screenelementexists id = <anchor_id>
		dialog_box_exit anchor_id = <anchor_id>
	endif
	if NOT innetgame
		if NOT infrontend
		endif
	endif
	setscreenelementlock \{id = root_window
		off}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = <anchor_id>
		dims = (640.0, 480.0)
		pos = <pos>
		just = [center center]
		z_priority = <z_priority>
		priority = <priority>
		exclusive_device = <exclusive_device>
	}
	createscreenelement {
		type = containerelement
		id = <container_id>
		parent = <anchor_id>
		dims = (640.0, 480.0)
		pos = <pos>
		just = [center center]
		z_priority = <z_priority>
		priority = <priority>
	}
	createscreenelement {
		type = containerelement
		parent = <anchor_id>
		dims = (640.0, 480.0)
		pos = (320.0, 240.0)
		just = [center center]
		z_priority = <z_priority>
	}
	<bg_anchor_id> = <id>
	if gotparam \{from_cas}
		make_cas_bg_elements parent = <bg_anchor_id>
	else
		if infrontend
			if NOT gotparam \{no_bg}
			endif
		endif
	endif
	if gotparam \{forced_pos}
		pos = <forced_pos>
	endif
	createscreenelement {
		type = vmenu
		parent = <container_id>
		id = <vmenu_id>
		pos = <pos>
		just = [center top]
		internal_just = [center top]
		scale = <scale>
		z_priority = <z_priority>
		padding_scale = 0.8
		exclusive_device = <exclusive_device>
	}
	if NOT gotparam \{no_helper_text}
		if gotparam \{buttons}
			getarraysize <buttons>
			if gotparam \{pad_back_script}
				if (<array_size> = 1)
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						$generic_dialog_helper_text3
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						$generic_helper_text
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				endif
			else
				if (<array_size> = 1)
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						$generic_dialog_helper_text
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				else
					create_helper_text {anchor_id = <helper_text_anchor_id>
						parent = <bg_anchor_id>
						$generic_dialog_helper_text2
						bg_rgba = <helper_text_bg_rgba>
						z_priority = <z_priority>
					}
				endif
			endif
		endif
	endif
	createscreenelement {
		type = textelement
		parent = <vmenu_id>
		local_id = dbox_title
		font = <title_font>
		text = <title>
		just = [center top]
		rgba = <title_rgba>
		scale = <title_scale>
		z_priority = <z_priority>
		not_focusable
		padding_scale = 0.55
	}
	<title_id> = <id>
	getscreenelementdims id = <title_id>
	if gotparam \{use_goalmenu_bg}
		bg_rgba = [20 30 40 80]
		createscreenelement {
			type = spriteelement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_frame
			just = [center top]
			pos = (85.0, -20.0)
			rgba = [0 10 20 255]
			scale = (2.125, 1.0)
			z_priority = (<z_priority> -1)
			flip_v
		}
		createscreenelement {
			type = spriteelement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_middle
			just = [center top]
			pos = (85.0, 10.0)
			rgba = [0 10 20 255]
			scale = (2.125, 1.5)
			z_priority = (<z_priority> -1)
			flip_v
		}
		createscreenelement {
			type = spriteelement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_frame_b
			just = [center top]
			pos = (85.0, 30.0)
			rgba = [0 10 20 255]
			scale = (2.125, 1.0)
			z_priority = (<z_priority> -1)
			flip_v
		}
		createscreenelement {
			type = spriteelement
			parent = {<vmenu_id> child = dbox_title}
			texture = menu_selection_white_02
			just = [center top]
			pos = (85.0, 50.0)
			rgba = [5 15 25 70]
			scale = (1.5, 1.0)
			z_priority = (<z_priority> -1)
		}
		createscreenelement {
			type = spriteelement
			parent = {<vmenu_id> child = dbox_title}
			texture = dialog_frame_b
			just = [center top]
			pos = (85.0, 103.0)
			rgba = [5 15 25 100]
			scale = (2.125, 0.25)
			z_priority = (<z_priority> -1)
		}
	endif
	createscreenelement {
		type = textblockelement
		parent = <vmenu_id>
		font = <text_font>
		text = <text>
		just = [center top]
		dims = <text_dims>
		rgba = <text_rgba>
		scale = <text_scale>
		line_spacing = <line_spacing>
		allow_expansion
		not_focusable
		padding_scale = 0.65000004
	}
	<text_id> = <id>
	getscreenelementdims id = <text_id>
	if gotparam \{buttons}
		createscreenelement {
			type = containerelement
			parent = <vmenu_id>
			dims = (<text_dims> + (50.0, 40.0))
			not_focusable
		}
	endif
	if gotparam \{logo}
		createscreenelement {
			type = containerelement
			parent = <vmenu_id>
			just = [center center]
			dims = (0.0, 88.0)
		}
		createscreenelement {
			type = spriteelement
			parent = <id>
			texture = <logo>
			just = [center top]
			rgba = [100 100 100 255]
			scale = ((1.4, 1.3) * 1.4)
		}
		no_icon = no_icon
	endif
	if gotparam \{pad_back_script}
		setscreenelementprops {
			id = <vmenu_id>
			event_handlers = [{pad_back <pad_back_script> params = <pad_back_params>}]
			replace_handlers
		}
	endif
	setscreenelementlock id = <vmenu_id> on
	setscreenelementlock id = <vmenu_id> off
	getscreenelementdims id = <vmenu_id>
	section_width = ((<width> / 100.0) + 0.0)
	if gotparam \{buttons}
		foreachin <buttons> do = create_dialog_button params = {
			font = <font>
			parent = <vmenu_id>
			z_priority = (<z_priority> + 4)
			width = <section_width>
			pad_focus_script = <pad_focus_script>
			destroy_on_event = <destroy_on_event>
		}
		getarraysize <buttons>
		if (<array_size> > 1)
			setscreenelementprops {
				id = <vmenu_id>
				event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
			}
		endif
	endif
	if gotparam \{sub_logo}
		createscreenelement {
			type = spriteelement
			parent = <vmenu_id>
			texture = <sub_logo>
			just = [center center]
			rgba = [128 128 128 88]
			scale = (1.25, 1.0)
			not_focusable
		}
		no_icon = no_icon
	endif
	setscreenelementlock id = <vmenu_id> on
	setscreenelementlock id = <vmenu_id> off
	getscreenelementdims id = <vmenu_id>
	section_width = ((<width> / 100.0) + 0.0)
	section_height = 32
	num_parts = (((<height> * 1.0) / (<section_height> * 1.0)) -1.0)
	if NOT gotparam \{forced_pos}
		centered_pos = ((320.0, 0.0) + ((0.0, 1.0) * (480 - <height>) / 2) + <pos_tweak>)
		setscreenelementprops id = <vmenu_id> pos = <centered_pos>
	else
		centered_pos = <forced_pos>
	endif
	<bg_x_scale> = 1.2
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		pos = <centered_pos>
		just = [center bottom]
		texture = dialog_frame
		scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <bg_rgba>
		z_priority = 38
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = dialog_middle
		pos = (<centered_pos> - (0.0, 16.0))
		scale = (((1.0, 0.0) * <bg_x_scale>) + (0.0, 1.0) * (<height> / 16.0))
		just = [center top]
		rgba = <bg_rgba>
		z_priority = 38
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		pos = (<centered_pos> + (0.0, 1.0) * (<height>) + (0.0, 15.0))
		just = [center bottom]
		texture = dialog_frame_b
		scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <bg_rgba>
		z_priority = 38
	}
	kill_start_key_binding
	if objectexists \{id = no_button}
		launchevent type = focus target = <vmenu_id> data = {child_id = no_button}
	else
		launchevent type = focus target = <vmenu_id>
	endif
	if gotparam \{delay_input}
		runscriptonscreenelement id = <anchor_id> dialog_box_delay_input params = {delay_input_time = <delay_input_time>}
	endif
	if NOT gotparam \{no_animate}
		if gotparam \{style}
			runscriptonscreenelement id = <anchor_id> <style> params = <...>
		else
			if NOT gotparam \{full_animate}
				runscriptonscreenelement id = <container_id> animate_dialog_box_in params = <...>
			else
				runscriptonscreenelement id = <anchor_id> animate_dialog_box_in params = <...>
			endif
		endif
	endif
	if objectexists \{id = current_menu_anchor}
		launchevent \{type = unfocus
			target = current_menu_anchor}
	endif
	if objectexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
endscript

script create_dialog_box 
	create_snazzy_dialog_box <...>
endscript

script button_choose_script 
	destroy_dialog_box
	<callback_script> <callback_params>
endscript

script create_dialog_button \{focus_script = main_theme_focus
		focus_params = {
			highlighted_text_rgba = [
				0
				20
				30
				255
			]
		}
		unfocus_script = main_theme_unfocus
		unfocus_params = {
			text_rgba = [
				80
				90
				100
				255
			]
		}
		pad_choose_script = destroy_dialog_box
		font = text_a1
		parent = dialog_box_vmenu
		width = 3
		z_priority = 14
		button_text_scale = 0.5
		button_dims = (0.0, 30.0)
		text_color = [
			80
			90
			100
			255
		]
		destroy_on_event = 1}
	setscreenelementlock \{id = root_window
		off}
	setscreenelementlock id = <parent> off
	if NOT gotparam \{ignore_default_option}
		if (<text> = qs(0x7960546e))
			id = no_button
		endif
	endif
	if (<destroy_on_event> = 1)
		<pad_choose_params> = {callback_script = <pad_choose_script> callback_params = <pad_choose_params>}
		<pad_choose_script> = button_choose_script
	else
	endif
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <id>
		dims = <button_dims>
		just = [center center]
		event_handlers =
		[
			{focus <focus_script> params = <focus_params>}
			{unfocus <unfocus_script> params = <unfocus_params>}
			{pad_choose generic_menu_pad_choose_sound}
			{pad_start generic_menu_pad_choose_sound}
			{pad_choose <pad_choose_script> params = <pad_choose_params>}
			{pad_start <pad_choose_script> params = <pad_choose_params>}
		]
		<not_focusable>
	}
	anchor_id = <id>
	createscreenelement {
		type = textelement
		parent = <anchor_id>
		pos = (0.0, 0.0)
		font = <font>
		text = <text>
		just = [center center]
		scale = <button_text_scale>
		rgba = <text_color>
		z_priority = <z_priority>
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = menu_selection_white_01
		scale = (0.6, 0.5)
		rgba = [86 88 90 155]
		z_priority = (<z_priority> -1)
		local_id = highlight_bar
		alpha = 0
		Random (@ flip_h @ flip_v @ )
	}
	highlight_angle = 0
	bar_scale = ((<width> + 2) * (0.5, 0.0) + (0.0, 0.7))
	highlight_angle = (<highlight_angle> / (<bar_scale>.(1.0, 0.0)))
endscript

script destroy_dialog_box \{anchor_id = dialog_box_anchor}
	if NOT gotparam \{dont_restore_input}
		setbuttoneventmappings \{unblock_menu_input}
	endif
	debounce \{x
		time = 0.3}
	if objectexists id = <anchor_id>
		destroyscreenelement id = <anchor_id>
	endif
	if NOT gotparam \{dont_focus}
		if objectexists \{id = current_menu_anchor}
			launchevent \{type = focus
				target = current_menu_anchor}
		endif
	endif
endscript

script dialog_box_exit \{anchor_id = dialog_box_anchor}
	destroy_dialog_box <...>
	if NOT gotparam \{dont_restore_input}
		setbuttoneventmappings \{unblock_menu_input}
	endif
	debounce \{x
		time = 0.3}
	if objectexists id = <anchor_id>
		destroyscreenelement id = <anchor_id>
	endif
	if NOT gotparam \{no_pad_start}
		if NOT infrontend
			restore_start_key_binding
		endif
	endif
endscript

script dialog_box_delay_input \{delay_input_time = 2000}
	temporarilydisableinput time = <delay_input_time>
endscript
dont_create_speech_boxes = 0

script create_speech_box 
	killspawnedscript \{id = create_speech_box_guts}
	spawnscriptnow create_speech_box_guts params = {<...>}
endscript

script create_speech_box_guts \{pos = (640.0, 560.0)
		bg_rgba = [
			8
			15
			24
			50
		]
		text_rgba = [
			100
			90
			80
			255
		]
		anchor_id = speech_box_anchor
		scale = (1.7, 0.71999997)
		pad_choose_script = speech_box_exit
		pad_choose_params = {
		}
		parent = root_window
		bg_x_scale = 1.12
		pause_input_time = 1000}
	font = text_a1
	if objectexists id = <anchor_id>
		destroyscreenelement id = <anchor_id>
	endif
	setscreenelementlock \{id = root_window
		off}
	createscreenelement {
		type = containerelement
		parent = <parent>
		id = <anchor_id>
		pos = <pos>
		just = [center bottom]
		scale = <scale>
		z_priority = <z_priority>
	}
	if NOT gotparam \{no_pad_choose}
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_choose speech_box_input_debounce}
				{pad_choose <pad_choose_script> params = <pad_choose_params>}]
			replace_handlers
		}
	endif
	if gotparam \{pad_back_script}
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_back speech_box_input_debounce}
				{pad_back <pad_back_script> params = <pad_back_params>}]
			replace_handlers
		}
	endif
	if gotparam \{pad_option_script}
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [
				{pad_option <pad_option_script> params = <pad_option_params>}]
			replace_handlers
		}
	endif
	if gotparam \{pad_option2_script}
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_option2 speech_box_input_debounce}
				{pad_option2 <pad_option2_script> params = <pad_option2_params>}]
			replace_handlers
		}
	endif
	if gotparam \{pad_up_script}
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_up <pad_up_script> params = <pad_up_params>}]
			replace_handlers
		}
	endif
	if gotparam \{pad_down_script}
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_down <pad_down_script> params = <pad_down_params>}]
			replace_handlers
		}
	endif
	if gotparam \{pad_left_script}
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_left <pad_left_script> params = <pad_left_params>}]
			replace_handlers
		}
	endif
	if gotparam \{pad_right_script}
		setscreenelementprops {
			id = <anchor_id>
			event_handlers = [{pad_right <pad_right_script> params = <pad_right_params>}]
			replace_handlers
		}
	endif
	if NOT gotparam \{no_pad_start}
		setscreenelementprops {
			id = root_window
			event_handlers = [{pad_start <pad_choose_script> params = <pad_choose_params>}]
			replace_handlers
		}
	endif
	createscreenelement {
		type = textblockelement
		parent = <anchor_id>
		font = <font>
		dims = (540.0, 0.0)
		just = [center bottom]
		text = <text>
		rgba = <text_rgba>
		scale = (0.5, 1.05)
		allow_expansion
	}
	<speech_text> = <id>
	getscreenelementdims id = <speech_text>
	speech_text_height = <height>
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		just = [center top]
		texture = dialog_frame_b
		scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <bg_rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		pos = ((0.0, -1.0) * <speech_text_height>)
		just = [center bottom]
		texture = dialog_frame
		scale = ((1.0, 0.0) * <bg_x_scale> + (0.0, 1.0))
		rgba = <bg_rgba>
	}
	createscreenelement {
		type = spriteelement
		parent = <anchor_id>
		texture = dialog_middle
		scale = (((1.0, 0.0) * <bg_x_scale>) + ((0.0, 1.0) * (<speech_text_height> / 16.0)))
		just = [center bottom]
		rgba = <bg_rgba>
	}
	getscreenelementprops id = <id>
	pos_top = (<pos> [1])
	if gotparam \{style}
		runscriptonscreenelement id = <anchor_id> <style> params = <...>
	endif
	launchevent type = focus target = <anchor_id>
	if gotparam \{pause_input}
		spawnscriptlater temporarilydisableinput params = {time = <pause_input_time>}
	endif
endscript

script speech_box_exit \{anchor_id = speech_box_anchor}
	if objectexists id = <anchor_id>
		destroyscreenelement id = <anchor_id>
	endif
	debounce \{x
		time = 0.3}
	debounce \{circle
		time = 0.3}
	if NOT gotparam \{no_pad_start}
		restore_start_key_binding
	endif
	launchevent \{type = speech_box_destroyed}
endscript

script speech_box_input_debounce 
	debounce \{x
		time = 0.3
		clear = 1}
	debounce \{circle
		time = 0.3
		clear = 1}
	debounce \{square
		time = 0.3
		clear = 1}
	debounce \{triangle
		time = 0.3
		clear = 1}
endscript

script hide_speech_text 
	legacydomorph \{time = 0
		scale = 0}
endscript

script speech_box_style_scale_text 
	wait \{0.05
		second}
	legacydomorph \{time = 0
		scale = (1.0, 1.0)
		alpha = 0}
	legacydomorph \{time = 0.5
		scale = (1.0, 1.0)
		alpha = 1}
	launchevent type = focus target = <anchor_id>
endscript

script animate_dialog_box_in 
	if gotparam \{full_animate}
		setscreenelementprops {
			id = <bg_anchor_id>
			hide
		}
	endif
	if NOT gotparam \{delay_input}
		<bg_anchor_id> :obj_spawnscriptlater dialog_box_delay_input params = {delay_input_time = 300}
	endif
	legacydomorph \{time = 0
		scale = (0.0, 0.0)
		alpha = 0.1}
	legacydomorph \{time = 0.15
		scale = (1.0, 0.0)
		alpha = 0.4}
	legacydomorph \{time = 0.15
		scale = (1.0, 1.0)
		alpha = 1.0}
	if gotparam \{full_animate}
		setscreenelementprops {
			id = <bg_anchor_id>
			unhide
		}
	endif
endscript

script create_test_dialog 
	if screenelementexists \{id = current_menu_anchor}
		destroyscreenelement \{id = current_menu_anchor}
	endif
	create_dialog_box \{pad_back_script = create_test_menu
		buttons = [
			{
				font = text_a1
				text = qs(0x7960546e)
				pad_choose_script = create_test_menu
			}
			{
				font = text_a1
				text = qs(0xe20452d6)
				pad_choose_script = null_script
			}
		]}
endscript
