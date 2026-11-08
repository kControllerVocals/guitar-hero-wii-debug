uidesc_tutorial_battle_attacks = {
	DescVersion = 2
	name = uidesc_tutorial_battle_attacks
	rect = [
		488.3628
		172.0
		300.0
		256.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = tutorial_battle_attack_cont
				}
				{
					index = 2
					validateLocalID = highlight_sparkle_glow
					includeParentOwned = false
				}
			]
			name = alias_highlight_sparkle_glow
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = tutorial_battle_attack_cont
				}
			]
			name = tutorial_battle_attack_cont_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = tutorial_battle_attack_cont
				}
				{
					index = 0
					validateLocalID = tutorial_battle_attack_icon
					includeParentOwned = false
				}
			]
			name = tutorial_battle_attack_icon_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = tutorial_battle_attack_cont
				}
				{
					index = 1
					validateLocalID = tutorial_battle_attack_text
					includeParentOwned = false
				}
			]
			name = tutorial_battle_attack_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = tutorial_battle_attack_cont
				}
				{
					index = 0
					validateLocalID = tutorial_battle_attack_icon
					includeParentOwned = false
				}
			]
			name = tutorial_battle_attack_icon_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = tutorial_battle_attack_cont
				}
				{
					index = 1
					validateLocalID = tutorial_battle_attack_text
					includeParentOwned = false
				}
			]
			name = tutorial_battle_attack_text_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = tutorial_battle_attack_cont
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (640.0, 300.0)
		}
		children = [
			{
				props = {
					texture = icon_attack_addnote
					material = 0x00000000
					local_id = tutorial_battle_attack_icon
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 7.0
				}
			}
			{
				props = {
					local_id = tutorial_battle_attack_text
					type = TextBlockElement
					dims = (300.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-1.637207, 65.0)
					z_priority = 7.0
					rgba = [
						224
						224
						224
						255
					]
					text = qs("DOUBLE NOTES")
					font = fontgrid_title_a1
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.7, 0.7)
					use_shadow = true
					shadow_offs = (3.0, 3.0)
				}
				children = [
					{
						props = {
							texture = white
							local_id = tutorial_battle_attack_text_bg
							type = SpriteElement
							alpha = 0.5
							dims = (300.0, 50.0)
							pos = (150.0, 42.0)
							z_priority = 6.5
							rgba = [
								0
								0
								0
								255
							]
						}
					}
				]
			}
			{
				props = {
					local_id = highlight_sparkle_glow
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (256.0, 256.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 6.5
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
					desc = 'highlight_sparkle_glow'
					autoSizeDims = true
					highlight_glow_rot_angle = 0.0
					highlight_glow_alpha = 0.4
					highlight_sparkle_rot_angle = 0.0
					highlight_sparkle_alpha = 0.6
				}
			}
		]
	}
}
uidesc_tutorial_battle_attacks_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
