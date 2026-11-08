uidesc_leaderboard = {
	DescVersion = 14
	name = uidesc_leaderboard
	rect = [
		-128.0
		-50.0
		1536.0
		2250.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = leaderboard_container
				}
				{
					index = 2
					validateLocalID = scroll_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = menu
					includeParentOwned = false
				}
			]
			name = alias_menu
			visiblename = 'alias_menu'
			help = 'leaderboard_container -> scroll_menu -> menu'
		}
		{
			path = [
				{
					validateLocalID = leaderboard_container
				}
				{
					index = 3
					validateLocalID = loading
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = online_load_wheel
					includeParentOwned = false
				}
			]
			name = alias_spin
			visiblename = 'alias_spin'
			help = 'leaderboard_container -> loading -> online_load_wheel'
		}
		{
			path = [
				{
					validateLocalID = leaderboard_container
				}
				{
					index = 3
					validateLocalID = loading
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = online_load_wheel_BG
					includeParentOwned = false
				}
			]
			name = alias_globe
			visiblename = 'alias_globe'
			help = 'leaderboard_container -> loading -> online_load_wheel_BG'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = leaderboard_container
				}
				{
					index = 0
					validateLocalID = leaderboard_BG_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = leaderboard_BG_runnerL
					includeParentOwned = false
				}
			]
			name = leaderboard_BG_runnerL_pos
			visiblename = 'leaderboard_BG_runnerL_pos'
			help = 'leaderboard_container -> leaderboard_BG_container -> leaderboard_BG_runnerL => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = leaderboard_container
				}
				{
					index = 0
					validateLocalID = leaderboard_BG_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = leaderboard_BG_runnerR
					includeParentOwned = false
				}
			]
			name = leaderboard_BG_runnerR_pos
			visiblename = 'leaderboard_BG_runnerR_pos'
			help = 'leaderboard_container -> leaderboard_BG_container -> leaderboard_BG_runnerR => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = leaderboard_container
				}
				{
					index = 0
					validateLocalID = leaderboard_BG_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = leaderboard_BG
					includeParentOwned = false
				}
			]
			name = leaderboard_BG_pos
			visiblename = 'leaderboard_BG_pos'
			help = 'leaderboard_container -> leaderboard_BG_container -> leaderboard_BG => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = leaderboard_container
				}
				{
					index = 1
					validateLocalID = leaderboard_scroll_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = leaderboard_scrollthumb
					includeParentOwned = false
				}
			]
			name = leaderboard_scrollthumb_pos
			visiblename = 'leaderboard_scrollthumb_pos'
			help = 'leaderboard_container -> leaderboard_scroll_container -> leaderboard_scrollthumb => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = leaderboard_container
				}
				{
					index = 3
					validateLocalID = loading
					includeParentOwned = false
				}
			]
			name = loading_alpha
			visiblename = 'loading_alpha'
			help = 'leaderboard_container -> loading => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = leaderboard_container
				}
				{
					index = 3
					validateLocalID = loading
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = online_load_wheel
					includeParentOwned = false
				}
			]
			name = spin_rot_angle
			visiblename = 'spin_rot_angle'
			help = 'leaderboard_container -> loading -> online_load_wheel => rot_angle'
			target = rot_angle
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = leaderboard_container
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
					local_id = leaderboard_BG_container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						0.0
						0.0
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
				}
				children = [
					{
						props = {
							blend = blend
							texture = leaderboard_BG_runnerL
							local_id = leaderboard_BG_runnerL
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 2200.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-768.0, 0.0)
							z_priority = -1.0
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
							texture = leaderboard_BG_runnerR
							local_id = leaderboard_BG_runnerR
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 2200.0)
							just = [
								1.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (768.0, 0.0)
							z_priority = -1.0
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
							texture = setlist_B_BG
							blend = Add
							local_id = leaderboard_BG
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1280.0, 2200.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
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
								220
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = white
							local_id = leaderboard_BG_runnerC
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1024.0, 2200.0)
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
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								0
								0
								0
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
				]
			}
			{
				props = {
					local_id = leaderboard_scroll_container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (10.0, 10.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (545.0, 0.0)
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
							texture = leaderboard_scrollthumb
							material = 0x00000000
							local_id = leaderboard_scrollthumb
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (128.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -135.0)
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
							texture = leaderboard_scrollbar
							material = 0x00000000
							local_id = leaderboard_scrollbar
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (32.0, 512.0)
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
						}
					}
				]
			}
			{
				props = {
					local_id = scroll_menu
					type = ScrollingMenu
					hiddenLocal = false
					alpha = 1.0
					dims = (1024.0, 45.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
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
					isVertical = true
					adjust_visibility = false
					center_selection = true
					top_selection = false
				}
				children = [
					{
						props = {
							local_id = menu
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1024.0, 45.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
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
							isVertical = true
							internal_just = [
								0.0
								-1.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 0
							position_children = true
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = false
							allow_alternate_directional_events = false
						}
					}
				]
			}
			{
				props = {
					local_id = loading
					type = ContainerElement
					hiddenLocal = false
					alpha = 0.0
					dims = (128.0, 128.0)
					just = [
						1.0
						1.0
					]
					pos_anchor = [
						1.0
						1.0
					]
					pos = (-128.0, -72.0)
					z_priority = 1000.0
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
							texture = online_load_wheel
							local_id = online_load_wheel
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (128.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 1000.0
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
							texture = online_load_wheel_BG
							local_id = online_load_wheel_BG
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (128.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 1001.0
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
uidesc_leaderboard_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
