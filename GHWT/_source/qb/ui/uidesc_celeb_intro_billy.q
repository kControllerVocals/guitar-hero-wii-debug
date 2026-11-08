uidesc_celeb_intro_billy = {
	DescVersion = 2
	name = uidesc_celeb_intro_billy
	rect = [
		50.0
		50.0
		1081.9374
		642.99225
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = celeb_patch_corgan
				}
				{
					index = 1
					validateLocalID = celeb_icons_and_name
					includeParentOwned = false
				}
			]
			name = alias_celeb_intro_alltherest
			visiblename = 'alias_celeb_intro_alltherest'
			help = 'celeb_patch_corgan -> celeb_icons_and_name'
		}
		{
			path = [
				{
					validateLocalID = celeb_patch_corgan
				}
				{
					index = 0
					validateLocalID = corgan_banner
					includeParentOwned = false
				}
			]
			name = alias_celeb_intro_banner
			visiblename = 'alias_celeb_intro_banner'
			help = 'celeb_patch_corgan -> corgan_banner'
		}
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = celeb_patch_corgan
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (100.0, 100.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (100.0, 100.0)
			z_priority = 0.0
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
		children = [
			{
				props = {
					blend = blend
					texture = corgan_banner
					local_id = corgan_banner
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1024.0, 256.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (519.93744, 464.99222)
					z_priority = 1.0
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
			{
				props = {
					local_id = celeb_icons_and_name
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (534.0, 462.0)
					z_priority = 1.0
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
				children = [
					{
						props = {
							blend = blend
							texture = corgan_icon
							local_id = corgan_icon
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 256.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-266.7813, -29.71326)
							z_priority = 3.0
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
					{
						props = {
							blend = blend
							texture = corgan_icon
							flip_v = true
							local_id = corgan_icon
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (256.0, 256.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (294.67615, -31.021545)
							z_priority = 3.0
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
					{
						props = {
							blend = blend
							texture = corgan_name
							local_id = corgan_name
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-0.9052729, -3.54895)
							z_priority = 5.0
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
		]
	}
}
uidesc_celeb_intro_billy_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
