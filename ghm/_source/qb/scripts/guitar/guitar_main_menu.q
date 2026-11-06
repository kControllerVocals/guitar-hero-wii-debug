force_mainmenu_signin = 0
first_time_creating_main_menu = 1
respond_to_signin_change = 0
store_respond_to_signin_changed = 0

script create_main_menu 
	change \{respond_to_signin_changed = 0}
	closesonglogfile
	reset_quickplay_song_list
	cas_destroy_all_characters
	reset_character_ids
	sanity_check_fix_deleted_characters
	band_builder_clear_random_appearances
	destroy_band
	destroy_bandname_viewport
	frontend_load_soundcheck
	reset_all_special_events
	clear_exclusive_devices
	setmenuautorepeattimes \{(0.3, 0.05)}
	disable_pause
	unpausegame
	change \{check_for_unplugged_controllers = 1}
	change \{current_num_players = 1}
	change structurename = player1_status controller = ($primary_controller)
	disable_pause
	spawnscriptnow \{menu_music_on}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	change \{should_reset_gig_posters_selection = 1}
	change \{setlist_previous_tier = 1}
	change \{setlist_previous_song = 0}
	change \{setlist_previous_tab = tab_setlist}
	change \{current_song = $startup_song}
	change \{end_credits = 0}
	change \{battle_do_or_die = 0}
	change \{battle_do_or_die_speed_scale = 1.0}
	change \{battle_do_or_die_attack_scale = 1.0}
	change \{rich_presence_context = presence_menus}
	change \{player1_device = 0}
	change \{player2_device = 1}
	change \{player3_device = 2}
	change \{player4_device = 3}
	change \{current_gig_number = 1}
	change \{current_progression_flag = none}
	change \{options_for_manage_band = 0}
	if ($new_message_of_the_day = 1)
		runscriptonscreenelement \{id = current_menu
			pop_in_new_downloads_notifier}
	endif
	if NOT ($invite_controller = -1)
		change \{invite_controller = -1}
		main_menu_select_online
		fadetoblack \{off
			time = 0}
	else
	endif
	if ($autolaunch_cas = 1 || $autolaunch_cas_artist = 1)
		change \{autolaunch_cas = 0}
		spawnscriptlater main_menu_select_cas params = {device_num = ($primary_controller)}
	endif
	if ($autolaunch_jam = 1)
		change \{autolaunch_jam = 0}
		spawnscriptlater main_menu_select_jam params = {device_num = ($primary_controller)}
	endif
	spawnscriptnow \{menu_music_fade
		params = {
			in
			time = 0.01
		}}
	if ($first_time_creating_main_menu = 1)
		if NOT ($disable_wifi = 1)
			get_band_info
			getglobaltags <band_info> param = name
			getglobaltags <band_info> param = auto_dwc_login
			printf qs(0xebfd02ce) d = <auto_dwc_login>
			if (<auto_dwc_login> = 1)
				stringlength string = <name>
				if (<str_len> != 0)
					netsessionfunc func = onlinesignin params = {profile_name = <name> want_to_enter_wifi_menu = false profile = ($current_band)}
				endif
				hide_unhide_menu_elements \{id = current_menu
					time = 0.2}
			else
				0x236a787f bandname_id = <band_info>
			endif
		else
			create_new_generic_popup \{popup_type = ok_menu
				text = qs(0xf8de0a73)
				ok_func = destroy_generic_popup}
			hide_unhide_menu_elements \{id = current_menu
				time = 0.2}
		endif
	endif
	change \{first_time_creating_main_menu = 0}
endscript

script mainmenu_focus 
	obj_getid
	gettags
	if current_menu_anchor :desc_resolvealias \{name = alias_highlight}
		wait \{2
			gameframe}
		getscreenelementdims id = <objid>
		scale = (((1.0, 0.0) * (((<width> + 100.0) / 256.0))) + (0.0, 1.5))
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute <screenelementpos>} scale = <scale>
		<resolved_id> :se_waitprops
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute (<screenelementpos> + (0.0, -10.0))} time = 0.05
		<resolved_id> :se_waitprops
		getscreenelementposition id = <objid> summed
		<resolved_id> :se_setprops pos = {absolute <screenelementpos>} scale = <scale> time = 0.05
		<resolved_id> :se_waitprops
	endif
endscript

script mainmenu_unfocus 
	se_setprops \{rgba = [
			0
			0
			0
			255
		]}
endscript

