band_name_logo_controller = 0
randomize_name_and_logo = 0
show_stats_agreement = 0
randomized_name = qs("")

script ui_init_band_name_logo controller = ($primary_controller)
	init_band_logo controller = <controller> no_wait
	change \{ui_band_name_logo_current_mode = main}
	cas_update_band_logo controller = ($band_name_logo_controller) no_wait
	if NOT current_band_has_band_name controller = ($band_name_logo_controller)
		change \{randomize_name_and_logo = 1}
		change \{show_stats_agreement = 1}
	endif
endscript
ui_band_name_logo_current_mode = main

script ui_create_band_name_logo controller = ($primary_controller)
	change band_name_logo_controller = <controller>
	change menu_over_ride_exclusive_device = <controller>
	hide_glitch \{num_frames = 5}
	if NOT ScreenElementExists \{id = BandInterface}
		name_a = $wii_bandlogo_name_idea_a
		name_b = $wii_bandlogo_name_idea_b
		name_c = $wii_bandlogo_name_idea_c
		name_d = $wii_bandlogo_name_idea_d
		name_e = $wii_bandlogo_name_idea_e
		name_f = $wii_bandlogo_name_idea_f
		name_g = $wii_bandlogo_name_idea_g
		name_h = $wii_bandlogo_name_idea_h
		name_i = $wii_bandlogo_name_idea_i
		name_j = $wii_bandlogo_name_idea_j
		random_name_tip = Random (@ <name_a> @ <name_b> @ <name_c> @ <name_d> @ <name_e> @ <name_f> @ <name_g> @ <name_h> @ <name_i> @ <name_j> )
		tags = {
			mode = main
			text_case = upper
			letter_index = 0
			upper_characters = qs("\LABCDEFGHIJKLMNOPQRSTUVWXYZ")
			lower_characters = qs("\Labcdefghijklmnopqrstuvwxyz")
			number_characters = qs("\L0123456789")
			misc_characters = qs(0x8bff35e6)
			from_save = <from_save>
			event_params = <event_params>
			signin_changed = ($respond_to_signin_changed)
			random_name_tip = <random_name_tip>
		}
		if GotParam \{from_boot}
			tags = {<tags> from_boot}
		endif
		CreateScreenElement {
			parent = root_window
			id = BandInterface
			type = DescInterface
			desc = 'band_name'
			exclusive_device = ($band_name_logo_controller)
			just = [center center]
			scale = 1.1
			z_priority = -20
			tags = <tags>
		}
		change \{respond_to_signin_changed = 1}
		PopAssetContext
	else
		BandInterface :SE_SetProps \{pos = {
				relative
				(-250.0, 0.0)
			}
			time = 0.2}
	endif
	if current_band_has_band_name controller = ($band_name_logo_controller)
		get_savegame_from_controller controller = ($band_name_logo_controller)
		get_current_band_info
		GetGlobalTags savegame = <savegame> <band_info>
		BandInterface :SE_SetProps band_name_text = <name> band_name_font = <font>
	else
		BandInterface :SE_SetProps band_name_text = $randomized_name band_name_font = <font>
	endif
	if ($randomize_name_and_logo = 1)
		ui_band_name_logo_random_name \{no_sound}
		randomize_band_logo
		change \{randomize_name_and_logo = 0}
		change randomized_name = <random_name>
	endif
	if NOT ((GotParam from_boot) || (GotParam from_save))
		BandInterface :SE_SetProps band_name_info_text = <random_name_tip>
	endif
	AssignAlias \{id = BandInterface
		alias = band_name_menu}
	ui_band_name_logo_mode
	edit_graphic_prepare_sprite_infos
	GenerateCAGTexture info_array = <sprite_infos> player = <currentSkaterProfileIndex> test = 0 slow_path = 1
	SpawnScriptLater \{ui_band_name_logo_texture_preview}
	LaunchEvent \{type = focus
		target = BandInterface}
	if GotParam \{skip_destroy}
		ui_event_remove_params \{param = skip_destroy}
	endif
	if IsLoggedIn
		create_new_generic_popup \{popup_type = yes_no_menu
			title = $wii_error_lowercase
			text = $wii_bandlogo_no_connect
			yes_func = band_name_logo_online_confirmation
			yes_func_params = {
				logoff
			}
			no_func = band_name_logo_online_confirmation
			no_func_params = {
				go_back
			}
			title_effect}
	endif
	if NOT ScreenElementExists \{id = boot_brick_bg_plane}
		CreateScreenElement \{type = SpriteElement
			parent = root_window
			texture = boot_brick_bg
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = -25
			id = boot_brick_bg_plane}
	endif
	if NOT ScreenElementExists \{id = boot_brick_bg_plane_gradient}
		CreateScreenElement \{type = SpriteElement
			parent = root_window
			texture = gradient_256
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z_priority = -20
			alpha = 0.5
			blend = subtract
			flip_h
			id = boot_brick_bg_plane_gradient}
	endif
