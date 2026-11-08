uidesc_leaderboard_head = {
	DescVersion = 1
	name = uidesc_leaderboard_head
	rect = [
		-512.0
		-53.25
		1024.0
		193.25
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = leaderboard_head_container
				}
				{
					index = 1
					validateLocalID = leaderboard_artist_song_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = leaderboard_artist
					includeParentOwned = false
				}
			]
			name = leaderboard_artist_text
			visiblename = 'leaderboard_artist_text'
			help = 'leaderboard_head_container -> leaderboard_artist_song_container -> leaderboard_artist => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = leaderboard_head_container
				}
				{
					index = 1
					validateLocalID = leaderboard_artist_song_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = leaderboard_song
					includeParentOwned = false
				}
			]
			name = leaderboard_song_text
			visiblename = 'leaderboard_song_text'
			help = 'leaderboard_head_container -> leaderboard_artist_song_container -> leaderboard_song => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = leaderboard_head_container
				}
				{
					index = 0
					validateLocalID = leaderboard_head
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = leaderboard_head
					includeParentOwned = false
				}
			]
			name = leaderboard_head_text
			visiblename = 'leaderboard_head_text'
			help = 'leaderboard_head_container -> leaderboard_head -> leaderboard_head => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = leaderboard_head_container
				}
				{
					index = 1
					validateLocalID = leaderboard_artist_song_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = leaderboard_type
					includeParentOwned = false
				}
			]
			name = leaderboard_type_text
			visiblename = 'leaderboard_type_text'
			help = 'leaderboard_head_container -> leaderboard_artist_song_container -> leaderboard_type => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = leaderboard_head_container
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
					local_id = leaderboard_head
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (1024.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 2.0
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
					isVertical = false
					internal_just = [
						0.0
						0.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = 0
					position_children = true
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
					allow_wrap = true
					allow_alternate_directional_events = false
				}
				children = [
					{
						props = {
							blend = blend
							texture = leaderboard_head
							local_id = leaderboard_head_L
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (128.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (242.45001, 50.0)
							z_priority = 3.0
							scale = (1.2, 1.2)
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
							local_id = leaderboard_head
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (385.5, 106.5)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (512.0, 50.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								60
								60
								90
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("GuitarBoard")
							font = fontgrid_text_a10
							material = 0x00000000
							single_line = true
							fit_width = `expand dims`
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.75, 0.5)
							blend = blend
							font_spacing = -1
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = true
							shadow_rgba = [
								192
								192
								192
								200
							]
							shadow_offs = (3.0, 3.0)
							line_spacing = 1.0
						}
					}
					{
						props = {
							blend = blend
							texture = leaderboard_head
							flip_v = true
							local_id = leaderboard_head_R
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (128.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (781.5499, 50.0)
							z_priority = 3.0
							scale = (1.2, 1.2)
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
			{
				props = {
					local_id = leaderboard_artist_song_container
					type = MenuElement
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
					pos = (0.0, 90.0)
					z_priority = 2.0
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
					isVertical = true
					internal_just = [
						0.0
						0.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = -10
					position_children = true
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
					allow_wrap = true
					allow_alternate_directional_events = false
				}
				children = [
					{
						props = {
							local_id = leaderboard_artist
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (600.0, 40.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (50.0, 20.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								60
								60
								90
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("JOAN JETT AND THE BLACKHEARTS")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.8, 1.0)
							blend = blend
							font_spacing = -1
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = true
							shadow_rgba = [
								192
								192
								192
								255
							]
							shadow_offs = (1.0, 1.0)
							line_spacing = 1.0
						}
					}
					{
						props = {
							local_id = leaderboard_song
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (600.0, 40.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (50.0, 50.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								25
								80
								95
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("I HATE MYSELF FOR LOVING YOU")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.6, 0.7)
							blend = blend
							font_spacing = -1
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = true
							shadow_rgba = [
								192
								192
								192
								255
							]
							shadow_offs = (1.0, 1.0)
							line_spacing = 1.0
						}
					}
					{
						props = {
							local_id = leaderboard_type
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (600.0, 40.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (50.0, 80.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								25
								80
								95
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("I HATE MYSELF FOR LOVING YOU")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.6, 0.7)
							blend = blend
							font_spacing = -1
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = true
							shadow_rgba = [
								192
								192
								192
								255
							]
							shadow_offs = (1.0, 1.0)
							line_spacing = 1.0
						}
					}
				]
			}
		]
	}
}
uidesc_leaderboard_head_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
