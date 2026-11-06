0x2368550f = 0
guitar_events = [
	{
		type = call
		event = missed_note
		scr = guitarevent_missednote
	}
	{
		type = call
		event = unnecessary_note
		scr = guitarevent_unnecessarynote
	}
	{
		type = call
		event = hit_notes
		scr = guitarevent_hitnotes
	}
	{
		type = call
		event = hit_note
		scr = guitarevent_hitnote
	}
	{
		type = call
		event = drumfill_hit
		scr = guitarevent_drumfillhit
	}
	{
		type = call
		event = hit_mine
		scr = guitarevent_hitmine
	}
	{
		type = call
		event = star_power_on
		scr = guitarevent_starpoweron
	}
	{
		type = call
		event = star_power_off
		scr = guitarevent_starpoweroff
	}
	{
		type = spawn
		event = song_failed
		scr = guitarevent_songfailed
	}
	{
		type = spawn
		event = song_won
		scr = guitarevent_songwon
	}
	{
		type = spawn
		event = star_sequence_bonus
		scr = guitarevent_starsequencebonus
	}
	{
		type = call
		event = whammy_on
		scr = guitarevent_whammyon
	}
	{
		type = call
		event = whammy_off
		scr = guitarevent_whammyoff
	}
	{
		type = call
		event = ext_whammy_off
		scr = guitarevent_whammyoff
	}
	{
		type = call
		event = firstnote_window_open
		scr = guitarevent_firstnote_window_open
	}
]

script create_guitar_events 
	printf qs(0x0f26afab) a = <player_text>
	getarraysize \{$guitar_events}
	array_entry = 0
	begin
	printf \{qs(0x916cce78)}
	event = ($guitar_events [<array_entry>].event)
	type = ($guitar_events [<array_entry>].type)
	extendcrc <event> <player_text> out = event
	seteventhandler response = call_script event = <event> scr = event_spawner params = {event_spawned = <array_entry>}
	array_entry = (<array_entry> + 1)
	repeat <array_size>
	block
endscript

script event_spawner 
	spawnscriptnow ($guitar_events [<event_spawned>].scr) params = {<...>} id = song_event_scripts
endscript

script event_iterator 
	printf qs(0x5fa77966) d = <time_offset> e = <event_string>
	get_song_prefix song = <song_name>
	formattext checksumname = song '%s_%e' s = <song_prefix> e = <event_string> addtostringlookup
	array_entry = 0
	if NOT globalexists name = <song> type = array
		return
	endif
	getarraysize $<song>
	if (<array_size> = 0)
		return
	endif
	getsongtimems time_offset = <time_offset>
	begin
	if ((<time> - <skipleadin>) < (($<song> [<array_entry>]).time))
		break
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
	array_size = (<array_size> - <array_entry>)
	if (<array_size> = 0)
		return
	endif
	begin
	scriptname = ($<song> [<array_entry>].scr)
	if (<scriptname> = band_playclip)
		timemarkerreached_setparams time_offset = (<time_offset> + 2 * 16.667) array = <song> array_entry = <array_entry> arrayofstructures
	else
		timemarkerreached_setparams time_offset = <time_offset> array = <song> array_entry = <array_entry> arrayofstructures
	endif
	begin
	if timemarkerreached
		getsongtimems time_offset = <time_offset>
		break
	endif
	waitonegameframe
	repeat
	timemarkerreached_clearparams
	if scriptexists <scriptname>
		spawnscriptnow <scriptname> params = {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)} id = song_event_scripts
	elseif symboliscfunc <scriptname>
		<scriptname> {time = <time> event_time = (($<song> [<array_entry>]).time) ($<song> [<array_entry>].params)}
	endif
	<array_entry> = (<array_entry> + 1)
	repeat <array_size>
endscript

script wait_for_correct_frame 
	if NOT ($playing_song_for_real = 1)
		return
	endif
	if wait_for_correct_frame_cfunc
		waitonegameframe
	endif
endscript

script 0x0666218b 
	if NOT ($playing_song_for_real = 1)
		return
	endif
	if (<id> = vocalist || <id> = drummer)
		return
	endif
	if (<id> = guitarist)
		if ($current_frame_toggle = 1)
			wait \{1
				gameframe}
		endif
	else
		if ($current_frame_toggle = 0)
			wait \{1
				gameframe}
		endif
	endif
endscript

script guitarevent_missednote \{extended_miss = 0}
	wait_for_correct_frame player = ($<player_status>.player)
	if (<bum_note> = 1)
		guitar_wrong_note_sound_logic <...>
	endif
	if ($is_network_game && ($<player_status>.is_local_client = 0))
		if (<silent_miss> = 1)
		endif
	else
		if NOT (($<player_status>.part) = drum)
			playergetvolume player_status = <player_status>
			if NOT (<volume> = 0)
				if (<silent_miss> = 1)
				else
					if NOT (<extended_miss> = 1)
						playersetvolume player_status = <player_status> volume = 0
						updateguitarvolume
						jam_update_volume volume = 0 player = ($<player_status>.player)
					endif
				endif
			endif
		endif
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			if compositeobjectexists name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = bass)
					bandmanager_missednote name = ($<player_status>.band_member)
				endif
			endif
		endif
	endif
	inputarraygetelement name = <song> index = <array_entry>
	if ($show_play_log = 1)
		output_log_text qs(0xbfe03a95) t = (<gem_array> [0]) color = orange
	endif
endscript

script highway_pulse_black 
	<half_time> = ($highway_pulse_time / 2.0)
	formattext checksumname = highway 'Highway_2D%p' p = <player_text> addtostringlookup = true
	legacydoscreenelementmorph id = <highway> rgba = ($highway_pulse) time = <half_time>
	wait <half_time> seconds
	if ($<player_status>.star_power_used = 1)
		legacydoscreenelementmorph id = <highway> rgba = ($highway_starpower) time = <half_time>
	else
		legacydoscreenelementmorph id = <highway> rgba = ($highway_normal) time = <half_time>
	endif
endscript

script guitarevent_unnecessarynote 
	wait_for_correct_frame player = ($<player_status>.player)
	guitar_wrong_note_sound_logic <...>
	if NOT ($is_network_game && ($<player_status>.is_local_client = 0))
		playersetvolume player_status = <player_status> volume = 0
		updateguitarvolume
		jam_update_volume volume = 0 player = ($<player_status>.player)
	endif
	if ($always_strum = false)
		if ($disable_band = 0)
			if compositeobjectexists name = ($<player_status>.band_member)
				if ($<player_status>.part = guitar || $<player_status>.part = bass)
					launchevent type = anim_missednote target = ($<player_status>.band_member)
				endif
			endif
		endif
	endif
	if ($show_play_log = 1)
		if (<array_entry> > 0)
			<songtime> = (<songtime> - ($check_time_early * 1000.0))
			inputarraygetelement name = <song> index = <array_entry>
			next_note = (<gem_array> [0])
			inputarraygetelement name = <song> index = (<array_entry> -1)
			prev_note = (<gem_array> [0])
			next_time = (<next_note> - <songtime>)
			prev_time = (<songtime> - <prev_note>)
			if (<prev_time> < ($check_time_late * 1000.0))
				<prev_time> = 1000000.0
			endif
			if (<next_time> < <prev_time>)
				<next_time> = (0 - <next_time>)
				output_log_text qs(0x9648a941) n = <next_time> t = <next_note> color = red
			else
				output_log_text qs(0x6ef444b5) n = <prev_time> t = <prev_note> color = darkred
			endif
		endif
	endif
endscript

script guitarevent_hitnotes 
	if ($debug_audible_hitnote = 1)
		soundevent \{event = gh_sfx_hitnotesoundevent}
	endif
	if ($show_play_log = 1)
		getglobaltags \{user_options}
		casttointeger \{lag_calibration}
		mod a = <lag_calibration> b = 1000
		<video_offset> = <mod>
		<audio_offset> = ((<lag_calibration> / 1000) - 1)
		<off_note> = (0 - (<off_note> - ($time_input_offset + <audio_offset> + <video_offset>)))
		casttointeger \{off_note}
		inputarraygetelement name = <song> index = <array_entry>
		note_time = (<gem_array> [0])
		if (<off_note> < 0)
			output_log_text qs(0xddc15e81) n = <off_note> t = <note_time> color = green
		else
			output_log_text qs(0x257db375) n = <off_note> t = <note_time> color = darkgreen
		endif
	endif
	wait_for_correct_frame player = ($<player_status>.player)
	if (<updatevolume> = true)
		if NOT ($is_network_game && ($<player_status>.is_local_client = 0))
			playersetvolume player_status = <player_status> volume = 100
		endif
		updateguitarvolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
	endif
endscript

script guitarevent_hitnote 
	spawnscriptnow guitarevent_hitnote_spawned params = {<...>}
endscript

