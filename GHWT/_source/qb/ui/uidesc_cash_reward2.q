uidesc_cash_reward2 = {
	DescVersion = 4
	name = uidesc_cash_reward2
	rect = [
		-50.0
		-50.0
		1330.0
		770.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = rewards_root
				}
				{
					index = 2
					validateLocalID = menu_clip
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = menu
					includeParentOwned = false
				}
			]
			name = alias_menu
		}
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = rewards_root
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = background
					type = SpriteElement
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					rgba = [
						0
						0
						0
						255
					]
				}
			}
			{
				props = {
					local_id = title
					type = TextBlockElement
					dims = (700.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (640.0, 120.0)
					z_priority = 1.0
					text = qs("CASH REWARDS")
					font = fontgrid_title_a1
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = menu_clip
					type = WindowElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1280.0, 510.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						0.0
						-1.0
					]
					pos = (0.0, 190.0)
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
							local_id = menu
							type = MenuElement
							dims = (100.0, 0.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
							internal_just = [
								0.0
								-1.0
							]
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
					}
				]
			}
		]
	}
}
uidesc_cash_reward2_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
