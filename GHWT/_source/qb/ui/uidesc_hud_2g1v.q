uidesc_hud_2g1v = {
	DescVersion = 6
	name = uidesc_hud_2g1v
	rect = [
		-75.94203
		-297.4635
		1355.942
		1036.8442
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = hud_container
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
					validateLocalID = hud_container
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
					validateLocalID = hud_container
				}
				{
					index = 2
					validateLocalID = v1
					includeParentOwned = false
				}
			]
			name = alias_v1
		}
		{
			path = [
				{
					validateLocalID = hud_container
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
					validateLocalID = hud_container
				}
				{
					index = 4
					validateLocalID = HUD_band_battle
					includeParentOwned = false
				}
			]
			name = alias_faceoff_meter
		}
		{
			path = [
				{
					validateLocalID = hud_container
				}
				{
					index = 0
					validateLocalID = g1
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = hud_message_fire
					includeParentOwned = false
				}
			]
			name = alias_hud_message_fire_p1
		}
		{
			path = [
				{
					validateLocalID = hud_container
				}
				{
					index = 1
					validateLocalID = g2
					includeParentOwned = false
				}
				{
					index = 3
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
			local_id = hud_container
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = g1
					type = ContainerElement
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (366.0, 416.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = player_meter
							type = DescInterface
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
							pos = (121.0, 69.0)
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
							autoSizeDims = false
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
							dims = (400.0, 50.0)
							just = [
								0.0
								-1.0
							]
							pos = (50.0, -120.0)
							z_priority = 0.02
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
							pos = (-376.6028, -133.46309)
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
							pos = (0.0, 0.0)
							z_priority = 0.01
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
							desc = 'hud_message_fire'
							autoSizeDims = true
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
							pos = (-0.257351, 99.41221)
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
							gamertag_name_text = qs("This_is_15_char")
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
					just = [
						-1.0
						-1.0
					]
					pos = (824.0, 416.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = player_meter
							type = DescInterface
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
							pos = (124.0, 69.0)
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
							autoSizeDims = false
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
							dims = (400.0, 50.0)
							just = [
								0.0
								-1.0
							]
							pos = (50.0, -120.0)
							z_priority = 0.02
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
							pos = (-387.36688, -127.69855)
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
							pos = (0.0, 0.0)
							z_priority = 0.01
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
							desc = 'hud_message_fire'
							autoSizeDims = true
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
							pos = (-5.356995, 99.849144)
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
							gamertag_name_text = qs("This_is_15_char")
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
					local_id = v1
					type = ContainerElement
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (130.0, 72.0)
					z_priority = 3.0
				}
				children = [
					{
						props = {
							local_id = player_meter
							type = DescInterface
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
							pos = (504.16464, -63.95441)
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
							autoSizeDims = false
							nixie_texture = vocal_HUD_score_2a
						}
					}
					{
						props = {
							local_id = fire_message_mask
							type = WindowElement
							hiddenLocal = false
							alpha = 1.0
							dims = (200.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (248.19708, 117.37771)
							z_priority = 0.01
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
									local_id = hud_message_fire
									type = DescInterface
									hiddenLocal = false
									alpha = 1.0
									dims = (300.0, 400.0)
									just = [
										-1.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (230.3032, 113.15878)
									z_priority = -50.0
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
									desc = 'hud_message_fire'
									autoSizeDims = true
								}
							}
						]
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
							pos = (870.2337, 92.57937)
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
							gamertag_name_text = qs("This_is_15_char")
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
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (-75.94203, 10.34602)
					z_priority = 11.0
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
					autoSizeDims = false
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
		]
	}
}
uidesc_hud_2g1v_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			15
		]
	}
	EditMaterialForm = {
	}
}
