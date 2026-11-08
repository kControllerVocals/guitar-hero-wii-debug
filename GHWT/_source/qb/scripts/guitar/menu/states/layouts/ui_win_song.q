
script ui_init_win_song 
	spawnscriptnow \{kill_gem_scroller}
endscript

script ui_create_win_song 
	set_focus_color
	set_unfocus_color
	CreateScreenElement \{parent = root_window
		id = MyInterfaceElement
		type = DescInterface
		desc = 'win_song'}
	MyInterfaceElement :Desc_CheckVersion \{desired = 3
		AssertIf = Mismatch}
	MyInterfaceElement :SE_GetProps
	my_song = ($current_song)
	if NOT ($old_song = none)
		my_song = ($old_song)
		change \{old_song = none}
	endif
	get_song_title song = <my_song>
	get_song_artist song = <my_song>
	get_difficulty_text difficulty = ($player1_status.difficulty)
	score = ($player1_status.score)
	CastToInteger \{score}
	FormatText TextName = score_text qs("\L%s") s = <score> DecimalPlaces = 0 usecommas
	MyInterfaceElement :SetProps {
		song_name_text = <song_title>
		band_name_text = <song_artist>
		difficulty_text = <difficulty_text>
		score_text = <score_text>
	}
	if ($game_mode = p1_quickplay)
		menu_top_rockers_check_for_new_top_score \{nowrite = 1}
	endif
	stars = ($player1_status.stars)
	if (<stars> < 3)
		stars = 3
	endif
	ResolveScreenElementId \{id = {
			MyInterfaceElement
			child = {
				win_container
				child = star_container
			}
		}}
	DestroyScreenElement id = <resolved_id> preserve_parent
	i = 0
	begin
	rgba2 = [200 200 200 255]
	rgba = [0 0 0 255]
	if (<i> >= <stars>)
		rgba2 = [64 64 64 255]
		rgba = [32 32 32 255]
	endif
	CreateScreenElement {
		type = ContainerElement
		parent = <resolved_id>
		dims = (50.0, 50.0)
		just = [center center]
		child_anchor = [center center]
	}
	container = <id>
	rot_angle = RandomInteger (0.0, 360.0)
	CreateScreenElement {
		type = SpriteElement
		parent = <container>
		texture = song_summary_score_star
		rot_angle = <rot_angle>
		rgba = <rgba>
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <container>
		texture = song_summary_score_star
		rot_angle = <rot_angle>
		scale = 2.0
		rgba = <rgba2>
	}
	i = (<i> + 1)
	repeat 5
	i = 0
	p = 1
	begin
	ResolveScreenElementId id = {MyInterfaceElement child = {win_container child = {note_streak_container child = <i>}}}
	if (<i> >= ($current_num_players))
		<resolved_id> :Die
	else
		FormatText checksumname = status 'player%a_status' a = <p>
		max_notes = ($<status>.max_notes)
		if (<max_notes> = 0)
			max_notes = 1.0
		endif
		FormatText TextName = streak_text qs("\L%s") s = ($<status>.best_run)
		FormatText TextName = percent_text qs("%p\%") p = ((($<status>.notes_hit) / (<max_notes> * 1.0)) * 100.0) DecimalPlaces = 0
		switch ($<status>.part)
			case guitar
			instrument_text = qs("Guitar")
			case Bass
			instrument_text = qs("Bass")
			case drum
			instrument_text = qs("Drums")
			case Vocals
			instrument_text = qs("Vocals")
		endswitch
		SetScreenElementProps id = {<resolved_id> child = 0} text = <instrument_text>
		SetScreenElementProps id = {<resolved_id> child = 1} text = <streak_text>
		SetScreenElementProps id = {<resolved_id> child = 2} text = <percent_text>
		i = (<i> + 1)
	endif
	p = (<p> + 1)
	repeat 4
	ResolveScreenElementId \{id = {
			MyInterfaceElement
			child = {
				win_container
				child = menu
			}
		}}
	continue_script = ui_win_song_career_continue
	GameMode_GetType
	if ((GotParam for_practice) || <type> = quickplay)
		<continue_script> = ui_win_song_continue
	endif
	if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
		<continue_script> = ui_win_song_continue
	endif
	if ($special_event_stage != 0)
		if ($current_special_event_num = 2)
			<continue_script> = ui_win_song_continue
		endif
	endif
	CreateScreenElement {
		parent = <resolved_id>
		type = TextElement
		font = fontgrid_text_a8
		text = qs("continue")
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose <continue_script>}
		]
	}
	if (($is_network_game = 1) && ($net_new_matchmaking_ui_flag = 0))
		if NOT (IsHost)
			<id> :SE_SetProps not_focusable
		endif
	endif
	CreateScreenElement {
		parent = <resolved_id>
		type = TextElement
		font = fontgrid_text_a8
		text = qs("detailed stats")
		rgba = ($menu_unfocus_color)
		event_handlers = [
			{focus retail_menu_focus}
			{unfocus retail_menu_unfocus}
			{pad_choose generic_event_choose params = {state = uistate_detailed_stats}}
		]
	}
	if ($is_network_game = 1)
		<id> :SE_SetProps not_focusable
	endif
	if GotParam \{for_practice}
		CreateScreenElement {
			parent = <resolved_id>
			type = TextElement
			font = fontgrid_text_a8
			text = qs("replay song")
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose practice_restart_song}
			]
		}
		CreateScreenElement {
			parent = <resolved_id>
			type = TextElement
			font = fontgrid_text_a8
			text = qs("select speed")
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose generic_event_back params = {state = uistate_practice_select_speed}}
			]
		}
		CreateScreenElement {
			parent = <resolved_id>
			type = TextElement
			font = fontgrid_text_a8
			text = qs("select section")
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose generic_event_back params = {state = uistate_select_song_section}}
			]
		}
	else
		CreateScreenElement {
			parent = <resolved_id>
			type = TextElement
			font = fontgrid_text_a8
			text = qs("replay song")
			rgba = ($menu_unfocus_color)
			event_handlers = [
				{focus retail_menu_focus}
				{unfocus retail_menu_unfocus}
				{pad_choose restart_warning_select_restart}
			]
		}
		if ($is_network_game = 1)
			<id> :SE_SetProps not_focusable
		endif
	endif
	AssignAlias id = <resolved_id> alias = current_menu
	current_menu :obj_spawnscript \{menu_music_on}
	if ((($is_network_game = 1) && IsHost) || ($is_network_game = 0))
		add_user_control_helper \{text = qs("SELECT")
			button = green
			z = 100000}
	endif
