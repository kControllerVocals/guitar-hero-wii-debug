uidesc_DLC_First_Menu = {
	DescVersion = 18
	name = uidesc_DLC_First_Menu
	rect = [
		0.0
		0.0
		757.5
		402.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = DLC_First_Menu
				}
				{
					index = 0
					validateLocalID = MainMenu
					includeParentOwned = false
				}
			]
			name = alias_MainMenu
			visiblename = 'alias_MainMenu'
			help = 'DLC_First_Menu -> MainMenu'
		}
		{
			path = [
				{
					validateLocalID = DLC_First_Menu
				}
				{
					index = 3
					validateLocalID = SelectionHighlight
					includeParentOwned = false
				}
			]
			name = alias_SelectionHighlight
			visiblename = 'alias_SelectionHighlight'
			help = 'DLC_First_Menu -> SelectionHighlight'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = DLC_First_Menu
				}
				{
					index = 1
					validateLocalID = MOTD_Container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = MOTD_Header
					includeParentOwned = false
				}
			]
			name = MOTD_Header_text
			visiblename = 'MOTD_Header_text'
			help = 'DLC_First_Menu -> MOTD_Container -> MOTD_Header => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_First_Menu
				}
				{
					index = 1
					validateLocalID = MOTD_Container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = MOTD_Message
					includeParentOwned = false
				}
			]
			name = MOTD_Message_text
			visiblename = 'MOTD_Message_text'
			help = 'DLC_First_Menu -> MOTD_Container -> MOTD_Message => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_First_Menu
				}
				{
					index = 2
					validateLocalID = License_Message
					includeParentOwned = false
				}
			]
			name = License_Message_text
			visiblename = 'License_Message_text'
			help = 'DLC_First_Menu -> License_Message => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_First_Menu
				}
				{
					index = 0
					validateLocalID = MainMenu
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = SetList
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = SetList_Label
					includeParentOwned = false
				}
			]
			name = SetList_Label_text
			visiblename = 'SetList_Label_text'
			help = 'DLC_First_Menu -> MainMenu -> SetList -> SetList_Label => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_First_Menu
				}
				{
					index = 0
					validateLocalID = MainMenu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = Store
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = Store_Label
					includeParentOwned = false
				}
			]
			name = Store_Label_text
			visiblename = 'Store_Label_text'
			help = 'DLC_First_Menu -> MainMenu -> Store -> Store_Label => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_First_Menu
				}
				{
					index = 0
					validateLocalID = MainMenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewReleases
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewReleases_Label
					includeParentOwned = false
				}
			]
			name = NewReleases_Label_text
			visiblename = 'NewReleases_Label_text'
			help = 'DLC_First_Menu -> MainMenu -> NewReleases -> NewReleases_Label => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = DLC_First_Menu
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (510.0, 402.0)
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
		}
		children = [
			{
				props = {
					local_id = MainMenu
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (490.0, 204.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (0.0, 4.0)
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
						-1.0
						-1.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = 2
					position_children = true
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
					allow_wrap = true
					allow_alternate_directional_events = false
				}
				children = [
					{
						props = {
							local_id = NewReleases
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (490.0, 64.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 32.0)
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
						children = [
							{
								props = {
									local_id = NewReleases_Label
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (370.0, 32.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										0.0
									]
									pos = (64.0, 1.0)
									z_priority = 5.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										255
										126
										0
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs(0x65413caf)
									font = fontgrid_title_a1
									material = 0x00000000
									single_line = false
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										0.0
									]
									internal_scale = (0.5, 0.5)
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
									blend = blend
									texture = DLC_Title_Bar
									local_id = titleBar
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.52
									dims = (490.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
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
							{
								props = {
									blend = blend
									texture = DLC_Pick
									local_id = PickImage
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 5.0
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
							local_id = Store
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (490.0, 64.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 98.0)
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
						children = [
							{
								props = {
									local_id = Store_Label
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (370.0, 32.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										0.0
									]
									pos = (64.0, 1.0)
									z_priority = 5.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										255
										126
										0
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("STORE")
									font = fontgrid_title_a1
									material = 0x00000000
									single_line = false
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										0.0
									]
									internal_scale = (0.5, 0.5)
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
									blend = blend
									texture = DLC_Title_Bar
									local_id = titleBar
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.52
									dims = (490.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
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
							{
								props = {
									blend = blend
									texture = DLC_Pick
									local_id = PickImage
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 5.0
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
							local_id = SetList
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (490.0, 64.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 164.0)
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
						children = [
							{
								props = {
									local_id = SetList_Label
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (370.0, 32.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										0.0
									]
									pos = (64.0, 1.0)
									z_priority = 5.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										255
										126
										0
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs(0x16e58719)
									font = fontgrid_title_a1
									material = 0x00000000
									single_line = false
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										0.0
									]
									internal_scale = (0.5, 0.5)
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
									blend = blend
									texture = DLC_Pick
									local_id = PickImage
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 5.0
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
									texture = DLC_Title_Bar
									local_id = titleBar
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.52
									dims = (490.0, 64.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
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
				]
			}
			{
				props = {
					local_id = MOTD_Container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (490.0, 180.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (0.0, 210.0)
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
				children = [
					{
						props = {
							blend = blend
							texture = DLC_Title_Bar_Small
							local_id = titleBar
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.52
							dims = (280.0, 32.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 8.0)
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
							local_id = MOTD_Header
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (200.0, 32.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (35.0, 8.0)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								126
								0
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("Message of the Day")
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
							internal_scale = (0.25, 0.3)
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
							local_id = MOTD_Message
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (430.0, 110.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 20.0)
							z_priority = 4.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								180
								180
								180
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0x1be9b734)
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								-1.0
							]
							internal_scale = (0.3, 0.3)
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
				]
			}
			{
				props = {
					local_id = License_Message
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (180.0, 140.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (412.5, 118.5)
					z_priority = 3.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						126
						0
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs(0xfcc7d7f7)
					font = fontgrid_text_a6
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
					internal_scale = (0.35000002, 0.35000002)
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
					blend = blend
					texture = DLC_Selection_Highlight
					local_id = SelectionHighlight
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.0
					dims = (490.0, 64.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						0.0
					]
					pos = (0.0, -165.0)
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
}
uidesc_DLC_First_Menu_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
