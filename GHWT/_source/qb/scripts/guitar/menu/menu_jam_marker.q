jam_current_marker = 0
jam_markers = [
	{
		name_text = qs("Intro")
	}
	{
		name_text = qs("Riff")
	}
	{
		name_text = qs("Fill")
	}
	{
		name_text = qs("Verse")
	}
	{
		name_text = qs("Bridge")
	}
	{
		name_text = qs("Solo")
	}
	{
		name_text = qs("Chorus")
	}
	{
		name_text = qs("Outro")
	}
]
jam_current_lightshow = 0
jam_lightshow = [
	{
		note = 75
		change = 1
		name_text = qs("Verse Slow")
	}
	{
		note = 75
		change = 2
		name_text = qs("Verse Med")
	}
	{
		note = 75
		change = 4
		name_text = qs("Verse Fast")
	}
	{
		note = 74
		change = 1
		name_text = qs("Chorus Slow")
	}
	{
		note = 74
		change = 2
		name_text = qs("Chorus Med")
	}
	{
		note = 74
		change = 4
		name_text = qs("Chorus Fast")
	}
	{
		note = 73
		change = 1
		name_text = qs("Solo Slow")
	}
	{
		note = 73
		change = 2
		name_text = qs("Solo Med")
	}
	{
		note = 73
		change = 4
		name_text = qs("Solo Fast")
	}
]

