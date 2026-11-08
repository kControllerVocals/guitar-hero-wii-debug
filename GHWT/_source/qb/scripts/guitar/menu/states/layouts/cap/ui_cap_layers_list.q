max_cap_layers = 40

script ui_create_cap_layers_list 
	if GotParam \{new_layer_selected}
		ui_event_remove_params \{param = new_layer_selected}
		spawnscriptnow continue_to_shape_list params = {part = <part> div_id = <div_id>}
	else
		if NOT ChecksumEquals a = <part> b = CAS_Band_Logo
			show_history = {show_history}
		endif
		make_generic_menu {
			vmenu_id = create_cap_layers_list_vmenu
			title = qs("Layers")
			<show_history>
		}
		if NOT is_cap_layers_full part = <part> div_id = <div_id>
			add_generic_menu_text_item {
				text = qs("< New Layer >")
				choose_state = UIstate_cap_shape_list
				choose_state_data = {part = <part> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera>}
			}
		endif
		add_current_layers_to_menu part = <part> div_id = <div_id> copy_params = <copy_params> focus_item = <focus_item> paste_item = <paste_item> camera_list = <camera_list> zoom_camera = <zoom_camera>
		if GotParam \{copy_params}
			add_user_control_helper \{text = qs("PASTE")
				button = green
				z = 100000}
			add_user_control_helper \{text = qs("DONE")
				button = red
				z = 100000}
			if NOT ChecksumEquals a = <part> b = CAS_Band_Logo
				menu_finish \{car_rotate_zoom}
			endif
		elseif GotParam \{re_order_params}
			add_user_control_helper \{text = qs("DONE")
				button = green
				z = 100000}
			if NOT ChecksumEquals a = <part> b = CAS_Band_Logo
				menu_finish \{car_rotate_zoom}
			endif
		else
			if ChecksumEquals a = <part> b = CAS_Band_Logo
				menu_finish \{car_helper_text
					no_rotate_zoom_text}
			else
				setup_cas_menu_handlers vmenu_id = create_cap_layers_list_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
				menu_finish \{car_helper_text}
			endif
		endif
	endif
endscript

script focus_re_order_element 
	if ScreenElementExists \{id = create_cap_layers_list_vmenu}
		LaunchEvent \{type = unfocus
			target = create_cap_layers_list_vmenu}
	else
		return
	endif
	if ScreenElementExists \{id = re_order_element}
		LaunchEvent \{type = focus
			target = re_order_element}
	else
		return
	endif
endscript

script ui_destroy_cap_layers_list 
	if ScreenElementExists \{id = num_layers}
		DestroyScreenElement \{id = num_layers}
	endif
	destroy_generic_menu
endscript

script ui_return_cap_layers_list 
	if NOT ((GotParam re_order_params) || (GotParam copy_params))
		if ScreenElementExists \{id = layers_list_focus}
			DestroyScreenElement \{id = layers_list_focus}
		endif
	elseif GotParam \{re_order_params}
		printf \{qs("\L################## REORDER !!! ######################")}
		cap_re_order_layer_handler_change <re_order_params> camera_list = <camera_list> zoom_camera = <zoom_camera>
		SpawnScriptLater \{focus_re_order_element}
	elseif GotParam \{copy_params}
		printf \{qs("\L################## COPY !!! ######################")}
		cap_change_copy_handler <copy_params> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera>
		SpawnScriptLater \{focus_copy_element}
	endif
	if GotParam \{copy_params}
		add_user_control_helper \{text = qs("PASTE")
			button = green
			z = 100000}
		add_user_control_helper \{text = qs("DONE")
			button = red
			z = 100000}
		if NOT ChecksumEquals a = <part> b = CAS_Band_Logo
			menu_finish \{car_rotate_zoom}
		endif
	elseif GotParam \{re_order_params}
		add_user_control_helper \{text = qs("DONE")
			button = green
			z = 100000}
		if NOT ChecksumEquals a = <part> b = CAS_Band_Logo
			menu_finish \{car_rotate_zoom}
		endif
	else
		if ChecksumEquals a = <part> b = CAS_Band_Logo
			menu_finish \{car_helper_text
				no_rotate_zoom_text}
		else
			menu_finish \{car_helper_text}
		endif
	endif
