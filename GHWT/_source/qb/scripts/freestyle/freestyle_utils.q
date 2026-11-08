
script container_dim_debug 
	GetScreenElementProps id = <container>
	CreateScreenElement {
		type = SpriteElement
		parent = <container>
		pos = (0.0, 0.0)
		dims = <dims>
		just = [left top]
		texture = white
		z_priority = <z_priority>
	}
endscript

script calculate_animation_time 
	return anim_time = (<num_uv_frames> [0] * <num_uv_frames> [1] * <frame_length>)
endscript

script wait_for_animation 
	begin
	if NOT ScreenElementExists id = <id>
		break
	endif
	GetScreenElementProps id = <id>
	if (<animated_uvs_done> = true)
		break
	endif
	Wait \{1
		frame}
	repeat
endscript

script is_guitarist_human 
	player = 0
	begin
	if ($freestyle_player_data [<player>].instrument = guitar)
		if has_valid_controller player = <player>
			return \{true}
		else
			return \{false}
		endif
	endif
	<player> = (<player> + 1)
	repeat $freestyle_max_players
	return \{false}
endscript

script is_drummer_human 
	player = 0
	begin
	if ($freestyle_player_data [<player>].instrument = Drums || $freestyle_player_data [<player>].instrument = DrumKit)
		if has_valid_controller player = <player>
			return \{true}
		else
			return \{false}
		endif
	endif
	<player> = (<player> + 1)
	repeat $freestyle_max_players
	return \{false}
endscript

script is_guitarist_human 
	player = 0
	begin
	if ($freestyle_player_data [<player>].instrument = guitar)
		if has_valid_controller player = <player>
			return \{true}
		else
			return \{false}
		endif
	endif
	<player> = (<player> + 1)
	repeat $freestyle_max_players
	return \{false}
endscript

script has_valid_controller 
	if (($freestyle_player_data [<player>].controller >= 0) && ($freestyle_player_data [<player>].controller < 4))
		return \{true}
	endif
	return \{false}
endscript

script format_time 
	time = <Ms>
	minutes = (<time> / 60000)
	<time> = (<time> - (<minutes> * 60000))
	seconds = (<time> / 1000)
	if (<seconds> < 10)
		FormatText TextName = formatted_time '%m:0%s' m = <minutes> s = <seconds>
	else
		FormatText TextName = formatted_time '%m:%s' m = <minutes> s = <seconds>
	endif
	return formatted_time = <formatted_time>
endscript

script restart_animation 
	if ScreenElementExists id = <id>
		SetScreenElementProps id = <id> current_frames = (0.0, 0.0)
	endif
endscript

script queue_push 
	queue_get_size queue_name = <queue_name>
	queue_get_index index = <queue_size>
	SetStructureParam struct_name = <queue_name> param = <queue_index> value = <element>
	SetStructureParam struct_name = <queue_name> param = size value = (<queue_size> + 1)
endscript

script queue_pop 
	queue_remove queue_name = <queue_name> index = 0
	return popped_element = <removed_element>
endscript

script queue_remove 
	queue_get_size queue_name = <queue_name>
	if (<queue_size> <= <index>)
		ScriptAssert {
			qs(0xe98caf72)
			q = <queue_name>
			i = <index>
			s = <queue_size>
		}
	endif
	queue_get_index index = <index>
	removed_element = ($<queue_name>.<queue_index>)
	if (<queue_size> > 1)
		i = <index>
		begin
		queue_get_index index = (<i> + 1)
		next_index = <queue_index>
		queue_get_index index = (<i>)
		current_index = <queue_index>
		SetStructureParam struct_name = <queue_name> param = <current_index> value = ($<queue_name>.<next_index>)
		<i> = (<i> + 1)
		repeat (<queue_size> - 1)
	endif
	SetStructureParam struct_name = <queue_name> param = size value = (<queue_size> - 1)
	return removed_element = <removed_element>
endscript

script queue_get_element 
	queue_get_index index = <index>
	if NOT StructureContains Structure = $<queue_name> <queue_index>
		ScriptAssert qs(0x4805390d) q = <queue_name> i = <index>
	endif
	return element = ($<queue_name>.<queue_index>)
endscript

script queue_get_size 
	queue_size = 0
	if StructureContains Structure = $<queue_name> size
		<queue_size> = ($<queue_name>.size)
	endif
	return queue_size = <queue_size>
endscript

script queue_is_empty 
	queue_get_size queue_name = <queue_name>
	if (<queue_size> > 0)
		return \{false}
	endif
	return \{true}
endscript

script queue_get_index 
	FormatText checksumname = queue_index '%a' a = <index>
	return queue_index = <queue_index>
endscript

script create_screen_blackout \{alpha = 0.65000004
		z = 0}
	destroy_screen_blackout
	CreateScreenElement {
		type = SpriteElement
		parent = root_window
		id = screen_blackout
		texture = black
		rgba = [0 0 0 255]
		pos = (640.0, 360.0)
		dims = (1280.0, 720.0)
		just = [center center]
		z_priority = <z>
		alpha = <alpha>
	}
endscript

script destroy_screen_blackout 
	if ScreenElementExists \{id = screen_blackout}
		DestroyScreenElement \{id = screen_blackout}
	endif
endscript

script int_to_bool 
	RequireParams \{[
			int_value
			bool_name
		]
		all}
	if (<int_value> = 1)
		bool_value = true
	else
		bool_value = false
	endif
	return_params = {}
	SetStructureParam struct_name = return_params param = <bool_name> value = <bool_value>
	return <return_params>
endscript

script bool_to_int 
	RequireParams \{[
			bool_value
			int_name
		]
		all}
	if (<bool_value> = true)
		int_value = 1
	else
		int_value = 0
	endif
	return_params = {}
	SetStructureParam struct_name = return_params param = <int_name> value = <int_value>
	return <return_params>
endscript
