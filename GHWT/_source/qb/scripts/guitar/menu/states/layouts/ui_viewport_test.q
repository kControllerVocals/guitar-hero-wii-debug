
script ui_create_viewport_test 
	create_viewport_ui \{texture = `tex/zones/Sound_stage/Temp_Viewport01.png`
		texdict = `zones/z_Soundcheck/z_Soundcheck.tex`
		igc_pos = (-30.003593, 0.8266729, 5.523863)
		igc_quat = (-0.041974995, 0.008947001, 0.00037700002)}
	make_menu {
		parent = <window_id>
		title = qs("Viewport Test")
	}
	add_menu_item \{text = qs("Refresh Menu")
		pad_choose_script = ui_event
		pad_choose_params = {
			event = menu_refresh
		}}
	add_menu_item \{text = qs("Exit Menu")
		choose_back}
	menu_finish
endscript

script ui_destroy_viewport_test 
	generic_ui_destrop
	destroy_viewport_ui
endscript
