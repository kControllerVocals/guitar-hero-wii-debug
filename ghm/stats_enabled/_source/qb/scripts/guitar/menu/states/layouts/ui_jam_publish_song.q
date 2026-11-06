
script ui_create_jam_publish_song 
	spawnscriptnow create_jam_publish_song_menu params = {<...>}
	change \{is_network_game = 1}
endscript

script ui_destroy_jam_publish_song 
	destroy_jam_publish_song_menu
	change \{is_network_game = 0}
endscript

script ui_deinit_jam_publish_song 
	destroyscreenelement \{id = jam_album_cover}
	change \{cas_override_object = none}
	killcamanim \{name = cas_view_cam}
	spawnscriptnow \{jam_publish_reinit_band_logo}
endscript
