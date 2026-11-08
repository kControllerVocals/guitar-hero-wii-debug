uidesc_character_bio = {
	DescVersion = 1
	name = uidesc_character_bio
	rect = [
		800.0
		-200.0
		768.0
		1024.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = Character_Bio
				}
				{
					index = 0
					validateLocalID = character_bio_control
					includeParentOwned = false
				}
			]
			name = alias_character_bio_control
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = Character_Bio
				}
				{
					index = 0
					validateLocalID = character_bio_control
					includeParentOwned = false
				}
			]
			name = character_bio_control_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = Character_Bio
				}
				{
					index = 0
					validateLocalID = character_bio_control
					includeParentOwned = false
				}
			]
			name = character_bio_control_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = Character_Bio
				}
				{
					index = 0
					validateLocalID = character_bio_control
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_bio_bg
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_bio_title
					includeParentOwned = false
				}
			]
			name = character_bio_title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Character_Bio
				}
				{
					index = 0
					validateLocalID = character_bio_control
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_bio_bg
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_bio_name
					includeParentOwned = false
				}
			]
			name = character_bio_name_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Character_Bio
				}
				{
					index = 0
					validateLocalID = character_bio_control
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_bio_bg
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = character_bio_bio
					includeParentOwned = false
				}
			]
			name = character_bio_bio_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = Character_Bio
				}
				{
					index = 0
					validateLocalID = character_bio_control
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = character_bio_bg
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = character_bio_name
					includeParentOwned = false
				}
			]
			name = character_bio_name_material
			target = material
			type = checksum_material
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = Character_Bio
			type = ContainerElement
			dims = (512.0, 1024.0)
			just = [
				-1.0
				-1.0
			]
			pos = (800.0, -200.0)
			z_priority = 130.0
		}
		children = [
			{
				props = {
					local_id = character_bio_control
					type = ContainerElement
					dims = (512.0, 20.0)
					just = [
						-1.0
						-1.0
					]
					pos = (256.0, 0.0)
					z_priority = 131.0
				}
				children = [
					{
						props = {
							texture = bio_main_container
							flip_h = false
							flip_v = false
							local_id = character_bio_bg
							type = SpriteElement
							dims = (512.0, 1024.0)
							just = [
								0.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 132.0
						}
						children = [
							{
								props = {
									local_id = character_bio_title
									type = TextBlockElement
									dims = (250.0, 50.0)
									just = [
										-1.0
										-1.0
									]
									pos = (130.0, 342.0)
									z_priority = 133.0
									text = qs("Select Your Rocker")
									font = fontgrid_text_a8
									fit_width = `scale each line if larger`
									fit_height = `clip bottom lines`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
								}
							}
							{
								props = {
									local_id = character_bio_name
									type = TextBlockElement
									dims = (250.0, 50.0)
									just = [
										-1.0
										-1.0
									]
									pos = (130.0, 425.0)
									z_priority = 133.0
									text = qs("New Rocker")
									font = fontgrid_title_A2
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										0.0
									]
								}
							}
							{
								props = {
									local_id = character_bio_bio
									type = TextBlockElement
									dims = (250.0, 350.0)
									just = [
										-1.0
										-1.0
									]
									pos = (145.0, 495.0)
									z_priority = 133.0
									rgba = [
										120
										110
										95
										255
									]
									text = qs("Create your own rocker to show these posers how its done!")
									font = fontgrid_text_a3
									fit_width = wrap
									fit_height = `clip bottom lines`
									scale_mode = proportional
									text_case = Original
									internal_scale = (0.6, 0.6)
								}
							}
						]
					}
				]
			}
		]
	}
}
uidesc_character_bio_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
