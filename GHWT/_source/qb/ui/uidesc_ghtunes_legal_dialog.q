uidesc_ghtunes_legal_dialog = {
	DescVersion = 4
	name = uidesc_ghtunes_legal_dialog
	rect = [
		22.0
		13.0
		1199.8054
		703.3085
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = gh_tunes_share
				}
				{
					index = 7
					validateLocalID = text_window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text_menu
					includeParentOwned = false
				}
			]
			name = alias_text_menu
			visiblename = 'alias_text_menu'
			help = 'gh_tunes_share -> text_window -> text_menu'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = gh_tunes_share
				}
				{
					index = 5
					validateLocalID = legal_title
					includeParentOwned = false
				}
			]
			name = legal_title_text
			visiblename = 'legal_title_text'
			help = 'gh_tunes_share -> legal_title => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = gh_tunes_share
				}
				{
					index = 8
					validateLocalID = scrollbar
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = scrollbar_thumb
					includeParentOwned = false
				}
			]
			name = scrollbar_pos
			visiblename = 'scrollbar_pos'
			help = 'gh_tunes_share -> scrollbar -> scrollbar_thumb => pos'
			target = pos
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = gh_tunes_share
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (22.0, 13.0)
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
					blend = blend
					texture = gh_tunes_logo
					local_id = GHTuneslogo
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (256.0, 128.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (855.95917, 50.48104)
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
					local_id = songlistcontainer
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (89.986275, 76.78305)
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
							local_id = boxtop
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (973.0, 2.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-3.979294, 91.01159)
							z_priority = 5.0
							scale = (1.1, 1.0)
							rot_angle = 0.0
							rgba = [
								220
								122
								5
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							local_id = boxtop
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (973.0, 2.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-3.979294, 78.124756)
							z_priority = 5.0
							scale = (1.1, 1.0)
							rot_angle = 0.0
							rgba = [
								220
								122
								5
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
					texture = alltime_best_icon
					local_id = watermark
					type = SpriteElement
					hiddenLocal = true
					alpha = 0.2
					dims = (256.0, 256.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (744.01825, 253.57207)
					z_priority = 3.0
					scale = (1.3, 1.3)
					rot_angle = 5.0
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
					local_id = frame
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
							texture = player_frame
							local_id = player_frame
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1024.0, 512.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (466.1255, 207.70851)
							z_priority = 10.0
							scale = (1.14, 1.3499999)
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
							texture = white
							local_id = player_bg
							type = SpriteElement
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
							pos = (456.3029, 196.38123)
							z_priority = 2.0
							scale = (10.5, 6.0)
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
							blend = blend
							local_id = header_bg
							type = SpriteElement
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
							pos = (457.4868, -38.026215)
							z_priority = 2.5
							scale = (10.0, 1.0)
							rot_angle = 0.0
							rgba = [
								10
								10
								10
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
					texture = gh_tunes_logo_bg
					local_id = gh_tunes_logo_bg
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (256.0, 128.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (934.1994, 64.634224)
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
					local_id = legal_title
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (500.0, 45.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (146.79626, 85.166725)
					z_priority = 12.0
					scale = (1.1, 1.1)
					rot_angle = 0.0
					rgba = [
						220
						220
						220
						250
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs("CONTENT SUBMISSION AGREEMENT")
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
			{
				props = {
					blend = blend
					texture = alltime_best_icon
					local_id = icon
					type = SpriteElement
					hiddenLocal = true
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
					pos = (772.65546, 82.348976)
					z_priority = 61.0
					scale = (0.98999995, 0.98999995)
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
					local_id = text_window
					type = WindowElement
					hiddenLocal = false
					alpha = 1.0
					dims = (975.0, 455.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (135.0, 174.0)
					z_priority = 10.0
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
							local_id = text_menu
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
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
							isVertical = true
							internal_just = [
								-1.0
								-1.0
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
					}
				]
			}
			{
				props = {
					blend = blend
					texture = scrollbar
					local_id = scrollbar
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
					pos = (1028.4541, 347.9001)
					z_priority = 11.0
					scale = (1.0, 0.97999996)
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
							texture = scrollbar_thumb
							local_id = scrollbar_thumb
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (-1.0, 42.0)
							z_priority = 15.0
							scale = (1.0, 1.0204079)
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
uidesc_ghtunes_legal_dialog_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
