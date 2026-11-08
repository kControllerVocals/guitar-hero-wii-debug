uidesc_layers_list_focus = {
	DescVersion = 1
	name = uidesc_layers_list_focus
	rect = [
		-22.943607
		-23.23805
		410.0
		100.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = layers_list_focus
				}
				{
					index = 0
					validateLocalID = layers_list_focus_text
					includeParentOwned = false
				}
			]
			name = layers_list_focus_text_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = layers_list_focus
				}
				{
					index = 0
					validateLocalID = layers_list_focus_text
					includeParentOwned = false
				}
			]
			name = layers_list_focus_text_font
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = layers_list_focus
				}
				{
					index = 0
					validateLocalID = layers_list_focus_text
					includeParentOwned = false
				}
			]
			name = layers_list_focus_text_material
			target = material
			type = checksum_material
		}
		{
			path = [
				{
					validateLocalID = layers_list_focus
				}
				{
					index = 0
					validateLocalID = layers_list_focus_text
					includeParentOwned = false
				}
			]
			name = layers_list_focus_text_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = layers_list_focus
			type = ContainerElement
			dims = (375.0, 40.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 3.0
		}
		children = [
			{
				props = {
					local_id = layers_list_focus_text
					type = TextBlockElement
					dims = (350.0, 35.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (1.377625, 2.525847)
					z_priority = 6.0
					rgba = [
						100
						88
						71
						255
					]
					text = qs("new character")
					font = fontgrid_title_A2
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					texture = highlight_patch
					local_id = layers_list_focus_bg
					type = SpriteElement
					dims = (410.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-22.943607, -23.23805)
					z_priority = 5.0
				}
			}
		]
	}
}
uidesc_layers_list_focus_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
