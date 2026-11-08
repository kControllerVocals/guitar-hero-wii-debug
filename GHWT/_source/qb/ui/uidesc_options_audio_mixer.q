uidesc_options_audio_mixer = {
	DescVersion = 15
	name = uidesc_options_audio_mixer
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
					validateLocalID = AudioMixer_master_container
				}
				{
					index = 1
					validateLocalID = faders_container
					includeParentOwned = false
				}
			]
			name = alias_faders_container
			visiblename = 'alias_faders_container'
			help = 'AudioMixer_master_container -> faders_container'
		}
		{
			path = [
				{
					validateLocalID = AudioMixer_master_container
				}
				{
					index = 2
					validateLocalID = VU_lights_container
					includeParentOwned = false
				}
			]
			name = alias_VU_lights_container
			visiblename = 'alias_VU_lights_container'
			help = 'AudioMixer_master_container -> VU_lights_container'
		}
		{
			path = [
				{
					validateLocalID = AudioMixer_master_container
				}
				{
					index = 0
					validateLocalID = audio_mixer_menu_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = audio_mixer_menu
					includeParentOwned = false
				}
			]
			name = alias_audio_mixer_menu
			visiblename = 'alias_audio_mixer_menu'
			help = 'AudioMixer_master_container -> audio_mixer_menu_container -> audio_mixer_menu'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = AudioMixer_master_container
				}
				{
					index = 0
					validateLocalID = audio_mixer_menu_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = audio_mixer_menu
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = dolby_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dolby_light_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = mixer_red_light_OFF
					includeParentOwned = false
				}
			]
			name = mixer_red_light_OFF_alpha
			visiblename = 'mixer_red_light_OFF_alpha'
			help = 'AudioMixer_master_container -> audio_mixer_menu_container -> audio_mixer_menu -> dolby_container -> dolby_light_container -> mixer_red_light_OFF => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = AudioMixer_master_container
				}
				{
					index = 0
					validateLocalID = audio_mixer_menu_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = audio_mixer_menu
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = dolby_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dolby_light_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = dolby_highlight_container
					includeParentOwned = false
				}
			]
			name = dolby_highlight_container_alpha
			visiblename = 'dolby_highlight_container_alpha'
			help = 'AudioMixer_master_container -> audio_mixer_menu_container -> audio_mixer_menu -> dolby_container -> dolby_light_container -> dolby_highlight_container => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = AudioMixer_master_container
				}
				{
					index = 4
					validateLocalID = info_area
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = mixer_info
					includeParentOwned = false
				}
			]
			name = mixer_info_text
			visiblename = 'mixer_info_text'
			help = 'AudioMixer_master_container -> info_area -> mixer_info => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = AudioMixer_master_container
				}
				{
					index = 3
					validateLocalID = mixer_channel_lamp
					includeParentOwned = false
				}
			]
			name = mixer_channel_lamp_pos
			visiblename = 'mixer_channel_lamp_pos'
			help = 'AudioMixer_master_container -> mixer_channel_lamp => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = AudioMixer_master_container
				}
				{
					index = 0
					validateLocalID = audio_mixer_menu_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = mixer_menu_highlight
					includeParentOwned = false
				}
			]
			name = mixer_menu_highlight_pos
			visiblename = 'mixer_menu_highlight_pos'
			help = 'AudioMixer_master_container -> audio_mixer_menu_container -> mixer_menu_highlight => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = AudioMixer_master_container
				}
				{
					index = 0
					validateLocalID = audio_mixer_menu_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = mixer_menu_highlight
					includeParentOwned = false
				}
			]
			name = mixer_menu_highlight_alpha
			visiblename = 'mixer_menu_highlight_alpha'
			help = 'AudioMixer_master_container -> audio_mixer_menu_container -> mixer_menu_highlight => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = AudioMixer_master_container
				}
				{
					index = 3
					validateLocalID = mixer_channel_lamp
					includeParentOwned = false
				}
			]
			name = mixer_channel_lamp_alpha
			visiblename = 'mixer_channel_lamp_alpha'
			help = 'AudioMixer_master_container -> mixer_channel_lamp => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = AudioMixer_master_container
				}
				{
					index = 0
					validateLocalID = audio_mixer_menu_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = audio_mixer_menu
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = dolby_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = dolby_highlight_container
					includeParentOwned = false
				}
			]
			name = dolby_highlight_alpha
			visiblename = 'dolby_highlight_alpha'
			help = 'AudioMixer_master_container -> audio_mixer_menu_container -> audio_mixer_menu -> dolby_container -> dolby_highlight_container => alpha'
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = AudioMixer_master_container
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
					local_id = audio_mixer_menu_container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (30.0, 30.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (309.0, 373.0)
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
							local_id = audio_mixer_menu
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (120.0, 471.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-1.2323301, -174.7677)
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
							internal_just = [
								0.0
								0.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 15
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
									local_id = menu_item_guitar
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (120.0, 30.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (60.0, 65.5)
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
									text = qs("GUITAR")
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
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
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (1.0, 1.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = menu_item_BASS
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (120.0, 30.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (60.0, 110.5)
									z_priority = 3.0
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
									text = qs("BASS")
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
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
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (1.0, 1.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = menu_item_DRUMS
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (120.000015, 30.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (60.0, 155.5)
									z_priority = 3.0
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
									text = qs("DRUMS")
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
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
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (1.0, 1.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = menu_item_MIC
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (120.00001, 30.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (60.0, 200.5)
									z_priority = 3.0
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
									text = qs("MIC")
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
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
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (1.0, 1.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = menu_item_VOX
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (120.00001, 30.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (60.0, 245.5)
									z_priority = 3.0
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
									text = qs("VOCALS")
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
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
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (1.0, 1.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = menu_item_SFX
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (120.0, 30.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (60.0, 290.5)
									z_priority = 3.0
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
									text = qs("EFFECTS")
									font = fontgrid_text_a3
									material = 0x00000000
									single_line = false
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = `per axis`
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
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (1.0, 1.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = dolby_container
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
									pos = (60.0, 370.5)
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
											local_id = dolby_light_container
											type = ContainerElement
											hiddenLocal = false
											alpha = 1.0
											dims = (50.0, 50.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (-9.0, -12.118351)
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
													texture = mixer_red_light_OFF
													local_id = mixer_red_light_OFF
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
													pos = (1.861938, -13.228577)
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
													local_id = dolby_highlight_container
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
													pos = (3.362366, -11.435391)
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
															texture = mixer_red_light_ON
															local_id = mixer_red_light_ON
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
															pos = (-1.146088, -1.0963291)
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
															texture = mixer_glow_64
															blend = Add
															local_id = dolby_glow_red
															type = SpriteElement
															hiddenLocal = false
															alpha = 0.5
															dims = (200.0, 200.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (-2.338959, 0.90367097)
															z_priority = 4.0
															scale = (1.0, 1.0)
															rot_angle = 0.0
															rgba = [
																255
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
															texture = mixer_glow_64
															blend = Add
															local_id = dolby_glow_white
															type = SpriteElement
															hiddenLocal = false
															alpha = 0.4
															dims = (128.0, 128.0)
															just = [
																0.0
																0.0
															]
															pos_anchor = [
																0.0
																0.0
															]
															pos = (-2.338959, 0.90367097)
															z_priority = 4.0
															scale = (1.0, 1.0)
															rot_angle = 0.0
															rgba = [
																255
																192
																192
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
													texture = dolby_logo
													local_id = dolby_logo
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
													pos = (2.0071719, 41.92392)
													z_priority = 2.0
													scale = (0.65000004, 0.65000004)
													rot_angle = 0.0
													rgba = [
														200
														200
														200
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
											local_id = dolby_highlight_container
											type = ContainerElement
											hiddenLocal = false
											alpha = 0.0
											dims = (180.0, 120.0)
											just = [
												0.0
												0.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (-10.0, -2.0)
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
													texture = mixer_menu_highlight
													local_id = bottom
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (180.0, 5.0)
													just = [
														0.0
														1.0
													]
													pos_anchor = [
														0.0
														1.0
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
												}
											}
											{
												props = {
													blend = blend
													texture = mixer_menu_highlight
													local_id = top
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (180.0, 5.0)
													just = [
														0.0
														-1.0
													]
													pos_anchor = [
														0.0
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
												}
											}
											{
												props = {
													blend = blend
													texture = mixer_menu_highlight
													local_id = left
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (5.0, 120.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														0.0
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
												}
											}
											{
												props = {
													blend = blend
													texture = mixer_menu_highlight
													local_id = right
													type = SpriteElement
													hiddenLocal = false
													alpha = 1.0
													dims = (5.0, 120.0)
													just = [
														1.0
														0.0
													]
													pos_anchor = [
														1.0
														0.0
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
							blend = blend
							texture = mixer_menu_highlight
							local_id = mixer_menu_highlight
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (180.0, 35.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-7.3388524, -134.85092)
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
							local_id = tape_stops
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
							pos = (100.0, 116.0)
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
									texture = mix_tape_001
									local_id = mix_tape_001
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
									pos = (10.686188, 13.974143)
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
							}
							{
								props = {
									blend = blend
									texture = mix_tape_002
									local_id = mix_tape_002
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
									pos = (134.2406, 16.110247)
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
							}
							{
								props = {
									blend = blend
									texture = mix_tape_003
									local_id = mix_tape_003
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
									pos = (264.3553, 16.110167)
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
							}
							{
								props = {
									blend = blend
									texture = mix_tape_004
									local_id = mix_tape_004
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
									pos = (355.09332, 19.534332)
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
							}
							{
								props = {
									blend = blend
									texture = mix_tape_005
									local_id = mix_tape_005
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
									pos = (438.98288, 21.246355)
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
							}
						]
					}
				]
			}
			{
				props = {
					local_id = faders_container
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (630.0, 550.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (391.92334, 41.92405)
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
					isVertical = false
					internal_just = [
						-1.0
						0.0
					]
					regular_space_amount = 87
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
							local_id = fader_guitar_desc
							type = DescInterface
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
							pos = (43.5, 275.0)
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
							desc = 'options_audio_mixer_fader_desc'
							autoSizeDims = true
							knob_highlight_alpha = 0.0
							mixer_knob_rot_angle = 90.0
							mixer_fader_highlight_alpha = 0.0
							mixer_fader_pos = (0.0, 0.0)
							mixer_icon_texture = mixer_icon_guitar
							mixer_knob_detent_texture = mixer_knob_three
							mixer_knob_container_alpha = 0.5
							mixer_icon_alpha = 1.0
						}
					}
					{
						props = {
							local_id = fader_bass_desc
							type = DescInterface
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
							pos = (130.5, 275.0)
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
							desc = 'options_audio_mixer_fader_desc'
							autoSizeDims = true
							knob_highlight_alpha = 0.0
							mixer_knob_rot_angle = 0.0
							mixer_fader_highlight_alpha = 0.0
							mixer_fader_pos = (0.0, 0.0)
							mixer_icon_texture = mixer_icon_bass
							mixer_knob_detent_texture = mixer_knob_three
							mixer_knob_container_alpha = 0.5
							mixer_icon_alpha = 1.0
						}
					}
					{
						props = {
							local_id = fader_drums_desc
							type = DescInterface
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
							pos = (217.5, 275.0)
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
							desc = 'options_audio_mixer_fader_desc'
							autoSizeDims = true
							knob_highlight_alpha = 0.0
							mixer_knob_rot_angle = 180.0
							mixer_fader_highlight_alpha = 0.0
							mixer_fader_pos = (0.0, 0.0)
							mixer_icon_texture = mixer_icon_drums
							mixer_knob_detent_texture = mixer_knob_three
							mixer_knob_container_alpha = 0.5
							mixer_icon_alpha = 1.0
						}
					}
					{
						props = {
							local_id = fader_mic_desc
							type = DescInterface
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
							pos = (304.5, 275.0)
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
							desc = 'options_audio_mixer_fader_desc'
							autoSizeDims = true
							knob_highlight_alpha = 0.0
							mixer_knob_rot_angle = 90.0
							mixer_fader_highlight_alpha = 0.0
							mixer_fader_pos = (0.0, 0.0)
							mixer_icon_texture = mixer_icon_vox
							mixer_knob_detent_texture = mixer_knob_three
							mixer_knob_container_alpha = 0.5
							mixer_icon_alpha = 1.0
						}
					}
					{
						props = {
							local_id = fader_vocals_desc
							type = DescInterface
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
							pos = (391.5, 275.0)
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
							desc = 'options_audio_mixer_fader_desc'
							autoSizeDims = true
							knob_highlight_alpha = 0.0
							mixer_knob_rot_angle = 130.0
							mixer_fader_highlight_alpha = 0.0
							mixer_fader_pos = (0.0, 0.0)
							mixer_icon_texture = mixer_icon_vox_guide
							mixer_knob_detent_texture = mixer_knob_five
							mixer_knob_container_alpha = 0.5
							mixer_icon_alpha = 1.0
						}
					}
					{
						props = {
							local_id = fader_master_desc
							type = DescInterface
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
							pos = (478.5, 275.0)
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
							desc = 'options_audio_mixer_fader_desc'
							autoSizeDims = true
							knob_highlight_alpha = 0.0
							mixer_knob_rot_angle = 180.0
							mixer_fader_highlight_alpha = 0.0
							mixer_fader_pos = (0.0, 0.0)
							mixer_icon_texture = mixer_icon_master
							mixer_knob_detent_texture = mixer_knob_three
							mixer_knob_container_alpha = 0.5
							mixer_icon_alpha = 1.0
						}
					}
				]
			}
			{
				props = {
					local_id = VU_lights_container
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (20.0, 245.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (1010.41907, 388.98288)
					z_priority = 1.0
					scale = (1.0, 1.0)
					rot_angle = 180.0
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
						0.0
						0.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = 5
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
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_01
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (10.0, 10.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_02
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (10.0, 35.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_03
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (10.0, 60.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_04
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (10.0, 85.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_05
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (10.0, 110.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_06
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (10.0, 135.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								0
								250
								154
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_07
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (10.0, 160.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								218
								165
								32
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_08
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (10.0, 185.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								218
								165
								32
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_09
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (10.0, 210.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								255
								128
								128
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
					{
						props = {
							blend = blend
							texture = mixer_bulb
							local_id = mixer_bulb_10
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (20.0, 20.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (10.0, 235.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 180.0
							rgba = [
								255
								128
								128
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
					texture = mixer_channel_lamp
					blend = Add
					local_id = mixer_channel_lamp
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (180.0, 650.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (446.35968, 0.0)
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
					local_id = info_area
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
					pos = (702.43353, 598.3912)
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
							texture = mixer_info_area
							local_id = mixer_info_frame
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (760.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (50.265835, 50.265892)
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
					}
					{
						props = {
							local_id = mixer_info
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (600.00006, 70.0)
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
								128
								64
								64
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("USE THIS TO ADJUST THE VOLUME OF YOUR GUITAR")
							font = fontgrid_text_a6
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
							line_spacing = 0.8
						}
					}
				]
			}
			{
				props = {
					blend = blend
					texture = mixer_BG
					local_id = mixer_BG
					type = SpriteElement
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
			}
			{
				props = {
					local_id = mixer_screws
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (50.0, 50.0)
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
				}
				children = [
					{
						props = {
							blend = blend
							texture = mixer_screw
							local_id = mixer_screw_TL
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (45.0, 45.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (234.53175, 11.204526)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 15.0
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
							texture = mixer_screw
							local_id = mixer_screw_BR
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (40.0, 40.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (997.60016, 658.43823)
							z_priority = 3.0
							scale = (1.0, 1.0)
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
							blend = blend
							texture = mixer_screw
							local_id = mixer_screw_TR
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (40.0, 40.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (996.50964, 16.558783)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = -8.0
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
							texture = mixer_screw
							local_id = mixer_screw_BL
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (55.0, 55.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (230.9766, 655.83167)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 5.0
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
					local_id = dividers_container
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (720.0, 550.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (346.962, 8.8860235)
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
					isVertical = false
					internal_just = [
						-1.0
						0.0
					]
					regular_space_amount = 87
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
							blend = blend
							local_id = divider_01
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (43.5, 275.0)
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
							local_id = divider_02
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (130.5, 275.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 1.5
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
							local_id = divider_03
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (217.5, 275.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 1.0
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
							local_id = divider_04
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (304.5, 275.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 2.0
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
							local_id = divider_05
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (391.5, 275.0)
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
							local_id = divider_06
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (478.5, 275.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.5
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
							local_id = divider_07
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (565.5, 275.0)
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
							local_id = divider_08
							type = SpriteElement
							hiddenLocal = true
							alpha = 0.2
							dims = (3.0, 540.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (652.5, 275.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 1.5
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
}
uidesc_options_audio_mixer_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			9
		]
	}
	EditMaterialForm = {
	}
}
