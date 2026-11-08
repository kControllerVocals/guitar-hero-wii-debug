freestyle_z_slide_in_card = 2
freestyle_z_slide_out_card = 1
freestyle_z_spawn = 10
freestyle_z_gem_fire = 50
freestyle_z_trail_fire = 49
freestyle_slide_offset = (-80.0, 80.0)
freestyle_slide_duration = 0.25
freestyle_slide_fade_duration = 0.15
freestyle_default_card_slide_bg = cardTiltDown
freestyle_card_burn_frames = (4.0, 2.0)
freestyle_card_burn_frame_length = 0.015999999
freestyle_card_spawn_frames = (4.0, 2.0)
freestyle_card_spawn_frame_length = 0.015999999
freestyle_card_gem_beat_division = 0.5
freestyle_card_gem_burn_frames = (3.0, 3.0)
freestyle_card_gem_burn_frame_length = 0.033
freestyle_transition_card_fx_frames = (4.0, 2.0)
freestyle_transition_card_fx_frame_length = 0.033
freestyle_card_slide_ids_in = [
	slide_card_in_1
	slide_card_in_2
	slide_card_in_3
]
freestyle_card_slide_ids_out = [
	slide_card_out_1
	slide_card_out_2
	slide_card_out_3
]
freestyle_card_slide_script_ids = [
	card_slide_script_1
	card_slide_script_2
	card_slide_script_3
]
freestyle_card_burn_ids = [
	card_burn_1
	card_burn_2
	card_burn_3
]
freestyle_card_burn_script_ids = [
	card_burn_script_1
	card_burn_script_2
	card_burn_script_3
]
freestyle_card_spawn_ids = [
	card_spawn_1
	card_spawn_2
	card_spawn_3
]
freestyle_card_spawn_script_ids = [
	card_spawn_script_1
	card_spawn_script_2
	card_spawn_script_3
]

script freestyle_init_card_effects 
	card = 0
	begin
	CreateScreenElement {
		type = SpriteElement
		parent = $freestyle_card_container_id
		id = ($freestyle_card_slide_ids_in [<card>])
		texture = $freestyle_default_card_slide_bg
		just = [center center]
		pos = ($freestyle_card_pos [<card>])
		rot_angle = ($freestyle_active_card_angles [<card>])
		z_priority = $freestyle_z_slide_in_card
		hide
	}
	CreateScreenElement {
		type = SpriteElement
		parent = $freestyle_card_container_id
		id = ($freestyle_card_slide_ids_out [<card>])
		texture = $freestyle_default_card_slide_bg
		just = [center center]
		pos = ($freestyle_card_pos [<card>])
		rot_angle = ($freestyle_active_card_angles [<card>])
		alpha = 0
		z_priority = freestyle_z_slide_out_card
		hide
	}
	CreateScreenElement {
		type = SpriteElement
		id = ($freestyle_card_burn_ids [<card>])
		parent = $freestyle_card_container_id
		texture = CardBurn
		just = [center center]
		pos = ($freestyle_card_pos [<card>])
		rot_angle = ($freestyle_active_card_angles [<card>])
		z_priority = $freestyle_z_card
		use_animated_uvs = true
		frame_length = $freestyle_card_burn_frame_length
		num_uv_frames = $freestyle_card_burn_frames
		scale = 0.25
		top_down_v
		loop_animated_uvs = false
		hide
	}
	CreateScreenElement {
		type = SpriteElement
		id = ($freestyle_card_spawn_ids [<card>])
		parent = $freestyle_card_container_id
		texture = CardSpawn
		just = [center center]
		pos = ($freestyle_card_pos [<card>])
		rot_angle = ($freestyle_active_card_angles [<card>])
		z_priority = $freestyle_z_spawn
		use_animated_uvs = true
		frame_length = $freestyle_card_spawn_frame_length
		num_uv_frames = $freestyle_card_spawn_frames
		scale = 0.25
		top_down_v
		blend = Add
		loop_animated_uvs = false
		hide
	}
	<card> = (<card> + 1)
	repeat $freestyle_active_card_count
endscript

