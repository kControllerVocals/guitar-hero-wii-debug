uidesc_pause_menu = {
	DescVersion = 9
	name = uidesc_pause_menu
	rect = [
		0.0
		-50.0
		1280.0
		820.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = pause_bg
				}
				{
					index = 1
					validateLocalID = pause_fist_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = menu
					includeParentOwned = false
				}
			]
			name = alias_menu
		}
		{
			path = [
				{
					validateLocalID = pause_bg
				}
				{
					index = 1
					validateLocalID = pause_fist_container
					includeParentOwned = false
				}
			]
			name = alias_pause_fist_container
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = pause_bg
				}
				{
					index = 1
					validateLocalID = pause_fist_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = menu_pause_frame_banner
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = pause_bg
				}
				{
					index = 1
					validateLocalID = pause_fist_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = menu_pause_bg_glow
					includeParentOwned = false
				}
			]
			name = glow_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = pause_bg
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 598.0
		}
		children = [
			{
				props = {
					texture = gradient_256
					blend = subtract
					flip_h = true
					local_id = gradient_256
					type = SpriteElement
					alpha = 0.5
					dims = (1280.0, 720.0)
					pos = (640.0, 360.0)
					z_priority = 599.0
				}
			}
			{
				props = {
					local_id = pause_fist_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						1.0
					]
					pos = (0.0, 0.0)
					z_priority = 599.0
				}
				children = [
					{
						props = {
							local_id = menu
							type = ContainerElement
							dims = (400.0, 300.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-42.251495, -400.61545)
							z_priority = 605.0
							rot_angle = -12.0
						}
					}
					{
						props = {
							texture = menu_pause_bg
							local_id = menu_pause_bg
							type = SpriteElement
							dims = (770.0, 770.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 600.0
						}
					}
					{
						props = {
							texture = menu_pause_bg_overlay
							local_id = menu_pause_bg_glow
							type = SpriteElement
							dims = (770.0, 770.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 601.0
						}
					}
					{
						props = {
							texture = menu_pause_frame_banner
							local_id = menu_pause_frame_banner
							type = SpriteElement
							dims = (512.0, 256.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (64.286674, -140.8836)
							z_priority = 605.0
						}
						children = [
							{
								props = {
									local_id = title
									type = TextBlockElement
									dims = (250.0, 75.0)
									pos_anchor = [
										-0.05
										-0.25
									]
									pos = (3.83905, -2.793154)
									z_priority = 606.0
									rot_angle = -12.0
									rgba = [
										64
										0
										0
										255
									]
									text = qs("PAUSED")
									font = fontgrid_text_A11_b
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = upper
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (1.1, 1.1)
									font_spacing = 3
									shadow_offs = (3.0, 3.0)
								}
							}
						]
					}
				]
			}
		]
	}
}
uidesc_pause_menu_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
