uidesc_menu_frontend = {
	DescVersion = 1
	name = uidesc_menu_frontend
	rect = [
		0.0
		0.0
		500.0
		500.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = scrolling_menu
				}
				{
					index = 0
					validateLocalID = menu
					includeParentOwned = false
				}
			]
			name = alias_menu
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = scrolling_menu
				}
				{
					index = 0
					validateLocalID = menu
					includeParentOwned = false
				}
			]
			name = menu_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = scrolling_menu
				}
			]
			name = menu_dims
			target = dims
			type = pair
		}
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = scrolling_menu
			type = ScrollingMenu
			hiddenLocal = false
			alpha = 1.0
			dims = (500.0, 500.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 1.0
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
			isVertical = true
			adjust_visibility = true
			center_selection = false
		}
		children = [
			{
				props = {
					local_id = menu
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (500.0, 500.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 2.0
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
					isVertical = true
					internal_just = [
						-1.0
						-1.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = 0
					position_children = true
					tags = {
						color_scheme = {
							title_color = [
								175
								175
								175
								255
							]
							text_color = [
								100
								88
								71
								255
							]
							text_focus_color = [
								189
								96
								4
								255
							]
						}
						extra_z = 0
						scroll_bar_offset = (0.0, 0.0)
						menu_pos = (200.0, 175.0)
						selection_width = 400
						selection_height = 50
						tag_selected_id = 0xacafcf2c
						tag_selected_index = 0
						tag_selected_childs_grid_index = -1
					}
				}
			}
			{
				props = {
					local_id = menu_item
					type = DescInterface
					hiddenLocal = true
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
					z_priority = 2.0
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
					desc = 'menu_item'
					autoSizeDims = true
					item_dims = (370.0, 50.0)
					text_internal_just = [
						-1.0
						0.0
					]
					text_rgba = [
						100
						88
						71
						255
					]
					item_text = qs("Check it out!")
				}
			}
		]
	}
}
uidesc_menu_frontend_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
}
