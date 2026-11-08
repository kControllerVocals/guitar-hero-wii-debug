gbh_first_time_in = 1
battle_explanation_bullet_materials = [
	Mat_Battle_Green
	Mat_Battle_Red
	Mat_Battle_Yellow
	Mat_Battle_Blue
	Mat_Battle_Orange
]
battle_explanation_text = {
	bosszakk = {
		image = battle_help_boss_bg_zakk
		title = qs("ALL RIGHT, THIS IS IT!")
		gem_texture = icon_gig_wylde
		bullets = [
			{
				text = qs("Zakk Wylde wants to see if you have what it takes to hang with him.")
			}
			{
				text = qs("Play your best to prove that you belong on the stage with Zakk.")
			}
			{
				text = qs("If he gets the crowd meter all the way to his side then the crowd will boo you off stage.")
			}
			{
				text = qs("Oh yeah, good luck!")
			}
		]
		prompt = qs("READY TO ROCK?")
	}
	bossted = {
		image = battle_help_boss_bg_nugent
		title = qs("ALL RIGHT, THIS IS IT!")
		gem_texture = icon_gig_nugent
		bullets = [
			{
				text = qs("Ted Nugent wants to jam on stage with you.")
			}
			{
				text = qs("You don't want to embarrass yourself so play your best.")
			}
			{
				text = qs("If the crowd meter goes all the way to Ted's side you'll get booed off stage.")
			}
			{
				text = qs("You ready to face the Motor City Madman?!")
			}
		]
		prompt = qs("READY TO ROCK?")
	}
	generic = {
		title = qs("BATTLE MODE!")
		gem_texture = battle_material
		bullets = [
			{
				text = qs("Hit each series of BATTLE GEMS to collect ATTACKS")
			}
			{
				text = qs("Once you have collected an ATTACK, Tilt your guitar upward to disrupt your opponent and make them miss")
			}
			{
				text = qs("You HAVE to make your opponent FAIL before the end or else you go to SUDDEN DEATH")
			}
			{
				text = qs("In SUDDEN DEATH all the ATTACKS become the devastating DEATH DRAIN")
			}
		]
		prompt = qs("READY TO ROCK?")
	}
}

