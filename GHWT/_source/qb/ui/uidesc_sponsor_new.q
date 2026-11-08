uidesc_sponsor_new = {
	DescVersion = 8
	name = uidesc_sponsor_new
	rect = [
		-73.542114
		-39.33641
		1400.0
		760.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = sponsor_container
				}
				{
					index = 6
					validateLocalID = Cash
					includeParentOwned = false
				}
			]
			name = cash_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = sponsor_container
				}
				{
					index = 3
					validateLocalID = logo_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = logo
					includeParentOwned = false
				}
			]
			name = logo_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = sponsor_container
				}
				{
					index = 4
					validateLocalID = description
					includeParentOwned = false
				}
			]
			name = description_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = sponsor_container
				}
				{
					index = 7
					validateLocalID = photo
					includeParentOwned = false
				}
			]
			name = photo_texture
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = sponsor_container
			type = ContainerElement
			dims = (0.0, 0.0)
			pos = (0.0, 0.0)
			z_priority = 1.0
		}
		children = [
			{
				props = {
					texture = sponsor_bkgd
					local_id = sponsor_bkgd
					type = SpriteElement
					dims = (1400.0, 760.0)
					just = [
						-1.0
						-1.0
					]
					pos = (-73.542114, -39.33641)
					z_priority = 2.0
				}
			}
			{
				props = {
					local_id = title
					type = TextBlockElement
					dims = (310.0, 49.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (563.63995, 109.686226)
					z_priority = 4.0
					rot_angle = 1.0
					rgba = [
						64
						64
						64
						255
					]
					text = qs("You Got Sponsored!")
					font = fontgrid_text_a8
					fit_width = `scale each line to fit`
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
					local_id = sponsor_list
					type = MenuElement
					dims = (460.0, 500.0)
					just = [
						-1.0
						-1.0
					]
					pos = (326.1263, 153.92236)
					z_priority = 2.0
					rot_angle = 1.2
					internal_just = [
						0.0
						-1.0
					]
					fit_major = `fit content if larger`
					fit_minor = `fit content if larger`
					scale_mode = proportional
				}
			}
			{
				props = {
					local_id = logo_container
					type = ContainerElement
					dims = (460.0, 130.0)
					pos = (556.45416, 213.28821)
					z_priority = 3.0
					rot_angle = 1.2
				}
				children = [
					{
						props = {
							flip_h = false
							flip_v = false
							material = 0x00000000
							texture = sponsor_logo_placeholder
							local_id = logo
							type = SpriteElement
							dims = (414.0, 105.0)
							just = [
								0.0
								-1.0
							]
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (-13.730273, 8.986657)
							z_priority = 5.0
							rot_angle = -5.0
						}
					}
				]
			}
			{
				props = {
					local_id = description
					type = TextBlockElement
					dims = (390.0, 220.0)
					pos = (545.0751, 395.6936)
					z_priority = 4.0
					rot_angle = 2.1999907
					rgba = [
						128
						0
						0
						255
					]
					text = qs("OC drums has had they're eye on you.  They think your drummer is the next 'Tommy Lee Bonham' and they're putting their money where their mouth is by giving you a drum sponsorship deal.")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_scale = (0.7, 0.7)
				}
			}
			{
				props = {
					local_id = milk_text
					type = TextBlockElement
					dims = (380.0, 80.0)
					pos = (519.1289, 545.75507)
					z_priority = 4.0
					rot_angle = 1.2
					rgba = [
						64
						32
						128
						255
					]
					text = qs("YOU MILK YOUR SPONSOR FOR:")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.75, 0.75)
				}
			}
			{
				props = {
					local_id = Cash
					type = TextBlockElement
					dims = (220.0, 70.0)
					pos = (515.33594, 609.45593)
					z_priority = 5.0
					rot_angle = 1.2
					rgba = [
						128
						0
						0
						255
					]
					text = qs("$000")
					font = fontgrid_text_a8
					fit_width = `scale each line to fit`
					fit_height = `scale down if larger`
					scale_mode = `per axis`
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (1.5, 1.3499999)
				}
			}
			{
				props = {
					texture = sponsor_photo_placeholder
					local_id = photo
					type = SpriteElement
					dims = (328.0, 320.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (936.6672, 370.8727)
					z_priority = 2.0
				}
			}
		]
	}
}
uidesc_sponsor_new_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
