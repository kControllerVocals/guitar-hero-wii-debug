
script ui_create_freestyle_controller_disconnect \{error = controller_off}
	printf \{qs(0x04c82a79)}
	change \{freestyle_rocking_out_too_hard = 1}
	if (RenderingEnabled)
		change \{pause_no_render = 0}
		fade_overlay_on
	else
		change \{pause_no_render = 1}
		startrendering
		fade_overlay_on \{alpha = 1.0}
	endif
	if NOT FreestyleGameIsPaused
		change \{control_dis_paused = 1}
		freestyle_pause
	endif
	disable_pause
	text = qs("")
	switch <error>
		case controller_off
		<text> = $wii_freestyle_controller_disconnect_interrupt
		case perhipheral_not_connected
		<text> = $wii_freestyle_controller_disconnect
		default
		ScriptAssert \{qs(0xaceac897)}
	endswitch
	SetButtonEventMappings \{unblock_menu_input}
	create_popup_warning_menu {
		no_background
		title = $wii_freestyle_warning
		textblock = {
			text = <text>
		}
		options = [
			{
				func = ui_freestyle_controller_disconnect_continue
				text = $wii_freestyle_disconnect_continue
			}
			{
				func = ui_freestyle_controller_disconnect_quit
				text = $wii_freestyle_disconnect_main_menu
			}
		]
		dlg_z_priority = ($ps3_fade_overlay_z + 100)
		use_all_controllers
	}
	pu_warning_vmenu :obj_spawnscript \{ui_freestlye_controller_disconnect_pause}
endscript

script ui_destroy_freestyle_controller_disconnect 
	destroy_popup_warning_menu
endscript

script ui_freestyle_controller_disconnect_pause 
	ui_event_wait_for_safe
	if NOT GameIsPaused
		change \{control_dis_paused = 1}
	endif
endscript

script ui_freestyle_controller_disconnect_continue 
	if ($freestyle_player_count != 0)
		ScriptAssert \{qs(0x17221d16)}
	endif
	signin_player = -1
	GetWiiControllerType controller = <device_num>
	player = 0
	begin
	if freestyle_player_has_proper_controller player = <player> controller_type = <controller_type>
		<signin_player> = <player>
		break
	endif
	<player> = (<player> + 1)
	repeat $freestyle_max_players
	change \{check_for_unplugged_controllers = 1}
	printf qs(0x1de18e01) i = <device_num>
	ui_destroy_freestyle_controller_disconnect device_num = <device_num>
	freestyle_set_start_key_binding
	change \{freestyle_rocking_out_too_hard = 0}
	fade_overlay_off
	if (<signin_player> != -1)
		freestyle_signin_instrument player = <signin_player> controller = <device_num>
		if ($control_dis_paused = 1)
			change primary_controller = <device_num>
			freestyle_unpause
			change \{control_dis_paused = 0}
		endif
	endif
	if (<signin_player> = -1)
		ui_create_freestyle_controller_disconnect \{error = perhipheral_not_connected}
	endif
endscript

script ui_freestyle_controller_disconnect_quit 
	ui_destroy_freestyle_controller_disconnect
	fade_overlay_off
	change \{freestyle_rocking_out_too_hard = 0}
	generic_event_replace \{data = {
			state = UIstate_mainmenu
			clear_previous_stack
		}}
endscript
