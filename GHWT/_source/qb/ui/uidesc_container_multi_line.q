uidesc_container_multi_line = {
	DescVersion = 1
	name = uidesc_container_multi_line
	rect = [
		-810.9127
		-329.67987
		1638.2507
		411.8634
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
			local_id = ticker_multi
			type = ContainerElement
			dims = (100.0, 100.0)
			pos_anchor = [
				0.0
				0.0
			]
			pos = (100.0, 32.183567)
			z_priority = 2.0
		}
		children = [
			{
				props = {
					texture = scrolling_multilines
					local_id = scrollbar_bg
					type = SpriteElement
					alpha = 0.5
					dims = (1030.0, 256.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-86.29888, -222.34341)
					z_priority = 1.0
					scale = (1.09, 1.09)
				}
			}
			{
				props = {
					texture = scrolling_bar_chain
					local_id = scrollbar_chain_L
					type = SpriteElement
					alpha = 0.5
					dims = (256.0, 32.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-763.7127, -255.25299)
					z_priority = 2.0
					scale = (1.15, 1.15)
				}
			}
			{
				props = {
					texture = scrolling_bar_chain
					flip_v = true
					local_id = scrollbar_chain_R
					type = SpriteElement
					alpha = 0.5
					dims = (256.0, 32.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (580.13806, -253.9462)
					z_priority = 2.0
					scale = (1.15, 1.15)
				}
			}
		]
	}
}
uidesc_container_multi_line_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
