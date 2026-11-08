popup_warning_menu_font = fontgrid_text_a6
popup_event_handlers_options = [
	{
		pad_up
		generic_menu_up_or_down_sound
		params = {
			up
		}
	}
	{
		pad_down
		generic_menu_up_or_down_sound
		params = {
			down
		}
	}
]
popup_event_handlers_nooptions = [
]
g_cpw_have_helper_pills = 0
g_using_alt_popup_bg = 0

script create_popup_warning_menu player_device = ($primary_controller) popup_event_handlers = ($popup_event_handlers_options) header_offset = (0.0, 0.0) dlg_z_priority = 500 parent = root_window
	change \{g_cpw_have_helper_pills = 0}
	if GotParam \{fail_song_props}
		change \{g_using_alt_popup_bg = 1}
	elseif GotParam \{fail_song_props_prac}
		change \{g_using_alt_popup_bg = 1}
	else
		change \{g_using_alt_popup_bg = 0}
	endif
	<event_handlers> = []
	if GotParam \{options}
		GetArraySize <options>
		if (<array_size> > 1)
			<event_handlers> = <popup_event_handlers>
		endif
		if (<array_size> > 3)
			change \{g_using_alt_popup_bg = 1}
		endif
	endif
	if GotParam \{back_button_script}
		<event> = {pad_back generic_menu_pad_choose_sound}
		AddArrayElement array = <event_handlers> element = <event>
		if GotParam \{back_button_params}
			<event> = {pad_back <back_button_script> params = {<back_button_params>}}
		else
			<event> = {pad_back <back_button_script>}
		endif
		AddArrayElement array = <event_handlers> element = <event>
		<event_handlers> = <array>
	endif
	if NOT (($menu_over_ride_exclusive_device) = -1)
		player_device = ($menu_over_ride_exclusive_device)
	endif
	if GotParam \{use_all_controllers}
		player_device = [0 , 1 , 2 , 3]
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <parent>
		id = popup_warning_container
		pos = (0.0, 0.0)
		just = [left top]
	}
	if NOT (GotParam no_background)
		displaySprite \{parent = popup_warning_container
			tex = boot_brick_bg
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [
				center
				center
			]
			z = 96}
	endif
	if NOT GotParam \{no_helpers}
		clean_up_user_control_helpers
		if GotParam \{player_device}
		endif
	endif
	if GotParam \{options}
		if ($g_using_alt_popup_bg = 0)
			CreateScreenElement {
				parent = root_window
				id = PopupElement
				type = DescInterface
				desc = 'dialog_box'
				z_priority = <dlg_z_priority>
				exclusive_device = <player_device>
			}
		else
			CreateScreenElement {
				parent = root_window
				id = PopupElement
				type = DescInterface
				desc = 'dialog_box_fail'
				z_priority = <dlg_z_priority>
				exclusive_device = <player_device>
			}
		endif
		change \{g_cpw_have_helper_pills = 1}
		add_user_control_helper \{text = qs("SELECT")
			button = green
			z = 100000}
		if GotParam \{back_button_script}
			add_user_control_helper \{text = qs("BACK")
				button = red
				z = 100000}
		endif
	else
		CreateScreenElement {
			parent = root_window
			id = PopupElement
			type = DescInterface
			desc = 'dialog_box_no_options'
			z_priority = <dlg_z_priority>
		}
	endif
	if PopupElement :Desc_ResolveAlias \{name = alias_dlog_vmenu}
		AssignAlias id = <resolved_id> alias = pu_warning_vmenu
		<resolved_id> :SE_SetProps event_handlers = <event_handlers>
		<resolved_id> :SE_GetProps
		<z> = <z_priority>
		if NOT GotParam \{no_focus}
			LaunchEvent type = focus target = <resolved_id>
		endif
	endif
	create_popup_warning_text <...>
	if GotParam \{options}
		create_popup_warning_menu_options <...>
	endif
	if GotParam \{resolved_id}
		return {menu_id = <resolved_id>}
	endif
endscript

script destroy_popup_warning_menu 
	DestroyScreenElement \{id = PopupElement}
	destroy_menu \{menu_id = popup_warning_container}
	if ($net_popup_active = 1)
		printf \{qs(0x5b366bfc)}
		change \{net_popup_active = 0}
	endif
	if ($g_cpw_have_helper_pills = 1)
		clean_up_user_control_helpers
	endif
	set_focus_color
	set_unfocus_color
endscript

