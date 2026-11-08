uidesc_gig_board_setlistB = {
	DescVersion = 8
	name = uidesc_gig_board_setlistB
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
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = gig_board_heading
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_songlist
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = gig_board_songlist_stack
					includeParentOwned = false
				}
			]
			name = alias_gig_board_songlist_stack
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = gig_board_heading
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_songlist
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = gig_board_head_bg
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_head
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_heading
					includeParentOwned = false
				}
			]
			name = gig_board_heading_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = gig_board_heading
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_songlist
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = gig_board_head_bg
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_head
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_heading
					includeParentOwned = false
				}
			]
			name = gig_board_heading_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = container
				}
			]
			name = container_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = container
				}
			]
			name = container_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = gig_board_heading
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_songlist
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_WANTED
					includeParentOwned = false
				}
			]
			name = gig_board_WANTED_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = gig_board_heading
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_songlist
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_WANTED
					includeParentOwned = false
				}
			]
			name = gig_board_WANTED_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = gig_board_heading
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_songlist
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = gig_board_venue
					includeParentOwned = false
				}
			]
			name = gig_board_venue_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = gig_board_heading
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_songlist
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = gig_board_venue
					includeParentOwned = false
				}
			]
			name = gig_board_venue_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = gig_board_heading
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_board_songlist
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = gig_board_head_bg
					includeParentOwned = false
				}
			]
			name = gig_board_head_bg_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = container
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
					local_id = gig_board_heading
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
							local_id = gig_board_songlist
							type = MenuElement
							dims = (100.0, 674.5)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
							internal_just = [
								0.0
								0.0
							]
							padding_scale = 0.95
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = gig_board_WANTED
									type = TextBlockElement
									dims = (300.0, 70.0)
									pos = (50.0, 71.25)
									z_priority = 3.0
									rot_angle = -1.5
									rgba = [
										64
										0
										0
										255
									]
									font = fontgrid_text_A11_b
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
								}
							}
							{
								props = {
									texture = head_germany
									material = 0x00000000
									local_id = gig_board_head_bg
									type = SpriteElement
									dims = (700.0, 70.0)
									pos = (50.0, 137.75)
									z_priority = 2.0
								}
								children = [
									{
										props = {
											local_id = gig_board_head
											type = MenuElement
											dims = (600.0, 50.0)
											pos = (350.0, 34.0)
											z_priority = 2.0
											isVertical = false
											internal_just = [
												0.0
												0.0
											]
											spacing_between = -10
											fit_major = `expand if content larger`
											fit_minor = `keep dims`
											scale_mode = proportional
										}
										children = [
											{
												props = {
													local_id = gig_board_heading
													type = TextBlockElement
													dims = (550.0, 98.0)
													pos = (300.0, 25.0)
													z_priority = 3.0
													rot_angle = -1.0
													rgba = [
														64
														0
														0
														255
													]
													text = qs("GERMANY")
													font = fontgrid_text_A11_b
													fit_width = `scale each line if larger`
													fit_height = `scale down if larger`
													scale_mode = proportional
													text_case = Original
													internal_just = [
														0.0
														0.0
													]
													internal_scale = (1.4, 1.4)
												}
											}
										]
									}
								]
							}
							{
								props = {
									local_id = gig_board_venue
									type = TextBlockElement
									dims = (300.0, 70.0)
									pos = (50.0, 204.25)
									z_priority = 3.0
									rot_angle = -0.5
									rgba = [
										64
										0
										0
										255
									]
									font = fontgrid_text_A11_b
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
								}
							}
							{
								props = {
									local_id = spacer
									type = ContainerElement
									dims = (100.0, 20.0)
									pos = (50.0, 247.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									local_id = gig_board_songlist_stack
									type = MenuElement
									dims = (300.0, 400.0)
									pos = (50.0, 446.5)
									z_priority = 2.0
									rot_angle = -1.5
									internal_just = [
										0.0
										-1.0
									]
									padding_scale = 0.55
									fit_major = `fit content if larger`
									fit_minor = `fit content if larger`
									scale_mode = proportional
								}
							}
						]
					}
					{
						props = {
							local_id = `test outline`
							type = SpriteElement
							hiddenLocal = true
							alpha = 0.5
							dims = (700.0, 700.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
						}
					}
				]
			}
		]
	}
}
uidesc_gig_board_setlistB_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