script highlight_motion \{menu_id = current_menu_anchor
		alias_name = alias_highlight}
	if <menu_id> :desc_resolvealias name = <alias_name>
		if getscreenelementchildren id = <resolved_id>
			getarraysize <children>
			prev = 0
			curr = 1
			begin
			prev_id = (<children> [<prev>])
			curr_id = (<children> [<curr>])
			<prev_id> :se_setprops alpha = 0.0
			<curr_id> :se_setprops alpha = 1
			prev = <curr>
			next = RandomInteger (0.0, 2.0)
			if (<next> = <prev>)
				curr = (<curr> + 1)
			else
				curr = <next>
			endif
			if (<curr> >= <array_size>)
				curr = 0
			endif
			if NOT gotparam \{no_flip}
				rand = Random (@ 0 @ 1 )
				if (<rand> = 1)
					<curr_id> :se_setprops flip_v = true
				else
					<curr_id> :se_setprops flip_v = false
				endif
				rand = Random (@ 0 @ 1 )
				if (<rand> = 1)
					<curr_id> :se_setprops flip_h = true
				else
					<curr_id> :se_setprops flip_h = false
				endif
			endif
			wait \{0.1
				second}
			repeat
		endif
	endif
endscript

script create_main_menu_elements 
	0xc0a98a59
	if NOT ($invite_controller = -1)
		return
	endif
	if screenelementexists \{id = current_menu_anchor}
		current_menu_anchor :die
	endif
	createscreenelement \{type = descinterface
		id = current_menu_anchor
		parent = root_window
		desc = 'main_menu_layout'
		just = [
			center
			center
		]}
	if current_menu_anchor :desc_resolvealias \{name = alias_menu}
		assignalias id = <resolved_id> alias = current_menu
		current_menu :se_setprops \{event_handlers = [
				{
					pad_up
					generic_menu_up_or_down_sound
					params = {
						up
					}
				}
				{
					pad_down
					generic_menu_up_or_down_sound
					params = {
						down
					}
				}
			]}
		current_menu :obj_spawnscript \{highlight_motion}
		if getscreenelementchildren \{id = current_menu}
			getarraysize <children>
			i = 0
			begin
			curr_id = (<children> [<i>])
			<curr_id> :se_setprops {
				event_handlers = [
					{focus mainmenu_focus}
					{unfocus mainmenu_unfocus}
				]
				tags = {index = <i>}
			}
			i = (<i> + 1)
			repeat <array_size>
			curr_id = (<children> [0])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_career}
				]
			}
			curr_id = (<children> [1])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_quickplay}
				]
			}
			curr_id = (<children> [2])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_multiplayer}
				]
			}
			curr_id = (<children> [3])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_online}
				]
			}
			if isps3
				<curr_id> :se_setprops dims = (0.0, 0.0) text = qs(0xe60e3e4a)
			endif
			if isngc
				<curr_id> :se_setprops dims = (0.0, 0.0) text = qs(0xc076c88d)
			endif
			curr_id = (<children> [4])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_backstage}
				]
			}
			curr_id = (<children> [5])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_options}
				]
			}
			curr_id = (<children> [6])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_jam}
				]
			}
			curr_id = (<children> [7])
			<curr_id> :se_setprops {
				event_handlers = [
					{pad_choose main_menu_select_debug}
				]
			}
			show_debug_menus = 0
			if ($enable_button_cheats = 1)
				<show_debug_menus> = 1
				if ($enable_debug_menus = 0)
					<show_debug_menus> = 0
				endif
			endif
			if (<show_debug_menus> = 0)
				<curr_id> :die
			endif
		endif
	endif
	return
	base_menu_pos = (730.0, 125.0)
	main_menu_font = fontgrid_title_a1
	create_viewport_ui \{texture = 0x4af58676
		texdict = `zones/z_soundcheck/z_soundcheck.tex`}
	if ($is_demo_mode = 1)
		demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
	else
		demo_mode_disable = {}
	endif
	if ($is_demo_mode = 0)
		if ($is_multiplayer_beta = 1)
			demo_mode_disable = {rgba = [128 128 128 255] not_focusable}
		else
			demo_mode_disable = {}
		endif
	endif
	createscreenelement {
		type = vmenu
		parent = <window_id>
		id = current_menu
		dims = (1280.0, 720.0)
		just = [left top]
		pos = (100.0, 0.0)
		internal_just = [center bottom]
		event_handlers = [
			{pad_up generic_menu_up_or_down_sound params = {up}}
			{pad_down generic_menu_up_or_down_sound params = {down}}
		]
		position_children = false
	}
	container_pos = (512.0, 115.0)
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos>)
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0xde7ec8b3)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_career
	}
	container_pos = (<container_pos> + (0.0, 105.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = <container_pos>
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0xfabdce2b)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_quickplay
	}
	container_pos = (<container_pos> + (0.0, 105.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos> + (20.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0xfef0f891)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_multiplayer
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	online_text = qs(0xc076c88d)
	if ($disable_wifi = 1)
		<0x3a146d74> = {not_focusable}
		<0xd54d07e5> = {rgba = [64 64 64 250]}
	else
		<0x3a146d74> = {}
		<0xd54d07e5> = {}
	endif
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos> + (-60.0, 0.0))
			<0x3a146d74>
		}
		text_params = {
			text = <online_text>
			<0xd54d07e5>
		}
		choose_script = main_menu_select_online
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = <container_pos>
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0x79dfdd25)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_jam
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos> + (-40.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0x9f894c1e)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_cas
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos> + (0.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0x271e2cfc)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_downloads
	}
	container_pos = (<container_pos> + (0.0, 85.0))
	add_mainmenu_item {
		parent = current_menu
		container_params = {
			pos = (<container_pos> + (-40.0, 0.0))
			<demo_mode_disable>
		}
		text_params = {
			text = qs(0x976cf9e7)
			<demo_mode_disable>
		}
		choose_script = main_menu_select_options
	}
	container_pos = (<container_pos> + (0.0, 55.0))
	show_debug_menus = 0
	if ($enable_button_cheats = 1)
		<show_debug_menus> = 1
		if ($enable_debug_menus = 0)
			<show_debug_menus> = 0
		endif
	endif
	if (<show_debug_menus>)
		if ($is_multiplayer_beta = 0)
			add_mainmenu_item {
				parent = current_menu
				container_params = {
					pos = <container_pos>
					dims = (200.0, 30.0)
				}
				text_params = {
					text = qs(0xe4963f83)
					scale = 0.65000004
				}
				choose_script = main_menu_select_debug
			}
		endif
	endif
