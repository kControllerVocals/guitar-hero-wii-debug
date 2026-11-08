song_summary_details_row_count = 0

script ui_create_song_summary_details \{for_transition = 0}
	change menu_flow_locked = ($menu_flow_locked + 1)
	change \{song_summary_details_row_count = 0}
	GameMode_GetNumPlayersShown
	trim_boss_from_num_players_show
	GameMode_GetType
	song_details_set_mins_and_maxes
	gig_details = ($gig_detailed_stats)
	GetArraySize <gig_details>
	if (<array_size> = 0)
		ScriptAssert \{qs("\LThere are no details in the global gig_detailed_stats")}
	endif
	get_song_title song = ((<gig_details> [0] [0]).song)
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_detailed_id
		type = DescInterface
		desc = 'song_summary_details'
		pos = {(-1200.0, 0.0) relative}
		event_handlers = [
			{pad_back generic_event_back}
		]
		song_title_text = <song_title>
		exclusive_device = <exclusive_device>
	}
	if my_detailed_id :Desc_ResolveAlias \{name = alias_song_summary_details_list
			param = details_list_alias}
	else
		ScriptAssert \{qs("\LProblem resolving alias in detailed stats")}
	endif
	p = 1
	begin
	GetPlayerInfo <p> part
	GetPlayerInfo <p> difficulty
	switch (<part>)
		case guitar
		icon_texture = mixer_icon_guitar
		case Bass
		icon_texture = mixer_icon_bass
		case drum
		icon_texture = mixer_icon_drums
		case Vocals
		icon_texture = mixer_icon_vox
	endswitch
	switch (<difficulty>)
		case easy_rhythm
		diff_texture = icon_difficulty_beginner
		case easy
		diff_texture = icon_difficulty_easy
		case medium
		diff_texture = icon_difficulty_medium
		case hard
		diff_texture = icon_difficulty_hard
		case expert
		diff_texture = icon_difficulty_expert
	endswitch
	FormatText checksumname = alpha_check 'icons_p%d_alpha' d = <p>
	FormatText checksumname = inst_check 'instrument_p%d_texture' d = <p>
	FormatText checksumname = diff_check 'DIFFICULTY_p%d_texture' d = <p>
	my_struct = {}
	AddParam structure_name = my_struct name = <alpha_check> value = 1
	AddParam structure_name = my_struct name = <inst_check> value = <icon_texture>
	AddParam structure_name = my_struct name = <diff_check> value = <diff_texture>
	<details_list_alias> :SE_SetProps <my_struct>
	p = (<p> + 1)
	repeat <num_players_shown>
	song_details_create_scrolling_menu for_transition = <for_transition>
	vocalist = 0
	non_vocalist = 0
	GetArraySize (<gig_details> [0])
	num_songs = <array_size>
	song_indx = 0
	begin
	get_song_title song = ((<gig_details> [0] [<song_indx>]).song)
	CreateScreenElement \{parent = list_menu
		type = DescInterface
		autoSizeDims = true
		desc = 'song_summary_details_song_header'}
	change song_summary_details_row_count = (($song_summary_details_row_count) + 3)
	i = 1
	begin
	GetPlayerInfo <i> part
	GetPlayerInfo <i> difficulty
	if (<part> = Vocals)
		vocalist = <i>
	elseif (<non_vocalist> = 0)
		non_vocalist = <i>
	endif
	player_data = (<gig_details> [(<i> -1)] [<song_indx>])
	if (<part> = Vocals)
		vocal_phrase_max_qual = (<player_data>.vocal_phrase_max_qual)
		vocal_phrase_quality = (<player_data>.vocal_phrase_quality)
		vocal_phrase_pct = 0
		if (<vocal_phrase_max_qual> > 0)
			vocal_phrase_pct = (((<vocal_phrase_quality>) / <vocal_phrase_max_qual>) * 100.0)
			FormatText TextName = notes_hit_entry qs("\L%p/100") p = <vocal_phrase_pct> DecimalPlaces = 0
		else
			<notes_hit_entry> = qs("NA")
		endif
		<sp_entry> = qs("NA")
	else
		if (<type> = battle || <type> = training)
			<sp_entry> = qs("NA")
		else
			FormatText TextName = sp_entry qs("\L%g/%p") g = (<player_data>.sp_phrases_hit) p = (<player_data>.sp_phrases_total)
		endif
		if (<type> = training)
			FormatText TextName = notes_hit_entry qs("\L%g/%p") g = (<player_data>.notes_hit) p = (<player_data>.total_notes)
		else
			FormatText TextName = notes_hit_entry qs("\L%g/%p") g = (<player_data>.notes_hit) p = (<player_data>.max_notes)
		endif
	endif
	FormatText TextName = mult_entry qs("\L%px") p = (<player_data>.avg_multiplier)
	FormatText TextName = score_entry qs("\L%g") g = (<player_data>.score)
	FormatText checksumname = notes_hit_cs 'notes_hit_entry_text_p%j' j = <i>
	FormatText checksumname = sp_phrases_cs 'sp_phrases_entry_text_p%j' j = <i>
	FormatText checksumname = avg_mult_cs 'avg_multiplier_entry_text_p%j' j = <i>
	FormatText checksumname = score_cs 'score_entry_text_p%j' j = <i>
	AddParam name = <score_cs> structure_name = header_struct value = <score_entry>
	AddParam name = <notes_hit_cs> structure_name = header_struct value = <notes_hit_entry>
	AddParam name = <sp_phrases_cs> structure_name = header_struct value = <sp_entry>
	if NOT (<type> = training || <type> = battle)
		AddParam name = <avg_mult_cs> structure_name = header_struct value = <mult_entry>
	endif
	<id> :SE_SetProps <header_struct>
	i = (<i> + 1)
	repeat (<num_players_shown>)
	i = (<num_players_shown> + 1)
	if NOT (4 = <num_players_shown>)
		begin
		FormatText checksumname = entry_alpha 'entries_p%i_alpha' i = <i>
		AddParam name = <entry_alpha> structure_name = entry_alpha_struct value = 0.0
		<id> :SE_SetProps <entry_alpha_struct>
		i = (<i> + 1)
		repeat (4 - <num_players_shown>)
	endif
	if NOT (<type> = training || <type> = battle)
		song_details_add_space_to_table
	else
		<id> :SE_SetProps {avg_multiplier_alpha = 0}
	endif
	if (<non_vocalist> > 0)
		<sections> = ((<gig_details> [(<non_vocalist> -1)] [<song_indx>]).section_names)
		GetArraySize <sections>
		i = 0
		if (<array_size> > 0)
			begin
			CreateScreenElement {
				parent = list_menu
				type = DescInterface
				autoSizeDims = true
				desc = 'song_summary_details_list_entry'
				verse_text = (<sections> [<i>])
				percent_p1_text = qs("---")
				percent_p2_text = qs("---")
				percent_p3_text = qs("---")
				percent_p4_text = qs("---")
			}
			change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
			player = 1
			begin
			GetPlayerInfo <player> part
			if (<part> = Vocals)
			else
				section_hits = (((<gig_details> [(<player> -1)] [<song_indx>]).detailed_stats) [<i>] * 1.0)
				section_possibles = (((<gig_details> [(<player> -1)] [<song_indx>]).detailed_stats_max) [<i>] * 1.0)
				section_hits = (<section_hits> * 1.0)
				my_struct = {}
				if (<section_possibles> = 0)
					FormatText \{TextName = player_percent
						qs("\LNA")}
					FormatText checksumname = field_name 'percent_p%d_text' d = <player>
					AddParam name = <field_name> structure_name = my_struct value = <player_percent>
					<id> :SE_SetProps <my_struct>
				else
					percent = (((<section_hits> * 1.0) / <section_possibles>) * 100)
					MathFloor <percent>
					CastToInteger \{percent}
					my_color_interp val = <floor> player = <player>
					FormatText TextName = player_percent qs("\L%d") d = <floor>
					player_percent = (<player_percent> + qs("\L%"))
					FormatText checksumname = field_name 'percent_p%d_text' d = <player>
					FormatText checksumname = field_name_rgba 'percent_p%d_rgba' d = <player>
					AddParam name = <field_name> structure_name = my_struct value = <player_percent>
					AddParam name = <field_name_rgba> structure_name = my_struct value = <color>
					<id> :SE_SetProps <my_struct>
				endif
			endif
			player = (<player> + 1)
			repeat (<num_players_shown>)
			player = (<num_players_shown> + 1)
			if NOT (4 = <num_players_shown>)
				begin
				FormatText checksumname = entry_alpha 'percent_P%i_alpha' i = <player>
				AddParam name = <entry_alpha> structure_name = entry_alpha_struct value = 0.0
				<id> :SE_SetProps <entry_alpha_struct>
				player = (<player> + 1)
				repeat (4 - <num_players_shown>)
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
		song_details_add_space_to_table
	endif
	if NOT (<vocalist> = 0)
		vocal_sections = ((<gig_details> [(<vocalist> -1)] [<song_indx>]).section_names)
		i = 0
		GetArraySize <vocal_sections>
		if (<array_size> > 0)
			begin
			ShortenUIString {
				ui_string = (<vocal_sections> [<i>])
				max_len = 24
			}
			if LocalizedStringEquals a = (<vocal_sections> [<i>]) b = $vocal_marker_freeform
				<verse_rgba> = $vocal_marker_freeform_rgba
			else
				RemoveParameter \{verse_rgba}
			endif
			CreateScreenElement {
				parent = list_menu
				type = DescInterface
				autoSizeDims = true
				desc = 'song_summary_details_list_entry'
				verse_text = <short_ui_string>
				verse_rgba = <verse_rgba>
				percent_p1_text = qs("---")
				percent_p2_text = qs("---")
				percent_p3_text = qs("---")
				percent_p4_text = qs("---")
			}
			change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
			player_index = 1
			begin
			GetPlayerInfo <player_index> part
			if (<part> = Vocals)
				section_hits = (((<gig_details> [(<player_index> -1)] [<song_indx>]).detailed_stats) [<i>] * 1.0)
				section_possibles = (((<gig_details> [(<player_index> -1)] [<song_indx>]).detailed_stats_max) [<i>] * 1.0)
				my_struct = {}
				if (<section_possibles> = 0)
					FormatText \{TextName = player_percent
						qs("\LNA")}
					FormatText checksumname = field_name 'percent_p%d_text' d = <player_index>
					AddParam name = <field_name> structure_name = my_struct value = <player_percent>
					<id> :SE_SetProps <my_struct>
				else
					percent = (((<section_hits> * 1.0) / <section_possibles>) * 100)
					MathFloor <percent>
					CastToInteger \{percent}
					my_color_interp val = <floor> player = <player_index>
					FormatText TextName = player_percent qs("\L%d") d = <floor>
					player_percent = (<player_percent> + qs("\L%"))
					FormatText checksumname = field_name 'percent_p%d_text' d = <player_index>
					FormatText checksumname = field_name_rgba 'percent_p%d_rgba' d = <player_index>
					AddParam name = <field_name> structure_name = my_struct value = <player_percent>
					AddParam name = <field_name_rgba> structure_name = my_struct value = <color>
					<id> :SE_SetProps <my_struct>
				endif
			endif
			<player_index> = (<player_index> + 1)
			repeat <num_players_shown>
			player = (<num_players_shown> + 1)
			if NOT (4 = <num_players_shown>)
				begin
				FormatText checksumname = entry_alpha 'percent_P%i_alpha' i = <player>
				AddParam name = <entry_alpha> structure_name = entry_alpha_struct value = 0.0
				<id> :SE_SetProps <entry_alpha_struct>
				player = (<player> + 1)
				repeat (4 - <num_players_shown>)
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
		song_details_add_space_to_table
	endif
	song_indx = (<song_indx> + 1)
	repeat <num_songs>
	ui_song_details_add_cash_stats
	SetScreenElementProps {
		id = my_current_menu
		tags = {current = 0 fit = 10 total = ($song_summary_details_row_count)}
	}
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs("BACK") button = red <all_button_params> z = 100000
	LaunchEvent \{type = focus
		target = my_current_menu}
	change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script ui_destroy_song_summary_details 
	change menu_flow_locked = ($menu_flow_locked + 1)
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_detailed_id}
	change menu_flow_locked = ($menu_flow_locked - 1)
