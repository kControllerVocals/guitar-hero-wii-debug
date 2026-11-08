uidesc_jam_song_info_text = {
	DescVersion = 4
	name = uidesc_jam_song_info_text
	rect = [
		-32.56882
		-25.688087
		1027.7058
		601.74316
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
					index = 0
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = NewElement2
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = song_name
					includeParentOwned = false
				}
			]
			name = song_name_text
			visiblename = 'song_name_text'
			help = 'NewElement1 -> song_info -> NewElement2 -> song_name => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = NewElement2
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = artist_name
					includeParentOwned = false
				}
			]
			name = artist_name_text
			visiblename = 'artist_name_text'
			help = 'NewElement1 -> song_info -> NewElement2 -> artist_name => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = song_length
					includeParentOwned = false
				}
			]
			name = song_length_text
			visiblename = 'song_length_text'
			help = 'NewElement1 -> song_info -> NewElement1 -> song_length => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = tracks_recorded
					includeParentOwned = false
				}
			]
			name = tracks_recorded_text
			visiblename = 'tracks_recorded_text'
			help = 'NewElement1 -> song_info -> NewElement1 -> tracks_recorded => text'
			target = text
			type = string_wchar
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
			pos = (17.431183, 24.311913)
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
					local_id = song_info
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
					pos = (469.78845, 176.44957)
					z_priority = 53.0
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
							local_id = NewElement1
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (100.0, 300.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (27.550476, 125.293594)
							z_priority = 54.0
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
						children = [
							{
								props = {
									local_id = song_length
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (500.0, 50.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 25.0)
									z_priority = 54.0
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
									text = qs("")
									font = fontgrid_text_a3
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
									local_id = tracks_recorded
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (500.0, 50.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 75.0)
									z_priority = 54.0
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
									text = qs("")
									font = fontgrid_text_a3
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
						]
					}
					{
						props = {
							local_id = NewElement2
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
							pos = (102.0, 121.0)
							z_priority = 54.0
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
									local_id = song_name
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (520.0, 60.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-87.789, -127.33026)
									z_priority = 54.0
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
									text = qs("")
									font = fontgrid_title_a1
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
									local_id = artist_name
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (560.0, 50.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-104.08264, -53.632996)
									z_priority = 54.0
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
									text = qs("")
									font = fontgrid_title_a1
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
									local_id = topline
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
									pos = (-177.01831, -171.78897)
									z_priority = 51.0
									scale = (0.7, 1.0)
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
											texture = top_line_side
											local_id = NewElement11
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (256.0, 16.0)
											just = [
												-1.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (119.99997, 102.0)
											z_priority = 52.0
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
													texture = top_line_side
													flip_v = true
													local_id = NewElement11
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (256.0, 16.0)
													just = [
														-1.0
														-1.0
													]
													pos_anchor = [
														-1.0
														-1.0
													]
													pos = (511.9998, 0.0)
													z_priority = 52.0
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
															texture = top_line_middle
															local_id = NewElement8
															type = SpriteElement
															hiddenLocal = false
															alpha = 1.0
															dims = (256.0, 16.0)
															just = [
																-1.0
																-1.0
															]
															pos_anchor = [
																-1.0
																-1.0
															]
															pos = (-255.99988, -1.0)
															z_priority = 51.0
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
								]
							}
						]
					}
				]
			}
		]
	}
}
uidesc_jam_song_info_text_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
