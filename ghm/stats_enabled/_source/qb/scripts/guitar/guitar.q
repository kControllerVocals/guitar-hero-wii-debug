text = qs(0xe5b08ef0)
use_pcmcia = 'true'
viewer_ip = '10.2.1.1'
viewer_subnet = '255.252.0.0'
viewer_gateway = '10.2.0.1'
use_qbr = 0
show_gpu_time = 0
output_gpu_log = 0
show_cpu_time = 0
show_play_log = 0
play_log_lines = 10
show_guitar_tilt = 0
nxwatson_channels = 1
output_song_stats = 0
show_sensor_debug = 0
guitar_motion_enable_test = 0
pause_menu_no_bg = 0
vocal_debug_hud = 0
roland_drumkit = 1
rock_meter_debug = 0
disable_wii_controller_speaker_output = false
ps2_venues = 0
quickplay_venue = none
current_song = battery
current_difficulty_coop = easy
current_level = load_z_meadowlands
current_highway = highway
current_time = 0.0
current_deltatime = 0.0167
current_starttime = 0
current_endtime = 0
current_looppoint = -1000000
current_speedfactor = 1.0
autolaunch_startnow = 0
autolaunch_showstorageselector = 1
current_song_qpak = none
current_song_qpak_mocap = none
current_song_qpak_performance = 0
current_band = 1
last_song_failed = none
current_song_failed_num = 0
current_transition = none
debug_current_transition = none
current_num_players = 1
in_join_band_screens = 0
num_players_finished = 0
guitar_fretbar_divisions = 2
drum_fretbar_divisions = 2
disable_band = 0
disable_crowd = 0
disable_note_input = 0
tutorial_disable_hud = 0
current_frame_toggle = 0
whammyon_lockp1 = 0
whammyon_lockp2 = 0
is_network_game = 0
net_ready_to_start = 0
rich_presence_context = presence_menus
game_mode = p1_quickplay
skip_boot_menu = 0
autolaunch_cas = 0
autolaunch_cas_soak_test = 0
autolaunch_cas_artist = 0
objviewer_light_test = 0
autolaunch_jam = 0
skip_signin = 0
show_movies = 1
is_demo_mode = 0
is_multiplayer_beta = 0
downloadcontent_enabled = 0
songtime_paused = 0
drum_solo_songtime_paused = 0
drum_solo_length = 0.0
drum_solo_no_gems = 0
ps2_progressivescan = 0
drum_rock_meter_weights = {
	easy_rhythm = [
		1.0
		1.0
	]
	easy = [
		1.0
		1.0
	]
	medium = [
		1.5
		1.5
	]
	hard = [
		2.0
		2.5
	]
	expert = [
		2.0
		2.5
	]
}
current_boss = $boss_ted_props
boss_battle = 0
boss_controller = 0
boss_oldcontroller = 0
boss_pattern = 0
boss_strum = 0
boss_lastwhammytime = 0
boss_lastbrokenstringtime = 0
faceoff_enabled = 0
input_debug_display = 0
display_debug_input = 0
output_log_file = 0
practice_start_time = 0
practice_end_time = 0
practice_loop_section = 0
startup_song = battery
startup_difficulty = easy
time_audio_offset = 0.0
time_gem_offset = 0.0
time_input_offset = 0.0
time_drum_midi_offset = 0.0
time_gem_offset_with_lag = 0.0
time_drum_midi_offset_with_lag = 0.0
crowd_band_multiplier = 1.0
max_num_powerups = 3
show_battle_text = 1
devil_finish = 0
battle_do_or_die = 0
battle_do_or_die_speed_scale = 1.0
battle_do_or_die_attack_scale = 1.0
cheat_line6unlock = 1
cheat_alwaysslide = -1
cheat_superuser = -1
cheat_airinstruments = -1
cheat_invisiblecharacters = -1
cheat_snobcrowd = -1
cheat_performancemode = -1
cheat_hyperspeed = -1
cheat_autokick = -1
cheat_freedrum = -1
cheat_unlockquickplay = -1
cheat_unlockattballpark = -1
cheat_gemcolor = -1
cheat_flamecolor = -1
cheat_starcolor = -1
cheat_vocalfireball = -1
cheat_buckethat = -1
cheat_altband = -1
cheat_zombband = -1
cheat_blackhighway = -1
original_check_time_early = 0.0
original_check_time_late = 0.0
boss_wuss_out = 0
crowd_model_array = none
failed_song_time = 0.0
current_section_array = none
current_section_array_entry = 0
last_time_in_lead = 0.0
last_time_in_lead_player = -1
enable_saving = 1
enable_loading = 1
primary_controller = 0
primary_controller_assigned = 0
invite_controller = -1
num_career_bands = 1
streamall_fsb_index = -1
enable_button_cheats = 1
enable_debug_menus = 1
whammy_mania_achievement_invalidated = 0
vocalist_height = 1.6
winning_player_camera_percentage = 100
cas_heap_state = in_game
playerserver_frame_lag = 0
guest_character_names = {
}
guest_character_fullnames = {
}
num_quickplay_song_list = 0
quickplay_song_list_current = 0
quickplay_song_list = [
	null
	null
	null
	null
	null
	null
]

