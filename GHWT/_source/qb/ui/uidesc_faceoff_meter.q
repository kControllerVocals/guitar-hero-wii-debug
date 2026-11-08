uidesc_faceoff_meter = {
	DescVersion = 2
	name = uidesc_faceoff_meter
	rect = [
		0.0
		0.0
		512.0
		512.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = faceoff_meter
				}
				{
					index = 0
					validateLocalID = frame
					includeParentOwned = false
				}
				{
					index = 3
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
					validateLocalID = faceoff_meter
				}
				{
					index = 0
					validateLocalID = frame
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = bg_1
					includeParentOwned = false
				}
			]
			name = bg_1_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = faceoff_meter
				}
				{
					index = 0
					validateLocalID = frame
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = bg_2
					includeParentOwned = false
				}
			]
			name = bg_2_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = faceoff_meter
				}
				{
					index = 0
					validateLocalID = frame
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = crystal_1
					includeParentOwned = false
				}
			]
			name = crystal_1_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = faceoff_meter
				}
				{
					index = 0
					validateLocalID = frame
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = crystal_2
					includeParentOwned = false
				}
			]
			name = crystal_2_alpha
			target = alpha
			type = float
		}
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = faceoff_meter
			type = ContainerElement
			dims = (0.0, 0.0)
			pos = (0.0, 0.0)
			z_priority = 2.0
		}
		children = [
			{
				props = {
					texture = HUD_2p_c_rock_frame
					flip_h = false
					flip_v = false
					local_id = frame
					type = SpriteElement
					dims = (512.0, 512.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 20.0
				}
				children = [
					{
						props = {
							texture = HUD_2p_c_rock_BG_p1
							flip_h = false
							flip_v = false
							local_id = bg_1
							type = SpriteElement
							dims = (512.0, 256.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 16.0
						}
					}
					{
						props = {
							texture = HUD_2p_c_rock_BG_p2
							flip_h = false
							flip_v = false
							local_id = bg_2
							type = SpriteElement
							dims = (512.0, 256.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 16.0
						}
					}
					{
						props = {
							texture = HUD_2p_c_rock_BG_off
							flip_h = false
							flip_v = false
							local_id = bg_off
							type = SpriteElement
							dims = (512.0, 256.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 15.0
						}
					}
					{
						props = {
							texture = HUD_rock_needle
							flip_h = false
							flip_v = false
							local_id = needle
							type = SpriteElement
							dims = (32.0, 200.0)
							just = [
								0.5
								0.75
							]
							pos = (264.0, 290.0)
							z_priority = 19.0
						}
					}
					{
						props = {
							texture = HUD_2p_c_rock_crystal_p1
							flip_h = false
							flip_v = false
							local_id = crystal_1
							type = SpriteElement
							dims = (256.0, 256.0)
							just = [
								-1.0
								-1.0
							]
							pos = (128.0, 128.0)
							z_priority = 21.0
						}
					}
					{
						props = {
							texture = HUD_2p_c_rock_crystal_p2
							flip_h = false
							flip_v = false
							local_id = crystal_2
							type = SpriteElement
							dims = (256.0, 256.0)
							just = [
								-1.0
								-1.0
							]
							pos = (128.0, 128.0)
							z_priority = 21.0
						}
					}
					{
						props = {
							texture = HUD_2p_c_rock_crystal_off
							flip_h = false
							flip_v = false
							local_id = crystal_off
							type = SpriteElement
							dims = (256.0, 256.0)
							just = [
								-1.0
								-1.0
							]
							pos = (128.0, 128.0)
							z_priority = 20.0
						}
					}
				]
			}
		]
	}
}
uidesc_faceoff_meter_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
}
