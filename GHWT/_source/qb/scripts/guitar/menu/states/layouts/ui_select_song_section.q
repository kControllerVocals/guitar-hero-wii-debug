special_event_last_time_stored = 0
special_event_total_expense_time = 0
special_event_hilite_color = [
	220
	20
	20
	255
]
g_sss_highlighted_index = 0
select_song_section_refreshing_menu = 0

script ui_create_select_song_section 
	disable_pause
	UnPauseGame
	change \{select_song_section_refreshing_menu = 0}
	if NOT ($game_mode = training)
		if GotParam \{from_in_game}
			change \{practice_enabled = 1}
			change came_to_practice_from = ($game_mode)
			change \{game_mode = training}
			startrendering
		else
			change \{came_to_practice_from = main_menu}
		endif
	endif
	change \{current_num_players = 1}
	GameMode_UpdateNumPlayers \{num_players = 1}
	load_songqpak song_name = ($current_song) async = 0
	Menu_Music_Off
	change \{current_speedfactor = 1.0}
	if ($special_event_stage != 0)
		GetSpecialEventTimer
		change special_event_last_time_stored = <time>
		change \{special_event_total_expense_time = 0}
		change \{practice_start_index = -1}
		change \{practice_end_index = -1}
	endif
	CreateScreenElement \{parent = root_window
		type = DescInterface
		id = SongSectionDesc
		desc = 'setlist_b_practice_sessions_desc'}
	focus2_script = ui_select_song_section_preview
	spawnsongpreview = 0
	if ($special_event_stage != 0)
		if ($current_special_event_num = 1 || $current_special_event_num = 2)
			if ($special_event_stage = 1 || $special_event_stage = 3)
				<focus2_script> = nullscript
				SongSectionDesc :SE_SetProps \{message_text = qs("PLAY ENTIRE SONG")}
				spawnsongpreview = 1
			endif
		endif
	endif
	if SongSectionDesc :Desc_ResolveAlias \{name = alias_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SE_SetProps {
			allow_wrap = false
			exclusive_device = ($primary_controller)
			event_handlers = [
				{pad_up ui_select_song_section_play_sound params = {up}}
				{pad_down ui_select_song_section_play_sound params = {down}}
				{pad_back ui_select_song_section_back}
			]
			tags = {
				start_index = -1
				end_index = -1
			}
		}
		CreateScreenElement {
			parent = current_menu
			type = DescInterface
			desc = 'setlist_b_practice_sessions_item_desc'
			autoSizeDims = false
			dims = (768.0, 45.0)
			section_text = qs("Entire Song")
			section_rgba = [64 64 64 255]
			event_handlers = [
				{focus ui_select_song_section_focus_item}
				{focus <focus2_script>}
				{unfocus ui_select_song_section_unfocus_item}
				{pad_choose ui_select_song_section_choose_item}
			]
			tags = {playfullsong index = 0 strikeout_alpha = 0 default_rgba = $default_section_rgba}
		}
		if (<spawnsongpreview> = 1)
			<id> :obj_spawnscript ui_select_song_section_preview
		endif
		get_song_section_array
		GetMarkerArraySize array = <song_section_array>
		marker_array_size = <array_size>
		GetPlayerInfo \{1
			part}
		FormatText \{checksumname = event_num
			'special_event%d'
			d = $current_special_event_num}
		FormatText \{checksumname = challenge_num
			'challenge%d'
			d = $current_special_event_challenge_num}
		FormatText checksumname = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
		if (<marker_array_size> > 0)
			i = 1
			begin
			GetRandomValue \{a = 1
				b = 2
				name = rand_int
				Integer}
			FormatText checksumname = strikeout_texture 'strike_0%d' d = <rand_int>
			strikeout_alpha = 0
			if ($special_event_stage != 0)
				strikeout_alpha = 1
				GetArraySize ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
				special_index = 0
				begin
				section = ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [<special_index>])
				if (<section> = (<i> -1))
					if NOT check_current_special_event_percentages section_to_check = <section> dont_count_unplayed_sections
						strikeout_alpha = 0
					endif
					break
				endif
				<special_index> = (<special_index> + 1)
				repeat <array_size>
			endif
			ShortenUIString {
				ui_string = (($<song_section_array> [(<i> - 1)]).marker)
				max_len = 50
			}
			<section_rgba> = $default_section_rgba
			if (<part> = Vocals)
				if LocalizedStringEquals a = <short_ui_string> b = $vocal_marker_freeform
					<section_rgba> = $vocal_marker_freeform_rgba
				endif
			endif
			CreateScreenElement {
				parent = current_menu
				type = DescInterface
				desc = 'setlist_b_practice_sessions_item_desc'
				autoSizeDims = false
				dims = (768.0, 45.0)
				section_text = <short_ui_string>
				section_rgba = <section_rgba>
				event_handlers = [
					{focus ui_select_song_section_focus_item}
					{focus <focus2_script>}
					{unfocus ui_select_song_section_unfocus_item}
					{pad_choose ui_select_song_section_choose_item}
				]
				strikeout_texture = <strikeout_texture>
				strikeout_alpha = <strikeout_alpha>
				tags = {
					index = <i>
					strikeout_texture = <strikeout_texture>
					strikeout_alpha = <strikeout_alpha>
					default_rgba = <section_rgba>
				}
			}
			i = (<i> + 1)
			repeat <marker_array_size>
		endif
	endif
	if GotParam \{selected_index}
		GetScreenElementChildren \{id = current_menu}
		GetArraySize <children>
		ratio = (<selected_index> / (<marker_array_size> - 1.0))
		scroll_pos = ((358.0, -194.0) + ((0.0, 184.0) * <ratio>))
		SongSectionDesc :SE_SetProps scroll_thumb_pos = <scroll_pos> time = <time>
	endif
	ui_select_song_section_preview \{index = 0
		nowait}
	menu_finish
	current_menu :SetTags \{lead_in = 0}
	current_menu :SetTags \{lead_out = 0}
