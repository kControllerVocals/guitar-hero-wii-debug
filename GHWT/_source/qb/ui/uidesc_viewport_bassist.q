uidesc_viewport_bassist = {
	DescVersion = 6
	name = uidesc_viewport_bassist
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = viewport_bassist
				}
				{
					index = 1
					validateLocalID = Body
					includeParentOwned = false
				}
			]
			name = alias_body
			visiblename = 'alias_body'
			help = 'viewport_bassist -> body'
		}
		{
			path = [
				{
					validateLocalID = viewport_bassist
				}
				{
					index = 0
					validateLocalID = title_container
					includeParentOwned = false
				}
			]
			name = alias_title_container
			visiblename = 'alias_title_container'
			help = 'viewport_bassist -> title_container'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = viewport_bassist
				}
				{
					index = 0
					validateLocalID = title_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			visiblename = 'title_text'
			help = 'viewport_bassist -> title_container -> title => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = viewport_bassist
				}
				{
					index = 1
					validateLocalID = Body
					includeParentOwned = false
				}
			]
			name = body_dims
			visiblename = 'body_dims'
			help = 'viewport_bassist -> body => dims'
			target = dims
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = viewport_bassist
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
					local_id = title_container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (550.0, 75.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (54.14577, 426.00977)
					z_priority = 1.0
					scale = (1.0, 1.0)
					rot_angle = -90.0
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
							local_id = title
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (550.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
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
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale to fit`
							scale_mode = proportional
							text_case = upper
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
							line_spacing = 1.0
						}
					}
				]
			}
			{
				props = {
					local_id = Body
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (450.0, 450.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (375.8858, 365.0)
					z_priority = 1.0
					scale = (1.2, 1.3)
					rot_angle = -90.0
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
uidesc_viewport_bassist_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
