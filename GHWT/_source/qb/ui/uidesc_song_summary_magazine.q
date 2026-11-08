uidesc_song_summary_magazine = {
	DescVersion = 5
	name = uidesc_song_summary_magazine
	rect = [
		0.0
		0.0
		1280.0
		739.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
			]
			name = magazine_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
			]
			name = magazine_rot
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
			]
			name = magazine_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = magazine_bg
					includeParentOwned = false
				}
			]
			name = magazine_bg_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = magazine_headline
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = magazine_band
					includeParentOwned = false
				}
			]
			name = magazine_band_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = magazine_headline
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = magazine_band
					includeParentOwned = false
				}
			]
			name = magazine_band_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = magazine_headline
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = magazine_band
					includeParentOwned = false
				}
			]
			name = magazine_band_shadow_rgba
			target = shadow_rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = magazine_headline
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = magazine_statement
					includeParentOwned = false
				}
			]
			name = magazine_statement_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = magazine_headline
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = magazine_statement
					includeParentOwned = false
				}
			]
			name = magazine_statement_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = magazine_headline
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = magazine_statement
					includeParentOwned = false
				}
			]
			name = magazine_statement_shadow_rgba
			target = shadow_rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = mag_masthead_AP
					includeParentOwned = false
				}
			]
			name = mag_masthead_AP_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = mag_masthead_Billboard
					includeParentOwned = false
				}
			]
			name = mag_masthead_Billboard_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = mag_masthead_Decibel
					includeParentOwned = false
				}
			]
			name = mag_masthead_Decibel_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = mag_masthead_GuitarWorld
					includeParentOwned = false
				}
			]
			name = mag_masthead_GuitarWorld_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = mag_masthead_Hits
					includeParentOwned = false
				}
			]
			name = mag_masthead_Hits_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = mag_masthead_Kerrang
					includeParentOwned = false
				}
			]
			name = mag_masthead_kerrang_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = mag_masthead_MetalEdge
					includeParentOwned = false
				}
			]
			name = mag_masthead_MetalEdge_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = mag_masthead_MOJO
					includeParentOwned = false
				}
			]
			name = mag_masthead_mojo_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = mag_masthead_NME
					includeParentOwned = false
				}
			]
			name = mag_masthead_NME_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = mag_masthead_Q
					includeParentOwned = false
				}
			]
			name = mag_masthead_Q_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 10
					validateLocalID = mag_masthead_Revolver
					includeParentOwned = false
				}
			]
			name = mag_masthead_Revolver_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 11
					validateLocalID = mag_masthead_RollingStone
					includeParentOwned = false
				}
			]
			name = mag_masthead_RollingStone_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = magazine_mastheads
					includeParentOwned = false
				}
				{
					index = 12
					validateLocalID = mag_masthead_SPIN
					includeParentOwned = false
				}
			]
			name = mag_masthead_SPIN_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = photos
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = mag_photo_zakk
					includeParentOwned = false
				}
			]
			name = mag_photo_zakk
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = photos
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = mag_photo_travis
					includeParentOwned = false
				}
			]
			name = mag_photo_travis
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = photos
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = mag_photo_sting
					includeParentOwned = false
				}
			]
			name = mag_photo_sting
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = photos
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = mag_photo_ozzy
					includeParentOwned = false
				}
			]
			name = mag_photo_ozzy
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = photos
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = mag_photo_jimi
					includeParentOwned = false
				}
			]
			name = mag_photo_jimi
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = photos
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = mag_photo_haley
					includeParentOwned = false
				}
			]
			name = mag_photo_haley
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = photos
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = mag_photo_billy
					includeParentOwned = false
				}
			]
			name = mag_photo_billy
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = magazine_cover_NEWYORK
					includeParentOwned = false
				}
			]
			name = magazine_cover_NEWYORK
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = magazine_cover_HONGKONG
					includeParentOwned = false
				}
			]
			name = magazine_cover_HONGKONG
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = magazine_cover_HOB
					includeParentOwned = false
				}
			]
			name = magazine_cover_HOB
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = photos
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = mag_photo_goth
					includeParentOwned = false
				}
			]
			name = mag_photo_goth
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = magazine_cover_FRAT
					includeParentOwned = false
				}
			]
			name = magazine_cover_FRAT
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = magazine_master
				}
				{
					index = 1
					validateLocalID = magazine_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = photos
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = mag_photo_nugent
					includeParentOwned = false
				}
			]
			name = mag_photo_nugent
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = magazine_master
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
					texture = gradient_256
					blend = subtract
					flip_h = true
					local_id = gradient_256
					type = SpriteElement
					alpha = 0.5
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = -1.0
				}
			}
			{
				props = {
					local_id = magazine_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = magazine_overlay
							local_id = magazine_overlay
							type = SpriteElement
							dims = (1280.0, 720.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 10.0
						}
					}
					{
						props = {
							local_id = magazine_headline
							type = MenuElement
							dims = (500.0, 200.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (31.337662, 198.21419)
							z_priority = 1.0
							scale = (1.1, 1.1)
							rot_angle = -2.0
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -10
							position_children = true
							fit_major = `fit content if larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = magazine_band
									type = TextBlockElement
									dims = (500.0, 100.0)
									pos = (250.0, 55.0)
									z_priority = 15.0
									rgba = [
										192
										64
										0
										255
									]
									text = qs("EL CHUMBAWUMBA")
									font = fontgrid_text_A11_b
									fit_width = `scale each line if larger`
									fit_height = `scale to fit`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										1.0
									]
									use_shadow = true
									shadow_rgba = [
										224
										224
										224
										255
									]
								}
							}
							{
								props = {
									local_id = magazine_statement
									type = TextBlockElement
									dims = (500.0, 100.0)
									pos = (250.0, 145.0)
									z_priority = 15.0
									rgba = [
										0
										128
										0
										255
									]
									text = qs(0x41ee9fab)
									font = fontgrid_text_a8
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										-1.0
									]
									internal_scale = (0.9, 0.9)
									font_spacing = 3
									use_shadow = true
									shadow_rgba = [
										192
										192
										192
										255
									]
									line_spacing = 0.8
								}
							}
						]
					}
					{
						props = {
							local_id = magazine_mastheads
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (20.0, -180.0)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = mag_masthead_AP
									local_id = mag_masthead_AP
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_Billboard
									local_id = mag_masthead_Billboard
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_Decibel
									local_id = mag_masthead_Decibel
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_GuitarWorld
									local_id = mag_masthead_GuitarWorld
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_Hits
									local_id = mag_masthead_Hits
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_Kerrang
									local_id = mag_masthead_Kerrang
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_MetalEdge
									local_id = mag_masthead_MetalEdge
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_MOJO
									local_id = mag_masthead_MOJO
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_NME
									local_id = mag_masthead_NME
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_Q
									local_id = mag_masthead_Q
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_Revolver
									local_id = mag_masthead_Revolver
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_RollingStone
									local_id = mag_masthead_RollingStone
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = mag_masthead_SPIN
									local_id = mag_masthead_SPIN
									type = SpriteElement
									alpha = 0.0
									dims = (656.0, 328.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
						]
					}
					{
						props = {
							local_id = photos
							type = ContainerElement
							dims = (512.0, 512.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (24.78888, 15.366287)
							z_priority = 4.0
						}
						children = [
							{
								props = {
									texture = mag_photo_billy
									local_id = mag_photo_billy
									type = SpriteElement
									alpha = 0.0
									dims = (689.0, 689.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.299072, 0.299103)
									z_priority = 5.0
								}
							}
							{
								props = {
									texture = mag_photo_haley
									local_id = mag_photo_haley
									type = SpriteElement
									alpha = 0.0
									dims = (689.0, 689.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.299072, 0.299103)
									z_priority = 5.0
								}
							}
							{
								props = {
									texture = mag_photo_jimi
									local_id = mag_photo_jimi
									type = SpriteElement
									alpha = 0.0
									dims = (689.0, 689.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.299072, 0.299103)
									z_priority = 5.0
								}
							}
							{
								props = {
									texture = mag_photo_ozzy
									local_id = mag_photo_ozzy
									type = SpriteElement
									alpha = 0.0
									dims = (689.0, 689.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.299072, 0.299103)
									z_priority = 5.0
								}
							}
							{
								props = {
									texture = mag_photo_sting
									local_id = mag_photo_sting
									type = SpriteElement
									alpha = 0.0
									dims = (689.0, 689.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.299072, 0.299103)
									z_priority = 5.0
								}
							}
							{
								props = {
									texture = mag_photo_travis
									local_id = mag_photo_travis
									type = SpriteElement
									alpha = 0.0
									dims = (689.0, 689.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.299072, 0.299103)
									z_priority = 5.0
								}
							}
							{
								props = {
									texture = mag_photo_zakk
									local_id = mag_photo_zakk
									type = SpriteElement
									alpha = 0.0
									dims = (689.0, 689.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.299072, 0.299103)
									z_priority = 5.0
								}
							}
							{
								props = {
									texture = mag_photo_goth
									local_id = mag_photo_goth
									type = SpriteElement
									alpha = 0.0
									dims = (689.0, 689.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (10.299069, 10.299103)
									z_priority = 5.0
								}
							}
							{
								props = {
									texture = mag_photo_nugent
									local_id = mag_photo_nugent
									type = SpriteElement
									alpha = 0.0
									dims = (689.0, 689.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (10.299071, 7.299103)
									z_priority = 5.0
								}
							}
						]
					}
					{
						props = {
							texture = magazine_bg
							local_id = magazine_bg
							type = SpriteElement
							dims = (1280.0, 720.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							rgba = [
								192
								192
								192
								255
							]
						}
					}
					{
						props = {
							texture = magazine_cover_NEWYORK
							local_id = magazine_cover_NEWYORK
							type = SpriteElement
							alpha = 0.0
							dims = (700.0, 700.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (30.0, 19.0)
							z_priority = 2.25
						}
					}
					{
						props = {
							texture = magazine_cover_HONGKONG
							local_id = magazine_cover_HONGKONG
							type = SpriteElement
							alpha = 0.0
							dims = (700.0, 700.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (30.0, 19.0)
							z_priority = 2.25
						}
					}
					{
						props = {
							texture = magazine_cover_HOB
							local_id = magazine_cover_HOB
							type = SpriteElement
							alpha = 0.0
							dims = (700.0, 700.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (30.0, 19.0)
							z_priority = 2.25
						}
					}
					{
						props = {
							texture = magazine_cover_FRAT
							local_id = magazine_cover_FRAT
							type = SpriteElement
							alpha = 0.0
							dims = (700.0, 700.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (40.0, 29.0)
							z_priority = 2.25
						}
					}
				]
			}
		]
	}
}
uidesc_song_summary_magazine_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
