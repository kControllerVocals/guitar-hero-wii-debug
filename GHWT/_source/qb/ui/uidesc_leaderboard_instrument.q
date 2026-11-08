uidesc_leaderboard_instrument = {
	DescVersion = 1
	name = uidesc_leaderboard_instrument
	rect = [
		-51.18977
		-50.0
		854.9881
		611.0857
	]
	aliases = [
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = instrument_select
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
			pos = (-1.1897659, 0.0)
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
					local_id = container
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
					pos = (519.9881, 276.0857)
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
							texture = instrument_selection_frame
							local_id = instrument_selection_frame
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (370.0, 370.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (100.0, 100.0)
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
					{
						props = {
							blend = blend
							texture = instrument_selecton_whitebg
							local_id = instrument_selecton_whitebg
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (220.0, 250.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (97.61847, 120.24292)
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
					}
				]
			}
			{
				props = {
					blend = blend
					texture = black_hili
					local_id = black_hili
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (240.0, 47.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (621.5527, 311.95523)
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
			{
				props = {
					local_id = menu
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 225.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (617.9805, 402.45294)
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
					internal_just = [
						0.0
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
							local_id = guitar
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (210.0, 45.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (50.0, 22.5)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								70
								130
								180
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("GUITAR")
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
							local_id = Bass
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (210.0, 45.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (50.0, 67.5)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								70
								130
								180
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("BASS")
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
							local_id = Drums
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (210.0, 45.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (50.0, 112.5)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								70
								130
								180
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("DRUMS")
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
							local_id = Vocals
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (210.0, 45.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (50.0, 157.5)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								70
								130
								180
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("VOCALS")
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
							local_id = Band
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (210.0, 45.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (50.0, 202.5)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								70
								130
								180
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("BAND")
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
					local_id = instrument_text
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (310.0, 70.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (620.8597, 250.33461)
					z_priority = 4.0
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
					text = qs("INSTRUMENT")
					font = fontgrid_text_a11_large
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
					internal_scale = (0.4, 0.4)
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
}
uidesc_leaderboard_instrument_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