script create_battle_helper_menu \{device_num = 0
		popup = 0}
	if GameIsPaused
		UnPauseGame
	endif
	<bg_texture> = battle_mode_BG
	if GotParam \{boss}
		if ($game_mode = p2_battle)
			<boss_structure> = ($battle_explanation_text.generic)
		else
			<boss_structure> = ($battle_explanation_text.<boss>)
			<bg_texture> = ($battle_explanation_text.<boss>.image)
		endif
	else
		GetGlobalTags \{Progression}
		<boss_structure> = ($battle_explanation_text.generic)
	endif
	menu_z = 10
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = battle_explanation_container}
	CreateScreenElement \{parent = battle_explanation_container
		type = VMenu
		id = bullet_spacer
		pos = (685.0, 205.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]}
	GetArraySize \{$battle_explanation_bullet_materials}
	<num_materials> = <array_size>
	GetArraySize (<boss_structure>.bullets)
	<num_bullets> = <array_size>
	<i> = 0
	begin
	CreateScreenElement \{parent = bullet_spacer
		type = ContainerElement
		dims = (100.0, 100.0)
		just = [
			left
			top
		]}
	<container_id> = <id>
	CreateScreenElement {
		parent = <container_id>
		type = TextBlockElement
		text = (<boss_structure>.bullets [<i>].text)
		local_id = text
		dims = (480.0, 0.0)
		pos = (0.0, 0.0)
		allow_expansion
		rgba = (($g_menu_colors).lt_violet_grey)
		z_priority = 50
		line_spacing = 0.9
		font = fontgrid_text_a8
		just = [left top]
		internal_just = [left top]
		internal_scale = 0.625
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		alpha = 0
	}
	GetScreenElementDims id = <id>
	<container_id> :SE_SetProps dims = ((1.0, 0.0) * <width> + (0.0, 1.0) * <Height> + (0.0, 20.0))
	if (<boss_structure>.gem_texture = battle_material)
		Mod a = <i> b = <num_materials>
		CreateScreenElement {
			type = SpriteElement
			parent = <container_id>
			rgba = [255 255 255 255]
			just = [right top]
			z_priority = 40
			local_id = gem
			pos = (-10.0, 7.0)
			scale = 0.5
			material = (($battle_explanation_bullet_materials) [<Mod>])
			alpha = 0
			MaterialProps = [
				{
					name = m_startFade
					Property = 1.0
				}
				{
					name = m_endFade
					Property = 1.0
				}
				{
					name = m_playerIndex
					Property = 1.0
				}
			]
		}
	else
		CreateScreenElement {
			type = SpriteElement
			parent = <container_id>
			texture = (<boss_structure>.gem_texture)
			rgba = [255 255 255 255]
			just = [right top]
			z_priority = 40
			local_id = gem
			pos = (-10.0, 0.0)
			relative_scale
			scale = 1.6
			alpha = 0
		}
	endif
	RunScriptOnScreenElement id = <container_id> battle_fly_in_anim params = {idx = <i> container_id = <container_id>}
	<i> = (<i> + 1)
	repeat <num_bullets>
	if IsPs3
		change \{gHighwayStartFade = 1.0}
		change \{gHighwayEndFade = 1.0}
	endif
	if StructureContains \{Structure = boss_structure
			image}
		CreateScreenElement {
			type = SpriteElement
			id = who_wants_to_battle_image
			parent = battle_explanation_container
			rgba = [255 255 255 255]
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			texture = (<boss_structure>.image)
			just = [center center]
			z_priority = 5
			alpha = 1
		}
	endif
	<title_offset> = (-10.0, -20.0)
	CreateScreenElement {
		type = SpriteElement
		parent = battle_explanation_container
		pos = ((910.0, 165.0) + <title_offset>)
		dims = (384.0, 96.0)
		texture = battle_help_flourish
		just = [center bottom]
		z_priority = 50
		alpha = 0.5
	}
	CreateScreenElement {
		type = SpriteElement
		parent = battle_explanation_container
		pos = ((910.0, 145.0) + <title_offset>)
		dims = (384.0, 96.0)
		texture = battle_help_flourish
		just = [center top]
		z_priority = 50
		alpha = 0.5
		flip_h
	}
	if ($game_mode = p2_faceoff ||
			$game_mode = p2_pro_faceoff ||
			$game_mode = p2_battle ||
			$game_mode = p2_quickplay)
		exclusive_mp_controllers = [0 , 0]
		SetArrayElement ArrayName = exclusive_mp_controllers index = 0 newvalue = ($player1_device)
		SetArrayElement ArrayName = exclusive_mp_controllers index = 1 newvalue = ($player2_device)
		exclusive_device = <exclusive_mp_controllers>
	else
		exclusive_device = ($primary_controller)
	endif
	CreateScreenElement {
		type = TextElement
		parent = battle_explanation_container
		id = who_wants_to_battle_text
		text = (<boss_structure>.title)
		font = fontgrid_text_a10
		scale = 0.5
		pos = ((910.0, 100.0) + <title_offset>)
		rgba = [80 200 140 255]
		just = [center top]
		z_priority = 51
		font_spacing = 5
		shadow
		shadow_rgba = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
		event_handlers = [
			{pad_choose battle_helper_continue params = {device_num = <device_num>}}
			{pad_back battle_helper_back}
		]
		exclusive_device = <exclusive_device>
	}
	GetScreenElementDims id = <id>
	fit_text_in_rectangle id = <id> dims = ((530.0, 0.0) + (<Height> * (0.0, 1.0))) start_x_scale = 1 start_y_scale = 1 only_if_larger_x = 1
	CreateScreenElement {
		type = TextElement
		parent = bullet_spacer
		text = (<boss_structure>.prompt)
		font = fontgrid_text_a8
		scale = 0.7
		pos = (715.0, 580.0)
		rgba = [80 200 140 255]
		just = [left top]
		z_priority = 50
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = (($g_menu_colors).black)
		alpha = 0
	}
	RunScriptOnScreenElement id = <id> wait_and_show_ready
	if ($gbh_first_time_in = 0)
		LaunchEvent \{type = focus
			target = who_wants_to_battle_text}
		set_user_control_color \{text_rgba = [
				200
				200
				200
				255
			]
			bg_rgba = [
				0
				0
				0
				200
			]}
		add_user_control_helper \{text = qs("BATTLE")
			button = green
			z = 100}
		add_user_control_helper \{text = qs("DECLINE")
			button = red
			z = 100}
	endif
