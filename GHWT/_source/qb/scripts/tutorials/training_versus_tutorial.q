training_versus_tutorial_script = [
	{
		call = training_versus_tutorial_startup
	}
	{
		time = 1000
		call = training_versus_tutorial_show_title
	}
	{
		lesson = 1
		call = training_7_1_show_lesson_header
	}
	{
		call = training_7_1_show_different_gametypes
	}
	{
		call = training_7_1_complete_message
	}
	{
		lesson = 2
		call = training_7_2_show_lesson_header
	}
	{
		call = training_7_2_show_lead_indicator
	}
	{
		call = training_7_2_complete_message
	}
	{
		lesson = 3
		call = training_7_3_show_lesson_header
	}
	{
		call = training_7_3_show_battle_highways
	}
	{
		call = training_7_3_start_hit_notes_task
	}
	{
		call = training_7_3_complete_message
	}
	{
		lesson = 4
		call = training_7_4_show_lesson_header
	}
	{
		call = training_7_4_show_battle_highways
	}
	{
		call = training_7_4_start_tilt_task
	}
	{
		call = training_7_4_complete_message
	}
	{
		lesson = 5
		call = training_7_5_show_lesson_header
	}
	{
		call = training_7_5_show_battle_highways
	}
	{
		call = training_7_5_start_fix_broken_string_task
	}
	{
		call = training_7_5_complete_message
	}
	{
		lesson = 6
		call = training_7_6_show_lesson_header
	}
	{
		call = training_7_6_show_battle_highways
	}
	{
		call = training_7_6_start_multiple_attacks_task
	}
	{
		call = training_7_6_complete_message
	}
	{
		lesson = 7
		call = training_7_7_show_lesson_header
	}
	{
		call = training_7_7_explain_do_or_die
	}
	{
		call = training_7_7_complete_message
	}
	{
		call = training_versus_tutorial_end
	}
]

script training_7_generic_placeholder_alert \{text_to_show = qs("\Lmissing text")}
	training_show_title title = <text_to_show>
	Wait \{3
		seconds
		ignoreslomo}
	training_destroy_title \{ignoreslomo}
endscript

script training_7_generic_placeholder_lesson_complete 
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	Wait \{0.75
		seconds
		ignoreslomo}
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_resume_gem_scroller
	training_destroy_gem_scroller
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs("Lesson Complete")
			text_physics = 0
		}}
	Wait \{8
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'lesson_complete'}
endscript

script training_versus_tutorial_startup 
	create_loading_screen
	training_init_session \{header_type = battle}
	training_container :SetTags \{num_parts = 7
		num_complete = 0}
	ReloadSfx \{mode = tutorials
		tutorial = versus}
	destroy_loading_screen
	LaunchEvent \{type = unfocus
		target = root_window}
	create_training_pause_handler
	training_create_narrator_icons
endscript

script training_versus_tutorial_show_title 
	training_show_title \{title = qs("Versus Tutorial")}
	begin
	if ($transitions_locked = 0)
		break
	endif
	Wait \{1
		gameframe
		ignoreslomo}
	repeat
	create_training_pause_handler
	Wait \{3
		seconds}
	training_destroy_title
endscript

script training_7_1_show_lesson_header 
	training_set_lesson_header_text \{number = qs("\L1")
		text = qs("Modes of Play")}
	if ScreenElementExists \{id = lesson_header_frame}
		lesson_header_frame :SE_SetProps \{alpha = 0}
	endif
endscript

script training_7_1_show_different_gametypes 
	CreateScreenElement \{parent = training_container
		type = SpriteElement
		id = tutorial_versus_menu_sprite
		just = [
			center
			center
		]
		texture = tutorial_versus_menu
		pos = (610.0, 120.0)
		scale = (2.7, 2.7)
		z_priority = 4}
	CreateScreenElement \{type = ContainerElement
		id = versus_fake_menu_cont
		parent = training_container
		pos = (-80.0, 80.0)
		z_priority = 5}
	CreateScreenElement \{parent = versus_fake_menu_cont
		id = versus_fake_menu
		type = DescInterface
		desc = 'fake_menu'}
	if versus_fake_menu :Desc_ResolveAlias \{name = alias_fake_menu_vmenu}
		AssignAlias id = <resolved_id> alias = fake_menu_vmenu
		training_7_highlight_fake_menu_item \{index = 0}
	endif
	training_show_narrator \{narrator = 'bassist'}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Vs_Modes_01_BAS'}
	Wait \{4.75
		second}
	training_7_highlight_fake_menu_item \{index = 1}
	Wait \{1
		second}
	training_7_highlight_fake_menu_item \{index = 2}
	Wait \{1
		second}
	training_wait_for_sound \{Sound = 'Tut_Vs_Modes_01_BAS'}
	DestroyScreenElement \{id = versus_fake_menu}
	training_hide_narrator
