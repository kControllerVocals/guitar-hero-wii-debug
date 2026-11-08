uidesc_Rock_Archive_Row = {
	DescVersion = 2
	name = uidesc_Rock_Archive_Row
	rect = [
		0.0
		0.0
		310.0
		34.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = row
				}
				{
					index = 0
					validateLocalID = song
					includeParentOwned = false
				}
			]
			name = song_text
			visiblename = 'Song_text'
			help = 'Row -> Song => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = row
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (310.0, 34.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 4.0
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
					local_id = song
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (310.0, 32.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 5.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						250
						119
						3
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs(0xdc3edfa7)
					font = fontgrid_text_a6
					material = 0x00000000
					single_line = false
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.5, 0.5)
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
uidesc_Rock_Archive_Row_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
