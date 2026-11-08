uidesc_cash_reward_row = {
	DescVersion = 2
	name = uidesc_cash_reward_row
	rect = [
		-271.9075
		-50.0
		612.0
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
					dims = (40.0, 40.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-221.47375, -6.1430225)
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
					dims = (375.0, 45.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (104.362305, -7.62038)
					z_priority = 4.0
					rgba = [
						123
						172
						133
						255
					]
					text = qs("band % notes hit")
					font = fontgrid_text_a3
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
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
					dims = (612.0, 32.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (34.09247, 16.666306)
					z_priority = 2.0
				}
			}
			{
				props = {
					texture = cash_reward_bubble01
					local_id = cash_reward_bubble
					type = SpriteElement
					dims = (112.0, 41.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-149.53342, -8.660694)
					z_priority = 3.0
				}
			}
		]
	}
}
uidesc_cash_reward_row_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
