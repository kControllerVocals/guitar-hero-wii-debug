uidesc_DLC_Second_Menu = {
	DescVersion = 14
	name = uidesc_DLC_Second_Menu
	rect = [
		0.0
		-49.0
		765.0
		451.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = DLC_Second_Menu
				}
				{
					index = 2
					validateLocalID = Menu_Container
					includeParentOwned = false
				}
			]
			name = alias_Menu_Container
			visiblename = 'alias_Menu_Container'
			help = 'DLC_Second_Menu -> Menu_Container'
		}
		{
			path = [
				{
					validateLocalID = DLC_Second_Menu
				}
				{
					index = 2
					validateLocalID = Menu_Container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = SelectionHighlight
					includeParentOwned = false
				}
			]
			name = alias_SelectionHighlight
			visiblename = 'alias_SelectionHighlight'
			help = 'DLC_Second_Menu -> Menu_Container -> SelectionHighlight'
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = DLC_Second_Menu
				}
				{
					index = 0
					validateLocalID = SongInfoContainer
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = SongInfoLeft
					includeParentOwned = false
				}
			]
			name = SongInfoLeft_text
			visiblename = 'SongInfoLeft_text'
			help = 'DLC_Second_Menu -> SongInfoContainer -> SongInfoLeft => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Second_Menu
				}
				{
					index = 0
					validateLocalID = SongInfoContainer
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = SongInfoRight
					includeParentOwned = false
				}
			]
			name = SongInfoRight_text
			visiblename = 'SongInfoRight_text'
			help = 'DLC_Second_Menu -> SongInfoContainer -> SongInfoRight => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Second_Menu
				}
				{
					index = 1
					validateLocalID = Photo_Caption_Container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = SongInfoName
					includeParentOwned = false
				}
			]
			name = SongInfoName_text
			visiblename = 'SongInfoName_text'
			help = 'DLC_Second_Menu -> Photo_Caption_Container -> SongInfoName => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Second_Menu
				}
				{
					index = 1
					validateLocalID = Photo_Caption_Container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = SongInfoArtist
					includeParentOwned = false
				}
			]
			name = SongInfoArtist_text
			visiblename = 'SongInfoArtist_text'
			help = 'DLC_Second_Menu -> Photo_Caption_Container -> SongInfoArtist => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Second_Menu
				}
				{
					index = 3
					validateLocalID = SortInfoContainer
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = SortText
					includeParentOwned = false
				}
			]
			name = SortText_text
			visiblename = 'SortText_text'
			help = 'DLC_Second_Menu -> SortInfoContainer -> SortText => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Second_Menu
				}
				{
					index = 0
					validateLocalID = SongInfoContainer
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = GenreInfo
					includeParentOwned = false
				}
			]
			name = GenreInfo_text
			visiblename = 'GenreInfo_text'
			help = 'DLC_Second_Menu -> SongInfoContainer -> GenreInfo => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Second_Menu
				}
				{
					index = 0
					validateLocalID = SongInfoContainer
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = GenreHeader
					includeParentOwned = false
				}
			]
			name = GenreHeader_text
			visiblename = 'GenreHeader_text'
			help = 'DLC_Second_Menu -> SongInfoContainer -> GenreHeader => text'
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = DLC_Second_Menu
				}
				{
					index = 1
					validateLocalID = Photo_Caption_Container
					includeParentOwned = false
				}
			]
			name = Photo_Caption_Container_alpha
			visiblename = 'Photo_Caption_Container_alpha'
			help = 'DLC_Second_Menu -> Photo_Caption_Container => alpha'
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = DLC_Second_Menu
				}
				{
					index = 0
					validateLocalID = SongInfoContainer
					includeParentOwned = false
				}
			]
			name = SongInfoContainer_alpha
			visiblename = 'SongInfoContainer_alpha'
			help = 'DLC_Second_Menu -> SongInfoContainer => alpha'
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = DLC_Second_Menu
			type = ContainerElement
			hiddenLocal = false
			alpha = 1.0
			dims = (510.0, 402.0)
			just = [
				-1.0
				-1.0
			]
			pos_anchor = [
				-1.0
				-1.0
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
		children = [
			{
				props = {
					local_id = SongInfoContainer
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (200.0, 140.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (565.0, 250.0)
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
							local_id = SongInfoLeft
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (110.0, 70.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (5.0, 60.0)
							z_priority = 3.0
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
							text = qs(0xbd1aae8f)
							font = fontgrid_title_a1
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
							internal_scale = (0.45000002, 0.45000002)
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
							local_id = SongInfoRight
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (75.0, 70.0)
							just = [
								1.0
								-1.0
							]
							pos_anchor = [
								1.0
								-1.0
							]
							pos = (0.0, 60.0)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								224
								224
								224
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0x101e2e5f)
							font = fontgrid_title_a1
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
							internal_scale = (0.45000002, 0.45000002)
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
							local_id = GenreHeader
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (190.0, 30.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (5.0, 0.0)
							z_priority = 3.0
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
							text = qs("Genre")
							font = fontgrid_title_a1
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
							internal_scale = (0.45000002, 0.5)
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
							local_id = GenreInfo
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (190.0, 25.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (5.0, 25.0)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								224
								224
								224
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs("")
							font = fontgrid_title_a1
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
							internal_scale = (0.45000002, 0.5)
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
							texture = DLC_WhiteBox
							local_id = DLC_WhiteBox
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.3
							dims = (190.0, 2.0)
							just = [
								0.0
								0.0
							]
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -13.0)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								192
								192
								192
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
					local_id = Photo_Caption_Container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (200.0, 100.0)
					just = [
						0.0
						0.0
					]
					pos_anchor = [
						0.0
						0.0
					]
					pos = (379.9998, -31.124176)
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
				children = [
					{
						props = {
							local_id = SongInfoName
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (200.0, 30.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 0.0)
							z_priority = 3.0
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
					{
						props = {
							local_id = SongInfoArtist
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (200.0, 30.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (0.0, 25.0)
							z_priority = 3.0
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
					local_id = Menu_Container
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (490.0, 370.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (0.0, 16.0)
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
				children = [
					{
						props = {
							blend = blend
							texture = DLC_Selection_Highlight
							local_id = SelectionHighlight
							type = SpriteElement
							hiddenLocal = false
							alpha = 0.0
							dims = (490.0, 64.0)
							just = [
								-1.0
								0.0
							]
							pos_anchor = [
								-1.0
								0.0
							]
							pos = (0.0, 0.0)
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
			{
				props = {
					local_id = SortInfoContainer
					type = ContainerElement
					hiddenLocal = false
					alpha = 1.0
					dims = (200.0, 60.0)
					just = [
						-1.0
						0.0
					]
					pos_anchor = [
						-1.0
						0.0
					]
					pos = (276.4094, -220.0)
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
				children = [
					{
						props = {
							local_id = SortButton
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (50.0, 60.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (5.0, 2.0)
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
							text = qs(0x80dbe3e8)
							font = fontgrid_text_a3
							material = 0x00000000
							single_line = false
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								1.0
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
							local_id = SortText
							type = TextBlockElement
							hiddenLocal = false
							alpha = 1.0
							dims = (150.0, 60.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (60.0, 0.0)
							z_priority = 3.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								180
								180
								180
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							text = qs(0xc34f22b5)
							font = fontgrid_text_a6
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
							internal_scale = (0.4, 0.4)
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
		]
	}
}
uidesc_DLC_Second_Menu_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
