uidesc_p2_select_controller = {
	DescVersion = 8
	name = uidesc_p2_select_controller
	rect = [
		0.0
		-11.666672
		650.0
		661.6666
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = msc_container
				}
				{
					index = 2
					validateLocalID = arrows
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = arrow_up
					includeParentOwned = false
				}
			]
			name = alias_arrow_up
		}
		{
			path = [
				{
					validateLocalID = msc_container
				}
				{
					index = 2
					validateLocalID = arrows
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = arrow_down
					includeParentOwned = false
				}
			]
			name = alias_arrow_down
		}
		{
			path = [
				{
					validateLocalID = msc_container
				}
				{
					index = 0
					validateLocalID = players
					includeParentOwned = false
				}
			]
			name = alias_players
		}
		{
			path = [
				{
					validateLocalID = msc_container
				}
				{
					index = 1
					validateLocalID = all_controllers
					includeParentOwned = false
				}
			]
			name = alias_all_controllers
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = msc_container
				}
				{
					index = 0
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = p1_controller
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = ready
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = ready_banner
					includeParentOwned = false
				}
			]
			name = ready_banner_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = msc_container
				}
				{
					index = 0
					validateLocalID = players
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = p2_controller
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = ready
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = ready_banner
					includeParentOwned = false
				}
			]
			name = ready_banner_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = msc_container
			type = ContainerElement
			dims = (650.0, 650.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 1.0
		}
		children = [
			{
				props = {
					local_id = players
					type = ContainerElement
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
							local_id = p1_controller
							type = ContainerElement
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-175.11116, -190.66667)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									local_id = ready
									type = ContainerElement
									alpha = 0.0
									dims = (0.0, 0.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, -50.0)
									z_priority = 70.0
								}
								children = [
									{
										props = {
											texture = ready_banner
											local_id = ready_banner
											type = SpriteElement
											dims = (128.0, 128.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 71.0
											scale = (1.5, 1.5)
										}
									}
								]
							}
						]
					}
					{
						props = {
							local_id = p2_controller
							type = ContainerElement
							pos_anchor = [
								0.0
								0.0
							]
							pos = (175.1112, 95.11105)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									local_id = ready
									type = ContainerElement
									alpha = 0.0
									dims = (0.0, 0.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, -50.0)
									z_priority = 70.0
								}
								children = [
									{
										props = {
											texture = ready_banner
											local_id = ready_banner
											type = SpriteElement
											dims = (128.0, 128.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 71.0
											scale = (1.5, 1.5)
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
					local_id = all_controllers
					type = ContainerElement
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-61.79445, 27.818573)
					z_priority = 2.0
				}
				children = [
					{
						props = {
							texture = drum_controller
							local_id = drum_controller_01
							type = SpriteElement
							dims = (60.0, 200.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-50.0, -130.19044)
							z_priority = 3.0
						}
					}
					{
						props = {
							texture = guitar_controller
							local_id = guitar_controller_02
							type = SpriteElement
							dims = (60.0, 200.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (20.0, -132.12234)
							z_priority = 3.0
						}
					}
					{
						props = {
							texture = vocal_controller
							local_id = vocal_controller_02
							type = SpriteElement
							dims = (60.0, 200.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (90.0, -136.54242)
							z_priority = 3.0
						}
					}
					{
						props = {
							texture = guitar_controller
							local_id = guitar_controller_03
							type = SpriteElement
							dims = (60.0, 200.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (160.79115, -127.99256)
							z_priority = 3.0
						}
					}
				]
			}
			{
				props = {
					local_id = arrows
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (111.111115, 95.55554)
					z_priority = 2.0
				}
				children = [
					{
						props = {
							texture = controller_2p_arrow
							blend = blend
							flip_h = false
							flip_v = false
							local_id = arrow_up
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 128.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-220.0, -400.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = -45.0
							rgba = [
								240
								140
								80
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							tags = {
								old_pos = (450.0, 270.0)
							}
						}
					}
					{
						props = {
							texture = controller_2p_arrow
							blend = blend
							flip_h = true
							flip_v = true
							local_id = arrow_down
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 128.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								1.0
								1.0
							]
							pos = (10.0, -50.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = -45.0
							rgba = [
								130
								90
								205
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							tags = {
								old_pos = (680.0, 420.0)
							}
						}
					}
				]
			}
		]
	}
}
uidesc_p2_select_controller_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
