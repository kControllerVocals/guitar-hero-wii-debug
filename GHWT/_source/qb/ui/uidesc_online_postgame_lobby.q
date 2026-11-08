uidesc_online_postgame_lobby = {
	DescVersion = 3
	name = uidesc_online_postgame_lobby
	rect = [
		0.48690403
		-107.05648
		1243.1696
		914.55786
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 0
					validateLocalID = winner
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = winner_vmenu
					includeParentOwned = false
				}
			]
			name = alias_winner_vmenu
			visiblename = 'alias_winner_vmenu'
			help = 'winner_vs_loser_menu -> winner -> winner_vmenu'
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 1
					validateLocalID = loser
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = loser_vmenu
					includeParentOwned = false
				}
			]
			name = alias_loser_vmenu
			visiblename = 'alias_loser_vmenu'
			help = 'winner_vs_loser_menu -> loser -> loser_vmenu'
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 2
					validateLocalID = online_lobby_left_side
					includeParentOwned = false
				}
			]
			name = alias_left_side
			visiblename = 'alias_left_side'
			help = 'winner_vs_loser_menu -> online_lobby_left_side'
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 1
					validateLocalID = loser
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = score_container
					includeParentOwned = false
				}
			]
			name = alias_loser_score_container
			visiblename = 'alias_loser_score_container'
			help = 'winner_vs_loser_menu -> loser -> score_container'
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 0
					validateLocalID = winner
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = score_container
					includeParentOwned = false
				}
			]
			name = alias_winner_score_container
			visiblename = 'alias_winner_score_container'
			help = 'winner_vs_loser_menu -> winner -> score_container'
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 1
					validateLocalID = loser
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = score_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = hand_thumb_down
					includeParentOwned = false
				}
			]
			name = alias_hand_thumb_down
			visiblename = 'alias_hand_thumb_down'
			help = 'winner_vs_loser_menu -> loser -> score_container -> hand_thumb_down'
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 0
					validateLocalID = winner
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = score_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = hand_devil_horn
					includeParentOwned = false
				}
			]
			name = alias_hand_devil_horn
			visiblename = 'alias_hand_devil_horn'
			help = 'winner_vs_loser_menu -> winner -> score_container -> hand_devil_horn'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 1
					validateLocalID = loser
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = score_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = loser_score_text
					includeParentOwned = false
				}
			]
			name = loser_score
			visiblename = 'loser_score'
			help = 'winner_vs_loser_menu -> loser -> score_container -> loser_score_text => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 0
					validateLocalID = winner
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = score_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = winner_score_text
					includeParentOwned = false
				}
			]
			name = winner_score
			visiblename = 'winner_score'
			help = 'winner_vs_loser_menu -> winner -> score_container -> winner_score_text => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 1
					validateLocalID = loser
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = score_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = counter_loser
					includeParentOwned = false
				}
			]
			name = counter_loser_texture
			visiblename = 'counter_loser_texture'
			help = 'winner_vs_loser_menu -> loser -> score_container -> counter_loser => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 1
					validateLocalID = loser
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = menu_loser
					includeParentOwned = false
				}
			]
			name = menu_loser_texture
			visiblename = 'menu_loser_texture'
			help = 'winner_vs_loser_menu -> loser -> menu_loser => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 0
					validateLocalID = winner
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = score_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = counter_winner
					includeParentOwned = false
				}
			]
			name = counter_winner_texture
			visiblename = 'counter_winner_texture'
			help = 'winner_vs_loser_menu -> winner -> score_container -> counter_winner => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 0
					validateLocalID = winner
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = score_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = counter_winner
					includeParentOwned = false
				}
			]
			name = counter_winner_dims
			visiblename = 'counter_winner_dims'
			help = 'winner_vs_loser_menu -> winner -> score_container -> counter_winner => dims'
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 0
					validateLocalID = winner
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = score_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = counter_winner
					includeParentOwned = false
				}
			]
			name = counter_winner_pos
			visiblename = 'counter_winner_pos'
			help = 'winner_vs_loser_menu -> winner -> score_container -> counter_winner => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 0
					validateLocalID = winner
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = stamp
					includeParentOwned = false
				}
			]
			name = stamp_rot_angle
			visiblename = 'stamp_rot_angle'
			help = 'winner_vs_loser_menu -> winner -> stamp => rot_angle'
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 1
					validateLocalID = loser
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = stamp
					includeParentOwned = false
				}
			]
			name = loser_stamp_alpha
			visiblename = 'loser_stamp_alpha'
			help = 'winner_vs_loser_menu -> loser -> stamp => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 1
					validateLocalID = loser
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = menu_loser
					includeParentOwned = false
				}
			]
			name = menu_loser_pos
			visiblename = 'menu_loser_pos'
			help = 'winner_vs_loser_menu -> loser -> menu_loser => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 0
					validateLocalID = winner
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = stamp
					includeParentOwned = false
				}
			]
			name = winner_stamp_texture
			visiblename = 'winner_stamp_texture'
			help = 'winner_vs_loser_menu -> winner -> stamp => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = winner_vs_loser_menu
				}
				{
					index = 1
					validateLocalID = loser
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = stamp
					includeParentOwned = false
				}
			]
			name = loser_stamp_texture
			visiblename = 'loser_stamp_texture'
			help = 'winner_vs_loser_menu -> loser -> stamp => texture'
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = winner_vs_loser_menu
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
					local_id = winner
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
					pos = (-19.10431, 131.76118)
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
							texture = menu_winner
							local_id = menu_winner
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
							pos = (798.7454, -57.217667)
							z_priority = 2.0
							scale = (1.1, 1.1)
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
							texture = menu_chain
							local_id = menu_chain
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (32.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (798.56946, 132.5254)
							z_priority = 4.0
							scale = (1.1, 1.1)
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
							texture = stamp
							local_id = stamp
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
							pos = (809.86145, -52.4535)
							z_priority = 5.0
							scale = (1.4, 1.4)
							rot_angle = 20.0
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
							local_id = winner_vmenu
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (450.0, 256.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (796.1275, -40.610516)
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
							spacing_between = 8
							position_children = true
							fit_major = `keep dims`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = true
							allow_alternate_directional_events = false
						}
					}
					{
						props = {
							local_id = score_container
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
									blend = blend
									texture = hand_devil_horn
									local_id = hand_devil_horn
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (128.0, 128.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (525.5994, 93.64778)
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
									blend = blend
									texture = counter_winner
									material = 0x00000000
									local_id = counter_winner
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
									pos = (662.27954, 118.297195)
									z_priority = 4.0
									scale = (1.03, 1.03)
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
									local_id = winner_score_text
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (200.0, 40.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (558.6143, 98.68915)
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
									text = qs("12345678")
									font = fontgrid_text_A11_b
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale to fit`
									scale_mode = `per axis`
									text_case = Original
									internal_just = [
										1.0
										-1.0
									]
									internal_scale = (0.75, 1.0)
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
					local_id = loser
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
					pos = (88.70746, 141.28949)
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
							texture = menu_loser
							material = 0x00000000
							local_id = menu_loser
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
							pos = (690.75757, 310.2119)
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
							local_id = loser_vmenu
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (450.0, 256.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (685.367, 292.99634)
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
							spacing_between = 8
							position_children = true
							fit_major = `keep dims`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = true
							allow_alternate_directional_events = false
						}
					}
					{
						props = {
							local_id = score_container
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
						children = [
							{
								props = {
									material = 0x00000000
									blend = blend
									texture = counter_loser
									local_id = counter_loser
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (256.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (850.15094, 132.46559)
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
									local_id = loser_score_text
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (200.0, 40.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (895.3182, 178.0899)
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
									text = qs("12345678")
									font = fontgrid_text_A11_b
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale to fit`
									scale_mode = `per axis`
									text_case = Original
									internal_just = [
										1.0
										-1.0
									]
									internal_scale = (0.75, 1.0)
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
									flip_v = false
									material = 0x00000000
									blend = blend
									texture = hand_thumb_down
									local_id = hand_thumb_down
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (128.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (971.84344, 138.1134)
									z_priority = 3.0
									scale = (1.2, 1.2)
									rot_angle = 12.0
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
							texture = stamp_tie
							material = 0x00000000
							local_id = stamp
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (256.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (699.7373, 283.24814)
							z_priority = 5.0
							scale = (1.4, 1.4)
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
					local_id = online_lobby_left_side
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (716.8, 806.4)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (-49.513096, -89.727104)
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
					desc = 'online_lobby_left_side'
					autoSizeDims = true
					title_text = qs("ANYTHING")
					info_text = qs("find other players across the world to play Guitar Hero with")
				}
			}
		]
	}
}
uidesc_online_postgame_lobby_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
