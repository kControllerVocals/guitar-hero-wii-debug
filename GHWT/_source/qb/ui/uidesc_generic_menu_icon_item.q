uidesc_generic_menu_icon_item = {
	DescVersion = 2
	name = uidesc_generic_menu_icon_item
	rect = [
		0.0
		0.0
		375.0
		70.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_iconitem
				}
				{
					index = 0
					validateLocalID = generic_menu_smenu_iconitem_text
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_iconitem_text_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_iconitem
				}
				{
					index = 0
					validateLocalID = generic_menu_smenu_iconitem_text
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_iconitem_text_font
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_iconitem
				}
				{
					index = 0
					validateLocalID = generic_menu_smenu_iconitem_text
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_iconitem_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_iconitem
				}
				{
					index = 1
					validateLocalID = generic_menu_smenu_iconitem_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = generic_menu_smenu_iconitem_highlight
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_iconitem_highlight_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_iconitem
				}
				{
					index = 1
					validateLocalID = generic_menu_smenu_iconitem_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_menu_smenu_iconitem_icon
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_iconitem_icon_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_iconitem
				}
				{
					index = 1
					validateLocalID = generic_menu_smenu_iconitem_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_menu_smenu_iconitem_icon
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_iconitem_icon_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_iconitem
				}
				{
					index = 0
					validateLocalID = generic_menu_smenu_iconitem_text
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_iconitem_text_material
			target = material
			type = checksum_material
		}
		{
			path = [
				{
					validateLocalID = generic_menu_smenu_iconitem
				}
				{
					index = 0
					validateLocalID = generic_menu_smenu_iconitem_text
					includeParentOwned = false
				}
			]
			name = generic_menu_smenu_iconitem_text_textcase
			target = text_case
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = generic_menu_smenu_iconitem
			type = ContainerElement
			dims = (375.0, 70.0)
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
					local_id = generic_menu_smenu_iconitem_text
					type = TextBlockElement
					dims = (260.0, 35.0)
					just = [
						-1.0
						0.0
					]
					pos = (75.07008, 41.44661)
					z_priority = 3.0
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
					local_id = generic_menu_smenu_iconitem_container
					type = ContainerElement
					dims = (70.0, 70.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 4.0
				}
				children = [
					{
						props = {
							texture = generic_icon_highlight
							material = 0x00000000
							local_id = generic_menu_smenu_iconitem_highlight
							type = SpriteElement
							alpha = 0.0
							dims = (70.0, 70.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 4.0
						}
					}
					{
						props = {
							texture = menu_history_unknown
							material = 0x00000000
							local_id = generic_menu_smenu_iconitem_icon
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 4.5
						}
					}
				]
			}
		]
	}
}
uidesc_generic_menu_icon_item_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