endscript

script my_color_interp \{val = 100
		player = 1}
	array = [0 0 0 255]
	min = (($min_percents) [(<player> -1)])
	if (<val> = 100)
		color = [0 128 0 255]
	elseif (<val> <= 90 && <val> = <min>)
		color = [128 0 0 255]
	else
		color = [59 62 52 255]
	endif
	return color = <color>
endscript
min_percents = [
]
max_percents = [
]

script reset_mins_and_maxes 
	change \{my_min = [
		]}
	change \{my_max = [
		]}
endscript

script song_details_set_mins_and_maxes 
	gig_details = ($gig_detailed_stats)
	local_mins = [101 101 101 101]
	local_maxs = [-1 -1 -1 -1]
	GameMode_GetNumPlayersShown
	trim_boss_from_num_players_show
	i = 0
	begin
	sections = ((<gig_details> [<i>] [0]).section_names)
	section_hits_array = ((<gig_details> [<i>] [0]).detailed_stats)
	section_max_array = ((<gig_details> [<i>] [0]).detailed_stats_max)
	GetArraySize <sections>
	if (<array_size> > 0)
		j = 0
		begin
		section_max = (<section_max_array> [<j>] * 1.0)
		if NOT (<section_max> <= 0)
			section_hits = (<section_hits_array> [<j>] * 1.0)
			percent = (((<section_hits> * 1.0) / (<section_max> * 1.0)) * 100)
			MathFloor <percent>
			CastToInteger \{percent}
			if (<percent> < <local_mins> [<i>])
				SetArrayElement ArrayName = local_mins index = <i> newvalue = <percent>
			endif
			if (<percent> > <local_maxs> [<i>])
				SetArrayElement ArrayName = local_maxs index = <i> newvalue = <percent>
			endif
		endif
		j = (<j> + 1)
		repeat <array_size>
	endif
	i = (<i> + 1)
	repeat <num_players_shown>
	change min_percents = <local_mins>
	change max_percents = <local_maxs>
