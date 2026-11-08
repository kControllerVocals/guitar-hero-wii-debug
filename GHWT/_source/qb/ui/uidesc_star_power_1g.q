uidesc_star_power_1g = {
	DescVersion = 4
	name = uidesc_star_power_1g
	rect = [
		16.683039
		-7.7627444
		698.07117
		339.4754
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
					local_id = NewElement1
					type = ContainerElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (246.66148, -552.0472)
					z_priority = 6.0
				}
				children = [
					{
						props = {
							local_id = tube2
							type = ContainerElement
							dims = (4.0, 4.0)
							just = [
								0.0
								1.0
							]
							pos = (-8.8776865, -60.02404)
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
									pos = (33.526047, 366.74896)
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
									hiddenLocal = true
									dims = (24.0, 48.0)
									just = [
										0.0
										1.0
									]
									pos = (15.041233, 349.52)
									z_priority = 7.0
									scale = (1.1, 1.1)
									rot_angle = 180.0
								}
							}
						]
					}
					{
						props = {
							local_id = tube1
							type = ContainerElement
							dims = (4.0, 4.0)
							just = [
								0.0
								1.0
							]
							pos = (-16.191345, -32.227768)
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
									pos = (65.22503, 350.42105)
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
									hiddenLocal = true
									dims = (24.0, 48.0)
									just = [
										0.0
										1.0
									]
									pos = (43.753532, 331.4954)
									z_priority = 8.0
									scale = (1.3, 1.3)
									rot_angle = 180.0
								}
							}
						]
					}
					{
						props = {
							local_id = tube0
							type = ContainerElement
							dims = (4.0, 4.0)
							just = [
								0.0
								1.0
							]
							pos = (-71.91667, -46.341618)
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
									pos = (148.73051, 378.28186)
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
									hiddenLocal = true
									dims = (24.0, 48.0)
									just = [
										0.0
										1.0
									]
									pos = (125.72205, 355.6334)
									z_priority = 9.0
									scale = (1.5, 1.5)
									rot_angle = 180.0
								}
							}
						]
					}
					{
						props = {
							texture = star_light_seat_1g
							material = 0x00000000
							local_id = star_light_seat
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-3.413072, 259.36774)
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
uidesc_star_power_1g_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
