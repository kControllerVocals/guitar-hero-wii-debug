uidesc_top_rockers = {
	DescVersion = 3
	name = uidesc_top_rockers
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
					validateLocalID = top_rockers_container
				}
				{
					index = 1
					validateLocalID = top_rockers_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = top_rockers_desc_menu
					includeParentOwned = false
				}
			]
			name = alias_top_rockers_desc_menu
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = top_rockers_container
				}
				{
					index = 1
					validateLocalID = top_rockers_text_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = song_title_text
					includeParentOwned = false
				}
			]
			name = song_title_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = top_rockers_container
				}
				{
					index = 1
					validateLocalID = top_rockers_text_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = difficulty_text
					includeParentOwned = false
				}
			]
			name = difficulty_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = top_rockers_container
				}
				{
					index = 1
					validateLocalID = top_rockers_text_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = icon_difficulty
					includeParentOwned = false
				}
			]
			name = icon_difficulty_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = top_rockers_container
				}
				{
					index = 1
					validateLocalID = top_rockers_text_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = icon_difficulty
					includeParentOwned = false
				}
			]
			name = icon_difficulty_texture2
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = top_rockers_container
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
					texture = toprockers_polaroid_bkgd
					local_id = toprockers_polaroid_bkgd
					type = SpriteElement
					dims = (1280.0, 720.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
			}
			{
				props = {
					local_id = top_rockers_text_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (125.654175, 82.89725)
					z_priority = 1.0
					rot_angle = -5.0
				}
				children = [
					{
						props = {
							local_id = top_rockers_desc_menu
							type = MenuElement
							dims = (100.0, 408.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-262.73282, -288.23212)
							z_priority = 1.0
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -4
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = top_rockers_desc_01
									type = DescInterface
									hiddenLocal = false
									alpha = 1.0
									dims = (600.00006, 80.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 128.0)
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
									desc = 'top_rockers_desc'
									autoSizeDims = true
									score_text = qs("000,000")
									name_text = qs("Player Name")
								}
							}
							{
								props = {
									local_id = top_rockers_desc_02
									type = DescInterface
									hiddenLocal = false
									alpha = 1.0
									dims = (600.00006, 80.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 204.0)
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
									desc = 'top_rockers_desc'
									autoSizeDims = true
									score_text = qs("000,000")
									name_text = qs("Player Name")
								}
							}
							{
								props = {
									local_id = top_rockers_desc_03
									type = DescInterface
									hiddenLocal = false
									alpha = 1.0
									dims = (600.00006, 80.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (50.0, 280.0)
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
									desc = 'top_rockers_desc'
									autoSizeDims = true
									score_text = qs("000,000")
									name_text = qs("Player Name")
								}
							}
						]
					}
					{
						props = {
							local_id = song_title_text
							type = TextBlockElement
							dims = (480.0, 40.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-287.63184, -355.53598)
							z_priority = 2.0
							rgba = [
								249
								233
								173
								255
							]
							text = qs("I HATE MYSELF FOR LOVING YOU")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							use_shadow = true
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = difficulty_text
							type = TextBlockElement
							dims = (170.0, 50.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-305.3264, -317.01318)
							z_priority = 2.0
							rgba = [
								249
								233
								173
								255
							]
							text = qs("MEDIUM")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							use_shadow = true
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							texture = icon_diff_outline_01
							local_id = icon_difficulty
							type = SpriteElement
							dims = (52.0, 52.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-415.42087, -315.92474)
							z_priority = 2.0
						}
					}
					{
						props = {
							texture = icon_diff_outline_01
							local_id = icon_difficulty
							type = SpriteElement
							dims = (52.0, 52.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-194.08195, -314.4413)
							z_priority = 2.0
						}
					}
				]
			}
		]
	}
}
uidesc_top_rockers_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
