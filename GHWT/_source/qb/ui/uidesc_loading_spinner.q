uidesc_loading_spinner = {
	DescVersion = 2
	name = uidesc_loading_spinner
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
					validateLocalID = spinner_master
				}
				{
					index = 0
					validateLocalID = loading_stacker
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = load_wheel_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = load_wheel
					includeParentOwned = false
				}
			]
			name = load_wheel_rot
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = spinner_master
				}
				{
					index = 0
					validateLocalID = loading_stacker
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = loading_message
					includeParentOwned = false
				}
			]
			name = load_message_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = spinner_master
				}
				{
					index = 0
					validateLocalID = loading_stacker
					includeParentOwned = false
				}
			]
			name = load_message_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = spinner_master
				}
				{
					index = 1
					validateLocalID = bG
					includeParentOwned = false
				}
			]
			name = load_bg_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = spinner_master
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = loading_stacker
					type = MenuElement
					dims = (550.0, 80.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
					spacing_between = 30
					fit_major = `fit content if larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							local_id = load_wheel_container
							type = ContainerElement
							dims = (50.0, 50.0)
							pos = (65.29998, 40.0)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = load_wheel_flame
									local_id = load_wheel_flame
									type = SpriteElement
									dims = (150.0, 150.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, -10.0)
									z_priority = 1.0
								}
							}
							{
								props = {
									texture = load_wheel
									local_id = load_wheel
									type = SpriteElement
									dims = (80.0, 80.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, -6.0)
									z_priority = 3.0
								}
							}
						]
					}
					{
						props = {
							local_id = loading_message
							type = TextBlockElement
							dims = (389.40002, 45.600002)
							pos = (315.0, 40.0)
							z_priority = 2.0
							text = qs("LOADING MESSAGE")
							font = fontgrid_text_a6_fire
							material = sys_fontgrid_text_A6_fire_sys_fontgrid_text_A6_fire
							single_line = true
							fit_width = `expand dims`
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_scale = (0.6, 0.6)
							font_spacing = 0
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
			{
				props = {
					texture = white
					local_id = bG
					type = SpriteElement
					alpha = 0.5
					dims = (1280.0, 720.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					rgba = [
						0
						0
						20
						255
					]
				}
			}
		]
	}
}
uidesc_loading_spinner_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
