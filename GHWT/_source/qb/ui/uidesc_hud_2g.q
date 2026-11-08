uidesc_hud_2g = {
	DescVersion = 6
	name = uidesc_hud_2g
	rect = [
		-0.048130002
		-23.973053
		1280.0
		762.0037
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 2
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
					index = 3
					validateLocalID = HUD_band_battle
					includeParentOwned = false
				}
			]
			name = alias_faceoff_meter
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 4
					validateLocalID = boss_battle
					includeParentOwned = false
				}
			]
			name = alias_boss_meter
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
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
					index = 1
					validateLocalID = g2
					includeParentOwned = false
				}
			]
			name = alias_g2
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = g1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = hud_message_fire
					includeParentOwned = false
				}
			]
			name = alias_hud_message_fire_p1
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 1
					validateLocalID = g2
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = hud_message_fire
					includeParentOwned = false
				}
			]
			name = alias_hud_message_fire_p2
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
					local_id = g1
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (365.04803, 371.9956)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = hud_message_fire
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 400.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (0.0, 30.0)
							z_priority = 0.01
							scale = (1.0, 0.75)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							desc = 'hud_message_fire'
							autoSizeDims = true
						}
					}
					{
						props = {
							local_id = player_meter
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (216.66626, 260.99463)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (113.9844, 87.0162)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = -1.0
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
							glow0_texture = HUD_rock_tube_glow_full
							glow0_scale = (1.0, 1.0)
							glow1_texture = HUD_rock_tube_glow_full
							glow1_scale = (1.0, 1.0)
							glow2_texture = HUD_rock_tube_glow_full
							glow2_scale = (1.0, 1.0)
							nixie_texture = band_HUD_score_2b
						}
					}
					{
						props = {
							local_id = message
							type = ContainerElement
							dims = (430.0, 50.0)
							just = [
								0.0
								-1.0
							]
							pos = (56.131866, -21.421997)
							z_priority = 2.0
						}
					}
					{
						props = {
							local_id = gamertag
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (275.0, 80.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-5.2286825, 158.039)
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
							desc = 'hud_gamertag'
							autoSizeDims = true
							gamertag_name_text = qs("gamertag")
							gamertag_bg_rgba = [
								255
								255
								255
								255
							]
							headset_icon_alpha = 1.0
						}
					}
				]
			}
			{
				props = {
					local_id = g2
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (816.3855, 371.4073)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = hud_message_fire
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 400.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (0.0, 30.0)
							z_priority = 0.01
							scale = (1.0, 0.75)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							desc = 'hud_message_fire'
							autoSizeDims = true
						}
					}
					{
						props = {
							local_id = player_meter
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (216.66626, 260.99463)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (124.19769, 87.016205)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = -1.0
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
							glow0_texture = HUD_rock_tube_glow_full
							glow0_scale = (1.0, 1.0)
							glow1_texture = HUD_rock_tube_glow_full
							glow1_scale = (1.0, 1.0)
							glow2_texture = HUD_rock_tube_glow_full
							glow2_scale = (1.0, 1.0)
							nixie_texture = band_HUD_score_2b
						}
					}
					{
						props = {
							local_id = message
							type = ContainerElement
							dims = (430.0, 50.0)
							just = [
								0.0
								-1.0
							]
							pos = (49.31488, -16.983795)
							z_priority = 0.02
						}
					}
					{
						props = {
							local_id = gamertag
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (275.0, 80.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (2.4427493, 157.81535)
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
							desc = 'hud_gamertag'
							autoSizeDims = true
							gamertag_name_text = qs("gamertag")
							gamertag_bg_rgba = [
								255
								255
								255
								255
							]
							headset_icon_alpha = 1.0
						}
					}
				]
			}
			{
				props = {
					local_id = band_meter
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (282.23996, 352.09848)
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
					hud_meter_green_bg_alpha = 1.0
					hud_meter_yellow_bg_alpha = 1.0
					hud_meter_red_bg_alpha = 1.0
					band_HUD_instrument_p1_rgba = [
						255
						255
						255
						255
					]
					band_HUD_instrument_p2_rgba = [
						255
						255
						255
						255
					]
					band_HUD_instrument_p3_rgba = [
						255
						255
						255
						255
					]
					band_HUD_instrument_p4_rgba = [
						255
						255
						255
						255
					]
					band_HUD_instrument_glow_p1_texture = band_HUD_bass_glow
					band_HUD_instrument_glow_p2_texture = band_HUD_guitar_glow
					band_HUD_instrument_glow_p3_texture = band_HUD_mic_glow
					band_HUD_instrument_glow_p4_texture = band_HUD_drums_glow
					band_HUD_instrument_glow_p1_alpha = 1.0
					band_HUD_instrument_glow_p2_alpha = 1.0
					band_HUD_instrument_glow_p3_alpha = 1.0
					band_HUD_instrument_glow_p4_alpha = 1.0
					band_HUD_instrument_glow_p1_rgba = [
						255
						255
						255
						255
					]
					band_HUD_instrument_glow_p2_rgba = [
						255
						255
						255
						255
					]
					band_HUD_instrument_glow_p3_rgba = [
						255
						255
						255
						255
					]
					band_HUD_instrument_glow_p4_rgba = [
						255
						255
						255
						255
					]
				}
			}
			{
				props = {
					local_id = HUD_band_battle
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (1280.0, 761.38055)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (0.0, -22.0)
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
					desc = 'HUD_band_battle'
					autoSizeDims = true
					hud_band_battle_meter_needle_rot_angle = 15.0
					hud_band_battle_meter_amber_on_alpha = 0.0
					hud_band_battle_meter_violet_on_alpha = 1.0
					score_1_text = qs("01234567")
					hud_bb_multiplier_nixie_1_texture = HUD_score_nixie_1a
					hud_bb_multiplier_nixie_2_texture = HUD_score_nixie_1a
					fill_1_3_scale = (1.0, 1.0)
					fill_1_3_texture = HUD_rock_tube_glow_full
					fill_1_2_scale = (1.0, 1.0)
					fill_1_2_texture = HUD_rock_tube_glow_full
					fill_1_1_scale = (1.0, 1.0)
					fill_1_1_texture = HUD_rock_tube_glow_full
					fill_2_3_scale = (1.0, 1.0)
					fill_2_3_texture = HUD_rock_tube_glow_full
					fill_2_2_scale = (1.0, 1.0)
					fill_2_2_texture = HUD_rock_tube_glow_full
					fill_2_1_scale = (1.0, 1.0)
					fill_2_1_texture = HUD_rock_tube_glow_full
					fill_1_4_texture = HUD_rock_tube_glow_full
					fill_1_4_scale = (1.0, 1.0)
					fill_1_5_texture = HUD_rock_tube_glow_full
					fill_1_5_scale = (1.0, 1.0)
					fill_1_6_texture = HUD_rock_tube_glow_full
					fill_1_6_scale = (1.0, 1.0)
					fill_2_4_texture = HUD_rock_tube_glow_full
					fill_2_4_scale = (1.0, 1.0)
					fill_2_5_texture = HUD_rock_tube_glow_full
					fill_2_5_scale = (1.0, 1.0)
					fill_2_6_texture = HUD_rock_tube_glow_full
					fill_2_6_scale = (1.0, 1.0)
					score_2_text = qs("01234567")
					p1_streak_number_text = qs("50")
					p2_streak_number_text = qs("50")
				}
			}
			{
				props = {
					local_id = boss_battle
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (1280.0, 762.00385)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (0.0, -22.0)
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
					desc = 'HUD_boss_battle'
					autoSizeDims = true
					hud_band_battle_meter_needle_rot_angle = 15.0
					hud_band_battle_meter_amber_on_alpha = 0.0
					hud_band_battle_meter_violet_on_alpha = 0.0
					score_1_text = qs("01234567")
					score_2_text = qs("01234567")
					hud_bb_multiplier_nixie_1_texture = HUD_score_nixie_1a
					hud_bb_multiplier_nixie_2_texture = HUD_score_nixie_1a
					fill_1_3_scale = (1.0, 1.0)
					fill_1_3_texture = HUD_rock_tube_glow_full
					fill_1_2_scale = (1.0, 1.0)
					fill_1_2_texture = HUD_rock_tube_glow_full
					fill_1_1_scale = (1.0, 1.0)
					fill_1_1_texture = HUD_rock_tube_glow_full
					fill_2_3_scale = (1.0, 1.0)
					fill_2_3_texture = HUD_rock_tube_glow_full
					fill_2_2_scale = (1.0, 1.0)
					fill_2_2_texture = HUD_rock_tube_glow_full
					fill_2_1_scale = (1.0, 1.0)
					fill_2_1_texture = HUD_rock_tube_glow_full
				}
			}
		]
	}
}
uidesc_hud_2g_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
