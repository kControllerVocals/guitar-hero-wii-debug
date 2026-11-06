
script ui_create_jam_band \{tutorial = 0}
	if (<tutorial> = 0)
		add_active_controllers_local
	endif
	change \{playing_song = 1}
	spawnscriptnow create_jam_band_menu id = jam_band_spawns params = {<...>}
endscript

script ui_destroy_jam_band 
	destroy_jam_band_menu
	change \{playing_song = 0}
	destroy_popup_warning_menu
	jam_force_kill_tutorial \{status = force_exit}
	if screenelementexists \{id = training_container}
		destroyscreenelement \{id = training_container}
	endif
endscript

script ui_deinit_jam_band 
	change \{select_shift = 1}
	change \{debug_show_analog_options = 1}
endscript
0xc7415764 = $ui_create_jam_band
0xd5b146d6 = $ui_destroy_jam_band
0x37f709fb = $ui_create_jam_band
0x09659d60 = $ui_destroy_jam_band
