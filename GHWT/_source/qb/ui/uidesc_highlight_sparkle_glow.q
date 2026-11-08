uidesc_highlight_sparkle_glow = {
	DescVersion = 1
	name = uidesc_highlight_sparkle_glow
	rect = [
		512.0
		193.0
		256.0
		256.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = highlight_sparkle_glow_cont
				}
			]
			name = alias_highlight_sparkle_glow_cont
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = highlight_sparkle_glow_cont
				}
				{
					index = 0
					validateLocalID = highlight_glow
					includeParentOwned = false
				}
			]
			name = highlight_glow_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = highlight_sparkle_glow_cont
				}
				{
					index = 0
					validateLocalID = highlight_glow
					includeParentOwned = false
				}
			]
			name = highlight_glow_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = highlight_sparkle_glow_cont
				}
				{
					index = 1
					validateLocalID = highlight_sparkle
					includeParentOwned = false
				}
			]
			name = highlight_sparkle_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = highlight_sparkle_glow_cont
				}
				{
					index = 1
					validateLocalID = highlight_sparkle
					includeParentOwned = false
				}
			]
			name = highlight_sparkle_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = highlight_sparkle_glow_cont
				}
				{
					index = 0
					validateLocalID = highlight_glow
					includeParentOwned = false
				}
			]
			name = highlight_glow_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = highlight_sparkle_glow_cont
				}
				{
					index = 1
					validateLocalID = highlight_sparkle
					includeParentOwned = false
				}
			]
			name = highlight_sparkle_dims
			target = dims
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = highlight_sparkle_glow_cont
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (640.0, 300.0)
		}
		children = [
			{
				props = {
					texture = character_mug_highlight_glow
					material = 0x00000000
					blend = Add
					local_id = highlight_glow
					type = SpriteElement
					alpha = 0.4
					dims = (256.0, 256.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 21.0)
					rgba = [
						255
						128
						0
						255
					]
				}
			}
			{
				props = {
					material = 0x00000000
					texture = character_mug_highlight_sparkle
					blend = Add
					local_id = highlight_sparkle
					type = SpriteElement
					alpha = 0.6
					dims = (256.0, 256.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 21.0)
				}
			}
		]
	}
}
uidesc_highlight_sparkle_glow_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