endscript

script ui_band_name_logo_texture_preview 
	Wait \{2
		gameframes}
	if ScreenElementExists \{id = BandInterface}
		if NOT ScreenElementExists \{id = band_logo_preview_sprite}
			PushAssetContext context = ($CAS_Band_Logo_Details.assetcontext)
			CreateScreenElement {
				type = SpriteElement
				parent = BandInterface
				texture = ($CAS_Band_Logo_Details.textureasset)
				just = [left center]
				rgba = [255 255 255 250]
				pos = (435.0, 300.0)
				dims = (250.0, 250.0)
				scale = (1.15, 1.02)
				rot_angle = -1
				z_priority = 5
				id = band_logo_preview_sprite
			}
		endif
	endif
endscript

script ui_destroy_band_name_logo 
	clean_up_user_control_helpers
	if NOT GotParam \{skip_destroy}
		if ScreenElementExists \{id = BandInterface}
			BandInterface :GetTags
			change respond_to_signin_changed = <signin_changed>
			DestroyScreenElement \{id = BandInterface}
		endif
		if ScreenElementExists \{id = boot_brick_bg_plane}
			DestroyScreenElement \{id = boot_brick_bg_plane}
		endif
		if ScreenElementExists \{id = boot_brick_bg_plane_gradient}
			DestroyScreenElement \{id = boot_brick_bg_plane_gradient}
		endif
	else
		ui_event_remove_params \{param = skip_destroy}
	endif
endscript

script leaving_band_name_logo 
	RequireParams \{[
			func
		]
		all}
	destroy_generic_popup
	if ScreenElementExists \{id = BandInterface}
		ui_event_remove_params \{param = skip_destroy}
		ui_destroy_band_name_logo
	endif
	if GotParam \{func_params}
		printf \{qs(0x1d47d34e)}
		<func> <func_params>
	else
		printf \{qs(0x0cdeb242)}
		<func>
	endif
endscript

script ui_deinit_band_name_logo 
	change \{cas_override_object = none}
	BandLogoObject :SwitchOffAtomic \{CAS_Band_Logo}
	cas_free_resources \{no_bink
		no_loading_screen
		band_logo
		no_fix_camera}
	change \{menu_over_ride_exclusive_device = -1}
	if ($first_time_creating_main_menu = 1)
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = -100
			no_wait}
	endif
	if ScreenElementExists \{id = BandInterface}
		DestroyScreenElement \{id = BandInterface}
	endif
	if ScreenElementExists \{id = boot_brick_bg_plane}
		DestroyScreenElement \{id = boot_brick_bg_plane}
	endif
	if ScreenElementExists \{id = boot_brick_bg_plane_gradient}
		DestroyScreenElement \{id = boot_brick_bg_plane_gradient}
	endif
endscript

