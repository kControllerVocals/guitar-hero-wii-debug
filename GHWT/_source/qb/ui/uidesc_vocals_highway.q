uidesc_vocals_highway = {
	DescVersion = 11
	name = uidesc_vocals_highway
	rect = [
		-2.0
		-38.748905
		1280.0
		345.68845
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 10
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = note_scale
					includeParentOwned = false
				}
			]
			name = alias_note_scale
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 10
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = lyrics
					includeParentOwned = false
				}
			]
			name = alias_lyrics
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 9
					validateLocalID = now_bar
					includeParentOwned = false
				}
			]
			name = alias_now_bar
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 11
					validateLocalID = static_phrase_start
					includeParentOwned = false
				}
			]
			name = alias_static_phrase_start
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 12
					validateLocalID = static_phrase_end
					includeParentOwned = false
				}
			]
			name = alias_static_phrase_end
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 9
					validateLocalID = now_bar
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = pitch_area
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = pitch_indicator
					includeParentOwned = false
				}
			]
			name = alias_pitch_indicator
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 14
					validateLocalID = static_window
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = static_note_scale
					includeParentOwned = false
				}
			]
			name = alias_static_note_scale
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 9
					validateLocalID = now_bar
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = pitch_area
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = pitch_indicator
					includeParentOwned = false
				}
			]
			name = pitch_indicator_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 9
					validateLocalID = now_bar
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = pitch_area
					includeParentOwned = false
				}
			]
			name = pitch_area_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 13
					validateLocalID = static_next_phrase_bg
					includeParentOwned = false
				}
			]
			name = static_next_phrase_bg_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 9
					validateLocalID = now_bar
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = pitch_area
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = pitch_indicator
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = fireball_bg
					includeParentOwned = false
				}
			]
			name = fireball_bg_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 0
					validateLocalID = top_outline_middle
					includeParentOwned = false
				}
			]
			name = border_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 1
					validateLocalID = top_outline_left
					includeParentOwned = false
				}
			]
			name = border_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 2
					validateLocalID = top_outline_right
					includeParentOwned = false
				}
			]
			name = border_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 6
					validateLocalID = bottom_outline_middle
					includeParentOwned = false
				}
			]
			name = border_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 7
					validateLocalID = bottom_outline_left
					includeParentOwned = false
				}
			]
			name = border_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 8
					validateLocalID = bottom_outline_right
					includeParentOwned = false
				}
			]
			name = border_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 10
					validateLocalID = window
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = bG
					includeParentOwned = false
				}
			]
			name = bg_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = root
				}
				{
					index = 15
					validateLocalID = band_streak_lines
					includeParentOwned = false
				}
			]
			name = band_streak_lines_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = root
			type = ContainerElement
			dims = (930.0, 220.0)
			just = [
				-1.0
				-1.0
			]
			pos = (288.0, 0.0)
		}
		children = [
			{
				props = {
					texture = outline_middle
					local_id = top_outline_middle
					type = SpriteElement
					dims = (974.0, 16.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-158.0, 27.0)
					z_priority = 2.0
				}
			}
			{
				props = {
					texture = outline_side
					local_id = top_outline_left
					type = SpriteElement
					dims = (64.0, 16.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-221.0, 27.0)
					z_priority = 2.0
				}
			}
			{
				props = {
					texture = outline_side
					flip_v = true
					local_id = top_outline_right
					type = SpriteElement
					dims = (64.0, 16.0)
					just = [
						-1.0
						-1.0
					]
					pos = (816.0, 27.0)
					z_priority = 2.0
				}
			}
			{
				props = {
					texture = lyric_bg_middle
					local_id = bg_middle
					type = SpriteElement
					alpha = 0.4
					dims = (649.0, 30.0)
					just = [
						-1.0
						0.0
					]
					pos = (1.0, 152.0)
					scale = (1.0, 1.3)
				}
			}
			{
				props = {
					texture = lyric_bg_side
					local_id = bg_left
					type = SpriteElement
					alpha = 0.4
					dims = (256.0, 30.0)
					just = [
						-1.0
						0.0
					]
					pos = (-255.0, 152.0)
					scale = (1.0, 1.3)
				}
			}
			{
				props = {
					texture = lyric_bg_side
					flip_v = true
					local_id = bg_right
					type = SpriteElement
					alpha = 0.4
					dims = (256.0, 30.0)
					just = [
						-1.0
						0.0
					]
					pos = (650.0, 152.0)
					scale = (1.0, 1.3)
				}
			}
			{
				props = {
					texture = outline_middle
					local_id = bottom_outline_middle
					type = SpriteElement
					dims = (974.0, 16.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-158.0, 129.0)
					z_priority = 2.0
				}
			}
			{
				props = {
					texture = outline_side
					local_id = bottom_outline_left
					type = SpriteElement
					dims = (64.0, 16.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-221.0, 129.0)
					z_priority = 2.0
				}
			}
			{
				props = {
					texture = outline_side
					flip_v = true
					local_id = bottom_outline_right
					type = SpriteElement
					dims = (64.0, 16.0)
					just = [
						-1.0
						-1.0
					]
					pos = (816.0, 129.0)
					z_priority = 2.0
				}
			}
			{
				props = {
					local_id = now_bar
					type = ContainerElement
					dims = (32.0, 140.0)
					just = [
						1.0
						-1.0
					]
					pos = (121.0, 30.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = pitch_area
							type = ContainerElement
							dims = (20.0, 75.0)
							just = [
								0.0
								-1.0
							]
							pos = (17.0, 18.0)
							z_priority = 4.0
						}
						children = [
							{
								props = {
									local_id = pitch_indicator
									type = ContainerElement
									dims = (24.0, 24.0)
									pos_anchor = [
										1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 7.0
								}
								children = [
									{
										props = {
											texture = vocal_fireball_bg
											material = 0x00000000
											local_id = fireball_bg
											type = SpriteElement
											dims = (64.0, 32.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 0.0)
											z_priority = 10.5
											scale = (0.55, 0.55)
										}
									}
								]
							}
						]
					}
				]
			}
			{
				props = {
					local_id = window
					type = WindowElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1280.0, 220.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (-290.0, 0.0)
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
							local_id = lyrics
							type = ContainerElement
							dims = (890.0, 32.0)
							just = [
								-1.0
								0.0
							]
							pos = (303.0, 153.0)
							z_priority = 1.0
						}
					}
					{
						props = {
							local_id = note_scale
							type = ContainerElement
							dims = (20.0, 75.0)
							just = [
								-1.0
								-1.0
							]
							pos = (3.0, 48.0)
							z_priority = 1.0
						}
					}
					{
						props = {
							texture = white
							local_id = bG
							type = SpriteElement
							alpha = 0.3
							dims = (1280.0, 104.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 34.0)
							rgba = [
								0
								0
								0
								255
							]
						}
					}
				]
			}
			{
				props = {
					local_id = static_phrase_start
					type = SpriteElement
					texture = white
					dims = (8.0, 103.0)
					just = [
						0.0
						-1.0
					]
					pos = (50.0, 33.0)
					z_priority = 2.0
					rgba = [
						255
						255
						255
						32
					]
				}
			}
			{
				props = {
					local_id = static_phrase_end
					type = SpriteElement
					texture = white
					dims = (8.0, 103.0)
					just = [
						0.0
						-1.0
					]
					pos = (783.0, 33.0)
					z_priority = 2.0
					rgba = [
						255
						255
						255
						32
					]
				}
			}
			{
				props = {
					local_id = static_next_phrase_bg
					type = ContainerElement
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (1.0, 206.93958)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = lyric_bg_middle
							local_id = middle
							type = SpriteElement
							alpha = 0.4
							dims = (649.0, 47.0)
							just = [
								-1.0
								0.0
							]
							pos = (0.0, -24.200006)
						}
					}
					{
						props = {
							texture = lyric_bg_side
							local_id = left
							type = SpriteElement
							alpha = 0.4
							dims = (256.0, 47.0)
							just = [
								-1.0
								0.0
							]
							pos = (-256.0, -24.200006)
						}
					}
					{
						props = {
							texture = lyric_bg_side
							flip_v = true
							local_id = right
							type = SpriteElement
							alpha = 0.4
							dims = (256.0, 47.0)
							just = [
								-1.0
								0.0
							]
							pos = (649.0, -24.200006)
						}
					}
				]
			}
			{
				props = {
					local_id = static_window
					type = WindowElement
					hiddenLocal = false
					alpha = 1.0
					dims = (740.0, 104.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (46.0, 33.0)
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
							local_id = static_note_scale
							type = ContainerElement
							dims = (20.0, 75.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-333.0, 15.0)
							z_priority = 1.0
						}
					}
				]
			}
			{
				props = {
					local_id = band_streak_lines
					type = ContainerElement
					alpha = 0.0
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-221.0, 27.0)
					z_priority = 2.0
				}
				children = [
					{
						props = {
							texture = outline_middle
							blend = Add
							local_id = top_middle
							type = SpriteElement
							dims = (974.0, 32.0)
							just = [
								-1.0
								0.0
							]
							pos = (64.0, 8.0)
							z_priority = 3.0
							rgba = [
								255
								160
								64
								255
							]
						}
					}
					{
						props = {
							texture = outline_side
							blend = Add
							local_id = top_left
							type = SpriteElement
							dims = (64.0, 32.0)
							just = [
								-1.0
								0.0
							]
							pos = (0.0, 8.0)
							z_priority = 3.0
							rgba = [
								255
								160
								64
								255
							]
						}
					}
					{
						props = {
							texture = outline_side
							flip_v = true
							blend = Add
							local_id = top_right
							type = SpriteElement
							dims = (64.0, 32.0)
							just = [
								-1.0
								0.0
							]
							pos = (1038.0, 8.0)
							z_priority = 3.0
							rgba = [
								255
								160
								64
								255
							]
						}
					}
					{
						props = {
							texture = outline_middle
							blend = Add
							local_id = bottom_middle
							type = SpriteElement
							dims = (974.0, 32.0)
							just = [
								-1.0
								0.0
							]
							pos = (64.0, 110.0)
							z_priority = 3.0
							rgba = [
								255
								160
								64
								255
							]
						}
					}
					{
						props = {
							texture = outline_side
							blend = Add
							local_id = bottom_left
							type = SpriteElement
							dims = (64.0, 32.0)
							just = [
								-1.0
								0.0
							]
							pos = (0.0, 110.0)
							z_priority = 3.0
							rgba = [
								255
								160
								64
								255
							]
						}
					}
					{
						props = {
							texture = outline_side
							flip_v = true
							blend = Add
							local_id = bottom_right
							type = SpriteElement
							dims = (64.0, 32.0)
							just = [
								-1.0
								0.0
							]
							pos = (1038.0, 110.0)
							z_priority = 3.0
							rgba = [
								255
								160
								64
								255
							]
						}
					}
				]
			}
			{
				props = {
					local_id = NewElement1
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (181.5951, -88.7489)
					z_priority = 1.0
					scale = (1.0, 1.2)
				}
				children = [
					{
						props = {
							texture = lyric_bg_middle
							local_id = bg_middle
							type = SpriteElement
							alpha = 0.4
							dims = (649.0, 30.0)
							just = [
								-1.0
								0.0
							]
							pos = (-514.80896, 157.0)
							scale = (1.0, 1.3)
						}
					}
					{
						props = {
							texture = lyric_bg_side
							flip_v = true
							local_id = bg_right
							type = SpriteElement
							alpha = 0.4
							dims = (256.0, 30.0)
							just = [
								-1.0
								0.0
							]
							pos = (134.43088, 157.83334)
							scale = (1.0, 1.2)
						}
					}
					{
						props = {
							texture = lyric_bg_side
							local_id = bg_left
							type = SpriteElement
							alpha = 0.4
							dims = (256.0, 30.0)
							just = [
								-1.0
								0.0
							]
							pos = (-771.04895, 157.0)
							scale = (1.0, 1.2)
						}
					}
				]
			}
		]
	}
}
uidesc_vocals_highway_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			20
		]
	}
	EditMaterialForm = {
	}
}
