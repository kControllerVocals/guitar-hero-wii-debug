uidesc_helper_gamertag_pill = {
	DescVersion = 3
	name = uidesc_helper_gamertag_pill
	rect = [
		-36.344006
		-28.644003
		63.844006
		57.288006
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 1
					validateLocalID = helper_pill_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = helper_description
					includeParentOwned = false
				}
			]
			name = helper_description_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 1
					validateLocalID = helper_pill_menu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = helper_description
					includeParentOwned = false
				}
			]
			name = helper_description_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 0
					validateLocalID = helper_pill_bg
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = helper_pill_end
					includeParentOwned = false
				}
			]
			name = helper_pill_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 0
					validateLocalID = helper_pill_bg
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = helper_pill_body
					includeParentOwned = false
				}
			]
			name = helper_pill_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 0
					validateLocalID = helper_pill_bg
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = helper_pill_end
					includeParentOwned = false
				}
			]
			name = helper_pill_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 0
					validateLocalID = helper_pill_bg
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = helper_pill_body
					includeParentOwned = false
				}
			]
			name = helper_pill_body_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 1
					validateLocalID = helper_pill_menu
					includeParentOwned = false
				}
			]
			name = helper_pill_menu_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = helper_pill_container
				}
				{
					index = 1
					validateLocalID = helper_pill_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = helper_button
					includeParentOwned = false
				}
			]
			name = helper_button_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = helper_pill_container
			type = ContainerElement
			dims = (50.0, 32.0)
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
			scale = (1.1, 1.1)
		}
		children = [
			{
				props = {
					local_id = helper_pill_bg
					type = MenuElement
					alpha = 0.8
					dims = (42.0, 32.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
					fit_major = `size dims to content`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							texture = helper_pill_end
							flip_v = true
							local_id = helper_pill_end
							type = SpriteElement
							dims = (16.0, 32.0)
							pos = (8.0, 16.0)
							z_priority = 2.0
							rgba = [
								0
								0
								0
								255
							]
						}
					}
					{
						props = {
							texture = helper_pill_body
							local_id = helper_pill_body
							type = SpriteElement
							dims = (10.0, 32.0)
							pos = (21.0, 16.0)
							z_priority = 2.0
							rgba = [
								0
								0
								0
								255
							]
						}
					}
					{
						props = {
							texture = helper_pill_end
							local_id = helper_pill_end
							type = SpriteElement
							dims = (16.0, 32.0)
							pos = (34.0, 16.0)
							z_priority = 2.0
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
			{
				props = {
					local_id = helper_pill_menu
					type = MenuElement
					dims = (86.799995, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-7.0, 0.0)
					z_priority = 3.0
					scale = (0.6, 0.6)
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
					fit_major = `size dims to content`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							material = 0x00000000
							local_id = helper_button
							type = SpriteElement
							dims = (62.0, 62.0)
							pos = (43.399998, 25.0)
							z_priority = 3.0
							scale = (1.4, 1.4)
						}
					}
					{
						props = {
							local_id = helper_description
							type = TextBlockElement
							dims = (0.0, 56.0)
							pos = (86.799995, 25.0)
							z_priority = 3.0
							rgba = [
								192
								192
								192
								255
							]
							text = qs("")
							font = fontgrid_text_A11_b
							single_line = true
							fit_width = `expand dims`
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.8, 0.8)
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
		]
	}
}
uidesc_helper_gamertag_pill_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