script ui_band_name_logo_save 
	BandInterface :SE_GetProps
	BandInterface :GetTags
	if NOT GotParam \{no_mode_change}
		change ui_band_name_logo_current_mode = <mode>
	endif
	GetTrueStartTime
	FormatText checksumname = band_unique_id 'band_info_%d' d = <StartTime>
	get_current_band_info
	SetGlobalTags savegame = <savegame> <band_info> params = {name = <band_name_text> band_unique_id = <band_unique_id> font = <band_name_font>}
	agora_update band_id = <band_unique_id> name = <band_name_text> new_band
	GetCASAppearancePart \{part = CAS_Band_Logo}
	get_current_band_info
	LockGlobalTags \{off}
	cap = $edit_graphic_layer_infos
	SetGlobalTags savegame = <savegame> <band_info> params = {band_logo = <cap>}
	LockGlobalTags
endscript

script ui_band_name_logo_continue 
	BandInterface :GetTags
	ui_band_name_logo_save
	SoundEvent \{event = Enter_Band_Name_Finish}
	NetSessionFunc func = SetActivePlayer params = {profile = ($current_band)}
	CreateProfile
	if GotParam \{from_boot}
		UnPauseGame
		printf \{'ui_band_name_logo_continue - ui_event_wait_for_safe'}
		ui_event_wait_for_safe
	endif
	if ((GotParam from_boot) || (GotParam from_save))
		if ($show_stats_agreement = 1)
			change \{show_stats_agreement = 0}
			create_new_generic_popup \{popup_type = ok_menu
				text = $wii_stats_agreement
				title = $wii_stats_agreement_title
				ok_func = confirm_stats_agreement
				title_effect}
		else
			ui_memcard_autosave_replace event = menu_replace state = uistate_boot_download_scan data = {event_params = <event_params> savegame = <device_num> controller = <device_num>}
		endif
	else
		data = {controller = <device_num>}
		if GotParam \{event_params}
			if StructureContains Structure = <event_params> data
				data = {(<event_params>.data) savegame = <device_num> controller = <device_num>}
			endif
		endif
		ui_memcard_autosave_replace <event_params> data = <data>
	endif
endscript

script confirm_stats_agreement 
	destroy_new_generic_popup
	ui_memcard_autosave_replace event = menu_replace state = uistate_boot_download_scan data = {event_params = <event_params> savegame = <device_num> controller = <device_num>}
endscript

script ui_band_name_logo_edit 
	RequireParams \{[
			savegame
		]
		all}
	if ScreenElementExists \{id = BandInterface}
		BandInterface :SE_SetProps \{pos = {
				relative
				(250.0, 0.0)
			}
			time = 0.2}
	endif
	generic_event_choose data = {state = UIstate_cap_main text = qs("Edit Band Logo") part = CAS_Band_Logo num_icons = 0 savegame = <savegame>}
	ui_event_add_params \{skip_destroy = 1}
endscript

