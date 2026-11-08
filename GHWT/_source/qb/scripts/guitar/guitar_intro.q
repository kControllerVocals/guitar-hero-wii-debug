intro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
fastintro_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6700
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -2000
	highway_move_time = 2000
	button_ripple_start_time = -800
	button_ripple_per_button_time = 100
	hud_start_time = -400
	hud_move_time = 200
}
practice_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = -6500
	song_title_fade_time = 700
	song_title_on_time = 3000
	highway_start_time = -3000
	highway_move_time = 2000
	button_ripple_start_time = -1800
	button_ripple_per_button_time = 100
	hud_start_time = -1400
	hud_move_time = 200
}
immediate_sequence_props = {
	song_title_pos = (255.0, 75.0)
	performed_by_pos = (255.0, 135.0)
	song_artist_pos = (255.0, 150.0)
	song_title_start_time = 0
	song_title_fade_time = 700
	song_title_on_time = 0
	highway_start_time = 0
	highway_move_time = 0
	button_ripple_start_time = 0
	button_ripple_per_button_time = 0
	hud_start_time = 0
	hud_move_time = 0
}
current_intro = $fast_intro_sequence_props
g_playing_intro = 0

script play_intro 
	if ($g_playing_intro)
		printf \{qs(0xaeeaca81)}
		return
	endif
	if ($freestyle_active = 1)
		return
	endif
	change \{g_playing_intro = 1}
	start_drummer_cameras
	if ($show_boss_helper_screen = 1)
		intro_check_for_celeb_intro_ui
		return
	endif
	if ($is_attract_mode = 1)
		disable_bg_viewport
		return
	endif
	KillSpawnedScript \{name = GuitarEvent_SongFailed_Spawned}
	if GotParam \{Fast}
		change \{current_intro = $fastintro_sequence_props}
	elseif GotParam \{practice}
		change \{current_intro = $practice_sequence_props}
	else
		change \{current_intro = $intro_sequence_props}
	endif
	if ($g_in_tutorial = 0)
		spawnscriptnow \{intro_song_info
			id = intro_scripts}
	endif
	intro_check_for_celeb_intro_ui
	if NOT ($Cheat_PerformanceMode = 1 && $is_network_game = 0)
		spawnscriptnow \{intro_highway_move
			id = intro_scripts}
	endif
	GameMode_GetNumPlayersShown
	player = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player>
	FormatText TextName = player_text 'p%i' i = <player>
	spawnscriptnow intro_buttonup_ripple params = <...> id = intro_scripts
	player = (<player> + 1)
	repeat <num_players_shown>
	if (($tutorial_disable_hud = 0) && ($end_credits = 0))
		spawnscriptnow \{intro_hud_move
			id = intro_scripts}
	endif
	BandManager_SetPlayingIntroAnims
endscript

script destroy_intro 
	printf \{qs(0x1055cbf6)}
	KillSpawnedScript \{id = intro_scripts}
	KillSpawnedScript \{name = Song_Intro_Kick_SFX_Waiting}
	KillSpawnedScript \{name = Song_Intro_Highway_Up_SFX_Waiting}
	KillSpawnedScript \{name = move_highway_2d}
	KillSpawnedScript \{name = intro_buttonup_ripple}
	KillSpawnedScript \{name = intro_hud_move}
	DestroyScreenElement \{id = intro_container}
	ui_event_get_top
	if NOT (<base_name> = 'pausemenu')
		player = 1
		begin
		printf qs(0x11ea49db) d = <player> s = <base_name>
		FormatText checksumname = player_status 'player%i_status' i = <player> AddToStringLookup
		EnableInput controller = ($<player_status>.controller)
		player = (<player> + 1)
		repeat $current_num_players
	endif
	change \{g_playing_intro = 0}
endscript

script intro_buttonup_ripple 
	EnableInput off controller = ($<player_status>.controller)
	begin
	GetSongTimeMs
	if ($current_intro.button_ripple_start_time + $current_starttime < <time>)
		break
	endif
	WaitOneGameFrame
	repeat
	if ($current_intro.button_ripple_per_button_time = 0)
		ui_event_get_top
		if NOT (<base_name> = 'pausemenu')
			EnableInput controller = ($<player_status>.controller)
		endif
		return
	endif
	GetArraySize \{$gem_colors}
	controller = ($<player_status>.controller)
	all_vocals = 1
	player = 1
	begin
	FormatText checksumname = current_player_status 'player%i_status' i = <player> AddToStringLookup
	if NOT ($<current_player_status>.part = Vocals)
		all_vocals = 0
		break
	endif
	player = (<player> + 1)
	repeat $current_num_players
	if (<all_vocals> = 0)
		SoundEvent \{event = Notes_Ripple_Up_SFX}
	endif
	ExtendCRC button_up_pixel_array ($<player_status>.text) out = pixel_array
	buttonup_count = 0
	begin
	Wait ($current_intro.button_ripple_per_button_time / 1000.0) seconds
	array_count = 0
	begin
	color = ($gem_colors [<array_count>])
	if (<array_count> = <buttonup_count>)
		SetArrayElement ArrayName = <pixel_array> GlobalArray index = <array_count> newvalue = $button_up_pixels
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
	buttonup_count = (<buttonup_count> + 1)
	repeat (<array_size> + 1)
	ui_event_get_top
	if NOT (<base_name> = 'pausemenu')
		EnableInput controller = ($<player_status>.controller)
	endif