endscript

script training_7_highlight_fake_menu_item \{index = 0}
	GetScreenElementChildren \{id = fake_menu_vmenu}
	GetArraySize <children>
	<i> = 0
	begin
	if (<i> = <index>)
		retail_menu_focus id = (<children> [<i>])
	else
		retail_menu_unfocus id = (<children> [<i>])
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script training_7_1_complete_message 
	safe_destroy \{id = sm_faceofftext_id}
	safe_destroy \{id = sm_profaceofftext_id}
	safe_destroy \{id = tutorial_versus_menu_sprite}
	training_7_generic_placeholder_lesson_complete
	training_container :GetTags
	<num_complete> = (<num_complete> + 1)
	training_container :SetTags num_complete = (<num_complete>)
endscript

script training_7_2_show_lesson_header 
	create_training_pause_handler
	LaunchEvent \{type = focus
		target = menu_tutorial}
	training_set_lesson_header_text \{number = qs("\L2")
		text = qs("Face-Off")}
	if ScreenElementExists \{id = lesson_header_frame}
		lesson_header_frame :SE_SetProps \{alpha = 0}
	endif
endscript

script training_7_2_show_lead_indicator 
	training_7_2_start_gem_scrollers
	create_training_pause_handler
	LaunchEvent \{type = focus
		target = menu_tutorial}
	change \{game_mode = tutorial}
	Wait \{1
		second
		ignoreslomo}
	create_training_pause_handler
	training_pause_gem_scroller
	training_show_lesson_header
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_Vs_FaceOff_01_BAS'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Vs_FaceOff_02_BAS'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Vs_FaceOff_03_BAS'
		Wait}
	Wait \{0.5
		seconds
		ignoreslomo}
endscript

script training_7_2_complete_message 
	training_play_sound \{Sound = 'Tut_Vs_FaceOff_04_BAS'}
	Wait \{4
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_arrow
		life = 4.0
		pos = (635.0, 250.0)
		scale = 0.7}
	Wait \{4
		seconds
		ignoreslomo}
	training_hide_narrator
	training_7_generic_placeholder_lesson_complete
	training_container :GetTags
	<num_complete> = (<num_complete> + 1)
	training_container :SetTags num_complete = (<num_complete>)
endscript

script training_7_3_show_lesson_header 
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("Battle Power")}
	if ScreenElementExists \{id = lesson_header_frame}
		lesson_header_frame :SE_SetProps \{alpha = 0}
	endif
endscript

script training_7_3_show_battle_highways 
	training_show_narrator \{narrator = 'bassist'}
	training_show_lesson_header
	training_play_sound \{Sound = 'Tut_Vs_Battle_01_BAS'
		Wait}
	training_hide_lesson_header
	training_hide_narrator
	training_7_3_start_gem_scrollers
	KillSpawnedScript \{name = update_score_fast}
	Wait \{1
		second
		ignoreslomo}
	change \{game_mode = tutorial}
	change \{tutorial_battle = 1}
	Wait \{2.5
		second
		ignoreslomo}
	create_training_pause_handler
	training_pause_gem_scroller
	training_play_sound \{Sound = 'Tut_Vs_Battle_02_BAS'
		Wait}
endscript

script training_7_3_start_hit_notes_task 
	training_change_header_type \{type = battle}
	training_hide_lesson_header
	if ScreenElementExists \{id = lesson_header_frame}
		lesson_header_frame :SE_SetProps \{alpha = 1}
	endif
	training_set_lesson_header_text \{number = qs("\L3")
		text = qs("Battle Power")}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("Hitting ALL of the special notes in a ROW will give you a BATTLE POWER.")}
	training_show_lesson_header
	training_set_task_header_body \{text = qs("Hit all of the notes in a row.")}
	training_show_task_header
	training_resume_gem_scroller
	training_7_wait_for_obtain_1_attack
