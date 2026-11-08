uidesc_Setlist_B_listing_desc = {
	DescVersion = 4
	name = uidesc_Setlist_B_listing_desc
	rect = [
		-395.90933
		-50.0
		770.9093
		165.13356
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = setlist_b_listing_container
				}
				{
					index = 3
					validateLocalID = custom_setlist_container
					includeParentOwned = false
				}
			]
			name = alias_custom_setlist_container
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = setlist_b_listing_container
				}
				{
					index = 0
					validateLocalID = setlist_b_highlight_container
					includeParentOwned = false
				}
			]
			name = setlist_b_highlight_container_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = setlist_b_listing_container
				}
				{
					index = 2
					validateLocalID = icon_difficulty
					includeParentOwned = false
				}
			]
			name = icon_difficulty_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = setlist_b_listing_container
				}
				{
					index = 1
					validateLocalID = setlist_b_listing_text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = listing
					includeParentOwned = false
				}
			]
			name = listing_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = setlist_b_listing_container
				}
				{
					index = 2
					validateLocalID = icon_difficulty
					includeParentOwned = false
				}
			]
			name = icon_difficulty_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = setlist_b_listing_container
				}
				{
					index = 2
					validateLocalID = icon_difficulty
					includeParentOwned = false
				}
			]
			name = icon_difficulty_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = setlist_b_listing_container
				}
				{
					index = 1
					validateLocalID = setlist_b_listing_text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = listing
					includeParentOwned = false
				}
			]
			name = listing_rgba
			target = rgba
			type = array_color
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = setlist_b_listing_container
			type = ContainerElement
			dims = (750.0, 50.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				0.0
				0.0
			]
			pos = (-375.0, -25.0)
			z_priority = 3.0
		}
		children = [
			{
				props = {
					local_id = setlist_b_highlight_container
					type = ContainerElement
					alpha = 0.2
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 3.0
				}
				children = [
					{
						props = {
							texture = setlist_B_list_hilite_R
							blend = Add
							local_id = setlist_B_list_hilite_R
							type = SpriteElement
							alpha = 0.6
							dims = (350.0, 32.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								0.0
							]
							pos = (50.0, 0.0)
							z_priority = 2.0
						}
					}
					{
						props = {
							texture = setlist_B_list_hilite_R
							flip_v = true
							blend = Add
							local_id = setlist_B_list_hilite_L
							type = SpriteElement
							alpha = 0.6
							dims = (350.0, 32.0)
							just = [
								1.0
								0.0
							]
							pos_anchor = [
								1.0
								0.0
							]
							pos = (-50.0, 0.0)
							z_priority = 2.0
						}
					}
				]
			}
			{
				props = {
					local_id = setlist_b_listing_text
					type = ContainerElement
					dims = (50.0, 50.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 4.0
				}
				children = [
					{
						props = {
							local_id = listing
							type = TextBlockElement
							dims = (630.0, 50.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-20.0, -1.0)
							z_priority = 5.0
							rgba = [
								120
								0
								0
								255
							]
							text = qs("PLACEHOLDER")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.6, 0.6)
							font_spacing = 1
							use_shadow = false
							shadow_rgba = [
								192
								192
								192
								100
							]
							shadow_offs = (2.0, 2.0)
						}
					}
				]
			}
			{
				props = {
					texture = icon_difficulty_medium
					local_id = icon_difficulty
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (322.0, -2.0)
					z_priority = 4.0
					scale = (0.8, 0.8)
					rot_angle = 5.0
				}
			}
			{
				props = {
					local_id = custom_setlist_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-336.60638, 55.83058)
					z_priority = 4.0
					rot_angle = 12.0
				}
			}
		]
	}
}
uidesc_Setlist_B_listing_desc_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