script freestyle_destroy_card_effects 
	KillSpawnedScript \{name = freestyle_card_slide_effect}
	KillSpawnedScript \{name = freestyle_card_burn_effect}
	KillSpawnedScript \{name = freestyle_transition_card_burn_effect}
	KillSpawnedScript \{name = freestyle_card_spawn_effect}
	KillSpawnedScript \{name = freestyle_card_line_burn_effect}
	KillSpawnedScript \{name = freestyle_card_gem_flame_effect}
endscript

script freestyle_play_card_effect 
	switch (<effect>)
		case slide_up
		case slide_up_in_only
		case slide_down
		case slide_down_in_only
		KillSpawnedScript id = ($freestyle_card_slide_script_ids [<card>])
		spawnscriptnow {
			freestyle_card_slide_effect
			params = <...>
			id = ($freestyle_card_slide_script_ids [<card>])
		}
		case Burn
		KillSpawnedScript id = ($freestyle_card_burn_script_ids [<card>])
		spawnscriptnow {
			freestyle_card_burn_effect
			params = <...>
			id = ($freestyle_card_burn_script_ids [<card>])
		}
		case spawn
		KillSpawnedScript id = ($freestyle_card_spawn_script_ids [<card>])
		spawnscriptnow {
			freestyle_card_spawn_effect
			params = <...>
			id = ($freestyle_card_spawn_script_ids [<card>])
		}
		default
		ScriptAssert qs(0xf2d468ea) a = <effect>
	endswitch
endscript

script freestyle_hide_card_effects 
	KillSpawnedScript \{name = freestyle_card_slide_effect}
	KillSpawnedScript \{name = freestyle_card_burn_effect}
	KillSpawnedScript \{name = freestyle_transition_card_burn_effect}
	KillSpawnedScript \{name = freestyle_card_spawn_effect}
	KillSpawnedScript \{name = freestyle_card_line_burn_effect}
	card = 0
	begin
	if ScreenElementExists id = ($freestyle_card_slide_ids_out [<card>])
		SetScreenElementProps id = ($freestyle_card_slide_ids_out [<card>]) hide
	endif
	if ScreenElementExists id = ($freestyle_card_slide_ids_in [<card>])
		SetScreenElementProps id = ($freestyle_card_slide_ids_in [<card>]) hide
	endif
	if ScreenElementExists id = ($freestyle_card_burn_ids [<card>])
		SetScreenElementProps id = ($freestyle_card_burn_ids [<card>]) hide
	endif
	if ScreenElementExists id = ($freestyle_card_spawn_ids [<card>])
		SetScreenElementProps id = ($freestyle_card_spawn_ids [<card>]) hide
	endif
	freestyle_destroy_card_line_burn_effect card_id = ($freestyle_active_card_ids [<card>])
	<card> = (<card> + 1)
	repeat $freestyle_active_card_count
endscript

