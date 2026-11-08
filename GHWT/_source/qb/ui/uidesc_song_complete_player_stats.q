uidesc_song_complete_player_stats = {
	DescVersion = 7
	name = uidesc_song_complete_player_stats
	rect = [
		-3.1E-05
		1.5E-05
		1171.4698
		400.0
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
					index = 0
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
					index = 1
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
					index = 2
					validateLocalID = notes_hit
					includeParentOwned = false
				}
			]
			name = notes_hit_text
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
					index = 3
					validateLocalID = note_streak
					includeParentOwned = false
				}
			]
			name = note_streak_text
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
					index = 4
					validateLocalID = cut
					includeParentOwned = false
				}
			]
			name = cut_text
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
					index = 1
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
					index = 2
					validateLocalID = notes_hit
					includeParentOwned = false
				}
			]
			name = notes_hit_pos
			target = pos
			type = pair
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
					validateLocalID = cut
					includeParentOwned = false
				}
			]
			name = cut_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = song_complete_ps_container
				}
				{
					index = 1
					validateLocalID = ready_banner
					includeParentOwned = false
				}
			]
			name = ready_banner_alpha
			target = alpha
			type = float
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
							dims = (890.0, 40.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-54.679016, 136.0702)
							z_priority = 2.0
							isVertical = false
							internal_just = [
								-1.0
								0.0
							]
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = player_name
									type = TextBlockElement
									dims = (340.0, 36.0)
									pos = (170.0, 20.0)
									z_priority = 2.0
									rgba = [
										220
										122
										5
										255
									]
									text = qs("Player Name Here")
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
									texture = mixer_icon_guitar
									local_id = mixer_icon_guitar
									type = SpriteElement
									dims = (90.0, 90.0)
									pos = (385.0, 20.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									local_id = notes_hit
									type = TextBlockElement
									dims = (100.0, 36.0)
									pos = (480.0, 20.0)
									z_priority = 2.0
									rgba = [
										220
										122
										5
										255
									]
									text = qs("100%")
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
									local_id = note_streak
									type = TextBlockElement
									dims = (80.0, 36.0)
									pos = (570.0, 20.0)
									z_priority = 2.0
									rgba = [
										220
										122
										5
										255
									]
									text = qs("100")
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
									local_id = cut
									type = TextBlockElement
									dims = (200.0, 36.0)
									pos = (710.0, 20.0)
									z_priority = 2.0
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
						]
					}
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
							pos = (-141.27078, 106.8411)
							z_priority = 2.0
						}
					}
					{
						props = {
							local_id = number_text
							type = TextBlockElement
							dims = (50.0, 40.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-211.59273, 106.98978)
							z_priority = 4.0
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
								0.0
								0.0
							]
							use_shadow = true
							shadow_offs = (2.0, 2.0)
						}
					}
				]
			}
			{
				props = {
					local_id = ready_banner
					type = SpriteElement
					alpha = 0.0
					dims = (100.0, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (169.04514, 143.1133)
					z_priority = 1.0
					rot_angle = -20.0
					rgba = [
						255
						0
						0
						255
					]
				}
			}
		]
	}
}
uidesc_song_complete_player_stats_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
