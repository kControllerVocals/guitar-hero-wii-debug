uidesc_hud_2v = {
	DescVersion = 10
	name = uidesc_hud_2v
	rect = [
		0.0
		-326.01385
		1286.1001
		1182.9803
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = hud_container
				}
				{
					index = 0
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
					index = 1
					validateLocalID = v2
					includeParentOwned = false
				}
			]
			name = alias_v2
		}
		{
			path = [
				{
					validateLocalID = hud_container
				}
				{
					index = 2
					validateLocalID = HUD_band_battle
					includeParentOwned = false
				}
			]
			name = alias_faceoff_meter
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
					local_id = v1
					type = ContainerElement
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (130.0, 58.0)
					z_priority = 3.0
				}
				children = [
					{
						props = {
							texture = higway_icon_mic
							local_id = higway_icon_mic
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-5.592072, 72.91481)
							z_priority = 4.0
							rgba = [
								220
								146
								59
								255
							]
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
							pos = (70.80228, 112.5309)
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
									pos = (230.29625, 103.45526)
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
				]
			}
			{
				props = {
					local_id = v2
					type = ContainerElement
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (130.0, 544.88965)
					z_priority = 3.0
				}
				children = [
					{
						props = {
							texture = higway_icon_mic
							local_id = higway_icon_mic
							type = SpriteElement
							dims = (64.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-8.071915, -134.55206)
							z_priority = 4.0
							rgba = [
								206
								161
								225
								255
							]
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
							pos = (73.57984, -117.561615)
							z_priority = 0.02
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
									pos = (-31.16745, 4.17318)
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
						]
					}
				]
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
					pos = (6.100098, 95.58603)
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
uidesc_hud_2v_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
