uidesc_invite_info1 = {
	DescVersion = 2
	name = uidesc_invite_info1
	rect = [
		430.18845
		154.90454
		420.0
		409.60004
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = NewElement16
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = Icon_Guitar
					includeParentOwned = false
				}
			]
			name = Guitar_alpha
			visiblename = 'Guitar_alpha'
			help = 'NewElement1 -> NewElement16 -> Icon_Guitar => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = NewElement16
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = Icon_Bass
					includeParentOwned = false
				}
			]
			name = Bass_alpha
			visiblename = 'Bass_alpha'
			help = 'NewElement1 -> NewElement16 -> Icon_Bass => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = NewElement16
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = Icon_Drum
					includeParentOwned = false
				}
			]
			name = Drum_alpha
			visiblename = 'Drum_alpha'
			help = 'NewElement1 -> NewElement16 -> Icon_Drum => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = NewElement16
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = Icon_Vocal
					includeParentOwned = false
				}
			]
			name = Vocal_alpha
			visiblename = 'Vocal_alpha'
			help = 'NewElement1 -> NewElement16 -> Icon_Vocal => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = NewElement16
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement4
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement8
					includeParentOwned = false
				}
			]
			name = Players_Text
			visiblename = 'Players_Text'
			help = 'NewElement1 -> NewElement16 -> NewElement4 -> NewElement8 => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = NewElement16
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = NewElement5
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement7
					includeParentOwned = false
				}
			]
			name = GameMode_text
			visiblename = 'GameMode_text'
			help = 'NewElement1 -> NewElement16 -> NewElement5 -> NewElement7 => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = NewElement16
					includeParentOwned = false
				}
			]
			name = Valid_Info_alpha
			visiblename = 'Valid_Info_alpha'
			help = 'NewElement1 -> NewElement16 => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 3
					validateLocalID = NewElement17
					includeParentOwned = false
				}
			]
			name = Invalid_Invite_alpha
			visiblename = 'Invalid_Invite_alpha'
			help = 'NewElement1 -> NewElement17 => alpha'
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = NewElement1
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
			pos = (640.1885, 359.70456)
			z_priority = 0.0
			scale = (0.7, 0.8)
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
					texture = message_bg
					local_id = message_bg
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (600.0, 512.0)
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
					local_id = NewElement16
					type = ContainerElement
					hiddenLocal = false
					alpha = 0.0
					dims = (100.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-0.269257, 0.369324)
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
							local_id = NewElement4
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 81.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (53.016476, 219.31274)
							z_priority = 5.0
							scale = (0.7, 0.7)
							rot_angle = 0.0
							rgba = [
								136
								76
								36
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = $wii_invite_info_players
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								-1.0
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
						children = [
							{
								props = {
									local_id = NewElement8
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (200.0, 70.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (365.0587, 38.2061)
									z_priority = 6.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										102
										77
										64
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs(0x27289887)
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
									shadow_offs = (3.0, 3.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									blend = blend
									texture = friend
									local_id = friend_icon
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-23.02475, 41.409954)
									z_priority = 2.0
									scale = (1.4285709, 1.4285709)
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
							local_id = NewElement5
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (382.0, 81.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (56.584778, -44.57756)
							z_priority = 5.0
							scale = (0.7, 0.7)
							rot_angle = 0.0
							rgba = [
								136
								76
								36
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = $wii_invite_info_gamemode
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								-1.0
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
						children = [
							{
								props = {
									local_id = NewElement7
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (550.0, 100.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (191.65518, 120.79111)
									z_priority = 6.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										102
										77
										64
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs(0x2c48a154)
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
							local_id = NewElement6
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (306.6, 56.7)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (4.551248, 26.394463)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								136
								76
								36
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = $wii_invite_info_instruments
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								-1.0
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
							blend = blend
							texture = Logo_Guitar_GrayScale
							local_id = Icon_Guitar
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-131.0517, 93.30383)
							z_priority = 5.0
							scale = (1.2, 1.2)
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
							texture = Logo_Bass_GrayScale
							local_id = Icon_Bass
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-40.0549, 93.30368)
							z_priority = 2.0
							scale = (1.2, 1.2)
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
							texture = Logo_Drum_GrayScale
							local_id = Icon_Drum
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (50.9419, 93.30377)
							z_priority = 2.0
							scale = (1.2, 1.2)
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
							texture = Logo_Vocal_GrayScale
							local_id = Icon_Vocal
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (136.5859, 93.30377)
							z_priority = 2.0
							scale = (1.2, 1.2)
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
					local_id = NewElement3
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (405.0, 81.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (2.140935, -185.205)
					z_priority = 5.0
					scale = (0.7, 0.7)
					rot_angle = 0.0
					rgba = [
						136
						76
						36
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = $wii_invite_info_invite_info
					font = fontgrid_text_a6
					material = 0x00000000
					single_line = false
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						-1.0
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
					local_id = NewElement17
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (301.35684, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-0.269257, 17.765755)
					z_priority = 5.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						102
						77
						64
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = $wii_invite_info_no_invite
					font = fontgrid_text_a6
					material = 0x00000000
					single_line = false
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						-1.0
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
					local_id = NewElement9
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
					pos = (-2.600189, -124.45127)
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
							texture = dialog_studs
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-168.2291, 2.6763988)
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
							texture = dialog_studs
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-97.87879, 4.0147095)
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
							texture = dialog_studs
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-27.52841, 4.0145607)
							z_priority = 7.0
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
							texture = dialog_studs
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (42.8221, 4.0145607)
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
							texture = dialog_studs
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (113.172455, 4.0145607)
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
							texture = dialog_studs
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (180.46422, 4.0145607)
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
		]
	}
}
uidesc_invite_info1_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
