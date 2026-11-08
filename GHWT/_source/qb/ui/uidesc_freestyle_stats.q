uidesc_freestyle_stats = {
	DescVersion = 8
	name = uidesc_freestyle_stats
	rect = [
		-4.173523
		-2.444519
		1351.6798
		888.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 1
					validateLocalID = ScrollWindow
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = FreestyleStatsMenu
					includeParentOwned = false
				}
			]
			name = alias_FreestyleStatsMenu
			visiblename = 'alias_FreestyleStatsMenu'
			help = 'FreestyleStatsContainer -> ScrollWindow -> FreestyleStatsMenu'
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 1
					validateLocalID = ScrollWindow
					includeParentOwned = false
				}
			]
			name = alias_ScrollWindow
			visiblename = 'alias_ScrollWindow'
			help = 'FreestyleStatsContainer -> ScrollWindow'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 0
					validateLocalID = FreestyleRatingContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = StarContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star1Empty
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star1Full
					includeParentOwned = false
				}
			]
			name = star1_alpha
			visiblename = 'star1_alpha'
			help = 'FreestyleStatsContainer -> FreestyleRatingContainer -> StarContainer -> star1Empty -> star1Full => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 0
					validateLocalID = FreestyleRatingContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = StarContainer
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = star2Empty
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star2Full
					includeParentOwned = false
				}
			]
			name = star2_alpha
			visiblename = 'star2_alpha'
			help = 'FreestyleStatsContainer -> FreestyleRatingContainer -> StarContainer -> star2Empty -> star2Full => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 0
					validateLocalID = FreestyleRatingContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = StarContainer
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = star3Empty
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star3Full
					includeParentOwned = false
				}
			]
			name = star3_alpha
			visiblename = 'star3_alpha'
			help = 'FreestyleStatsContainer -> FreestyleRatingContainer -> StarContainer -> star3Empty -> star3Full => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 0
					validateLocalID = FreestyleRatingContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = StarContainer
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = star4Empty
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star4Full
					includeParentOwned = false
				}
			]
			name = star4_alpha
			visiblename = 'star4_alpha'
			help = 'FreestyleStatsContainer -> FreestyleRatingContainer -> StarContainer -> star4Empty -> star4Full => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 0
					validateLocalID = FreestyleRatingContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = StarContainer
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = star5Empty
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star5Full
					includeParentOwned = false
				}
			]
			name = star5_alpha
			visiblename = 'star5_alpha'
			help = 'FreestyleStatsContainer -> FreestyleRatingContainer -> StarContainer -> star5Empty -> star5Full => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 0
					validateLocalID = FreestyleRatingContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = StarContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star1Empty
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star1Full
					includeParentOwned = false
				}
			]
			name = star1_texture
			visiblename = 'star1_texture'
			help = 'FreestyleStatsContainer -> FreestyleRatingContainer -> StarContainer -> star1Empty -> star1Full => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 0
					validateLocalID = FreestyleRatingContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = StarContainer
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = star2Empty
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star2Full
					includeParentOwned = false
				}
			]
			name = star2_texture
			visiblename = 'star2_texture'
			help = 'FreestyleStatsContainer -> FreestyleRatingContainer -> StarContainer -> star2Empty -> star2Full => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 0
					validateLocalID = FreestyleRatingContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = StarContainer
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = star3Empty
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star3Full
					includeParentOwned = false
				}
			]
			name = star3_texture
			visiblename = 'star3_texture'
			help = 'FreestyleStatsContainer -> FreestyleRatingContainer -> StarContainer -> star3Empty -> star3Full => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 0
					validateLocalID = FreestyleRatingContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = StarContainer
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = star4Empty
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star4Full
					includeParentOwned = false
				}
			]
			name = star4_texture
			visiblename = 'star4_texture'
			help = 'FreestyleStatsContainer -> FreestyleRatingContainer -> StarContainer -> star4Empty -> star4Full => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 0
					validateLocalID = FreestyleRatingContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = StarContainer
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = star5Empty
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star5Full
					includeParentOwned = false
				}
			]
			name = star5_texture
			visiblename = 'star5_texture'
			help = 'FreestyleStatsContainer -> FreestyleRatingContainer -> StarContainer -> star5Empty -> star5Full => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 3
					validateLocalID = ArrowContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Stats_ScrollArrowDown
					includeParentOwned = false
				}
			]
			name = ArrowDown_alpha
			visiblename = 'ArrowDown_alpha'
			help = 'FreestyleStatsContainer -> ArrowContainer -> Stats_ScrollArrowDown => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatsContainer
				}
				{
					index = 3
					validateLocalID = ArrowContainer
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = Stats_ScrollArrowUp
					includeParentOwned = false
				}
			]
			name = ArrowUp_alpha
			visiblename = 'ArrowUp_alpha'
			help = 'FreestyleStatsContainer -> ArrowContainer -> Stats_ScrollArrowUp => alpha'
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = FreestyleStatsContainer
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (720.0, 480.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (636.66644, 365.55548)
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
					local_id = FreestyleRatingContainer
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (384.0, 128.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						0.0
						-1.0
					]
					pos = (0.0, -100.0)
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
							local_id = StarContainer
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (250.0, 64.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (0.0, -5.0)
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
									texture = Stats_StarOFF
									material = 0x00000000
									local_id = star1Empty
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
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
								children = [
									{
										props = {
											blend = blend
											texture = Stats_StarSilver
											material = 0x00000000
											local_id = star1Full
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
												0.0
											]
											pos = (0.0, 0.0)
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
									blend = blend
									texture = Stats_StarOFF
									material = 0x00000000
									local_id = star2Empty
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 0.0)
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
											texture = Stats_StarSilver
											material = 0x00000000
											local_id = star2Full
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
												0.0
											]
											pos = (0.0, 0.0)
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
									blend = blend
									texture = Stats_StarOFF
									material = 0x00000000
									local_id = star3Empty
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (100.0, 0.0)
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
											texture = Stats_StarSilver
											material = 0x00000000
											local_id = star3Full
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
												0.0
											]
											pos = (0.0, 0.0)
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
									blend = blend
									texture = Stats_StarOFF
									material = 0x00000000
									local_id = star4Empty
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (150.0, 0.0)
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
											texture = Stats_StarSilver
											material = 0x00000000
											local_id = star4Full
											type = SpriteElement
											hiddenLocal = false
											alpha = 0.0
											dims = (64.0, 64.0)
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
									blend = blend
									texture = Stats_StarOFF
									material = 0x00000000
									local_id = star5Empty
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (200.0, 0.0)
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
											texture = Stats_StarSilver
											material = 0x00000000
											local_id = star5Full
											type = SpriteElement
											hiddenLocal = false
											alpha = 0.0
											dims = (64.0, 64.0)
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
									blend = blend
									texture = Stats_StarGold
									material = 0x00000000
									local_id = star6Full
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.0
									dims = (64.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 4.0
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
							local_id = RatingText
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (400.0, 100.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								-1.0
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
							text = qs(0xe3c6faf1)
							font = fontgrid_title_a1
							material = 0x00000000
							single_line = true
							fit_width = `scale down if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
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
					{
						props = {
							blend = blend
							texture = Stats_Header
							local_id = Stats_Header
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 256.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 36.0)
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
				]
			}
			{
				props = {
					local_id = ScrollWindow
					type = WindowElement
					hiddenLocal = false
					alpha = 1.0
					dims = (600.0, 320.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						0.0
						-1.0
					]
					pos = (0.0, 160.0)
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
							local_id = FreestyleStatsMenu
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (500.0, 600.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								-1.0
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
							isVertical = true
							internal_just = [
								0.0
								-1.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 15
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = true
							allow_alternate_directional_events = false
						}
					}
				]
			}
			{
				props = {
					blend = blend
					texture = Stats_BG
					local_id = Stats_BG
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1024.0, 512.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (35.0, 0.0)
					z_priority = 1.0
					scale = (1.3199999, 1.43)
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
					local_id = ArrowContainer
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
					pos = (100.0, -99.0)
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
				children = [
					{
						props = {
							blend = blend
							texture = Stats_ScrollArrow
							flip_h = true
							local_id = Stats_ScrollArrowDown
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (128.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-100.0, 355.0)
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
							blend = blend
							texture = Stats_ScrollArrow
							local_id = Stats_ScrollArrowUp
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (128.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-100.0, 0.0)
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
						}
					}
				]
			}
		]
	}
}
uidesc_freestyle_stats_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
