uidesc_helper_box_bg = {
	DescVersion = 1
	name = uidesc_helper_box_bg
	rect = [
		-54.04251
		-41.618465
		654.0425
		441.61847
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
			local_id = NewElement1
			type = ContainerElement
			dims = (600.0, 400.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					texture = helper_bg
					local_id = helper_bg
					type = SpriteElement
					dims = (600.0, 400.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
			}
			{
				props = {
					texture = helper_skull
					local_id = helper_skull
					type = SpriteElement
					dims = (128.0, 128.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-54.04251, -41.618465)
					z_priority = 2.0
				}
			}
		]
	}
}
uidesc_helper_box_bg_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
