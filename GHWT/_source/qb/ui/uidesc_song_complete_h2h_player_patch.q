uidesc_song_complete_h2h_player_patch = {
	DescVersion = 2
	name = uidesc_song_complete_h2h_player_patch
	rect = [
		366.1485
		146.14153
		480.0
		200.00002
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = player_stats_container
				}
				{
					index = 1
					validateLocalID = player_info
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
					validateLocalID = player_stats_container
				}
				{
					index = 1
					validateLocalID = player_info
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = score_entry
					includeParentOwned = false
				}
			]
			name = score_entry_text
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
					validateLocalID = player_info
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = multiplier_entry
					includeParentOwned = false
				}
			]
			name = multiplier_entry_text
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
					validateLocalID = player_info
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = notestreak_entry
					includeParentOwned = false
				}
			]
			name = notestreak_entry_text
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
			pos = (606.14844, 246.14153)
		}
		children = [
			{
				props = {
					texture = song_complete_leather_shape
					local_id = song_complete_leather_shape
					type = SpriteElement
					dims = (480.0, 200.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
					rgba = [
						255
						255
						255
						175
					]
				}
			}
			{
				props = {
					local_id = player_info
					type = MenuElement
					dims = (100.0, 128.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-2.0, -8.0)
					z_priority = 1.0
					internal_just = [
						0.0
						0.0
					]
					spacing_between = -4
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							local_id = player_name
							type = TextBlockElement
							dims = (336.0, 29.0)
							pos = (50.0, 26.5)
							z_priority = 2.0
							rgba = [
								247
								147
								30
								255
							]
							text = qs("WWWWWWWWWWWWWWW")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.7, 0.7)
							use_shadow = true
							shadow_offs = (2.0, 2.0)
						}
					}
					{
						props = {
							local_id = score_entry
							type = TextBlockElement
							dims = (336.0, 29.0)
							pos = (50.0, 51.5)
							z_priority = 2.0
							rgba = [
								247
								147
								30
								255
							]
							text = qs("SCORE: 000,000")
							font = fontgrid_text_a8
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.7, 0.7)
							use_shadow = true
							shadow_offs = (2.0, 2.0)
						}
					}
					{
						props = {
							local_id = multiplier_entry
							type = TextBlockElement
							dims = (336.0, 29.0)
							pos = (50.0, 76.5)
							z_priority = 2.0
							rgba = [
								247
								147
								30
								255
							]
							text = qs("HIGHEST MULTIPLIER: 8x")
							font = fontgrid_text_a8
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.8, 0.8)
							use_shadow = true
							shadow_offs = (2.0, 2.0)
						}
					}
					{
						props = {
							local_id = notestreak_entry
							type = TextBlockElement
							dims = (336.0, 29.0)
							pos = (50.0, 101.5)
							z_priority = 2.0
							rgba = [
								247
								147
								30
								255
							]
							text = qs("NOTE STREAK: 100")
							font = fontgrid_text_a8
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.8, 0.8)
							use_shadow = true
							shadow_offs = (2.0, 2.0)
						}
					}
				]
			}
		]
	}
}
uidesc_song_complete_h2h_player_patch_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
