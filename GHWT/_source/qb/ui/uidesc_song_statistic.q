uidesc_song_statistic = {
	DescVersion = 1
	name = uidesc_song_statistic
	rect = [
		512.0
		152.0
		256.0
		333.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = stat_container
				}
				{
					index = 2
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = stars
					includeParentOwned = false
				}
			]
			name = alias_stars
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = stat_container
				}
				{
					index = 2
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = player
					includeParentOwned = false
				}
			]
			name = player_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = stat_container
				}
				{
					index = 2
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = score
					includeParentOwned = false
				}
			]
			name = score_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = stat_container
				}
				{
					index = 2
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = difficulty
					includeParentOwned = false
				}
			]
			name = difficulty_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = stat_container
				}
				{
					index = 2
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = percent
					includeParentOwned = false
				}
			]
			name = percent_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = stat_container
				}
				{
					index = 2
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = streak
					includeParentOwned = false
				}
			]
			name = streak_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = stat_container
				}
				{
					index = 1
					validateLocalID = icon
					includeParentOwned = false
				}
			]
			name = icon_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = stat_container
			type = ContainerElement
			dims = (200.0, 250.0)
			pos = (640.0, 360.0)
		}
		children = [
			{
				props = {
					local_id = background
					type = SpriteElement
					alpha = 0.5
					dims = (200.0, 175.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
					rgba = [
						0
						0
						0
						255
					]
				}
			}
			{
				props = {
					texture = guitar_stat
					local_id = icon
					type = SpriteElement
					dims = (256.0, 256.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -80.0)
					z_priority = 2.0
				}
			}
			{
				props = {
					local_id = menu
					type = MenuElement
					dims = (200.0, 175.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 1.037994)
					z_priority = 1.0
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
							local_id = stars
							type = MenuElement
							dims = (200.0, 32.0)
							pos = (100.0, 25.0)
							z_priority = 2.0
							scale = (0.75, 0.75)
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
									texture = star
									local_id = star
									type = SpriteElement
									dims = (32.0, 32.0)
									pos = (36.0, 16.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = star
									local_id = star
									type = SpriteElement
									dims = (32.0, 32.0)
									pos = (68.0, 16.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = star
									local_id = star
									type = SpriteElement
									dims = (32.0, 32.0)
									pos = (100.0, 16.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = star
									local_id = star
									type = SpriteElement
									dims = (32.0, 32.0)
									pos = (132.0, 16.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = star
									local_id = star
									type = SpriteElement
									dims = (32.0, 32.0)
									pos = (164.0, 16.0)
									z_priority = 3.0
								}
							}
						]
					}
					{
						props = {
							local_id = player
							type = TextBlockElement
							dims = (200.0, 25.0)
							pos = (100.0, 49.5)
							z_priority = 1.0
							rgba = [
								255
								128
								0
								255
							]
							text = qs("Player 1")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								-1.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = score
							type = TextBlockElement
							dims = (200.0, 25.0)
							pos = (100.0, 74.5)
							z_priority = 1.0
							rgba = [
								255
								128
								0
								255
							]
							text = qs("10,265")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								-1.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = difficulty
							type = TextBlockElement
							dims = (200.0, 25.0)
							pos = (100.0, 99.5)
							z_priority = 1.0
							rgba = [
								255
								128
								0
								255
							]
							text = qs("Hard")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								-1.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = percent
							type = TextBlockElement
							dims = (200.0, 25.0)
							pos = (100.0, 124.5)
							z_priority = 1.0
							rgba = [
								255
								128
								0
								255
							]
							text = qs("15% Notes Hit")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								-1.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = streak
							type = TextBlockElement
							dims = (200.0, 25.0)
							pos = (100.0, 149.5)
							z_priority = 1.0
							rgba = [
								255
								128
								0
								255
							]
							text = qs("120 Note Streak")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								-1.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
		]
	}
}
uidesc_song_statistic_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