script guitarevent_hitnote_spawned 
	wait_for_correct_frame player = <player>
	if gotparam \{kick}
		guitarevent_kick_drum_hit_note player = <player> player_text = <player_text>
	elseif gotparam \{open_note}
		guitarevent_hit_open_note player = <player> player_text = <player_text>
	elseif gotparam \{easy_rhythm_note}
		guitarevent_hit_easy_rhythm_note player_text = <player_text>
	else
		if ($game_mode = p2_battle || $boss_battle = 1)
			change structurename = <player_status> last_hit_note = <color>
		endif
		waitonegameframe
		if gotparam \{drum_accent}
			drum_accent_hit_particle_fx {fx_id = <fx_id> pos = <pos> player = <player> drum_index = <drum_index>}
		endif
		scale = (2.0, 2.0)
		if gotparam \{drum_accent}
			if gotparam \{scale}
				<scale> = (<scale> * 2.0)
			else
				<scale> = (1.0, 2.0)
			endif
		endif
		star = ($<player_status>.star_power_used)
		name = <fx_id>
		notefx scale = <scale>
		wait \{6
			gameframes}
		wait \{10
			gameframes}
		if screenelementexists id = <fx_id>
			destroyscreenelement id = <fx_id>
		endif
	endif
endscript

script guitarevent_drumfillhit 
	if gotparam \{kick}
		guitarevent_hitnote <...>
	endif
endscript
hit_particle_params = {
	z_priority = 8.0
	material = sys_particle_spark01_sys_particle_spark01
	start_color = [
		255
		128
		0
		255
	]
	end_color = [
		255
		0
		0
		0
	]
	start_scale = (2.0, 2.0)
	end_scale = (1.0, 1.0)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}
star_hit_particle_params = {
	z_priority = 8.0
	material = sys_particle_spark01_sys_particle_spark01
	start_color = [
		0
		255
		255
		255
	]
	end_color = [
		0
		255
		255
		0
	]
	start_scale = (2.0, 2.0)
	end_scale = (1.0, 1.0)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.25
}
whammy_particle_params = {
	z_priority = 8.0
	material = sys_particle_spark01_sys_particle_spark01
	start_color = [
		255
		128
		0
		255
	]
	end_color = [
		255
		0
		0
		0
	]
	start_scale = (1.0, 1.0)
	end_scale = (0.5, 0.5)
	start_angle_spread = 0.0
	min_rotation = 0.0
	max_rotation = 0.0
	emit_start_radius = 0.0
	emit_radius = 1.0
	emit_rate = 0.02
	emit_dir = 0.0
	emit_spread = 160.0
	velocity = 10.0
	friction = (0.0, 50.0)
	time = 0.5
}

script hitmine_fade_effect 
	obj_getid
	<objid> :se_setprops alpha = 0 time = <t2> anim = fast_out rgba = [255 , 0 , 0 , 255]
	<objid> :se_waitprops
	destroyscreenelement id = <objid>
endscript

script hitmine_grow_effect 
	obj_getid
	<objid> :se_setprops scale = <scale> time = 0.25 anim = fast_out
endscript

script guitarevent_hitmine 
	spawnscriptnow guitarevent_hitmine_spawned params = {<...>}
endscript

script guitarevent_hitmine_spawned 
	if ($<player_status>.highway_position = left)
		soundevent \{event = gh_sfx_battlemode_mine_explode_p1}
	else
		soundevent \{event = gh_sfx_battlemode_mine_explode_p2}
	endif
	spawnscriptnow hammer_highway params = {other_player_text = <player_text>}
	formattext checksumname = container_id 'gem_container%p' p = <player_text> addtostringlookup = true
	<particle_pos> = (<pos> - (0.0, 20.0))
	extendcrc <mine_fx_id> '_hit_particle' out = particle_id
	destroyscreenelement id = <mine_fx_id>
	createscreenelement {
		type = containerelement
		id = <mine_fx_id>
		parent = <container_id>
		pos = <particle_pos>
		z_priority = 8.0
		just = [center center]
		pos_anchor = [center center]
	}
	createscreenelement {
		type = containerelement
		local_id = grow_container
		parent = <mine_fx_id>
		pos = (0.0, 0.0)
		just = [center center]
		pos_anchor = [center center]
		scale = <start_scale>
	}
	<grow_id> = <id>
	<start_scale> = (1.0, 1.0)
	<end_scale> = (3.0, 3.0)
	createscreenelement {
		type = spriteelement
		local_id = top_wave
		pos = (0.0, 0.0)
		texture = icon_attack_explode
		parent = <grow_id>
		rgba = [255 , 255 , 255 , 255]
		blend = add
		alpha = 0.75
	}
	createscreenelement {
		type = spriteelement
		local_id = 0x41669650
		pos = (0.0, 0.0)
		texture = jow_spark02
		parent = <grow_id>
		rgba = [255 , 255 , 255 , 255]
		blend = add
		alpha = 0.75
		scale = (2.0, 2.0)
	}
	runscriptonscreenelement id = <mine_fx_id> hitmine_fade_effect params = {t1 = 0.15 t2 = 0.25}
	runscriptonscreenelement id = <grow_id> hitmine_grow_effect params = {scale = <end_scale>}
	<crowd_decrease_count> = $battle_mine_health_decrease_count
	<wait_time> = 0.15
	<wait_time_slice> = (<wait_time> / <crowd_decrease_count>)
	if ($<player_status>.current_num_powerups > 0)
		remove_battle_card player_status = <player_status>
		update_battlecards_remove player_status = <player_status>
	endif
	casttointeger \{crowd_decrease_count}
	begin
	crowddecrease player_status = <player_status>
	wait <wait_time_slice> seconds
	repeat <crowd_decrease_count>
endscript

script killminefx 
	killspawnedscript \{name = guitarevent_hitmine_spawned}
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 1
		player = 1}
	<container_pos> = (<pos> + (0.0, 720.0))
	legacydoscreenelementmorph id = gem_containerp1 pos = <container_pos>
	get_highway_pos_and_scale \{num_non_vocals_players = 2
		non_vocalist_player = 2
		player = 2}
	<container_pos> = (<pos> + (0.0, 720.0))
	legacydoscreenelementmorph id = gem_containerp2 pos = <container_pos>
endscript

script drum_accent_hit_particle_fx 
	formattext checksumname = container_id 'gem_containerp%p' p = <player> addtostringlookup = true
	<container_id> :obj_spawnscriptnow drum_accent_hit_particle_fx_spawn params = {fx_id = <fx_id> pos = <pos> player = <player> drum_index = <drum_index> container_id = <container_id>}
endscript

script drum_accent_hit_particle_fx_spawn 
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		clonematerial = mat_note_hit_xplosion1
		rgba = [255 255 255 255]
		pos = <pos>
		rot_angle = (0)
		scale = (1.0, 1.0)
		just = [center bottom]
		z_priority = 6
		blend = add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.005
		num_uv_frames = (4.0, 4.0)
	}
	wait \{16
		frames}
	destroyscreenelement id = <id>
endscript

script guitarevent_starpoweron 
	wait_for_correct_frame player = <player>
	killspawnedscript \{name = highway_pulse_black}
	if ($drum_solo_songtime_paused = 0)
		gh_star_power_verb_on player = <player>
	endif
	starpoweron player = <player>
	if ($current_num_players = 4)
		if (all_players_using_starpower)
			spawnscriptnow \{play_group_star_power_animation}
		endif
	endif
	hud_meter_glow_blue
endscript

script guitarevent_starpoweroff 
	wait_for_correct_frame player = ($<player_status>.player)
	killspawnedscript \{name = highway_pulse_black}
	if issingleplayergame
		soundevent \{event = star_power_release_center_gh4}
		soundevent \{event = star_power_release_front_gh4}
	else
		spawnscriptnow star_power_release_sfx_multiplayer params = {player = ($<player_status>.player)}
	endif
	gh_star_power_verb_off player = ($<player_status>.player)
	spawnscriptnow rock_meter_star_power_off params = {player_text = <player_text>}
	spawnscriptlater kill_starpower_stagefx params = {<...>}
	formattext checksumname = cont 'starpower_container_left%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formattext checksumname = cont 'starpower_container_right%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <cont>
		legacydoscreenelementmorph id = <cont> alpha = 0
	endif
	formattext checksumname = highway 'Highway_2D%p' p = <player_text> addtostringlookup = true
	if screenelementexists id = <highway>
		setscreenelementprops id = <highway> rgba = ($0x57e04d77)
	endif
	spawnscriptnow \{kill_starpower_camera}
	hud_meter_glow_hide_blue
endscript

script guitarevent_prefretbar 
	spawnscriptnow \{gh_audible_metronome}
	waittime = 0.18
	wait <waittime> seconds
	spawnscriptnow clapping_logic params = {<...>}
	spawnscriptnow \{crowd_anticipation}
endscript

script gh_audible_metronome 
	if ($debug_audible_metronome = 1)
		wait ((0.25 + (($default_lag_settings.xenon.input_lag_ms) * 0.001)) - 0.008333) seconds
		soundevent \{event = gh_sfx_beatsoundevent}
	endif
