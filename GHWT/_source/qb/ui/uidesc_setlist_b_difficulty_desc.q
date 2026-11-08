uidesc_Setlist_B_difficulty_desc = {
	DescVersion = 5
	name = uidesc_Setlist_B_difficulty_desc
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = setlist_b_difficulty_master_container
				}
				{
					index = 1
					validateLocalID = Setlist_B_difficulty_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = difficulty_B_menu
					includeParentOwned = false
				}
			]
			name = alias_menu
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = setlist_b_difficulty_master_container
				}
				{
					index = 1
					validateLocalID = Setlist_B_difficulty_container
					includeParentOwned = false
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
			local_id = setlist_b_difficulty_master_container
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
					local_id = darken_bkgd
					type = SpriteElement
					alpha = 0.4
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
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
					local_id = Setlist_B_difficulty_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 80.0)
				}
				children = [
					{
						props = {
							local_id = difficulty_B_menu
							type = MenuElement
							dims = (160.0, 250.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (22.999966, 7.9999847)
							z_priority = 5.0
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -8
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = beginner
									type = TextBlockElement
									dims = (150.0, 50.0)
									pos = (80.0, 41.0)
									z_priority = 4.0
									rgba = [
										93
										30
										28
										255
									]
									text = qs("BEGINNER")
									font = fontgrid_text_a6
									fit_width = `scale each line if larger`
									fit_height = `clip bottom lines`
									scale_mode = `per axis`
									text_case = upper
									internal_just = [
										-1.0
										-1.0
									]
									internal_scale = (0.5, 0.5)
									font_spacing = 0
								}
							}
							{
								props = {
									local_id = easy
									type = TextBlockElement
									dims = (150.0, 50.0)
									pos = (80.0, 83.0)
									z_priority = 4.0
									rgba = [
										93
										30
										28
										255
									]
									text = qs("EASY")
									font = fontgrid_text_a6
									fit_width = `scale each line if larger`
									fit_height = `clip bottom lines`
									scale_mode = `per axis`
									text_case = upper
									internal_just = [
										-1.0
										-0.75
									]
									internal_scale = (0.5, 0.5)
									font_spacing = 0
								}
							}
							{
								props = {
									local_id = medium
									type = TextBlockElement
									dims = (150.0, 50.0)
									pos = (80.0, 125.0)
									z_priority = 4.0
									rgba = [
										93
										30
										28
										255
									]
									text = qs("MEDIUM")
									font = fontgrid_text_a6
									fit_width = `scale each line if larger`
									fit_height = `clip bottom lines`
									scale_mode = `per axis`
									text_case = upper
									internal_just = [
										-1.0
										-0.5
									]
									internal_scale = (0.5, 0.5)
									font_spacing = 0
								}
							}
							{
								props = {
									local_id = hard
									type = TextBlockElement
									dims = (150.0, 50.0)
									pos = (80.0, 167.0)
									z_priority = 4.0
									rgba = [
										93
										30
										28
										255
									]
									text = qs("HARD")
									font = fontgrid_text_a6
									fit_width = `scale each line if larger`
									fit_height = `clip bottom lines`
									scale_mode = `per axis`
									text_case = upper
									internal_just = [
										-1.0
										-0.25
									]
									internal_scale = (0.5, 0.5)
									font_spacing = 0
								}
							}
							{
								props = {
									local_id = expert
									type = TextBlockElement
									dims = (150.0, 50.0)
									pos = (80.0, 209.0)
									z_priority = 4.0
									rgba = [
										93
										30
										28
										255
									]
									text = qs("EXPERT")
									font = fontgrid_text_a6
									fit_width = `scale each line if larger`
									fit_height = `clip bottom lines`
									scale_mode = `per axis`
									text_case = upper
									internal_just = [
										-1.0
										0.0
									]
									internal_scale = (0.5, 0.5)
									font_spacing = 0
								}
							}
						]
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
									local_id = setlist_popup_white_bkgd
									type = SpriteElement
									dims = (300.0, 300.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (30.81912, -23.0)
									z_priority = 1.0
									rgba = [
										224
										224
										224
										255
									]
								}
							}
						]
					}
					{
						props = {
							local_id = difficulty
							type = TextBlockElement
							dims = (320.0, 70.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (1.9999729, -146.0)
							z_priority = 4.0
							rgba = [
								192
								192
								192
								255
							]
							text = qs("DIFFICULTY")
							font = fontgrid_text_a11_large
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (1.2, 1.2)
							font_spacing = 3
						}
					}
					{
						props = {
							local_id = difficulty_icons_menu
							type = MenuElement
							dims = (100.0, 320.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-75.999985, -102.99996)
							z_priority = 1.0
							internal_just = [
								0.0
								0.0
							]
							spacing_between = 2
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									texture = icon_difficulty_beginner
									local_id = icon_difficulty_beginner
									type = SpriteElement
									dims = (40.0, 40.0)
									pos = (50.0, 76.0)
									z_priority = 2.0
								}
							}
							{
								props = {
									texture = icon_difficulty_easy
									local_id = icon_difficulty_easy
									type = SpriteElement
									dims = (40.0, 40.0)
									pos = (50.0, 118.0)
									z_priority = 2.0
								}
							}
							{
								props = {
									texture = icon_difficulty_medium
									local_id = icon_difficulty_medium
									type = SpriteElement
									dims = (40.0, 40.0)
									pos = (50.0, 160.0)
									z_priority = 2.0
								}
							}
							{
								props = {
									texture = icon_difficulty_hard
									local_id = icon_difficulty_hard
									type = SpriteElement
									dims = (40.0, 40.0)
									pos = (50.0, 202.0)
									z_priority = 2.0
								}
							}
							{
								props = {
									texture = icon_difficulty_expert
									local_id = icon_difficulty_expert
									type = SpriteElement
									dims = (40.0, 40.0)
									pos = (50.0, 244.0)
									z_priority = 2.0
								}
							}
						]
					}
					{
						props = {
							texture = setlist_popup_highlight
							blend = subtract
							local_id = highlight
							type = SpriteElement
							dims = (300.0, 68.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-10.0, -75.0)
							z_priority = 2.0
							rgba = [
								192
								192
								192
								220
							]
						}
					}
				]
			}
		]
	}
}
uidesc_Setlist_B_difficulty_desc_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			10
		]
	}
	EditMaterialForm = {
	}
}