endscript

script ui_select_song_section_play_sound 
	get_song_section_array
	GetMarkerArraySize array = <song_section_array>
	if GotParam \{up}
		change g_sss_highlighted_index = ($g_sss_highlighted_index - 1)
		if ($g_sss_highlighted_index < 0)
			change \{g_sss_highlighted_index = 0}
		else
			generic_menu_up_or_down_sound \{up}
		endif
	else
		change g_sss_highlighted_index = ($g_sss_highlighted_index + 1)
		if ($g_sss_highlighted_index > (<array_size> - 1))
			change g_sss_highlighted_index = ($g_sss_highlighted_index - 1)
		else
			generic_menu_up_or_down_sound \{down}
		endif
	endif
endscript

script ui_destroy_select_song_section 
	KillSpawnedScript \{name = practice_songpreview_monitor}
	KillSpawnedScript \{name = practice_songpreview_fadeinandrepeat}
	if ($select_song_section_refreshing_menu = 0)
		end_song
		change \{practice_song_preview_loaded = 0}
	endif
	DestroyScreenElement \{id = SongSectionDesc}
	SetSoundBussParams {LeadVox_Balance = {vol = ($Default_BussSet.LeadVox_Balance.vol)}}
	SetSoundBussParams {Drums_Balance = {vol = ($Default_BussSet.Drums_Balance.vol)}}
	SetSoundBussParams {leadGTR_balance = {vol = ($Default_BussSet.leadGTR_balance.vol)}}
	SetSoundBussParams {bass_balance = {vol = ($Default_BussSet.bass_balance.vol)}}
	SetSoundBussParams {RhythmGTR_Balance = {vol = ($Default_BussSet.RhythmGTR_Balance.vol)}}
	SetSoundBussParams {Crowd_Balance = {vol = ($Default_BussSet.Crowd_Balance.vol)}}
	SetSoundBussParams {CrowdSingalong_Balance = {vol = ($Default_BussSet.CrowdSingalong_Balance.vol)}}
	SetSoundBussParams {Band_Balance = {vol = ($Default_BussSet.Band_Balance.vol)}}
	clean_up_user_control_helpers
