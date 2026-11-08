
script ui_create_options_calibrate 
	ui_options_get_controller_type
	make_menu_frontend \{screen = Guitarist
		title = qs("CALIBRATE CONTROLLER")}
	add_menu_frontend_item \{text = qs("CALIBRATE LAG")
		choose_state = UIstate_options_calibrate_lag}
	if (<type> = guitar)
	else
	endif
	menu_finish
endscript

script ui_destroy_options_calibrate 
	generic_ui_destroy
endscript