endscript

script intro_song_info 
	begin
	GetSongTimeMs
	if ($current_intro.song_title_start_time + $current_starttime < <time>)
		break
	endif
	WaitOneGameFrame
	repeat
	if ($current_intro.song_title_on_time = 0)
		return
	endif
	if ScreenElementExists \{id = intro_container}
		DestroyScreenElement \{id = intro_container}
	endif
	get_song_title song = ($current_song)
	get_song_artist_text song = ($current_song)
	get_song_artist song = ($current_song)
	if ($current_song = jamsession)
		year = 2008
		if ui_event_exists_in_stack \{name = 'setlist'}
			jam_directory_index = ($temp_jamsession_song_list [($quickplay_song_list_current)])
			GetArraySize ($jam_curr_directory_listing) param = directory_size
			if (<jam_directory_index> > 0 && <jam_directory_index> < <directory_size>)
				<year> = ($jam_curr_directory_listing [<jam_directory_index>].year)
			endif
		elseif ui_event_exists_in_stack \{name = 'jam'}
			jam_struct = ($jamsession_songlist_props.jamsession)
			year = (<jam_struct>.year_num)
		endif
		if NOT GotParam \{song_artist}
			get_savegame_from_controller controller = ($primary_controller)
			get_current_band_info
			GetGlobalTags savegame = <savegame> <band_info>
			song_artist = $wii_jam_custom_song
			if GotParam \{name}
				if (<name> != qs("\L"))
					song_artist = <name>
				endif
			endif
			FormatText TextName = year_text qs("\L, %d") d = <year>
			song_artist = (<song_artist> + <year_text>)
		endif
	endif
	CreateScreenElement {
		parent = root_window
		id = intro_container
		type = DescInterface
		desc = 'song_intro'
		alpha = 0
		z_priority = 500
		intro_artist_text = <song_artist>
		intro_title_text = <song_title>
		intro_performed_text = <song_artist_text>
	}
	intro_container :SE_SetProps alpha = 1 time = ($current_intro.song_title_fade_time / 1000.0)
	intro_container :SE_WaitProps
	Wait ($current_intro.song_title_on_time / 1000.0) seconds
	intro_container :SE_SetProps alpha = 0 time = ($current_intro.song_title_fade_time / 1000.0)
	intro_container :SE_WaitProps
	DestroyScreenElement \{id = intro_container}
endscript

script intro_highway_move 
	begin
	GetSongTimeMs
	if ($current_intro.highway_start_time + $current_starttime < <time>)
		break
	endif
	WaitOneGameFrame
	repeat
	all_vocals = 1
	player = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player> AddToStringLookup
	if NOT ($<player_status>.part = Vocals)
		all_vocals = 0
		break
	endif
	player = (<player> + 1)
	repeat $current_num_players
	if (<all_vocals> = 0)
		spawnscriptnow \{Song_Intro_Highway_Up_SFX_Waiting}
	else
		spawnscriptnow \{Song_Intro_Highway_Up_Vocals_SFX_Waiting}
	endif
	GameMode_GetNumPlayersShown
	player = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player> AddToStringLookup
	FormatText TextName = player_text 'p%i' i = <player> AddToStringLookup
	vocals_highway_slide_in player = <player>
	move_highway_camera_to_default <...> time = ($current_intro.highway_move_time / 1000.0)
	player = (<player> + 1)
	repeat <num_players_shown>
endscript

script intro_hud_move 
	begin
	GetSongTimeMs
	if ($current_intro.hud_start_time + $current_starttime < <time>)
		break
	endif
	WaitOneGameFrame
	repeat
	GameMode_GetNumPlayersShown
	player = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player> AddToStringLookup
	FormatText TextName = player_text 'p%i' i = <player> AddToStringLookup
	move_hud_to_default time = ($current_intro.hud_move_time / 1000.0)
	player = (<player> + 1)
	repeat <num_players_shown>
	if ($game_mode = p2_battle && $battle_do_or_die = 1)
		restore_saved_powerups
	endif
	all_vocals = 1
	player = 1
	begin
	FormatText checksumname = player_status 'player%i_status' i = <player> AddToStringLookup
	if NOT ($<player_status>.part = Vocals)
		all_vocals = 0
		break
	endif
	player = (<player> + 1)
	repeat $current_num_players
	spawnscriptnow \{Song_Intro_Kick_SFX_Waiting}
endscript

