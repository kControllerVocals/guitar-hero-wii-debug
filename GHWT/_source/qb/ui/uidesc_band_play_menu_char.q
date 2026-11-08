uidesc_band_play_menu_char = {
	DescVersion = 1
	name = uidesc_band_play_menu_char
	rect = [
		-17.5
		-17.5
		110.0
		110.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = band_play_menu_char
				}
				{
					index = 1
					validateLocalID = band_play_menu_char_icon
					includeParentOwned = false
				}
			]
			name = band_play_menu_char_icon_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = band_play_menu_char
				}
			]
			name = band_play_menu_char_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = band_play_menu_char
				}
			]
			name = band_play_menu_char_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = band_play_menu_char
				}
				{
					index = 0
					validateLocalID = band_play_menu_char_highlight
					includeParentOwned = false
				}
			]
			name = band_play_menu_char_highlight_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = band_play_menu_char
			type = ContainerElement
			dims = (75.0, 75.0)
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
					texture = char_highlight_patch
					local_id = band_play_menu_char_highlight
					type = SpriteElement
					alpha = 0.0
					dims = (110.0, 110.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
			}
			{
				props = {
					local_id = band_play_menu_char_icon
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (1.252045, 0.0)
					z_priority = 2.0
				}
			}
		]
	}
}
uidesc_band_play_menu_char_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
