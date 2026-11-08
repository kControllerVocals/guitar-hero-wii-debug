uidesc_FreestyleStyleSelect = {
	DescVersion = 3
	name = uidesc_FreestyleStyleSelect
	rect = [
		-4.173889
		-0.52450603
		1351.6798
		732.16
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 1
					validateLocalID = Patch
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = StyleMenu
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = BluesText
					includeParentOwned = false
				}
			]
			name = alias_BluesText
			visiblename = 'alias_BluesText'
			help = 'StyleContainer -> Patch -> StyleMenu -> BluesText'
		}
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 1
					validateLocalID = Patch
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = StyleMenu
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = RockText
					includeParentOwned = false
				}
			]
			name = alias_RockText
			visiblename = 'alias_RockText'
			help = 'StyleContainer -> Patch -> StyleMenu -> RockText'
		}
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 1
					validateLocalID = Patch
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = StyleMenu
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = MetalText
					includeParentOwned = false
				}
			]
			name = alias_MetalText
			visiblename = 'alias_MetalText'
			help = 'StyleContainer -> Patch -> StyleMenu -> MetalText'
		}
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 1
					validateLocalID = Patch
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = BluesHighlight
					includeParentOwned = false
				}
			]
			name = alias_BluesHighlight
			visiblename = 'alias_BluesHighlight'
			help = 'StyleContainer -> Patch -> BluesHighlight'
		}
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 1
					validateLocalID = Patch
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = RockHighlight
					includeParentOwned = false
				}
			]
			name = alias_RockHighlight
			visiblename = 'alias_RockHighlight'
			help = 'StyleContainer -> Patch -> RockHighlight'
		}
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 1
					validateLocalID = Patch
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = MetalHighlight
					includeParentOwned = false
				}
			]
			name = alias_MetalHighlight
			visiblename = 'alias_MetalHighlight'
			help = 'StyleContainer -> Patch -> MetalHighlight'
		}
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 1
					validateLocalID = Patch
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = StyleMenu
					includeParentOwned = false
				}
			]
			name = alias_StyleMenu
			visiblename = 'alias_StyleMenu'
			help = 'StyleContainer -> Patch -> StyleMenu'
		}
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 0
					validateLocalID = StatsMenuContainer
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = QuitHighlight
					includeParentOwned = false
				}
			]
			name = alias_QuitHighlight
			visiblename = 'alias_QuitHighlight'
			help = 'StyleContainer -> StatsMenuContainer -> QuitHighlight'
		}
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 0
					validateLocalID = StatsMenuContainer
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = QuitText
					includeParentOwned = false
				}
			]
			name = alias_QuitText
			visiblename = 'alias_QuitText'
			help = 'StyleContainer -> StatsMenuContainer -> QuitText'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 0
					validateLocalID = StatsMenuContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = StatsStyleSelect
					includeParentOwned = false
				}
			]
			name = StatsBG_alpha
			visiblename = 'StatsBG_alpha'
			help = 'StyleContainer -> StatsMenuContainer -> StatsStyleSelect => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 0
					validateLocalID = StatsMenuContainer
					includeParentOwned = false
				}
			]
			name = StatsMenuContainer_alpha
			visiblename = 'StatsMenuContainer_alpha'
			help = 'StyleContainer -> StatsMenuContainer => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = StyleContainer
				}
				{
					index = 1
					validateLocalID = Patch
					includeParentOwned = false
				}
			]
			name = Patch_pos
			visiblename = 'Patch_pos'
			help = 'StyleContainer -> Patch => pos'
			target = pos
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = StyleContainer
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (720.0, 480.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (636.666, 365.55548)
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
					local_id = StatsMenuContainer
					type = ContainerElement
					hiddenLocal = false
					alpha = 0.0
					dims = (100.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 40.0)
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
							texture = StatsStyleSelect
							local_id = StatsStyleSelect
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 512.0)
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
						}
					}
					{
						props = {
							local_id = QuitText
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 100.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (6.666626, 193.33334)
							z_priority = 4.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								0
								0
								0
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("Quit")
							font = fontgrid_title_a1
							material = 0x00000000
							single_line = false
							fit_width = wrap
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (1.0, 1.0)
							blend = blend
							font_spacing = -1
							override_color_tag_alpha = true
							override_color_tag_rgba = false
							use_shadow = false
							shadow_rgba = [
								0
								0
								0
								255
							]
							shadow_offs = (3.0, 3.0)
							line_spacing = 1.0
						}
					}
					{
						props = {
							blend = blend
							texture = Banner_Selected
							local_id = QuitHighlight
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (512.0, 128.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (11.110964, 173.33334)
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
							texture = Stats_BG
							local_id = Stats_BG
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1024.0, 512.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (35.0, -40.0)
							z_priority = 1.0
							scale = (1.3199999, 1.43)
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
					local_id = Patch
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
					pos = (0.0, 40.0)
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
							blend = blend
							texture = StyleSelect
							local_id = StyleBG
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (512.0, 512.0)
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
						}
					}
					{
						props = {
							local_id = StyleMenu
							type = MenuElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 200.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-92.22221, -27.777775)
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
							isVertical = true
							internal_just = [
								0.0
								-1.0
							]
							regular_space_amount = -1
							padding_scale = 1.0
							spacing_between = 11
							position_children = false
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = true
							allow_alternate_directional_events = false
						}
						children = [
							{
								props = {
									local_id = BluesText
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (300.0, 40.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (150.0, 20.0)
									z_priority = 3.0
									scale = (1.0, 1.0)
									rot_angle = 3.0
									rgba = [
										255
										255
										255
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("Blues")
									font = fontgrid_title_a1
									material = 0x00000000
									single_line = false
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										-1.0
									]
									internal_scale = (1.0, 1.0)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = false
									use_shadow = false
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (3.0, 3.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = RockText
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (300.0, 40.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (150.0, 69.0)
									z_priority = 3.0
									scale = (1.0, 1.0)
									rot_angle = -4.0
									rgba = [
										255
										255
										255
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("Rock")
									font = fontgrid_title_a1
									material = 0x00000000
									single_line = false
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										-1.0
									]
									internal_scale = (1.0, 1.0)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = false
									use_shadow = false
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (3.0, 3.0)
									line_spacing = 1.0
								}
							}
							{
								props = {
									local_id = MetalText
									type = TextBlockElement
									hiddenLocal = false
									alpha = 1.0
									dims = (300.0, 40.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										-1.0
										-1.0
									]
									pos = (150.0, 125.0)
									z_priority = 3.0
									scale = (1.0, 1.0)
									rot_angle = 2.0
									rgba = [
										255
										255
										255
										255
									]
									events_blocked = 0
									preserve_local_orientation = false
									text = qs("Metal")
									font = fontgrid_title_a1
									material = 0x00000000
									single_line = false
									fit_width = wrap
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										0.0
										-1.0
									]
									internal_scale = (1.0, 1.0)
									blend = blend
									font_spacing = -1
									override_color_tag_alpha = true
									override_color_tag_rgba = false
									use_shadow = false
									shadow_rgba = [
										0
										0
										0
										255
									]
									shadow_offs = (3.0, 3.0)
									line_spacing = 1.0
								}
							}
						]
					}
					{
						props = {
							blend = blend
							texture = BluesSelected
							local_id = BluesHighlight
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (512.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (131.1112, -51.111046)
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
							texture = RockSelected
							local_id = RockHighlight
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (512.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (91.111084, -2.2222292)
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
							texture = MetalSelected
							local_id = MetalHighlight
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (512.0, 64.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (111.111145, 55.555542)
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
				]
			}
		]
	}
}
uidesc_FreestyleStyleSelect_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