script create_menu_jam_marker \{controller = 0}
	change \{jam_current_marker = 0}
	change \{jam_current_lightshow = 0}
	change \{jam_current_marker_bpm = $jam_current_bpm}
	if jam_studio_element :Desc_ResolveAlias \{name = marker_box}
		<resolved_id> :SetProps pos = (-27.0, 800.0) time = 0.0
		<resolved_id> :SE_WaitProps
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <resolved_id>
		id = jam_marker_container
		pos = (23.0, 55.0)
		scale = 0.75
	}
	text_params = {type = TextElement font = fontgrid_text_a3 just = [center center] scale = 0.5 rgba = [0 0 0 255]}
	text_params = {type = TextElement font = fontgrid_text_a3 just = [right center] scale = 0.6 rgba = [0 0 0 255]}
	CreateScreenElement \{type = TextBlockElement
		parent = jam_marker_container
		font = fontgrid_text_a3
		just = [
			left
			center
		]
		internal_just = [
			left
			center
		]
		scale = 1
		pos = (116.0, 150.0)
		rgba = [
			0
			0
			0
			255
		]
		dims = (120.0, 30.0)
		text = qs("Marker:")
		z_priority = 300
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = Original}
	CreateScreenElement \{type = TextBlockElement
		parent = jam_marker_container
		font = fontgrid_text_a3
		just = [
			left
			center
		]
		internal_just = [
			left
			center
		]
		scale = 1
		pos = (116.0, 190.0)
		rgba = [
			0
			0
			0
			255
		]
		dims = (110.0, 30.0)
		text = qs("Lightshow:")
		z_priority = 300
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = Original}
	event_handlers = [
		{pad_up generic_menu_up_or_down_sound params = {up}}
		{pad_down generic_menu_up_or_down_sound params = {down}}
		{pad_back menu_jam_marker_back}
	]
	new_menu {
		menu_parent = jam_marker_container
		scrollid = scrolling_marker
		vmenuid = vmenu_marker
		menu_pos = (0.0, 0.0)
		default_colors = 0
		use_backdrop = 0
		exclusive_device = <controller>
		event_handlers = <event_handlers>
	}
	change \{menu_focus_color = [
			230
			230
			230
			255
		]}
	change \{menu_unfocus_color = [
			0
			0
			0
			255
		]}
	text_params = {type = TextElement font = fontgrid_text_a11 just = [left center] scale = 0.6 rgba = [0 0 0 255] z_priority = 300}
	CreateScreenElement \{type = ContainerElement
		parent = vmenu_marker
		dims = (100.0, 47.0)
		event_handlers = [
			{
				focus
				jam_pause_focus
				params = {
					id = marker_name_text
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = marker_name_text
				}
			}
			{
				pad_choose
				change_marker_option
				params = {
					text_id = marker_name_text
					select_array = jam_markers
					select_global = jam_current_marker
					numeric = 0
				}
			}
		]}
	CreateScreenElement {
		type = TextBlockElement
		parent = <id>
		id = marker_name_text
		font = fontgrid_text_a3
		just = [left center]
		internal_just = [right center]
		scale = 1
		pos = (260.0, 150.0)
		rgba = [0 0 0 255]
		dims = (120.0, 30.0)
		text = ($jam_markers [0].name_text)
		z_priority = 300
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = Original
	}
	CreateScreenElement \{type = ContainerElement
		parent = vmenu_marker
		dims = (100.0, 55.0)
		event_handlers = [
			{
				focus
				jam_pause_focus
				params = {
					id = marker_mood_text
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = marker_mood_text
				}
			}
			{
				pad_choose
				change_marker_option
				params = {
					text_id = marker_mood_text
					select_array = jam_lightshow
					select_global = jam_current_lightshow
					numeric = 0
				}
			}
		]}
	CreateScreenElement {
		type = TextBlockElement
		parent = <id>
		id = marker_mood_text
		font = fontgrid_text_a3
		just = [left center]
		internal_just = [right center]
		scale = 1
		pos = (260.0, 143.0)
		rgba = [0 0 0 255]
		dims = (120.0, 30.0)
		text = ($jam_lightshow [0].name_text)
		z_priority = 300
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = Original
	}
	CreateScreenElement \{type = ContainerElement
		parent = vmenu_marker
		dims = (100.0, 80.0)
		event_handlers = [
			{
				focus
				jam_pause_focus
				params = {
					id = marker_done_text
				}
			}
			{
				unfocus
				retail_menu_unfocus
				params = {
					id = marker_done_text
				}
			}
			{
				pad_choose
				jam_highway_add_marker
			}
		]}
	CreateScreenElement {
		type = TextBlockElement
		parent = <id>
		id = marker_done_text
		font = fontgrid_text_a3
		just = [left center]
		internal_just = [left center]
		scale = 1
		pos = (157.0, 130.0)
		rgba = [0 0 0 255]
		dims = (180.0, 50.0)
		text = qs("Add Marker")
		z_priority = 300
		fit_width = `scale each line if larger`
		fit_height = `scale down if larger`
		scale_mode = proportional
		text_case = Original
	}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	if jam_studio_element :Desc_ResolveAlias \{name = marker_box}
		<resolved_id> :SetProps pos = (-27.0, -200.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	LaunchEvent \{type = focus
		target = vmenu_marker}
endscript

script change_marker_option 
	SetScreenElementProps \{id = vmenu_marker
		block_events}
	CreateScreenElement {
		type = ContainerElement
		parent = root_window
		id = change_marker_option_event_handler
		z_priority = 10000
		event_handlers = [
			{pad_up change_marker_option_up params = {text_id = <text_id> select_array = <select_array> select_global = <select_global> numeric = <numeric> min = <min> max = <max>}}
			{pad_down change_marker_option_down params = {text_id = <text_id> select_array = <select_array> select_global = <select_global> numeric = <numeric> min = <min> max = <max>}}
			{pad_choose change_marker_option_back}
			{pad_back change_marker_option_back}
			{pad_start change_marker_option_back}
		]
	}
	LaunchEvent \{type = focus
		target = change_marker_option_event_handler}
	GhMix_Pad_Choose_Sound
	if ScreenElementExists \{id = change_marker_option_up_arrow}
		DestroyScreenElement \{id = change_marker_option_up_arrow}
	endif
	CreateScreenElement {
		type = SpriteElement
		id = change_marker_option_up_arrow
		parent = <text_id>
		texture = up_arrow
		just = [center bottom]
		pos = (-14.0, 13.0)
		rgba = [0 0 0 255]
		scale = 0.6
	}
	if ScreenElementExists \{id = change_marker_option_down_arrow}
		DestroyScreenElement \{id = change_marker_option_down_arrow}
	endif
	CreateScreenElement {
		type = SpriteElement
		id = change_marker_option_down_arrow
		parent = <text_id>
		texture = down_arrow
		just = [center top]
		pos = (-14.0, 18.0)
		rgba = [0 0 0 255]
		scale = 0.6
	}
endscript

script change_marker_option_up 
	generic_menu_up_or_down_sound \{up}
	if (<numeric> = 0)
		new_option = ($<select_global> - 1)
		GetArraySize ($<select_array>)
		if (<new_option> < 0)
			<new_option> = (<array_size> - 1)
		endif
		change globalname = <select_global> newvalue = <new_option>
		text = ($<select_array> [$<select_global>].name_text)
	else
		new_option = ($<select_global> + 1)
		if (<new_option> > <max>)
			<new_option> = <min>
		endif
		change globalname = <select_global> newvalue = <new_option>
		FormatText TextName = text qs("\L%s") s = ($<select_global>)
	endif
	SetScreenElementProps id = <text_id> text = <text>
	LegacyDoScreenElementMorph \{id = change_marker_option_up_arrow
		scale = 1.5
		relative_scale}
	LegacyDoScreenElementMorph \{id = change_marker_option_up_arrow
		scale = 1.0
		relative_scale
		time = 0.15}
endscript

script change_marker_option_down 
	generic_menu_up_or_down_sound \{down}
	if (<numeric> = 0)
		new_option = ($<select_global> + 1)
		GetArraySize ($<select_array>)
		if (<new_option> >= <array_size>)
			<new_option> = 0
		endif
		change globalname = <select_global> newvalue = <new_option>
		text = ($<select_array> [$<select_global>].name_text)
	else
		new_option = ($<select_global> - 1)
		if (<new_option> < <min>)
			<new_option> = <max>
		endif
		change globalname = <select_global> newvalue = <new_option>
		FormatText TextName = text qs("\L%s") s = ($<select_global>)
	endif
	SetScreenElementProps id = <text_id> text = <text>
	LegacyDoScreenElementMorph \{id = change_marker_option_down_arrow
		scale = 1.5
		relative_scale}
	LegacyDoScreenElementMorph \{id = change_marker_option_down_arrow
		scale = 1.0
		relative_scale
		time = 0.15}
endscript

script menu_jam_marker_back 
	ui_menu_select_sfx
	destroy_menu_jam_marker
	LaunchEvent \{type = focus
		target = jam_control_container}
endscript

script change_marker_option_back 
	SetScreenElementProps \{id = vmenu_marker
		unblock_events}
	DestroyScreenElement \{id = change_marker_option_event_handler}
	GhMix_Pad_Back_Sound
	if ScreenElementExists \{id = change_marker_option_up_arrow}
		DestroyScreenElement \{id = change_marker_option_up_arrow}
	endif
	if ScreenElementExists \{id = change_marker_option_down_arrow}
		DestroyScreenElement \{id = change_marker_option_down_arrow}
	endif
endscript

script destroy_menu_jam_marker 
	if jam_studio_element :Desc_ResolveAlias \{name = marker_box}
		<resolved_id> :SetProps pos = (-27.0, 800.0) time = 0.2
		<resolved_id> :SE_WaitProps
	endif
	set_focus_color \{rgba = [
			220
			220
			220
			255
		]}
	set_unfocus_color \{rgba = [
			210
			130
			0
			255
		]}
	clean_up_user_control_helpers
	jam_recording_add_user_control_helpers
	LaunchEvent \{type = unfocus
		target = vmenu_marker}
	destroy_menu \{menu_id = scrolling_marker}
	if ScreenElementExists \{id = jam_marker_container}
		DestroyScreenElement \{id = jam_marker_container}
	endif
endscript
