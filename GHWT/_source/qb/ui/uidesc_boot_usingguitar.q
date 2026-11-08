uidesc_boot_usingGuitar = {
	DescVersion = 5
	name = uidesc_boot_usingGuitar
	rect = [
		-13.048341
		-40.071503
		1290.0
		803.1718
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = Screen_Guitar
				}
				{
					index = 0
					validateLocalID = bG
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = instrument
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = RB
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = back
					includeParentOwned = false
				}
			]
			name = red_button_text
			visiblename = 'red_button_text'
			help = 'Screen_Guitar -> Bg -> instrument -> RB -> Back => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Screen_Guitar
				}
				{
					index = 0
					validateLocalID = bG
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = instrument
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = GB
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = continue
					includeParentOwned = false
				}
			]
			name = green_button_text
			visiblename = 'green_button_text'
			help = 'Screen_Guitar -> Bg -> instrument -> GB -> Continue => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = Screen_Guitar
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
			pos = (100.0, 100.0)
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
					blend = blend
					texture = white
					local_id = bG
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1290.0, 730.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (531.95166, 258.8058)
					z_priority = 1.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						228
						146
						89
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
				children = [
					{
						props = {
							local_id = humor
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
							pos = (-438.30368, -169.9222)
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
									texture = humor_guitar
									local_id = humor_guitar
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (1024.0, 512.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (447.78473, 14.244904)
									z_priority = 2.0
									scale = (0.95, 0.95)
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
							local_id = instrument
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
							pos = (-422.42297, -117.5163)
							z_priority = 1.0
							scale = (0.9, 0.9)
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
									local_id = strumbar
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
									pos = (96.823875, 68.23883)
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
											blend = blend
											texture = instrument_guitar
											local_id = instrument_guitar
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (1024.0, 512.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (385.66748, 255.55096)
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
											local_id = `ver-white`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 100.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												1.0
											]
											pos = (255.13922, 159.17825)
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
									}
									{
										props = {
											blend = blend
											local_id = `ver-black`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 70.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												-1.0
											]
											pos = (255.13922, 203.6226)
											z_priority = 4.0
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
									{
										props = {
											blend = blend
											local_id = `Left-hor-up`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 170.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (169.69003, 119.66619)
											z_priority = 3.0
											scale = (1.0, 1.0)
											rot_angle = 90.0
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
									{
										props = {
											local_id = strumbar
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (200.0, 80.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (-3.889809, 133.6692)
											z_priority = 3.0
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
											text = qs("UP/DOWN\nStrum Bar")
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = wrap
											fit_height = `scale down if larger`
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
								]
							}
							{
								props = {
									local_id = GB
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
									pos = (680.9832, 94.05557)
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
											local_id = continue
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (300.0, 40.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (262.2708, 305.0)
											z_priority = 3.0
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
											text = qs("CONTINUE")
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = wrap
											fit_height = `scale down if larger`
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
											texture = line01
											flip_v = true
											local_id = line
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (32.0, 64.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (92.059845, 276.0)
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
									}
									{
										props = {
											local_id = GB_text
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (300.0, 40.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (244.8332, 334.0)
											z_priority = 3.0
											scale = (1.0, 1.0)
											rot_angle = 0.0
											rgba = [
												0
												192
												0
												255
											]
											events_blocked = 0
											preserve_local_orientation = false
											text = qs("Green Button")
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = wrap
											fit_height = `scale down if larger`
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
								]
							}
							{
								props = {
									local_id = RB
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
									pos = (616.0856, 94.05552)
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
											local_id = back
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (200.0, 40.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (5.9500785, 305.0)
											z_priority = 3.0
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
											text = qs("CONTINUE")
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = wrap
											fit_height = `scale down if larger`
											scale_mode = proportional
											text_case = Original
											internal_just = [
												1.0
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
											texture = line01
											flip_v = false
											local_id = line
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (32.0, 64.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (124.823875, 276.0)
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
									}
									{
										props = {
											local_id = RB_text
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (300.0, 40.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (111.13541, 334.0)
											z_priority = 3.0
											scale = (1.0, 1.0)
											rot_angle = 0.0
											rgba = [
												255
												0
												0
												255
											]
											events_blocked = 0
											preserve_local_orientation = false
											text = qs("Red Button")
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = wrap
											fit_height = `scale down if larger`
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
								]
							}
							{
								props = {
									local_id = slider
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
									pos = (100.0, 100.0)
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
											local_id = slider_text
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (216.12906, 40.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (591.536, 166.36035)
											z_priority = 3.0
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
											text = qs("Slider")
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = `expand dims`
											fit_height = `scale down if larger`
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
											local_id = 2brackets
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
											pos = (100.0, 100.0)
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
													local_id = `brackets-left`
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
													pos = (-1.7E-05, 1.1111101)
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
													preserve_local_orientation = true
												}
												children = [
													{
														props = {
															blend = blend
															local_id = `Left-ver`
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (3.0, 41.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (274.96866, 130.031)
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
													}
													{
														props = {
															blend = blend
															local_id = `Left-hor-up`
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (3.0, 15.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (281.5785, 110.4125)
															z_priority = 3.0
															scale = (1.0, 1.0)
															rot_angle = 90.0
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
															local_id = `Left-hor-down`
															type = SpriteElement
															hiddenLocal = true
															alpha = 1.0
															dims = (3.0, 15.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (281.5785, 148.19041)
															z_priority = 3.0
															scale = (1.0, 1.0)
															rot_angle = 90.0
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
													local_id = `brackets-right`
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
													pos = (167.77806, 2.2222211)
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
													preserve_local_orientation = true
												}
												children = [
													{
														props = {
															blend = blend
															local_id = `Left-ver`
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (3.0, 40.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (274.96866, 128.91977)
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
													}
													{
														props = {
															blend = blend
															local_id = `Left-hor-up`
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (3.0, 15.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (266.0229, 110.412476)
															z_priority = 3.0
															scale = (1.0, 1.0)
															rot_angle = 90.0
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
															local_id = `Left-hor-down`
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (3.0, 15.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (268.24512, 148.19038)
															z_priority = 3.0
															scale = (1.0, 1.0)
															rot_angle = 90.0
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
											local_id = `line-ver`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 42.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (459.41367, 186.69785)
											z_priority = 3.0
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
									{
										props = {
											blend = blend
											local_id = `line-hor`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 20.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (467.3454, 166.8684)
											z_priority = 3.0
											scale = (1.0, 1.0)
											rot_angle = 90.0
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
							{
								props = {
									local_id = WhammyBar
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
									pos = (100.0, 100.0)
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
											blend = blend
											texture = line02
											flip_v = true
											flip_h = false
											local_id = line02
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (65.0, 20.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (90.713806, 306.83475)
											z_priority = 3.0
											scale = (1.5, 1.5)
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
											local_id = whammytext
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (190.0, 45.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (-15.010918, 344.5634)
											z_priority = 3.0
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
											text = qs("Whammy Bar")
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = wrap
											fit_height = `scale down if larger`
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
								]
							}
							{
								props = {
									local_id = SP
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
									pos = (100.0, 100.0)
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
											blend = blend
											texture = Arrow_tiltup
											flip_v = true
											local_id = Arrow_tiltup
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (128.0, 128.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (846.17456, 197.15884)
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
									}
									{
										props = {
											local_id = tiltup
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (250.0, 80.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (745.0446, 99.16463)
											z_priority = 3.0
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
											text = qs("TILT UP\nfor Star Power")
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = wrap
											fit_height = `scale down if larger`
											scale_mode = proportional
											text_case = Original
											internal_just = [
												1.0
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
									local_id = SPB
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
									pos = (100.0, 100.0)
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
											local_id = whammytext
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (340.6397, 39.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (406.69568, 84.13633)
											z_priority = 3.0
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
											text = qs("Star Power Button")
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = wrap
											fit_height = `scale down if larger`
											scale_mode = proportional
											text_case = Original
											internal_just = [
												1.0
												0.0
											]
											internal_scale = (1.0, 1.0)
											blend = blend
											font_spacing = 0
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
											local_id = `Left-hor-up`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 170.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (253.552, 244.31235)
											z_priority = 10.0
											scale = (1.0, 1.0)
											rot_angle = 90.0
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
											local_id = `Left-hor-white`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 140.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (336.9634, 173.75299)
											z_priority = 5.0
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
											local_id = `Left-ver-black`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 20.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (336.8094, 116.38981)
											z_priority = 10.0
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
							{
								props = {
									local_id = StartButton
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
									pos = (100.0, 100.0)
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
											blend = blend
											local_id = `Left-hor-black`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 30.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (52.862, 200.78467)
											z_priority = 5.0
											scale = (1.0, 1.0)
											rot_angle = 90.0
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
									{
										props = {
											blend = blend
											local_id = `Left-hor-white`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 100.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (116.40636, 262.91705)
											z_priority = 5.0
											scale = (1.0, 1.0)
											rot_angle = 90.0
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
											local_id = `Left-hor-white`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 100.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (115.084366, 200.78467)
											z_priority = 5.0
											scale = (1.0, 1.0)
											rot_angle = 90.0
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
											local_id = `Left-hor-black`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 30.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (52.862, 263.00708)
											z_priority = 5.0
											scale = (1.0, 1.0)
											rot_angle = 90.0
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
									{
										props = {
											blend = blend
											local_id = `Left-ver-black`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 65.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (38.417557, 231.89587)
											z_priority = 5.0
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
									{
										props = {
											blend = blend
											local_id = `Left-hor-black`
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (3.0, 30.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (25.084229, 230.78476)
											z_priority = 5.0
											scale = (1.0, 1.0)
											rot_angle = 90.0
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
									{
										props = {
											local_id = StartButton_text2
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (50.0, 50.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (32.184925, 276.1083)
											z_priority = 3.0
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
											text = qs("\ba")
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = wrap
											fit_height = `scale down if larger`
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
								]
							}
						]
					}
				]
			}
		]
	}
}
uidesc_boot_usingGuitar_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
