uidesc_song_summary_details = {
	DescVersion = 7
	name = uidesc_song_summary_details
	rect = [
		-20.398148
		-64.322205
		1302.0957
		1427.8054
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = sum_details_container
				}
				{
					index = 1
					validateLocalID = song_summary_details_list
					includeParentOwned = false
				}
			]
			name = alias_song_summary_details_list
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = sum_details_container
				}
				{
					index = 2
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
					validateLocalID = sum_details_container
				}
				{
					index = 3
					validateLocalID = arrow_bottom
					includeParentOwned = false
				}
			]
			name = arrow_bottom_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = sum_details_container
				}
				{
					index = 4
					validateLocalID = arrow_top
					includeParentOwned = false
				}
			]
			name = arrow_top_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = sum_details_container
				}
				{
					index = 8
					validateLocalID = song_title
					includeParentOwned = false
				}
			]
			name = song_title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = sum_details_container
				}
				{
					index = 7
					validateLocalID = scroll
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = setlist_popup_scroll_thumb
					includeParentOwned = false
				}
			]
			name = setlist_popup_scroll_thumb_pos
			target = pos
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = sum_details_container
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					texture = song_summary_4pl_bkgd
					local_id = song_summary_4pl_bkgd
					type = SpriteElement
					hiddenLocal = true
					dims = (1280.0, 720.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-10.0, 0.0)
					z_priority = 1.0
					rot_angle = 1.7
				}
			}
			{
				props = {
					local_id = song_summary_details_list
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (1280.0, 1425.9243)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (1.697533, -62.441177)
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
					desc = 'song_summary_details_list'
					autoSizeDims = true
					icons_p1_alpha = 0.0
					icons_p2_alpha = 0.0
					icons_p3_alpha = 0.0
					icons_p4_alpha = 0.0
					instrument_p1_texture = mixer_icon_bass
					DIFFICULTY_p1_texture = icon_difficulty_beginner
					instrument_p2_texture = mixer_icon_bass
					DIFFICULTY_p2_texture = icon_difficulty_beginner
					instrument_p3_texture = mixer_icon_bass
					DIFFICULTY_p3_texture = icon_difficulty_beginner
					instrument_p4_texture = mixer_icon_bass
					DIFFICULTY_p4_texture = icon_difficulty_beginner
				}
			}
			{
				props = {
					local_id = player
					type = TextBlockElement
					hiddenLocal = true
					dims = (350.0, 100.0)
					pos = (870.04095, 657.9549)
					z_priority = 2.0
					rot_angle = -1.7
					rgba = [
						38
						51
						108
						255
					]
					text = qs("Player 4")
					font = fontgrid_text_a3
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						-1.0
					]
				}
			}
			{
				props = {
					local_id = arrow_bottom
					type = MenuElement
					hiddenLocal = true
					dims = (128.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (360.0, 617.46606)
					z_priority = 1.0
					rot_angle = -1.7
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
					position_children = true
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							texture = song_summary_arrow
							local_id = song_summary_arrow
							type = SpriteElement
							hiddenLocal = true
							dims = (40.0, 34.0)
							pos = (44.0, 50.0)
							z_priority = 4.0
							rgba = [
								35
								48
								105
								200
							]
						}
					}
					{
						props = {
							texture = song_summary_arrow
							flip_h = false
							flip_v = true
							local_id = song_summary_arrow
							type = SpriteElement
							hiddenLocal = true
							dims = (40.0, 34.0)
							pos = (84.0, 50.0)
							z_priority = 4.0
							rgba = [
								35
								48
								105
								200
							]
						}
					}
				]
			}
			{
				props = {
					local_id = arrow_top
					type = MenuElement
					hiddenLocal = true
					dims = (128.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (359.98068, 78.67883)
					z_priority = 1.0
					rot_angle = -1.7
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
					position_children = true
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							texture = song_summary_arrow
							flip_v = false
							flip_h = true
							local_id = song_summary_arrow
							type = SpriteElement
							hiddenLocal = true
							dims = (40.0, 34.0)
							pos = (44.0, 50.0)
							z_priority = 4.0
							rgba = [
								35
								48
								105
								200
							]
						}
					}
					{
						props = {
							texture = song_summary_arrow
							flip_v = true
							flip_h = true
							local_id = song_summary_arrow
							type = SpriteElement
							hiddenLocal = true
							dims = (40.0, 34.0)
							pos = (84.0, 50.0)
							z_priority = 4.0
							rgba = [
								35
								48
								105
								200
							]
						}
					}
				]
			}
			{
				props = {
					texture = detailed_stats_bkgd
					local_id = detailed_stats_bkgd
					type = SpriteElement
					dims = (1157.0, 775.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (5.934685, -36.822216)
					z_priority = 1.0
				}
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
					pos = (-7.73793, -279.6729)
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
							text = qs("Detailed Stats")
							font = fontgrid_text_a11_large
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
						}
					}
				]
			}
			{
				props = {
					local_id = scroll
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (134.20557, 180.38303)
					z_priority = 11.0
				}
				children = [
					{
						props = {
							texture = setlist_popup_scroll_bar
							local_id = setlist_popup_scroll_bar
							type = SpriteElement
							dims = (16.0, 256.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (354.70612, -100.672325)
							z_priority = 11.0
						}
					}
					{
						props = {
							texture = setlist_popup_scroll_arrow
							local_id = setlist_popup_scroll_arrow_down
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (352.59042, 56.734848)
							z_priority = 11.0
						}
					}
					{
						props = {
							texture = setlist_popup_scroll_thumb
							local_id = setlist_popup_scroll_thumb
							type = SpriteElement
							dims = (72.0, 70.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (358.0, -194.0)
							z_priority = 12.0
						}
					}
					{
						props = {
							texture = setlist_popup_scroll_arrow
							flip_v = false
							flip_h = true
							local_id = setlist_popup_scroll_arrow_up
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (352.59042, -264.7737)
							z_priority = 11.0
						}
					}
				]
			}
			{
				props = {
					local_id = song_title
					type = TextBlockElement
					dims = (900.0, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-6.6616817, -166.22879)
					z_priority = 3.0
					text = qs("Song Name Goes Here")
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
}
uidesc_song_summary_details_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