endscript

script add_mainmenu_item \{default_container_params = {
			dims = (200.0, 50.0)
			child_anchor = [
				center
				top
			]
			scale = 1.8
		}
		default_text_params = {
			text = qs(0x03ac90f0)
			rgba = [
				200
				200
				200
				250
			]
			font = fontgrid_text_a11_large
			just = [
				center
				center
			]
		}
		choose_script = nullscript}
	if globalexists \{name = massive_build}
		if NOT ($massive_build = 0)
			if gotparam \{massive_secret_item}
				return
			endif
		endif
	endif
	createscreenelement {
		<default_container_params>
		<container_params>
		type = containerelement
		parent = <parent>
		event_handlers = [
			{focus mainmenu_item_focus}
			{unfocus mainmenu_item_unfocus}
			{pad_choose <choose_script>}
		]
	}
	container_id = <id>
	createscreenelement {
		font = ($test_menu_font)
		<default_text_params>
		<text_params>
		type = textelement
		parent = <container_id>
		local_id = text
	}
	getscreenelementdims id = <id>
	if (<width> > 420)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> dims = ((420.0, 0.0) + <height> * (0.0, 1.0))
	endif
	return container_id = <container_id>
endscript

script mainmenu_item_focus 
	obj_getid
	<id> = <objid>
	setscreenelementprops id = {<id> child = text} rgba = [210 210 210 250]
endscript

script mainmenu_item_unfocus 
	obj_getid
	<id> = <objid>
	setscreenelementprops id = {<id> child = text} rgba = [200 200 200 250]
endscript

script destroy_main_menu 
	generic_ui_destroy
	destroy_viewport_ui
endscript

script main_menu_select_career 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{game_mode = p1_career}
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode
endscript

script main_menu_select_quickplay 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	main_menu_select_generic device_num = <device_num> state = uistate_game_mode data = {mode = quickplay}
endscript