endscript

script add_current_layers_to_menu 
	RequireParams \{[
			part
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	num_layers = 0
	if GotParam \{cap}
		GetArraySize (cap)
		cap_array_size = <array_size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			if StructureContains Structure = (<cap> [<i>]) layers
				if is_target_in_div target = (<cap> [<i>]) part = <part> div_id = <div_id>
					GetArraySize (<cap> [<i>].layers)
					j = 0
					begin
					get_div_info part = <part> div_id = <div_id>
					if NOT GotParam \{target}
						printf \{qs("\LUnable to find target for specified CAP design, check part definition.")}
					endif
					if StructureContains Structure = ((<cap> [<i>]).layers [<j>]) texture
						match_layers_texture sections = <sections> prof_texture = ((<cap> [<i>]).layers [<j>].texture) target = <target> material = <material>
					elseif StructureContains Structure = ((<cap> [<i>]).layers [<j>]) font
						match_layers_font prof_font = ((<cap> [<i>]).layers [<j>].font) prof_text = ((<cap> [<i>]).layers [<j>].text) sections = <sections> target = <target> material = <material>
					endif
					if GotParam \{mask}
						add_generic_menu_text_item {
							text = (<mask>.frontend_desc)
							pad_choose_script = layers_list_select_layer
							pad_choose_params = {part = <part> sections = <sections> section_index = <section_index> mask_index = <mask_index> cap_index = <i> layer_index = <j> mask = <mask> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera>}
						}
						if GotParam \{focus_item}
							if (<focus_item> = <j>)
								if ScreenElementExists \{id = generic_menu}
									if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_smenu
											param = generic_smenu}
										printf qs("\LMOVE SCROLLING MENU focus on %i") i = <focus_item>
										if GotParam \{paste_item}
											<generic_smenu> :ScrollingMenu_SetOverrideVisibleIndex (<paste_item> + 1)
											ui_event_remove_params \{param = paste_item}
										else
											<generic_smenu> :ScrollingMenu_SetOverrideVisibleIndex (<focus_item> + 1)
										endif
									endif
								endif
								layers_list_set_focus mask = <mask> container_id = <item_container_id>
								ui_event_remove_params \{param = focus_item}
							endif
						endif
						num_layers = (<num_layers> + 1)
					endif
					j = (<j> + 1)
					repeat <array_size>
				endif
			endif
			i = (<i> + 1)
			repeat <cap_array_size>
		endif
	endif
	if ScreenElementExists \{id = num_layers}
		DestroyScreenElement \{id = num_layers}
	endif
	FormatText TextName = text qs("(%i/%j)") i = <num_layers> j = ($max_cap_layers)
	CreateScreenElement {
		type = TextBlockElement
		parent = root_window
		id = num_layers
		font = ($test_menu_font)
		text = <text>
		pos = (400.0, 170.0)
		rgba = [175 , 175 , 175 , 255]
		dims = (375.0, 30.0)
		z_priority = 200
		fit_height = `scale down if larger`
		fit_width = `scale each line if larger`
		internal_just = [center , center]
	}
	if GotParam \{focus_item}
		ui_event_remove_params \{param = focus_item}
	endif
	if GotParam \{paste_item}
		ui_event_remove_params \{param = paste_item}
	endif
endscript

script cap_re_order_layer_handler_change 
	printf \{qs("\LREORDER!")}
	RequireParams \{[
			part
			cap_index
			layer_current_index
		]
		all}
	if NOT ScreenElementExists \{id = re_order_element}
		CreateScreenElement {
			type = ContainerElement
			id = re_order_element
			parent = root_window
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up = 1}}
				{pad_down generic_menu_up_or_down_sound params = {down = 2}}
				{pad_up move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> -1) layer_current_index = <layer_current_index>}}
				{pad_down move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> + 1) layer_current_index = <layer_current_index>}}
				{pad_choose generic_menu_pad_choose_sound}
				{pad_choose cap_re_order_layer_handler_change_return params = {part = <part>}}
			]
			z_priority = <z_priority>
		}
	endif
	if NOT ChecksumEquals a = <part> b = CAS_Band_Logo
		setup_cas_menu_handlers vmenu_id = re_order_element camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
