in_main_menu = 0

script ui_create_mainmenu 
	spawnscriptnow ui_create_mainmenu_spawned params = <...>
endscript

script ui_create_mainmenu_spawned 
	SD_Unload_Song
	freestyle_leave_flow
	CleanUpNoteMappings
	change \{respond_to_signin_changed = 0}
	change \{respond_to_signin_changed_func = main_menu_signin_changed}
	change \{in_main_menu = 1}
	if ($invite_controller = -1)
		printf \{'ui_create_mainmenu_spawned - NO INVITE'}
		change \{in_join_band_screens = 0}
		change \{game_mode = p1_quickplay}
		change \{current_num_players = 1}
		add_active_controllers
		fadetoblack \{off
			alpha = 1.0
			time = 0.1
			z_priority = 100
			no_wait}
		clean_up_user_control_helpers
		if NOT ScreenElementExists \{id = current_menu}
			frontend_load_soundcheck \{loadingscreen}
			create_main_menu_elements
		endif
		create_main_menu
		add_user_control_helper \{text = qs("SELECT")
			button = green
			z = 100}
		LaunchEvent type = focus target = current_menu data = {child_index = <selected_index>}
		destroy_loading_screen
	else
		printf \{'ui_create_mainmenu_spawned - INVITE CONTROLLER %c'
			c = $invite_controller}
		frontend_load_soundcheck \{loadingscreen
			async = 0}
		z_soundcheck_UIResetPos
	endif
endscript

script ui_destroy_mainmenu 
	change \{in_main_menu = 0}
	spawnscriptnow \{destroy_main_menu}
	if ScreenElementExists \{id = MotdInterface}
		MotdInterface :Die
	endif
endscript

script main_menu_signin_changed 
	printf \{qs("\Lmain_menu_signin_changed")}
	RemoveContentFiles playerid = <controller>
	reset_globaltags savegame = <controller>
endscript

script create_motd 
	CreateScreenElement \{parent = root_window
		id = MotdInterface
		type = DescInterface
		desc = 'motd'
		title_text = qs(0xe7e0461d)
		text_text = qs(0x7922cca1)
		pos = (-200.0, 600.0)}
	MotdInterface :SE_SetProps \{event_handlers = [
			{
				pad_option2
				generic_event_choose
				params = {
					state = UIstate_motd
				}
			}
		]}
	RunScriptOnScreenElement \{id = {
			MotdInterface
			child = MOTD_Container
		}
		run_motd}
	add_user_control_helper \{text = qs("DAILY MESSAGE")
		button = Yellow
		z = 100}
	LaunchEvent \{type = focus
		target = MotdInterface}
endscript

script run_motd 
	Obj_GetID
	SetProps \{pos = (0.0, 0.0)}
	RunScriptOnScreenElement id = {<ObjID> child = demon_container} run_motd_demon
	begin
	SetProps \{pos = (1680.0, 0.0)
		time = 10}
	SE_WaitProps
	SetProps \{pos = (0.0, 0.0)
		time = 10}
	SE_WaitProps
	Wait \{1
		second}
	repeat
endscript

script run_motd_demon 
	Obj_GetID
	GetScreenElementChildren id = <ObjID>
	if GotParam \{children}
		GetArraySize <children>
		i = 0
		Add = 1
		begin
		j = 0
		begin
		if (<i> = <j>)
			SetScreenElementProps id = (<children> [<j>]) alpha = 1.0 time = 0.05
		else
			SetScreenElementProps id = (<children> [<j>]) alpha = 0.0 time = 0.05
		endif
		j = (<j> + 1)
		repeat <array_size>
		if (<i> = 0)
			Add = 1
		elseif (<i> = (<array_size> - 1))
			Add = -1
		endif
		i = (<i> + <Add>)
		Wait \{0.25
			seconds}
		repeat
	endif
endscript
main_menu_fs = {
	create = ui_mainmenu_temp
	destroy = destroy_main_menu
	actions = [
		{
			action = select_xbox_live
			flow_state = online_signin_fs
		}
	]
}

script ui_mainmenu_temp 
	ui_event \{event = menu_refresh}
endscript