script reset_quickplay_song_list 
	change \{quickplay_song_list_current = -1}
	getarraysize \{$quickplay_song_list}
	i = 0
	begin
	setarrayelement arrayname = quickplay_song_list globalarray index = <i> newvalue = null
	<i> = (<i> + 1)
	repeat <array_size>
endscript
sysnotify_menus_position = topright
sysnotify_ingame_position = topright
cameracuts_enablevideovenuecams = 0

script 0xd1249523 \{0x3631c4e9 = none}
	printf \{'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAH'}
	printf 'IsLevelZoneVideoVenue: %a' a = <0x3631c4e9>
	if structurecontains structure = $ghzones <0x3631c4e9>
		printf \{'IsLevelZoneVideoVenue: true'}
		return \{true}
	endif
	printf \{'IsLevelZoneVideoVenue: false'}
	return \{false}
endscript
0x57b923f3 = 0
0x95154ded = none

script 0x2e51d96c 
	return \{false}
endscript

script 0x11a515a1 
	if ($0x57b923f3 = 0)
		getpakmancurrent \{map = zones}
		change 0x95154ded = <pak>
		setpakmancurrentblock \{map = zones
			pak = none
			block_scripts = 1}
		change \{0x57b923f3 = 1}
	endif
endscript

script 0x29472091 
	if ($0x57b923f3 > 0)
		setpakmancurrentblock \{map = zones
			pak = $0x95154ded
			block_scripts = 1}
		change \{0x95154ded = none}
		change \{0x57b923f3 = 0}
	endif
endscript

script 0x622f875f 
	if ($0x57b923f3 < 10)
		if ($0x57b923f3 = 0)
			0x11a515a1
		else
			change 0x57b923f3 = ($0x57b923f3 + 1)
		endif
	endif
endscript

script popvideovenues 
	if ($0x57b923f3 > 0)
		if ($0x57b923f3 = 1)
			0x29472091
		else
			change 0x57b923f3 = ($0x57b923f3 - 1)
		endif
	endif
endscript

script get_heap_sizes 
	getplatform
	switch <platform>
		case ngc
		<heap_size_globalpak> = (1773 * 1024)
		<heap_size_globalpak_vram> = (0)
		<heap_size_audio_vram> = (0)
		<heap_size_audio> = (0)
		<heap_size_musician> = (840 * 1024)
		<0x595ea109> = (73 * 1024)
		<heap_size_musician_vram> = (0)
		<heap_size_musician_anim> = (6016 * 1024)
		<heap_size_cas> = (3844 * 1024)
		<heap_size_cas_vram> = (0)
		<heap_size_song> = (3264 * 1024)
		<heap_size_zones> = (5888 * 1024)
		<heap_size_zones_vram> = (0)
		<heap_size_game> = (3072 * 1024)
		<heap_size_lightshow> = (512 * 1024)
		<heap_size_ui_pak_slot> = (3647 * 1024)
		<heap_size_ui_pak_slot_vram> = (0)
		<heap_size_downloads> = (112 * 1024)
		<heap_size_downloads_vram> = (0)
		<heap_size_drumkit> = (200 * 1024)
		default
		scriptassert \{qs(0xfb3c58ff)}
	endswitch
	return <...>
endscript

script print_loading_time 
	getelapsedtime starttime = <starttime>
	finalprintf qs(0x1d312485) a = <elapsedtime> t = <text>
endscript

