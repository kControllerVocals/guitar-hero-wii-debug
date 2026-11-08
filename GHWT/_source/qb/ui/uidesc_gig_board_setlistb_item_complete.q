uidesc_gig_board_setlistB_item_complete = {
	DescVersion = 1
	name = uidesc_gig_board_setlistB_item_complete
	rect = [
		0.0
		0.0
		580.0
		100.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = gig_board_item
				}
				{
					index = 1
					validateLocalID = gig_item_song
					includeParentOwned = false
				}
			]
			name = gig_item_song_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = gig_board_item
				}
				{
					index = 1
					validateLocalID = gig_item_song
					includeParentOwned = false
				}
			]
			name = gig_item_song_rgba
			target = rgba
			type = array_color
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = gig_board_item
			type = MenuElement
			dims = (580.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			isVertical = false
			internal_just = [
				0.0
				0.0
			]
			fit_major = `fit content if larger`
			fit_minor = `fit content if larger`
			scale_mode = proportional
			allow_wrap = false
		}
		children = [
			{
				props = {
					texture = checkmark
					local_id = checkmark
					type = SpriteElement
					dims = (75.0, 75.0)
					pos = (48.799988, 50.0)
					z_priority = 1.0
				}
			}
			{
				props = {
					local_id = gig_item_song
					type = TextBlockElement
					dims = (482.40002, 56.400005)
					pos = (327.5, 50.0)
					z_priority = 1.0
					rgba = [
						192
						255
						192
						255
					]
					text = qs("LIVIN' ON A PRAYER")
					font = fontgrid_text_a8
					single_line = true
					fit_width = `expand dims`
					fit_height = `expand dims`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						-1.0
						0.0
					]
					internal_scale = (1.2, 1.2)
					use_shadow = true
					shadow_offs = (3.0, 3.0)
				}
			}
		]
	}
}
uidesc_gig_board_setlistB_item_complete_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
