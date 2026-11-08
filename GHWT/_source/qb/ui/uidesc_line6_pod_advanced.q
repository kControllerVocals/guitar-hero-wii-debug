uidesc_line6_pod_advanced = {
	DescVersion = 5
	name = uidesc_line6_pod_advanced
	rect = [
		393.9906
		117.049675
		486.40002
		486.39993
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 7
					validateLocalID = code_box
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = scrolling_text_window1
					includeParentOwned = false
				}
			]
			name = scrolling_text_window1
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 7
					validateLocalID = code_box
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = scrolling_text_window2
					includeParentOwned = false
				}
			]
			name = scrolling_text_window2
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 4
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
					validateLocalID = Line6body
				}
				{
					index = 5
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
					validateLocalID = Line6body
				}
				{
					index = 2
					validateLocalID = item_contols
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = amp
					includeParentOwned = false
				}
			]
			name = amp_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 2
					validateLocalID = item_contols
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = fx
					includeParentOwned = false
				}
			]
			name = fx_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 2
					validateLocalID = item_contols
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = cab
					includeParentOwned = false
				}
			]
			name = cab_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 3
					validateLocalID = effect
					includeParentOwned = false
				}
			]
			name = Effect_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
			]
			name = Line6body_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
			]
			name = Line6body_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 7
					validateLocalID = code_box
					includeParentOwned = false
				}
			]
			name = code_box_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 8
					validateLocalID = helper
					includeParentOwned = false
				}
			]
			name = helper_description_text
			target = helper_description_text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 8
					validateLocalID = helper
					includeParentOwned = false
				}
			]
			name = helper_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = Line6body
			type = ContainerElement
			dims = (0.0, 0.0)
			pos = (601.0, 138.5835)
			z_priority = 50.0
			scale = (0.95, 0.95)
		}
		children = [
			{
				props = {
					texture = line6_textbg_large
					local_id = line6_textbg_large
					type = SpriteElement
					dims = (265.0, 125.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (41.243637, 146.03166)
					z_priority = 55.0
				}
			}
			{
				props = {
					texture = line6_button
					local_id = line6_button
					type = SpriteElement
					hiddenLocal = true
					dims = (32.0, 32.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (15.693054, 340.6054)
					z_priority = 55.0
				}
			}
			{
				props = {
					local_id = item_contols
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (90.73809, 139.26097)
					z_priority = 51.0
				}
				children = [
				]
			}
			{
				props = {
					local_id = effect
					type = TextBlockElement
					dims = (165.0, 28.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (34.353096, 146.33012)
					z_priority = 56.0
					scale = (1.0, 1.3)
					rgba = [
						62
						32
						2
						255
					]
					text = qs("Line6 Insane")
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
			{
				props = {
					texture = snap_arrow
					local_id = up_arrow
					type = SpriteElement
					dims = (8.0, 16.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (126.05998, 138.70393)
					z_priority = 56.0
					scale = (1.2, 1.2)
					rot_angle = -90.0
					rgba = [
						62
						32
						2
						255
					]
				}
			}
			{
				props = {
					texture = snap_arrow
					local_id = down_arrow
					type = SpriteElement
					dims = (8.0, 16.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (125.190254, 154.35616)
					z_priority = 56.0
					scale = (1.2, 1.2)
					rot_angle = 90.0
					rgba = [
						62
						32
						2
						255
					]
				}
			}
			{
				props = {
					texture = pod_whole
					local_id = pod_whole
					type = SpriteElement
					dims = (512.0, 512.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (38.09537, 233.33281)
					z_priority = 51.0
				}
			}
			{
				props = {
					local_id = code_box
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (100.0, 100.0)
					z_priority = 51.0
				}
				children = [
					{
						props = {
							local_id = black_bg
							type = SpriteElement
							dims = (170.0, 115.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-58.68737, 156.20543)
							z_priority = 60.0
							scale = (1.2, 1.2)
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
							local_id = black_bg
							type = SpriteElement
							hiddenLocal = true
							dims = (170.0, 115.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-58.13979, 242.85272)
							z_priority = 60.0
							scale = (1.2, 0.25)
							rgba = [
								0
								0
								0
								200
							]
						}
					}
					{
						props = {
							texture = line6_textbg_large
							local_id = line6_textbg_large
							type = SpriteElement
							hiddenLocal = true
							dims = (265.0, 125.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-56.897617, 128.5592)
							z_priority = 62.0
						}
					}
					{
						props = {
							texture = line6_textbg_large
							local_id = line6_textbg_large
							type = SpriteElement
							hiddenLocal = true
							dims = (265.0, 125.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-56.09754, 178.6614)
							z_priority = 61.0
						}
					}
					{
						props = {
							local_id = scrolling_text_window1
							type = WindowElement
							hiddenLocal = false
							alpha = 1.0
							dims = (190.0, 50.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-100.47613, 179.66573)
							z_priority = 52.0
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
									local_id = code_registration_info
									type = TextBlockElement
									hiddenLocal = true
									dims = (200.0, 50.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (8.174134, 7.114353)
									z_priority = 64.0
									text = qs("scrolling text")
									font = fontgrid_text_a8
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										-1.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
						]
					}
					{
						props = {
							local_id = scrolling_text_window2
							type = WindowElement
							hiddenLocal = false
							alpha = 1.0
							dims = (190.0, 50.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-101.52876, 222.82346)
							z_priority = 52.0
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
									local_id = code_registration_info
									type = TextBlockElement
									hiddenLocal = true
									dims = (200.0, 50.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-50.773216, 7.114353)
									z_priority = 64.0
									text = qs("scrolling text")
									font = fontgrid_text_a8
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										-1.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
						]
					}
					{
						props = {
							local_id = code_registration_info
							type = TextBlockElement
							dims = (185.0, 34.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-58.328217, 109.39503)
							z_priority = 64.0
							rgba = [
								224
								224
								224
								255
							]
							text = qs("Register At")
							font = fontgrid_text_a3
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
			{
				props = {
					local_id = helper
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (0.0, 0.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (40.79642, 342.62738)
					z_priority = 100.0
					scale = (0.8, 0.8)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					desc = 'helper_pill'
					autoSizeDims = false
					[
						192
						192
						192
						255
					]
					[
						0
						0
						0
						155
					]
				}
			}
		]
	}
}
uidesc_line6_pod_advanced_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