script guitar_startup 
	change \{assertonmissingscripts = 0}
	setscreen \{widescreen = 1}
	predisplayloadingscreen \{on_startup = 1}
	getstarttime
	overallstarttime = <starttime>
	spawnscriptnow \{start_legal_timer}
	stoprendering
	printf \{qs(0xd21eb1c0)}
	get_heap_sizes
	pushmemprofile \{'Global Pak Heap'}
	meminitheap name = 'heap_global_pak' size = <heap_size_globalpak> vram_size = <heap_size_globalpak_vram>
	popmemprofile
	pushmemprofile \{'Characters'}
	meminitheap name = 'heap_musician1' size = (<heap_size_musician> + <0x595ea109>) vram_size = <heap_size_musician_vram> arena = 1
	meminitheap name = 'heap_musician2' size = (<heap_size_musician> + <0x595ea109>) vram_size = <heap_size_musician_vram> arena = 1
	meminitheap name = 'heap_musician3' size = (<heap_size_musician> + <0x595ea109>) vram_size = <heap_size_musician_vram> arena = 1
	meminitheap name = 'heap_musician4' size = <heap_size_musician> vram_size = <heap_size_musician_vram> arena = 1
	meminitheap name = 'heap_musician_anim' size = <heap_size_musician_anim>
	popmemprofile
	pushmemprofile \{'Light Show Heap'}
	meminitheap name = 'heap_lightshow' size = <heap_size_lightshow>
	popmemprofile
	pushmemprofile \{'Downloads'}
	meminitheap name = 'heap_downloads' size = <heap_size_downloads> vram_size = <heap_size_downloads_vram>
	popmemprofile
	pushmemprofile \{'CAS Heap'}
	meminitheap name = 'heap_cas' size = <heap_size_cas> vram_size = <heap_size_cas_vram> topdownname = 'heap_cas_topdown'
	popmemprofile
	printf \{qs(0xac968502)}
	pushmemprofile \{'COIM'}
	initcoim \{size = $generic_coim_size
		blockalign = $generic_coim_blockalign
		coim_min_scratch_blocks
		$generic_coim_params}
	popmemprofile
	pushmemprofile \{'CompositeObjectManager_startup'}
	compositeobjectmanager_startup
	popmemprofile
	printf \{qs(0x14b44030)}
	pushmemprofile \{'MemCardSystem'}
	memcardsysteminitialize
	popmemprofile
	mc_setactiveplayer \{querydefault}
	printf \{qs(0x9fac0f68)}
	pushmemprofile \{'AnimCompressTable'}
	initanimcompresstable \{'anims\\standardkeyq.bin'
		q48}
	initanimcompresstable \{'anims\\standardkeyt.bin'
		t48}
	popmemprofile
	pushmemprofile \{'Animation Cache'}
	initanimsystem {
		animheapsize = 0
		cacheblockalign = 3072
		animnxbuffersize = (2 * 1024 * 1024)
		defcachetype = fullres
		maxanimstages = 2
		maxanimsubsets = 4
		maxdegenerateanims = 3
		animjqsize = (140 * 1024)
	}
	popmemprofile
	loadpak \{'pak/anims/animq.pak'
		heap = topdownheap
		no_vram}
	registerallanimevents
	unloadpak \{'pak/anims/animq.pak'}
	pushmemprofile \{'InitLightManager'}
	initlightmanager \{max_lights = 2
		max_model_lights = 8
		max_groups = 8
		max_render_verts_per_geom = 4096
		max_diffuse_lights = 4}
	popmemprofile
	pushmemprofile \{'LightShow'}
	lightshow_addnodeflags
	lightshow_init \{notes = $lightshow_notemapping
		nodeflags = $lightshow_statenodeflags}
	lightshow_setprocessors \{shared = $lightshow_sharedprocessors}
	0x8bfa392d
	popmemprofile
	transition_randomizevointros
	pushmemprofile \{'create_node_flags'}
	create_node_flags
	popmemprofile
	pushmemprofile \{'Game Heaps'}
	meminitheap name = 'heap_zones' size = <heap_size_zones>
	mempushcontext \{heap_zones}
	createpakmanmap \{map = zones
		links = ghzones
		folder = 'zones/'
		uselinkslots}
	mempopcontext
	meminitheap name = 'heap_song' size = <heap_size_song>
	popmemprofile
	if NOT ($cas_heap_state = in_game)
		scriptassert \{'Invalid initial cas_heap_state'}
	endif
	if scriptexists \{init_globaltags}
		get_num_globaltag_sets
		init_packed_structs globaltag_sets = <num_globaltag_sets>
		init_globaltags globaltag_sets = <num_globaltag_sets>
	endif
	set_plat_jam_maximums
	engineconfig \{particlelod = 0}
	if scriptexists \{enable_qbr}
		enable_qbr
	endif
	if ($use_qbr = 1)
		usenetworkpreferences
		network_driver_startup
	endif
	if ($is_demo_mode = 1)
		change \{enable_button_cheats = 0}
	endif
	if cd
		change \{enable_button_cheats = 1}
	endif
	if ($enable_debug = 1)
		change \{enable_button_cheats = 1}
	else
		change \{enable_button_cheats = 0}
		change \{fps_hidden = 1}
	endif
	if ($enable_button_cheats = 1)
		launchviewer
		change \{select_shift = 1}
	endif
	if cd
		change \{skip_boot_menu = 1}
	endif
	printf \{qs(0x36fa0eb9)}
	master_sfx_adding_sound_busses
	printf \{qs(0x6e45d61e)}
	pushmemprofile \{'net_load_preferences'}
	net_load_preferences
	popmemprofile
	printf \{qs(0x288a39f2)}
	if scriptexists \{startup}
		startup
	endif
	allocatedecompressedfontbuffers
	printf \{qs(0x049fa44b)}
	pushmemprofile \{'UI Pak Slot'}
	meminitheap name = 'heap_ui_pak_slot' size = <heap_size_ui_pak_slot> vram_size = <heap_size_ui_pak_slot_vram>
	popmemprofile
	pushmemprofile \{'UI_InitializeStateMachine'}
	ui_initializestatemachine
	popmemprofile
	printf \{qs(0xd27c51ef)}
	getstarttime
	loadpak \{'zones/global/global.pak'
		heap = heap_global_pak}
	print_loading_time starttime = <starttime> text = qs(0xf9d25732)
	parsenodearray \{queue
		zone_name = global
		array_name = global_nodearray}
	getstarttime
	loadpak \{'pak/anims/perm_anims/perm_anims.pak'
		heap = heap_musician_anim
		no_vram}
	print_loading_time starttime = <starttime> text = qs(0x3136c57e)
	decompressfonts \{buttons}
	decompressfonts \{fontgrid_numeral_a9}
	decompressfonts \{fontgrid_numeral_a7}
	decompressfonts \{fontgrid_text_a3}
	decompressfonts \{fontgrid_text_a6}
	decompressfonts \{fontgrid_text_a8}
	decompressfonts \{fontgrid_text_a10}
	decompressfonts \{fontgrid_title_a1}
	buttons_font = 'Buttons'
	setfontproperties <buttons_font> buttons_font
	setfontproperties \{'fontgrid_numeral_a7'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_numeral_a9'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a3'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a5'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a6'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a8'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a10'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a11'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a11_b'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_text_a11_large'
		color_tab = $default_font_colors}
	setfontproperties \{'fontgrid_title_a1'
		color_tab = $default_font_colors}
	pushmemprofile \{'FMod Streams + SFX'}
	if isfmodenabled
		getstarttime
		begin
		loadfsb \{filename = 'streams/streamall'
			numstreams = 4
			nowait
			disk_stream = true}
		if NOT (<fsb_index> = -1)
			change streamall_fsb_index = <fsb_index>
			print_loading_time starttime = <starttime> text = qs(0x82a57b3c)
			break
		else
			change \{streamall_fsb_index = -1}
		endif
		wait \{1
			seconds}
		repeat
		getstarttime
		print_loading_time starttime = <starttime> text = qs(0x6c6b87a9)
	endif
	popmemprofile
	setscenepermanent \{scene = 'zones/global/global_gfx.scn'
		permanent}
	pushmemprofile \{'setup_models'}
	setup_models
	popmemprofile
	printf \{qs(0x52f069b2)}
	printf \{qs(0x7ef8c198)
		s = $current_level}
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	addeditablelist \{ped_editable_list}
	printf \{qs(0xb698d219)}
	pushmemprofile \{'Atoms Progression Globaltags'}
	initatoms
	setprogressionmaxdifficulty \{difficulty = 4}
	printf \{qs(0xd6c8512c)}
	finalprofile_start \{'reset_globaltags_all'}
	getstarttime
	reset_globaltags_all
	print_loading_time starttime = <starttime> text = qs(0x6f02fec2)
	finalprofile_stop \{'reset_globaltags_all'}
	printf \{qs(0xacfe5420)}
	popmemprofile
	0xc1c4e84c \{mode = 0x64912155}
	setup_sprites
	disable_pause
	setshadowrenderingflags \{enable = 'true'
		object = 'skin'}
	setshadowmapparams \{far = 16.0}
	showstencilshadow
	pushmemprofile \{'BG Viewport'}
	setup_bg_viewport
	restore_dummy_bg_camera
	popmemprofile
	getmaxplayers
	player = 1
	begin
	<player_status> = ($0x2994109a [<player>])
	<player_text> = ($0x57e22f28 [<player>])
	spawnscriptlater create_guitar_events params = {<...>}
	player = (<player> + 1)
	repeat <max_players>
	randomize
	setshadowprojectiontexture \{texture = white}
	if ($autolaunch_startnow = 0)
		if globalexists \{name = autolaunch_state
				type = checksum}
			fadetoblack \{off
				no_wait}
			change \{primary_controller_assigned = 1}
			ui_event \{event = menu_change
				data = {
					state = $autolaunch_state
				}}
		elseif ($skip_boot_menu = 1)
			change \{primary_controller_assigned = 1}
			hideloadingscreen
			if (($autolaunch_cas = 1) || ($autolaunch_cas_artist) || ($autolaunch_jam = 1) || ($skip_signin = 1))
				change \{skip_signin = 0}
				change \{primary_controller_assigned = 1}
				ui_event \{event = menu_change
					data = {
						state = uistate_mainmenu
					}}
			else
				ui_event \{event = menu_change
					data = {
						state = uistate_boot_iis
					}}
			endif
		else
			hideloadingscreen
			ui_event \{event = menu_change
				data = {
					state = uistate_boot_legal
				}}
			addparams \{donthide}
		endif
	else
		spawnscriptlater \{autolaunch_spawned}
	endif
	guitar_create_character_maps
	create_font_arrays
	load_frontend_anim_paks
	change \{tutorial_disable_hud = 0}
	vocals_start_mic
	if ($autolaunch_startnow != 0)
		vocals_distribute_mics
	endif
	<profile_gpu> = 0
	if ($show_gpu_time = 1)
		<profile_gpu> = 1
	endif
	if ($output_gpu_log = 1)
		<profile_gpu> = 1
	endif
	if (<profile_gpu> = 1)
		togglemetrics \{mode = 5}
	endif
	setglobaltags \{user_options
		params = {
			ps2_widescreen = 1
		}}
	ps2_load_car_part_script
	mempushcontext \{0xc39f2ba1}
	clearjamsession
	mempopcontext
	print_loading_time starttime = <overallstarttime> text = qs(0xe79eced7)
