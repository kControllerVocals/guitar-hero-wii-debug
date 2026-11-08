uidesc_gig_board_venue = {
	DescVersion = 2
	name = uidesc_gig_board_venue
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
					validateLocalID = gig_venue_master
				}
				{
					index = 0
					validateLocalID = container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = ScrollingMenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = gig_venue_content
					includeParentOwned = false
				}
			]
			name = alias_gig_venue_content
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = gig_venue_master
				}
				{
					index = 0
					validateLocalID = container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = arrow_up
					includeParentOwned = false
				}
			]
			name = arrow_up_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = gig_venue_master
				}
				{
					index = 0
					validateLocalID = container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = arrow_down
					includeParentOwned = false
				}
			]
			name = arrow_down_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = gig_venue_master
				}
				{
					index = 0
					validateLocalID = container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = arrow_down
					includeParentOwned = false
				}
			]
			name = arrow_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = gig_venue_master
				}
				{
					index = 0
					validateLocalID = container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = arrow_up
					includeParentOwned = false
				}
			]
			name = arrow_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = gig_venue_master
				}
				{
					index = 0
					validateLocalID = container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = header
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = head_bg
					includeParentOwned = false
				}
			]
			name = head_bg_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = gig_venue_master
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = container
					type = ContainerElement
					dims = (500.0, 400.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = header
							type = TextBlockElement
							dims = (500.0, 50.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -174.0)
							z_priority = 2.0
							rgba = [
								0
								0
								0
								255
							]
							text = qs("SELECT LOCATION")
							font = fontgrid_text_A11_b
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							shadow_offs = (3.0, 3.0)
						}
						children = [
							{
								props = {
									blend = Add
									flip_v = true
									local_id = head_bg
									type = SpriteElement
									alpha = 0.2
									dims = (500.0, 50.0)
									just = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 1.8
								}
							}
						]
					}
					{
						props = {
							texture = 0x00000000
							flip_h = true
							local_id = arrow_up
							type = SpriteElement
							alpha = 0.0
							dims = (50.0, 50.0)
							just = [
								0.0
								1.0
							]
							pos = (250.0, 100.0)
							z_priority = 20000.0
						}
					}
					{
						props = {
							local_id = ScrollingMenu
							type = ScrollingMenu
							hiddenLocal = false
							alpha = 1.0
							dims = (500.0, 300.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 75.0)
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
							isVertical = true
							adjust_visibility = true
							center_selection = false
							top_selection = false
						}
						children = [
							{
								props = {
									local_id = gig_venue_content
									type = MenuElement
									dims = (500.0, 100.0)
									pos = (250.0, 150.0)
									z_priority = 2.0
									internal_just = [
										0.0
										0.0
									]
									fit_major = `keep dims`
									fit_minor = `keep dims`
									scale_mode = proportional
								}
							}
						]
					}
					{
						props = {
							texture = 0x00000000
							flip_h = false
							local_id = arrow_down
							type = SpriteElement
							alpha = 0.0
							dims = (50.0, 50.0)
							just = [
								0.0
								-1.0
							]
							pos = (250.0, 400.0)
							z_priority = 2.0
						}
					}
				]
			}
		]
	}
}
uidesc_gig_board_venue_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
