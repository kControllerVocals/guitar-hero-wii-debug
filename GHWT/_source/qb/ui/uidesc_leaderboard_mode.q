uidesc_leaderboard_mode = {
	DescVersion = 5
	name = uidesc_leaderboard_mode
	rect = [
		-2.4092793
		1.16003
		1280.0
		720.0
	]
	aliases = [
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = mode_select
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (100.0, 100.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (47.59072, 51.16003)
			z_priority = 0.0
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
					local_id = menu
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (216.59727, 153.53957)
					z_priority = 3.0
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
							local_id = menu_text
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (405.8215, 182.76567)
							z_priority = 4.0
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
							internal_just = [
								0.0
								0.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 0
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = true
							allow_alternate_directional_events = false
						}
						children = [
							{
								props = {
									local_id = individual_songs_text
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (380.0, 40.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 30.0)
									z_priority = 6.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										70
										130
										180
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("INDIVIDUAL SONGS")
									font = fontgrid_text_a6
									material = 0x00000000
									single_line = false
									fit_width = `scale each line to fit`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (1.0, 1.0)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = false
									use_shadow = false
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (3.0, 3.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = career_mode_text
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (380.0, 40.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 70.0)
									z_priority = 6.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										70
										130
										180
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("CAREER MODE")
									font = fontgrid_text_a6
									material = 0x00000000
									single_line = false
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										-1.0
									]
									internal_scale = (1.0, 1.0)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = false
									use_shadow = false
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (3.0, 3.0)
									line_spacing = 1.0
								}
							}
						]
					}
					{
						props = {
							local_id = mode_text
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (320.0, 70.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (404.14154, 80.05596)
							z_priority = 4.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								192
								192
								192
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("MODE")
							font = fontgrid_text_a11_large
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.4, 0.4)
							blend = blend
							font_spacing = 3
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = false
							shadow_rgba = [
								0
								0
								0
								255
							]
							shadow_offs = (3.0, 3.0)
							line_spacing = 1.0
						}
					}
					{
						props = {
							local_id = frame
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
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
						}
						children = [
							{
								props = {
									blend = blend
									texture = mode_selection_whitebg
									local_id = mode_selection_whitebg
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (440.0, 160.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (400.95178, 171.32663)
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
								}
							}
							{
								props = {
									blend = blend
									texture = mode_selection_frame
									local_id = mode_selection_frame
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (512.0, 256.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (409.0659, 161.1898)
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
							}
							{
								props = {
									blend = blend
									texture = black_hili
									local_id = black_hili
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (420.0, 42.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (407.71915, 161.919)
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
							}
						]
					}
				]
			}
			{
				props = {
					blend = blend
					local_id = darken_bkgd
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.4
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-50.0, -50.0)
					z_priority = 0.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						0
						0
						0
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
			}
		]
	}
}
uidesc_leaderboard_mode_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
