uidesc_loading_freestyle = {
	DescVersion = 2
	name = uidesc_loading_freestyle
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = loading_container
				}
				{
					index = 1
					validateLocalID = tip
					includeParentOwned = false
				}
			]
			name = tip_text_guitar
			visiblename = 'tip_text_guitar'
			help = 'loading_container -> tip => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = loading_container
				}
				{
					index = 0
					validateLocalID = tip
					includeParentOwned = false
				}
			]
			name = tip_text_drum
			visiblename = 'tip_text_drum'
			help = 'loading_container -> tip => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = loading_container
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (1280.0, 720.0)
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
					local_id = tip
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (400.0, 200.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-468.88885, 60.0)
					z_priority = 50001.0
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
					text = qs("\L")
					font = fontgrid_title_gh3
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
			{
				props = {
					local_id = tip
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (400.0, 200.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (77.77765, 60.0)
					z_priority = 50001.0
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
					text = qs("\L")
					font = fontgrid_title_gh3
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
uidesc_loading_freestyle_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