endscript

script verify_cas_budgets 
	verifycasbudgets editable_list = $master_editable_list budgets = $cas_budget_groups <...>
	if gotparam \{textures}
		verifycaptextures
	endif
	if gotparam \{profiles}
		verifycapprofile profile = ($default_custom_musician_profile_female) <...>
		verifycapprofile profile = ($default_custom_musician_profile_male) <...>
		verifycapprofile profiles = ($preset_musician_profiles_modifiable) <...>
		verifycapprofile profiles = ($preset_musician_profiles_locked) <...>
		verifycapprofile appearances = ($cas_preset_guitars) <...>
		verifycapprofile appearances = ($cas_preset_basses) <...>
		verifycapprofile appearances = ($cas_preset_drums) <...>
		verifycapprofile appearances = ($cas_preset_female_vocals) <...>
		verifycapprofile appearances = ($cas_preset_male_vocals) <...>
		verifycapprofile appearances = ($cas_preset_tattoo_female) <...>
		verifycapprofile appearances = ($cas_preset_tattoo_male) <...>
		verifycapprofile appearances = ($cas_preset_face_skin_female) <...>
		verifycapprofile appearances = ($cas_preset_face_skin_male) <...>
		verifycapprofile appearances = ($cas_preset_body_female) <...>
		verifycapprofile appearances = ($cas_preset_body_male) <...>
	endif