endscript

script training_7_3_complete_message 
	training_7_generic_placeholder_lesson_complete
	training_container :GetTags
	<num_complete> = (<num_complete> + 1)
	training_container :SetTags num_complete = (<num_complete>)
endscript

script training_7_4_show_lesson_header 
	training_change_header_type \{type = battle}
	training_hide_lesson_header
	training_set_lesson_header_text \{number = qs("\L4")
		text = qs("Tilting for Battle Attack")}
	if ScreenElementExists \{id = lesson_header_frame}
		lesson_header_frame :SE_SetProps \{alpha = 1}
	endif
endscript

script training_7_4_show_battle_highways 
	training_7_4_start_gem_scrollers
endscript

script training_7_4_start_tilt_task 
	Wait \{1
		second
		ignoreslomo}
	change \{game_mode = tutorial}
	change \{tutorial_battle = 1}
	Wait \{2.5
		second
		ignoreslomo}
	EnableInput off controller = ($player1_status.controller)
	change \{structurename = player1_status
		current_num_powerups = 0}
	battlemode_ready \{battle_gem = 0
		player_status = player1_status}
	create_training_pause_handler
	training_pause_gem_scroller
	EnableInput off controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 0}
	change \{structurename = player1_status
		last_selected_attack = -1}
	training_play_sound \{Sound = 'Tut_Vs_BattleTilt_01_BAS'}
	Wait \{4
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_attack_indicator
		life = 3
		pos = (350.0, 220.0)
		rot = 90
		scale = 0.7
		z = 60}
	training_wait_for_sound \{Sound = 'Tut_Vs_BattleTilt_01_BAS'}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("To unleash a Battle Power, TILT your guitar.")}
	training_show_lesson_header
	training_set_task_header_body \{text = qs("Unleash an Amp Overload")}
	training_show_task_header
	Wait \{2
		seconds
		ignoreslomo}
	training_resume_gem_scroller
	EnableInput controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 1}
	training_7_4_wait_for_attack
endscript

script training_7_4_complete_message 
	training_play_sound \{Sound = 'Tut_Vs_BattleTilt_02_BAS'
		Wait}
	training_7_generic_placeholder_lesson_complete
	training_container :GetTags
	<num_complete> = (<num_complete> + 1)
	training_container :SetTags num_complete = (<num_complete>)
endscript

script training_7_5_show_lesson_header 
	training_change_header_type \{type = battle}
	training_hide_lesson_header
	training_set_lesson_header_text \{number = qs("\L5")
		text = qs("Different Attacks")}
	if ScreenElementExists \{id = lesson_header_frame}
		lesson_header_frame :SE_SetProps \{alpha = 1}
	endif
endscript

script training_7_5_show_battle_highways 
	training_7_5_start_gem_scrollers
endscript

script training_7_5_start_fix_broken_string_task 
	Wait \{1
		second
		ignoreslomo}
	change \{game_mode = tutorial}
	change \{tutorial_battle = 1}
	Wait \{2.5
		second
		ignoreslomo}
	battlemode_ready \{battle_gem = 5
		player_status = player2_status}
	create_training_pause_handler
	training_pause_gem_scroller
	training_play_sound \{Sound = 'Tut_Vs_DiffAttacks_01_BAS'}
	Wait \{9
		seconds
		ignoreslomo}
	training_add_arrow \{id = training_attack_indicator
		life = 3
		pos = (925.0, 220.0)
		rot = -90
		scale = 0.7
		z = 60}
	training_wait_for_sound \{Sound = 'Tut_Vs_DiffAttacks_01_BAS'}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("Battle Powers CAN also be used against you.")}
	training_add_lesson_body_text \{number = qs("\L2")
		text = qs("When attacked, some will be FIXED over time or by performing an action.")}
	training_add_lesson_body_text \{number = qs("\L3")
		text = qs("To FIX a broken string, TAP the BUTTON of the broken string repeatedly.")}
	training_show_lesson_header
	training_set_task_header_body \{text = qs("Fix your Broken String")}
	training_show_task_header
	training_resume_gem_scroller
	Wait \{1
		seconds
		ignoreslomo}
	battle_trigger_on \{player_status = player2_status}
	training_7_5_wait_for_attack
