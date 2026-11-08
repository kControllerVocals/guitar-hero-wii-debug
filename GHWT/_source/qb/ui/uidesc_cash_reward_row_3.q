uidesc_cash_reward_row_3 = {
	DescVersion = 2
	name = uidesc_cash_reward_row_3
	rect = [
		-155.53342
		0.0
		751.9514
		100.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = cash_reward_line
				}
				{
					index = 0
					validateLocalID = cash_reward_check
					includeParentOwned = false
				}
			]
			name = cash_reward_check_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = cash_reward_line
				}
				{
					index = 1
					validateLocalID = cash_reward_item_text
					includeParentOwned = false
				}
			]
			name = cash_reward_item_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_reward_line
				}
				{
					index = 3
					validateLocalID = cash_reward_bubble
					includeParentOwned = false
				}
			]
			name = cash_reward_bubble_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = cash_reward_line
				}
				{
					index = 1
					validateLocalID = cash_reward_item_text
					includeParentOwned = false
				}
			]
			name = cash_reward_item_text_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = cash_reward_line
				}
				{
					index = 0
					validateLocalID = cash_reward_check
					includeParentOwned = false
				}
			]
			name = cash_reward_check_rgba
			target = rgba
			type = array_color
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = cash_reward_line
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
			z_priority = 1.0
		}
		children = [
			{
				props = {
					texture = cash_reward_check
					local_id = cash_reward_check
					type = SpriteElement
					dims = (42.0, 42.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (2.526245, -7.1430225)
					z_priority = 4.0
					rgba = [
						209
						46
						54
						255
					]
				}
			}
			{
				props = {
					local_id = cash_reward_item_text
					type = TextBlockElement
					dims = (460.0, 45.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (272.09512, -11.6080475)
					z_priority = 4.0
					rgba = [
						73
						120
						76
						255
					]
					text = qs("$0000 - Slide wah every note")
					font = fontgrid_text_a3
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
					line_spacing = 0.8
				}
			}
			{
				props = {
					texture = cash_reward_line
					local_id = cash_reward_line
					type = SpriteElement
					dims = (592.0, 32.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (250.418, 18.65161)
					z_priority = 3.0
					rgba = [
						73
						120
						76
						255
					]
				}
			}
			{
				props = {
					texture = cash_reward_bubble01
					local_id = cash_reward_bubble
					type = SpriteElement
					hiddenLocal = true
					dims = (112.0, 41.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-149.53342, -8.660694)
					z_priority = 3.0
					rgba = [
						255
						255
						255
						0
					]
				}
			}
		]
	}
}
uidesc_cash_reward_row_3_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
