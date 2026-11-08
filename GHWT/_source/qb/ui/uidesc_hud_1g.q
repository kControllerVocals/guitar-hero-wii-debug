uidesc_hud_1g = {
	DescVersion = 9
	name = uidesc_hud_1g
	rect = [
		0.0
		0.0
		971.03
		682.8975
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
					index = 0
					validateLocalID = g1
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = hud_message_fire
					includeParentOwned = false
				}
			]
			name = alias_hud_message_fire_p1
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
					pos = (592.0, 350.0)
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
							pos = (157.66322, 127.9215)
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
							desc = 'player_mult_1g'
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
							dims = (600.0, 50.0)
							just = [
								0.0
								-1.0
							]
							pos = (50.0, -140.0)
							z_priority = 0.02
						}
					}
					{
						props = {
							local_id = star_power
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
							pos = (-422.03778, -69.01039)
							z_priority = 2.0
							scale = (0.8, 0.8)
							rot_angle = 0.0
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
							local_id = star_power
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
							pos = (-327.22983, -59.46934)
							z_priority = 2.0
							scale = (0.6, 0.6)
							rot_angle = 0.0
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
					pos = (11.63412, 401.9212)
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
		]
	}
}
uidesc_hud_1g_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