endscript

script training_7_5_wait_for_attack 
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player1_status.broken_string_mask = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Wait \{1
		second
		ignoreslomo}
endscript

script training_7_5_complete_message 
	training_pause_gem_scroller
	EnableInput off controller = ($player1_status.controller)
	training_play_sound \{Sound = 'Tut_Vs_DiffAttacks_02_BAS'
		Wait}
	EnableInput controller = ($player1_status.controller)
	training_7_generic_placeholder_lesson_complete
	training_container :GetTags
	<num_complete> = (<num_complete> + 1)
	training_container :SetTags num_complete = (<num_complete>)
endscript

script training_7_6_show_lesson_header 
	training_change_header_type \{type = battle}
	training_hide_lesson_header
	training_set_lesson_header_text \{number = qs("\L6")
		text = qs("Multiple Attacks")}
	if ScreenElementExists \{id = lesson_header_frame}
		lesson_header_frame :SE_SetProps \{alpha = 1}
	endif
endscript

script training_7_6_show_battle_highways 
	training_7_6_start_gem_scrollers
endscript

script training_7_6_start_multiple_attacks_task 
	Wait \{1
		second
		ignoreslomo}
	change \{game_mode = tutorial}
	change \{tutorial_battle = 1}
	Wait \{2.5
		second
		ignoreslomo}
	EnableInput off controller = ($player1_status.controller)
	change \{structurename = player1_status
		current_num_powerups = 0}
	create_training_pause_handler
	battlemode_ready \{battle_gem = 0
		player_status = player1_status}
	battlemode_ready \{battle_gem = 2
		player_status = player1_status}
	training_pause_gem_scroller
	EnableInput off controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 0}
	change \{structurename = player1_status
		last_selected_attack = -1}
	training_play_sound \{Sound = 'Tut_Vs_Multiples_01_BAS'
		Wait}
	training_add_lesson_body_text \{number = qs("\L1")
		text = qs("You can hold MORE than one Battle Power.")}
	training_add_lesson_body_text \{number = qs("\L2")
		text = qs("Multiple Battle Powers are FIRED off in order.")}
	training_add_lesson_body_text \{number = qs("\L3")
		text = qs("Tilt your guitar to fire them in sequence.")}
	training_show_lesson_header
	training_set_task_header_body \{text = qs("Fire off multiple attacks")}
	training_show_task_header
	training_resume_gem_scroller
	EnableInput controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 1}
	change \{training_star_power_active = 0}
	change \{LESSON_COMPLETE = 0}
	change \{training_song_over = 0}
	training_7_6_wait_for_attack
	training_7_6_wait_for_attack
endscript

script training_7_6_wait_for_attack 
	EnableInput controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 1}
	old_num_attacks = ($player1_status.current_num_powerups)
	begin
	if ($training_song_over = 1)
		return
	endif
	num_attacks = ($player1_status.current_num_powerups)
	if (<num_attacks> < <old_num_attacks>)
		break
	endif
	if (<num_attacks> > <old_num_attacks>)
		old_num_attacks = <num_attacks>
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_7_6_complete_message 
	Wait \{1
		second
		ignoreslomo}
	training_hide_lesson_header
	training_destroy_gem_scroller
	training_show_narrator \{narrator = 'bassist'}
	training_play_sound \{Sound = 'Tut_Vs_Multiples_02_BAS'
		Wait}
	training_hide_narrator \{narrator = 'bassist'}
	training_7_generic_placeholder_lesson_complete
	training_container :GetTags
	<num_complete> = (<num_complete> + 1)
	training_container :SetTags num_complete = (<num_complete>)
endscript

script training_7_7_show_lesson_header 
	training_change_header_type \{type = standard}
	training_hide_lesson_header
	training_set_lesson_header_text \{number = qs("\L7")
		text = qs("Do-or-Die")}
	if ScreenElementExists \{id = lesson_header_frame}
		lesson_header_frame :SE_SetProps \{alpha = 0}
	endif
endscript

