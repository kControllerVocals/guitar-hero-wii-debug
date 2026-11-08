uidesc_motd = {
	DescVersion = 2
	name = uidesc_motd
	props = [
		{
			path = [
				{
				}
				{
					local_id = MOTD_Container
				}
				{
					index = 1
					validateLocalID = container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			target = text
			type = string_wchar
			visiblename = 'title_text'
			help = 'motd_container -> container -> Title => text'
		}
		{
			path = [
				{
				}
				{
					local_id = MOTD_Container
				}
				{
					index = 1
					validateLocalID = container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = text_text
			target = text
			type = string_wchar
			visiblename = 'text_text'
			help = 'motd_container -> container -> text => text'
		}
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = MOTD_Container
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (0.0, 0.0)
			just = [
				0.0
				0.0
			]
			child_anchor = [
				0.0
				0.0
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
					blend = blend
					texture = Album01
					local_id = album
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (64.0, 64.0)
					just = [
						0.0
						0.0
					]
					child_anchor = [
						-1.0
						-1.0
					]
					pos = (-91.0, -25.000023)
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
				}
			}
			{
				props = {
					local_id = container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (0.0, 0.0)
					just = [
						-1.0
						-1.0
					]
					child_anchor = [
						-1.0
						-1.0
					]
					pos = (0.0, -75.0)
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
				}
				children = [
					{
						props = {
							blend = blend
							texture = bG
							local_id = bG
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 128.0)
							just = [
								0.0
								-1.0
							]
							child_anchor = [
								-1.0
								-1.0
							]
							pos = (4.0, -6.000061)
							z_priority = 1.0
							scale = (1.2, 1.2)
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
					{
						props = {
							local_id = title
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (87.0, 24.5)
							just = [
								0.0
								-1.0
							]
							pos = (10.0, 32.9999)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								128
								0
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0xda3ada24)
							font = fontgrid_text_a3
							single_line = true
							fit_width = none
							fit_height = none
							scale_mode = proportional
							internal_just = [
								0.0
								-1.0
							]
							internal_scale = (0.5, 0.5)
							blend = blend
							font_spacing = -1
							clip_top_lines_on_overflow = false
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
							local_id = text
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (150.0, 50.0)
							just = [
								0.0
								-1.0
							]
							pos = (10.0, 52.999924)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								0
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0x2ed061a7)
							font = fontgrid_text_a3
							single_line = false
							fit_width = none
							fit_height = none
							scale_mode = proportional
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.5, 0.5)
							blend = blend
							font_spacing = -1
							clip_top_lines_on_overflow = false
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
			{
				props = {
					local_id = demon_container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (0.0, 0.0)
					just = [
						-1.0
						-1.0
					]
					child_anchor = [
						-1.0
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
				}
				children = [
					{
						props = {
							blend = blend
							texture = Demon_WingDown
							local_id = Demon_0
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (256.0, 128.0)
							just = [
								0.0
								1.0
							]
							child_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 3.0
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
					{
						props = {
							blend = blend
							texture = Demon_WingMid
							local_id = Demon_1
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (256.0, 128.0)
							just = [
								0.0
								1.0
							]
							child_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 3.0
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
					{
						props = {
							blend = blend
							texture = Demon_WingUp
							local_id = Demon_2
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (256.0, 128.0)
							just = [
								0.0
								1.0
							]
							child_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 3.0
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
		]
	}
}
uidesc_motd_nxgui = {
}
