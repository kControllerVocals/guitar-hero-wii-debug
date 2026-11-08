uidesc_gh_tunes_load = {
	DescVersion = 12
	name = uidesc_gh_tunes_load
	rect = [
		0.0
		-29.49997
		1248.046
		800.5383
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
			local_id = NewElement2
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (0.0, 6.0)
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
					local_id = featuredalbum
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (102.0, 100.0)
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
					local_id = songlistcontainer
					type = ContainerElement
					hiddenLocal = false
					alpha = 0.5
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (102.0, 100.0)
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
							texture = song_list_bg_side
							local_id = NewElement25
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (16.0, 512.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (156.5, 226.0)
							z_priority = 1.0
							scale = (1.0, 0.55)
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
							texture = song_list_bg_middle
							local_id = NewElement27
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (16.0, 512.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (173.0, 226.0001)
							z_priority = 2.0
							scale = (42.35, 0.55)
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
							texture = gradient_tab
							local_id = NewElement28
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (165.2, 264.0)
							z_priority = 4.0
							scale = (10.87, 0.65000004)
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
							local_id = NewElement32
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (172.0, 268.0)
							z_priority = 5.0
							scale = (0.25, 0.25)
							rot_angle = 0.0
							rgba = [
								35
								35
								35
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("#")
							font = fontgrid_text_a11
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `clip bottom lines`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
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
					{
						props = {
							local_id = NewElement32
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (218.0, 268.0)
							z_priority = 5.0
							scale = (0.25, 0.25)
							rot_angle = 0.0
							rgba = [
								35
								35
								35
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("TITLE")
							font = fontgrid_text_a11
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `clip bottom lines`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
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
					{
						props = {
							local_id = NewElement32
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (790.00006, 268.00003)
							z_priority = 5.0
							scale = (0.25, 0.25)
							rot_angle = 0.0
							rgba = [
								35
								35
								35
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("GENRE")
							font = fontgrid_text_a11
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `clip bottom lines`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
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
					{
						props = {
							local_id = NewElement32
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (428.0, 268.0)
							z_priority = 5.0
							scale = (0.25, 0.25)
							rot_angle = 0.0
							rgba = [
								35
								35
								35
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("RATING")
							font = fontgrid_text_a11
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `clip bottom lines`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
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
					{
						props = {
							local_id = NewElement32
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (400.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (490.00018, 268.0)
							z_priority = 5.0
							scale = (0.25, 0.25)
							rot_angle = 0.0
							rgba = [
								35
								35
								35
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("CREATED BY")
							font = fontgrid_text_a11
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `clip bottom lines`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
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
					{
						props = {
							blend = blend
							local_id = line_sep1
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (222.0, 2.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (189.0, 262.0)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 90.0
							rgba = [
								35
								35
								35
								100
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							local_id = line_sep2
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (222.0, 2.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (217.0, 262.0)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 90.0
							rgba = [
								35
								35
								35
								100
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							local_id = line_sep2
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (222.0, 2.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (419.0, 263.9998)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 90.0
							rgba = [
								35
								35
								35
								100
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							local_id = line_sep2
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (222.0, 2.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (485.0, 263.9998)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 90.0
							rgba = [
								35
								35
								35
								100
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							local_id = line_sep2
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (222.0, 2.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (779.0, 264.0)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 90.0
							rgba = [
								35
								35
								35
								100
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							local_id = boxtop
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (322.0, 2.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (165.0, 288.0)
							z_priority = 5.0
							scale = (2.1599998, 1.0)
							rot_angle = 0.0
							rgba = [
								220
								122
								5
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							local_id = selectionboxes
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-5.0, 4.000008)
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
									texture = selection_box
									local_id = selectionbox
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (32.0, 32.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (194.0, 287.0)
									z_priority = 5.0
									scale = (0.75, 0.75)
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
									texture = selection_box
									local_id = selectionbox
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (32.0, 32.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (194.0, 304.9998)
									z_priority = 5.0
									scale = (0.75, 0.75)
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
									texture = selection_box
									local_id = selectionbox
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (32.0, 32.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (194.0, 323.0)
									z_priority = 5.0
									scale = (0.75, 0.75)
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
									texture = selection_box
									local_id = selectionbox
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (32.0, 32.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (194.0, 341.0)
									z_priority = 5.0
									scale = (0.75, 0.75)
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
									texture = selection_box
									local_id = selectionbox
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (32.0, 32.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (194.0, 359.0)
									z_priority = 5.0
									scale = (0.75, 0.75)
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
									texture = selection_box
									local_id = selectionbox
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (32.0, 32.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (194.0, 377.0)
									z_priority = 5.0
									scale = (0.75, 0.75)
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
									texture = selection_box
									local_id = selectionbox
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (32.0, 32.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (194.0, 395.0)
									z_priority = 5.0
									scale = (0.75, 0.75)
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
									texture = selection_box
									local_id = selectionbox
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (32.0, 32.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (194.0, 413.0)
									z_priority = 5.0
									scale = (0.75, 0.75)
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
									texture = selection_box
									local_id = selectionbox
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (32.0, 32.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (194.0, 431.0)
									z_priority = 5.0
									scale = (0.75, 0.75)
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
									texture = selection_box
									local_id = selectionbox
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (32.0, 32.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (194.0, 449.0)
									z_priority = 5.0
									scale = (0.75, 0.75)
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
					{
						props = {
							blend = blend
							texture = song_list_bg_side
							flip_v = true
							local_id = NewElement25
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (16.0, 512.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (850.5, 226.0)
							z_priority = 1.0
							scale = (1.0, 0.55)
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
			{
				props = {
					local_id = mp3bg
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (100.0, 100.0)
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
							texture = mp3_right
							local_id = righthand
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 512.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (840.84595, -102.9617)
							z_priority = 2.0
							scale = (1.2, 1.5)
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
							texture = mp3_bottom
							local_id = mp3bottom
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (241.99988, 490.0)
							z_priority = 3.0
							scale = (1.2, 1.5)
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
							texture = mp3_left_side
							local_id = NewElement4
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (128.0, 512.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (99.99997, -135.49997)
							z_priority = 2.0
							scale = (1.2, 1.5)
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
							texture = mp3_top
							local_id = NewElement1
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (253.99988, -71.0)
							z_priority = 2.0
							scale = (1.2, 1.5)
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
							texture = bg_texture
							local_id = bg_texture
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.7
							dims = (512.0, 256.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (154.00002, -8E-06)
							z_priority = 1.0
							scale = (1.4, 1.0)
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
			{
				props = {
					local_id = loadingbar
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (100.0, 100.0)
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
							local_id = NewElement1
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (161.99994, 8.000046)
							z_priority = 6.0
							scale = (7.1, 4.9)
							rot_angle = 0.0
							rgba = [
								0
								0
								0
								175
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = preview_timeline_l_r
							local_id = preview_timeline_l_r
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (346.0, 202.0)
							z_priority = 8.0
							scale = (0.5, 0.5)
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
							texture = preview_timeline_middle
							local_id = preview_timeline_middle
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (32.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (378.0, 202.0)
							z_priority = 8.0
							scale = (9.0, 0.5)
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
							texture = preview_timeline_l_r
							flip_v = true
							local_id = preview_timeline_l_r
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (658.0, 202.0)
							z_priority = 8.0
							scale = (0.5, 0.5)
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
							local_id = NewElement3
							type = SpriteElement
							texture = white
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (358.8999, 213.5)
							z_priority = 9.0
							scale = (3.1699998, 0.1)
							rot_angle = 0.0
							rgba = [
								220
								122
								5
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
				]
			}
			{
				props = {
					blend = blend
					texture = gh_tunes_logo
					local_id = gh_tunes_logo
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (512.0, 256.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (361.99988, 100.0)
					z_priority = 8.0
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
					local_id = blackbg
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (230.00008, 59.99991)
					z_priority = 0.0
					scale = (8.4, 5.8)
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
uidesc_gh_tunes_load_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
