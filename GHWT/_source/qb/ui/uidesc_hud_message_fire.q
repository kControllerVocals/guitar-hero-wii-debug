uidesc_hud_message_fire = {
	DescVersion = 5
	name = uidesc_hud_message_fire
	rect = [
		-150.0
		-300.0
		300.0
		400.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = flame_tree
				}
				{
					index = 0
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = flame_container
					includeParentOwned = false
				}
			]
			name = alias_flame_container
		}
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = flame_tree
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				0.0
				1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = window
					type = WindowElement
					hiddenLocal = false
					alpha = 1.0
					dims = (300.0, 300.0)
					just = [
						0.0
						1.0
					]
					pos_anchor = [
						0.0
						1.0
					]
					pos = (0.0, 0.0)
					z_priority = 3.0
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
							local_id = flame_container
							type = ContainerElement
							dims = (300.0, 100.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (0.0, 100.0)
							z_priority = 4.0
						}
						children = [
							{
								props = {
									material = fire_2D_Notestreak_Small
									local_id = Fire2dsmall
									type = SpriteElement
									dims = (200.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 0.001
								}
							}
							{
								props = {
									material = fire_2D_Starpower
									local_id = Fire2dstarpower
									type = SpriteElement
									dims = (200.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 0.001
								}
							}
						]
					}
				]
			}
		]
	}
}
uidesc_hud_message_fire_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
