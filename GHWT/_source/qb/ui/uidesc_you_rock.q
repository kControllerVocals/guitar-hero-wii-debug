uidesc_you_rock = {
	DescVersion = 1
	name = uidesc_you_rock
	rect = [
		-85.99997
		-135.99997
		1412.0
		997.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = you_rock_master
				}
				{
					index = 0
					validateLocalID = hand_of_god_1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = highlight_sparkle_glow
					includeParentOwned = false
				}
			]
			name = alias_highlight_sparkle_glow
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = you_rock_master
				}
				{
					index = 0
					validateLocalID = hand_of_god_1
					includeParentOwned = false
				}
			]
			name = hand_of_god_1_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = you_rock_master
				}
				{
					index = 1
					validateLocalID = hand_of_god_2
					includeParentOwned = false
				}
			]
			name = hand_of_god_2_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = you_rock_master
				}
				{
					index = 0
					validateLocalID = hand_of_god_1
					includeParentOwned = false
				}
			]
			name = hand_of_god_1_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = you_rock_master
				}
				{
					index = 1
					validateLocalID = hand_of_god_2
					includeParentOwned = false
				}
			]
			name = hand_of_god_2_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = you_rock_master
				}
				{
					index = 1
					validateLocalID = hand_of_god_2
					includeParentOwned = false
				}
			]
			name = hand_of_god_2_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = you_rock_master
				}
				{
					index = 0
					validateLocalID = hand_of_god_1
					includeParentOwned = false
				}
			]
			name = hand_of_god_1_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = you_rock_master
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
					texture = hand_of_god_1
					local_id = hand_of_god_1
					type = SpriteElement
					dims = (512.0, 512.0)
					just = [
						0.78
						-0.7
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (629.6799, -419.19998)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = highlight_sparkle_glow
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 256.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (19.788816, 409.8182)
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
							desc = 'highlight_sparkle_glow'
							autoSizeDims = true
							highlight_glow_rot_angle = 0.0
							highlight_glow_alpha = 0.4
							highlight_sparkle_rot_angle = 0.0
							highlight_sparkle_alpha = 0.6
							highlight_glow_dims = (256.0, 256.0)
							highlight_sparkle_dims = (256.0, 256.0)
						}
					}
				]
			}
			{
				props = {
					texture = hand_of_god_2
					local_id = hand_of_god_2
					type = SpriteElement
					dims = (512.0, 512.0)
					just = [
						-0.84000003
						0.5
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-685.04, 373.0)
					z_priority = 2.0
				}
			}
		]
	}
}
uidesc_you_rock_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
