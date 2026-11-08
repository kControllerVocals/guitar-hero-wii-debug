uidesc_jam_player = {
	DescVersion = 3
	name = uidesc_jam_player
	rect = [
		-57.168823
		-192.56015
		266.1173
		447.94943
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = scroll_menu
				}
				{
					index = 3
					validateLocalID = player
					includeParentOwned = false
				}
			]
			name = player_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = scroll_menu
				}
				{
					index = 2
					validateLocalID = Menu_Player
					includeParentOwned = false
				}
			]
			name = Menu_Player_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = scroll_menu
				}
				{
					index = 1
					validateLocalID = instrument_name
					includeParentOwned = false
				}
			]
			name = instrument_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = scroll_menu
				}
				{
					index = 5
					validateLocalID = band_leader
					includeParentOwned = false
				}
			]
			name = band_leader_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = scroll_menu
			type = ContainerElement
			dims = (180.0, 250.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 30.0
		}
		children = [
			{
				props = {
					local_id = menu
					type = MenuElement
					dims = (125.0, 195.0)
					pos = (85.0, 112.59895)
					z_priority = 32.0
					internal_just = [
						0.0
						-1.0
					]
					spacing_between = 5
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
			}
			{
				props = {
					local_id = instrument_name
					type = TextBlockElement
					dims = (150.0, 50.0)
					just = [
						-1.0
						-1.0
					]
					pos = (10.840111, -35.62059)
					z_priority = 32.0
					rgba = [
						192
						192
						192
						255
					]
					text = qs("")
					font = fontgrid_text_a3
					fit_width = wrap
					fit_height = `clip bottom lines`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.7, 0.7)
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					texture = bands_menu
					local_id = Menu_Player
					type = SpriteElement
					dims = (190.0, 240.0)
					just = [
						0.0
						-1.0
					]
					pos = (85.44848, -56.610718)
					z_priority = 31.0
					scale = (1.3, 1.3)
				}
			}
			{
				props = {
					local_id = player
					type = TextBlockElement
					dims = (100.0, 30.0)
					just = [
						-1.0
						-1.0
					]
					pos = (37.963257, -54.829136)
					z_priority = 32.0
					rgba = [
						224
						224
						224
						255
					]
					text = qs("PLAYER 1")
					font = fontgrid_text_a10
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
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
					local_id = chains
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-97.16882, -134.24336)
					z_priority = 31.0
				}
				children = [
					{
						props = {
							texture = bands_chain
							local_id = NewElement3
							type = SpriteElement
							dims = (32.0, 200.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (147.2968, -83.31679)
							z_priority = 32.0
						}
					}
					{
						props = {
							texture = bands_chain
							flip_v = true
							local_id = NewElement3
							type = SpriteElement
							dims = (32.0, 200.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (38.90662, -82.002)
							z_priority = 32.0
						}
					}
				]
			}
			{
				props = {
					texture = leader_indicator
					local_id = band_leader
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-63.255455, -164.70297)
					z_priority = 32.0
					scale = (0.9, 0.9)
				}
			}
		]
	}
}
uidesc_jam_player_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
