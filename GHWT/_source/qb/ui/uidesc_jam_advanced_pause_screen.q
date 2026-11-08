uidesc_jam_advanced_pause_screen = {
	DescVersion = 3
	name = uidesc_jam_advanced_pause_screen
	rect = [
		-828.80695
		-270.01755
		2000.0
		1665.2983
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
					index = 2
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
					index = 5
					validateLocalID = inst_icon
					includeParentOwned = false
				}
			]
			name = inst_icon_texture
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
			just = [
				-1.0
				-1.0
			]
			pos = (-8.920431, -12.6534)
			z_priority = 30.0
		}
		children = [
			{
				props = {
					texture = bands_menu
					local_id = background
					type = SpriteElement
					dims = (310.0, 512.0)
					just = [
						-1.0
						-1.0
					]
					pos = (2.000015, 0.20451899)
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
							hiddenLocal = true
							dims = (26.0, 256.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (64.26215, -297.0652)
							z_priority = 31.0
						}
					}
					{
						props = {
							texture = bands_chain
							flip_v = true
							local_id = chain
							type = SpriteElement
							hiddenLocal = true
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
							hiddenLocal = true
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
							pos = (0.957611, -150.87183)
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
					pos = (62.435165, 58.631836)
					z_priority = 31.0
					rgba = [
						192
						192
						192
						255
					]
					text = qs("PAUSE")
					font = fontgrid_text_a8
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
					local_id = snap_window
					type = ContainerElement
					hiddenLocal = true
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (38.825134, 38.16742)
					z_priority = 30.0
					scale = (1.3, 1.0)
				}
				children = [
					{
						props = {
							texture = window_h_top
							local_id = window_h_top
							type = SpriteElement
							hiddenLocal = true
							dims = (210.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (54.448875, -19.8031)
							z_priority = 30.0
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
							texture = window_h_mid
							local_id = window_h_mid
							type = SpriteElement
							hiddenLocal = true
							dims = (210.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (54.33301, 202.42598)
							z_priority = 30.0
							scale = (1.0, 3.0)
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
							texture = window_h_bottom
							local_id = window_h_bottom
							type = SpriteElement
							hiddenLocal = true
							dims = (210.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (54.515594, 407.75195)
							z_priority = 30.0
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
							local_id = NewElement2
							type = SpriteElement
							hiddenLocal = true
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (55.6044, -8.499969)
							z_priority = 31.0
							scale = (1.7, 0.4)
							rgba = [
								136
								149
								149
								255
							]
						}
					}
					{
						props = {
							local_id = NewElement3
							type = SpriteElement
							hiddenLocal = true
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (55.659336, 224.69415)
							z_priority = 31.0
							scale = (1.7, 4.1)
							rgba = [
								0
								0
								40
								255
							]
						}
					}
					{
						props = {
							local_id = shadow
							type = SpriteElement
							hiddenLocal = true
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (56.129116, 196.89894)
							z_priority = 29.0
							scale = (1.8299999, 4.9)
							rgba = [
								0
								0
								0
								100
							]
						}
					}
				]
			}
			{
				props = {
					local_id = NewElement1
					type = SpriteElement
					hiddenLocal = true
					alpha = 0.8
					dims = (2000.0, 1000.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (130.11346, 192.6358)
					z_priority = 20.0
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
					texture = theme_guitar
					local_id = inst_icon
					type = SpriteElement
					alpha = 0.8
					dims = (128.0, 512.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (55.123737, 282.86606)
					z_priority = 32.0
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
}
uidesc_jam_advanced_pause_screen_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			4
		]
	}
	EditMaterialForm = {
	}
}
