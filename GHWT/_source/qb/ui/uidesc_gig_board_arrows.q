uidesc_gig_board_arrows = {
	DescVersion = 1
	name = uidesc_gig_board_arrows
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = gig_board_arrows
				}
				{
					index = 0
					validateLocalID = gig_board_arrow_left
					includeParentOwned = false
				}
			]
			name = gig_board_arrow_left_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = gig_board_arrows
				}
				{
					index = 1
					validateLocalID = gig_board_arrow_right
					includeParentOwned = false
				}
			]
			name = gig_board_arrow_right_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = gig_board_arrows
				}
				{
					index = 1
					validateLocalID = gig_board_arrow_right
					includeParentOwned = false
				}
			]
			name = gig_board_arrow_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = gig_board_arrows
				}
				{
					index = 0
					validateLocalID = gig_board_arrow_left
					includeParentOwned = false
				}
			]
			name = gig_board_arrow_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = gig_board_arrows
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					material = 0x00000000
					texture = 0x00000000
					flip_v = true
					flip_h = false
					local_id = gig_board_arrow_left
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-480.6637, -257.65802)
					z_priority = 2.0
					rot_angle = 90.0
				}
			}
			{
				props = {
					material = 0x00000000
					flip_h = false
					flip_v = false
					texture = 0x00000000
					local_id = gig_board_arrow_right
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (480.0, 255.0)
					z_priority = 2.0
					rot_angle = -90.0
				}
			}
		]
	}
}
uidesc_gig_board_arrows_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
