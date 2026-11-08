uidesc_menu_item = {
	DescVersion = 1
	name = uidesc_menu_item
	rect = [
		0.0
		0.0
		370.0
		50.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = item_container
				}
				{
					index = 1
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = alias_text
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = item_container
				}
			]
			name = item_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = item_container
				}
				{
					index = 1
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = item_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = item_container
				}
				{
					index = 1
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = text_internal_just
			target = internal_just
			type = array_just
		}
		{
			path = [
				{
					validateLocalID = item_container
				}
				{
					index = 1
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = text_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = item_container
				}
				{
					index = 1
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = item_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = item_container
				}
				{
					index = 1
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = text_pos
			target = pos
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = item_container
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (370.0, 50.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 0.0
			scale = (1.0, 1.0)
			rot_angle = 0.0
			rgba = [
				255
				255
				255
				255
			]
			events_blocked = 0
			preserve_local_orientation = false
			tags = {
				text_offset = (36.0, 0.0)
				arrow_offset = (60.0, 0.0)
				extras_offset = (16.0, 0.0)
				option_arrows_callback = nullscript
				cas_offset = (0.0, 0.0)
				just = [
					left
					top
				]
				rgba = [
					100
					88
					71
					255
				]
				extra_rgba = [
					100
					88
					71
					255
				]
				scrolling_option = 13
			}
		}
		children = [
			{
				props = {
					local_id = highlight_container
					type = ContainerElement
					hiddenLocal = true
					alpha = 0.0
					dims = (0.0, 0.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
			}
			{
				props = {
					local_id = text
					type = TextBlockElement
					dims = (370.0, 50.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 10.0
					rgba = [
						100
						88
						71
						255
					]
					text = qs("CHECK IT OUT!")
					font = fontgrid_text_a6
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						-1.0
						0.0
					]
				}
			}
		]
	}
}
uidesc_menu_item_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
