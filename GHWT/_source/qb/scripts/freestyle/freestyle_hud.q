freestyle_flashy_text_max_dims = (500.0, 100.0)
freestyle_help_text_z = 10
freestyle_help_text_bg_rgba = [
	[
		96
		80
		0
		200
	]
	[
		60
		0
		0
		200
	]
]
freestyle_help_text_body_dims = (400.0, 80.0)
freestyle_help_text_dims = (320.0, 65.0)
freestyle_help_text_icon_pos = [
	(200.0, 0.0)
	(-200.0, 0.0)
]
freestyle_help_text_icon_texture = [
	TipIconGuitar
	TipIconDrums
]
freestyle_flashy_text_showing = 0
freestyle_help_text_showing = 0
freestyle_help_text_queue = {
}

script freetyle_init_hud 
	CreateScreenElement \{type = ContainerElement
		id = freestyle_hud
		parent = freestyle_root
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		z_priority = 0}
	CreateScreenElement \{type = TextBlockElement
		parent = freestyle_hud
		id = hud_flashy_text
		just = [
			center
			center
		]
		pos = (640.0, 360.0)
		dims = $freestyle_flashy_text_max_dims
		font = fontgrid_text_a6
		rgba = [
			145
			215
			235
			250
		]
		z_priority = 35
		fit_width = `scale each line to fit`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = Original
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [
			0
			0
			0
			255
		]
		hide}
	freestyle_init_help_text
	change \{freestyle_flashy_text_showing = 0}
	change \{freestyle_help_text_showing = 0}
endscript

script freestyle_deinit_hud 
	if ScreenElementExists \{id = freestyle_hud}
		DestroyScreenElement \{id = freestyle_hud}
	endif
	KillSpawnedScript \{name = freestyle_hud_help_text_script}
	KillSpawnedScript \{name = freestyle_hud_flashy_text_script}
	KillSpawnedScript \{name = freestyle_hud_generic_fade_in}
	KillSpawnedScript \{name = freestyle_hud_generic_fade_out}
	ClearStruct \{struct = freestyle_help_text_queue
		globalstruct}
endscript

script freestyle_hud_hide 
	SetScreenElementProps \{id = freestyle_hud
		hide}
endscript

script freestyle_hud_show 
	SetScreenElementProps \{id = freestyle_hud
		unhide}
endscript

script freestyle_hud_show_help_text \{duration = 7.0
		player = 0
		tag = -1}
	params = {
		text = <text>
		duration = <duration>
		player = <player>
		tag = <tag>
	}
	queue_push queue_name = freestyle_help_text_queue element = <params>
	if ($freestyle_help_text_showing = 0)
		KillSpawnedScript \{name = freestyle_hud_help_text_script}
		SpawnScript \{freestyle_hud_help_text_script}
	endif
endscript

script freestyle_hud_remove_help_text_for_player 
	queue_get_size \{queue_name = freestyle_help_text_queue}
	if (<queue_size> > 0)
		i = 0
		begin
		queue_get_element queue_name = freestyle_help_text_queue index = <i>
		if (<element>.player = <player>)
			queue_remove queue_name = freestyle_help_text_queue index = <i>
			<queue_size> = (<queue_size> - 1)
		else
			<i> = (<i> + 1)
		endif
		if (<i> >= <queue_size>)
			break
		endif
		repeat
	endif
endscript

script freestyle_hud_remove_help_text_tagged 
	queue_get_size \{queue_name = freestyle_help_text_queue}
	if (<queue_size> > 0)
		i = 0
		begin
		queue_get_element queue_name = freestyle_help_text_queue index = <i>
		if (<element>.tag = <tag>)
			queue_remove queue_name = freestyle_help_text_queue index = <i>
			<queue_size> = (<queue_size> - 1)
		else
			<i> = (<i> + 1)
		endif
		if (<i> >= <queue_size>)
			break
		endif
		repeat
	endif
endscript

