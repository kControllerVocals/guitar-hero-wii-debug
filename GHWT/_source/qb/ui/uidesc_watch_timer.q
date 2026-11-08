uidesc_watch_timer = {
	DescVersion = 2
	name = uidesc_watch_timer
	rect = [
		-0.043860994
		-1.6747509
		64.0
		512.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = Timer
				}
			]
			name = Timer_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = Timer
				}
				{
					index = 1
					validateLocalID = timer_hand_small
					includeParentOwned = false
				}
			]
			name = timer_hand_small_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = Timer
				}
				{
					index = 0
					validateLocalID = timer_hand_big
					includeParentOwned = false
				}
			]
			name = timer_hand_big_rot_angle
			target = rot_angle
			type = float
		}
		{
			path = [
				{
					validateLocalID = Timer
				}
				{
					index = 0
					validateLocalID = timer_hand_big
					includeParentOwned = false
				}
			]
			name = Timer_hand_big_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = Timer
				}
				{
					index = 1
					validateLocalID = timer_hand_small
					includeParentOwned = false
				}
			]
			name = Timer_hand_small_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = Timer
				}
				{
					index = 2
					validateLocalID = timer_watch
					includeParentOwned = false
				}
			]
			name = Timer_watch_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = Timer
			type = ContainerElement
			dims = (64.0, 512.0)
			just = [
				0.0
				-1.0
			]
			pos_anchor = [
				0.0
				0.0
			]
			pos = (31.95614, -1.6747509)
		}
		children = [
			{
				props = {
					texture = timer_hand_big
					local_id = timer_hand_big
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 13.0)
					z_priority = 1.0
				}
			}
			{
				props = {
					texture = timer_hand_small
					local_id = timer_hand_small
					type = SpriteElement
					dims = (64.0, 64.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 13.0)
					z_priority = 1.0
					rot_angle = 180.0
				}
			}
			{
				props = {
					texture = timer_watch
					local_id = timer_watch
					type = SpriteElement
					dims = (64.0, 512.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
			}
		]
	}
}
uidesc_watch_timer_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
