uidesc_rewards = {
	DescVersion = 12
	name = uidesc_rewards
	rect = [
		0.272888
		-0.54571503
		1280.0
		720.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = rewards_container
				}
				{
					index = 3
					validateLocalID = list_menu
					includeParentOwned = false
				}
			]
			name = alias_list_menu
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = rewards_container
				}
				{
					index = 1
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = rewards_container
				}
				{
					index = 2
					validateLocalID = help_text
					includeParentOwned = false
				}
			]
			name = help_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = rewards_container
				}
				{
					index = 4
					validateLocalID = image
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = rewards_image_placeholder
					includeParentOwned = false
				}
			]
			name = rewards_image_placeholder_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = rewards_container
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (98.54566, 100.0)
		}
		children = [
			{
				props = {
					texture = rewards_bkgd
					local_id = rewards_bkgd
					type = SpriteElement
					dims = (1280.0, 720.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (541.72723, 259.45428)
					z_priority = 2.0
				}
			}
			{
				props = {
					local_id = title
					type = TextBlockElement
					dims = (300.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (481.87424, 33.701374)
					z_priority = 3.0
					rot_angle = 3.0
					rgba = [
						128
						0
						0
						255
					]
					text = qs("UNLOCKED!!!")
					font = fontgrid_text_a3
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
				}
			}
			{
				props = {
					local_id = help_text
					type = TextBlockElement
					dims = (300.0, 120.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (377.00888, 374.6129)
					z_priority = 3.0
					rot_angle = 2.0
					rgba = [
						0
						0
						0
						255
					]
					text = qs("Go buy now!")
					font = fontgrid_text_a3
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					line_spacing = 0.9
				}
			}
			{
				props = {
					local_id = list_menu
					type = MenuElement
					dims = (250.0, 325.0)
					just = [
						-1.0
						-1.0
					]
					pos = (292.53702, 153.46321)
					z_priority = 3.0
					rot_angle = 3.0
					internal_just = [
						-1.0
						-1.0
					]
					spacing_between = -26
					position_children = true
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
			}
			{
				props = {
					local_id = image
					type = WindowElement
					hiddenLocal = false
					alpha = 1.0
					dims = (400.0, 400.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (584.009, 96.5795)
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
							texture = rewards_image_placeholder
							local_id = rewards_image_placeholder
							type = SpriteElement
							dims = (295.0, 295.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (11.72998, -26.836182)
							z_priority = 1.0
							rot_angle = -3.4
						}
					}
				]
			}
			{
				props = {
					texture = leader_indicator
					local_id = leader_indicator
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (295.9203, 7.913338)
					z_priority = 8.0
					rot_angle = 12.0
				}
			}
		]
	}
}
uidesc_rewards_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
