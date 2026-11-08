uidesc_cash_milestones_row_mp = {
	DescVersion = 2
	name = uidesc_cash_milestones_row_mp
	rect = [
		169.68343
		175.55238
		898.2967
		90.0
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
			name = cash_milestones_icon_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 1
					validateLocalID = number_text
					includeParentOwned = false
				}
			]
			name = number_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 3
					validateLocalID = player_name
					includeParentOwned = false
				}
			]
			name = player_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 4
					validateLocalID = mixer_icon_guitar
					includeParentOwned = false
				}
			]
			name = mixer_icon_guitar_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 5
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
					validateLocalID = cash_milestones_container
				}
				{
					index = 6
					validateLocalID = career_earnings
					includeParentOwned = false
				}
			]
			name = career_earnings_text
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
					pos = (-170.3872, -1.047134)
					z_priority = 4.0
				}
			}
			{
				props = {
					local_id = number_text
					type = TextBlockElement
					dims = (52.0, 46.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-96.498604, -3.500015)
					z_priority = 4.0
					rgba = [
						255
						215
						0
						255
					]
					text = qs("99")
					font = fontgrid_text_a8
					fit_width = `scale each line if larger`
					fit_height = `scale to fit`
					scale_mode = `per axis`
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
					dims = (60.0, 60.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-96.78487, -3.1961508)
					z_priority = 4.0
					rgba = [
						192
						192
						0
						255
					]
				}
			}
			{
				props = {
					local_id = player_name
					type = TextBlockElement
					dims = (320.0, 46.0)
					pos = (314.7269, 35.58413)
					z_priority = 4.0
					rgba = [
						77
						81
						41
						255
					]
					text = qs("Player Name Here")
					font = fontgrid_text_a8
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					use_shadow = true
					shadow_offs = (2.0, 2.0)
				}
			}
			{
				props = {
					texture = mixer_icon_guitar
					local_id = mixer_icon_guitar
					type = SpriteElement
					dims = (90.0, 90.0)
					pos = (512.0725, 37.294437)
					z_priority = 4.0
				}
			}
			{
				props = {
					local_id = gig_cash
					type = TextBlockElement
					dims = (150.0, 46.0)
					pos = (625.87616, 37.58413)
					z_priority = 4.0
					rgba = [
						77
						81
						41
						255
					]
					text = qs("$000000")
					font = fontgrid_text_a8
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					use_shadow = true
					shadow_offs = (2.0, 2.0)
				}
			}
			{
				props = {
					local_id = career_earnings
					type = TextBlockElement
					dims = (192.0, 46.0)
					pos = (802.2967, 37.58413)
					z_priority = 4.0
					rgba = [
						77
						81
						41
						255
					]
					text = qs("$000000000")
					font = fontgrid_text_a8
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					use_shadow = true
					shadow_offs = (2.0, 2.0)
				}
			}
		]
	}
}
uidesc_cash_milestones_row_mp_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
