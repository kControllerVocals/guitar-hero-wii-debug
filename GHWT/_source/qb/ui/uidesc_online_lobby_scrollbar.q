uidesc_online_lobby_scrollbar = {
	DescVersion = 1
	name = uidesc_online_lobby_scrollbar
	rect = [
		-50.0
		-50.0
		100.0
		256.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = scrollbar_container
				}
				{
					index = 3
					validateLocalID = scrollbar_thumb
					includeParentOwned = false
				}
			]
			name = scrollbar_thumb_pos
			visiblename = 'scrollbar_thumb_pos'
			help = 'scrollbar_container -> scrollbar_thumb => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = scrollbar_container
				}
				{
					index = 0
					validateLocalID = scrollbar_bg
					includeParentOwned = false
				}
			]
			name = scrollbar_bg_dims
			visiblename = 'scrollbar_bg_dims'
			help = 'scrollbar_container -> scrollbar_bg => dims'
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = scrollbar_container
				}
				{
					index = 2
					validateLocalID = scrollbar_arrow_down
					includeParentOwned = false
				}
			]
			name = scrollbar_arrow_down_pos
			visiblename = 'scrollbar_arrow_down_pos'
			help = 'scrollbar_container -> scrollbar_arrow_down => pos'
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = scrollbar_container
				}
				{
					index = 1
					validateLocalID = scrollbar_arrow_up
					includeParentOwned = false
				}
			]
			name = scrollbar_arrow_up_pos
			visiblename = 'scrollbar_arrow_up_pos'
			help = 'scrollbar_container -> scrollbar_arrow_up => pos'
			target = pos
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = scrollbar_container
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
			pos = (0.0, 0.0)
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
					texture = scrollbar_blue
					material = 0x00000000
					local_id = scrollbar_bg
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (16.0, 200.0)
					just = [
						0.0
						-1.0
					]
					pos_anchor = [
						0.0
						-1.0
					]
					pos = (-1.0, 41.0)
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
					blend = blend
					texture = scrollbar_arrow
					material = 0x00000000
					local_id = scrollbar_arrow_up
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (32.0, 32.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (1.0, -11.0)
					z_priority = 1.1
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
					texture = scrollbar_arrow
					material = 0x00000000
					flip_h = true
					local_id = scrollbar_arrow_down
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (32.0, 32.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-1.0, 190.0)
					z_priority = 1.1
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
					texture = scroll_thumb_blue
					material = 0x00000000
					local_id = scrollbar_thumb
					type = SpriteElement
					hiddenLocal = false
					alpha = 1.0
					dims = (32.0, 32.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.2
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
}
uidesc_online_lobby_scrollbar_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
