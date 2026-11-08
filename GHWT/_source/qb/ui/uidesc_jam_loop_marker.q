uidesc_jam_loop_marker = {
	DescVersion = 2
	name = uidesc_jam_loop_marker
	rect = [
		0.0
		-2.941505
		156.45798
		102.94151
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = loop_marker
				}
				{
					index = 1
					validateLocalID = looptext
					includeParentOwned = false
				}
			]
			name = loop_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = loop_marker
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 15.0
		}
		children = [
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
					pos = (15.657969, -2.941505)
					z_priority = 15.0
					scale = (0.55, 0.7)
				}
			}
			{
				props = {
					local_id = looptext
					type = TextBlockElement
					dims = (140.0, 35.0)
					just = [
						-1.0
						-1.0
					]
					pos = (32.468555, 10.299767)
					z_priority = 17.0
					scale = (0.785764, 0.785764)
					rgba = [
						0
						0
						0
						255
					]
					text = qs("Loop Start")
					font = fontgrid_text_a3
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
			{
				props = {
					local_id = NewElement2
					type = SpriteElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (37.03441, -25.034351)
					z_priority = 16.0
					scale = (1.15, 0.24000001)
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
uidesc_jam_loop_marker_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
