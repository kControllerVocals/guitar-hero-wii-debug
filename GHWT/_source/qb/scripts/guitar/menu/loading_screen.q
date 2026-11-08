loading_screen_tips = [
	$wii_loading_screen_tip6
	$wii_loading_screen_tip6
	$wii_loading_screen_tip7
	$wii_loading_screen_tip7
	$wii_loading_screen_tip8
	$wii_loading_screen_tip8
	$wii_loading_screen_tip9
	$wii_loading_screen_tip10
	$wii_loading_screen_tip11
	$wii_loading_screen_tip12
	$wii_loading_screen_tip13
	$wii_loading_screen_tip14
	$wii_loading_screen_tip15
	$wii_loading_screen_tip16
	$wii_loading_screen_tip17
	$wii_loading_screen_tip18
	$wii_loading_screen_tip19
	$wii_loading_screen_tip20
	$wii_loading_screen_tip21
	$wii_loading_screen_tip22
]
loading_screen_tips_guitar = [
	qs("Try holding down the button before the note reaches the strike line.")
	qs("For a long string of notes, try alternating the strum bar up and down.")
	qs("You can look even cooler tap strumming with the neck slider.")
	qs("Use a combination of tap wah and whammy to earn maximum cash.")
	qs("Slide your hand on the neck slider during long sustained notes to make a wah effect.")
	qs("It's cool to use both hands on the fret buttons during complex parts.  It's even cooler to use your feet!")
]
loading_screen_tips_drum = [
	$wii_loading_screen_drum_tip1
	$wii_loading_screen_drum_tip2
	$wii_loading_screen_drum_tip3
	$wii_loading_screen_drum_tip5
]
loading_screen_tips_vocals = [
	qs("Deep voice?  No problem.  Sing the song in any octave and you will be scored the same.")
	qs("Tip: Move away from the mic to breathe.")
	qs("Feel free to freestyle your own lyrics as long as they're on-time and on-pitch.")
	qs("Just like a real rock singer, enunciation doesn't really matter.  Pitch and timing are the most important things.")
	qs("Watch for glowing freeform sections - sing anything you want to the song's beat and pitch to earn bonus points.")
	qs("Bring the hype! When you see hands appear on the vocal highway, shout out to the crowd to boost your rock meter!")
]
loading_screen_tips_bass = [
	qs("Have you seen that bar in the middle of the highway?  That's an open strum.  Hit it by strumming without holding buttons.")
	qs("Try holding down the button before the note reaches the strike line.")
	qs("For a long string of notes, try alternating the strum bar up and down.")
]
loading_screen_tips_band = [
	qs("You're all in this together.  Once Star Power is ready, anybody in your band can activate it.")
	qs("Hitting note streaks together as a band will give the band a score bonus.")
	qs("If one of your bandmates is struggling they can pull from the Star Power meter to help themselves.")
	qs("When your highway edges glow brighter you're on a note streak. If your bandmates join you, you'll score bonus points.")
]
loading_screen_tips_jam = [
	$wii_loading_screen_tip1
	$wii_loading_screen_tip2
	$wii_loading_screen_tip3
	$wii_loading_screen_tip4
	$wii_loading_screen_tip5
]
loading_screen_tips_leaderboard = [
	qs("Are you the best around?  Is nothing gonna ever keep you down?")
	qs("Each song in the game has a leaderboard for each instrument, and for band play.")
	qs("Any time you download a new song you will be able to post a score onto that song's leaderboard.")
	qs("Get your personal Guitar Hero stats on the web. Visit community.guitarhero.com to find out how!")
]
loading_screen_ready = 0

