uidesc_character_selection_item = {
	DescVersion = 3
	name = uidesc_character_selection_item
	rect = [
		0.0
		-77.47822
		508.3239
		587.2715
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 0
					validateLocalID = character_selection_item_text
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = character_selection_item_bio
					includeParentOwned = false
				}
			]
			name = alias_character_selection_item_bio
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 0
					validateLocalID = character_selection_item_text
					includeParentOwned = false
				}
			]
			name = character_selection_item_text_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 1
					validateLocalID = character_selection_item_icon
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_selection_item_icon_icon
					includeParentOwned = false
				}
			]
			name = character_selection_item_icon_icon_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 0
					validateLocalID = character_selection_item_text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_selection_item_title
					includeParentOwned = false
				}
			]
			name = character_selection_item_title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 0
					validateLocalID = character_selection_item_text
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_selection_item_name
					includeParentOwned = false
				}
			]
			name = character_selection_item_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 0
					validateLocalID = character_selection_item_text
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = character_selection_item_bio
					includeParentOwned = false
				}
			]
			name = character_selection_item_bio_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 1
					validateLocalID = character_selection_item_icon
					includeParentOwned = false
				}
			]
			name = character_selection_item_icon_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 1
					validateLocalID = character_selection_item_icon
					includeParentOwned = false
				}
			]
			name = character_selection_item_icon_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 0
					validateLocalID = character_selection_item_text
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_selection_item_name
					includeParentOwned = false
				}
			]
			name = character_selection_item_name_material
			target = material
			type = checksum_material
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 0
					validateLocalID = character_selection_item_text
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_selection_item_name
					includeParentOwned = false
				}
			]
			name = character_selection_item_name_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 0
					validateLocalID = character_selection_item_text
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_selection_item_name
					includeParentOwned = false
				}
			]
			name = character_selection_item_name_font
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 1
					validateLocalID = character_selection_item_icon
					includeParentOwned = false
				}
			]
			name = character_selection_item_icon_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 1
					validateLocalID = character_selection_item_icon
					includeParentOwned = false
				}
			]
			name = character_selection_item_icon_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 2
					validateLocalID = character_selection_item_price
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_selection_item_price_text
					includeParentOwned = false
				}
			]
			name = character_selection_item_price_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 2
					validateLocalID = character_selection_item_price
					includeParentOwned = false
				}
			]
			name = character_selection_item_price_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = character_selection_item
				}
				{
					index = 0
					validateLocalID = character_selection_item_text
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = character_selection_item_bio
					includeParentOwned = false
				}
			]
			name = character_selection_item_bio_pos
			target = pos
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = character_selection_item
			type = ContainerElement
			dims = (64.0, 64.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 1.0
		}
		children = [
			{
				props = {
					local_id = character_selection_item_text
					type = ContainerElement
					alpha = 0.0
					dims = (250.0, 575.0)
					just = [
						-1.0
						-1.0
					]
					pos = (78.7401, -65.20673)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = character_selection_item_title
							type = TextBlockElement
							dims = (340.0, 50.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-28.596458, -12.2714815)
							z_priority = 52.0
							text = qs("Select Your Rocker")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `clip bottom lines`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
						}
					}
					{
						props = {
							local_id = character_selection_item_name
							type = TextBlockElement
							dims = (340.0, 50.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-0.5393369, 68.749985)
							z_priority = 52.0
							text = qs("New Rocker")
							font = fontgrid_title_A2
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
						}
					}
					{
						props = {
							local_id = character_selection_item_bio
							type = TextBlockElement
							dims = (332.0, 400.0)
							just = [
								-1.0
								-1.0
							]
							pos = (2.0, 144.0)
							z_priority = 2.0
							rgba = [
								120
								110
								95
								255
							]
							text = qs("Create your own rocker to show these posers how its done!")
							font = fontgrid_text_a3
							fit_width = wrap
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_scale = (0.6, 0.6)
						}
					}
				]
			}
			{
				props = {
					local_id = character_selection_item_icon
					type = ContainerElement
					alpha = 0.5
					dims = (64.0, 64.0)
					pos = (32.0, 32.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = character_mug_placeholder
							material = 0x00000000
							local_id = character_selection_item_icon_icon
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 50.0
						}
					}
				]
			}
			{
				props = {
					local_id = character_selection_item_price
					type = ContainerElement
					alpha = 0.0
					dims = (100.0, 50.0)
					just = [
						-1.0
						-1.0
					]
					pos = (380.3239, 40.151417)
					z_priority = 50.0
				}
				children = [
					{
						props = {
							texture = pricetag
							material = 0x00000000
							local_id = character_selection_item_price_bg
							type = SpriteElement
							dims = (128.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 55.0
						}
					}
					{
						props = {
							local_id = character_selection_item_price_text
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
							pos = (38.808765, -4.574655)
							z_priority = 56.0
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
		]
	}
}
uidesc_character_selection_item_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
