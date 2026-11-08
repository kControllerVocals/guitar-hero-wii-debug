uidesc_song_intro = {
	DescVersion = 3
	name = uidesc_song_intro
	rect = [
		-61.61346
		0.0
		1341.6135
		720.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = song_intro_master_container
				}
				{
					index = 1
					validateLocalID = intro_info_stacker
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = artist_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = intro_artist
					includeParentOwned = false
				}
			]
			name = intro_artist_text
			visiblename = 'intro_artist_text'
			help = 'song_intro_master_container -> intro_info_stacker -> text -> artist_container -> intro_artist => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = song_intro_master_container
				}
				{
					index = 1
					validateLocalID = intro_info_stacker
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = text
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = intro_performed
					includeParentOwned = false
				}
			]
			name = intro_performed_text
			visiblename = 'intro_performed_text'
			help = 'song_intro_master_container -> intro_info_stacker -> text -> intro_performed => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = song_intro_master_container
				}
				{
					index = 1
					validateLocalID = intro_info_stacker
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = intro_title
					includeParentOwned = false
				}
			]
			name = intro_title_text
			visiblename = 'intro_title_text'
			help = 'song_intro_master_container -> intro_info_stacker -> intro_title => text'
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = song_intro_master_container
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (50.0, 0.0)
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
					texture = setlist_griffin
					flip_v = true
					local_id = setlist_griffin
					type = SpriteElement
					hiddenLocal = false
					alpha = 0.5
					dims = (256.0, 256.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (-573.61346, -224.57278)
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
			}
			{
				props = {
					local_id = intro_info_stacker
					type = MenuElement
					hiddenLocal = false
					alpha = 1.0
					dims = (100.0, 250.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (130.0, 60.0)
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
					isVertical = true
					internal_just = [
						-1.0
						-1.0
					]
					regular_space_amount = -1
					padding_scale = 1.0
					spacing_between = -11
					position_children = true
					fit_major = `keep dims`
					fit_minor = `keep dims`
					scale_mode = proportional
					allow_wrap = true
					allow_alternate_directional_events = false
				}
				children = [
					{
						props = {
							local_id = intro_title
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (600.0, 85.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 42.5)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								192
								128
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("OVERKILL")
							font = fontgrid_text_a10
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								-1.0
								-1.0
							]
							internal_scale = (0.4, 0.4)
							blend = blend
							font_spacing = -1
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = true
							shadow_rgba = [
								0
								0
								0
								255
							]
							shadow_offs = (3.0, 2.0)
							line_spacing = 1.0
						}
					}
					{
						props = {
							local_id = text
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1020.0, 50.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 99.0)
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
								-1.0
								-1.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 10
							position_children = true
							fit_major = `fit content if larger`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = true
							allow_alternate_directional_events = false
						}
						children = [
							{
								props = {
									local_id = intro_performed
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (24.0, 28.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (12.0, 0.0)
									z_priority = 1.0
									scale = (1.0, 1.0)
									rot_angle = 0.0
									rgba = [
										192
										64
										0
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("BY")
									font = fontgrid_text_A11_b
									material = 0x00000000
									single_line = true
									fit_width = `expand dims`
									fit_height = `expand dims`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										1.0
										0.0
									]
									internal_scale = (0.4, 0.4)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = false
									use_shadow = true
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (3.0, 2.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = artist_container
									type = ContainerElement
									hiddenLocal = false
									alpha = 1.0
									dims = (50.0, 50.0)
									just = [
										0.0
										-1.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (59.0, 0.0)
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
								}
								children = [
									{
										props = {
											local_id = intro_artist
											type = TextBlockElement
											hiddenLocal = false
											alpha = 1.0
											dims = (156.0, 63.900005)
											just = [
												-1.0
												0.0
											]
											pos_anchor = [
												-1.0
												-1.0
											]
											pos = (-4.0, 25.0)
											z_priority = 1.0
											scale = (1.0, 1.0)
											rot_angle = 0.0
											rgba = [
												192
												64
												0
												255
											]
											events_blocked = 0
											preserve_local_orientation = false
											text = qs("MOTÖRHEAD")
											font = fontgrid_text_a10
											material = 0x00000000
											single_line = true
											fit_width = `expand dims`
											fit_height = `expand dims`
											scale_mode = proportional
											text_case = Original
											internal_just = [
												-1.0
												0.0
											]
											internal_scale = (0.3, 0.3)
											blend = blend
											font_spacing = -1
											override_color_tag_alpha = true
											override_color_tag_rgba = false
											use_shadow = true
											shadow_rgba = [
												0
												0
												0
												255
											]
											shadow_offs = (3.0, 2.0)
											line_spacing = 1.0
										}
									}
								]
							}
						]
					}
				]
			}
		]
	}
}
uidesc_song_intro_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
