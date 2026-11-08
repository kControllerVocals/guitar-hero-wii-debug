uidesc_invite_side_panel = {
	DescVersion = 1
	name = uidesc_invite_side_panel
	rect = [
		577.0177
		-19.686834
		128.00006
		750.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = NewElement13
				}
				{
					index = 1
					validateLocalID = NewElement11
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Icon_Guitar
					includeParentOwned = false
				}
			]
			name = Guitar_alpha
			visiblename = 'Guitar_alpha'
			help = 'NewElement13 -> NewElement11 -> Icon_Guitar => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement13
				}
				{
					index = 1
					validateLocalID = NewElement11
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = Icon_Drum
					includeParentOwned = false
				}
			]
			name = Drum_alpha
			visiblename = 'Drum_alpha'
			help = 'NewElement13 -> NewElement11 -> Icon_Drum => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement13
				}
				{
					index = 1
					validateLocalID = NewElement11
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = Icon_Vocal
					includeParentOwned = false
				}
			]
			name = Vocal_alpha
			visiblename = 'Vocal_alpha'
			help = 'NewElement13 -> NewElement11 -> Icon_Vocal => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement13
				}
				{
					index = 1
					validateLocalID = NewElement11
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = Icon_Bass
					includeParentOwned = false
				}
			]
			name = Bass_alpha
			visiblename = 'Bass_alpha'
			help = 'NewElement13 -> NewElement11 -> Icon_Bass => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement13
				}
				{
					index = 0
					validateLocalID = friend
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement10
					includeParentOwned = false
				}
			]
			name = Players_Text
			visiblename = 'Players_text'
			help = 'NewElement13 -> friend -> NewElement10 => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = NewElement13
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
			pos = (636.73553, 361.72156)
			z_priority = 2.0
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
					blend = blend
					texture = friend
					local_id = friend
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (50.0, 50.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-11.534603, 205.66907)
					z_priority = 5.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = true
				}
				children = [
					{
						props = {
							local_id = NewElement10
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (78.0, 81.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (39.609917, 0.0)
							z_priority = 2.0
							scale = (0.6, 0.6)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("4")
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (1.0, 1.0)
							blend = blend
							font_spacing = -1
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = false
							shadow_rgba = [
								0
								0
								0
								255
							]
							shadow_offs = (3.0, 3.0)
							line_spacing = 1.0
						}
					}
				]
			}
			{
				props = {
					local_id = NewElement11
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
					pos = (9.876402, 6.5472407)
					z_priority = 5.0
					scale = (1.0, 1.0)
					rot_angle = 90.0
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
							blend = blend
							texture = Logo_Guitar_GrayScale
							local_id = Icon_Guitar
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-113.47823, 6.423457)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = true
						}
					}
					{
						props = {
							blend = blend
							texture = Logo_Drum_GrayScale
							local_id = Icon_Drum
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (37.469177, 4.2822123)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = true
						}
					}
					{
						props = {
							blend = blend
							texture = Logo_Vocal_GrayScale
							local_id = Icon_Vocal
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (112.407646, 3.2116551)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = true
						}
					}
					{
						props = {
							blend = blend
							texture = Logo_Bass_GrayScale
							local_id = Icon_Bass
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-39.610317, 5.352775)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = true
						}
					}
				]
			}
			{
				props = {
					blend = blend
					texture = envelope_64
					local_id = envelope_64
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (64.0, 64.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (2.38269, -222.55023)
					z_priority = 5.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = true
				}
			}
			{
				props = {
					blend = blend
					texture = dialog_studs
					local_id = dialog_studs
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (64.0, 64.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-22.240112, -158.31726)
					z_priority = 5.0
					scale = (0.8, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = true
				}
			}
			{
				props = {
					blend = blend
					texture = dialog_studs
					local_id = dialog_studs
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (64.0, 64.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (30.216925, -157.24666)
					z_priority = 5.0
					scale = (0.8, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = true
				}
			}
			{
				props = {
					blend = blend
					texture = message_bg
					local_id = message_bg
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (750.0, 128.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (4.2822266, -6.408386)
					z_priority = 2.0
					scale = (1.0, 1.0)
					rot_angle = 90.0
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
}
uidesc_invite_side_panel_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
