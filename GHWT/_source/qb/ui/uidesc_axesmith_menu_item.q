uidesc_Axesmith_menu_item = {
	DescVersion = 1
	name = uidesc_Axesmith_menu_item
	rect = [
		0.0
		0.0
		375.0
		187.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = AxeSmith_Menu_Item
				}
				{
					index = 0
					validateLocalID = AxeSmith_Menu_Item_img
					includeParentOwned = false
				}
			]
			name = AxeSmith_Menu_Item_img_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = AxeSmith_Menu_Item
			type = ContainerElement
			dims = (375.0, 187.0)
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
					texture = guitar_axesmith
					material = 0x00000000
					local_id = AxeSmith_Menu_Item_img
					type = SpriteElement
					dims = (256.0, 256.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 30.0)
					z_priority = 5.0
					scale = (1.2, 1.2)
					rot_angle = -5.0
				}
			}
		]
	}
}
uidesc_Axesmith_menu_item_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
