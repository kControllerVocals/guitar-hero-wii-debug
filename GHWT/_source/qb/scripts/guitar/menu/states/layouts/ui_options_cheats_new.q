
script ui_create_options_cheats_new 
	Menu_Music_Off
	CreateScreenElement \{parent = root_window
		id = CheatsInterface
		type = DescInterface
		desc = 'new_cheat'
		pos_anchor = [
			center
			top
		]
		just = [
			0.0
			-0.95
		]
		scale = 1.1
		pos = (-350.0, 0.0)}
	if CheatsInterface :Desc_ResolveAlias \{name = alias_key_bars}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SE_SetProps {
			event_handlers = [
				{pad_start ui_options_cheats_new_back}
				{pad_option ui_options_cheats_new_enter params = {key = Blue}}
				{pad_back ui_options_cheats_new_enter params = {key = red}}
				{pad_choose ui_options_cheats_new_enter params = {key = green}}
				{pad_option2 ui_options_cheats_new_enter params = {key = Yellow}}
				{pad_option ui_options_cheats_new_sound_events params = {Sound = Input key = Blue}}
				{pad_back ui_options_cheats_new_sound_events params = {Sound = Input key = red}}
				{pad_choose ui_options_cheats_new_sound_events params = {Sound = Input key = green}}
				{pad_option2 ui_options_cheats_new_sound_events params = {Sound = Input key = Yellow}}
			]
			tags = {
				index = 0
				cheat_array = [none none none none none none none none]
			}
			exclusive_device = ($primary_controller)
		}
	endif
	if CheatsInterface :Desc_ResolveAlias \{name = alias_volume_bars}
		AssignAlias id = <resolved_id> alias = bar_menu
	endif
	if CheatsInterface :Desc_ResolveAlias \{name = alias_cheat_tv_glow}
		<resolved_id> :obj_spawnscript ui_options_cheats_new_tv_glow
	endif
	if CheatsInterface :Desc_ResolveAlias \{name = alias_info_container}
		AssignAlias id = <resolved_id> alias = info_container
	endif
	add_user_control_helper \{text = qs("DONE")
		button = start
		z = 100000}
endscript

script ui_destroy_options_cheats_new 
	spawnscriptnow \{menu_music_on}
	DestroyScreenElement \{id = CheatsInterface}
	generic_ui_destroy
endscript

script ui_options_cheats_new_back 
	LaunchEvent \{type = unfocus
		target = current_menu}
	ui_options_cheats_new_reset_bars
	generic_event_back
endscript

