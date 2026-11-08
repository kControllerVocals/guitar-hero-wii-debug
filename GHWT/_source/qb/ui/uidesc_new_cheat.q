uidesc_new_cheat = {
	DescVersion = 2
	name = uidesc_new_cheat
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = new_cheat_container
				}
				{
					index = 2
					validateLocalID = screen_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = volume_bars
					includeParentOwned = false
				}
			]
			name = alias_volume_bars
			visiblename = 'alias_volume_bars'
			help = 'new_cheat_container -> screen_container -> volume_bars'
		}
		{
			path = [
				{
					validateLocalID = new_cheat_container
				}
				{
					index = 2
					validateLocalID = screen_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = key_bars
					includeParentOwned = false
				}
			]
			name = alias_key_bars
			visiblename = 'alias_key_bars'
			help = 'new_cheat_container -> screen_container -> key_bars'
		}
		{
			path = [
				{
					validateLocalID = new_cheat_container
				}
				{
					index = 4
					validateLocalID = cheat_tv_glow
					includeParentOwned = false
				}
			]
			name = alias_cheat_tv_glow
			visiblename = 'alias_cheat_tv_glow'
			help = 'new_cheat_container -> cheat_tv_glow'
		}
		{
			path = [
				{
					validateLocalID = new_cheat_container
				}
				{
					index = 2
					validateLocalID = screen_container
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = info_container
					includeParentOwned = false
				}
			]
			name = alias_info_container
			visiblename = 'alias_info_container'
			help = 'new_cheat_container -> screen_container -> info_container'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = new_cheat_container
				}
				{
					index = 3
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			visiblename = 'title_text'
			help = 'new_cheat_container -> title => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = new_cheat_container
				}
				{
					index = 2
					validateLocalID = screen_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = volume_bars
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = static_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = channel
					includeParentOwned = false
				}
			]
			name = channel_text
			visiblename = 'channel_text'
			help = 'new_cheat_container -> screen_container -> volume_bars -> static_text_container -> channel => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = new_cheat_container
				}
				{
					index = 2
					validateLocalID = screen_container
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = info_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = info
					includeParentOwned = false
				}
			]
			name = info_text
			visiblename = 'info_text'
			help = 'new_cheat_container -> screen_container -> info_container -> info => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = new_cheat_container
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
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
					texture = cheats_poster_bg
					local_id = cheats_poster_bg
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1280.0, 720.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
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
			}
			{
				props = {
					blend = blend
					material = 0x00000000
					texture = white
					local_id = background
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1280.0, 720.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 0.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						64
						64
						64
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
			}
			{
				props = {
					local_id = screen_container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (300.0, 300.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-6.3001103, -12.781952)
					z_priority = 1.0
					scale = (1.0, 1.0)
					rot_angle = -7.0
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
							local_id = static_bars
							type = MenuElement
							hiddenLocal = false
							alpha = 0.5
							dims = (300.0, 200.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
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
							isVertical = false
							internal_just = [
								1.0
								-1.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 0
							position_children = true
							fit_major = `fit content if larger`
							fit_minor = `fit content`
							scale_mode = `per axis`
						}
						children = [
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (30.0, 0.0)
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
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (90.0, 0.0)
									z_priority = 3.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										153
										150
										153
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (150.0, 0.0)
									z_priority = 3.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										78
										75
										78
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (210.0, 0.0)
									z_priority = 3.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										190
										190
										190
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (270.0, 0.0)
									z_priority = 3.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										110
										100
										110
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
							local_id = static_bars
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 30.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-0.207924, 180.862)
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
							isVertical = false
							internal_just = [
								0.0
								0.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 0
							position_children = true
							fit_major = `fit content if larger`
							fit_minor = `fit content`
							scale_mode = `per axis`
						}
						children = [
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (30.0, 15.0)
									z_priority = 4.0
									scale = (1.0, 0.15)
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
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (90.0, 15.0)
									z_priority = 4.0
									scale = (1.0, 0.15)
									rot_angle = 0.0
									rgba = [
										38
										229
										38
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (150.0, 15.0)
									z_priority = 4.0
									scale = (1.0, 0.15)
									rot_angle = 0.0
									rgba = [
										210
										19
										19
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (210.0, 15.0)
									z_priority = 4.0
									scale = (1.0, 0.15)
									rot_angle = 0.0
									rgba = [
										248
										248
										57
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (270.0, 15.0)
									z_priority = 4.0
									scale = (1.0, 0.15)
									rot_angle = 0.0
									rgba = [
										7
										7
										198
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
							local_id = static_bars
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 15.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (3.263136, 200.68512)
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
							isVertical = false
							internal_just = [
								0.0
								0.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 0
							position_children = true
							fit_major = `fit content if larger`
							fit_minor = `fit content`
							scale_mode = `per axis`
						}
						children = [
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (21.428566, 7.5)
									z_priority = 5.0
									scale = (0.71428597, 0.075)
									rot_angle = 0.0
									rgba = [
										153
										150
										153
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (64.285706, 7.5)
									z_priority = 5.0
									scale = (0.71428597, 0.075)
									rot_angle = 0.0
									rgba = [
										30
										27
										30
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (107.14286, 7.5)
									z_priority = 5.0
									scale = (0.71428597, 0.075)
									rot_angle = 0.0
									rgba = [
										153
										150
										153
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (150.0, 7.5)
									z_priority = 5.0
									scale = (0.71428597, 0.075)
									rot_angle = 0.0
									rgba = [
										30
										27
										30
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (192.85716, 7.5)
									z_priority = 5.0
									scale = (0.71428597, 0.075)
									rot_angle = 0.0
									rgba = [
										153
										150
										153
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (235.71428, 7.5)
									z_priority = 5.0
									scale = (0.71428597, 0.075)
									rot_angle = 0.0
									rgba = [
										30
										27
										30
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (60.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (278.5714, 7.5)
									z_priority = 5.0
									scale = (0.71428597, 0.075)
									rot_angle = 0.0
									rgba = [
										153
										150
										153
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
							local_id = volume_bars
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 50.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (7.536224, 214.17317)
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
							isVertical = false
							internal_just = [
								0.0
								0.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 8
							position_children = true
							fit_major = `fit content if larger`
							fit_minor = `fit content if larger`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (15.0, 35.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (54.918037, 25.0)
									z_priority = 5.0
									scale = (0.819672, 0.819672)
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
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (15.0, 35.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (73.770485, 25.0)
									z_priority = 5.0
									scale = (0.819672, 0.819672)
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
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (15.0, 35.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (92.62293, 25.0)
									z_priority = 5.0
									scale = (0.819672, 0.819672)
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
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (15.0, 35.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (111.47538, 25.0)
									z_priority = 5.0
									scale = (0.819672, 0.819672)
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
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (15.0, 35.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (130.32784, 25.0)
									z_priority = 5.0
									scale = (0.819672, 0.819672)
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
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (15.0, 35.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (149.18028, 25.0)
									z_priority = 5.0
									scale = (0.819672, 0.819672)
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
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (15.0, 35.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (168.03273, 25.0)
									z_priority = 5.0
									scale = (0.819672, 0.819672)
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
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (15.0, 35.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (186.88521, 25.0)
									z_priority = 5.0
									scale = (0.819672, 0.819672)
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
									local_id = static_text_container
									type = ContainerElement
									hiddenLocal = false
									alpha = 1.0
									dims = (63.0, 61.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (225.40976, 25.0)
									z_priority = 5.0
									scale = (0.819672, 0.819672)
									rot_angle = -5.0
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
											local_id = channel
											type = TextBlockElement
											texture = white
											hiddenLocal = false
											alpha = 1.0
											dims = (48.0, 49.0)
											just = [
												-1.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (7.4629135, 30.029802)
											z_priority = 5.0
											scale = (0.819672, 0.819672)
											rot_angle = 0.0
											rgba = [
												38
												229
												38
												255
											]
											events_blocked = 0
											preserve_local_orientation = false
											text = qs("\L00")
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
						]
					}
					{
						props = {
							local_id = key_bars
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 200.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
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
							isVertical = false
							internal_just = [
								1.0
								-1.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 0
							position_children = true
							fit_major = `fit content if larger`
							fit_minor = `fit content`
							scale_mode = `per axis`
						}
						children = [
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (60.0, 200.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (90.0, 0.0)
									z_priority = 4.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										38
										229
										38
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (60.0, 200.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (150.0, 0.0)
									z_priority = 4.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										210
										19
										19
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (60.0, 200.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (210.0, 0.0)
									z_priority = 4.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										248
										248
										57
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									blend = blend
									local_id = bar
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 0.0
									dims = (60.0, 200.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (270.0, 0.0)
									z_priority = 4.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										7
										7
										198
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
							local_id = info_container
							type = ContainerElement
							hiddenLocal = false
							alpha = 0.0
							dims = (300.0, 200.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.056187004, -32.72952)
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
						children = [
							{
								props = {
									local_id = info
									type = TextBlockElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (225.0, 150.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										1.0
									]
									pos = (6.947823, 0.85308504)
									z_priority = 7.0
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
									text = qs("")
									font = fontgrid_text_a3
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
									blend = blend
									local_id = info_bg
									type = SpriteElement
									texture = white
									hiddenLocal = false
									alpha = 1.0
									dims = (300.0, 200.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 6.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										229
										226
										229
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
							local_id = screen_container
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 300.0)
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
								0
								0
								0
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
					local_id = title
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (300.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-62.042847, -240.93849)
					z_priority = 11.0
					scale = (1.0, 1.0)
					rot_angle = -7.0
					rgba = [
						64
						64
						64
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs("INPUT CHEAT")
					font = fontgrid_title_a1
					single_line = false
					fit_width = `scale each line to fit`
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
					texture = cheats_highlight_glow
					local_id = cheat_tv_glow
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.0
					dims = (512.0, 512.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.181519, 1.477783)
					z_priority = 12.0
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
}
uidesc_new_cheat_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			10
			16
			24
			35
			40
		]
	}
	EditMaterialForm = {
	}
}
