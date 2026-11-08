uidesc_band_play = {
	DescVersion = 12
	name = uidesc_band_play
	rect = [
		-104.00287
		0.0
		1483.5
		1180.0753
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = band_menu_container
				}
				{
					index = 0
					validateLocalID = HMenu
					includeParentOwned = false
				}
			]
			name = alias_hmenu
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = band_menu_container
				}
				{
					index = 1
					validateLocalID = online_ticker_window_element
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = online_ticker_vert_text
					includeParentOwned = false
				}
			]
			name = online_info_ticker_textelement_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = band_menu_container
				}
				{
					index = 1
					validateLocalID = online_ticker_window_element
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = online_ticker_vert_text
					includeParentOwned = false
				}
			]
			name = online_ticker_text_element_pos
			target = pos
			type = pair
		}
		{
			path = [
				{
					validateLocalID = band_menu_container
				}
				{
					index = 1
					validateLocalID = online_ticker_window_element
					includeParentOwned = false
				}
			]
			name = online_ticker_window_element_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = band_menu_container
				}
			]
			name = band_menu_container_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = band_menu_container
				}
				{
					index = 2
					validateLocalID = ticker
					includeParentOwned = false
				}
			]
			name = ticker_alpha
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = band_menu_container
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = HMenu
					type = MenuElement
					dims = (1200.0, 5.0)
					just = [
						0.0
						1.0
					]
					pos = (635.0, 650.0)
					z_priority = 1.0
					isVertical = false
					internal_just = [
						0.0
						1.0
					]
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
				children = [
					{
						props = {
							local_id = band_play_menu
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (260.0, 175.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (210.0, 5.0)
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
							desc = 'band_play_menu'
							autoSizeDims = false
							cash_milestone_texture = cash_milestone_icon_007
							instrument_texture = mixer_icon_drums
							leader_indicator_alpha = 0.0
							rank_number_text = qs("25")
							gamertag_text = qs("")
							name_text = qs("")
							instrument_alpha = 0.0
							cash_milestone_alpha = 0.0
							rank_number_alpha = 0.0
							player_pos = (0.0, 0.0)
							Menu_Player_bg_alpha = 0.8
							ready_banner_texture = ready_banner
							reposition_pos = (0.0, 0.0)
							ready_banner_pos = (0.0, 500.0)
							gamertag_dims = (248.0, 40.0)
							GamerTag_pos = (1.4649658, -19.846725)
							name_dims = (248.0, 39.0)
							name_pos = (0.0, 19.281372)
							ready_banner_scale = (1.5, 1.5)
						}
					}
					{
						props = {
							local_id = band_play_menu
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (260.0, 175.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (470.0, 5.0)
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
							desc = 'band_play_menu'
							autoSizeDims = false
							cash_milestone_texture = cash_milestone_icon_007
							instrument_texture = mixer_icon_drums
							leader_indicator_alpha = 0.0
							rank_number_text = qs("25")
							gamertag_text = qs("")
							name_text = qs("")
							instrument_alpha = 0.0
							cash_milestone_alpha = 0.0
							rank_number_alpha = 0.0
							player_pos = (0.0, 0.0)
							Menu_Player_bg_alpha = 0.8
							ready_banner_texture = ready_banner
							reposition_pos = (0.0, 0.0)
							ready_banner_pos = (0.0, 500.0)
							gamertag_dims = (248.0, 40.0)
							GamerTag_pos = (1.4649658, -19.846725)
							name_dims = (248.0, 39.0)
							name_pos = (0.0, 19.281372)
							ready_banner_scale = (1.5, 1.5)
						}
					}
					{
						props = {
							local_id = band_play_menu
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (260.0, 175.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (730.0, 5.0)
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
							desc = 'band_play_menu'
							autoSizeDims = false
							cash_milestone_texture = cash_milestone_icon_007
							instrument_texture = mixer_icon_drums
							leader_indicator_alpha = 0.0
							rank_number_text = qs("25")
							gamertag_text = qs("")
							name_text = qs("")
							instrument_alpha = 0.0
							cash_milestone_alpha = 0.0
							rank_number_alpha = 0.0
							player_pos = (0.0, 0.0)
							Menu_Player_bg_alpha = 0.8
							ready_banner_texture = ready_banner
							reposition_pos = (0.0, 0.0)
							ready_banner_pos = (0.0, 500.0)
							gamertag_dims = (248.0, 40.0)
							GamerTag_pos = (1.4649658, -19.846725)
							name_dims = (248.0, 39.0)
							name_pos = (0.0, 19.281372)
							ready_banner_scale = (1.5, 1.5)
						}
					}
					{
						props = {
							local_id = band_play_menu
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (260.0, 175.0)
							just = [
								0.0
								1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (990.0, 5.0)
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
							desc = 'band_play_menu'
							autoSizeDims = false
							cash_milestone_texture = cash_milestone_icon_007
							instrument_texture = mixer_icon_drums
							leader_indicator_alpha = 0.0
							rank_number_text = qs("25")
							gamertag_text = qs("")
							name_text = qs("")
							instrument_alpha = 0.0
							cash_milestone_alpha = 0.0
							rank_number_alpha = 0.0
							player_pos = (0.0, 0.0)
							Menu_Player_bg_alpha = 0.8
							ready_banner_texture = ready_banner
							reposition_pos = (0.0, 0.0)
							ready_banner_pos = (0.0, 500.0)
							gamertag_dims = (248.0, 40.0)
							GamerTag_pos = (1.4649658, -19.846725)
							name_dims = (248.0, 39.0)
							name_pos = (0.0, 19.281372)
							ready_banner_scale = (1.5, 1.5)
						}
					}
				]
			}
			{
				props = {
					local_id = online_ticker_window_element
					type = WindowElement
					hiddenLocal = false
					alpha = 0.0
					dims = (1280.0, 60.0)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (-1.536011, 260.0904)
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
							local_id = online_ticker_vert_text
							type = TextBlockElement
							dims = (1000.0, 65.0)
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (0.0, 75.0)
							z_priority = 3.0
							rgba = [
								200
								200
								200
								255
							]
							text = qs("Ticker info should go here")
							font = fontgrid_title_a1
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = online_ticker_horiz_text
							type = TextBlockElement
							dims = (1280.0, 366.0)
							pos_anchor = [
								0.0
								-1.0
							]
							pos = (0.0, 180.0)
							z_priority = 3.0
							rgba = [
								200
								200
								200
								255
							]
							text = qs("")
							font = fontgrid_title_a1
							fit_width = wrap
							fit_height = `expand dims`
							scale_mode = proportional
							text_case = Original
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							texture = 0x00000000
							local_id = online_ticker_background
							type = SpriteElement
							hiddenLocal = true
							alpha = 0.5
							dims = (1280.0, 40.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 0.0)
							z_priority = 2.0
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
					local_id = ticker
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (100.0, 32.183567)
					z_priority = 2.0
				}
				children = [
					{
						props = {
							texture = scrolling_bar_bg
							local_id = scrollbar_bg
							type = SpriteElement
							alpha = 0.5
							dims = (1290.0, 90.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-102.25287, -104.25299)
							z_priority = 1.0
							scale = (1.15, 1.15)
						}
					}
				]
			}
		]
	}
}
uidesc_band_play_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