endscript

script my_find_max_and_min 
	t_max = -1
	t_min = -1
	RequireParams \{[
			array
		]
		all}
	GetArraySize \{array}
	if (<array_size> > 0)
		t_max = <array> [0]
		t_min = <array> [0]
		i = 0
		begin
		if (<array> [<i>] < min)
			t_min = <array> [0]
		endif
		if (<array> [<i>] > max)
			t_max = <array> [0]
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return max = <t_max> min = <t_min>
endscript

script ui_song_details_add_cash_stats 
	GameMode_GetType
	if NOT (<type> = career || <type> = quickplay)
		return
	endif
	ui_details_update_song_milestones_data
	ui_details_add_compiled_results_to_table
	song_details_add_space_to_table
endscript

script ui_details_add_compiled_results_to_table 
	collection = ($compiled_individual_cash_rewards)
	GetArraySize <collection>
	if (<array_size> > 0)
		i = 0
		begin
		temp_struct = (<collection> [<i>])
		mstone = (<temp_struct>.milestone)
		<label> = ($cash_milestones.<mstone>.text)
		row_props = {verse_text = <label>}
		if StructureContains Structure = <temp_struct> player1_cash
			FormatText TextName = Foo qs("$%d") d = (<temp_struct>.player1_cash)
			AddParam structure_name = row_props name = percent_p1_text value = <Foo>
		endif
		if StructureContains Structure = <temp_struct> player2_cash
			FormatText TextName = Foo qs("$%d") d = (<temp_struct>.player2_cash)
			AddParam structure_name = row_props name = percent_p2_text value = <Foo>
		endif
		if StructureContains Structure = <temp_struct> player3_cash
			FormatText TextName = Foo qs("$%d") d = (<temp_struct>.player3_cash)
			AddParam structure_name = row_props name = percent_p3_text value = <Foo>
		endif
		if StructureContains Structure = <temp_struct> player4_cash
			FormatText TextName = Foo qs("$%d") d = (<temp_struct>.player4_cash)
			AddParam structure_name = row_props name = percent_p4_text value = <Foo>
		endif
		CreateScreenElement \{parent = list_menu
			type = DescInterface
			autoSizeDims = true
			desc = 'song_summary_details_list_entry'
			verse_text = qs("")
			percent_p1_text = qs("")
			percent_p2_text = qs("")
			percent_p3_text = qs("")
			percent_p4_text = qs("")
			percent_p1_rgba = [
				0
				128
				0
				255
			]
			percent_p2_rgba = [
				0
				128
				0
				255
			]
			percent_p3_rgba = [
				0
				128
				0
				255
			]
			percent_p4_rgba = [
				0
				128
				0
				255
			]}
		change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
		<id> :SE_SetProps <row_props>
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript
compiled_individual_cash_rewards = [
]

