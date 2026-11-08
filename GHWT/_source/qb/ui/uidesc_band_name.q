uidesc_band_name = {
	DescVersion = 2
	name = uidesc_band_name
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
					validateLocalID = band_name_master
				}
				{
					index = 0
					validateLocalID = namelogo_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_name_line
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = cursor
					includeParentOwned = false
				}
			]
			name = alias_cursor
			visiblename = 'alias_cursor'
			help = 'band_name_master -> namelogo_container -> band_name_line -> cursor'
		}
		{
			path = [
				{
					validateLocalID = band_name_master
				}
				{
					index = 1
					validateLocalID = name_letter_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_name_letter
					includeParentOwned = false
				}
			]
			name = alias_band_name_letter
			visiblename = 'alias_band_name_letter'
			help = 'band_name_master -> name_letter_container -> band_name_letter'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = band_name_master
				}
				{
					index = 1
					validateLocalID = name_letter_container
					includeParentOwned = false
				}
			]
			name = name_letter_container_alpha
			visiblename = 'name_letter_container_alpha'
			help = 'band_name_master -> name_letter_container => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = band_name_master
				}
				{
					index = 1
					validateLocalID = name_letter_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_name_letter
					includeParentOwned = false
				}
			]
			name = band_name_letter_text
			visiblename = 'band_name_letter_text'
			help = 'band_name_master -> name_letter_container -> band_name_letter => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = band_name_master
				}
				{
					index = 1
					validateLocalID = name_letter_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = band_name_arrows
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = name_arrow_up
					includeParentOwned = false
				}
			]
			name = name_arrow_up_scale
			visiblename = 'name_arrow_up_scale'
			help = 'band_name_master -> name_letter_container -> band_name_arrows -> name_arrow_up => scale'
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = band_name_master
				}
				{
					index = 1
					validateLocalID = name_letter_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = band_name_arrows
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = name_arrow_dn
					includeParentOwned = false
				}
			]
			name = name_arrow_dn_scale
			visiblename = 'name_arrow_dn_scale'
			help = 'band_name_master -> name_letter_container -> band_name_arrows -> name_arrow_dn => scale'
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = band_name_master
				}
				{
					index = 0
					validateLocalID = namelogo_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_name_line
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = band_name
					includeParentOwned = false
				}
			]
			name = band_name_text
			visiblename = 'band_name_text'
			help = 'band_name_master -> namelogo_container -> band_name_line -> band_name => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = band_name_master
				}
				{
					index = 0
					validateLocalID = namelogo_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = band_logo
					includeParentOwned = false
				}
			]
			name = band_logo_texture
			visiblename = 'band_logo_texture'
			help = 'band_name_master -> namelogo_container -> band_logo => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = band_name_master
				}
				{
					index = 0
					validateLocalID = namelogo_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = band_name_info
					includeParentOwned = false
				}
			]
			name = band_name_info_text
			visiblename = 'band_name_info_text'
			help = 'band_name_master -> namelogo_container -> band_name_info => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = band_name_master
				}
				{
					index = 0
					validateLocalID = namelogo_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_name_line
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = band_name
					includeParentOwned = false
				}
			]
			name = band_name_font
			visiblename = 'band_name_font'
			help = 'band_name_master -> namelogo_container -> band_name_line -> band_name => font'
			target = font
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = band_name_master
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
					local_id = namelogo_container
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
					pos = (-50.0, 0.0)
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
				children = [
					{
						props = {
							blend = blend
							texture = namelogo_bg
							local_id = namelogo_bg
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (688.0, 585.0)
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
						}
					}
					{
						props = {
							blend = blend
							local_id = band_logo
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (256.0, 256.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-10.0, -60.0)
							z_priority = 2.0
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
					}
					{
						props = {
							local_id = band_name_line
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (575.0, 60.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-5.0, 118.0)
							z_priority = 2.0
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
							isVertical = false
							internal_just = [
								0.0
								0.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 0
							position_children = true
							fit_major = `fit content if larger`
							fit_minor = `fit content if larger`
							scale_mode = proportional
							allow_wrap = true
							allow_alternate_directional_events = false
						}
						children = [
							{
								props = {
									local_id = quote_left
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (19.6, 53.2)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (277.69998, 30.0)
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
									text = qs("\L''")
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
									local_id = band_name
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (0.0, 53.2)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (287.49994, 30.0)
									z_priority = 2.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										255
										192
										128
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("")
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
									local_id = cursor
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (0.0, 53.2)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (287.49994, 30.0)
									z_priority = 2.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										255
										192
										128
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("\L")
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
									local_id = quote_right
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (19.6, 53.2)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (297.29996, 30.0)
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
									text = qs("\L''")
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
							local_id = band_name_info
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (550.0, 60.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 168.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = -2.0
							rgba = [
								192
								192
								192
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("DON'T WORRY, YOU CAN EDIT YOUR\nBAND NAME OR LOGO LATER")
							font = fontgrid_text_a11_large
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.64000005, 0.52)
							blend = blend
							font_spacing = 10
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
					local_id = name_letter_container
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
					pos = (310.0, -20.0)
					z_priority = 1.0
					scale = (1.0, 1.0)
					rot_angle = 5.0
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
							texture = name_letter_bg
							local_id = band_name_bg2
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (269.0, 269.0)
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
							local_id = band_name_arrows
							type = ContainerElement
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
							pos = (-50.0, 0.0)
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
									texture = name_arrow_up
									local_id = name_arrow_up
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (40.0, 40.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, -5.0)
									z_priority = 3.0
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
									texture = name_arrow_dn
									local_id = name_arrow_dn
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (40.0, 40.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 5.0)
									z_priority = 3.0
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
							local_id = band_name_letter
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (47.0, 76.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (20.0, 0.0)
							z_priority = 3.0
							scale = (2.0, 2.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("\LA")
							font = fontgrid_text_a6_fire
							material = sys_fontgrid_text_A6_fire_sys_fontgrid_text_A6_fire
							single_line = false
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
		]
	}
}
uidesc_band_name_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
