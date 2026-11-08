uidesc_song_complete_h2h = {
	DescVersion = 4
	name = uidesc_song_complete_h2h
	rect = [
		-42.05865
		-0.5213469
		1400.0
		935.318
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 1
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
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 0
					validateLocalID = song_complete_stars
					includeParentOwned = false
				}
			]
			name = alias_song_complete_stars
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 1
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
					index = 3
					validateLocalID = song_complete_h2h_player_patch01
					includeParentOwned = false
				}
			]
			name = alias_song_complete_h2h_player_patch_1
		}
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 4
					validateLocalID = song_complete_h2h_player_patch02
					includeParentOwned = false
				}
			]
			name = alias_song_complete_h2h_player_patch_2
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 2
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
					index = 2
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
					index = 1
					validateLocalID = strips
					includeParentOwned = false
				}
			]
			name = strips_pos
			target = pos
			type = pair
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
					local_id = song_complete_stars
					type = MenuElement
					hiddenLocal = true
					dims = (1400.0, 60.0)
					pos = (607.94135, 107.33728)
					z_priority = 1.0
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
							texture = song_complete_star
							local_id = song_complete_star01
							type = SpriteElement
							hiddenLocal = true
							dims = (34.0, 34.0)
							pos = (666.0, 30.0)
							z_priority = 2.0
						}
					}
					{
						props = {
							texture = song_complete_star
							local_id = song_complete_star02
							type = SpriteElement
							hiddenLocal = true
							dims = (34.0, 34.0)
							pos = (700.0, 30.0)
							z_priority = 2.0
						}
					}
					{
						props = {
							texture = song_complete_star
							local_id = song_complete_star03
							type = SpriteElement
							hiddenLocal = true
							dims = (34.0, 34.0)
							pos = (734.0, 30.0)
							z_priority = 2.0
						}
					}
				]
			}
			{
				props = {
					local_id = strips
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (126.733154, 178.21779)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = player_stats_element
							type = MenuElement
							dims = (100.0, 537.2332)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (424.28082, 387.9623)
							z_priority = 1.0
							internal_just = [
								0.0
								-1.0
							]
							spacing_between = -24
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = song_complete_h2h_stats
									type = DescInterface
									hiddenLocal = false
									alpha = 1.0
									dims = (965.93256, 109.764626)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 54.882317)
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
									desc = 'song_complete_h2h_stats'
									autoSizeDims = true
									cash_milestones_icon_pho_texture = cash_milestones_icon_pho
									number_text_text = qs("100")
									player_name_text = qs("WWWWWWWWWWWWWWW")
									notes_hit_text = qs("100%")
									note_streak_text = qs("100")
									mixer_icon_guitar_texture = mixer_icon_guitar
									icon_difficulty_texture = icon_difficulty_expert
									hand_devil_horn_alpha = 1.0
									hand_thumb_down_alpha = 1.0
									check_mark_alpha = 1.0
								}
							}
							{
								props = {
									local_id = song_complete_h2h_stats
									type = DescInterface
									hiddenLocal = false
									alpha = 1.0
									dims = (965.93256, 109.764626)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 140.64694)
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
									desc = 'song_complete_h2h_stats'
									autoSizeDims = true
									cash_milestones_icon_pho_texture = cash_milestones_icon_pho
									number_text_text = qs("100")
									player_name_text = qs("WWWWWWWWWWWWWWW")
									notes_hit_text = qs("100%")
									note_streak_text = qs("100")
									mixer_icon_guitar_texture = mixer_icon_guitar
									icon_difficulty_texture = icon_difficulty_expert
									hand_devil_horn_alpha = 1.0
									hand_thumb_down_alpha = 1.0
									check_mark_alpha = 1.0
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
							pos = (202.87445, 43.90454)
							z_priority = 1.0
						}
						children = [
							{
								props = {
									local_id = leather_strips_mask_p1
									type = WindowElement
									hiddenLocal = false
									alpha = 1.0
									dims = (880.0, 100.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-185.61084, 147.10768)
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
											dims = (870.0, 162.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.615623, -50.58238)
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
									dims = (880.0, 100.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-185.61084, 233.87183)
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
											dims = (870.0, 162.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.615623, -50.58238)
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
							texture = leather_strips_title
							flip_h = false
							flip_v = true
							local_id = leather_strips_title
							type = SpriteElement
							dims = (870.0, 60.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (419.49838, 130.94391)
							z_priority = 1.0
							rgba = [
								255
								255
								255
								200
							]
						}
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
							pos = (0.0, -2.0)
							z_priority = 1.0
						}
						children = [
							{
								props = {
									local_id = name
									type = TextBlockElement
									dims = (200.0, 26.0)
									pos = (288.4488, 177.88086)
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
									local_id = notes
									type = TextBlockElement
									dims = (94.0, 26.0)
									pos = (580.7257, 177.88089)
									z_priority = 2.0
									rgba = [
										224
										224
										224
										255
									]
									text = qs("NOTES")
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
									local_id = streak
									type = TextBlockElement
									dims = (100.0, 26.0)
									pos = (678.24664, 177.88086)
									z_priority = 2.0
									rgba = [
										224
										224
										224
										255
									]
									text = qs("STREAK")
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
									pos = (165.49559, 177.88086)
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
							text = qs("Song Name Here")
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
			{
				props = {
					local_id = song_complete_h2h_player_patch01
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (480.0, 200.00002)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (147.64424, 49.444675)
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
					desc = 'song_complete_h2h_player_patch'
					autoSizeDims = true
					player_name_text = qs("WWWWWWWWWWWWWWW")
					score_entry_text = qs("SCORE: 000,000")
					multiplier_entry_text = qs("HIGHEST MULTIPLIER: 8x")
					notestreak_entry_text = qs("NOTE STREAK: 100")
				}
			}
			{
				props = {
					local_id = song_complete_h2h_player_patch02
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (480.0, 200.00002)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (530.949, 50.009094)
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
					desc = 'song_complete_h2h_player_patch'
					autoSizeDims = true
					player_name_text = qs("WWWWWWWWWWWWWWW")
					score_entry_text = qs("SCORE: 000,000")
					multiplier_entry_text = qs("HIGHEST MULTIPLIER: 8x")
					notestreak_entry_text = qs("NOTE STREAK: 100")
				}
			}
		]
	}
}
uidesc_song_complete_h2h_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
