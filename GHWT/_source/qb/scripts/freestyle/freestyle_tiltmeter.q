freestyle_tilt_meter_pos = [
	(531.0, 135.0)
	(750.0, 135.0)
]
freestyle_tilt_meter_rot = [
	-7.5
	7.5
]
freestyle_tilt_meter_dims = (128.0, 256.0)
freestyle_tilt_meter_active_bar_alpha = 1
freestyle_tilt_meter_inactive_bar_max_alpha = 1
freestyle_tilt_meter_flame_pos_x = 58
freestyle_tilt_meter_flame_pos_y = 10
freestyle_tilt_meter_flame_rot = -7.5
freestyle_tilt_meter_flame_scale = 2.0
freestyle_tilt_meter_z = 0

script freestyle_init_tilt_meter 
	pos1 = ($freestyle_tilt_meter_pos [0])
	pos2 = ($freestyle_tilt_meter_pos [1])
	rot1 = ($freestyle_tilt_meter_rot [0])
	rot2 = ($freestyle_tilt_meter_rot [1])
	CreateScreenElement {
		id = freestyle_tilt_meter
		type = SpriteElement
		parent = freestyle_hud
		texture = TiltMeterBG_OFF
		rgba = [255 255 255 255]
		pos = <pos1>
		dims = $freestyle_tilt_meter_dims
		rot_angle = <rot1>
		just = [center center]
		z_priority = $freestyle_tilt_meter_z
	}
	CreateScreenElement {
		id = freestyle_tilt_meter_low_highlight
		type = SpriteElement
		parent = freestyle_tilt_meter
		texture = LowTilt_HIGHLIGHT
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 1)
		alpha = 0
	}
	CreateScreenElement {
		id = freestyle_tilt_meter_mid_highlight
		type = SpriteElement
		parent = freestyle_tilt_meter
		texture = MidTilt_HIGHLIGHT
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 1)
		alpha = 0
	}
	CreateScreenElement {
		id = freestyle_tilt_meter_top_highlight
		type = SpriteElement
		parent = freestyle_tilt_meter
		texture = TopTilt_HIGHLIGHT
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 1)
		alpha = 0
	}
	CreateScreenElement {
		id = freestyle_tilt_meter_low
		type = SpriteElement
		parent = freestyle_tilt_meter
		texture = LowTilt_ON
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		alpha = 0
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 2)
	}
	CreateScreenElement {
		id = freestyle_tilt_meter_mid
		type = SpriteElement
		parent = freestyle_tilt_meter
		texture = MidTilt_ON
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		alpha = 0
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 2)
	}
	CreateScreenElement {
		id = freestyle_tilt_meter_top
		type = SpriteElement
		parent = freestyle_tilt_meter
		texture = TopTilt_ON
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		alpha = 0
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 2)
	}
	CreateScreenElement {
		id = freestyle_tilt_meter_needle
		type = SpriteElement
		parent = freestyle_tilt_meter
		texture = TiltMeterNeedle
		rgba = [255 255 255 255]
		dims = (64.0, 12.0)
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 3)
	}
	CreateScreenElement {
		id = freestyle_tilt_meter_flame
		type = SpriteElement
		parent = freestyle_tilt_meter
		material = TransCardReady
		blend = Add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.01
		num_uv_frames = (4.0, 4.0)
		rgba = [255 255 255 255]
		pos = (($freestyle_tilt_meter_flame_pos_x * (1.0, 0.0)) + ($freestyle_tilt_meter_flame_pos_y * (0.0, 1.0)))
		dims = (64.0, 64.0)
		z_priority = ($freestyle_tilt_meter_z + 4)
		just = [center center]
		alpha = 0
		scale = $freestyle_tilt_meter_flame_scale
		rot_angle = $freestyle_tilt_meter_flame_rot
	}
	CreateScreenElement {
		id = freestyle_tilt_meter2
		type = SpriteElement
		parent = freestyle_hud
		texture = TiltMeterBG_OFF
		rgba = [255 255 255 255]
		pos = <pos2>
		dims = $freestyle_tilt_meter_dims
		rot_angle = <rot2>
		flip_v
		just = [center center]
		z_priority = $freestyle_tilt_meter_z
	}
	CreateScreenElement {
		id = freestyle_tilt_meter2_low_highlight
		type = SpriteElement
		parent = freestyle_tilt_meter2
		texture = LowTilt_HIGHLIGHT
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 1)
		alpha = 0
		flip_v
	}
	CreateScreenElement {
		id = freestyle_tilt_meter2_mid_highlight
		type = SpriteElement
		parent = freestyle_tilt_meter2
		texture = MidTilt_HIGHLIGHT
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 1)
		alpha = 0
		flip_v
	}
	CreateScreenElement {
		id = freestyle_tilt_meter2_top_highlight
		type = SpriteElement
		parent = freestyle_tilt_meter2
		texture = TopTilt_HIGHLIGHT
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 1)
		alpha = 0
		flip_v
	}
	CreateScreenElement {
		id = freestyle_tilt_meter2_low
		type = SpriteElement
		parent = freestyle_tilt_meter2
		texture = LowTilt_ON
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		flip_v
		alpha = 0
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 2)
	}
	CreateScreenElement {
		id = freestyle_tilt_meter2_mid
		type = SpriteElement
		parent = freestyle_tilt_meter2
		texture = MidTilt_ON
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		flip_v
		alpha = 0
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 2)
	}
	CreateScreenElement {
		id = freestyle_tilt_meter2_top
		type = SpriteElement
		parent = freestyle_tilt_meter2
		texture = TopTilt_ON
		rgba = [255 255 255 255]
		dims = $freestyle_tilt_meter_dims
		flip_v
		alpha = 0
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 2)
	}
	CreateScreenElement {
		id = freestyle_tilt_meter2_needle
		type = SpriteElement
		parent = freestyle_tilt_meter2
		texture = TiltMeterNeedle
		rgba = [255 255 255 255]
		dims = (64.0, 12.0)
		just = [center center]
		pos = (63.0, 128.0)
		z_priority = ($freestyle_tilt_meter_z + 3)
		flip_v
	}
	CreateScreenElement {
		id = freestyle_tilt_meter2_flame
		type = SpriteElement
		parent = freestyle_tilt_meter2
		material = TransCardReady
		blend = Add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.01
		num_uv_frames = (4.0, 4.0)
		rgba = [255 255 255 255]
		pos = (((128 - $freestyle_tilt_meter_flame_pos_x) * (1.0, 0.0)) + ($freestyle_tilt_meter_flame_pos_y * (0.0, 1.0)))
		dims = (64.0, 64.0)
		z_priority = ($freestyle_tilt_meter_z + 4)
		just = [center center]
		alpha = 0
		scale = $freestyle_tilt_meter_flame_scale
		rot_angle = (-1 * $freestyle_tilt_meter_flame_rot)
		flip_v
	}
