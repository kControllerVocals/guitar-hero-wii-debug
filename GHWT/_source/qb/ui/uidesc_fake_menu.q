uidesc_fake_menu = {
	DescVersion = 1
	name = uidesc_fake_menu
	rect = [
		-50.0
		-50.0
		860.0
		537.5
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = fake_menu_cont
				}
				{
					index = 0
					validateLocalID = fake_menu_vmenu
					includeParentOwned = false
				}
			]
			name = alias_fake_menu_vmenu
		}
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = fake_menu_cont
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = fake_menu_vmenu
					type = MenuElement
					dims = (100.0, 300.0)
					pos = (690.0, 410.0)
					z_priority = 1.0
					scale = (0.85, 0.85)
					internal_just = [
						0.0
						0.0
					]
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							local_id = fake_menu_faceoff_text
							type = TextBlockElement
							dims = (400.0, 100.0)
							pos = (50.0, 50.0)
							z_priority = 2.0
							text = qs("FACE-OFF")
							font = fontgrid_text_a6
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
							local_id = fake_menu_pro_faceoff_text
							type = TextBlockElement
							dims = (400.0, 100.0)
							pos = (50.0, 150.0)
							z_priority = 2.0
							text = qs("PRO FACE-OFF")
							font = fontgrid_text_a6
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
							local_id = fake_menu_battle_text
							type = TextBlockElement
							dims = (400.0, 100.0)
							pos = (50.0, 250.0)
							z_priority = 2.0
							text = qs("BATTLE")
							font = fontgrid_text_a6
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
				]
			}
		]
	}
}
uidesc_fake_menu_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