script ui_band_name_logo_mode \{mode = main}
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	change \{rich_presence_context = presence_band_logo_edit_and_instrument_edit}
	if GotParam \{check_name}
		BandInterface :SE_GetProps
		if NOT ui_band_name_is_valid text = <band_name_text>
			SoundEvent \{event = Menu_Warning_SFX}
			BandInterface :obj_spawnscript \{ui_band_name_logo_warning}
			return
		endif
	endif
	if GotParam \{From_Logo}
		SoundEvent \{event = Box_Check_SFX}
	elseif GotParam \{From_Name}
		SoundEvent \{event = Box_Check_SFX}
		ui_band_name_logo_save \{no_mode_change}
	endif
	clean_up_user_control_helpers
	if NOT ($ui_band_name_logo_current_mode = main)
		mode = $ui_band_name_logo_current_mode
		change \{ui_band_name_logo_current_mode = main}
	endif
	BandInterface :SetTags mode = <mode>
	BandInterface :GetTags
	BandInterface :SE_SetProps \{event_handlers = [
		]
		replace_handlers}
	switch (<mode>)
		case main
		get_savegame_from_controller controller = ($band_name_logo_controller)
		event_handlers = [
			{pad_choose ui_band_name_logo_continue}
			{pad_option2 ui_band_name_logo_mode params = {mode = name}}
			{pad_option ui_band_name_logo_edit params = {savegame = <savegame>}}
			{pad_l1 ui_band_name_logo_random_name}
		]
		if BandInterface :Desc_ResolveAlias \{name = alias_cursor}
			<resolved_id> :SE_SetProps text = qs("") alpha = 0.0
			KillSpawnedScript \{name = ui_band_name_logo_blink_cursor}
		endif
		if BandInterface :Desc_ResolveAlias \{name = alias_band_name_letter}
			<resolved_id> :SE_SetProps font = fontgrid_text_a6_fire material = null alpha = 0.25
		endif
		add_user_control_helper \{text = $wii_accept
			button = green
			z = 100000}
		if NOT GotParam \{from_boot}
			add_user_control_helper \{text = $wii_cancel
				button = red
				z = 100000}
		endif
		add_user_control_helper \{text = $wii_bandlogo_name
			button = Yellow
			z = 100000}
		add_user_control_helper \{text = $wii_bandlogo_logo_caps
			button = Blue
			z = 100000}
		add_user_control_helper \{text = $wii_bandlogo_randname
			button = Orange
			z = 100000}
		if NOT GotParam \{from_boot}
			event_handlers = [
				{pad_back generic_event_back}
				{pad_choose ui_band_name_logo_continue}
				{pad_option2 ui_band_name_logo_mode params = {mode = name}}
				{pad_option ui_band_name_logo_edit params = {savegame = <savegame>}}
				{pad_l1 ui_band_name_logo_random_name}
			]
		else
			pad_back_script = nullscript
		endif
		case name
		if NOT GotParam \{no_sound}
			generic_menu_pad_choose_sound
		endif
		BandInterface :SE_GetProps
		event_handlers = [
			{pad_choose ui_band_name_logo_mode params = {check_name From_Name}}
			{pad_back ui_band_name_logo_cancel_name params = {band_name_text = <band_name_text>}}
			{pad_option2 ui_band_name_logo_enter_character}
			{pad_option ui_band_name_logo_backspace}
			{pad_l1 ui_band_name_logo_toggle_case}
			{pad_up ui_band_name_logo_scroll}
			{pad_down ui_band_name_logo_scroll params = {up}}
		]
		if BandInterface :Desc_ResolveAlias \{name = alias_cursor}
			if NOT ScriptIsRunning \{ui_band_name_logo_blink_cursor}
				<resolved_id> :SE_SetProps text = qs("\L_") alpha = 1.0
				<resolved_id> :obj_spawnscript ui_band_name_logo_blink_cursor
			endif
		endif
		if BandInterface :Desc_ResolveAlias \{name = alias_band_name_letter}
			<resolved_id> :SE_SetProps font = fontgrid_text_a6_fire material = sys_fontgrid_text_A6_fire_sys_fontgrid_text_A6_fire alpha = 1.0
		endif
		add_user_control_helper \{text = $wii_accept
			button = green
			z = 100000}
		add_user_control_helper \{text = $wii_cancel
			button = red
			z = 100000}
		add_user_control_helper \{text = $wii_textentry_add_letter
			button = Yellow
			z = 100000}
		add_user_control_helper \{text = $wii_textentry_backspace
			button = Blue
			z = 100000}
		BandInterface :GetSingleTag \{text_case}
		controller = ($band_name_logo_controller)
		switch (<text_case>)
			case upper
			add_user_control_helper \{text = $wii_textentry_lower
				button = Orange
				z = 100000}
			case lower
			add_user_control_helper \{text = $wii_textentry_numbers
				button = Orange
				z = 100000}
			case number
			add_user_control_helper \{text = $wii_textentry_symbols
				button = Orange
				z = 100000}
			case Misc
			add_user_control_helper \{text = $wii_textentry_upper
				button = Orange
				z = 100000}
		endswitch
	endswitch
	BandInterface :SE_SetProps {
		event_handlers = <event_handlers>
		replace_handlers
	}
endscript

