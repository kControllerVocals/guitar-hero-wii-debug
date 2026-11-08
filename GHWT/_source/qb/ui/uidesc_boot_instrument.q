uidesc_boot_instrument = {
	DescVersion = 1
	name = uidesc_boot_instrument
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = boot_container
				}
				{
					index = 1
					validateLocalID = background
					includeParentOwned = false
				}
			]
			name = background_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = boot_container
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
					local_id = fill
					type = SpriteElement
					dims = (1280.0, 720.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
					rgba = [
						0
						0
						0
						255
					]
				}
			}
			{
				props = {
					local_id = background
					type = SpriteElement
					dims = (1280.0, 720.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 2.0
				}
			}
		]
	}
}
uidesc_boot_instrument_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
