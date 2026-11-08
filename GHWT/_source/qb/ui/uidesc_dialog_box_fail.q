uidesc_dialog_box_fail = {
	DescVersion = 1
	name = uidesc_dialog_box_fail
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
					validateLocalID = dlog_fail_master
				}
				{
					index = 2
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
		{
			path = [
				{
					validateLocalID = dlog_fail_master
				}
				{
					index = 3
					validateLocalID = title_text_container
					includeParentOwned = false
				}
			]
			name = alias_dialog_text
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = dlog_fail_master
				}
				{
					index = 1
					validateLocalID = dlog_fail_song_info
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = dlog_fail_song_info
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = dlog_fail_song_percent
					includeParentOwned = false
				}
			]
			name = dlog_fail_song_percent_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = dlog_fail_master
				}
				{
					index = 1
					validateLocalID = dlog_fail_song_info
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = dlog_fail_song_info
					includeParentOwned = false
				}
				{
					index = 3
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
					validateLocalID = dlog_fail_master
				}
				{
					index = 1
					validateLocalID = dlog_fail_song_info
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dlog_fail_song_title
					includeParentOwned = false
				}
			]
			name = dlog_fail_song_title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = dlog_fail_master
				}
				{
					index = 3
					validateLocalID = title_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dlog_title
					includeParentOwned = false
				}
			]
			name = PopupTitle_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = dlog_fail_master
				}
				{
					index = 3
					validateLocalID = title_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dlog_title
					includeParentOwned = false
				}
			]
			name = PopupTitle_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = dlog_fail_master
				}
				{
					index = 1
					validateLocalID = dlog_fail_song_info
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = dlog_fail_song_info_prac
					includeParentOwned = false
				}
			]
			name = dlog_fail_song_info_prac_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = dlog_fail_master
				}
				{
					index = 1
					validateLocalID = dlog_fail_song_info
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = dlog_fail_song_info
					includeParentOwned = false
				}
			]
			name = dlog_fail_song_info_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = dlog_fail_master
				}
				{
					index = 1
					validateLocalID = dlog_fail_song_info
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = dlog_fail_song_info_prac
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dlog_fail_song_percent_prac
					includeParentOwned = false
				}
			]
			name = dlog_fail_song_percent_prac_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = dlog_fail_master
				}
				{
					index = 1
					validateLocalID = dlog_fail_song_info
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = dlog_fail_song_info_prac
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = dlog_fail_song_difficulty_prac
					includeParentOwned = false
				}
			]
			name = dlog_fail_song_difficulty_prac_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = dlog_fail_master
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
					texture = dialog_fail_BG
					local_id = dialog_fail_BG
					type = SpriteElement
					dims = (720.0, 670.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -23.0)
					z_priority = 497.0
				}
				children = [
					{
						props = {
							local_id = dlog_fail_head
							type = TextBlockElement
							hiddenLocal = true
							dims = (330.0, 140.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -216.0)
							z_priority = 498.0
							rgba = [
								192
								0
								0
								255
							]
							text = qs("FAILED")
							font = fontgrid_text_a11_large
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.5, 0.5)
							use_shadow = true
							shadow_offs = (-3.0, -3.0)
						}
					}
				]
			}
			{
				props = {
					local_id = dlog_fail_song_info
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -63.0)
					z_priority = 497.0
				}
				children = [
					{
						props = {
							local_id = dlog_fail_song_title
							type = TextBlockElement
							dims = (580.0, 100.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-1.436157, -2.0)
							z_priority = 498.0
							rot_angle = -2.0
							rgba = [
								128
								128
								128
								255
							]
							text = qs("I HATE MYSELF FOR LOVING YOU")
							font = fontgrid_text_A11_b
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								1.0
							]
							internal_scale = (1.8, 1.8)
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = dlog_fail_song_info
							type = MenuElement
							dims = (825.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 20.0)
							z_priority = 497.0
							scale = (0.7, 0.7)
							rot_angle = -1.0
							isVertical = false
							internal_just = [
								0.0
								0.0
							]
							spacing_between = 5
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = dlog_fail_song_completed
									type = TextBlockElement
									dims = (250.0, 100.0)
									pos = (350.0, 50.0)
									z_priority = 499.0
									rgba = [
										195
										70
										75
										255
									]
									text = qs("COMPLETED")
									font = fontgrid_text_A11_b
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
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
									local_id = dlog_fail_song_percent
									type = TextBlockElement
									dims = (0.0, 63.0)
									pos = (480.0, 50.0)
									z_priority = 499.0
									scale = (2.0, 2.0)
									rgba = [
										195
										70
										75
										255
									]
									text = qs("")
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
									local_id = dlog_fail_song_on
									type = TextBlockElement
									dims = (110.0, 100.0)
									pos = (540.0, 50.0)
									z_priority = 499.0
									rgba = [
										195
										70
										75
										255
									]
									text = qs("% ON")
									font = fontgrid_text_A11_b
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
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
									local_id = dlog_fail_song_difficulty
									type = TextBlockElement
									dims = (0.0, 63.0)
									pos = (600.0, 50.0)
									z_priority = 499.0
									scale = (2.0, 2.0)
									rgba = [
										195
										70
										75
										255
									]
									text = qs("")
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
							local_id = dlog_fail_song_info_prac
							type = MenuElement
							alpha = 0.0
							dims = (825.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 20.0)
							z_priority = 497.0
							scale = (0.7, 0.7)
							rot_angle = -1.0
							isVertical = false
							internal_just = [
								0.0
								0.0
							]
							spacing_between = 5
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = dlog_fail_song_percent_prac
									type = TextBlockElement
									dims = (0.0, 63.0)
									pos = (225.0, 50.0)
									z_priority = 499.0
									scale = (2.0, 2.0)
									rgba = [
										195
										70
										75
										255
									]
									text = qs("")
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
									local_id = dlog_fail_song_completed_prac
									type = TextBlockElement
									dims = (250.0, 100.0)
									pos = (355.0, 50.0)
									z_priority = 499.0
									rgba = [
										195
										70
										75
										255
									]
									text = qs("% ACCURACY")
									font = fontgrid_text_A11_b
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
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
									local_id = dlog_fail_song_on_prac
									type = TextBlockElement
									dims = (110.0, 100.0)
									pos = (540.0, 50.0)
									z_priority = 499.0
									rgba = [
										195
										70
										75
										255
									]
									text = qs("ON")
									font = fontgrid_text_A11_b
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
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
									local_id = dlog_fail_song_difficulty_prac
									type = TextBlockElement
									dims = (0.0, 63.0)
									pos = (600.0, 50.0)
									z_priority = 499.0
									scale = (2.0, 2.0)
									rgba = [
										195
										70
										75
										255
									]
									text = qs("")
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
				]
			}
			{
				props = {
					local_id = dlog_vmenu_container
					type = ContainerElement
					dims = (380.0, 200.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (3.4052734, 126.372)
					z_priority = 497.0
				}
				children = [
					{
						props = {
							local_id = dlog_vmenu
							type = MenuElement
							dims = (380.0, 200.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -10.0)
							z_priority = 498.0
							rot_angle = -2.0
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -10
							fit_major = `fit content if larger`
							fit_minor = `fit content if larger`
							scale_mode = proportional
						}
					}
				]
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
							dims = (300.0, 80.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 15.0)
							z_priority = 525.0
							rgba = [
								200
								200
								200
								255
							]
							text = qs("OVERWRITTEN")
							font = fontgrid_text_a11_large
							fit_width = `scale each line if larger`
							fit_height = `clip top lines`
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
					z_priority = 496.0
				}
			}
		]
	}
}
uidesc_dialog_box_fail_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