script freestyle_hud_help_text_script 
	change \{freestyle_help_text_showing = 1}
	begin
	if queue_is_empty \{queue_name = freestyle_help_text_queue}
		break
	endif
	queue_pop \{queue_name = freestyle_help_text_queue}
	player = (<popped_element>.player)
	SetScreenElementProps {
		id = {hud_help_text child = icon}
		texture = ($freestyle_help_text_icon_texture [<player>])
		pos = ($freestyle_help_text_icon_pos [<player>])
	}
	SetScreenElementProps id = {hud_help_text child = bg_body} rgba = ($freestyle_help_text_bg_rgba [<player>])
	SetScreenElementProps id = {hud_help_text child = bg_left} rgba = ($freestyle_help_text_bg_rgba [<player>])
	SetScreenElementProps id = {hud_help_text child = bg_right} rgba = ($freestyle_help_text_bg_rgba [<player>])
	SetScreenElementProps \{id = hud_help_text
		alpha = 0.0
		unhide}
	SetScreenElementProps id = {hud_help_text child = text} text = (<popped_element>.text)
	SetScreenElementProps \{id = hud_help_text
		alpha = 1.0
		time = 0.3}
	WaitScreenElementProps \{id = hud_help_text}
	Wait (<popped_element>.duration) seconds
	SetScreenElementProps \{id = hud_help_text
		alpha = 0.0
		time = 0.3}
	WaitScreenElementProps \{id = hud_help_text}
	SetScreenElementProps \{id = hud_help_text
		hide}
	Wait \{2
		seconds}
	repeat
	change \{freestyle_help_text_showing = 0}
endscript

script freestyle_hud_show_flashy_text \{duration = 2.0}
	KillSpawnedScript \{name = freestyle_hud_flashy_text_script}
	RunScriptOnScreenElement freestyle_hud_flashy_text_script id = hud_flashy_text params = <...>
endscript

script freestyle_hud_flashy_text_script 
	change \{freestyle_flashy_text_showing = 1}
	SE_SetProps text = <text> fit_width = `expand dims` dims = (0.0, 0.0) single_line = true
	SE_GetProps
	if ((<dims> [0]) > ($freestyle_flashy_text_max_dims [0]))
		SE_SetProps \{fit_width = `scale each line to fit`
			dims = $freestyle_flashy_text_max_dims
			single_line = false}
	endif
	SE_SetProps \{unhide
		alpha = 0.0}
	SE_SetProps \{alpha = 1.0
		time = 0.1}
	SE_WaitProps
	rotation = 10
	begin
	<rotation> = (<rotation> * -0.7)
	SE_SetProps rot_angle = <rotation> time = 0.08 motion = ease_out
	SE_WaitProps
	repeat 12
	SE_SetProps \{rot_angle = 0
		time = 0.08}
	Wait <duration> seconds
	SE_SetProps \{alpha = 0.0
		time = 0.1}
	SE_WaitProps
	SE_SetProps \{hide}
	change \{freestyle_flashy_text_showing = 0}
endscript

script freestyle_hud_create_button_prompt \{parent = freestyle_hud
		z_priority = 0}
	CreateScreenElement {
		id = <id>
		parent = <parent>
		type = DescInterface
		desc = 'helper_pill'
		auto_dims = false
		dims = (0.0, 36.0)
		pos = <pos>
		helper_button_text = <buttonchar>
		helper_description_text = <text>
		helper_pill_rgba = [0 0 0 255]
		helper_description_rgba = [255 255 255 255]
		z_priority = <z_priority>
	}
	<id> :SE_GetProps
	<id> :SE_SetProps {
		helper_pill_body_dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (0.0, 32.0))
		dims = (((0.6, 0.0) * <helper_pill_menu_dims> [0]) + (64.0, 32.0))
	}
endscript

