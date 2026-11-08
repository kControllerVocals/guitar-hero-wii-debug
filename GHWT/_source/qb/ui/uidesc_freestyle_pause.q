uidesc_freestyle_pause = {
	DescVersion = 5
	name = uidesc_freestyle_pause
	rect = [
		133.55566
		68.66671
		1024.0
		576.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = FreestylePauseContainer
				}
				{
					index = 0
					validateLocalID = pausemenu_bg
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = PauseMenuScrolling
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = PauseMenu
					includeParentOwned = false
				}
			]
			name = alias_PauseMenu
			visiblename = 'alias_PauseMenu'
			help = 'FreestylePauseContainer -> PauseMenu_BG -> PauseMenuScrolling -> PauseMenu'
		}
		{
			path = [
				{
					validateLocalID = FreestylePauseContainer
				}
				{
					index = 0
					validateLocalID = pausemenu_bg
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = PauseMenuScrolling
					includeParentOwned = false
				}
			]
			name = alias_PauseMenuScrolling
			visiblename = 'alias_PauseMenuScrolling'
			help = 'FreestylePauseContainer -> PauseMenu_BG -> PauseMenuScrolling'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = FreestylePauseContainer
				}
				{
					index = 0
					validateLocalID = pausemenu_bg
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = PauseTitle
					includeParentOwned = false
				}
			]
			name = PauseTitle_text
			visiblename = 'PauseTitle_text'
			help = 'FreestylePauseContainer -> PauseMenu_BG -> PauseTitle => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = FreestylePauseContainer
				}
				{
					index = 0
					validateLocalID = pausemenu_bg
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = PauseTitle
					includeParentOwned = false
				}
			]
			name = PauseTitle_rgba
			visiblename = 'PauseTitle_rgba'
			help = 'FreestylePauseContainer -> PauseMenu_BG -> PauseTitle => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = FreestylePauseContainer
				}
				{
					index = 0
					validateLocalID = pausemenu_bg
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = GuitarContainer
					includeParentOwned = false
				}
			]
			name = GuitarContainer_alpha
			visiblename = 'GuitarContainer_alpha'
			help = 'FreestylePauseContainer -> PauseMenu_BG -> GuitarContainer => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = FreestylePauseContainer
				}
				{
					index = 0
					validateLocalID = pausemenu_bg
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = DrumContainer
					includeParentOwned = false
				}
			]
			name = DrumContainer_alpha
			visiblename = 'DrumContainer_alpha'
			help = 'FreestylePauseContainer -> PauseMenu_BG -> DrumContainer => alpha'
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = FreestylePauseContainer
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (1024.0, 576.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (645.55566, 356.66672)
			z_priority = 100.0
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
					texture = pausemenu_bg
					local_id = pausemenu_bg
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (512.0, 512.0)
					just = [
						0.0
						1.0
					]
					pos_anchor = [
						0.0
						1.0
					]
					pos = (0.0, 0.0)
					z_priority = 100.0
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
							local_id = PauseTitle
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (180.0, 60.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (0.0, 44.99997)
							z_priority = 101.0
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
							text = qs("Placeholder")
							font = fontgrid_title_a1
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
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
							shadow_offs = (3.0, 3.0)
							line_spacing = 1.0
						}
					}
					{
						props = {
							local_id = PauseMenuScrolling
							type = ScrollingMenu
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 512.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								0.0
							]
							pos = (64.0, 16.0)
							z_priority = 102.0
							scale = (0.75, 0.75)
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
									local_id = PauseMenu
									type = MenuElement
									hiddenLocal = false
									alpha = 1.0
									dims = (512.0, 512.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 102.0
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
										0.0
									]
									regular_space_amount = -1
									padding_scale = 1.0
									spacing_between = -25
									position_children = true
									fit_major = `expand if content larger`
									fit_minor = `keep dims`
									scale_mode = proportional
									allow_wrap = true
									allow_alternate_directional_events = false
								}
							}
						]
					}
					{
						props = {
							local_id = GuitarContainer
							type = ContainerElement
							hiddenLocal = false
							alpha = 0.0
							dims = (512.0, 128.0)
							just = [
								-1.0
								1.0
							]
							pos_anchor = [
								-1.0
								1.0
							]
							pos = (0.0, -20.0)
							z_priority = 102.0
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
									texture = pauseMenu_Guitarist
									local_id = pauseMenu_Guitarist
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (256.0, 128.0)
									just = [
										-1.0
										1.0
									]
									pos_anchor = [
										-1.0
										1.0
									]
									pos = (0.0, 0.0)
									z_priority = 102.0
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
									texture = pauseMenu_Guitarist
									flip_v = true
									local_id = pauseMenu_Guitarist
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (256.0, 128.0)
									just = [
										1.0
										1.0
									]
									pos_anchor = [
										1.0
										1.0
									]
									pos = (0.0, 0.0)
									z_priority = 102.0
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
							local_id = DrumContainer
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 128.0)
							just = [
								-1.0
								1.0
							]
							pos_anchor = [
								-1.0
								1.0
							]
							pos = (0.0, -20.0)
							z_priority = 102.0
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
									texture = pauseMenu_Drummer
									local_id = pauseMenu_Drummer
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (256.0, 128.0)
									just = [
										-1.0
										1.0
									]
									pos_anchor = [
										-1.0
										1.0
									]
									pos = (0.0, 0.0)
									z_priority = 102.0
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
									texture = pauseMenu_Drummer
									flip_v = true
									local_id = pauseMenu_Drummer
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (256.0, 128.0)
									just = [
										1.0
										1.0
									]
									pos_anchor = [
										1.0
										1.0
									]
									pos = (0.0, 0.0)
									z_priority = 102.0
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
		]
	}
}
uidesc_freestyle_pause_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
