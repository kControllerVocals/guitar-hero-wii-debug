uidesc_leaderboard_filters = {
	DescVersion = 2
	name = uidesc_leaderboard_filters
	rect = [
		0.0
		-1.037992
		1280.0
		721.038
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = filter_master_container
				}
				{
					index = 4
					validateLocalID = line_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = filters_row
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = param
					includeParentOwned = false
				}
			]
			name = alias_item
			visiblename = 'alias_item'
			help = 'filter_master_container -> line_container -> filters_row -> param'
		}
		{
			path = [
				{
					validateLocalID = filter_master_container
				}
				{
					index = 2
					validateLocalID = title_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = alert_title
					includeParentOwned = false
				}
			]
			name = alias_alert_title
			visiblename = 'alias_alert_title'
			help = 'filter_master_container -> title_text_container -> alert_title'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = filter_master_container
				}
				{
					index = 2
					validateLocalID = title_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = alert_title
					includeParentOwned = false
				}
			]
			name = alert_title_text
			visiblename = 'alert_title_text'
			help = 'filter_master_container -> title_text_container -> alert_title => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = filter_master_container
				}
				{
					index = 3
					validateLocalID = alert_message
					includeParentOwned = false
				}
			]
			name = alert_message_text
			visiblename = 'alert_message_text'
			help = 'filter_master_container -> alert_message => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = filter_master_container
				}
				{
					index = 4
					validateLocalID = line_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = filter_highlight
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = arrows
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = arrow_up
					includeParentOwned = false
				}
			]
			name = arrow_up_scale
			visiblename = 'arrow_up_scale'
			help = 'filter_master_container -> line_container -> filter_highlight -> arrows -> arrow_up => scale'
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = filter_master_container
				}
				{
					index = 4
					validateLocalID = line_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = filter_highlight
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = arrows
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = arrow_dn
					includeParentOwned = false
				}
			]
			name = arrow_dn_scale
			visiblename = 'arrow_dn_scale'
			help = 'filter_master_container -> line_container -> filter_highlight -> arrows -> arrow_dn => scale'
			target = scale
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = filter_master_container
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
		children = [
			{
				props = {
					local_id = filter_bg
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
							material = 0x00000000
							blend = blend
							texture = online_dialog_bg
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
					}
				]
			}
			{
				props = {
					texture = gradient_256
					blend = subtract
					flip_h = true
					local_id = gradient_256
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.25
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
					z_priority = -1.0
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
							local_id = alert_title
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
							z_priority = 520.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								90
								150
								200
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("")
							font = fontgrid_text_a11_large
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
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
					local_id = alert_message
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (550.0, 125.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (632.0, 224.0)
					z_priority = 520.0
					scale = (1.0, 1.0)
					rot_angle = -2.0
					rgba = [
						128
						128
						128
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs("What leaderboard entries would you like to view?")
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
					internal_scale = (0.55, 0.55)
					blend = blend
					font_spacing = 0
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
					local_id = line_container
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
					pos = (-6.9130864, 81.31622)
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
							local_id = filter_highlight
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1024.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-57.20105, 1.9644778)
							z_priority = 520.0
							scale = (1.0, 1.0)
							rot_angle = -2.0
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
									texture = online_dialog_hilite_l
									local_id = online_dialog_hilite_l
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (512.0, 128.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (426.0, 50.0)
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
							}
							{
								props = {
									blend = blend
									texture = online_dialog_hilite_r
									local_id = online_dialog_hilite_r
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (512.0, 128.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (718.0, 50.0)
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
							}
							{
								props = {
									local_id = arrows
									type = ContainerElement
									hiddenLocal = false
									alpha = 1.0
									dims = (100.0, 100.0)
									just = [
										1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (854.0, 50.0)
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
								children = [
									{
										props = {
											blend = blend
											texture = online_dialog_arrow_up
											local_id = arrow_up
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (32.0, 32.0)
											just = [
												0.0
												1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (84.0, 47.5)
											z_priority = 522.0
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
											texture = online_dialog_arrow_dn
											local_id = arrow_dn
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (32.0, 32.0)
											just = [
												0.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (84.0, 52.5)
											z_priority = 522.0
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
						]
					}
					{
						props = {
							local_id = filters_row
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (500.0, 60.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (42.570984, 52.00128)
							z_priority = 531.0
							scale = (1.0, 1.0)
							rot_angle = -2.0
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
									local_id = item
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (225.0, 60.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (122.5, 0.0)
									z_priority = 532.0
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
									text = qs("SEARCH FOR:")
									font = fontgrid_text_a6
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										1.0
										0.0
									]
									internal_scale = (0.5, 0.5)
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
									local_id = param
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (225.0, 60.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (387.5, 0.0)
									z_priority = 532.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										176
										224
										230
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("FRIENDS")
									font = fontgrid_text_a6
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale to fit`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										0.0
									]
									internal_scale = (0.5, 0.5)
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
			{
				props = {
					flip_h = true
					texture = white
					blend = blend
					local_id = black
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.25
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (0.0, -1.037992)
					z_priority = -1.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						0
						0
						32
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
			}
		]
	}
}
uidesc_leaderboard_filters_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
