uidesc_Band_vocal_multiplier = {
	DescVersion = 4
	name = uidesc_Band_vocal_multiplier
	rect = [
		-57.101124
		-11.24234
		551.5925
		152.37578
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = multiplier_number
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_HUD_score_2a
					includeParentOwned = false
				}
			]
			name = nixie_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = NewElement1
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (67.602066, 38.75766)
		}
		children = [
			{
				props = {
					local_id = multiplier_number
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-69.70319, 8.793129)
					z_priority = 1.0
					scale = (1.1, 1.1)
				}
				children = [
					{
						props = {
							texture = vocal_HUD_score_x
							material = 0x00000000
							local_id = band_HUD_score_x
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (425.1189, 55.24813)
							z_priority = 2.0
							scale = (0.8, 0.8)
						}
					}
					{
						props = {
							texture = vocal_HUD_score_x
							material = 0x00000000
							local_id = band_HUD_score_x
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (424.1189, 54.24813)
							scale = (0.8, 0.8)
							rgba = [
								0
								0
								0
								255
							]
						}
					}
					{
						props = {
							material = 0x00000000
							texture = band_HUD_score_2b
							local_id = band_HUD_score_2a
							type = SpriteElement
							alpha = 0.75
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (425.8477, 59.4751)
							z_priority = 2.0
							scale = (0.8, 0.8)
						}
					}
				]
			}
		]
	}
}
uidesc_Band_vocal_multiplier_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
