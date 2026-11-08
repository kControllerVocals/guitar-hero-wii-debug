
script do_jam_loading 
	printf \{channel = jam_mode
		qs("\LSTART JAM LOADING")}
	SetSoundBussParams {Crowd_Beds = {vol = (($Default_BussSet.Crowd_Beds.vol) - 100)} time = 3}
	if ($jam_view_cam_created = 0)
		unload_songqpak
		create_loading_screen \{jam_mode = 1}
		destroy_band
		change \{current_level = load_z_studio}
		Load_Venue \{block_scripts = 0}
		if NOT GotParam \{no_band}
			change \{jam_mode_band = 1}
			change \{structurename = player1_status
				character_id = Guitarist}
			change \{structurename = player1_status
				part = guitar}
			create_band \{async = 1}
			change \{jam_mode_band = 0}
		endif
		apply_band_logo_to_venue \{step = build}
		Wait \{2
			gameframes}
		apply_band_logo_to_venue \{step = apply}
		create_bandname_viewport
		BandManager_AllChangeStance \{stance = Stance_A
			no_wait}
		Band_SetArmAnimStrength \{name = Guitarist
			target = fret_anim_mod
			strength = 1.0}
		Band_SetArmAnimStrength \{name = bassist
			target = fret_anim_mod
			strength = 1.0}
		Band_SetArmAnimStrength \{name = vocalist
			target = fret_anim_mod
			strength = 1.0}
		Drummer :Anim_Command \{target = DrumKit
			command = ApplyDrumKitDifference_PrepareAnims
			params = {
				anims = [
					GH_Drum_Tom_1
					GH_Drum_Tom_2
					GH_Drum_Snare
					GH_Drum_Cymbal_1
					GH_Drum_Cymbal_2
					GH_Drum_Cymbal_3
					GH_Drum_Kick
					GH_Drum_Cymbal_HH_Open
					GH_Drum_Cymbal_HH_Closed
				]
				hold_list = [
					GH_Drum_Cymbal_HH_Closed
				]
			}}
		change \{target_jam_camera_prop = jam_look_at_mixer}
		Wait \{2
			gameframes}
		if NOT GotParam \{no_band}
			if ObjectExists \{id = Drummer}
				Drummer :Anim_Command \{target = Body
					command = DegenerateBlend_AddBranch
					params = {
						Tree = $faceoff_drummer_notempo
						BlendDuration = 0.0
						params = {
							Anim = Drum_Andy_StandardLP_HS_120_01
						}
					}}
			endif
		endif
		destroy_bg_viewport
		setup_bg_viewport
		PlayIGCCam \{name = jam_view_cam
			viewport = bg_viewport
			controlscript = jam_camera_script
			Play_hold = 1}
		change \{jam_view_cam_created = 1}
		ReloadSfx \{mode = jammode
			noreset = 1}
	endif
	printf \{channel = jam_mode
		qs("\LDONE JAM LOADING")}
	Wait \{0.5
		seconds}
	SetSoundBussParams {Crowd_Beds = {vol = ($Default_BussSet.Crowd_Beds.vol)} time = 1}
endscript

script create_jam_menu 
	if IsLoggedIn
		ClearGHTunesCache
	endif
	change \{rich_presence_context = presence_music_studio}
	jam_init_reverb
	begin
	if ($jam_view_cam_created = 1)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	destroy_all_exploding_text
	printf \{channel = jam_mode
		qs("\LCREATE JAM MENU")}
	change \{signin_jam_mode = 0}
	KillCamAnim \{name = ch_view_cam}
	KillCamAnim \{name = menu_view_cam}
	directorylisting = $jam_curr_directory_listing
	disable_pause
	UnPauseGame
	Menu_Music_Off
	BG_Crowd_Front_End_Silence
	if NOT ($target_jam_camera_prop = jam_look_at_mixer)
		change \{target_jam_camera_prop = jam_look_at_mixer}
		jam_camera_wait
	endif
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = jam_container}
	make_generic_menu \{title = qs("STUDIO")
		pad_back_script = menu_jam_back
		vmenu_id = jam_menu
		dims = (400.0, 400.0)}
	add_generic_menu_icon_item \{icon = icon_jam_recording
		text = qs("Recording Studio")
		choose_state = UIstate_jam_select_song
		choose_state_data = {
			curr_tab = 0
		}}
	normal_controller = 0
	if NOT IsDrumController controller = ($primary_controller)
		if NOT IsGuitarController controller = ($primary_controller)
			<normal_controller> = 1
		endif
	endif
	add_generic_menu_icon_item \{icon = icon_jam_ghmix
		text = qs("GHMix")
		choose_state = UIstate_jam_select_song
		choose_state_data = {
			curr_tab = 0
			advanced_record = 1
		}}
	if ($disable_wifi = 1)
		<wifi_enable_props> = {not_focusable}
		<color_props> = {rgba = [50 44 35 255]}
	else
		<wifi_enable_props> = {}
		<color_props> = {rgba = [100 88 70 255]}
	endif
	add_generic_menu_icon_item {
		icon = icon_jam_ghtunes
		text = qs("GHTunes")
		<wifi_enable_props>
		choose_state = UIstate_jam_ghtunes
	}
	CreateScreenElement {
		type = TextElement
		parent = <item_container_id>
		id = ghtunes_sm
		text = qs("\LSM")
		font = fontgrid_text_a6
		just = [left top]
		scale = 0.3
		pos = (220.0, 10.0)
		<color_props>
	}
	<item_container_id> :SE_SetProps {
		event_handlers = [
			{focus retail_menu_focus params = {id = <id>}}
			{unfocus retail_menu_unfocus params = {id = <id>}}
		]
	}
	add_generic_menu_icon_item \{icon = icon_jam_tutorial
		text = qs("Tutorials")
		pad_choose_script = jam_goto_tutorials}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("SELECT")
		button = green
		z = 100}
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100}
	LaunchEvent \{type = focus
		target = current_menu}
	destroy_loading_screen
	startrendering
	spawnscriptnow \{jam_recording_check_disconnect}