script print_compiled_individual_cash_rewards 
	collection = ($compiled_individual_cash_rewards)
	printstruct channel = mychannel <...>
endscript

script ui_details_update_song_milestones_data 
	ui_details_compile_cash_rewards
	ui_details_sum_up_milestone_earnings
endscript

script ui_details_sum_up_milestone_earnings 
	GameMode_GetNumPlayersShown
	trim_boss_from_num_players_show
	collection = ($compiled_individual_cash_rewards)
	GetArraySize <collection>
	i = 0
	if (<array_size> > 0)
		begin
		temp_struct = (<collection> [<i>])
		award_milestone = 1
		j = 0
		begin
		FormatText checksumname = my_check 'player%d_cash' d = (<j> + 1)
		if StructureContains Structure = <temp_struct> <my_check>
			amt = (<temp_struct>.<my_check>)
		endif
		j = (<j> + 1)
		repeat <num_players_shown>
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_details_compile_cash_rewards 
	GameMode_GetNumPlayersShown
	trim_boss_from_num_players_show
	change \{compiled_individual_cash_rewards = [
		]}
	player = 1
	begin
	collection = ($cash_milestones_collection_per_song [(<player> -1)])
	GetArraySize <collection>
	if (<array_size> > 0)
		i = 0
		begin
		m = (<collection> [<i>])
		compiled_cash_get_duplicate_milestone_index milestone = (<m>.milestone) collection = ($compiled_individual_cash_rewards)
		if (<duplicate_milestone_index> = -1)
			my_struct = {milestone = (<m>.milestone)}
			FormatText checksumname = player_cash 'player%d_cash' d = <player> AddToStringLookup = true
			AddParam name = <player_cash> structure_name = my_struct value = (<m>.Cash)
			AddArrayElement array = ($compiled_individual_cash_rewards) element = <my_struct>
			change compiled_individual_cash_rewards = <array>
		else
			FormatText checksumname = player_cash 'player%d_cash' d = <player> AddToStringLookup = true
			old_struct = ($compiled_individual_cash_rewards [<duplicate_milestone_index>])
			if StructureContains Structure = <old_struct> <player_cash>
				amt = (<old_struct>.<player_cash>)
				AddParam name = <player_cash> structure_name = old_struct value = ((<m>.Cash) + <amt>)
				SetArrayElement ArrayName = compiled_individual_cash_rewards GlobalArray index = <duplicate_milestone_index> newvalue = <old_struct>
			else
				AddParam name = <player_cash> structure_name = old_struct value = (<m>.Cash)
				SetArrayElement ArrayName = compiled_individual_cash_rewards GlobalArray index = <duplicate_milestone_index> newvalue = <old_struct>
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	player = (<player> + 1)
	repeat <num_players_shown>
