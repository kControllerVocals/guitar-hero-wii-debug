uidesc_jam_band_warning_box = {
	DescVersion = 2
	name = uidesc_jam_band_warning_box
	rect = [
		496.62668
		213.79747
		280.00003
		280.62003
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = warning
					includeParentOwned = false
				}
			]
			name = warning_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = NewElement2
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (230.0, 120.0)
		}
		children = [
			{
				props = {
					texture = list_container
					local_id = NewElement1
					type = SpriteElement
					dims = (280.0, 280.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-1.769867, 0.62002605)
					z_priority = 20.0
					rgba = [
						0
						0
						0
						255
					]
				}
				children = [
					{
						props = {
							local_id = warning
							type = TextBlockElement
							dims = (295.0, 290.0)
							just = [
								-1.0
								-1.0
							]
							pos = (51.48837, 55.357216)
							z_priority = 21.0
							scale = (0.6, 0.6)
							rgba = [
								192
								192
								192
								255
							]
							text = qs("Only the band leader can Save, Quit, or Edit a song in GHMix. ")
							font = fontgrid_text_a3
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
						}
					}
					{
						props = {
							local_id = helper
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (0.0, 0.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (140.17422, 249.34004)
							z_priority = 25.0
							scale = (0.8, 0.8)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							desc = 'helper_pill'
							autoSizeDims = false
							[
								192
								192
								192
								255
							]
							[
								128
								128
								128
								155
							]
						}
					}
					{
						props = {
							local_id = NewElement1
							type = TextBlockElement
							dims = (170.0, 40.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-4.5999997E-05, -110.88897)
							z_priority = 21.0
							rgba = [
								224
								224
								224
								255
							]
							text = qs("WARNING")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
						}
					}
				]
			}
		]
	}
}
uidesc_jam_band_warning_box_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
