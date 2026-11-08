uidesc_DLC_Song_Row = {
	DescVersion = 3
	name = uidesc_DLC_Song_Row
	rect = [
		0.0
		-12.0
		490.0
		64.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = song
				}
				{
					index = 0
					validateLocalID = Song_Left
					includeParentOwned = false
				}
			]
			name = Song_Left_text
			visiblename = 'Song_Left_text'
			help = 'Song -> Song_Left => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = song
				}
				{
					index = 1
					validateLocalID = Song_Right
					includeParentOwned = false
				}
			]
			name = Song_Right_text
			visiblename = 'Song_Right_text'
			help = 'Song -> Song_Right => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = song
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (490.0, 40.0)
			just = [
				-1.0
				-1.0
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
					local_id = Song_Left
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (305.0, 30.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						0.0
					]
					pos = (37.0, 0.0)
					z_priority = 203.0
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
					text = qs(0xd8060204)
					font = fontgrid_title_a1
					material = 0x00000000
					single_line = false
					fit_width = `scale each line if larger`
					fit_height = `scale to fit`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						-1.0
						-1.0
					]
					internal_scale = (0.4, 0.4)
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
			{
				props = {
					local_id = Song_Right
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 30.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						0.0
					]
					pos = (352.0, 0.0)
					z_priority = 203.0
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
					text = qs("100")
					font = fontgrid_title_a1
					material = 0x00000000
					single_line = false
					fit_width = `scale each line if larger`
					fit_height = `scale to fit`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.4, 0.4)
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
			{
				props = {
					blend = blend
					texture = DLC_Title_Bar
					local_id = SongBG
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.52
					dims = (490.0, 64.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 201.0
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
			}
		]
	}
}
uidesc_DLC_Song_Row_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
