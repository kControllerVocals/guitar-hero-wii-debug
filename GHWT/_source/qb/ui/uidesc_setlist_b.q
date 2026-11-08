uidesc_Setlist_B = {
	DescVersion = 8
	name = uidesc_Setlist_B
	rect = [
		0.0
		-50.0
		1280.0
		4450.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = setlist_master_container
				}
				{
					index = 1
					validateLocalID = setlist_scrolling_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = setlist_menu
					includeParentOwned = false
				}
			]
			name = alias_setlist_menu
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = setlist_master_container
				}
				{
					index = 0
					validateLocalID = setlist_scroll_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = setlist_B_scrollthumb
					includeParentOwned = false
				}
			]
			name = setlist_B_scrollthumb_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = setlist_master_container
				}
				{
					index = 2
					validateLocalID = setlist_B_BG_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = setlist_B_BG_runnerL
					includeParentOwned = false
				}
			]
			name = setlist_B_BG_runnerL_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = setlist_master_container
				}
				{
					index = 2
					validateLocalID = setlist_B_BG_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = setlist_B_BG_runnerR
					includeParentOwned = false
				}
			]
			name = setlist_B_BG_runnerR_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = setlist_master_container
				}
				{
					index = 2
					validateLocalID = setlist_B_BG_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = setlist_B_BG
					includeParentOwned = false
				}
			]
			name = setlist_B_BG_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = setlist_master_container
				}
				{
					index = 2
					validateLocalID = setlist_B_BG_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = setlist_B_BG_runnerC
					includeParentOwned = false
				}
			]
			name = setlist_B_BG_runnerC_pos
			target = pos
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = setlist_master_container
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
					local_id = setlist_scroll_container
					type = ContainerElement
					dims = (10.0, 10.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (380.0, 0.0)
					z_priority = 15.0
				}
				children = [
					{
						props = {
							texture = setlist_B_scrollthumb
							local_id = setlist_B_scrollthumb
							type = SpriteElement
							dims = (128.0, 128.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -185.0)
							z_priority = 15.0
						}
					}
					{
						props = {
							texture = setlist_B_scrollbar
							local_id = setlist_B_scrollbar
							type = SpriteElement
							dims = (32.0, 600.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 15.0
						}
					}
				]
			}
			{
				props = {
					local_id = setlist_scrolling_menu
					type = ScrollingMenu
					hiddenLocal = false
					alpha = 1.0
					dims = (700.0, 150.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (635.0, 360.0)
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
					isVertical = true
					adjust_visibility = false
					center_selection = false
					top_selection = false
				}
				children = [
					{
						props = {
							local_id = setlist_menu
							type = MenuElement
							dims = (700.0, 0.0)
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
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
					}
				]
			}
			{
				props = {
					local_id = setlist_B_BG_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = setlist_B_BG_runnerL
							local_id = setlist_B_BG_runnerL
							type = SpriteElement
							dims = (256.0, 2200.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-640.0, 0.0)
							z_priority = -1.0
						}
					}
					{
						props = {
							texture = setlist_B_BG_runnerR
							local_id = setlist_B_BG_runnerR
							type = SpriteElement
							dims = (256.0, 2200.0)
							just = [
								1.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (640.0, 0.0)
							z_priority = -1.0
						}
					}
					{
						props = {
							texture = setlist_B_BG
							blend = Add
							local_id = setlist_B_BG
							type = SpriteElement
							dims = (940.0, 2200.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							rgba = [
								255
								255
								255
								180
							]
						}
						children = [
							{
								props = {
									texture = setlist_B_BG
									blend = Add
									local_id = setlist_B_BG
									type = SpriteElement
									dims = (940.0, 2200.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (-2.6658938, 0.0)
									rgba = [
										255
										255
										255
										180
									]
								}
							}
						]
					}
					{
						props = {
							texture = white
							local_id = setlist_B_BG_runnerC
							type = SpriteElement
							dims = (768.0, 2200.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = -1.0
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
		]
	}
}
uidesc_Setlist_B_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