endscript

script generate_worst_cas_appearances 
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_guitar_body
			cas_female_hat_hair
		]
		forcebody = gh4_car_female}
	guitar_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_bass_body
			cas_female_hat_hair
		]
		forcebody = gh4_car_female}
	bass_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_drums
			cas_female_hat_hair
		]
		forcebody = gh4_car_female}
	drum_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_mic
			cas_female_hat_hair
		]
		forcebody = gh4_car_female}
	vocals_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_guitar_body
			cas_male_hat_hair
		]
		forcebody = gh4_car_male}
	m_guitar_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_bass_body
			cas_male_hat_hair
		]
		forcebody = gh4_car_male}
	m_bass_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_drums
			cas_male_hat_hair
		]
		forcebody = gh4_car_male}
	m_drum_appearance = (<budget_report_geo>.worst_parts)
	verifycasbudgets \{editable_list = $master_editable_list
		budgets = $cas_budget_groups
		specific_parts = [
			cas_body
			cas_mic
			cas_male_hat_hair
		]
		forcebody = gh4_car_male}
	m_vocals_appearance = (<budget_report_geo>.worst_parts)
	outputworstcasecasfile {
		path = 'car_worst_appearances.q'
		structs = {
			worst_female_guitar_appearance = <guitar_appearance>
			worst_female_bass_appearance = <bass_appearance>
			worst_female_drum_appearance = <drum_appearance>
			worst_female_vocals_appearance = <vocals_appearance>
			worst_male_guitar_appearance = <m_guitar_appearance>
			worst_male_bass_appearance = <m_bass_appearance>
			worst_male_drum_appearance = <m_drum_appearance>
			worst_male_vocals_appearance = <m_vocals_appearance>
		}
	}
