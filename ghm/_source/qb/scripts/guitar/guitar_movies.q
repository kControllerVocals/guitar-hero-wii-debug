
script create_movie_viewport 
endscript

script destroy_movie_viewport 
endscript

script pausefullscreenmovie 
	if ismovieplaying \{textureslot = 0}
		pausemovie \{textureslot = 0}
	endif
endscript

script unpausefullscreenmovie 
	if ismovieplaying \{textureslot = 0}
		resumemovie \{textureslot = 0}
	endif
endscript
g_skip_remaining_movies = 0

script playmovieandwait \{0x6d221ff1 = false}
	change \{g_skip_remaining_movies = 0}
	if cd
		if ($show_movies = 0)
			return
		endif
	endif
	mark_unsafe_for_shutdown
	if NOT gotparam \{noblack}
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	redisable_rendering = false
	if (renderingenabled)
		redisable_rendering = false
	else
		startrendering
		redisable_rendering = true
	endif
	printf qs(0x23871deb) s = <movie>
	if NOT gotparam \{highpriority}
		playmovie {textureslot = 0
			texturepri = 1000
			no_looping
			no_hold
			highpriority = true
			<...>}
	else
		playmovie {textureslot = 0
			texturepri = 1000
			no_looping
			no_hold
			<...>}
	endif
	wait \{2
		gameframes}
	createscreenelement {
		type = containerelement
		parent = root_window
		id = movie_handler
		event_handlers = [
			{pad_start endmovie params = {skip_remaining_movies 0x6d221ff1 = <0x6d221ff1>}}
			{pad_choose endmovie params = {skip_remaining_movies 0x6d221ff1 = <0x6d221ff1>}}
		]
	}
	launchevent \{type = focus
		target = movie_handler}
	begin
	if NOT ismovieplaying \{textureslot = 0}
		break
	endif
	waitonegameframe
	repeat
	spawnscriptnow endmovie params = {0x6d221ff1 = <0x6d221ff1>}
	begin
	if NOT screenelementexists \{id = movie_handler}
		break
	endif
	waitonegameframe
	repeat
	if NOT gotparam \{noblack}
		printf qs(0x27e8073d) s = <movie>
		fadetoblack \{off
			time = 0}
	endif
	if NOT gotparam \{0x9d6770d8}
		setpakmancurrentblock \{map = zones
			pak = none
			block_scripts = 1}
		setpakmancurrentblock \{map = zones
			pak = z_soundcheck
			block_scripts = 1}
	endif
	0x33d46327 \{only = 0}
	waitonegameframe
	fadetoblack \{off
		time = 0}
	mark_safe_for_shutdown
	if (<redisable_rendering> = true)
		stoprendering
	endif
endscript

script endmovie \{0x6d221ff1 = false}
	setspawninstancelimits \{max = 1
		management = ignore_spawn_request}
	fadetoblack \{on
		time = 0
		alpha = 1.0
		z_priority = -100}
	if gotparam \{skip_remaining_movies}
		change \{g_skip_remaining_movies = 1}
	endif
	if ismovieplaying \{textureslot = 0}
		killmovie \{textureslot = 0}
	endif
	if screenelementexists \{id = movie_handler}
		if (<0x6d221ff1> = true)
			create_loading_screen
		endif
		movie_handler :die
	endif
endscript