endscript

script ui_destroy_win_song 
	if ScreenElementExists \{id = MyInterfaceElement}
		MyInterfaceElement :Die
	endif
	clean_up_user_control_helpers
endscript

script ui_create_win_song_spawn 
	Wait \{1
		seconds}
	create_newspaper_menu <...>
	LaunchEvent \{target = current_menu
		type = focus}
endscript

script ui_win_song_continue 
	spawnscriptnow ui_win_song_continue_spawned params = <...>
endscript

script ui_win_song_continue_spawned 
	if ($is_network_game)
		print \{qs(0x7f705883)}
		quit_network_game
		generic_event_back \{state = uistate_online}
		return
	endif
	if NOT CD
		ui_event_get_stack
		i = 0
		begin
		if ((<stack> [<i>].base_name) = 'debug')
			generic_event_back state = uistate_debug player = <player>
			return
		endif
		i = (<i> + 1)
		repeat <stack_size>
	endif
	if ($special_event_stage != 0)
		if ($current_special_event_num = 1)
			get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
			format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
			GetPlayerInfo \{1
				part}
			FormatText \{checksumname = specialevent
				'special_event%d'
				d = $current_special_event_num}
			FormatText \{checksumname = challenge
				'challenge%d'
				d = $current_special_event_challenge_num}
			FormatText checksumname = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
			if ($special_event_stage = 3)
				change special_event_song_index = ($special_event_song_index + 1)
				GetArraySize ($Special_Events_Challenges.<specialevent>.<challenge>.<songs_ar>)
				reset_score \{player_status = player1_status}
				reset_current_special_event_percentages
				if ($special_event_song_index < <array_size>)
					change \{special_event_stage = 1}
					change current_song = ($Special_Events_Challenges.<specialevent>.<challenge>.<songs_ar> [$special_event_song_index].song)
					destroy_band
					unload_songqpak
					load_songqpak song_name = ($current_song) async = 0
					set_song_section_array \{player = 1}
					generic_event_back \{state = uistate_select_song_section}
				else
					if ($current_special_event_challenge_num = 1)
						SetGlobalTags <gig_name> params = {challenge1_completed = 1}
					elseif ($current_special_event_challenge_num = 2)
						SetGlobalTags <gig_name> params = {challenge2_completed = 1}
					elseif ($current_special_event_challenge_num = 3)
						SetGlobalTags <gig_name> params = {challenge3_completed = 1}
					endif
					ui_memcard_autosave \{state = uistate_gig_posters
						data = {
							all_active_players = true
						}}
				endif
			else
				generic_event_back \{state = uistate_select_song_section}
			endif
			GetGlobalTags <gig_name>
			if (<challenge2_completed> = 1 && <challenge3_completed> = 1)
				SetGlobalTags <gig_name> params = {completed = 2}
			else
				SetGlobalTags <gig_name> params = {completed = 3}
			endif
			change game_mode = ($special_event_previous_game_mode)
			return
		elseif ($current_special_event_num = 2)
			get_progression_globals game_mode = ($game_mode) ($current_progression_flag)
			format_globaltag_gigname setlist_prefix = ($<tier_global>.prefix) gignum = ($current_gig_number)
			if ($special_event_stage >= 2)
				if ($current_special_event = se2c1_tribute)
					SetGlobalTags <gig_name> params = {challenge1_completed = 1}
				elseif ($current_special_event = se2c2_tribute)
					SetGlobalTags <gig_name> params = {challenge2_completed = 1}
				elseif ($current_special_event = se2c3_tribute)
					SetGlobalTags <gig_name> params = {challenge3_completed = 1}
				endif
				ui_memcard_autosave \{state = uistate_gig_posters
					data = {
						all_active_players = true
					}}
				reset_score \{player_status = player1_status}
				reset_current_special_event_percentages
			else
				generic_event_back \{state = uistate_select_song_section}
			endif
			GetGlobalTags <gig_name>
			if (<challenge2_completed> = 1 && <challenge3_completed> = 1)
				SetGlobalTags <gig_name> params = {completed = 2}
			else
				SetGlobalTags <gig_name> params = {completed = 3}
			endif
			change game_mode = ($special_event_previous_game_mode)
			return
		endif
	endif
	if Progression_AnyPlayerWonCash
		generic_event_choose \{state = uistate_cash_reward}
	else
		ui_win_song_continue_next_menu
	endif