endscript

script guitarevent_fretbar 
	guitarevent_fretbar_cfunc
endscript

script guitarevent_fretbar_early 
endscript

script guitarevent_fretbar_late 
endscript

script check_first_note_formed 
	getsongtime
	<starttime> = (<songtime> - 0.0167)
	duration = ($<player_status>.check_time_early + $<player_status>.check_time_late)
	begin
	getheldpattern controller = ($<player_status>.controller) player = ($<player_status>.player) player_status = <player_status>
	if (<strum> = <hold_pattern>)
		playersetvolume player_status = <player_status> volume = 100
		updateguitarvolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
	endif
	waitonegameframe
	getsongtime
	if ((<songtime> - <starttime>) >= <duration>)
		break
	endif
	repeat
endscript

script guitarevent_firstnote_window_open 
	if isguitarcontroller controller = ($<player_status>.controller)
		getstrumpattern entry = 0 song = <song>
		spawnscriptnow check_first_note_formed params = {strum = <strum> player_status = <player_status>}
	else
		playersetvolume player_status = <player_status> volume = 100
		updateguitarvolume
		jam_update_volume volume = 100 player = ($<player_status>.player)
	endif
endscript
bluewhammyfxid01p1 = jow_nil
bluewhammyfxid02p1 = jow_nil
greenwhammyfxid01p1 = jow_nil
greenwhammyfxid02p1 = jow_nil
orangewhammyfxid01p1 = jow_nil
orangewhammyfxid02p1 = jow_nil
redwhammyfxid01p1 = jow_nil
redwhammyfxid02p1 = jow_nil
yellowwhammyfxid01p1 = jow_nil
yellowwhammyfxid02p1 = jow_nil
bluewhammyfxid01p2 = jow_nil
bluewhammyfxid02p2 = jow_nil
greenwhammyfxid01p2 = jow_nil
greenwhammyfxid02p2 = jow_nil
orangewhammyfxid01p2 = jow_nil
orangewhammyfxid02p2 = jow_nil
redwhammyfxid01p2 = jow_nil
redwhammyfxid02p2 = jow_nil
yellowwhammyfxid01p2 = jow_nil
yellowwhammyfxid02p2 = jow_nil

script destroy_allwhammyfx 
	whammyfxoffall \{player_status = player1_status}
	whammyfxoffall \{player_status = player2_status}
endscript

script guitarevent_whammyon 
	if (<player> = 1)
		lock = whammyon_lockp1
	else
		lock = whammyon_lockp2
	endif
	change globalname = <lock> newvalue = 1
	wait_for_correct_frame player = <player>
	whammyfxon <...>
	change globalname = <lock> newvalue = 0
endscript

script guitarevent_whammyoff 
	if (<player> = 1)
		lock = whammyon_lockp1
	else
		lock = whammyon_lockp2
	endif
	begin
	if NOT ($<lock>)
		break
	endif
	wait \{1
		gameframe}
	repeat
	wait_for_correct_frame player = <player>
	whammyfxoff <...>
endscript

script guitarevent_songfailed 
	if ($failed_song = 1)
		return
	endif
	change \{playing_song_for_real = 0}
	if ($game_mode = training || $game_mode = tutorial)
		return
	endif
	destroy_cameracut_ingame_menu
	if ($is_network_game)
		online_fail_song
	elseif ($game_mode = p2_battle)
		guitarevent_songwon \{battle_win = 1}
	else
		killspawnedscript \{name = guitar_jam_playback_recording}
		killspawnedscript \{name = guitar_jam_drum_playback}
		killspawnedscript \{name = jam_input_whammy_spawned}
		jam_stop_all_samples
		jam_deinit_reverb
		killspawnedscript \{name = guitarevent_songwon_spawned}
		if NOT scriptisrunning \{guitarevent_songfailed_spawned}
			spawnscriptnow \{guitarevent_songfailed_spawned}
		endif
	endif
endscript

script guitarevent_songfailed_spawned 
	disable_pause
	if ($is_attract_mode = 1)
		scriptassert \{'Song failure in attract mode, this is bad'}
		return
	endif
	if NOT ($boss_battle = 1)
		disable_highway_prepass
		disable_bg_viewport
	endif
	lightshow_songfailed
	if ($is_network_game)
		disable_pause
		if ($net_pause = 1)
			net_unpausegh
		endif
		mark_unsafe_for_shutdown
	endif
	getsongtimems
	change failed_song_time = <time>
	pausegame
	progression_songfailed
	if ($boss_battle = 1)
		disable_pause
		preload_movie = 'Player2_wins'
		killmovie \{textureslot = 1}
		formattext checksumname = 0xfe864fb1 '%s' s = <preload_movie>
		change g_you_rock_movie = <0xfe864fb1>
		formattext textname = winner_text qs(0x237c4f68) s = ($current_boss.character_name)
		winner_space_between = (50.0, 0.0)
		winner_scale = 1.0
		if ($current_boss.character_profile = morello)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = slash)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		if ($current_boss.character_profile = satan)
			<winner_space_between> = (40.0, 0.0)
			<winner_scale> = 1.0
		endif
		spawnscriptnow \{wait_and_play_you_rock_movie}
		wait \{0.2
			seconds}
		spawnscriptnow \{waitandkillhighway}
		spawnscriptnow create_exploding_text params = {parent = 'you_rock_physics' text = <winner_text>}
	endif
	unpausegame
	if ($is_network_game)
		ui_event_wait_for_safe
		disable_pause
	endif
	soundevent \{event = crowd_fail_song_sfx}
	soundevent \{event = $current_crowd_transition_neutral_to_bad_l}
	soundevent \{event = $current_crowd_transition_neutral_to_bad_r}
	soundevent \{event = gh_sfx_you_lose_single_player}
	disable_pause
	song_failed_show_highways
	playlossvideo
	transition_play \{type = songlost}
	transition_wait
	change \{current_transition = none}
	ui_event_wait_for_safe
	ui_event_get_top
	if NOT (<base_name> = 'gameplay')
		ui_event_block \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
	endif
	pausegame
	show_calibration = 0
	getglobaltags \{user_options
		param = has_calibrated}
	if (<has_calibrated> = 0)
	endif
	if ($special_event_stage != 0)
		<show_calibration> = 0
	endif
	gamemode_gettype
	if ($is_network_game = 0)
		ui_event_wait_for_safe
		wait \{1
			gameframe}
		if ui_event_exists_in_stack \{name = 'pausemenu'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = uistate_gameplay
				}}
		elseif ui_event_exists_in_stack \{name = 'song_unpause'
				above = 'gameplay'}
			ui_event_block \{event = menu_back
				data = {
					state = uistate_gameplay
				}}
		endif
		if (<show_calibration> = 1)
			setglobaltags \{user_options
				params = {
					has_calibrated = 1
				}}
			body = qs(0x24b45119)
			spawnscriptnow {
				ui_event {
					params = {
						event = menu_change
						data = {
							state = uistate_options_calibrate_lag_warning
							body = <body>
							cancel_script = menu_replace_to_fail_song
							yes_func_params = {go_back_script = menu_replace_to_fail_song}
						}
					}
				}
			}
		else
			spawnscriptnow \{ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_fail_song
					}
				}}
		endif
	elseif (<type> = career)
		ui_event_get_top
		if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
			spawnscriptnow \{ui_event
				params = {
					event = menu_replace
					data = {
						state = uistate_fail_song
					}
				}}
		else
			spawnscriptnow \{ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_fail_song
					}
				}}
		endif
	else
		ui_event_get_top
		if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
			spawnscriptnow \{ui_event
				params = {
					event = menu_replace
					data = {
						state = uistate_online_post_game_lobby
					}
				}}
		else
			spawnscriptnow \{ui_event
				params = {
					event = menu_change
					data = {
						state = uistate_online_post_game_lobby
					}
				}}
		endif
	endif
	if ($current_num_players = 1)
		soundevent \{event = crowd_fail_song_sfx}
		bg_crowd_front_end_silence \{immediate = 1}
	else
	endif
	if ($is_network_game)
		mark_safe_for_shutdown
	endif
	killspawnedscript \{name = create_exploding_text}
	destroy_exploding_text \{parent = 'you_rock_physics'}
	destroy_exploding_text \{parent = 'you_rock_2_physics'}
endscript
song_failed_x = 1

