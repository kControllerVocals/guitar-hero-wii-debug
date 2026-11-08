uidesc_band_play_menu = {
	DescVersion = 6
	name = uidesc_band_play_menu
	rect = [
		-174.7358
		-271.5985
		345.59995
		889.1741
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = menu_window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = scrolling_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = menu
					includeParentOwned = false
				}
			]
			name = alias_menu
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = menu_window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = scrolling_menu
					includeParentOwned = false
				}
			]
			name = alias_scrolling_menu
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = cash_milestone
					includeParentOwned = false
				}
			]
			name = cash_milestone_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = Scroll_Arrow
					includeParentOwned = false
				}
			]
			name = scroll_arrow_alpha
			visiblename = 'scroll_arrow_alpha'
			help = 'player -> reposition -> scroll_arrow => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = instrument
					includeParentOwned = false
				}
			]
			name = instrument_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = leader_indicator
					includeParentOwned = false
				}
			]
			name = leader_indicator_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = rank_number_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = rank_number
					includeParentOwned = false
				}
			]
			name = rank_number_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gamertag
					includeParentOwned = false
				}
			]
			name = gamertag_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = name
					includeParentOwned = false
				}
			]
			name = name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = instrument
					includeParentOwned = false
				}
			]
			name = instrument_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = cash_milestone
					includeParentOwned = false
				}
			]
			name = cash_milestone_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = dropshadow
					includeParentOwned = false
				}
			]
			name = cash_milestone_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = rank_number_container
					includeParentOwned = false
				}
			]
			name = rank_number_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player
				}
			]
			name = player_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = background
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Menu_Player_bg
					includeParentOwned = false
				}
			]
			name = Menu_Player_bg_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 1
					validateLocalID = ready_banner
					includeParentOwned = false
				}
			]
			name = ready_banner_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
			]
			name = reposition_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 1
					validateLocalID = ready_banner
					includeParentOwned = false
				}
			]
			name = ready_banner_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gamertag
					includeParentOwned = false
				}
			]
			name = gamertag_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gamertag
					includeParentOwned = false
				}
			]
			name = GamerTag_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = name
					includeParentOwned = false
				}
			]
			name = name_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = name
					includeParentOwned = false
				}
			]
			name = name_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 1
					validateLocalID = ready_banner
					includeParentOwned = false
				}
			]
			name = ready_banner_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = player
				}
				{
					index = 0
					validateLocalID = reposition
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = headset_icon
					includeParentOwned = false
				}
			]
			name = headset_icon_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = player
			type = ContainerElement
			dims = (100.0, 100.0)
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
			z_priority = 1.0
		}
		children = [
			{
				props = {
					local_id = reposition
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = icons
							type = ContainerElement
							dims = (50.0, 50.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (24.352737, -198.082)
							z_priority = 3.1
						}
						children = [
							{
								props = {
									texture = cash_milestone_icon_007
									local_id = cash_milestone
									type = SpriteElement
									dims = (50.0, 50.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-127.092255, -39.749084)
									z_priority = 3.1
								}
							}
							{
								props = {
									texture = icon_dropshadow
									local_id = dropshadow
									type = SpriteElement
									dims = (32.0, 32.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-127.04463, -15.880548)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mixer_icon_drums
									local_id = instrument
									type = SpriteElement
									dims = (70.0, 70.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (50.77014, -30.220716)
									z_priority = 5.0
								}
							}
							{
								props = {
									texture = leader_indicator
									local_id = leader_indicator
									type = SpriteElement
									dims = (64.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-31.775805, -41.516537)
									z_priority = 4.0
								}
							}
							{
								props = {
									texture = rank_container
									local_id = rank_number_container
									type = SpriteElement
									dims = (40.0, 40.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-90.51936, -31.761147)
									z_priority = 4.0
								}
								children = [
									{
										props = {
											local_id = rank_number
											type = TextBlockElement
											dims = (35.0, 30.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (3.1284559, -0.047606997)
											z_priority = 5.0
											rgba = [
												0
												0
												0
												255
											]
											text = qs("")
											font = fontgrid_text_a3
											fit_width = wrap
											fit_height = `scale down if larger`
											scale_mode = proportional
											text_case = Original
											shadow_offs = (3.0, 3.0)
										}
									}
								]
							}
							{
								props = {
									texture = speaker
									local_id = headset_icon
									type = SpriteElement
									alpha = 0.0
									dims = (32.0, 32.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-111.05258, -32.42726)
									z_priority = 5.0
								}
							}
						]
					}
					{
						props = {
							local_id = background
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.765839, -0.31281304)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = Menu_Player_bg
									local_id = Menu_Player_bg
									type = SpriteElement
									alpha = 0.8
									dims = (256.0, 520.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-2.701647, 129.79019)
									z_priority = 2.0
									scale = (1.3499999, 1.24)
								}
							}
							{
								props = {
									texture = Menu_Player_banner
									local_id = Menu_Player_banner
									type = SpriteElement
									dims = (270.0, 128.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (1.2706451, -184.47398)
									z_priority = 3.0
									scale = (1.0, 1.1)
								}
							}
						]
					}
					{
						props = {
							local_id = text
							type = WindowElement
							hiddenLocal = false
							alpha = 1.0
							dims = (248.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (2.3305929, -173.18141)
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
									local_id = gamertag
									type = TextBlockElement
									dims = (248.0, 40.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										0.0
									]
									pos = (0.0, -19.846725)
									z_priority = 4.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `expand dims`
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
									local_id = name
									type = TextBlockElement
									dims = (248.0, 40.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										0.0
									]
									pos = (0.0, 19.281372)
									z_priority = 5.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `expand dims`
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
							local_id = menu_window
							type = WindowElement
							hiddenLocal = false
							alpha = 1.0
							dims = (200.0, 500.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -112.685074)
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
									local_id = scrolling_menu
									type = ScrollingMenu
									hiddenLocal = false
									alpha = 1.0
									dims = (200.0, 200.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, -250.0)
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
									adjust_visibility = false
									center_selection = false
									top_selection = false
								}
								children = [
									{
										props = {
											local_id = menu
											type = MenuElement
											dims = (200.0, 0.0)
											pos = (100.0, 0.0)
											z_priority = 4.0
											internal_just = [
												0.0
												-1.0
											]
											fit_major = `expand if content larger`
											fit_minor = `keep dims`
											scale_mode = proportional
										}
									}
								]
							}
						]
					}
					{
						props = {
							local_id = Scroll_Arrow
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.103798, 114.27087)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = name_arrow_up
									local_id = name_arrow_up
									type = SpriteElement
									dims = (25.0, 25.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-3.685994, -232.62645)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = name_arrow_up
									flip_h = true
									local_id = name_arrow_up
									type = SpriteElement
									dims = (25.0, 25.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-3.685994, -14.62645)
									z_priority = 3.0
								}
							}
						]
					}
				]
			}
			{
				props = {
					texture = ready_banner
					local_id = ready_banner
					type = SpriteElement
					dims = (128.0, 128.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 500.0)
					z_priority = 4.1
					scale = (1.5, 1.5)
					rot_angle = -15.0
				}
			}
		]
	}
}
uidesc_band_play_menu_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
