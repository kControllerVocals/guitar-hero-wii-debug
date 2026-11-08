uidesc_gig_board_handslapper = {
	DescVersion = 2
	name = uidesc_gig_board_handslapper
	rect = [
		0.0
		-12.0
		1280.0
		859.0355
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = handslapper_master
				}
				{
					index = 0
					validateLocalID = handslapper
					includeParentOwned = false
				}
			]
			name = handslapper_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = handslapper_master
				}
				{
					index = 0
					validateLocalID = handslapper
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = fireburst
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = fireburst_03
					includeParentOwned = false
				}
			]
			name = fireburst_03_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = handslapper_master
				}
				{
					index = 0
					validateLocalID = handslapper
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = fireburst
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = fireburst_03
					includeParentOwned = false
				}
			]
			name = fireburst_03_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = handslapper_master
				}
				{
					index = 0
					validateLocalID = handslapper
					includeParentOwned = false
				}
			]
			name = handslapper_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = handslapper_master
				}
				{
					index = 0
					validateLocalID = handslapper
					includeParentOwned = false
				}
			]
			name = handslapper_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = handslapper_master
				}
				{
					index = 0
					validateLocalID = handslapper
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = fireburst
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = fireburst_01
					includeParentOwned = false
				}
			]
			name = fireburst_01_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = handslapper_master
				}
				{
					index = 0
					validateLocalID = handslapper
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = fireburst
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = fireburst_02
					includeParentOwned = false
				}
			]
			name = fireburst_02_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = handslapper_master
				}
				{
					index = 0
					validateLocalID = handslapper
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = fireburst
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = fireburst_03
					includeParentOwned = false
				}
			]
			name = fireburst_03_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = handslapper_master
				}
				{
					index = 0
					validateLocalID = handslapper
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = arm
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = handslapper_closed
					includeParentOwned = false
				}
			]
			name = handslapper_closed_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = handslapper_master
				}
				{
					index = 0
					validateLocalID = handslapper
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = arm
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = handslapper_open
					includeParentOwned = false
				}
			]
			name = handslapper_open_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = handslapper_master
				}
				{
					index = 0
					validateLocalID = handslapper
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = arm
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = handslapper_sleeve
					includeParentOwned = false
				}
			]
			name = handslapper_sleeve_rot
			target = rot_angle
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = handslapper_master
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
					local_id = handslapper
					type = ContainerElement
					dims = (100.0, 100.0)
					pos = (640.0, 360.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = fireburst
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -180.0)
							z_priority = 2.0
							scale = (1.5, 1.5)
						}
						children = [
							{
								props = {
									texture = fireburst_01
									blend = Add
									local_id = fireburst_01
									type = SpriteElement
									dims = (256.0, 256.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
								children = [
									{
										props = {
											texture = fireburst_01
											local_id = fireburst_01
											type = SpriteElement
											alpha = 0.5
											dims = (256.0, 256.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 3.0
										}
									}
								]
							}
							{
								props = {
									texture = fireburst_02
									blend = Add
									local_id = fireburst_02
									type = SpriteElement
									dims = (256.0, 256.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 4.0
								}
								children = [
									{
										props = {
											texture = fireburst_02
											local_id = fireburst_02
											type = SpriteElement
											alpha = 0.5
											dims = (256.0, 256.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 4.0
										}
									}
								]
							}
							{
								props = {
									texture = fireburst_03
									blend = Add
									local_id = fireburst_03
									type = SpriteElement
									dims = (256.0, 256.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
								children = [
									{
										props = {
											texture = fireburst_03
											local_id = fireburst_03
											type = SpriteElement
											alpha = 0.5
											dims = (256.0, 256.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 3.0
										}
									}
								]
							}
						]
					}
					{
						props = {
							local_id = arm
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-10.0, 0.0)
							z_priority = 5.0
						}
						children = [
							{
								props = {
									texture = hand_slapper_closed
									local_id = handslapper_closed
									type = SpriteElement
									dims = (256.0, 256.0)
									just = [
										0.4
										0.7
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (51.2, 89.6)
									z_priority = 6.0
								}
							}
							{
								props = {
									texture = hand_slapper_open
									local_id = handslapper_open
									type = SpriteElement
									dims = (256.0, 256.0)
									just = [
										0.4
										0.7
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (51.2, 89.6)
									z_priority = 6.0
								}
							}
							{
								props = {
									texture = hand_slapper_sleeve
									local_id = handslapper_sleeve
									type = SpriteElement
									dims = (256.0, 512.0)
									just = [
										-0.2
										-0.55
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (48.762634, 90.235466)
									z_priority = 7.0
								}
							}
						]
					}
				]
			}
		]
	}
}
uidesc_gig_board_handslapper_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			3
			5
			7
		]
	}
	EditMaterialForm = {
	}
}
