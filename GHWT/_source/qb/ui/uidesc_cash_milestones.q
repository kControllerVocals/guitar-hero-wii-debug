uidesc_cash_milestones = {
	DescVersion = 11
	name = uidesc_cash_milestones
	rect = [
		0.0
		-53.065197
		1280.0
		857.11176
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 2
					validateLocalID = cash_milestone_stuff
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = scrolling_milestones
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = cash_milestones_list
					includeParentOwned = false
				}
			]
			name = alias_cash_milestones_list
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 2
					validateLocalID = cash_milestone_stuff
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = cash_milestone_player_name
					includeParentOwned = false
				}
			]
			name = cash_milestone_player_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 2
					validateLocalID = cash_milestone_stuff
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = cash_milestones_title
					includeParentOwned = false
				}
			]
			name = cash_milestones_title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 2
					validateLocalID = cash_milestone_stuff
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = setlist_popup_highlight
					includeParentOwned = false
				}
			]
			name = setlist_popup_highlight_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 2
					validateLocalID = cash_milestone_stuff
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = cash_milestones_gig_total
					includeParentOwned = false
				}
			]
			name = cash_milestones_gig_total_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 2
					validateLocalID = cash_milestone_stuff
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = cash_milestones_career_total
					includeParentOwned = false
				}
			]
			name = cash_milestones_career_total_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 1
					validateLocalID = cash_milestones_patch
					includeParentOwned = false
				}
			]
			name = cash_milestones_patch_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 2
					validateLocalID = cash_milestone_stuff
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = scroll_bar
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = thumb_piece
					includeParentOwned = false
				}
			]
			name = thumb_piece_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 2
					validateLocalID = cash_milestone_stuff
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = cash_milestone_description
					includeParentOwned = false
				}
			]
			name = cash_milestone_description_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = cash_milestones_container
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
					texture = cash_milestones_bkgd
					local_id = cash_milestones_bkgd
					type = SpriteElement
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
			}
			{
				props = {
					texture = cash_milestones_patch_pho
					local_id = cash_milestones_patch
					type = SpriteElement
					dims = (380.0, 380.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (352.33267, 120.62407)
					z_priority = 4.0
					rot_angle = 7.0
				}
			}
			{
				props = {
					local_id = cash_milestone_stuff
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (100.0, 100.0)
					z_priority = 1.0
					rot_angle = -10.0
				}
				children = [
					{
						props = {
							local_id = cash_milestones_line
							type = SpriteElement
							dims = (890.0, 6.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-29.600515, -219.22844)
							z_priority = 3.0
							rgba = [
								77
								81
								41
								170
							]
						}
					}
					{
						props = {
							local_id = cash_milestones_career_total
							type = TextBlockElement
							dims = (340.0, 42.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (245.30336, -253.21985)
							z_priority = 4.0
							rgba = [
								77
								81
								41
								255
							]
							text = qs("CAREER:$0000000")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = cash_milestones_title
							type = TextBlockElement
							dims = (880.0, 46.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-35.431538, -325.19907)
							z_priority = 4.0
							rgba = [
								128
								0
								0
								255
							]
							text = qs("YOU HAVE EARNED $$$$$. YOU GET A NEW BADGE!")
							font = fontgrid_text_a8
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
							texture = setlist_popup_highlight
							local_id = setlist_popup_highlight
							type = SpriteElement
							hiddenLocal = true
							dims = (430.0, 98.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-245.50752, -70.731804)
							z_priority = 2.0
							rgba = [
								255
								255
								0
								125
							]
						}
					}
					{
						props = {
							local_id = cash_milestones_gig_total
							type = TextBlockElement
							hiddenLocal = true
							dims = (340.0, 42.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (234.5574, -275.32278)
							z_priority = 4.0
							rgba = [
								77
								81
								41
								255
							]
							text = qs("GIG:$00000")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = cash_milestone_player_name
							type = TextBlockElement
							dims = (500.0, 70.0)
							pos = (-172.91869, -210.50034)
							z_priority = 3.0
							rgba = [
								64
								64
								0
								255
							]
							text = qs("PlayerNameHere")
							font = fontgrid_text_a3
							fit_width = `scale each line if larger`
							fit_height = `scale to fit`
							scale_mode = proportional
							text_case = Original
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = scroll_bar
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-414.84738, -56.008137)
							z_priority = 4.0
						}
						children = [
							{
								props = {
									local_id = bar
									type = SpriteElement
									dims = (8.0, 230.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (401.6115, 39.44287)
									z_priority = 3.0
									rgba = [
										64
										64
										0
										90
									]
								}
							}
							{
								props = {
									local_id = arrow_top
									type = MenuElement
									dims = (50.0, 24.0)
									just = [
										-1.0
										-1.0
									]
									pos = (476.86975, -28.351685)
									z_priority = 5.0
									rot_angle = 180.0
									isVertical = false
									internal_just = [
										0.0
										0.0
									]
									fit_major = `fit content`
									fit_minor = `fit content`
									scale_mode = proportional
								}
								children = [
									{
										props = {
											texture = song_summary_arrow
											local_id = arrow
											type = SpriteElement
											dims = (20.0, 24.0)
											pos = (15.0, 12.0)
											z_priority = 4.0
											rgba = [
												64
												64
												0
												255
											]
										}
									}
									{
										props = {
											texture = song_summary_arrow
											flip_h = false
											flip_v = true
											local_id = arrow
											type = SpriteElement
											dims = (20.0, 24.0)
											pos = (35.0, 12.0)
											z_priority = 4.0
											rgba = [
												64
												64
												0
												255
											]
										}
									}
								]
							}
							{
								props = {
									local_id = arrow_bottom
									type = MenuElement
									dims = (50.0, 24.0)
									just = [
										-1.0
										-1.0
									]
									pos = (426.22882, 209.05923)
									z_priority = 5.0
									isVertical = false
									internal_just = [
										0.0
										0.0
									]
									fit_major = `fit content`
									fit_minor = `fit content`
									scale_mode = proportional
								}
								children = [
									{
										props = {
											texture = song_summary_arrow
											local_id = arrow
											type = SpriteElement
											dims = (30.0, 34.0)
											pos = (14.411764, 12.0)
											z_priority = 4.0
											scale = (0.705882, 0.705882)
											rgba = [
												64
												64
												0
												255
											]
										}
									}
									{
										props = {
											texture = song_summary_arrow
											flip_h = false
											flip_v = true
											local_id = arrow
											type = SpriteElement
											dims = (30.0, 34.0)
											pos = (35.588234, 12.0)
											z_priority = 4.0
											scale = (0.705882, 0.705882)
											rgba = [
												64
												64
												0
												255
											]
										}
									}
								]
							}
							{
								props = {
									local_id = thumb_piece
									type = SpriteElement
									dims = (30.0, 59.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (402.0, -38.0)
									z_priority = 4.0
									rgba = [
										64
										64
										0
										255
									]
								}
							}
						]
					}
					{
						props = {
							local_id = cash_milestones_line
							type = SpriteElement
							dims = (890.0, 6.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-32.002464, -298.5107)
							z_priority = 3.0
							rgba = [
								77
								81
								41
								170
							]
						}
					}
					{
						props = {
							local_id = scrolling_milestones
							type = ScrollingMenu
							hiddenLocal = false
							alpha = 1.0
							dims = (425.0, 360.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-425.6419, -130.90701)
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
							isVertical = true
							adjust_visibility = true
							center_selection = false
							top_selection = false
						}
						children = [
							{
								props = {
									local_id = cash_milestones_list
									type = MenuElement
									dims = (425.0, 795.3952)
									just = [
										-1.0
										-1.0
									]
									pos = (1.729614, -348.6976)
									z_priority = 1.0
									internal_just = [
										0.0
										0.0
									]
									spacing_between = -23
									fit_major = `expand if content larger`
									fit_minor = `keep dims`
									scale_mode = proportional
								}
							}
						]
					}
					{
						props = {
							local_id = cash_milestone_description
							type = TextBlockElement
							hiddenLocal = true
							dims = (890.0, 40.0)
							pos = (20.01829, -148.26668)
							z_priority = 3.0
							rgba = [
								64
								64
								0
								255
							]
							text = qs("This is some description of the currently selected item.")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale to fit`
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
uidesc_cash_milestones_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
