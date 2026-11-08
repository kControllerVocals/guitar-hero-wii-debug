uidesc_gh_tunes_user_content_item = {
	DescVersion = 6
	name = uidesc_gh_tunes_user_content_item
	rect = [
		-102.76059
		-28.550476
		1297.7606
		100.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = user_content_item
				}
				{
					index = 0
					validateLocalID = NewElement4
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			visiblename = 'title_text'
			help = 'user_content_item -> NewElement4 -> title => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = user_content_item
				}
				{
					index = 2
					validateLocalID = NewElement6
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = user_id
					includeParentOwned = false
				}
			]
			name = user_id_text
			visiblename = 'user_id_text'
			help = 'user_content_item -> NewElement6 -> user_id => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = user_content_item
				}
				{
					index = 3
					validateLocalID = NewElement7
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = genre
					includeParentOwned = false
				}
			]
			name = genre_text
			visiblename = 'genre_text'
			help = 'user_content_item -> NewElement7 -> genre => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = user_content_item
				}
				{
					index = 4
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = number
					includeParentOwned = false
				}
			]
			name = number_text
			visiblename = 'number_text'
			help = 'user_content_item -> NewElement1 -> number => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = user_content_item
				}
				{
					index = 1
					validateLocalID = NewElement5
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = star_clip
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = five_star_full
					includeParentOwned = false
				}
			]
			name = stars_texture
			visiblename = 'stars_texture'
			help = 'user_content_item -> NewElement5 -> star_clip -> five_star_full => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = user_content_item
				}
				{
					index = 1
					validateLocalID = NewElement5
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = star_clip
					includeParentOwned = false
				}
			]
			name = star_clip_dims
			visiblename = 'star_clip_dims'
			help = 'user_content_item -> NewElement5 -> star_clip => dims'
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = user_content_item
				}
				{
					index = 1
					validateLocalID = NewElement5
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = five_star_off
					includeParentOwned = false
				}
			]
			name = five_star_off_alpha
			visiblename = 'five_star_off_alpha'
			help = 'user_content_item -> NewElement5 -> five_star_off => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = user_content_item
				}
				{
					index = 1
					validateLocalID = NewElement5
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = star_clip
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = five_star_full
					includeParentOwned = false
				}
			]
			name = five_star_full_alpha
			visiblename = 'five_star_full_alpha'
			help = 'user_content_item -> NewElement5 -> star_clip -> five_star_full => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = user_content_item
				}
				{
					index = 1
					validateLocalID = NewElement5
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = star_clip
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = five_star_full
					includeParentOwned = false
				}
			]
			name = five_star_full_rgba
			visiblename = 'five_star_full_rgba'
			help = 'user_content_item -> NewElement5 -> star_clip -> five_star_full => rgba'
			target = rgba
			type = array_color
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = user_content_item
			type = MenuElement
			hiddenLocal = false
			alpha = 1.0
			dims = (1195.0, 30.0)
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
			isVertical = false
			internal_just = [
				-1.0
				0.0
			]
			regular_space_amount = -1
			padding_scale = 1.0
			spacing_between = 0
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
					local_id = NewElement4
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (195.0, 30.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (97.5, 15.0)
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
							local_id = title
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 32.0)
							just = [
								-1.0
								1.0
							]
							pos_anchor = [
								-1.0
								1.0
							]
							pos = (57.0, 5.0)
							z_priority = 4.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								50
								50
								50
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0xe411c404)
							font = fontgrid_text_a3
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								1.0
							]
							internal_scale = (1.0, 1.0)
							blend = blend
							font_spacing = 2
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
					local_id = NewElement5
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (60.0, 30.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (222.0, 15.0)
					z_priority = 3.0
					scale = (0.9, 0.9)
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
							texture = five_star_glow
							local_id = five_star_glow
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (256.0, 32.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (255.11923, 6.78501)
							z_priority = 6.0
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
							texture = five_star_off
							local_id = five_star_off
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (256.0, 32.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (254.74307, 6.389431)
							z_priority = 4.0
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
					{
						props = {
							local_id = star_clip
							type = WindowElement
							hiddenLocal = false
							alpha = 1.0
							dims = (132.0, 25.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (186.74438, 5.5812945)
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
									texture = five_star_full
									local_id = five_star_full
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.0
									dims = (256.0, 32.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										0.0
									]
									pos = (-59.78484, 0.61124396)
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
				]
			}
			{
				props = {
					local_id = NewElement6
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (220.0, 30.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (359.0, 15.0)
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
							local_id = user_id
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 32.0)
							just = [
								-1.0
								1.0
							]
							pos_anchor = [
								-1.0
								1.0
							]
							pos = (278.3767, 5.0)
							z_priority = 4.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								50
								50
								50
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0xd8279295)
							font = fontgrid_text_a3
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								1.0
							]
							internal_scale = (1.0, 1.0)
							blend = blend
							font_spacing = 3
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
					local_id = NewElement7
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (110.0, 30.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (524.0, 15.0)
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
							local_id = genre
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (150.0, 32.0)
							just = [
								-1.0
								1.0
							]
							pos_anchor = [
								-1.0
								1.0
							]
							pos = (378.64398, 5.0)
							z_priority = 4.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								50
								50
								50
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("experimental")
							font = fontgrid_text_a3
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								1.0
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
				]
			}
			{
				props = {
					local_id = NewElement1
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (110.0, 30.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (634.0, 15.0)
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
							local_id = number
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (65.0, 32.0)
							just = [
								-1.0
								1.0
							]
							pos_anchor = [
								-1.0
								1.0
							]
							pos = (-599.66345, 5.0)
							z_priority = 4.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								50
								50
								50
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("1")
							font = fontgrid_text_a3
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								1.0
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
							blend = blend
							local_id = NewElement1
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (1000.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-181.76059, 21.449524)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								192
								192
								192
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = selection_box
							local_id = selectionbox
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (32.0, 32.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-626.0838, 18.6678)
							z_priority = 5.0
							scale = (0.8, 0.8)
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
uidesc_gh_tunes_user_content_item_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
