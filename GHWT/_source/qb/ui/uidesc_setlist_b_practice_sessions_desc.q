uidesc_setlist_b_practice_sessions_desc = {
	DescVersion = 4
	name = uidesc_setlist_b_practice_sessions_desc
	rect = [
		-450.0
		-30.0
		1730.0
		750.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = Setlist_B_speed_container
				}
				{
					index = 0
					validateLocalID = sections_B_scrollmenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = sections_B_menu
					includeParentOwned = false
				}
			]
			name = alias_menu
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = Setlist_B_speed_container
				}
				{
					index = 5
					validateLocalID = message
					includeParentOwned = false
				}
			]
			name = message_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Setlist_B_speed_container
				}
				{
					index = 7
					validateLocalID = scroll
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = setlist_popup_scroll_thumb
					includeParentOwned = false
				}
			]
			name = scroll_thumb_pos
			target = pos
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = Setlist_B_speed_container
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
					local_id = sections_B_scrollmenu
					type = ScrollingMenu
					hiddenLocal = false
					alpha = 1.0
					dims = (768.0, 260.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-1.3434719, 43.95897)
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
				}
				children = [
					{
						props = {
							local_id = sections_B_menu
							type = MenuElement
							dims = (768.0, 6.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 5.0
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -6
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
					local_id = darken_bkgd
					type = SpriteElement
					alpha = 0.4
					dims = (1280.0, 720.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
					rgba = [
						0
						0
						0
						255
					]
				}
			}
			{
				props = {
					local_id = title
					type = TextBlockElement
					dims = (760.0, 80.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-1.8843809, -226.10841)
					z_priority = 12.0
					rgba = [
						192
						192
						192
						255
					]
					text = qs("PRACTICE SECTIONS")
					font = fontgrid_text_a11_large
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
				}
			}
			{
				props = {
					texture = setlist_popup_big_frame
					local_id = setlist_popup_big_frame
					type = SpriteElement
					dims = (1024.0, 512.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-0.95187396, -22.757757)
					z_priority = 10.0
				}
			}
			{
				props = {
					texture = setlist_popup_white_bkgd
					local_id = popup_white_bkgd
					type = SpriteElement
					dims = (859.0, 368.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-1.522964, -3.5783079)
					z_priority = 1.0
				}
			}
			{
				props = {
					local_id = message
					type = TextBlockElement
					dims = (760.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-1.8843809, -155.69392)
					z_priority = 5.0
					rgba = [
						64
						64
						64
						255
					]
					text = qs("SELECT START SECTION")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						0.0
						0.0
					]
				}
			}
			{
				props = {
					local_id = line
					type = SpriteElement
					alpha = 0.4
					dims = (800.0, 8.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-6.8843694, -108.604965)
					z_priority = 5.0
					rgba = [
						0
						0
						0
						255
					]
				}
			}
			{
				props = {
					local_id = scroll
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (100.0, 100.0)
					z_priority = 11.0
				}
				children = [
					{
						props = {
							texture = setlist_popup_scroll_bar
							local_id = setlist_popup_scroll_bar
							type = SpriteElement
							dims = (16.0, 256.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (354.70612, -100.672325)
							z_priority = 11.0
						}
					}
					{
						props = {
							texture = setlist_popup_scroll_arrow
							local_id = setlist_popup_scroll_arrow_down
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (352.59042, 56.734848)
							z_priority = 11.0
						}
					}
					{
						props = {
							texture = setlist_popup_scroll_thumb
							local_id = setlist_popup_scroll_thumb
							type = SpriteElement
							dims = (72.0, 70.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (358.0, -194.0)
							z_priority = 12.0
						}
					}
					{
						props = {
							texture = setlist_popup_scroll_arrow
							flip_v = false
							flip_h = true
							local_id = setlist_popup_scroll_arrow_up
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (352.59042, -264.7737)
							z_priority = 11.0
						}
					}
				]
			}
			{
				props = {
					local_id = setlist_b_practice_sessions_item_desc
					type = DescInterface
					hiddenLocal = true
					alpha = 1.0
					dims = (760.0, 45.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
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
					desc = 'setlist_b_practice_sessions_item_desc'
					autoSizeDims = false
					section_text = qs("")
					section_rgba = [
						93
						30
						28
						255
					]
					highlight_alpha = 0.0
					highlight_rgba = [
						255
						255
						255
						220
					]
					strikeout_texture = 0x00000000
					strikeout_alpha = 0.0
				}
			}
		]
	}
}
uidesc_setlist_b_practice_sessions_desc_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
