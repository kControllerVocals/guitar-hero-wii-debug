uidesc_cash_reward2_title_row = {
	DescVersion = 2
	name = uidesc_cash_reward2_title_row
	rect = [
		-400.0
		0.0
		800.0
		100.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 1
					validateLocalID = label
					includeParentOwned = false
				}
			]
			name = label_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = root
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				0.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = background
					type = SpriteElement
					dims = (800.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
					rgba = [
						64
						0
						0
						255
					]
				}
			}
			{
				props = {
					local_id = label
					type = TextBlockElement
					dims = (800.0, 80.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 10.0)
					z_priority = 2.0
					rgba = [
						224
						224
						224
						255
					]
					text = qs("GUITAR")
					font = fontgrid_title_a1
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
		]
	}
}
uidesc_cash_reward2_title_row_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
