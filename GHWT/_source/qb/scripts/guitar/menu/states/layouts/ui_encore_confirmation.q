
script ui_create_encore_confirmation 
	spawnscriptnow ui_create_encore_confirmation_spawned params = {<...>}
	if ($is_network_game = 1)
		spawn_player_drop_listeners \{drop_player_script = song_breakdown_drop_player
			end_game_script = song_breakdown_end_game}
	endif
endscript

script ui_destroy_encore_confirmation 
	StopSoundEvent \{$Current_Crowd_Encore
		fade_time = 4
		fade_type = log_slow}
	destroy_ui_encore_confirmation
endscript

script online_encore_wait_script 
	Wait \{7
		seconds}
	spawnscriptnow \{encore_play_real}
endscript

script ui_create_encore_confirmation_spawned 
	destroy_ui_encore_confirmation
	if isSinglePlayerGame
		getNewCashFromDetailedStats
		stars = ($player1_status.stars)
		score = ($player1_status.score)
		Cash = <new_cash>
	else
		GameMode_GetNumPlayersShown
		total_cash = 0
		p = 1
		begin
		GetPlayerInfo <p> is_local_client
		if (<is_local_client> = 1)
			getNewCashFromDetailedStats player = <p>
			total_cash = (<total_cash> + <new_cash>)
		endif
		p = (<p> + 1)
		repeat <num_players_shown>
		score = ($band1_status.score)
		stars = ($band1_status.stars)
		Cash = <total_cash>
	endif
	if ($is_network_game = 0)
		CreateScreenElement \{type = DescInterface
			parent = root_window
			id = EncoreInterface
			desc = 'encore'
			encore_master_container_scale = 1.0
			event_handlers = [
				{
					pad_choose
					encore_play_real
				}
			]}
	else
		CreateScreenElement \{type = DescInterface
			parent = root_window
			id = EncoreInterface
			desc = 'encore'
			encore_master_container_scale = 1.0}
		RunScriptOnScreenElement \{id = EncoreInterface
			online_encore_wait_script}
	endif
	if EncoreInterface :Desc_ResolveAlias \{name = alias_encore_title}
		EncoreInterface :SE_GetProps
		text_to_morph = <encore_title_text>
		text_to_morph_rgba = <encore_title_rgba>
		text_to_morph_dims = <encore_title_dims>
		text_to_morph_font = <encore_title_font>
		EncoreInterface :SE_SetProps \{encore_title_text = qs("\L")}
		split_text_into_menu {
			text = <text_to_morph>
			dims = <text_to_morph_dims>
			fit_major = `fit content`
			fit_minor = `fit content`
			text_params = {
				z_priority = 525.0
				rgba = [170 70 70 255]
				font = <text_to_morph_font>
				use_shadow = true
				shadow_rgba =
				[
					0 , 0 , 0 , 255
				]
				shadow_offs = (-3.0, -3.0)
			}
			pos_anchor = [center center]
			just = [left top]
			internal_just = [center center]
			parent = <resolved_id>
			spacing_between = -10
			pos = (0.0, -20.0)
		}
		letter_scale = [4.8 3.2 3.7 4.5]
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
	if EncoreInterface :Desc_ResolveAlias \{name = alias_stars_stack}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			child_index = 0
			begin
			GetRandomValue \{name = rand_rot
				a = 0
				b = 360}
			SetScreenElementProps id = (<children> [<child_index>]) rot_angle = <rand_rot>
			child_index = (<child_index> + 1)
			repeat <array_size>
			if (<array_size> > 0)
				if (<stars> < 5)
					destroy_menu menu_id = (<children> [0])
				endif
				if (<stars> < 4)
					destroy_menu menu_id = (<children> [1])
				endif
			endif
		endif
	endif
	CastToInteger \{score}
	FormatText TextName = score_text qs("%d") d = <score> usecommas
	EncoreInterface :SE_SetProps encore_score_text = <score_text>
	FormatText TextName = cash_text qs("$%d") d = <Cash> usecommas
	EncoreInterface :SE_SetProps encore_money_text = <cash_text>
	spawnscriptnow \{ui_encore_animate_flashbulbs}
	if ($is_network_game = 0)
		add_user_control_helper \{text = qs("SELECT")
			button = green
			z = 100}
	endif
	AssignAlias \{alias = current_menu
		id = EncoreInterface}
	mark_encore_started
endscript

script mark_encore_started 
	get_progression_globals ($current_progression_flag)
	format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
	SetGlobalTags <gig_name> params = {started = 1 encore_unlocked = 1}
	if IsHost
		SendStructure \{callback = mark_encore_started
			data_to_send = {
				none
			}}
	endif
endscript

script destroy_ui_encore_confirmation 
	KillSpawnedScript \{name = ui_encore_animate_flashbulbs}
	ui_destroy_encore_flashbulbs
	if ScreenElementExists \{id = EncoreInterface}
		EncoreInterface :Die
	endif
endscript

script ui_encore_animate_flashbulbs 
	SpawnScriptLater \{pulsate_helper_pill
		params = {
			id = EncoreInterface
		}}
endscript

script ui_destroy_encore_flashbulbs 
	KillSpawnedScript \{name = pulsate_helper_pill}
endscript