endscript

script ui_deinit_select_song_section 
	hide_glitch \{num_frames = 20}
	spawnscriptnow \{end_practice_song}
	unload_songqpak
endscript

script ui_select_song_section_focus_item \{time = 0.1}
	current_menu :GetTags
	GetTags
	my_strikeout_texture = <strikeout_texture>
	my_strikeout_alpha = <strikeout_alpha>
	highlight_alpha = 1.0
	strikeout_alpha = 0
	if ($special_event_stage != 0)
		if ($current_special_event_num = 1 || $current_special_event_num = 2)
			if ($special_event_stage = 1 || $special_event_stage = 3)
				highlight_alpha = 0.0
			endif
		endif
	endif
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	children_array_size = <array_size>
	if NOT (<start_index> = -1)
		i = <start_index>
		begin
		if ResolveScreenElementId id = {current_menu child = <i>}
			<resolved_id> :GetSingleTag strikeout_texture
			<resolved_id> :GetSingleTag strikeout_alpha
			<resolved_id> :GetSingleTag default_rgba
			if ((<i> >= <start_index>) && (<i> <= <index>))
				printf \{qs("\Lhighlight")}
				if (<i> = <start_index>)
					<resolved_id> :SE_SetProps {
						section_rgba = $default_section_focus_rgba
						highlight_rgba = [255 , 255 , 255 , 220]
						highlight_alpha = <highlight_alpha>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
					}
				elseif NOT (<i> = <index>)
					printstruct {} i = <i> start_index = <start_index> index = <index> highlight_alpha = <highlight_alpha>
					<resolved_id> :SE_SetProps {
						section_rgba = $default_section_focus_rgba
						highlight_rgba = [255 255 255 160]
						highlight_alpha = <highlight_alpha>
						strikeout_texture = <strikeout_texture>
						strikeout_alpha = <strikeout_alpha>
					}
				endif
			else
				<resolved_id> :SE_SetProps {
					section_rgba = <default_rgba>
					highlight_rgba = [255 255 255 220]
					highlight_alpha = 0.0
					strikeout_texture = <strikeout_texture>
					strikeout_alpha = <strikeout_alpha>
				}
			endif
		endif
		i = (<i> + 1)
		repeat <children_array_size>
	endif
	if (<children_array_size> > 1.0)
		ratio = (<index> / (<children_array_size> - 1.0))
	else
		ratio = 0
	endif
	scroll_pos = ((358.0, -194.0) + ((0.0, 184.0) * <ratio>))
	SongSectionDesc :SE_SetProps scroll_thumb_pos = <scroll_pos> time = <time>
	SE_SetProps {
		section_rgba = $default_section_focus_rgba
		highlight_rgba = [255 , 255 , 255 , 220]
		highlight_alpha = <highlight_alpha>
		strikeout_texture = <my_strikeout_texture>
		strikeout_alpha = <my_strikeout_alpha>
		time = 0.1
	}
endscript

script ui_select_song_section_unfocus_item 
	GetSingleTag \{default_rgba}
	SE_SetProps section_rgba = <default_rgba> highlight_alpha = 0.0 time = 0.1
endscript

