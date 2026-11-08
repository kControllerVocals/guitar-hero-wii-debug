uidesc_special_event_info = {
	DescVersion = 1
	name = uidesc_special_event_info
	rect = [
		0.0
		-8.715573
		1149.2771
		637.39575
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = special_event_info_container
				}
				{
					index = 0
					validateLocalID = special_event_info_vmenu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = special_event_info_text
					includeParentOwned = false
				}
			]
			name = special_event_info_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = special_event_info_container
				}
			]
			name = special_event_info_container_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = special_event_info_container
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			rot_angle = -5.0
		}
		children = [
			{
				props = {
					local_id = special_event_info_vmenu
					type = MenuElement
					dims = (512.0, 512.0)
					pos = (838.0, 426.0)
					z_priority = 1.0
					internal_just = [
						0.0
						0.0
					]
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							texture = setlist_B_head
							local_id = special_event_info_head
							type = SpriteElement
							dims = (512.0, 128.0)
							pos = (256.0, 64.0)
							z_priority = 1.0
						}
					}
					{
						props = {
							local_id = special_event_info_text
							type = TextBlockElement
							dims = (512.0, 256.0)
							pos = (256.0, 256.0)
							z_priority = 1.0
							rgba = [
								230
								230
								230
								255
							]
							text = qs("Placeholder Text")
							font = fontgrid_text_a8
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							use_shadow = true
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = special_event_info_footer
							type = ContainerElement
							dims = (512.0, 128.0)
							pos = (256.0, 448.0)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = setlist_B_foot
									local_id = special_event_info_foot_left
									type = SpriteElement
									dims = (256.0, 128.0)
									just = [
										-1.0
										-1.0
									]
									pos = (0.0, 0.0)
									z_priority = 1.0
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
									texture = setlist_B_foot
									flip_v = true
									local_id = special_event_info_foot_right
									type = SpriteElement
									dims = (256.0, 128.0)
									just = [
										-1.0
										-1.0
									]
									pos = (256.0, 0.0)
									z_priority = 1.0
									rgba = [
										224
										224
										224
										255
									]
								}
							}
						]
					}
				]
			}
		]
	}
}
uidesc_special_event_info_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