endscript

script compiled_cash_get_duplicate_milestone_index 
	RequireParams \{[
			milestone
			collection
		]
		all}
	<duplicate_milestone_index> = -1
	GetArraySize <collection>
	if (<array_size> > 0)
		<i> = 0
		begin
		<milestone_struct> = (<collection> [<i>])
		if StructureContains Structure = <milestone_struct> milestone
			if ChecksumEquals a = (<milestone_struct>.milestone) b = <milestone>
				<duplicate_milestone_index> = <i>
				break
			endif
		else
			break
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	return duplicate_milestone_index = <duplicate_milestone_index>
endscript

script song_summary_details_add_band_reward 
	if NOT (<Band> = false)
		<label> = ($cash_milestones.<milestone>.text)
		FormatText TextName = reward_name qs("%s") s = <label>
		FormatText TextName = cash_value qs("$%d") d = <Cash>
		CreateScreenElement {
			parent = list_menu
			type = DescInterface
			autoSizeDims = true
			desc = 'song_summary_details_list_entry'
			verse_text = <reward_name>
			percent_p1_text = qs("")
			percent_p2_text = qs("")
			percent_p3_text = qs("")
			percent_p4_text = qs("")
		}
		GameMode_GetNumPlayersShown
		i = 1
		begin
		FormatText checksumname = cash_val 'percent_p%d_text' d = <i>
		AddParam name = <cash_val> structure_name = my_struct value = <cash_value>
		i = (<i> + 1)
		repeat <num_players_shown>
		<id> :SE_SetProps <my_struct>
		change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
	endif
