uidesc_gh_tunes_preview = {
	DescVersion = 21
	name = uidesc_gh_tunes_preview
	rect = [
		-94.000015
		-31.49994
		1340.1998
		803.0479
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 4
					validateLocalID = previewpanel
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = preview_timer
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = Timer
					includeParentOwned = false
				}
			]
			name = Timer_text
			visiblename = 'Timer_text'
			help = 'NewElement2 -> previewpanel -> NewElement1 -> preview_timer -> Timer => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 4
					validateLocalID = previewpanel
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = playbar
					includeParentOwned = false
				}
			]
			name = playbar_dims
			visiblename = 'playbar_dims'
			help = 'NewElement2 -> previewpanel -> NewElement1 -> playbar => dims'
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 1
					validateLocalID = featuredalbum
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = album_cover
					includeParentOwned = false
				}
			]
			name = album_cover_texture
			visiblename = 'album_cover_texture'
			help = 'NewElement2 -> featuredalbum -> album_cover => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 5
					validateLocalID = helper_text_ghtunes
					includeParentOwned = false
				}
			]
			name = helper_text_ghtunes_alpha
			visiblename = 'helper_text_ghtunes_alpha'
			help = 'NewElement2 -> helper_text_ghtunes => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 6
					validateLocalID = helper_text_preview
					includeParentOwned = false
				}
			]
			name = helper_text_preview_alpha
			visiblename = 'helper_text_preview_alpha'
			help = 'NewElement2 -> helper_text_preview => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
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
			help = 'NewElement2 -> song_info -> NewElement2 -> song_name => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
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
					validateLocalID = note_count01
					includeParentOwned = false
				}
			]
			name = note_count01_text
			visiblename = 'note_count01_text'
			help = 'NewElement2 -> song_info -> NewElement1 -> note_count01 => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
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
					validateLocalID = note_count02
					includeParentOwned = false
				}
			]
			name = note_count02_text
			visiblename = 'note_count02_text'
			help = 'NewElement2 -> song_info -> NewElement1 -> note_count02 => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = note_count03
					includeParentOwned = false
				}
			]
			name = note_count03_text
			visiblename = 'note_count03_text'
			help = 'NewElement2 -> song_info -> NewElement1 -> note_count03 => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = note_count04
					includeParentOwned = false
				}
			]
			name = note_count04_text
			visiblename = 'note_count04_text'
			help = 'NewElement2 -> song_info -> NewElement1 -> note_count04 => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = note_count05
					includeParentOwned = false
				}
			]
			name = note_count05_text
			visiblename = 'note_count05_text'
			help = 'NewElement2 -> song_info -> NewElement1 -> note_count05 => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
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
			help = 'NewElement2 -> song_info -> NewElement2 -> artist_name => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = length
					includeParentOwned = false
				}
			]
			name = length_text
			visiblename = 'length_text'
			help = 'NewElement2 -> song_info -> NewElement1 -> length => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = bpm
					includeParentOwned = false
				}
			]
			name = bpm_text
			visiblename = 'bpm_text'
			help = 'NewElement2 -> song_info -> NewElement1 -> bpm => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = genre
					includeParentOwned = false
				}
			]
			name = genre_text
			visiblename = 'genre_text'
			help = 'NewElement2 -> song_info -> NewElement1 -> genre => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = file_id
					includeParentOwned = false
				}
			]
			name = file_id_text
			visiblename = 'file_id_text'
			help = 'NewElement2 -> song_info -> file_id => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement2
				}
				{
					index = 11
					validateLocalID = song_info
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = num_ratings
					includeParentOwned = false
				}
			]
			name = num_ratings_text
			visiblename = 'num_ratings_text'
			help = 'NewElement2 -> song_info -> NewElement1 -> num_ratings => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = NewElement2
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
			pos = (0.0, 6.0)
			z_priority = 50.0
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
					pos = (873.3975, 60.40174)
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
			}
			{
				props = {
					local_id = featuredalbum
					type = ContainerElement
					hiddenLocal = true
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
					pos = (99.0, 103.0)
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
				children = [
					{
						props = {
							blend = blend
							texture = white
							local_id = album_cover_bg
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (128.0, 128.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (208.69409, 158.73877)
							z_priority = 52.0
							scale = (1.1, 1.1)
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
							texture = 0x00000000
							local_id = album_cover
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (128.0, 128.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (214.69409, 165.73877)
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
					}
				]
			}
			{
				props = {
					local_id = mp3bg
					type = ContainerElement
					hiddenLocal = true
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
					pos = (100.0, 100.0)
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
				children = [
					{
						props = {
							blend = blend
							texture = mp3_right
							local_id = righthand
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (256.0, 512.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (838.9999, -104.5)
							z_priority = 52.0
							scale = (1.2, 1.504)
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
							texture = mp3_bottom
							local_id = mp3bottom
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (512.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (241.99977, 490.00003)
							z_priority = 53.0
							scale = (1.2, 1.5)
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
							texture = mp3_left_side
							local_id = NewElement4
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (128.0, 512.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (99.99997, -137.49994)
							z_priority = 52.0
							scale = (1.2, 1.505)
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
							texture = mp3_top
							local_id = NewElement1
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (512.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (251.99977, -73.0)
							z_priority = 52.0
							scale = (1.2, 1.5)
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
							texture = bg_texture
							local_id = bg_texture
							type = SpriteElement
							hiddenLocal = true
							alpha = 0.7
							dims = (512.0, 256.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (154.00002, 1.261161)
							z_priority = 50.0
							scale = (1.52, 1.0)
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
					local_id = blackbg
					type = SpriteElement
					texture = white
					hiddenLocal = true
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
					pos = (234.0001, 59.999905)
					z_priority = 50.0
					scale = (8.4, 5.8)
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
					local_id = previewpanel
					type = ContainerElement
					hiddenLocal = true
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
					pos = (-94.000015, 139.0)
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
				children = [
					{
						props = {
							local_id = previewBG
							type = ContainerElement
							hiddenLocal = true
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
							pos = (100.0, 100.0)
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
									texture = preview_pane_corner
									local_id = preview_pane_corner
									type = SpriteElement
									hiddenLocal = true
									alpha = 1.0
									dims = (128.0, 128.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (256.0, -10.0)
									z_priority = 54.0
									scale = (1.05, 1.0)
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
									texture = preview_pane_corner
									flip_h = true
									blend = blend
									local_id = preview_pane_corner
									type = SpriteElement
									hiddenLocal = true
									alpha = 1.0
									dims = (128.0, 128.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (257.0, 260.0)
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
							}
							{
								props = {
									blend = blend
									texture = preview_pane_top
									local_id = preview_pane_top
									type = SpriteElement
									hiddenLocal = true
									alpha = 1.0
									dims = (128.0, 128.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (391.001, -10.0)
									z_priority = 52.0
									scale = (3.4, 0.96999997)
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
									texture = preview_pane_top
									flip_h = true
									local_id = preview_pane_top
									type = SpriteElement
									hiddenLocal = true
									alpha = 1.0
									dims = (128.0, 128.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (368.0, 117.5)
									z_priority = 52.0
									scale = (1.11, 0.95)
									rot_angle = 90.0
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
									texture = preview_pane_corner
									flip_v = true
									local_id = preview_pane_corner
									type = SpriteElement
									hiddenLocal = true
									alpha = 1.0
									dims = (128.0, 128.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (826.5, -10.1)
									z_priority = 54.0
									scale = (1.05, 1.0)
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
									texture = preview_pane_corner
									flip_h = true
									blend = blend
									flip_v = true
									local_id = preview_pane_corner
									type = SpriteElement
									hiddenLocal = true
									alpha = 1.0
									dims = (128.0, 128.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (829.7, 260.0)
									z_priority = 54.0
									scale = (1.02, 1.0)
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
									texture = preview_pane_top
									flip_v = true
									flip_h = false
									local_id = preview_pane_top
									type = SpriteElement
									hiddenLocal = true
									alpha = 1.0
									dims = (128.0, 128.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (971.0, 117.5)
									z_priority = 52.0
									scale = (1.11, 0.96)
									rot_angle = 90.0
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
									texture = preview_pane_top
									flip_h = true
									flip_v = false
									local_id = preview_pane_top
									type = SpriteElement
									hiddenLocal = true
									alpha = 1.0
									dims = (128.0, 128.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (384.5, 262.5)
									z_priority = 52.0
									scale = (3.55, 0.97999996)
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
									local_id = NewElement2
									type = SpriteElement
									hiddenLocal = true
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
									pos = (284.0, 16.00002)
									z_priority = 49.5
									scale = (6.5, 3.45)
									rot_angle = 0.0
									rgba = [
										73
										65
										52
										150
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
							texture = play_arrow
							local_id = play_arrow
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (32.0, 32.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (632.2, 346.0)
							z_priority = 53.0
							scale = (0.5, 0.34)
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
							local_id = NewElement1
							type = ContainerElement
							hiddenLocal = true
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
							pos = (59.0, 153.0)
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
									local_id = preview_timer
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
									pos = (9.0, 9.0)
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
											texture = preview_timeline_l_r
											flip_v = true
											local_id = preview_timeline_l_r
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
											pos = (816.0, 229.00003)
											z_priority = 53.0
											scale = (0.9, 0.9)
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
											texture = preview_timeline_l_r
											flip_v = false
											local_id = preview_timeline_l_r
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
											pos = (773.0, 229.0)
											z_priority = 53.0
											scale = (0.9, 0.9)
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
											local_id = Timer
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (50.0, 20.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (810.0081, 205.10764)
											z_priority = 54.0
											scale = (1.2, 1.2)
											rot_angle = 0.0
											rgba = [
												230
												230
												230
												250
											]
											events_blocked = 0
											preserve_local_orientation = false
											text = qs("9:99")
											font = fontgrid_text_a8
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
											blend = blend
											texture = header
											local_id = timer_bg
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (512.0, 64.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (800.68567, 206.70459)
											z_priority = 3.0
											scale = (0.3, 0.8)
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
											local_id = NewElement1
											type = SpriteElement
											texture = white
											hiddenLocal = false
											alpha = 1.0
											dims = (80.0, 25.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (802.2442, 205.29161)
											z_priority = 53.0
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
									blend = blend
									local_id = playbar
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (345.0, 22.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (433.46948, 254.00586)
									z_priority = 53.0
									scale = (1.0, 1.5)
									rot_angle = 0.0
									rgba = [
										220
										122
										5
										125
									]
									events_blocked = 0
									preserve_local_orientation = false
								}
							}
							{
								props = {
									local_id = preview_timeline
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
									pos = (70.0, -209.99997)
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
											texture = preview_timeline_middle
											local_id = preview_timeline_middle
											type = SpriteElement
											hiddenLocal = true
											alpha = 1.0
											dims = (32.0, 64.0)
											just = [
												-1.0
												-1.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (410.00006, 450.00006)
											z_priority = 52.0
											scale = (8.0, 0.75)
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
											texture = preview_timeline_l_r
											local_id = preview_timeline_l_r
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
											pos = (362.0, 450.0)
											z_priority = 51.0
											scale = (0.75, 0.75)
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
											texture = preview_timeline_l_r
											flip_v = true
											local_id = preview_timeline_l_r
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
											pos = (664.0, 450.0)
											z_priority = 51.0
											scale = (0.75, 0.75)
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
											texture = header
											local_id = time_line_bar
											type = SpriteElement
											hiddenLocal = false
											alpha = 1.0
											dims = (512.0, 64.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (480.7614, 424.73715)
											z_priority = 3.0
											scale = (0.84000003, 0.5)
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
			{
				props = {
					local_id = helper_text_ghtunes
					type = ContainerElement
					hiddenLocal = true
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
					pos = (326.86868, 581.7139)
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
				children = [
					{
						props = {
							local_id = NewElement1
							type = TextBlockElement
							hiddenLocal = true
							alpha = 1.0
							dims = (200.0, 26.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-1.0, 0.0)
							z_priority = 52.0
							scale = (0.9, 1.0)
							rot_angle = 0.0
							rgba = [
								210
								130
								0
								250
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("\m0 PLAY/PAUSE")
							font = fontgrid_title_a1
							material = 0x00000000
							single_line = false
							fit_width = wrap
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
							local_id = NewElement1
							type = TextBlockElement
							hiddenLocal = true
							alpha = 1.0
							dims = (200.0, 26.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (168.6056, 0.0)
							z_priority = 52.0
							scale = (0.9, 1.0)
							rot_angle = 0.0
							rgba = [
								210
								130
								0
								250
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("\m1 BACK")
							font = fontgrid_title_a1
							material = 0x00000000
							single_line = false
							fit_width = `expand dims`
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
							local_id = NewElement1
							type = TextBlockElement
							hiddenLocal = true
							alpha = 1.0
							dims = (200.0, 26.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (262.0, 0.0)
							z_priority = 52.0
							scale = (0.9, 1.0)
							rot_angle = 0.0
							rgba = [
								210
								130
								0
								250
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("\m2 SAVE")
							font = fontgrid_title_a1
							material = 0x00000000
							single_line = false
							fit_width = `expand dims`
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
							local_id = NewElement1
							type = TextBlockElement
							hiddenLocal = true
							alpha = 1.0
							dims = (265.87094, 26.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (353.0, 0.0)
							z_priority = 52.0
							scale = (0.9, 1.0)
							rot_angle = 0.0
							rgba = [
								210
								130
								0
								250
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("\m3 VIEW ALL BY ARTIST")
							font = fontgrid_title_a1
							material = 0x00000000
							single_line = false
							fit_width = `expand dims`
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
					local_id = helper_text_preview
					type = ContainerElement
					hiddenLocal = true
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
					pos = (474.86868, 525.7139)
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
				children = [
					{
						props = {
							local_id = NewElement1
							type = TextBlockElement
							hiddenLocal = true
							alpha = 1.0
							dims = (200.0, 26.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-1.0, 0.0)
							z_priority = 52.0
							scale = (0.9, 1.0)
							rot_angle = 0.0
							rgba = [
								210
								130
								0
								250
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("\b4 PLAY/PAUSE")
							font = fontgrid_title_a1
							material = 0x00000000
							single_line = false
							fit_width = wrap
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
							local_id = NewElement1
							type = TextBlockElement
							hiddenLocal = true
							alpha = 1.0
							dims = (200.0, 26.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (168.6056, 0.0)
							z_priority = 52.0
							scale = (0.9, 1.0)
							rot_angle = 0.0
							rgba = [
								210
								130
								0
								250
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("\b5 BACK")
							font = fontgrid_title_a1
							material = 0x00000000
							single_line = false
							fit_width = `expand dims`
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
					pos = (122.650116, 96.0)
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
							pos = (467.1255, 219.8576)
							z_priority = 60.0
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
							texture = header
							local_id = header
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (205.38342, -23.776918)
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
							local_id = player_bg
							type = SpriteElement
							texture = white
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
							pos = (469.62027, 205.53996)
							z_priority = 2.0
							scale = (10.8, 6.0)
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
							pos = (457.48688, -32.026215)
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
					pos = (953.098, 74.433334)
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
					texture = list_container
					local_id = album_art_frame
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (256.0, 256.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (296.8488, 303.2044)
					z_priority = 20.0
					scale = (1.6, 1.2)
					rot_angle = 0.0
					rgba = [
						30
						30
						30
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
							hiddenLocal = false
							alpha = 1.0
							dims = (400.0, 580.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.98817396, -1.420835)
							z_priority = 21.0
							scale = (0.4, 0.4)
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
							font = fontgrid_text_a3
							material = 0x00000000
							single_line = false
							fit_width = wrap
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
					local_id = preview
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (395.0, 40.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (336.35724, 71.183464)
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
					text = qs("SONG PREVIEW")
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
					pos = (513.36646, 206.26616)
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
							pos = (27.550476, 127.293594)
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
									local_id = note_count01
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (275.0, 33.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 16.5)
									z_priority = 54.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
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
									local_id = note_count02
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (275.0, 33.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 49.5)
									z_priority = 54.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
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
									local_id = note_count03
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (275.0, 33.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 82.5)
									z_priority = 54.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
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
									local_id = note_count04
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (275.0, 33.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 115.5)
									z_priority = 54.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
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
									local_id = note_count05
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (275.0, 33.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 148.5)
									z_priority = 54.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
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
									dims = (560.0, 60.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-102.789, -125.33026)
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
									dims = (560.0, 35.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (-104.08264, -57.632996)
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
									pos = (-165.01831, -171.78897)
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
							pos = (312.55038, 127.293594)
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
									local_id = length
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (275.0, 33.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 16.5)
									z_priority = 54.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
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
									local_id = bpm
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (275.0, 33.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 49.5)
									z_priority = 54.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
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
									local_id = genre
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (275.0, 33.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 82.5)
									z_priority = 54.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
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
									local_id = num_ratings
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (275.0, 33.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (0.0, 115.5)
									z_priority = 54.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										128
										128
										128
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
							local_id = file_id
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (500.0, 30.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-119.84397, 412.8943)
							z_priority = 54.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								90
								90
								90
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("1010101010101")
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
}
uidesc_gh_tunes_preview_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			64
		]
	}
	EditMaterialForm = {
	}
}
