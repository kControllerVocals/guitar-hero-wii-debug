uidesc_jam_marker = {
	DescVersion = 3
	name = uidesc_jam_marker
	rect = [
		0.0
		-2.941505
		319.8579
		102.94151
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = jam_marker
				}
				{
					index = 0
					validateLocalID = marker
					includeParentOwned = false
				}
			]
			name = marker_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = jam_marker
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 18.0
		}
		children = [
			{
				props = {
					local_id = marker
					type = TextBlockElement
					dims = (250.0, 42.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						1.0
					]
					pos = (43.34234, -92.760254)
					z_priority = 17.0
					rgba = [
						0
						0
						0
						255
					]
					text = qs("")
					font = fontgrid_text_a3
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
					flip_v = false
					texture = window_h_top
					flip_h = false
					local_id = countin_top
					type = SpriteElement
					dims = (256.0, 64.0)
					just = [
						-1.0
						-1.0
					]
					pos = (12.657966, -2.941505)
					z_priority = 15.0
					scale = (1.2, 0.85)
				}
			}
			{
				props = {
					local_id = NewElement2
					type = SpriteElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (117.03437, -19.341227)
					z_priority = 16.0
					scale = (2.5, 0.33)
					rgba = [
						136
						149
						149
						255
					]
				}
			}
		]
	}
}
uidesc_jam_marker_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
