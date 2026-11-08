popup_focus_color = [
	210
	210
	210
	250
]
popup_unfocus_color = [
	210
	130
	0
	250
]
popup_previous_menu = vmenu_main_menu
phrase_index = 0
phrase_array_size = 0
generic_down_arrow_enabled = 1
generic_up_arrow_enabled = 1

script assign_alias_for_generic_popup 
	AssignAlias id = <focus_item> alias = current_menu
endscript
generic_popup_open = 0
generic_popup_loading_window_open = 0

script is_generic_popup_open 
	return \{open = $generic_popup_open}
endscript

script popup_menu_focus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			SetScreenElementProps id = <id> rgba = ($popup_focus_color)
		endif
	else
		Obj_GetID
		<id> = <ObjID>
		if GotParam \{ObjID}
			SetScreenElementProps id = <id> rgba = ($popup_focus_color)
		endif
	endif
endscript

script popup_menu_unfocus 
	if GotParam \{id}
		if ScreenElementExists id = <id>
			SetScreenElementProps id = <id> rgba = ($popup_unfocus_color)
		endif
	else
		Obj_GetID
		<id> = <ObjID>
		if GotParam \{ObjID}
			SetScreenElementProps id = <id> rgba = ($popup_unfocus_color)
		endif
	endif
endscript
popup_priority = 11

script popup_get_pad_choose_event 
	GetArraySize <event_handlers>
	<i> = (<array_size> -1)
	begin
	SplitEventHandlerStruct struct = (<event_handlers> [<i>])
	if (<event> = pad_choose)
		return func = <func> func_params = <params> true
	endif
	<i> = (<i> - 1)
	repeat <array_size>
	return \{false}
endscript

