uidesc_jam_band_instrument_info = {
	DescVersion = 1
	name = uidesc_jam_band_instrument_info
	rect = [
		136.85194
		6.925415
		773.7479
		512.0
	]
	aliases = [
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = NewElement4
			type = ContainerElement
			dims = (200.0, 75.0)
			pos = (760.59985, 265.14996)
		}
		children = [
			{
				props = {
					local_id = NewElement1
					type = TextBlockElement
					dims = (200.0, 50.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					rgba = [
						230
						230
						230
						255
					]
					text = qs("Percussion Kit")
					font = fontgrid_title_a1
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = NewElement1
					type = TextBlockElement
					dims = (190.0, 30.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-2.370422, 13.685211)
					rgba = [
						230
						230
						230
						230
					]
					text = qs("Press \m9 to toggle")
					font = fontgrid_title_a1
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = NewElement1
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (100.0, 100.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = bands_menu
							local_id = NewElement2
							type = SpriteElement
							dims = (360.0, 512.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-543.7479, -102.22453)
							z_priority = 2.0
							rgba = [
								192
								192
								192
								255
							]
						}
					}
				]
			}
		]
	}
}
uidesc_jam_band_instrument_info_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
