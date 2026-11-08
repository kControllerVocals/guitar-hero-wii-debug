uidesc_hud_gamertag = {
	DescVersion = 1
	name = uidesc_hud_gamertag
	rect = [
		-137.5
		-40.0
		275.0
		80.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = gamertag
				}
				{
					index = 1
					validateLocalID = gamertag_name
					includeParentOwned = false
				}
			]
			name = gamertag_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = gamertag
				}
				{
					index = 0
					validateLocalID = gamertag_bg
					includeParentOwned = false
				}
			]
			name = gamertag_bg_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = gamertag
				}
				{
					index = 2
					validateLocalID = speaker
					includeParentOwned = false
				}
			]
			name = headset_icon_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = gamertag
				}
			]
			name = GamerTag_scale
			visiblename = 'GamerTag_scale'
			help = 'GamerTag => scale'
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = gamertag
				}
			]
			name = GamerTag_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = gamertag
			type = ContainerElement
			dims = (100.0, 80.0)
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
			z_priority = 1.0
		}
		children = [
			{
				props = {
					texture = gamertag
					local_id = gamertag_bg
					type = SpriteElement
					alpha = 0.75
					dims = (275.0, 72.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 2.0
				}
			}
			{
				props = {
					local_id = gamertag_name
					type = TextBlockElement
					dims = (198.0, 32.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-2.334946, 0.685928)
					z_priority = 3.0
					text = qs("WWMWWMWWWMQWWWW")
					font = fontgrid_text_a3
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.5, 0.5)
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					texture = speaker
					local_id = speaker
					type = SpriteElement
					dims = (24.0, 24.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-114.35938, 1.8992)
					z_priority = 4.0
				}
			}
		]
	}
}
uidesc_hud_gamertag_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
