uidesc_generic_list_menu = {
	DescVersion = 2
	name = uidesc_generic_list_menu
	rect = [
		-25.0
		-120.0
		525.0
		345.55682
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = generic_list_menu_smenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = generic_list_menu_vmenu
					includeParentOwned = false
				}
			]
			name = alias_generic_list_menu_vmenu
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu
					includeParentOwned = false
				}
			]
			name = alias_generic_list_menu_dialogue_menu
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = generic_list_menu_dialogue_menu_yes
					includeParentOwned = false
				}
			]
			name = alias_generic_list_menu_dialogue_menu_yes
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu_no
					includeParentOwned = false
				}
			]
			name = alias_generic_list_menu_dialogue_menu_no
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
			]
			name = generic_list_menu_container_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 0
					validateLocalID = generic_list_menu_icon_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_icon_icon
					includeParentOwned = false
				}
			]
			name = generic_list_menu_icon_icon_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 0
					validateLocalID = generic_list_menu_icon_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = generic_list_icon_name
					includeParentOwned = false
				}
			]
			name = generic_list_icon_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 0
					validateLocalID = generic_list_menu_icon_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = generic_list_icon_name
					includeParentOwned = false
				}
			]
			name = generic_list_icon_name_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 0
					validateLocalID = generic_list_menu_icon_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = generic_list_icon_name
					includeParentOwned = false
				}
			]
			name = generic_list_icon_name_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 0
					validateLocalID = generic_list_menu_icon_container
					includeParentOwned = false
				}
			]
			name = generic_list_menu_icon_container_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 0
					validateLocalID = generic_list_menu_icon_container
					includeParentOwned = false
				}
			]
			name = generic_list_menu_icon_container_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = generic_list_menu_dialogue_text
					includeParentOwned = false
				}
			]
			name = generic_list_menu_dialogue_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
			]
			name = generic_list_menu_dialogue_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = generic_list_menu_smenu
					includeParentOwned = false
				}
			]
			name = generic_list_menu_smenu_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = generic_list_menu_dialogue_menu_yes
					includeParentOwned = false
				}
			]
			name = generic_list_menu_dialogue_menu_yes_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu_no
					includeParentOwned = false
				}
			]
			name = generic_list_menu_dialogue_menu_no_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = generic_list_menu_dialogue_menu_yes
					includeParentOwned = false
				}
			]
			name = generic_list_menu_dialogue_menu_yes_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu_no
					includeParentOwned = false
				}
			]
			name = generic_list_menu_dialogue_menu_no_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = generic_list_menu_dialogue_menu_yes
					includeParentOwned = false
				}
			]
			name = generic_list_menu_dialogue_menu_yes_font
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu_no
					includeParentOwned = false
				}
			]
			name = generic_list_menu_dialogue_menu_no_font
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = generic_list_menu_dialogue_menu_yes
					includeParentOwned = false
				}
			]
			name = generic_list_menu_dialogue_menu_yes_material
			target = material
			type = checksum_material
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_dialogue_menu_no
					includeParentOwned = false
				}
			]
			name = generic_list_menu_dialogue_menu_no_material
			target = material
			type = checksum_material
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu
				}
				{
					index = 1
					validateLocalID = generic_list_menu_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = generic_list_menu_dialogue
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = generic_list_menu_item_price
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_item_price_text
					includeParentOwned = false
				}
			]
			name = generic_list_menu_item_price_text_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = generic_list_menu
			type = ContainerElement
			dims = (500.0, 300.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, -120.0)
		}
		children = [
			{
				props = {
					local_id = generic_list_menu_icon_container
					type = ContainerElement
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 110.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = list_highlight
							material = 0x00000000
							local_id = generic_list_menu_icon_bg
							type = SpriteElement
							dims = (150.0, 150.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
						}
					}
					{
						props = {
							texture = menu_history_unknown
							material = 0x00000000
							local_id = generic_list_menu_icon_icon
							type = SpriteElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.5
						}
					}
					{
						props = {
							local_id = generic_list_icon_name
							type = TextBlockElement
							dims = (110.0, 20.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-1.148102, 57.52005)
							z_priority = 2.6
							text = qs("Placeholder")
							font = fontgrid_title_a1
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
			{
				props = {
					local_id = generic_list_menu_container
					type = ContainerElement
					dims = (300.0, 200.0)
					just = [
						-1.0
						-1.0
					]
					pos = (129.85072, 65.55683)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = generic_list_menu_smenu
							type = ScrollingMenu
							hiddenLocal = true
							alpha = 1.0
							dims = (300.0, 200.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
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
							preserve_local_orientation = false
							isVertical = true
							adjust_visibility = true
							center_selection = true
							top_selection = false
						}
						children = [
							{
								props = {
									local_id = generic_list_menu_vmenu
									type = MenuElement
									hiddenLocal = true
									dims = (300.0, 200.0)
									just = [
										-1.0
										-1.0
									]
									pos = (0.0, 80.0)
									z_priority = 6.0
									fit_major = `keep dims`
									fit_minor = `fit content if larger`
									scale_mode = proportional
								}
							}
						]
					}
					{
						props = {
							texture = list_bg
							material = 0x00000000
							local_id = generic_list_menu_bg
							type = SpriteElement
							dims = (370.0, 250.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-20.665915, -25.2583)
							z_priority = 1.0
						}
					}
					{
						props = {
							texture = list_arrow
							material = 0x00000000
							local_id = generic_list_menu_up_arrow
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (155.0, -100.0)
							z_priority = 2.0
						}
					}
					{
						props = {
							texture = list_arrow
							material = 0x00000000
							local_id = generic_list_menu_down_arrow
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (155.0, 80.0)
							z_priority = 2.0
							rot_angle = 180.0
						}
					}
					{
						props = {
							local_id = generic_list_menu_dialogue
							type = ContainerElement
							alpha = 0.0
							dims = (300.0, 200.0)
							just = [
								-1.0
								-1.0
							]
							pos = (1.358337, 0.0)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									local_id = generic_list_menu_dialogue_text
									type = TextBlockElement
									dims = (300.0, 120.0)
									just = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
									rgba = [
										100
										88
										71
										255
									]
									text = qs("Would you like to buy this item?")
									font = fontgrid_title_a1
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = generic_list_menu_dialogue_menu
									type = MenuElement
									dims = (300.0, 50.0)
									just = [
										-1.0
										1.0
									]
									pos_anchor = [
										-1.0
										1.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
									isVertical = false
									internal_just = [
										0.0
										0.0
									]
									spacing_between = 3
									fit_major = `fit content if larger`
									fit_minor = `keep dims`
									scale_mode = proportional
									allow_alternate_directional_events = true
								}
								children = [
									{
										props = {
											local_id = generic_list_menu_dialogue_menu_yes
											type = TextBlockElement
											dims = (150.0, 50.0)
											pos = (74.25742, 25.0)
											z_priority = 4.0
											scale = (0.99009895, 0.99009895)
											rgba = [
												100
												88
												71
												255
											]
											text = qs("Yes")
											font = fontgrid_title_a1
											fit_width = wrap
											fit_height = `scale down if larger`
											scale_mode = proportional
											text_case = Original
											internal_just = [
												0.0
												0.0
											]
											shadow_offs = (3.0, 3.0)
										}
									}
									{
										props = {
											local_id = generic_list_menu_dialogue_menu_no
											type = TextBlockElement
											dims = (150.0, 50.0)
											pos = (225.74254, 25.0)
											z_priority = 4.0
											scale = (0.99009895, 0.99009895)
											rgba = [
												100
												88
												71
												255
											]
											text = qs("No")
											font = fontgrid_title_a1
											fit_width = wrap
											fit_height = `scale down if larger`
											scale_mode = proportional
											text_case = Original
											internal_just = [
												0.0
												0.0
											]
											shadow_offs = (3.0, 3.0)
										}
									}
								]
							}
							{
								props = {
									local_id = generic_list_menu_item_price
									type = ContainerElement
									dims = (100.0, 50.0)
									just = [
										-1.0
										-1.0
									]
									pos = (92.035095, 106.6881)
									z_priority = 4.0
								}
								children = [
									{
										props = {
											texture = pricetag
											material = 0x00000000
											local_id = generic_list_menu_item_price_bg
											type = SpriteElement
											dims = (128.0, 64.0)
											just = [
												-1.0
												-1.0
											]
											pos = (0.0, 0.0)
											z_priority = 5.0
										}
									}
									{
										props = {
											local_id = generic_list_menu_item_price_text
											type = TextBlockElement
											dims = (83.0, 32.0)
											just = [
												-1.0
												1.0
											]
											pos_anchor = [
												-1.0
												1.0
											]
											pos = (41.24205, -4.216315)
											z_priority = 6.0
											rgba = [
												100
												88
												71
												255
											]
											text = qs("Free")
											font = fontgrid_title_a1
											fit_width = `scale each line if larger`
											fit_height = `scale down if larger`
											scale_mode = proportional
											text_case = Original
											internal_just = [
												-1.0
												0.0
											]
											shadow_offs = (3.0, 3.0)
										}
									}
								]
							}
						]
					}
				]
			}
		]
	}
}
uidesc_generic_list_menu_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
