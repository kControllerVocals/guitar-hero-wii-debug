uidesc_jam_ratesong = {
	DescVersion = 8
	name = uidesc_jam_ratesong
	rect = [
		64.56548
		93.94006
		1167.3602
		831.84906
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = rate_container
				}
				{
					index = 12
					validateLocalID = stars_on
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star_on1
					includeParentOwned = false
				}
			]
			name = alias_star_on1
		}
		{
			path = [
				{
					validateLocalID = rate_container
				}
				{
					index = 12
					validateLocalID = stars_on
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = star_on2
					includeParentOwned = false
				}
			]
			name = alias_star_on2
		}
		{
			path = [
				{
					validateLocalID = rate_container
				}
				{
					index = 12
					validateLocalID = stars_on
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = star_on3
					includeParentOwned = false
				}
			]
			name = alias_star_on3
		}
		{
			path = [
				{
					validateLocalID = rate_container
				}
				{
					index = 12
					validateLocalID = stars_on
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = star_on4
					includeParentOwned = false
				}
			]
			name = alias_star_on4
		}
		{
			path = [
				{
					validateLocalID = rate_container
				}
				{
					index = 12
					validateLocalID = stars_on
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = star_on5
					includeParentOwned = false
				}
			]
			name = alias_star_on5
		}
		{
			path = [
				{
					validateLocalID = rate_container
				}
				{
					index = 13
					validateLocalID = rating_words
					includeParentOwned = false
				}
			]
			name = alias_rating_words
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = rate_container
				}
				{
					index = 2
					validateLocalID = song_name
					includeParentOwned = false
				}
			]
			name = song_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = rate_container
				}
				{
					index = 4
					validateLocalID = artist_name
					includeParentOwned = false
				}
			]
			name = artist_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = rate_container
				}
				{
					index = 7
					validateLocalID = down_arrow
					includeParentOwned = false
				}
			]
			name = down_arrow_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = rate_container
				}
				{
					index = 8
					validateLocalID = up_arrow
					includeParentOwned = false
				}
			]
			name = up_arrow_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = rate_container
				}
				{
					index = 5
					validateLocalID = rating_number
					includeParentOwned = false
				}
			]
			name = rating_number_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = rate_container
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (640.0, 335.0)
			z_priority = 30.0
		}
		children = [
			{
				props = {
					local_id = title
					type = TextBlockElement
					dims = (230.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-4.0, -152.6141)
					z_priority = 32.0
					text = qs("Rate Song")
					font = fontgrid_title_a1
					fit_width = `scale each line to fit`
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
			{
				props = {
					local_id = rating_text
					type = TextBlockElement
					dims = (840.0, 70.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -69.034195)
					z_priority = 32.0
					text = qs("Does this song rock?")
					font = fontgrid_title_a1
					fit_width = `scale each line if larger`
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
			{
				props = {
					local_id = song_name
					type = TextBlockElement
					dims = (840.0, 70.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -15.905272)
					z_priority = 32.0
					text = qs("Killer Song Name")
					font = fontgrid_title_a1
					fit_width = `scale each line if larger`
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
			{
				props = {
					local_id = song_by
					type = TextBlockElement
					dims = (60.0, 40.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-115.7089, 33.0)
					z_priority = 32.0
					text = qs("by")
					font = fontgrid_title_a1
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
			{
				props = {
					local_id = artist_name
					type = TextBlockElement
					dims = (520.0, 40.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (178.51265, 34.47986)
					z_priority = 32.0
					text = qs("Artist Name")
					font = fontgrid_title_a1
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
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
					local_id = rating_number
					type = TextBlockElement
					hiddenLocal = true
					dims = (190.0, 90.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 144.6782)
					z_priority = 32.0
					text = qs("4.5/5")
					font = fontgrid_title_a1
					fit_width = `scale each line if larger`
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					use_shadow = true
					shadow_offs = (5.0, 5.0)
				}
			}
			{
				props = {
					texture = dialog_fail_BG
					local_id = dialog_fail_BG
					type = SpriteElement
					hiddenLocal = true
					dims = (512.0, 512.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-3.7995908, 14.94006)
					z_priority = 31.0
				}
			}
			{
				props = {
					texture = down_arrow
					local_id = down_arrow
					type = SpriteElement
					dims = (32.0, 16.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 193.46457)
					z_priority = 32.0
				}
			}
			{
				props = {
					texture = up_arrow
					local_id = up_arrow
					type = SpriteElement
					dims = (32.0, 16.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 132.9932)
					z_priority = 32.0
				}
			}
			{
				props = {
					texture = dialog_bg
					local_id = dialog_bg
					type = SpriteElement
					hiddenLocal = true
					dims = (512.0, 512.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-3.7995908, 14.94006)
					z_priority = 30.0
				}
			}
			{
				props = {
					texture = one_star_lrg_half
					local_id = one_star_lrg_half
					type = SpriteElement
					hiddenLocal = true
					dims = (128.0, 128.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (78.57471, 526.7892)
					z_priority = 32.0
				}
			}
			{
				props = {
					local_id = stars_off
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-360.0, 81.0)
					z_priority = 31.0
				}
				children = [
					{
						props = {
							texture = one_star_lrg_off
							local_id = star_off1
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (244.91977, 58.0)
							z_priority = 33.0
							scale = (0.6, 0.6)
							rgba = [
								200
								200
								200
								255
							]
						}
					}
					{
						props = {
							texture = one_star_lrg_off
							local_id = star_off2
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (332.27286, 58.0)
							z_priority = 33.0
							scale = (0.6, 0.6)
							rgba = [
								200
								200
								200
								255
							]
						}
					}
					{
						props = {
							texture = one_star_lrg_off
							local_id = star_off3
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (410.0, 58.0)
							z_priority = 33.0
							scale = (0.6, 0.6)
							rgba = [
								200
								200
								200
								255
							]
						}
					}
					{
						props = {
							texture = one_star_lrg_off
							local_id = star_off4
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (498.75778, 58.0)
							z_priority = 33.0
							scale = (0.6, 0.6)
							rgba = [
								200
								200
								200
								255
							]
						}
					}
					{
						props = {
							texture = one_star_lrg_off
							local_id = star_off5
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (581.0, 58.0)
							z_priority = 33.0
							scale = (0.6, 0.6)
							rgba = [
								200
								200
								200
								255
							]
						}
					}
				]
			}
			{
				props = {
					local_id = stars_on
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-360.0, 81.0)
					z_priority = 31.0
				}
				children = [
					{
						props = {
							texture = one_star_lrg_full
							local_id = star_on1
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (244.91977, 58.0)
							z_priority = 33.0
							scale = (0.6, 0.6)
							rgba = [
								200
								200
								200
								255
							]
						}
					}
					{
						props = {
							texture = one_star_lrg_full
							local_id = star_on2
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (332.27286, 58.0)
							z_priority = 33.0
							scale = (0.6, 0.6)
							rgba = [
								200
								200
								200
								255
							]
						}
					}
					{
						props = {
							texture = one_star_lrg_full
							local_id = star_on3
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (410.0, 58.0)
							z_priority = 33.0
							scale = (0.6, 0.6)
							rgba = [
								200
								200
								200
								255
							]
						}
					}
					{
						props = {
							texture = one_star_lrg_half
							local_id = star_on4
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (498.75778, 58.0)
							z_priority = 33.0
							scale = (0.6, 0.6)
							rgba = [
								200
								200
								200
								255
							]
						}
					}
					{
						props = {
							texture = one_star_lrg_off
							local_id = star_on5
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (581.0, 58.0)
							z_priority = 33.0
							scale = (0.6, 0.6)
							rgba = [
								200
								200
								200
								0
							]
						}
					}
				]
			}
			{
				props = {
					local_id = rating_words
					type = TextBlockElement
					dims = (1000.0, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 161.7933)
					z_priority = 32.0
					text = qs(0x3cac6a8d)
					font = fontgrid_title_a1
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
			{
				props = {
					texture = player_frame
					material = 0x00000000
					local_id = player_frame
					type = SpriteElement
					dims = (1024.0, 512.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (8.245481, 19.20517)
					z_priority = 30.0
					scale = (1.14, 1.0)
				}
			}
			{
				props = {
					local_id = NewElement1
					type = SpriteElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (7.00563, 13.207108)
					z_priority = 29.0
					scale = (11.0, 4.4)
					rgba = [
						0
						0
						0
						255
					]
				}
			}
		]
	}
}
uidesc_jam_ratesong_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			12
			18
		]
	}
	EditMaterialForm = {
	}
}
