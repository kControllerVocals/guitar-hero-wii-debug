uidesc_2g1v = {
	DescVersion = 3
	name = uidesc_2g1v
	rect = [
		-281.18384
		-1.973053
		1404.8519
		679.62585
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 3
					validateLocalID = band_meter
					includeParentOwned = false
				}
			]
			name = alias_band_meter
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = g1
					includeParentOwned = false
				}
			]
			name = alias_g1
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = g2
					includeParentOwned = false
				}
			]
			name = alias_g2
		}
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = NewElement1
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (49.95187, 48.026947)
		}
		children = [
			{
				props = {
					local_id = g2
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (244.36961, 140.42348)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = player_meter
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (170.13303, 208.7957)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (709.2135, 329.0)
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
							desc = 'player_mult_1d'
							autoSizeDims = true
							note_streak_text = qs("8888")
							light0_texture = HUD_score_light_0_blue
							light1_texture = HUD_score_light_0_blue
							light2_texture = HUD_score_light_0_blue
							light3_texture = HUD_score_light_0_blue
							light4_texture = HUD_score_light_0_blue
							nixie_texture = band_HUD_score_2b
							glow0_texture = HUD_rock_tube_glow_full
							glow0_scale = (1.0, 1.0)
							glow1_texture = HUD_rock_tube_glow_full
							glow1_scale = (1.0, 1.0)
							glow2_texture = HUD_rock_tube_glow_full
							glow2_scale = (1.0, 1.0)
						}
					}
					{
						props = {
							local_id = star_power_1g
							type = DescInterface
							hiddenLocal = true
							alpha = 1.0
							dims = (698.07117, 339.4754)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (185.02953, 169.41214)
							z_priority = 2.0
							scale = (0.8, 0.8)
							rot_angle = -1.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							desc = 'star_power_1g'
							autoSizeDims = true
						}
					}
				]
			}
			{
				props = {
					local_id = g1
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-281.13574, 136.57362)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = player_meter
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (170.13303, 208.7957)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (785.16815, 333.19604)
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
							desc = 'player_mult_1d'
							autoSizeDims = true
							note_streak_text = qs("8888")
							light0_texture = HUD_score_light_0_blue
							light1_texture = HUD_score_light_0_blue
							light2_texture = HUD_score_light_0_blue
							light3_texture = HUD_score_light_0_blue
							light4_texture = HUD_score_light_0_blue
							nixie_texture = band_HUD_score_2b
							glow0_texture = HUD_rock_tube_glow_full
							glow0_scale = (1.0, 1.0)
							glow1_texture = HUD_rock_tube_glow_full
							glow1_scale = (1.0, 1.0)
							glow2_texture = HUD_rock_tube_glow_full
							glow2_scale = (1.0, 1.0)
						}
					}
					{
						props = {
							local_id = star_power_1g
							type = DescInterface
							hiddenLocal = true
							alpha = 1.0
							dims = (698.07117, 339.4754)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (260.78836, 171.37962)
							z_priority = 2.0
							scale = (0.8, 0.8)
							rot_angle = -1.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							desc = 'star_power_1g'
							autoSizeDims = true
						}
					}
				]
			}
			{
				props = {
					local_id = NewElement1
					type = SpriteElement
					hiddenLocal = true
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (100.0, 100.0)
					z_priority = 1.0
				}
			}
			{
				props = {
					local_id = band_meter
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (350.5949, 656.888)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (23.62012, 22.737844)
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
					desc = 'band_meter'
					autoSizeDims = true
					score_text = qs("")
					needle_rot_angle = 0.0
					needle_pos = (163.6264, 121.44128)
					bg_rgba = [
						255
						255
						255
						255
					]
					green_light_alpha = 1.0
					yellow_light_alpha = 1.0
					red_light_alpha = 1.0
					multiplier_text = qs("")
					band_HUD_p1_mask_dims = (128.0, 0.0)
					band_HUD_p2_mask_dims = (128.0, 0.0)
					band_HUD_p3_mask_dims = (128.0, 0.0)
					band_HUD_p4_mask_dims = (128.0, 0.0)
					band_HUD_p1_fill_rgba = [
						255
						255
						255
						255
					]
					band_HUD_p2_fill_rgba = [
						255
						255
						255
						255
					]
					band_HUD_p3_fill_rgba = [
						255
						255
						255
						255
					]
					band_HUD_p4_fill_rgba = [
						255
						255
						255
						255
					]
					band_HUD_instrument_p1_texture = band_HUD_bass
					band_HUD_instrument_p2_texture = band_HUD_guitar
					band_HUD_instrument_p3_texture = band_HUD_microphone
					band_HUD_instrument_p4_texture = band_HUD_drums
					band_HUD_instrument_p1_alpha = 1.0
					band_HUD_instrument_p2_alpha = 1.0
					band_HUD_instrument_p3_alpha = 1.0
					band_HUD_instrument_p4_alpha = 1.0
					glow0_texture = HUD_rock_tube_glow_full_b
					glow1_texture = HUD_rock_tube_glow_full_b
					glow2_texture = HUD_rock_tube_glow_full_b
					glow0_scale = (0.5, 0.5)
					glow1_scale = (0.5, 0.5)
					glow2_scale = (0.5, 0.5)
					glow3_texture = HUD_rock_tube_glow_full_b
					glow3_scale = (0.5, 0.5)
					glow4_scale = (0.5, 0.5)
					glow5_scale = (0.5, 0.5)
					glow4_texture = HUD_rock_tube_glow_full_b
					glow5_texture = HUD_rock_tube_glow_full_b
					streak_number_text = qs("50")
				}
			}
			{
				props = {
					local_id = v1
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (95.0, 117.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = vocal_multiplier_star
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (501.4477, 143.86821)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-225.37389, -18.496056)
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
							desc = 'Band_vocal_multiplier'
							autoSizeDims = true
						}
					}
				]
			}
		]
	}
}
uidesc_2g1v_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
