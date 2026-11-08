freestyle_style_tempo = {
	Blues = 60
	metal = 90
	Rock = 60
}

script freestyle_init_band_mode 
	StartMetronome {
		metronome_type = fixed
		beats_per_minute = ($freestyle_style_tempo.$freestyle_music_type)
	}
endscript

script freestyle_destroy_band_mode 
endscript