endscript

script cap_re_order_layer_handler_change_return 
	LaunchEvent \{type = unfocus
		target = re_order_element}
	if NOT ScreenElementExists \{id = create_cap_layers_list_vmenu}
		return
	endif
	LaunchEvent \{type = focus
		target = create_cap_layers_list_vmenu}
	if ScreenElementExists \{id = re_order_element}
		DestroyScreenElement \{id = re_order_element}
	endif
	if ScreenElementExists \{id = layers_list_focus}
		DestroyScreenElement \{id = layers_list_focus}
	endif
	ui_event_remove_params \{param = re_order_params}
	ui_event_remove_params \{param = focus_item}
	clean_up_user_control_helpers
	if ChecksumEquals a = <part> b = CAS_Band_Logo
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
	else
		menu_finish \{car_helper_text}
	endif
	if ScreenElementExists \{id = generic_menu}
		if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			<generic_smenu> :ScrollingMenu_ClearOverrideVisibleIndex
		endif
	endif
	if NOT ChecksumEquals a = <part> b = CAS_Band_Logo
		setup_cas_menu_handlers vmenu_id = create_cap_layers_list_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
endscript

script move_layer 
	RequireParams \{[
			part
			cap_index
			layer_target_index
			layer_current_index
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if (<layer_target_index> < 0)
		printf \{qs("\LCannot move layer up, target less than 0.")}
		return
	endif
	GetArraySize (<cap> [<cap_index>].layers)
	if (<layer_target_index> > (<array_size> -1))
		printf \{qs("\LCannot Move layer down, target greater than array size.")}
		return
	endif
	MoveArrayElement array = (<cap> [<cap_index>].layers) target = <layer_target_index> current = <layer_current_index>
	SetArrayElement ArrayName = cap index = <cap_index> newvalue = {
		(<cap> [<cap_index>])
		layers = <array>
	}
	SetCASAppearanceCAP part = <part> cap = <cap>
	UpdateCASModelCAP part = <part>
	ui_event_add_params focus_item = <layer_target_index>
	ui_event \{event = menu_refresh}
	layer_current_index = <layer_target_index>
	SetScreenElementProps {
		id = re_order_element
		event_handlers =
		[
			{pad_up generic_menu_up_or_down_sound params = {up = 1}}
			{pad_down generic_menu_up_or_down_sound params = {down = 2}}
			{pad_up move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> -1) layer_current_index = <layer_current_index>}}
			{pad_down move_layer params = {part = <part> cap_index = <cap_index> layer_target_index = (<layer_current_index> + 1) layer_current_index = <layer_current_index>}}
		]
		replace_handlers
	}
	SpawnScriptLater \{focus_re_order_element}
endscript