script main_menu_select_multiplayer 
	if scriptisrunning \{menu_transition_in_spawned}
		killspawnedscript \{name = menu_transition_in_spawned}
	endif
	if scriptisrunning \{menu_transition_in}
		killspawnedscript \{name = menu_transition_in}
	endif
	getactivecontrollers
	getarraysize <active_controllers>
	i = 0
	guitar_count = 0
	drum_count = 0
	begin
	if (<active_controllers> [<i>] = 1)
		ui_options_get_controller_type controller = <i>
		switch (<type>)
			case guitar
			<guitar_count> = (<guitar_count> + 1)
			case drums
			<drum_count> = (<drum_count> + 1)
		endswitch
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	if ((<guitar_count> < 2) && (<drum_count> < 2))
		create_new_generic_popup \{popup_type = ok_menu
			title = qs(0xcf5deb58)
			text = qs(0xc8986629)
			ok_func = destroy_generic_popup
			back_script = destroy_generic_popup
			title_effect}
	else
		spawnscriptnow \{0x0308347c}
	endif
endscript

script 0x077dbb38 
	destroy_generic_popup
	launchevent \{type = focus
		target = current_menu}
endscript

script 0x0308347c 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{game_mode = p2_faceoff}
	change \{current_num_players = 2}
	change \{structurename = player1_status
		part = guitar}
	change \{structurename = player2_status
		part = guitar}
	main_menu_select_generic device_num = <device_num> state = uistate_select_controller
endscript

script main_menu_select_training 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	change \{game_mode = training}
	change \{current_num_players = 1}
	change \{came_to_practice_from = main_menu}
	change \{came_to_practice_from_progression = none}
	change \{came_to_practice_character_id = emptyguy}
	change \{structurename = player1_status
		part = guitar}
	change \{structurename = player2_status
		part = guitar}
	set_primary_controller device_num = <device_num> state = uistate_select_practice_mode data = <...>
endscript

script main_menu_select_online 
	if NOT ($disable_wifi = 1)
		get_band_info
		getglobaltags <band_info> param = name
		assign_new_primary_controller device_num = <device_num>
		stringlength string = <name>
		if (<str_len> != 0)
			netsessionfunc func = onlinesignin params = {profile_name = <name> profile = ($current_band)}
		endif
	else
		create_new_generic_popup \{popup_type = ok_menu
			text = qs(0xf8de0a73)
			ok_func = destroy_generic_popup}
		hide_unhide_menu_elements \{id = current_menu
			time = 0.2}
	endif
endscript

script main_menu_select_backstage 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if NOT ($0x8e314709)
		create_loading_screen \{0xdf3c5641}
		wait \{10
			gameframes}
	endif
	set_primary_controller device_num = <device_num> state = uistate_backstage
endscript

script main_menu_select_downloads 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	set_primary_controller device_num = <device_num> state = uistate_downloads downloads = 1
endscript

script main_menu_select_options 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	if NOT ($0x8e314709)
		create_loading_screen \{0xdf3c5641}
		wait \{10
			gameframes}
	endif
	set_primary_controller device_num = <device_num> state = uistate_options
endscript

script main_menu_select_jam 
	getwiicontrollertype controller = <device_num>
	if ((<controller_type> = guitar) || (<controller_type> = drumkit))
		if NOT ($0x8e314709)
			create_loading_screen
			wait \{10
				gameframes}
		endif
		spawnscriptnow 0x51b2b7a8 params = {device_num = <device_num>}
		return
	endif
	create_generic_popup \{title = qs(0xcf5deb58)
		ok_menu
		message = qs(0x1ae5d32b)
		ok_eventhandlers = [
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
				0x33b632d1
			}
		]
		previous_menu = current_menu}
endscript

script 0x33b632d1 
	destroy_generic_popup
	launchevent \{type = focus
		target = current_menu}
endscript

script 0x51b2b7a8 
	unload_gempaks
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	change \{respond_to_signin_changed = 1}
	set_primary_controller device_num = <device_num> state = uistate_jam
	spawnscriptnow \{menu_music_fade
		params = {
			time = 8.160001
			out
			dont_fade_crowd
		}}
	wait \{1
		seconds}
	bg_crowd_front_end_silence \{immediate = 1}
endscript

script main_menu_select_cas device_num = ($primary_controller)
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_menu_pad_choose_sound
	if NOT ($0x8e314709)
		create_loading_screen
		wait \{15
			gameframes}
	endif
	if gotparam \{from_backstage}
		set_primary_controller device_num = <device_num> state = uistate_character_selection data = {from_main_menu = 1 from_backstage = 1}
	else
		set_primary_controller device_num = <device_num> state = uistate_character_selection data = {from_main_menu = 1}
	endif
endscript

script main_menu_select_debug 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	generic_event_choose \{state = uistate_debug}
endscript

