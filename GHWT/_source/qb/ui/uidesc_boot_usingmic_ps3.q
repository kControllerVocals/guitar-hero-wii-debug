uidesc_boot_usingMic_ps3 = {
	DescVersion = 4
	name = uidesc_boot_usingMic_ps3
	rect = [
		-13.048341
		-40.316406
		1290.0
		813.1799
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = Screen_Guitar
				}
				{
					index = 0
					validateLocalID = bG
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = instrument
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = left
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ps3
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = continueback
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = continue
					includeParentOwned = false
				}
			]
			name = green_button_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Screen_Guitar
				}
				{
					index = 0
					validateLocalID = bG
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = instrument
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = left
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = ps3
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = back
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = back
					includeParentOwned = false
				}
			]
			name = red_button_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = Screen_Guitar
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (100.0, 100.0)
		}
		children = [
			{
				props = {
					blend = blend
					local_id = bG
					type = SpriteElement
					dims = (1290.0, 730.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (531.95166, 258.8058)
					z_priority = 1.0
					rgba = [
						228
						146
						89
						255
					]
					texture = white
				}
				children = [
					{
						props = {
							local_id = humor
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-438.30368, -175.9222)
							z_priority = 1.0
						}
						children = [
							{
								props = {
									texture = humor_mic
									local_id = boot_drum
									type = SpriteElement
									dims = (1024.0, 512.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (447.78473, 20.0)
									z_priority = 2.0
									scale = (0.95, 0.95)
								}
							}
						]
					}
					{
						props = {
							local_id = instrument
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-450.42307, -142.51627)
							z_priority = 1.0
							scale = (0.95, 0.95)
						}
						children = [
							{
								props = {
									local_id = right
									type = ContainerElement
									dims = (100.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (160.15723, 70.46102)
									z_priority = 2.0
								}
								children = [
									{
										props = {
											local_id = hit_text
											type = TextBlockElement
											dims = (200.0, 100.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (626.959, 318.1264)
											z_priority = 3.0
											rgba = [
												0
												0
												0
												255
											]
											text = qs("CLAP TO \nACTIVATE\n STAR POWER")
											font = fontgrid_title_a1
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
								]
							}
							{
								props = {
									local_id = left
									type = ContainerElement
									dims = (100.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (100.0, 100.0)
									z_priority = 2.0
								}
								children = [
									{
										props = {
											local_id = mic
											type = ContainerElement
											dims = (100.0, 100.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (-1.5880411, -101.46096)
											z_priority = 2.0
										}
										children = [
											{
												props = {
													local_id = sing
													type = TextBlockElement
													dims = (160.0, 40.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (-16.578959, 181.83412)
													z_priority = 3.0
													rgba = [
														0
														0
														0
														255
													]
													text = qs("SING")
													font = fontgrid_title_a1
													fit_width = wrap
													fit_height = `scale down if larger`
													scale_mode = proportional
													text_case = Original
													internal_just = [
														0.0
														-1.0
													]
													shadow_offs = (3.0, 3.0)
												}
											}
											{
												props = {
													local_id = line
													type = SpriteElement
													dims = (3.0, 50.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (-21.30487, 224.20839)
													z_priority = 4.0
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
													texture = instrument_mic
													flip_v = false
													local_id = instrument_mic
													type = SpriteElement
													dims = (256.0, 256.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (-28.81711, 357.92215)
													z_priority = 3.0
												}
											}
										]
									}
									{
										props = {
											local_id = ps3
											type = ContainerElement
											dims = (100.0, 100.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (93.55161, -101.46096)
											z_priority = 2.0
										}
										children = [
											{
												props = {
													texture = instrument_mic_ps3
													local_id = instrument_mic_ps3
													type = SpriteElement
													dims = (300.0, 300.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (123.11506, 360.0)
													z_priority = 3.0
													scale = (0.8, 0.8)
												}
											}
											{
												props = {
													local_id = SP
													type = ContainerElement
													dims = (100.0, 100.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (100.0, 100.0)
													z_priority = 3.0
												}
												children = [
													{
														props = {
															local_id = `line-black`
															type = SpriteElement
															dims = (3.0, 70.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (94.67305, 180.0)
															z_priority = 3.0
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
															local_id = activate
															type = TextBlockElement
															dims = (240.0, 80.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (204.42044, 100.90019)
															z_priority = 4.0
															rgba = [
																0
																0
																0
																255
															]
															text = qs("ACTIVATE\nSTAR POWER")
															font = fontgrid_title_a1
															fit_width = wrap
															fit_height = `scale down if larger`
															scale_mode = proportional
															text_case = Original
															shadow_offs = (3.0, 3.0)
														}
													}
													{
														props = {
															local_id = `line-white`
															type = SpriteElement
															dims = (3.0, 30.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (94.67305, 205.0)
															z_priority = 4.0
														}
													}
												]
											}
											{
												props = {
													local_id = continueback
													type = ContainerElement
													dims = (100.0, 100.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (100.0, 100.0)
													z_priority = 3.0
												}
												children = [
													{
														props = {
															local_id = `line-black`
															type = SpriteElement
															dims = (3.0, 70.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (94.67305, 310.0)
															z_priority = 3.0
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
															local_id = `line-white`
															type = SpriteElement
															dims = (3.0, 50.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (94.67305, 279.44455)
															z_priority = 4.0
														}
													}
													{
														props = {
															local_id = continue
															type = TextBlockElement
															dims = (180.0, 40.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (233.628, 338.44196)
															z_priority = 3.0
															rgba = [
																0
																0
																0
																255
															]
															text = qs("CONTINUE")
															font = fontgrid_title_a1
															fit_width = wrap
															fit_height = `scale down if larger`
															scale_mode = proportional
															text_case = Original
															shadow_offs = (3.0, 3.0)
														}
													}
													{
														props = {
															local_id = `line-black`
															type = SpriteElement
															dims = (3.0, 40.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (114.29323, 344.50848)
															z_priority = 3.0
															rot_angle = 90.0
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
													local_id = updown
													type = ContainerElement
													dims = (100.0, 100.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (20.42062, 238.51564)
													z_priority = 3.0
												}
												children = [
													{
														props = {
															local_id = line
															type = SpriteElement
															dims = (3.0, 70.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (32.0, 50.0)
															z_priority = 4.0
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
															local_id = updown
															type = TextBlockElement
															dims = (220.0, 40.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (43.583, -7.4854894)
															z_priority = 3.0
															rgba = [
																0
																0
																0
																255
															]
															text = qs("UP/DOWN")
															font = fontgrid_title_a1
															fit_width = wrap
															fit_height = `scale down if larger`
															scale_mode = proportional
															text_case = Original
															internal_just = [
																0.0
																-1.0
															]
															shadow_offs = (3.0, 3.0)
														}
													}
												]
											}
											{
												props = {
													local_id = back
													type = ContainerElement
													dims = (100.0, 100.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (102.222115, 134.44427)
													z_priority = 3.0
												}
												children = [
													{
														props = {
															local_id = back
															type = TextBlockElement
															dims = (180.0, 40.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (237.9857, 197.89035)
															z_priority = 3.0
															rgba = [
																0
																0
																0
																255
															]
															text = qs("CONTINUE")
															font = fontgrid_title_a1
															fit_width = wrap
															fit_height = `scale down if larger`
															scale_mode = proportional
															text_case = Original
															shadow_offs = (3.0, 3.0)
														}
													}
													{
														props = {
															local_id = `line-black`
															type = SpriteElement
															dims = (20.0, 3.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (131.137, 199.03093)
															z_priority = 3.0
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
															local_id = `line-white`
															type = SpriteElement
															dims = (20.0, 3.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (119.99999, 199.03093)
															z_priority = 4.0
														}
													}
												]
											}
											{
												props = {
													local_id = volume
													type = ContainerElement
													dims = (100.0, 100.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (89.424255, 114.54164)
													z_priority = 3.0
												}
												children = [
													{
														props = {
															flip_h = false
															flip_v = false
															local_id = `line-black_v`
															type = SpriteElement
															dims = (3.0, 60.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (-73.825455, 176.93599)
															z_priority = 3.0
															rot_angle = 90.0
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
															local_id = line
															type = SpriteElement
															dims = (3.0, 130.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (-104.020195, 239.95824)
															z_priority = 4.0
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
															local_id = VOLUME_TEXT
															type = TextBlockElement
															dims = (150.0, 40.0)
															pos_anchor = [
																0.0
																0.0
															]
															pos = (-129.29756, 326.82053)
															z_priority = 3.0
															rgba = [
																0
																0
																0
																255
															]
															text = qs("VOLUME")
															font = fontgrid_title_a1
															fit_width = wrap
															fit_height = `scale down if larger`
															scale_mode = proportional
															text_case = Original
															internal_just = [
																0.0
																-1.0
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
							{
								props = {
									texture = instrument_mic_bg
									local_id = instrument_mic_bg
									type = SpriteElement
									dims = (1024.0, 512.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (482.1451, 329.8674)
									z_priority = 2.0
								}
							}
						]
					}
				]
			}
		]
	}
}
uidesc_boot_usingMic_ps3_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
