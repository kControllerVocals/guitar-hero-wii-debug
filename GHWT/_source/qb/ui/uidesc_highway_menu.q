uidesc_highway_menu = {
	DescVersion = 1
	name = uidesc_highway_menu
	rect = [
		-38.35284
		0.0
		450.0627
		521.7965
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = highway_menu_item
				}
				{
					index = 2
					validateLocalID = highway_menu_item_smenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = highway_menu_item_vmenu
					includeParentOwned = false
				}
			]
			name = alias_highway_menu_item_vmenu
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = highway_menu_item
				}
				{
					index = 1
					validateLocalID = highway_menu_item_highway
					includeParentOwned = false
				}
			]
			name = highway_menu_item_highway_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = highway_menu_item
			type = ContainerElement
			dims = (375.0, 500.0)
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
					texture = patch_cutup
					local_id = highway_menu_item_bg
					type = SpriteElement
					dims = (450.0, 225.0)
					just = [
						0.0
						1.0
					]
					pos_anchor = [
						0.0
						1.0
					]
					pos = (-0.852844, 21.796541)
					z_priority = 5.0
				}
			}
			{
				props = {
					texture = hw_axel
					local_id = highway_menu_item_highway
					type = SpriteElement
					dims = (320.0, 320.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						0.0
						-1.0
					]
					pos = (-6.883118, 0.0)
					z_priority = 5.0
				}
			}
			{
				props = {
					local_id = highway_menu_item_smenu
					type = ScrollingMenu
					hiddenLocal = false
					alpha = 1.0
					dims = (375.0, 180.0)
					just = [
						0.0
						1.0
					]
					pos_anchor = [
						0.0
						1.0
					]
					pos = (36.70987, 1.147217)
					z_priority = 5.0
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
					center_selection = true
				}
				children = [
					{
						props = {
							local_id = highway_menu_item_vmenu
							type = MenuElement
							dims = (375.0, 180.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-4.5887446, -1.147217)
							z_priority = 6.0
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
					}
				]
			}
		]
	}
}
uidesc_highway_menu_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
