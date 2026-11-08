uidesc_DLC_Base_Menu = {
	DescVersion = 24
	name = uidesc_DLC_Base_Menu
	rect = [
		-2.0972898
		0.0
		1282.0973
		720.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = DLC_Menu_Parent
				}
				{
					index = 0
					validateLocalID = BaseElements
					includeParentOwned = false
				}
				{
					index = 4
					validateLocalID = Patches
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = PatchSplat
					includeParentOwned = false
				}
			]
			name = alias_PatchSplat
			visiblename = 'alias_PatchSplat'
			help = 'DLC_Menu_Parent -> BaseElements -> Patches -> PatchSplat'
		}
		{
			path = [
				{
					validateLocalID = DLC_Menu_Parent
				}
				{
					index = 1
					validateLocalID = SubMenuDesc
					includeParentOwned = false
				}
			]
			name = alias_SubMenuDesc
			visiblename = 'alias_SubMenuDesc'
			help = 'DLC_Menu_Parent -> SubMenuDesc'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = DLC_Menu_Parent
				}
				{
					index = 0
					validateLocalID = BaseElements
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = UserName
					includeParentOwned = false
				}
			]
			name = UserName_text
			visiblename = 'UserName_text'
			help = 'DLC_Menu_Parent -> BaseElements -> UserName => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Menu_Parent
				}
				{
					index = 0
					validateLocalID = BaseElements
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = AlbumCover
					includeParentOwned = false
				}
			]
			name = AlbumCover_texture
			visiblename = 'AlbumCover_texture'
			help = 'DLC_Menu_Parent -> BaseElements -> AlbumCover => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = DLC_Menu_Parent
				}
				{
					index = 0
					validateLocalID = BaseElements
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = musicstore
					includeParentOwned = false
				}
			]
			name = MusicStore_text
			visiblename = 'MusicStore_text'
			help = 'DLC_Menu_Parent -> BaseElements -> MusicStore => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Menu_Parent
				}
				{
					index = 0
					validateLocalID = BaseElements
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = AvailableText
					includeParentOwned = false
				}
			]
			name = AvailableText_text
			visiblename = 'AvailableText_text'
			help = 'DLC_Menu_Parent -> BaseElements -> AvailableText => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Menu_Parent
				}
				{
					index = 0
					validateLocalID = BaseElements
					includeParentOwned = false
				}
				{
					index = 5
					validateLocalID = AvailableLabel
					includeParentOwned = false
				}
			]
			name = AvailableLabel_text
			visiblename = 'AvailableLabel_text'
			help = 'DLC_Menu_Parent -> BaseElements -> AvailableLabel => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Menu_Parent
				}
				{
					index = 0
					validateLocalID = BaseElements
					includeParentOwned = false
				}
				{
					index = 6
					validateLocalID = Notebook_BG
					includeParentOwned = false
				}
			]
			name = Notebook_BG_texture
			visiblename = 'Notebook_BG_texture'
			help = 'DLC_Menu_Parent -> BaseElements -> Notebook_BG => texture'
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = DLC_Menu_Parent
				}
				{
					index = 0
					validateLocalID = BaseElements
					includeParentOwned = false
				}
				{
					index = 8
					validateLocalID = SubMenu_Label
					includeParentOwned = false
				}
			]
			name = SubMenu_Label_text
			visiblename = 'SubMenu_Label_text'
			help = 'DLC_Menu_Parent -> BaseElements -> SubMenu_Label => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Menu_Parent
				}
				{
					index = 0
					validateLocalID = BaseElements
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = AvailableText
					includeParentOwned = false
				}
			]
			name = AvailableText_rgba
			visiblename = 'AvailableText_rgba'
			help = 'DLC_Menu_Parent -> BaseElements -> AvailableText => rgba'
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = DLC_Menu_Parent
				}
				{
					index = 0
					validateLocalID = BaseElements
					includeParentOwned = false
				}
				{
					index = 7
					validateLocalID = AvailableText
					includeParentOwned = false
				}
			]
			name = AvailableText_scale
			visiblename = 'AvailableText_scale'
			help = 'DLC_Menu_Parent -> BaseElements -> AvailableText => scale'
			target = scale
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = DLC_Menu_Parent
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (1024.0, 720.0)
			just = [
				0.0
				0.0
			]
			pos_anchor = [
				-1.0
				-1.0
			]
			pos = (640.0, 360.0)
			z_priority = 0.0
			scale = (1.25, 1.0)
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
					local_id = BaseElements
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (640.0, 480.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (-1.6778321, 0.0)
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
							texture = DLC_Generic_Album
							local_id = AlbumCover
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (192.0, 204.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (371.0, -148.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 4.5
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
							local_id = musicstore
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (200.0, 36.0)
							just = [
								1.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (309.0, -157.4126)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								149
								33
								33
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("MUSIC STORE")
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								1.0
								0.0
							]
							internal_scale = (0.6, 0.45000002)
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
							texture = DLC_Full_BG
							local_id = background
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (1024.0, 720.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (192.0, 120.0)
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
							local_id = UserName
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (170.00002, 26.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (784.1017, 77.0)
							z_priority = 5.0
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
							text = qs("")
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (0.5, 0.5)
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
							local_id = Patches
							type = ContainerElement
							hiddenLocal = false
							alpha = 1.0
							dims = (300.0, 128.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (120.128395, 48.0)
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
									texture = DLC_Patch_New
									local_id = NewReleasesPatch
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (80.0, 85.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (-86.0, 0.0)
									z_priority = 4.0
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
									texture = DLC_Patch_Store
									local_id = StorePatch
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (82.0, 87.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (1.0, 4.5)
									z_priority = 4.0
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
									texture = DLC_Patch_Purchased
									local_id = SetListPatch
									type = SpriteElement
									hiddenLocal = false
									alpha = 1.0
									dims = (78.0, 82.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (91.0, 0.0)
									z_priority = 4.0
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
									texture = DLC_Splat
									local_id = PatchSplat
									type = SpriteElement
									hiddenLocal = false
									alpha = 0.0
									dims = (128.0, 128.0)
									just = [
										0.0
										0.0
									]
									pos_anchor = [
										0.0
										0.0
									]
									pos = (85.00001, 0.0)
									z_priority = 3.5
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
					{
						props = {
							local_id = AvailableLabel
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (121.0, 36.0)
							just = [
								1.0
								-1.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (235.0, -125.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								126
								0
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0xd73794fb)
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								1.0
								0.0
							]
							internal_scale = (0.5, 0.45000002)
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
							texture = DLC_Notebook_BG_Main
							local_id = Notebook_BG
							type = SpriteElement
							hiddenLocal = false
							alpha = 1.0
							dims = (510.0, 402.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (68.00001, 147.0)
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
							local_id = AvailableText
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (70.0, 36.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								0.0
							]
							pos = (559.0, -107.0)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								126
								0
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("0")
							font = fontgrid_text_a8
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.5, 0.45000002)
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
							local_id = SubMenu_Label
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (400.0, 25.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								0.0
							]
							pos = (140.8842, -67.915985)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								149
								33
								33
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("")
							font = fontgrid_text_a6
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale to fit`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							internal_scale = (0.3, 0.45000002)
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
					local_id = SubMenuDesc
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (765.0, 451.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (133.0, 186.0)
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
					desc = 'DLC_First_Menu'
					autoSizeDims = false
					MOTD_Header_text = qs("Message of the Day")
					MOTD_Message_text = qs(0x1be9b734)
					License_Message_text = qs(0xfcc7d7f7)
					SetList_Label_text = qs(0x16e58719)
					Store_Label_text = qs("STORE")
					NewReleases_Label_text = qs(0x65413caf)
				}
			}
		]
	}
}
uidesc_DLC_Base_Menu_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
