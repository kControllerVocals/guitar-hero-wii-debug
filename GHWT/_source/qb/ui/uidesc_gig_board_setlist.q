uidesc_gig_board_setlist = {
	DescVersion = 10
	name = uidesc_gig_board_setlist
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
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ScrollingMenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_setlist_content
					includeParentOwned = false
				}
			]
			name = alias_gig_setlist_content
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
			]
			name = alias_gig_setlist_master
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ScrollingMenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_setlist_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_item_play
					includeParentOwned = false
				}
			]
			name = alias_gig_item_play
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ScrollingMenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_setlist_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_item_play
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icon_guitar_64
					includeParentOwned = false
				}
			]
			name = icon_guitar_64_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
			]
			name = gig_setlist_master_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ScrollingMenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_setlist_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_item_play
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = PLAY_GIG
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_item_highlight
					includeParentOwned = false
				}
			]
			name = gig_item_highlight_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = arrow_up
					includeParentOwned = false
				}
			]
			name = arrow_up_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = arrow_down
					includeParentOwned = false
				}
			]
			name = arrow_down_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ScrollingMenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_setlist_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_item_play
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = PLAY_GIG
					includeParentOwned = false
				}
			]
			name = PLAY_GIG_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ScrollingMenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_setlist_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_item_play
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = PLAY_GIG
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_item_highlight
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = white
					includeParentOwned = false
				}
			]
			name = highlight_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ScrollingMenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_setlist_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_item_play
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = PLAY_GIG
					includeParentOwned = false
				}
			]
			name = PLAY_GIG_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = arrow_down
					includeParentOwned = false
				}
			]
			name = arrow_down_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = arrow_up
					includeParentOwned = false
				}
			]
			name = arrow_up_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ScrollingMenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_setlist_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_item_play
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icon_guitar_64
					includeParentOwned = false
				}
			]
			name = icon_instrument_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = arrow_down
					includeParentOwned = false
				}
			]
			name = arrow_down_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = gig_setlist_master
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = arrow_up
					includeParentOwned = false
				}
			]
			name = arrow_up_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = gig_setlist_master
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
					local_id = NewElement1
					type = ContainerElement
					dims = (500.0, 500.0)
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
							texture = white
							local_id = arrow_up
							type = SpriteElement
							alpha = 0.0
							dims = (50.0, 50.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
							rgba = [
								0
								0
								0
								255
							]
						}
					}
					{
						props = {
							local_id = ScrollingMenu
							type = ScrollingMenu
							hiddenLocal = false
							alpha = 1.0
							dims = (500.0, 500.0)
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
							isVertical = true
							adjust_visibility = true
							center_selection = false
							top_selection = false
						}
						children = [
							{
								props = {
									local_id = gig_setlist_content
									type = MenuElement
									dims = (500.0, 400.0)
									just = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 2.0
									internal_just = [
										0.0
										0.0
									]
									fit_major = `expand if content larger`
									fit_minor = `keep dims`
									scale_mode = proportional
								}
								children = [
									{
										props = {
											local_id = NewElement1
											type = MenuElement
											dims = (100.0, 100.0)
											pos = (250.0, 200.0)
											z_priority = 3.0
											internal_just = [
												0.0
												0.0
											]
											fit_major = `expand if content larger`
											fit_minor = `keep dims`
											scale_mode = proportional
										}
										children = [
											{
												props = {
													local_id = gig_item_play
													type = MenuElement
													dims = (528.0, 50.0)
													pos = (50.0, 50.0)
													z_priority = 3.0
													isVertical = false
													internal_just = [
														0.0
														0.0
													]
													fit_major = `expand if content larger`
													fit_minor = `keep dims`
													scale_mode = proportional
												}
												children = [
													{
														props = {
															texture = mixer_icon_guitar
															material = 0x00000000
															local_id = icon_guitar_64
															type = SpriteElement
															dims = (80.0, 80.0)
															pos = (125.59999, 25.0)
															z_priority = 4.0
														}
													}
													{
														props = {
															local_id = PLAY_GIG
															type = TextBlockElement
															dims = (276.8, 37.600002)
															pos = (304.0, 25.0)
															z_priority = 4.0
															text = qs("PLAY ENTIRE GIG")
															font = fontgrid_text_a8
															single_line = true
															fit_width = `expand dims`
															fit_height = `expand dims`
															scale_mode = proportional
															text_case = Original
															internal_scale = (0.8, 0.8)
															shadow_offs = (3.0, 3.0)
														}
														children = [
															{
																props = {
																	local_id = gig_item_highlight
																	type = ContainerElement
																	dims = (500.0, 35.0)
																	pos = (98.4, 18.800013)
																	z_priority = 1.0
																	scale = (1.056, 1.056)
																}
																children = [
																	{
																		props = {
																			texture = gig_highlight_blacken
																			local_id = white
																			type = SpriteElement
																			dims = (600.0, 50.0)
																			pos_anchor = [
																				0.0
																				0.0
																			]
																			pos = (-3.324246, -0.42705402)
																			z_priority = 1.0
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
								]
							}
						]
					}
					{
						props = {
							texture = white
							flip_h = false
							local_id = arrow_down
							type = SpriteElement
							alpha = 0.0
							dims = (50.0, 50.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (0.0, 480.0)
							z_priority = 2.0
							rgba = [
								0
								0
								0
								255
							]
						}
					}
				]
			}
		]
	}
}
uidesc_gig_board_setlist_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