endscript

script battle_helper_continue 
	PlaySound \{Guitar_Select_Affirmation_1
		vol = -5
		buss = front_end}
	spawnscriptnow \{Crowd_Sustain_Boss_Battle}
	SE_SetProps \{block_events}
	change \{is_changing_levels = 1}
	restart_song
	change \{is_changing_levels = 0}
	generic_event_back \{state = uistate_gameplay}
endscript

script battle_helper_back 
	SoundEvent \{event = Menu_Warning_SFX_softer}
	SoundEvent \{event = Crowd_Fail_Song_SFX_softer}
	Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = FrontEnd_Menu_Music}
	generic_event_back \{state = uistate_gig_posters}
endscript

script destroy_battle_helper_menu 
	if ($gbh_first_time_in = 1)
		change \{gbh_first_time_in = 0}
	endif
	clean_up_user_control_helpers
	destroy_menu \{menu_id = battle_explanation_container}
endscript

script battle_fly_in_anim 
	ResolveScreenElementId id = {<container_id> child = text}
	<text_id> = <resolved_id>
	ResolveScreenElementId id = {<container_id> child = gem}
	<gem_id> = <resolved_id>
	Wait \{0.15
		seconds}
	Wait (<idx> * 2.25) seconds
	<gem_id> :SE_GetProps
	<gem_final_pos> = <pos>
	<gem_id> :SE_SetProps pos = (<gem_final_pos> + (-600.0, 0.0)) alpha = 1
	<gem_id> :SE_SetProps pos = <gem_final_pos> time = 0.35000002 motion = ease_in
	<text_id> :SE_SetProps time = 0.2 motion = ease_in rgba = [255 255 255 255] alpha = 1
	<text_id> :SE_WaitProps
	<text_id> :SE_SetProps time = 0.1 motion = ease_out rgba = (($g_menu_colors).lt_violet_grey)
	spawnscriptnow \{Boss_Battle_Whoosh_Sound}
endscript

script wait_and_show_ready 
	<time> = 9.8
	if ($gbh_first_time_in = 1)
		SE_SetProps \{alpha = 0}
		Wait \{4
			seconds}
		LaunchEvent \{type = focus
			target = who_wants_to_battle_text}
		Wait (<time> - 4.0) seconds
		SoundEvent \{event = Boss_Battle_Press_Sound}
		SE_SetProps \{time = 0.2
			motion = ease_in
			rgba = [
				255
				255
				255
				255
			]
			alpha = 1}
		SE_WaitProps
		SE_SetProps \{time = 0.1
			motion = ease_in
			rgba = [
				80
				200
				140
				255
			]}
		set_user_control_color \{text_rgba = [
				0
				0
				0
				255
			]
			bg_rgba = [
				180
				180
				180
				255
			]}
		add_user_control_helper \{text = qs("BATTLE")
			button = green
			z = 100}
		add_user_control_helper \{text = qs("DECLINE")
			button = red
			z = 100}
	else
		Wait <time> seconds
		SoundEvent \{event = Boss_Battle_Press_Sound}
		SE_SetProps \{time = 0.2
			motion = ease_in
			rgba = [
				255
				255
				255
				255
			]
			alpha = 1}
		SE_WaitProps
		SE_SetProps \{time = 0.1
			motion = ease_in
			rgba = [
				80
				200
				140
				255
			]}
	endif
endscript
