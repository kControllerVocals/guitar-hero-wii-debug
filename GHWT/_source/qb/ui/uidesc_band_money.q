uidesc_band_money = {
	DescVersion = 2
	name = uidesc_band_money
	rect = [
		904.9357
		470.74078
		242.91315
		180.98515
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = band_money
				}
				{
					index = 1
					validateLocalID = cash_available_bg
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = cash_available_value
					includeParentOwned = false
				}
			]
			name = cash_available_value_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = band_money
				}
				{
					index = 0
					validateLocalID = career_earnings_bg
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = career_earnings_value
					includeParentOwned = false
				}
			]
			name = career_earnings_value_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = band_money
			type = ContainerElement
			dims = (200.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (904.9357, 486.62134)
		}
		children = [
			{
				props = {
					texture = cash_earn
					material = 0x00000000
					local_id = career_earnings_bg
					type = SpriteElement
					dims = (256.0, 128.0)
					just = [
						-1.0
						-1.0
					]
					pos = (31.761173, -15.880589)
					z_priority = 1.0
					scale = (0.8, 0.8)
				}
				children = [
					{
						props = {
							local_id = career_earnings_text
							type = TextBlockElement
							dims = (200.0, 35.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (24.575012, -17.803038)
							z_priority = 2.0
							rgba = [
								176
								176
								176
								255
							]
							text = qs("EARNINGS")
							font = fontgrid_title_a1
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = career_earnings_value
							type = TextBlockElement
							dims = (202.0, 36.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (8.326069, 29.35609)
							z_priority = 2.0
							text = qs("$100")
							font = fontgrid_text_a3
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
			{
				props = {
					texture = cash_available
					material = 0x00000000
					local_id = cash_available_bg
					type = SpriteElement
					dims = (256.0, 128.0)
					just = [
						-1.0
						-1.0
					]
					pos = (38.113182, 62.704514)
					z_priority = 2.0
					scale = (0.8, 0.8)
				}
				children = [
					{
						props = {
							local_id = cash_available_text
							type = TextBlockElement
							dims = (185.0, 35.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (5.796791, -18.259544)
							z_priority = 3.0
							rgba = [
								176
								176
								176
								255
							]
							text = qs("AVAILABLE")
							font = fontgrid_title_a1
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = cash_available_value
							type = TextBlockElement
							dims = (202.0, 36.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (9.241052, 30.1647)
							z_priority = 3.0
							text = qs("$100")
							font = fontgrid_text_a3
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
		]
	}
}
uidesc_band_money_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
