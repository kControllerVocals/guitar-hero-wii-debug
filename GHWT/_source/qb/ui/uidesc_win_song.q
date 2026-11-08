uidesc_win_song = {
	DescVersion = 3
	name = uidesc_win_song
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = win_container
				}
				{
					index = 1
					validateLocalID = song_name
					includeParentOwned = false
				}
			]
			name = song_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = win_container
				}
				{
					index = 2
					validateLocalID = band_name
					includeParentOwned = false
				}
			]
			name = band_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = win_container
				}
				{
					index = 3
					validateLocalID = difficulty
					includeParentOwned = false
				}
			]
			name = difficulty_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = win_container
				}
				{
					index = 4
					validateLocalID = score
					includeParentOwned = false
				}
			]
			name = score_text
			target = text
			type = string_wchar
		}
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = win_container
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
					texture = boot_brick_bg
					local_id = boot_brick_bg
					type = SpriteElement
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
				}
			}
			{
				props = {
					local_id = song_name
					type = TextBlockElement
					dims = (0.0, 49.0)
					just = [
						-1.0
						0.0
					]
					pos = (256.0, 97.0)
					z_priority = 1.0
					rgba = [
						200
						200
						200
						255
					]
					text = qs("")
					font = fontgrid_text_a3
					single_line = true
					fit_width = `expand dims`
					fit_height = `expand dims`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = band_name
					type = TextBlockElement
					dims = (0.0, 49.0)
					just = [
						-1.0
						0.0
					]
					pos = (256.0, 147.0)
					z_priority = 1.0
					rgba = [
						200
						200
						200
						255
					]
					text = qs("")
					font = fontgrid_text_a3
					single_line = true
					fit_width = `expand dims`
					fit_height = `expand dims`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = difficulty
					type = TextBlockElement
					dims = (0.0, 49.0)
					just = [
						1.0
						0.0
					]
					pos = (1024.0, 97.0)
					z_priority = 1.0
					rgba = [
						200
						200
						200
						255
					]
					text = qs("")
					font = fontgrid_text_a3
					single_line = true
					fit_width = `expand dims`
					fit_height = `expand dims`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = score
					type = TextBlockElement
					dims = (0.0, 49.0)
					just = [
						1.0
						0.0
					]
					pos = (1024.0, 147.0)
					z_priority = 1.0
					rgba = [
						200
						200
						200
						255
					]
					text = qs("")
					font = fontgrid_text_a3
					single_line = true
					fit_width = `expand dims`
					fit_height = `expand dims`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = star_container
					type = MenuElement
					dims = (256.0, 50.0)
					just = [
						-1.0
						-1.0
					]
					pos = (512.0, 192.0)
					z_priority = 1.0
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
				}
			}
			{
				props = {
					local_id = menu
					type = MenuElement
					dims = (256.0, 240.0)
					just = [
						-1.0
						-1.0
					]
					pos = (512.0, 394.0)
					z_priority = 1.0
					internal_just = [
						0.0
						0.0
					]
				}
			}
			{
				props = {
					local_id = note_streak_container
					type = MenuElement
					dims = (768.0, 50.0)
					just = [
						-1.0
						-1.0
					]
					pos = (256.0, 243.0)
					z_priority = 1.0
					isVertical = false
					internal_just = [
						0.0
						-1.0
					]
				}
				children = [
					{
						props = {
							local_id = note_streak
							type = MenuElement
							dims = (192.0, 150.0)
							just = [
								0.0
								-1.0
							]
							pos = (96.0, 0.0)
							z_priority = 2.0
							internal_just = [
								0.0
								0.0
							]
						}
						children = [
							{
								props = {
									local_id = instrument
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 25.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = streak
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 75.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = percent
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 125.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
						]
					}
					{
						props = {
							local_id = note_streak
							type = MenuElement
							dims = (192.0, 150.0)
							just = [
								0.0
								-1.0
							]
							pos = (288.0, 0.0)
							z_priority = 2.0
							internal_just = [
								0.0
								0.0
							]
						}
						children = [
							{
								props = {
									local_id = instrument
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 25.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = streak
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 75.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = percent
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 125.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
						]
					}
					{
						props = {
							local_id = note_streak
							type = MenuElement
							dims = (192.0, 150.0)
							just = [
								0.0
								-1.0
							]
							pos = (480.0, 0.0)
							z_priority = 2.0
							internal_just = [
								0.0
								0.0
							]
						}
						children = [
							{
								props = {
									local_id = instrument
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 25.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = streak
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 75.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = percent
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 125.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
						]
					}
					{
						props = {
							local_id = note_streak
							type = MenuElement
							dims = (192.0, 150.0)
							just = [
								0.0
								-1.0
							]
							pos = (672.0, 0.0)
							z_priority = 2.0
							internal_just = [
								0.0
								0.0
							]
						}
						children = [
							{
								props = {
									local_id = instrument
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 25.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = streak
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 75.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = percent
									type = TextBlockElement
									dims = (192.0, 50.0)
									pos = (96.0, 125.0)
									z_priority = 3.0
									rgba = [
										200
										200
										200
										255
									]
									text = qs("")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
						]
					}
				]
			}
		]
	}
}
uidesc_win_song_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
}