endscript

script set_cas_heap_state 
	change cas_heap_state = <state>
endscript

script should_put_zones_on_debug_heap 
	return \{false}
endscript

script create_zone_maps 
	get_heap_sizes
	slop_heap = bottomupheap
	main_mem_heap = heap_cas
	vram_heap = heap_cas
	if should_put_zones_on_debug_heap
		main_mem_heap = debugrsxheap
		slop_heap = debugheap
		size_zones = ((25 * 1024 * 1024) - 1024)
	endif
	printf \{qs(0xd8517ff0)}
	mempushcontext <slop_heap>
	if ($ps2_venues = 1)
		createpakmanmap map = zones links = ghzones folder = 'zones_ps2/' size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024) allocheap = <main_mem_heap> vramheap = <vram_heap>
	else
		createpakmanmap map = zones links = ghzones folder = 'zones/' size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024) allocheap = <main_mem_heap> vramheap = <vram_heap>
	endif
	mempopcontext
endscript
force_encore_autolaunch = 0

script autolaunch_spawned 
	($default_loading_screen.create)
	mc_setactiveplayer \{querydefault}
	if ($autolaunch_showstorageselector = 1)
		newshowstorageselector
	endif
	if globalexists \{name = debug_unlockall}
		playday_unlockall
	endif
	ui_event_block \{event = menu_add
		state = uistate_mainmenu
		data = {
			base_name = 'mainmenu'
		}}
	ui_event_block \{event = menu_add
		state = uistate_select_difficulty
		data = {
			base_name = 'select_difficulty'
		}}
	ui_event_block \{event = menu_add
		state = uistate_setlist
		data = {
			base_name = 'setlist'
		}}
	pausegh3
	ui_event event = menu_change data = {state = uistate_play_song device_num = ($player1_status.controller) uselaststarttime = 1 force_encore = $force_encore_autolaunch}
endscript

script kill_dummy_bg_camera 
	killcamanim \{name = dummy_cam_bg}
endscript

script restore_dummy_bg_camera 
	kill_dummy_bg_camera
	playigccam \{name = dummy_cam_bg
		viewport = bg_viewport
		pos = (-28.344543, 0.47631302, 7.1957684)
		quat = (-0.00071999995, -0.99706, -0.07604)
		fov = 72.0
		play_hold}
endscript

script get_levelzonearray_size 
	getarraysize \{$levelzonearray}
	size = (<array_size>)
	if globalexists \{name = download_levelzonearray
			type = array}
		getarraysize \{$download_levelzonearray}
		size = (<array_size> + <size>)
	endif
	return array_size = <size>
endscript

script get_levelzonearray_checksum 
	getarraysize \{$levelzonearray}
	if (<index> < <array_size>)
		return level_checksum = ($levelzonearray [<index>])
	else
		return level_checksum = ($download_levelzonearray [(<index> - <array_size>)])
	endif
endscript

script is_levelzone_downloaded \{level_checksum = load_z_artdeco}
	if arraycontains array = ($download_levelzonearray) contains = <level_checksum>
		formattext textname = filename '%s.pak' s = (($download_levelzones.<level_checksum>).name)
		getcontentfolderindexfromfile <filename>
		if (<device> = content)
			return \{download = 1
				true}
		else
			return \{download = 1
				false}
		endif
	else
		return \{download = 0
			true}
	endif
