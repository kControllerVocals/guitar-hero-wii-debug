uidesc_freestyle_tips_entry = {
	DescVersion = 1
	name = uidesc_freestyle_tips_entry
	rect = [
		-176.0
		-28.5
		352.0
		57.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = FreestyleTipContainer
				}
				{
					index = 0
					validateLocalID = FreestyleTip
					includeParentOwned = false
				}
			]
			name = FreestyleTip_text
			visiblename = 'FreestyleTip_text'
			help = 'FreestyleTipContainer -> FreestyleTip => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = FreestyleTipContainer
				}
				{
					index = 0
					validateLocalID = FreestyleTip
					includeParentOwned = false
				}
			]
			name = FreestyleTip_rgba
			visiblename = 'FreestyleTip_rgba'
			help = 'FreestyleTipContainer -> FreestyleTip => rgba'
			target = rgba
			type = array_color
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = FreestyleTipContainer
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (352.0, 57.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
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
		}
		children = [
			{
				props = {
					local_id = FreestyleTip
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (352.0, 57.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
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
					text = qs("Placeholder")
					font = fontgrid_text_a8
					material = 0x00000000
					single_line = false
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.85, 0.85)
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
uidesc_freestyle_tips_entry_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