script ui_band_name_logo_toggle_case 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	BandInterface :GetTags
	switch (<text_case>)
		case upper
		BandInterface :SetTags \{text_case = lower}
		StringToCharArray string = <lower_characters>
		band_name_letter_text = (<char_array> [<letter_index>])
		case lower
		BandInterface :SetTags \{text_case = number}
		StringToCharArray string = <number_characters>
		band_name_letter_text = (<char_array> [0])
		case number
		BandInterface :SetTags \{text_case = Misc}
		StringToCharArray string = <misc_characters>
		band_name_letter_text = (<char_array> [0])
		case Misc
		BandInterface :SetTags \{text_case = upper}
		StringToCharArray string = <upper_characters>
		band_name_letter_text = (<char_array> [<letter_index>])
	endswitch
	SoundEvent \{event = Enter_Band_Name_Caps}
	ui_band_name_logo_mode \{mode = name
		no_sound}
	BandInterface :SE_SetProps band_name_letter_text = <band_name_letter_text>
endscript

script ui_band_name_logo_random_name 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	cas_random_band_name
	if NOT GotParam \{no_sound}
		SoundEvent \{event = Enter_Band_Name_Caps}
	endif
	BandInterface :SE_SetProps band_name_text = <random_name>
	ui_band_name_logo_save \{no_mode_change}
	return random_name = <random_name>
endscript

script ui_band_name_logo_scroll 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	BandInterface :SE_GetProps
	BandInterface :GetTags
	switch (<text_case>)
		case upper
		StringToCharArray string = <upper_characters>
		case lower
		StringToCharArray string = <lower_characters>
		case number
		StringToCharArray string = <number_characters>
		case Misc
		StringToCharArray string = <misc_characters>
	endswitch
	if GotParam \{char_array}
		GetArraySize <char_array>
		i = 0
		begin
		if (<band_name_letter_text> = (<char_array> [<i>]))
			break
		endif
		i = (<i> + 1)
		repeat <array_size>
		if (<i> = <array_size>)
			return
		endif
		if GotParam \{up}
			SoundEvent \{event = Enter_Band_Name_Scroll_Up}
			if (<i> = (<array_size> - 1))
				switch (<text_case>)
					case upper
					BandInterface :SetTags \{text_case = lower}
					StringToCharArray string = <lower_characters>
					BandInterface :SetTags \{letter_index = 0}
					case lower
					BandInterface :SetTags \{text_case = number}
					StringToCharArray string = <number_characters>
					case number
					BandInterface :SetTags \{text_case = Misc}
					StringToCharArray string = <misc_characters>
					case Misc
					BandInterface :SetTags \{text_case = upper}
					StringToCharArray string = <upper_characters>
					BandInterface :SetTags \{letter_index = 0}
				endswitch
				band_name_letter_text = (<char_array> [0])
			else
				band_name_letter_text = (<char_array> [(<i> + 1)])
				if ((<text_case> = upper) || (<text_case> = lower))
					BandInterface :SetTags letter_index = (<i> + 1)
				endif
			endif
			BandInterface :obj_spawnscript \{ui_band_name_logo_scale_up_arrow}
		else
			SoundEvent \{event = Enter_Band_Name_Scroll_Down}
			if (<i> = 0)
				switch (<text_case>)
					case upper
					BandInterface :SetTags \{text_case = Misc}
					StringToCharArray string = <misc_characters>
					case lower
					BandInterface :SetTags \{text_case = upper}
					StringToCharArray string = <upper_characters>
					case number
					BandInterface :SetTags \{text_case = lower}
					StringToCharArray string = <lower_characters>
					case Misc
					BandInterface :SetTags \{text_case = number}
					StringToCharArray string = <number_characters>
				endswitch
				GetArraySize <char_array>
				band_name_letter_text = (<char_array> [(<array_size> - 1)])
				BandInterface :GetSingleTag \{text_case}
				if ((<text_case> = upper) || (<text_case> = lower))
					BandInterface :SetTags letter_index = (<array_size> - 1)
				endif
			else
				band_name_letter_text = (<char_array> [(<i> - 1)])
				if ((<text_case> = upper) || (<text_case> = lower))
					BandInterface :SetTags letter_index = (<i> - 1)
				endif
			endif
			BandInterface :obj_spawnscript \{ui_band_name_logo_scale_down_arrow}
		endif
	endif
	ui_band_name_logo_mode \{mode = name
		no_sound}
	BandInterface :SE_SetProps band_name_letter_text = <band_name_letter_text>
