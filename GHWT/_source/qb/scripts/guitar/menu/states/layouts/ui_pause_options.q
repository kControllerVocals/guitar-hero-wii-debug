
script ui_create_pause_options 
	ui_pausemenu_create_bg \{title_text = qs("OPTIONS")}
	if pausemenu_bg :Desc_ResolveAlias \{name = alias_menu}
		<parent> = <resolved_id>
	endif
	make_menu {
		parent = <parent>
		centered_offset = (-475.0, -225.0)
		exclusive_device = <player_device>
		extra_z = 600
		centered
		noBG
	}
	current_menu :SE_SetProps \{rot_angle = -12}
	add_menu_item {
		text = qs("SET AUDIO")
		choose_state = uistate_options_audio
		choose_state_data = {device_num = <player_device>}
	}
	player_index = 0
	begin
	GetPlayerInfo (<player_index> + 1) controller
	if (<controller> = <player_device>)
		GetPlayerInfo (<player_index> + 1) part
		GetPlayerInfo (<player_index> + 1) lefty_flip
		break
	endif
	player_index = (<player_index> + 1)
	repeat ($current_num_players)
	if (<player_device> = $primary_controller)
		add_menu_item {
			text = qs("CALIBRATE LAG")
			choose_state = uistate_options_calibrate_lag_warning
			choose_state_data = {controller = <player_device>}
		}
	endif
	GetPlayerInfo <player> part
	if NOT (<part> = Vocals)
		add_menu_item {
			text = qs("LEFTY FLIP")
			choose_state = uistate_pausemenu_lefty_flip_warning
			choose_state_data = {player = <player>}
		}
		GetPlayerInfo <player> lefty_flip
		if (<lefty_flip> = 1)
			lefty_tex = Options_Controller_Check
		else
			lefty_tex = Options_Controller_X
		endif
		CreateScreenElement {
			type = SpriteElement
			parent = <item_container_id>
			texture = <lefty_tex>
			pos = (200.0, 20.0)
		}
	endif
	if NOT ((<part> = Vocals) || (<part> = drum))
		add_menu_item {
			text = qs("TILT SENSOR")
			pad_choose_script = options_change_tilt_star_power
			pad_choose_params = {player = <player>}
		}
		GetPlayerInfo <player> use_tilt_for_starpower
		if (<use_tilt_for_starpower> = 1)
			tilt_tex = Options_Controller_Check
		else
			tilt_tex = Options_Controller_X
		endif
		CreateScreenElement {
			local_id = tilt_check
			type = SpriteElement
			parent = <item_container_id>
			texture = <tilt_tex>
			pos = (200.0, 20.0)
		}
	endif
	if NOT ((<part> = Vocals) || (<part> = drum))
		add_menu_item {
			text = qs("TOUCH STRIP")
			pad_choose_script = options_change_touch_strip_option
			pad_choose_params = {player = <player>}
		}
		GetPlayerInfo <player> enable_touch_strip
		if (<enable_touch_strip> = 1)
			touch_tex = Options_Controller_Check
		else
			touch_tex = Options_Controller_X
		endif
		CreateScreenElement {
			local_id = touch_check
			type = SpriteElement
			parent = <item_container_id>
			texture = <touch_tex>
			pos = (200.0, 20.0)
		}
	endif
	if ($current_song != jamsession)
		if (<part> = Vocals)
			if ($vocal_enable_static_view = 1)
				add_menu_item {
					text = qs("SCROLLING VOCALS")
					choose_state = uistate_options_vocals_view_warning
					choose_state_data = {controller = <player_device> player = <player>}
				}
				vocals_get_highway_view player = <player>
				<vocals_highway_view> = <highway_view>
				if (<vocals_highway_view> = static)
					scroll_tex = Options_Controller_X
				else
					scroll_tex = Options_Controller_Check
				endif
				CreateScreenElement {
					type = SpriteElement
					parent = <item_container_id>
					texture = <scroll_tex>
					pos = (200.0, 20.0)
				}
			endif
			add_menu_item {
				text = qs("VOCALS STAR POWER CLAP")
				pad_choose_script = options_change_vocals_sp_clap
				pad_choose_params = {player = <player> checkbox_child = check check_tex = Options_Controller_Check x_tex = Options_Controller_X}
			}
			GetPlayerInfo <player> vocals_sp_clap
			if (<vocals_sp_clap> = 0)
				scroll_tex = Options_Controller_X
			else
				scroll_tex = Options_Controller_Check
			endif
			CreateScreenElement {
				local_id = check
				type = SpriteElement
				parent = <item_container_id>
				texture = <scroll_tex>
				pos = (200.0, 20.0)
			}
		endif
	endif
	count_texture = Options_Controller_X
	GetGlobalTags \{user_options
		param = unpause_count}
	if (<unpause_count> = 1)
		count_texture = Options_Controller_Check
	endif
	add_menu_item \{text = qs("COUNTDOWN")
		pad_choose_script = ui_pause_options_choose_count
		pad_choose_params = {
			popup = 1
			player = 1
		}}
	CreateScreenElement {
		type = SpriteElement
		parent = <item_container_id>
		local_id = check
		pos = (200.0, 20.0)
		just = [center center]
		texture = <count_texture>
	}
	menu_finish
endscript

script ui_destroy_pause_options 
	generic_ui_destroy
	ui_pausemenu_destroy_bg
endscript

script ui_pause_options_choose_count 
	Obj_GetID
	get_savegame_from_controller controller = <device_num>
	GetGlobalTags user_options param = unpause_count savegame = <savegame>
	if ResolveScreenElementId id = {<ObjID> child = check}
		if (<unpause_count> = 1)
			<unpause_count> = 0
			SoundEvent \{event = checkbox_sfx}
			if GotParam \{popup}
				<resolved_id> :SetProps texture = Options_Controller_X
			else
				<resolved_id> :SetProps texture = data_settings_xmark
			endif
		else
			<unpause_count> = 1
			SoundEvent \{event = CheckBox_Check_SFX}
			if GotParam \{popup}
				<resolved_id> :SetProps texture = Options_Controller_Check
			else
				<resolved_id> :SetProps texture = data_settings_checkmark
			endif
		endif
		SetGlobalTags user_options params = {unpause_count = <unpause_count>} savegame = <savegame>
	endif
endscript
