
script ui_create_options_settings 
	change \{ui_options_from_submenu = 1}
	getglobaltags \{user_options}
	if screenelementexists \{id = settings_submenu}
		destroyscreenelement \{id = settings_submenu}
	endif
	createscreenelement {
		type = descinterface
		desc = 'settings_submenu_big'
		parent = <container_id>
		id = settings_submenu
		pos = (1200.0, 0.0)
		scale = 1.2
		just = [center center]
	}
	if <id> :desc_resolvealias name = alias_menu
		assignalias id = <resolved_id> alias = current_submenu
		current_submenu :se_setprops \{event_handlers = [
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
				{
					pad_back
					ui_options_check_settings
					params = {
						no_loading_screen
					}
				}
			]}
		getscreenelementchildren \{id = current_submenu}
		get_player_num_from_controller \{controller_index = $primary_controller}
		getplayerinfo <player_num> lefty_flip
		if (<lefty_flip> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 1
		endif
		if isxenon
			(<children> [0]) :se_setprops {
				text_text = qs(0x83adf584)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				event_handlers = [
					{pad_choose ui_options_controller_choose_lefty_flip params = {popup = <popup> player_device = $primary_controller}}
					{focus ui_options_settings_focus}
					{unfocus ui_options_settings_unfocus}
				]
			}
		else
			(<children> [0]) :se_setprops {
				text_text = qs(0x83adf584)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				event_handlers = [
					{pad_choose ui_options_controller_choose_lefty_flip params = {popup = <popup> player_device = $primary_controller}}
					{focus ui_options_settings_focus}
					{unfocus ui_options_settings_unfocus}
				]
			}
			current_menu :settags lefty_id = <item_id>
		endif
		vocals_get_highway_view \{player = 1}
		if (<highway_view> != static)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 1
		endif
		if ($vocal_enable_static_view = 1)
			(<children> [1]) :se_setprops {
				text_text = qs(0x804b43ff)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				event_handlers = [
					{pad_choose options_change_vocals_highway_view params = {no_restart player = 1}}
					{focus ui_options_settings_focus}
					{unfocus ui_options_settings_unfocus}
				]
			}
		else
			(<children> [1]) :se_setprops {
				text_text = qs(0x804b43ff)
				check_alpha = <check_alpha>
				cross_alpha = <cross_alpha>
				not_focusable
				rgba = [110 100 90 175]
			}
		endif
		getplayerinfo <player_num> vocals_sp_clap
		if (<vocals_sp_clap> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 1
		endif
		(<children> [2]) :se_setprops {
			text_text = qs(0xd22e8941)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose options_change_vocals_sp_clap params = {player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		if (<unpause_count> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 1
		endif
		(<children> [3]) :se_setprops {
			text_text = qs(0x8fdcfd13)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose ui_options_settings_choose_count params = {player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		getplayerinfo <player_num> use_tilt_for_starpower
		if (<use_tilt_for_starpower> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 1
		endif
		(<children> [4]) :se_setprops {
			text_text = qs(0x629b3d19)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose options_change_tilt_star_power params = {player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		getplayerinfo <player_num> enable_touch_strip
		if (<enable_touch_strip> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 1
		endif
		(<children> [5]) :se_setprops {
			text_text = qs(0xf4397d0c)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose options_change_touch_strip_option params = {player = 1}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		get_band_info
		getglobaltags <band_info> param = auto_dwc_login
		if (<auto_dwc_login> = 1)
			<check_alpha> = 1
			<cross_alpha> = 0
		else
			<check_alpha> = 0
			<cross_alpha> = 1
		endif
		(<children> [6]) :se_setprops {
			text_text = qs(0xdec9401b)
			check_alpha = <check_alpha>
			cross_alpha = <cross_alpha>
			event_handlers = [
				{pad_choose 0xb6b2e36c params = {bandname_id = <band_info>}}
				{focus ui_options_settings_focus}
				{unfocus ui_options_settings_unfocus}
			]
		}
		current_submenu :obj_spawnscript \{highlight_motion
			params = {
				menu_id = settings_submenu
			}}
	endif
	settings_submenu :obj_spawnscript \{ui_options_settings_animate_in}
	ui_options_set_settings
endscript

script ui_destroy_options_settings 
	if screenelementexists \{id = settings_submenu}
		settings_submenu :obj_spawnscript \{ui_options_settings_animate_out}
	endif
	clean_up_user_control_helpers
endscript

script ui_options_settings_choose_count 
	obj_getid
	getglobaltags \{user_options
		param = unpause_count}
	if (<unpause_count> = 1)
		<unpause_count> = 0
		soundevent \{event = checkbox_sfx}
		if gotparam \{popup}
			<objid> :se_setprops check_alpha = 0
			<objid> :se_setprops cross_alpha = 1
		else
			<objid> :se_setprops check_alpha = 0
			<objid> :se_setprops cross_alpha = 1
		endif
	else
		<unpause_count> = 1
		soundevent \{event = checkbox_check_sfx}
		if gotparam \{popup}
			<objid> :se_setprops check_alpha = 1
			<objid> :se_setprops cross_alpha = 0
		else
			<objid> :se_setprops check_alpha = 1
			<objid> :se_setprops cross_alpha = 0
		endif
	endif
	setglobaltags user_options params = {unpause_count = <unpause_count>}
endscript

script 0xfe7464e9 
	get_band_info
	getglobaltags <band_info> param = auto_dwc_login
	if (<auto_dwc_login> = 0)
		setglobaltags <bandname_id> params = {auto_dwc_login = 1}
	else
		setglobaltags <bandname_id> params = {auto_dwc_login = 0}
	endif
	printf \{qs(0xbbca3368)}
	ui_memcard_autosave_replace \{event = menu_replace
		state = uistate_options_settings}
endscript

script ui_create_options_settings_lefty_warning 
	create_new_generic_popup \{popup_type = ok_menu
		title = qs(0x361603ec)
		text = qs(0x15cdec24)
		ok_func = ui_destroy_options_settings_lefty_warning
		title_effect}
endscript

script ui_destroy_options_settings_lefty_warning 
	wait \{1
		seconds}
	destroy_generic_popup
endscript

script ui_options_settings_lefty_warning 
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	current_menu :getsingletag \{lefty_id}
	obj_spawnscript \{ui_options_controller_choose_lefty_flip
		params = {
			player_device = $primary_controller
		}}
	generic_event_back
endscript

script ui_options_settings_animate_in 
	if screenelementexists \{id = current_menu_anchor}
		current_menu_anchor :se_setprops \{career_menu_skull_pos = {
				relative
				(500.0, 0.0)
			}
			time = 0.15
			motion = linear}
	endif
	se_setprops \{pos = (440.0, -150.0)
		time = 0.15
		motion = linear}
	se_setprops \{darker_alpha = 0.4
		time = 0.15}
endscript

script ui_options_settings_animate_out 
	if screenelementexists \{id = current_menu_anchor}
		current_menu_anchor :se_setprops \{career_menu_skull_pos = {
				relative
				(-500.0, 0.0)
			}
			time = 0.15
			motion = linear}
	endif
	se_setprops \{pos = (1200.0, 0.0)
		time = 0.15
		motion = linear}
	se_setprops \{darker_alpha = 0.0
		time = 0.15}
	se_waitprops
	if screenelementexists \{id = settings_submenu}
		destroyscreenelement \{id = settings_submenu}
	endif
endscript

script ui_options_settings_focus 
	obj_getid
	gettags
	if settings_submenu :desc_resolvealias \{name = alias_highlight}
		assignalias id = <resolved_id> alias = highlight
		wait \{2
			gameframe}
		if <objid> :desc_resolvealias name = alias_text
			getscreenelementchildren id = <resolved_id>
			getscreenelementdims id = (<children> [0])
			scale = (((1.0, 0.0) * (((<width> + 85.0) / 256.0))) + (0.0, 1.5))
			getscreenelementposition id = (<children> [0]) summed
			highlight :se_setprops pos = {absolute (<screenelementpos> + (-36.0, -2.0))} scale = <scale>
			highlight :se_waitprops
			getscreenelementposition id = (<children> [0]) summed
			highlight :se_setprops pos = {absolute (<screenelementpos> + (-36.0, -12.0))} time = 0.05
			highlight :se_waitprops
			getscreenelementposition id = (<children> [0]) summed
			highlight :se_setprops pos = {absolute (<screenelementpos> + (-36.0, -2.0))} scale = <scale> time = 0.05
			highlight :se_waitprops
		endif
	endif
endscript

script ui_options_settings_unfocus 
endscript