script freestyle_card_slide_effect 
	if NOT ScreenElementExists id = ($freestyle_active_card_ids [<card>])
		return
	endif
	cos ($freestyle_active_card_angles [<card>])
	sin ($freestyle_active_card_angles [<card>])
	source_pos = ($freestyle_card_pos [<card>])
	spawn_pos_in = (0.0, 0.0)
	target_pos_out = (0.0, 0.0)
	in_only = 0
	lefty_flip = ($freestyle_player_data [$freestyle_card_player].lefty)
	if ((<effect> = slide_up_in_only) || (<effect> = slide_down_in_only))
		<in_only> = 1
	endif
	switch (<effect>)
		case slide_up
		case slide_up_in_only
		SetPairComponents {
			spawn_pos_in
			x = (<source_pos> [0] - (<sin> * $freestyle_slide_offset [0]))
			y = (<source_pos> [1] - (<cos> * $freestyle_slide_offset [1]))
		}
		SetPairComponents {
			target_pos_out
			x = (<source_pos> [0] + (<sin> * $freestyle_slide_offset [0]))
			y = (<source_pos> [1] + (<cos> * $freestyle_slide_offset [1]))
		}
		case slide_down
		case slide_down_in_only
		SetPairComponents {
			spawn_pos_in
			x = (<source_pos> [0] + (<sin> * $freestyle_slide_offset [0]))
			y = (<source_pos> [1] + (<cos> * $freestyle_slide_offset [1]))
		}
		SetPairComponents {
			target_pos_out
			x = (<source_pos> [0] - (<sin> * $freestyle_slide_offset [0]))
			y = (<source_pos> [1] - (<cos> * $freestyle_slide_offset [1]))
		}
		default
		ScriptAssert qs(0x8b1191c2) a = <effect>
	endswitch
	SetScreenElementProps {
		id = ($freestyle_active_card_ids [<card>])
		alpha = 0.0
	}
	if (<in_only> = 0)
		SetScreenElementProps {
			id = ($freestyle_card_slide_ids_out [<card>])
			texture = <out_texture>
			pos = ($freestyle_card_pos [<card>])
			alpha = 1.0
			unhide
			flip_v = <lefty_flip>
		}
	endif
	SetScreenElementProps {
		id = ($freestyle_card_slide_ids_in [<card>])
		texture = <in_texture>
		pos = (<spawn_pos_in>)
		alpha = 0.0
		unhide
		flip_v = <lefty_flip>
	}
	if (<in_only> = 0)
		SetScreenElementProps {
			id = ($freestyle_card_slide_ids_out [<card>])
			pos = (<target_pos_out>)
			alpha = 0.0
			time = $freestyle_slide_duration
		}
	endif
	SetScreenElementProps {
		id = ($freestyle_card_slide_ids_in [<card>])
		pos = ($freestyle_card_pos [<card>])
		alpha = 1.0
		time = $freestyle_slide_duration
	}
	WaitScreenElementProps id = ($freestyle_card_slide_ids_in [<card>])
	SetScreenElementProps {
		id = {($freestyle_active_card_ids [<card>]) child = background}
		hide
	}
	SetScreenElementProps {
		id = ($freestyle_active_card_ids [<card>])
		alpha = 1.0
		time = $freestyle_slide_fade_duration
	}
	WaitScreenElementProps id = ($freestyle_active_card_ids [<card>])
	SetScreenElementProps {
		id = {($freestyle_active_card_ids [<card>]) child = background}
		unhide
	}
	SetScreenElementProps {
		id = ($freestyle_card_slide_ids_out [<card>])
		hide
	}
	SetScreenElementProps {
		id = ($freestyle_card_slide_ids_in [<card>])
		hide
	}
endscript

script freestyle_card_burn_effect 
	if ScreenElementExists id = ($freestyle_active_card_ids [<card>])
		SetScreenElementProps {
			id = ($freestyle_active_card_ids [<card>])
			hide
		}
	endif
	restart_animation id = ($freestyle_card_burn_ids [<card>])
	SetScreenElementProps id = ($freestyle_card_burn_ids [<card>]) unhide
	wait_for_animation id = ($freestyle_card_burn_ids [<card>])
	SetScreenElementProps id = ($freestyle_card_burn_ids [<card>]) hide
	freestyle_play_card_effect card = <card> effect = spawn
endscript

script freestyle_transition_card_burn_effect 
	card = 0
	begin
	restart_animation id = ($freestyle_card_burn_ids [<card>])
	SetScreenElementProps id = ($freestyle_card_burn_ids [<card>]) unhide
	<card> = (<card> + 1)
	repeat $freestyle_active_card_count
	wait_for_animation id = ($freestyle_card_burn_ids [0])
	<card> = 0
	begin
	SetScreenElementProps id = ($freestyle_card_burn_ids [<card>]) hide
	<card> = (<card> + 1)
	repeat $freestyle_active_card_count
endscript

script freestyle_card_spawn_effect 
	if NOT ScreenElementExists id = ($freestyle_active_card_ids [<card>])
		return
	endif
	restart_animation id = ($freestyle_card_spawn_ids [<card>])
	SetScreenElementProps id = ($freestyle_card_spawn_ids [<card>]) unhide
	if ScreenElementExists id = ($freestyle_active_card_ids [<card>])
		calculate_animation_time \{num_uv_frames = $freestyle_card_spawn_frames
			frame_length = $freestyle_card_spawn_frame_length}
		SetScreenElementProps {
			id = ($freestyle_active_card_ids [<card>])
			alpha = 0.0
			unhide
		}
		SetScreenElementProps {
			id = ($freestyle_active_card_ids [<card>])
			alpha = 1.0
			time = <anim_time>
		}
	endif
	wait_for_animation id = ($freestyle_card_spawn_ids [<card>])
	SetScreenElementProps id = ($freestyle_card_spawn_ids [<card>]) hide
