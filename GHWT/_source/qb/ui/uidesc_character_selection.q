uidesc_character_selection = {
	DescVersion = 5
	name = uidesc_character_selection
	rect = [
		-121.67632
		-77.2503
		964.9035
		1024.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = character_selection
				}
				{
					index = 0
					validateLocalID = character_selection_control
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = character_selection_window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_selection_smenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_selection_vmenu
					includeParentOwned = false
				}
			]
			name = alias_character_selection_vmenu
		}
		{
			path = [
				{
					validateLocalID = character_selection
				}
				{
					index = 0
					validateLocalID = character_selection_control
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = character_selection_window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_selection_smenu
					includeParentOwned = false
				}
			]
			name = alias_character_selection_smenu
		}
		{
			path = [
				{
					validateLocalID = character_selection
				}
				{
					index = 0
					validateLocalID = character_selection_control
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = character_selection_window
					includeParentOwned = false
				}
			]
			name = alias_character_selection_window
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = character_selection
				}
				{
					index = 0
					validateLocalID = character_selection_control
					includeParentOwned = false
				}
			]
			name = character_selection_control_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = character_selection
				}
				{
					index = 0
					validateLocalID = character_selection_control
					includeParentOwned = false
				}
			]
			name = character_selection_control_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = character_selection
				}
				{
					index = 0
					validateLocalID = character_selection_control
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_selection_flame
					includeParentOwned = false
				}
			]
			name = character_selection_flame_scale
			target = scale
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = character_selection
			type = ContainerElement
			dims = (512.0, 1024.0)
			just = [
				-1.0
				-1.0
			]
			pos = (75.227196, -77.2503)
			z_priority = 130.0
		}
		children = [
			{
				props = {
					local_id = character_selection_control
					type = ContainerElement
					dims = (512.0, 20.0)
					just = [
						-1.0
						-1.0
					]
					pos = (256.0, 0.0)
					z_priority = 131.0
				}
				children = [
					{
						props = {
							texture = flame
							local_id = character_selection_flame
							type = SpriteElement
							dims = (32.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-483.2669, 243.43384)
							z_priority = 133.0
						}
					}
					{
						props = {
							flip_h = false
							flip_v = false
							texture = new_bio_textbg
							material = 0x00000000
							local_id = character_selection_bg
							type = SpriteElement
							dims = (800.0, 800.0)
							just = [
								0.0
								-1.0
							]
							pos = (-52.90354, 2.460617)
							z_priority = 120.0
						}
					}
					{
						props = {
							flip_h = false
							flip_v = false
							texture = new_bio_bg
							material = 0x00000000
							local_id = character_selection_frame
							type = SpriteElement
							dims = (800.0, 800.0)
							just = [
								0.0
								-1.0
							]
							pos = (-52.90354, 2.460617)
							z_priority = 132.0
						}
					}
					{
						props = {
							local_id = character_selection_window
							type = WindowElement
							hiddenLocal = false
							alpha = 1.0
							dims = (520.0, 625.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-206.0, 175.0)
							z_priority = 131.0
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
									local_id = character_selection_smenu
									type = ScrollingMenu
									hiddenLocal = false
									alpha = 1.0
									dims = (65.0, 580.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (10.37992, 66.1417)
									z_priority = 120.0
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
											local_id = character_selection_vmenu
											type = MenuElement
											dims = (65.0, 580.0)
											just = [
												-1.0
												-1.0
											]
											pos = (0.0, 0.0)
											z_priority = 121.0
											fit_major = `keep dims`
											fit_minor = `keep dims`
											scale_mode = proportional
										}
									}
								]
							}
						]
					}
				]
			}
		]
	}
}
uidesc_character_selection_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
