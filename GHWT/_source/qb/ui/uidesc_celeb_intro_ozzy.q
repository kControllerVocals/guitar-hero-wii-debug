uidesc_celeb_intro_ozzy = {
	DescVersion = 3
	name = uidesc_celeb_intro_ozzy
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
					validateLocalID = celeb_patch_osbourne
				}
				{
					index = 0
					validateLocalID = osbourne_banner
					includeParentOwned = false
				}
			]
			name = alias_celeb_intro_banner
			visiblename = 'alias_celeb_intro_banner'
			help = 'celeb_patch_osbourne -> osbourne_banner'
		}
		{
			path = [
				{
					validateLocalID = celeb_patch_osbourne
				}
				{
					index = 1
					validateLocalID = celeb_icons_and_name
					includeParentOwned = false
				}
			]
			name = alias_celeb_intro_alltherest
			visiblename = 'alias_celeb_intro_alltherest'
			help = 'celeb_patch_osbourne -> celeb_icons_and_name'
		}
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = celeb_patch_osbourne
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
					texture = osbourne_banner
					material = 0x00000000
					local_id = osbourne_banner
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
							flip_v = true
							texture = osbourne_icon
							material = 0x00000000
							local_id = osbourne_icon
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
							pos = (-267.0, -50.0)
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
							flip_v = false
							texture = osbourne_icon
							material = 0x00000000
							local_id = osbourne_icon
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
							pos = (294.0, -50.0)
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
							texture = osbourne_name
							material = 0x00000000
							local_id = osbourne_name
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
							pos = (0.0, 0.0)
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
uidesc_celeb_intro_ozzy_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
