uidesc_Setlist_B_divider_desc = {
	DescVersion = 1
	name = uidesc_Setlist_B_divider_desc
	rect = [
		-289.92908
		-19.840622
		579.85815
		39.68124
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = setlist_divider
				}
			]
			name = alias_setlist_divider
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = setlist_divider
				}
				{
					index = 1
					validateLocalID = setlist_divider_title
					includeParentOwned = false
				}
			]
			name = setlist_divider_title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = setlist_divider
				}
				{
					index = 0
					validateLocalID = setlist_list_divider_L
					includeParentOwned = false
				}
			]
			name = setlist_list_divider_L_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = setlist_divider
				}
				{
					index = 2
					validateLocalID = setlist_list_divider_R
					includeParentOwned = false
				}
			]
			name = setlist_list_divider_R_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = setlist_divider
				}
			]
			name = setlist_divider_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = setlist_divider
				}
				{
					index = 1
					validateLocalID = setlist_divider_title
					includeParentOwned = false
				}
			]
			name = setlist_divider_title_dims
			target = dims
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = setlist_divider
			type = MenuElement
			dims = (906.0, 50.0)
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
			z_priority = 4.0
			scale = (0.6400201, 0.6400201)
			isVertical = false
			internal_just = [
				0.0
				0.0
			]
			spacing_between = 10
			position_children = true
			fit_major = `expand if content larger`
			fit_minor = `keep dims`
			scale_mode = proportional
		}
		children = [
			{
				props = {
					texture = setlist_B_list_divider_R
					flip_v = true
					local_id = setlist_list_divider_L
					type = SpriteElement
					dims = (250.0, 16.0)
					pos = (125.0, 25.0)
					z_priority = 2.0
					rgba = [
						128
						0
						0
						255
					]
				}
			}
			{
				props = {
					local_id = setlist_divider_title
					type = TextBlockElement
					dims = (386.0, 62.0)
					pos = (453.0, 25.0)
					z_priority = 5.0
					rgba = [
						128
						0
						0
						255
					]
					text = qs("DIVIDER CAPS")
					font = fontgrid_title_a1
					single_line = true
					fit_width = `expand dims`
					fit_height = `expand dims`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					use_shadow = true
					shadow_rgba = [
						160
						160
						160
						255
					]
				}
			}
			{
				props = {
					texture = setlist_B_list_divider_R
					local_id = setlist_list_divider_R
					type = SpriteElement
					dims = (250.0, 16.0)
					pos = (781.0, 25.0)
					z_priority = 2.0
					rgba = [
						128
						0
						0
						255
					]
				}
			}
		]
	}
}
uidesc_Setlist_B_divider_desc_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
