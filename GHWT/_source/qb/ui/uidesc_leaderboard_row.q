uidesc_leaderboard_row = {
	DescVersion = 6
	name = uidesc_leaderboard_row
	rect = [
		-512.0
		-50.0
		1024.0
		100.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 1
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = difficulty_container
					includeParentOwned = false
				}
			]
			name = alias_difficulty_container
			visiblename = 'alias_difficulty_container'
			help = 'row_container -> menu -> difficulty_container'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 1
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = rank
					includeParentOwned = false
				}
			]
			name = rank_text
			visiblename = 'rank_text'
			help = 'row_container -> menu -> rank => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 1
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = data
					includeParentOwned = false
				}
			]
			name = data_text
			visiblename = 'data_text'
			help = 'row_container -> menu -> data => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 1
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = difficulty_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = difficulty
					includeParentOwned = false
				}
			]
			name = difficulty_texture
			visiblename = 'difficulty_texture'
			help = 'row_container -> menu -> difficulty_container -> difficulty => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 0
					validateLocalID = LB_ROW_BG
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = setlist_B_list_hilite_R
					includeParentOwned = false
				}
			]
			name = bg_rgba
			visiblename = 'bg_rgba'
			help = 'row_container -> LB_ROW_BG -> setlist_B_list_hilite_R => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 0
					validateLocalID = LB_ROW_BG
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = setlist_B_list_hilite_R
					includeParentOwned = false
				}
			]
			name = bg_rgba
			visiblename = 'bg_rgba'
			help = 'row_container -> LB_ROW_BG -> setlist_B_list_hilite_R => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 1
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = difficulty_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = difficulty
					includeParentOwned = false
				}
			]
			name = difficulty_alpha
			visiblename = 'difficulty_alpha'
			help = 'row_container -> menu -> difficulty_container -> difficulty => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 1
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = gamertag
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = name
					includeParentOwned = false
				}
			]
			name = name_text
			visiblename = 'name_text'
			help = 'row_container -> menu -> GamerTag -> name => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 1
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = gamertag
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = cash_icon
					includeParentOwned = false
				}
			]
			name = cash_icon_texture
			visiblename = 'cash_icon_texture'
			help = 'row_container -> menu -> GamerTag -> cash_icon => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 1
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = gamertag
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = cash_rank
					includeParentOwned = false
				}
			]
			name = cash_rank_text
			visiblename = 'cash_rank_text'
			help = 'row_container -> menu -> GamerTag -> cash_rank => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 1
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = gamertag
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = cash_icon
					includeParentOwned = false
				}
			]
			name = cash_alpha
			visiblename = 'cash_alpha'
			help = 'row_container -> menu -> GamerTag -> cash_icon => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = row_container
				}
				{
					index = 1
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = gamertag
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = cash_rank
					includeParentOwned = false
				}
			]
			name = cash_alpha
			visiblename = 'cash_alpha'
			help = 'row_container -> menu -> GamerTag -> cash_rank => alpha'
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = row_container
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (1024.0, 45.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				0.0
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
					local_id = LB_ROW_BG
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
							texture = setlist_B_list_hilite_R
							local_id = setlist_B_list_hilite_R
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 32.0)
							just = [
								-1.0
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
								200
								200
								200
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = setlist_B_list_hilite_R
							flip_h = true
							flip_v = true
							local_id = setlist_B_list_hilite_R
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 32.0)
							just = [
								1.0
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
								200
								200
								200
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
					local_id = menu
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (933.0, 45.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-18.0, 0.0)
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
					isVertical = false
					internal_just = [
						0.0
						-1.0
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
							local_id = rank
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 45.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (50.0, 0.0)
							z_priority = 4.0
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
							text = qs("")
							font = fontgrid_text_a3
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `clip bottom lines`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								0.0
							]
							internal_scale = (0.75, 0.75)
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
							local_id = gamertag
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (500.0, 45.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (370.0, 0.0)
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
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = true
							allow_alternate_directional_events = false
						}
						children = [
							{
								props = {
									blend = blend
									texture = cash_milestone_icon_001
									material = 0x00000000
									local_id = cash_icon
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.0
									dims = (45.0, 45.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (21.226421, 22.5)
									z_priority = 5.0
									scale = (0.94339603, 0.94339603)
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
									local_id = cash_rank
									type = TextBlockElement
									hiddenLocal = false
									alpha = 0.0
									dims = (45.0, 45.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (63.67925, 22.5)
									z_priority = 4.0
									scale = (0.94339603, 0.94339603)
									rot_angle = 0.0
									rgba = [
										60
										60
										90
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("1")
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (0.75, 0.75)
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
									local_id = spacer
									type = ContainerElement
									hiddenLocal = false
									alpha = 1.0
									dims = (20.0, 45.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (94.33964, 22.5)
									z_priority = 4.0
									scale = (0.94339603, 0.94339603)
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
									local_id = name
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (420.0, 45.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (301.88678, 22.5)
									z_priority = 4.0
									scale = (0.94339603, 0.94339603)
									rot_angle = 0.0
									rgba = [
										60
										60
										90
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("")
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										0.0
									]
									internal_scale = (0.75, 0.75)
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
							local_id = data
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (230.0, 45.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (755.0, 0.0)
							z_priority = 4.0
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
							text = qs("")
							font = fontgrid_text_a3
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `clip bottom lines`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								0.0
							]
							internal_scale = (0.75, 0.75)
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
							local_id = difficulty_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (43.0, 45.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (911.5, 0.0)
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
									texture = icon_difficulty_expert
									material = 0x00000000
									local_id = difficulty
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.0
									dims = (45.0, 45.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (18.0, 0.037991)
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
				]
			}
		]
	}
}
uidesc_leaderboard_row_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
