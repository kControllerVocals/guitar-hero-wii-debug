uidesc_jam_tabs = {
	DescVersion = 5
	name = uidesc_jam_tabs
	rect = [
		-50.0
		-50.0
		327.68002
		448.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = tabs_container
				}
				{
					index = 1
					validateLocalID = tab_name
					includeParentOwned = false
				}
			]
			name = tab_name_text
			target = text
			type = string_wchar
		}
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = tabs_container
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (0.0, 0.0)
			z_priority = 12.0
		}
		children = [
			{
				props = {
					texture = Menu_Player
					local_id = Menu_Player
					type = SpriteElement
					alpha = 0.55
					dims = (256.0, 256.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 13.0
					scale = (1.2800001, 1.75)
				}
			}
			{
				props = {
					local_id = tab_name
					type = TextBlockElement
					dims = (75.5, 24.4)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (113.84001, 133.75)
					z_priority = 15.0
					scale = (0.91428596, 1.268116)
					rgba = [
						255
						128
						0
						255
					]
					text = qs("Chorus")
					font = fontgrid_title_a1
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_scale = (0.5, 0.4)
					shadow_offs = (3.0, 3.0)
				}
			}
		]
	}
}
uidesc_jam_tabs_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
}