endscript

script freestyle_card_gem_flame_effect 
	if ScreenElementExists id = <parent_id>
		CreateScreenElement {
			type = SpriteElement
			parent = <parent_id>
			texture = GemCardBurn
			just = [center center]
			pos = <pos>
			z_priority = $freestyle_z_gem_fire
			use_animated_uvs = true
			frame_length = $freestyle_card_gem_burn_frame_length
			num_uv_frames = $freestyle_card_gem_burn_frames
			scale = 0.5
			top_down_v
			loop_animated_uvs = false
		}
		wait_for_animation id = <id>
		DestroyScreenElement id = <id>
	endif
endscript

script freestyle_card_create_line_burn_effect 
	if NOT ScreenElementExists id = <card_id>
		return
	endif
	StringToCharArray string = (<card>.notes)
	gem_slot = (<gem_slot_begin> + 1)
	hold_length = 0
	begin
	if (<gem_slot> >= <gem_slot_end>)
		break
	endif
	if ((<char_array> [<gem_slot>]) = '-')
		<hold_length> = (<hold_length> + 1)
	endif
	<gem_slot> = (<gem_slot> + 1)
	repeat
	if (<hold_length> > 0)
		freestyle_destroy_card_line_burn_effect card_id = <card_id>
		ResolveScreenElementId id = {<card_id> child = gem_area}
		gem_area_id = <resolved_id>
		event_char = (<char_array> [<gem_slot_begin>])
		CardCharacterToGuitarEvent char = <event_char>
		if (<event> != 0)
			gem = 0
			begin
			if freestyle_card_event_needs_this_gem gem = <gem> event_mask = <event>
				freestyle_calculate_card_gem_pos {
					gem = <gem>
					gem_slot = <gem_slot_begin>
					gem_type = hold_gem
				}
				freestyle_calculate_card_line_burn_sprite_id card_id = <card_id> gem = <gem>
				CreateScreenElement {
					type = SpriteElement
					parent = <gem_area_id>
					id = <line_burn_sprite_id>
					texture = CardTrailBurn
					just = [center center]
					pos = <gem_pos>
					z_priority = $freestyle_z_trail_fire
					use_animated_uvs = true
					frame_length = 0.033
					num_uv_frames = (3.0, 2.0)
					scale = (0.33, 0.5)
					top_down_v
				}
			endif
			<gem> = (<gem> + 1)
			repeat $freestyle_card_gem_count
			freestyle_calculate_card_line_burn_script_id card_id = <card_id>
			spawnscriptnow {
				freestyle_card_line_burn_effect
				id = <line_burn_script_id>
				params = {
					card = <card>
					card_id = <card_id>
					gem_slot_begin = <gem_slot_begin>
					gem_slot_end = <gem_slot_end>
					hold_length = <hold_length>
				}
			}
		endif
	endif
endscript

script freestyle_card_line_burn_effect 
	gem_slot = (<gem_slot_begin> + 1)
	last_gem_slot = (<gem_slot_begin> + <hold_length>)
	GetMetronomeLengthOfBeat
	<length_of_beat> = (<length_of_beat> / 1000)
	length_of_division = (<length_of_beat> * $freestyle_card_gem_beat_division)
	begin
	GetMetronomeTimeBeforeNextBeat \{division = $freestyle_card_gem_beat_division}
	burn_time = (<next_beat_time> / 1000)
	if (<burn_time> < (<length_of_division> / 2))
		<burn_time> = (<burn_time> + <length_of_division>)
	endif
	gem = 0
	begin
	freestyle_calculate_card_line_burn_sprite_id card_id = <card_id> gem = <gem>
	if ScreenElementExists id = <line_burn_sprite_id>
		freestyle_calculate_card_gem_pos {
			gem = <gem>
			gem_slot = <gem_slot>
			gem_type = hold_bar
		}
		SetScreenElementProps {
			id = <line_burn_sprite_id>
			pos = <gem_pos>
			time = <burn_time>
		}
	endif
	<gem> = (<gem> + 1)
	repeat $freestyle_card_gem_count
	Wait <burn_time> seconds
	freestyle_card_create_gems {
		card = <card>
		card_id = <card_id>
		gem_effect = played
		gem_slot_begin = <gem_slot>
		gem_slot_end = (<gem_slot> + 1)
	}
	<gem_slot> = (<gem_slot> + 1)
	repeat <hold_length>
	gem = 0
	begin
	freestyle_calculate_card_line_burn_sprite_id card_id = <card_id> gem = <gem>
	if ScreenElementExists id = <line_burn_sprite_id>
		DestroyScreenElement id = <line_burn_sprite_id>
	endif
	<gem> = (<gem> + 1)
	repeat $freestyle_card_gem_count
