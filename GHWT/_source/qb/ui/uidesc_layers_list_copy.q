uidesc_layers_list_copy = {
	DescVersion = 2
	name = uidesc_layers_list_copy
	rect = [
		-282.0
		-6.000004
		548.0
		64.00001
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = layer_copy_indicator
				}
				{
					index = 0
					validateLocalID = layer_copy_indicator_right
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = layer_copy_indicator_right_flash
					includeParentOwned = false
				}
			]
			name = layer_copy_indicator_right_flash_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = layer_copy_indicator
				}
				{
					index = 1
					validateLocalID = layer_copy_indicator_left
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = layer_copy_indicator_left_flash
					includeParentOwned = false
				}
			]
			name = layer_copy_indicator_left_flash_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = layer_copy_indicator
			type = ContainerElement
			dims = (0.0, 0.0)
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
			z_priority = 5.0
		}
		children = [
			{
				props = {
					texture = copy_indicator
					material = 0x00000000
					local_id = layer_copy_indicator_right
					type = SpriteElement
					dims = (128.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (202.0, 26.0)
					z_priority = 6.0
				}
				children = [
					{
						props = {
							texture = copy_indicator_flash
							local_id = layer_copy_indicator_right_flash
							type = SpriteElement
							alpha = 0.0
							dims = (128.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 6.0
						}
					}
				]
			}
			{
				props = {
					texture = copy_indicator
					material = 0x00000000
					local_id = layer_copy_indicator_left
					type = SpriteElement
					dims = (128.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-218.0, 26.0)
					z_priority = 6.0
					rot_angle = 180.0
				}
				children = [
					{
						props = {
							texture = copy_indicator_flash
							local_id = layer_copy_indicator_left_flash
							type = SpriteElement
							alpha = 0.0
							dims = (128.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 6.0
						}
					}
				]
			}
		]
	}
}
uidesc_layers_list_copy_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