script song_failed_show_highways 
	if ($song_failed_x = 0)
		return
	endif
	if ($current_num_players = 1)
		return
	endif
	if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
		return
	endif
	if ($game_mode = p2_battle || $boss_battle = 1)
		return
	endif
	songunload
	pausegame
	wait \{0.5
		second}
	player = 1
	begin
	getplayerinfo <player> current_health
	if (<current_health> < $health_poor_medium)
		song_failed_highway_x {player = <player>}
	endif
	player = (<player> + 1)
	repeat $current_num_players
	soundevent \{event = band_failed_x_sfx}
	if NOT ($band1_status.star_power_active)
		if ($band1_status.star_power_amount > (100.0 / 6.0))
			wait \{0.3
				seconds}
			createscreenelement \{type = textblockelement
				id = 0x567f64ac
				parent = hud_root
				text = qs(0xdb96ac31)
				font = fontgrid_text_a8
				just = [
					center
					center
				]
				internal_just = [
					center
					center
				]
				z_priority = 400
				scale = 0.7
				pos = (640.0, 330.0)
				rgba = [
					255
					255
					255
					255
				]
				shadow
				dims = (1280.0, 720.0)}
		endif
	endif
	wait \{2.2
		seconds}
	unpausegame
endscript

script song_failed_highway_x 
	getplayerinfo <player> hud_parent
	getplayerinfo <player> part
	pos = (80.0, 40.0)
	switch <part>
		case vocals
		icon = band_hud_microphone2
		pos = (550.0, 80.0)
		case guitar
		icon = band_hud_guitar2
		case bass
		icon = band_hud_bass2
		case drum
		icon = band_hud_drums2
	endswitch
	if hud_root :desc_resolvealias name = <hud_parent> param = parent_id
		if screenelementexists id = <parent_id>
			createscreenelement {
				type = spriteelement
				parent = <parent_id>
				texture = <icon>
				just = [center center]
				z_priority = 400
				scale = 2
				pos = <pos>
				rgba = [255 0 0 255]
			}
		endif
	endif
endscript
gpulog_outputfilename = 'none'

script guitarevent_songwon \{battle_win = 0}
	change \{playing_song_for_real = 0}
	if ($output_gpu_log = 1)
		if isps3
			formattext \{textname = filename
				'%s_gpu_ps3'
				s = $current_level
				dontassertforchecksums}
		else
			formattext \{textname = filename
				'%s_gpu'
				s = $current_level
				dontassertforchecksums}
		endif
		if NOT stringequals \{a = $gpulog_outputfilename
				b = 'none'}
			<filename> = $gpulog_outputfilename
		endif
		textoutputend output_text filename = <filename>
	endif
	if ($output_song_stats = 1)
		formattext \{textname = filename
			'%s_stats'
			s = $current_song
			dontassertforchecksums}
		textoutputstart
		textoutput \{text = qs(0x3f02a90c)}
		formattext textname = text qs(0xfccb1331) s = ($player1_status.score) dontassertforchecksums
		textoutput text = <text>
		formattext textname = text qs(0x26c27108) n = ($player1_status.notes_hit) t = ($player1_status.total_notes) dontassertforchecksums
		textoutput text = <text>
		formattext textname = text qs(0xd67d4308) r = ($player1_status.best_run) dontassertforchecksums
		textoutput text = <text>
		formattext textname = text qs(0x6bb1c560) m = ($player1_status.max_notes) dontassertforchecksums
		textoutput text = <text>
		formattext textname = text qs(0x26a9ba16) b = ($player1_status.base_score) dontassertforchecksums
		textoutput text = <text>
		if (($player1_status.base_score) = 0)
			formattext \{textname = text
				qs(0x30357c57)}
		else
			formattext textname = text qs(0xbcc2e990) s = (($player1_status.score) / ($player1_status.base_score)) dontassertforchecksums
		endif
		textoutput text = <text>
		if (($player1_status.total_notes) = 0)
			formattext \{textname = text
				qs(0xc8e34ec5)}
		else
			formattext textname = text qs(0x2b87036c) s = ((($player1_status.notes_hit) / ($player1_status.total_notes)) * 100.0) dontassertforchecksums
		endif
		textoutput text = <text>
		textoutputend output_text filename = <filename>
	endif
	if screenelementexists \{id = metallifacts_container}
		ui_event_wait \{event = menu_back}
		return
	endif
	if ($current_num_players = 2)
		getsongtimems
		if ($last_time_in_lead_player = 0)
			change structurename = player1_status time_in_lead = ($player1_status.time_in_lead + <time> - $last_time_in_lead)
		elseif ($last_time_in_lead_player = 1)
			change structurename = player2_status time_in_lead = ($player2_status.time_in_lead + <time> - $last_time_in_lead)
		endif
		change \{last_time_in_lead_player = -1}
	endif
	if ($game_mode = p2_battle)
		if NOT (<battle_win> = 1)
			change \{save_current_powerups_p1 = $current_powerups_p1}
			change \{save_current_powerups_p2 = $current_powerups_p2}
			change structurename = player1_status save_num_powerups = ($player1_status.current_num_powerups)
			change structurename = player2_status save_num_powerups = ($player2_status.current_num_powerups)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			change structurename = player1_status save_health = <p1_health>
			change structurename = player2_status save_health = <p2_health>
			battlemode_killspawnedscripts
			if screenelementexists \{id = battlemode_container}
				destroyscreenelement \{id = battlemode_container}
			endif
			change \{battle_do_or_die = 1}
			change battle_do_or_die_speed_scale = ($battle_do_or_die_speed_scale + $battle_do_or_die_speed_scale_increase)
			if ($battle_do_or_die_speed_scale < $hyperspeed_fastest)
				change \{battle_do_or_die_speed_scale = $hyperspeed_fastest}
			endif
			change battle_do_or_die_attack_scale = ($battle_do_or_die_attack_scale + $battle_do_or_die_attack_scale_increase)
			if ($battle_do_or_die_attack_scale > $battle_do_or_die_attack_scale_max)
				change \{battle_do_or_die_attack_scale = $battle_do_or_die_attack_scale_max}
			endif
		else
			battlemode_killspawnedscripts
			change \{battle_do_or_die = 0}
			change \{battle_do_or_die_speed_scale = 1.0}
			change \{battle_do_or_die_attack_scale = 1.0}
		endif
	endif
	killspawnedscript \{name = guitar_jam_playback_recording}
	killspawnedscript \{name = guitar_jam_drum_playback}
	killspawnedscript \{name = jam_input_whammy_spawned}
	jam_stop_all_samples
	jam_deinit_reverb
	killspawnedscript \{name = guitarevent_songfailed_spawned}
	if NOT scriptisrunning \{guitarevent_songwon_spawned}
		spawnscriptnow \{guitarevent_songwon_spawned}
	endif
	do_gh3_unpause
endscript

