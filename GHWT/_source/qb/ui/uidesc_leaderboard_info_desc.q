uidesc_leaderboard_info_desc = {
	DescVersion = 6
	name = uidesc_leaderboard_info_desc
	rect = [
		-640.0
		-360.0
		1280.0
		720.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = setlist_info_container
				}
				{
					index = 3
					validateLocalID = info_scores_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = score
					includeParentOwned = false
				}
			]
			name = score_text
			visiblename = 'score_text'
			help = 'setlist_info_container -> info_scores_container -> score => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = setlist_info_container
				}
				{
					index = 2
					validateLocalID = LB_info_text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = LB_rank_name_diff
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = LB_info_RANK
					includeParentOwned = false
				}
			]
			name = rank_text
			visiblename = 'RANK_text'
			help = 'setlist_info_container -> LB_info_text -> LB_rank_name_diff -> LB_info_RANK => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = setlist_info_container
				}
				{
					index = 2
					validateLocalID = LB_info_text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = LB_rank_name_diff
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = LB_info_NAME
					includeParentOwned = false
				}
			]
			name = nametag_text
			visiblename = 'nametag_text'
			help = 'setlist_info_container -> LB_info_text -> LB_rank_name_diff -> LB_info_NAME => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = setlist_info_container
				}
				{
					index = 2
					validateLocalID = LB_info_text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = LB_rank_name_diff
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = LB_info_icon
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icon_difficulty_expert
					includeParentOwned = false
				}
			]
			name = icon_texture
			visiblename = 'icon_texture'
			help = 'setlist_info_container -> LB_info_text -> LB_rank_name_diff -> LB_info_icon -> icon_difficulty_expert => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = setlist_info_container
				}
				{
					index = 2
					validateLocalID = LB_info_text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = LB_rank_name_diff
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = LB_info_icon
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icon_difficulty_expert
					includeParentOwned = false
				}
			]
			name = icon_alpha
			visiblename = 'icon_alpha'
			help = 'setlist_info_container -> LB_info_text -> LB_rank_name_diff -> LB_info_icon -> icon_difficulty_expert => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = setlist_info_container
				}
				{
					index = 3
					validateLocalID = info_scores_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = cash_icon
					includeParentOwned = false
				}
			]
			name = cash_icon_texture
			visiblename = 'cash_icon_texture'
			help = 'setlist_info_container -> info_scores_container -> cash_icon => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = setlist_info_container
				}
				{
					index = 3
					validateLocalID = info_scores_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = cash_icon
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = cash_rank
					includeParentOwned = false
				}
			]
			name = cash_rank_text
			visiblename = 'cash_rank_text'
			help = 'setlist_info_container -> info_scores_container -> cash_icon -> cash_rank => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = setlist_info_container
				}
				{
					index = 3
					validateLocalID = info_scores_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = desc
					includeParentOwned = false
				}
			]
			name = score_desc_text
			visiblename = 'score_desc_text'
			help = 'setlist_info_container -> info_scores_container -> desc => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = setlist_info_container
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				0.0
				0.0
			]
			pos = (300.0, 87.0)
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
		children = [
			{
				props = {
					blend = blend
					texture = leaderboard_info_BG
					material = 0x00000000
					local_id = LB_info_BG
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1024.0, 256.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 6.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						224
						224
						224
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
			}
			{
				props = {
					blend = blend
					texture = leaderboard_info_bookend
					material = 0x00000000
					flip_v = false
					local_id = LB_info_bookend
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (256.0, 256.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-396.17307, 1.268494)
					z_priority = 7.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						224
						224
						224
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
			}
			{
				props = {
					local_id = LB_info_text
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (50.0, 50.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (10.0, -16.0)
					z_priority = 6.0
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
							local_id = LB_rank_name_diff
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (700.0, 60.0)
							just = [
								1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								0.0
							]
							pos = (384.0, -37.0)
							z_priority = 7.0
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
								0.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 30
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
									local_id = LB_info_RANK
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (70.0, 50.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (35.0, 30.0)
									z_priority = 7.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										0
										192
										192
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("95")
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
									internal_scale = (0.7, 0.7)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = false
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (-2.0, -2.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = LB_info_NAME
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (520.0, 50.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (360.0, 30.0)
									z_priority = 7.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										192
										192
										192
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("EL CHUMBAWUMBAS")
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
									internal_scale = (0.7, 0.7)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = false
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (-2.0, -2.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = LB_info_icon
									type = ContainerElement
									hiddenLocal = false
									alpha = 1.0
									dims = (50.0, 50.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (675.0, 30.0)
									z_priority = 8.0
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
											local_id = icon_difficulty_expert
											type = SpriteElement
											hiddenLocal = false
											alpha = 0.0
											dims = (64.0, 64.0)
											just = [
												1.0
												0.0
											]
											pos_anchor = [
												1.0
												0.0
											]
											pos = (0.0, -3.0)
											z_priority = 10.0
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
			{
				props = {
					local_id = info_scores_container
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (750.0, 50.0)
					just = [
						1.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (366.5, 34.0)
					z_priority = 8.0
					scale = (0.9, 0.9)
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
						1.0
						0.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = 40
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
							local_id = desc
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (200.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (119.5714, 25.0)
							z_priority = 7.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								15
								67
								84
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("Rock Rank:")
							font = fontgrid_text_a11
							material = 0x00000000
							single_line = false
							fit_width = `expand dims`
							fit_height = `scale to fit`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.5, 0.5)
							blend = blend
							font_spacing = -1
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = true
							shadow_rgba = [
								224
								224
								224
								255
							]
							shadow_offs = (2.0, 2.0)
							line_spacing = 1.0
						}
					}
					{
						props = {
							blend = blend
							texture = cash_milestone_icon_001
							local_id = cash_icon
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (291.5714, 25.0)
							z_priority = 9.0
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
									local_id = cash_rank
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (15.0, 50.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (40.0, 0.0)
									z_priority = 7.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										15
										67
										84
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("1")
									font = fontgrid_text_a11
									material = 0x00000000
									single_line = false
									fit_width = `expand dims`
									fit_height = `scale to fit`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										0.0
									]
									internal_scale = (0.5, 0.5)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = false
									use_shadow = true
									shadow_rgba = [
										224
										224
										224
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
							local_id = spacer
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (50.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (388.5714, 25.0)
							z_priority = 7.0
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
							local_id = desc
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (112.14286, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (509.64288, 25.0)
							z_priority = 7.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								15
								67
								84
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("Score:")
							font = fontgrid_text_a11
							material = 0x00000000
							single_line = false
							fit_width = `expand dims`
							fit_height = `scale to fit`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.5, 0.5)
							blend = blend
							font_spacing = -1
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = true
							shadow_rgba = [
								224
								224
								224
								255
							]
							shadow_offs = (2.0, 2.0)
							line_spacing = 1.0
						}
					}
					{
						props = {
							local_id = score
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (144.28572, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (677.8572, 25.0)
							z_priority = 7.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								15
								67
								84
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("999,999")
							font = fontgrid_text_a11
							material = 0x00000000
							single_line = false
							fit_width = `expand dims`
							fit_height = `scale to fit`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								0.0
							]
							internal_scale = (0.5, 0.5)
							blend = blend
							font_spacing = -1
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = true
							shadow_rgba = [
								224
								224
								224
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
					texture = gradient_256
					blend = subtract
					flip_h = true
					local_id = gradient_256
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.25
					dims = (1280.0, 720.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = -1.0
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
					flip_h = true
					texture = white
					blend = blend
					local_id = black
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.25
					dims = (1280.0, 720.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = -1.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						0
						0
						32
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
			}
		]
	}
}
uidesc_leaderboard_info_desc_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
