uidesc_song_complete_gig_cash = {
	DescVersion = 12
	name = uidesc_song_complete_gig_cash
	rect = [
		50.0
		-203.55487
		1171.2638
		993.25165
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 0
					validateLocalID = strips
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = player_stats_element
					includeParentOwned = false
				}
			]
			name = alias_player_stats_element
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 0
					validateLocalID = strips
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = leather_strips
					includeParentOwned = false
				}
			]
			name = alias_leather_strips
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 1
					validateLocalID = band_header_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 1
					validateLocalID = band_header_container
					includeParentOwned = false
				}
			]
			name = band_header_container_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 0
					validateLocalID = strips
					includeParentOwned = false
				}
			]
			name = strips_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 0
					validateLocalID = strips
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = leather_strips
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = leather_strips_mask_p4
					includeParentOwned = false
				}
			]
			name = leather_strips_mask_p4_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 0
					validateLocalID = strips
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = leather_strips
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = leather_strips_mask_p3
					includeParentOwned = false
				}
			]
			name = leather_strips_mask_p3_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 0
					validateLocalID = strips
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = leather_strips
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = leather_strips_mask_p2
					includeParentOwned = false
				}
			]
			name = leather_strips_mask_p2_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 0
					validateLocalID = strips
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = player_stats_element
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = player_cash_stats_p2
					includeParentOwned = false
				}
			]
			name = player_cash_stats_p2_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 0
					validateLocalID = strips
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = player_stats_element
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = player_cash_stats_p3
					includeParentOwned = false
				}
			]
			name = player_cash_stats_p3_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 0
					validateLocalID = strips
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = player_stats_element
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = player_cash_stats_p4
					includeParentOwned = false
				}
			]
			name = player_cash_stats_p4_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 0
					validateLocalID = strips
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = upper_text
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = gig_cash
					includeParentOwned = false
				}
			]
			name = gig_cash_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = player_stats_container
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (100.0, 100.0)
		}
		children = [
			{
				props = {
					local_id = strips
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (100.0, 40.140217)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = player_stats_element
							type = MenuElement
							dims = (100.0, 993.25165)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (411.96298, 152.93074)
							z_priority = 1.0
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -320
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = player_cash_stats_p1
									type = DescInterface
									hiddenLocal = false
									alpha = 1.0
									dims = (1062.1656, 402.40646)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 373.0161)
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
									desc = 'song_complete_player_cash_stats'
									autoSizeDims = true
									cash_milestones_icon_pho_texture = cash_milestones_icon_pho
									number_text_text = qs("99")
									number_text_rgba = [
										255
										215
										0
										255
									]
									gig_cash_text = qs("$000000")
									career_earnings_text = qs("$000000")
									check_mark_alpha = 1.0
									level_up_alpha = 1.0
									player_name_text = qs("WWWWWWWWWWWWWWW")
									mixer_icon_guitar_texture = mixer_icon_guitar
									icon_difficulty_texture = icon_difficulty_expert
								}
							}
							{
								props = {
									local_id = player_cash_stats_p2
									type = DescInterface
									hiddenLocal = false
									alpha = 1.0
									dims = (1062.1656, 402.40646)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 455.4226)
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
									desc = 'song_complete_player_cash_stats'
									autoSizeDims = true
									cash_milestones_icon_pho_texture = cash_milestones_icon_pho
									number_text_text = qs("99")
									number_text_rgba = [
										255
										215
										0
										255
									]
									gig_cash_text = qs("$000000")
									career_earnings_text = qs("$000000")
									check_mark_alpha = 1.0
									level_up_alpha = 1.0
									player_name_text = qs("WWWWWWWWWWWWWWW")
									mixer_icon_guitar_texture = mixer_icon_guitar
									icon_difficulty_texture = icon_difficulty_expert
								}
							}
							{
								props = {
									local_id = player_cash_stats_p3
									type = DescInterface
									hiddenLocal = false
									alpha = 1.0
									dims = (1062.1656, 402.40646)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 537.8291)
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
									desc = 'song_complete_player_cash_stats'
									autoSizeDims = true
									cash_milestones_icon_pho_texture = cash_milestones_icon_pho
									number_text_text = qs("99")
									number_text_rgba = [
										255
										215
										0
										255
									]
									gig_cash_text = qs("$000000")
									career_earnings_text = qs("$000000")
									check_mark_alpha = 1.0
									level_up_alpha = 1.0
									player_name_text = qs("WWWWWWWWWWWWWWW")
									mixer_icon_guitar_texture = mixer_icon_guitar
									icon_difficulty_texture = icon_difficulty_expert
								}
							}
							{
								props = {
									local_id = player_cash_stats_p4
									type = DescInterface
									hiddenLocal = false
									alpha = 1.0
									dims = (1062.1656, 402.40646)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 620.2356)
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
									desc = 'song_complete_player_cash_stats'
									autoSizeDims = true
									cash_milestones_icon_pho_texture = cash_milestones_icon_pho
									number_text_text = qs("99")
									number_text_rgba = [
										255
										215
										0
										255
									]
									gig_cash_text = qs("$000000")
									career_earnings_text = qs("$000000")
									check_mark_alpha = 1.0
									level_up_alpha = 1.0
									player_name_text = qs("WWWWWWWWWWWWWWW")
									mixer_icon_guitar_texture = mixer_icon_guitar
									icon_difficulty_texture = icon_difficulty_expert
								}
							}
						]
					}
					{
						props = {
							local_id = leather_strips
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (214.87445, 47.90454)
							z_priority = 1.0
						}
						children = [
							{
								props = {
									local_id = leather_strips_mask_p1
									type = WindowElement
									hiddenLocal = false
									alpha = 1.0
									dims = (1100.0, 100.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-243.61084, 147.10768)
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
											texture = leather_strips
											local_id = leather_strips_1
											type = SpriteElement
											dims = (950.0, 162.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (-30.384377, -50.58238)
											z_priority = 2.0
											rgba = [
												255
												255
												255
												155
											]
										}
									}
								]
							}
							{
								props = {
									local_id = leather_strips_mask_p2
									type = WindowElement
									hiddenLocal = false
									alpha = 1.0
									dims = (1100.0, 100.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-247.61087, 208.10768)
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
											texture = leather_strips
											local_id = leather_strips_1
											type = SpriteElement
											dims = (950.0, 162.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (-27.384335, 49.41756)
											z_priority = 2.0
											rgba = [
												255
												255
												255
												155
											]
										}
									}
								]
							}
							{
								props = {
									local_id = leather_strips_mask_p3
									type = WindowElement
									hiddenLocal = false
									alpha = 1.0
									dims = (1100.0, 100.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-243.77252, 310.85663)
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
											texture = leather_strips
											local_id = leather_strips_1
											type = SpriteElement
											dims = (950.0, 162.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (-30.384377, -50.58238)
											z_priority = 2.0
											rgba = [
												255
												255
												255
												155
											]
										}
									}
								]
							}
							{
								props = {
									local_id = leather_strips_mask_p4
									type = WindowElement
									hiddenLocal = false
									alpha = 1.0
									dims = (1100.0, 100.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-246.61087, 371.59912)
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
											texture = leather_strips
											local_id = leather_strips_1
											type = SpriteElement
											dims = (950.0, 162.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (-27.384335, 49.41756)
											z_priority = 2.0
											rgba = [
												255
												255
												255
												155
											]
										}
									}
								]
							}
						]
					}
					{
						props = {
							local_id = upper_text
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-21.0, 0.0)
							z_priority = 1.0
						}
						children = [
							{
								props = {
									local_id = name
									type = TextBlockElement
									dims = (200.0, 26.0)
									pos = (305.4488, 176.88086)
									z_priority = 2.0
									rgba = [
										224
										224
										224
										255
									]
									text = qs("NAME")
									font = fontgrid_text_a8
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = gig_cash
									type = TextBlockElement
									dims = (94.0, 26.0)
									pos = (604.39874, 179.30145)
									z_priority = 2.0
									rgba = [
										224
										224
										224
										255
									]
									text = qs("GIG")
									font = fontgrid_text_a8
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = career_earnings
									type = TextBlockElement
									dims = (120.0, 26.0)
									pos = (762.74567, 176.88086)
									z_priority = 2.0
									rgba = [
										224
										224
										224
										255
									]
									text = qs("CAREER")
									font = fontgrid_text_a8
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = rank
									type = TextBlockElement
									dims = (200.0, 26.0)
									pos = (177.4115, 177.59113)
									z_priority = 2.0
									rgba = [
										224
										224
										224
										255
									]
									text = qs("RANK")
									font = fontgrid_text_a8
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
							texture = leather_strips_title
							flip_h = false
							flip_v = true
							local_id = leather_strips_title
							type = SpriteElement
							dims = (890.0, 60.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (413.3116, 133.07472)
							z_priority = 1.0
							rgba = [
								255
								255
								255
								200
							]
						}
					}
				]
			}
			{
				props = {
					local_id = band_header_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (532.0, -20.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = song_complete_title
							local_id = song_complete_title
							type = SpriteElement
							dims = (1024.0, 160.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.085327, -0.5213469)
							z_priority = 2.0
						}
					}
					{
						props = {
							local_id = title
							type = TextBlockElement
							dims = (600.0, 60.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (3.599976, 11.6402445)
							z_priority = 3.0
							text = qs("Band Name Here")
							font = fontgrid_text_a11_large
							fit_width = wrap
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
		]
	}
}
uidesc_song_complete_gig_cash_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