script ui_select_song_section_choose_item 
	current_menu :GetTags
	GetTags
	if ($current_special_event_num = 1 || $current_special_event_num = 2)
		if ($special_event_stage = 1 || $special_event_stage = 3)
			get_song_end_time \{song = $current_song}
			CastToInteger \{total_end_time}
			change special_event_total_expense_time = <total_end_time>
			setup_special_event
			get_song_section_array
			GetArraySize $<song_section_array>
			current_menu :SetTags \{start_index = 0}
			current_menu :SetTags end_index = <array_size>
			current_menu :SetTags \{lead_in = 0}
			current_menu :SetTags \{lead_out = 0}
			params = {state = uistate_play_song}
			if GotParam \{playfullsong}
				params = {playfullsong state = uistate_play_song}
			endif
			current_menu :obj_spawnscript ui_select_song_section_set_times params = {<params>}
			return
		endif
	endif
	if GotParam \{playfullsong}
		current_menu :SetTags \{start_index = 0}
		current_menu :SetTags \{lead_in = 0}
		current_menu :SetTags \{lead_out = 0}
		params = {playfullsong}
		if ($special_event_stage != 0)
			params = {playfullsong state = uistate_play_song}
		endif
		current_menu :obj_spawnscript ui_select_song_section_set_times params = {<params>}
		return
	endif
	if (<start_index> = -1)
		generic_menu_up_or_down_sound
		current_menu :SetTags start_index = <index>
		if ($special_event_stage = 0)
			change practice_start_index = <index>
			current_menu :SetTags start_index = <index>
		endif
	else
		current_menu :SetTags start_index = (<start_index> - 1)
		current_menu :SetTags end_index = <index>
		if ($special_event_stage = 0)
			current_menu :obj_spawnscript \{ui_select_song_section_set_times}
		else
			setup_special_event
			current_menu :obj_spawnscript \{ui_select_song_section_set_times
				params = {
					state = uistate_play_song
				}}
		endif
	endif
	SongSectionDesc :SE_SetProps \{message_text = qs("SELECT END SECTION")}
	GetScreenElementChildren \{id = current_menu}
	GetArraySize <children>
	i = 0
	begin
	if (<i> >= <index>)
		break
	endif
	curr_item = (<children> [<i>])
	<curr_item> :SE_SetProps not_focusable
	i = (<i> + 1)
	repeat <array_size>
endscript

script ui_select_song_section_back 
	current_menu :GetTags
	wait_for_SetSeekPosition_Song_to_finish
	if ($special_event_stage != 0)
		if ($current_special_event_num = 2)
			generic_event_back \{state = UIstate_special_events}
			return
		endif
	endif
	if (<start_index> = -1)
		if ($came_to_practice_from != main_menu)
			change \{practice_enabled = 0}
			change game_mode = ($came_to_practice_from)
			change \{current_num_players = 1}
			GameMode_UpdateNumPlayers \{num_players = 1}
			unload_songqpak
			destroy_band
			generic_menu_pad_back_sound
			if ($came_to_practice_from = p1_career)
				create_loading_screen \{destroy_state = 'gig_posters'}
				ui_event \{event = menu_back
					state = UIstate_singleplayer_character_hub
					data = {
						pass_to_gigboard = true
					}}
			else
				ui_event_wait_for_safe
				spawnscriptnow \{return_to_quickplay_from_practice}
			endif
		else
			generic_event_back
		endif
	else
		generic_menu_up_or_down_sound
		change \{special_event_total_expense_time = 0}
		change \{practice_start_index = -1}
		change \{practice_end_index = -1}
		refresh_practice_special_event_timer
		change \{select_song_section_refreshing_menu = 1}
		generic_event_refresh
	endif
endscript

script return_to_quickplay_from_practice 
	create_loading_screen
	ui_event_block \{event = menu_back
		data = {
			state = uistate_gameplay
		}}
	if ui_event_exists_in_stack \{name = 'practice_warning'}
		ui_event_block \{event = menu_back
			data = {
				state = uistate_practice_warning
			}}
		ui_event_block \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
	endif
	generic_event_replace state = uistate_play_song no_sound data = {selected_level = ($practice_return_venue) can_change_level = 0}
endscript

