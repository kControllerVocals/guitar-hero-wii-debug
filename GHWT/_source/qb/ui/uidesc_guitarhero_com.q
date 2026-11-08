uidesc_guitarhero_com = {
	DescVersion = 2
	name = uidesc_guitarhero_com
	rect = [
		5.588318
		-5.3349614
		1228.8
		718.9797
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = message_box
				}
				{
					index = 2
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_rgba
			visiblename = 'title_rgba'
			help = 'message_box -> title => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = message_box
				}
				{
					index = 2
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			visiblename = 'title_text'
			help = 'message_box -> title => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = message_box
				}
				{
					index = 3
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = text_rgba
			visiblename = 'text_rgba'
			help = 'message_box -> menu -> text => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = message_box
				}
				{
					index = 3
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = text_rgba
			visiblename = 'text_rgba'
			help = 'message_box -> menu -> text => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = message_box
				}
				{
					index = 3
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = text_rgba
			visiblename = 'text_rgba'
			help = 'message_box -> menu -> text => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = message_box
				}
				{
					index = 3
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = text_rgba
			visiblename = 'text_rgba'
			help = 'message_box -> menu -> text => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = message_box
				}
				{
					index = 3
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = text_rgba
			visiblename = 'text_rgba'
			help = 'message_box -> menu -> text => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = message_box
				}
				{
					index = 3
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = passcode
					includeParentOwned = false
				}
			]
			name = passcode_rgba
			visiblename = 'passcode_rgba'
			help = 'message_box -> menu -> passcode => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = message_box
				}
				{
					index = 3
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = passcode
					includeParentOwned = false
				}
			]
			name = passcode_text
			visiblename = 'passcode_text'
			help = 'message_box -> menu -> passcode => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = message_box
				}
				{
					index = 3
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = subtitle
					includeParentOwned = false
				}
			]
			name = subtitle_rgba
			visiblename = 'subtitle_rgba'
			help = 'message_box -> menu -> subtitle => rgba'
			target = rgba
			type = array_color
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = message_box
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
			pos = (630.715, 381.58047)
			z_priority = 0.0
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
					texture = message_bg
					local_id = message_bg
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1024.0, 512.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-10.726624, -0.73574793)
					z_priority = 1.0
					scale = (1.2, 1.3)
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
			{
				props = {
					blend = blend
					texture = address_patch
					local_id = address_patch
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1024.0, 256.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-9.536855, -258.91547)
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
			}
			{
				props = {
					local_id = title
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (700.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-7.266418, -271.3957)
					z_priority = 3.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						192
						192
						192
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs("READY TO BE A GUITAR HERO?")
					font = fontgrid_text_a11_large
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
			{
				props = {
					local_id = menu
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (725.0, 450.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (-303.69092, -140.8282)
					z_priority = 1.0
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
					isVertical = true
					internal_just = [
						0.0
						-1.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = -10
					position_children = true
					fit_major = `fit content if larger`
					fit_minor = `fit content`
					scale_mode = proportional
					allow_wrap = true
					allow_alternate_directional_events = false
				}
				children = [
					{
						props = {
							local_id = subtitle
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1000.0, 135.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (362.5, 48.9375)
							z_priority = 3.0
							scale = (0.72499996, 0.72499996)
							rot_angle = 0.0
							rgba = [
								192
								192
								192
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("LINK YOUR STATS TO THE WEB COMMUNITY!")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = wrap
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
					{
						props = {
							local_id = text
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1000.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (362.5, 108.75)
							z_priority = 3.0
							scale = (0.72499996, 0.72499996)
							rot_angle = 0.0
							rgba = [
								192
								192
								192
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("- Go to community.guitarhero.com")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
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
					{
						props = {
							local_id = text
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1000.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (362.5, 137.75)
							z_priority = 3.0
							scale = (0.72499996, 0.72499996)
							rot_angle = 0.0
							rgba = [
								192
								192
								192
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("- Create a New Account or Log in")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
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
					{
						props = {
							local_id = text
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1000.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (362.5, 166.75)
							z_priority = 3.0
							scale = (0.72499996, 0.72499996)
							rot_angle = 0.0
							rgba = [
								192
								192
								192
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("- Click 'Link Account'")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
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
					{
						props = {
							local_id = text
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1000.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (362.5, 195.75)
							z_priority = 3.0
							scale = (0.72499996, 0.72499996)
							rot_angle = 0.0
							rgba = [
								192
								192
								192
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("- Enter the following VIP Passcode")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
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
					{
						props = {
							local_id = passcode
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1000.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (362.5, 242.87502)
							z_priority = 3.0
							scale = (0.72499996, 0.72499996)
							rot_angle = 0.0
							rgba = [
								192
								192
								192
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("\LXXXX-XXXX-XXXX-XXXX")
							font = fontgrid_text_a8
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
							internal_scale = (1.25, 1.25)
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
					{
						props = {
							local_id = text
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1000.0, 141.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (362.5, 322.98746)
							z_priority = 3.0
							scale = (0.72499996, 0.72499996)
							rot_angle = 0.0
							rgba = [
								192
								192
								192
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("On the web you can personalize your profile, browse leaderboards, jam with an online band, collect groupies, and rock out in tournaments!")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `expand dims`
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
		]
	}
}
uidesc_guitarhero_com_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