script ui_options_cheats_new_enter 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	SE_SetProps \{block_events}
	GetTags
	GetScreenElementChildren \{id = bar_menu}
	current_key = (<children> [<index>])
	SetArrayElement ArrayName = cheat_array index = <index> newvalue = <key>
	SetTags {cheat_array = <cheat_array>}
	GetScreenElementChildren \{id = current_menu}
	switch (<key>)
		case green
		<current_key> :SE_SetProps rgba = [38 229 38 255]
		<current_key> :SE_SetProps alpha = 1.0
		current_bar = (<children> [0])
		<current_bar> :SE_SetProps alpha = 1.0 time = 0.1
		<current_bar> :SE_WaitProps
		<current_bar> :SE_SetProps alpha = 0.0 time = 0.1
		case red
		<current_key> :SE_SetProps rgba = [210 19 19 255]
		<current_key> :SE_SetProps alpha = 1.0
		current_bar = (<children> [1])
		<current_bar> :SE_SetProps alpha = 1.0 time = 0.1
		<current_bar> :SE_WaitProps
		<current_bar> :SE_SetProps alpha = 0.0 time = 0.1
		case Yellow
		<current_key> :SE_SetProps rgba = [248 248 57 255]
		<current_key> :SE_SetProps alpha = 1.0
		current_bar = (<children> [2])
		<current_bar> :SE_SetProps alpha = 1.0 time = 0.1
		<current_bar> :SE_WaitProps
		<current_bar> :SE_SetProps alpha = 0.0 time = 0.1
		case Blue
		<current_key> :SE_SetProps rgba = [7 7 198 255]
		<current_key> :SE_SetProps alpha = 1.0
		current_bar = (<children> [3])
		<current_bar> :SE_SetProps alpha = 1.0 time = 0.1
		<current_bar> :SE_WaitProps
		<current_bar> :SE_SetProps alpha = 0.0 time = 0.1
		case Clear
		ui_options_cheats_new_reset_bars
		SE_SetProps \{unblock_events}
		return
	endswitch
	FormatText TextName = channel_text qs("\L0%i") i = (<index> + 1)
	CheatsInterface :SE_SetProps channel_text = <channel_text>
	if (<index> >= 7)
		Wait \{0.25
			seconds}
		ui_options_cheats_new_check_valid
		if GotParam \{cheat}
			if NOT GotParam \{already_unlocked}
				CheatsInterface :SE_SetProps info_text = ((<cheat>.name_text) + qs(" UNLOCKED!!!"))
				cheat_sound = unlocked
			else
				CheatsInterface :SE_SetProps info_text = ((<cheat>.name_text) + qs(" ALREADY UNLOCKED!!!"))
				cheat_sound = already_unlocked
			endif
		else
			CheatsInterface :SE_SetProps {
				info_text = Random (
					@ $wii_cheat_wrong
					@ $wii_cheat_incorrect
					@ $wii_cheat_better_luck
					@ $wii_cheat_no_dice
					@ $wii_cheat_nice_try
					@ $wii_cheat_try_again
					@ $wii_cheat_no_cheats_for_you
					@ $wii_cheat_bad_cheat
					@ $wii_cheat_quit_guessing
					@ $wii_cheat_there_are_only
					@ $wii_cheat_keep_guessing
					@ $wii_cheat_not_this_time
					@ $wii_cheat_nooo
					@ $wii_cheat_oh_noes
					@ $wii_cheat_placebo_cheat_activated
					@ $wii_cheat_your_getting_warmer
					@ $wii_cheat_not_valid
					@ $wii_cheat_one_down
					@ qs("\L:(")
					@ $wii_cheat_give_up_while_ahead
					@ $wii_cheat_what_are_you_doing
					@ $wii_cheat_killer_combo
					@ $wii_cheat_missed_note
					@ $wii_cheat_bzzzzzt
					@ $wii_cheat_divide_by_zero
					@ $wii_cheat_does_not_compute
					)
			}
			cheat_sound = incorrect
		endif
		obj_spawnscript ui_options_cheats_new_sound_events params = {Sound = down cheat = <cheat_sound>}
		info_container :SE_SetProps \{pos = {
				(0.0, -100.0)
				relative
			}}
		info_container :SE_WaitProps
		info_container :SE_SetProps \{alpha = 1.0}
		info_container :SE_SetProps \{pos = {
				(0.0, 100.0)
				relative
			}
			time = 0.1}
		info_container :SE_WaitProps
		obj_spawnscript ui_options_cheats_new_sound_events params = {Sound = shake cheat = <cheat_sound>}
		begin
		info_container :SE_SetProps \{pos = {
				(0.0, 5.0)
				relative
			}
			time = 0.075}
		info_container :SE_WaitProps
		info_container :SE_SetProps \{pos = {
				(0.0, -5.0)
				relative
			}
			time = 0.075}
		info_container :SE_WaitProps
		repeat 10
		obj_spawnscript ui_options_cheats_new_sound_events params = {Sound = up cheat = <cheat_sound>}
		info_container :SE_SetProps \{pos = {
				(0.0, -100.0)
				relative
			}
			time = 0.1}
		info_container :SE_WaitProps
		info_container :SE_SetProps \{alpha = 0.0}
		info_container :SE_SetProps \{pos = {
				(0.0, 100.0)
				relative
			}}
		ui_options_cheats_new_reset_bars
	else
		SetTags {index = (<index> + 1)}
	endif
	SE_SetProps \{unblock_events}
endscript

script ui_options_cheats_new_reset_bars 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	current_menu :GetTags
	if (<index> = 0)
		return
	endif
	if GetScreenElementChildren \{id = bar_menu}
		GetArraySize <children>
		array_size = (<index> + 1)
		i = <index>
		begin
		current_key = (<children> [<i>])
		FormatText TextName = channel_text qs("\L0%i") i = <i>
		current_menu :obj_spawnscript ui_options_cheats_new_sound_events params = {Sound = Clear key = (<cheat_array> [<i>])}
		<current_key> :SE_SetProps alpha = 0.0 time = 0.1
		CheatsInterface :SE_SetProps channel_text = <channel_text>
		<current_key> :SE_WaitProps
		i = (<i> - 1)
		repeat <array_size>
		Wait \{0.1
			seconds}
	endif
	current_menu :SetTags \{index = 0
		cheat_array = [
			none
			none
			none
			none
			none
			none
			none
			none
		]}
