uidesc_cash_milestones_row = {
	DescVersion = 4
	name = uidesc_cash_milestones_row
	rect = [
		169.18379
		174.71045
		425.49963
		98.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 0
					validateLocalID = cash_milestones_icon
					includeParentOwned = false
				}
			]
			name = cash_milestones_icon_pho_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 2
					validateLocalID = cash_milestone_check
					includeParentOwned = false
				}
			]
			name = cash_milestone_check_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 5
					validateLocalID = list_highlight
					includeParentOwned = false
				}
			]
			name = list_highlight_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 3
					validateLocalID = cash_milestone_item_name
					includeParentOwned = false
				}
			]
			name = cash_milestone_item_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 6
					validateLocalID = number_text
					includeParentOwned = false
				}
			]
			name = number_text_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = cash_milestones_container
			type = ContainerElement
			dims = (425.0, 80.0)
			just = [
				-1.0
				-1.0
			]
			pos = (169.68343, 183.25793)
		}
		children = [
			{
				props = {
					texture = cash_milestones_icon_pho
					local_id = cash_milestones_icon
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-174.51544, -3.047134)
					z_priority = 4.0
				}
			}
			{
				props = {
					texture = cash_milestone_checkbox
					local_id = cash_milestone_checkbox
					type = SpriteElement
					dims = (52.0, 52.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-27.81997, -1.541306)
					z_priority = 4.0
				}
			}
			{
				props = {
					texture = cash_milestone_check
					local_id = cash_milestone_check
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-18.443914, -3.3730009)
					z_priority = 6.0
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
					local_id = cash_milestone_item_name
					type = TextBlockElement
					dims = (200.0, 66.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (106.00665, 0.49114197)
					z_priority = 3.0
					rgba = [
						77
						81
						41
						255
					]
					text = qs("$00000")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale to fit`
					scale_mode = proportional
					text_case = Original
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = cash_milestones_line
					type = SpriteElement
					dims = (420.0, 3.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-2.9996493, 35.653202)
					z_priority = 3.0
					rgba = [
						77
						81
						41
						170
					]
				}
			}
			{
				props = {
					texture = setlist_popup_highlight
					local_id = list_highlight
					type = SpriteElement
					dims = (420.0, 98.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-0.5475161, 0.45251504)
					z_priority = 1.0
					rgba = [
						255
						255
						0
						125
					]
				}
			}
			{
				props = {
					local_id = number_text
					type = TextBlockElement
					dims = (50.0, 46.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-103.788315, -1.500015)
					z_priority = 4.0
					rgba = [
						255
						215
						0
						255
					]
					text = qs("99")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale to fit`
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
					texture = cash_milestones_number_bkgd
					local_id = cash_milestones_number_bkgd
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-102.65405, -0.9064329)
					z_priority = 3.0
					rgba = [
						192
						192
						0
						255
					]
				}
			}
		]
	}
}
uidesc_cash_milestones_row_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
