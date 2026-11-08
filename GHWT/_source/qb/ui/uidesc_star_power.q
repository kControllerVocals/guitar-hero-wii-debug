uidesc_star_power = {
	DescVersion = 5
	name = uidesc_star_power
	rect = [
		16.683039
		-7.7627444
		634.0472
		336.47537
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = rock_tubes
				}
				{
					index = 1
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 2
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
					validateLocalID = rock_tubes
				}
				{
					index = 1
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 2
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
					validateLocalID = rock_tubes
				}
				{
					index = 1
					validateLocalID = NewElement1
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
					validateLocalID = rock_tubes
				}
				{
					index = 1
					validateLocalID = NewElement1
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
					validateLocalID = rock_tubes
				}
				{
					index = 1
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
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
					validateLocalID = rock_tubes
				}
				{
					index = 1
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
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
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = rock_tubes
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (116.683044, -7.7627406)
			z_priority = 5.0
			rot_angle = 90.0
		}
		children = [
			{
				props = {
					local_id = NewElement2
					type = ContainerElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (184.43924, -506.3804)
					z_priority = 6.0
					scale = (0.75, 0.75)
				}
				children = [
					{
						props = {
							local_id = tube5
							type = ContainerElement
							dims = (10.0, 10.0)
							just = [
								0.0
								1.0
							]
							pos = (2.233441, 236.53152)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = star_bulb_0
									material = 0x00000000
									local_id = tube
									type = SpriteElement
									dims = (128.0, 64.0)
									just = [
										0.0
										1.0
									]
									pos = (22.414919, 71.19337)
									z_priority = 6.0
									scale = (0.6, 0.6)
									rot_angle = -90.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = glow
									type = SpriteElement
									dims = (26.4, 52.8)
									just = [
										0.0
										1.0
									]
									pos = (3.930105, 53.964428)
									z_priority = 7.0
									rot_angle = 180.0
								}
							}
						]
					}
					{
						props = {
							local_id = tube4
							type = ContainerElement
							dims = (10.0, 10.0)
							just = [
								0.0
								1.0
							]
							pos = (30.475304, 234.36385)
							z_priority = 6.0
						}
						children = [
							{
								props = {
									texture = star_bulb_0
									material = 0x00000000
									local_id = tube
									type = SpriteElement
									dims = (128.0, 64.0)
									just = [
										0.0
										1.0
									]
									pos = (18.55838, 83.754364)
									z_priority = 2.0
									scale = (0.7, 0.7)
									rot_angle = -90.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = glow
									type = SpriteElement
									dims = (31.200006, 62.400005)
									just = [
										0.0
										1.0
									]
									pos = (-2.91312, 64.82871)
									z_priority = 8.0
									rot_angle = 180.0
								}
							}
						]
					}
					{
						props = {
							local_id = tube3
							type = ContainerElement
							dims = (10.0, 10.0)
							just = [
								0.0
								1.0
							]
							pos = (59.194473, 230.8056)
							z_priority = 7.0
						}
						children = [
							{
								props = {
									texture = star_bulb_0
									material = 0x00000000
									local_id = tube
									type = SpriteElement
									dims = (128.0, 64.0)
									just = [
										0.0
										1.0
									]
									pos = (17.619373, 96.059616)
									z_priority = 5.0
									scale = (0.8, 0.8)
									rot_angle = -90.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									flip_v = false
									local_id = glow
									type = SpriteElement
									dims = (36.0, 72.0)
									just = [
										0.0
										1.0
									]
									pos = (-5.389091, 73.41113)
									z_priority = 9.0
									rot_angle = 180.0
								}
							}
						]
					}
					{
						props = {
							texture = star_light_seat
							local_id = star_light_seat
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-3.413072, 259.3677)
							z_priority = 15.0
							scale = (1.2, 1.2)
							rot_angle = -90.0
						}
					}
				]
			}
			{
				props = {
					local_id = NewElement1
					type = ContainerElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (246.66153, -552.0472)
					z_priority = 6.0
				}
				children = [
					{
						props = {
							local_id = tube2
							type = ContainerElement
							dims = (10.0, 10.0)
							just = [
								0.0
								1.0
							]
							pos = (2.233441, 236.53152)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = star_bulb_0
									material = 0x00000000
									local_id = tube
									type = SpriteElement
									dims = (128.0, 64.0)
									just = [
										0.0
										1.0
									]
									pos = (22.414919, 71.19337)
									z_priority = 6.0
									scale = (0.6, 0.6)
									rot_angle = -90.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = glow
									type = SpriteElement
									dims = (26.4, 52.8)
									just = [
										0.0
										1.0
									]
									pos = (3.930105, 53.964428)
									z_priority = 7.0
									rot_angle = 180.0
								}
							}
						]
					}
					{
						props = {
							local_id = tube1
							type = ContainerElement
							dims = (10.0, 10.0)
							just = [
								0.0
								1.0
							]
							pos = (30.475304, 234.36385)
							z_priority = 6.0
						}
						children = [
							{
								props = {
									texture = star_bulb_0
									material = 0x00000000
									local_id = tube
									type = SpriteElement
									dims = (128.0, 64.0)
									just = [
										0.0
										1.0
									]
									pos = (18.55838, 83.754364)
									z_priority = 2.0
									scale = (0.7, 0.7)
									rot_angle = -90.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									local_id = glow
									type = SpriteElement
									dims = (31.200006, 62.400005)
									just = [
										0.0
										1.0
									]
									pos = (-2.91312, 64.82871)
									z_priority = 8.0
									rot_angle = 180.0
								}
							}
						]
					}
					{
						props = {
							local_id = tube0
							type = ContainerElement
							dims = (10.0, 10.0)
							just = [
								0.0
								1.0
							]
							pos = (59.194473, 230.8056)
							z_priority = 7.0
						}
						children = [
							{
								props = {
									texture = star_bulb_0
									material = 0x00000000
									local_id = tube
									type = SpriteElement
									dims = (128.0, 64.0)
									just = [
										0.0
										1.0
									]
									pos = (17.619373, 96.059616)
									z_priority = 5.0
									scale = (0.8, 0.8)
									rot_angle = -90.0
								}
							}
							{
								props = {
									texture = HUD_rock_tube_glow_full
									flip_v = false
									local_id = glow
									type = SpriteElement
									dims = (36.0, 72.0)
									just = [
										0.0
										1.0
									]
									pos = (-5.389091, 73.41113)
									z_priority = 9.0
									rot_angle = 180.0
								}
							}
						]
					}
					{
						props = {
							texture = star_light_seat
							local_id = star_light_seat
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-3.413072, 259.3677)
							z_priority = 15.0
							scale = (1.2, 1.2)
							rot_angle = -90.0
						}
					}
				]
			}
		]
	}
}
uidesc_star_power_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
