uidesc_Rock_Archive = {
	DescVersion = 6
	name = uidesc_Rock_Archive
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
					validateLocalID = Rock_Archive
				}
				{
					index = 0
					validateLocalID = Left_Menu_Container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = Left_Scrolling_Menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Left_Menu
					includeParentOwned = false
				}
			]
			name = alias_Left_Menu
			visiblename = 'alias_Left_Menu'
			help = 'Rock_Archive -> Left_Menu_Container -> Left_Scrolling_Menu -> Left_Menu'
		}
		{
			path = [
				{
					validateLocalID = Rock_Archive
				}
				{
					index = 3
					validateLocalID = SelectionHighlight
					includeParentOwned = false
				}
			]
			name = alias_SelectionHighlight
			visiblename = 'alias_SelectionHighlight'
			help = 'Rock_Archive -> SelectionHighlight'
		}
		{
			path = [
				{
					validateLocalID = Rock_Archive
				}
				{
					index = 2
					validateLocalID = Right_Menu_Container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = Right_Scrolling_Menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Right_Menu
					includeParentOwned = false
				}
			]
			name = alias_Right_Menu
			visiblename = 'alias_Right_Menu'
			help = 'Rock_Archive -> Right_Menu_Container -> Right_Scrolling_Menu -> Right_Menu'
		}
		{
			path = [
				{
					validateLocalID = Rock_Archive
				}
				{
					index = 0
					validateLocalID = Left_Menu_Container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = Left_Menu_Highlight
					includeParentOwned = false
				}
			]
			name = alias_Left_Menu_Highlight
			visiblename = 'alias_Left_Menu_Highlight'
			help = 'Rock_Archive -> Left_Menu_Container -> Left_Menu_Highlight'
		}
		{
			path = [
				{
					validateLocalID = Rock_Archive
				}
				{
					index = 2
					validateLocalID = Right_Menu_Container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = Right_Menu_Highlight
					includeParentOwned = false
				}
			]
			name = alias_Right_Menu_Highlight
			visiblename = 'alias_Right_Menu_Highlight'
			help = 'Rock_Archive -> Right_Menu_Container -> Right_Menu_Highlight'
		}
		{
			path = [
				{
					validateLocalID = Rock_Archive
				}
			]
			name = alias_Rock_Archive
			visiblename = 'alias_Rock_Archive'
			help = 'Rock_Archive'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = Rock_Archive
				}
				{
					index = 0
					validateLocalID = Left_Menu_Container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = Wii_Size
					includeParentOwned = false
				}
			]
			name = Wii_Size_Text
			visiblename = 'Wii_Size_text'
			help = 'Rock_Archive -> Left_Menu_Container -> Wii_Size => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Rock_Archive
				}
				{
					index = 2
					validateLocalID = Right_Menu_Container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = SD_Size
					includeParentOwned = false
				}
			]
			name = SD_Size_Text
			visiblename = 'SD_Size_text'
			help = 'Rock_Archive -> Right_Menu_Container -> SD_Size => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Rock_Archive
				}
				{
					index = 0
					validateLocalID = Left_Menu_Container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Wii_Header
					includeParentOwned = false
				}
			]
			name = Wii_Header_text
			visiblename = 'Wii_Header_text'
			help = 'Rock_Archive -> Left_Menu_Container -> Wii_Header => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Rock_Archive
				}
				{
					index = 2
					validateLocalID = Right_Menu_Container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = SD_Header
					includeParentOwned = false
				}
			]
			name = SD_Header_text
			visiblename = 'SD_Header_text'
			help = 'Rock_Archive -> Right_Menu_Container -> SD_Header => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = Rock_Archive
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (640.0, 480.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (640.0, 360.0)
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
					local_id = Left_Menu_Container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (310.0, 360.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-256.0, -160.0)
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
							local_id = Wii_Header
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (180.0, 50.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (-4.0, 7.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								45
								56
								104
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0xada70e74)
							font = fontgrid_title_a1
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.8, 0.8)
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
							local_id = Wii_Size
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (200.0, 45.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (-4.0, 12.5)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								1
								10
								30
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0xc8af55e2)
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.45000002, 0.45000002)
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
							local_id = Left_Scrolling_Menu
							type = ScrollingMenu
							hiddenLocal = false
							alpha = 1.0
							dims = (310.0, 250.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 10.0)
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
									local_id = Left_Menu
									type = MenuElement
									hiddenLocal = false
									alpha = 1.0
									dims = (310.0, 250.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
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
									isVertical = true
									internal_just = [
										0.0
										-1.0
									]
									regular_space_amount = -1
									padding_scale = 1.0
									spacing_between = 2
									position_children = true
									fit_major = `keep dims`
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
							blend = blend
							texture = RA_Blue_Highlight
							local_id = Left_Menu_Highlight
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (535.0, 619.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-6.0, -60.0)
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
					blend = blend
					texture = RA_BG
					local_id = RA_BG
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1024.0, 720.0)
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
					scale = (1.25, 1.0)
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
					local_id = Right_Menu_Container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (310.0, 360.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (267.0, -160.0)
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
							local_id = SD_Header
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (180.0, 50.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (-2.0, 7.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								250
								119
								3
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0x93160aae)
							font = fontgrid_title_a1
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.8, 0.8)
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
							local_id = SD_Size
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (200.0, 45.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (-4.0, 12.5)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								1
								10
								30
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0xc8af55e2)
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.45000002, 0.45000002)
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
							local_id = Right_Scrolling_Menu
							type = ScrollingMenu
							hiddenLocal = false
							alpha = 1.0
							dims = (310.0, 250.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 10.0)
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
									local_id = Right_Menu
									type = MenuElement
									hiddenLocal = false
									alpha = 1.0
									dims = (310.0, 250.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
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
									isVertical = true
									internal_just = [
										0.0
										-1.0
									]
									regular_space_amount = -1
									padding_scale = 1.0
									spacing_between = 2
									position_children = true
									fit_major = `keep dims`
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
							blend = blend
							texture = RA_Orange_Highlight
							local_id = Right_Menu_Highlight
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (535.0, 619.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-6.0, -60.0)
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
					blend = blend
					texture = RA_Title_Highlight
					local_id = SelectionHighlight
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.0
					dims = (330.0, 39.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-256.0, -44.0)
					z_priority = 4.0
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
}
uidesc_Rock_Archive_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