endscript

script ui_options_cheats_new_check_valid 
	current_menu :GetTags
	GetArraySize ($guitar_hero_cheats)
	GetGlobalTags \{user_options}
	<found> = 0
	if (<array_size> > 0)
		i = 0
		begin
		j = 0
		begin
		if NOT ((($guitar_hero_cheats [<i>]).unlock_pattern [<j>]) = (<cheat_array> [<j>]))
			break
		endif
		j = (<j> + 1)
		repeat 8
		if (<j> = 8)
			cheat = ($guitar_hero_cheats [<i>])
			FormatText checksumname = cheat_checksum 'unlock_Cheat_%a' a = (<cheat>.name)
			if GotParam <cheat_checksum>
				if ((<...>.<cheat_checksum>) = 0)
					AddParam structure_name = params name = <cheat_checksum> value = 1
					SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = <i> newvalue = 0
					FormatText checksumname = cheat_idx 'cheat_index%a' a = <i>
					AddParam structure_name = params name = <cheat_idx> value = 0
					SetGlobalTags user_options params = <params>
					option_array = ($guitar_hero_cheats [<i>].options)
					option_struct = (<option_array> [0])
					globals = (<option_struct>.globals)
					cheat_set_globals globals = <globals>
					exclude_option option_struct = <option_struct> no_menu_update
					<found> = 1
				else
					<found> = 2
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	if (<found> = 1)
		return {cheat = <cheat>}
	endif
	if (<found> = 2)
		return {cheat = <cheat> already_unlocked}
	endif
	if NOT CD
		GetArraySize ($guitar_hero_debug_cheats)
		if (<array_size> > 0)
			i = 0
			begin
			j = 0
			begin
			if NOT ((($guitar_hero_debug_cheats [<i>]).unlock_pattern [<j>]) = (<cheat_array> [<j>]))
				break
			endif
			j = (<j> + 1)
			repeat 8
			if (<j> = 8)
				cheat = ($guitar_hero_debug_cheats [<i>])
				return {cheat = <cheat>}
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	GetArraySize ($guitar_hero_hidden_cheats)
	if (<array_size> > 0)
		i = 0
		begin
		j = 0
		begin
		if NOT ((($guitar_hero_hidden_cheats [<i>]).unlock_pattern [<j>]) = (<cheat_array> [<j>]))
			break
		endif
		j = (<j> + 1)
		repeat 8
		if (<j> = 8)
			cheat = ($guitar_hero_hidden_cheats [<i>])
			change globalname = (($guitar_hero_hidden_cheats [<i>]).global) newvalue = (($guitar_hero_hidden_cheats [<i>]).value)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script ui_options_cheats_new_tv_glow 
	begin
	SE_SetProps alpha = RandomFloat (0.15, 0.25) time = RandomFloat (0.025, 0.07)
	SE_WaitProps
	SE_SetProps alpha = 0.1 time = RandomFloat (0.025, 0.07)
	SE_WaitProps
	Wait \{1
		gameframe}
	repeat
endscript

script ui_options_cheats_new_sound_events 
	switch (<Sound>)
		case Input
		switch (<key>)
			case green
			SoundEvent \{event = Menu_Cheat_Enter_Green}
			case red
			SoundEvent \{event = Menu_Cheat_Enter_Red}
			case Yellow
			SoundEvent \{event = Menu_Cheat_Enter_Yellow}
			case Blue
			SoundEvent \{event = Menu_Cheat_Enter_Blue}
		endswitch
		case down
		switch (<cheat>)
			case unlocked
			SoundEvent \{event = Enter_Band_Name_Finish}
			case already_unlocked
			SoundEvent \{event = Menu_Warning_SFX}
			case incorrect
			SoundEvent \{event = Menu_Warning_SFX}
		endswitch
		case shake
		switch (<cheat>)
		endswitch
		case up
		switch (<cheat>)
		endswitch
		case Clear
		switch (<key>)
			case green
			PlaySound \{Menu_EnterName_Scroll_1
				vol = -1
				buss = front_end}
			case red
			PlaySound \{Menu_EnterName_Scroll_1
				vol = -1
				buss = front_end}
			case Yellow
			PlaySound \{Menu_EnterName_Scroll_1
				vol = -1
				buss = front_end}
			case Blue
			PlaySound \{Menu_EnterName_Scroll_1
				vol = -1
				buss = front_end}
		endswitch
		case quit
		generic_menu_pad_back_sound
	endswitch
endscript
