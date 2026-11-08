uidesc_jam_band_pause_screen = {
	DescVersion = 3
	name = uidesc_jam_band_pause_screen
	rect = [
		0.0
		-169.06519
		300.89944
		1576.9995
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
					index = 1
					validateLocalID = player_number
					includeParentOwned = false
				}
			]
			name = player_number_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = background
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = inst_icon
					includeParentOwned = false
				}
			]
			name = inst_icon_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 3
					validateLocalID = pause_header
					includeParentOwned = false
				}
			]
			name = pause_header_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 4
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
			local_id = NewElement1
			type = ContainerElement
			dims = (100.0, 100.0)
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
					texture = bands_menu
					local_id = background
					type = SpriteElement
					dims = (285.0, 512.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 30.0
					rgba = [
						192
						192
						192
						255
					]
				}
				children = [
					{
						props = {
							texture = bands_chain
							local_id = chain
							type = SpriteElement
							dims = (26.0, 256.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (64.2623, -297.0652)
							z_priority = 31.0
						}
					}
					{
						props = {
							texture = bands_chain
							flip_v = true
							local_id = chain
							type = SpriteElement
							dims = (26.0, 256.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-61.79497, -293.7495)
							z_priority = 31.0
						}
					}
					{
						props = {
							texture = theme_guitar
							local_id = inst_icon
							type = SpriteElement
							alpha = 0.8
							dims = (128.0, 512.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-42.691513, 43.369854)
							z_priority = 31.0
							scale = (0.9, 0.9)
							rgba = [
								75
								75
								75
								255
							]
						}
						children = [
							{
								props = {
									texture = theme_bass
									local_id = inst_icon
									type = SpriteElement
									hiddenLocal = true
									alpha = 0.8
									dims = (128.0, 512.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-43.691513, 43.369854)
									z_priority = 31.0
									scale = (0.9, 0.9)
									rgba = [
										75
										75
										75
										255
									]
								}
							}
							{
								props = {
									texture = theme_drum
									local_id = inst_icon
									type = SpriteElement
									hiddenLocal = true
									alpha = 0.8
									dims = (128.0, 512.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-43.691513, 43.369854)
									z_priority = 31.0
									scale = (0.9, 0.9)
									rgba = [
										75
										75
										75
										255
									]
								}
							}
							{
								props = {
									texture = theme_vocal
									local_id = inst_icon
									type = SpriteElement
									hiddenLocal = true
									alpha = 0.8
									dims = (128.0, 512.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-43.691513, 43.369854)
									z_priority = 31.0
									scale = (0.9, 0.9)
									rgba = [
										75
										75
										75
										255
									]
								}
							}
						]
					}
					{
						props = {
							local_id = line
							type = SpriteElement
							hiddenLocal = true
							dims = (200.0, 1.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.957611, -150.87152)
							z_priority = 51.0
							rgba = [
								64
								64
								64
								255
							]
						}
					}
				]
			}
			{
				props = {
					local_id = player_number
					type = TextBlockElement
					dims = (120.0, 38.0)
					just = [
						-1.0
						-1.0
					]
					pos = (83.435165, 9.631836)
					z_priority = 31.0
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
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = unfocus_cont
					type = ContainerElement
					hiddenLocal = true
					dims = (100.0, 100.0)
					pos = (250.89948, 1357.9343)
					z_priority = 53.0
				}
			}
			{
				props = {
					local_id = pause_header
					type = TextBlockElement
					dims = (190.0, 40.0)
					just = [
						-1.0
						-1.0
					]
					pos = (48.435165, 57.631836)
					z_priority = 31.0
					rgba = [
						192
						192
						192
						255
					]
					text = qs("pause")
					font = fontgrid_text_a3
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					texture = leader_indicator
					local_id = band_leader
					type = SpriteElement
					alpha = 0.0
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (27.66575, -22.603302)
					z_priority = 60.0
					scale = (0.9, 0.9)
				}
			}
		]
	}
}
uidesc_jam_band_pause_screen_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
