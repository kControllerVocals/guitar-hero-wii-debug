uidesc_DLC_PIN_Dialog = {
	DescVersion = 13
	name = uidesc_DLC_PIN_Dialog
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
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = entry_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = arrow_container
					includeParentOwned = false
				}
			]
			name = alias_arrow_container
			visiblename = 'alias_arrow_container'
			help = 'dlog_master_container -> text_container -> entry_container -> arrow_container'
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
					validateLocalID = entry_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = num_hmenu
					includeParentOwned = false
				}
			]
			name = alias_dlog_vmenu
			visiblename = 'alias_dlog_vmenu'
			help = 'dlog_master_container -> text_container -> entry_container -> num_hmenu'
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
					index = 1
					validateLocalID = PIN_Label
					includeParentOwned = false
				}
			]
			name = PIN_Label_text
			visiblename = 'PIN_Label_text'
			help = 'dlog_master_container -> text_container -> PIN_Label => text'
			target = text
			type = string_wchar
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
					dims = (500.0, 300.0)
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
							local_id = entry_container
							type = ContainerElement
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
							pos = (0.0, 100.0)
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
						children = [
							{
								props = {
									local_id = num_hmenu
									type = MenuElement
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
									spacing_between = 20
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
											local_id = Num_entry
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (64.0, 100.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (124.0, 50.0)
											z_priority = 498.0
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
													blend = blend
													texture = helper_bg
													local_id = helper_bg
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (64.0, 80.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (0.0, 0.0)
													z_priority = 499.0
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
													local_id = num
													type = TextBlockElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 76.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (1.4E-05, 1E-05)
													z_priority = 500.0
													scale = (1.0, 1.0)
													rot_angle = 0.0
													rgba = [
														224
														224
														224
														255
													]
													events_blocked = 0
													preserve_local_orientation = false
													text = qs(0xd14d2128)
													font = fontgrid_text_a6
													material = 0x00000000
													single_line = true
													fit_width = `expand dims`
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
									{
										props = {
											local_id = Num_entry
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (64.0, 100.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (208.0, 50.0)
											z_priority = 498.0
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
													blend = blend
													texture = helper_bg
													local_id = helper_bg
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (64.0, 80.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (0.0, 0.0)
													z_priority = 499.0
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
													local_id = num
													type = TextBlockElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 76.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (0.0, 0.0)
													z_priority = 500.0
													scale = (1.0, 1.0)
													rot_angle = 0.0
													rgba = [
														224
														224
														224
														255
													]
													events_blocked = 0
													preserve_local_orientation = false
													text = qs(0xd14d2128)
													font = fontgrid_text_a6
													material = 0x00000000
													single_line = true
													fit_width = `expand dims`
													fit_height = `expand dims`
													scale_mode = proportional
													text_case = Original
													internal_just = [
														-1.0
														-1.0
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
											local_id = Num_entry
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (64.0, 100.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (292.0, 50.0)
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
										children = [
											{
												props = {
													blend = blend
													texture = helper_bg
													local_id = helper_bg
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (64.0, 80.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (0.0, 0.0)
													z_priority = 499.0
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
													local_id = num
													type = TextBlockElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 76.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (1.4E-05, 1E-05)
													z_priority = 500.0
													scale = (1.0, 1.0)
													rot_angle = 0.0
													rgba = [
														224
														224
														224
														255
													]
													events_blocked = 0
													preserve_local_orientation = false
													text = qs(0xd14d2128)
													font = fontgrid_text_a6
													material = 0x00000000
													single_line = true
													fit_width = `expand dims`
													fit_height = `expand dims`
													scale_mode = proportional
													text_case = Original
													internal_just = [
														-1.0
														-1.0
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
											local_id = Num_entry
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (64.0, 100.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (376.0, 50.0)
											z_priority = 498.0
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
													blend = blend
													texture = helper_bg
													local_id = helper_bg
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (64.0, 80.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (0.0, 0.0)
													z_priority = 499.0
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
													local_id = num
													type = TextBlockElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 76.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (1.4E-05, 1E-05)
													z_priority = 500.0
													scale = (1.0, 1.0)
													rot_angle = 0.0
													rgba = [
														224
														224
														224
														255
													]
													events_blocked = 0
													preserve_local_orientation = false
													text = qs(0xd14d2128)
													font = fontgrid_text_a6
													material = 0x00000000
													single_line = true
													fit_width = `expand dims`
													fit_height = `expand dims`
													scale_mode = proportional
													text_case = Original
													internal_just = [
														-1.0
														-1.0
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
							{
								props = {
									local_id = arrow_container
									type = ContainerElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 100.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
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
								children = [
									{
										props = {
											blend = blend
											texture = list_arrow
											local_id = up_arrow
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
												-1.0
											]
											pos = (0.0, 0.0)
											z_priority = 501.0
											scale = (1.5, 1.5)
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
											texture = list_arrow
											flip_v = false
											flip_h = true
											local_id = down_arrow
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
												1.0
											]
											pos = (0.0, 0.0)
											z_priority = 501.0
											scale = (1.5, 1.5)
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
							local_id = PIN_Label
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (550.0, 150.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -150.0)
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
							text = $wii_DLC_PIN_entry_text
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
							internal_scale = (0.65000004, 0.65000004)
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
uidesc_DLC_PIN_Dialog_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			21
		]
	}
	EditMaterialForm = {
	}
}
