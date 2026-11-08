uidesc_boot_usingDrum = {
	DescVersion = 3
	name = uidesc_boot_usingDrum
	rect = [
		-13.048341
		-36.39151
		1290.0
		769.74146
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
					index = 2
					validateLocalID = green
					includeParentOwned = false
				}
				{
					index = 1
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
					validateLocalID = red
					includeParentOwned = false
				}
				{
					index = 1
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
							pos = (-438.30383, -173.9222)
							z_priority = 1.0
						}
						children = [
							{
								props = {
									texture = humor_drum
									local_id = boot_drum
									type = SpriteElement
									dims = (1024.0, 512.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (447.78473, 14.244904)
									z_priority = 2.0
									scale = (0.91999996, 0.91999996)
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
							pos = (-422.4232, -133.51628)
							z_priority = 1.0
							scale = (0.9, 0.9)
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
									pos = (96.823875, 68.23883)
									z_priority = 2.0
								}
								children = [
									{
										props = {
											texture = instrument_drum_hit
											local_id = instrument_drum_hit
											type = SpriteElement
											dims = (512.0, 512.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (673.4655, 278.6729)
											z_priority = 2.0
											scale = (0.85, 0.85)
										}
									}
									{
										props = {
											local_id = hit_text
											type = TextBlockElement
											dims = (300.0, 100.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (706.9911, 351.58984)
											z_priority = 3.0
											rgba = [
												0
												0
												0
												255
											]
											text = qs("HIT BOTH CYMBALS\nTO ACTIVATE\nSTAR POWER")
											font = fontgrid_title_a1
											fit_width = wrap
											fit_height = `scale down if larger`
											scale_mode = proportional
											text_case = Original
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
											texture = instrument_drum_drumset
											local_id = instrument_drum_drumset
											type = SpriteElement
											dims = (512.0, 512.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (152.22253, 229.50706)
											z_priority = 2.0
											scale = (0.7, 0.7)
										}
									}
									{
										props = {
											local_id = red
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
													texture = line01
													flip_v = true
													flip_h = true
													local_id = line
													type = SpriteElement
													dims = (32.0, 64.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (22.003462, 283.0)
													z_priority = 4.0
													rot_angle = -90.0
												}
											}
											{
												props = {
													local_id = back
													type = TextBlockElement
													dims = (200.0, 40.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (-65.58009, 250.0)
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
													internal_just = [
														1.0
														-1.0
													]
													shadow_offs = (3.0, 3.0)
												}
											}
										]
									}
									{
										props = {
											local_id = green
											type = ContainerElement
											dims = (100.0, 100.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (144.86621, -101.46096)
											z_priority = 2.0
										}
										children = [
											{
												props = {
													texture = line01
													flip_v = false
													flip_h = true
													local_id = line
													type = SpriteElement
													dims = (32.0, 64.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (74.240135, 283.0)
													z_priority = 4.0
													rot_angle = 90.0
												}
											}
											{
												props = {
													local_id = continue
													type = TextBlockElement
													dims = (240.0, 40.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (202.83345, 250.0)
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
											pos = (100.0, 100.0)
											z_priority = 3.0
										}
										children = [
											{
												props = {
													local_id = line
													type = SpriteElement
													dims = (3.0, 50.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (32.338192, 26.666676)
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
													local_id = updown
													type = TextBlockElement
													dims = (300.0, 40.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (93.03725, -9.852875)
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
													shadow_offs = (3.0, 3.0)
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
}
uidesc_boot_usingDrum_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
