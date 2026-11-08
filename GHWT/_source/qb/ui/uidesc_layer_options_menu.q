uidesc_layer_options_menu = {
	DescVersion = 1
	name = uidesc_layer_options_menu
	rect = [
		468.554
		227.82191
		258.0
		256.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = layer_options_menu
				}
				{
					index = 1
					validateLocalID = layer_options_vmenu
					includeParentOwned = false
				}
			]
			name = alias_layer_options_vmenu
		}
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = layer_options_menu
			type = ContainerElement
			dims = (256.0, 256.0)
			pos = (596.554, 355.82187)
		}
		children = [
			{
				props = {
					texture = edit_menu
					material = 0x00000000
					local_id = layer_options_bg
					type = SpriteElement
					dims = (256.0, 256.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 2.0
				}
			}
			{
				props = {
					local_id = layer_options_vmenu
					type = MenuElement
					dims = (230.0, 200.0)
					just = [
						-1.0
						-1.0
					]
					pos = (28.0, 29.151463)
					z_priority = 1.0
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
			}
		]
	}
}
uidesc_layer_options_menu_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
