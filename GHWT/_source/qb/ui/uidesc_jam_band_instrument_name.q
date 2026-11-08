uidesc_jam_band_instrument_name = {
	DescVersion = 3
	name = uidesc_jam_band_instrument_name
	rect = [
		-115.29293
		-84.60596
		259.29294
		239.60596
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
					validateLocalID = NewElement1
				}
				{
					index = 2
					validateLocalID = extra_info
					includeParentOwned = false
				}
			]
			name = extra_info_text
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
					validateLocalID = box
					includeParentOwned = false
				}
			]
			name = box_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 3
					validateLocalID = percussion
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = led
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = glow
					includeParentOwned = false
				}
			]
			name = glow_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 3
					validateLocalID = percussion
					includeParentOwned = false
				}
			]
			name = percussion_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 3
					validateLocalID = percussion
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = led
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = percussion
					includeParentOwned = false
				}
			]
			name = percussion_text
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
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					texture = slot_boarder_no
					local_id = box
					type = SpriteElement
					dims = (210.0, 150.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-3.504456, 5.2477717)
					z_priority = 1.0
					rgba = [
						235
						235
						235
						255
					]
				}
			}
			{
				props = {
					local_id = instrument_name
					type = TextBlockElement
					dims = (170.0, 40.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-3.9314582, -30.42271)
					z_priority = 2.0
					rgba = [
						220
						220
						220
						255
					]
					text = qs("RHYTHM")
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
					local_id = extra_info
					type = TextBlockElement
					dims = (185.0, 30.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-3.9314582, -6.1792297)
					z_priority = 2.0
					rgba = [
						220
						220
						220
						255
					]
					text = qs("Modern Rock")
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
					local_id = percussion
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (94.0, 105.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = mixer_bulb
							local_id = led
							type = SpriteElement
							dims = (20.0, 20.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-178.91217, -82.192955)
							z_priority = 4.0
						}
						children = [
							{
								props = {
									texture = mixer_glow_64
									local_id = glow
									type = SpriteElement
									alpha = 0.55
									dims = (40.0, 40.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-1.245636, 0.99996895)
									z_priority = 5.0
									rgba = [
										0
										255
										0
										255
									]
								}
							}
							{
								props = {
									local_id = percussion
									type = TextBlockElement
									dims = (165.0, 26.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (95.10361, 1.0839231)
									z_priority = 2.0
									rgba = [
										220
										220
										220
										255
									]
									text = qs("Percussion Off")
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
						]
					}
					{
						props = {
							local_id = line
							type = SpriteElement
							dims = (195.0, 1.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-102.75903, -96.21974)
							z_priority = 2.0
							rgba = [
								128
								128
								128
								255
							]
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
					pos = (-86.492935, -55.805954)
					z_priority = 2.0
					scale = (0.9, 0.9)
				}
			}
		]
	}
}
uidesc_jam_band_instrument_name_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
