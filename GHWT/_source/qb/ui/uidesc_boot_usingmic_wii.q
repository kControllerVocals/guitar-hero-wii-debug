uidesc_boot_usingMic_wii = {
	DescVersion = 7
	name = uidesc_boot_usingMic_wii
	rect = [
		-13.048341
		-40.316406
		1290.0
		813.17975
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
					index = 1
					validateLocalID = left
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ps3
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = continueback
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = back
					includeParentOwned = false
				}
			]
			name = green_button_text
			visiblename = 'green_button_text'
			help = 'Screen_Guitar -> Bg -> instrument -> left -> PS3 -> continueback -> Back => text'
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
					validateLocalID = left
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ps3
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = continue
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = continue
					includeParentOwned = false
				}
			]
			name = red_button_text
			visiblename = 'red_button_text'
			help = 'Screen_Guitar -> Bg -> instrument -> left -> PS3 -> Continue -> Continue => text'
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
							pos = (-438.30368, -175.9222)
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
									texture = humor_mic
									local_id = boot_drum
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
									pos = (447.78473, 20.0)
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
							pos = (-450.42288, -142.51619)
							z_priority = 1.0
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
						children = [
							{
								props = {
									local_id = right
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
									pos = (160.15723, 70.46102)
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
											local_id = hit_text
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (200.0, 100.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (626.959, 318.1264)
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
											text = qs("CLAP TO \nACTIVATE\n STAR POWER")
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = wrap
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
								]
							}
							{
								props = {
									local_id = left
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
											local_id = mic
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
											pos = (-1.5880411, -101.46096)
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
													local_id = sing
													type = TextBlockElement
													hiddenLocal = false
													alpha = 1.0
													dims = (160.0, 40.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (-16.578959, 181.83412)
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
													text = qs("SING")
													font = fontgrid_title_a1
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
											{
												props = {
													blend = blend
													local_id = line
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (3.0, 50.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (-21.30487, 224.20839)
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
													texture = instrument_mic
													flip_v = false
													local_id = instrument_mic
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (256.0, 256.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (-28.8171, 357.92215)
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
										]
									}
									{
										props = {
											local_id = ps3
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
											pos = (190.23659, -134.7456)
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
													texture = instrument_mic_ps3
													local_id = instrument_mic_ps3
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (300.0, 300.0)
													just = [
														0.0
														0.0
													]
													pos_anchor = [
														0.0
														0.0
													]
													pos = (123.11506, 360.0)
													z_priority = 3.0
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
												}
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
													pos = (-213.49347, 228.0466)
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
															blend = blend
															local_id = `line-black`
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (3.0, 120.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (244.79665, 93.89961)
															z_priority = 4.0
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
															local_id = activate
															type = TextBlockElement
															hiddenLocal = false
															alpha = 1.0
															dims = (240.0, 80.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (204.42044, 92.069336)
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
															text = $wii_activate_star_power
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
															local_id = `line-black`
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (3.0, 25.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (241.41272, 104.68002)
															z_priority = 4.0
															scale = (1.0, 1.0)
															rot_angle = 180.0
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
															local_id = `line-black`
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
															pos = (250.5017, 116.75014)
															z_priority = 4.0
															scale = (1.0, 1.0)
															rot_angle = 270.0
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
													local_id = continueback
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
													pos = (-140.6394, 117.6617)
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
															blend = blend
															local_id = `line-black`
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
																0.0
															]
															pos = (196.2273, 279.0921)
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
															local_id = back
															type = TextBlockElement
															hiddenLocal = false
															alpha = 1.0
															dims = (180.0, 40.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (383.6939, 149.32104)
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
															text = qs("BACK")
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
													local_id = updown
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
													pos = (51.328438, 209.81557)
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
															blend = blend
															local_id = line
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (3.0, 58.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (32.0, 56.623127)
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
															local_id = updown
															type = TextBlockElement
															hiddenLocal = false
															alpha = 1.0
															dims = (220.0, 40.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (43.583, 10.485483)
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
															text = qs("UP/DOWN")
															font = fontgrid_title_a1
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
													local_id = continue
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
													pos = (44.821915, 118.990425)
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
															local_id = continue
															type = TextBlockElement
															hiddenLocal = false
															alpha = 1.0
															dims = (180.0, 40.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (-24.673006, 331.81866)
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
															local_id = `line-black`
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (50.0, 3.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (113.475334, 199.03093)
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
															local_id = `line-white`
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (20.0, 3.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (86.8845, 199.03093)
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
														}
													}
													{
														props = {
															blend = blend
															local_id = `line-black`
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (30.0, 3.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (140.0, 185.08421)
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
													local_id = volume
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
													pos = (431.6179, 21.818253)
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
															blend = blend
															flip_h = false
															flip_v = false
															local_id = `line-black_v`
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (3.0, 50.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (-184.21039, 380.2521)
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
															blend = blend
															local_id = line
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (3.0, 38.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (-157.005, 363.38168)
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
															local_id = VOLUME_TEXT
															type = TextBlockElement
															hiddenLocal = false
															alpha = 1.0
															dims = (150.0, 40.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (-129.29759, 324.82028)
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
															text = qs("VOLUME")
															font = fontgrid_title_a1
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
													{
														props = {
															blend = blend
															local_id = `line-white`
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
															pos = (-220.02802, 380.2521)
															z_priority = 4.0
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
								]
							}
							{
								props = {
									blend = blend
									texture = instrument_mic_bg
									local_id = instrument_mic_bg
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
									pos = (482.1451, 329.86716)
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
		]
	}
}
uidesc_boot_usingMic_wii_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
