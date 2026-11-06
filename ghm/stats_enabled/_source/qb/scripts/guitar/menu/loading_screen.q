0x2c0a2ab0 = ''
0xa45fc02e = 0
0x4071e1a6 = false
0x6f0defbf = true
0x92287416 = false
0xebafbcc5 = 0
loading_screen_tips = [
	qs(0x8387d77c)
	qs(0x8387d77c)
	qs(0x7c0d7446)
	qs(0x7c0d7446)
	qs(0x3624ba2b)
	qs(0x3624ba2b)
	qs(0x6c6b4fff)
	qs(0x8a9f2a5b)
	qs(0xf7656a82)
	qs(0xc72fc9ea)
	qs(0x3204111f)
	qs(0xc726d351)
	qs(0x82be3076)
	qs(0x9718b7ad)
	qs(0x5d400e15)
	qs(0x621b7e2f)
	qs(0xae26ffb9)
	qs(0x0e7715a1)
]
loading_screen_tips_guitar = [
	qs(0x5b00d2a3)
	qs(0x3fbe71a3)
	qs(0x72a1a04b)
	qs(0x68314f9c)
	qs(0xf1b5a49c)
	qs(0x61524e4f)
]
loading_screen_tips_drum = [
	qs(0xa3aace6b)
	qs(0xef1bffec)
	qs(0xa731cc67)
	qs(0x531a838f)
]
loading_screen_tips_vocals = [
	qs(0xf074447f)
	qs(0x63dc2c6a)
	qs(0xdb4cd2d0)
	qs(0x7490e0eb)
	qs(0x6f12a948)
	qs(0x2f945279)
]
loading_screen_tips_bass = [
	qs(0xf87cba75)
	qs(0x5b00d2a3)
	qs(0x3fbe71a3)
]
loading_screen_tips_band = [
	qs(0x118abab2)
	qs(0x25ed2967)
	qs(0x268feb71)
	qs(0x8dd90fa9)
]
loading_screen_tips_jam = [
	qs(0x159e3e8e)
	qs(0x03ef2e43)
	qs(0xc6076817)
	qs(0x15072100)
	qs(0x79062d31)
]
loading_screen_tips_leaderboard = [
	qs(0xd65e620a)
	qs(0xe32a76ac)
	qs(0x91158596)
	qs(0x2bd8629d)
]
loading_screen_destroy_state = 'none'
0x8ea5d1e0 = 0

