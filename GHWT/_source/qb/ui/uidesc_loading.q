uidesc_loading = {
	DescVersion = 1
	name = uidesc_loading
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
					validateLocalID = loading_container
				}
				{
					index = 0
					validateLocalID = loading
					includeParentOwned = false
				}
			]
			name = loading_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = loading_container
				}
				{
					index = 1
					validateLocalID = tip
					includeParentOwned = false
				}
			]
			name = tip_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = loading_container
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
					local_id = loading
					type = TextBlockElement
					alpha = 0.75
					dims = (350.0, 30.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-256.16388, 272.87088)
					z_priority = 1.0
					rgba = [
						0
						0
						0
						255
					]
					text = qs("LOADING...")
					font = fontgrid_text_a8
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						0.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = tip
					type = TextBlockElement
					dims = (400.0, 200.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-460.0, -140.0)
					z_priority = 50001.0
					rgba = [
						128
						64
						64
						255
					]
					text = qs("\L")
					font = fontgrid_text_a6
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.6, 0.6)
					shadow_offs = (3.0, 3.0)
					line_spacing = 0.8
				}
			}
		]
	}
}
uidesc_loading_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
