uidesc_generic_list_menu_item = {
	DescVersion = 3
	name = uidesc_generic_list_menu_item
	rect = [
		-27.7529
		-3.441551
		448.5453
		64.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = generic_list_menu_item
				}
				{
					index = 0
					validateLocalID = generic_list_menu_item_text
					includeParentOwned = false
				}
			]
			name = generic_list_menu_item_text_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu_item
				}
				{
					index = 0
					validateLocalID = generic_list_menu_item_text
					includeParentOwned = false
				}
			]
			name = generic_list_menu_item_text_font
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu_item
				}
				{
					index = 0
					validateLocalID = generic_list_menu_item_text
					includeParentOwned = false
				}
			]
			name = generic_list_menu_item_text_material
			target = material
			type = checksum_material
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu_item
				}
				{
					index = 0
					validateLocalID = generic_list_menu_item_text
					includeParentOwned = false
				}
			]
			name = generic_list_menu_item_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu_item
				}
				{
					index = 0
					validateLocalID = generic_list_menu_item_text
					includeParentOwned = false
				}
			]
			name = generic_list_menu_item_text_text_case
			target = text_case
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu_item
				}
				{
					index = 1
					validateLocalID = generic_list_menu_item_price
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = generic_list_menu_item_price_text
					includeParentOwned = false
				}
			]
			name = generic_list_menu_item_price_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu_item
				}
				{
					index = 1
					validateLocalID = generic_list_menu_item_price
					includeParentOwned = false
				}
			]
			name = generic_list_menu_item_price_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = generic_list_menu_item
				}
				{
					index = 2
					validateLocalID = generic_list_menu_item_editable
					includeParentOwned = false
				}
			]
			name = generic_list_menu_item_editable_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = generic_list_menu_item
			type = ContainerElement
			dims = (300.0, 40.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = generic_list_menu_item_text
					type = TextBlockElement
					dims = (300.0, 30.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 8.0)
					z_priority = 5.0
					rgba = [
						100
						88
						71
						255
					]
					text = qs("Enter Text Here")
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
					local_id = generic_list_menu_item_price
					type = ContainerElement
					alpha = 0.0
					dims = (100.0, 50.0)
					just = [
						-1.0
						-1.0
					]
					pos = (292.7924, -3.441551)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = pricetag
							material = 0x00000000
							local_id = generic_list_menu_item_price_bg
							type = SpriteElement
							dims = (128.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
						}
					}
					{
						props = {
							local_id = generic_list_menu_item_price_text
							type = TextBlockElement
							dims = (83.0, 32.0)
							just = [
								-1.0
								1.0
							]
							pos_anchor = [
								-1.0
								1.0
							]
							pos = (41.2, -4.2)
							z_priority = 3.0
							rgba = [
								100
								88
								71
								255
							]
							text = qs("Free")
							font = fontgrid_text_a6
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
				]
			}
			{
				props = {
					texture = Colorwheel_Tiny
					local_id = generic_list_menu_item_editable
					type = SpriteElement
					alpha = 0.0
					dims = (32.0, 32.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-164.7529, 1.147177)
					z_priority = 1.0
				}
			}
		]
	}
}
uidesc_generic_list_menu_item_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
