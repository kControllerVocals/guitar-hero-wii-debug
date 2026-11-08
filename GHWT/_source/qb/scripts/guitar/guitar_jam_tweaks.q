jam_song_version = 10
jam_song_version_valid = 0
jam_max_user_songs = 0

script set_plat_jam_maximums 
	if IsPs3
		change \{jam_max_user_songs = 40}
		change \{jam_max_downloaded_songs = 50}
	elseif IsNgc
		change \{jam_max_user_songs = 20}
	else
		change \{jam_max_user_songs = 50}
		change \{jam_max_downloaded_songs = 100}
	endif
endscript
jam_song_assets = [
	{
		display_name = qs("\LAmazing")
		filename = qs("\LAmazing")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs("\LBee")
		filename = qs("\LBee")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs("\LBouree")
		filename = qs("\LBouree")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs("\LFur Elise")
		filename = qs("\LFurElise")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs("\LFuture Freak")
		filename = qs("\LFutureFreak")
		artist = qs("\LNeversoft")
		playback_track1 = 0
		playback_track2 = 4
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs("\LGreensleeves")
		filename = qs("\LGreensleeves")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs("\LI Like Dirt")
		filename = qs("\LILikeDirt")
		artist = qs("\LNeversoft")
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs("\LJam and Toast")
		filename = qs("\LJamAndToast")
		artist = qs("\LNeversoft")
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs("\LLa Noche")
		filename = qs("\LLaNoche")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 4
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs("\LLaser Bop")
		filename = qs("\LLaserBop")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs("\LMaple Leaf")
		filename = qs("\LMapleLeaf")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs("\LPorto")
		filename = qs("\LPorto")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs("\LRaja Funshine")
		filename = qs("\LRajaFunshine")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs("\LRock Hop")
		filename = qs("\LRockHop")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs("\LRondo")
		filename = qs("\LRondo")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs("\LStar Spangled")
		filename = qs("\LStarSpangled")
		artist = qs("\LNeversoft")
		playback_track1 = 1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs("\LY and Z")
		filename = qs("\LYandZ")
		artist = qs("\LNeversoft")
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 1
	}
	{
		display_name = qs("\LStudio Example 1")
		filename = qs("\LStudioExample1")
		artist = qs("\LMusicStudio")
		no_qp
		playback_track1 = -1
		playback_track2 = 2
		playback_track_drums = 1
		playback_track_vocals = 0
	}
	{
		display_name = qs("\LStudio Example 2")
		filename = qs("\LStudioExample2")
		artist = qs("\LMusicStudio")
		no_qp
		playback_track1 = 0
		playback_track2 = 2
		playback_track_drums = 0
		playback_track_vocals = 1
	}
]
num_jam_players = 4
gemarraysize = 1201
starsize = 20
fretbarsize = 1000
markerssize = 50
arraylistsize = 200
jam_fade_time = 0.2
jam_click_track = 1
jam_current_marker_bpm = 120
jam_min_bpm = 80
jam_max_bpm = 160
jam_highway_last_backwards_interval = -1
jam_highway_last_forwards_interval = -1
jam_current_bpm = 120
jam_current_quantize = 0
jam_current_tuning = 0
jam_playback_instrument = 0
jam_line6_inuse = -1
jam_falling_gem_limit = 195
jam_num_falling_gems = 0
humanizer_strength = 0.02
jam_select_area_wait = 10
jam_skip_wait = 15
jam_current_track = 0
jam_tracks = [
	{
		id = rhythm
		gem_array = editable_song_expert
		in_game_gem_array = jamsession_song_in_game
		name_text = qs("RHYTHM")
		alt_text = qs("RHYTHM GUITAR")
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_rhythm
		color = [
			255
			100
			100
			255
		]
	}
	{
		id = lead
		gem_array = editable_song_rhythm_expert
		in_game_gem_array = jamsession_song_rhythm_in_game
		name_text = qs("LEAD")
		alt_text = qs("LEAD GUITAR")
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_lead
		color = [
			100
			255
			100
			255
		]
	}
	{
		id = Bass
		gem_array = editable_song_guitarcoop_expert
		in_game_gem_array = jamsession_song_guitarcoop_in_game
		name_text = qs("BASS")
		alt_text = qs("BASS")
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_bass_recording
		color = [
			100
			100
			255
			255
		]
	}
	{
		id = drum
		gem_array = editable_song_drum_expert
		in_game_gem_array = jamsession_song_drum_in_game
		name_text = qs("DRUMS")
		alt_text = qs("DRUMS")
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_drums
		color = [
			100
			255
			255
			255
		]
	}
	{
		id = melody
		gem_array = editable_song_rhythmcoop_expert
		in_game_gem_array = jamsession_song_rhythmcoop_in_game
		name_text = qs("KEYBOARD")
		alt_text = qs("KEYBOARD")
		ui_create_func = jam_setup_fretboard
		ui_destroy_func = jam_destroy_fretboard
		input_func = jam_input_melody
		color = [
			155
			10
			200
			255
		]
	}
]
jam_genre_list = [
	{
		name_text = qs("Alternative")
		abrev_text = qs("Alt.")
		checksum = alternative
		leaderboard = user_content_alternative
	}
	{
		name_text = qs("Pop")
		abrev_text = qs("Pop")
		checksum = Pop
		leaderboard = user_content_pop
	}
	{
		name_text = qs("Experimental")
		abrev_text = qs("Exper.")
		checksum = experimental
		leaderboard = user_content_experimental
	}
	{
		name_text = qs("Hip Hop")
		abrev_text = qs("Hip Hop")
		checksum = hip_hop
		leaderboard = user_content_hip_hop
	}
	{
		name_text = qs("Rock")
		abrev_text = qs("Rock")
		checksum = Rock
		leaderboard = user_content_rock
	}
	{
		name_text = qs("Metal")
		abrev_text = qs("Metal")
		checksum = metal
		leaderboard = user_content_metal
	}
	{
		name_text = qs("Electronic")
		abrev_text = qs("Electro.")
		checksum = electronic
		leaderboard = user_content_electronic
	}
	{
		name_text = qs("Other")
		abrev_text = qs("Other")
		checksum = Other
		leaderboard = user_content_other
	}
]
default_album_cover = [
	{
		layers = [
			{
				texture_id = cag_graphics075
				texture_name = qs(0x2f3472fb)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 104
				pos_y = 116
				rot = 330
				scale_x = 0.3
				scale_y = 0.3
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = none
				layer_id = 0
			}
			{
				texture_id = cag_plant_003
				texture_name = qs(0xe0c3d483)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 48
				pos_y = 8
				rot = 0
				scale_x = 0.4
				scale_y = 0.4
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = none
				layer_id = 1
			}
			{
				texture_id = cag_plant_003
				texture_name = qs(0xe0c3d483)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 8
				pos_y = 8
				rot = 0
				scale_x = 0.4
				scale_y = 0.4
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = none
				layer_id = 2
			}
			{
				texture_id = cag_icon_wing007
				texture_name = qs(0xf46b197f)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = -8
				pos_y = 108
				rot = 0
				scale_x = 0.6
				scale_y = 0.6
				flip_h = 1
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = none
				layer_id = 3
			}
			{
				texture_id = gh3_bunny
				texture_name = qs(0x7570f345)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = none
				layer_id = 4
			}
			{
				texture_id = cag_icon_wing007
				texture_name = qs(0xf46b197f)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 120
				pos_y = 124
				rot = 0
				scale_x = 0.7
				scale_y = 0.7
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = none
				layer_id = 5
			}
			{
				texture_id = cag_elemental005
				texture_name = qs(0x25a270d7)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 104
				pos_y = 164
				rot = 330
				scale_x = 0.2
				scale_y = 0.2
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = yellow_1guitar
				layer_id = 6
			}
			{
				texture_id = cag_elemental005
				texture_name = qs(0x25a270d7)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 48
				pos_y = 164
				rot = 0
				scale_x = 0.2
				scale_y = 0.2
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = yellow_1guitar
				layer_id = 7
			}
			{
				texture_id = cag_elemental005
				texture_name = qs(0x25a270d7)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = -12
				pos_y = 156
				rot = 15
				scale_x = 0.2
				scale_y = 0.2
				flip_h = 1
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = yellow_1guitar
				layer_id = 8
			}
			{
				texture_id = cag_plant_003
				texture_name = qs(0xe0c3d483)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = -28
				pos_y = -4
				rot = 0
				scale_x = 0.5
				scale_y = 0.5
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = none
				layer_id = 9
			}
			{
				texture_id = cag_plant_003
				texture_name = qs(0xe0c3d483)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 152
				pos_y = -4
				rot = 0
				scale_x = 0.5
				scale_y = 0.5
				flip_h = 1
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = none
				layer_id = 10
			}
			{
				texture_id = cag_graphics031
				texture_name = qs(0x1773a510)
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 64
				pos_y = -48
				rot = 135
				scale_x = 0.7
				scale_y = 0.7
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = none
				layer_id = 11
			}
			{
				texture_id = none
				texture_name = qs("")
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				hsva = [
					0
					0
					60
					255
				]
				shear_x = 0.0
				shear_y = 0.0
				color = none
				layer_id = 12
			}
			{
				texture_id = none
				texture_name = qs("")
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				color = none
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 13
			}
			{
				texture_id = none
				texture_name = qs("")
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				color = none
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 14
			}
			{
				texture_id = none
				texture_name = qs("")
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				color = none
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 15
			}
			{
				texture_id = none
				texture_name = qs("")
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				color = none
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 16
			}
			{
				texture_id = none
				texture_name = qs("")
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				color = none
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 17
			}
			{
				texture_id = none
				texture_name = qs("")
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				color = none
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 18
			}
			{
				texture_id = none
				texture_name = qs("")
				string = qs("")
				canvas_id = none
				font_id = 0
				pos_x = 64
				pos_y = 64
				rot = 0
				scale_x = 1.0
				scale_y = 1.0
				flip_h = 0
				flip_v = 0
				shear_x = 0.0
				shear_y = 0.0
				color = none
				hsva = [
					0
					0
					60
					255
				]
				layer_id = 19
			}
		]
	}
]
ghtunes_minimum_note_count = 20
ghtunes_minimum_song_time = 10000
jam_songs_rated_this_session = [
]
jam_highway_fretbar_color = [
	150
	150
	150
	255
]
jam_highway_measurebar_color = [
	240
	240
	240
	255
]
jam_recording_metaview_length = 470.0
jam_camera_props = {
	jam_look_at_mixer = {
		LockTo = world
		pos = (0.507738, 1.892075, 16.786266)
		Quat = (0.02289, -0.948689, 0.070403)
		FOV = 72.0
	}
	jam_song_select = {
		LockTo = world
		pos = (-2.208166, 1.7454499, 13.966361)
		Quat = (0.001762, -0.99729997, 0.025651002)
		FOV = 72.0
	}
	jam_ghmix_song_select = {
		LockTo = world
		pos = (-2.130476, 1.888687, 14.1753235)
		Quat = (0.028432999, -0.78749603, 0.036445998)
		FOV = 72.0
	}
	jam_band = {
		LockTo = world
		pos = (-0.51169395, 1.7524859, 9.7445545)
		Quat = (0.001013, 0.9969439, -0.076838)
		FOV = 72.0
	}
	jam_publish = {
		LockTo = world
		pos = (-0.536864, 2.1043458, 15.148574)
		Quat = (0.0052940003, 0.02768, -0.000218)
		FOV = 72.0
	}
	jam_tutorials = {
		LockTo = world
		pos = (-3.6637907, 1.6212071, 12.313894)
		Quat = (0.020512, -0.966841, 0.076533005)
		FOV = 72.0
	}
	jam_advanced_recording = {
		LockTo = world
		pos = (-3.9595852, 1.8264489, 13.100554)
		Quat = (0.011898, -0.70952004, 0.0119940005)
		FOV = 72.0
	}
	jam_gh_tunes = {
		LockTo = world
		pos = (-3.222695, 1.3334249, 11.540949)
		Quat = (0.019791, 0.941012, -0.056126006)
		FOV = 72.0
	}
	jam_song_wizard = {
		LockTo = world
		pos = (-2.3648896, 1.668748, 12.441849)
		Quat = (0.002055, 0.98574096, -0.167789)
		FOV = 72.0
	}
}
jam_gem_colors = [
	[
		0
		210
		50
		160
	]
	[
		230
		30
		32
		160
	]
	[
		200
		200
		0
		160
	]
	[
		0
		90
		200
		160
	]
	[
		200
		100
		5
		160
	]
	[
		181
		11
		170
		160
	]
]
jam_tilt_rhythm = 0
jam_button_patterns_singles = [
	1048576
	65536
	4096
	256
	16
	1
]
jam_button_patterns_chords = [
	69632
	65792
	4352
	4112
	272
	257
	17
]
jam_bonus_pattern_samples = 1
jam_button_patterns_bonus = [
	69888
	69648
	65808
	4368
	4353
	4113
	273
]
Rhythm_Pitch_Shift = {
	effect = whammy
	name = JamRhythmPitchShift
	pitch = 1.0
	maxchannels = 0
}
jam_special_chords = [
	{
		special_up = sg_b_hrm_S1_F12
		special_down = sg_b_hrm_S1_F12
		note_txt = qs("\L!!")
		pattern = 65552
	}
	{
		special_up = sg_b_hrm_S2_F12
		special_down = sg_b_hrm_S2_F12
		note_txt = qs("\L!!")
		pattern = 4097
	}
	{
		special_up = sg_b_hrm_S3_F12
		special_down = sg_b_hrm_S3_F12
		note_txt = qs("\L!!")
		pattern = 65537
	}
	{
		special_up = sg_b_stringmute_up
		special_down = sg_b_stringmute_down
		note_txt = qs("\L!!")
		pattern = 69904
	}
	{
		special_up = sg_b_DiveBomb_Down
		special_down = sg_b_DiveBomb_Down
		note_txt = qs("\L!!")
		pattern = 4369
	}
	{
		special_up = sg_b_hrm_S4_F12
		special_down = sg_b_hrm_S4_F12
		note_txt = qs("\L!!")
		pattern = 69889
	}
	{
		special_up = sg_b_hrm_S5_F12
		special_down = sg_b_hrm_S5_F12
		note_txt = qs("\L!!")
		pattern = 65809
	}
	{
		special_up = sg_b_hrm_S6_F12
		special_down = sg_b_hrm_S6_F12
		note_txt = qs("\L!!")
		pattern = 69633
	}
	{
		special_up = sg_b_pkslideslow
		special_down = sg_b_pkslideslow
		note_txt = qs("\L!!")
		pattern = 65553
	}
	{
		special_up = sg_b_pkslidefast
		special_down = sg_b_pkslidefast
		note_txt = qs("\L!!")
		pattern = 69649
	}
	{
		special_up = sg_b_fingerslide
		special_down = sg_b_fingerslide
		note_txt = qs("\L!!")
		pattern = 69905
	}
	{
		special_up = sg_b_DiveBomb_UpDown
		special_down = sg_b_DiveBomb_UpDown
		note_txt = qs("\L!!")
		pattern = 65793
	}
]
jam_tilt_lead = 0
jam_lead_octave_range = 1
Lead_Pitch_Shift = {
	effect = whammy
	name = JamLeadPitchShift
	pitch = 1.0
	maxchannels = 0
}
jam_hopo_initial_check_frames = 20
jam_hopo_check_frames = 40
jam_lead_vibrato_depth = 10
jam_tilt_bass = 0
Bass_Pitch_Shift = {
	effect = whammy
	name = JamBassPitchShift
	pitch = 1.0
	maxchannels = 0
}
jam_default_drum_velocity = 70
jam_default_snare_velocity = 90
jam_default_hihat_velocity = 80
jam_default_tom1_velocity = 100
jam_default_cymbal_velocity = 105
jam_default_tom2_velocity = 100
jam_default_kick_velocity = 110
snare_stop_repeat = 0
hihat_stop_repeat = 0
tom1_stop_repeat = 0
cymbal_stop_repeat = 0
tom2_stop_repeat = 0
kick_stop_repeat = 0
drum_humanizer_low_bound = 10
drum_humanizer_high_bound = 10
jam_tilt_melody = 0
jam_melody_octave_range = 0
LoadedMelodyKitPak = 'none'
jam_current_melody_kit = 0
melody_sample = deepsh101
Melody_Pitch_Shift = {
	effect = whammy
	name = JamMelodyPitchShift
	pitch = 1.0
	maxchannels = 0
}
jamsession_vocals_note_range = [
	0
	0
]
jamsession_lyrics = [
]
jamsession_vocals_phrases = [
	0
	3
	1000
	3
]
jamsession_vocals_freeform = [
]
jam_mic_id = 5
jam_rhythm_string1_limit = 4
jam_rhythm_string2_limit = 9
jam_rhythm_string1_rollover = 5
jam_rhythm_string2_rollover = 7
jam_leadbass_string_limit = 4
jam_scales_new = [
	{
		pattern = major_pattern
		pattern2 = major_pattern2
		pattern_rhythm = major_pattern_rhythm
		chord_pattern = major_chord_pattern
		name = qs("Major")
	}
	{
		pattern = pent_major_pattern
		pattern2 = pent_major_pattern2
		pattern_rhythm = pent_major_pattern_rhythm
		chord_pattern = pent_major_chord_pattern
		name = qs("Mjr. Pent")
	}
	{
		pattern = pent_minor_pattern
		pattern2 = pent_minor_pattern2
		pattern_rhythm = pent_minor_pattern_rhythm
		chord_pattern = pent_minor_chord_pattern
		name = qs("Mnr. Pent")
	}
	{
		pattern = blues_pattern
		pattern2 = blues_pattern2
		pattern_rhythm = blues_pattern_rhythm
		chord_pattern = blues_chord_pattern
		name = qs("Blues")
	}
	{
		pattern = minor_pattern
		pattern2 = minor_pattern2
		pattern_rhythm = minor_pattern_rhythm
		chord_pattern = minor_chord_pattern
		name = qs("Minor")
	}
	{
		pattern = chromatic_pattern
		pattern_rhythm = chromatic_pattern_rhythm
		chord_pattern = chromatic_chord_pattern
		name = qs("Chromatic")
		chromatic
	}
	{
		pattern = null
		pattern_rhythm = null
		chord_pattern = custom_chord_pattern
		name = qs("Custom")
		custom
	}
]
major_chord_pattern = [
	1
	2
	2
	1
	1
	2
	2
]
minor_chord_pattern = [
	2
	2
	1
	2
	2
	1
	1
]
pent_major_chord_pattern = [
	1
	5
	5
	8
	5
	1
	5
]
pent_minor_chord_pattern = [
	5
	1
	5
	5
	8
	5
	1
]
blues_chord_pattern = [
	6
	1
	6
	9
	6
	1
	6
]
chromatic_chord_pattern = [
	1
	1
	1
	1
	1
	1
	1
	1
	1
	1
	1
	1
	1
	1
]
custom_chord_pattern = [
	1
	1
	1
	1
	1
	1
	1
]
major_pattern_rhythm = [
	0
	2
	4
	5
	7
	9
	11
]
pent_minor_pattern_rhythm = [
	0
	3
	5
	7
	10
	12
	15
]
pent_major_pattern_rhythm = [
	0
	2
	4
	7
	9
	12
	14
]
blues_pattern_rhythm = [
	0
	3
	5
	6
	7
	10
	12
]
minor_pattern_rhythm = [
	0
	2
	3
	5
	7
	8
	10
]
chromatic_pattern_rhythm = [
	0
	1
	2
	3
	4
	5
	6
	7
	8
	9
	10
	11
	12
	13
]
major_pattern = [
	[
		0
		0
	]
	[
		0
		2
	]
	[
		0
		4
	]
	[
		1
		0
	]
	[
		1
		2
	]
	[
		1
		4
	]
	[
		2
		1
	]
	[
		2
		2
	]
	[
		2
		4
	]
	[
		3
		1
	]
	[
		3
		2
	]
	[
		3
		4
	]
	[
		4
		2
	]
	[
		4
		4
	]
]
major_pattern2 = [
	[
		1
		7
	]
	[
		1
		9
	]
	[
		1
		11
	]
	[
		2
		7
	]
	[
		2
		9
	]
	[
		2
		11
	]
	[
		3
		8
	]
	[
		3
		9
	]
	[
		3
		11
	]
	[
		4
		9
	]
	[
		4
		10
	]
	[
		4
		12
	]
	[
		5
		9
	]
	[
		5
		11
	]
]
pent_major_pattern = [
	[
		0
		0
	]
	[
		0
		2
	]
	[
		0
		4
	]
	[
		1
		2
	]
	[
		1
		4
	]
	[
		2
		2
	]
	[
		-1
		-1
	]
	[
		2
		2
	]
	[
		2
		4
	]
	[
		3
		1
	]
	[
		4
		0
	]
	[
		4
		2
	]
	[
		5
		0
	]
	[
		-1
		-1
	]
]
pent_major_pattern2 = [
	[
		1
		7
	]
	[
		1
		9
	]
	[
		2
		6
	]
	[
		2
		9
	]
	[
		3
		6
	]
	[
		3
		9
	]
	[
		-1
		-1
	]
	[
		3
		9
	]
	[
		4
		7
	]
	[
		4
		9
	]
	[
		5
		7
	]
	[
		5
		9
	]
	[
		5
		12
	]
	[
		-1
		-1
	]
]
pent_minor_pattern = [
	[
		0
		0
	]
	[
		0
		3
	]
	[
		1
		0
	]
	[
		1
		2
	]
	[
		2
		0
	]
	[
		2
		2
	]
	[
		-1
		-1
	]
	[
		2
		2
	]
	[
		3
		0
	]
	[
		3
		2
	]
	[
		3
		4
	]
	[
		4
		3
	]
	[
		5
		0
	]
	[
		-1
		-1
	]
]
pent_minor_pattern2 = [
	[
		1
		7
	]
	[
		1
		10
	]
	[
		2
		7
	]
	[
		2
		9
	]
	[
		3
		7
	]
	[
		3
		9
	]
	[
		-1
		-1
	]
	[
		3
		9
	]
	[
		4
		8
	]
	[
		4
		10
	]
	[
		5
		7
	]
	[
		5
		10
	]
	[
		5
		12
	]
	[
		-1
		-1
	]
]
blues_pattern = [
	[
		0
		0
	]
	[
		0
		3
	]
	[
		1
		0
	]
	[
		1
		1
	]
	[
		1
		2
	]
	[
		2
		0
	]
	[
		2
		2
	]
	[
		2
		2
	]
	[
		3
		0
	]
	[
		3
		2
	]
	[
		3
		3
	]
	[
		4
		0
	]
	[
		4
		3
	]
	[
		5
		0
	]
]
blues_pattern2 = [
	[
		1
		7
	]
	[
		1
		10
	]
	[
		2
		7
	]
	[
		2
		8
	]
	[
		2
		9
	]
	[
		3
		7
	]
	[
		3
		9
	]
	[
		3
		9
	]
	[
		4
		8
	]
	[
		4
		10
	]
	[
		4
		11
	]
	[
		5
		7
	]
	[
		5
		10
	]
	[
		5
		12
	]
]
minor_pattern = [
	[
		0
		0
	]
	[
		0
		2
	]
	[
		0
		3
	]
	[
		1
		0
	]
	[
		1
		2
	]
	[
		1
		3
	]
	[
		2
		0
	]
	[
		2
		2
	]
	[
		2
		4
	]
	[
		3
		0
	]
	[
		3
		2
	]
	[
		3
		4
	]
	[
		4
		1
	]
	[
		4
		3
	]
]
minor_pattern2 = [
	[
		1
		7
	]
	[
		1
		9
	]
	[
		1
		10
	]
	[
		2
		7
	]
	[
		2
		9
	]
	[
		2
		10
	]
	[
		3
		7
	]
	[
		3
		9
	]
	[
		4
		7
	]
	[
		4
		8
	]
	[
		4
		10
	]
	[
		5
		7
	]
	[
		5
		8
	]
	[
		5
		10
	]
]
chromatic_pattern = [
	[
		0
		0
	]
	[
		0
		1
	]
	[
		0
		2
	]
	[
		0
		3
	]
	[
		0
		4
	]
	[
		1
		0
	]
	[
		1
		1
	]
	[
		1
		2
	]
	[
		1
		3
	]
	[
		1
		4
	]
	[
		2
		0
	]
	[
		2
		1
	]
	[
		2
		2
	]
	[
		2
		3
	]
	[
		2
		4
	]
	[
		3
		0
	]
	[
		3
		1
	]
	[
		3
		2
	]
	[
		3
		3
	]
	[
		4
		0
	]
	[
		4
		1
	]
	[
		4
		2
	]
	[
		4
		3
	]
	[
		4
		4
	]
]
