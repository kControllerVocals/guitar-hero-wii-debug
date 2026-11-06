
script ui_create_song_extras_movie 
	spawnscriptnow ui_create_song_extras_movie_spawned params = {<...>}
endscript

script ui_create_song_extras_movie_spawned 
	spawnscriptnow \{bg_crowd_front_end_silence
		params = {
			immediate = 1
		}}
	<movie> = ($permanent_songlist_props.<song>.name)
	playmovieandwait movie = <movie>
	spawnscriptnow \{skate8_sfx_backgrounds_new_area
		params = {
			bg_sfx_area = frontend_menu_music
		}}
	generic_event_back
endscript

script ui_destroy_song_extras_movie 
endscript