script guitarevent_songwon_spawned 
	change \{0x2368550f = 1}
	if ($is_attract_mode = 1)
		ui_event \{event = menu_back}
		return
	endif
	if NOT ($game_mode = p2_battle)
	endif
	change track_last_song = ($current_song)
	change \{calibrate_lag_failed_num = 0}
	change \{last_song_failed = none}
	change \{current_song_failed_num = 0}
	gamemode_gettype
	<end_session> = 0
	if (<type> = career)
		if progression_check_for_gig_end
			<end_session> = 1
		endif
	elseif (<type> = quickplay)
		if quickplay_end_of_gig_list
			<end_session> = 1
		endif
	endif
	onexitrun songwon_writeleaderboardstats params = {song_checksum = ($current_song) end_credits = ($end_credits) end_session = <end_session>}
	if ($is_network_game)
		mark_unsafe_for_shutdown
		if ($shutdown_game_for_signin_change_flag = 1)
			return
		endif
		if ($net_pause = 1)
			net_unpausegh
		endif
		if ($player2_present)
			sendnetmessage {
				type = net_win_song
				note_streak = ($player1_status.best_run)
				notes_hit = ($player1_status.notes_hit)
				total_notes = ($player1_status.total_notes)
			}
		endif
	endif
	if ($game_mode = training)
		return
	elseif ($game_mode = tutorial)
		return
	endif
	progression_endcredits_done
	0x79db87d7
	pausegame
	disable_pause
	ui_event_wait_for_safe
	0xf00f29a9
	ui_event_get_top
	if NOT (<base_name> = 'gameplay')
		ui_event_block \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
	endif
	if ($battle_do_or_die = 0)
		if ($game_mode = p1_career || $game_mode = p2_career || $game_mode = p2_coop || $game_mode = p1_quickplay || $game_mode = p2_quickplay || $game_mode = p3_career || $game_mode = p4_career || $game_mode = p3_quickplay || $game_mode = p4_quickplay)
			spawnscriptnow \{cheer_before_explosion}
		endif
	endif
	printf \{channel = sfx
		qs(0x86224445)
		s = $current_crowd_looping_bg_area_good}
	skate8_sfx_backgrounds_new_area \{bg_sfx_area = $current_crowd_looping_bg_area_good}
	crowd_surge_and_sustain_at_end_of_song
	spawnscriptnow \{you_rock_waiting_crowd_sfx}
	tie = false
	if ($battle_do_or_die = 1)
		soundevent \{event = do_or_die_sfx}
		winner_text = qs(0xd29a9f4b)
		winner_space_between = (65.0, 0.0)
		winner_scale = 1.8
	else
		if ($game_mode = p2_battle)
			p1_health = ($player1_status.current_health)
			p2_health = ($player2_status.current_health)
			if (<p2_health> > <p1_health>)
				winner = qs(0xcdaffbf0)
			else
				winner = qs(0x7340f937)
			endif
			if ($is_network_game)
				if (<p2_health> > <p1_health>)
					name = ($gamertag_1)
				else
					name = ($gamertag_0)
				endif
				setplayerinfo 1 save_health = <p1_health>
				setplayerinfo 2 save_health = <p2_health>
				formattext textname = winner_text qs(0xf361b577) s = <name>
				<text_pos> = (640.0, 240.0)
			else
				formattext textname = winner_text qs(0xe3029fec) s = <winner>
				if (<p2_health> = <p1_health>)
					winner_text = qs(0x43b33be2)
				endif
			endif
			winner_space_between = (50.0, 0.0)
			winner_scale = 1.5
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff)
			p1_score = ($player1_status.score)
			p2_score = ($player2_status.score)
			if (<p2_score> > <p1_score>)
				winner = qs(0xcdaffbf0)
			elseif (<p1_score> > <p2_score>)
				winner = qs(0x7340f937)
			else
				<tie> = true
			endif
			if (<tie> = true)
				winner_text = qs(0x43b33be2)
				winner_space_between = (15.0, 0.0)
				winner_scale = 0.5
				fit_dims = (100.0, 0.0)
			else
				if ($is_network_game)
					if (<p2_score> > <p1_score>)
						name = ($gamertag_1)
					else
						name = ($gamertag_0)
					endif
					formattext textname = winner_text qs(0xf361b577) s = <name>
					<text_pos> = (640.0, 240.0)
				else
					formattext textname = winner_text qs(0xe3029fec) s = <winner>
				endif
				winner_space_between = (50.0, 0.0)
				winner_scale = 1.5
			endif
		else
			if ($is_network_game = 1)
				opponent_score = ($band2_status.score)
				our_score = ($band1_status.score)
				if (<opponent_score> > <our_score>)
					winner_text = qs(0x7147fa8b)
					winner_space_between = (45.0, 0.0)
					fit_dims = (350.0, 0.0)
					winner_scale = 1.0
				else
					winner_text = qs(0x6f6d143d)
					winner_space_between = (45.0, 0.0)
					fit_dims = (350.0, 0.0)
					winner_scale = 1.0
				endif
			else
				winner_text = Random (@ qs(0xebdedfc6) @ qs(0xebdedfc6) )
				winner_space_between = (45.0, 0.0)
				fit_dims = (350.0, 0.0)
				winner_scale = 1.0
			endif
		endif
	endif
	spawnscriptnow \{waitandkillhighway}
	killspawnedscript \{name = jiggle_text_array_elements}
	spawnscriptnow \{wait_and_play_you_rock_movie}
	create_you_rock text = <winner_text>
	spawnscriptnow \{you_rock_sfx_end}
	text_pos = (640.0, 360.0)
	rock_legend = 0
	fit_dims = (350.0, 0.0)
	change \{old_song = none}
	if ($battle_do_or_die = 0)
		progression_songwon
		if ($current_transition = preencore)
			end_song
			unpausegame
			transition_play \{type = preencore}
			transition_wait
			change \{current_transition = none}
			pausegame
			ui_event_get_top
			if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
				ui_event \{event = menu_replace
					data = {
						state = uistate_song_breakdown
						for_encore = 1
						no_sound
					}}
			else
				generic_event_choose \{no_sound
					state = uistate_song_breakdown
					data = {
						for_encore = 1
					}}
			endif
			encore_transition = 1
		elseif ($current_transition = preboss)
			end_song
			unpausegame
			transition_play \{type = preboss}
			transition_wait
			change \{current_transition = none}
			pausegame
			change \{use_last_player_scores = 1}
			change old_song = ($current_song)
			change \{show_boss_helper_screen = 1}
			change \{net_ready_to_start = 0}
			spawnscriptnow \{start_boss}
			generic_event_back \{nosound
				state = uistate_gameplay}
			return
		else
			unpausegame
			if ($end_credits = 1 && $current_level = load_z_newyork)
				transition_play \{type = finalbandoutro}
			else
				if ($is_network_game = 0)
					transition_play \{type = songwon}
				else
					if ($game_mode = p4_pro_faceoff || $game_mode = p8_pro_faceoff)
						opponent_score = ($band2_status.score)
						our_score = ($band1_status.score)
						if (<opponent_score> > <our_score>)
							transition_play \{type = songlost}
						else
							transition_play \{type = songwon}
						endif
					else
						transition_play \{type = songwon}
					endif
				endif
			endif
			transition_wait
			change \{current_transition = none}
			pausegame
		endif
	else
		unpausegame
		transition_play \{type = songwon}
		killspawnedscript \{name = do_or_die_helper_text}
		if screenelementexists \{id = do_or_die_helper_container}
			destroyscreenelement \{id = do_or_die_helper_container}
		endif
		spawnscriptnow \{do_or_die_helper_text
			params = {
				parent_id = yourock_text
			}}
		wait \{0.1
			seconds}
		spawnscriptnow \{waitandkillhighway}
		wait \{6
			seconds}
		change \{current_transition = none}
		pausegame
	endif
	if ($battle_do_or_die = 1)
		printf \{qs(0x338c6d2b)}
		killspawnedscript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		if screenelementexists \{id = you_rock}
			destroyscreenelement \{id = you_rock}
		endif
		if ($is_network_game)
			if NOT (scriptisrunning sysnotify_handle_connection_loss)
				generic_event_choose \{state = uistate_play_song}
			endif
		else
			spawnscriptnow \{fail_song_menu_select_retry_song
				params = {
					do_or_die = 1
				}}
		endif
		killspawnedscript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		destroy_exploding_text \{parent = 'you_rock_2_physics'}
	elseif ($end_credits = 1 && $current_song = $final_credits_song)
		killspawnedscript \{name = create_exploding_text}
		destroy_exploding_text \{parent = 'you_rock_physics'}
		destroy_exploding_text \{parent = 'you_rock_2_physics'}
		change \{end_credits = 0}
		career_song_ended_select_quit \{for_credits_venue = 1}
		get_progression_globals ($current_progression_flag)
		get_movie_id_by_name movie = ($<tier_global>.end_movie)
		i = 1
		begin
		getplayerinfo <i> controller
		get_savegame_from_controller controller = <controller>
		setglobaltags <id> params = {unlocked = 1} savegame = <savegame>
		i = (<i> + 1)
		repeat ($current_num_players)
		get_movie_id_by_name movie = ($<tier_global>.end_movie)
		i = 1
		begin
		getplayerinfo <i> controller
		get_savegame_from_controller controller = <controller>
		setglobaltags <id> params = {unlocked = 1} savegame = <savegame>
		i = (<i> + 1)
		repeat ($current_num_players)
		ui_memcard_autosave \{event = menu_back
			state = uistate_gig_posters
			data = {
				all_active_players = true
			}}
	else
		killspawnedscript \{name = create_exploding_text}
		destroy_all_exploding_text
		if NOT gotparam \{encore_transition}
			if ($progression_beat_game_last_song = 1)
				ui_event \{event = menu_change
					data = {
						state = uistate_beat_game
					}}
			else
				loading_transition = 0
				gamemode_gettype
				if (<type> = career)
					stats_song_checksum = ($current_song)
					if progression_set_new_song_in_gig_list
						loading_transition = 1
					endif
				elseif (<type> = quickplay)
					stats_song_checksum = ($current_song)
					if quickplay_set_new_song_in_gig_list
						loading_transition = 1
						if ($current_song = jamsession && $track_last_song = jamsession)
							loading_transition = 0
						endif
					endif
				endif
				if (<loading_transition> = 1)
					change \{my_trans_flag = 1}
					ui_event_get_top
					if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
						ui_event \{event = menu_replace
							data = {
								state = uistate_song_breakdown
								0xaa56f464 = 1
								no_sound
							}}
					else
						generic_event_choose \{no_sound
							state = uistate_song_breakdown
							data = {
								0xaa56f464 = 1
							}}
					endif
				else
					if ($is_network_game = 1 && <type> != career)
						ui_event_get_top
						if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
							ui_event \{event = menu_replace
								data = {
									state = uistate_online_post_game_lobby
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_online_post_game_lobby
								}}
						endif
					else
						ui_event_get_top
						if (<base_name> = 'controller_disconnect' || <base_name> = 'pausemenu_quit_warning')
							ui_event \{event = menu_replace
								data = {
									state = uistate_song_breakdown
									gig_complete = 1
								}}
						else
							ui_event \{event = menu_change
								data = {
									state = uistate_song_breakdown
									gig_complete = 1
								}}
						endif
					endif
				endif
			endif
		endif
	endif
	if ($is_network_game)
		if (gotparam loading_transition)
			if (<loading_transition> = 0)
				mark_safe_for_shutdown
			endif
		else
			mark_safe_for_shutdown
		endif
	endif
	change \{0x2368550f = 0}