endscript

script jam_picked_ghtunes 
	generic_event_choose state = uistate_signin data = {device_num = ($primary_controller) allow_back = 1 new_state = UIstate_jam_ghtunes require_live = 1 jam = 1}
endscript

script jam_ghmix_failed_dialog 
	LaunchEvent \{type = unfocus
		target = current_menu}
	clean_up_user_control_helpers
	destroy_popup_warning_menu
	FormatText \{TextName = dialog_txt
		qs(0xbe78dc5d)}
	create_popup_warning_menu {
		title = qs("GHMix")
		textblock = {
			text = <dialog_txt>
			pos = (640.0, 370.0)
		}
		menu_pos = (640.0, 465.0)
		options = [
			{
				func = {jam_ghmix_refresh}
				text = qs("GO BACK")
			}
		]
	}
endscript

script jam_ghmix_refresh 
	destroy_popup_warning_menu
	ui_event \{event = menu_refresh}
endscript

script jam_change_look_at_cam \{cam = jam_look_at_mixer}
	return
	change target_jam_camera_prop = <cam>
	change \{jam_view_cam_morph_time = 0.4}
	change \{jam_camera_changing = 0}
endscript

script jam_goto_tutorials 
	<wrong_controller> = 0
	if NOT IsGuitarController controller = ($primary_controller)
		if NOT IsDrumController controller = ($primary_controller)
			if NOT ($allow_controller_for_all_instruments = 1)
				LaunchEvent \{type = unfocus
					target = current_menu}
				create_popup_warning_menu \{no_background
					title = qs("WARNING")
					textblock = {
						text = qs("These tutorials require you to be using a Guitar controller or Drum Kit.")
					}
					options = [
						{
							func = {
								jam_return_to_jam
							}
							func_params = {
							}
							text = qs("OK")
						}
					]}
				<wrong_controller> = 1
			endif
		endif
	endif
	if (<wrong_controller> = 0)
		destroy_jam_song_select_menu
		generic_event_choose \{state = uistate_jam_tutorials}
	endif
endscript

script jam_return_to_jam 
	destroy_popup_warning_menu
	LaunchEvent \{type = focus
		target = current_menu}
endscript

script menu_jam_back 
	if NOT ui_event_exists_in_stack \{name = 'recording_disconnect'}
		LaunchEvent \{type = unfocus
			target = current_menu}
		clean_up_user_control_helpers
		create_loading_screen
		KillCamAnim \{name = jam_view_cam}
		generic_event_back \{nosound}
	endif
endscript

script destroy_jam_menu 
	set_focus_color
	set_unfocus_color
	if ScreenElementExists \{id = jam_tutorial_select_container}
		DestroyScreenElement \{id = jam_tutorial_select_container}
	endif
	if ScreenElementExists \{id = jam_container}
		DestroyScreenElement \{id = jam_container}
	endif
	destroy_generic_menu
	KillSpawnedScript \{name = jam_recording_check_disconnect}
	KillSpawnedScript \{id = jam_spawns}
	destroy_menu_backdrop
	destroy_viewport_ui
	LightShow_Shutdown
endscript

script jam_menu_get_lefty 
	if ($is_attract_mode = 1)
		return \{lefty = 0}
	endif
	lefty = 0
	GetPlayerInfo <player> lefty_flip
	return lefty = <lefty_flip>
endscript

script has_lefty_adj_control_press 
	jam_menu_get_lefty player = <player>
	if (<lefty> = 0)
		if (<dir> = up)
			if ControllerPressed up <controller>
				return \{true}
			endif
		else
			if ControllerPressed down <controller>
				return \{true}
			endif
		endif
	else
		if (<dir> = down)
			if ControllerPressed up <controller>
				return \{true}
			endif
		else
			if ControllerPressed down <controller>
				return \{true}
			endif
		endif
	endif
	return \{false}
endscript
