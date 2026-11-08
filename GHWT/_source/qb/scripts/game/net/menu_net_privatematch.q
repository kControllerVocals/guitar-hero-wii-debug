
script create_select_private_match_menu \{menu_title = $wii_create_match
		menu_subtitle = $wii_who_play
		menu_id = create_private_match_menu
		vmenu_id = create_private_match_vmenu}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = online_menu_ui_container
		pos = (0.0, 0.0)}
	CreateScreenElement {
		type = VScrollingMenu
		parent = online_menu_ui_container
		id = <menu_id>
		just = [center top]
		dims = (256.0, 350.0)
		pos = (($online_general_menu_pos) + (0.0, 165.0))
		z_priority = 1
	}
	CreateScreenElement {
		type = VMenu
		parent = <menu_id>
		id = <vmenu_id>
		pos = ((128.0, 0.0))
		just = [center top]
		internal_just = [center center]
		dims = (256.0, 350.0)
		padding_scale = 1.5
		spacing_between = 24
		event_handlers = [
			{pad_back ui_flow_manager_respond_to_action params = {action = go_back}}
			{pad_back generic_menu_pad_back_sound}
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		exclusive_device = ($primary_controller)
	}
	create_menu_backdrop \{texture = xb_online_bg}
	displaySprite id = xb_online_frame_crown parent = online_menu_ui_container tex = xb_online_frame_crown pos = (($online_general_menu_pos) + (0.0, -48.0)) dims = (192.0, 96.0) just = [center top] z = 3
	displaySprite id = online_menu_box_top parent = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue) pos = ($online_general_menu_pos) dims = (288.0, 64.0) just = [center top] z = 2
	displaySprite id = online_menu_box_top_fill parent = online_menu_ui_container tex = window_fill_cap rgba = [0 0 0 200] pos = ($online_general_menu_pos) dims = (288.0, 64.0) just = [center top] z = 2
	displaySprite id = online_menu_box_body parent = online_menu_ui_container tex = window_frame_body_tall rgba = ($online_medium_blue) pos = (($online_general_menu_pos) + (0.0, 64.0)) dims = (288.0, 432.0) just = [center top] z = 2 flip_h
	displaySprite id = online_menu_box_body_fill parent = online_menu_ui_container tex = window_fill_body_large rgba = [0 0 0 200] pos = (($online_general_menu_pos) + (0.0, 64.0)) dims = (288.0, 432.0) just = [center top] z = 2 flip_h
	displaySprite id = online_menu_box_bottom parent = online_menu_ui_container tex = window_frame_cap rgba = ($online_medium_blue) pos = (($online_general_menu_pos) + (0.0, 496.0)) dims = (288.0, 64.0) just = [center top] z = 2 flip_h
	displaySprite id = online_menu_box_bottom_fill parent = online_menu_ui_container tex = window_fill_cap rgba = [0 0 0 200] pos = (($online_general_menu_pos) + (0.0, 496.0)) dims = (288.0, 64.0) just = [center top] z = 2 flip_h
	displaySprite id = online_title_bar parent = online_menu_ui_container tex = store_frame_bottom_bg rgba = ($online_light_blue) pos = (($online_general_menu_pos) + (0.0, 128.0)) dims = (288.0, 128.0) just = [center center] z = 3
	displaySprite id = online_highlight parent = online_menu_ui_container tex = white rgba = ($online_light_blue) pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (632.0, 0.0)) dims = (288.0, 40.0) just = [center top] z = 3
	displaySprite id = online_bookend1 parent = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (502.0, 20.0)) dims = (40.0, 35.0) just = [center center] z = 3
	displaySprite id = online_bookend2 parent = online_menu_ui_container tex = character_hub_hilite_bookend rgba = ($online_light_blue) pos = ((($online_general_menu_hi_lite_ypos [0]) * (0.0, 1.0)) + (774.0, 20.0)) dims = (40.0, 35.0) just = [center center] z = 3
	CreateScreenElement {
		type = TextElement
		parent = online_menu_ui_container
		font = fontgrid_text_a8
		scale = (0.65000004, 0.75)
		rgba = ($online_medium_blue)
		text = <menu_title>
		just = [center top]
		pos = (($online_general_menu_pos) + (-5.0, 32.0))
		z_priority = 3.0
	}
	fit_text_into_menu_item id = <id> max_width = 223
	CreateScreenElement {
		type = TextElement
		parent = online_menu_ui_container
		font = fontgrid_title_a1
		scale = (0.8, 0.75)
		rgba = ($online_dark_purple)
		text = <menu_subtitle>
		just = [center top]
		pos = (($online_general_menu_pos) + (0.0, 108.0))
		z_priority = 4.0
	}
	fit_text_into_menu_item id = <id> max_width = 223
	selectable_menu_items = 0
	GetNumFriends
	FormatText TextName = friend_disp_text qs(0x9206b733) a = ($wii_friends) b = <numFriendsOnline>
	if (<numFriendsOnline> > 0)
		CreateScreenElement {
			type = TextElement
			parent = <vmenu_id>
			font = fontgrid_title_a1
			scale = (0.65000004, 0.75)
			rgba = ($online_light_blue)
			text = <friend_disp_text>
			just = [left top]
			z_priority = 4.0
		}
	else
		CreateScreenElement {
			type = TextElement
			parent = <vmenu_id>
			font = fontgrid_title_gh3
			scale = (0.65000004, 0.75)
			rgba = ($online_grey)
			text = <friend_disp_text>
			block_events
			just = [left top]
			z_priority = 4.0
		}
	endif
	fit_text_into_menu_item id = <id> max_width = 223
	<id> :SetTags menu_item = <selectable_menu_items>
	<id> :SE_SetProps event_handlers = [
		{focus online_general_menu_focus params = {id = <id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_private_match params = {type = private ranked = NotRanked}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	CreateScreenElement {
		type = TextElement
		parent = <vmenu_id>
		font = fontgrid_title_a1
		scale = (0.65000004, 0.75)
		rgba = ($online_light_blue)
		text = $wii_strangers_ranked
		just = [left top]
		z_priority = 4.0
	}
	fit_text_into_menu_item id = <id> max_width = 223
	<id> :SetTags menu_item = <selectable_menu_items>
	<id> :SetProps event_handlers = [
		{focus online_general_menu_focus params = {id = <id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_strangers_match params = {ranked = ranked}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	CreateScreenElement {
		type = TextElement
		parent = <vmenu_id>
		scale = 0.75
		rgba = ($online_light_blue)
		text = $wii_strangers_unranked
		just = [left top]
		z_priority = 4.0
	}
	fit_text_into_menu_item id = <id> max_width = 223
	<id> :SetTags menu_item = <selectable_menu_items>
	<id> :SE_SetProps event_handlers = [
		{focus online_general_menu_focus params = {id = <id>}}
		{unfocus retail_menu_unfocus}
		{pad_choose select_strangers_match params = {ranked = NotRanked}}
	]
	<selectable_menu_items> = (<selectable_menu_items> + 1)
	set_online_menu_highlight_pos Menu_items = <selectable_menu_items>
	set_focus_color rgba = ($online_dark_purple)
	set_unfocus_color rgba = ($online_light_blue)
	set_user_control_color \{text_rgba = [
			200
			200
			200
			255
		]
		bg_rgba = [
			0
			0
			0
			200
		]}
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	LaunchEvent type = focus target = <vmenu_id>
endscript

script select_strangers_match 
	select_private_match <...> type = open
endscript

script destroy_select_private_match_menu 
	if ScreenElementExists \{id = online_menu_ui_container}
		DestroyScreenElement \{id = online_menu_ui_container}
	endif
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript

script select_private_match 
	change ranked_match = <ranked>
	if (<ranked> = ranked)
		change \{match_type = ranked}
	else
		change \{match_type = player}
	endif
	if (<type> = private)
		change \{who_can_join = friends}
		SetNetworkPreference {field = 'private_slots' string = ($num_private_slots [1].name) checksum = ($num_private_slots [1].checksum) num = 1}
	else
		change \{who_can_join = strangers}
		SetNetworkPreference {field = 'private_slots' string = ($num_private_slots [0].name) checksum = ($num_private_slots [0].checksum) num = 0}
	endif
	ui_flow_manager_respond_to_action \{action = continue}
endscript
