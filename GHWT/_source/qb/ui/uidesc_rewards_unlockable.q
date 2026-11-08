uidesc_rewards_unlockable = {
	DescVersion = 3
	name = uidesc_rewards_unlockable
	rect = [
		-72.398186
		-3.349501
		322.39816
		67.26178
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = item_container
				}
				{
					index = 0
					validateLocalID = rewards_checkbox
					includeParentOwned = false
				}
			]
			name = rewards_checkbox_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = item_container
				}
				{
					index = 1
					validateLocalID = unlockable
					includeParentOwned = false
				}
			]
			name = unlockable_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = item_container
				}
				{
					index = 1
					validateLocalID = unlockable
					includeParentOwned = false
				}
			]
			name = unlockable_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = item_container
				}
				{
					index = 1
					validateLocalID = unlockable
					includeParentOwned = false
				}
			]
			name = unlockable_control_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = item_container
				}
				{
					index = 1
					validateLocalID = unlockable
					includeParentOwned = false
				}
			]
			name = unlockable_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = item_container
			type = ContainerElement
			dims = (250.0, 50.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					texture = rewards_checkbox
					local_id = rewards_checkbox
					type = SpriteElement
					dims = (64.0, 64.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-72.398186, 0.0)
					z_priority = 3.0
					rot_angle = -3.0
					rgba = [
						192
						0
						0
						255
					]
				}
			}
			{
				props = {
					local_id = unlockable
					type = TextBlockElement
					dims = (250.0, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 3.0
					rgba = [
						0
						0
						0
						255
					]
					text = qs("unlocked item")
					font = fontgrid_text_a3
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					shadow_offs = (3.0, 3.0)
				}
			}
		]
	}
}
uidesc_rewards_unlockable_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
