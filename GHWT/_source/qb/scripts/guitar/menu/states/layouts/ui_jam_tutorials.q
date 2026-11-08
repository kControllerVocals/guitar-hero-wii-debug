jam_tutorial_menu_topics = [
	{
		name = qs("Introduction")
		desc = $wii_jam_tutorial_intro
		lesson_tag = rs_introduction_lesson
		allow_drums = 1
		sections = [
			jam_tutorial_intro
			jam_tutorial_intro_noise
			jam_tutorial_intro_recording
		]
	}
	{
		name = qs("Lead & Bass")
		desc = qs("Learn the Lead and Bass Guitar basic controls for jamming.")
		lesson_tag = rs_lead_and_bass_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_lead
			jam_tutorial_open_strum
			jam_tutorial_play_scale
			jam_tutorial_tilt
		]
	}
	{
		name = qs("Rhythm Guitar")
		desc = $wii_jam_tutorial_rhythm
		lesson_tag = rs_rhythm_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_rhythm
			jam_tutorial_effects
		]
	}
	{
		name = qs("Drums")
		desc = qs("Learn how to jam with Drums, and even change your Drum Kit.")
		lesson_tag = rs_drums_lesson
		allow_drums = 1
		sections = [
			jam_tutorial_drums
			jam_tutorial_drum_kits
		]
	}
	{
		name = qs("Keyboard")
		desc = $wii_jam_tutorial_keyboard
		lesson_tag = rs_melody_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_melody
		]
	}
	{
		name = qs("Recording a Jam")
		desc = qs("Learn how to record a jam, play it back immediately, and then upload it online to GHTunes.")
		lesson_tag = rs_recording_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_recording
			jam_tutorial_ghtunes
		]
	}
	{
		name = qs("Guitar Techniques")
		desc = qs("Learn how to lay down sustain notes, hammer-ons and pull-offs. Also learn how to Palm Mute notes.")
		lesson_tag = rs_pro_guitar_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_sustains
			jam_tutorial_hos
			jam_tutorial_pms
		]
	}
	{
		name = qs("Advanced Tools")
		desc = qs("Learn how to use the Arpeggiator and the Drum Machine.")
		lesson_tag = rs_advanced_tools_lesson
		allow_drums = 0
		sections = [
			jam_tutorial_arpeggiator
			jam_tutorial_drum_machine
		]
	}
	{
		name = qs("GHMix Editing")
		desc = qs("Learn how to record and edit a song using GHMix.")
		lesson_tag = rs_ghmix_editing_lesson
		allow_drums = 0
		GHMix_tutorial = 1
		sections = [
			ghmix_tutorial_live_rec
			ghmix_tutorial_step_rec
			ghmix_tutorial_delete
		]
	}
	{
		name = qs("GHMix Advanced")
		desc = qs("Learn some advanced techniques for creating songs in GHMix.")
		lesson_tag = rs_ghmix_pro_techniques_tools_lesson
		allow_drums = 0
		GHMix_tutorial = 2
		sections = [
			ghmix_tutorial_copypaste
			ghmix_tutorial_loops
			ghmix_tutorial_nudge
		]
	}
]

script ui_create_jam_tutorials 
	spawnscriptnow \{jam_create_tutorial_menu}
endscript

script ui_destroy_jam_tutorials 
endscript

script ui_init_jam_tutorials 
endscript

script ui_deinit_jam_tutorials 
	jam_destroy_tutorial_menu
endscript

