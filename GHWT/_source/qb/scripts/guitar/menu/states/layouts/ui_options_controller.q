
script ui_create_options_controller 
	ui_options_get_controller_type
	make_menu_frontend \{screen = Guitarist
		title = qs("Controller Settings")}
	menu_finish
endscript

script ui_destroy_options_controller 
	generic_ui_destroy
endscript

script ui_options_controller_choose_lefty_flip \{popup = 0
		player_device = $primary_controller}
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	player = 1
	i = 1
	begin
	GetPlayerInfo <i> controller
	if (<controller> = <player_device>)
		player = <i>
		break
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
	if (<popup>)
		generic_event_choose state = uistate_pausemenu_lefty_flip_warning data = {player = <player>}
	else
		GetTags
		Obj_GetID
		<id> = <ObjID>
		if ResolveScreenElementId id = {<id> child = {0 child = check}}
			get_savegame_from_controller controller = <player_device>
			GetGlobalTags user_options savegame = <savegame>
			if (<lefty_flip_save> = 1)
				new_flip = 0
				SoundEvent \{event = checkbox_sfx}
				<resolved_id> :SetProps texture = data_settings_xmark
				if (<player> = 1)
					change \{pad_event_up_inversion = true}
				endif
			else
				new_flip = 1
				SoundEvent \{event = CheckBox_Check_SFX}
				<resolved_id> :SetProps texture = data_settings_checkmark
				if (<player> = 1)
					change \{pad_event_up_inversion = false}
				endif
			endif
			i = 1
			begin
			SetPlayerInfo <i> lefty_flip = <new_flip>
			i = (<i> + 1)
			repeat 4
			SetGlobalTags savegame = <savegame> user_options params = {lefty_flip_save = <new_flip>}
		endif
	endif
endscript
