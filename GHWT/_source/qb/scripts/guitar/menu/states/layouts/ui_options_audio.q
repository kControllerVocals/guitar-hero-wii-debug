
script ui_create_options_audio 
	if NOT GotParam \{device_num}
		device_num = ($primary_controller)
	endif
	vocals_mute_all_mics \{mute = false}
	GetGlobalTags \{user_options}
	volume = [0 0 0 0 0 0]
	SetArrayElement ArrayName = volume index = 0 newvalue = (<volumes>.guitar.guitar.vol)
	SetArrayElement ArrayName = volume index = 1 newvalue = (<volumes>.guitar.Bass.vol)
	SetArrayElement ArrayName = volume index = 2 newvalue = (<volumes>.guitar.drum.vol)
	SetArrayElement ArrayName = volume index = 3 newvalue = (<volumes>.guitar.mic.vol)
	SetArrayElement ArrayName = volume index = 4 newvalue = (<volumes>.guitar.Vocals.vol)
	SetArrayElement ArrayName = volume index = 5 newvalue = (<volumes>.guitar.sfx.vol)
	eq = [1 1 1 1]
	SetArrayElement ArrayName = eq index = 0 newvalue = (<volumes>.guitar.guitar.eq)
	SetArrayElement ArrayName = eq index = 1 newvalue = (<volumes>.guitar.Bass.eq)
	SetArrayElement ArrayName = eq index = 2 newvalue = (<volumes>.guitar.drum.eq)
	SetArrayElement ArrayName = eq index = 3 newvalue = (<volumes>.guitar.mic.rev)
	CreateScreenElement {
		parent = root_window
		id = AudioInterface
		type = DescInterface
		desc = 'options_audio_mixer'
		tags = {volume = <volume> eq = <eq> dolby_digital = <dolby_digital>
			initial_volume = [7 7 7 7 7 7] initial_eq = [2 2 2 2]}
		z_priority = 100
		exclusive_device = <device_num>
	}
	AudioInterface :SE_SetProps \{mixer_channel_lamp_alpha = 0.0}
	if AudioInterface :Desc_ResolveAlias \{name = alias_audio_mixer_menu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SE_SetProps \{event_handlers = [
				{
					pad_back
					ui_options_check_settings
				}
				{
					pad_option
					ui_options_audio_reset_values
				}
				{
					pad_up
					sound_options_scroll
				}
				{
					pad_down
					sound_options_scroll
				}
			]}
		if GetScreenElementChildren \{id = current_menu}
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			<current_item> :SE_SetProps {
				event_handlers = [
					{focus ui_options_audio_focus_text_menu}
					{unfocus ui_options_audio_unfocus_text_menu}
					{pad_choose ui_options_audio_choose}
				]
				tags = {
					index = <i>
				}
			}
			i = (<i> + 1)
			repeat (<array_size> - 1)
			<current_item> = (<children> [<i>])
			<current_item> :SE_SetProps not_focusable alpha = 0.0
		endif
	endif
	if AudioInterface :Desc_ResolveAlias \{name = alias_faders_container}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			i = 0
			begin
			<current_item> = (<children> [<i>])
			<current_item> :SE_SetProps {
				event_handlers = [
					{focus ui_options_audio_focus_fader_menu}
					{unfocus ui_options_audio_unfocus_fader_menu}
					{pad_back ui_options_audio_fader_back}
					{pad_choose ui_options_audio_fader_choose}
					{pad_up ui_options_audio_fader_dir params = {up}}
					{pad_down ui_options_audio_fader_dir params = {down}}
				]
				tags = {
					index = <i>
					current = none
					highlight = slider
				}
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	ui_options_audio_set_values
	if (<dolby_digital> = 1)
		AudioInterface :SE_SetProps \{dolby_highlight_container_alpha = 1.0}
		AudioInterface :SE_SetProps \{mixer_red_light_OFF_alpha = 0.0}
	else
		AudioInterface :SE_SetProps \{dolby_highlight_container_alpha = 0.0}
		AudioInterface :SE_SetProps \{mixer_red_light_OFF_alpha = 1.0}
	endif
	menu_finish
	add_user_control_helper \{text = qs("RESET")
		button = Blue
		z = 100000}
	ui_options_set_settings
endscript

script ui_destroy_options_audio 
	vocals_mute_all_mics \{mute = true}
	DestroyScreenElement \{id = AudioInterface}
	generic_ui_destroy
endscript

script ui_options_audio_reset_values 
	AudioInterface :GetTags
	AudioInterface :SetTags {volume = <initial_volume> eq = <initial_eq>}
	ui_options_audio_set_values \{time = 0.1}
	SoundEvent \{event = Menu_Audio_Options_Reset}
endscript

script ui_options_audio_set_values \{time = 0.0}
	AudioInterface :GetTags
	if AudioInterface :Desc_ResolveAlias \{name = alias_faders_container}
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <volume>
			i = 0
			begin
			posx = (-10 * (1.0 - ((<volume> [<i>]) / 11.0)) + 10)
			posy = (170 * (1.0 - ((<volume> [<i>]) / 11.0)))
			<fader> = (<children> [<i>])
			<fader> :SE_SetProps {
				mixer_fader_pos = (((1.0, 0.0) * <posx>) + ((0.0, 1.0) * <posy>))
				time = <time>
			}
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if NOT IsPs3
	endif
	UpdateVolumesTag part = guitar name = guitar params = {vol = (<volume> [0])}
	UpdateVolumesTag part = guitar name = Bass params = {vol = (<volume> [1])}
	UpdateVolumesTag part = guitar name = drum params = {vol = (<volume> [2])}
	UpdateVolumesTag part = guitar name = mic params = {vol = (<volume> [3])}
	UpdateVolumesTag part = guitar name = Vocals params = {vol = (<volume> [4])}
	UpdateVolumesTag part = guitar name = sfx params = {vol = (<volume> [5])}
	UpdateVolumesTag part = guitar name = guitar params = {eq = (<eq> [0])}
	UpdateVolumesTag part = guitar name = Bass params = {eq = (<eq> [1])}
	UpdateVolumesTag part = guitar name = drum params = {eq = (<eq> [2])}
	UpdateVolumesTag part = guitar name = mic params = {rev = (<eq> [3])}
	ui_options_audio_update_all_volumes
	SongSetPlayerEQSettings
	if AudioInterface :Desc_ResolveAlias \{name = alias_VU_lights_container}
		GetScreenElementChildren id = <resolved_id>
		GetArraySize <volume>
		total = 0
		i = 0
		begin
		total = (<total> + ((<volume> [<i>]) * 0.9))
		i = (<i> + 1)
		repeat <array_size>
		total = (<total> / 7.0)
		i = 1
		begin
		current_item = (<children> [<i>])
		if (<i> < <total>)
			alpha = 1.0
			if ((<total> - <i>) < 1.0)
				alpha = (((<total> - <i>) / 2.0) + 0.5)
			endif
		else
			alpha = 0.5
		endif
		<current_item> :SE_SetProps alpha = <alpha> time = 0.1
		i = (<i> + 1)
		repeat 9
	endif
endscript

script ui_options_audio_focus_text_menu 
	GetTags
	Obj_GetID
	GetScreenElementPosition id = <ObjID>
	if NOT GotParam \{dolby_option}
		SE_SetProps \{rgba = [
				200
				200
				200
				255
			]}
		AudioInterface :SE_GetProps
		if NOT (<mixer_menu_highlight_alpha> = 1.0)
			AudioInterface :SE_SetProps mixer_menu_highlight_alpha = 1.0 mixer_menu_highlight_pos = (<screenelementpos> - (10.0, 160.0))
		else
			AudioInterface :SE_SetProps mixer_menu_highlight_pos = (<screenelementpos> - (10.0, 160.0)) time = 0.1
		endif
		AudioInterface :SE_SetProps mixer_channel_lamp_pos = ((440.0, 0.0) + ((87.0, 0.0) * <index>))
		AudioInterface :SE_SetProps \{mixer_channel_lamp_alpha = 0.5
			time = 0.1}
	else
		AudioInterface :SE_SetProps \{mixer_menu_highlight_alpha = 0.0
			text_dolby_rgba = [
				0
				200
				40
				255
			]}
		AudioInterface :SE_SetProps \{mixer_channel_lamp_alpha = 0.0
			time = 0.1}
	endif
	switch (<index>)
		case 0
		text = qs("Adjust the volume of your guitar")
		case 1
		text = qs("Adjust the volume of your bass")
		case 2
		text = qs("Adjust the volume of your drums")
		case 3
		text = qs("Adjust the volume of the mic input")
		case 4
		text = qs("Adjust the volume of the recorded vocals")
		case 5
		text = qs("Adjust the volume of the sound effects and crowd")
		case 6
		if isXenon
			if IsDolbyDigitalEnabled
				text = qs("Select to disable Dolby® Digital. May improve audio response time.")
			else
				text = qs("Select to enable Dolby® Digital. May delay audio response time.")
			endif
		else
			if IsPs3
				if IsDolbyDigitalEnabled
					text = qs("Tip: For improved reponse, disable Dolby® Digital in the XMB(tm)->Audio Output Settings.")
				else
					text = qs("Turning on Dolby® Digital in the XMB(tm)->Audio Output Settings may delay audio response time.")
				endif
			endif
		endif
	endswitch
	GetUpperCaseString <text>
	<text> = <UpperCaseString>
	AudioInterface :SE_SetProps mixer_info_text = <text>
endscript

script ui_options_audio_unfocus_text_menu 
	GetTags
	if NOT GotParam \{dolby_option}
		SE_SetProps \{rgba = [
				128
				128
				128
				255
			]}
	else
		AudioInterface :SE_SetProps \{text_dolby_rgba = [
				255
				255
				255
				255
			]}
	endif
endscript

script ui_options_audio_choose 
	clean_up_user_control_helpers
	menu_finish
	GetTags
	if AudioInterface :Desc_ResolveAlias \{name = alias_faders_container}
		if ResolveScreenElementId id = {<resolved_id> child = <index>}
			AudioInterface :SE_SetProps \{mixer_channel_lamp_alpha = 1.0
				time = 0.1}
			LaunchEvent \{type = unfocus
				target = current_menu}
			<resolved_id> :SE_GetProps
			<resolved_id> :SetTags current = slider highlight = slider
			LaunchEvent type = focus target = <resolved_id>
		endif
	endif
	current_menu :SE_SetProps \{alpha = 0.5
		time = 0.1}
	ui_options_sound_event \{choose}
endscript

script ui_options_audio_choose_dolby 
	return
	AudioInterface :SE_SetProps \{block_events}
	generic_menu_pad_choose_sound
	AudioInterface :GetTags
	if (<dolby_digital> = 1)
		AudioInterface :SetTags \{dolby_digital = 0}
	else
		AudioInterface :SetTags \{dolby_digital = 1}
	endif
	RemoveParameter \{dolby_digital}
	AudioInterface :obj_spawnscript \{ui_options_audio_dolby_flash}
	Wait \{0.8
		seconds}
	ui_options_audio_set_values
	Wait \{1
		seconds}
	KillSpawnedScript \{name = ui_options_audio_dolby_flash}
	AudioInterface :GetTags
	if (<dolby_digital> = 1)
		AudioInterface :SE_SetProps dolby_highlight_container_alpha = 1.0 time = <time>
		AudioInterface :SE_SetProps mixer_red_light_OFF_alpha = 0.0 time = <time>
	else
		AudioInterface :SE_SetProps dolby_highlight_container_alpha = 0.0 time = <time>
		AudioInterface :SE_SetProps mixer_red_light_OFF_alpha = 1.0 time = <time>
	endif
	ui_options_sound_event \{dolby_option}
	AudioInterface :SE_SetProps \{unblock_events}
	if isXenon
		if IsDolbyDigitalEnabled
			text = qs("Select to disable Dolby® Digital. May improve audio response time.")
		else
			text = qs("Select to enable Dolby® Digital. May delay audio response time.")
		endif
	else
		if IsPs3
			if IsDolbyDigitalEnabled
				text = qs("Tip: For improved reponse, disable Dolby® Digital in the XMB(tm)->Audio Output Settings.")
			else
				text = qs("Turning on Dolby® Digital in the XMB(tm)->Audio Output Settings may delay audio response time.")
			endif
		endif
	endif
	AudioInterface :SE_SetProps mixer_info_text = <text>
endscript

script ui_options_audio_dolby_flash 
	AudioInterface :SE_SetProps \{mixer_red_light_OFF_alpha = 1.0}
	begin
	AudioInterface :SE_SetProps dolby_highlight_container_alpha = RandomFloat (0.2, 0.5)
	Wait \{0.1
		seconds}
	repeat
endscript

script ui_options_audio_focus_fader_menu 
	GetTags
	if (<current> = none)
		if (<highlight> = slider)
			SE_SetProps \{knob_highlight_alpha = 0.0
				mixer_fader_highlight_alpha = 0.5}
		else
			SE_SetProps \{knob_highlight_alpha = 0.5
				mixer_fader_highlight_alpha = 0.0}
		endif
	elseif (<current> = slider)
		SE_SetProps \{knob_highlight_alpha = 0.0
			mixer_fader_highlight_alpha = 1.0}
	else
		SE_SetProps \{knob_highlight_alpha = 1.0
			mixer_fader_highlight_alpha = 0.0}
	endif
endscript

script ui_options_audio_unfocus_fader_menu 
	GetTags
	SE_SetProps \{knob_highlight_alpha = 0.0
		mixer_fader_highlight_alpha = 0.0}
endscript

script ui_options_audio_fader_choose 
	GetTags
	SE_GetProps
	clean_up_user_control_helpers
	menu_finish
	add_user_control_helper \{text = qs("RESET")
		button = Blue
		z = 100000}
	if (<current> = none)
		SetTags \{current = slider
			highlight = slider}
	elseif (<current> = slider)
		SetTags \{current = none}
		LaunchEvent \{type = focus
			target = current_menu}
		current_menu :SE_SetProps \{alpha = 1.0
			time = 0.1}
		LaunchEvent type = unfocus target = <ObjID>
		ui_options_sound_event \{choose}
		return
	else
		SetTags \{current = none
			highlight = dial}
	endif
	generic_menu_pad_choose_sound
	ui_options_audio_focus_fader_menu
endscript

script ui_options_audio_fader_back 
	GetTags
	Obj_GetID
	SE_GetProps
	clean_up_user_control_helpers
	menu_finish
	if (<current> = none)
		LaunchEvent \{type = focus
			target = current_menu}
		current_menu :SE_SetProps \{alpha = 1.0
			time = 0.1}
		LaunchEvent type = unfocus target = <ObjID>
		add_user_control_helper \{text = qs("RESET")
			button = Blue
			z = 100000}
	elseif (<current> = slider)
		ui_options_sound_event \{back}
		SetTags \{current = none}
		LaunchEvent \{type = focus
			target = current_menu}
		current_menu :SE_SetProps \{alpha = 1.0
			time = 0.1}
		LaunchEvent type = unfocus target = <ObjID>
		add_user_control_helper \{text = qs("RESET")
			button = Blue
			z = 100000}
	else
		SetTags \{current = none}
		ui_options_audio_focus_fader_menu
	endif
endscript

script ui_options_audio_fader_dir 
	GetTags
	if (<current> = none)
		if (<highlight> = slider)
			SetTags \{highlight = knob}
		else
			SetTags \{highlight = slider}
		endif
		generic_menu_up_or_down_sound
	elseif (<current> = slider)
		AudioInterface :GetTags
		new_volume = (<volume> [<index>])
		if GotParam \{down}
			if NOT (<new_volume> <= 0)
				new_volume = ((<volume> [<index>]) - 1)
			endif
		else
			if NOT (<new_volume> >= 11)
				new_volume = ((<volume> [<index>]) + 1)
			endif
		endif
		if NOT (<new_volume> = (<volume> [<index>]))
			SetArrayElement ArrayName = volume index = <index> newvalue = <new_volume>
			AudioInterface :SetTags volume = <volume>
			ui_options_audio_set_values \{time = 0.1}
			ui_options_sound_event slider index = <index>
		endif
	else
		AudioInterface :GetTags
		new_eq = (<eq> [<index>])
		if GotParam \{down}
			if NOT (<new_eq> <= 1)
				new_eq = ((<eq> [<index>]) - 1)
			endif
		else
			if NOT (<new_eq> >= 3)
				new_eq = ((<eq> [<index>]) + 1)
			endif
		endif
		if NOT (<new_eq> = (<eq> [<index>]))
			SetArrayElement ArrayName = eq index = <index> newvalue = <new_eq>
			AudioInterface :SetTags eq = <eq>
			ui_options_audio_set_values \{time = 0.1}
			ui_options_sound_event knob index = <index> newvalue = <new_eq>
		endif
	endif
	ui_options_audio_focus_fader_menu
endscript

script ui_options_sound_event 
	AudioInterface :GetTags
	if GotParam \{slider}
		current_volume = (<volume> [<index>])
		switch (<index>)
			case 0
			SoundEvent \{event = UI_Fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = guitar
					time = 1.3379999
				}}
			case 1
			SoundEvent \{event = UI_Fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = Bass
					time = 1.235
				}}
			case 2
			SoundEvent \{event = UI_Fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = Drums
					time = 1.8379999
				}}
			case 3
			SoundEvent \{event = UI_Fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = mic
					time = 2.826
				}}
			case 4
			SoundEvent \{event = UI_Fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = Vocals
					time = 2.629
				}}
			case 5
			SoundEvent \{event = UI_Fader}
			spawnscriptnow \{playing_sound_fader
				params = {
					instrument = sfx
					time = 2.612
				}}
		endswitch
	elseif GotParam \{knob}
		current_volume = (<eq> [<index>])
		SoundEvent \{event = UI_Knob}
		switch (<index>)
			case 0
			if GotParam \{newvalue}
				switch <newvalue>
					case 1
					if issoundplaying \{Audio_Options_Guitar}
						setsoundbusseffects \{effects = [
								{
									$EQ_GuitarLead_Crisp
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $EQ_GuitarLead_Crisp
								instrument = guitar
							}}
					endif
					change \{Guitar_Knob_Effects_Position = 1}
					case 2
					if issoundplaying \{Audio_Options_Guitar}
						setsoundbusseffects \{effects = [
								{
									$EQ_GuitarLead_Edgy
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $EQ_GuitarLead_Edgy
								instrument = guitar
							}}
					endif
					change \{Guitar_Knob_Effects_Position = 2}
					case 3
					if issoundplaying \{Audio_Options_Guitar}
						setsoundbusseffects \{effects = [
								{
									$EQ_GuitarLead_Fuzz
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $EQ_GuitarLead_Fuzz
								instrument = guitar
							}}
					endif
					change \{Guitar_Knob_Effects_Position = 3}
				endswitch
			endif
			case 1
			if GotParam \{newvalue}
				switch <newvalue>
					case 1
					if issoundplaying \{Audio_Options_Bass}
						setsoundbusseffects \{effects = [
								{
									$EQ_Bass_Bari
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $EQ_Bass_Bari
								instrument = Bass
							}}
					endif
					change \{Bass_Knob_Effects_Position = 1}
					case 2
					if issoundplaying \{Audio_Options_Bass}
						setsoundbusseffects \{effects = [
								{
									$EQ_Bass_Boomy
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $EQ_Bass_Boomy
								instrument = Bass
							}}
					endif
					change \{Bass_Knob_Effects_Position = 2}
					case 3
					if issoundplaying \{Audio_Options_Bass}
						setsoundbusseffects \{effects = [
								{
									$EQ_Bass_Fretty
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $EQ_Bass_Fretty
								instrument = Bass
							}}
					endif
					change \{Bass_Knob_Effects_Position = 3}
				endswitch
			endif
			case 2
			if GotParam \{newvalue}
				switch <newvalue>
					case 1
					if issoundplaying \{Audio_Options_Drum}
						setsoundbusseffects \{effects = [
								{
									$EQ_Drum_Punch
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $EQ_Drum_Punch
								instrument = Drums
							}}
					endif
					change \{Drum_Knob_Effects_Position = 1}
					case 2
					if issoundplaying \{Audio_Options_Drum}
						setsoundbusseffects \{effects = [
								{
									$EQ_Drum_Crack
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $EQ_Drum_Crack
								instrument = Drums
							}}
					endif
					change \{Drum_Knob_Effects_Position = 2}
					case 3
					if issoundplaying \{Audio_Options_Drum}
						setsoundbusseffects \{effects = [
								{
									$EQ_Drum_Sizzle
									name = audiooptionssound
								}
							]
							time = 0.2}
					else
						spawnscriptnow \{playing_sound_knob
							params = {
								eq_setting = $EQ_Drum_Sizzle
								instrument = Drums
							}}
					endif
					change \{Drum_Knob_Effects_Position = 3}
				endswitch
			endif
			case 3
		endswitch
	elseif GotParam \{dolby_option}
		if NOT IsPs3
			if (<dolby_digital> = 1)
				PlaySound \{Menu_DolbyDigitalEnable_Surround_L
					pan1x = -1
					pan1y = 1
					buss = front_end}
				PlaySound \{Menu_DolbyDigitalEnable_Surround_C
					pan1x = 0
					pan1y = 1
					buss = front_end}
				PlaySound \{Menu_DolbyDigitalEnable_Surround_R
					pan1x = 1
					pan1y = 1
					buss = front_end}
				PlaySound \{Menu_DolbyDigitalEnable_Surround_Ls
					pan1x = -1
					pan1y = -1
					buss = front_end}
				PlaySound \{Menu_DolbyDigitalEnable_Surround_Rs
					pan1x = -1
					pan1y = -1
					buss = front_end}
				PlaySound \{Menu_DolbyDigitalEnable_Surround_Lf
					LFEOnly = true
					LFE_vol = -15
					buss = front_end}
			else
				SoundEvent \{event = Dolby_Off}
			endif
		endif
	elseif GotParam \{back}
		SoundEvent \{event = Sound_Options_Back}
		StopSound \{Audio_Options_Guitar
			fade_time = 1
			fade_type = linear}
		StopSound \{Audio_Options_Bass
			fade_time = 1
			fade_type = linear}
		StopSound \{Audio_Options_Drum
			fade_time = 1
			fade_type = linear}
		StopSound \{Audio_Options_Mic
			fade_time = 1
			fade_type = linear}
		StopSound \{Audio_Options_SFX
			fade_time = 1
			fade_type = linear}
		StopSound \{Audio_Options_Vocals
			fade_time = 1
			fade_type = linear}
	elseif GotParam \{backgeneric}
		generic_menu_pad_back_sound
	elseif GotParam \{choose}
		SoundEvent \{event = Sound_Options_Select}
	endif
endscript

script ChangeSpinalTapVolume \{spinal_tap_volume_max = 11}
	<spinal_tap_volume> = (<spinal_tap_volume> + <change>)
	if (<spinal_tap_volume> < 0)
		<spinal_tap_volume> = 0
	elseif (<spinal_tap_volume> > <spinal_tap_volume_max>)
		<spinal_tap_volume> = <spinal_tap_volume_max>
	endif
	return volume = <spinal_tap_volume>
endscript

script ui_options_audio_get_buss_volume 
	switch <volume>
		case 11
		<vol> = -1.5
		case 10
		<vol> = -2.0
		case 9
		<vol> = -2.5
		case 8
		<vol> = -3.0
		case 7
		<vol> = -3.5
		case 6
		<vol> = -4.3
		case 5
		<vol> = -5.1
		case 4
		<vol> = -5.9
		case 3
		<vol> = -6.7
		case 2
		<vol> = -7.5
		case 1
		<vol> = -8.3
		case 0
		<vol> = -9.1
		default
		<vol> = -3.5
	endswitch
	return vol = <vol>
endscript

script ui_options_audio_update_all_volumes \{vol = 11
		time = 0}
	update_all_volumes <...>
endscript

script update_all_volumes \{time = 0
		player = 1}
	GetGlobalTags \{user_options}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.guitar.vol)
	SoundBussUnlock \{User_LeadGTR}
	SoundBussUnlock \{User_RhythmGTR}
	SetSoundBussParams {User_RhythmGTR = {vol = <vol>} time = <time>}
	SetSoundBussParams {User_LeadGTR = {vol = <vol>} time = <time>}
	SoundBussLock \{User_LeadGTR}
	SoundBussLock \{User_RhythmGTR}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.Bass.vol)
	SoundBussUnlock \{User_Bass}
	SetSoundBussParams {User_Bass = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Bass}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.drum.vol)
	SoundBussUnlock \{User_Drums}
	SetSoundBussParams {User_Drums = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Drums}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.mic.vol)
	ui_options_audio_update_mic_volume
	SoundBussUnlock \{User_Mic}
	SetSoundBussParams {Options_Vox = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Mic}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.Vocals.vol)
	SoundBussUnlock \{User_LeadVox}
	SetSoundBussParams {User_LeadVox = {vol = <vol>} time = <time>}
	SoundBussLock \{User_LeadVox}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.Band.vol)
	SoundBussUnlock \{User_Band}
	SetSoundBussParams {User_Band = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Band}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.sfx.vol)
	SoundBussUnlock \{User_Sfx}
	SoundBussUnlock \{User_Crowd}
	SoundBussUnlock \{User_CrowdSingalong}
	SetSoundBussParams {ui = {vol = <vol>} time = <time>}
	SetSoundBussParams {User_Crowd = {vol = <vol>} time = <time>}
	SetSoundBussParams {User_CrowdSingalong = {vol = <vol>} time = <time>}
	SoundBussLock \{User_Sfx}
	SoundBussLock \{User_Crowd}
	SoundBussLock \{User_CrowdSingalong}
	ui_options_audio_get_buss_volume volume = (<volumes>.guitar.backup.vol)
endscript

script ui_options_audio_update_mic_volume \{player = 1}
	if PlayerInfoEquals <player> is_local_client = 0
		return
	endif
	GetPlayerInfo <player> checksum
	get_savegame_from_player_status player_status = <checksum>
	GetGlobalTags savegame = <savegame> user_options
	micvolume = (<volumes>.guitar.mic.vol)
	if IsPs3
		switch <micvolume>
			case 11
			<micgain> = 0.0
			<micthreshold> = -14
			<gainmakeup> = -3
			case 10
			<micgain> = 0.0
			<micthreshold> = -15
			<gainmakeup> = -3
			case 9
			<micgain> = 0.0
			<micthreshold> = -15
			<gainmakeup> = -4
			case 8
			<micgain> = 0.0
			<micthreshold> = -16
			<gainmakeup> = -5
			case 7
			<micgain> = 0.0
			<micthreshold> = -16
			<gainmakeup> = -6
			case 6
			<micgain> = 0.0
			<micthreshold> = -17
			<gainmakeup> = -6
			case 5
			<micgain> = 0.0
			<micthreshold> = -17
			<gainmakeup> = -7
			case 4
			<micgain> = 0.0
			<micthreshold> = -17
			<gainmakeup> = -8
			case 3
			<micgain> = 0.0
			<micthreshold> = -18
			<gainmakeup> = -8
			case 2
			<micgain> = 0.0
			<micthreshold> = -18
			<gainmakeup> = -9
			case 1
			<micgain> = 0.0
			<micthreshold> = -19
			<gainmakeup> = -9
			case 0
			<micgain> = 0.0
			<micthreshold> = -20
			<gainmakeup> = -10
			default
			<micgain> = 0.0
			<micthreshold> = -16
			<gainmakeup> = -6
		endswitch
	else
		switch <micvolume>
			case 11
			<micgain> = 0.0
			<micthreshold> = -10
			<gainmakeup> = 1
			case 10
			<micgain> = 0.0
			<micthreshold> = -11
			<gainmakeup> = 1
			case 9
			<micgain> = 0.0
			<micthreshold> = -11
			<gainmakeup> = 0
			case 8
			<micgain> = 0.0
			<micthreshold> = -12
			<gainmakeup> = -1
			case 7
			<micgain> = 0.0
			<micthreshold> = -12
			<gainmakeup> = -2
			case 6
			<micgain> = 0.0
			<micthreshold> = -13
			<gainmakeup> = -2
			case 5
			<micgain> = 0.0
			<micthreshold> = -13
			<gainmakeup> = -3
			case 4
			<micgain> = 0.0
			<micthreshold> = -13
			<gainmakeup> = -4
			case 3
			<micgain> = 0.0
			<micthreshold> = -14
			<gainmakeup> = -4
			case 2
			<micgain> = 0.0
			<micthreshold> = -14
			<gainmakeup> = -5
			case 1
			<micgain> = 0.0
			<micthreshold> = -15
			<gainmakeup> = -5
			case 0
			<micgain> = 0.0
			<micthreshold> = -16
			<gainmakeup> = -6
			default
			<micgain> = 0.0
			<micthreshold> = -12
			<gainmakeup> = -2
		endswitch
	endif
	Vocals_SetMicGain player = 1 gain = <micgain>
	Vocals_SetMicGain player = 2 gain = <micgain>
	Vocals_SetMicGain player = 3 gain = <micgain>
	Vocals_SetMicGain player = 4 gain = <micgain>
endscript

script ui_options_audio_set_dolby_digital 
	if isXenon
		GetGlobalTags \{user_options}
		if (<dolby_digital> = 0)
			DisableDolbyDigital
		else
			EnableDolbyDigital
		endif
	endif
endscript
