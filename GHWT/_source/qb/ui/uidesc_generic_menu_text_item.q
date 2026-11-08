uidesc_generic_menu_text_item = {
	DescVersion = 1
	name = uidesc_generic_menu_text_item
	rect = [
		0.0
		0.0
		375.0
		40.02585
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_textitem
				}
				{
					index = 0
					validateLocalID = generic_menu_smenu_textitem_text
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_textitem_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_textitem
				}
				{
					index = 0
					validateLocalID = generic_menu_smenu_textitem_text
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_textitem_text_font
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_textitem
				}
				{
					index = 0
					validateLocalID = generic_menu_smenu_textitem_text
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_textitem_text_material
			target = material
			type = checksum_material
		}
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_textitem
				}
				{
					index = 0
					validateLocalID = generic_menu_smenu_textitem_text
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_textitem_text_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_textitem
				}
				{
					index = 0
					validateLocalID = generic_menu_smenu_textitem_text
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_textitem_text_textcase
			target = text_case
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = generic_menu_smenu_textitem
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
					local_id = generic_menu_smenu_textitem_text
					type = TextBlockElement
					dims = (325.0, 35.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-173.62239, 2.525847)
					z_priority = 5.0
					rgba = [
						100
						88
						71
						255
					]
					text = qs("new character")
					font = fontgrid_text_a6
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
		]
	}
}
uidesc_generic_menu_text_item_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