script create_loading_screen \{mode = play_song
		jam_mode = 0
		force_predisplay = 0
		extra_wait = 0}
	printf \{'create_loading_screen'}
	change \{loading_screen_ready = 1}
	Menu_Music_Off \{setflag = 1}
	disable_pause
	if ($is_changing_levels = 1)
		return
	endif
	change \{is_changing_levels = 1}
	if ($guitar_motion_enable_test = 1)
		return
	endif
	if ScreenElementExists \{id = loading_screen_container}
		return
	endif
	mark_unsafe_for_shutdown
	loading_text = qs("LOADING...")
	GetRandomValue \{name = global_or_not
		a = 0
		b = 2
		Integer}
	if (<global_or_not> = 1)
		<tips_array> = ($loading_screen_tips)
	else
		if (<jam_mode> = 1)
			<tips_array> = ($loading_screen_tips_jam)
		elseif GotParam \{leaderboard}
			<tips_array> = ($loading_screen_tips_leaderboard)
			loading_text = qs("SEARCHING...")
		elseif ($current_num_players = 1)
			<part> = ($player1_status.part)
			switch <part>
				case guitar
				<tips_array> = ($loading_screen_tips_guitar)
				case drum
				<tips_array> = ($loading_screen_tips_drum)
				case Vocals
				<tips_array> = ($loading_screen_tips_vocals)
				case Bass
				<tips_array> = ($loading_screen_tips_bass)
				default
				<tips_array> = ($loading_screen_tips_guitar)
			endswitch
		else
			if (($game_mode = p2_battle) || ($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff))
				<tips_array> = ($loading_screen_tips)
			else
				<tips_array> = ($loading_screen_tips_band)
			endif
		endif
	endif
	if ($freestyle_in_flow = 1)
		fadetoblack \{off
			time = 0
			no_wait}
		generic_slot = -1
		human_guitarist = 0
		human_drummer = 0
		if is_guitarist_human
			<human_guitarist> = 1
		endif
		if has_valid_controller \{player = 1}
			if ($freestyle_player_data [1].instrument = Drums)
				<human_drummer> = 1
			endif
		endif
		if ((<human_guitarist> = 1) && (<human_drummer> = 1))
			GetRandomValue \{a = 0.0
				b = 1.0
				name = generic_chance}
			if (<generic_chance> < 0.25)
				GetRandomValue \{a = 0
					b = 1
					name = random_slot
					Integer}
				<generic_slot> = <random_slot>
			endif
		elseif (<human_guitarist> = 1)
			<generic_slot> = 0
		else
			<generic_slot> = 1
		endif
		if (<generic_slot> = 1)
			<tips_array> = ($wii_freestyle_loading_tips_generic)
		else
			<tips_array> = ($wii_freestyle_loading_tips_guitar)
		endif
	endif
	loading_text = qs("LOADING...")
	if GotParam \{leaderboard}
		loading_text = qs("SEARCHING...")
		<tips_array> = ($loading_screen_tips_leaderboard)
	endif
	GetArraySize <tips_array>
	GetRandomValue name = rand_num a = 0 b = (<array_size> - 1) Integer
	rand_tip = (<tips_array> [<rand_num>])
	if ($freestyle_in_flow = 1)
		if (<generic_slot> = 0)
			<tips_array> = ($wii_freestyle_loading_tips_generic)
		else
			<tips_array> = ($wii_freestyle_loading_tips_drums)
		endif
		GetArraySize <tips_array>
		GetRandomValue name = rand_num_drum a = 0 b = (<array_size> - 1) Integer
		rand_tip_drum = (<tips_array> [<rand_num_drum>])
		CreateScreenElement {
			type = DescInterface
			parent = root_window
			desc = 'loading_freestyle'
			id = loading_screen_container
			z_priority = 1000000
			loading_text = qs("")
			tip_text_guitar = <rand_tip>
			tip_text_drum = <rand_tip_drum>
		}
	else
		CreateScreenElement {
			type = DescInterface
			parent = root_window
			desc = 'loading'
			id = loading_screen_container
			z_priority = 1000000
			loading_text = <loading_text>
			tip_text = <rand_tip>
		}
	endif
	spawnscriptnow create_loading_screen_spawned params = {tip_text = <rand_tip> loading_text = <loading_text> mode = <mode> jam_mode = <jam_mode> force_predisplay = <force_predisplay> extra_wait = <extra_wait>}
endscript

script create_loading_screen_spawned 
	if ScreenElementExists \{id = loading_screen_background}
		DestroyScreenElement \{id = loading_screen_background}
	endif
	if ($freestyle_active)
		LoadPak \{'pak/loading_screen/loading_screen_freestyle.pak'
			heap = BottomUpHeap}
		CreateScreenElement \{type = SpriteElement
			parent = loading_screen_container
			id = loading_screen_background
			texture = freestyle_loading_background
			pos = (640.0, 360.0)
			just = [
				center
				center
			]
			dims = (1280.0, 720.0)
			z_priority = 4000}
	else
		LoadPak \{'pak/loading_screen/loading_screen.pak'
			heap = BottomUpHeap}
		CreateScreenElement \{type = SpriteElement
			parent = loading_screen_container
			id = loading_screen_background
			texture = loading_background
			pos = (640.0, 360.0)
			just = [
				center
				center
			]
			dims = (1280.0, 720.0)
			z_priority = 4000}
	endif
	if (<extra_wait> > 0)
		Wait <extra_wait> gameframes
	endif
	if (<mode> = restart_song || <force_predisplay> = 1)
		change \{loading_screen_ready = 0}
		PreDisplayLoadingScreen
	elseif (<jam_mode> = 1)
		SpawnScript \{menu_complete_transition
			params = {
				jam_mode
			}}
		return
	endif
	Wait \{4
		gameframes}
endscript

script menu_complete_transition 
	if ($loading_screen_ready = 1)
		if GotParam \{jam_mode}
			Wait \{2
				gameframes}
		endif
		PreDisplayLoadingScreen
		change \{loading_screen_ready = 0}
	endif
endscript

script destroy_loading_screen 
	printf \{'destroy_loading_screen'}
	change \{loading_screen_ready = 0}
	if ScreenElementExists \{id = loading_screen_container}
		printf \{qs("\LHit")
			channel = movie}
		if NOT ScriptIsRunning \{destroy_loading_screen_spawned}
			loading_screen_container :obj_spawnscript destroy_loading_screen_spawned params = <...>
		endif
	endif
	Hideloadingscreen
	if ($playing_song = 0 || $end_credits = 1)
		change \{is_changing_levels = 0}
	endif
	change \{is_changing_levels = 0}
	mark_safe_for_shutdown
	fadetoblack \{off
		time = 0
		no_wait}
endscript

script destroy_loading_screen_spawned \{time = 0.1}
	if ($playing_song = 1)
		Wait \{4
			gameframes}
	endif
	if ScreenElementExists \{id = loading_screen_background}
		DestroyScreenElement \{id = loading_screen_background}
	endif
	UnloadPak \{'pak/loading_screen/loading_screen.pak'}
	UnloadPak \{'pak/loading_screen/loading_screen_freestyle.pak'}
	printf \{'destroy_loading_screen'}
	GetTags
	stoprendering
	SE_SetProps \{alpha = 0}
	if NOT GotParam \{no_render}
		hide_glitch \{num_frames = 5}
	endif
	Die
endscript

script refresh_screen 
	destroy_loading_screen
	begin
	if NOT ScreenElementExists \{id = loading_screen_container}
		break
	endif
	Wait \{1
		gameframe}
	repeat
	create_loading_screen
endscript
