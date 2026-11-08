uidesc_gig_pay2play = {
	DescVersion = 1
	name = uidesc_gig_pay2play
	rect = [
		48.36429
		-13.569969
		1192.3698
		446.44754
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = gig_pay2play
				}
				{
					index = 2
					validateLocalID = cash_available
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = cash_available_value
					includeParentOwned = false
				}
			]
			name = cash_available_value_text
			visiblename = 'cash_available_value_text'
			help = 'gig_pay2play -> cash_available -> cash_available_value => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = gig_pay2play
				}
				{
					index = 1
					validateLocalID = gig_cost
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = gig_cost_money
					includeParentOwned = false
				}
			]
			name = gig_cost_money_text
			visiblename = 'gig_cost_money_text'
			help = 'gig_pay2play -> gig_cost -> gig_cost_money => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = gig_pay2play
				}
				{
					index = 0
					validateLocalID = confirmation
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = decline
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = `Red Button`
					includeParentOwned = false
				}
			]
			name = red_button_text
			visiblename = 'Red_Button_text'
			help = 'gig_pay2play -> confirmation -> decline -> Red Button => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = gig_pay2play
				}
				{
					index = 0
					validateLocalID = confirmation
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = accept
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = `Green button`
					includeParentOwned = false
				}
			]
			name = green_button_text
			visiblename = 'Green_button_text'
			help = 'gig_pay2play -> confirmation -> accept -> Green button => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = gig_pay2play
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
					local_id = confirmation
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
					pos = (-1.635712, 134.93727)
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
							texture = confirm_container
							flip_v = true
							local_id = confirm_container
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
							pos = (975.9696, 114.74036)
							z_priority = 1.0
							scale = (1.3, 1.3)
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
							local_id = accept
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (150.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (961.0, 90.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								224
								224
								224
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("PURCHASE")
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.7, 0.7)
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
						children = [
							{
								props = {
									local_id = `Green button`
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (50.0, 50.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-27.332825, 24.79215)
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
									text = qs("\b4")
									font = fontgrid_text_a3
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
						]
					}
					{
						props = {
							local_id = decline
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (150.0, 50.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (961.0, 130.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								224
								224
								224
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("DECLINE")
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.7, 0.7)
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
						children = [
							{
								props = {
									local_id = `Red Button`
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (50.0, 50.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-27.332825, 24.79215)
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
									text = qs(0x066f6bee)
									font = fontgrid_text_a3
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
						]
					}
				]
			}
			{
				props = {
					local_id = gig_cost
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
					pos = (835.271, 16.304558)
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
							texture = gig_cost
							local_id = gig_cost
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
							local_id = gig_cost_money
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 40.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (100.0, 120.0)
							z_priority = 3.0
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
							text = qs("$0")
							font = fontgrid_text_a3
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
							internal_scale = (0.7, 0.7)
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
							local_id = gig_cost_text
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (170.0, 40.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (96.0, 71.0)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								224
								224
								224
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("GIG COST")
							font = fontgrid_text_a8
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
							internal_scale = (0.7, 0.7)
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
					local_id = cash_available
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
					pos = (841.6231, -63.56997)
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
							texture = cash_available
							material = 0x00000000
							local_id = cash_available_bg
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
							pos = (9.528333, 49.99997)
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
							local_id = cash_available_text
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (170.0, 40.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (89.0, 44.0)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								224
								224
								224
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("AVAILABLE")
							font = fontgrid_text_a8
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
							internal_scale = (0.7, 0.7)
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
							local_id = cash_available_value
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (170.0, 40.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (91.0, 96.0)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								224
								224
								224
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("$0")
							font = fontgrid_text_a3
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
							internal_scale = (0.7, 0.7)
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
		]
	}
}
uidesc_gig_pay2play_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
