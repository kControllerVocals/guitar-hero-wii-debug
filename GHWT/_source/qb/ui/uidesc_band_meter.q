uidesc_band_meter = {
	DescVersion = 11
	name = uidesc_band_meter
	rect = [
		100.0
		-58.55576
		282.23996
		352.09848
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 11
					validateLocalID = streak
					includeParentOwned = false
				}
			]
			name = alias_streak
			visiblename = 'alias_streak'
			help = 'meter_container -> streak'
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = rock_meter_bg_color
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = HUD_meter_red_bg
					includeParentOwned = false
				}
			]
			name = alias_HUD_meter_red_bg
			visiblename = 'alias_HUD_meter_red_bg'
			help = 'meter_container -> rock_meter_bg_color -> HUD_meter_red_bg'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 7
					validateLocalID = score
					includeParentOwned = false
				}
			]
			name = score_text
			visiblename = 'score_text'
			help = 'meter_container -> score => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 1
					validateLocalID = needle
					includeParentOwned = false
				}
			]
			name = needle_rot_angle
			visiblename = 'needle_rot_angle'
			help = 'meter_container -> needle => rot_angle'
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 3
					validateLocalID = green_light
					includeParentOwned = false
				}
			]
			name = green_light_alpha
			visiblename = 'green_light_alpha'
			help = 'meter_container -> green_light => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 4
					validateLocalID = yellow_light
					includeParentOwned = false
				}
			]
			name = yellow_light_alpha
			visiblename = 'yellow_light_alpha'
			help = 'meter_container -> yellow_light => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 5
					validateLocalID = red_light
					includeParentOwned = false
				}
			]
			name = red_light_alpha
			visiblename = 'red_light_alpha'
			help = 'meter_container -> red_light => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 6
					validateLocalID = multiplier
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = multiplier_text
					includeParentOwned = false
				}
			]
			name = multiplier_text
			visiblename = 'multiplier_text'
			help = 'meter_container -> multiplier -> multiplier_text => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = 4_player_lane_fill
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = band_HUD_p1_mask
					includeParentOwned = false
				}
			]
			name = band_HUD_p1_mask_dims
			visiblename = 'band_HUD_p1_mask_dims'
			help = 'meter_container -> rock_meter_lanes -> 4_player_lane_fill -> band_HUD_p1_mask => dims'
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = 4_player_lane_fill
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = band_HUD_p2_mask
					includeParentOwned = false
				}
			]
			name = band_HUD_p2_mask_dims
			visiblename = 'band_HUD_p2_mask_dims'
			help = 'meter_container -> rock_meter_lanes -> 4_player_lane_fill -> band_HUD_p2_mask => dims'
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = 4_player_lane_fill
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_HUD_p3_mask
					includeParentOwned = false
				}
			]
			name = band_HUD_p3_mask_dims
			visiblename = 'band_HUD_p3_mask_dims'
			help = 'meter_container -> rock_meter_lanes -> 4_player_lane_fill -> band_HUD_p3_mask => dims'
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = 4_player_lane_fill
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = band_HUD_p4_mask
					includeParentOwned = false
				}
			]
			name = band_HUD_p4_mask_dims
			visiblename = 'band_HUD_p4_mask_dims'
			help = 'meter_container -> rock_meter_lanes -> 4_player_lane_fill -> band_HUD_p4_mask => dims'
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = 4_player_lane_fill
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = band_HUD_p1_mask
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = band_HUD_p1_fill
					includeParentOwned = false
				}
			]
			name = band_HUD_p1_fill_rgba
			visiblename = 'band_HUD_p1_fill_rgba'
			help = 'meter_container -> rock_meter_lanes -> 4_player_lane_fill -> band_HUD_p1_mask -> band_HUD_p1_fill => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = 4_player_lane_fill
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = band_HUD_p2_mask
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = band_HUD_p2_fill
					includeParentOwned = false
				}
			]
			name = band_HUD_p2_fill_rgba
			visiblename = 'band_HUD_p2_fill_rgba'
			help = 'meter_container -> rock_meter_lanes -> 4_player_lane_fill -> band_HUD_p2_mask -> band_HUD_p2_fill => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = 4_player_lane_fill
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_HUD_p3_mask
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = band_HUD_p3_fill
					includeParentOwned = false
				}
			]
			name = band_HUD_p3_fill_rgba
			visiblename = 'band_HUD_p3_fill_rgba'
			help = 'meter_container -> rock_meter_lanes -> 4_player_lane_fill -> band_HUD_p3_mask -> band_HUD_p3_fill => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = 4_player_lane_fill
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = band_HUD_p4_mask
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = band_HUD_p4_fill
					includeParentOwned = false
				}
			]
			name = band_HUD_p4_fill_rgba
			visiblename = 'band_HUD_p4_fill_rgba'
			help = 'meter_container -> rock_meter_lanes -> 4_player_lane_fill -> band_HUD_p4_mask -> band_HUD_p4_fill => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = band_HUD_instrument_p1
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p1_texture
			visiblename = 'band_HUD_instrument_p1_texture'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p1 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = band_HUD_instrument_p2
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p2_texture
			visiblename = 'band_HUD_instrument_p2_texture'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p2 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_HUD_instrument_p3
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p3_texture
			visiblename = 'band_HUD_instrument_p3_texture'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p3 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = band_HUD_instrument_p4
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p4_texture
			visiblename = 'band_HUD_instrument_p4_texture'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p4 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = band_HUD_instrument_p1
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p1_alpha
			visiblename = 'band_HUD_instrument_p1_alpha'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p1 => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = band_HUD_instrument_p2
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p2_alpha
			visiblename = 'band_HUD_instrument_p2_alpha'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p2 => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_HUD_instrument_p3
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p3_alpha
			visiblename = 'band_HUD_instrument_p3_alpha'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p3 => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = band_HUD_instrument_p4
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p4_alpha
			visiblename = 'band_HUD_instrument_p4_alpha'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p4 => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = HUD_rock_tube_glow_full_b1
					includeParentOwned = false
				}
			]
			name = glow0_texture
			visiblename = 'glow0_texture'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b1 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = HUD_rock_tube_glow_full_b2
					includeParentOwned = false
				}
			]
			name = glow1_texture
			visiblename = 'glow1_texture'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b2 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = HUD_rock_tube_glow_full_b3
					includeParentOwned = false
				}
			]
			name = glow2_texture
			visiblename = 'glow2_texture'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b3 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = HUD_rock_tube_glow_full_b1
					includeParentOwned = false
				}
			]
			name = glow0_scale
			visiblename = 'glow0_scale'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b1 => scale'
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = HUD_rock_tube_glow_full_b2
					includeParentOwned = false
				}
			]
			name = glow1_scale
			visiblename = 'glow1_scale'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b2 => scale'
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = HUD_rock_tube_glow_full_b3
					includeParentOwned = false
				}
			]
			name = glow2_scale
			visiblename = 'glow2_scale'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b3 => scale'
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = HUD_rock_tube_glow_full_b4
					includeParentOwned = false
				}
			]
			name = glow3_texture
			visiblename = 'glow3_texture'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b4 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 9
					validateLocalID = HUD_rock_tube_glow_full_b4
					includeParentOwned = false
				}
			]
			name = glow3_scale
			visiblename = 'glow3_scale'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b4 => scale'
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 10
					validateLocalID = HUD_rock_tube_glow_full_b5
					includeParentOwned = false
				}
			]
			name = glow4_scale
			visiblename = 'glow4_scale'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b5 => scale'
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 11
					validateLocalID = HUD_rock_tube_glow_full_b6
					includeParentOwned = false
				}
			]
			name = glow5_scale
			visiblename = 'glow5_scale'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b6 => scale'
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 10
					validateLocalID = HUD_rock_tube_glow_full_b5
					includeParentOwned = false
				}
			]
			name = glow4_texture
			visiblename = 'glow4_texture'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b5 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 10
					validateLocalID = star_power_lights
					includeParentOwned = false
				}
				{
					index = 11
					validateLocalID = HUD_rock_tube_glow_full_b6
					includeParentOwned = false
				}
			]
			name = glow5_texture
			visiblename = 'glow5_texture'
			help = 'meter_container -> star_power_lights -> HUD_rock_tube_glow_full_b6 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 11
					validateLocalID = streak
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = streak_number
					includeParentOwned = false
				}
			]
			name = streak_number_text
			visiblename = 'streak_number_text'
			help = 'meter_container -> streak -> streak_number => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = rock_meter_bg_color
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = HUD_meter_green_bg
					includeParentOwned = false
				}
			]
			name = hud_meter_green_bg_alpha
			visiblename = 'HUD_meter_green_bg_alpha'
			help = 'meter_container -> rock_meter_bg_color -> HUD_meter_green_bg => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = rock_meter_bg_color
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = HUD_meter_yellow_bg
					includeParentOwned = false
				}
			]
			name = hud_meter_yellow_bg_alpha
			visiblename = 'HUD_meter_yellow_bg_alpha'
			help = 'meter_container -> rock_meter_bg_color -> HUD_meter_yellow_bg => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 12
					validateLocalID = rock_meter_bg_color
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = HUD_meter_red_bg
					includeParentOwned = false
				}
			]
			name = hud_meter_red_bg_alpha
			visiblename = 'HUD_meter_red_bg_alpha'
			help = 'meter_container -> rock_meter_bg_color -> HUD_meter_red_bg => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = band_HUD_instrument_p1
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p1_rgba
			visiblename = 'band_HUD_instrument_p1_rgba'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p1 => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = band_HUD_instrument_p2
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p2_rgba
			visiblename = 'band_HUD_instrument_p2_rgba'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p2 => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = band_HUD_instrument_p3
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p3_rgba
			visiblename = 'band_HUD_instrument_p3_rgba'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p3 => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = band_HUD_instrument_p4
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_p4_rgba
			visiblename = 'band_HUD_instrument_p4_rgba'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_p4 => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = band_HUD_instrument_glow_p1
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p1_texture
			visiblename = 'band_HUD_instrument_glow_p1_texture'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p1 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = band_HUD_instrument_glow_p2
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p2_texture
			visiblename = 'band_HUD_instrument_glow_p2_texture'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p2 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = band_HUD_instrument_glow_p3
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p3_texture
			visiblename = 'band_HUD_instrument_glow_p3_texture'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p3 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = band_HUD_instrument_glow_p4
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p4_texture
			visiblename = 'band_HUD_instrument_glow_p4_texture'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p4 => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = band_HUD_instrument_glow_p1
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p1_alpha
			visiblename = 'band_HUD_instrument_glow_p1_alpha'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p1 => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = band_HUD_instrument_glow_p2
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p2_alpha
			visiblename = 'band_HUD_instrument_glow_p2_alpha'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p2 => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = band_HUD_instrument_glow_p3
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p3_alpha
			visiblename = 'band_HUD_instrument_glow_p3_alpha'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p3 => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = band_HUD_instrument_glow_p4
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p4_alpha
			visiblename = 'band_HUD_instrument_glow_p4_alpha'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p4 => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = band_HUD_instrument_glow_p1
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p1_rgba
			visiblename = 'band_HUD_instrument_glow_p1_rgba'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p1 => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = band_HUD_instrument_glow_p2
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p2_rgba
			visiblename = 'band_HUD_instrument_glow_p2_rgba'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p2 => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = band_HUD_instrument_glow_p3
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p3_rgba
			visiblename = 'band_HUD_instrument_glow_p3_rgba'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p3 => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = meter_container
				}
				{
					index = 8
					validateLocalID = rock_meter_lanes
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = instrument_icons
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = band_HUD_instrument_glow_p4
					includeParentOwned = false
				}
			]
			name = band_HUD_instrument_glow_p4_rgba
			visiblename = 'band_HUD_instrument_glow_p4_rgba'
			help = 'meter_container -> rock_meter_lanes -> instrument_icons -> band_HUD_instrument_glow_p4 => rgba'
			target = rgba
			type = array_color
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = meter_container
			type = ContainerElement
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
			pos = (100.0, 10.0)
			z_priority = 0.0
			scale = (0.9, 0.9)
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
					texture = band_hud_meter_top
					material = 0x00000000
					local_id = Body
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (256.0, 128.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (31.678951, 19.890179)
					z_priority = 17.0
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
					texture = band_HUD_needle
					local_id = needle
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (32.0, 64.0)
					just = [
						0.0
						0.75
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (164.95975, 125.88574)
					z_priority = 16.0
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
					texture = band_HUD_lights_all
					local_id = lights_bg
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (128.0, 128.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (98.443886, -15.2670145)
					z_priority = 14.0
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
					texture = band_HUD_light_green
					local_id = green_light
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (64.0, 64.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (153.81522, 46.707657)
					z_priority = 15.0
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
					texture = band_HUD_light_yellow
					blend = blend
					local_id = yellow_light
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (64.0, 64.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (132.51944, 37.94159)
					z_priority = 15.0
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
					texture = band_HUD_light_red
					local_id = red_light
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (64.0, 64.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (112.31828, 43.63003)
					z_priority = 15.0
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
					texture = band_HUD_multiplier_ring
					material = 0x00000000
					local_id = multiplier
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (64.0, 64.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (217.33981, 106.87888)
					z_priority = 20.0
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
				}
				children = [
					{
						props = {
							local_id = multiplier_text
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (168.0, 47.0)
							just = [
								1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (45.222218, 12.4508705)
							z_priority = 22.0
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
							text = qs("")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = `expand dims`
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								-1.0
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
								0
							]
							shadow_offs = (3.0, 3.0)
							line_spacing = 1.0
						}
					}
				]
			}
			{
				props = {
					local_id = score
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (168.0, 50.0)
					just = [
						1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (262.1071, 192.38705)
					z_priority = 18.0
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
					text = qs("")
					font = fontgrid_numeral_a9
					material = 0x00000000
					single_line = false
					fit_width = `expand dims`
					fit_height = `expand dims`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						-1.0
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
						0
					]
					shadow_offs = (1.0, 1.0)
					line_spacing = 1.0
				}
			}
			{
				props = {
					local_id = rock_meter_lanes
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
					pos = (100.0, 94.22205)
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
							texture = band_HUD_meter_bottom
							local_id = band_HUD_meter_bottom
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (14.800299, 32.453182)
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
							texture = band_HUD_meter_under
							local_id = band_HUD_meter_under
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
							pos = (16.342854, 6.205529)
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
							texture = band_HUD_meter_4_lane
							local_id = band_HUD_meter_4_lane
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
							pos = (13.963375, 10.6499405)
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
							texture = band_HUD_meter_lane_color
							blend = Add
							local_id = band_HUD_meter_lane_color
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.5
							dims = (256.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (10.6499405, 14.492949)
							z_priority = 4.0
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
							texture = band_HUD_meter_R
							local_id = band_HUD_meter_R
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-40.27, 16.333336)
							z_priority = 6.0
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
							texture = band_HUD_meter_O
							local_id = band_HUD_meter_O
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-1.0946779, 13.000001)
							z_priority = 6.0
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
							texture = band_HUD_meter_C
							local_id = band_HUD_meter_C
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (38.21772, 12.490324)
							z_priority = 6.0
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
							texture = band_HUD_meter_K
							local_id = band_HUD_meter_K
							type = SpriteElement
							hiddenLocal = true
							alpha = 1.0
							dims = (64.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (73.39305, 15.666669)
							z_priority = 6.0
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
							local_id = instrument_icons
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
							pos = (49.02748, 84.634254)
							z_priority = 1.0
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
						}
						children = [
							{
								props = {
									blend = blend
									texture = band_HUD_bass
									local_id = band_HUD_instrument_p1
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-129.37624, -66.0)
									z_priority = 9.0
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
									texture = band_HUD_guitar
									local_id = band_HUD_instrument_p2
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-67.67274, -66.0)
									z_priority = 9.0
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
									texture = band_HUD_microphone
									local_id = band_HUD_instrument_p3
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-6.3045025, -66.0)
									z_priority = 9.0
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
									texture = band_HUD_drums
									local_id = band_HUD_instrument_p4
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (52.71632, -66.00003)
									z_priority = 9.0
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
									texture = band_HUD_bass_glow
									local_id = band_HUD_instrument_glow_p1
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-129.7939, -65.56273)
									z_priority = 8.0
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
									texture = band_HUD_guitar_glow
									local_id = band_HUD_instrument_glow_p2
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-67.160866, -67.05626)
									z_priority = 8.0
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
									texture = band_HUD_mic_glow
									local_id = band_HUD_instrument_glow_p3
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-6.3045025, -66.0)
									z_priority = 8.0
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
									texture = band_HUD_drums_glow
									local_id = band_HUD_instrument_glow_p4
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (64.0, 64.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (52.121433, -67.05626)
									z_priority = 8.0
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
					{
						props = {
							local_id = 4_player_lane_fill
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
							pos = (100.0, 100.0)
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
									local_id = band_HUD_p1_mask
									type = WindowElement
									hiddenLocal = false
									alpha = 1.0
									dims = (128.0, 0.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-127.6725, -57.187576)
									z_priority = 5.0
									scale = (0.9, 0.9)
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
											texture = band_HUD_p1_fill
											local_id = band_HUD_p1_fill
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
												1.0
											]
											pos = (1E-06, -31.999968)
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
							{
								props = {
									local_id = band_HUD_p2_mask
									type = WindowElement
									hiddenLocal = false
									alpha = 1.0
									dims = (128.0, 0.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-73.93835, -57.187557)
									z_priority = 5.0
									scale = (0.9, 0.9)
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
											texture = band_HUD_p2_fill
											local_id = band_HUD_p2_fill
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
												1.0
											]
											pos = (2.5E-05, -31.999968)
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
							{
								props = {
									local_id = band_HUD_p3_mask
									type = WindowElement
									hiddenLocal = false
									alpha = 1.0
									dims = (128.0, 0.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-22.09732, -57.187557)
									z_priority = 5.0
									scale = (0.9, 0.9)
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
											texture = band_HUD_p3_fill
											local_id = band_HUD_p3_fill
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
												1.0
											]
											pos = (1E-06, -31.999968)
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
							{
								props = {
									local_id = band_HUD_p4_mask
									type = WindowElement
									hiddenLocal = false
									alpha = 1.0
									dims = (128.0, 0.0)
									just = [
										0.0
										1.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (5.999943, -57.187557)
									z_priority = 5.0
									scale = (0.9, 0.9)
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
											texture = band_HUD_p4_fill
											local_id = band_HUD_p4_fill
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
												1.0
											]
											pos = (-2.2999999E-05, -31.999968)
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
				]
			}
			{
				props = {
					blend = blend
					texture = band_HUD_meter_outer_glow
					local_id = band_HUD_meter_outer_glow
					type = SpriteElement
					hiddenLocal = true
					alpha = 1.0
					dims = (256.0, 128.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (116.30673, 31.589554)
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
					local_id = star_power_lights
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
					pos = (100.666664, 100.0)
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
							texture = HUD_rock_tube
							local_id = HUD_rock_tube1
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-49.39509, -95.956436)
							z_priority = 0.0
							scale = (0.4, 0.4)
							rot_angle = -45.0
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
							texture = HUD_rock_tube
							local_id = HUD_rock_tube2
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-26.968287, -110.47202)
							z_priority = 0.0
							scale = (0.4, 0.4)
							rot_angle = -28.0
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
							texture = HUD_rock_tube
							local_id = HUD_rock_tube3
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.18130602, -118.3651)
							z_priority = 0.0
							scale = (0.4, 0.4)
							rot_angle = -10.0
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
							texture = HUD_rock_tube
							local_id = HUD_rock_tube4
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (31.115469, -118.10935)
							z_priority = 0.0
							scale = (0.4, 0.4)
							rot_angle = 10.0
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
							texture = HUD_rock_tube
							flip_v = true
							local_id = HUD_rock_tube5
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (56.792667, -109.29385)
							z_priority = 0.0
							scale = (0.4, 0.4)
							rot_angle = 28.0
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
							texture = HUD_rock_tube
							flip_v = true
							local_id = HUD_rock_tube6
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (64.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (78.903366, -94.728134)
							z_priority = 2.0
							scale = (0.4, 0.4)
							rot_angle = 45.0
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
							texture = HUD_rock_tube_glow_full_b
							blend = Add
							local_id = HUD_rock_tube_glow_full_b1
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.7
							dims = (19.200006, 38.400005)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-35.77972, -83.89977)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = -45.0
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
							texture = HUD_rock_tube_glow_full_b
							blend = Add
							local_id = HUD_rock_tube_glow_full_b2
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.7
							dims = (19.200006, 38.400005)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-17.995707, -96.046844)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = -30.0
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
							texture = HUD_rock_tube_glow_full_b
							blend = Add
							local_id = HUD_rock_tube_glow_full_b3
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.7
							dims = (19.200006, 38.400005)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (2.8156433, -101.21645)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = -10.0
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
							texture = HUD_rock_tube_glow_full_b
							blend = Add
							local_id = HUD_rock_tube_glow_full_b4
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.7
							dims = (19.200006, 38.400005)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (27.508495, -100.34432)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 10.0
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
							texture = HUD_rock_tube_glow_full_b
							blend = Add
							local_id = HUD_rock_tube_glow_full_b5
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.7
							dims = (19.200006, 38.400005)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (48.797157, -93.635864)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 28.0
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
							texture = HUD_rock_tube_glow_full_b
							blend = Add
							local_id = HUD_rock_tube_glow_full_b6
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.7
							dims = (19.200006, 38.400005)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (65.86958, -82.56625)
							z_priority = 5.0
							scale = (1.0, 1.0)
							rot_angle = 45.0
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
					blend = blend
					texture = streak
					local_id = streak
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
					pos = (119.26672, 206.7584)
					z_priority = 0.0
					scale = (0.9, 0.9)
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
							local_id = streak_number
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-17.217848, 24.765676)
							z_priority = 1.0
							scale = (0.8, 0.8)
							rot_angle = 0.0
							rgba = [
								255
								128
								0
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("50")
							font = fontgrid_numeral_a9
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								-1.0
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
							line_spacing = 1.0
						}
					}
				]
			}
			{
				props = {
					local_id = rock_meter_bg_color
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
					pos = (16.529922, -76.173065)
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
							texture = HUD_meter_green_bg
							local_id = HUD_meter_green_bg
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (100.0, 100.0)
							z_priority = 8.0
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
							texture = HUD_meter_red_bg
							local_id = HUD_meter_red_bg
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (100.0, 100.0)
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
							texture = HUD_meter_yellow_bg
							local_id = HUD_meter_yellow_bg
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (100.0, 100.0)
							z_priority = 4.0
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
			{
				props = {
					blend = blend
					texture = band_HUD_X
					local_id = band_HUD_X
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (32.0, 32.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (180.28897, 80.76112)
					z_priority = 21.0
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
}
uidesc_band_meter_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			7
			28
			38
		]
	}
	EditMaterialForm = {
	}
}
