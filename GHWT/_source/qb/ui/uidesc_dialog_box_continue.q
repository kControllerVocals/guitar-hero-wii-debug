uidesc_dialog_box_continue = {
	DescVersion = 6
	name = uidesc_dialog_box_continue
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
					validateLocalID = dlog_box_continue_container
				}
				{
					index = 3
					validateLocalID = dlog_vmenu_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dlog_vmenu
					includeParentOwned = false
				}
			]
			name = alias_dlog_vmenu
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = dlog_box_continue_container
				}
				{
					index = 4
					validateLocalID = dlog_continue_info
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = difficulty_icon
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = icon_difficulty_medium
					includeParentOwned = false
				}
			]
			name = icon_difficulty_medium_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = dlog_box_continue_container
				}
				{
					index = 4
					validateLocalID = dlog_continue_info
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = dlog_fail_song_difficulty
					includeParentOwned = false
				}
			]
			name = dlog_fail_song_difficulty_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = dlog_box_continue_container
				}
				{
					index = 2
					validateLocalID = title_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dlog_title
					includeParentOwned = false
				}
			]
			name = dlog_title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = dlog_box_continue_container
				}
				{
					index = 4
					validateLocalID = dlog_continue_info
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = dlog_continue_streak_entry
					includeParentOwned = false
				}
			]
			name = dlog_continue_streak_entry_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = dlog_box_continue_container
				}
				{
					index = 4
					validateLocalID = dlog_continue_info
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = dlog_continue_notes_entry
					includeParentOwned = false
				}
			]
			name = dlog_continue_notes_entry_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = dlog_box_continue_container
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 496.0
		}
		children = [
			{
				props = {
					local_id = dlog_BG_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 497.0
				}
			}
			{
				props = {
					texture = gradient_256
					blend = subtract
					flip_h = true
					local_id = gradient_256
					type = SpriteElement
					alpha = 0.5
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = -1.0
				}
			}
			{
				props = {
					local_id = title_text_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos = (640.0, 106.0)
					z_priority = 496.0
				}
				children = [
					{
						props = {
							local_id = dlog_title
							type = TextBlockElement
							dims = (660.0, 80.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-7.7259517, 38.177917)
							z_priority = 525.0
							rgba = [
								200
								200
								200
								255
							]
							text = qs("I HATE MYSELF FOR LOVING YOU")
							font = fontgrid_text_a11_large
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (1.5, 1.5)
							use_shadow = true
							shadow_offs = (-3.0, -3.0)
						}
					}
				]
			}
			{
				props = {
					local_id = dlog_vmenu_container
					type = ContainerElement
					dims = (300.0, 140.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.13092, 185.7532)
					z_priority = 520.0
				}
				children = [
					{
						props = {
							local_id = dlog_vmenu
							type = MenuElement
							dims = (550.0, 275.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (3.420442, -124.002106)
							z_priority = 525.0
							rot_angle = -0.5
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -10
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
					}
				]
			}
			{
				props = {
					local_id = dlog_continue_info
					type = MenuElement
					dims = (810.5, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.86506605, -118.63185)
					z_priority = 497.0
					scale = (0.7, 0.7)
					rot_angle = -1.0
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
					spacing_between = 5
					fit_major = `fit content if larger`
					fit_minor = `fit content if larger`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							local_id = dlog_continue_notes
							type = TextBlockElement
							dims = (180.0, 100.0)
							pos = (83.29907, 50.0)
							z_priority = 499.0
							scale = (0.925545, 0.925545)
							rgba = [
								192
								192
								192
								255
							]
							text = qs("NOTES")
							font = fontgrid_text_A11_b
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								1.0
								0.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = dlog_continue_notes_entry
							type = TextBlockElement
							dims = (78.299995, 63.0)
							pos = (207.46097, 50.0)
							z_priority = 499.0
							scale = (0.925545, 0.925545)
							rgba = [
								195
								70
								75
								255
							]
							text = qs("100")
							font = fontgrid_text_A11_b
							single_line = true
							fit_width = `expand dims`
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.9, 0.9)
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = dlog_continue_percent
							type = TextBlockElement
							dims = (70.0, 100.0)
							pos = (280.7179, 50.0)
							z_priority = 499.0
							scale = (0.925545, 0.925545)
							rgba = [
								195
								70
								75
								255
							]
							text = qs("%")
							font = fontgrid_text_A11_b
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (1.5, 1.5)
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = dlog_continue_streak
							type = TextBlockElement
							dims = (180.0, 100.0)
							pos = (401.03876, 50.0)
							z_priority = 499.0
							scale = (0.925545, 0.925545)
							rgba = [
								192
								192
								192
								255
							]
							text = qs("STREAK")
							font = fontgrid_text_A11_b
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								1.0
								0.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = dlog_continue_streak_entry
							type = TextBlockElement
							dims = (78.299995, 63.0)
							pos = (525.2006, 50.0)
							z_priority = 499.0
							scale = (0.925545, 0.925545)
							rgba = [
								195
								70
								75
								255
							]
							text = qs("100")
							font = fontgrid_text_A11_b
							single_line = true
							fit_width = `expand dims`
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.9, 0.9)
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = difficulty_icon
							type = ContainerElement
							dims = (80.0, 100.0)
							pos = (603.08527, 50.0)
							z_priority = 498.0
							scale = (0.925545, 0.925545)
						}
						children = [
							{
								props = {
									texture = icon_difficulty_medium
									local_id = icon_difficulty_medium
									type = SpriteElement
									dims = (64.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (8.0, 0.0)
									z_priority = 498.0
								}
							}
						]
					}
					{
						props = {
							local_id = dlog_fail_song_difficulty
							type = TextBlockElement
							dims = (179.09999, 63.0)
							pos = (727.6174, 50.0)
							z_priority = 499.0
							scale = (0.925545, 0.925545)
							rgba = [
								195
								70
								75
								255
							]
							text = qs("MEDIUM")
							font = fontgrid_text_A11_b
							single_line = true
							fit_width = `expand dims`
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.9, 0.9)
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
			{
				props = {
					texture = dialog_stitched_line
					local_id = dialog_stitched_line
					type = SpriteElement
					dims = (680.0, 16.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (10.240204, -80.38871)
					z_priority = 500.0
				}
			}
			{
				props = {
					texture = dialog_bg_practice
					local_id = dialog_bg_practice
					type = SpriteElement
					dims = (900.0, 580.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-8.163879, -21.040413)
					z_priority = 497.0
				}
			}
		]
	}
}
uidesc_dialog_box_continue_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
