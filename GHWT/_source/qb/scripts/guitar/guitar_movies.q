
script create_movie_viewport 
	return
	create_jumbotron
	create_magazine_viewport
	create_bandname_viewport
endscript

script destroy_movie_viewport 
	return
	destroy_jumbotron
	destroy_bandname_viewport
endscript

script PauseFullScreenMovie 
	if IsMoviePlaying \{TextureSlot = 0}
		PauseMovie \{TextureSlot = 0}
	endif
endscript

script UnPauseFullScreenMovie 
	if IsMoviePlaying \{TextureSlot = 0}
		ResumeMovie \{TextureSlot = 0}
	endif
endscript
g_skip_remaining_movies = 0

script PlayMovieAndWait 
	change \{g_skip_remaining_movies = 0}
	if NotCD
		if ($show_movies = 0)
			return
		endif
	endif
	mark_unsafe_for_shutdown
	if NOT GotParam \{noblack}
		fadetoblack \{on
			time = 0
			alpha = 1.0
			z_priority = -10}
	endif
	redisable_rendering = false
	if (RenderingEnabled)
		redisable_rendering = false
	else
		startrendering
		redisable_rendering = true
	endif
	RenderVideoOnly \{Only = 1}
	pre_movie_cleanup
	printf qs("\LPlaying Movie %s") s = <movie>
	if NOT GotParam \{highpriority}
		PlayMovie {TextureSlot = 0
			TexturePri = 1000
			no_looping
			no_hold
			highpriority = true
			<...>}
	else
		PlayMovie {TextureSlot = 0
			TexturePri = 1000
			no_looping
			no_hold
			<...>}
	endif
	Wait \{2
		gameframes}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = movie_handler
		event_handlers = [
			{
				pad_start
				EndMovie
				params = {
					skip_remaining_movies
				}
			}
			{
				pad_choose
				EndMovie
				params = {
					skip_remaining_movies
				}
			}
		]}
	LaunchEvent \{type = focus
		target = movie_handler}
	begin
	if NOT IsMoviePlaying \{TextureSlot = 0}
		break
	endif
	WaitOneGameFrame
	repeat
	spawnscriptnow \{EndMovie}
	begin
	if NOT ScreenElementExists \{id = movie_handler}
		break
	endif
	WaitOneGameFrame
	repeat
	if NOT GotParam \{noblack}
		printf qs("\LFinished Playing Movie %s") s = <movie>
		fadetoblack \{off
			time = 0}
	endif
	fadetoblack \{on
		time = 0
		alpha = 1.0
		z_priority = -100}
	RenderVideoOnly \{Only = 0}
	PopVideoVenues
	mark_safe_for_shutdown
	if (<redisable_rendering> = true)
		stoprendering
	endif
endscript

script EndMovie 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	if GotParam \{skip_remaining_movies}
		change \{g_skip_remaining_movies = 1}
	endif
	if IsMoviePlaying \{TextureSlot = 0}
		KillMovie \{TextureSlot = 0}
	endif
	if ScreenElementExists \{id = movie_handler}
		movie_handler :Die
	endif
endscript