endscript
debug_cas_checksum_names = [
	largest_desc_id
	budget_report_main
	budget_report_vram
	budget_report_geo
	main
	vram
	underbudget
	overbudget
	totalsize
	slack
	heap_cas_vram
	assetsizes
	budgetsizes
	largestpieces
	worst_parts
	specific_parts
	custom_character_0
	custom_character_1
	custom_character_2
	custom_character_3
	custom_character_4
]

script getcurrentlevel 
	return level = ($current_level)
endscript

script get_level_prefix 
	if structurecontains \{structure = $levelzones
			$current_level}
		return prefix = ($levelzones.($current_level).name) prefix_crc = ($levelzones.($current_level).zone)
	endif
	printf \{qs(0xfd035b9c)}
	printf \{qs(0xc919c9ff)}
	printf \{qs(0xc350451a)}
	printf \{qs(0xfd035b9c)}
	printf \{qs(0xfd035b9c)}
	return \{prefix = 'z_unknown'
		prefix_crc = z_unknown}
endscript

script preqbromid 
	pausegh3
endscript

script postqbromid 
	restart_gem_scroller {
		song_name = ($current_song)
		difficulty = ($player1_status.difficulty)
		difficulty2 = ($player2_status.difficulty)
		difficulty3 = ($player3_status.difficulty)
		difficulty4 = ($player4_status.difficulty)
		starttime = ($current_starttime)
		device_num = ($player1_status.controller)
	}
endscript

script infrontend 
	return \{false}
endscript
rendering_has_been_stopped_explicit = false
rendering_has_been_stopped_hide_glitch = false
rendering_has_been_stopped_menu_transition = false
rendering_has_been_stopped_invalid_viewports = false
rendering_has_been_stopped_loading_screen = false

script startrendering \{reason = explicit}
	startrendering_c
	change \{pause_no_render = 0}
endscript

script stoprendering \{reason = explicit}
	stoprendering_c
	change \{pause_no_render = 1}
endscript

script get_player_status_checksum 
	requireparams \{[
			player
		]
		all}
	getmaxplayers
	if ((<player> < 1) || (<player> > <max_players>))
		softassert 'player value %p should be in range 1-4' p = <player>
		<player> = 1
	endif
	<player_status> = ($0x2994109a [<player>])
	return player_status = <player_status>
endscript

script get_replay_heap 
	return \{replay_heap = bottomupheap}
endscript

script are_replays_enabled 
	return \{false}
endscript

script runonqbr 
	if not cd
		return
	endif
	if (<file> = 'reloads\\guitar_band_preset_profiles.qb.xen')
		stars
		printf \{qs(0xb2f78668)}
		stars
		if ($cas_heap_state = in_cas)
			if getcurrentcasobject
				getarraysize \{$preset_musician_profiles_modifiable}
				i = 0
				begin
				globaltag_set_preset_musician savegame = ($cas_current_savegame) index = <i> appearance = ($preset_musician_profiles_modifiable [<i>].appearance)
				i = (<i> + 1)
				repeat <array_size>
				if NOT is_completely_custom_musician id = ($cas_current_profile) savegame = ($cas_current_savegame)
					refreshcasprofile
				endif
			endif
		endif
	endif
endscript

script hide_glitch \{num_frames = 1}
	spawnscriptnow hide_glitch_spawned params = {<...>}
endscript
hide_glitch_count = 0

script hide_glitch_spawned 
	onexitrun hide_glitch_spawned_exit params = {<...>}
	setscriptcannotpause
	change hide_glitch_count = ($hide_glitch_count + 1)
	stoprendering \{reason = hide_glitch}
	wait <num_frames> gameframes
endscript

script hide_glitch_spawned_exit 
	change hide_glitch_count = ($hide_glitch_count - 1)
	if ($hide_glitch_count = 0)
		startrendering \{reason = hide_glitch}
	endif
	if gotparam \{run_ui_event_afterwards}
		ui_event event = <run_ui_event_afterwards>
	endif
endscript

script playanimatedtexture 
	spawnscriptnow animatedtextureloop params = {<...>}
endscript

