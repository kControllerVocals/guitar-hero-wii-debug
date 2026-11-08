uidesc_leaderboard_row_header_band = {
	DescVersion = 4
	name = uidesc_leaderboard_row_header_band
	rect = [
		-489.5
		-50.0
		1033.0
		100.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = NewElement2
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = LB_rowheader_rank_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = LB_RANK
					includeParentOwned = false
				}
			]
			name = rank_text
			visiblename = 'rank_text'
			help = 'NewElement1 -> NewElement2 -> LB_rowheader_rank_container -> LB_RANK => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = NewElement2
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = LB_rowheader_name_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = LB_NAME
					includeParentOwned = false
				}
			]
			name = name_text
			visiblename = 'name_text'
			help = 'NewElement1 -> NewElement2 -> LB_rowheader_name_container -> LB_NAME => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = NewElement2
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = LB_rowheader_score_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = LB_SCORE
					includeParentOwned = false
				}
			]
			name = score_text
			visiblename = 'score_text'
			help = 'NewElement1 -> NewElement2 -> LB_rowheader_score_container -> LB_SCORE => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = NewElement1
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
					local_id = NewElement2
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (979.0, 100.0)
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
					isVertical = false
					internal_just = [
						0.0
						0.0
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
							local_id = LB_rowheader_rank_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (90.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (45.0, 50.0)
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
									texture = white
									local_id = LB_rowheader_rank
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.8
									dims = (90.0, 50.0)
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
										25
										80
										95
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									local_id = LB_RANK
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (70.0, 50.0)
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
										0
										0
										0
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("RANK")
									font = fontgrid_title_a1
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
									text_case = upper
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (0.4, 0.4)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = false
									use_shadow = false
									shadow_rgba = [
										45
										100
										115
										255
									]
									shadow_offs = (2.0, 2.0)
									line_spacing = 1.0
								}
							}
						]
					}
					{
						props = {
							blend = blend
							texture = white
							local_id = divide01
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (10.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (95.0, 50.0)
							z_priority = 1.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								25
								80
								95
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							local_id = LB_rowheader_name_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (489.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (344.5, 50.0)
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
									texture = white
									local_id = LB_rowheader_name
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.8
									dims = (489.0, 50.0)
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
										25
										80
										95
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									local_id = LB_NAME
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (469.0, 50.0)
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
										0
										0
										0
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("NAME")
									font = fontgrid_title_a1
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
									text_case = upper
									internal_just = [
										-1.0
										0.0
									]
									internal_scale = (0.4, 0.4)
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
							blend = blend
							texture = white
							local_id = divide02
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (10.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (594.0, 50.0)
							z_priority = 1.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								25
								80
								95
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							local_id = LB_rowheader_score_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (190.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (694.0, 50.0)
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
									texture = white
									local_id = LB_rowheader_score
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.8
									dims = (190.0, 50.0)
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
										25
										80
										95
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									local_id = LB_SCORE
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (170.0, 50.0)
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
										0
										0
										0
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("SCORE")
									font = fontgrid_title_a1
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
									text_case = upper
									internal_just = [
										1.0
										0.0
									]
									internal_scale = (0.4, 0.4)
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
							blend = blend
							texture = white
							local_id = divide03
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (10.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (794.0, 50.0)
							z_priority = 1.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								25
								80
								95
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							local_id = LB_rowheader_diff_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (180.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (889.0, 50.0)
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
									texture = white
									local_id = LB_rowheader_diff
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.4
									dims = (180.0, 50.0)
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
										25
										80
										95
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									local_id = instrument_container
									type = MenuElement
									hiddenLocal = false
									alpha = 0.9
									dims = (384.0, 45.0)
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
									scale = (0.75, 0.75)
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
									spacing_between = -64
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
											texture = mixer_icon_guitar
											material = 0x00000000
											local_id = LB_instrument_icon
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (128.0, 128.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (96.0, 22.5)
											z_priority = 2.0
											scale = (1.0, 1.0)
											rot_angle = 0.0
											rgba = [
												200
												230
												230
												255
											]
											events_blocked = 0
											preserve_local_orientation = false
										}
									}
									{
										props = {
											local_id = LB_instrument_icon
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (128.0, 128.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (160.0, 22.5)
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
													texture = mixer_icon_bass
													material = 0x00000000
													local_id = LB_instrument_icon
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (72.00007, 64.0)
													z_priority = 2.0
													scale = (1.0, 1.0)
													rot_angle = 0.0
													rgba = [
														200
														230
														230
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
											local_id = LB_instrument_icon
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (128.0, 128.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (224.0, 22.5)
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
													texture = mixer_icon_drums
													material = 0x00000000
													local_id = LB_instrument_icon
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (128.0, 128.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (84.00004, 64.0)
													z_priority = 2.0
													scale = (1.0, 1.0)
													rot_angle = 0.0
													rgba = [
														200
														230
														230
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
											texture = mixer_icon_vox
											material = 0x00000000
											local_id = LB_instrument_icon
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (128.0, 128.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (288.0, 22.5)
											z_priority = 2.0
											scale = (1.0, 1.0)
											rot_angle = 0.0
											rgba = [
												200
												230
												230
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
				]
			}
		]
	}
}
uidesc_leaderboard_row_header_band_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
