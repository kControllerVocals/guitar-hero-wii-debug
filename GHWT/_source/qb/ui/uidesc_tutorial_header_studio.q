uidesc_tutorial_header_studio = {
	DescVersion = 7
	name = uidesc_tutorial_header_studio
	rect = [
		138.0
		37.795628
		1022.0
		515.108
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = training_container
				}
				{
					index = 1
					validateLocalID = tutorial_body_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = tutorial_body_vmenu
					includeParentOwned = false
				}
			]
			name = alias_tutorial_body_vmenu
		}
		{
			path = [
				{
					validateLocalID = training_container
				}
				{
					index = 0
					validateLocalID = tutorial_lesson_container
					includeParentOwned = false
				}
			]
			name = alias_tutorial_lesson_container
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = training_container
				}
				{
					index = 0
					validateLocalID = tutorial_lesson_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = lesson_number
					includeParentOwned = false
				}
			]
			name = lesson_number_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = training_container
				}
				{
					index = 0
					validateLocalID = tutorial_lesson_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = lesson_text
					includeParentOwned = false
				}
			]
			name = lesson_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = training_container
				}
				{
					index = 2
					validateLocalID = tutorial_task_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = task_notes_remaining
					includeParentOwned = false
				}
			]
			name = task_notes_remaining_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = training_container
				}
				{
					index = 2
					validateLocalID = tutorial_task_container
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = task_text
					includeParentOwned = false
				}
			]
			name = task_text_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = training_container
				}
				{
					index = 2
					validateLocalID = tutorial_task_container
					includeParentOwned = false
				}
			]
			name = task_container_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = training_container
				}
				{
					index = 2
					validateLocalID = tutorial_task_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = task_word
					includeParentOwned = false
				}
			]
			name = task_word_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = training_container
				}
				{
					index = 3
					validateLocalID = tutorial_narrator_placeholder
					includeParentOwned = false
				}
			]
			name = tutorial_narrator_placeholder_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = training_container
				}
				{
					index = 3
					validateLocalID = tutorial_narrator_placeholder
					includeParentOwned = false
				}
			]
			name = tutorial_narrator_placeholder_pos
			target = pos
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = training_container
			type = ContainerElement
			dims = (100.0, 100.0)
			just = [
				-1.0
				-1.0
			]
			pos = (138.0, 82.0)
		}
		children = [
			{
				props = {
					local_id = tutorial_lesson_container
					type = ContainerElement
					dims = (520.0, 36.0)
					just = [
						-1.0
						-1.0
					]
					pos = (342.0, -44.204376)
					z_priority = 4.9
				}
				children = [
					{
						props = {
							local_id = lesson_word
							type = TextBlockElement
							dims = (180.0, 36.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 5.0
							rgba = [
								224
								224
								224
								255
							]
							text = qs("LESSON")
							font = fontgrid_text_a6
							fit_width = `scale each line to fit`
							fit_height = `scale to fit`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							use_shadow = true
						}
					}
					{
						props = {
							local_id = lesson_number
							type = TextBlockElement
							dims = (40.0, 36.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-58.0, 0.0)
							z_priority = 5.0
							rgba = [
								224
								224
								224
								255
							]
							text = qs("1")
							font = fontgrid_text_a6
							fit_width = `scale each line if larger`
							fit_height = `scale to fit`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							use_shadow = true
						}
					}
					{
						props = {
							local_id = lesson_text
							type = TextBlockElement
							dims = (460.0, 36.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								0.0
							]
							pos = (220.0, 0.0)
							z_priority = 5.9
							rgba = [
								128
								128
								128
								255
							]
							text = qs("EXTENDED SUSTAINS")
							font = fontgrid_text_a6
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.6, 0.6)
							use_shadow = true
						}
					}
				]
			}
			{
				props = {
					local_id = tutorial_body_container
					type = ContainerElement
					dims = (594.0, 200.0)
					just = [
						-1.0
						-1.0
					]
					pos = (342.0, 0.0)
					z_priority = 4.9
				}
				children = [
					{
						props = {
							local_id = tutorial_body_vmenu
							type = MenuElement
							dims = (394.0, 400.0)
							just = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 5.0
							internal_just = [
								-1.0
								-1.0
							]
							spacing_between = 5
							position_children = true
							fit_major = `fit content if larger`
							fit_minor = `keep dims`
							scale_mode = `per axis`
						}
					}
				]
			}
			{
				props = {
					local_id = tutorial_task_container
					type = ContainerElement
					dims = (200.0, 200.0)
					just = [
						-1.0
						-1.0
					]
					pos = (798.0, 250.0)
					z_priority = 4.9
				}
				children = [
					{
						props = {
							local_id = task_word
							type = TextBlockElement
							dims = (180.0, 40.0)
							pos = (100.0, 13.0)
							z_priority = 5.0
							rgba = [
								224
								224
								224
								255
							]
							text = qs("TASK")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							use_shadow = true
							shadow_offs = (1.0, 1.0)
						}
					}
					{
						props = {
							local_id = task_notes_remaining
							type = TextBlockElement
							dims = (120.0, 80.0)
							pos = (100.0, 152.0)
							z_priority = 5.0
							text = qs("8")
							font = fontgrid_text_a6_fire
							material = sys_fontgrid_text_A6_fire_sys_fontgrid_text_A6_fire
							fit_width = `scale each line if larger`
							fit_height = `scale to fit`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							use_shadow = true
							shadow_offs = (1.0, 1.0)
						}
					}
					{
						props = {
							local_id = task_text
							type = TextBlockElement
							dims = (240.0, 100.0)
							pos = (100.0, 77.0)
							z_priority = 5.0
							scale = (0.9, 0.9)
							rgba = [
								148
								84
								20
								255
							]
							text = qs("Hit 8 notes to continue")
							font = fontgrid_text_A11_b
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.6, 0.6)
							use_shadow = true
							shadow_offs = (1.0, 1.0)
						}
					}
					{
						props = {
							texture = mixer_glow_64
							local_id = task_glow_black
							type = SpriteElement
							alpha = 0.8
							dims = (240.0, 240.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-2.338959, 0.90367097)
							z_priority = 4.0
							rgba = [
								0
								0
								0
								255
							]
						}
					}
				]
			}
			{
				props = {
					texture = tutorial_narrator_placeholder
					local_id = tutorial_narrator_placeholder
					type = SpriteElement
					dims = (200.0, 200.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (850.0, 50.0)
					z_priority = 1.0
				}
			}
		]
	}
}
uidesc_tutorial_header_studio_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			7
		]
	}
	EditMaterialForm = {
	}
}
