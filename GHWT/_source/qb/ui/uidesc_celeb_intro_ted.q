uidesc_celeb_intro_ted = {
	DescVersion = 3
	name = uidesc_celeb_intro_ted
	rect = [
		50.0
		50.0
		1081.9375
		642.99225
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = celeb_patch_nugent
				}
				{
					index = 1
					validateLocalID = celeb_icons_and_name
					includeParentOwned = false
				}
			]
			name = alias_celeb_intro_alltherest
			visiblename = 'alias_celeb_intro_alltherest'
			help = 'celeb_patch_nugent -> celeb_icons_and_name'
		}
		{
			path = [
				{
					validateLocalID = celeb_patch_nugent
				}
				{
					index = 0
					validateLocalID = nugent_banner
					includeParentOwned = false
				}
			]
			name = alias_celeb_intro_banner
			visiblename = 'alias_celeb_intro_banner'
			help = 'celeb_patch_nugent -> nugent_banner'
		}
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = celeb_patch_nugent
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
					texture = nugent_banner
					material = 0x00000000
					local_id = nugent_banner
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
					pos = (519.9375, 464.99222)
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
							texture = nugent_icon
							material = 0x00000000
							flip_v = true
							local_id = nugent_icon
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
							pos = (-227.53479, -27.096924)
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
							texture = nugent_icon
							material = 0x00000000
							flip_v = false
							local_id = nugent_icon
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
							pos = (229.26532, -27.096924)
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
							texture = nugent_name
							material = 0x00000000
							local_id = nugent_name
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
uidesc_celeb_intro_ted_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
