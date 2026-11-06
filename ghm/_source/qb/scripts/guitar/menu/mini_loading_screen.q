0x562e2f96 = {
	0x7897df41 = 0
	0xd777153f = 0
	0x41e00715 = 0
	fade_in_time = 0.15
	fade_out_time = 0.15
	0xbf23998d = 0.5
	pos = (640.0, 360.0)
	just = [
		center
		center
	]
	internal_just = [
		center
		center
	]
	z_priority = 200000
	background = {
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			center
			center
		]
		fade_in_time = 0.0
	}
	text = {
		pos = (-400.0, 200.0)
		just = [
			left
			center
		]
		delay = 1.5
		fade_in_time = 0.15
		0x6b8904f0 = qs(0x37f4c584)
	}
	watch_timer = {
		pos = (0.0, -600.0)
		delay = 2.5
		fade_in_time = 0.15
	}
	message = {
		pos = (-300.0, -100.0)
		just = [
			center
			center
		]
		delay = 3.5
		fade_in_time = 0.15
	}
}

script 0x16cc1b60 
	if ($0x562e2f96.0x7897df41 > 0)
		return true 0x7897df41 = ($0x562e2f96.0x7897df41)
	endif
	return false 0x7897df41 = ($0x562e2f96.0x7897df41)
endscript

script 0x99ad1fc1 
	if ($0x562e2f96.0x7897df41 = 0)
		change \{structurename = 0x562e2f96
			0x7897df41 = 1}
		change \{structurename = 0x562e2f96
			0xd777153f = 1}
		spawnscriptnow \{0xc147cd4b}
	endif
endscript

script 0xd8bd876f 
	if ($0x562e2f96.0x7897df41 > 0)
		change \{structurename = 0x562e2f96
			0x7897df41 = 0}
		change \{structurename = 0x562e2f96
			0x41e00715 = 1}
		spawnscriptnow \{0xc4e273cc}
	endif
endscript

script 0x10b35a47 
	if ($0x562e2f96.0x7897df41 < 100)
		if ($0x562e2f96.0x7897df41 = 0)
			0x99ad1fc1
		else
			change structurename = 0x562e2f96 0x7897df41 = ($0x562e2f96.0x7897df41 + 1)
		endif
	else
		printf \{'warning: stack overflow'}
	endif
endscript

script 0xdf9f604d 
	if ($0x562e2f96.0x7897df41 > 0)
		if ($0x562e2f96.0x7897df41 = 1)
			0xd8bd876f
		else
			change structurename = 0x562e2f96 0x7897df41 = ($0x562e2f96.0x7897df41 - 1)
		endif
	else
		printf \{'warning: stack underflow'}
	endif
endscript

script 0xabacc337 
	if ($0x562e2f96.0xd777153f > 0)
		return \{true}
	endif
	if ($0x562e2f96.0x41e00715 > 0)
		return \{true}
	endif
	return \{false}
endscript

script 0x628ef00f 
	begin
	if NOT 0xabacc337
		break
	endif
	waitonegameframe
	printf 'waiting for mini loading screen (show: %a, hide: %b)' a = ($0x562e2f96.0xd777153f) b = ($0x562e2f96.0x41e00715)
	repeat
endscript

script 0xc147cd4b 
	0x79db87d7
	0x6f5e5f74
	0x3c57ed08
	0x4ddc5c0f
	change \{structurename = 0x562e2f96
		0xd777153f = 0}
endscript

script 0xc4e273cc 
	0xdb4b4e25
	0x20ba4529
	0xe68af10a
	0xf00f29a9
	change \{structurename = 0x562e2f96
		0x41e00715 = 0}
endscript

script 0x3c57ed08 
	if NOT screenelementexists \{id = 0x6e4db611}
		createscreenelement {
			type = containerelement
			parent = root_window
			id = 0x6e4db611
			pos = ($0x562e2f96.pos)
			z_priority = ($0x562e2f96.z_priority)
			just = ($0x562e2f96.just)
			internal_just = ($0x562e2f96.internal_just)
		}
		createscreenelement {
			type = spriteelement
			parent = 0x6e4db611
			id = 0xb2884368
			texture = black
			z_priority = ($0x562e2f96.z_priority + 1)
			no_zwrite
			pos = ($0x562e2f96.background.pos)
			dims = ($0x562e2f96.background.dims)
			just = ($0x562e2f96.background.just)
			rgba = [0 0 0 255]
			alpha = 0.0
		}
		createscreenelement {
			type = textelement
			parent = 0x6e4db611
			id = 0x4629d70f
			pos = ($0x562e2f96.text.pos)
			z_priority = ($0x562e2f96.z_priority + 2)
			just = ($0x562e2f96.text.just)
			rgba = [127 127 127 255]
			alpha = 0.0
			scale = 1.0
			font = fontgrid_title_a1
			text = qs(0x00000000)
		}
		createscreenelement {
			type = descinterface
			parent = 0x6e4db611
			id = 0x62ed8a10
			pos = ($0x562e2f96.watch_timer.pos)
			z_priority = ($0x562e2f96.z_priority + 2)
			alpha = 0.0
			desc = 'watch_timer'
		}
		0x968edca4
		createscreenelement {
			type = textblockelement
			parent = 0x6e4db611
			id = 0xc1a795da
			pos = ($0x562e2f96.message.pos)
			z_priority = ($0x562e2f96.z_priority + 2)
			dims = (800.0, 400.0)
			rot_angle = -5
			just = ($0x562e2f96.message.just)
			internal_just = [center center]
			rgba = [128 64 64 250]
			alpha = 0.0
			scale = 0.55
			font = fontgrid_text_a6
			text = <message>
			single_line = false
			fit_width = wrap
			fit_height = `scale down if larger`
			scale_mode = proportional
		}
	endif
