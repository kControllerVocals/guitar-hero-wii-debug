uidesc_song_unpause = {
	DescVersion = 2
	name = uidesc_song_unpause
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = song_unpause_container
				}
				{
					index = 2
					validateLocalID = dude_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = number
					includeParentOwned = false
				}
			]
			name = number_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = song_unpause_container
				}
				{
					index = 1
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = song_unpause_container
				}
				{
					index = 1
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = song_unpause_container
				}
				{
					index = 2
					validateLocalID = dude_container
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = resume_4
					includeParentOwned = false
				}
			]
			name = number_texture
			visiblename = 'number_texture'
			help = 'song_unpause_container -> dude_container -> resume_4 => texture'
			target = texture
			type = checksum
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = song_unpause_container
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = -1.0
		}
		children = [
			{
				props = {
					local_id = background
					type = SpriteElement
					hiddenLocal = true
					alpha = 0.6
					dims = (1280.0, 120.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						0.0
						-1.0
					]
					pos = (0.0, 63.0)
					rgba = [
						0
						0
						0
						255
					]
				}
			}
			{
				props = {
					local_id = title
					type = TextBlockElement
					dims = (768.0, 100.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						0.0
						-1.0
					]
					pos = (0.0, 72.0)
					z_priority = 3.0
					rgba = [
						200
						200
						200
						255
					]
					text = qs("")
					font = fontgrid_text_A11_b
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.8, 0.8)
					use_shadow = true
					shadow_offs = (2.0, 2.0)
					line_spacing = 0.8
				}
			}
			{
				props = {
					local_id = dude_container
					type = ContainerElement
					dims = (100.0, 100.0)
					just = [
						0.0
						1.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 160.0)
				}
				children = [
					{
						props = {
							local_id = number
							type = TextBlockElement
							alpha = 0.0
							dims = (300.0, 300.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								0.0
								1.0
							]
							pos = (3.940856, 15.1301565)
							z_priority = 1.0
							scale = (0.6, 0.6)
							rgba = [
								255
								224
								192
								255
							]
							text = qs("4")
							font = fontgrid_text_a11_large
							fit_width = `scale each line if larger`
							fit_height = `scale to fit`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							use_shadow = true
							shadow_offs = (2.0, 2.0)
						}
					}
					{
						props = {
							texture = resume_dude
							local_id = resume_dude
							type = SpriteElement
							dims = (512.0, 512.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (12.906187, -155.67206)
							z_priority = 1.0
							scale = (0.8, 0.8)
						}
					}
					{
						props = {
							texture = resume_dude
							local_id = resume_dude_shadow
							type = SpriteElement
							dims = (512.0, 512.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (17.146118, -145.91202)
							z_priority = 0.5
							scale = (0.8, 0.8)
							rgba = [
								0
								0
								0
								100
							]
						}
					}
					{
						props = {
							blend = blend
							texture = resume_4
							local_id = resume_4
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 256.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (52.222168, 27.777802)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
						}
					}
				]
			}
			{
				props = {
					local_id = bg_stripe
					type = ContainerElement
					dims = (1280.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -238.0)
				}
				children = [
					{
						props = {
							texture = gradient_256
							blend = subtract
							flip_h = false
							local_id = gradient_256
							type = SpriteElement
							alpha = 0.6
							dims = (100.0, 640.0)
							just = [
								0.0
								-1.0
							]
							pos = (640.0, 50.0)
							rot_angle = 90.0
						}
					}
					{
						props = {
							texture = gradient_256
							blend = subtract
							flip_h = false
							local_id = gradient_256
							type = SpriteElement
							alpha = 0.6
							dims = (100.0, 640.0)
							just = [
								0.0
								-1.0
							]
							pos = (640.0, 50.0)
							rot_angle = -90.0
						}
					}
				]
			}
		]
	}
}
uidesc_song_unpause_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