script animatedtextureloop \{u = -1
		v = -1
		framerate = 10
		grid_size_x = 8
		grid_size_y = 8
		count = -1
		showstats = 0
		start_x = 0
		start_y = 0}
	if NOT animatedtextureloop_cfunc_setup
		return
	endif
	begin
	if animatedtextureloop_cfunc
		break
	endif
	repeat
	animatedtextureloop_cfunc_cleanup
endscript

script setanimatingtexturestate \{state = -1}
	extendcrc <object> '_AnimTexture_State' out = 0xbae89da3
	if (<state> = -1)
		if getnodeflag (<0xbae89da3>)
			changenodeflag (<0xbae89da3>) 0
		else
			changenodeflag (<0xbae89da3>) 1
		endif
	else
		changenodeflag (<0xbae89da3>) (<state>)
	endif
endscript
g_movie_setup_count = 0

script pre_movie_cleanup 
	change g_movie_setup_count = ($g_movie_setup_count + 1)
	printf \{qs(0x5dd632c3)
		d = $g_movie_setup_count}
	if ($g_movie_setup_count > 1)
		return
	endif
	if NOT (isps2)
		return
	endif
	printf \{qs(0xb5cd3cd1)}
	unload_songqpak
	0x41688f4f \{heap_song}
	heap_size_song = <size>
	memdeleteheap \{name = 'heap_song'}
	printf \{qs(0xe542f460)}
	getpakmancurrent \{map = zones}
	0x296bb6d1 = <pak>
	setpakmancurrentblock \{map = zones
		pak = none
		block_scripts = 1}
	destroypakmanmap \{map = zones}
	printf \{qs(0x57b5af1c)}
	unloadpak \{'pak/oogame/oogame.pak'}
	return 0xd4935026 = {
		0x296bb6d1 = <0x296bb6d1>
		heap_size_song = <heap_size_song>
		heap_size_zones = <heap_size_zones>
		ui_flow_manager_state = ($ui_flow_manager_state [0])
	}
endscript

script post_movie_reset 
	get_heap_sizes
	change g_movie_setup_count = ($g_movie_setup_count - 1)
	printf \{qs(0xf9c1a5e7)
		d = $g_movie_setup_count}
	if ($g_movie_setup_count > 0)
		return
	endif
	if NOT ((isps2) || (isngc))
		return
	endif
	printstruct <...>
	pushmemprofile \{'Characters'}
	mempushcontext \{heap_cas}
	if ($ps2_venues = 1)
		createpakmanmap map = zones links = ghzones folder = 'zones_ps2/' uselinkslots size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024)
	else
		createpakmanmap map = zones links = ghzones folder = 'zones/' uselinkslots size = (<size_zones> / 1024) vram_size = (<size_zones_vram> / 1024)
	endif
	mempopcontext
	resetwaypoints
	setpakmancurrentblock map = zones pak = (<0xd4935026>.0x296bb6d1) block_scripts = 1
	printf \{qs(0x57553f72)}
	meminitheap name = 'heap_song' size = (<0xd4935026>.heap_size_song) vram_size = <heap_size_song_vram>
	popmemprofile
endscript

script reload_venue \{force_encore = 0}
	spawnscriptnow convoluted_because_of_wait_blocking_reload_venue params = {force_encore = <force_encore>}
endscript

script convoluted_because_of_wait_blocking_reload_venue 
	shut_down_flow_manager
	pausegame
	kill_gem_scroller
	start_song force_venue_reload = 1 force_encore = <force_encore>
endscript

script 0xbbafb1b3 
	begin
	if compositeobjectexists name = <0xf7107003>
		<0xf7107003> :obj_getboneposition bone = bone_pelvis
		new_x = <x>
		0xcf6a6193 = <z>
		<object> :obj_getposition
		0x086b4b3a = (<pos>.(0.0, 1.0, 0.0))
		new_pos = ((<new_x> * (1.0, 0.0, 0.0)) + (<0x086b4b3a> * (0.0, 1.0, 0.0)) + (<0xcf6a6193> * (0.0, 0.0, 1.0)))
		<object> :obj_setposition position = <new_pos>
	endif
	wait \{3
		gameframes}
	repeat
endscript

script userselectright 
	stars
	0x8dbdaee4 \{qs(0xa378e9d2)}
	0xe6b61ea6 ($edit_graphic_layer_infos)
	temp_struct = {($edit_graphic_layer_infos)}
	0xa3e92003 file = 'CAL_design.txt' label = 'CAL_Design' structure = <temp_struct>
endscript