script create_loading_screen \{mode = play_song
		jam_mode = 0
		force_predisplay = 1
		0x166cbf04 = 0
		heap = heap_bink}
	printscriptinfo \{'create_loading_screen'}
	change \{0x8ea5d1e0 = 1}
	if NOT gotparam \{0xdf3c5641}
		menu_music_off \{setflag = 1}
	endif
	disable_pause
	if ($is_changing_levels = 1)
		return
	endif
	change \{is_changing_levels = 1}
	if ($guitar_motion_enable_test = 1)
		return
	endif
	if ($0x100b6016 = true)
		return
	endif
	change \{0x4071e1a6 = true}
	if screenelementexists \{id = loading_screen_container}
		return
	endif
	if ($0x92287416 = false)
		change \{0x92287416 = true}
		0x79db87d7
		0x6f5e5f74
	endif
	mark_unsafe_for_shutdown
	desc = 'loading'
	change \{0x2c0a2ab0 = 'pak/ui/loading_screen.pak'}
	loading_text = qs(0xfab8f6e7)
	if (($invite_controller > -1) || ($signin_change_happening = 1))
	else
		if (($game_mode) = p1_career)
			if NOT progression_check_intro_complete
				<part> = ($player1_status.part)
				switch <part>
					case guitar
					case bass
					desc = 'instruction_loading_guitar'
					change \{0x2c0a2ab0 = 'pak/ui/instruction_loading_screen_guitar.pak'}
					case drum
					desc = 'instruction_loading_drums'
					change \{0x2c0a2ab0 = 'pak/ui/instruction_loading_screen_drums.pak'}
					case vocals
					desc = 'instruction_loading_vocals'
					change \{0x2c0a2ab0 = 'pak/ui/instruction_loading_screen_vocals.pak'}
				endswitch
				green_text = qs(0x494b4d7f)
				red_text = qs(0x9d57d378)
			endif
		elseif ((($game_mode) = p2_career) || (($game_mode) = p3_career) || (($game_mode) = p4_career))
			if NOT progression_check_intro_complete
				desc = 'instruction_loading_band'
				change \{0x2c0a2ab0 = 'pak/ui/instruction_loading_screen_band.pak'}
			endif
		elseif ($game_mode = p4_pro_faceoff)
			desc = 'loading_online'
			change \{0x2c0a2ab0 = 'pak/ui/loading_online.pak'}
		endif
	endif
	getrandomvalue \{name = global_or_not
		a = 0
		b = 2
		integer}
	if (<global_or_not> = 1)
		<tips_array> = ($loading_screen_tips)
	else
		if (<jam_mode> = 1)
			<tips_array> = ($loading_screen_tips_jam)
		elseif gotparam \{leaderboard}
			<tips_array> = ($loading_screen_tips_leaderboard)
		elseif ($current_num_players = 1)
			<part> = ($player1_status.part)
			switch <part>
				case guitar
				<tips_array> = ($loading_screen_tips_guitar)
				case drum
				<tips_array> = ($loading_screen_tips_drum)
				case vocals
				<tips_array> = ($loading_screen_tips_vocals)
				case bass
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
	if gotparam \{leaderboard}
		loading_text = qs(0x10ce7efd)
	endif
	getarraysize <tips_array>
	getrandomvalue name = rand_num a = 0 b = (<array_size> - 1) integer
	rand_tip = (<tips_array> [<rand_num>])
	if screenelementexists \{id = loading_screen_container}
		destroyscreenelement \{id = loading_screen_container}
	endif
	if ispakloaded \{$0x2c0a2ab0
			heap = bottomupheap}
		unloadpak \{$0x2c0a2ab0
			heap = bottomupheap}
		begin
		if NOT ispakloaded \{$0x2c0a2ab0
				heap = bottomupheap}
			break
		endif
		wait \{0.5
			seconds}
		repeat
	endif
	loadpak \{$0x2c0a2ab0
		heap = bottomupheap}
	change \{0xa45fc02e = 1}
	createscreenelement {
		type = descinterface
		parent = root_window
		desc = <desc>
		id = loading_screen_container
		z_priority = 500000
		tip_text = <rand_tip>
	}
	if gotparam \{destroy_state}
		change loading_screen_destroy_state = <destroy_state>
	else
		change \{loading_screen_destroy_state = 'none'}
	endif
	spawnscriptnow create_loading_screen_spawned params = {mode = <mode> jam_mode = <jam_mode> force_predisplay = <force_predisplay> 0x166cbf04 = <0x166cbf04> heap = <heap>}
	if gotparam \{wait}
		begin
		if NOT scriptisrunning \{create_loading_screen_spawned}
			break
		endif
		waitonegameframe
		repeat
	endif
endscript

script create_loading_screen_spawned 
	requireparams \{[
			heap
		]
		all}
	if (<0x166cbf04> > 0)
		wait <0x166cbf04> gameframes
	endif
	if (<mode> = restart_song || <force_predisplay> = 1)
		change \{0x8ea5d1e0 = 0}
		wait \{4
			gameframes}
		0xb61d5c0c \{destroy = 0}
		if (<abort> = true)
			return
		endif
		0x8f537ab9 heap = <heap>
	elseif (<jam_mode> = 1)
		spawnscript \{menu_complete_transition
			params = {
				jam_mode
			}}
		return
	endif
endscript

script menu_complete_transition 
	if ($0x8ea5d1e0 = 1)
		if gotparam \{jam_mode}
			wait \{2
				gameframes}
		endif
		predisplayloadingscreen \{0x91f64d92 = 8
			0x2374ff6a = [
				'images/LoadingScreens/loading_animation%d.img.ngc'
			]
			x = [
				[
					-3.2
				]
			]
			y = [
				[
					64
				]
			]
			w = [
				[
					260
				]
			]
			h = [
				[
					369
				]
			]}
		change \{0x8ea5d1e0 = 0}
	endif
endscript

script destroy_loading_screen \{force = 0}
	printscriptinfo \{'destroy_loading_screen'}
	change \{0x8ea5d1e0 = 0}
	change \{0x4071e1a6 = false}
	if (<force> = 0)
		if NOT ($loading_screen_destroy_state = 'none')
			ui_event_get_top
			if NOT ($loading_screen_destroy_state = <base_name>)
				return
			endif
		endif
	endif
	if screenelementexists \{id = loading_screen_container}
		printf \{qs(0x2f19aa97)
			channel = movie}
		if NOT scriptisrunning \{destroy_loading_screen_spawned}
			loading_screen_container :obj_spawnscript destroy_loading_screen_spawned params = <...>
		endif
	else
		if ($0xebafbcc5 = 1)
			startrendering \{reason = loading_screen}
		endif
	endif
	change \{0xebafbcc5 = 0}
	if ($playing_song = 0 || $end_credits = 1)
		change \{is_changing_levels = 0}
	endif
	change \{is_changing_levels = 0}
	mark_safe_for_shutdown
	fadetoblack \{off
		time = 0
		no_wait}
	if ($0x92287416 = true)
		change \{0x92287416 = false}
		0xe68af10a
		0xf00f29a9
	endif
