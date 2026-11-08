uidesc_vocal_multiplier_star = {
	DescVersion = 4
	name = uidesc_vocal_multiplier_star
	rect = [
		48.631435
		-58.24234
		501.44766
		161.5
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = vocal_star_power
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = star_power_bulbs
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star0
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow0
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
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = vocal_star_power
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = star_power_bulbs
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = star0
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow0
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
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = vocal_star_power
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = star_power_bulbs
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = star1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow1
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
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = vocal_star_power
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = star_power_bulbs
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = star1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow1
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
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = vocal_star_power
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = star_power_bulbs
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = star2
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow2
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
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = vocal_star_power
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = star_power_bulbs
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = star2
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = glow2
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
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = vocal_mulitpler
					includeParentOwned = false
				}
				{
					index = 1
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
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = vocal_mulitpler
					includeParentOwned = false
				}
				{
					index = 2
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
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = vocal_mulitpler
					includeParentOwned = false
				}
				{
					index = 3
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
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = vocal_mulitpler
					includeParentOwned = false
				}
				{
					index = 4
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
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = vocal_mulitpler
					includeParentOwned = false
				}
				{
					index = 5
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
					validateLocalID = NewElement1
				}
				{
					index = 2
					validateLocalID = multiplier_number
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_HUD_score_2a
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
			local_id = NewElement1
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (114.69783, -8.24234)
		}
		children = [
			{
				props = {
					local_id = vocal_mulitpler
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (142.34839, 64.852745)
					z_priority = 1.0
					scale = (0.75, 0.75)
				}
				children = [
					{
						props = {
							texture = vocal_multi_light_seat
							flip_h = false
							flip_v = false
							local_id = vocal_multi_light_seat
							type = SpriteElement
							dims = (128.0, 32.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (273.7472, 16.26478)
							z_priority = 2.0
						}
					}
					{
						props = {
							flip_h = false
							texture = HUD_score_light_0_blue
							flip_v = true
							local_id = light0
							type = SpriteElement
							dims = (32.0, 32.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (231.6318, 1.8)
							z_priority = 2.0
							scale = (0.95, 0.95)
							rot_angle = -90.0
						}
					}
					{
						props = {
							texture = HUD_score_light_0_blue
							flip_v = true
							local_id = light1
							type = SpriteElement
							dims = (32.0, 32.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (253.39767, 1.8)
							z_priority = 2.0
							scale = (0.95, 0.95)
							rot_angle = -90.0
						}
					}
					{
						props = {
							texture = HUD_score_light_0_blue
							flip_h = false
							flip_v = true
							local_id = light2
							type = SpriteElement
							dims = (32.0, 32.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (273.97998, 1.8)
							z_priority = 2.0
							scale = (0.95, 0.95)
							rot_angle = -90.0
						}
					}
					{
						props = {
							texture = HUD_score_light_0_blue
							flip_v = true
							local_id = light3
							type = SpriteElement
							dims = (32.0, 32.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (295.15448, 1.8)
							z_priority = 2.0
							scale = (0.95, 0.95)
							rot_angle = -90.0
						}
					}
					{
						props = {
							texture = HUD_score_light_0_blue
							flip_v = true
							local_id = light4
							type = SpriteElement
							dims = (32.0, 32.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (315.4037, 1.8)
							z_priority = 2.0
							scale = (0.95, 0.95)
							rot_angle = -90.0
						}
					}
				]
			}
			{
				props = {
					local_id = vocal_star_power
					type = ContainerElement
					hiddenLocal = true
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (214.4745, 74.0)
					z_priority = 2.0
					scale = (0.75, 0.75)
				}
				children = [
					{
						props = {
							texture = vocal_star_light_seat
							local_id = vocal_star_light_seat
							type = SpriteElement
							hiddenLocal = true
							dims = (128.0, 32.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (27.365776, -29.751732)
							z_priority = 5.0
							scale = (1.2, 1.1)
						}
					}
					{
						props = {
							local_id = star_power_bulbs
							type = ContainerElement
							hiddenLocal = true
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-1.5E-05, -1.33336)
							z_priority = 3.0
						}
						children = [
							{
								props = {
									local_id = star0
									type = ContainerElement
									hiddenLocal = true
									dims = (100.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-3.7415268, -4.5125995)
									z_priority = 4.0
									rot_angle = -90.0
								}
								children = [
									{
										props = {
											texture = star_bulb_0
											local_id = star_bulb_0
											type = SpriteElement
											hiddenLocal = true
											dims = (89.6, 44.8)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 1.0
										}
									}
									{
										props = {
											texture = HUD_rock_tube_glow_full
											local_id = glow0
											type = SpriteElement
											hiddenLocal = true
											dims = (32.0, 70.0)
											just = [
												0.0
												1.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (22.577778, -3E-06)
											z_priority = 2.0
											rot_angle = -90.0
										}
									}
								]
							}
							{
								props = {
									local_id = star1
									type = ContainerElement
									hiddenLocal = true
									dims = (100.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (28.48976, -4.5125995)
									z_priority = 4.0
									rot_angle = -90.0
								}
								children = [
									{
										props = {
											texture = star_bulb_0
											local_id = star_bulb_1
											type = SpriteElement
											hiddenLocal = true
											dims = (89.6, 44.8)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 1.0
										}
									}
									{
										props = {
											texture = HUD_rock_tube_glow_full
											local_id = glow1
											type = SpriteElement
											hiddenLocal = true
											dims = (32.0, 70.0)
											just = [
												0.0
												1.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (22.577778, -3E-06)
											z_priority = 2.0
											rot_angle = -90.0
										}
									}
								]
							}
							{
								props = {
									local_id = star2
									type = ContainerElement
									hiddenLocal = true
									dims = (100.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (58.72112, -4.512601)
									z_priority = 4.0
									rot_angle = -90.0
								}
								children = [
									{
										props = {
											texture = star_bulb_0
											local_id = star_bulb_2
											type = SpriteElement
											hiddenLocal = true
											dims = (89.6, 44.8)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 1.0
										}
									}
									{
										props = {
											texture = HUD_rock_tube_glow_full
											flip_h = false
											flip_v = false
											local_id = glow2
											type = SpriteElement
											hiddenLocal = true
											dims = (32.0, 70.0)
											just = [
												0.0
												1.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (22.577778, -3E-06)
											z_priority = 2.0
											rot_angle = -90.0
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
					local_id = multiplier_number
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-16.066391, 8.793129)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = vocal_HUD_score_x
							material = 0x00000000
							local_id = band_HUD_score_x
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (425.1189, 55.24813)
							z_priority = 2.0
							scale = (0.8, 0.8)
						}
					}
					{
						props = {
							texture = vocal_HUD_score_x
							material = 0x00000000
							local_id = band_HUD_score_x
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (424.1189, 54.24813)
							scale = (0.8, 0.8)
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
							texture = vocal_HUD_score_2a
							material = 0x00000000
							local_id = band_HUD_score_2a
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (425.8477, 59.4751)
							z_priority = 2.0
							scale = (0.8, 0.8)
						}
					}
				]
			}
			{
				props = {
					local_id = vocal_star_power
					type = ContainerElement
					hiddenLocal = true
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (142.52263, 74.0)
					z_priority = 2.0
					scale = (0.75, 0.75)
				}
				children = [
					{
						props = {
							texture = vocal_star_light_seat
							local_id = vocal_star_light_seat
							type = SpriteElement
							hiddenLocal = true
							dims = (128.0, 32.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (27.365776, -29.751732)
							z_priority = 5.0
							scale = (1.2, 1.1)
						}
					}
					{
						props = {
							local_id = star_power_bulbs
							type = ContainerElement
							hiddenLocal = true
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-1.5E-05, -1.33336)
							z_priority = 3.0
						}
						children = [
							{
								props = {
									local_id = star0
									type = ContainerElement
									hiddenLocal = true
									dims = (100.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-3.7415268, -4.5125995)
									z_priority = 4.0
									rot_angle = -90.0
								}
								children = [
									{
										props = {
											texture = star_bulb_0
											local_id = star_bulb_0
											type = SpriteElement
											hiddenLocal = true
											dims = (89.6, 44.8)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 1.0
										}
									}
									{
										props = {
											texture = HUD_rock_tube_glow_full
											local_id = glow0
											type = SpriteElement
											hiddenLocal = true
											dims = (32.0, 70.0)
											just = [
												0.0
												1.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (22.577778, -3E-06)
											z_priority = 2.0
											rot_angle = -90.0
										}
									}
								]
							}
							{
								props = {
									local_id = star1
									type = ContainerElement
									hiddenLocal = true
									dims = (100.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (28.48976, -4.5125995)
									z_priority = 4.0
									rot_angle = -90.0
								}
								children = [
									{
										props = {
											texture = star_bulb_0
											local_id = star_bulb_1
											type = SpriteElement
											hiddenLocal = true
											dims = (89.6, 44.8)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 1.0
										}
									}
									{
										props = {
											texture = HUD_rock_tube_glow_full
											local_id = glow1
											type = SpriteElement
											hiddenLocal = true
											dims = (32.0, 70.0)
											just = [
												0.0
												1.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (22.577778, -3E-06)
											z_priority = 2.0
											rot_angle = -90.0
										}
									}
								]
							}
							{
								props = {
									local_id = star2
									type = ContainerElement
									hiddenLocal = true
									dims = (100.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (58.72112, -4.512601)
									z_priority = 4.0
									rot_angle = -90.0
								}
								children = [
									{
										props = {
											texture = star_bulb_0
											local_id = star_bulb_2
											type = SpriteElement
											hiddenLocal = true
											dims = (89.6, 44.8)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 1.0
										}
									}
									{
										props = {
											texture = HUD_rock_tube_glow_full
											flip_h = false
											flip_v = false
											local_id = glow2
											type = SpriteElement
											hiddenLocal = true
											dims = (32.0, 70.0)
											just = [
												0.0
												1.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (22.577778, -3E-06)
											z_priority = 2.0
											rot_angle = -90.0
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
uidesc_vocal_multiplier_star_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			8
			10
			24
		]
	}
	EditMaterialForm = {
	}
}
