uidesc_online_lobby_left_side = {
	DescVersion = 2
	name = uidesc_online_lobby_left_side
	rect = [
		21.316406
		-40.14856
		716.8
		806.4
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = lobby_menu
				}
				{
					index = 0
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = left_side_vscollingmenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = left_side_vmenu
					includeParentOwned = false
				}
			]
			name = alias_left_side_vmenu
			visiblename = 'alias_left_side_vmenu'
			help = 'lobby_menu -> left_side_container -> left_side_vscollingmenu -> left_side_vmenu'
		}
		{
			path = [
				{
					validateLocalID = lobby_menu
				}
				{
					index = 0
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = left_side_vscollingmenu
					includeParentOwned = false
				}
			]
			name = alias_left_side_vscollingmenu
			visiblename = 'alias_left_side_vscollingmenu'
			help = 'lobby_menu -> left_side_container -> left_side_vscollingmenu'
		}
		{
			path = [
				{
					validateLocalID = lobby_menu
				}
				{
					index = 0
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = info_pane_container
					includeParentOwned = false
				}
			]
			name = alias_info_container
			visiblename = 'alias_info_container'
			help = 'lobby_menu -> left_side_container -> info_pane_container'
		}
		{
			path = [
				{
					validateLocalID = lobby_menu
				}
				{
					index = 0
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = online_lobby_scrollbar
					includeParentOwned = false
				}
			]
			name = alias_online_lobby_scrollbar
			visiblename = 'alias_online_lobby_scrollbar'
			help = 'lobby_menu -> left_side_container -> online_lobby_scrollbar'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = lobby_menu
				}
				{
					index = 0
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = background_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = banner_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			visiblename = 'title_text'
			help = 'lobby_menu -> left_side_container -> background_container -> banner_container -> title => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = lobby_menu
				}
				{
					index = 0
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = info_pane_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = info_pane_text
					includeParentOwned = false
				}
			]
			name = info_text
			visiblename = 'info_text'
			help = 'lobby_menu -> left_side_container -> info_pane_container -> info_pane_text => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = lobby_menu
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (100.0, 100.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (100.0, 100.0)
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
					local_id = left_side_container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (0.0, 0.0)
					just = [
						0.0
						0.0
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
							local_id = background_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (0.0, 0.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (45.801517, 58.015266)
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
									blend = blend
									texture = Menu_Online_Options_Bg
									material = 0x00000000
									local_id = background
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (512.0, 512.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (283.9149, 250.77872)
									z_priority = 3.0
									scale = (1.4, 1.42)
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
									texture = theme_guitar
									material = 0x00000000
									local_id = theme
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.33
									dims = (128.0, 512.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (188.8016, 255.0362)
									z_priority = 3.1
									scale = (1.5, 1.575)
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
									local_id = banner_container
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
										0.0
									]
									pos = (100.0, 100.0)
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
											texture = Menu_Online_Options_Banner
											material = 0x00000000
											local_id = banner
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (512.0, 128.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (190.98178, -139.93277)
											z_priority = 3.2
											scale = (1.22, 1.22)
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
											local_id = title
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (350.0, 40.0)
											just = [
												0.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (218.74734, -104.13767)
											z_priority = 3.3
											scale = (1.0, 1.0)
											rot_angle = 0.0
											rgba = [
												200
												200
												200
												255
											]
											events_blocked = 0
											preserve_local_orientation = false
											text = qs("ANYTHING")
											font = fontgrid_text_a6
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
											shadow_offs = (0.0, 0.0)
											line_spacing = 1.0
										}
									}
								]
							}
						]
					}
					{
						props = {
							local_id = info_pane_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (0.0, 0.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (147.4057, 392.2615)
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
						children = [
							{
								props = {
									blend = blend
									flip_h = false
									flip_v = false
									texture = Menu_Online_Options_Infobox
									local_id = info_pane_bg
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (256.0, 256.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-18.32077, -125.19083)
									z_priority = 4.1
									scale = (1.4499999, 1.4499999)
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
									local_id = info_pane_text
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (440.0, 335.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (37.08784, -26.534452)
									z_priority = 4.1
									scale = (0.6, 0.6)
									rot_angle = 0.0
									rgba = [
										200
										200
										200
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("find other players across the world to play Guitar Hero with")
									font = fontgrid_text_a8
									material = 0x00000000
									single_line = false
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										-1.0
									]
									internal_scale = (1.25, 1.25)
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
									shadow_offs = (0.0, 0.0)
									line_spacing = 1.0
								}
							}
						]
					}
					{
						props = {
							local_id = left_side_vscollingmenu
							type = ScrollingMenu
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 215.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (142.98462, 91.89313)
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
							adjust_visibility = true
							center_selection = false
							top_selection = false
						}
						children = [
							{
								props = {
									local_id = left_side_vmenu
									type = MenuElement
									hiddenLocal = false
									alpha = 1.0
									dims = (256.0, 215.0)
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
										-1.0
										-1.0
									]
									regular_space_amount = -1
									padding_scale = 1.0
									spacing_between = 0
									position_children = true
									fit_major = `keep dims`
									fit_minor = `keep dims`
									scale_mode = proportional
									allow_wrap = true
									allow_alternate_directional_events = false
									tags = {
										tag_selected_id = 0x0a09aa05
										tag_selected_index = 0
										tag_selected_childs_grid_index = -1
									}
								}
							}
						]
					}
					{
						props = {
							local_id = online_lobby_scrollbar
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 256.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (436.79736, 55.182083)
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
							desc = 'online_lobby_scrollbar'
							autoSizeDims = true
							scrollbar_thumb_pos = (0.0, 0.0)
							scrollbar_bg_dims = (16.0, 200.0)
							scrollbar_arrow_down_pos = (-1.0, 190.0)
							scrollbar_arrow_up_pos = (1.0, -11.0)
						}
					}
				]
			}
		]
	}
}
uidesc_online_lobby_left_side_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
