photobot_select_song_fs = {
	create = photobot_check_song_script
	destroy = photobot_empty_script
	actions = [
		{
			action = continue
			func = photobot_start_song
			flow_state = photobot_play_song_fs
		}
		{
			action = go_back
			flow_state = main_menu_fs
			transition_left
		}
	]
}
photobot_play_song_fs = {
	create = create_photobot_play_song_menu
	destroy = destroy_photobot_play_song_menu
	actions = [
		{
			action = win_song
			func = kill_gem_scroller
			flow_state = photobot_song_over_fs
		}
		{
			action = fail_song
			func = kill_gem_scroller
			flow_state = photobot_song_over_fs
		}
	]
}
photobot_song_over_fs = {
	create = photobot_continue_script
	destroy = photobot_empty_script
	actions = [
		{
			action = continue
			func = photobot_next_song
			flow_state = photobot_select_song_fs
		}
	]
}
photobot_song_index = 0
photobot_venue_index = 0
photobot_song_section = 0
photobot_done = 0

script photobot_startup \{venue = 0
		section = 0}
	change photobot_song_section = <section>
	change photobot_song_index = (<section> * 22)
	change photobot_venue_index = <venue>
	change \{photobot_done = 0}
	change \{current_difficulty = expert}
	ui_flow_manager_respond_to_action \{action = photobot_test}
endscript

script photobot_empty_script 
endscript

script photobot_continue_script 
	SpawnScriptLater \{photobot_delayed_action
		params = {
			action = continue
		}}
endscript

script photobot_delayed_action 
	Wait \{1.0}
	SpawnScriptLater ui_flow_manager_respond_to_action params = {action = <action>}
endscript

script photobot_check_song_script 
	if (($photobot_done) = 1)
		SpawnScriptLater \{photobot_delayed_action
			params = {
				action = go_back
			}}
	else
		photobot_continue_script
	endif
endscript

script photobot_start_song 
	character_id = Robot
	change structurename = player1_status character_id = <character_id>
	change \{structurename = player1_status
		outfit = 1}
	change \{structurename = player1_status
		style = 5}
	guitar_array = ($Bonus_Guitars)
	GetArraySize ($Secret_Guitars)
	index = 0
	begin
	guitar_id = ($Secret_Guitars [<index>].id)
	GetGlobalTags <guitar_id>
	if (<unlocked_for_purchase> = 1)
		AddArrayElement array = (<guitar_array>) element = ($Secret_Guitars [<index>])
		<guitar_array> = (<array>)
	endif
	<index> = (<index> + 1)
	repeat <array_size>
	GetArraySize <guitar_array>
	GetRandomValue a = 0 b = (<array_size> -1) name = random_guitar_index Integer
	get_musician_instrument_struct index = <random_guitar_index>
	change structurename = player1_status instrument_id = (<info_struct>.desc_id)
	get_LevelZoneArray_checksum index = ($photobot_venue_index)
	change current_level = <level_checksum>
	get_songlist_checksum index = ($photobot_song_index)
	change current_song = <song_checksum>
	start_song
endscript

script photobot_next_song 
	change photobot_song_index = (($photobot_song_index) + 1)
	array_size = 22
	if (($photobot_song_section) = 1)
		array_size = 43
	endif
	if ((($photobot_song_index) = <array_size>) || (($photobot_song_index) > <array_size>))
		change \{photobot_done = 1}
	endif
endscript
photobot_text_pos = (640.0, 540.0)
photobot_text_scale = (2.0, 2.0)
photobot_text_dims = (465.0, 300.0)

script photobot_show_song_and_venue 
	CreateScreenElement \{type = ContainerElement
		id = photobot_text_container
		parent = root_window
		pos = (0.0, 0.0)
		just = [
			left
			top
		]
		scale = (1.0, 1.0)
		z_priority = 1000000
		alpha = 1}
	FormatText TextName = photobot_text qs("\L%s") s = ($photobot_song_index)
	CreateScreenElement {
		type = TextBlockElement
		parent = photobot_text_container
		id = photobot_textblock
		text = <photobot_text>
		font = text_a4
		scale = ($photobot_text_scale)
		just = [center center]
		dims = ($photobot_text_dims)
		pos = ($photobot_text_pos)
		rgba = [255 255 255 255]
		z_priority = 1000000
		shadow
		shadow_offs = (3.0, 3.0)
		shadow_rgba = [0 0 0 255]
	}
endscript

script create_photobot_play_song_menu 
	show_highway
	photobot_show_song_and_venue
endscript

script destroy_photobot_play_song_menu 
	hide_highway
	if ScreenElementExists \{id = photobot_text_container}
		DestroyScreenElement \{id = photobot_text_container}
	endif
endscript
