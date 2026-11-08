uidesc_dialog_box_no_options = {
	DescVersion = 13
	name = uidesc_dialog_box_no_options
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
					validateLocalID = alert_master_container
				}
				{
					index = 2
					validateLocalID = title_text_container
					includeParentOwned = false
				}
			]
			name = alias_dialog_text
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = alert_master_container
				}
				{
					index = 2
					validateLocalID = title_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = alert_title
					includeParentOwned = false
				}
			]
			name = PopupTitle_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = alert_master_container
				}
				{
					index = 3
					validateLocalID = alert_message
					includeParentOwned = false
				}
			]
			name = PopupBody_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = alert_master_container
				}
				{
					index = 2
					validateLocalID = title_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = alert_title
					includeParentOwned = false
				}
			]
			name = PopupTitle_rgba
			target = rgba
			type = array_color
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = alert_master_container
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 495.0
		}
		children = [
			{
				props = {
					local_id = alert_bg
					type = ContainerElement
					dims = (100.0, 100.0)
					pos = (640.0, 360.0)
					z_priority = 496.0
				}
				children = [
					{
						props = {
							texture = dialog_bg
							local_id = dialog_bg
							type = SpriteElement
							dims = (720.0, 670.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -23.0)
							z_priority = 497.0
						}
					}
				]
			}
			{
				props = {
					texture = gradient_256
					blend = subtract
					flip_h = true
					local_id = gradient_256
					type = SpriteElement
					alpha = 0.5
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 496.0
				}
			}
			{
				props = {
					local_id = title_text_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos = (640.0, 106.0)
					z_priority = 496.0
				}
				children = [
					{
						props = {
							local_id = alert_title
							type = TextBlockElement
							dims = (300.0, 80.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 15.0)
							z_priority = 520.0
							rgba = [
								200
								200
								200
								255
							]
							text = qs("OVERWRITTEN")
							font = fontgrid_text_a11_large
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (1.5, 1.5)
							use_shadow = true
							shadow_offs = (-3.0, -3.0)
						}
					}
				]
			}
			{
				props = {
					local_id = alert_message
					type = TextBlockElement
					dims = (550.0, 300.0)
					just = [
						0.0
						-1.0
					]
					pos = (632.0, 230.0)
					z_priority = 520.0
					rot_angle = -2.0
					rgba = [
						128
						128
						128
						255
					]
					text = qs("ALERT MESSAGE")
					font = fontgrid_text_a6
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.55, 0.55)
					shadow_offs = (3.0, 3.0)
				}
			}
		]
	}
}
uidesc_dialog_box_no_options_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
