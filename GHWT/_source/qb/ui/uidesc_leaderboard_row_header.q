uidesc_leaderboard_row_header = {
	DescVersion = 4
	name = uidesc_leaderboard_row_header
	rect = [
		-515.0
		-50.80828
		1030.0
		100.80829
	]
	aliases = [
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
					index = 3
					validateLocalID = LB_rowheader_diff_container
					includeParentOwned = false
				}
			]
			name = alias_difficulty_container
			visiblename = 'alias_difficulty_container'
			help = 'NewElement1 -> NewElement2 -> LB_rowheader_diff_container'
		}
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
					index = 1
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
					index = 2
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
					index = 3
					validateLocalID = LB_rowheader_diff_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = LB_instrument_icon
					includeParentOwned = false
				}
			]
			name = icon_texture
			visiblename = 'icon_texture'
			help = 'NewElement1 -> NewElement2 -> LB_rowheader_diff_container -> LB_instrument_icon => texture'
			target = texture
			type = checksum
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
					dims = (1030.0, 100.0)
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
					spacing_between = 20
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
							dims = (100.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (80.0, 50.0)
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
									alpha = 0.5
									dims = (100.0, 50.0)
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
									dims = (80.0, 50.0)
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
										60
										60
										90
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
							local_id = LB_rowheader_name_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (480.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (390.0, 50.0)
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
									alpha = 0.5
									dims = (480.0, 50.0)
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
									dims = (460.0, 50.0)
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
										60
										60
										90
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
							local_id = LB_rowheader_score_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (250.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (775.0, 50.0)
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
									alpha = 0.5
									dims = (250.0, 50.0)
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
									dims = (230.0, 50.0)
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
										60
										60
										90
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
							local_id = LB_rowheader_diff_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (80.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (960.0, 50.0)
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
									material = 0x00000000
									blend = blend
									texture = white
									local_id = LB_rowheader_diff
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.5
									dims = (80.0, 50.0)
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
									blend = blend
									texture = icon_guitar_64
									material = 0x00000000
									local_id = LB_instrument_icon
									type = SpriteElement
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
									pos = (1.031128, -0.808284)
									z_priority = 2.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										210
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
}
uidesc_leaderboard_row_header_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
