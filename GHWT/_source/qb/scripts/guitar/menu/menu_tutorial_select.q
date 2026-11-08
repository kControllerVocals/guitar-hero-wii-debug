
script create_tutorial_select_menu 
	change \{rich_presence_context = presence_tutorial}
	if ScreenElementExists \{id = popup_warning_container}
		destroy_popup_warning_menu
	endif
	if (<allowances> = drum)
		if isRBDrum \{controller = $primary_controller}
			create_popup_warning_menu \{no_background
				title = qs("DRUMS")
				textblock = {
					text = qs("You must use an Official Guitar Hero drum controller to play the drum tutorials.")
				}
				options = [
					{
						func = {
							create_tutorial_select_menu
						}
						func_params = {
							allowances = not_specific
						}
						text = qs("OK")
					}
				]}
			return
		endif
	endif
	make_generic_menu \{title = qs("TUTORIALS")
		pad_back_script = tutorials_event_back
		vmenu_id = tutorial_select_menu}
	GetArraySize \{$tutorial_lessons}
	<total_size> = <array_size>
	<i> = 0
	begin
	<lessons> = ($tutorial_lessons [<i>])
	ForEachIn <lessons> do = add_lesson_menu_item params = {allowances = <allowances> lesson = <i>}
	<i> = (<i> + 1)
	repeat <total_size>
	menu_finish
	LaunchEvent \{type = focus
		target = current_menu}
	current_menu :obj_spawnscript \{PollForMic}
endscript

script destroy_tutorial_select_menu 
	printf \{channel = newdebug
		qs("\Ldestroy tutorial select screen......")}
	LaunchEvent \{type = unfocus
		target = current_menu}
	generic_ui_destroy
	destroy_generic_menu
	clean_up_user_control_helpers
endscript
tutorial_lessons = [
	$guitar_lessons
	$drum_lessons
	$vocals_lessons
	$band_lessons
	$versus_lessons
]
guitar_lessons = [
	{
		text = $wii_guitar_basics
		item = 'basic'
	}
	{
		text = $wii_guitar_star_power
		item = 'star_power'
	}
	{
		text = $wii_advanced_guitar
		item = 'advanced_techniques'
	}
	{
		text = $wii_new_guitar_bass
		item = 'new_features'
	}
]
drum_lessons = [
	{
		text = $wii_drum_basics
		item = 'drum_basic'
	}
	{
		text = $wii_intermediate_drums
		item = 'drum_int'
	}
]
vocals_lessons = [
	{
		text = $wii_vocals_lessons
		item = 'vocals'
	}
]
band_lessons = [
	{
		text = $wii_band_lessons
		item = 'band'
	}
]
versus_lessons = [
	{
		text = $wii_versus_lessons
		item = 'versus'
	}
]

script add_lesson_menu_item 
	<focusable> = 1
	if (<lesson> = 0 || <lesson> = 4)
		if NOT (<allowances> = guitar || <allowances> = all)
			<focusable> = 0
		endif
		<state> = uistate_play_tutorial_guitar
	elseif (<lesson> = 1)
		if NOT (<allowances> = drum || <allowances> = all)
			<focusable> = 0
		endif
		<state> = uistate_play_tutorial_drum
	elseif (<lesson> = 2)
		if NOT (<allowances> = Vocals || <allowances> = all)
			<focusable> = 0
		endif
		<state> = UIstate_play_tutorial_vocals
	else
		<state> = UIstate_play_tutorial_vocals
	endif
	FormatText checksumname = lesson_tag '%i_lesson' i = <item>
	GetGlobalTags \{training}
	if ((<...>.<lesson_tag>) = complete)
		<icon> = tutorial_complete
	else
		<icon> = tutorial_incomplete
	endif
	if (<focusable> = 1)
		add_generic_menu_icon_item {
			icon = <icon>
			text = <text>
			pad_choose_script = menu_tutorial_select_choose
			pad_choose_params = {item = <item> choose_state = <state>}
		}
	else
		add_generic_menu_icon_item {
			icon = <icon>
			text = <text>
			not_focusable
		}
	endif
endscript

script menu_tutorial_select_choose \{item = basic}
	FormatText checksumname = tutorial_script 'training_%i_tutorial_script' i = <item>
	set_training_script name = <tutorial_script>
	generic_event_choose state = <choose_state>
endscript

script tutorials_event_back 
	generic_event_back \{data = {
			pass_to_gigboard = true
		}}
endscript
