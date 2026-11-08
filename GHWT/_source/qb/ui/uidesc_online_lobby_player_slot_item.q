uidesc_online_lobby_player_slot_item = {
	DescVersion = 2
	name = uidesc_online_lobby_player_slot_item
	rect = [
		-225.0
		-32.670246
		486.202
		64.425995
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = online_player_slots_item
				}
				{
					index = 5
					validateLocalID = sign_in_button
					includeParentOwned = false
				}
			]
			name = alias_sign_in_button
			visiblename = 'alias_sign_in_button'
			help = 'online_player_slots_item -> sign_in_button'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = online_player_slots_item
				}
				{
					index = 2
					validateLocalID = player_instrument_logo
					includeParentOwned = false
				}
			]
			name = player_instrument_logo_texture
			visiblename = 'player_instrument_logo_texture'
			help = 'online_player_slots_item -> player_instrument_logo => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = online_player_slots_item
				}
				{
					index = 1
					validateLocalID = player_slot_name
					includeParentOwned = false
				}
			]
			name = player_slot_name_text
			visiblename = 'player_slot_name_text'
			help = 'online_player_slots_item -> player_slot_name => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = online_player_slots_item
				}
				{
					index = 0
					validateLocalID = player_slot_bg
					includeParentOwned = false
				}
			]
			name = player_slot_bg_rgba
			visiblename = 'player_slot_bg_rgba'
			help = 'online_player_slots_item -> player_slot_bg => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = online_player_slots_item
				}
				{
					index = 3
					validateLocalID = cash_icon
					includeParentOwned = false
				}
			]
			name = cash_icon_texture
			visiblename = 'cash_icon_texture'
			help = 'online_player_slots_item -> cash_icon => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = online_player_slots_item
				}
				{
					index = 3
					validateLocalID = cash_icon
					includeParentOwned = false
				}
			]
			name = cash_icon_alpha
			visiblename = 'cash_icon_alpha'
			help = 'online_player_slots_item -> cash_icon => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = online_player_slots_item
				}
				{
					index = 6
					validateLocalID = cash_text
					includeParentOwned = false
				}
			]
			name = cash_rank_text
			visiblename = 'cash_rank_text'
			help = 'online_player_slots_item -> cash_text => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = online_player_slots_item
				}
				{
					index = 7
					validateLocalID = headset_icon
					includeParentOwned = false
				}
			]
			name = headset_icon_alpha
			visiblename = 'headset_icon_alpha'
			help = 'online_player_slots_item -> headset_icon => alpha'
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = online_player_slots_item
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (450.0, 40.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
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
					flip_h = false
					flip_v = false
					texture = 0x00000000
					local_id = player_slot_bg
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.5
					dims = (335.0, 40.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (115.0, 1.0)
					z_priority = 1.1
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						255
						255
						0
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
			}
			{
				props = {
					local_id = player_slot_name
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (345.0, 50.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (119.0, 21.0)
					z_priority = 1.2
					scale = (0.8, 0.8)
					rot_angle = 0.0
					rgba = [
						200
						200
						200
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs("TO SIGN IN")
					font = fontgrid_text_a6
					material = 0x00000000
					single_line = false
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						0.0
						0.0
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
					shadow_offs = (0.0, 0.0)
					line_spacing = 1.0
				}
			}
			{
				props = {
					blend = blend
					material = 0x00000000
					texture = 0x00000000
					local_id = player_instrument_logo
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (48.0, 48.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (424.72046, 20.914717)
					z_priority = 1.3
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
					material = 0x00000000
					texture = 0x00000000
					local_id = cash_icon
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
					pos = (-191.82706, -0.67025)
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
					flip_h = false
					flip_v = false
					texture = 0x00000000
					local_id = cash_bg
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (450.0, 40.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (0.0, 1.0)
					z_priority = 1.1
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						89
						90
						92
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
				}
			}
			{
				props = {
					local_id = sign_in_button
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (40.0, 75.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (73.28256, 21.755753)
					z_priority = 2.0
					scale = (0.8, 0.8)
					rot_angle = 0.0
					rgba = [
						200
						200
						200
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs("\L\b7")
					font = fontgrid_text_a6
					material = 0x00000000
					single_line = false
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						-1.0
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
			{
				props = {
					local_id = cash_text
					type = TextBlockElement
					hiddenLocal = false
					alpha = 1.0
					dims = (45.0, 50.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (67.5, 20.0)
					z_priority = 2.0
					scale = (1.0, 1.0)
					rot_angle = 0.0
					rgba = [
						200
						200
						200
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					text = qs("125")
					font = fontgrid_text_a6
					material = 0x00000000
					single_line = false
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						-1.0
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
			{
				props = {
					blend = blend
					texture = speaker
					material = 0x00000000
					local_id = headset_icon
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.0
					dims = (32.0, 32.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						0.0
						-1.0
					]
					pos = (245.202, 5.0)
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
		]
	}
}
uidesc_online_lobby_player_slot_item_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
