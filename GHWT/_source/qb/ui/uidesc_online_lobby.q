uidesc_online_lobby = {
	DescVersion = 17
	name = uidesc_online_lobby
	rect = [
		21.316406
		-229.28133
		1246.4132
		1082.7864
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = lobby_menu
				}
				{
					index = 0
					validateLocalID = matchmaking_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = right_side_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = player_slots_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = player_slots_vmenu
					includeParentOwned = false
				}
			]
			name = alias_player_slots_vmenu
			visiblename = 'alias_player_slots_vmenu'
			help = 'lobby_menu -> matchmaking_container -> right_side_container -> player_slots_container -> player_slots_vmenu'
		}
		{
			path = [
				{
					validateLocalID = lobby_menu
				}
				{
					index = 0
					validateLocalID = matchmaking_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = matchmaking_vscollingmenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = matchmaking_vmenu
					includeParentOwned = false
				}
			]
			name = alias_matchmaking_vmenu
			visiblename = 'alias_matchmaking_vmenu'
			help = 'lobby_menu -> matchmaking_container -> left_side_container -> matchmaking_vscollingmenu -> matchmaking_vmenu'
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
					validateLocalID = matchmaking_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = matchmaking_vscollingmenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = matchmaking_vmenu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = game_mode
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = matchmaking_game_mode_text
			visiblename = 'matchmaking_game_mode_text'
			help = 'lobby_menu -> matchmaking_container -> left_side_container -> matchmaking_vscollingmenu -> matchmaking_vmenu -> game_mode -> text => text'
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
					validateLocalID = matchmaking_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = matchmaking_info_pane_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = matchmaking_info_pane_text
					includeParentOwned = false
				}
			]
			name = matchmaking_info_text
			visiblename = 'matchmaking_info_text'
			help = 'lobby_menu -> matchmaking_container -> left_side_container -> matchmaking_info_pane_container -> matchmaking_info_pane_text => text'
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
					validateLocalID = matchmaking_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = matchmaking_vscollingmenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = matchmaking_vmenu
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = music_store
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = music_store_text
			visiblename = 'Music_Store_Text'
			help = 'lobby_menu -> matchmaking_container -> left_side_container -> matchmaking_vscollingmenu -> matchmaking_vmenu -> music_store -> text => text'
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
					validateLocalID = matchmaking_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = matchmaking_vscollingmenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = matchmaking_vmenu
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = log_out
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = text
					includeParentOwned = false
				}
			]
			name = log_out_text
			visiblename = 'Log_Out_text'
			help = 'lobby_menu -> matchmaking_container -> left_side_container -> matchmaking_vscollingmenu -> matchmaking_vmenu -> log_out -> text => text'
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
					validateLocalID = matchmaking_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = left_side_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = matchmaking_background_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = matchmaking_banner_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = matchmaking_title_text
					includeParentOwned = false
				}
			]
			name = matchmaking_title_text
			visiblename = 'matchmaking_title_text'
			help = 'lobby_menu -> matchmaking_container -> left_side_container -> matchmaking_background_container -> matchmaking_banner_container -> matchmaking_title_text => text'
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
					local_id = matchmaking_container
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
					tags = {
						menu_index = 0
						slots_index = 0
						Menu_items = 4
						slot_items = 1
					}
				}
				children = [
					{
						props = {
							local_id = start_matchmaking_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (10.0, 10.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (1207.7295, 525.3624)
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
							local_id = right_side_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (0.0, 0.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
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
									local_id = player_slots_bg
									type = ContainerElement
									hiddenLocal = false
									alpha = 1.0
									dims = (256.0, 512.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (760.2214, 236.83203)
									z_priority = 3.0
									scale = (1.55, 1.575)
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
											material = 0x00000000
											texture = bands_menu
											local_id = bands_top
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
											pos = (9.067111, 66.95738)
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
											texture = bands_chain
											local_id = bands_chain
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (32.0, 256.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (-98.03815, -230.47346)
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
											blend = blend
											texture = bands_chain
											local_id = bands_chain
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (32.0, 256.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (118.45078, -236.5261)
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
								]
							}
							{
								props = {
									local_id = bands_title_text
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (220.0, 40.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (779.0678, -37.519993)
									z_priority = 3.2
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
									text = qs("BANDS")
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
							{
								props = {
									local_id = player_slots_container
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
									pos = (-5.15387, -101.34068)
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
									tags = {
										all_players_checksum = [
											0x378d3992
											0x82af2de5
											0x82af2de5
											0x82af2de5
											0x82af2de5
											0x82af2de5
											0x82af2de5
											0x82af2de5
										]
										local_controllers = [
											0xfff6e832
											0xfb0db827
											0xfb0db827
											0xfb0db827
											0xfb0db827
											0xfb0db827
											0xfb0db827
										]
										num_players_in_session = 1
										safe_to_refresh_player_slots = 1
									}
								}
								children = [
									{
										props = {
											local_id = player_slots_vmenu
											type = MenuElement
											hiddenLocal = false
											alpha = 1.0
											dims = (385.0, 552.0)
											just = [
												-1.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (554.7862, 129.0)
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
											isVertical = true
											internal_just = [
												-1.0
												-1.0
											]
											regular_space_amount = -1
											padding_scale = 1.0
											spacing_between = 8
											position_children = true
											fit_major = `expand if content larger`
											fit_minor = `keep dims`
											scale_mode = proportional
											allow_wrap = true
											allow_alternate_directional_events = false
											tags = {
												tag_selected_id = 0xbefefdff
												tag_selected_index = 0
												tag_selected_childs_grid_index = -1
											}
										}
									}
								]
							}
						]
					}
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
									local_id = matchmaking_background_container
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
											local_id = matchmaking_vmenu_bg
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
											local_id = matchmaking_theme
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
											local_id = matchmaking_banner_container
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
													local_id = matchmaking_vmenu_banner
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
													local_id = matchmaking_title_text
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
													pos = (218.74734, -101.75813)
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
													text = qs("")
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
									local_id = matchmaking_info_pane_container
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
											local_id = matchmaking_info_pane_bg
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
											local_id = matchmaking_info_pane_text
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
											pos = (35.08784, -27.534452)
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
											font = fontgrid_title_a1
											material = 0x00000000
											single_line = false
											fit_width = wrap
											fit_height = `clip bottom lines`
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
											shadow_offs = (0.0, 0.0)
											line_spacing = 1.0
										}
									}
								]
							}
							{
								props = {
									local_id = matchmaking_vscollingmenu
									type = ScrollingMenu
									hiddenLocal = false
									alpha = 1.0
									dims = (256.0, 575.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (148.98471, 91.89313)
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
											local_id = matchmaking_vmenu
											type = MenuElement
											hiddenLocal = false
											alpha = 1.0
											dims = (256.0, 552.0)
											just = [
												-1.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (-10.707913, 0.0)
											z_priority = 2.0
											scale = (1.0, 0.95)
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
										children = [
											{
												props = {
													local_id = start_matchmaking
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (256.0, 40.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 20.0)
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
													tags = {
														msg_checksum = find_a_game
													}
												}
												children = [
													{
														props = {
															local_id = text
															type = TextBlockElement
															hiddenLocal = false
															alpha = 1.0
															dims = (325.0, 42.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (10.0, -3.053452)
															z_priority = 4.0
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
															text = qs("START MATCHMAKING")
															font = fontgrid_text_a6
															material = 0x00000000
															single_line = false
															fit_width = `scale each line if larger`
															fit_height = `scale down if larger`
															scale_mode = `per axis`
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
															shadow_offs = (0.0, 0.0)
															line_spacing = 1.0
														}
													}
												]
											}
											{
												props = {
													local_id = game_mode
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (256.0, 40.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 60.0)
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
													tags = {
														msg_checksum = game_mode
													}
												}
												children = [
													{
														props = {
															local_id = text
															type = TextBlockElement
															hiddenLocal = false
															alpha = 1.0
															dims = (325.0, 42.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (10.0, 0.0)
															z_priority = 4.0
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
															text = qs("GAME MODE: 1v1 PRO FACEOFF")
															font = fontgrid_text_a6
															material = 0x00000000
															single_line = false
															fit_width = `scale each line if larger`
															fit_height = `scale down if larger`
															scale_mode = `per axis`
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
															shadow_offs = (0.0, 0.0)
															line_spacing = 1.0
														}
													}
												]
											}
											{
												props = {
													local_id = friends
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (256.0, 40.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 100.0)
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
													tags = {
														msg_checksum = friends
													}
												}
												children = [
													{
														props = {
															local_id = text
															type = TextBlockElement
															hiddenLocal = false
															alpha = 1.0
															dims = (325.0, 42.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (10.0, 0.0)
															z_priority = 4.0
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
															text = qs(0x1247b239)
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
											{
												props = {
													local_id = music_store
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (256.0, 40.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 140.0)
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
													tags = {
														msg_checksum = preferences
													}
												}
												children = [
													{
														props = {
															local_id = text
															type = TextBlockElement
															hiddenLocal = false
															alpha = 1.0
															dims = (325.0, 42.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (10.0, 0.0)
															z_priority = 4.0
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
															text = qs("MUSIC STORE")
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
											{
												props = {
													local_id = preferences
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (256.0, 40.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 180.0)
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
													tags = {
														msg_checksum = preferences
													}
												}
												children = [
													{
														props = {
															local_id = text
															type = TextBlockElement
															hiddenLocal = false
															alpha = 1.0
															dims = (325.0, 42.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (10.0, 0.0)
															z_priority = 4.0
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
															text = qs("PREFERENCES")
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
											{
												props = {
													local_id = log_out
													type = ContainerElement
													hiddenLocal = false
													alpha = 1.0
													dims = (256.0, 40.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (0.0, 220.0)
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
													tags = {
														msg_checksum = preferences
													}
												}
												children = [
													{
														props = {
															local_id = text
															type = TextBlockElement
															hiddenLocal = false
															alpha = 1.0
															dims = (325.0, 42.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (10.0, 0.0)
															z_priority = 4.0
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
															text = qs("LOG OUT")
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
								]
							}
						]
					}
				]
			}
		]
	}
}
uidesc_online_lobby_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			3
			4
		]
	}
	EditMaterialForm = {
	}
}
