uidesc_calibrate_whammy = {
	DescVersion = 6
	name = uidesc_calibrate_whammy
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
					validateLocalID = calibrate_whammy_master_container
				}
				{
					index = 1
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = resting_position_text
					includeParentOwned = false
				}
			]
			name = alias_resting_position_text
		}
		{
			path = [
				{
					validateLocalID = calibrate_whammy_master_container
				}
				{
					index = 2
					validateLocalID = portrait_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = portrait
					includeParentOwned = false
				}
			]
			name = alias_portrait
		}
		{
			path = [
				{
					validateLocalID = calibrate_whammy_master_container
				}
				{
					index = 0
					validateLocalID = whammy_bg_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = bg2
					includeParentOwned = false
				}
			]
			name = alias_bg2
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = calibrate_whammy_master_container
				}
				{
					index = 2
					validateLocalID = portrait_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = portrait
					includeParentOwned = false
				}
			]
			name = portrait_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = calibrate_whammy_master_container
				}
				{
					index = 1
					validateLocalID = text_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = resting_position_text
					includeParentOwned = false
				}
			]
			name = resting_position_text_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = calibrate_whammy_master_container
				}
				{
					index = 0
					validateLocalID = whammy_bg_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = bg1
					includeParentOwned = false
				}
			]
			name = bg2_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = calibrate_whammy_master_container
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
					local_id = whammy_bg_container
					type = ContainerElement
					dims = (1280.0, 720.0)
					pos = (640.0, 360.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = calwhammy
							local_id = bg2
							type = SpriteElement
							dims = (1024.0, 720.0)
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
							texture = calwhammy2
							local_id = bg1
							type = SpriteElement
							dims = (1024.0, 720.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
						}
					}
				]
			}
			{
				props = {
					local_id = text_container
					type = ContainerElement
					dims = (1280.0, 720.0)
					pos = (640.0, 360.0)
					z_priority = 10.0
				}
				children = [
					{
						props = {
							local_id = info_text_1
							type = TextBlockElement
							dims = (620.0, 90.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (23.528412, -234.59479)
							z_priority = 12.0
							rot_angle = -2.5
							text = qs("Press the whammy bar completely down, and gently allow it to return to its resting position. Press the Green Button to calibrate using this position.")
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
							local_id = NewElement1
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-29.2173, 43.359116)
							z_priority = 11.0
						}
						children = [
							{
								props = {
									local_id = NewElement13
									type = TextBlockElement
									dims = (310.0, 150.0)
									pos = (281.82138, -22.736465)
									z_priority = 12.0
									rot_angle = -3.0
									text = qs("Repeat the process until you see the ----------------------- ----------------- message every time you return the whammy bar to its resting position.")
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
									local_id = NewElement14
									type = TextBlockElement
									dims = (300.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (241.82143, 63.329617)
									z_priority = 12.0
									rot_angle = -4.0
									rgba = [
										128
										255
										128
										255
									]
									text = qs("Calibrate Whammy")
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
							{
								props = {
									local_id = resting_position_text
									type = TextBlockElement
									dims = (300.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (260.4344, 166.86746)
									z_priority = 12.0
									rot_angle = -4.0
									text = qs("RESTING POSITION CALIBRATED")
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
				]
			}
			{
				props = {
					local_id = portrait_container
					type = ContainerElement
					dims = (300.0, 300.0)
					pos = (438.55438, 409.74582)
					z_priority = 10.0
				}
				children = [
					{
						props = {
							texture = calwhammy_portrait
							local_id = portrait
							type = SpriteElement
							dims = (250.0, 512.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 12.0
						}
					}
				]
			}
		]
	}
}
uidesc_calibrate_whammy_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