endscript

script ui_win_song_continue_next_menu 
	switch ($game_mode)
		case p1_quickplay
		case p2_quickplay
		case p3_quickplay
		case p4_quickplay
		if ($current_song = jamsession)
			jam_ratesong_check_for_rating
		else
			if NOT GotParam \{no_sound}
				generic_menu_pad_choose_sound
			endif
			ui_memcard_autosave \{state = uistate_setlist}
		endif
		case p1_career
		case p2_career
		case p3_career
		case p4_career
		ui_win_song_career_continue
		case p2_faceoff
		case p2_pro_faceoff
		case p2_coop
		case p2_battle
		generic_event_back \{state = uistate_setlist
			data = {
				no_jamsession
			}}
		case training
		generic_event_back \{state = uistate_select_song_section}
	endswitch
endscript

script ui_win_song_career_continue 
	spawnscriptnow \{ui_win_song_career_continue_spawned}
endscript

script ui_win_song_career_continue_spawned 
	printf \{qs("\L***************** ui_win_song_career_continue_spawned *****************")}
	unlock_guitar = ($progression_unlocked_guitar)
	unlock_guitar2 = ($progression_unlocked_guitar2)
	sponsored = ($progression_got_sponsored_last_song)
	if NOT CD
		if ($is_in_debug = 1)
			generic_event_back \{state = uistate_debug}
			return
		endif
	endif
	if ($is_network_game)
		GameMode_GetType
		if (<type> = career)
			if progression_set_new_song_in_gig_list
				change \{gameplay_restart_song = 1}
				SendStructure \{callback = net_career_next_song
					data_to_send = {
						none
					}}
				GetGlobalTags \{user_options}
				if (<autosave> = 1)
					ui_memcard_autosave \{event = menu_back
						state = uistate_gameplay
						data = {
							all_active_players = true
						}}
				endif
				change \{net_ready_to_start = 0}
				($default_loading_screen.create)
				load_and_sync_timing
			else
				SendStructure \{callback = net_career_goto_band_lobby
					data_to_send = {
						none
					}}
				net_career_goto_band_lobby
			endif
		else
			printf \{qs("\Lwe're playing normal online")}
			quit_network_game
			change \{net_new_matchmaking_ui_flag = 0}
			generic_event_back \{state = uistate_online}
			return
		endif
	elseif NOT (<unlock_guitar2> = -1)
		generic_event_choose \{data = {
				state = uistate_unlock
				num_guitars_unlocked = 2
			}}
	elseif NOT (<unlock_guitar> = -1)
		generic_event_choose \{data = {
				state = uistate_unlock
				num_guitars_unlocked = 1
			}}
	elseif (<sponsored>)
		generic_event_choose \{state = uistate_sponsored}
	elseif Progression_AnyPlayerWonCash
		generic_event_choose \{state = uistate_cash_reward}
	else
		GetGlobalTags \{user_options}
		if (<autosave> = 1)
			if NOT ($current_gig_number = 0)
				if progression_set_new_song_in_gig_list
					change \{gameplay_restart_song = 1}
					ui_memcard_autosave \{event = menu_back
						state = uistate_gameplay
						data = {
							all_active_players = true
						}}
				else
					if ($end_credits = 1)
						ui_memcard_autosave \{event = menu_change
							state = uistate_end_credits
							data = {
								all_active_players = true
							}}
					else
						ui_memcard_autosave \{event = menu_back
							state = uistate_gig_posters
							data = {
								all_active_players = true
							}}
					endif
				endif
			else
				ui_memcard_autosave \{event = menu_back
					state = uistate_setlist
					data = {
						all_active_players = true
					}}
			endif
		else
			if NOT ($current_gig_number = 0)
				if progression_set_new_song_in_gig_list
					change \{gameplay_restart_song = 1}
					generic_event_back \{state = uistate_gameplay}
				else
					if ($end_credits = 1)
						generic_event_choose \{state = uistate_end_credits}
					else
						generic_event_back \{state = uistate_gig_posters}
					endif
				endif
			else
				generic_event_back \{state = uistate_setlist}
			endif
		endif
	endif
endscript

script net_career_next_song 
	printf \{qs("\L************** net_career_next_song ****************")}
	GetGlobalTags \{user_options}
	if progression_set_new_song_in_gig_list
		if (<autosave> = 1)
			ui_memcard_autosave \{event = menu_back
				state = uistate_gameplay
				data = {
					all_active_players = true
				}}
		endif
		change \{gameplay_restart_song = 1}
		change \{net_ready_to_start = 0}
		($default_loading_screen.create)
		load_and_sync_timing
	else
		ScriptAssert
	endif
endscript
