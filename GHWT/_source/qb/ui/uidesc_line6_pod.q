uidesc_line6_pod = {
	DescVersion = 2
	name = uidesc_line6_pod
	rect = [
		-75.19417
		-217.56001
		341.47418
		645.11993
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 3
					validateLocalID = item_contols
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = cab
					includeParentOwned = false
				}
			]
			name = cab_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 3
					validateLocalID = item_contols
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = fx
					includeParentOwned = false
				}
			]
			name = fx_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 3
					validateLocalID = item_contols
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = amp
					includeParentOwned = false
				}
			]
			name = amp_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 6
					validateLocalID = down_arrow
					includeParentOwned = false
				}
			]
			name = down_arrow_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 5
					validateLocalID = up_arrow
					includeParentOwned = false
				}
			]
			name = up_arrow_scale
			target = scale
			type = pair
		}
		{
			path = [
				{
					validateLocalID = Line6body
				}
				{
					index = 4
					validateLocalID = effect
					includeParentOwned = false
				}
			]
			name = Effect_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = Line6body
			type = ContainerElement
			dims = (0.0, 0.0)
			pos = (0.0, 0.0)
			z_priority = 50.0
			scale = (1.05, 1.05)
		}
		children = [
			{
				props = {
					texture = line6_body
					local_id = line6_body
					type = SpriteElement
					dims = (256.0, 512.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (100.0, 100.0)
					z_priority = 51.0
					scale = (1.2, 1.2)
				}
			}
			{
				props = {
					texture = line6_textbg_large
					local_id = line6_textbg_large
					type = SpriteElement
					dims = (220.0, 145.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (38.386497, 146.98404)
					z_priority = 55.0
				}
			}
			{
				props = {
					texture = line6_button
					local_id = line6_button
					type = SpriteElement
					hiddenLocal = true
					dims = (32.0, 32.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (15.693054, 341.65805)
					z_priority = 55.0
				}
			}
			{
				props = {
					local_id = item_contols
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (89.68546, 139.26097)
					z_priority = 51.0
				}
				children = [
				]
			}
			{
				props = {
					local_id = effect
					type = TextBlockElement
					dims = (130.0, 30.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (33.049847, 148.43536)
					z_priority = 56.0
					scale = (1.0, 1.3)
					rgba = [
						62
						32
						2
						255
					]
					text = qs("Line6 Insane")
					font = fontgrid_text_a11
					fit_width = `scale each line if larger`
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
					texture = snap_arrow
					local_id = up_arrow
					type = SpriteElement
					dims = (8.0, 16.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (108.91714, 138.70393)
					z_priority = 56.0
					scale = (1.2, 1.2)
					rot_angle = -90.0
					rgba = [
						62
						32
						2
						255
					]
				}
			}
			{
				props = {
					texture = snap_arrow
					local_id = down_arrow
					type = SpriteElement
					dims = (8.0, 16.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (108.04755, 154.35616)
					z_priority = 56.0
					scale = (1.2, 1.2)
					rot_angle = 90.0
					rgba = [
						62
						32
						2
						255
					]
				}
			}
			{
				props = {
					local_id = unlock
					type = TextBlockElement
					hiddenLocal = true
					dims = (66.0, 16.0)
					just = [
						-1.0
						-1.0
					]
					pos = (16.546957, 334.03238)
					z_priority = 56.0
					rgba = [
						224
						224
						224
						255
					]
					text = qs("UNLOCK")
					font = fontgrid_text_a11
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
		]
	}
}
uidesc_line6_pod_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
