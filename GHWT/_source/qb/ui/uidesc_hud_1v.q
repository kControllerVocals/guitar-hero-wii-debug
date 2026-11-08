uidesc_hud_1v = {
	DescVersion = 11
	name = uidesc_hud_1v
	rect = [
		-75.94203
		0.0
		1210.8718
		758.8461
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = hud_container
				}
				{
					index = 0
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
					index = 1
					validateLocalID = v1
					includeParentOwned = false
				}
			]
			name = alias_v1
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
					pos = (-75.94203, 211.01517)
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
					desc = 'solo_play_rock_meter'
					autoSizeDims = false
					score_text = qs("")
					needle_rot_angle = 0.0
					needle_pos = (163.6264, 121.44128)
					green_light_alpha = 1.0
					yellow_light_alpha = 1.0
					red_light_alpha = 1.0
					streak_number_text = qs("50")
					glow0_texture = HUD_rock_tube_glow_full_b
					glow1_texture = HUD_rock_tube_glow_full_b
					glow2_texture = HUD_rock_tube_glow_full_b
					glow3_texture = HUD_rock_tube_glow_full_b
					glow4_texture = HUD_rock_tube_glow_full_b
					glow5_texture = HUD_rock_tube_glow_full_b
					glow0_scale = (0.5, 0.5)
					glow1_scale = (0.5, 0.5)
					glow2_scale = (0.5, 0.5)
					glow3_scale = (0.5, 0.5)
					glow4_scale = (0.5, 0.5)
					glow5_scale = (0.5, 0.5)
					hud_meter_green_bg_alpha = 1.0
					hud_meter_yellow_bg_alpha = 1.0
					hud_meter_red_bg_alpha = 1.0
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
					pos = (95.0, 72.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = player_meter
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (551.5925, 152.37581)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (488.33737, 360.23285)
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
							nixie_texture = band_HUD_score_2b
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
							pos = (328.67447, 282.673)
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
		]
	}
}
uidesc_hud_1v_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