script ui_select_song_section_set_times \{state = uistate_practice_select_speed}
	SE_SetProps \{block_events}
	GetTags
	get_song_section_array
	GetMarkerArraySize array = <song_section_array>
	if (<array_size> > 0)
		change practice_start_time = (($<song_section_array> [<start_index>]).time)
		change practice_start_index = <start_index>
		if ((GotParam playfullsong) || (<end_index> >= <array_size>))
			setup_gemarrays song_name = ($current_song) difficulty = ($player1_status.difficulty) player_status = player1_status
			get_song_end_time song = ($current_song) for_practice = 1
			change practice_end_time = <total_end_time>
			change practice_end_index = <array_size>
		else
			change practice_end_time = (($<song_section_array> [<end_index>]).time - 1)
			change practice_end_index = <end_index>
		endif
		if GotParam \{playfullsong}
			if ($special_event_stage != 0)
				GetPlayerInfo \{1
					part}
				FormatText \{checksumname = event_num
					'special_event%d'
					d = $current_special_event_num}
				FormatText \{checksumname = challenge_num
					'challenge%d'
					d = $current_special_event_challenge_num}
				FormatText checksumname = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
				set_gray_active_markers indices = ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
				set_alpha_out_markers indices = ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
			else
				ResetNonGrayMarkers
			endif
		else
			if ($special_event_stage != 0)
				GetPlayerInfo \{1
					part}
				FormatText \{checksumname = event_num
					'special_event%d'
					d = $current_special_event_num}
				FormatText \{checksumname = challenge_num
					'challenge%d'
					d = $current_special_event_challenge_num}
				FormatText checksumname = songs_ar '%p_songs' p = ($part_list_props.<part>.text_nl)
				ResetNonGrayMarkers
				change \{gray_gems = 1}
				GetArraySize ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
				section_index = 0
				begin
				check_index = ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections [<section_index>])
				if NOT check_current_special_event_percentages section_to_check = <check_index>
					set_gray_active_markers index = <check_index>
				endif
				<section_index> = (<section_index> + 1)
				repeat <array_size>
				set_alpha_out_markers indices = ($Special_Events_Challenges.<event_num>.<challenge_num>.<songs_ar> [$special_event_song_index].sections)
			else
				ResetNonGrayMarkers
			endif
		endif
		change practice_start_time = ($practice_start_time - <lead_in>)
		change practice_end_time = ($practice_end_time + <lead_out>)
	else
		change \{practice_start_time = 0}
		change \{practice_end_time = 0}
		change \{practice_start_index = 0}
		change \{practice_end_index = 0}
	endif
	GetPlayerInfo \{1
		part}
	if (<part> = Vocals)
		<state> = uistate_play_song
	endif
	wait_for_SetSeekPosition_Song_to_finish
	generic_event_choose state = <state>
endscript

script ui_select_song_section_preview 
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	if NOT GotParam \{nowait}
		Wait \{0.5
			seconds}
	endif
	if IsObjectScript
		GetTags
	endif
	get_song_section_array
	GetMarkerArraySize array = <song_section_array>
	if (<array_size> > 0)
		if (<index> > 0)
			<index> = (<index> - 1)
			end_index = (<index> + 1)
			if (<end_index> >= <array_size>)
				RemoveParameter \{end_index}
			endif
		endif
		start_time = (($<song_section_array> [<index>]).time)
		if NOT GotParam \{end_index}
			setup_gemarrays song_name = ($current_song) difficulty = ($player1_status.difficulty) player_status = player1_status
			get_song_end_time song = ($current_song) for_practice = 1
			end_time = <total_end_time>
		else
			end_time = (($<song_section_array> [<end_index>]).time + 750)
		endif
		change target_practice_songpreview = ($current_song)
		change target_practice_songpreview_starttime = <start_time>
		change target_practice_songpreview_endtime = <end_time>
	endif
	if NOT IsObjectScript
		change \{force_practice_songpreview_restart = 1}
		current_menu :obj_spawnscript \{practice_songpreview_monitor}
	endif
