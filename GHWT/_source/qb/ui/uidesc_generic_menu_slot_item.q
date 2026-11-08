uidesc_generic_menu_slot_item = {
	DescVersion = 1
	name = uidesc_generic_menu_slot_item
	rect = [
		-7.5
		-7.5
		390.0
		115.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = slot_container
				}
				{
					index = 1
					validateLocalID = slot_text
					includeParentOwned = false
				}
			]
			name = slot_text_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = slot_container
				}
				{
					index = 1
					validateLocalID = slot_text
					includeParentOwned = false
				}
			]
			name = slot_text_font
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = slot_container
				}
				{
					index = 1
					validateLocalID = slot_text
					includeParentOwned = false
				}
			]
			name = slot_text_material
			target = material
			type = checksum_material
		}
		{
			path = [
				{
					validateLocalID = slot_container
				}
				{
					index = 1
					validateLocalID = slot_text
					includeParentOwned = false
				}
			]
			name = slot_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = slot_container
				}
				{
					index = 0
					validateLocalID = slot_bg
					includeParentOwned = false
				}
			]
			name = slot_bg_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = slot_container
			type = ContainerElement
			dims = (375.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					texture = slot_boarder_no
					material = 0x00000000
					local_id = slot_bg
					type = SpriteElement
					dims = (390.0, 115.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
			}
			{
				props = {
					local_id = slot_text
					type = TextBlockElement
					dims = (325.0, 75.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 4.0)
					z_priority = 2.0
					rgba = [
						100
						88
						71
						255
					]
					text = qs("Placeholder")
					font = fontgrid_text_a6
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.6, 0.6)
					shadow_offs = (3.0, 3.0)
				}
			}
		]
	}
}
uidesc_generic_menu_slot_item_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
