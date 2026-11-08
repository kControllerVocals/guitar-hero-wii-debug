uidesc_sponsor = {
	DescVersion = 1
	name = uidesc_sponsor
	props = [
		{
			path = [
				{
				}
				{
					local_id = sponsor_container
				}
				{
					index = 2
					validateLocalID = sponsor
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = logo
					includeParentOwned = false
				}
			]
			name = logo_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
				}
				{
					local_id = sponsor_container
				}
				{
					index = 2
					validateLocalID = sponsor
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = description
					includeParentOwned = false
				}
			]
			name = description_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
				}
				{
					local_id = sponsor_container
				}
				{
					index = 2
					validateLocalID = sponsor
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = menu
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = Cash
					includeParentOwned = false
				}
			]
			name = cash_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
				}
				{
					local_id = sponsor_container
				}
				{
					index = 0
					validateLocalID = photo
					includeParentOwned = false
				}
			]
			name = photo_texture
			target = texture
			type = checksum
		}
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = sponsor_container
			type = ContainerElement
			dims = (0.0, 0.0)
			child_anchor = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 1.0
		}
		children = [
			{
				props = {
					flip_h = false
					flip_v = false
					texture = white
					local_id = photo
					type = SpriteElement
					dims = (512.0, 512.0)
					just = [
						1.0
						0.0
					]
					child_anchor = [
						-1.0
						-1.0
					]
					pos = (1024.0, 360.0)
					z_priority = 1.0
				}
			}
			{
				props = {
					flip_h = false
					flip_v = false
					texture = boot_brick_bg
					local_id = bG
					type = SpriteElement
					dims = (1280.0, 720.0)
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
				}
			}
			{
				props = {
					local_id = sponsor
					type = ContainerElement
					dims = (420.0, 576.0)
					just = [
						-1.0
						-1.0
					]
					child_anchor = [
						-1.0
						-1.0
					]
					pos = (256.0, 72.0)
					z_priority = 2.0
				}
				children = [
					{
						props = {
							local_id = menu
							type = MenuElement
							dims = (420.0, 576.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
							internal_just = [
								0.0
								0.0
							]
						}
						children = [
							{
								props = {
									flip_h = false
									flip_v = false
									texture = white
									local_id = logo
									type = SpriteElement
									dims = (256.0, 64.0)
									child_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 2.0
								}
							}
							{
								props = {
									local_id = sponsor_text
									type = TextBlockElement
									dims = (332.0, 49.0)
									pos = (0.0, 0.0)
									z_priority = 2.0
									rgba = [
										120
										0
										0
										255
									]
									text = qs("You Got Sponsored!")
									font = fontgrid_text_a8
									single_line = true
									fit_width = none
									fit_height = expand
									scale_mode = proportional
									internal_just = [
										0.0
										0.0
									]
									clip_top_lines_on_overflow = false
								}
							}
							{
								props = {
									local_id = description
									type = TextBlockElement
									dims = (384.0, 200.0)
									pos = (0.0, 0.0)
									z_priority = 2.0
									rgba = [
										0
										0
										0
										255
									]
									text = qs("\L")
									font = fontgrid_text_a8
									fit_width = none
									fit_height = none
									scale_mode = proportional
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (0.5, 0.5)
									clip_top_lines_on_overflow = false
								}
							}
							{
								props = {
									local_id = milk_text
									type = TextBlockElement
									dims = (384.0, 68.6)
									pos = (0.0, 0.0)
									z_priority = 2.0
									rgba = [
										64
										32
										128
										255
									]
									text = qs("YOU MILK YOUR SPONSOR FOR:")
									font = fontgrid_text_a8
									fit_width = none
									fit_height = expand
									scale_mode = proportional
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (0.7, 0.7)
									clip_top_lines_on_overflow = false
								}
							}
							{
								props = {
									local_id = Cash
									type = TextBlockElement
									dims = (0.0, 66.15)
									pos = (0.0, 33.075)
									z_priority = 2.0
									rgba = [
										64
										32
										128
										255
									]
									text = qs("\L")
									font = fontgrid_text_a8
									single_line = true
									fit_width = none
									fit_height = expand
									scale_mode = proportional
									internal_just = [
										0.0
										0.0
									]
									internal_scale = (1.5, 1.3499999)
									clip_top_lines_on_overflow = false
								}
							}
						]
					}
					{
						props = {
							local_id = bG
							type = SpriteElement
							alpha = 0.5
							dims = (420.0, 576.0)
							just = [
								-1.0
								-1.0
							]
							child_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
							rgba = [
								192
								192
								192
								255
							]
						}
					}
				]
			}
		]
	}
}
uidesc_sponsor_nxgui = {
}
