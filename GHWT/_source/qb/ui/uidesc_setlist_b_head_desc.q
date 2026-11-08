uidesc_Setlist_B_head_desc = {
	DescVersion = 1
	name = uidesc_Setlist_B_head_desc
	rect = [
		-204.8
		-51.2
		409.6
		191.2
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = setlist_B_head_container
				}
				{
					index = 1
					validateLocalID = setlist_B_head_text
					includeParentOwned = false
				}
			]
			name = setlist_b_head_text_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = setlist_B_head_container
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				0.0
				0.0
			]
			pos = (-50.0, -50.0)
			z_priority = 1.0
		}
		children = [
			{
				props = {
					texture = setlist_B_head
					local_id = setlist_B_head
					type = SpriteElement
					dims = (512.0, 128.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 6.0
					scale = (0.8, 0.8)
					rgba = [
						224
						224
						224
						255
					]
				}
			}
			{
				props = {
					local_id = setlist_B_head_text
					type = TextBlockElement
					dims = (400.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 90.0)
					z_priority = 2.0
					rgba = [
						200
						192
						192
						255
					]
					text = qs("Setlist")
					font = fontgrid_text_a10
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.8, 0.8)
					font_spacing = 7
					use_shadow = true
					shadow_rgba = [
						0
						0
						0
						200
					]
				}
			}
		]
	}
}
uidesc_Setlist_B_head_desc_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