endscript

script 0x20ba4529 
	if screenelementexists \{id = 0x6e4db611}
		destroyscreenelement \{id = 0x6e4db611}
	endif
endscript

script 0x4ddc5c0f 
	if screenelementexists \{id = 0x6e4db611}
		0xb2884368 :obj_spawnscriptnow \{0xd1b27ca2}
		0x4629d70f :obj_spawnscriptnow \{0x36d6b169}
		0x62ed8a10 :obj_spawnscriptnow \{0x90f5699a}
		0xc1a795da :obj_spawnscriptnow \{0x967039b8}
		change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f + 1)
		wait ($0x562e2f96.0xbf23998d) seconds
		change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f - 1)
	endif
endscript

script 0xdb4b4e25 
	if screenelementexists \{id = 0x6e4db611}
		0xb2884368 :obj_killallspawnedscripts
		0x4629d70f :obj_killallspawnedscripts
		0x62ed8a10 :obj_killallspawnedscripts
		0xc1a795da :obj_killallspawnedscripts
		0x6e4db611 :se_setprops alpha = 0.0 time = ($0x562e2f96.fade_out_time)
		0x6e4db611 :se_waitprops
	endif
endscript

script 0xd1b27ca2 
	se_setprops alpha = 1.0 time = ($0x562e2f96.background.fade_in_time)
	se_waitprops
	change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f + 1)
	wait ($0x562e2f96.0xbf23998d) seconds
	change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f - 1)
endscript

script 0x36d6b169 
	se_setprops \{alpha = 0.0
		time = 0.0}
	wait ($0x562e2f96.text.delay) seconds
	se_setprops text = ($0x562e2f96.text.0x6b8904f0)
	se_setprops alpha = 1.0 time = ($0x562e2f96.text.fade_in_time)
	se_waitprops
	obj_spawnscriptnow \{0xfe27cc13}
	change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f + 1)
	wait ($0x562e2f96.0xbf23998d) seconds
	change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f - 1)
endscript

script 0xfe27cc13 
	begin
	se_setprops text = ($0x562e2f96.text.0x6b8904f0)
	wait \{0.5
		seconds}
	formattext textname = text '%s.' s = ($0x562e2f96.text.0x6b8904f0)
	se_setprops text = <text>
	wait \{0.5
		seconds}
	formattext textname = text '%s..' s = ($0x562e2f96.text.0x6b8904f0)
	se_setprops text = <text>
	wait \{0.5
		seconds}
	formattext textname = text '%s...' s = ($0x562e2f96.text.0x6b8904f0)
	se_setprops text = <text>
	wait \{0.5
		seconds}
	repeat
endscript

script 0x90f5699a 
	se_setprops \{alpha = 0.0
		time = 0.0}
	wait ($0x562e2f96.watch_timer.delay) seconds
	animate_watch_timer
	se_setprops alpha = 1.0 time = ($0x562e2f96.watch_timer.fade_in_time)
	se_waitprops
	change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f + 1)
	wait ($0x562e2f96.0xbf23998d) seconds
	change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f - 1)
endscript

script 0x967039b8 
	se_setprops \{alpha = 0.0
		time = 0.0}
	wait ($0x562e2f96.message.delay) seconds
	se_setprops alpha = 1.0 time = ($0x562e2f96.message.fade_in_time)
	se_waitprops
	change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f + 1)
	wait ($0x562e2f96.0xbf23998d) seconds
	change structurename = 0x562e2f96 0xd777153f = ($0x562e2f96.0xd777153f - 1)
endscript

script 0x968edca4 
	getrandomvalue \{name = global_or_not
		a = 0
		b = 2
		integer}
	if (<global_or_not> = 1)
		<tips_array> = ($loading_screen_tips)
	else
		if ($current_song = jamsession)
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
	getarraysize <tips_array>
	getrandomvalue name = rand_num a = 0 b = (<array_size> - 1) integer
	message = (<tips_array> [<rand_num>])
	return message = <message>
endscript

script 0x04285d75 \{time = 1.0}
	printf \{'push mini loading screen'}
	0x10b35a47
	printf \{'and wait for it'}
	0x628ef00f
	printf \{'do something that takes a while'}
	wait <time> seconds
	printf \{'pop mini loading screen'}
	0xdf9f604d
	printf \{'and wait for it'}
	0x628ef00f
	printf \{'test done'}
endscript
