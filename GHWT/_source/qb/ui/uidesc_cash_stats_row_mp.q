uidesc_cash_stats_row_mp = {
	DescVersion = 1
	name = uidesc_cash_stats_row_mp
	rect = [
		-45.0
		-45.0
		810.8051
		90.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 0
					validateLocalID = name
					includeParentOwned = false
				}
			]
			name = name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 0
					validateLocalID = name
					includeParentOwned = false
				}
			]
			name = name_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 1
					validateLocalID = cash_icon
					includeParentOwned = false
				}
			]
			name = cash_icon_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 2
					validateLocalID = inst_icon
					includeParentOwned = false
				}
			]
			name = inst_icon_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 3
					validateLocalID = gig_cash
					includeParentOwned = false
				}
			]
			name = gig_cash_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 3
					validateLocalID = gig_cash
					includeParentOwned = false
				}
			]
			name = gig_cash_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 4
					validateLocalID = sponsor_bonus
					includeParentOwned = false
				}
			]
			name = sponsor_bonus_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 4
					validateLocalID = sponsor_bonus
					includeParentOwned = false
				}
			]
			name = sponsor_bonus_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 5
					validateLocalID = total
					includeParentOwned = false
				}
			]
			name = total_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 5
					validateLocalID = total
					includeParentOwned = false
				}
			]
			name = total_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 1
					validateLocalID = cash_icon
					includeParentOwned = false
				}
			]
			name = cash_icon_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = cash_row_container_mp
				}
				{
					index = 2
					validateLocalID = inst_icon
					includeParentOwned = false
				}
			]
			name = inst_icon_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = cash_row_container_mp
			type = ContainerElement
			dims = (90.0, 90.0)
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = name
					type = TextBlockElement
					dims = (225.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (69.2491, 0.0)
					z_priority = 1.0
					rgba = [
						64
						64
						0
						255
					]
					text = qs("Player n")
					font = fontgrid_title_a1
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = cash_icon
					type = SpriteElement
					dims = (60.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (216.6242, 0.0)
					z_priority = 2.0
				}
			}
			{
				props = {
					local_id = inst_icon
					type = SpriteElement
					dims = (60.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (284.27118, 0.0)
					z_priority = 3.0
				}
			}
			{
				props = {
					local_id = gig_cash
					type = TextBlockElement
					dims = (125.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (387.04056, 0.0)
					z_priority = 4.0
					rgba = [
						64
						64
						0
						255
					]
					text = qs("$8888")
					font = fontgrid_title_a1
					fit_width = wrap
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
					local_id = sponsor_bonus
					type = TextBlockElement
					dims = (125.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (531.34796, 0.0)
					z_priority = 5.0
					rgba = [
						64
						64
						0
						255
					]
					text = qs("$1040")
					font = fontgrid_title_a1
					fit_width = wrap
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
					local_id = total
					type = TextBlockElement
					dims = (150.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (690.8051, 0.0)
					z_priority = 6.0
					rgba = [
						64
						64
						0
						255
					]
					text = qs("$9928")
					font = fontgrid_title_a1
					fit_width = wrap
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
}
uidesc_cash_stats_row_mp_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