endscript

script freestyle_calculate_card_line_burn_sprite_id 
	FormatText checksumname = suffix 'card_line_burn_sprite_%a' a = <gem>
	MangleChecksums a = <card_id> b = <suffix>
	return line_burn_sprite_id = <mangled_ID>
endscript

script freestyle_calculate_card_line_burn_script_id 
	MangleChecksums a = <card_id> b = card_line_burn_script
	return line_burn_script_id = <mangled_ID>
endscript

script freestyle_destroy_card_line_burn_effect 
	freestyle_calculate_card_line_burn_script_id card_id = <card_id>
	KillSpawnedScript id = <line_burn_script_id>
	gem = 0
	begin
	freestyle_calculate_card_line_burn_sprite_id card_id = <card_id> gem = <gem>
	if ScreenElementExists id = <line_burn_sprite_id>
		DestroyScreenElement id = <line_burn_sprite_id>
	endif
	<gem> = (<gem> + 1)
	repeat $freestyle_card_gem_count
endscript

script freestyle_is_card_line_burning 
	freestyle_calculate_card_line_burn_script_id card_id = <card_id>
	if ScriptIDIsRunning <line_burn_script_id>
		return \{true}
	endif
	return \{false}
endscript

script freestyle_add_transition_card_fx 
	card_width = ($freestyle_card_area [0])
	card_height = ($freestyle_card_area [1])
	left_pos = (0.0, 0.0)
	right_pos = (0.0, 0.0)
	top_pos = (0.0, 0.0)
	bottom_pos = (0.0, 0.0)
	SetPairComponents left_pos x = (0) y = (<card_height> / 2)
	SetPairComponents right_pos x = (<card_width>) y = (<card_height> / 2)
	SetPairComponents top_pos x = (<card_width> / 2) y = (0)
	SetPairComponents bottom_pos x = (<card_width> / 2) y = (<card_height> + 2)
	CreateScreenElement {
		type = SpriteElement
		parent = <card_id>
		local_id = edgefx_left
		texture = TransitionCardEdge
		just = [center center]
		pos = <left_pos>
		scale = (0.25, 0.25)
		use_animated_uvs = true
		frame_length = $freestyle_transition_card_fx_frame_length
		num_uv_frames = $freestyle_transition_card_fx_frames
		relative_z_priority = 1
		top_down_v
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <card_id>
		local_id = edgefx_right
		texture = TransitionCardEdge
		just = [center center]
		pos = <right_pos>
		scale = (0.25, 0.25)
		use_animated_uvs = true
		frame_length = $freestyle_transition_card_fx_frame_length
		num_uv_frames = $freestyle_transition_card_fx_frames
		relative_z_priority = 1
		rot_angle = 180
		top_down_v
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <card_id>
		local_id = edgefx_top
		texture = TransitionCardEdge
		just = [center center]
		pos = <top_pos>
		scale = (0.25, 0.2)
		use_animated_uvs = true
		frame_length = $freestyle_transition_card_fx_frame_length
		num_uv_frames = $freestyle_transition_card_fx_frames
		relative_z_priority = 1
		rot_angle = 90
		top_down_v
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <card_id>
		local_id = edgefx_bottom
		texture = TransitionCardEdge
		just = [center center]
		pos = <bottom_pos>
		scale = (0.25, 0.2)
		use_animated_uvs = true
		frame_length = $freestyle_transition_card_fx_frame_length
		num_uv_frames = $freestyle_transition_card_fx_frames
		relative_z_priority = 1
		rot_angle = 270
		top_down_v
	}
endscript