script jam_create_tutorial_menu 
	change \{target_jam_camera_prop = jam_tutorials}
	jam_camera_wait
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = jam_tutorial_select_container}
	make_generic_menu \{title = qs("Tutorials")
		pad_back_script = jam_exit_tutorial_menu
		vmenu_id = jam_tutorial_menu}
	tutorial_text_params = {type = TextElement font = fontgrid_text_a3 just = [left center] scale = 0.6 rot_angle = -5 rgba = [20 255 20 255]}
	CreateScreenElement {
		type = TextBlockElement
		font = fontgrid_text_a3
		just = [left top]
		scale = 1
		internal_scale = 0.75
		rgba = [20 255 20 255]
		parent = jam_tutorial_select_container
		id = jam_tutorial_select_info
		pos = (635.0, 170.0)
		dims = (425.0, 265.0)
		rot_angle = 1
		z_priority = (5)
	}
	safe_hide \{id = jam_tutorial_select_info}
	<tutorial_topics> = ($jam_tutorial_menu_topics)
	GetArraySize <tutorial_topics>
	index = 0
	allow = 1
	begin
	if IsDrumController controller = ($primary_controller)
		if StructureContains Structure = (<tutorial_topics> [<index>]) name = allow_drums
			<allow> = (<tutorial_topics> [<index>].allow_drums)
		endif
	endif
	if IsGuitarController controller = ($primary_controller)
		if NOT ControllerHasDpad controller = ($primary_controller)
			if ((<tutorial_topics> [<index>].lesson_tag) = rs_recording_lesson)
				<allow> = 0
			else
				<allow> = 1
			endif
		endif
	endif
	<GHMix_tutorial> = 0
	if StructureContains Structure = (<tutorial_topics> [<index>]) name = GHMix_tutorial
		<GHMix_tutorial> = (<tutorial_topics> [<index>].GHMix_tutorial)
	endif
	if (<allow> = 1)
		GetGlobalTags \{training}
		<lesson_tag> = (<tutorial_topics> [<index>].lesson_tag)
		if ((<...>.<lesson_tag>) = complete)
			<icon> = tutorial_complete
		else
			<icon> = tutorial_incomplete
		endif
		add_generic_menu_icon_item {
			icon = <icon>
			text = (<tutorial_topics> [<index>].name)
			pad_choose_script = select_jam_tutorial_option
			pad_choose_params = {index = <index> ghmix_tut = <GHMix_tutorial>}
			additional_focus_script = focus_jam_tutorial_option
			additional_focus_params = {index = <index>}
		}
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script focus_jam_tutorial_option 
	retail_menu_focus id = <id>
	jam_camera_wait
	<tutorial_topics> = ($jam_tutorial_menu_topics)
	FormatText TextName = run_text qs("C:> run tutorial.exe \n%s") s = (<tutorial_topics> [<index>].desc)
	jam_tutorial_select_info :SE_SetProps text = <run_text>
	safe_show \{id = jam_tutorial_select_info}
endscript

script select_jam_tutorial_option 
	jam_destroy_tutorial_menu
	<wrong> = 0
	<tutorial_topics> = ($jam_tutorial_menu_topics)
	if IsGuitarController controller = ($primary_controller)
	elseif IsDrumController controller = ($primary_controller)
		if StructureContains Structure = (<tutorial_topics> [<index>]) name = allow_drums
			if NOT ((<tutorial_topics> [<index>].allow_drums) = 1)
				LaunchEvent \{type = unfocus
					target = current_menu}
				create_popup_warning_menu \{no_background
					title = qs("WARNING")
					textblock = {
						text = qs("These tutorials require you to be using a Guitar controller.")
					}
					options = [
						{
							func = {
								select_jam_tutorial_option_retry
							}
							func_params = {
							}
							text = qs("OK")
						}
					]}
				<wrong> = 1
			endif
		endif
	else
		if NOT ($allow_controller_for_all_instruments = 1)
			jam_exit_tutorial_menu
			<wrong> = 1
		endif
	endif
	if (<wrong> = 0)
		spawnscriptnow jam_play_tutorial_topic id = jam_tutorial_topic_spawn params = {index = <index> ghmix_tut = <ghmix_tut>}
	endif
endscript

script select_jam_tutorial_option_retry 
	destroy_popup_warning_menu
	LaunchEvent \{type = focus
		target = current_menu}
	jam_create_tutorial_menu
endscript

script jam_exit_tutorial_menu 
	KillSpawnedScript \{id = jam_tutorial_topic_spawn}
	jam_destroy_tutorial_menu
	generic_event_back \{state = uistate_jam}
endscript

script jam_destroy_tutorial_menu 
	set_focus_color
	set_unfocus_color
	change \{game_mode = p1_quickplay}
	KillSpawnedScript \{id = jam_tutorial_spawns}
	if ScreenElementExists \{id = jam_tut_text}
		DestroyScreenElement \{id = jam_tut_text}
	endif
	if ScreenElementExists \{id = jam_tutorial_select_container}
		DestroyScreenElement \{id = jam_tutorial_select_container}
	endif
	destroy_generic_menu
	clean_up_user_control_helpers
	destroy_menu_backdrop
endscript
