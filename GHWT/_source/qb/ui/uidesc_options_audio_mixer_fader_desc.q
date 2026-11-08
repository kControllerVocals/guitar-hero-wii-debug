uidesc_options_audio_mixer_fader_desc = {
	DescVersion = 6
	name = uidesc_options_audio_mixer_fader_desc
	rect = [
		0.0
		0.0
		130.0
		550.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = fader_master
				}
				{
					index = 1
					validateLocalID = mixer_knob_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = knob_note
					includeParentOwned = false
				}
			]
			name = alias_knob_note
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = fader_master
				}
				{
					index = 1
					validateLocalID = mixer_knob_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = mixer_knob
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = knob_highlight
					includeParentOwned = false
				}
			]
			name = knob_highlight_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = fader_master
				}
				{
					index = 1
					validateLocalID = mixer_knob_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = mixer_knob
					includeParentOwned = false
				}
			]
			name = mixer_knob_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = fader_master
				}
				{
					index = 0
					validateLocalID = fader_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = mixer_fader
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = mixer_fader_highlight
					includeParentOwned = false
				}
			]
			name = mixer_fader_highlight_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = fader_master
				}
				{
					index = 0
					validateLocalID = fader_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = mixer_fader
					includeParentOwned = false
				}
			]
			name = mixer_fader_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = fader_master
				}
				{
					index = 0
					validateLocalID = fader_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = mixer_icon
					includeParentOwned = false
				}
			]
			name = mixer_icon_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = fader_master
				}
				{
					index = 1
					validateLocalID = mixer_knob_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = mixer_knob_detent
					includeParentOwned = false
				}
			]
			name = mixer_knob_detent_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = fader_master
				}
				{
					index = 1
					validateLocalID = mixer_knob_container
					includeParentOwned = false
				}
			]
			name = mixer_knob_container_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = fader_master
				}
				{
					index = 0
					validateLocalID = fader_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = mixer_icon
					includeParentOwned = false
				}
			]
			name = mixer_icon_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = fader_master
			type = ContainerElement
			dims = (130.0, 550.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = fader_container
					type = ContainerElement
					dims = (90.0, 320.0)
					just = [
						-1.0
						-1.0
					]
					pos = (18.46454, 177.50832)
					z_priority = 2.0
				}
				children = [
					{
						props = {
							texture = mixer_fader_channel
							local_id = mixer_fader_channel
							type = SpriteElement
							alpha = 0.8
							dims = (100.0, 250.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (2.4683068, -111.14974)
							z_priority = 3.0
							rgba = [
								224
								224
								224
								255
							]
						}
						children = [
							{
								props = {
									texture = white
									local_id = redbar_default
									type = SpriteElement
									dims = (25.0, 6.0)
									just = [
										-1.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (7.531693, -52.850266)
									z_priority = 4.0
									rgba = [
										192
										0
										0
										255
									]
								}
							}
							{
								props = {
									texture = white
									local_id = redbar_default
									type = SpriteElement
									dims = (25.0, 6.0)
									just = [
										1.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-6.468307, -53.850273)
									z_priority = 4.0
									rgba = [
										192
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
							texture = mixer_fader
							local_id = mixer_fader
							type = SpriteElement
							dims = (55.0, 115.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 5.0
						}
						children = [
							{
								props = {
									texture = mixer_fader_highlight
									local_id = mixer_fader_highlight
									type = SpriteElement
									alpha = 0.0
									dims = (64.0, 128.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.22396901, -0.084503)
									z_priority = 6.0
									rgba = [
										0
										250
										154
										255
									]
								}
							}
						]
					}
					{
						props = {
							texture = mixer_icon_guitar
							local_id = mixer_icon
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (45.700565, -113.26415)
							z_priority = 3.0
							scale = (0.8, 0.8)
							rgba = [
								200
								200
								200
								255
							]
						}
					}
				]
			}
			{
				props = {
					local_id = mixer_knob_container
					type = ContainerElement
					dims = (0.0, 0.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (43.46461, -28.4917)
					z_priority = 3.0
					scale = (0.8, 0.8)
				}
				children = [
					{
						props = {
							texture = mixer_knob_three
							local_id = mixer_knob_detent
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (-53.0, -135.99997)
							z_priority = 3.0
						}
					}
					{
						props = {
							texture = mixer_knob
							local_id = mixer_knob
							type = SpriteElement
							dims = (128.0, 128.0)
							pos = (-54.047424, -138.27972)
							z_priority = 4.0
						}
						children = [
							{
								props = {
									texture = circle_32
									local_id = knob_highlight
									type = SpriteElement
									alpha = 0.0
									dims = (32.0, 32.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.29815698, 2.170456)
									z_priority = 5.0
									rgba = [
										0
										250
										154
										255
									]
								}
							}
						]
					}
					{
						props = {
							local_id = knob_title
							type = TextBlockElement
							dims = (50.0, 50.0)
							pos = (-53.66174, -133.1972)
							z_priority = 6.0
							scale = (0.6, 0.6)
							text = qs("")
							font = fontgrid_text_a3
							fit_width = wrap
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
							local_id = knob_note
							type = TextBlockElement
							dims = (70.0, 30.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-53.66174, -96.1972)
							z_priority = 50000.0
							rgba = [
								200
								200
								200
								255
							]
							text = qs("")
							font = fontgrid_text_a3
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.5, 0.5)
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
		]
	}
}
uidesc_options_audio_mixer_fader_desc_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			5
			10
		]
	}
	EditMaterialForm = {
	}
}
