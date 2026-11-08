uidesc_song_summary_details_list = {
	DescVersion = 22
	name = uidesc_song_summary_details_list
	rect = [
		0.0
		-64.322205
		1280.0
		1425.9243
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 1
					validateLocalID = scrolling_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = verses_list
					includeParentOwned = false
				}
			]
			name = alias_verses_list
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons_p1
					includeParentOwned = false
				}
			]
			name = icons_p1_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = icons_p2
					includeParentOwned = false
				}
			]
			name = icons_p2_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = icons_p3
					includeParentOwned = false
				}
			]
			name = icons_p3_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = icons_p4
					includeParentOwned = false
				}
			]
			name = icons_p4_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons_p1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = instrument_p1
					includeParentOwned = false
				}
			]
			name = instrument_p1_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icons_p1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = DIFFICULTY_p1
					includeParentOwned = false
				}
			]
			name = DIFFICULTY_p1_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = icons_p2
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = instrument_p2
					includeParentOwned = false
				}
			]
			name = instrument_p2_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = icons_p2
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = DIFFICULTY_p2
					includeParentOwned = false
				}
			]
			name = DIFFICULTY_p2_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = icons_p3
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = instrument_p3
					includeParentOwned = false
				}
			]
			name = instrument_p3_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = icons_p3
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = DIFFICULTY_p3
					includeParentOwned = false
				}
			]
			name = DIFFICULTY_p3_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = icons_p4
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = instrument_p4
					includeParentOwned = false
				}
			]
			name = instrument_p4_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = song_summary_details_list_container
				}
				{
					index = 4
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = icons_p4
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = DIFFICULTY_p4
					includeParentOwned = false
				}
			]
			name = DIFFICULTY_p4_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = song_summary_details_list_container
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = lines
					type = MenuElement
					dims = (100.0, 525.0)
					just = [
						-1.0
						-1.0
					]
					pos = (559.1748, 171.36903)
					z_priority = 1.0
					internal_just = [
						0.0
						0.0
					]
					spacing_between = 35
					position_children = true
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							local_id = dark_line
							type = SpriteElement
							alpha = 0.4
							dims = (945.0, 35.0)
							pos = (50.0, 87.5)
							z_priority = 1.0
							rgba = [
								0
								0
								0
								150
							]
						}
					}
					{
						props = {
							local_id = dark_line
							type = SpriteElement
							alpha = 0.4
							dims = (945.0, 35.0)
							pos = (50.0, 157.5)
							z_priority = 1.0
							rgba = [
								0
								0
								0
								150
							]
						}
					}
					{
						props = {
							local_id = dark_line
							type = SpriteElement
							alpha = 0.4
							dims = (945.0, 35.0)
							pos = (50.0, 227.5)
							z_priority = 1.0
							rgba = [
								0
								0
								0
								150
							]
						}
					}
					{
						props = {
							local_id = dark_line
							type = SpriteElement
							alpha = 0.4
							dims = (945.0, 35.0)
							pos = (50.0, 297.5)
							z_priority = 1.0
							rgba = [
								0
								0
								0
								150
							]
						}
					}
					{
						props = {
							local_id = dark_line
							type = SpriteElement
							alpha = 0.4
							dims = (945.0, 35.0)
							pos = (50.0, 367.5)
							z_priority = 1.0
							rgba = [
								0
								0
								0
								150
							]
						}
					}
					{
						props = {
							local_id = dark_line
							type = SpriteElement
							alpha = 0.4
							dims = (945.0, 35.0)
							pos = (50.0, 437.5)
							z_priority = 1.0
							rgba = [
								0
								0
								0
								150
							]
						}
					}
				]
			}
			{
				props = {
					local_id = scrolling_menu
					type = ScrollingMenu
					hiddenLocal = false
					alpha = 1.0
					dims = (850.0, 385.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (147.73584, 278.89374)
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
					adjust_visibility = true
					center_selection = false
					top_selection = false
				}
				children = [
					{
						props = {
							local_id = verses_list
							type = MenuElement
							dims = (100.0, 1082.7084)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 1.0
							internal_just = [
								-1.0
								-1.0
							]
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = false
						}
					}
				]
			}
			{
				props = {
					local_id = player_names
					type = MenuElement
					hiddenLocal = true
					dims = (660.0, 40.0)
					just = [
						-1.0
						-1.0
					]
					pos = (523.11536, 236.02676)
					z_priority = 1.0
					isVertical = false
					internal_just = [
						1.0
						0.0
					]
					spacing_between = 80
					position_children = true
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							local_id = `player 1`
							type = TextBlockElement
							hiddenLocal = true
							dims = (60.0, 40.0)
							pos = (210.0, 20.0)
							z_priority = 2.0
							rgba = [
								64
								64
								64
								255
							]
							text = qs("P1")
							font = fontgrid_text_a8
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								-1.0
							]
						}
					}
					{
						props = {
							local_id = `player 2`
							type = TextBlockElement
							hiddenLocal = true
							dims = (60.0, 40.0)
							pos = (350.0, 20.0)
							z_priority = 2.0
							rgba = [
								64
								64
								64
								255
							]
							text = qs("P2")
							font = fontgrid_text_a8
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								-1.0
							]
						}
					}
					{
						props = {
							local_id = `player 3`
							type = TextBlockElement
							hiddenLocal = true
							dims = (60.0, 40.0)
							pos = (490.0, 20.0)
							z_priority = 2.0
							rgba = [
								64
								64
								64
								255
							]
							text = qs("P3")
							font = fontgrid_text_a8
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								-1.0
							]
						}
					}
					{
						props = {
							local_id = `player 4`
							type = TextBlockElement
							hiddenLocal = true
							dims = (60.0, 40.0)
							pos = (630.0, 20.0)
							z_priority = 2.0
							rgba = [
								64
								64
								64
								255
							]
							text = qs("P4")
							font = fontgrid_text_a8
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								-1.0
							]
						}
					}
				]
			}
			{
				props = {
					texture = detailed_stats_bkgd
					local_id = detailed_stats_bkgd
					type = SpriteElement
					hiddenLocal = true
					dims = (1157.0, 775.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (5.934685, -36.822216)
					z_priority = 1.0
				}
			}
			{
				props = {
					local_id = players
					type = MenuElement
					dims = (518.0, 40.0)
					just = [
						-1.0
						-1.0
					]
					pos = (531.85046, 239.27975)
					z_priority = 1.0
					isVertical = false
					internal_just = [
						1.0
						0.0
					]
					spacing_between = 34
					position_children = true
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							local_id = icons_p1
							type = MenuElement
							dims = (104.0, 64.0)
							pos = (52.0, 20.0)
							z_priority = 2.0
							isVertical = false
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -10
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									material = 0x00000000
									texture = mixer_icon_bass
									local_id = instrument_p1
									type = SpriteElement
									dims = (64.0, 64.0)
									pos = (37.0, 32.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = icon_difficulty_beginner
									local_id = DIFFICULTY_p1
									type = SpriteElement
									dims = (40.0, 40.0)
									pos = (79.0, 32.0)
									z_priority = 3.0
								}
							}
						]
					}
					{
						props = {
							local_id = icons_p2
							type = MenuElement
							dims = (104.0, 64.0)
							pos = (190.0, 20.0)
							z_priority = 2.0
							isVertical = false
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -10
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									texture = mixer_icon_bass
									local_id = instrument_p2
									type = SpriteElement
									dims = (64.0, 64.0)
									pos = (37.0, 32.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = icon_difficulty_beginner
									local_id = DIFFICULTY_p2
									type = SpriteElement
									dims = (40.0, 40.0)
									pos = (79.0, 32.0)
									z_priority = 3.0
								}
							}
						]
					}
					{
						props = {
							local_id = icons_p3
							type = MenuElement
							dims = (104.0, 64.0)
							pos = (328.0, 20.0)
							z_priority = 2.0
							isVertical = false
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -10
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									texture = mixer_icon_bass
									local_id = instrument_p3
									type = SpriteElement
									dims = (64.0, 64.0)
									pos = (37.0, 32.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = icon_difficulty_beginner
									local_id = DIFFICULTY_p3
									type = SpriteElement
									dims = (40.0, 40.0)
									pos = (79.0, 32.0)
									z_priority = 3.0
								}
							}
						]
					}
					{
						props = {
							local_id = icons_p4
							type = MenuElement
							dims = (104.0, 64.0)
							pos = (466.0, 20.0)
							z_priority = 2.0
							isVertical = false
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -10
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									texture = mixer_icon_bass
									local_id = instrument_p4
									type = SpriteElement
									dims = (64.0, 64.0)
									pos = (37.0, 32.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = icon_difficulty_beginner
									local_id = DIFFICULTY_p4
									type = SpriteElement
									dims = (40.0, 40.0)
									pos = (79.0, 32.0)
									z_priority = 3.0
								}
							}
						]
					}
				]
			}
		]
	}
}
uidesc_song_summary_details_list_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
