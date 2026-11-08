uidesc_HUD_band_battle = {
	DescVersion = 4
	name = uidesc_HUD_band_battle
	rect = [
		2.6307108
		3.39798
		1280.0
		761.38055
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 1
					validateLocalID = score_container_1
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = streak_mask
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = streak
					includeParentOwned = false
				}
			]
			name = alias_streak_p1
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 2
					validateLocalID = score_container_2
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = streak_mask
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = streak
					includeParentOwned = false
				}
			]
			name = alias_streak_p2
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = HUD_band_battle_meter_OFF
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = HUD_band_battle_meter_needle
					includeParentOwned = false
				}
			]
			name = hud_band_battle_meter_needle_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = HUD_band_battle_meter_amber_ON
					includeParentOwned = false
				}
			]
			name = hud_band_battle_meter_amber_on_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = HUD_band_battle_meter_violet_ON
					includeParentOwned = false
				}
			]
			name = hud_band_battle_meter_violet_on_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 1
					validateLocalID = score_container_1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = HUD_band_battle_score
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = score_1
					includeParentOwned = false
				}
			]
			name = score_1_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 1
					validateLocalID = score_container_1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = multiplier_container_1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = HUD_bb_multiplier_nixie_1
					includeParentOwned = false
				}
			]
			name = hud_bb_multiplier_nixie_1_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 2
					validateLocalID = score_container_2
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = multiplier_container_2
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = HUD_bb_multiplier_nixie_2
					includeParentOwned = false
				}
			]
			name = hud_bb_multiplier_nixie_2_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = tubes_left_1
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = fill_1_3
					includeParentOwned = false
				}
			]
			name = fill_1_3_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = tubes_left_1
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = fill_1_3
					includeParentOwned = false
				}
			]
			name = fill_1_3_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = tubes_left_1
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = fill_1_2
					includeParentOwned = false
				}
			]
			name = fill_1_2_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = tubes_left_1
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = fill_1_2
					includeParentOwned = false
				}
			]
			name = fill_1_2_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = tubes_left_1
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = fill_1_1
					includeParentOwned = false
				}
			]
			name = fill_1_1_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = tubes_left_1
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = fill_1_1
					includeParentOwned = false
				}
			]
			name = fill_1_1_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = tubes_right_1
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = fill_2_3
					includeParentOwned = false
				}
			]
			name = fill_2_3_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = tubes_right_1
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = fill_2_3
					includeParentOwned = false
				}
			]
			name = fill_2_3_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = tubes_right_1
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = fill_2_2
					includeParentOwned = false
				}
			]
			name = fill_2_2_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = tubes_right_1
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = fill_2_2
					includeParentOwned = false
				}
			]
			name = fill_2_2_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = tubes_right_1
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = fill_2_1
					includeParentOwned = false
				}
			]
			name = fill_2_1_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = tubes_right_1
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = fill_2_1
					includeParentOwned = false
				}
			]
			name = fill_2_1_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = tubes_left_2
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = fill_1_4
					includeParentOwned = false
				}
			]
			name = fill_1_4_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = tubes_left_2
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = fill_1_4
					includeParentOwned = false
				}
			]
			name = fill_1_4_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = tubes_left_2
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = fill_1_5
					includeParentOwned = false
				}
			]
			name = fill_1_5_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = tubes_left_2
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = fill_1_5
					includeParentOwned = false
				}
			]
			name = fill_1_5_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = tubes_left_2
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = fill_1_6
					includeParentOwned = false
				}
			]
			name = fill_1_6_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = tubes_left_2
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = fill_1_6
					includeParentOwned = false
				}
			]
			name = fill_1_6_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = tubes_right_2
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = fill_2_4
					includeParentOwned = false
				}
			]
			name = fill_2_4_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = tubes_right_2
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = fill_2_4
					includeParentOwned = false
				}
			]
			name = fill_2_4_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = tubes_right_2
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = fill_2_5
					includeParentOwned = false
				}
			]
			name = fill_2_5_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = tubes_right_2
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = fill_2_5
					includeParentOwned = false
				}
			]
			name = fill_2_5_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = tubes_right_2
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = fill_2_6
					includeParentOwned = false
				}
			]
			name = fill_2_6_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 0
					validateLocalID = meter_container
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = tubes_right_2
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = fill_2_6
					includeParentOwned = false
				}
			]
			name = fill_2_6_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 2
					validateLocalID = score_container_2
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = HUD_band_battle_score
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = score_2
					includeParentOwned = false
				}
			]
			name = score_2_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 1
					validateLocalID = score_container_1
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = streak_mask
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = streak
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = streak_number
					includeParentOwned = false
				}
			]
			name = p1_streak_number_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = HUD_meter_band_battle_master
				}
				{
					index = 2
					validateLocalID = score_container_2
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = streak_mask
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = streak
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = streak_number
					includeParentOwned = false
				}
			]
			name = p2_streak_number_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = HUD_meter_band_battle_master
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (2.6307108, 3.39798)
			z_priority = 0.0
		}
		children = [
			{
				props = {
					local_id = meter_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-4.002747, -76.697334)
					z_priority = 1.0
					scale = (0.75, 0.75)
				}
				children = [
					{
						props = {
							texture = HUD_band_battle_meter_shadow
							local_id = HUD_band_battle_meter_shadow
							type = SpriteElement
							dims = (256.0, 256.0)
							pos_anchor = [
								0.0
								1.0
							]
							pos = (-2.0, 3.333333)
							z_priority = 1.0
						}
					}
					{
						props = {
							texture = HUD_band_battle_meter_OFF
							material = 0x00000000
							local_id = HUD_band_battle_meter_OFF
							type = SpriteElement
							dims = (256.0, 256.0)
							pos_anchor = [
								0.0
								1.0
							]
							pos = (-1.333333, 1.333333)
							z_priority = 3.0
						}
						children = [
							{
								props = {
									texture = HUD_band_battle_meter_needle
									material = 0x00000000
									local_id = HUD_band_battle_meter_needle
									type = SpriteElement
									dims = (32.0, 256.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-0.73712105, -25.223724)
									z_priority = 4.0
									scale = (0.85, 0.57)
									rot_angle = 15.0
								}
							}
						]
					}
					{
						props = {
							texture = HUD_band_battle_meter_amber_ON
							material = 0x00000000
							local_id = HUD_band_battle_meter_amber_ON
							type = SpriteElement
							dims = (128.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-56.756638, 78.51576)
							z_priority = 4.0
							scale = (1.01, 1.01)
						}
					}
					{
						props = {
							texture = HUD_band_battle_meter_violet_ON
							local_id = HUD_band_battle_meter_violet_ON
							type = SpriteElement
							dims = (128.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (55.522682, 78.610275)
							z_priority = 4.0
						}
					}
					{
						props = {
							local_id = tubes_left_1
							type = ContainerElement
							dims = (100.0, 100.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (-249.56787, 94.61123)
							z_priority = 2.0
							scale = (0.7, 0.7)
							rot_angle = 35.0
						}
						children = [
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_1_3
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-19.086954, -112.82)
									z_priority = 0.0
									rot_angle = -35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_1_2
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-52.872066, -89.746155)
									z_priority = 0.0
									rot_angle = -35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_1_1
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-86.41277, -64.85088)
									z_priority = 0.0
									rot_angle = -35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_1_3
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-18.890636, -112.53916)
									z_priority = 1.0
									rot_angle = -35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_1_2
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-52.872066, -89.746155)
									z_priority = 1.0
									rot_angle = -35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_1_1
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-86.15676, -65.02984)
									z_priority = 1.0
									rot_angle = -35.0
								}
							}
						]
					}
					{
						props = {
							local_id = tubes_right_1
							type = ContainerElement
							dims = (100.0, 100.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (253.15163, 87.62455)
							z_priority = 2.0
							scale = (0.7, 0.7)
							rot_angle = -35.0
						}
						children = [
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_2_3
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (7.4899535, -106.53063)
									z_priority = 0.0
									rot_angle = 35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_2_2
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (41.5993, -82.80364)
									z_priority = 0.0
									rot_angle = 35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_2_1
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (74.29578, -60.29129)
									z_priority = 0.0
									rot_angle = 35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_2_3
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (7.4899535, -106.53063)
									z_priority = 1.0
									rot_angle = 35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_2_2
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (42.20163, -82.38189)
									z_priority = 1.0
									rot_angle = 35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_2_1
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (74.29578, -60.29129)
									z_priority = 1.0
									rot_angle = 35.0
								}
							}
						]
					}
					{
						props = {
							local_id = tubes_left_2
							type = ContainerElement
							dims = (100.0, 100.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (-160.0597, 94.61123)
							z_priority = 2.0
							scale = (0.7, 0.7)
							rot_angle = 35.0
						}
						children = [
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_1_3
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-19.086954, -112.82)
									z_priority = 0.0
									rot_angle = -35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_1_2
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-52.872066, -89.746155)
									z_priority = 0.0
									rot_angle = -35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_1_1
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-86.41277, -64.85088)
									z_priority = 0.0
									rot_angle = -35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_1_6
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-18.890636, -112.53916)
									z_priority = 1.0
									rot_angle = -35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_1_5
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-52.872066, -89.746155)
									z_priority = 1.0
									rot_angle = -35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_1_4
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-86.15676, -65.02984)
									z_priority = 1.0
									rot_angle = -35.0
								}
							}
						]
					}
					{
						props = {
							local_id = tubes_right_2
							type = ContainerElement
							dims = (100.0, 100.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (165.95639, 87.62455)
							z_priority = 2.0
							scale = (0.7, 0.7)
							rot_angle = -35.0
						}
						children = [
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_2_3
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (7.4899535, -106.53063)
									z_priority = 0.0
									rot_angle = 35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_2_2
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (41.5993, -82.80364)
									z_priority = 0.0
									rot_angle = 35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_2_1
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (74.29578, -60.29129)
									z_priority = 0.0
									rot_angle = 35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_2_6
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (7.4899535, -106.53063)
									z_priority = 1.0
									rot_angle = 35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_2_5
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (42.20163, -82.38189)
									z_priority = 1.0
									rot_angle = 35.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_2_4
									type = SpriteElement
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (74.29578, -60.29129)
									z_priority = 1.0
									rot_angle = 35.0
								}
							}
						]
					}
				]
			}
			{
				props = {
					local_id = score_container_1
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (30.479155, 17.047306)
					z_priority = 5.0
				}
				children = [
					{
						props = {
							local_id = multiplier_container_1
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-374.56378, -33.068)
							z_priority = 9.0
							scale = (0.8, 0.8)
						}
						children = [
							{
								props = {
									texture = HUD_score_nixie_1a
									local_id = HUD_bb_multiplier_nixie_1
									type = SpriteElement
									dims = (45.0, 45.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (120.25, 8.75)
									z_priority = 13.5
								}
							}
							{
								props = {
									texture = band_HUD_multiplier_ring
									material = 0x00000000
									local_id = HUD_band_battle_mult_frame
									type = SpriteElement
									dims = (64.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (120.2805, 10.308197)
									z_priority = 13.0
								}
							}
							{
								props = {
									texture = band_HUD_X
									local_id = band_HUD_X
									type = SpriteElement
									dims = (32.0, 32.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (104.00006, 9.733124)
									z_priority = 14.0
								}
							}
						]
					}
					{
						props = {
							flip_v = true
							texture = HUD_band_battle_score
							material = 0x00000000
							local_id = HUD_band_battle_score
							type = SpriteElement
							dims = (256.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-181.60976, -28.299395)
							z_priority = 2.0
							scale = (0.7, 0.7)
						}
						children = [
							{
								props = {
									local_id = score_1
									type = TextBlockElement
									dims = (122.0, 19.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (3.6614308, -0.068252)
									z_priority = 11.0
									scale = (1.6, 1.6)
									text = qs("01234567")
									font = fontgrid_numeral_a9
									fit_width = `scale each line if larger`
									fit_height = `scale to fit`
									scale_mode = `per axis`
									text_case = Original
									internal_just = [
										1.0
										0.0
									]
									internal_scale = (0.5, 0.5)
									font_spacing = 10
									shadow_offs = (3.0, 3.0)
								}
							}
						]
					}
					{
						props = {
							local_id = streak_mask
							type = WindowElement
							hiddenLocal = false
							alpha = 1.0
							dims = (250.0, 50.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-485.73413, -0.12551899)
							z_priority = 6.0
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
									texture = battle_streak
									material = 0x00000000
									local_id = streak
									type = SpriteElement
									dims = (256.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (64.0, 1.392903)
									z_priority = -1.0
									scale = (0.7, 0.7)
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
											pos = (-62.932125, 20.715765)
											z_priority = 1.0
											scale = (0.8, 0.8)
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
						]
					}
				]
			}
			{
				props = {
					local_id = score_container_2
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (85.70783, 1.9565539)
					z_priority = 5.0
				}
				children = [
					{
						props = {
							local_id = multiplier_container_2
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (151.40599, -8.89418)
							z_priority = 9.0
							scale = (0.8, 0.8)
						}
						children = [
							{
								props = {
									texture = HUD_score_nixie_1a
									local_id = HUD_bb_multiplier_nixie_2
									type = SpriteElement
									dims = (45.0, 45.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (12.25, -1.25)
									z_priority = 13.5
								}
							}
							{
								props = {
									flip_v = false
									texture = band_HUD_multiplier_ring
									material = 0x00000000
									local_id = HUD_band_battle_mult_frame
									type = SpriteElement
									dims = (64.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (14.157471, -1.308228)
									z_priority = 13.0
								}
							}
							{
								props = {
									texture = band_HUD_X
									local_id = band_HUD_X
									type = SpriteElement
									dims = (32.0, 32.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-2.04071, -2.040833)
									z_priority = 14.0
								}
							}
						]
					}
					{
						props = {
							texture = HUD_band_battle_score
							material = 0x00000000
							local_id = HUD_band_battle_score
							type = SpriteElement
							dims = (256.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (60.06084, -12.9660425)
							z_priority = 2.0
							scale = (0.75, 0.7)
						}
						children = [
							{
								props = {
									local_id = score_2
									type = TextBlockElement
									dims = (122.0, 19.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (3.6614308, -0.068252)
									z_priority = 11.0
									scale = (1.6, 1.6)
									text = qs("01234567")
									font = fontgrid_numeral_a9
									fit_width = `scale each line if larger`
									fit_height = `scale to fit`
									scale_mode = `per axis`
									text_case = Original
									internal_just = [
										1.0
										0.0
									]
									internal_scale = (0.5, 0.5)
									font_spacing = 10
									shadow_offs = (3.0, 3.0)
								}
							}
						]
					}
					{
						props = {
							local_id = streak_mask
							type = WindowElement
							hiddenLocal = false
							alpha = 1.0
							dims = (250.0, 50.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (193.56232, 14.656734)
							z_priority = 6.0
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
									texture = battle_streak
									material = 0x00000000
									local_id = streak
									type = SpriteElement
									dims = (256.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-33.0, 3.17067)
									z_priority = -1.0
									scale = (0.7, 0.7)
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
											pos = (-65.78925, 20.71576)
											z_priority = 1.0
											scale = (0.8, 0.8)
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
						]
					}
				]
			}
			{
				props = {
					local_id = player1_message_fire
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (100.0, 100.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = hud_message_fire
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 400.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-421.99323, -53.852196)
							z_priority = -50.0
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
							desc = 'hud_message_fire'
							autoSizeDims = true
						}
					}
				]
			}
			{
				props = {
					local_id = player2_message_fire
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (100.0, 100.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = hud_message_fire
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 400.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-9.90521, -48.619396)
							z_priority = -50.0
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
							desc = 'hud_message_fire'
							autoSizeDims = true
						}
					}
				]
			}
		]
	}
}
uidesc_HUD_band_battle_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			1
			3
			7
			14
			21
			28
			55
			57
		]
	}
	EditMaterialForm = {
	}
}
