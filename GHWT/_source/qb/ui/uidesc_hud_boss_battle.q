uidesc_HUD_boss_battle = {
	DescVersion = 1
	name = uidesc_HUD_boss_battle
	rect = [
		0.0
		0.0
		1280.0
		762.00385
	]
	aliases = [
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
					validateLocalID = tubes_1
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
					validateLocalID = tubes_1
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
					validateLocalID = tubes_1
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
					validateLocalID = tubes_1
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
					validateLocalID = tubes_1
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
					validateLocalID = tubes_1
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
					validateLocalID = tubes_2
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
					validateLocalID = tubes_2
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
					validateLocalID = tubes_2
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
					validateLocalID = tubes_2
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
					validateLocalID = tubes_2
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
					validateLocalID = tubes_2
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
			pos = (0.0, 0.0)
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
					pos = (1.2879641, -109.60745)
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
							pos = (-2.0, 2.0)
							z_priority = 1.0
						}
					}
					{
						props = {
							texture = HUD_band_battle_meter_OFF
							local_id = HUD_band_battle_meter_OFF
							type = SpriteElement
							dims = (256.0, 256.0)
							pos_anchor = [
								0.0
								1.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = HUD_band_battle_meter_needle
									local_id = HUD_band_battle_meter_needle
									type = SpriteElement
									dims = (16.0, 256.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-0.36792102, -16.725584)
									z_priority = 4.0
									scale = (1.3, 0.6)
									rot_angle = 15.0
								}
							}
						]
					}
					{
						props = {
							texture = HUD_band_battle_meter_amber_ON
							local_id = HUD_band_battle_meter_amber_ON
							type = SpriteElement
							dims = (128.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-55.08018, 77.4047)
							z_priority = 3.0
						}
					}
					{
						props = {
							texture = HUD_band_battle_meter_violet_ON
							local_id = HUD_band_battle_meter_violet_ON
							type = SpriteElement
							alpha = 0.0
							dims = (128.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (56.63383, 77.276955)
							z_priority = 3.0
						}
					}
					{
						props = {
							local_id = tubes_1
							type = ContainerElement
							hiddenLocal = true
							dims = (100.0, 100.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (0.0, 94.0)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_1_3
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-35.90408, -94.786674)
									z_priority = 2.0
									rot_angle = -24.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_1_2
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-57.499634, -83.35082)
									z_priority = 2.0
									rot_angle = -39.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_1_1
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-74.786736, -66.16973)
									z_priority = 2.0
									rot_angle = -54.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_1_3
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-35.90408, -94.786674)
									z_priority = 3.0
									rot_angle = -24.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_1_2
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-57.499634, -83.35082)
									z_priority = 3.0
									rot_angle = -39.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_1_1
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-74.786736, -66.16973)
									z_priority = 3.0
									rot_angle = -54.0
								}
							}
						]
					}
					{
						props = {
							local_id = tubes_2
							type = ContainerElement
							hiddenLocal = true
							dims = (100.0, 100.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (0.0, 94.0)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_2_3
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (34.90408, -95.35082)
									z_priority = 2.0
									rot_angle = 24.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_2_2
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (57.39337, -83.35082)
									z_priority = 2.0
									rot_angle = 39.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube
									local_id = tube_2_1
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (75.010376, -66.16973)
									z_priority = 2.0
									rot_angle = 54.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_2_3
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (34.90408, -95.35082)
									z_priority = 3.0
									rot_angle = 24.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_2_2
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (57.39337, -83.35082)
									z_priority = 3.0
									rot_angle = 39.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = fill_2_1
									type = SpriteElement
									hiddenLocal = true
									dims = (40.0, 80.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (75.010376, -66.16973)
									z_priority = 3.0
									rot_angle = 54.0
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
					pos = (-5.23288, 0.62323)
					z_priority = 10.0
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
							pos = (-163.33525, -22.712053)
							z_priority = 9.0
							scale = (0.8, 0.8)
						}
						children = [
							{
								props = {
									texture = HUD_score_nixie_1a
									local_id = HUD_bb_multiplier_nixie_1
									type = SpriteElement
									dims = (47.0, 47.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (121.0, 10.0)
									z_priority = 14.0
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
									z_priority = 15.0
								}
							}
						]
					}
					{
						props = {
							texture = HUD_band_battle_score
							local_id = HUD_band_battle_score
							type = SpriteElement
							hiddenLocal = true
							dims = (256.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-115.46576, -6.150665)
							z_priority = 10.0
						}
						children = [
							{
								props = {
									local_id = score_1
									type = TextBlockElement
									hiddenLocal = true
									dims = (122.0, 19.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (19.082214, -0.691803)
									z_priority = 11.0
									scale = (1.4, 1.4)
									text = qs("01234567")
									font = fontgrid_text_a3
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
									pos = (-421.99323, -53.8522)
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
			{
				props = {
					local_id = score_container_2
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (24.856133, 0.62323)
					z_priority = 10.0
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
							pos = (37.41681, -13.341858)
							z_priority = 9.0
							scale = (0.8, 0.8)
						}
						children = [
							{
								props = {
									texture = HUD_score_nixie_1a
									local_id = HUD_bb_multiplier_nixie_2
									type = SpriteElement
									dims = (47.0, 47.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (12.0, -1.0)
									z_priority = 14.0
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
									z_priority = 15.0
								}
							}
						]
					}
					{
						props = {
							texture = HUD_band_battle_score
							local_id = HUD_band_battle_score
							type = SpriteElement
							hiddenLocal = true
							dims = (256.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (105.0, -7.458923)
							z_priority = 10.0
						}
						children = [
							{
								props = {
									local_id = score_2
									type = TextBlockElement
									hiddenLocal = true
									dims = (122.0, 19.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-3.0, -2.0)
									z_priority = 11.0
									scale = (1.4, 1.4)
									text = qs("01234567")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale to fit`
									scale_mode = `per axis`
									text_case = Original
									internal_just = [
										-1.0
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
		]
	}
}
uidesc_HUD_boss_battle_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			7
			14
			21
			26
			28
			30
			35
			37
		]
	}
	EditMaterialForm = {
	}
}
