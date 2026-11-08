uidesc_tutorial_title = {
	DescVersion = 1
	name = uidesc_tutorial_title
	rect = [
		0.0
		0.0
		1015.0
		504.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = tutorial_title_container
				}
				{
					index = 0
					validateLocalID = tutorial_title_text
					includeParentOwned = false
				}
			]
			name = tutorial_title_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = tutorial_title_container
				}
			]
			name = tutorial_title_container_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = tutorial_title_container
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 80.0
		}
		children = [
			{
				props = {
					local_id = tutorial_title_text
					type = TextBlockElement
					dims = (500.0, 100.0)
					pos = (640.0, 327.0)
					z_priority = 80.0
					scale = (1.5, 1.5)
					rgba = [
						230
						230
						230
						255
					]
					text = qs("Band Mode Tutorial")
					font = fontgrid_title_a1
					fit_width = `scale each line if larger`
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
					texture = setlist_B_head
					local_id = tutorial_title_head
					type = SpriteElement
					dims = (512.0, 128.0)
					pos = (640.0, 210.0)
					z_priority = 80.0
					scale = (0.9, 0.9)
				}
			}
			{
				props = {
					texture = setlist_B_foot
					local_id = tutorial_title_foot_left
					type = SpriteElement
					dims = (256.0, 128.0)
					pos = (512.0, 440.0)
					z_priority = 80.0
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
					local_id = tutorial_title_foot_right
					type = SpriteElement
					dims = (256.0, 128.0)
					pos = (768.0, 440.0)
					z_priority = 80.0
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
}
uidesc_tutorial_title_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
