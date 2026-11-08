uidesc_song_complete_player_cash_stats = {
	DescVersion = 13
	name = uidesc_song_complete_player_cash_stats
	rect = [
		-3.1E-05
		1.5E-05
		1062.1656
		402.40646
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = song_complete_ps_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = cash_milestones_icon_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = cash_milestones_icon_pho
					includeParentOwned = false
				}
			]
			name = cash_milestones_icon_pho_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = song_complete_ps_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = number_text
					includeParentOwned = false
				}
			]
			name = number_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = song_complete_ps_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = number_text
					includeParentOwned = false
				}
			]
			name = number_text_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = song_complete_ps_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = gig_cash
					includeParentOwned = false
				}
			]
			name = gig_cash_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = song_complete_ps_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = career_earnings
					includeParentOwned = false
				}
			]
			name = career_earnings_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = song_complete_ps_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = check_mark_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = check_mark
					includeParentOwned = false
				}
			]
			name = check_mark_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = song_complete_ps_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = level_up_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = level_up
					includeParentOwned = false
				}
			]
			name = level_up_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = song_complete_ps_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = player_name
					includeParentOwned = false
				}
			]
			name = player_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = song_complete_ps_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = instrument_icon_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = mixer_icon_guitar
					includeParentOwned = false
				}
			]
			name = mixer_icon_guitar_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = song_complete_ps_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = icon_difficulty_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icon_difficulty
					includeParentOwned = false
				}
			]
			name = icon_difficulty_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = song_complete_ps_container
			type = ContainerElement
			dims = (400.0, 400.0)
			just = [
				-1.0
				-1.0
			]
			pos = (-3.1E-05, 1.5E-05)
		}
		children = [
			{
				props = {
					local_id = stats
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (186.14882, 40.018463)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = text
							type = MenuElement
							dims = (960.0, 90.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-235.96849, 122.388)
							z_priority = 2.0
							isVertical = false
							internal_just = [
								-1.0
								0.0
							]
							fit_major = `fit content if larger`
							fit_minor = `fit content if larger`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = level_up_container
									type = ContainerElement
									dims = (22.0, 90.0)
									pos = (10.920372, 45.0)
									z_priority = 3.0
									scale = (0.99276096, 0.99276096)
								}
								children = [
									{
										props = {
											texture = level_up
											local_id = level_up
											type = SpriteElement
											dims = (64.0, 64.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 3.0
										}
									}
								]
							}
							{
								props = {
									local_id = cash_milestones_icon_container
									type = ContainerElement
									dims = (72.0, 90.0)
									pos = (57.580147, 45.0)
									z_priority = 3.0
									scale = (0.99276096, 0.99276096)
								}
								children = [
									{
										props = {
											texture = cash_milestones_icon_pho
											local_id = cash_milestones_icon_pho
											type = SpriteElement
											dims = (64.0, 64.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 2.0
										}
									}
								]
							}
							{
								props = {
									local_id = number_text
									type = TextBlockElement
									dims = (58.0, 40.0)
									pos = (122.10962, 45.0)
									z_priority = 4.0
									scale = (0.99276096, 0.99276096)
									rgba = [
										255
										215
										0
										255
									]
									text = qs("99")
									font = fontgrid_text_a8
									fit_width = wrap
									fit_height = `scale to fit`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										0.0
									]
									use_shadow = true
									shadow_offs = (2.0, 2.0)
								}
							}
							{
								props = {
									local_id = player_name
									type = TextBlockElement
									dims = (350.0, 36.0)
									pos = (324.63287, 45.0)
									z_priority = 2.0
									scale = (0.99276096, 0.99276096)
									rgba = [
										220
										122
										5
										255
									]
									text = qs("WWWWWWWWWWWWWWW")
									font = fontgrid_text_a8
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										0.0
									]
									internal_scale = (0.65000004, 0.65000004)
									use_shadow = true
									shadow_offs = (2.0, 2.0)
								}
							}
							{
								props = {
									local_id = gig_cash
									type = TextBlockElement
									dims = (150.0, 36.0)
									pos = (572.8232, 45.0)
									z_priority = 2.0
									scale = (0.99276096, 0.99276096)
									rgba = [
										220
										122
										5
										255
									]
									text = qs("$000000")
									font = fontgrid_text_a8
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										0.0
									]
									use_shadow = true
									shadow_offs = (2.0, 2.0)
								}
							}
							{
								props = {
									local_id = career_earnings
									type = TextBlockElement
									dims = (155.0, 36.0)
									pos = (724.2192, 45.0)
									z_priority = 2.0
									scale = (0.99276096, 0.99276096)
									rgba = [
										220
										122
										5
										255
									]
									text = qs("$000000")
									font = fontgrid_text_a8
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										0.0
									]
									use_shadow = true
									shadow_offs = (2.0, 2.0)
								}
							}
							{
								props = {
									local_id = instrument_icon_container
									type = ContainerElement
									dims = (55.0, 90.0)
									pos = (828.4591, 45.0)
									z_priority = 3.0
									scale = (0.99276096, 0.99276096)
								}
								children = [
									{
										props = {
											texture = mixer_icon_guitar
											local_id = mixer_icon_guitar
											type = SpriteElement
											dims = (90.0, 90.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 3.0
										}
									}
								]
							}
							{
								props = {
									local_id = icon_difficulty_container
									type = ContainerElement
									dims = (45.0, 90.0)
									pos = (878.09717, 45.0)
									z_priority = 3.0
									scale = (0.99276096, 0.99276096)
								}
								children = [
									{
										props = {
											texture = icon_difficulty_expert
											local_id = icon_difficulty
											type = SpriteElement
											dims = (40.0, 40.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 2.0
										}
									}
								]
							}
							{
								props = {
									local_id = check_mark_container
									type = ContainerElement
									dims = (60.0, 90.0)
									pos = (930.2171, 45.0)
									z_priority = 3.0
									scale = (0.99276096, 0.99276096)
								}
								children = [
									{
										props = {
											texture = check_mark
											local_id = check_mark
											type = SpriteElement
											dims = (64.0, 64.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 3.0
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
uidesc_song_complete_player_cash_stats_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			13
			15
		]
	}
	EditMaterialForm = {
	}
}
