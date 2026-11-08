uidesc_song_summary_1p_collumn = {
	DescVersion = 2
	name = uidesc_song_summary_1p_collumn
	rect = [
		-267.91205
		-372.75732
		613.31824
		602.1177
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = collumn
				}
			]
			name = alias_collumn
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = collumn
				}
				{
					index = 0
					validateLocalID = char_headshot_4pl
					includeParentOwned = false
				}
			]
			name = char_headshot_4pl_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = collumn
				}
				{
					index = 1
					validateLocalID = name
					includeParentOwned = false
				}
			]
			name = name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = collumn
				}
				{
					index = 2
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
					validateLocalID = collumn
				}
				{
					index = 3
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
					validateLocalID = collumn
				}
				{
					index = 4
					validateLocalID = score_number_value
					includeParentOwned = false
				}
			]
			name = score_number_value_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = collumn
				}
				{
					index = 5
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
					validateLocalID = collumn
				}
				{
					index = 6
					validateLocalID = note_streak_value
					includeParentOwned = false
				}
			]
			name = note_streak_value_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = collumn
				}
				{
					index = 7
					validateLocalID = notes_hit_value
					includeParentOwned = false
				}
			]
			name = notes_hit_value_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = collumn
				}
				{
					index = 8
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
					validateLocalID = collumn
				}
				{
					index = 9
					validateLocalID = stars_01
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = song_summary_star_empty01
					includeParentOwned = false
				}
			]
			name = song_summary_star_empty01_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = collumn
				}
				{
					index = 9
					validateLocalID = stars_01
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = song_summary_star_empty02
					includeParentOwned = false
				}
			]
			name = song_summary_star_empty02_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = collumn
				}
				{
					index = 9
					validateLocalID = stars_01
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = song_summary_star_empty03
					includeParentOwned = false
				}
			]
			name = song_summary_star_empty03_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = collumn
				}
				{
					index = 9
					validateLocalID = stars_01
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = song_summary_star_empty04
					includeParentOwned = false
				}
			]
			name = song_summary_star_empty04_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = collumn
				}
				{
					index = 9
					validateLocalID = stars_01
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = song_summary_star_empty05
					includeParentOwned = false
				}
			]
			name = song_summary_star_empty05_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = collumn
			type = ContainerElement
			dims = (100.0, 100.0)
			pos_anchor = [
				0.0
				0.0
			]
			pos = (-153.17986, -194.80612)
			z_priority = 1.0
		}
		children = [
			{
				props = {
					texture = char_headshot_4pl_placeholder
					local_id = char_headshot_4pl
					type = SpriteElement
					dims = (256.0, 256.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (13.267822, -17.902988)
					z_priority = 2.0
				}
			}
			{
				props = {
					local_id = name
					type = TextBlockElement
					dims = (330.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (304.98068, -127.95121)
					z_priority = 2.0
					rgba = [
						50
						50
						63
						200
					]
					text = qs("NameGoesHere")
					font = fontgrid_text_a10
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = title
					type = TextBlockElement
					dims = (330.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (303.38168, 28.090076)
					z_priority = 2.0
					rgba = [
						50
						50
						63
						255
					]
					text = qs("Placeholder")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = score
					type = TextBlockElement
					dims = (150.0, 80.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (212.53691, 97.86284)
					z_priority = 2.0
					rgba = [
						196
						196
						196
						255
					]
					text = qs("Score")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = score_number_value
					type = TextBlockElement
					dims = (360.1066, 70.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (318.5328, 153.61479)
					z_priority = 2.0
					rgba = [
						50
						50
						63
						255
					]
					text = qs("000,000")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = note_streak
					type = TextBlockElement
					dims = (180.0, 40.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (229.32188, 275.18042)
					z_priority = 2.0
					rgba = [
						196
						196
						196
						255
					]
					text = qs("Note Streak")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = note_streak_value
					type = TextBlockElement
					dims = (180.10661, 90.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (227.77612, 225.28096)
					z_priority = 2.0
					rgba = [
						196
						196
						196
						255
					]
					text = qs("000")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = notes_hit_value
					type = TextBlockElement
					dims = (200.0, 90.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (237.68478, 337.35568)
					z_priority = 2.0
					rgba = [
						50
						50
						63
						255
					]
					text = qs("100%")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = notes_hit
					type = TextBlockElement
					dims = (200.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (238.77612, 394.16644)
					z_priority = 3.0
					rgba = [
						50
						50
						63
						200
					]
					text = qs("Notes Hit")
					font = fontgrid_text_a8
					fit_width = `scale each line to fit`
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = stars_01
					type = MenuElement
					dims = (640.0, 320.0)
					just = [
						-1.0
						-1.0
					]
					pos = (152.81639, -89.5445)
					z_priority = 5.0
					scale = (0.6, 0.6)
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
							texture = song_summary_star_empty
							local_id = song_summary_star_empty01
							type = SpriteElement
							dims = (100.0, 100.0)
							pos = (120.0, 160.0)
							z_priority = 6.0
						}
					}
					{
						props = {
							texture = song_summary_star_empty
							local_id = song_summary_star_empty02
							type = SpriteElement
							dims = (100.0, 100.0)
							pos = (220.0, 160.0)
							z_priority = 6.0
						}
					}
					{
						props = {
							texture = song_summary_star_empty
							local_id = song_summary_star_empty03
							type = SpriteElement
							dims = (100.0, 100.0)
							pos = (320.0, 160.0)
							z_priority = 6.0
						}
					}
					{
						props = {
							texture = song_summary_star_empty
							local_id = song_summary_star_empty04
							type = SpriteElement
							dims = (100.0, 100.0)
							pos = (420.0, 160.0)
							z_priority = 6.0
						}
					}
					{
						props = {
							texture = song_summary_star_empty
							local_id = song_summary_star_empty05
							type = SpriteElement
							dims = (100.0, 100.0)
							pos = (520.0, 160.0)
							z_priority = 6.0
						}
					}
				]
			}
		]
	}
}
uidesc_song_summary_1p_collumn_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