script training_7_7_explain_do_or_die 
	training_show_narrator \{narrator = 'bassist'}
	training_show_lesson_header
	create_training_pause_handler
	training_play_sound \{Sound = 'Tut_Vs_DoOrDie_01_BAS'
		Wait}
	training_play_sound \{Sound = 'Tut_Vs_DoOrDie_02_BAS'
		Wait}
	Wait \{1
		seconds
		ignoreslomo}
	training_play_sound \{Sound = 'Tut_Vs_DoOrDie_03_BAS'
		Wait}
	training_hide_narrator
endscript

script training_7_7_show_powerups 
	CreateScreenElement \{parent = training_container
		id = tutorial_battle_header
		type = DescInterface
		desc = 'tutorial_battle_attacks'}
	tutorial_battle_header :SE_SetProps {
		tutorial_battle_attack_cont_alpha = 0
		tutorial_battle_attack_icon_texture = ($battlemode_powerups [0].card_texture)
		tutorial_battle_attack_text_text = ($battlemode_powerups [0].name_text)
	}
	tutorial_battle_header :SE_SetProps \{tutorial_battle_attack_cont_alpha = 1
		time = 1.0}
	tutorial_battle_header :Obj_SpawnScriptLater \{rotate_highlight_sparkle_glow
		params = {
			id = tutorial_battle_header
			time = 2.5
		}}
	Wait \{4
		seconds
		ignoreslomo}
	GetArraySize \{$battlemode_powerups}
	<i> = 1
	begin
	tutorial_battle_header :SE_SetProps \{tutorial_battle_attack_icon_alpha = 0
		tutorial_battle_attack_text_alpha = 0
		time = 1.0}
	Wait \{1.0
		seconds
		ignoreslomo}
	<icon> = ($battlemode_powerups [<i>].card_texture)
	<text> = ($battlemode_powerups [<i>].name_text)
	tutorial_battle_header :SE_SetProps {
		tutorial_battle_attack_icon_texture = <icon>
		tutorial_battle_attack_text_text = <text>
	}
	tutorial_battle_header :SE_SetProps \{tutorial_battle_attack_icon_alpha = 1
		tutorial_battle_attack_text_alpha = 1
		time = 1.0}
	Wait \{4.0
		seconds
		ignoreslomo}
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	tutorial_battle_header :SE_SetProps \{tutorial_battle_attack_cont_alpha = 0
		time = 1.0}
	Wait \{1.0
		seconds
		ignoreslomo}
	DestroyScreenElement \{id = tutorial_battle_header}
endscript

script training_7_7_complete_message 
	training_destroy_title
	SoundEvent \{event = Tutorial_Mode_Finish_Chord}
	training_hide_lesson_header
	training_destroy_gem_scroller
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'lesson_complete'
			text = qs("Versus Lesson")
			text_physics = 0
			placement = ps2_tut_top
			fit_dims
		}}
	spawnscriptnow \{create_exploding_text
		id = training_spawned_script
		params = {
			parent = 'complete_text'
			text = qs("Complete!")
			text_physics = 0
			placement = ps2_tut_bottom
			fit_dims
		}}
	Wait \{7
		seconds
		ignoreslomo}
	KillSpawnedScript \{name = create_exploding_text}
	destroy_all_exploding_text
	training_container :GetTags
	<num_complete> = (<num_complete> + 1)
	training_container :SetTags num_complete = (<num_complete>)
endscript

script training_versus_tutorial_end 
	training_container :GetTags
	if (<num_complete> = <num_parts>)
		SetGlobalTags \{training
			params = {
				versus_lesson = complete
			}}
	endif
	change \{tutorial_battle = 0}
	training_kill_session
	tutorial_disable_botplay
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_destroy_narrator_icons
	SetScreenElementProps \{id = root_window
		event_handlers = [
			{
				pad_start
				gh3_start_pressed
			}
		]
		replace_handlers}
	training_check_for_all_tutorials_finished
	decide_tutorial_back_destination
endscript

script training_7_2_start_gem_scrollers 
	change \{game_mode = p2_faceoff}
	training_start_gem_scroller \{players = 2
		bot_array = [
			0
			1
			0
			0
		]
		song = Tut_Demo
		no_score_update
		disable_hud}
	KillSpawnedScript \{name = update_score_fast}
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	training_wait_for_gem_scroller_startup
endscript

