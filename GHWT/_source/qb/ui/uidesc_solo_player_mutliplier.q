uidesc_solo_player_mutliplier = {
	DescVersion = 3
	name = uidesc_solo_player_mutliplier
	rect = [
		31.116583
		20.6534
		192.43808
		187.96489
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
					index = 8
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
					index = 2
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
					index = 4
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
					index = 5
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
					index = 6
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
					index = 1
					validateLocalID = nixie
					includeParentOwned = false
				}
			]
			name = nixie_texture
			target = texture
			type = checksum
		}
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
			pos = (56.20504, 20.6534)
			z_priority = 5.0
			scale = (1.1, 1.1)
		}
		children = [
			{
				props = {
					texture = HUD_mult_body
					local_id = Body
					type = SpriteElement
					dims = (256.0, 256.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-22.80769, 17.277178)
					z_priority = 10.0
					scale = (0.6, 0.6)
				}
			}
			{
				props = {
					texture = band_HUD_score_1a
					local_id = nixie
					type = SpriteElement
					dims = (64.0, 64.0)
					just = [
						-1.0
						-1.0
					]
					pos = (21.209547, 70.6405)
					z_priority = 6.0
				}
			}
			{
				props = {
					texture = HUD_score_light_0_blue
					flip_v = false
					flip_h = true
					local_id = light0
					type = SpriteElement
					dims = (20.0, 20.0)
					just = [
						-1.0
						-1.0
					]
					pos = (30.363636, 56.0)
					z_priority = 9.0
					scale = (0.9, 0.9)
					rot_angle = 90.0
				}
			}
			{
				props = {
					texture = HUD_score_light_0_blue
					flip_h = true
					local_id = light1
					type = SpriteElement
					dims = (20.0, 20.0)
					just = [
						-1.0
						-1.0
					]
					pos = (46.363632, 56.0)
					z_priority = 9.0
					scale = (0.9, 0.9)
					rot_angle = 90.0
				}
			}
			{
				props = {
					texture = HUD_score_light_0_blue
					flip_h = true
					local_id = light2
					type = SpriteElement
					dims = (20.0, 20.0)
					just = [
						-1.0
						-1.0
					]
					pos = (61.363636, 56.0)
					z_priority = 9.0
					scale = (0.9, 0.9)
					rot_angle = 90.0
				}
			}
			{
				props = {
					texture = HUD_score_light_0_blue
					flip_h = true
					local_id = light3
					type = SpriteElement
					dims = (20.0, 20.0)
					just = [
						-1.0
						-1.0
					]
					pos = (77.7991, 56.0)
					z_priority = 9.0
					scale = (0.9, 0.9)
					rot_angle = 90.0
				}
			}
			{
				props = {
					texture = HUD_score_light_0_blue
					flip_h = true
					local_id = light4
					type = SpriteElement
					dims = (20.0, 20.0)
					just = [
						-1.0
						-1.0
					]
					pos = (93.489586, 56.0)
					z_priority = 9.0
					scale = (0.9, 0.9)
					rot_angle = 90.0
				}
			}
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
					pos = (11.691566, 0.408054)
					z_priority = 5.0
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
							pos = (88.44446, 81.021)
							z_priority = 1.0
							rot_angle = 60.0
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
									pos = (0.0, 0.0)
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
							pos = (88.44446, 94.1416)
							rot_angle = 90.0
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
									pos = (0.0, 0.0)
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
							pos = (86.086174, 106.91742)
							z_priority = 6.0
							rot_angle = 120.0
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
									pos = (0.0, 0.0)
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
					local_id = bG
					type = SpriteElement
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (15.500008, 56.50001)
					z_priority = 6.0
					scale = (0.9, 0.2)
					rgba = [
						0
						0
						0
						255
					]
				}
			}
		]
	}
}
uidesc_solo_player_mutliplier_nxgui = {
}
