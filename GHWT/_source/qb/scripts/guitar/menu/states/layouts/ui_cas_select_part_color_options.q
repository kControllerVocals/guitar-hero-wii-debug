
script ui_create_cas_select_part_color_options 
	make_generic_menu {
		vmenu_id = create_cas_select_part_options_vmenu
		title = qs("EDIT ITEM")
		pad_back_script = ui_event
		pad_back_params = {event = menu_back data = {num_states = <num_states>}}
		show_history
		num_icons = <num_icons>
	}
	setup_cas_menu_handlers vmenu_id = create_cas_select_part_options_vmenu camera_list = <camera_list> no_zoom
	ResolveBodySpecificPartInAppearance part = <part>
	GetArraySize <part_materials>
	if (<array_size> = 0)
		generic_event_back \{data = {
				num_states = 2
			}}
	endif
	i = 0
	begin
	AddArrayElement array = [] element = (<part_materials> [<i>])
	FormatText TextName = text qs("COLOR %d") d = (<i> + 1)
	if GotParam \{only_rotate}
		add_generic_menu_icon_item {
			text = <text>
			icon = menu_history_color_edit
			choose_state = UIstate_cas_color_edit
			choose_state_data = {part = <part> part_materials = <array> num_states = <num_states> hist_tex = menu_history_color_edit color_wheel = <color_wheel> camera_list = <camera_list> zoom_camera = <zoom_camera> skip_deinit_script = 1 only_rotate}
		}
	elseif GotParam \{disable_rotation_zoom}
		add_generic_menu_icon_item {
			text = <text>
			icon = menu_history_color_edit
			choose_state = UIstate_cas_color_edit
			choose_state_data = {part = <part> part_materials = <array> num_states = <num_states> hist_tex = menu_history_color_edit color_wheel = <color_wheel> camera_list = <camera_list> zoom_camera = <zoom_camera> skip_deinit_script = 1 no_rotate_zoom}
		}
	else
		add_generic_menu_icon_item {
			text = <text>
			icon = menu_history_color_edit
			choose_state = UIstate_cas_color_edit
			choose_state_data = {part = <part> part_materials = <array> num_states = <num_states> hist_tex = menu_history_color_edit color_wheel = <color_wheel> camera_list = <camera_list> zoom_camera = <zoom_camera> skip_deinit_script = 1}
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
	if GotParam \{only_rotate}
		menu_finish \{car_helper_text_back_rotate}
	else
		menu_finish \{car_helper_text_back}
	endif
endscript

script ui_destroy_cas_select_part_color_options 
	destroy_generic_menu
endscript

script ui_deinit_cas_select_part_color_options 
	GetCurrentCASObject
	if GotParam \{return_stance}
		BandManager_ChangeStance name = <cas_object> stance = <return_stance> no_wait
	else
		BandManager_ChangeStance name = <cas_object> stance = stance_frontend no_wait
	endif
	if GotParam \{additional_deinit_script}
		<additional_deinit_script>
	endif
endscript