script training_7_3_start_gem_scrollers 
	change \{game_mode = p2_battle}
	training_start_gem_scroller \{players = 2
		bot_array = [
			0
			1
			0
			0
		]
		song = Tut_VS_BattPow
		no_score_update
		disable_hud}
	player_text = 'p1'
	player_status = player1_status
	player = 1
	change \{structurename = player1_status
		current_health = 1.0}
	SpawnScriptLater update_score_fast params = {<...>} id = training_spawned_script
	player_text = 'p2'
	player_status = player2_status
	player = 2
	change \{structurename = player2_status
		current_health = 1.0}
	SpawnScriptLater update_score_fast params = {<...>} id = training_spawned_script
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{song_wonp2 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_wait_for_gem_scroller_startup
endscript

script training_7_4_start_gem_scrollers 
	change \{game_mode = p2_battle}
	training_start_gem_scroller \{players = 2
		bot_array = [
			0
			1
			0
			0
		]
		song = Tut_VS_Tilt
		no_score_update
		disable_hud}
	KillSpawnedScript \{name = update_score_fast}
	player_text = 'p1'
	player_status = player1_status
	player = 1
	change \{structurename = player1_status
		current_health = 1.0}
	SpawnScriptLater update_score_fast params = {<...>} id = training_spawned_script
	player_text = 'p2'
	player_status = player2_status
	player = 2
	change \{structurename = player2_status
		current_health = 1.0}
	SpawnScriptLater update_score_fast params = {<...>} id = training_spawned_script
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{song_wonp2 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_wait_for_gem_scroller_startup
endscript

script training_7_4_wait_for_attack 
	change \{training_star_power_active = 0}
	change \{LESSON_COMPLETE = 0}
	change \{training_song_over = 0}
	EnableInput controller = ($player1_status.controller)
	change \{structurename = player1_status
		star_power_usable = 1}
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player2_status.shake_notes != -1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Wait \{1.5
		seconds
		ignoreslomo}
endscript

script training_7_5_start_gem_scrollers 
	change \{game_mode = p2_battle}
	training_start_gem_scroller \{players = 2
		bot_array = [
			0
			1
			0
			0
		]
		song = Tut_VS_Recov
		no_score_update
		disable_hud}
	KillSpawnedScript \{name = update_score_fast}
	player_text = 'p1'
	player_status = player1_status
	player = 1
	change \{structurename = player1_status
		current_health = 1.0}
	SpawnScriptLater update_score_fast params = {<...>} id = training_spawned_script
	player_text = 'p2'
	player_status = player2_status
	player = 2
	change \{structurename = player2_status
		current_health = 1.0}
	SpawnScriptLater update_score_fast params = {<...>} id = training_spawned_script
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{song_wonp2 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_wait_for_gem_scroller_startup
endscript

script training_7_6_start_gem_scrollers 
	change \{game_mode = p2_battle}
	training_start_gem_scroller \{players = 2
		bot_array = [
			0
			1
			0
			0
		]
		song = Tut_VS_MultAttck
		no_score_update
		disable_hud}
	KillSpawnedScript \{name = update_score_fast}
	player_text = 'p1'
	player_status = player1_status
	player = 1
	change \{structurename = player1_status
		current_health = 1.0}
	SpawnScriptLater update_score_fast params = {<...>} id = training_spawned_script
	player_text = 'p2'
	player_status = player2_status
	player = 2
	change \{structurename = player2_status
		current_health = 1.0}
	SpawnScriptLater update_score_fast params = {<...>} id = training_spawned_script
	if ScreenElementExists \{id = menu_tutorial}
		LaunchEvent \{type = unfocus
			target = menu_tutorial}
		destroy_menu \{menu_id = menu_tutorial}
	endif
	event_handlers = [
		{song_wonp1 training_song_won}
		{song_wonp2 training_song_won}
		{pad_start show_training_pause_screen}
	]
	new_menu {
		scrollid = menu_tutorial
		vmenuid = vmenu_tutorial
		menu_pos = (120.0, 190.0)
		use_backdrop = 0
		event_handlers = <event_handlers>
	}
	training_wait_for_gem_scroller_startup
endscript

script training_7_wait_for_obtain_1_attack 
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player1_status.current_num_powerups = 1)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script training_7_wait_for_obtain_3_attacks 
	begin
	if ($training_song_over = 1)
		return
	endif
	if ($player1_status.current_num_powerups = 3)
		return
	endif
	Wait \{1
		gameframe}
	repeat
endscript
