freestyle_max_players = 2
freestyle_player_data = [
	{
	}
	{
	}
]
freestyle_player_count = 0

script freestyle_set_default_player_data 
	i = 0
	begin
	SetStructureParam array_name = freestyle_player_data array_index = <i> param = instrument value = none
	SetStructureParam array_name = freestyle_player_data array_index = <i> param = lefty value = false
	SetStructureParam array_name = freestyle_player_data array_index = <i> param = tuning value = null
	SetStructureParam array_name = freestyle_player_data array_index = <i> param = controller value = -1
	SetStructureParam array_name = freestyle_player_data array_index = <i> param = whammy_reverse value = false
	SetStructureParam array_name = freestyle_player_data array_index = <i> param = difficulty value = easy
	SetStructureParam array_name = freestyle_player_data array_index = <i> param = mii_index value = -1
	SetStructureParam array_name = freestyle_player_data array_index = <i> param = mii_is_random value = 1
	SetStructureParam array_name = freestyle_player_data array_index = <i> param = character value = none
	SetStructureParam array_name = freestyle_player_data array_index = <i> param = signin_time value = -1
	SetStructureParam array_name = freestyle_player_data array_index = <i> param = controller_type value = none
	<i> = (<i> + 1)
	repeat $freestyle_max_players
	SetStructureParam \{array_name = freestyle_player_data
		array_index = 0
		param = character
		value = Guitarist}
	SetStructureParam \{array_name = freestyle_player_data
		array_index = 0
		param = instrument
		value = guitar}
	SetStructureParam \{array_name = freestyle_player_data
		array_index = 1
		param = character
		value = Drummer}
	SetStructureParam \{array_name = freestyle_player_data
		array_index = 1
		param = instrument
		value = Drums}
	enable_pause
	LaunchEvent \{type = focus
		target = root_window}
endscript

script freestyle_create_characters 
	player = 0
	begin
	if ($freestyle_player_data [<player>].mii_is_random = 1)
		mii_index = RandomInteger (0.0, 10.0)
		SetStructureParam array_name = freestyle_player_data array_index = <player> param = mii_index value = <mii_index>
	endif
	FormatText checksumname = player_status 'player%p_status' p = (<player> + 1)
	character = ($freestyle_player_data [<player>].character)
	switch (<character>)
		case Guitarist
		newbody = {}
		if MiiIsFemale mii_index = ($freestyle_player_data [<player>].mii_index) mii_use_random = ($freestyle_player_data [<player>].mii_is_random)
			newbody = {desc_id = mii_female}
		else
			newbody = {desc_id = mii_body}
		endif
		if NOT (SearchMusicianProfileArray array_name = Preset_Musician_Profiles_Locked id = mii)
			ScriptAssert \{qs(0x94aa46e8)}
		endif
		profile_struct = ($Preset_Musician_Profiles_Locked [<index>])
		appearance = (<profile_struct>.appearance)
		UpdateStructElement struct = <appearance> element = CAS_Male_Base_Torso value = <newbody>
		appearance = <newstruct>
		profile_struct = {<profile_struct> appearance = <appearance>}
		SetArrayElement ArrayName = Preset_Musician_Profiles_Locked index = <index> newvalue = <profile_struct> GlobalArray
		change \{structurename = guitarist_info
			anim_set = Mii_anims_set}
		change \{structurename = guitarist_info
			stance = stance_c}
		change \{structurename = guitarist_info
			next_stance = stance_c}
		change \{structurename = guitarist_info
			current_anim = Idle}
		change \{structurename = guitarist_info
			cycle_anim = false}
		change \{structurename = guitarist_info
			next_anim = none}
		change \{structurename = guitarist_info
			playing_missed_note = false}
		change \{structurename = guitarist_info
			waiting_for_cameracut = false}
		create_guitarist {
			profile_id = mii
			savegame = 0
			name = Guitarist
			loading_into_song = assassin
			player_status = <player_status>
			create_mii
			freestyle_player = <player>
		}
		Guitarist :Mii_MatchHandTextureColorToFace \{oldTextureName = `Tex\models\Characters\guitarists\Mii\Mii_Hands.png`
			texSize = (16.0, 16.0)}
		freestyle_try_fret_anims \{event_triggered = 0}
		case Drummer
		drummer_stance = Stance_A
		switch ($freestyle_music_type)
			case metal
			<drummer_stance> = Metal_Idle
			case Rock
			<drummer_stance> = Rock_Idle
			case Blues
			<drummer_stance> = Blues_Idle
			default
			ScriptAssert \{qs(0x80a13847)
				a = $freestyle_music_type}
		endswitch
		change \{structurename = drummer_info
			anim_set = Mii_drummer_anims_set}
		change structurename = drummer_info stance = <drummer_stance>
		change structurename = drummer_info next_stance = <drummer_stance>
		change \{structurename = drummer_info
			current_anim = Idle}
		change \{structurename = drummer_info
			cycle_anim = false}
		change \{structurename = drummer_info
			next_anim = none}
		change \{structurename = drummer_info
			playing_missed_note = false}
		change \{structurename = drummer_info
			waiting_for_cameracut = false}
		create_drummer {
			profile_id = Mii_Drummer
			savegame = 0
			name = Drummer
			loading_into_song = assassin
			player_status = <player_status>
			create_mii
			freestyle_player = <player>
		}
		Drummer :Mii_MatchHandTextureColorToFace \{oldTextureName = `Tex\models\Characters\guitarists\Mii\Mii_Hands_Drummer.png`
			texSize = (16.0, 16.0)}
		if MiiIsFemale mii_index = ($freestyle_player_data [<player>].mii_index) mii_use_random = ($freestyle_player_data [<player>].mii_is_random)
			Drummer :obj_replacetexture \{src = 'Tex\\models\\Characters\\guitarists\\Mii\\MiiDrummer'
				dest = '\\images\\freestyle_runtime\\FemaleDrummer.png'}
		endif
		spawnscriptnow \{freestyle_drummer_play_idle_right_hand}
		spawnscriptnow \{freestyle_drummer_play_idle_left_hand}
	endswitch
	<player> = (<player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_calculate_player_count 
	change \{freestyle_player_count = 0}
	player = 0
	begin
	if ($freestyle_player_data [<player>].instrument != none)
		if has_valid_controller player = <player>
			change freestyle_player_count = ($freestyle_player_count + 1)
		endif
	endif
	<player> = (<player> + 1)
	repeat $freestyle_max_players
endscript

script freestyle_player_has_proper_controller 
	if (<player> = 0)
		switch (<controller_type>)
			case guitar
			return \{true}
		endswitch
	elseif (<player> = 1)
		switch (<controller_type>)
			case nunchuk
			case DrumKit
			return \{true}
		endswitch
	endif
	return \{false}
endscript

script freestyle_find_player_with_controller 
	player = -1
	i = 0
	begin
	if ($freestyle_player_data [<i>].controller = <controller>)
		<player> = <i>
		break
	endif
	<i> = (<i> + 1)
	repeat $freestyle_max_players
	return player = <player>
endscript
