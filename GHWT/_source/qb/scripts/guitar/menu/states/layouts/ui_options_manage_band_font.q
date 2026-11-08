
script ui_create_options_manage_band_font 
	make_generic_menu {
		parent = <container_id>
		vmenu_id = create_options_manage_band_font_vmenu
		title = qs("Band Font")
	}
	get_current_band_info
	GetGlobalTags <band_info>
	if NOT GotParam \{font}
		font = fontgrid_text_a6
	endif
	GetArraySize ($car_font_list)
	i = 0
	begin
	FormatText checksumname = current_font '%j' j = ((($car_font_list) [<i>]).font)
	if (<font> = <current_font>)
		selected_index = <i>
	endif
	add_generic_menu_icon_item {
		text = ((($car_font_list) [<i>]).frontend_desc)
		icon = ((($car_font_list) [<i>]).icon)
		pad_choose_script = manage_band_set_font
		pad_choose_params = {font = ((($car_font_list) [<i>]).font)}
		additional_focus_script = change_demo_font_on_focus
		additional_focus_params = {font = ((($car_font_list) [<i>]).font)}
	}
	i = (<i> + 1)
	repeat <array_size>
	clean_up_user_control_helpers
	menu_finish \{car_helper_text_cancel
		no_rotate_zoom_text}
	LaunchEvent type = focus target = create_options_manage_band_font_vmenu data = {child_index = <selected_index>}
endscript

script ui_destroy_options_manage_band_font 
	destroy_generic_menu
endscript

script ui_init_options_manage_band_font 
	BandLogoObject :Obj_ApplyScaling \{scale = 0.0}
	name = qs("\L")
	get_current_band_info
	GetGlobalTags <band_info>
	if NOT GotParam \{font}
		font = fontgrid_text_a6
	endif
	CreateScreenElement {
		parent = root_window
		type = TextBlockElement
		id = demo_band_font
		text = <name>
		font = <font>
		rgba = [75 75 75 255]
		dims = (450.0, 100.0)
		pos = (775.0, 350.0)
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
	}
endscript

script ui_deinit_options_manage_band_font 
	BandLogoObject :Obj_ApplyScaling \{scale = 1.0}
	DestroyScreenElement \{id = demo_band_font}
endscript

script manage_band_set_font 
	get_current_band_info
	FormatText checksumname = font '%j' j = <font>
	SetGlobalTags <band_info> params = {font = <font>}
	generic_event_back
endscript

script change_demo_font_on_focus 
	FormatText checksumname = font '%j' j = <font>
	demo_band_font :SE_SetProps font = <font>
endscript

script debug_dump_current_band_font 
	get_current_band_info
	GetGlobalTags <band_info> param = font
	printstruct <...>
endscript
