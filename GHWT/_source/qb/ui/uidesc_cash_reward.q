uidesc_cash_reward = {
	DescVersion = 7
	name = uidesc_cash_reward
	rect = [
		-44.687195
		-2.155579
		1322.6749
		720.3952
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = cash_reward_container
				}
				{
					index = 8
					validateLocalID = scrolling_menu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = cash_reward_items_list
					includeParentOwned = false
				}
			]
			name = alias_cash_reward_items_list
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = cash_reward_container
				}
				{
					index = 1
					validateLocalID = cash_reward_image_placeholder
					includeParentOwned = false
				}
			]
			name = cash_reward_image_placeholder_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = cash_reward_container
				}
				{
					index = 2
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_reward_container
				}
				{
					index = 3
					validateLocalID = cash_money
					includeParentOwned = false
				}
			]
			name = cash_money_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_reward_container
				}
				{
					index = 4
					validateLocalID = this_gig
					includeParentOwned = false
				}
			]
			name = this_gig_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_reward_container
				}
				{
					index = 5
					validateLocalID = career
					includeParentOwned = false
				}
			]
			name = career_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_reward_container
				}
				{
					index = 6
					validateLocalID = this_gig_entry
					includeParentOwned = false
				}
			]
			name = this_gig_entry_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_reward_container
				}
				{
					index = 7
					validateLocalID = career_entry
					includeParentOwned = false
				}
			]
			name = career_entry_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = cash_reward_container
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (100.0, 100.0)
		}
		children = [
			{
				props = {
					texture = cash_reward_bkgd
					local_id = cash_reward_bkgd
					type = SpriteElement
					dims = (1280.0, 720.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (495.3128, 257.84442)
				}
			}
			{
				props = {
					texture = cash_reward_image_placeholder
					local_id = cash_reward_image_placeholder
					type = SpriteElement
					hiddenLocal = true
					dims = (516.0, 720.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (919.98773, 258.2396)
					z_priority = 15.0
				}
			}
			{
				props = {
					local_id = title
					type = TextBlockElement
					dims = (300.02368, 150.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (329.76886, -0.69175)
					z_priority = 2.0
					rot_angle = -1.0
					rgba = [
						64
						64
						64
						255
					]
					text = qs("CASH REWARD")
					font = fontgrid_text_a3
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					shadow_offs = (3.0, 3.0)
					line_spacing = 0.6
				}
			}
			{
				props = {
					local_id = cash_money
					type = TextBlockElement
					dims = (200.024, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (598.0329, -4.066154)
					z_priority = 2.0
					rot_angle = 14.0
					rgba = [
						192
						0
						0
						255
					]
					text = qs("$900")
					font = fontgrid_text_a3
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					shadow_offs = (3.0, 3.0)
					line_spacing = 0.6
				}
			}
			{
				props = {
					local_id = this_gig
					type = TextBlockElement
					dims = (300.0, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (262.2245, 482.88638)
					z_priority = 2.0
					rgba = [
						123
						172
						133
						255
					]
					text = qs("THIS GIG:")
					font = fontgrid_text_a3
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						-1.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = career
					type = TextBlockElement
					dims = (300.0, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (262.93246, 524.5851)
					z_priority = 2.0
					rgba = [
						123
						172
						133
						255
					]
					text = qs("CAREER:")
					font = fontgrid_text_a3
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						-1.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = this_gig_entry
					type = TextBlockElement
					dims = (300.0, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (572.9461, 482.88638)
					z_priority = 2.0
					rgba = [
						209
						46
						54
						255
					]
					text = qs("$00000")
					font = fontgrid_text_a3
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = career_entry
					type = TextBlockElement
					dims = (300.0, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (573.9461, 522.293)
					z_priority = 2.0
					rgba = [
						209
						46
						54
						255
					]
					text = qs("$000000")
					font = fontgrid_text_a3
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = scrolling_menu
					type = ScrollingMenu
					hiddenLocal = false
					alpha = 1.0
					dims = (612.0, 400.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (183.6674, 115.0)
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
					isVertical = true
					adjust_visibility = true
					center_selection = false
					top_selection = false
				}
				children = [
					{
						props = {
							local_id = cash_reward_items_list
							type = MenuElement
							dims = (612.0, 400.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 4.0
							internal_just = [
								0.0
								-1.0
							]
							spacing_between = -50
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = false
						}
					}
				]
			}
		]
	}
}
uidesc_cash_reward_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
