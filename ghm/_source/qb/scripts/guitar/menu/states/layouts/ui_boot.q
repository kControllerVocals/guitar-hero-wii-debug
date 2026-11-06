
script ui_create_boot_legal 
	spawnscriptnow \{ui_boot_legal_wait}
endscript

script ui_destroy_boot_legal 
	fadetoblack \{on
		alpha = 1.0
		time = 0.0
		z_priority = 100
		no_wait}
	hideloadingscreen
endscript

script ui_boot_legal_wait 
	if not cd
	endif
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_boot_movie_atvi
		}}
endscript

script ui_create_boot_movie_atvi 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'atvi'
			state = uistate_boot_movie_red_octane
		}}
endscript

script ui_create_boot_movie_red_octane 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'ro_logo'
			state = uistate_boot_movie_neversoft
		}}
endscript

script ui_create_boot_movie_neversoft 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'ns_logo'
			state = uistate_boot_movie_intro
		}}
endscript

script ui_create_boot_movie_intro 
	spawnscriptnow \{ui_boot_movie_wait
		params = {
			movie = 'GHM_Movie_Intro'
			state = uistate_boot_iis
		}}
endscript
0x8b2d9143 = 0

script ui_boot_movie_wait 
	0x622f875f
	playmovieandwait \{movie = 'atvi'
		noblack}
	playmovieandwait \{movie = 'ro_logo'
		noblack}
	playmovieandwait \{movie = 'ns_logo'
		noblack}
	playmovieandwait \{movie = 'budcat'
		noblack}
	playmovieandwait \{movie = 'GHM_Movie_Intro'
		noblack}
	popvideovenues
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_boot_iis
		}}
endscript
