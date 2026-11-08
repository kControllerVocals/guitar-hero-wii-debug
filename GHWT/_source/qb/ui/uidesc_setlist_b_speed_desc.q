uidesc_Setlist_B_speed_desc = {
	DescVersion = 1
	name = uidesc_Setlist_B_speed_desc
	rect = [
		-1000.0
		-1000.0
		2000.0
		2000.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = Setlist_B_speed_container
				}
				{
					index = 5
					validateLocalID = highlight
					includeParentOwned = false
				}
			]
			name = highlight_pos
			target = pos
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = Setlist_B_speed_container
			type = ContainerElement
			dims = (100.0, 100.0)
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = speed_B_menu
					type = MenuElement
					dims = (160.0, 250.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-0.074734, 16.115654)
					z_priority = 5.0
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
							local_id = full
							type = TextBlockElement
							dims = (200.0, 50.0)
							pos = (80.0, 50.0)
							z_priority = 4.0
							rgba = [
								93
								30
								28
								255
							]
							text = qs("FULL")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `clip bottom lines`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.7, 0.7)
						}
					}
					{
						props = {
							local_id = Slow
							type = TextBlockElement
							dims = (200.0, 50.0)
							pos = (80.0, 100.0)
							z_priority = 4.0
							rgba = [
								93
								30
								28
								255
							]
							text = qs("SLOW")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `clip bottom lines`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.7, 0.7)
						}
					}
					{
						props = {
							local_id = slower
							type = TextBlockElement
							dims = (200.0, 50.0)
							pos = (80.0, 150.0)
							z_priority = 4.0
							rgba = [
								93
								30
								28
								255
							]
							text = qs("SLOWER")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `clip bottom lines`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.7, 0.7)
						}
					}
					{
						props = {
							local_id = slowest
							type = TextBlockElement
							dims = (200.0, 50.0)
							pos = (80.0, 200.0)
							z_priority = 4.0
							rgba = [
								93
								30
								28
								255
							]
							text = qs("SLOWEST")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `clip bottom lines`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.7, 0.7)
						}
					}
				]
			}
			{
				props = {
					local_id = darken_bkgd
					type = SpriteElement
					alpha = 0.4
					dims = (2000.0, 2000.0)
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
					texture = setlist_popup_sm_frame
					local_id = setlist_popup_sm_frame
					type = SpriteElement
					dims = (386.0, 376.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (1.000008, -18.99999)
					z_priority = 3.0
				}
			}
			{
				props = {
					local_id = white_bkgd_crop
					type = WindowElement
					hiddenLocal = false
					alpha = 1.0
					dims = (256.0, 256.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (-74.99997, -73.99997)
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
				}
				children = [
					{
						props = {
							texture = setlist_popup_white_bkgd
							local_id = popup_white_bkgd
							type = SpriteElement
							dims = (859.0, 368.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (156.99991, -23.0)
							z_priority = 1.0
						}
					}
				]
			}
			{
				props = {
					local_id = Speed
					type = TextBlockElement
					dims = (300.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.9999729, -160.0)
					z_priority = 4.0
					rgba = [
						192
						192
						192
						255
					]
					text = qs("SPEED")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
				}
			}
			{
				props = {
					texture = setlist_popup_highlight
					local_id = highlight
					type = SpriteElement
					dims = (300.0, 68.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-10.0, -66.0)
					z_priority = 2.0
					rgba = [
						255
						255
						255
						220
					]
				}
			}
		]
	}
}
uidesc_Setlist_B_speed_desc_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
