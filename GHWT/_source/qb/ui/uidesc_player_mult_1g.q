uidesc_player_mult_1g = {
	DescVersion = 5
	name = uidesc_player_mult_1g
	rect = [
		-7.070103
		-48.293503
		228.43695
		253.26944
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 1
					validateLocalID = note_streak
					includeParentOwned = false
				}
			]
			name = note_streak_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 3
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = NewElement2
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = light0
					includeParentOwned = false
				}
			]
			name = light0_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 3
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = NewElement2
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = light1
					includeParentOwned = false
				}
			]
			name = light1_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 3
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = NewElement2
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = light2
					includeParentOwned = false
				}
			]
			name = light2_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 3
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = NewElement2
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = light3
					includeParentOwned = false
				}
			]
			name = light3_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 3
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = NewElement2
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = light4
					includeParentOwned = false
				}
			]
			name = light4_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = rock_tubes
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = tube0
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow
					includeParentOwned = false
				}
			]
			name = glow0_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = rock_tubes
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = tube0
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow
					includeParentOwned = false
				}
			]
			name = glow0_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = rock_tubes
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = tube1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow
					includeParentOwned = false
				}
			]
			name = glow1_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = rock_tubes
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = tube1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow
					includeParentOwned = false
				}
			]
			name = glow1_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = rock_tubes
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = tube2
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow
					includeParentOwned = false
				}
			]
			name = glow2_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 0
					validateLocalID = rock_tubes
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = tube2
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow
					includeParentOwned = false
				}
			]
			name = glow2_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = container
				}
				{
					index = 4
					validateLocalID = multiplier_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = nixie
					includeParentOwned = false
				}
			]
			name = nixie_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = container
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (1.929897, -9.648747)
			z_priority = 5.0
		}
		children = [
			{
				props = {
					local_id = rock_tubes
					type = ContainerElement
					hiddenLocal = true
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (140.07475, 26.65311)
					z_priority = 5.0
					scale = (0.8, 0.8)
					rot_angle = 90.0
				}
				children = [
					{
						props = {
							local_id = tube0
							type = ContainerElement
							hiddenLocal = true
							dims = (4.0, 4.0)
							just = [
								0.0
								1.0
							]
							pos = (30.083336, 49.58334)
							z_priority = 6.0
						}
						children = [
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube
									type = SpriteElement
									hiddenLocal = true
									dims = (24.0, 48.0)
									just = [
										0.0
										1.0
									]
									pos = (0.0, 0.0)
									z_priority = 6.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = glow
									type = SpriteElement
									hiddenLocal = true
									dims = (24.0, 48.0)
									just = [
										0.0
										1.0
									]
									pos = (0.284058, 2.468228)
									z_priority = 7.0
								}
							}
						]
					}
					{
						props = {
							local_id = tube1
							type = ContainerElement
							hiddenLocal = true
							dims = (4.0, 4.0)
							just = [
								0.0
								1.0
							]
							pos = (54.72184, 52.610317)
							z_priority = 6.0
						}
						children = [
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube
									type = SpriteElement
									hiddenLocal = true
									dims = (24.0, 48.0)
									just = [
										0.0
										1.0
									]
									pos = (0.0, 0.0)
									z_priority = 6.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = glow
									type = SpriteElement
									hiddenLocal = true
									dims = (24.0, 48.0)
									just = [
										0.0
										1.0
									]
									pos = (0.0, 0.69451207)
									z_priority = 7.0
								}
							}
						]
					}
					{
						props = {
							local_id = tube2
							type = ContainerElement
							hiddenLocal = true
							dims = (4.0, 4.0)
							just = [
								0.0
								1.0
							]
							pos = (79.33304, 53.610317)
							z_priority = 6.0
						}
						children = [
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube
									type = SpriteElement
									hiddenLocal = true
									dims = (24.0, 48.0)
									just = [
										0.0
										1.0
									]
									pos = (0.0, 0.0)
									z_priority = 6.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = glow
									type = SpriteElement
									hiddenLocal = true
									dims = (24.0, 48.0)
									just = [
										0.0
										1.0
									]
									pos = (0.0, 1.25)
									z_priority = 7.0
								}
							}
						]
					}
				]
			}
			{
				props = {
					local_id = note_streak
					type = TextBlockElement
					hiddenLocal = true
					dims = (80.0, 30.0)
					just = [
						-1.0
						-1.0
					]
					pos = (31.0, 92.0)
					z_priority = 6.0
					scale = (0.8, 0.9)
					text = qs("8888")
					font = fontgrid_text_a8
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						1.0
						-1.0
					]
					use_shadow = true
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = NewElement4
					type = SpriteElement
					hiddenLocal = true
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (30.52951, 32.40704)
					z_priority = 6.0
					scale = (0.7, 0.4)
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
					local_id = NewElement1
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (114.436966, 109.624695)
					z_priority = 6.0
					scale = (1.1, 1.1)
				}
				children = [
					{
						props = {
							texture = multi_light_seat
							material = 0x00000000
							local_id = Body
							type = SpriteElement
							dims = (32.0, 128.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-49.919197, -76.71903)
							z_priority = 10.0
							scale = (0.9, 0.9)
							rot_angle = -25.0
						}
					}
					{
						props = {
							local_id = NewElement2
							type = ContainerElement
							dims = (100.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-77.41562, -111.164055)
							z_priority = 6.0
							rot_angle = -11.0
						}
						children = [
							{
								props = {
									texture = HUD_score_light_0_blue
									flip_v = false
									flip_h = false
									local_id = light0
									type = SpriteElement
									dims = (20.0, 20.0)
									just = [
										-1.0
										-1.0
									]
									pos = (81.11778, 132.4858)
									z_priority = 9.0
									scale = (1.3, 1.3)
									rot_angle = 180.0
								}
							}
							{
								props = {
									flip_v = false
									texture = HUD_score_light_0_blue
									flip_h = false
									local_id = light1
									type = SpriteElement
									dims = (20.0, 20.0)
									just = [
										-1.0
										-1.0
									]
									pos = (74.2785, 113.14735)
									z_priority = 9.0
									scale = (1.2, 1.2)
									rot_angle = 180.0
								}
							}
							{
								props = {
									flip_v = false
									texture = HUD_score_light_0_blue
									flip_h = false
									local_id = light2
									type = SpriteElement
									dims = (20.0, 20.0)
									just = [
										-1.0
										-1.0
									]
									pos = (66.668015, 95.470146)
									z_priority = 9.0
									scale = (1.1, 1.1)
									rot_angle = 180.0
								}
							}
							{
								props = {
									flip_v = false
									texture = HUD_score_light_0_blue
									flip_h = false
									local_id = light3
									type = SpriteElement
									dims = (20.0, 20.0)
									just = [
										-1.0
										-1.0
									]
									pos = (59.96135, 78.875305)
									z_priority = 9.0
									rot_angle = 180.0
								}
							}
							{
								props = {
									flip_v = false
									texture = HUD_score_light_0_blue
									flip_h = false
									local_id = light4
									type = SpriteElement
									dims = (20.0, 20.0)
									just = [
										-1.0
										-1.0
									]
									pos = (53.162617, 64.02553)
									z_priority = 9.0
									scale = (0.9, 0.9)
									rot_angle = 180.0
								}
							}
						]
					}
				]
			}
			{
				props = {
					local_id = multiplier_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-9.0, 5.0)
					z_priority = 6.0
				}
				children = [
					{
						props = {
							texture = band_HUD_score_x
							local_id = band_HUD_score_x
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (42.317986, -44.661457)
							z_priority = 6.0
						}
					}
					{
						props = {
							texture = band_HUD_score_x
							local_id = band_HUD_score_x
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (42.317986, -42.161457)
							z_priority = 5.0
							rgba = [
								0
								0
								0
								250
							]
						}
					}
					{
						props = {
							texture = band_HUD_score_1a
							material = 0x00000000
							local_id = nixie
							type = SpriteElement
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (60.656906, -22.003098)
							z_priority = 5.0
							rot_angle = -5.0
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
							texture = band_HUD_score_2b
							material = 0x00000000
							local_id = nixie
							type = SpriteElement
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (66.906906, -25.753098)
							z_priority = 6.0
						}
					}
				]
			}
		]
	}
}
uidesc_player_mult_1g_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			1
			21
		]
	}
	EditMaterialForm = {
	}
}