script create_generic_popup \{text_font = fontgrid_text_a8
		menu_font = fontgrid_text_a6
		z = 300
		font_scale = 0.75
		message_scale = 0.75}
	if GotParam \{ok_menu}
		if popup_get_pad_choose_event event_handlers = <ok_eventhandlers>
			options = [
				{
					func = <func>
					func_params = <func_params>
					text = $wii_ok
				}
			]
		endif
		<focus_child> = 0
	elseif GotParam \{yes_no_menu}
		if popup_get_pad_choose_event event_handlers = <yes_eventhandlers>
			yes_func = <func>
			yes_params = <func_params>
		endif
		if popup_get_pad_choose_event event_handlers = <no_eventhandlers>
			no_func = <func>
			no_params = <func_params>
		endif
		if ((GotParam yes_func) && (GotParam no_func))
			options = [
				{
					func = <yes_func>
					func_params = <yes_params>
					text = $wii_yes
				}
				{
					func = <no_func>
					func_params = <no_params>
					text = $wii_no
				}
			]
		endif
		<focus_child> = 0
		if GotParam \{focus_no}
			<focus_child> = 1
		endif
	elseif GotParam \{option_menu}
		options = []
		<i> = 1
		begin
		FormatText checksumname = option_struct_chksum 'option%d' d = <i>
		<option_struct> = ((<...>).<option_struct_chksum>)
		if popup_get_pad_choose_event event_handlers = (<option_struct>.eventhandlers)
			<new_struct> = {
				func = <func>
				func_params = <func_params>
				text = (<option_struct>.title)
			}
			AddArrayElement array = <options> element = <new_struct>
			<options> = <array>
		endif
		<i> = (<i> + 1)
		repeat <option_menu>
		<focus_child> = 0
		if GotParam \{focus_option}
			<focus_child> = (<focus_option> - 1)
		endif
	elseif GotParam \{loading_window}
		<options> = []
		if GotParam \{can_cancel}
			if popup_get_pad_choose_event event_handlers = <cancel_eventhandlers>
				<options> = [
					{
						func = <func>
						func_params = <func_params>
						text = $wii_cancel
					}
				]
			endif
		endif
		<type> = loading_window
	endif
	if GotParam \{options}
		if GotParam \{default_blackout}
			full_blackout = 0.65000004
		elseif NOT GotParam \{full_blackout}
			full_blackout = 0
		endif
		create_new_generic_popup {
			options = <options>
			title = <title>
			text = <message>
			priority = <priority>
			focus_index = <focus_child>
			popup_type = <type>
			wait_variable = <wait_variable>
			full_blackout = <full_blackout>
			back_script = <back_script>
			back_params = <back_params>
		}
		return
	endif
	dont_swap_colors = 0
	if (($generic_popup_open) = 1)
		if GotParam \{priority}
			if (($popup_priority) <= <priority>)
				printf \{qs(0x3dca86a9)}
				return
			else
				<dont_swap_colors> = 1
				kill_generic_popup_early
				change popup_priority = <priority>
			endif
		else
			printf \{qs(0x3dca86a9)}
			return
		endif
	endif
	if GotParam \{priority}
		change popup_priority = <priority>
	endif
	if GotParam \{loading_window}
		if GotParam \{wait_variable}
			if ($<wait_variable> = 1)
				return
			endif
		endif
	endif
	printf \{qs(0xe945744d)}
	scale_1 = ((1.5, 0.0) + (0.0, 1.4))
	scale_2 = ((1.4, 0.0) + (0.0, 1.4))
	scale_3 = ((1.4, 0.0) + (0.0, 1.3499999))
	scale_4 = ((1.575, 0.0) + (0.0, 1.5))
	scale_5 = ((1.5, 0.0) + (0.0, 1.4))
	menu_pos = (574.0, 394.0)
	<dialog> = 0
	generic_popup_z = <z>
	menu_font = <font>
	text_font = <message_font>
	if GotParam \{option_menu}
		if (<option_menu> = 1)
			<menu_pos> = (574.0, 414.0)
		elseif (<option_menu> = 2)
			<menu_pos> = (574.0, 414.0)
		elseif (<option_menu> = 3)
			<menu_pos> = (574.0, 394.0)
		else
			<menu_pos> = (574.0, 374.0)
		endif
		<dialog> = 1
		printf qs(0x8e80bff9) a = <option_menu>
	endif
	if GotParam \{ok_menu}
		<menu_pos> = (574.0, 404.0)
		<dialog> = 1
	endif
	if GotParam \{yes_no_menu}
		<menu_pos> = (574.0, 400.0)
		<dialog> = 1
	endif
	if GotParam \{phrase_window}
		<menu_pos> = (415.0, 250.0)
	endif
	if GotParam \{loading_window}
		<menu_pos> = (574.0, 404.0)
		if GotParam \{can_cancel}
			<dialog> = 1
		endif
	endif
	if (<dont_swap_colors> = 0)
		popup_old_focus_color = ($menu_unfocus_color)
		popup_old_unfocus_color = ($menu_focus_color)
		change menu_focus_color = <popup_old_focus_color>
		change menu_unfocus_color = <popup_old_unfocus_color>
	endif
	change \{popup_focus_color = [
			180
			50
			50
			255
		]}
	change \{popup_unfocus_color = [
			50
			50
			150
			255
		]}
	if GotParam \{phrase_window}
		change \{popup_focus_color = [
				223
				223
				223
				255
			]}
		change \{popup_unfocus_color = [
				128
				128
				128
				255
			]}
	endif
	text_scale = <font_scale>
	offwhite = [223 223 223 255]
	if GotParam \{phrase_window}
		generic_popup_event_handlers = [
			{pad_up scroll_phrase_window params = {dir = up}}
			{pad_down scroll_phrase_window params = {dir = down}}
		]
	else
		if NOT ((GotParam ok_menu) || (GotParam loading_window) || (GotParam blank_menu))
			if GotParam \{option_menu}
				if (<option_menu> > 1)
					generic_popup_event_handlers = [
						{pad_up generic_menu_up_or_down_sound params = {up}}
						{pad_down generic_menu_up_or_down_sound params = {down}}
					]
				endif
			else
				generic_popup_event_handlers = [
					{pad_up generic_menu_up_or_down_sound params = {up}}
					{pad_down generic_menu_up_or_down_sound params = {down}}
				]
			endif
		endif
	endif
	if GotParam \{back_script}
		back_handler = {pad_back <back_script>}
		if NOT GotParam \{generic_popup_event_handlers}
			<generic_popup_event_handlers> = []
		endif
		AddArrayElement array = (<generic_popup_event_handlers>) element = (<back_handler>)
		<generic_popup_event_handlers> = (<array>)
	endif
	if NOT GotParam \{purchase_confirm}
		CreateScreenElement \{type = ContainerElement
			parent = root_window
			id = generic_popup_container
			pos = (0.0, 0.0)
			internal_just = [
				center
				center
			]}
	else
		CreateScreenElement {
			type = ContainerElement
			parent = root_window
			id = generic_popup_container
			pos = ($PC_PopupPos)
			internal_just = [center center]
			scale = ($PC_PopupScale)
		}
	endif
	if GotParam \{default_blackout}
		full_blackout = 0.65000004
	endif
	if GotParam \{full_blackout}
		CreateScreenElement {
			type = SpriteElement
			parent = generic_popup_container
			texture = black
			rgba = [0 0 0 255]
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [center center]
			z_priority = (<generic_popup_z> - 2)
			alpha = <full_blackout>
		}
	endif
	<center_pos> = (640.0, 360.0)
	CreateScreenElement {
		type = SpriteElement
		parent = generic_popup_container
		texture = dialog_bg
		rgba = [255 255 255 255]
		pos = (640.0, 320.0)
		scale = 1.25
		just = [center center]
		z_priority = <generic_popup_z>
	}
	if GotParam \{title}
		popup_title_off = (645.0, 60.0)
		if German
			CreateScreenElement {
				type = TextElement
				parent = generic_popup_container
				font = <menu_font>
				text = <title>
				just = [center top]
				pos = {<popup_title_off> relative}
				rgba = [223 223 223 250]
				scale = (1.0, 1.15)
				z_priority = (<generic_popup_z> + 2.2)
				shadow
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
			}
		else
			CreateScreenElement {
				type = TextElement
				parent = generic_popup_container
				font = <menu_font>
				text = <title>
				just = [center top]
				pos = {<popup_title_off> relative}
				rgba = [223 223 223 250]
				scale = (1.2, 1.3499999)
				z_priority = (<generic_popup_z> + 2.2)
			}
		endif
	endif
	if GotParam \{purchase_confirm}
		if GotParam \{long_text}
			OSPrintf \{qs(0x19154f67)}
			<pos_y> = 202
			<dims_x> = 606
		else
			<pos_y> = 220
			<dims_x> = 600
		endif
		message_block_left_pos = ((($PC_X_LPos) * (1.0, 0.0)) + (<pos_y> * (0.0, 1.0)))
		message_block_right_pos = ((($PC_X_RPos) * (1.0, 0.0)) + (<pos_y> * (0.0, 1.0)))
		message_block_left_dims = ((($PC_X_LDim) * (1.0, 0.0)) + (340 * (0.0, 1.0)))
		message_block_right_dims = ((($PC_X_RDim) * (1.0, 0.0)) + (340 * (0.0, 1.0)))
		CreateScreenElement {
			type = TextBlockElement
			id = message_block_left
			text = <message_left>
			scale = ($PC_Mess_Scale)
			parent = generic_popup_container
			font = <text_font>
			rgba = [210 130 0 250]
			pos = <message_block_left_pos>
			dims = <message_block_left_dims>
			just = [left top]
			internal_just = ($PC_Left_Just)
			z_priority = (<generic_popup_z> + 2.2)
		}
		CreateScreenElement {
			type = TextBlockElement
			id = message_block_right
			text = <message_right>
			scale = ($PC_Mess_Scale)
			parent = generic_popup_container
			font = <text_font>
			rgba = [210 130 0 250]
			pos = <message_block_right_pos>
			dims = <message_block_right_dims>
			just = [left top]
			internal_just = ($PC_Right_Just)
			z_priority = (<generic_popup_z> + 2.2)
		}
	elseif GotParam \{message}
		printf qs(0x1fa2e924) a = <message>
		if GotParam \{long_text}
			OSPrintf \{qs(0x19154f67)}
			message_block_pos = (410.0, 180.0)
			message_block_dims = (606.0, 362.0)
		else
			message_block_pos = (410.0, 220.0)
			message_block_dims = (600.0, 300.0)
		endif
		CreateScreenElement {
			type = TextBlockElement
			id = message_block
			text = <message>
			scale = <message_scale>
			parent = generic_popup_container
			font = <text_font>
			rgba = [210 130 0 250]
			pos = <message_block_pos>
			dims = <message_block_dims>
			just = [left top]
			z_priority = (<generic_popup_z> + 2.2)
		}
	endif
	if GotParam \{progress_bar}
		CreateScreenElement {
			type = SpriteElement
			id = progress_bar
			parent = generic_popup_container
			tex = white
			rgba = [210 210 0 250]
			pos = (490.0, 300.0)
			dims = (0.0, 50.0)
			just = [left top]
			z_priority = (<generic_popup_z> + 2.3)
		}
	endif
	generic_popup_menu_z = (<generic_popup_z> + 5)
	if GotParam \{phrase_window}
	elseif GotParam \{blank_menu}
	elseif GotParam \{loading_window}
		if GotParam \{can_cancel}
		endif
	else
	endif
	CreateScreenElement {
		type = VScrollingMenu
		parent = root_window
		id = scrolling_generic_popup_menu
		dims = (400.0, 480.0)
		just = [left top]
		pos = <menu_pos>
		z_priority = <generic_popup_menu_z>
	}
	CreateScreenElement {
		type = VMenu
		parent = scrolling_generic_popup_menu
		id = vmenu_generic_popup_menu
		pos = (0.0, 0.0)
		just = [center center]
		internal_just = [center center]
		event_handlers = <generic_popup_event_handlers>
	}
	if GotParam \{phrase_window}
		SetScreenElementProps \{id = scrolling_generic_popup_menu
			dims = (600.0, 300.0)}
		SetScreenElementProps \{id = vmenu_generic_popup_menu
			dont_allow_wrap}
	endif
	if GotParam \{loading_window}
		<largest_width> = 0
		GetScreenElementChildren \{id = message_block}
		GetArraySize <children>
		<i> = 0
		begin
		GetScreenElementDims id = (<children> [<i>])
		if (<largest_width> < <width>)
			<largest_width> = <width>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		GetScreenElementProps \{id = message_block}
		<starting_pos> = <pos>
		<adjust_width> = ((600 - <largest_width>) / 2.0 - 40)
		<ending_pos> = (<starting_pos> + (<adjust_width> * (1.0, 0.0)))
		SetScreenElementProps id = message_block internal_just = [left center] pos = <ending_pos>
	endif
	if GotParam \{loading_window}
		if GotParam \{can_cancel}
			CreateScreenElement {
				type = TextElement
				parent = vmenu_generic_popup_menu
				font = <menu_font>
				scale = 1.5
				rgba = ($popup_unfocus_color)
				text = $wii_cancel
				just = [center top]
				event_handlers = <cancel_eventhandlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
			displaySprite parent = generic_popup_container tex = dialog_menu_bg pos = (480.0, 450.0) scale = (2.5, 2.5) z = <generic_popup_menu_z>
			displaySprite parent = generic_popup_container tex = dialog_menu_bg flip_h pos = (480.0, 530.0) scale = (2.5, 2.5) z = <generic_popup_menu_z>
		endif
	elseif GotParam \{ok_menu}
		add_default_popup_handlers event_handlers = <ok_eventhandlers>
		CreateScreenElement {
			type = TextElement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			scale = 1.5
			rgba = ($popup_unfocus_color)
			text = $wii_ok
			just = [center top]
			event_handlers = <processed_handlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
	elseif GotParam \{yes_no_menu}
		add_default_popup_handlers event_handlers = <yes_eventhandlers>
		CreateScreenElement {
			type = TextElement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			id = yes_option
			scale = 1.0
			rgba = ($popup_unfocus_color)
			text = $wii_yes
			just = [center top]
			event_handlers = <processed_handlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
		add_default_popup_handlers event_handlers = <no_eventhandlers>
		CreateScreenElement {
			type = TextElement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			id = no_option
			scale = 1.0
			rgba = ($popup_unfocus_color)
			text = $wii_no
			just = [center top]
			event_handlers = <processed_handlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
	elseif GotParam \{option_menu}
		add_default_popup_handlers event_handlers = (<option1>.eventhandlers)
		CreateScreenElement {
			type = TextElement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			id = option1
			scale = <text_scale>
			rgba = ($popup_unfocus_color)
			text = (<option1>.title)
			just = [center top]
			event_handlers = <processed_handlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
		add_default_popup_handlers event_handlers = (<option2>.eventhandlers)
		if (<option_menu> > 1)
			CreateScreenElement {
				type = TextElement
				parent = vmenu_generic_popup_menu
				font = <menu_font>
				id = option2
				scale = <text_scale>
				rgba = ($popup_unfocus_color)
				text = (<option2>.title)
				just = [center top]
				event_handlers = <processed_handlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
		endif
		if (<option_menu> > 2)
			add_default_popup_handlers event_handlers = (<option3>.eventhandlers)
			CreateScreenElement {
				type = TextElement
				parent = vmenu_generic_popup_menu
				font = <menu_font>
				id = option3
				scale = <text_scale>
				rgba = ($popup_unfocus_color)
				text = (<option3>.title)
				just = [center top]
				event_handlers = <processed_handlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
		endif
		if (<option_menu> > 3)
			add_default_popup_handlers event_handlers = (<option4>.eventhandlers)
			CreateScreenElement {
				type = TextElement
				parent = vmenu_generic_popup_menu
				font = <menu_font>
				id = option4
				scale = <text_scale>
				rgba = ($popup_unfocus_color)
				text = (<option4>.title)
				just = [center top]
				event_handlers = <processed_handlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
		endif
		if (<option_menu> > 4)
			add_default_popup_handlers event_handlers = (<option5>.eventhandlers)
			CreateScreenElement {
				type = TextElement
				parent = vmenu_generic_popup_menu
				font = <menu_font>
				id = option5
				scale = <text_scale>
				rgba = ($popup_unfocus_color)
				text = (<option5>.title)
				just = [center top]
				event_handlers = <processed_handlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
		endif
		if (<option_menu> = 5)
		elseif (<option_menu> = 4)
		else
		endif
	elseif GotParam \{phrase_window}
		GetArraySize $<phrase_array>
		numPhrases = <array_size>
		i = 0
		begin
		FormatText checksumname = phraseid 'phraseid%n' n = <i>
		CreateScreenElement {
			type = TextBlockElement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			id = <phraseid>
			scale = <text_scale>
			rgba = ($popup_unfocus_color)
			text = ($<phrase_array> [<i>])
			just = [center top]
			dims = (600.0, 300.0)
			internal_just = [center center]
			event_handlers = <phrase_eventhandlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
		<i> = (<i> + 1)
		repeat <numPhrases>
		CreateScreenElement \{type = ContainerElement
			parent = generic_popup_container
			id = arrow_container
			pos = (0.0, 0.0)
			internal_just = [
				center
				center
			]}
		CreateScreenElement {
			type = SpriteElement
			parent = arrow_container
			id = down_arrow
			texture = Scroll_Arrow
			pos = (<center_pos> + (0.0, 86.0))
			just = [center top]
			dims = (64.0, 64.0)
			z_priority = (<generic_popup_menu_z> + 6)
		}
		CreateScreenElement {
			type = SpriteElement
			parent = arrow_container
			id = up_arrow
			texture = Scroll_Arrow
			pos = (<center_pos> + (0.0, -150.0))
			just = [center top]
			flip_h
			dims = (64.0, 64.0)
			z_priority = (<generic_popup_menu_z> + 6)
		}
		change \{generic_up_arrow_enabled = 1}
		change \{generic_down_arrow_enabled = 1}
		change phrase_array_size = <numPhrases>
		change \{phrase_index = 0}
		if (($phrase_array_size) > 1)
			enable_generic_arrow \{dir = down}
		endif
		disable_generic_arrow \{dir = up}
		SpawnScriptLater \{arrow_blinker
			params = {
				time = 0.5
			}}
		FormatText TextName = selection_text qs("%a of %b") a = (($phrase_index) + 1) b = ($phrase_array_size)
		CreateScreenElement {
			type = TextElement
			parent = generic_popup_container
			text = <selection_text>
			font = <menu_font>
			scale = 0.75
			id = current_phrase_text
			rgba = [223 223 223 255]
			pos = (<center_pos> + (100.0, 150.0))
			just = [left bottom]
			z_priority = (<generic_popup_menu_z> + 5)
		}
	endif
	GetFocusID
	if ScreenElementExists id = <focus_on_me>
		switch <focus_on_me>
			case vmenu_main_menu
			vmenu_main_menu :GetTags
			LaunchEvent \{type = unfocus
				target = $popup_previous_menu}
			switch <tag_selected_index>
				case 0
				if ScreenElementExists \{id = main_menu_career_text}
					SetScreenElementProps \{id = main_menu_career_text
						no_shadow}
				endif
				case 1
				if ScreenElementExists \{id = main_menu_coop_career_text}
					SetScreenElementProps \{id = main_menu_coop_career_text
						no_shadow}
				endif
				case 2
				if ScreenElementExists \{id = main_menu_quickplay_text}
					SetScreenElementProps \{id = main_menu_quickplay_text
						no_shadow}
				endif
				case 3
				if ScreenElementExists \{id = main_menu_multiplayer_text}
					SetScreenElementProps \{id = main_menu_multiplayer_text
						no_shadow}
				endif
				case 4
				if ScreenElementExists \{id = main_menu_training_text}
					SetScreenElementProps \{id = main_menu_training_text
						no_shadow}
				endif
				case 5
				if ScreenElementExists \{id = main_menu_options_text}
					SetScreenElementProps \{id = main_menu_options_text
						no_shadow}
				endif
				case 6
				if ScreenElementExists \{id = main_menu_leaderboards_text}
					SetScreenElementProps \{id = main_menu_leaderboards_text
						no_shadow}
				endif
				default
			endswitch
			default
			LaunchEvent type = unfocus target = <focus_on_me>
		endswitch
	endif
	if (<dialog> = 1)
		<largest_width> = 0
		GetScreenElementChildren \{id = vmenu_generic_popup_menu}
		GetArraySize <children>
		<i> = 0
		begin
		GetScreenElementDims id = (<children> [<i>])
		if (<largest_width> < <width>)
			<largest_width> = <width>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		<center_adjust> = ((210 - <largest_width>) / 2)
		GetScreenElementProps \{id = scrolling_generic_popup_menu}
		SetScreenElementProps id = scrolling_generic_popup_menu pos = (<pos> + ((1.0, 0.0) * <center_adjust>))
	endif
	if GotParam \{focus_yes}
		LaunchEvent \{type = focus
			target = vmenu_generic_popup_menu
			data = {
				child_id = yes_option
			}}
	elseif GotParam \{focus_no}
		LaunchEvent \{type = focus
			target = vmenu_generic_popup_menu
			data = {
				child_id = no_option
			}}
	elseif GotParam \{focus_option}
		FormatText checksumname = focused_child 'option%a' a = <focus_option>
		LaunchEvent type = focus target = vmenu_generic_popup_menu data = {child_id = <focused_child>}
	else
		LaunchEvent \{type = focus
			target = vmenu_generic_popup_menu}
	endif
	if GotParam \{loading_window}
		if GotParam \{wait_variable}
			start_loading_process text_block_id = message_block wait_var = <wait_variable> base_text = <message>
		else
			printf \{qs(0xd9176484)}
		endif
		if (($generic_popup_loading_window_open) = 1)
			destroy_generic_popup
		endif
	endif
	if GotParam \{add_user_control_helpers}
		if GotParam \{back_script}
			add_back = true
		else
			add_back = false
		endif
		if GotParam \{ok_menu}
			add_nav = false
		else
			add_nav = true
		endif
		add_popup_user_control_helpers popup_z = <generic_popup_menu_z> add_back = <add_back> add_nav = <add_nav>
	endif
endscript

script create_generic_popup_frames 
	CreateScreenElement {
		type = SpriteElement
		parent = <parent>
		texture = <texture>
		rgba = <rgba>
		pos = (<pos>)
		scale = <scale>
		z_priority = <z_priority>
		just = [bottom right]
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <parent>
		texture = <texture>
		rgba = <rgba>
		pos = (<pos>)
		scale = <scale>
		z_priority = <z_priority>
		just = [top right]
		flip_v
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <parent>
		texture = <texture>
		rgba = <rgba>
		pos = (<pos>)
		scale = <scale>
		z_priority = <z_priority>
		just = [top left]
		flip_v
		flip_h
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <parent>
		texture = <texture>
		rgba = <rgba>
		pos = (<pos>)
		scale = <scale>
		z_priority = <z_priority>
		just = [bottom left]
		flip_h
	}
endscript

script set_generic_popup_open 
	change \{generic_popup_open = 1}
endscript

script destroy_generic_popup 
	if ScreenElementExists \{id = Generic_PopupElement}
		destroy_new_generic_popup
	endif
	if ScreenElementExists \{id = arrow_container}
		KillSpawnedScript \{name = arrow_blinker}
	endif
	if ScreenElementExists \{id = generic_popup_container}
		DestroyScreenElement \{id = generic_popup_container}
	endif
	if ScreenElementExists \{id = vmenu_generic_popup_menu}
		DestroyScreenElement \{id = vmenu_generic_popup_menu}
	endif
	change \{generic_popup_open = 0}
	change \{generic_popup_loading_window_open = 0}
	change \{popup_priority = 11}
	if ScreenElementExists \{id = scrolling_generic_popup_menu}
		DestroyScreenElement \{id = scrolling_generic_popup_menu}
	else
		return
	endif
	printf \{qs(0x815a2da7)}
	popup_old_focus_color = ($menu_unfocus_color)
	popup_old_unfocus_color = ($menu_focus_color)
	change menu_focus_color = <popup_old_focus_color>
	change menu_unfocus_color = <popup_old_unfocus_color>
	GetFocusID
	if NOT (($popup_no_refocus_on_close) = 1)
		if ScreenElementExists id = <focus_on_me>
			LaunchEvent type = focus target = <focus_on_me>
		else
			printf \{qs(0xe3f09409)}
		endif
	endif
endscript
popup_no_refocus_on_close = 0

script kill_generic_popup_early 
	if ScreenElementExists \{id = Generic_PopupElement}
		DestroyScreenElement \{id = Generic_PopupElement}
	endif
	if ScreenElementExists \{id = arrow_container}
		KillSpawnedScript \{name = arrow_blinker}
	endif
	if ScreenElementExists \{id = generic_popup_container}
		DestroyScreenElement \{id = generic_popup_container}
	endif
	if ScreenElementExists \{id = vmenu_generic_popup_menu}
		DestroyScreenElement \{id = vmenu_generic_popup_menu}
	endif
	if ScreenElementExists \{id = scrolling_generic_popup_menu}
		DestroyScreenElement \{id = scrolling_generic_popup_menu}
	else
		return
	endif
endscript

script start_loading_process \{time = 0.3333}
	change \{generic_popup_loading_window_open = 1}
	num_dots = 3
	begin
	<num_dots> = (<num_dots> + 1)
	if (<num_dots> > 3)
		<num_dots> = 0
	endif
	if ($<wait_var> = 0)
		temp_string = <base_text>
		if (<num_dots> > 0)
			begin
			<temp_string> = (<temp_string> + qs(0xb521e42c))
			repeat <num_dots>
		endif
		SetScreenElementProps id = <text_block_id> text = <temp_string>
	else
		return
	endif
	Wait <time> seconds
	repeat
endscript

script enable_generic_arrow 
	if (<dir> = down)
		if (($generic_down_arrow_enabled) = 1)
			return
		else
			change \{generic_down_arrow_enabled = 1}
		endif
	elseif (<dir> = up)
		if (($generic_up_arrow_enabled) = 1)
			return
		else
			change \{generic_up_arrow_enabled = 1}
		endif
	endif
endscript

script disable_generic_arrow 
	if (<dir> = down)
		if (($generic_down_arrow_enabled) = 0)
			return
		else
			change \{generic_down_arrow_enabled = 0}
		endif
	elseif (<dir> = up)
		if (($generic_up_arrow_enabled) = 0)
			return
		else
			change \{generic_up_arrow_enabled = 0}
		endif
	endif
endscript

script scroll_phrase_window 
	if (<dir> = down)
		if (($phrase_index) < (($phrase_array_size) -1))
			change phrase_index = (($phrase_index) + 1)
			printf qs(0xcbe87dd5) a = ($phrase_index) b = ($phrase_array_size)
			generic_menu_up_or_down_sound \{params = {
					down
				}}
		endif
	elseif (<dir> = up)
		if (($phrase_index) > 0)
			change phrase_index = (($phrase_index) -1)
			printf qs(0xaa55a6f5) a = ($phrase_index) b = ($phrase_array_size)
			generic_menu_up_or_down_sound \{params = {
					up
				}}
		endif
	endif
	if (($phrase_index) < (($phrase_array_size) -1))
		enable_generic_arrow \{dir = down}
		printf \{qs(0xa45a550d)}
	else
		disable_generic_arrow \{dir = down}
		printf \{qs(0xad70dc79)}
	endif
	if (($phrase_index) > 0)
		enable_generic_arrow \{dir = up}
		printf \{qs(0xc1323703)}
	else
		disable_generic_arrow \{dir = up}
		printf \{qs(0x1645acb4)}
	endif
	FormatText TextName = selection_text qs("%a of %b") a = (($phrase_index) + 1) b = ($phrase_array_size)
	SetScreenElementProps id = current_phrase_text text = <selection_text>
endscript

script arrow_blinker \{time = 0.5}
	if NOT ScreenElementExists \{id = arrow_container}
		return
	endif
	begin
	if (($generic_up_arrow_enabled) = 1)
		SetScreenElementProps \{id = up_arrow
			alpha = 1.0
			flip_h}
	else
		SetScreenElementProps \{id = up_arrow
			alpha = 0.0
			flip_h}
	endif
	if (($generic_down_arrow_enabled) = 1)
		SetScreenElementProps \{id = down_arrow
			alpha = 1.0}
	else
		SetScreenElementProps \{id = down_arrow
			alpha = 0.0}
	endif
	doScreenElementMorph id = arrow_container alpha = 1.0 time = <time>
	Wait <time> seconds
	doScreenElementMorph id = arrow_container alpha = 0.0 time = <time>
	Wait <time> seconds
	repeat
endscript
test_wait_var = 0

script stop_waiting 
	change \{test_wait_var = 1}
endscript
network_wait_var = 0

script enable_network_wait_variable 
	printf \{qs(0x404830f1)}
	change \{network_wait_var = 0}
endscript

script clear_network_wait_variable 
	printf \{qs(0x2e0d30e3)}
	change \{network_wait_var = 1}
endscript

script add_popup_user_control_helpers \{add_nav = true}
	clean_up_user_control_helpers
	add_user_control_helper text = qs("SELECT") button = green z = (<popup_z> + 10)
	if (<add_back> = true)
		add_user_control_helper text = qs("BACK") button = red z = (<popup_z> + 10)
	endif
	if (<add_nav> = true)
	endif
endscript

script add_default_popup_handlers 
	handler_index = 0
	contains_focus = false
	contains_unfocus = false
	GetArraySize <event_handlers>
	begin
	if (<handler_index> >= <array_size>)
		break
	endif
	if StructureContains Structure = (<event_handlers> [<handler_index>]) focus
		contains_focus = true
	endif
	if StructureContains Structure = (<event_handlers> [<handler_index>]) unfocus
		contains_unfocus = true
	endif
	handler_index = (<handler_index> + 1)
	repeat
	if (<contains_focus> = false)
		AddArrayElement array = (<event_handlers>) element = ({focus popup_menu_focus})
		<event_handlers> = (<array>)
	endif
	if (<contains_unfocus> = false)
		AddArrayElement array = (<event_handlers>) element = ({unfocus popup_menu_unfocus})
		<event_handlers> = (<array>)
	endif
	return processed_handlers = <event_handlers>
endscript

script generic_popup_test 
	if ScreenElementExists \{id = vmenu_generic_popup_menu}
		return
	endif
	change \{test_wait_var = 0}
	create_generic_popup \{title = qs(0x2251019f)
		loading_window
		can_cancel
		message = qs(0x0e111578)
		wait_variable = test_wait_var
		cancel_eventhandlers = [
			{
				focus
				popup_menu_focus
			}
			{
				unfocus
				popup_menu_unfocus
			}
			{
				pad_choose
				stop_waiting
			}
		]
		previous_menu = vmenu_main_menu}
endscript
