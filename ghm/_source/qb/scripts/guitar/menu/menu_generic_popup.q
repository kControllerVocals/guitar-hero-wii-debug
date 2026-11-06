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
	assignalias id = <focus_item> alias = current_menu
endscript
generic_popup_open = 0
generic_popup_loading_window_open = 0

script is_generic_popup_open 
	return \{open = $generic_popup_open}
endscript

script popup_menu_focus 
	if gotparam \{id}
		if screenelementexists id = <id>
			setscreenelementprops id = <id> rgba = ($popup_focus_color)
		endif
	else
		obj_getid
		<id> = <objid>
		if gotparam \{objid}
			setscreenelementprops id = <id> rgba = ($popup_focus_color)
		endif
	endif
endscript

script popup_menu_unfocus 
	if gotparam \{id}
		if screenelementexists id = <id>
			setscreenelementprops id = <id> rgba = ($popup_unfocus_color)
		endif
	else
		obj_getid
		<id> = <objid>
		if gotparam \{objid}
			setscreenelementprops id = <id> rgba = ($popup_unfocus_color)
		endif
	endif
endscript
popup_priority = 11

script popup_get_pad_choose_event 
	getarraysize <event_handlers>
	<i> = (<array_size> -1)
	begin
	spliteventhandlerstruct struct = (<event_handlers> [<i>])
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
	if gotparam \{ok_menu}
		if popup_get_pad_choose_event event_handlers = <ok_eventhandlers>
			options = [
				{
					func = <func>
					func_params = <func_params>
					text = qs(0x0e41fe46)
				}
			]
		endif
		<focus_child> = 0
	elseif gotparam \{yes_no_menu}
		if popup_get_pad_choose_event event_handlers = <yes_eventhandlers>
			yes_func = <func>
			yes_params = <func_params>
		endif
		if popup_get_pad_choose_event event_handlers = <no_eventhandlers>
			no_func = <func>
			no_params = <func_params>
		endif
		if ((gotparam yes_func) && (gotparam no_func))
			options = [
				{
					func = <yes_func>
					func_params = <yes_params>
					text = qs(0x58e0a1fb)
				}
				{
					func = <no_func>
					func_params = <no_params>
					text = qs(0xd2915c27)
				}
			]
		endif
		<focus_child> = 0
		if gotparam \{focus_no}
			<focus_child> = 1
		endif
	elseif gotparam \{option_menu}
		options = []
		<i> = 1
		begin
		formattext checksumname = option_struct_chksum 'option%d' d = <i>
		<option_struct> = ((<...>).<option_struct_chksum>)
		if popup_get_pad_choose_event event_handlers = (<option_struct>.eventhandlers)
			<new_struct> = {
				func = <func>
				func_params = <func_params>
				text = (<option_struct>.title)
			}
			addarrayelement array = <options> element = <new_struct>
			<options> = <array>
		endif
		<i> = (<i> + 1)
		repeat <option_menu>
		<focus_child> = 0
		if gotparam \{focus_option}
			<focus_child> = (<focus_option> - 1)
		endif
	elseif gotparam \{loading_window}
		<options> = []
		if gotparam \{can_cancel}
			if popup_get_pad_choose_event event_handlers = <cancel_eventhandlers>
				<options> = [
					{
						func = <func>
						func_params = <func_params>
						text = qs(0xf7723015)
					}
				]
			endif
		endif
		<type> = loading_window
	endif
	if gotparam \{options}
		if gotparam \{default_blackout}
			full_blackout = 0.65000004
		elseif NOT gotparam \{full_blackout}
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
		if gotparam \{priority}
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
	if gotparam \{priority}
		change popup_priority = <priority>
	endif
	if gotparam \{loading_window}
		if gotparam \{wait_variable}
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
	if gotparam \{option_menu}
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
	if gotparam \{ok_menu}
		<menu_pos> = (574.0, 404.0)
		<dialog> = 1
	endif
	if gotparam \{yes_no_menu}
		<menu_pos> = (574.0, 400.0)
		<dialog> = 1
	endif
	if gotparam \{phrase_window}
		<menu_pos> = (415.0, 250.0)
	endif
	if gotparam \{loading_window}
		<menu_pos> = (574.0, 404.0)
		if gotparam \{can_cancel}
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
	if gotparam \{phrase_window}
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
	if gotparam \{phrase_window}
		generic_popup_event_handlers = [
			{pad_up scroll_phrase_window params = {dir = up}}
			{pad_down scroll_phrase_window params = {dir = down}}
		]
	else
		if NOT ((gotparam ok_menu) || (gotparam loading_window) || (gotparam blank_menu))
			if gotparam \{option_menu}
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
	if gotparam \{back_script}
		back_handler = {pad_back <back_script>}
		if NOT gotparam \{generic_popup_event_handlers}
			<generic_popup_event_handlers> = []
		endif
		addarrayelement array = (<generic_popup_event_handlers>) element = (<back_handler>)
		<generic_popup_event_handlers> = (<array>)
	endif
	if NOT gotparam \{purchase_confirm}
		createscreenelement \{type = containerelement
			parent = root_window
			id = generic_popup_container
			pos = (0.0, 0.0)
			internal_just = [
				center
				center
			]}
	else
		createscreenelement {
			type = containerelement
			parent = root_window
			id = generic_popup_container
			pos = ($pc_popuppos)
			internal_just = [center center]
			scale = ($pc_popupscale)
		}
	endif
	if gotparam \{default_blackout}
		full_blackout = 0.65000004
	endif
	if gotparam \{full_blackout}
		createscreenelement {
			type = spriteelement
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
	createscreenelement {
		type = spriteelement
		parent = generic_popup_container
		texture = dialog_bg
		rgba = [255 255 255 255]
		pos = (640.0, 320.0)
		scale = 1.25
		just = [center center]
		z_priority = <generic_popup_z>
	}
	if gotparam \{title}
		popup_title_off = (645.0, 60.0)
		if german
			createscreenelement {
				type = textelement
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
			createscreenelement {
				type = textelement
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
	if gotparam \{purchase_confirm}
		if gotparam \{long_text}
			osprintf \{qs(0x19154f67)}
			<pos_y> = 202
			<dims_x> = 606
		else
			<pos_y> = 220
			<dims_x> = 600
		endif
		message_block_left_pos = ((($pc_x_lpos) * (1.0, 0.0)) + (<pos_y> * (0.0, 1.0)))
		message_block_right_pos = ((($pc_x_rpos) * (1.0, 0.0)) + (<pos_y> * (0.0, 1.0)))
		message_block_left_dims = ((($pc_x_ldim) * (1.0, 0.0)) + (340 * (0.0, 1.0)))
		message_block_right_dims = ((($pc_x_rdim) * (1.0, 0.0)) + (340 * (0.0, 1.0)))
		createscreenelement {
			type = textblockelement
			id = message_block_left
			text = <message_left>
			scale = ($pc_mess_scale)
			parent = generic_popup_container
			font = <text_font>
			rgba = [210 130 0 250]
			pos = <message_block_left_pos>
			dims = <message_block_left_dims>
			just = [left top]
			internal_just = ($pc_left_just)
			z_priority = (<generic_popup_z> + 2.2)
		}
		createscreenelement {
			type = textblockelement
			id = message_block_right
			text = <message_right>
			scale = ($pc_mess_scale)
			parent = generic_popup_container
			font = <text_font>
			rgba = [210 130 0 250]
			pos = <message_block_right_pos>
			dims = <message_block_right_dims>
			just = [left top]
			internal_just = ($pc_right_just)
			z_priority = (<generic_popup_z> + 2.2)
		}
	elseif gotparam \{message}
		printf qs(0x1fa2e924) a = <message>
		if gotparam \{long_text}
			osprintf \{qs(0x19154f67)}
			message_block_pos = (410.0, 180.0)
			message_block_dims = (606.0, 362.0)
		else
			message_block_pos = (410.0, 220.0)
			message_block_dims = (600.0, 300.0)
		endif
		createscreenelement {
			type = textblockelement
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
	if gotparam \{progress_bar}
		createscreenelement {
			type = spriteelement
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
	if gotparam \{phrase_window}
	elseif gotparam \{blank_menu}
	elseif gotparam \{loading_window}
		if gotparam \{can_cancel}
		endif
	else
	endif
	createscreenelement {
		type = vscrollingmenu
		parent = root_window
		id = scrolling_generic_popup_menu
		dims = (400.0, 480.0)
		just = [left top]
		pos = <menu_pos>
		z_priority = <generic_popup_menu_z>
	}
	createscreenelement {
		type = vmenu
		parent = scrolling_generic_popup_menu
		id = vmenu_generic_popup_menu
		pos = (0.0, 0.0)
		just = [center center]
		internal_just = [center center]
		event_handlers = <generic_popup_event_handlers>
	}
	if gotparam \{phrase_window}
		setscreenelementprops \{id = scrolling_generic_popup_menu
			dims = (600.0, 300.0)}
		setscreenelementprops \{id = vmenu_generic_popup_menu
			dont_allow_wrap}
	endif
	if gotparam \{loading_window}
		<largest_width> = 0
		getscreenelementchildren \{id = message_block}
		getarraysize <children>
		<i> = 0
		begin
		getscreenelementdims id = (<children> [<i>])
		if (<largest_width> < <width>)
			<largest_width> = <width>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		getscreenelementprops \{id = message_block}
		<starting_pos> = <pos>
		<adjust_width> = ((600 - <largest_width>) / 2.0 - 40)
		<ending_pos> = (<starting_pos> + (<adjust_width> * (1.0, 0.0)))
		setscreenelementprops id = message_block internal_just = [left center] pos = <ending_pos>
	endif
	if gotparam \{loading_window}
		if gotparam \{can_cancel}
			createscreenelement {
				type = textelement
				parent = vmenu_generic_popup_menu
				font = <menu_font>
				scale = 1.5
				rgba = ($popup_unfocus_color)
				text = qs(0xf7723015)
				just = [center top]
				event_handlers = <cancel_eventhandlers>
				z_priority = (<generic_popup_menu_z> + 5)
			}
			displaysprite parent = generic_popup_container tex = dialog_menu_bg pos = (480.0, 450.0) scale = (2.5, 2.5) z = <generic_popup_menu_z>
			displaysprite parent = generic_popup_container tex = dialog_menu_bg flip_h pos = (480.0, 530.0) scale = (2.5, 2.5) z = <generic_popup_menu_z>
		endif
	elseif gotparam \{ok_menu}
		add_default_popup_handlers event_handlers = <ok_eventhandlers>
		createscreenelement {
			type = textelement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			scale = 1.5
			rgba = ($popup_unfocus_color)
			text = qs(0x0e41fe46)
			just = [center top]
			event_handlers = <processed_handlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
	elseif gotparam \{yes_no_menu}
		add_default_popup_handlers event_handlers = <yes_eventhandlers>
		createscreenelement {
			type = textelement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			id = yes_option
			scale = 1.0
			rgba = ($popup_unfocus_color)
			text = qs(0x58e0a1fb)
			just = [center top]
			event_handlers = <processed_handlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
		add_default_popup_handlers event_handlers = <no_eventhandlers>
		createscreenelement {
			type = textelement
			parent = vmenu_generic_popup_menu
			font = <menu_font>
			id = no_option
			scale = 1.0
			rgba = ($popup_unfocus_color)
			text = qs(0xd2915c27)
			just = [center top]
			event_handlers = <processed_handlers>
			z_priority = (<generic_popup_menu_z> + 5)
		}
	elseif gotparam \{option_menu}
		add_default_popup_handlers event_handlers = (<option1>.eventhandlers)
		createscreenelement {
			type = textelement
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
			createscreenelement {
				type = textelement
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
			createscreenelement {
				type = textelement
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
			createscreenelement {
				type = textelement
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
			createscreenelement {
				type = textelement
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
	elseif gotparam \{phrase_window}
		getarraysize $<phrase_array>
		numphrases = <array_size>
		i = 0
		begin
		formattext checksumname = phraseid 'phraseid%n' n = <i>
		createscreenelement {
			type = textblockelement
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
		repeat <numphrases>
		createscreenelement \{type = containerelement
			parent = generic_popup_container
			id = arrow_container
			pos = (0.0, 0.0)
			internal_just = [
				center
				center
			]}
		createscreenelement {
			type = spriteelement
			parent = arrow_container
			id = down_arrow
			texture = scroll_arrow
			pos = (<center_pos> + (0.0, 86.0))
			just = [center top]
			dims = (64.0, 64.0)
			z_priority = (<generic_popup_menu_z> + 6)
		}
		createscreenelement {
			type = spriteelement
			parent = arrow_container
			id = up_arrow
			texture = scroll_arrow
			pos = (<center_pos> + (0.0, -150.0))
			just = [center top]
			flip_h
			dims = (64.0, 64.0)
			z_priority = (<generic_popup_menu_z> + 6)
		}
		change \{generic_up_arrow_enabled = 1}
		change \{generic_down_arrow_enabled = 1}
		change phrase_array_size = <numphrases>
		change \{phrase_index = 0}
		if (($phrase_array_size) > 1)
			enable_generic_arrow \{dir = down}
		endif
		disable_generic_arrow \{dir = up}
		spawnscriptlater \{arrow_blinker
			params = {
				time = 0.5
			}}
		formattext textname = selection_text qs(0x862202b8) a = (($phrase_index) + 1) b = ($phrase_array_size)
		createscreenelement {
			type = textelement
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
	getfocusid
	if screenelementexists id = <focus_on_me>
		switch <focus_on_me>
			case vmenu_main_menu
			vmenu_main_menu :gettags
			launchevent \{type = unfocus
				target = $popup_previous_menu}
			switch <tag_selected_index>
				case 0
				if screenelementexists \{id = main_menu_career_text}
					setscreenelementprops \{id = main_menu_career_text
						no_shadow}
				endif
				case 1
				if screenelementexists \{id = main_menu_coop_career_text}
					setscreenelementprops \{id = main_menu_coop_career_text
						no_shadow}
				endif
				case 2
				if screenelementexists \{id = main_menu_quickplay_text}
					setscreenelementprops \{id = main_menu_quickplay_text
						no_shadow}
				endif
				case 3
				if screenelementexists \{id = main_menu_multiplayer_text}
					setscreenelementprops \{id = main_menu_multiplayer_text
						no_shadow}
				endif
				case 4
				if screenelementexists \{id = main_menu_training_text}
					setscreenelementprops \{id = main_menu_training_text
						no_shadow}
				endif
				case 5
				if screenelementexists \{id = main_menu_options_text}
					setscreenelementprops \{id = main_menu_options_text
						no_shadow}
				endif
				case 6
				if screenelementexists \{id = main_menu_leaderboards_text}
					setscreenelementprops \{id = main_menu_leaderboards_text
						no_shadow}
				endif
				default
			endswitch
			default
			launchevent type = unfocus target = <focus_on_me>
		endswitch
	endif
	if (<dialog> = 1)
		<largest_width> = 0
		getscreenelementchildren \{id = vmenu_generic_popup_menu}
		getarraysize <children>
		<i> = 0
		begin
		getscreenelementdims id = (<children> [<i>])
		if (<largest_width> < <width>)
			<largest_width> = <width>
		endif
		<i> = (<i> + 1)
		repeat <array_size>
		<center_adjust> = ((210 - <largest_width>) / 2)
		getscreenelementprops \{id = scrolling_generic_popup_menu}
		setscreenelementprops id = scrolling_generic_popup_menu pos = (<pos> + ((1.0, 0.0) * <center_adjust>))
	endif
	if gotparam \{focus_yes}
		launchevent \{type = focus
			target = vmenu_generic_popup_menu
			data = {
				child_id = yes_option
			}}
	elseif gotparam \{focus_no}
		launchevent \{type = focus
			target = vmenu_generic_popup_menu
			data = {
				child_id = no_option
			}}
	elseif gotparam \{focus_option}
		formattext checksumname = focused_child 'option%a' a = <focus_option>
		launchevent type = focus target = vmenu_generic_popup_menu data = {child_id = <focused_child>}
	else
		launchevent \{type = focus
			target = vmenu_generic_popup_menu}
	endif
	if gotparam \{loading_window}
		if gotparam \{wait_variable}
			start_loading_process text_block_id = message_block wait_var = <wait_variable> base_text = <message>
		else
			printf \{qs(0xd9176484)}
		endif
		if (($generic_popup_loading_window_open) = 1)
			destroy_generic_popup
		endif
	endif
	if gotparam \{add_user_control_helpers}
		if gotparam \{back_script}
			add_back = true
		else
			add_back = false
		endif
		if gotparam \{ok_menu}
			add_nav = false
		else
			add_nav = true
		endif
		add_popup_user_control_helpers popup_z = <generic_popup_menu_z> add_back = <add_back> add_nav = <add_nav>
	endif
endscript

script create_generic_popup_frames 
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = <texture>
		rgba = <rgba>
		pos = (<pos>)
		scale = <scale>
		z_priority = <z_priority>
		just = [bottom right]
	}
	createscreenelement {
		type = spriteelement
		parent = <parent>
		texture = <texture>
		rgba = <rgba>
		pos = (<pos>)
		scale = <scale>
		z_priority = <z_priority>
		just = [top right]
		flip_v
	}
	createscreenelement {
		type = spriteelement
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
	createscreenelement {
		type = spriteelement
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
	if screenelementexists \{id = generic_popupelement}
		destroy_new_generic_popup
	endif
	if screenelementexists \{id = arrow_container}
		killspawnedscript \{name = arrow_blinker}
	endif
	if screenelementexists \{id = generic_popup_container}
		destroyscreenelement \{id = generic_popup_container}
	endif
	if screenelementexists \{id = vmenu_generic_popup_menu}
		destroyscreenelement \{id = vmenu_generic_popup_menu}
	endif
	change \{generic_popup_open = 0}
	change \{generic_popup_loading_window_open = 0}
	change \{popup_priority = 11}
	if screenelementexists \{id = scrolling_generic_popup_menu}
		destroyscreenelement \{id = scrolling_generic_popup_menu}
	else
		return
	endif
	printf \{qs(0x815a2da7)}
	popup_old_focus_color = ($menu_unfocus_color)
	popup_old_unfocus_color = ($menu_focus_color)
	change menu_focus_color = <popup_old_focus_color>
	change menu_unfocus_color = <popup_old_unfocus_color>
	getfocusid
	if NOT (($popup_no_refocus_on_close) = 1)
		if screenelementexists id = <focus_on_me>
			launchevent type = focus target = <focus_on_me>
		else
			printf \{qs(0xe3f09409)}
		endif
	endif
endscript
popup_no_refocus_on_close = 0

script kill_generic_popup_early 
	if screenelementexists \{id = generic_popupelement}
		destroyscreenelement \{id = generic_popupelement}
	endif
	if screenelementexists \{id = arrow_container}
		killspawnedscript \{name = arrow_blinker}
	endif
	if screenelementexists \{id = generic_popup_container}
		destroyscreenelement \{id = generic_popup_container}
	endif
	if screenelementexists \{id = vmenu_generic_popup_menu}
		destroyscreenelement \{id = vmenu_generic_popup_menu}
	endif
	if screenelementexists \{id = scrolling_generic_popup_menu}
		destroyscreenelement \{id = scrolling_generic_popup_menu}
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
		setscreenelementprops id = <text_block_id> text = <temp_string>
	else
		return
	endif
	wait <time> seconds
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
	formattext textname = selection_text qs(0x862202b8) a = (($phrase_index) + 1) b = ($phrase_array_size)
	setscreenelementprops id = current_phrase_text text = <selection_text>
endscript

script arrow_blinker \{time = 0.5}
	if NOT screenelementexists \{id = arrow_container}
		return
	endif
	begin
	if (($generic_up_arrow_enabled) = 1)
		setscreenelementprops \{id = up_arrow
			alpha = 1.0
			flip_h}
	else
		setscreenelementprops \{id = up_arrow
			alpha = 0.0
			flip_h}
	endif
	if (($generic_down_arrow_enabled) = 1)
		setscreenelementprops \{id = down_arrow
			alpha = 1.0}
	else
		setscreenelementprops \{id = down_arrow
			alpha = 0.0}
	endif
	doscreenelementmorph id = arrow_container alpha = 1.0 time = <time>
	wait <time> seconds
	doscreenelementmorph id = arrow_container alpha = 0.0 time = <time>
	wait <time> seconds
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
	add_user_control_helper text = qs(0xc18d5e76) button = green z = (<popup_z> + 10)
	if (<add_back> = true)
		add_user_control_helper text = qs(0xaf4d5dd2) button = red z = (<popup_z> + 10)
	endif
	if (<add_nav> = true)
	endif
endscript

script add_default_popup_handlers 
	handler_index = 0
	contains_focus = false
	contains_unfocus = false
	getarraysize <event_handlers>
	begin
	if (<handler_index> >= <array_size>)
		break
	endif
	if structurecontains structure = (<event_handlers> [<handler_index>]) focus
		contains_focus = true
	endif
	if structurecontains structure = (<event_handlers> [<handler_index>]) unfocus
		contains_unfocus = true
	endif
	handler_index = (<handler_index> + 1)
	repeat
	if (<contains_focus> = false)
		addarrayelement array = (<event_handlers>) element = ({focus popup_menu_focus})
		<event_handlers> = (<array>)
	endif
	if (<contains_unfocus> = false)
		addarrayelement array = (<event_handlers>) element = ({unfocus popup_menu_unfocus})
		<event_handlers> = (<array>)
	endif
	return processed_handlers = <event_handlers>
endscript

script generic_popup_test 
	if screenelementexists \{id = vmenu_generic_popup_menu}
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