endscript
practice_start_index = 0
practice_end_index = 0
target_practice_songpreview = none
target_practice_songpreview_starttime = 0
target_practice_songpreview_endtime = 0
force_practice_songpreview_restart = 0
practice_songpreview_changing = 0
current_practice_songpreview = none
current_practice_songpreview_starttime = 0
current_practice_songpreview_endtime = 0
ui_select_song_section_need_to_destroy_loading_screen = 0

script GetMarkerArraySize 
	if GlobalExists name = <array> type = array
		GetArraySize $<array>
		if (<array_size> > 0)
			if ($<array> [(<array_size> - 1)].marker = qs("\L_ENDOFSONG"))
				return array_size = (<array_size> - 1)
			else
				return array_size = <array_size>
			endif
		else
			return array_size = <array_size>
		endif
	else
		return \{array_size = 0}
	endif
endscript
in_destroy_choose_practice_section_menu = 0
practice_song_preview_loaded = 0

script practice_songpreview_monitor 
	printf \{qs(0xc37c2fcf)}
	<playing_song> = 0
	begin
	skip_wait = 0
	if NOT ($current_practice_songpreview = $target_practice_songpreview &&
			$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
			$force_practice_songpreview_restart = 0)
		song = ($target_practice_songpreview)
		StartTime = ($target_practice_songpreview_starttime)
		endtime = ($target_practice_songpreview_endtime)
		printf qs(0x622913c4) a = <playing_song>
		printf qs(0x79028756) a = <song>
		printf qs(0x1ffa4a5a) a = <StartTime>
		printf qs(0x6cb06dff) a = <endtime>
		KillSpawnedScript \{name = practice_songpreview_fadeinandrepeat}
		if (<playing_song> = 1)
			printf \{qs(0x1855b5fb)}
			SetSoundBussParams {LeadVox_Balance = {vol = (($Default_BussSet.LeadVox_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {Drums_Balance = {vol = (($Default_BussSet.Drums_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {leadGTR_balance = {vol = (($Default_BussSet.leadGTR_balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {bass_balance = {vol = (($Default_BussSet.bass_balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {RhythmGTR_Balance = {vol = (($Default_BussSet.RhythmGTR_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {Crowd_Balance = {vol = (($Default_BussSet.Crowd_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {CrowdSingalong_Balance = {vol = (($Default_BussSet.CrowdSingalong_Balance.vol) - 100)} time = 0.5}
			SetSoundBussParams {Band_Balance = {vol = (($Default_BussSet.Band_Balance.vol) - 100)} time = 0.5}
			Wait \{0.5
				second}
		endif
		change \{practice_songpreview_changing = 1}
		if ($practice_song_preview_loaded = 1)
			if NOT (<song> = $current_practice_songpreview)
				printf \{qs(0x95e5f543)}
				end_song
				<playing_song> = 0
				change \{practice_song_preview_loaded = 0}
			endif
		endif
		if ($shutdown_game_for_signin_change_flag = 0)
			if ($practice_song_preview_loaded = 0)
				printf \{qs(0x0a6f7afb)}
				preload_song song_name = <song> StartTime = <StartTime> fadeintime = 1.0 songseekable = true
				change \{practice_song_preview_loaded = 1}
				change \{ui_select_song_section_need_to_destroy_loading_screen = 1}
			endif
			change current_practice_songpreview = <song>
			change \{force_practice_songpreview_restart = 0}
			change current_practice_songpreview_starttime = <StartTime>
			change current_practice_songpreview_endtime = <endtime>
			change \{practice_songpreview_changing = 0}
			if ($current_practice_songpreview = $target_practice_songpreview &&
					$current_practice_songpreview_starttime = $target_practice_songpreview_starttime &&
					$force_practice_songpreview_restart = 0)
				if ($ui_select_song_section_need_to_destroy_loading_screen = 1)
					destroy_loading_screen
					change \{ui_select_song_section_need_to_destroy_loading_screen = 0}
				endif
				if ($practice_song_preview_loaded = 1 && <playing_song> = 1)
					printf \{qs(0xcbd65872)}
					spawnscriptnow SetSeekPosition_Song params = {position = <StartTime>}
					wait_for_SetSeekPosition_Song_to_finish
				elseif ($practice_song_preview_loaded = 1 && <playing_song> = 0)
					printf \{qs(0x442fe4dc)}
					begin_song
					<playing_song> = 1
				endif
				SetSoundBussParams {LeadVox_Balance = {vol = (($Default_BussSet.LeadVox_Balance.vol) - 7)} time = 0.5}
				SetSoundBussParams {Drums_Balance = {vol = (($Default_BussSet.Drums_Balance.vol) - 7)} time = 0.5}
				SetSoundBussParams {leadGTR_balance = {vol = (($Default_BussSet.leadGTR_balance.vol) - 7)} time = 0.5}
				SetSoundBussParams {bass_balance = {vol = (($Default_BussSet.bass_balance.vol) - 7)} time = 0.5}
				SetSoundBussParams {RhythmGTR_Balance = {vol = (($Default_BussSet.RhythmGTR_Balance.vol) - 7)} time = 0.5}
				SetSoundBussParams {Crowd_Balance = {vol = (($Default_BussSet.Crowd_Balance.vol) - 100)} time = 0.5}
				SetSoundBussParams {CrowdSingalong_Balance = {vol = (($Default_BussSet.CrowdSingalong_Balance.vol) - 100)} time = 0.5}
				SetSoundBussParams {Band_Balance = {vol = (($Default_BussSet.Band_Balance.vol) - 7)} time = 0.5}
				if IsObjectScript
					obj_spawnscript \{practice_songpreview_fadeinandrepeat}
				else
					spawnscriptnow \{practice_songpreview_fadeinandrepeat}
				endif
			else
				printf \{qs(0x56eb5234)}
				skip_wait = 1
			endif
		endif
	endif
	if (<skip_wait> = 0)
		Wait \{1
			gameframe}
	endif
	repeat
endscript

script practice_songpreview_fadeinandrepeat 
	wait_time = 0
	begin
	current_wait_time = (($target_practice_songpreview_endtime - $target_practice_songpreview_starttime) / 1000.0)
	if (<wait_time> > <current_wait_time>)
		break
	endif
	Wait \{0.5
		seconds}
	wait_time = (<wait_time> + 0.5)
	repeat
	change \{force_practice_songpreview_restart = 1}
endscript

script refresh_practice_special_event_timer 
	if ($special_event_stage != 0)
		if ($practice_start_index != -1 && $practice_end_index != -1)
			get_song_section_array
			GetArraySize $<song_section_array>
			get_song_end_time \{song = $current_song}
			if ($practice_end_index < <array_size>)
				end_time = ($<song_section_array> [$practice_end_index].time)
			else
				end_time = <total_end_time>
			endif
			start_time = ($<song_section_array> [$practice_start_index].time)
			diff_time = (<end_time> - <start_time>)
			change special_event_total_expense_time = <diff_time>
		endif
		expense_time = ($special_event_total_expense_time / 1000)
		<expense_time> = ($special_event_last_time_stored - <expense_time>)
		if (<expense_time> < 0)
			<expense_time> = 0
		endif
		if ScreenElementExists \{id = header_time}
			format_time_from_seconds time = <expense_time>
			time_text = (qs("Time Remaining: ") + <time_formatted>)
			SetScreenElementProps id = header_time text = <time_text>
			GetScreenElementDims \{id = header_time}
			SetScreenElementProps id = time_remaining_bg dims = (<width> * (1.0, 0.0) + (15.0, 55.0))
		endif
	endif
endscript

script wait_for_SetSeekPosition_Song_to_finish 
	begin
	if NOT ScriptIsRunning \{SetSeekPosition_Song}
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript
