uidesc_dialog_box_band = {
	DescVersion = 14
	name = uidesc_dialog_box_band
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 2
					validateLocalID = title_text_container
					includeParentOwned = false
				}
			]
			name = alias_dialog_text
			visiblename = 'alias_dialog_text'
			help = 'dlog_master_container -> title_text_container'
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 3
					validateLocalID = popup_dlog_vmenu
					includeParentOwned = false
				}
			]
			name = alias_dlog_vmenu
			visiblename = 'alias_dlog_vmenu'
			help = 'dlog_master_container -> popup_dlog_vmenu'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 2
					validateLocalID = title_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dlog_title
					includeParentOwned = false
				}
			]
			name = PopupTitle_text
			visiblename = 'PopupTitle_text'
			help = 'dlog_master_container -> title_text_container -> dlog_title => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 2
					validateLocalID = title_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dlog_title
					includeParentOwned = false
				}
			]
			name = PopupTitle_rgba
			visiblename = 'PopupTitle_rgba'
			help = 'dlog_master_container -> title_text_container -> dlog_title => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 1
					validateLocalID = blackout
					includeParentOwned = false
				}
			]
			name = blackout_alpha
			visiblename = 'blackout_alpha'
			help = 'dlog_master_container -> blackout => alpha'
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = dlog_master_container
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 496.0
			scale = (1.0, 1.0)
			rot_angle = 0.0
			rgba = [
				255
				255
				255
				255
			]
			events_blocked = 0
			preserve_local_orientation = false
		}
		children = [
			{
				props = {
					local_id = dlog_BG_container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 497.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
				children = [
					{
						props = {
							material = 0x00000000
							blend = blend
							texture = dialog_bg
							local_id = dialog_bg
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (720.0, 670.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -23.0)
							z_priority = 495.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
				]
			}
			{
				props = {
					flip_h = true
					blend = blend
					texture = white
					local_id = blackout
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.0
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 494.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						0
						0
						0
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
			}
			{
				props = {
					local_id = title_text_container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (640.0, 106.0)
					z_priority = 496.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
				children = [
					{
						props = {
							local_id = dlog_title
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 80.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 15.0)
							z_priority = 525.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								200
								200
								200
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("OVERWRITTEN")
							font = fontgrid_text_a11_large
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `clip top lines`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (1.5, 1.5)
							blend = blend
							font_spacing = -1
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = true
							shadow_rgba = [
								0
								0
								0
								255
							]
							shadow_offs = (-3.0, -3.0)
							line_spacing = 1.0
						}
					}
				]
			}
			{
				props = {
					local_id = popup_dlog_vmenu
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (570.0, 370.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 30.0)
					z_priority = 525.0
					scale = (1.0, 1.0)
					rot_angle = -1.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					isVertical = true
					internal_just = [
						0.0
						0.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = -10
					position_children = true
					fit_major = `fit content if larger`
					fit_minor = `fit content if larger`
					scale_mode = proportional
					allow_wrap = true
					allow_alternate_directional_events = false
				}
			}
		]
	}
}
uidesc_dialog_box_band_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