script intro_check_for_celeb_intro_ui 
	Transition_GetPrefix type = ($current_playing_transition)
	if (<celeb_intro> = 1)
		spawnscriptnow intro_celeb_ui params = {celeb_intro = <type_textnl>}
	endif
endscript

script intro_celeb_ui 
	switch ($current_playing_transition)
		case intro_ozzy
		<start_delay> = 7.4
		<duration> = 4.0
		case intro_zakk
		<start_delay> = 9.0
		<duration> = 4.0
		Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good}
		case intro_hayley
		<start_delay> = 4.3
		<duration> = 4.0
		case intro_ted
		<start_delay> = 8.1
		<duration> = 4.0
		Skate8_SFX_Backgrounds_New_Area \{BG_SFX_Area = $Current_Crowd_Looping_BG_Area_Good}
		case intro_billy
		<start_delay> = 2.6
		<duration> = 4.0
		case intro_travis
		<start_delay> = 4.3
		<duration> = 4.0
		case intro_jimi
		<start_delay> = 13.5
		<duration> = 3.5
		case intro_sting
		<start_delay> = 5.6
		<duration> = 4.0
		default
		<start_delay> = 2.0
		<duration> = 4.0
	endswitch
	FormatText TextName = desc 'celeb_%c' c = <celeb_intro>
	Wait <start_delay> seconds
	SoundEvent \{event = Boss_Logo_First_Part}
	CreateScreenElement \{type = ContainerElement
		id = celeb_intro_ui_cont
		parent = root_window
		pos = (0.0, 0.0)
		z_priority = 100}
	SetSearchAllAssetContexts
	CreateScreenElement {
		parent = celeb_intro_ui_cont
		id = celeb_intro_ui
		type = DescInterface
		desc = <desc>
	}
	SetSearchAllAssetContexts \{off}
	celeb_intro_ui :Desc_ResolveAlias \{name = alias_celeb_intro_banner}
	AssignAlias id = <resolved_id> alias = celeb_intro_banner
	celeb_intro_banner :SE_SetProps \{alpha = 0.0}
	celeb_intro_banner :SE_GetProps \{pos}
	<banner_pos> = <pos>
	celeb_intro_ui :Desc_ResolveAlias \{name = alias_celeb_intro_alltherest}
	AssignAlias id = <resolved_id> alias = celeb_intro_alltherest
	celeb_intro_alltherest :SE_SetProps \{alpha = 0.0}
	celeb_intro_alltherest :SE_GetProps \{pos}
	<alltherest_pos> = <pos>
	<time_between_bounces> = 0.4
	celeb_intro_banner :Obj_SpawnScriptNow intro_celeb_ui_bounce params = {id = celeb_intro_banner starting_pos = <banner_pos>}
	Wait <time_between_bounces> seconds
	celeb_intro_alltherest :Obj_SpawnScriptNow intro_celeb_ui_bounce params = {id = celeb_intro_alltherest starting_pos = <alltherest_pos>}
	Wait (<duration> - <time_between_bounces>) seconds
	SoundEvent \{event = Boss_Logo_Second_Part}
	<zoom_out_time> = 0.15
	celeb_intro_alltherest :SE_SetProps scale = 3.0 alpha = 0.0 pos = (<alltherest_pos> + (0.0, 300.0)) time = <zoom_out_time>
	Wait \{0.1
		seconds}
	celeb_intro_banner :SE_SetProps scale = 3.0 alpha = 0.0 pos = (<banner_pos> + (0.0, 300.0)) time = <zoom_out_time>
	celeb_intro_banner :SE_WaitProps
	DestroyScreenElement \{id = celeb_intro_ui_cont}
endscript

script intro_celeb_ui_bounce 
	<zoom_in_time> = 0.25
	<first_bounce_time> = 0.15
	<settle_in_time> = 0.15
	<id> :SE_SetProps scale = 3.0 pos = (<starting_pos> + (0.0, 200.0))
	<id> :SE_SetProps scale = 0.8 alpha = 1.0 pos = (<starting_pos>) motion = ease_in time = <zoom_in_time>
	<id> :SE_WaitProps
	<id> :SE_SetProps scale = 0.9 pos = (<starting_pos> + (0.0, 5.0)) moion = ease_out time = <first_bounce_time>
	<id> :SE_WaitProps
	<id> :SE_SetProps scale = 0.8 pos = (<starting_pos>) motion = ease_in time = <settle_in_time>
endscript

script kill_intro_celeb_ui 
	if ScriptIsRunning \{wait_and_show_boss_helper_after_intro}
		KillSpawnedScript \{name = wait_and_show_boss_helper_after_intro}
	endif
	if ScriptIsRunning \{intro_celeb_ui}
		if ScreenElementExists \{id = celeb_intro_ui_cont}
			DestroyScreenElement \{id = celeb_intro_ui_cont}
		endif
		KillSpawnedScript \{name = intro_celeb_ui}
	endif
endscript
