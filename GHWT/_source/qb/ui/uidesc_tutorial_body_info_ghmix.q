uidesc_tutorial_body_info_ghmix = {
	DescVersion = 1
	name = uidesc_tutorial_body_info_ghmix
	rect = [
		0.0
		-20.0
		594.0
		70.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = tutorial_body_info
				}
				{
					index = 0
					validateLocalID = tutorial_body_info_num_cont
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = tutorial_body_info_num
					includeParentOwned = false
				}
			]
			name = tutorial_body_info_num_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = tutorial_body_info
				}
				{
					index = 1
					validateLocalID = tutorial_body_info_text_cont
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = tutorial_body_info_text
					includeParentOwned = false
				}
			]
			name = tutorial_body_info_text_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = tutorial_body_info
			type = MenuElement
			dims = (594.0, 50.0)
			just = [
				-1.0
				0.0
			]
			pos = (0.0, 25.0)
			z_priority = 6.0
			isVertical = false
			internal_just = [
				1.0
				-1.0
			]
			spacing_between = 10
			position_children = true
			fit_major = `keep dims`
			fit_minor = `expand if content larger`
			scale_mode = proportional
		}
		children = [
			{
				props = {
					local_id = tutorial_body_info_num_cont
					type = ContainerElement
					dims = (40.0, 50.0)
					just = [
						0.0
						-1.0
					]
					pos = (300.0, 0.0)
					z_priority = 7.0
				}
				children = [
					{
						props = {
							local_id = tutorial_body_info_num
							type = TextBlockElement
							dims = (50.0, 62.0)
							just = [
								1.0
								-1.0
							]
							pos_anchor = [
								1.0
								-1.0
							]
							pos = (-200.0, -20.0)
							z_priority = 8.0
							rgba = [
								224
								224
								224
								255
							]
							text = qs("1")
							font = fontgrid_title_a1
							fit_width = wrap
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
								-1.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
			{
				props = {
					local_id = tutorial_body_info_text_cont
					type = ContainerElement
					dims = (264.0, 50.0)
					just = [
						0.0
						-1.0
					]
					pos = (462.0, 0.0)
					z_priority = 7.0
				}
				children = [
					{
						props = {
							local_id = tutorial_body_info_text
							type = TextBlockElement
							dims = (380.0, 42.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-200.0, -12.0)
							z_priority = 8.0
							rgba = [
								224
								224
								224
								255
							]
							text = qs("blah")
							font = fontgrid_text_a8
							fit_width = wrap
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_scale = (0.6, 0.6)
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
		]
	}
}
uidesc_tutorial_body_info_ghmix_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