script pop_in_new_downloads_notifier \{time = 0.5}
	wait \{0.5
		second}
	if NOT screenelementexists \{id = main_menu_text_container}
		return
	endif
	pos = (100.0, 390.0)
	text = qs(0x40fdb3fc)
	createscreenelement {
		type = textelement
		parent = main_menu_text_container
		text = <text>
		scale = 0.5
		rgba = [255 255 205 255]
		just = [center center]
		font_spacing = 5
		font = fontgrid_text_a3
		pos = <pos>
		z_priority = 5
		alpha = 0
	}
	getscreenelementdims id = <id>
	if (<width> >= 500)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((500.0, 0.0) + <height> * (0.0, 1.0)) keep_ar = 1
	endif
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	createscreenelement {
		type = textelement
		parent = main_menu_text_container
		id = new_downloads_text_glow
		text = <text>
		scale = 0.5
		rgba = [255 255 255 255]
		font = fontgrid_text_a3
		just = [center center]
		font_spacing = 5
		pos = <pos>
		z_priority = 6
		alpha = 0
	}
	getscreenelementdims id = <id>
	if (<width> >= 500)
		setscreenelementprops id = <id> scale = 1
		fit_text_in_rectangle id = <id> only_if_larger_x = 1 dims = ((500.0, 0.0) + <height> * (0.0, 1.0)) keep_ar = 1
	endif
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaysprite {
		parent = main_menu_text_container
		tex = white
		pos = (<pos>)
		just = [center center]
		rgba = [170 90 35 255]
		z = 4
		dims = ((<width> + 20) * (1.0, 0.0) + (0.0, 1.0) * (<height> + 10))
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaysprite {
		parent = main_menu_text_container
		tex = character_hub_hilite_bookend
		just = [right center]
		rgba = [170 90 35 255]
		z = 4
		pos = ((<pos>) - <width> * (0.5, 0.0) - (6.0, 1.0))
		dims = (<height> * (1.0, 1.0))
		flip_v
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	displaysprite {
		parent = main_menu_text_container
		tex = character_hub_hilite_bookend
		just = [left center]
		rgba = [170 90 35 255]
		z = 4
		pos = ((<pos>) + <width> * (0.5, 0.0) + (6.0, 1.0))
		dims = (<height> * (1.0, 1.0))
		alpha = 0
	}
	legacydoscreenelementmorph id = <id> alpha = 1 time = <time>
	spawnscriptnow \{glow_new_downloads_text
		params = {
			time = 0.75
		}}
endscript

script main_menu_select_generic 
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if NOT ($0x8e314709)
		create_loading_screen \{0xdf3c5641}
		wait \{10
			gameframes}
	endif
	generic_event_choose state = <state> data = <data>
endscript

script set_primary_controller \{event = menu_change}
	requireparams \{[
			device_num
		]
		all}
	if screenelementexists \{id = current_menu}
		launchevent \{type = unfocus
			target = current_menu}
	endif
	if ((gotparam force) || ($force_mainmenu_signin = 1))
		change \{primary_controller = -1}
		change \{last_start_pressed_device = -1}
		change \{force_mainmenu_signin = 0}
	endif
	change \{respond_to_signin_changed = 1}
	change \{signin_jam_mode = 0}
	if ($current_num_players = 1)
		if (<device_num> > -1)
			setplayerinfo 1 controller = <device_num>
		endif
	endif
	if gotparam \{jam}
		if ($jam_view_cam_created = 1)
			scriptassert \{'logic error, this value should be zero here'}
		endif
		change \{signin_jam_mode = 1}
		generic_event_choose event = <event> state = uistate_signin data = {device_num = <device_num> allow_back = 1 new_state = <state> new_data = <data> jam = 1 require_live = <require_live>}
	else
		if gotparam \{require_live}
			force = 1
		elseif gotparam \{leaderboards}
			force = 1
		endif
		if NOT gotparam \{force}
			if current_band_save_created controller = <device_num>
				change primary_controller = <device_num>
				change last_start_pressed_device = <device_num>
				refresh_autokick_cheat
				generic_event_choose event = <event> state = <state> data = <data>
				return
			endif
			get_savegame_from_controller controller = <device_num>
			if NOT is_autosave_on savegame = <savegame>
				change primary_controller = <device_num>
				change last_start_pressed_device = <device_num>
				refresh_autokick_cheat
				generic_event_choose event = <event> state = <state> data = <data>
				return
			endif
		endif
		generic_event_choose event = <event> no_sound state = <state> data = <data>
	endif
endscript
force_pak_caching = 0
disable_pak_caching = 0

script frontend_load_soundcheck \{async = 1}
	printscriptinfo \{'frontend_load_soundcheck'}
	if getpakmancurrent \{map = zones}
		printf 'frontend_load_soundcheck : %s is loaded' s = <pak> donotresolve
		if NOT (<pak> = z_soundcheck)
			load_soundcheck = 1
		endif
		if NOT gotparam \{load_soundcheck}
			if NOT istextureloaded \{id = main_menu_skull}
				load_soundcheck = 1
			endif
		endif
	endif
	if NOT frontend_anim_paks_are_loaded
		load_anims = 1
	endif
	if ((gotparam load_soundcheck) || (gotparam load_anims))
		needs_loading_screen = 1
		if pakfilesarecached
			needs_loading_screen = 0
			if NOT frontend_anim_paks_are_loaded
				needs_loading_screen = 1
			endif
		endif
		if gotparam \{loadingscreen}
			if (<needs_loading_screen> = 1)
				create_loading_screen \{0xdf3c5641}
			else
				hide_glitch \{num_frames = 3}
			endif
		endif
		if NOT isps3 \{testkit}
			if NOT pakfilesarecached
				if ((cd) || ($force_pak_caching = 1))
					if ($disable_pak_caching = 0)
						if cachepakfiles
							block \{untilevent = cache_pak_files_loaded}
						endif
					endif
				endif
			endif
		endif
		if gotparam \{load_soundcheck}
			if pakfilesarecached
				setpakmancurrentblock \{map = zones
					pak = z_soundcheck
					block_scripts = 1}
			else
				setpakmancurrentblock map = zones pak = z_soundcheck block_scripts = (<async> - 1)
			endif
		endif
		loadvenuevideo \{pn = z_soundcheck}
		if gotparam \{load_anims}
			load_frontend_anim_paks async = <async>
		endif
		if NOT gotparam \{gigboard}
			hide_glitch \{num_frames = 30}
		endif
		if gotparam \{loadingscreen}
			if (<needs_loading_screen> = 1)
				destroy_loading_screen
			endif
		endif
	endif
endscript

script reset_character_ids 
	printf \{'reset_character_ids'}
	change \{structurename = player1_status
		character_id = judy}
	change \{structurename = player2_status
		character_id = judy}
	change \{structurename = player3_status
		character_id = judy}
	change \{structurename = player4_status
		character_id = judy}
endscript

script 0x236a787f 
	create_new_generic_popup {
		popup_type = message_options
		title = qs(0x2c41c7cf)
		text = qs(0x129441b1)
		options = [
			{
				func = 0xe02470b9
				func_params = {result = 1 bandname_id = <bandname_id>}
				text = (qs(0x6d562a67))
			}
			{
				func = 0xe02470b9
				func_params = {result = 0 bandname_id = <bandname_id>}
				text = (qs(0x47157885))
			}
			{
				func = 0xe02470b9
				func_params = {result = 2 bandname_id = <bandname_id>}
				text = (qs(0xc265fcfb))
			}
		]
	}
endscript

script 0xe02470b9 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	requireparams \{[
			result
			bandname_id
		]
		all}
	destroy_generic_popup
	if (<result> = 2)
		setglobaltags <bandname_id> params = {auto_dwc_login = 1}
		getglobaltags <bandname_id> param = auto_dwc_login
		printf \{qs(0xbbca3368)}
		change \{first_time_creating_main_menu = 1}
		ui_memcard_autosave_replace \{event = menu_replace
			state = uistate_mainmenu}
	elseif (<result> = 1)
		if NOT ($disable_wifi = 1)
			get_band_info
			assign_new_primary_controller device_num = <device_num>
			getglobaltags <bandname_id> param = name
			stringlength string = <name>
			if (<str_len> != 0)
				netsessionfunc func = onlinesignin params = {profile_name = <name> want_to_enter_wifi_menu = false profile = ($current_band)}
			endif
		else
			create_new_generic_popup \{popup_type = ok_menu
				text = qs(0xf8de0a73)
				ok_func = destroy_generic_popup}
			hide_unhide_menu_elements \{id = current_menu
				time = 0.2}
		endif
	endif
endscript

script main_menu_select_music_store 
	if NOT isloggedin
		create_new_generic_popup \{popup_type = error_menu
			text = qs(0x00b9549d)
			error_func = destroy_generic_popup}
		return
	endif
	generic_event_choose \{state = uistate_dlc_menu}
endscript