endscript

script destroy_loading_screen_spawned \{time = 0.1}
	if ($playing_song = 1)
		wait \{4
			gameframes}
	endif
	0xb61d5c0c \{destroy = 1}
	if (<abort> = true)
		return
	endif
	get_home_button_allowed
	if (<disabled> = 0)
		change \{0x6f0defbf = true}
	else
		change \{0x6f0defbf = false}
	endif
	set_home_button_notallowed
	hideloadingscreen
	unloadpak \{$0x2c0a2ab0}
	change \{0x2c0a2ab0 = ''}
	gettags
	stoprendering \{reason = loading_screen}
	se_setprops \{alpha = 0}
	startrendering \{reason = loading_screen}
	if NOT gotparam \{no_render}
		hide_glitch \{num_frames = 5}
	endif
	die
	if ($0x6f0defbf = true)
		set_home_button_allowed
	endif
	change \{0xa45fc02e = 0}
endscript

script 0x928a98c9 
	if 0x8658e568
		destroy_loading_screen \{force = 1}
		begin
		if NOT 0x8658e568
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script refresh_screen 
	destroy_loading_screen
	begin
	if NOT screenelementexists \{id = loading_screen_container}
		break
	endif
	wait \{1
		gameframe}
	repeat
	create_loading_screen
endscript

script 0x8658e568 
	if 0xcbca19f9
		return \{true}
	endif
	return \{false}
endscript

script 0xcbca19f9 
	if screenelementexists \{id = loading_screen_container}
		return \{true}
	endif
	return \{false}
endscript

script 0x18954ab6 
	if 0xcbca19f9
		return \{true}
	endif
	if 0x16cc1b60
		return \{true}
	endif
	return \{false}
endscript

script 0xb61d5c0c 
	0xfea69e6a = 0
	begin
	if NOT screenelementexists \{id = loading_screen_container}
		return \{abort = true}
	endif
	if ($0x4071e1a6 = false)
		if (<destroy> = 0)
			return \{abort = true}
		endif
	endif
	if ($0x4071e1a6 = true)
		if (<destroy> != 0)
			return \{abort = true}
		endif
	endif
	if renderingenabled
		0xfea69e6a = (<0xfea69e6a> + 1)
		if (<0xfea69e6a> > 2)
			return \{abort = false}
		endif
	else
		<0xfea69e6a> = 0
	endif
	wait \{1
		gameframe}
	repeat
endscript

script 0x8f537ab9 
	requireparams \{[
			heap
		]
		all}
	if progression_check_intro_complete
		0xfa49b57f = true
	else
		0xfa49b57f = false
	endif
	if ((($game_mode) = p1_career) && (<0xfa49b57f> = false))
		predisplayloadingscreen {
			0x91f64d92 = 5
			0x2374ff6a = ['images/LoadingScreens/instruction_loading_animation%d.img.ngc']
			x = [[65.3 , 123 , 175 , 229.5 , 280.5]]
			y = [[314.21103 , 319.811 , 320.43298 , 323.544 , 326.033]]
			w = [[35 , 35 , 35 , 35 , 35]]
			h = [[41.687 , 41.687 , 41.687 , 41.687 , 41.687]]
			heap = <heap>
		}
	elseif (((($game_mode) = p2_career) || (($game_mode) = p3_career) || (($game_mode) = p4_career)) && (<0xfa49b57f> = false))
		predisplayloadingscreen {
			0x91f64d92 = 4
			0x2374ff6a = [
				'images/LoadingScreens/instruction_band_guitar_animation%d.img.ngc' ,
				'images/LoadingScreens/instruction_band_drums_animation%d.img.ngc' ,
				'images/LoadingScreens/instruction_band_vocals_animation%d.img.ngc'
			]
			x = [[151.5] , [371.5] , [531.5]]
			y = [[294.3] , [284.345] , [309.856]]
			w = [[60.5] , [60.5] , [60.5]]
			h = [[75.285995] , [75.285995] , [75.285995]]
			heap = <heap>
		}
	elseif ($game_mode = p4_pro_faceoff)
		predisplayloadingscreen {
			0x91f64d92 = 4
			0x2374ff6a = ['images/LoadingScreens/loading_online_animation%d.img.ngc']
			x = [[284]]
			y = [[70]]
			w = [[69.6]]
			h = [[87]]
			heap = <heap>
		}
	else
		predisplayloadingscreen {
			0x91f64d92 = 8
			0x2374ff6a = ['images/LoadingScreens/loading_animation%d.img.ngc']
			x = [[25.7]]
			y = [[64.4]]
			w = [[260]]
			h = [[364]]
			heap = <heap>
		}
	endif
endscript
