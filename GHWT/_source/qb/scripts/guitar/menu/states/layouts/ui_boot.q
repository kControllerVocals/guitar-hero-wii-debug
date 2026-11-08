
script ui_create_boot_legal 
	spawnscriptnow \{ui_boot_legal_wait}
endscript

script ui_destroy_boot_legal 
	fadetoblack \{on
		alpha = 1.0
		time = 0.0
		z_priority = 100
		no_wait}
	Hideloadingscreen
endscript

script ui_boot_legal_wait 
	if CD
	endif
	ui_event_wait \{event = menu_replace
		data = {
			state = UIstate_boot_movie_atvi
		}}
endscript

script ui_create_boot_movie_ATVI 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'atvi'
			state = UIstate_boot_movie_red_octane
		}}
endscript

script ui_create_boot_movie_red_octane 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'ro_logo'
			state = UIstate_boot_movie_neversoft
		}}
endscript

script ui_create_boot_movie_vvisions 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'vvisions'
			state = UIstate_boot_movie_budcat
		}}
endscript

script ui_create_boot_movie_neversoft 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'ns_logo'
			state = UIstate_boot_movie_vvisions
		}}
endscript

script ui_create_boot_movie_intro 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'band_intro'
			state = UIstate_boot_iis
		}}
endscript

script ui_boot_movie_wait 
	PushVideoVenues
	change \{g_skip_remaining_movies = 0}
	PlayMovieAndWait \{movie = 'atvi'
		noblack}
	if NOT ($g_skip_remaining_movies)
		PlayMovieAndWait \{movie = 'ro_logo'
			noblack}
	endif
	if NOT ($g_skip_remaining_movies)
		PlayMovieAndWait \{movie = 'ns_logo'
			noblack}
	endif
	if NOT ($g_skip_remaining_movies)
		PlayMovieAndWait \{movie = 'vvisions'
			noblack}
	endif
	if NOT ($g_skip_remaining_movies)
		PlayMovieAndWait \{movie = 'budcat'
			noblack}
	endif
	PlayMovieAndWait \{movie = 'band_intro'
		noblack}
	PopVideoVenues
	ui_event_wait \{event = menu_replace
		data = {
			state = UIstate_boot_iis
		}}
endscript