endscript

script freestyle_update_tilt_meter 
	GetGuitarTiltValue \{player = 0}
	GetGuitarActiveTilt \{player = 0}
	Angle = ((1 - <tilt_value>) * 45)
	if (<active_tilt> = 2)
		val = ($freestyle_tilt_meter_inactive_bar_max_alpha * ((<Angle> -7) / 14))
		if (<val> < 0)
			val = 0
		elseif (<val> > $freestyle_tilt_meter_inactive_bar_max_alpha)
			val = $freestyle_tilt_meter_inactive_bar_max_alpha
		endif
		SetScreenElementProps \{id = freestyle_tilt_meter_low
			alpha = $freestyle_tilt_meter_active_bar_alpha}
		SetScreenElementProps {
			id = freestyle_tilt_meter_mid_highlight
			alpha = <val>
		}
		SetScreenElementProps \{id = freestyle_tilt_meter_top_highlight
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter_mid
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter_top
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter2_low
			alpha = $freestyle_tilt_meter_active_bar_alpha}
		SetScreenElementProps {
			id = freestyle_tilt_meter2_mid_highlight
			alpha = <val>
		}
		SetScreenElementProps \{id = freestyle_tilt_meter2_top_highlight
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter2_mid
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter2_top
			alpha = 0}
		SetScreenElementProps {
			id = freestyle_tilt_meter_flame
			scale = ($freestyle_tilt_meter_flame_scale * 0.75)
			pos = (64.0, 82.0)
		}
		SetScreenElementProps {
			id = freestyle_tilt_meter2_flame
			scale = ($freestyle_tilt_meter_flame_scale * 0.75)
			pos = (64.0, 82.0)
		}
	elseif (<active_tilt> = 1)
		val = ($freestyle_tilt_meter_inactive_bar_max_alpha * ((22 - <Angle>) / 14))
		if (<val> < 0)
			val = 0
		elseif (<val> > $freestyle_tilt_meter_inactive_bar_max_alpha)
			val = $freestyle_tilt_meter_inactive_bar_max_alpha
		endif
		val2 = ($freestyle_tilt_meter_inactive_bar_max_alpha * ((<Angle> -23) / 14))
		if (<val2> < 0)
			val2 = 0
		elseif (<val2> > $freestyle_tilt_meter_inactive_bar_max_alpha)
			val2 = $freestyle_tilt_meter_inactive_bar_max_alpha
		endif
		SetScreenElementProps \{id = freestyle_tilt_meter_mid
			alpha = $freestyle_tilt_meter_active_bar_alpha}
		SetScreenElementProps {
			id = freestyle_tilt_meter_low_highlight
			alpha = <val>
		}
		SetScreenElementProps {
			id = freestyle_tilt_meter_top_highlight
			alpha = <val2>
		}
		SetScreenElementProps \{id = freestyle_tilt_meter_low
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter_top
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter2_mid
			alpha = $freestyle_tilt_meter_active_bar_alpha}
		SetScreenElementProps {
			id = freestyle_tilt_meter2_low_highlight
			alpha = <val>
		}
		SetScreenElementProps {
			id = freestyle_tilt_meter2_top_highlight
			alpha = <val2>
		}
		SetScreenElementProps \{id = freestyle_tilt_meter2_low
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter2_top
			alpha = 0}
		SetScreenElementProps {
			id = freestyle_tilt_meter_flame
			scale = ($freestyle_tilt_meter_flame_scale * 0.75)
			pos = (64.0, 82.0)
		}
		SetScreenElementProps {
			id = freestyle_tilt_meter2_flame
			scale = ($freestyle_tilt_meter_flame_scale * 0.75)
			pos = (64.0, 82.0)
		}
	else
		val = ($freestyle_tilt_meter_inactive_bar_max_alpha * ((37 - <Angle>) / 14))
		if (<val> < 0)
			val = 0
		elseif (<val> > $freestyle_tilt_meter_inactive_bar_max_alpha)
			val = $freestyle_tilt_meter_inactive_bar_max_alpha
		endif
		SetScreenElementProps \{id = freestyle_tilt_meter_top
			alpha = $freestyle_tilt_meter_active_bar_alpha}
		SetScreenElementProps {
			id = freestyle_tilt_meter_mid_highlight
			alpha = <val>
		}
		SetScreenElementProps \{id = freestyle_tilt_meter_low_highlight
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter_mid
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter_low
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter2_top
			alpha = $freestyle_tilt_meter_active_bar_alpha}
		SetScreenElementProps {
			id = freestyle_tilt_meter2_mid_highlight
			alpha = <val>
		}
		SetScreenElementProps \{id = freestyle_tilt_meter2_low_highlight
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter2_mid
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter2_low
			alpha = 0}
		SetScreenElementProps \{id = freestyle_tilt_meter_flame
			scale = $freestyle_tilt_meter_flame_scale
			pos = (64.0, 64.0)}
		SetScreenElementProps \{id = freestyle_tilt_meter2_flame
			scale = $freestyle_tilt_meter_flame_scale
			pos = (64.0, 64.0)}
	endif
	bar_len = (10 + ((<Angle> / 45) * 89))
	bar_y = (216 - ((<Angle> / 45) * 160))
	bar_x = ((93 - (<bar_len> / 2)) + ((<Angle> / 45) * 9))
	SetScreenElementProps {
		id = freestyle_tilt_meter_needle
		pos = ((<bar_x> * (1.0, 0.0)) + (<bar_y> * (0.0, 1.0)))
		scale = (((<bar_len> / 64) * (1.0, 0.0)) + (0.0, 1.0))
	}
	SetScreenElementProps {
		id = freestyle_tilt_meter2_needle
		pos = (((128 - <bar_x>) * (1.0, 0.0)) + (<bar_y> * (0.0, 1.0)))
		scale = (((<bar_len> / 64) * (1.0, 0.0)) + (0.0, 1.0))
	}
endscript

script freestyle_tilt_meter_start_flame 
	SetScreenElementProps \{id = freestyle_tilt_meter_flame
		alpha = 1}
	SetScreenElementProps \{id = freestyle_tilt_meter2_flame
		alpha = 1}
endscript

script freestyle_tilt_meter_stop_flame 
	SetScreenElementProps \{id = freestyle_tilt_meter_flame
		alpha = 0}
	SetScreenElementProps \{id = freestyle_tilt_meter2_flame
		alpha = 0}
endscript

script freestyle_destroy_tilt_meter 
	if ScreenElementExists \{id = freestyle_tilt_meter}
		DestroyScreenElement \{id = freestyle_tilt_meter}
	endif
	if ScreenElementExists \{id = freestyle_tilt_meter2}
		DestroyScreenElement \{id = freestyle_tilt_meter2}
	endif
endscript