script create_popup_warning_text \{title = qs("WARNING")}
	PopupElement :SetProps {
		PopupTitle_text = qs("")
		PopupTitle_rgba = (($g_menu_colors).alert_red)
	}
	if PopupElement :Desc_ResolveAlias \{name = alias_dialog_text}
		split_text_into_menu {
			text = <title>
			dims = (330.0, 120.0)
			fit_major = `fit content`
			fit_minor = `fit content`
			text_params = {
				z_priority = 525.0
				rgba = (($g_menu_colors).alert_red)
				font = fontgrid_text_a11_large
				use_shadow = true
				shadow_rgba =
				[
					0 , 0 , 0 , 255
				]
				shadow_offs = (-3.0, -3.0)
			}
			pos_anchor = [center center]
			just = [center , center]
			internal_just = [center center]
			parent = <resolved_id>
			spacing_between = 0
			pos = (0.0, 15.0)
		}
		letter_scale = [1.8 1.5 1.2 1.5]
		s = Random (@ 0 @ 1 )
		i = 0
		begin
		text_element = (<text_element_array> [<i>])
		<text_element> :SE_SetProps internal_scale = (<letter_scale> [<s>])
		s = (<s> + 1)
		if (<s> > 3)
			s = 0
		endif
		i = (<i> + 1)
		repeat <text_element_array_size>
	endif
	if GotParam \{textblock}
		PopupElement :SetProps {
			PopupBody_text = (<textblock>.text)
		}
	endif
	if GotParam \{fail_song_props}
		PopupElement :SetProps {
			dlog_fail_song_title_text = (<fail_song_props>.song_title)
		}
		PopupElement :SetProps {
			dlog_fail_song_percent_text = (<fail_song_props>.percent_text)
		}
		PopupElement :SetProps {
			dlog_fail_song_difficulty_text = (<fail_song_props>.difficulty_text)
		}
	endif
	if GotParam \{fail_song_props_prac}
		PopupElement :SetProps \{dlog_fail_song_info_prac_alpha = 1
			dlog_fail_song_info_alpha = 0}
		PopupElement :SetProps {
			dlog_fail_song_title_text = (<fail_song_props_prac>.song_title)
		}
		PopupElement :SetProps {
			dlog_fail_song_percent_prac_text = (<fail_song_props_prac>.percent_text)
		}
		PopupElement :SetProps {
			dlog_fail_song_difficulty_prac_text = (<fail_song_props_prac>.difficulty_text)
		}
	endif
endscript

script create_popup_warning_menu_option 
	<focus_params> = {use_highlight = 0}
	if StructureContains Structure = <option> func_params
		<func_params> = (<option>.func_params)
	endif
	sound_func = generic_menu_pad_choose_sound
	if StructureContains Structure = <option> sound_func
		sound_func = (<option>.sound_func)
	endif
	if StructureContains Structure = <option> no_sound
		sound_func = nullscript
	endif
	if ($g_using_alt_popup_bg = 1)
		set_unfocus_color rgba = (($g_menu_colors).black)
	else
		set_unfocus_color rgba = ($default_menu_unfocus_color)
	endif
	CreateScreenElement {
		type = TextBlockElement
		dims = <dims>
		font = ($popup_warning_menu_font)
		parent = <parent>
		local_id = text
		rgba = ($menu_unfocus_color)
		font_spacing = 0
		just = [center center]
		internal_just = [center center]
		z_priority = (<z> + 1)
		(<option>)
		fit_width = `scale each line if larger`
		fit_height = `scale to fit`
		scale_mode = `per axis`
		event_handlers = [
			{focus menu_popup_focus params = <focus_params>}
			{unfocus menu_popup_unfocus params = <focus_params>}
			{pad_choose <sound_func>}
			{pad_choose (<option>.func) params = <func_params>}
		]
	}
	if StructureContains Structure = <option> not_focusable
		<id> :SE_SetProps non_focusable rgba = (($g_menu_colors).alert_red)
	endif
endscript

script create_popup_warning_menu_options 
	<parent> = pu_warning_vmenu
	GetArraySize <options>
	GetScreenElementDims id = <parent>
	<menu_element_dims> = ((<width> * (1.0, 0.0)) + (0.0, 50.0))
	<i> = 0
	begin
	create_popup_warning_menu_option {
		option = (<options> [<i>])
		z = <z>
		num_options = <array_size>
		parent = <parent>
		dims = <menu_element_dims>
	}
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script menu_popup_focus 
	Obj_GetID
	<id> = <ObjID>
	ResolveScreenElementId id = {<id> child = {0 child = text}}
	retail_menu_focus id = <resolved_id>
	if (<use_highlight> = 1)
		SetScreenElementProps id = {<id> child = {0 child = {hi_right_spacer child = 0}}} alpha = 1
		SetScreenElementProps id = {<id> child = {0 child = {hi_left_spacer child = 0}}} alpha = 1
	endif
endscript

script menu_popup_unfocus 
	Obj_GetID
	<id> = <ObjID>
	ResolveScreenElementId id = {<id> child = {0 child = text}}
	retail_menu_unfocus id = <resolved_id>
	if (<use_highlight> = 1)
		SetScreenElementProps id = {<id> child = {0 child = {hi_right_spacer child = 0}}} alpha = 0
		SetScreenElementProps id = {<id> child = {0 child = {hi_left_spacer child = 0}}} alpha = 0
	endif
endscript