endscript

script songwon_writeleaderboardstats 
	requireparams \{[
			song_checksum
			end_session
		]
		all}
	printf \{qs(0x68e97bc9)}
	printstruct <...>
	if ($is_network_game = 1)
		if achievements_ischeatingautokick
			autokick_cheating = 1
		else
			autokick_cheating = 0
		endif
		if NOT ($cheat_alwaysslide = 1 || (<autokick_cheating> = 1))
			if ($game_mode = p2_career || $game_mode = p3_career || $game_mode = p4_career)
				if (<end_credits> = 1)
					netsessionfunc \{obj = session
						func = end_active_session}
				else
					net_write_single_player_stats song_checksum = <song_checksum> end_session = <end_session>
				endif
			else
				online_song_end_write_stats song_checksum = <song_checksum>
			endif
		else
			netsessionfunc \{obj = session
				func = end_active_session}
		endif
	else
		if ($game_mode = p2_battle || $is_attract_mode = 1 || $boss_battle = 1 || <end_credits> = 1)
			end_singleplayer_game
			if ($game_mode = p2_battle)
				spawnscriptnow \{xenon_singleplayer_session_complete_uninit
					params = {
						song_failed
					}}
			else
				spawnscriptnow \{xenon_singleplayer_session_complete_uninit}
			endif
		else
			if (<song_checksum> != jamsession)
				net_write_single_player_stats song_checksum = <song_checksum> end_session = <end_session>
			elseif (<song_checksum> = jamsession && <end_session> = 1)
				end_singleplayer_game
			endif
		endif
	endif
	if NOT (<end_credits> = 1)
		gamemode_gettype
		if (<type> = career)
			if ($is_network_game = 1)
				if ishost
					agora_update
				endif
			else
				agora_update
			endif
		endif
		if ($is_network_game = 1)
			if ishost
				agora_write_stats song_checksum = <song_checksum>
			endif
		elseif NOT ($boss_battle = 1)
			if NOT ($devil_finish)
				agora_write_stats song_checksum = <song_checksum>
			endif
		endif
	endif
endscript

script kill_you_rock_movie 
	killmovie \{textureslot = 1}
endscript