script is_CAP_in_div 
	RequireParams \{[
			part
			cap
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if NOT GotParam \{divisions}
		return \{true}
	elseif NOT GotParam \{div_id}
		return \{true}
	else
		GetArraySize \{divisions}
		if (<array_size> > 0)
			i = 0
			begin
			if ((<divisions> [<i>].desc_id) = <div_id>)
				if ((<cap>.material) = (<divisions> [<i>].material))
					if StructureContains Structure = <cap> (<divisions> [<i>].target)
						return \{true}
					endif
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return \{false}
endscript

script get_num_layers 
	num_layers = 0
	RequireParams \{[
			part
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{cap}
		GetArraySize (cap)
		cap_array_size = <array_size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			if StructureContains Structure = (<cap> [<i>]) layers
				if is_target_in_div target = (<cap> [<i>]) part = <part> div_id = <div_id>
					GetArraySize (<cap> [<i>].layers)
					j = 0
					begin
					get_div_info part = <part> div_id = <div_id>
					if NOT GotParam \{target}
						printf \{qs("\LUnable to find target for specified CAP design, check part definition.")}
					endif
					if StructureContains Structure = ((<cap> [<i>]).layers [<j>]) texture
						match_layers_texture sections = <sections> prof_texture = ((<cap> [<i>]).layers [<j>].texture) target = <target> material = <material>
					elseif StructureContains Structure = ((<cap> [<i>]).layers [<j>]) font
						match_layers_font prof_font = ((<cap> [<i>]).layers [<j>].font) prof_text = ((<cap> [<i>]).layers [<j>].text) sections = <sections> target = <target> material = <material>
					endif
					if GotParam \{mask}
						num_layers = (<num_layers> + 1)
					endif
					j = (<j> + 1)
					repeat <array_size>
				endif
			endif
			i = (<i> + 1)
			repeat <cap_array_size>
		endif
	endif
	return num_layers = <num_layers>
endscript

script is_cap_layers_full 
	RequireParams \{[
			part
		]
		all}
	get_num_layers part = <part> div_id = <div_id>
	if (<num_layers> > (($max_cap_layers) -1))
		return \{true}
	else
		return \{false}
	endif
endscript

script extract_current_layers 
	RequireParams \{[
			part
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if GotParam \{cap}
		GetArraySize (cap)
		cap_array_size = <array_size>
		if (<cap_array_size> > 0)
			i = 0
			begin
			if StructureContains Structure = (<cap> [<i>]) layers
				if is_target_in_div target = (<cap> [<i>]) part = <part> div_id = <div_id>
					return layers = ((<cap> [<i>]).layers)
				endif
			endif
			i = (<i> + 1)
			repeat <cap_array_size>
		endif
	endif
endscript

script cap_copy_layer 
	RequireParams \{[
			part
			cap_index
			layer
			layer_index
		]}
	if NOT is_cap_layers_full part = <part> div_id = <div_id>
		if NOT GetCASAppearancePart part = <part>
			ScriptAssert '%s not found' s = <part> DoNotResolve
		endif
		InsertArrayElement array = ((<cap> [<cap_index>]).layers) element = <layer> index = <layer_index>
		SetArrayElement ArrayName = cap index = <cap_index> newvalue = {
			(<cap> [<cap_index>])
			layers = <array>
		}
		SetCASAppearanceCAP part = <part> cap = <cap>
		UpdateCASModelCAP part = <part>
	endif
endscript

script continue_to_shape_list 
	printf \{qs("\L######### IN continue_to_shape_list #############")}
	begin
	if is_menu_camera_finished
		destroy_generic_menu
		printf \{qs("\L################## CAMERA FINISHED, MOVE ON #####################")}
		ui_event_wait event = menu_change data = {state = UIstate_cap_shape_list <...>}
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script layers_list_set_focus 
	if ScreenElementExists \{id = layers_list_focus}
		DestroyScreenElement \{id = layers_list_focus}
	endif
	CreateScreenElement {
		parent = <container_id>
		type = DescInterface
		desc = 'layers_list_focus'
		id = layers_list_focus
		layers_list_focus_text_text = (<mask>.frontend_desc)
		layers_list_focus_text_rgba = [255 255 255 255]
		layers_list_focus_text_font = fontgrid_text_a6_fire
		layers_list_focus_text_material = sys_fontgrid_text_A6_fire_sys_fontgrid_text_A6_fire
		z_priority = 100
	}
endscript

script layers_list_select_layer 
	layers_list_set_focus <...>
	generic_event_choose data = {is_popup state = UIstate_cap_layers_options <...>}
endscript

script cap_change_copy_handler 
	printf \{qs("\LCOPY!")}
	RequireParams \{[
			part
			cap_index
			layer_index
			layer
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert '%s not found' s = <part> DoNotResolve
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	if NOT GotParam \{cap}
		ScriptAssert \{qs("\Lcap_change_copy_handler was unable to find cap on part, make sure part passed is correct.")}
	endif
	GetArraySize (<cap> [<cap_index>].layers)
	if NOT ScreenElementExists \{id = copy_element}
		CreateScreenElement {
			type = ContainerElement
			id = copy_element
			parent = root_window
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up = 1}}
				{pad_down generic_menu_up_or_down_sound params = {down = 2}}
				{pad_up cap_decrement_target}
				{pad_down cap_increment_target}
				{pad_choose generic_menu_pad_choose_sound}
				{pad_choose cap_paste_layer params = {cap_index = <cap_index> part = <part> div_id = <div_id> camera_list = <camera_list> zoom_camera = <zoom_camera>}}
				{pad_back generic_menu_pad_choose_sound}
				{pad_back cap_copy_layer_handler_change_return params = {camera_list = <camera_list> zoom_camera = <zoom_camera> part = <part>}}
			]
			z_priority = <z_priority>
		}
		parent_id = <id>
		if NOT ChecksumEquals a = <part> b = CAS_Band_Logo
			setup_cas_menu_handlers vmenu_id = copy_element camera_list = <camera_list> zoom_camera = <zoom_camera>
		endif
		copy_element :SetTags {
			curent_index = <layer_index>
			target_index = <layer_index>
			layer = <layer>
			max_layer = <array_size>
		}
		if ScreenElementExists \{id = copy_indicator}
			DestroyScreenElement \{id = copy_indicator}
		endif
		GetScreenElementChildren \{id = create_cap_layers_list_vmenu}
		CreateScreenElement {
			type = DescInterface
			desc = 'layers_list_copy'
			parent = (<children> [<layer_index>])
			id = copy_indicator
			dims = (0.0, 0.0)
			just = [center , center]
			pos_anchor = [center , center]
			pos = (0.0, 0.0)
		}
	endif
endscript

script cap_copy_layer_handler_change_return 
	LaunchEvent \{type = unfocus
		target = copy_element}
	LaunchEvent \{type = focus
		target = create_cap_layers_list_vmenu}
	if ScreenElementExists \{id = copy_element}
		DestroyScreenElement \{id = copy_element}
	endif
	if ScreenElementExists \{id = layers_list_focus}
		DestroyScreenElement \{id = layers_list_focus}
	endif
	if ScreenElementExists \{id = copy_indicator}
		DestroyScreenElement \{id = copy_indicator}
	endif
	ui_event_remove_params \{param = copy_params}
	ui_event_remove_params \{param = focus_item}
	ui_event_remove_params \{param = paste_item}
	clean_up_user_control_helpers
	if ChecksumEquals a = <part> b = CAS_Band_Logo
		menu_finish \{car_helper_text
			no_rotate_zoom_text}
	else
		menu_finish \{car_helper_text}
	endif
	if NOT ChecksumEquals a = <part> b = CAS_Band_Logo
		setup_cas_menu_handlers vmenu_id = create_cap_layers_list_vmenu camera_list = <camera_list> zoom_camera = <zoom_camera>
	endif
	if ScreenElementExists \{id = generic_menu}
		if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			<generic_smenu> :ScrollingMenu_ClearOverrideVisibleIndex
		endif
	endif
endscript

script cap_decrement_target 
	copy_element :GetTags
	if (<target_index> = 0)
		printf \{qs("\LCannot move target down further, already at index 0")}
		return
	endif
	copy_element :SetTags target_index = (<target_index> -1)
	printf qs("\LTarget is now %i.") i = (<target_index> -1)
	if ScreenElementExists \{id = copy_indicator}
		DestroyScreenElement \{id = copy_indicator}
	endif
	GetScreenElementChildren \{id = create_cap_layers_list_vmenu}
	CreateScreenElement {
		type = DescInterface
		desc = 'layers_list_copy'
		parent = (<children> [(<target_index> -1)])
		id = copy_indicator
		dims = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		pos = (0.0, 0.0)
	}
	if ScreenElementExists \{id = generic_menu}
		if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			printf \{qs("\LMOVE SCROLLING MENU")}
			<generic_smenu> :ScrollingMenu_SetOverrideVisibleIndex (<target_index> -1)
		endif
	endif
endscript

script cap_increment_target 
	copy_element :GetTags
	if (<target_index> > (<max_layer> -1))
		printf \{qs("\LCannot Move layer up further, target at array size.")}
		return
	endif
	copy_element :SetTags target_index = (<target_index> + 1)
	printf qs("\LTarget is now %i.") i = (<target_index> + 1)
	if ScreenElementExists \{id = copy_indicator}
		DestroyScreenElement \{id = copy_indicator}
	endif
	GetScreenElementChildren \{id = create_cap_layers_list_vmenu}
	CreateScreenElement {
		type = DescInterface
		desc = 'layers_list_copy'
		parent = (<children> [(<target_index> + 1)])
		id = copy_indicator
		dims = (0.0, 0.0)
		just = [center , center]
		pos_anchor = [center , center]
		pos = (0.0, 0.0)
	}
	if ScreenElementExists \{id = generic_menu}
		if generic_menu :Desc_ResolveAlias \{name = alias_generic_menu_smenu
				param = generic_smenu}
			<generic_smenu> :ScrollingMenu_SetOverrideVisibleIndex (<target_index> + 1)
		endif
	endif
endscript

script focus_copy_element 
	if ScreenElementExists \{id = create_cap_layers_list_vmenu}
		LaunchEvent \{type = unfocus
			target = create_cap_layers_list_vmenu}
	else
		return
	endif
	if ScreenElementExists \{id = copy_element}
		LaunchEvent \{type = focus
			target = copy_element}
		copy_element :GetTags
	else
		return
	endif
	if ScreenElementExists \{id = copy_indicator}
		DestroyScreenElement \{id = copy_indicator}
	endif
	if ScreenElementExists \{id = create_cap_layers_list_vmenu}
		GetScreenElementChildren \{id = create_cap_layers_list_vmenu}
		CreateScreenElement {
			type = DescInterface
			desc = 'layers_list_copy'
			parent = (<children> [<target_index>])
			id = copy_indicator
			dims = (0.0, 0.0)
			just = [center , center]
			pos_anchor = [center , center]
			pos = (0.0, 0.0)
		}
	endif
endscript

script cap_paste_layer 
	printf \{qs("\LPaste Layer")}
	copy_element :GetTags
	if (<target_index> < (<curent_index> + 1))
		curent_index = (<curent_index> + 1)
	endif
	ui_event_add_params focus_item = <curent_index>
	ui_event_add_params paste_item = <target_index>
	layer_index = <target_index>
	cap_copy_layer <...>
	copy_element :SetTags max_layer = (<max_layer> + 1) curent_index = <curent_index>
	if NOT is_cap_layers_full part = <part> div_id = <div_id>
		ui_event \{event = menu_refresh}
		SpawnScriptLater \{focus_copy_element}
		cap_paste_layer_animate
	else
		printf \{qs("\L######################### FULL NOW! GIVE MESSAGE! ##############################")}
		LaunchEvent \{type = unfocus
			target = copy_element}
		cap_copy_layer_handler_change_return camera_list = <camera_list> zoom_camera = <zoom_camera> part = <part>
		generic_event_choose \{data = {
				state = UIstate_generic_alert_popup
				is_popup
				pad_choose_script = cap_layers_full_alert_return
				title = qs("Layers Full")
				text = qs("You have now added the max number of layers allowed.  If you want to add more, at least one layer must be deleted.")
			}}
	endif
endscript

script cap_layers_full_alert_return 
	generic_event_back
	ui_event_wait \{event = menu_refresh}
endscript

script cap_paste_layer_animate 
	spawnscriptnow \{cap_paste_layer_animate_worker}
endscript

script cap_paste_layer_animate_worker 
	Wait \{0.1
		seconds}
	if ScreenElementExists \{id = copy_indicator}
		copy_indicator :SE_SetProps \{layer_copy_indicator_left_flash_alpha = 1.0
			layer_copy_indicator_right_flash_alpha = 1.0
			time = 0.1}
	else
		return
	endif
	Wait \{0.15
		seconds}
	if ScreenElementExists \{id = copy_indicator}
		copy_indicator :SE_SetProps \{layer_copy_indicator_left_flash_alpha = 0.0
			layer_copy_indicator_right_flash_alpha = 0.0
			time = 0.1}
	else
		return
	endif
endscript
