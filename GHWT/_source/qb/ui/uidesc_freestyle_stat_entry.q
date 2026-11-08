uidesc_freestyle_stat_entry = {
	DescVersion = 2
	name = uidesc_freestyle_stat_entry
	rect = [
		-225.0
		-48.0
		450.0
		96.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = FreestyleStatEntryContainer
				}
				{
					index = 0
					validateLocalID = FreestyleStatText
					includeParentOwned = false
				}
			]
			name = Stat_Title
			visiblename = 'Stat_Title'
			help = 'FreestyleStatEntryContainer -> FreestyleStatText => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = FreestyleStatEntryContainer
				}
				{
					index = 1
					validateLocalID = FreestyleStatValue
					includeParentOwned = false
				}
			]
			name = Stat_Value
			visiblename = 'Stat_Value'
			help = 'FreestyleStatEntryContainer -> FreestyleStatValue => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = FreestyleStatEntryContainer
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (600.0, 128.0)
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
			scale = (0.75, 0.75)
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
					local_id = FreestyleStatText
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (600.0, 100.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						0.0
						-1.0
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
					text = qs(0x32f8b35c)
					font = fontgrid_title_a1
					material = 0x00000000
					single_line = true
					fit_width = `scale down if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						-1.0
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
					local_id = FreestyleStatValue
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (600.0, 100.0)
					just = [
						0.0
						1.0
					]
					pos_anchor = [
						0.0
						1.0
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
					text = qs(0xea246026)
					font = fontgrid_title_a1
					material = 0x00000000
					single_line = true
					fit_width = `scale down if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						1.0
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
uidesc_freestyle_stat_entry_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