script freestyle_hud_start_countdown 
	freestyle_hud_stop_countdown
	CreateScreenElement \{type = ContainerElement
		id = freestyle_countdown
		parent = freestyle_hud
		pos = (640.0, 320.0)
		just = [
			center
			center
		]
		internal_just = [
			center
			center
		]
		z_priority = 50
		alpha = 0.0}
	CreateScreenElement \{type = SpriteElement
		parent = freestyle_countdown
		local_id = background
		texture = CountdownBG
		just = [
			center
			center
		]
		pos = (0.0, 0.0)
		relative_z_priority = 0}
	CreateScreenElement \{type = TextElement
		parent = freestyle_countdown
		local_id = text
		just = [
			center
			center
		]
		pos = (0.0, 0.0)
		font = fontgrid_numeral_a7
		rgba = [
			255
			255
			255
			255
		]
		relative_z_priority = 1}
	freestyle_hud_update_countdown time = <time>
	RunScriptOnScreenElement \{freestyle_hud_generic_fade_in
		id = freestyle_countdown}
endscript

script freestyle_hud_stop_countdown 
	if ScreenElementExists \{id = freestyle_countdown}
		DestroyScreenElement \{id = freestyle_countdown}
	endif
endscript

script freestyle_hud_update_countdown 
	if NOT ScreenElementExists \{id = freestyle_countdown}
		return
	endif
	time_seconds = ((<time> / 1000) + 1)
	FormatText TextName = time_text qs("%a") a = <time_seconds>
	SetScreenElementProps id = {freestyle_countdown child = text} text = <time_text>
endscript

script freestyle_hud_generic_fade_in \{fade_time = 0.5}
	SE_SetProps alpha = 1.0 time = <fade_time>
	SE_WaitProps
endscript

script freestyle_hud_generic_fade_out \{fade_time = 0.5}
	SE_SetProps alpha = 0.0 time = <fade_time>
	SE_WaitProps
endscript

script freestyle_hud_generic_fade_out_and_die \{fade_time = 0.5}
	SE_SetProps alpha = 0.0 time = <fade_time>
	SE_WaitProps
	Die
endscript

script freestyle_init_help_text 
	end_dims = (0.0, 0.0)
	left_pos = (0.0, 0.0)
	right_pos = (0.0, 0.0)
	SetPairComponents end_dims x = 16 y = ($freestyle_help_text_body_dims [1])
	SetPairComponents left_pos x = (($freestyle_help_text_body_dims [0] / -2) - 8) y = 0
	SetPairComponents right_pos x = (($freestyle_help_text_body_dims [0] / 2) + 8) y = 0
	CreateScreenElement \{type = ContainerElement
		id = hud_help_text
		parent = freestyle_hud
		pos = (640.0, 440.0)
		just = [
			center
			center
		]
		internal_just = [
			center
			center
		]
		z_priority = $freestyle_help_text_z
		hide}
	CreateScreenElement \{local_id = bg_body
		parent = hud_help_text
		type = SpriteElement
		texture = helper_pill_body
		dims = $freestyle_help_text_body_dims
		pos = (0.0, 0.0)
		just = [
			center
			center
		]}
	CreateScreenElement {
		local_id = bg_left
		parent = hud_help_text
		type = SpriteElement
		texture = helper_pill_end
		dims = <end_dims>
		pos = <left_pos>
		just = [center center]
		flip_v = true
	}
	CreateScreenElement {
		local_id = bg_right
		parent = hud_help_text
		type = SpriteElement
		texture = helper_pill_end
		dims = <end_dims>
		pos = <right_pos>
		just = [center center]
	}
	CreateScreenElement \{type = TextBlockElement
		parent = hud_help_text
		local_id = text
		just = [
			center
			center
		]
		internal_just = [
			center
			center
		]
		pos = (0.0, 0.0)
		font = fontgrid_title_gh3
		rgba = [
			255
			255
			255
			255
		]
		fit_width = wrap
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = Original
		dims = $freestyle_help_text_dims
		relative_z_priority = 2}
	CreateScreenElement {
		type = SpriteElement
		parent = hud_help_text
		local_id = icon
		just = [center center]
		internal_just = [center center]
		pos = ($freestyle_help_text_icon_pos [0])
		texture = ($freestyle_help_text_icon_texture [0])
		relative_z_priority = 1
	}
endscript
