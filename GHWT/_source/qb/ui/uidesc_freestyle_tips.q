uidesc_freestyle_tips = {
	DescVersion = 1
	name = uidesc_freestyle_tips
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
					validateLocalID = TipsContainer
				}
				{
					index = 0
					validateLocalID = content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = LeftSide
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ScrollCenter
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = TipsMenuScroll
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = TipsMenu
					includeParentOwned = false
				}
			]
			name = alias_TipsMenu
			visiblename = 'alias_TipsMenu'
			help = 'TipsContainer -> Content -> LeftSide -> ScrollCenter -> TipsMenuScroll -> TipsMenu'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = TipsContainer
				}
				{
					index = 0
					validateLocalID = content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = LeftSide
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = ScrollHeader
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = TipsTitle
					includeParentOwned = false
				}
			]
			name = TipsTitle_text
			visiblename = 'TipsTitle_text'
			help = 'TipsContainer -> Content -> LeftSide -> ScrollHeader -> TipsTitle => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = TipsContainer
				}
				{
					index = 0
					validateLocalID = content
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = MessagePaneContainer
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = TipsText
					includeParentOwned = false
				}
			]
			name = TipsText_text
			visiblename = 'TipsText_text'
			help = 'TipsContainer -> Content -> MessagePaneContainer -> TipsText => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = TipsContainer
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
			z_priority = 200.0
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
					local_id = content
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
					pos = (109.23996, 100.0)
					z_priority = 200.0
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
							local_id = LeftSide
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 576.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-566.89996, -340.03003)
							z_priority = 200.0
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
								-1.0
								-1.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 0
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = true
							allow_alternate_directional_events = false
						}
						children = [
							{
								props = {
									local_id = ScrollHeader
									type = ContainerElement
									hiddenLocal = false
									alpha = 1.0
									dims = (512.0, 128.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 64.0)
									z_priority = 200.0
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
											texture = TipsHeader_Menu
											local_id = TipsHeader_Menu_L
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (256.0, 128.0)
											just = [
												-1.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (0.0, 0.0)
											z_priority = 200.0
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
											texture = TipsHeader_Menu
											flip_v = true
											local_id = TipsHeader_Menu_R
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (256.0, 128.0)
											just = [
												1.0
												-1.0
											]
											pos_anchor = [
												1.0
												-1.0
											]
											pos = (0.0, 0.0)
											z_priority = 200.0
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
											local_id = TipsTitle
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (300.0, 100.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 201.0
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
											text = qs(0x0b670991)
											font = fontgrid_title_a1
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
									local_id = ScrollCenter
									type = ContainerElement
									hiddenLocal = false
									alpha = 1.0
									dims = (512.0, 384.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 320.0)
									z_priority = 200.0
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
											local_id = ChainContainer
											type = MenuElement
											hiddenLocal = false
											alpha = 1.0
											dims = (512.0, 384.0)
											just = [
												-1.0
												0.0
											]
											pos_anchor = [
												-1.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 200.0
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
												-1.0
												-1.0
											]
											regular_space_amount = -1
											padding_scale = 1.0
											spacing_between = 0
											position_children = true
											fit_major = `expand if content larger`
											fit_minor = `keep dims`
											scale_mode = proportional
											allow_wrap = true
											allow_alternate_directional_events = false
										}
										children = [
											{
												props = {
													local_id = ChainRow
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (512.0, 64.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 32.0)
													z_priority = 200.0
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
															texture = TipsChain_Tile
															local_id = TipsChain_Tile_L1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
															texture = TipsChain_Tile
															flip_v = true
															local_id = TipsChain_Tile_R1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																1.0
																-1.0
															]
															pos_anchor = [
																1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
													local_id = ChainRow
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (512.0, 64.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 96.0)
													z_priority = 200.0
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
															texture = TipsChain_Tile
															local_id = TipsChain_Tile_L1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
															texture = TipsChain_Tile
															flip_v = true
															local_id = TipsChain_Tile_R1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																1.0
																-1.0
															]
															pos_anchor = [
																1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
													local_id = ChainRow
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (512.0, 64.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 160.0)
													z_priority = 200.0
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
															texture = TipsChain_Tile
															local_id = TipsChain_Tile_L1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
															texture = TipsChain_Tile
															flip_v = true
															local_id = TipsChain_Tile_R1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																1.0
																-1.0
															]
															pos_anchor = [
																1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
													local_id = ChainRow
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (512.0, 64.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 224.0)
													z_priority = 200.0
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
															texture = TipsChain_Tile
															local_id = TipsChain_Tile_L1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
															texture = TipsChain_Tile
															flip_v = true
															local_id = TipsChain_Tile_R1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																1.0
																-1.0
															]
															pos_anchor = [
																1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
													local_id = ChainRow
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (512.0, 64.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 288.0)
													z_priority = 200.0
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
															texture = TipsChain_Tile
															local_id = TipsChain_Tile_L1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
															texture = TipsChain_Tile
															flip_v = true
															local_id = TipsChain_Tile_R1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																1.0
																-1.0
															]
															pos_anchor = [
																1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
													local_id = ChainRow
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (512.0, 64.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 352.0)
													z_priority = 200.0
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
															texture = TipsChain_Tile
															local_id = TipsChain_Tile_L1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
															texture = TipsChain_Tile
															flip_v = true
															local_id = TipsChain_Tile_R1
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 64.0)
															just = [
																1.0
																-1.0
															]
															pos_anchor = [
																1.0
																-1.0
															]
															pos = (0.0, 0.0)
															z_priority = 200.0
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
											texture = Stats_ScrollArrow
											local_id = Stats_ScrollArrow_Top
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (128.0, 64.0)
											just = [
												0.0
												-1.0
											]
											pos_anchor = [
												0.0
												-1.0
											]
											pos = (0.0, -16.0)
											z_priority = 201.0
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
											flip_h = true
											local_id = Stats_ScrollArrow_Bottom
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (128.0, 64.0)
											just = [
												0.0
												1.0
											]
											pos_anchor = [
												0.0
												1.0
											]
											pos = (0.0, 16.0)
											z_priority = 201.0
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
											local_id = TipsMenuScroll
											type = ScrollingMenu
											hiddenLocal = false
											alpha = 1.0
											dims = (352.0, 288.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 201.0
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
													local_id = TipsMenu
													type = MenuElement
													hiddenLocal = false
													alpha = 1.0
													dims = (352.0, 300.0)
													just = [
														-1.0
														-1.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 0.0)
													z_priority = 202.0
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
													spacing_between = 0
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
								]
							}
							{
								props = {
									local_id = ScrollFooter
									type = ContainerElement
									hiddenLocal = false
									alpha = 1.0
									dims = (512.0, 64.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 544.0)
									z_priority = 200.0
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
											texture = TipsBottom_Menu
											local_id = TipsBottom_Menu_L
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (256.0, 64.0)
											just = [
												-1.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (0.0, 0.0)
											z_priority = 200.0
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
											texture = TipsBottom_Menu
											flip_v = true
											local_id = TipsBottom_Menu_R
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (256.0, 64.0)
											just = [
												1.0
												-1.0
											]
											pos_anchor = [
												1.0
												-1.0
											]
											pos = (0.0, 0.0)
											z_priority = 200.0
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
							local_id = MessagePaneContainer
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (576.0, 448.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (99.33014, -71.61014)
							z_priority = 200.0
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
									local_id = MessagePane
									type = MenuElement
									hiddenLocal = false
									alpha = 1.0
									dims = (576.0, 448.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 200.0
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
										-1.0
										-1.0
									]
									regular_space_amount = -1
									padding_scale = 1.0
									spacing_between = 0
									position_children = true
									fit_major = `expand if content larger`
									fit_minor = `keep dims`
									scale_mode = proportional
									allow_wrap = true
									allow_alternate_directional_events = false
								}
								children = [
									{
										props = {
											local_id = MessageLeft
											type = MenuElement
											hiddenLocal = false
											alpha = 1.0
											dims = (32.0, 448.0)
											just = [
												0.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (16.0, 0.0)
											z_priority = 200.0
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
												-1.0
												-1.0
											]
											regular_space_amount = -1
											padding_scale = 1.0
											spacing_between = 0
											position_children = true
											fit_major = `expand if content larger`
											fit_minor = `keep dims`
											scale_mode = proportional
											allow_wrap = true
											allow_alternate_directional_events = false
										}
										children = [
											{
												props = {
													blend = blend
													texture = TipsMessageBorderCorner_Tile
													local_id = TipsMessageBorderCorner_Tile_TopLeft
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 16.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderVert_Tile
													local_id = TipsMessageBorderVert_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 96.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderVert_Tile
													local_id = TipsMessageBorderVert_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 224.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderVert_Tile
													local_id = TipsMessageBorderVert_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 352.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderCorner_Tile
													flip_h = true
													local_id = TipsMessageBorderCorner_Tile_BottomLeft
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 432.0)
													z_priority = 201.0
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
											local_id = MessageCenter
											type = MenuElement
											hiddenLocal = false
											alpha = 1.0
											dims = (128.0, 448.0)
											just = [
												0.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (96.0, 0.0)
											z_priority = 200.0
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
												-1.0
												-1.0
											]
											regular_space_amount = -1
											padding_scale = 1.0
											spacing_between = 0
											position_children = true
											fit_major = `expand if content larger`
											fit_minor = `keep dims`
											scale_mode = proportional
											allow_wrap = true
											allow_alternate_directional_events = false
										}
										children = [
											{
												props = {
													blend = blend
													texture = TipsMessageBorderHor_Tile
													local_id = TipsMessageBorderHor_Tile_Top
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 16.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 96.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 224.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 352.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderHor_Tile
													flip_h = true
													local_id = TipsMessageBorderHor_Tile_Bottom
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 432.0)
													z_priority = 201.0
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
											local_id = MessageCenter
											type = MenuElement
											hiddenLocal = false
											alpha = 1.0
											dims = (128.0, 448.0)
											just = [
												0.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (224.0, 0.0)
											z_priority = 200.0
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
												-1.0
												-1.0
											]
											regular_space_amount = -1
											padding_scale = 1.0
											spacing_between = 0
											position_children = true
											fit_major = `expand if content larger`
											fit_minor = `keep dims`
											scale_mode = proportional
											allow_wrap = true
											allow_alternate_directional_events = false
										}
										children = [
											{
												props = {
													blend = blend
													texture = TipsMessageBorderHor_Tile
													local_id = TipsMessageBorderHor_Tile_Top
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 16.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 96.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 224.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 352.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderHor_Tile
													flip_h = true
													local_id = TipsMessageBorderHor_Tile_Bottom
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 432.0)
													z_priority = 201.0
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
											local_id = MessageCenter
											type = MenuElement
											hiddenLocal = false
											alpha = 1.0
											dims = (128.0, 448.0)
											just = [
												0.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (352.0, 0.0)
											z_priority = 200.0
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
												-1.0
												-1.0
											]
											regular_space_amount = -1
											padding_scale = 1.0
											spacing_between = 0
											position_children = true
											fit_major = `expand if content larger`
											fit_minor = `keep dims`
											scale_mode = proportional
											allow_wrap = true
											allow_alternate_directional_events = false
										}
										children = [
											{
												props = {
													blend = blend
													texture = TipsMessageBorderHor_Tile
													local_id = TipsMessageBorderHor_Tile_Top
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 16.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 96.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 224.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 352.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderHor_Tile
													flip_h = true
													local_id = TipsMessageBorderHor_Tile_Bottom
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 432.0)
													z_priority = 201.0
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
											local_id = MessageCenter
											type = MenuElement
											hiddenLocal = false
											alpha = 1.0
											dims = (128.0, 448.0)
											just = [
												0.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (480.0, 0.0)
											z_priority = 200.0
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
												-1.0
												-1.0
											]
											regular_space_amount = -1
											padding_scale = 1.0
											spacing_between = 0
											position_children = true
											fit_major = `expand if content larger`
											fit_minor = `keep dims`
											scale_mode = proportional
											allow_wrap = true
											allow_alternate_directional_events = false
										}
										children = [
											{
												props = {
													blend = blend
													texture = TipsMessageBorderHor_Tile
													local_id = TipsMessageBorderHor_Tile_Top
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 16.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 96.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 224.0)
													z_priority = 201.0
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
													texture = TipsMessage_Tile
													local_id = TipsMessage_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 352.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderHor_Tile
													flip_h = true
													local_id = TipsMessageBorderHor_Tile_Bottom
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 432.0)
													z_priority = 201.0
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
											local_id = MessageRight
											type = MenuElement
											hiddenLocal = false
											alpha = 1.0
											dims = (32.0, 448.0)
											just = [
												0.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (560.0, 0.0)
											z_priority = 200.0
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
												-1.0
												-1.0
											]
											regular_space_amount = -1
											padding_scale = 1.0
											spacing_between = 0
											position_children = true
											fit_major = `expand if content larger`
											fit_minor = `keep dims`
											scale_mode = proportional
											allow_wrap = true
											allow_alternate_directional_events = false
										}
										children = [
											{
												props = {
													blend = blend
													texture = TipsMessageBorderCorner_Tile
													flip_v = true
													local_id = TipsMessageBorderCorner_Tile_TopLeft
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 16.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderVert_Tile
													flip_v = true
													local_id = TipsMessageBorderVert_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 96.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderVert_Tile
													flip_v = true
													local_id = TipsMessageBorderVert_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 224.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderVert_Tile
													flip_v = true
													local_id = TipsMessageBorderVert_Tile
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 128.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 352.0)
													z_priority = 201.0
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
													texture = TipsMessageBorderCorner_Tile
													flip_h = true
													flip_v = true
													local_id = TipsMessageBorderCorner_Tile_BottomLeft
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (32.0, 32.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 432.0)
													z_priority = 201.0
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
									local_id = TipsText
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (448.0, 320.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (64.0, 64.0)
									z_priority = 202.0
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
									text = qs(0x909652ca)
									font = fontgrid_text_a8
									material = 0x00000000
									single_line = false
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										0.0
									]
									internal_scale = (0.85, 0.85)
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
		]
	}
}
uidesc_freestyle_tips_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			3
			8
			9
			12
			15
			18
			21
			24
			31
			36
			42
			48
			54
			60
			66
		]
	}
	EditMaterialForm = {
	}
}
