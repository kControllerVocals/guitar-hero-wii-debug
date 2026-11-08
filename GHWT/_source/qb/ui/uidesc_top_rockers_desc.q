uidesc_top_rockers_desc = {
	DescVersion = 2
	name = uidesc_top_rockers_desc
	rect = [
		258.35464
		153.80368
		600.00006
		80.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = top_rockers_desc_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = score
					includeParentOwned = false
				}
			]
			name = score_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = top_rockers_desc_container
				}
				{
					index = 0
					validateLocalID = stats
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = name
					includeParentOwned = false
				}
			]
			name = name_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = top_rockers_desc_container
			type = ContainerElement
			dims = (600.0, 60.0)
			pos = (558.3547, 183.80368)
		}
		children = [
			{
				props = {
					local_id = stats
					type = MenuElement
					dims = (600.0, 80.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
					fit_major = `fit content`
					fit_minor = `fit content if larger`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							local_id = score
							type = TextBlockElement
							dims = (250.0, 60.0)
							pos = (96.15384, 40.0)
							z_priority = 2.0
							scale = (0.76923096, 0.76923096)
							rgba = [
								0
								0
								0
								255
							]
							text = qs("000,000")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = spacer
							type = ContainerElement
							dims = (30.0, 80.0)
							pos = (203.84615, 40.0)
							z_priority = 2.0
							scale = (0.76923096, 0.76923096)
						}
					}
					{
						props = {
							local_id = name
							type = TextBlockElement
							dims = (500.0, 60.0)
							pos = (407.69235, 40.0)
							z_priority = 2.0
							scale = (0.76923096, 0.76923096)
							rgba = [
								0
								0
								0
								255
							]
							text = qs("Player Name")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `scale to fit`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								-1.0
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
uidesc_top_rockers_desc_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
