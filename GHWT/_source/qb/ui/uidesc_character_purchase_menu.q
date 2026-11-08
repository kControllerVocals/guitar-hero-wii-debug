uidesc_character_purchase_menu = {
	DescVersion = 2
	name = uidesc_character_purchase_menu
	rect = [
		104.783676
		91.49373
		425.324
		337.467
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 1
					validateLocalID = character_purchase_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_purchase_menu_yes
					includeParentOwned = false
				}
			]
			name = alias_character_purchase_menu_yes
		}
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 1
					validateLocalID = character_purchase_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_purchase_menu_no
					includeParentOwned = false
				}
			]
			name = alias_character_purchase_menu_no
		}
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 1
					validateLocalID = character_purchase_menu
					includeParentOwned = false
				}
			]
			name = alias_character_purchase_menu
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 2
					validateLocalID = character_purchase_price
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_purchase_price_text
					includeParentOwned = false
				}
			]
			name = character_purchase_price_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 1
					validateLocalID = character_purchase_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_purchase_menu_yes
					includeParentOwned = false
				}
			]
			name = character_purchase_menu_yes_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 1
					validateLocalID = character_purchase_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_purchase_menu_no
					includeParentOwned = false
				}
			]
			name = character_purchase_menu_no_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 1
					validateLocalID = character_purchase_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_purchase_menu_yes
					includeParentOwned = false
				}
			]
			name = character_purchase_menu_yes_font
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 1
					validateLocalID = character_purchase_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_purchase_menu_yes
					includeParentOwned = false
				}
			]
			name = character_purchase_menu_yes_material
			target = material
			type = checksum_material
		}
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 1
					validateLocalID = character_purchase_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_purchase_menu_no
					includeParentOwned = false
				}
			]
			name = character_purchase_menu_no_font
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 1
					validateLocalID = character_purchase_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_purchase_menu_no
					includeParentOwned = false
				}
			]
			name = character_purchase_menu_no_material
			target = material
			type = checksum_material
		}
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 0
					validateLocalID = character_purchase_dialogue
					includeParentOwned = false
				}
			]
			name = character_purchase_dialogue_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = character_purchase
				}
				{
					index = 1
					validateLocalID = character_purchase_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_purchase_menu_yes
					includeParentOwned = false
				}
			]
			name = character_purchase_menu_yes_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = character_purchase
			type = ContainerElement
			dims = (300.0, 200.0)
			just = [
				-1.0
				-1.0
			]
			pos = (180.10773, 178.96077)
			z_priority = 2.0
		}
		children = [
			{
				props = {
					local_id = character_purchase_dialogue
					type = TextBlockElement
					dims = (300.0, 120.0)
					just = [
						-1.0
						-1.0
					]
					pos = (1.147182, 1.1472471)
					z_priority = 4.0
					rgba = [
						100
						88
						71
						255
					]
					text = qs("Would you like to buy this character?")
					font = fontgrid_title_a1
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = character_purchase_menu
					type = MenuElement
					dims = (300.0, 50.0)
					just = [
						-1.0
						1.0
					]
					pos_anchor = [
						-1.0
						1.0
					]
					pos = (0.0, 2.294405)
					z_priority = 4.0
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
					spacing_between = 3
					fit_major = `fit content if larger`
					fit_minor = `keep dims`
					scale_mode = proportional
					allow_alternate_directional_events = true
				}
				children = [
					{
						props = {
							local_id = character_purchase_menu_yes
							type = TextBlockElement
							dims = (150.0, 50.0)
							pos = (74.25742, 25.0)
							z_priority = 4.0
							scale = (0.99009895, 0.99009895)
							rgba = [
								100
								88
								71
								255
							]
							text = qs("Yes")
							font = fontgrid_title_a1
							fit_width = wrap
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
							local_id = character_purchase_menu_no
							type = TextBlockElement
							dims = (150.0, 50.0)
							pos = (225.74254, 25.0)
							z_priority = 4.0
							scale = (0.99009895, 0.99009895)
							rgba = [
								100
								88
								71
								255
							]
							text = qs("No")
							font = fontgrid_title_a1
							fit_width = wrap
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
				]
			}
			{
				props = {
					local_id = character_purchase_price
					type = ContainerElement
					dims = (100.0, 50.0)
					just = [
						-1.0
						-1.0
					]
					pos = (98.91818, 105.54092)
					z_priority = 4.0
				}
				children = [
					{
						props = {
							texture = pricetag
							material = 0x00000000
							local_id = character_purchase_price_bg
							type = SpriteElement
							dims = (128.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 5.0
						}
					}
					{
						props = {
							local_id = character_purchase_price_text
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
							pos = (40.1671, -3.857987)
							z_priority = 6.0
							rgba = [
								100
								88
								71
								255
							]
							text = qs("Free")
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
				]
			}
			{
				props = {
					texture = helper_bg
					local_id = character_purchase_bg
					type = SpriteElement
					dims = (400.0, 300.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 3.0
				}
			}
			{
				props = {
					texture = helper_skull
					local_id = character_purchase_skull
					type = SpriteElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-175.32405, -137.46704)
					z_priority = 4.0
				}
			}
		]
	}
}
uidesc_character_purchase_menu_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
