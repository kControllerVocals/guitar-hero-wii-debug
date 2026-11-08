uidesc_cash_reward2_row = {
	DescVersion = 1
	name = uidesc_cash_reward2_row
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
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 2
					validateLocalID = reward
					includeParentOwned = false
				}
			]
			name = reward_text
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
						64
						64
						255
					]
				}
			}
			{
				props = {
					local_id = label
					type = TextBlockElement
					dims = (600.0, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-70.0, 10.0)
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
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = reward
					type = TextBlockElement
					dims = (300.0, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (220.0, 15.0)
					z_priority = 2.0
					text = qs("$55")
					font = fontgrid_title_a1
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
		]
	}
}
uidesc_cash_reward2_row_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
