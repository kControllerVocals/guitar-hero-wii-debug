uidesc_freestyle_pause_entry = {
	DescVersion = 1
	name = uidesc_freestyle_pause_entry
	rect = [
		-192.0
		-37.5
		384.0
		75.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = TextContainer
				}
				{
					index = 0
					validateLocalID = PauseText
					includeParentOwned = false
				}
			]
			name = PauseText
			visiblename = 'PauseText'
			help = 'TextContainer -> PauseText => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = TextContainer
				}
				{
					index = 0
					validateLocalID = PauseText
					includeParentOwned = false
				}
			]
			name = PauseText_rgba
			visiblename = 'PauseText_rgba'
			help = 'TextContainer -> PauseText => rgba'
			target = rgba
			type = array_color
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = TextContainer
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (384.0, 75.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 0.0
			scale = (1.0, 1.0)
			rot_angle = 0.0
			rgba = [
				255
				255
				255
				255
			]
			events_blocked = 0
			preserve_local_orientation = false
		}
		children = [
			{
				props = {
					local_id = PauseText
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (384.0, 75.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs("Placeholder")
					font = fontgrid_text_a8
					material = 0x00000000
					single_line = false
					fit_width = `expand dims`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (1.0, 1.0)
					blend = blend
					font_spacing = -1
					override_color_tag_alpha = true
					override_color_tag_rgba = false
					use_shadow = false
					shadow_rgba = [
						0
						0
						0
						255
					]
					shadow_offs = (3.0, 3.0)
					line_spacing = 1.0
				}
			}
		]
	}
}
uidesc_freestyle_pause_entry_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
