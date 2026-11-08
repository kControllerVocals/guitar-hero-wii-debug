uidesc_song_summary_ATT_Ad = {
	DescVersion = 2
	name = uidesc_song_summary_ATT_Ad
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = ATT_AD_master
			type = ContainerElement
			dims = (1280.0, 720.0)
			pos = (640.0, 360.0)
		}
		children = [
			{
				props = {
					texture = logo_ATT
					local_id = logo_ATT
					type = SpriteElement
					dims = (256.0, 72.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -244.0)
					z_priority = 5.0
				}
			}
			{
				props = {
					texture = logo_GuitarCenter
					local_id = logo_GuitarCenter
					type = SpriteElement
					dims = (228.0, 128.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 172.0)
					z_priority = 5.0
					scale = (0.6, 0.6)
					rgba = [
						224
						224
						224
						255
					]
				}
			}
			{
				props = {
					local_id = ATT_AD_text
					type = ContainerElement
					hiddenLocal = true
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -50.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = ATT_AD_headline
							type = TextBlockElement
							dims = (500.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -72.0)
							z_priority = 3.0
							rgba = [
								255
								192
								128
								255
							]
							text = qs("You rocked AT&T Park!")
							font = fontgrid_text_a10
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								1.0
							]
							internal_scale = (0.7, 0.7)
							use_shadow = true
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = ATT_AD_message
							type = TextBlockElement
							dims = (500.0, 200.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 78.0)
							z_priority = 3.0
							rgba = [
								255
								224
								192
								255
							]
							text = $wii_att_guitar_center_nocontest
							font = fontgrid_text_a8
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								-1.0
							]
							internal_scale = (0.7, 0.7)
							font_spacing = 1
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
			{
				props = {
					local_id = alert_master_container
					type = ContainerElement
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 495.0
				}
				children = [
					{
						props = {
							local_id = alert_bg
							type = ContainerElement
							dims = (100.0, 100.0)
							pos = (640.0, 360.0)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = dialog_bg
									local_id = dialog_bg
									type = SpriteElement
									dims = (720.0, 670.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, -23.0)
									z_priority = 2.0
								}
							}
						]
					}
					{
						props = {
							texture = gradient_256
							blend = subtract
							flip_h = true
							local_id = gradient_256
							type = SpriteElement
							alpha = 0.5
							dims = (1280.0, 720.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 1.0
						}
					}
					{
						props = {
							local_id = title_text_container
							type = ContainerElement
							dims = (100.0, 100.0)
							pos = (640.0, 106.0)
							z_priority = 2.0
						}
					}
					{
						props = {
							local_id = alert_message
							type = TextBlockElement
							hiddenLocal = true
							dims = (550.0, 300.0)
							just = [
								0.0
								-1.0
							]
							pos = (632.0, 230.0)
							z_priority = 3.0
							rot_angle = -2.0
							rgba = [
								128
								128
								128
								255
							]
							text = qs("ALERT MESSAGE")
							font = fontgrid_text_a6
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.55, 0.55)
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
		]
	}
}
uidesc_song_summary_ATT_Ad_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
