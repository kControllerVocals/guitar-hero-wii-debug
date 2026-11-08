band_mode_available_text = {
	Instruments = [
		qs("GUITAR")
		qs("BASS")
		qs("DRUMS")
		qs("VOCALS")
	]
	difficulties = [
		qs("EASY")
		qs("MEDIUM")
		qs("HARD")
		qs("EXPERT")
	]
}
allow_controller_for_all_instruments = 0
band_mode_show_signin = 1
band_mode_vocals = 0
band_mode_guitar = 0
band_mode_bass = 0
band_mode_drum = 0
band_mode_active = 0

script set_band_mode_dont_signin 
	change \{band_mode_show_signin = 0}
endscript

script reset_band_mode 
	change \{band_mode_active = 0}
	change \{band_mode_vocals = 0}
	change \{band_mode_guitar = 0}
	change \{band_mode_bass = 0}
	change \{band_mode_drum = 0}
endscript