endscript

script song_details_create_scrolling_menu 
	if my_detailed_id :Desc_ResolveAlias \{name = alias_song_summary_details_list
			param = details_list_alias}
	else
		ScriptAssert \{qs("\LProblem resolving alias in detailed stats")}
	endif
	array = [
		{pad_up ui_song_details_shift params = {up}}
		{pad_down ui_song_details_shift params = {down}}
		{pad_back generic_event_back}
	]
	if (<for_transition> = 1)
		SetArrayElement \{ArrayName = array
			index = 2
			newvalue = {
				pad_back
				generic_event_back
				params = {
					data = {
						transitioning = 1
					}
				}
			}}
	endif
	CreateScreenElement {
		type = WindowElement
		parent = <details_list_alias>
		id = my_current_menu
		dims = (970.0, 350.0)
		pos = (148.0, 341.0)
		just = [left top]
		pos_anchor = [left top]
		event_handlers = <array>
		tags = {current = 0 fit = 11 total = 9}
	}
	CreateScreenElement \{type = VMenu
		parent = my_current_menu
		id = list_menu
		dims = (100.0, 385.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		spacing_between = 0}
	SetScreenElementProps \{id = my_detailed_id
		arrow_top_alpha = 0}
endscript

script song_details_add_space_to_table 
	CreateScreenElement \{parent = list_menu
		type = DescInterface
		autoSizeDims = true
		desc = 'song_summary_details_list_entry'
		verse_text = qs("")
		percent_p1_text = qs("")
		percent_p2_text = qs("")
		percent_p3_text = qs("")
		percent_p4_text = qs("")}
	change song_summary_details_row_count = (($song_summary_details_row_count) + 1)
endscript

script ui_song_details_shift 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	GetTags
	if GotParam \{down}
		if (<current> >= ((<total> - <fit>) + 1))
			return
		endif
		list_menu :SetProps \{pos = {
				(0.0, -35.0)
				relative
			}
			time = 0.05}
		SetTags current = (<current> + 1)
		generic_menu_up_or_down_sound \{down}
	else
		if (<current> <= 0)
			return
		endif
		list_menu :SetProps \{pos = {
				(0.0, 35.0)
				relative
			}
			time = 0.05}
		SetTags current = (<current> - 1)
		generic_menu_up_or_down_sound \{up}
	endif
	GetTags
	max = ((<total> - <fit>) + 1)
	dx = (197.0 / <max>)
	pos = ((358.0, -194.0) + ((0.0, 1.0) * (<current> * <dx>)))
	my_detailed_id :SE_SetProps setlist_popup_scroll_thumb_pos = <pos> time = 0.1
endscript

script ui_song_summary_details_anim_in 
	SoundEvent \{event = Menu_Song_Complete_In}
	printf \{channel = mychannel
		qs("\Ldetails anim in")}
	if ScreenElementExists \{id = my_detailed_id}
		SetScreenElementProps \{id = my_detailed_id
			pos = {
				(1200.0, 0.0)
				relative
			}
			time = 0.1}
		Wait \{0.2
			second}
	endif
endscript

script ui_song_summary_details_anim_out 
	SoundEvent \{event = Menu_Song_Complete_Out}
	printf \{channel = mychannel
		qs("\Ldetails anim out")}
	if ScreenElementExists \{id = my_detailed_id}
		SetScreenElementProps \{id = my_detailed_id
			pos = {
				(1200.0, 0.0)
				relative
			}
			time = 0.1}
		Wait \{0.2
			second}
	endif
endscript
