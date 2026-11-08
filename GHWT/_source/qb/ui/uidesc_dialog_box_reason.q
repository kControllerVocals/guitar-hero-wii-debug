uidesc_dialog_box_reason = {
	DescVersion = 16
	name = uidesc_dialog_box_reason
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
					validateLocalID = dlog_message
					includeParentOwned = false
				}
			]
			name = alias_dlog_message
			visiblename = 'alias_dlog_message'
			help = 'dlog_master_container -> dlog_message'
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 4
					validateLocalID = dlog_menu_container_big
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = popup_scrolling
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = popup_dlog_vmenu
					includeParentOwned = false
				}
			]
			name = alias_dlog_vmenu
			visiblename = 'alias_dlog_vmenu'
			help = 'dlog_master_container -> dlog_menu_container_big -> popup_scrolling -> popup_dlog_vmenu'
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
					index = 3
					validateLocalID = dlog_message
					includeParentOwned = false
				}
			]
			name = PopupBody_text
			visiblename = 'PopupBody_text'
			help = 'dlog_master_container -> dlog_message => text'
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
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 4
					validateLocalID = dlog_menu_container_big
					includeParentOwned = false
				}
			]
			name = dlog_menu_container_big_alpha
			visiblename = 'dlog_menu_container_big_alpha'
			help = 'dlog_master_container -> dlog_menu_container_big => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 3
					validateLocalID = dlog_message
					includeParentOwned = false
				}
			]
			name = dlog_message_dims
			visiblename = 'dlog_message_dims'
			help = 'dlog_master_container -> dlog_message => dims'
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 4
					validateLocalID = dlog_menu_container_big
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Scroll_Arrow_up
					includeParentOwned = false
				}
			]
			name = ArrowUp_alpha
			visiblename = 'ArrowUp_alpha'
			help = 'dlog_master_container -> dlog_menu_container_big -> scroll_arrow_up => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 4
					validateLocalID = dlog_menu_container_big
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = scroll_arrow_down
					includeParentOwned = false
				}
			]
			name = ArrowDown_alpha
			visiblename = 'ArrowDown_alpha'
			help = 'dlog_master_container -> dlog_menu_container_big -> scroll_arrow_down => alpha'
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
							text = qs(0xee59a32d)
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
					local_id = dlog_message
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (561.8959, 180.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (638.15247, 456.66672)
					z_priority = 525.0
					scale = (1.0, 1.0)
					rot_angle = -1.0
					rgba = [
						128
						128
						128
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs(0x3d2b3cff)
					font = fontgrid_text_a6
					material = 0x00000000
					single_line = false
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.7, 0.7)
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
					local_id = dlog_menu_container_big
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (500.0, 300.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (637.77783, 360.1498)
					z_priority = 520.0
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
							texture = Scroll_Arrow
							flip_h = true
							local_id = Scroll_Arrow_up
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 521.0
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
							blend = blend
							texture = Scroll_Arrow
							flip_h = false
							local_id = scroll_arrow_down
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (0.0, 0.0)
							z_priority = 521.0
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
							local_id = popup_scrolling
							type = ScrollingMenu
							hiddenLocal = false
							alpha = 1.0
							dims = (400.0, 130.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 521.0
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
							adjust_visibility = true
							center_selection = true
							top_selection = false
						}
						children = [
							{
								props = {
									local_id = popup_dlog_vmenu
									type = MenuElement
									hiddenLocal = false
									alpha = 1.0
									dims = (400.0, 130.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 525.0
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
										0.0
									]
									regular_space_amount = -1
									padding_scale = 1.0
									spacing_between = 10
									position_children = true
									fit_major = `keep dims`
									fit_minor = `keep dims`
									scale_mode = proportional
									allow_wrap = true
									allow_alternate_directional_events = false
								}
							}
						]
					}
				]
			}
		]
	}
}
uidesc_dialog_box_reason_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
