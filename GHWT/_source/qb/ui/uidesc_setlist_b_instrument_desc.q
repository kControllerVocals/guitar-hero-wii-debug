uidesc_Setlist_B_instrument_desc = {
	DescVersion = 5
	name = uidesc_Setlist_B_instrument_desc
	rect = [
		-1000.0
		-1000.0
		2000.0
		2000.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = Setlist_B_instrument_container
				}
				{
					index = 4
					validateLocalID = highlight
					includeParentOwned = false
				}
			]
			name = highlight_pos
			target = pos
			type = pair
		}
	]
	materials = [
		{
			name = sys_fontgrid_title_A2_sys_fontgrid_title_A2
			Template = Fire2D
			technique = Fire_2D
			blendMode = blend
			MaterialProps = [
				{
					name = m_alphaBias
					FloatProperty = 1.0
				}
				{
					name = m_alphaBottom
					FloatProperty = 0.05
				}
				{
					name = m_alphaNoiseScale
					FloatProperty = 0.6
				}
				{
					name = m_alphaPower
					FloatProperty = 0.75
				}
				{
					name = m_alphaTop
					FloatProperty = 0.05
				}
				{
					name = m_colorDistortion
					FloatProperty = 0.5
				}
				{
					name = m_maskDistortionX
					FloatProperty = 0.4
				}
				{
					name = m_maskDistortionY
					FloatProperty = 0.1
				}
				{
					name = m_noise1SpeedX
					FloatProperty = 0.75
				}
				{
					name = m_noise1SpeedY
					FloatProperty = 0.15
				}
				{
					name = m_noise1SpeedZ
					FloatProperty = 0.2
				}
				{
					name = m_noiseMaskBottom
					FloatProperty = 0.5
				}
				{
					name = m_noiseMaskTop
					FloatProperty = 0.75
				}
				{
					name = m_sampDiffuse0
					TextureProperty = 0x00000000
				}
				{
					name = m_sampNoiseVolume1
					TextureProperty = 0x00000000
				}
			]
		}
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = Setlist_B_instrument_container
			type = ContainerElement
			dims = (100.0, 100.0)
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = darken_bkgd
					type = SpriteElement
					alpha = 0.4
					dims = (2000.0, 2000.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
					rgba = [
						0
						0
						0
						255
					]
				}
			}
			{
				props = {
					texture = setlist_popup_sm_frame
					local_id = setlist_popup_sm_frame
					type = SpriteElement
					dims = (386.0, 376.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (1.000008, -18.99999)
					z_priority = 3.0
				}
			}
			{
				props = {
					local_id = white_bkgd_crop
					type = WindowElement
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
					pos = (-74.99997, -73.99997)
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
							texture = setlist_popup_white_bkgd
							local_id = setlist_popup_white_bkgd
							type = SpriteElement
							dims = (859.0, 368.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (156.99991, -23.0)
							z_priority = 1.0
						}
					}
				]
			}
			{
				props = {
					local_id = Instruments
					type = TextBlockElement
					dims = (300.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.9999729, -160.0)
					z_priority = 4.0
					rgba = [
						192
						192
						192
						255
					]
					text = qs("INSTRUMENTS")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
				}
			}
			{
				props = {
					texture = setlist_popup_highlight
					local_id = highlight
					type = SpriteElement
					dims = (300.0, 68.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-10.0, -66.0)
					z_priority = 2.0
					rgba = [
						255
						255
						255
						220
					]
				}
			}
			{
				props = {
					local_id = instrument_B_menu
					type = MenuElement
					dims = (160.0, 250.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (31.999966, 16.999987)
					z_priority = 5.0
					internal_just = [
						0.0
						0.0
					]
					position_children = true
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							local_id = guitar
							type = TextBlockElement
							dims = (150.0, 50.0)
							pos = (80.0, 50.0)
							z_priority = 4.0
							rgba = [
								93
								30
								28
								255
							]
							text = qs("GUITAR")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `clip bottom lines`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.7, 0.7)
						}
					}
					{
						props = {
							local_id = Bass
							type = TextBlockElement
							dims = (150.0, 50.0)
							pos = (80.0, 100.0)
							z_priority = 4.0
							rgba = [
								93
								30
								28
								255
							]
							text = qs("BASS")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `clip bottom lines`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.7, 0.7)
						}
					}
					{
						props = {
							local_id = Drums
							type = TextBlockElement
							dims = (150.0, 50.0)
							pos = (80.0, 150.0)
							z_priority = 4.0
							rgba = [
								93
								30
								28
								255
							]
							text = qs("DRUMS")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `clip bottom lines`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.7, 0.7)
						}
					}
					{
						props = {
							local_id = Vocals
							type = TextBlockElement
							dims = (150.0, 50.0)
							pos = (80.0, 200.0)
							z_priority = 4.0
							rgba = [
								93
								30
								28
								255
							]
							text = qs("VOCALS")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `clip bottom lines`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.7, 0.7)
						}
					}
				]
			}
			{
				props = {
					local_id = instrument_icons_menu
					type = MenuElement
					dims = (100.0, 446.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-74.999985, -165.45535)
					z_priority = 5.0
					internal_just = [
						0.0
						0.0
					]
					padding_scale = 1.1
					spacing_between = -22
					position_children = true
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							texture = mixer_icon_guitar
							local_id = mixer_icon_guitar
							type = SpriteElement
							dims = (64.0, 64.0)
							pos = (50.0, 150.4)
							z_priority = 3.0
						}
					}
					{
						props = {
							texture = mixer_icon_bass
							local_id = mixer_icon_bass
							type = SpriteElement
							dims = (64.0, 64.0)
							pos = (50.0, 198.79999)
							z_priority = 3.0
						}
					}
					{
						props = {
							texture = mixer_icon_drums
							local_id = mixer_icon_drums
							type = SpriteElement
							dims = (64.0, 64.0)
							pos = (50.0, 247.19998)
							z_priority = 3.0
						}
					}
					{
						props = {
							texture = mixer_icon_vox
							local_id = mixer_icon_vox
							type = SpriteElement
							dims = (64.0, 64.0)
							pos = (50.0, 295.6)
							z_priority = 3.0
						}
					}
				]
			}
		]
	}
}
uidesc_Setlist_B_instrument_desc_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
		selectedMaterial = sys_fontgrid_title_A2_sys_fontgrid_title_A2
	}
}