script do_or_die_helper_text 
	createscreenelement \{type = containerelement
		id = do_or_die_helper_container
		parent = root_window
		pos = (0.0, 0.0)}
	formattext \{checksumname = text_checksum
		'do_or_die_helper'}
	percent = ((((1.0 - $battle_do_or_die_speed_scale) * 100.0) * ($battle_do_or_die_speed_scale_percent / ((0.0 - $battle_do_or_die_speed_scale_increase) * 100.0))) + 100.0)
	percent = (<percent> + 0.5)
	casttointeger \{percent}
	formattext textname = text qs(0xeb050f05) d = <percent>
	createscreenelement {
		type = textelement
		id = <text_checksum>
		parent = do_or_die_helper_container
		pos = (640.0, 500.0)
		text = <text>
		font = fontgrid_text_a8
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	formattext \{checksumname = text_checksum2
		'do_or_die_helper2'}
	percent = ($battle_do_or_die_attack_scale * 100.0)
	casttointeger \{percent}
	formattext textname = text qs(0x4dbb2c86) d = <percent>
	createscreenelement {
		type = textelement
		id = <text_checksum2>
		parent = do_or_die_helper_container
		pos = (640.0, 540.0)
		text = <text>
		font = fontgrid_text_a8
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
	}
	wait \{5
		seconds}
	legacydoscreenelementmorph {
		id = <text_checksum>
		alpha = 0
		time = 1
	}
	legacydoscreenelementmorph {
		id = <text_checksum2>
		alpha = 0
		time = 1
	}
endscript

script boss_unlocked_text 
	createscreenelement \{type = containerelement
		id = boss_unlocked_text_container
		parent = root_window
		pos = (0.0, 0.0)}
	if ($current_song = bosstom)
		formattext \{textname = boss
			qs(0x99bce787)}
		pos = (634.0, 580.0)
	elseif ($current_song = bossslash)
		pos = (634.0, 580.0)
		formattext \{textname = boss
			qs(0xd4b29c64)}
	elseif ($current_song = bossdevil)
		pos = (800.0, 580.0)
		formattext \{textname = boss
			qs(0x88f8861c)}
	endif
	formattext \{textname = unlocked
		qs(0xcdb78f2b)}
	formattext \{textname = visit_store
		qs(0xb1aaa21c)}
	formattext textname = text qs(0xa7492276) s = <boss> b = <unlocked> v = <visit_store>
	formattext \{checksumname = boss_unlocked
		'boss_unlocked'}
	if screenelementexists id = <boss_unlocked>
		destroyscreenelement id = <boss_unlocked>
	endif
	createscreenelement {
		type = textelement
		id = <boss_unlocked>
		parent = boss_unlocked_text_container
		pos = <pos>
		text = <text>
		font = fontgrid_text_a11
		scale = 0.8
		rgba = [255 255 255 255]
		just = [center bottom]
		z_priority = 500
		shadow
		shadow_offs = (1.0, 1.0)
		shadow_rgba = [0 0 0 255]
	}
	wait \{3
		seconds}
	if screenelementexists id = <boss_unlocked>
		legacydoscreenelementmorph {
			id = <boss_unlocked>
			alpha = 0
			time = 1
		}
	endif
endscript
g_you_rock_movie = none

script create_you_rock_effect \{player_status = player1_status}
	printf \{qs(0xd42f6229)
		a = $g_you_rock_movie}
	switch ($g_you_rock_movie)
		case player1_wins
		case player2_wins
		case fret_flames
		case 0xeed48f7d
		case 0x9baf39b8
		case golden_guitar
		default
	endswitch
	pos_table = ($highway_pos_table [(($<player_status>.player) -1)])
endscript

script wait_and_play_you_rock_movie 
	if ($is_network_game = 1)
		if ($player2_present = 1)
			create_you_rock_effect
		endif
	else
		create_you_rock_effect
	endif
endscript

script waitandkillhighway 
	wait \{0.5
		seconds}
	disable_bg_viewport
endscript
current_song_time = -1
time_to_next_beat = -1
next_beat_time = -1
time_to_next_beat2 = -1
next_beat_time2 = -1
tempo_iterator_offset = 0
time_offset = 0

script tempo_matching_iterator 
	printf qs(0x267f53bc) d = <time_offset>
	change time_offset = <time_offset>
	band_enabletempoiterator
endscript
measure_callback = nullscript
beat_callback = nullscript

script setmeasurecallback 
	if gotparam \{callback}
		change measure_callback = <callback>
	else
	endif
endscript

script clearmeasurecallbacks 
	change \{measure_callback = nullscript}
endscript

script setbeatcallback 
	if gotparam \{callback}
		change beat_callback = <callback>
	else
	endif
endscript

script gettimetonextbeat 
	getsongtimems \{time_offset = $tempo_iterator_offset}
	return time_to_next_beat = ($next_beat_time - <time>)
endscript

script clearbeatcallbacks 
	change \{beat_callback = nullscript}
endscript

script spawn_measure_callbacks 
	spawnscriptnow \{$measure_callback}
endscript

script spawn_beat_callbacks 
	spawnscriptnow $beat_callback params = {time_to_next_beat = <time_to_next_beat>}
endscript

script measure_test_script 
	printf \{channel = tempo
		qs(0x579a2ed4)}
endscript

script beat_test_script 
	printf channel = tempo qs(0x96bdbc92) a = <time_to_next_beat>
endscript

script guitarevent_starsequencebonus 
	wait_for_correct_frame player = ($<player_status>.player)
	if ($is_attract_mode = 1)
		return
	endif
	change structurename = <player_status> sp_phrases_hit = ($<player_status>.sp_phrases_hit + 1)
	if issingleplayergame
		soundevent \{event = star_power_awarded_sfx}
	else
		spawnscriptnow star_power_awarded_sfx_multiplayer params = {player = ($<player_status>.player)}
	endif
	formattext checksumname = container_id 'gem_container%p' p = ($<player_status>.text) addtostringlookup = true
	player = ($<player_status>.player)
	player = (<player> - 1)
	getarraysize \{$gem_colors}
	inputarraygetelement name = <song> index = <array_entry>
	destroy_big_bolt {player_status = <player_status> gem_array = <gem_array>}
	gem_count = 0
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		if (<gem_count> = (<array_size> -1))
			if gotparam \{got_one}
				break
			endif
		else
			got_one = 1
		endif
		color = ($gem_colors [<gem_count>])
		if ($<player_status>.lefthanded_button_ups = 1)
			<pos2d> = (($button_up_models [<player>]).<color>.left_pos_2d)
			<angle> = (($button_models [<player>]).<color>.angle)
		else
			<pos2d> = (($button_up_models [<player>]).<color>.pos_2d)
			<angle> = (($button_models [<player>]).<color>.left_angle)
		endif
		formattext checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		if NOT screenelementexists id = <name>
			createscreenelement {
				type = spriteelement
				id = <name>
				parent = <container_id>
				material = sys_big_bolt01_sys_big_bolt01
				blend = add
				use_animated_uvs = true
				top_down_v
				frame_length = 0.005
				num_uv_frames = (8.0, 1.0)
				rgba = [255 255 255 255]
				pos = <pos2d>
				rot_angle = <angle>
				scale = $star_power_bolt_scale
				just = [center bottom]
				z_priority = 6
			}
		endif
		waitonegameframe
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
	wait \{$star_power_bolt_time
		seconds}
	destroy_big_bolt {player_status = <player_status> gem_array = <gem_array> kill_when_empty = kill_when_empty}
endscript

script destroy_big_bolt 
	gem_count = 0
	getarraysize \{$gem_colors}
	begin
	<note> = (<gem_array> [(<gem_count> + 1)])
	if (<note> > 0)
		formattext checksumname = name 'big_bolt%p%e' p = ($<player_status>.text) e = <gem_count> addtostringlookup = true
		destroyscreenelement id = <name>
	endif
	gem_count = (<gem_count> + 1)
	repeat <array_size>
endscript

script guitarevent_multiplier4xoff 
	soundevent \{event = ui_sfx_lose_multiplier_4x}
	soundevent \{event = lose_multiplier_crowd}
	spawnscriptnow highway_pulse_multiplier_loss params = {player = ($<player_status>.player) player_text = ($<player_status>.text) multiplier = 4}
endscript

script guitarevent_multiplier3xoff 
	soundevent \{event = ui_sfx_lose_multiplier_3x}
	spawnscriptnow highway_pulse_multiplier_loss params = {player = ($<player_status>.player) player_text = ($<player_status>.text) multiplier = 3}
endscript

script guitarevent_multiplier2xoff 
	soundevent \{event = ui_sfx_lose_multiplier_2x}
	spawnscriptnow highway_pulse_multiplier_loss params = {player = ($<player_status>.player) player_text = ($<player_status>.text) multiplier = 2}
endscript

script guitarevent_killsong \{loadingtransition = 0}
	gh3_sfx_stop_sounds_for_killsong <...> loading_transition = <loading_transition>
endscript

script guitarevent_entervenue 
	getpakmancurrentname \{map = zones}
	formattext checksumname = echo_params 'Echo_Crowd_Buss_%s' s = <pakname>
	formattext checksumname = reverb_params 'Reverb_Crowd_Buss_%s' s = <pakname>
	if NOT globalexists name = <echo_params>
		echo_params = echo_crowd_buss_default_semiwet
	endif
	if NOT globalexists name = <reverb_params>
		reverb_params = reverb_crowd_buss_default_semiwet
	endif
	setsoundbusseffects effect = [{$<echo_params>}]
	setsoundbusseffects effect = [{$<reverb_params>}]
endscript

script guitarevent_exitvenue 
	setsoundbusseffects \{effect = [
			{
				$echo_dry
			}
		]}
	setsoundbusseffects \{effect = [
			{
				$reverb_dry
			}
		]}
endscript

script guitarevent_gemstarpoweron 
endscript

script guitarevent_battleattackfinished 
	gh3_battle_attack_finished_sfx <...>
endscript

script guitarevent_transitionintro 
endscript

script guitarevent_transitionfastintro 
endscript

script guitarevent_transitionpreencore 
endscript

script guitarevent_transitionencore 
endscript

script guitarevent_transitionpreboss 
endscript

script guitarevent_transitionboss 
endscript

script kick_fade_effect 
	obj_getid
	<objid> :se_setprops alpha = 0 time = <t2> anim = fast_out rgba = [200 , 70 , 255 , 255]
	<objid> :se_waitprops
	destroyscreenelement id = <objid>
endscript

script kick_grow_effect 
	obj_getid
	<objid> :se_setprops scale = <scale> time = 0.25 anim = fast_out
endscript
kick_index = 0
kick_fx_index = 0
kick_fx_scale = 1.0
kick_fx_scale_3p = 1.2
kick_fx_scale_end = (1.25, 0.0)

script guitarevent_kick_drum_hit_note \{player = 1}
	formattext checksumname = container_id 'gem_container%p' p = <player_text> addtostringlookup = true
	change kick_index = ($kick_index + 1)
	if ($kick_index > 1024)
		change \{kick_index = 0}
	endif
	<highway_info> = ($highway_pos_table [<player> -1])
	if (<highway_info>.nowbar_scale_x < 1.3)
		<x_scale> = (<highway_info>.nowbar_scale_x * ($kick_fx_scale_3p))
	else
		<x_scale> = (<highway_info>.nowbar_scale_x * ($kick_fx_scale))
	endif
	<particle_pos> = (640.0, 640.0)
	formattext checksumname = fx_id 'kick_fx_%p_i%d' p = <player> d = ($kick_fx_index)
	destroyscreenelement id = <fx_id>
	createscreenelement {
		type = containerelement
		id = <fx_id>
		parent = <container_id>
		pos = <particle_pos>
		z_priority = 8.0
		just = [center center]
		pos_anchor = [center center]
		alpha = 1.0
	}
	createscreenelement {
		type = containerelement
		local_id = grow_container
		parent = <fx_id>
		pos = (0.0, 0.0)
		just = [center center]
		pos_anchor = [center center]
	}
	<grow_id> = <id>
	<start_scale> = (<x_scale> * (1.0, 0.0) + (0.0, 1.0))
	<end_scale> = (<x_scale> * ($kick_fx_scale_end) + (0.0, 2.5))
	createscreenelement {
		type = spriteelement
		local_id = top_wave
		pos = (0.0, 0.0)
		texture = 0x06c143ed
		parent = <grow_id>
		rgba = [255 255 255 255]
		blend = add
		scale = <start_scale>
		alpha = 1.0
	}
	runscriptonscreenelement id = <fx_id> kick_fade_effect params = {t1 = 0.15 t2 = 0.25}
	runscriptonscreenelement id = <grow_id> kick_grow_effect params = {scale = <end_scale>}
	change kick_fx_index = (($kick_fx_index) + 1)
	if (($kick_fx_index) = 10)
		change \{kick_fx_index = 0}
	endif
endscript

script guitarevent_hit_open_note 
	guitarevent_kick_drum_hit_note player = <player> player_text = <player_text>
endscript

script guitarevent_hit_easy_rhythm_note 
	guitarevent_kick_drum_hit_note player_text = <player_text>
endscript

script playersetvolume 
	if gotparam \{volume}
		if (($<player_status>.part) = drum)
			if gotparam \{drum}
				switch <drum>
					case 1
					change structurename = <player_status> drum_volume1 = <volume>
					case 2
					change structurename = <player_status> drum_volume2 = <volume>
					case 3
					change structurename = <player_status> drum_volume1 = <volume>
					case 4
					change structurename = <player_status> drum_volume4 = <volume>
				endswitch
				return
			endif
		endif
		change structurename = <player_status> guitar_volume = <volume>
	endif
endscript

script playergetvolume 
	if (($<player_status>.part) = drum)
		if gotparam \{drum}
			switch <drum>
				case 1
				return volume = ($<player_status>.drum_volume1)
				case 2
				return volume = ($<player_status>.drum_volume2)
				case 3
				return volume = ($<player_status>.drum_volume1)
				case 4
				return volume = ($<player_status>.drum_volume4)
			endswitch
		endif
	endif
	return volume = ($<player_status>.guitar_volume)
endscript

script create_you_rock \{text = qs(0x6f6d143d)}
	if screenelementexists \{id = you_rock}
		destroyscreenelement \{id = you_rock}
	endif
	createscreenelement \{parent = root_window
		id = you_rock
		type = descinterface
		desc = 'you_rock'
		z_priority = 0}
	you_rock :obj_spawnscriptnow anim_you_rock params = {text = <text>}
endscript

script anim_you_rock 
	setscriptcannotpause
	you_rock :se_getprops \{arm_pos}
	<org_arm_pos> = <arm_pos>
	you_rock :se_getprops \{text_pos}
	<org_text_pos> = <text_pos>
	you_rock :se_getprops \{text_scale}
	<org_text_scale> = <text_scale>
	you_rock :se_setprops \{orange_borders_scale = (4.3, 4.4)}
	you_rock :se_setprops \{arm_pos = {
			(0.0, 500.0)
			relative
		}}
	wait \{0.083
		seconds}
	you_rock :se_setprops \{orange_borders_scale = (1.3, 1.4)
		time = 0.1
		motion = ease_in}
	you_rock :se_setprops arm_pos = (<org_arm_pos> - (0.0, 120.0)) time = 0.1 arm_rot_angle = 85 motion = ease_in
	you_rock :se_setprops \{arm_scale = (2.0, 2.0)
		time = 0.1
		motion = smooth}
	you_rock :se_waitprops
	you_rock :se_setprops arm_pos = (<org_arm_pos> - (0.0, 100.0)) time = 0.3 motion = ease_in
	you_rock :se_setprops \{arm_scale = (1.6, 1.6)
		time = 0.1
		motion = smooth}
	you_rock :se_waitprops
	you_rock :se_setprops \{orange_borders_scale = (1.4, 1.5)
		time = 0.1
		motion = ease_in}
	you_rock :se_setprops \{orange_borders_scale = (1.4, 1.5)
		time = 0.1
		motion = ease_in}
	you_rock :se_setprops arm_pos = <org_arm_pos> time = 0.2 motion = smooth
	you_rock :se_waitprops
	you_rock :se_setprops \{black_solid_alpha = 0.5}
	obj_spawnscriptnow \{orange_border_blur}
	begin
	<random_x> = Random (@ 10 @ -5 @ 10 @ -45 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	you_rock :se_setprops arm_pos = <new_arm_pos> time = 0.02 motion = Random (@ ease_in @ ease_out )
	you_rock :se_waitprops
	repeat 5
	you_rock :se_setprops \{arm_rot_angle = 85
		time = 0.03}
	begin
	<random_x> = Random (@ 5 @ -15 @ 20 @ -32 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	you_rock :se_setprops arm_pos = <new_arm_pos> time = 0.01 motion = Random (@ ease_in @ ease_out )
	you_rock :se_waitprops
	repeat 5
	you_rock :se_setprops \{arm_rot_angle = 90
		time = 0.03}
	begin
	<random_x> = Random (@ 5 @ -30 @ 2 @ -20 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	you_rock :se_setprops arm_pos = <new_arm_pos> time = 0.02 motion = Random (@ ease_in @ ease_out )
	you_rock :se_waitprops
	repeat 5
	begin
	<random_x> = Random (@ 10 @ -5 @ 2 @ -10 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	you_rock :se_setprops arm_pos = <new_arm_pos> time = 0.01 motion = Random (@ ease_in @ ease_out )
	you_rock :se_waitprops
	repeat 5
	begin
	<random_x> = Random (@ 10 @ -30 @ 20 @ -20 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	you_rock :se_setprops arm_pos = <new_arm_pos> time = 0.02 motion = Random (@ ease_in @ ease_out )
	you_rock :se_waitprops
	repeat 2
	you_rock :se_setprops arm_pos = (<org_arm_pos> + ((1.0, 0.0) * 50)) arm_rot_angle = 110
	you_rock :se_setprops \{left_rope_pos = (180.0, 250.0)}
	you_rock :se_setprops \{broken_left_rope_alpha = 1}
	you_rock :se_setprops \{left_rope_pos = (500.0, 500.0)}
	you_rock :se_waitprops
	you_rock :se_setprops arm_pos = (<org_arm_pos> - (-250.0, 50.0)) time = 0.02 motion = smooth
	you_rock :se_waitprops
	you_rock :se_setprops arm_pos = (<org_arm_pos> - (-200.0, 50.0)) arm_rot_angle = 90 time = 0.1 motion = ease_in
	wait \{0.3
		seconds}
	begin
	<random_x> = Random (@ 10 @ -30 @ 32 @ -20 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	you_rock :se_setprops arm_pos = <new_arm_pos> time = 0.01 motion = Random (@ ease_in @ ease_out )
	you_rock :se_waitprops
	repeat 1
	begin
	<random_x> = Random (@ 5 @ -5 @ 5 @ -5 @ 0 )
	<new_arm_pos> = (<org_arm_pos> + ((1.0, 0.0) * <random_x>))
	you_rock :se_setprops arm_pos = <new_arm_pos> time = 0.01 motion = Random (@ ease_in @ ease_out )
	you_rock :se_waitprops
	repeat 2
	you_rock :se_setprops arm_pos = (<org_arm_pos> - (10.0, 50.0)) arm_rot_angle = 80
	you_rock :se_setprops \{right_rope_pos = (500.0, 500.0)}
	you_rock :se_setprops \{broken_right_rope_alpha = 1}
	you_rock :se_setprops arm_pos = (<org_arm_pos> - (310.0, 50.0)) time = 0.02 motion = smooth
	you_rock :se_waitprops
	you_rock :se_setprops arm_pos = (<org_arm_pos> - (300.0, 50.0)) time = 0.1 motion = ease_in
	you_rock :se_waitprops
	wait \{0.1
		seconds}
	you_rock :se_setprops \{arm_scale = (1.2, 1.2)
		time = 0.1
		motion = smooth}
	you_rock :se_setprops arm_pos = (<org_arm_pos> - (300.0, -175.0)) time = 0.1 motion = ease_in
	you_rock :se_waitprops
	you_rock :se_setprops \{arm_rot_angle = 110
		time = 0.03
		motion = ease_in}
	you_rock :se_setprops arm_pos = (<org_arm_pos> - (300.0, -450.0)) time = 0.05 motion = smooth
	you_rock :se_waitprops
	wait \{0.1
		seconds}
	you_rock :se_setprops arm_pos = (<org_arm_pos> - (300.0, -390.0)) time = 0.1 motion = smooth
	you_rock :se_waitprops
	you_rock :se_setprops \{arm_scale = (1.9499999, 1.9499999)
		time = 0.1
		motion = linear}
	you_rock :se_setprops \{you_rock_texture_alpha = 0.5
		time = 0.1}
	you_rock :se_setprops arm_pos = (<org_arm_pos> + (80.0, -60.0)) time = 0.01 motion = ease_in
	you_rock :se_waitprops
	you_rock :se_setprops \{text_alpha = 1}
	you_rock :se_setprops text_text = <text>
	you_rock :se_setprops \{orange_borders_scale = (4.3, 4.4)
		time = 0.1
		motion = linear}
	you_rock :se_setprops arm_pos = (<org_arm_pos> + (200.0, 900.0)) time = 0.35000002 motion = ease_in
	you_rock :se_waitprops
	you_rock :se_waitprops \{black_solid_alpha = 0}
	you_rock :se_waitprops
	killspawnedscript \{name = orange_border_blur}
	wait \{7.5
		seconds}
	die
endscript

script orange_border_blur 
	begin
	<blur_type> = Random (@ none @ half @ full )
	you_rock :se_waitprops
	switch <blur_type>
		case none
		you_rock :se_setprops \{orange_border_alpha = 1}
		you_rock :se_setprops \{orange_border_blur_alpha = 0}
		case half
		you_rock :se_setprops \{orange_border_alpha = 0.5}
		you_rock :se_setprops \{orange_border_blur_alpha = 1}
		case full
		you_rock :se_setprops \{orange_border_alpha = 0}
		you_rock :se_setprops \{orange_border_blur_alpha = 1}
	endswitch
	<time> = Random (@ 0.02 @ 0.01 @ 0.03 )
	wait <time> seconds
	repeat
endscript

script hot_start_achieved \{band = 0
		combo = 0}
	gamemode_gettype
	if (<type> = training)
		return
	endif
	if ($is_attract_mode = 1)
		return
	endif
	if (<player> = 1)
		printf \{channel = sfx
			qs(0x3f8e0b79)}
		if issingleplayergame
			pos = (640.0, 211.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_hotstart_singleplayer params = {combo = <combo>}
		elseif ($game_mode = p2_career || $game_mode = p2_quickplay)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_hotstart_p1 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_hotstart_p1 params = {combo = <combo>}
		else
			<s> = 0.35000002
			pos = (415.0, 170.0)
			spawnscriptnow gh_sfx_note_streak_p1 params = {combo = <combo>}
		endif
	else
		printf \{channel = sfx
			qs(0xa30807c8)}
		if ($game_mode = p2_career || $game_mode = p2_quickplay)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_p2 params = {combo = <combo>}
		elseif ($is_network_game && $game_mode = p2_coop)
			pos = (640.0, 170.0)
			<base_scale> = 1.0
			spawnscriptnow gh_sfx_note_streak_p2 params = {combo = <combo>}
		else
			<s> = 0.35000002
			pos = (865.0, 170.0)
			spawnscriptnow gh_sfx_note_streak_p2 params = {combo = <combo>}
		endif
	endif
	if NOT gamemode_isbandscoring
		getplayerinfo <player> part
		if (<part> = vocals)
			vocals_message_delayed {player = <player> text = qs(0x09a07a71) rgba = [255 172 64 255]}
		else
			hud_create_message player = <player> text = qs(0x09a07a71)
		endif
	elseif (<band> = 1)
		if gotparam \{players}
			hud_create_message band text = qs(0x09a07a71) style_script = hud_message_band_streak_style style_script_params = {players = <players>}
		else
			hud_create_message \{band
				text = qs(0x09a07a71)
				style_script = hud_message_band_streak_style
				style_script_params = {
					players = [
						1
						1
						1
						1
					]
				}}
		endif
	endif
endscript
