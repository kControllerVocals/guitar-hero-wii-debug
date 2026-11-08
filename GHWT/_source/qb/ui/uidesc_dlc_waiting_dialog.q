uidesc_DLC_Waiting_Dialog = {
	DescVersion = 13
	name = uidesc_DLC_Waiting_Dialog
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
					index = 3
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = dlog_vmenu_container
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
			help = 'dlog_master_container -> text_container -> dlog_vmenu_container -> popup_dlog_vmenu'
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
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = loading_text_menu
					includeParentOwned = false
				}
			]
			name = alias_loading_text_menu
			visiblename = 'alias_loading_text_menu'
			help = 'dlog_master_container -> text_container -> loading_text_menu'
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 3
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = long_wait_label
					includeParentOwned = false
				}
			]
			name = alias_long_wait_label
			visiblename = 'alias_long_wait_label'
			help = 'dlog_master_container -> text_container -> long_wait_label'
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
					index = 3
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = loading_text_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = wait_dots
					includeParentOwned = false
				}
			]
			name = wait_dots_text
			visiblename = 'wait_dots_text'
			help = 'dlog_master_container -> text_container -> loading_text_menu -> wait_dots => text'
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
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = loading_text_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = wait_label
					includeParentOwned = false
				}
			]
			name = wait_label_text
			visiblename = 'wait_label_text'
			help = 'dlog_master_container -> text_container -> loading_text_menu -> wait_label => text'
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
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = Progress_Bar_Container
					includeParentOwned = false
				}
			]
			name = Progress_Bar_Container_alpha
			visiblename = 'Progress_Bar_Container_alpha'
			help = 'dlog_master_container -> text_container -> Progress_Bar_Container => alpha'
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
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = dlog_vmenu_container
					includeParentOwned = false
				}
			]
			name = dlog_vmenu_container_alpha
			visiblename = 'dlog_vmenu_container_alpha'
			help = 'dlog_master_container -> text_container -> dlog_vmenu_container => alpha'
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
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = loading_text_menu
					includeParentOwned = false
				}
			]
			name = loading_text_menu_pos
			visiblename = 'loading_text_menu_pos'
			help = 'dlog_master_container -> text_container -> loading_text_menu => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 3
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = Progress_Bar_Container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = bar_sprite
					includeParentOwned = false
				}
			]
			name = bar_sprite_dims
			visiblename = 'bar_sprite_dims'
			help = 'dlog_master_container -> text_container -> Progress_Bar_Container -> bar_sprite => dims'
			target = dims
			type = pair
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
					texture = white
					blend = blend
					local_id = blackout
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.5
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
					local_id = text_container
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
					pos = (-2.0973208, 0.0)
					z_priority = 497.0
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
				}
				children = [
					{
						props = {
							local_id = loading_text_menu
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (500.0, 65.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -80.0)
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
							isVertical = false
							internal_just = [
								0.0
								0.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 0
							position_children = true
							fit_major = `keep dims`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = true
							allow_alternate_directional_events = false
						}
						children = [
							{
								props = {
									local_id = wait_label
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (175.7, 53.2)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (234.25, 32.5)
									z_priority = 497.0
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
									text = qs("Loading")
									font = fontgrid_text_a6
									material = 0x00000000
									single_line = true
									fit_width = `expand dims`
									fit_height = `expand dims`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										-1.0
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
									local_id = wait_dots
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (31.5, 53.2)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (337.84998, 32.5)
									z_priority = 497.0
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
									text = qs("...")
									font = fontgrid_text_a6
									material = 0x00000000
									single_line = false
									fit_width = `expand dims`
									fit_height = `expand dims`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										-1.0
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
						]
					}
					{
						props = {
							local_id = Progress_Bar_Container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (500.0, 80.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 30.0)
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
							preserve_local_orientation = true
						}
						children = [
							{
								props = {
									local_id = NewElement19
									type = MenuElement
									hiddenLocal = false
									alpha = 1.0
									dims = (500.0, 80.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 498.0
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
									fit_major = `keep dims`
									fit_minor = `keep dims`
									scale_mode = proportional
									allow_wrap = true
									allow_alternate_directional_events = false
								}
								children = [
									{
										props = {
											local_id = Border
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (64.0, 80.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (50.0, 40.0)
											z_priority = 498.0
											scale = (1.25, 1.0)
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
													texture = dialog_studs
													local_id = dialog_studs
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
													z_priority = 498.0
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
													texture = dialog_studs
													flip_v = false
													flip_h = true
													local_id = dialog_studs
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
													z_priority = 498.0
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
											local_id = Border
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (64.0, 80.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (130.0, 40.0)
											z_priority = 498.0
											scale = (1.25, 1.0)
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
													texture = dialog_studs
													flip_v = true
													local_id = dialog_studs
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
													z_priority = 498.0
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
													texture = dialog_studs
													flip_h = true
													flip_v = true
													local_id = dialog_studs
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
													z_priority = 498.0
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
											local_id = Border
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (64.0, 80.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (210.0, 40.0)
											z_priority = 498.0
											scale = (1.25, 1.0)
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
													texture = dialog_studs
													local_id = dialog_studs
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
													z_priority = 498.0
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
													texture = dialog_studs
													flip_v = false
													flip_h = true
													local_id = dialog_studs
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
													z_priority = 498.0
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
											local_id = Border
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (64.0, 80.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (290.0, 40.0)
											z_priority = 498.0
											scale = (1.25, 1.0)
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
													texture = dialog_studs
													flip_v = true
													local_id = dialog_studs
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
													z_priority = 498.0
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
													texture = dialog_studs
													flip_h = true
													flip_v = true
													local_id = dialog_studs
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
													z_priority = 498.0
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
											local_id = Border
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (64.0, 80.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (370.0, 40.0)
											z_priority = 498.0
											scale = (1.25, 1.0)
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
													texture = dialog_studs
													local_id = dialog_studs
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
													z_priority = 498.0
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
													texture = dialog_studs
													flip_v = false
													flip_h = true
													local_id = dialog_studs
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
													z_priority = 498.0
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
											local_id = Border
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (64.0, 80.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (450.0, 40.0)
											z_priority = 498.0
											scale = (1.25, 1.0)
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
													texture = dialog_studs
													flip_v = true
													local_id = dialog_studs
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
													z_priority = 498.0
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
													texture = dialog_studs
													flip_h = true
													flip_v = true
													local_id = dialog_studs
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
													z_priority = 498.0
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
									blend = blend
									texture = dialog_studs
									local_id = dialog_studs
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										0.0
									]
									pos = (40.0, 40.0)
									z_priority = 498.0
									scale = (1.25, 1.0)
									rot_angle = -90.0
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
									texture = dialog_studs
									flip_v = false
									flip_h = true
									local_id = dialog_studs
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										1.0
										0.0
									]
									pos_anchor = [
										1.0
										0.0
									]
									pos = (-40.0, -40.0)
									z_priority = 498.0
									scale = (1.25, 1.0)
									rot_angle = -90.0
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
									texture = DLC_WhiteBox
									local_id = bar_sprite
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (0.0, 25.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										0.0
									]
									pos = (40.0, 0.0)
									z_priority = 498.0
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
								}
							}
						]
					}
					{
						props = {
							local_id = dlog_vmenu_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 140.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-3.110961, 185.7272)
							z_priority = 520.0
							scale = (1.0, 1.0)
							rot_angle = 1.0
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
									local_id = popup_dlog_vmenu
									type = MenuElement
									hiddenLocal = false
									alpha = 1.0
									dims = (280.0, 120.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-2.0972898, -23.12427)
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
									fit_minor = `keep dims`
									scale_mode = proportional
									allow_wrap = true
									allow_alternate_directional_events = false
								}
							}
							{
								props = {
									blend = blend
									texture = dialog_bg_menu_small
									local_id = dialog_bg_menu
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.9
									dims = (512.0, 250.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.86908, 97.246826)
									z_priority = 519.0
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
							local_id = long_wait_label
							type = TextBlockElement
							hiddenLocal = false
							alpha = 0.0
							dims = (600.0, 120.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -90.0)
							z_priority = 501.0
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
							text = qs("")
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								-1.0
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
				]
			}
		]
	}
}
uidesc_DLC_Waiting_Dialog_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			10
		]
	}
	EditMaterialForm = {
	}
}
