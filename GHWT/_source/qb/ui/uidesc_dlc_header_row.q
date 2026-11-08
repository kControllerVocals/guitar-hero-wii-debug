uidesc_DLC_Header_Row = {
	DescVersion = 6
	name = uidesc_DLC_Header_Row
	rect = [
		0.0
		-3.0
		490.0
		50.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = header
				}
				{
					index = 0
					validateLocalID = Header_Left
					includeParentOwned = false
				}
			]
			name = Header_Left_text
			visiblename = 'Header_Left_text'
			help = 'header -> Header_Left => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = header
				}
				{
					index = 1
					validateLocalID = Header_Right
					includeParentOwned = false
				}
			]
			name = Header_Right_text
			visiblename = 'Header_Right_text'
			help = 'header -> Header_Right => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = header
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
			z_priority = 200.0
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
					local_id = Header_Left
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (285.0, 35.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (57.0, 8.0)
					z_priority = 203.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						126
						0
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs(0xd0f35567)
					font = fontgrid_text_a6
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
					internal_scale = (0.4, 0.25)
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
					local_id = Header_Right
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 35.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (352.0, 8.0)
					z_priority = 203.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						126
						0
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = $wii_DLC_cost_header
					font = fontgrid_text_a6
					material = 0x00000000
					single_line = false
					fit_width = `scale each line if larger`
					fit_height = `scale to fit`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						0.0
						-1.0
					]
					internal_scale = (0.4, 0.25)
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
					texture = DLC_Pick
					local_id = DLC_Pick
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (50.0, 50.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						0.0
					]
					pos = (10.000002, 2.0)
					z_priority = 202.0
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
uidesc_DLC_Header_Row_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
