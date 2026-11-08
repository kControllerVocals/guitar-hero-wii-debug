uidesc_net_setlist_spinner = {
	DescVersion = 2
	name = uidesc_net_setlist_spinner
	rect = [
		256.0
		71.26122
		768.0
		576.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = net_setlist_spinner_container
				}
				{
					index = 1
					validateLocalID = net_spinner_window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = net_spinner_text
					includeParentOwned = false
				}
			]
			name = net_spinner_name_text
			visiblename = 'net_spinner_name_text'
			help = 'net_setlist_spinner_container -> net_spinner_window -> net_spinner_text => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = net_setlist_spinner_container
				}
				{
					index = 1
					validateLocalID = net_spinner_window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = net_spinner_text
					includeParentOwned = false
				}
			]
			name = net_spinner_text_pos
			visiblename = 'net_spinner_text_pos'
			help = 'net_setlist_spinner_container -> net_spinner_window -> net_spinner_text => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = net_setlist_spinner_container
				}
				{
					index = 1
					validateLocalID = net_spinner_window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = net_spinner_text
					includeParentOwned = false
				}
			]
			name = net_spinner_text_color
			visiblename = 'net_spinner_text_color'
			help = 'net_setlist_spinner_container -> net_spinner_window -> net_spinner_text => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = net_setlist_spinner_container
				}
				{
					index = 3
					validateLocalID = message
					includeParentOwned = false
				}
			]
			name = message_text
			visiblename = 'message_text'
			help = 'net_setlist_spinner_container -> message => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = net_setlist_spinner_container
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
			pos = (640.0, 360.0)
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
					flip_h = false
					blend = blend
					texture = online_dialog_bg
					local_id = net_spinner_bg
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (768.0, 576.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -0.73876995)
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
				}
			}
			{
				props = {
					local_id = net_spinner_window
					type = WindowElement
					hiddenLocal = false
					alpha = 1.0
					dims = (800.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 166.09776)
					z_priority = 3.0
					scale = (0.75, 0.75)
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
							local_id = net_spinner_text
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (500.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
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
							text = qs("WWWWWWWWWWWWWWWW")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale to fit`
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
					local_id = title
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (325.0, 75.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -186.27454)
					z_priority = 2.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						0
						200
						250
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs("NOTICE")
					font = fontgrid_text_a6
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
					internal_scale = (1.5, 1.5)
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
					local_id = message
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (600.0, 200.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -6.3460083)
					z_priority = 2.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						128
						128
						128
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs("\L")
					font = fontgrid_text_a6
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
					internal_scale = (0.6, 0.6)
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
					local_id = NewElement3
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (512.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 116.14771)
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
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
					allow_wrap = true
					allow_alternate_directional_events = false
				}
				children = [
					{
						props = {
							blend = blend
							texture = setlist_B_list_divider_R
							local_id = setlist_B_list_divider_R
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 16.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (128.0, 50.0)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								0
								120
								170
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = setlist_B_list_divider_R
							flip_h = false
							flip_v = true
							local_id = setlist_B_list_divider_R
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 16.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (384.0, 50.0)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								0
								120
								170
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
				]
			}
		]
	}
}
uidesc_net_setlist_spinner_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
