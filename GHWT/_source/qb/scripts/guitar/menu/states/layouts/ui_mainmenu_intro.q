
script ui_create_mainmenu_intro 
	spawnscriptnow \{ui_create_mainmenu_intro_spawned}
endscript

script ui_destroy_mainmenu_intro 
	if ScriptIsRunning \{ui_create_mainmenu_intro}
		KillSpawnedScript \{name = ui_create_mainmenu_intro}
		DestroyScreenElement \{id = current_menu}
	endif
endscript

script ui_create_mainmenu_intro_spawned 
	if ($invite_controller = -1)
		frontend_load_soundcheck \{loadingscreen}
		ui_event_wait_for_safe
		Wait \{0.1
			seconds}
		fadetoblack \{off
			no_wait}
		Wait \{0.5
			seconds}
		create_main_menu_elements
		z_soundcheck_UIAnimation
		SoundEvent \{event = Front_End_Main_Menu_Intro}
		Wait \{2.4
			seconds}
	endif
	ui_event_wait \{event = menu_replace
		data = {
			state = UIstate_mainmenu
		}}
endscript
