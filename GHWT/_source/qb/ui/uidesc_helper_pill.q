uidesc_helper_pill = {
	DescVersion = 2
	name = uidesc_helper_pill
	rect = [
		-27.5
		-19.800001
		55.0
		39.600002
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 1
					validateLocalID = helper_pill_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = helper_button
					includeParentOwned = false
				}
			]
			name = alias_helper_button
			visiblename = 'alias_helper_button'
			help = 'helper_pill_container -> helper_pill_menu -> helper_button'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 1
					validateLocalID = helper_pill_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = helper_description
					includeParentOwned = false
				}
			]
			name = helper_description_text
			visiblename = 'helper_description_text'
			help = 'helper_pill_container -> helper_pill_menu -> helper_description => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 1
					validateLocalID = helper_pill_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = helper_button
					includeParentOwned = false
				}
			]
			name = helper_button_text
			visiblename = 'helper_button_text'
			help = 'helper_pill_container -> helper_pill_menu -> helper_button => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 1
					validateLocalID = helper_pill_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = helper_description
					includeParentOwned = false
				}
			]
			name = helper_description_rgba
			visiblename = 'helper_description_rgba'
			help = 'helper_pill_container -> helper_pill_menu -> helper_description => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 0
					validateLocalID = helper_pill_bg
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = helper_pill_end
					includeParentOwned = false
				}
			]
			name = helper_pill_rgba
			visiblename = 'helper_pill_rgba'
			help = 'helper_pill_container -> helper_pill_bg -> helper_pill_end => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 0
					validateLocalID = helper_pill_bg
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = helper_pill_body
					includeParentOwned = false
				}
			]
			name = helper_pill_rgba
			visiblename = 'helper_pill_rgba'
			help = 'helper_pill_container -> helper_pill_bg -> helper_pill_body => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 0
					validateLocalID = helper_pill_bg
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = helper_pill_end
					includeParentOwned = false
				}
			]
			name = helper_pill_rgba
			visiblename = 'helper_pill_rgba'
			help = 'helper_pill_container -> helper_pill_bg -> helper_pill_end => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 0
					validateLocalID = helper_pill_bg
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = helper_pill_body
					includeParentOwned = false
				}
			]
			name = helper_pill_body_dims
			visiblename = 'helper_pill_body_dims'
			help = 'helper_pill_container -> helper_pill_bg -> helper_pill_body => dims'
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 1
					validateLocalID = helper_pill_menu
					includeParentOwned = false
				}
			]
			name = helper_pill_menu_dims
			visiblename = 'helper_pill_menu_dims'
			help = 'helper_pill_container -> helper_pill_menu => dims'
			target = dims
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = helper_pill_container
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (50.0, 32.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
			z_priority = 0.0
			scale = (1.1, 1.1)
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
					local_id = helper_pill_bg
					type = MenuElement
					hiddenLocal = false
					alpha = 0.8
					dims = (42.0, 32.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
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
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = 0
					position_children = true
					fit_major = `size dims to content`
					fit_minor = `keep dims`
					scale_mode = proportional
					allow_wrap = true
					allow_alternate_directional_events = false
				}
				children = [
					{
						props = {
							blend = blend
							texture = helper_pill_end
							flip_v = true
							local_id = helper_pill_end
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (16.0, 32.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (8.0, 16.0)
							z_priority = 2.0
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
							blend = blend
							texture = helper_pill_body
							local_id = helper_pill_body
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (10.0, 32.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (21.0, 16.0)
							z_priority = 2.0
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
							blend = blend
							texture = helper_pill_end
							local_id = helper_pill_end
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (16.0, 32.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (34.0, 16.0)
							z_priority = 2.0
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
				]
			}
			{
				props = {
					local_id = helper_pill_menu
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (10.0, 50.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 3.0
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
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = 10
					position_children = true
					fit_major = `size dims to content`
					fit_minor = `keep dims`
					scale_mode = proportional
					allow_wrap = true
					allow_alternate_directional_events = false
				}
				children = [
					{
						props = {
							local_id = helper_button
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (0.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 25.0)
							z_priority = 3.0
							scale = (1.4, 1.2)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("")
							font = fontgrid_text_a3
							material = 0x00000000
							single_line = true
							fit_width = `expand dims`
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
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
							local_id = helper_description
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (0.0, 56.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (10.0, 25.0)
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
							text = qs("")
							font = fontgrid_text_A11_b
							material = 0x00000000
							single_line = true
							fit_width = `expand dims`
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.8, 0.8)
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
uidesc_helper_pill_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
