uidesc_DLC_NoSongs = {
	DescVersion = 4
	name = uidesc_DLC_NoSongs
	rect = [
		0.0
		-185.0
		490.0
		370.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = message_container
				}
				{
					index = 0
					validateLocalID = NoSongMessage
					includeParentOwned = false
				}
			]
			name = NoSongMessage_text
			visiblename = 'NoSongMessage_text'
			help = 'message_container -> NoSongMessage => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = message_container
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (490.0, 370.0)
			just = [
				-1.0
				0.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 10.0
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
					local_id = NoSongMessage
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (450.0, 300.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 11.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						192
						192
						192
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs("")
					font = fontgrid_text_a6
					material = 0x00000000
					single_line = false
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.75, 0.75)
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
uidesc_DLC_NoSongs_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