endscript

script ui_band_name_logo_enter_character 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	BandInterface :SE_GetProps
	StringToCharArray string = <band_name_text>
	if GotParam \{char_array}
		GetArraySize <char_array>
		if NOT (<array_size> >= 20)
			band_name_text = (<band_name_text> + <band_name_letter_text>)
			SoundEvent \{event = enter_band_name_select}
			BandInterface :SE_SetProps band_name_text = <band_name_text>
		else
			menu_scroll_end_sound
		endif
	endif
endscript

script ui_band_name_logo_backspace 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	BandInterface :SE_GetProps
	StringToCharArray string = <band_name_text>
	if GotParam \{char_array}
		GetArraySize <char_array>
		text = qs("\L")
		if (<array_size> > 1)
			i = 0
			begin
			text = (<text> + (<char_array> [<i>]))
			i = (<i> + 1)
			repeat (<array_size> - 1)
			SoundEvent \{event = Enter_Band_Name_Back}
		elseif (<array_size> = 1)
			SoundEvent \{event = Enter_Band_Name_Back}
		else
			menu_scroll_end_sound
		endif
		BandInterface :SE_SetProps band_name_text = <text>
	endif
endscript

script ui_band_name_logo_toggle_font 
	BandInterface :SE_GetProps
	GetArraySize \{$car_font_list}
	i = 0
	printstruct <...>
	begin
	if (<band_name_font> = ((($car_font_list) [<i>]).font_checksum))
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<i> >= (<array_size> - 1))
		i = 0
	else
		i = (<i> + 1)
	endif
	SoundEvent \{event = Enter_Band_Name_Caps}
	BandInterface :SE_SetProps band_name_font = ((($car_font_list) [<i>]).font_checksum)
endscript

script ui_band_name_logo_blink_cursor 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	begin
	SE_SetProps \{alpha = 0.0
		time = 0.25
		motion = ease_out}
	SE_WaitProps
	SE_SetProps \{alpha = 1.0
		time = 0.25
		motion = ease_out}
	SE_WaitProps
	repeat
endscript

script ui_band_name_logo_warning 
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	GetTags
	BandInterface :SE_SetProps \{band_name_info_text = $wii_bandlogo_must_enter_name}
	Wait \{4.0
		seconds}
	if ((GotParam from_boot) || (GotParam from_save))
		BandInterface :SE_SetProps \{band_name_info_text = $wii_bandlogo_dontworry}
	else
		BandInterface :SE_SetProps band_name_info_text = <random_name_tip>
	endif
endscript

script ui_band_name_logo_scale_up_arrow 
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	BandInterface :SE_SetProps \{name_arrow_up_scale = 1.25
		time = 0.1}
	Wait \{0.1
		seconds}
	BandInterface :SE_SetProps \{name_arrow_up_scale = 1.0
		time = 0.05}
endscript

script ui_band_name_logo_scale_down_arrow 
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	BandInterface :SE_SetProps \{name_arrow_dn_scale = 1.25
		time = 0.1
		motion = ease_out}
	Wait \{0.1
		seconds}
	BandInterface :SE_SetProps \{name_arrow_dn_scale = 1.0
		time = 0.1
		motion = ease_out}
endscript

script ui_band_name_logo_cancel_name 
	BandInterface :SE_SetProps band_name_text = <band_name_text>
	if ui_band_name_is_valid text = <band_name_text>
		ui_band_name_logo_mode \{mode = main
			From_Name}
	else
		BandInterface :obj_spawnscript \{ui_band_name_logo_warning}
	endif
endscript

script band_name_logo_online_confirmation 
	destroy_generic_popup
	if GotParam \{logoff}
		LogOut
	endif
	if GotParam \{go_back}
		generic_event_back
	endif
endscript
