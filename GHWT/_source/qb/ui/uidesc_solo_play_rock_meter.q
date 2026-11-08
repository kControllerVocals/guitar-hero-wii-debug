uidesc_solo_play_rock_meter = {
	DescVersion = 9
	name = uidesc_solo_play_rock_meter
	rect = [
		97.0
		-66.173065
		343.2751
		337.3535
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 1
					validateLocalID = glow
					includeParentOwned = false
				}
			]
			name = alias_glow
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 11
					validateLocalID = streak
					includeParentOwned = false
				}
			]
			name = alias_streak
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = secondary_bulbs
					includeParentOwned = false
				}
			]
			name = alias_secondary_bulbs
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 13
					validateLocalID = rock_meter_bg_color
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = HUD_meter_red_bg
					includeParentOwned = false
				}
			]
			name = alias_HUD_meter_red_bg
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = score
					includeParentOwned = false
				}
			]
			name = score_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 2
					validateLocalID = needle
					includeParentOwned = false
				}
			]
			name = needle_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 2
					validateLocalID = needle
					includeParentOwned = false
				}
			]
			name = needle_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 4
					validateLocalID = green_light
					includeParentOwned = false
				}
			]
			name = green_light_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 5
					validateLocalID = yellow_light
					includeParentOwned = false
				}
			]
			name = yellow_light_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 6
					validateLocalID = red_light
					includeParentOwned = false
				}
			]
			name = red_light_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 11
					validateLocalID = streak
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = streak_number
					includeParentOwned = false
				}
			]
			name = streak_number_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = HUD_rock_tube_glow_full_b1
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
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = HUD_rock_tube_glow_full_b2
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
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = HUD_rock_tube_glow_full_b3
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
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = secondary_bulbs
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = HUD_rock_tube_glow_full_b4
					includeParentOwned = false
				}
			]
			name = glow3_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = secondary_bulbs
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = HUD_rock_tube_glow_full_b5
					includeParentOwned = false
				}
			]
			name = glow4_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = secondary_bulbs
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = HUD_rock_tube_glow_full_b6
					includeParentOwned = false
				}
			]
			name = glow5_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = HUD_rock_tube_glow_full_b1
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
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = HUD_rock_tube_glow_full_b2
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
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = HUD_rock_tube_glow_full_b3
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
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = secondary_bulbs
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = HUD_rock_tube_glow_full_b4
					includeParentOwned = false
				}
			]
			name = glow3_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = secondary_bulbs
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = HUD_rock_tube_glow_full_b5
					includeParentOwned = false
				}
			]
			name = glow4_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = secondary_bulbs
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = HUD_rock_tube_glow_full_b6
					includeParentOwned = false
				}
			]
			name = glow5_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 13
					validateLocalID = rock_meter_bg_color
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = HUD_meter_green_bg
					includeParentOwned = false
				}
			]
			name = hud_meter_green_bg_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 13
					validateLocalID = rock_meter_bg_color
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = HUD_meter_yellow_bg
					includeParentOwned = false
				}
			]
			name = hud_meter_yellow_bg_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 13
					validateLocalID = rock_meter_bg_color
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = HUD_meter_red_bg
					includeParentOwned = false
				}
			]
			name = hud_meter_red_bg_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = meter_container
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (97.0, 10.0)
		}
		children = [
			{
				props = {
					texture = band_hud_meter_top
					material = 0x00000000
					local_id = Body
					type = SpriteElement
					dims = (256.0, 128.0)
					just = [
						-1.0
						-1.0
					]
					pos = (31.678951, 19.890179)
					z_priority = 17.0
				}
			}
			{
				props = {
					texture = band_HUD_bg_inside
					material = 0x00000000
					local_id = glow
					type = SpriteElement
					hiddenLocal = true
					dims = (256.0, 128.0)
					just = [
						-1.0
						-1.0
					]
					pos = (87.275055, 12.957129)
				}
			}
			{
				props = {
					texture = band_HUD_needle
					local_id = needle
					type = SpriteElement
					dims = (32.0, 64.0)
					just = [
						0.0
						0.75
					]
					pos = (164.4984, 120.934296)
					z_priority = 16.0
				}
			}
			{
				props = {
					texture = band_HUD_lights_all
					local_id = lights_bg
					type = SpriteElement
					dims = (128.0, 128.0)
					just = [
						-1.0
						-1.0
					]
					pos = (98.204926, -15.2670145)
					z_priority = 14.0
				}
			}
			{
				props = {
					texture = band_HUD_light_green
					local_id = green_light
					type = SpriteElement
					dims = (64.0, 64.0)
					just = [
						-1.0
						-1.0
					]
					pos = (153.51335, 46.46461)
					z_priority = 15.0
				}
			}
			{
				props = {
					texture = band_HUD_light_yellow
					local_id = yellow_light
					type = SpriteElement
					dims = (64.0, 64.0)
					just = [
						-1.0
						-1.0
					]
					pos = (132.01219, 37.8651)
					z_priority = 15.0
				}
			}
			{
				props = {
					texture = band_HUD_light_red
					local_id = red_light
					type = SpriteElement
					dims = (64.0, 64.0)
					just = [
						-1.0
						-1.0
					]
					pos = (111.84728, 43.83549)
					z_priority = 15.0
				}
			}
			{
				props = {
					texture = band_HUD_multiplier_ring
					material = 0x00000000
					local_id = multiplier
					type = SpriteElement
					hiddenLocal = true
					dims = (64.0, 64.0)
					just = [
						-1.0
						-1.0
					]
					pos = (217.33981, 106.87888)
					z_priority = 20.0
					scale = (0.8, 0.8)
				}
			}
			{
				props = {
					local_id = score
					type = TextBlockElement
					dims = (168.0, 50.0)
					just = [
						1.0
						-1.0
					]
					pos = (245.56244, 149.182)
					z_priority = 18.0
					scale = (0.8, 0.8)
					text = qs("")
					font = fontgrid_numeral_a9
					fit_width = `expand dims`
					fit_height = `expand dims`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						-1.0
					]
					use_shadow = true
					shadow_rgba = [
						0
						0
						0
						0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					texture = band_HUD_meter_outer_glow
					local_id = band_HUD_meter_outer_glow
					type = SpriteElement
					hiddenLocal = true
					dims = (256.0, 128.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (116.30673, 31.589554)
					z_priority = 1.0
				}
			}
			{
				props = {
					texture = HUD_RM_solo_bottom
					material = 0x00000000
					local_id = band_HUD_meter_body
					type = SpriteElement
					dims = (256.0, 128.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (112.81612, 86.78771)
					z_priority = 5.0
					scale = (0.9, 0.9)
				}
			}
			{
				props = {
					texture = streak
					local_id = streak
					type = SpriteElement
					dims = (256.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (114.052216, 161.38075)
					z_priority = 1.0
					scale = (0.8, 0.87)
				}
				children = [
					{
						props = {
							local_id = streak_number
							type = TextBlockElement
							dims = (300.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-8.130527, 22.241056)
							z_priority = 2.0
							scale = (0.7, 0.7)
							rgba = [
								255
								128
								0
								255
							]
							text = qs("50")
							font = fontgrid_numeral_a9
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								-1.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
			{
				props = {
					local_id = star_power_lights
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (96.40984, 96.671844)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = HUD_rock_tube
							local_id = HUD_rock_tube1
							type = SpriteElement
							dims = (64.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-45.009457, -92.717)
							z_priority = 2.0
							scale = (0.4, 0.4)
							rot_angle = -45.0
						}
					}
					{
						props = {
							texture = HUD_rock_tube
							local_id = HUD_rock_tube2
							type = SpriteElement
							dims = (64.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-22.84214, -108.07848)
							z_priority = 2.0
							scale = (0.4, 0.4)
							rot_angle = -28.0
						}
					}
					{
						props = {
							texture = HUD_rock_tube
							local_id = HUD_rock_tube3
							type = SpriteElement
							dims = (64.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (3.340303, -115.173195)
							z_priority = 2.0
							scale = (0.4, 0.4)
							rot_angle = -10.0
						}
					}
					{
						props = {
							texture = HUD_rock_tube_glow_full_b
							blend = Add
							local_id = HUD_rock_tube_glow_full_b1
							type = SpriteElement
							alpha = 0.7
							dims = (64.0, 128.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-33.08142, -80.461174)
							z_priority = 5.0
							scale = (0.3, 0.3)
							rot_angle = -45.0
						}
					}
					{
						props = {
							texture = HUD_rock_tube_glow_full_b
							blend = Add
							local_id = HUD_rock_tube_glow_full_b2
							type = SpriteElement
							alpha = 0.7
							dims = (64.0, 128.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-15.044394, -93.81642)
							z_priority = 5.0
							scale = (0.3, 0.3)
							rot_angle = -28.0
						}
					}
					{
						props = {
							texture = HUD_rock_tube_glow_full_b
							blend = Add
							local_id = HUD_rock_tube_glow_full_b3
							type = SpriteElement
							alpha = 0.7
							dims = (64.0, 128.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (6.107452, -98.85607)
							z_priority = 5.0
							scale = (0.3, 0.3)
							rot_angle = -10.0
						}
					}
					{
						props = {
							local_id = secondary_bulbs
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = HUD_rock_tube
									local_id = HUD_rock_tube4
									type = SpriteElement
									dims = (64.0, 128.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (36.437378, -114.132164)
									z_priority = 2.0
									scale = (0.4, 0.4)
									rot_angle = 10.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									flip_v = true
									local_id = HUD_rock_tube5
									type = SpriteElement
									dims = (64.0, 128.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (61.42833, -105.45559)
									z_priority = 2.0
									scale = (0.4, 0.4)
									rot_angle = 28.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									flip_v = true
									local_id = HUD_rock_tube6
									type = SpriteElement
									dims = (64.0, 128.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (83.302444, -89.93017)
									z_priority = 2.0
									scale = (0.4, 0.4)
									rot_angle = 45.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full_b
									blend = Add
									local_id = HUD_rock_tube_glow_full_b4
									type = SpriteElement
									alpha = 0.7
									dims = (64.0, 128.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (33.203056, -98.334175)
									z_priority = 5.0
									scale = (0.3, 0.3)
									rot_angle = 10.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full_b
									blend = Add
									local_id = HUD_rock_tube_glow_full_b5
									type = SpriteElement
									alpha = 0.7
									dims = (64.0, 128.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (53.14141, -91.564995)
									z_priority = 5.0
									scale = (0.3, 0.3)
									rot_angle = 28.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full_b
									blend = Add
									local_id = HUD_rock_tube_glow_full_b6
									type = SpriteElement
									alpha = 0.7
									dims = (64.0, 128.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (70.674965, -78.034966)
									z_priority = 5.0
									scale = (0.3, 0.3)
									rot_angle = 45.0
								}
							}
						]
					}
				]
			}
			{
				props = {
					local_id = rock_meter_bg_color
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (16.035208, -76.173065)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = HUD_meter_green_bg
							local_id = HUD_meter_green_bg
							type = SpriteElement
							dims = (256.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (100.0, 100.0)
							z_priority = 10.0
						}
					}
					{
						props = {
							texture = HUD_meter_yellow_bg
							local_id = HUD_meter_yellow_bg
							type = SpriteElement
							dims = (256.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (100.0, 100.0)
							z_priority = 9.0
						}
					}
					{
						props = {
							texture = HUD_meter_red_bg
							local_id = HUD_meter_red_bg
							type = SpriteElement
							dims = (256.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (100.0, 100.0)
							z_priority = 8.0
						}
					}
				]
			}
		]
	}
}
uidesc_solo_play_rock_meter_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			14
			21
		]
	}
	EditMaterialForm = {
	}
}
