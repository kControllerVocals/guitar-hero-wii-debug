uidesc_setlist_b_practice_sessions_item_desc = {
	DescVersion = 2
	name = uidesc_setlist_b_practice_sessions_item_desc
	rect = [
		-450.0
		-30.0
		900.0
		60.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = section_line
				}
				{
					index = 0
					validateLocalID = section
					includeParentOwned = false
				}
			]
			name = section_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = section_line
				}
				{
					index = 0
					validateLocalID = section
					includeParentOwned = false
				}
			]
			name = section_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = section_line
				}
				{
					index = 1
					validateLocalID = highlight
					includeParentOwned = false
				}
			]
			name = highlight_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = section_line
				}
				{
					index = 1
					validateLocalID = highlight
					includeParentOwned = false
				}
			]
			name = highlight_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = section_line
				}
				{
					index = 2
					validateLocalID = strikeout
					includeParentOwned = false
				}
			]
			name = strikeout_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = section_line
				}
				{
					index = 2
					validateLocalID = strikeout
					includeParentOwned = false
				}
			]
			name = strikeout_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = section_line
			type = ContainerElement
			dims = (768.0, 45.0)
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
			z_priority = 4.0
		}
		children = [
			{
				props = {
					local_id = section
					type = TextBlockElement
					dims = (768.0, 45.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 4.0
					rgba = [
						93
						30
						28
						255
					]
					text = qs("fgsdfgsdfgd")
					font = fontgrid_text_a8
					fit_width = `scale each line if larger`
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.7, 0.7)
				}
			}
			{
				props = {
					texture = setlist_popup_highlight
					local_id = highlight
					type = SpriteElement
					alpha = 0.0
					dims = (900.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 2.0
					rgba = [
						255
						255
						255
						220
					]
				}
			}
			{
				props = {
					texture = 0x00000000
					local_id = strikeout
					type = SpriteElement
					alpha = 0.0
					dims = (768.0, 45.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 5.0
					rgba = [
						0
						0
						0
						255
					]
				}
			}
		]
	}
}
uidesc_setlist_b_practice_sessions_item_desc_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
