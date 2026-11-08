VV_LoseAnimParams = {
	clip = Generic_Lose
}
VV_WinAnimParams = {
	clip = Generic_Win
}
VV_IntroAnimParams = {
	clip = Generic_Intro
}

script Transition_PlaySimpleAnim 
	Band_PlaysimpleAnim <...>
endscript

script Band_PlayFacialAnim \{name = Guitarist}
	if CompositeObjectExists name = <name>
		<name> :Obj_KillSpawnedScript name = play_special_facial_anim
		<name> :Obj_SpawnScriptNow play_special_facial_anim params = {Anim = <Anim>}
	endif
	if (<name> = vocalist)
		if CompositeObjectExists \{name = vocalist2}
			vocalist2 :Obj_KillSpawnedScript \{name = play_special_facial_anim}
			vocalist2 :Obj_SpawnScriptNow play_special_facial_anim params = {Anim = <Anim>}
		endif
	endif
endscript

script Band_PlayRockinFacialAnim \{name = Guitarist}
	if CompositeObjectExists name = <name>
		<name> :Obj_KillSpawnedScript name = play_special_facial_anim
		if Band_IsFemale name = <name>
			printf \{qs("\LFemale Rocker Face")}
			<name> :Obj_SpawnScriptNow play_special_facial_anim params = {Anim = gh_rocker_female_hardrockface_4}
		else
			printf \{qs("\LMale Rocker Face")}
			<name> :Obj_SpawnScriptNow play_special_facial_anim params = {Anim = gh_rocker_male_hardrockface_4}
		endif
	endif
endscript

script Band_ChangeFacialAnims \{name = Guitarist
		ff_anims = facial_anims_female_rocker
		Mf_anims = facial_anims_male_rocker
		blend_duration = 0.3}
	if CompositeObjectExists name = <name>
		ExtendCRC <name> '_Info' out = info_struct
		if Band_IsFemale name = <name>
			change structurename = <info_struct> facial_anims = <ff_anims>
		else
			change structurename = <info_struct> facial_anims = <Mf_anims>
		endif
		<name> :Obj_KillSpawnedScript name = play_special_facial_anim
		<name> :Obj_KillSpawnedScript name = facial_anim_loop
		<name> :Obj_SpawnScriptNow facial_anim_loop params = {blend_duration = <blend_duration>}
	else
		printf qs("\L%a doesn't exists...") a = <name>
	endif
endscript

script AE_ChangeFacialAnims \{ff_anims = facial_anims_female_rocker
		Mf_anims = facial_anims_male_rocker
		blend_duration = 0.3}
	Obj_GetID
	Band_ChangeFacialAnims name = <ObjID> ff_anims = <ff_anims> Mf_anims = <Mf_anims> blend_duration = <blend_duration>
endscript

script Band_ChangeStance \{name = Guitarist
		stance = Stance_A}
	if ($use_drummer_events = 0)
		if (<name> = Drummer)
			return
		endif
	endif
	printf channel = AnimInfo qs(0xe43f2c25) a = <name> b = <stance>
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if bassist_should_use_guitarist_commands
		if (<name> = Guitarist)
			if CompositeObjectExists \{name = bassist}
				LaunchEvent type = change_stance target = bassist data = {<...>}
			endif
		elseif (<name> = bassist)
			return
		endif
	endif
	LaunchEvent type = change_stance target = <name> data = {<...>}
endscript

script Band_StopStrumming \{name = Guitarist}
	Band_SetStrumStyle name = <name> male_type = none female_type = none
endscript

script Band_SetIKChain 
	if (<chain> = guitar)
		Band_SetIKChainTarget name = <name> index = 0 target = Bone_IK_Hand_Guitar_R
		Band_SetIKChainTarget name = <name> index = 1 target = Bone_IK_Hand_Guitar_L
		Band_EnableAutoChords name = <name>
		Band_EnableAutoStrums name = <name>
	elseif (<chain> = slave)
		Band_SetIKChainTarget name = <name> index = 0 target = Bone_IK_Hand_Slave_R
		Band_SetIKChainTarget name = <name> index = 1 target = Bone_IK_Hand_Slave_L
		Band_DisableAutoChords name = <name>
		Band_DisableAutoStrums name = <name>
	else
		Band_SetIKChainTarget name = <name> index = 0 target = Bone_IK_Hand_Slave_R
		Band_SetIKChainTarget name = <name> index = 1 target = Bone_IK_Hand_Slave_L
		Band_DisableAutoChords name = <name>
		Band_DisableAutoStrums name = <name>
	endif
endscript

script AE_SetIK_GuitarL_Off 
	Obj_GetID
	Band_DisableAutoChords name = <ObjID>
endscript

script AE_SetIK_GuitarR_Off 
	Obj_GetID
	Band_DisableAutoStrums name = <ObjID>
endscript

script AE_SetIK_SlaveL_Off 
endscript

script AE_SetIK_SlaveR_Off 
endscript

script AE_SetIK_GuitarL_On 
	Obj_GetID
	Band_SetIKChainTarget name = <ObjID> index = 1 target = Bone_IK_Hand_Guitar_L BlendDuration = 0.3
	Band_EnableAutoChords name = <ObjID>
endscript

script AE_SetIK_GuitarR_On 
	Obj_GetID
	Band_SetIKChainTarget name = <ObjID> index = 0 target = Bone_IK_Hand_Guitar_R BlendDuration = 0.3
	Band_EnableAutoStrums name = <ObjID>
endscript

script AE_SetIK_SlaveL_On 
	Obj_GetID
	Band_SetIKChainTarget name = <ObjID> index = 1 target = Bone_IK_Hand_Slave_L BlendDuration = 0.3
	Band_DisableAutoChords name = <ObjID>
endscript

script AE_SetIK_SlaveR_On 
	Obj_GetID
	Band_SetIKChainTarget name = <ObjID> index = 0 target = Bone_IK_Hand_Slave_R BlendDuration = 0.3
	Band_DisableAutoStrums name = <ObjID>
endscript

script AE_SetIK_to_FK_L 
	Obj_GetID
	Bandmanager_setIKchainStrength name = <ObjID> chain = Bone_IK_Hand_Guitar_L strength = 0
	Bandmanager_setIKchainStrength name = <ObjID> chain = Bone_IK_Hand_Slave_L strength = 0
endscript

script AE_SetIK_to_FK_R 
	Obj_GetID
	Bandmanager_setIKchainStrength name = <ObjID> chain = Bone_IK_Hand_Guitar_R strength = 0
	Bandmanager_setIKchainStrength name = <ObjID> chain = Bone_IK_Hand_Slave_R strength = 0
endscript

script AE_SetIK_to_IK_L 
	Obj_GetID
	Bandmanager_setIKchainStrength name = <ObjID> chain = Bone_IK_Hand_Guitar_L strength = 1
	Bandmanager_setIKchainStrength name = <ObjID> chain = Bone_IK_Hand_Slave_L strength = 1
endscript

script AE_SetIK_to_IK_R 
	Obj_GetID
	Bandmanager_setIKchainStrength name = <ObjID> chain = Bone_IK_Hand_Guitar_R strength = 1
	Bandmanager_setIKchainStrength name = <ObjID> chain = Bone_IK_Hand_Slave_R strength = 1
endscript

script AE_DisableAutoFret 
	Obj_GetID
	Band_DisableAutoFret name = <ObjID>
endscript

script AE_EnableAutofret 
	Obj_GetID
	Band_EnableAutoFret name = <ObjID>
endscript

script IK_FK_Switch_Override 
	if ($current_song = BandOnTheRun)
		return
	endif
	AE_SetIK_SlaveR_On
endscript

script Band_SetIKChainTarget \{BlendDuration = 0.0}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	if NOT <name> :Anim_AnimNodeExists id = Ik
		return
	endif
	if <name> :Skeleton_HasBone bone = <target>
		if (<target> = Bone_IK_Hand_Guitar_R)
			if <name> :Anim_Command target = Ik command = IK_HasChain params = {chain = Bone_IK_Hand_Guitar_R}
				<name> :Anim_Command {
					target = Ik
					command = IK_SetChainStrength
					params = {
						strength = 1.0
						BlendDuration = <BlendDuration>
						chain = Bone_IK_Hand_Guitar_R
					}
				}
				if <name> :Anim_Command target = Ik command = IK_HasChain params = {chain = Bone_IK_Hand_Slave_R}
					<name> :Anim_Command {
						target = Ik
						command = IK_SetChainStrength
						params = {
							strength = 0.0
							BlendDuration = <BlendDuration>
							chain = Bone_IK_Hand_Slave_R
						}
					}
				endif
			endif
		elseif (<target> = Bone_IK_Hand_Guitar_L)
			if <name> :Anim_Command target = Ik command = IK_HasChain params = {chain = Bone_IK_Hand_Guitar_L}
				<name> :Anim_Command {
					target = Ik
					command = IK_SetChainStrength
					params = {
						strength = 1.0
						BlendDuration = <BlendDuration>
						chain = Bone_IK_Hand_Guitar_L
					}
				}
				if <name> :Anim_Command target = Ik command = IK_HasChain params = {chain = Bone_IK_Hand_Slave_L}
					<name> :Anim_Command {
						target = Ik
						command = IK_SetChainStrength
						params = {
							strength = 0.0
							BlendDuration = <BlendDuration>
							chain = Bone_IK_Hand_Slave_L
						}
					}
				endif
			endif
		elseif (<target> = Bone_IK_Hand_Slave_R)
			if <name> :Anim_Command target = Ik command = IK_HasChain params = {chain = Bone_IK_Hand_Guitar_R}
				<name> :Anim_Command {
					target = Ik
					command = IK_SetChainStrength
					params = {
						strength = 0.0
						BlendDuration = <BlendDuration>
						chain = Bone_IK_Hand_Guitar_R
					}
				}
				<name> :Anim_Command {
					target = Ik
					command = IK_SetChainStrength
					params = {
						strength = 1.0
						BlendDuration = <BlendDuration>
						chain = Bone_IK_Hand_Slave_R
					}
				}
			endif
		elseif (<target> = Bone_IK_Hand_Slave_L)
			if <name> :Anim_Command target = Ik command = IK_HasChain params = {chain = Bone_IK_Hand_Guitar_L}
				<name> :Anim_Command {
					target = Ik
					command = IK_SetChainStrength
					params = {
						strength = 0.0
						BlendDuration = <BlendDuration>
						chain = Bone_IK_Hand_Guitar_L
					}
				}
				<name> :Anim_Command {
					target = Ik
					command = IK_SetChainStrength
					params = {
						strength = 1.0
						BlendDuration = <BlendDuration>
						chain = Bone_IK_Hand_Slave_L
					}
				}
			endif
		endif
	endif
endscript

script Band_MoveToNode \{allow_in_2player = false}
	if NOT (SongHasMoments)
		return
	endif
	if ($game_mode = training)
		return
	endif
	if ($current_num_players = 2)
		if (<allow_in_2player> = false)
			return
		endif
	endif
	if NOT CompositeObjectExists name = <name>
		return
	endif
	ExtendCRC <name> '_Info' out = info_struct
	char_name = <name>
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	FormatText TextName = suffix '_TRG_Waypoint_%a' a = <node>
	AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
	waypoint_id = <appended_id>
	if GotParam \{node}
		GetWaypointPos name = <appended_id>
		GetWaypointDir name = <appended_id>
		if GlobalExists name = <info_struct>
			change structurename = <info_struct> target_node = <appended_id>
		endif
	else
		printf \{qs(0x391cb0aa)}
		return
	endif
	<char_name> :Obj_SetPosition position = <pos>
	<char_name> :Obj_SetOrientation dir = <dir>
endscript

script Band_MoveToStartNode \{allow_in_2player = false}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	get_start_node_id member = <name>
	GetWaypointPos name = <waypoint_id>
	GetWaypointDir name = <waypoint_id>
	ExtendCRC <name> '_Info' out = info_struct
	change structurename = <info_struct> target_node = <waypoint_id>
	<name> :Obj_SetPosition position = <pos>
	<name> :Obj_SetOrientation dir = <dir>
endscript

script Band_PlayAttackAnim 
	if NOT CompositeObjectExists name = <name>
		return
	endif
	attack_type = ($battlemode_powerups [<type>].name)
	if (($player1_status.band_member) = <name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT StructureContains Structure = $<battle_anims> name = <attack_type>
		return
	endif
	Anim = ($<battle_anims>.<attack_type>.attack_anim)
	if NOT (<Anim> = none)
		LaunchEvent type = play_battle_anim target = <name> data = {<...> no_wait}
	endif
endscript

script Band_PlayResponseAnim 
	if NOT CompositeObjectExists name = <name>
		return
	endif
	attack_type = ($battlemode_powerups [<type>].name)
	if (($player1_status.band_member) = <name>)
		battle_anims = player1_battlemode_anims
	elseif (($player2_status.band_member) = <name>)
		battle_anims = player2_battlemode_anims
	else
		return
	endif
	if NOT StructureContains Structure = $<battle_anims> name = <attack_type>
		return
	endif
	Anim = ($<battle_anims>.<attack_type>.response_anim)
	if NOT (<Anim> = none)
		LaunchEvent type = play_battle_anim target = <name> data = {<...>}
	endif
endscript

script bassist_should_use_guitarist_commands 
	if (($game_mode = p2_faceoff) || ($game_mode = p2_pro_faceoff) || ($game_mode = p2_battle))
		if ($boss_battle = 0)
			return \{true}
		endif
	endif
	return \{false}
endscript

script Band_RestartIdles 
	band_playidle \{name = Guitarist
		restart}
	band_playidle \{name = bassist
		restart}
	band_playidle \{name = vocalist
		restart}
	band_playidle \{name = Drummer
		restart}
endscript

script Band_PlayTransitionIdles 
	printf \{channel = Pop
		qs("\LBand_PlayTransitionIdles")}
	band_builder_get_band_global
	Band_RestartIdles
	if has_singing_guitarist <...>
		band_playclip \{clip = Song_Loading_Singing_Guitarist
			no_wait
			AllGameModes}
	elseif has_singing_bassist <...>
		band_playclip \{clip = Song_Loading_Singing_Guitarist
			no_wait
			AllGameModes}
	else
		band_playclip \{clip = Song_Loading
			no_wait
			AllGameModes}
	endif
	Wait \{1
		gameframes}
	BandManager_SetPlayingIntroAnims
endscript

script BandManager_TurnOffAllArmAnims 
	BandManager_SetAllArmAnimStrength \{name = Guitarist
		strength = 0.0}
	BandManager_SetAllArmAnimStrength \{name = guitarist2
		strength = 0.0}
	BandManager_SetAllArmAnimStrength \{name = bassist
		strength = 0.0}
	BandManager_SetAllArmAnimStrength \{name = vocalist
		strength = 0.0}
	Band_SetDrumKitState \{name = Drummer
		state = off}
	Band_SetDrumKitState \{name = drummer2
		state = off}
endscript

script BandManager_SetAllArmAnimStrength 
	Band_SetArmAnimStrength name = <name> target = strum_anim_mod strength = <strength>
	Band_SetArmAnimStrength name = <name> target = fret_anim_mod strength = <strength>
	Band_SetArmAnimStrength name = <name> target = chord_anim_mod strength = <strength>
endscript

script BandManager_TurnOnAllArmAnims 
	BandManager_SetAllArmAnimStrength \{name = Guitarist
		strength = 1.0}
	BandManager_SetAllArmAnimStrength \{name = guitarist2
		strength = 1.0}
	BandManager_SetAllArmAnimStrength \{name = bassist
		strength = 1.0}
	BandManager_SetAllArmAnimStrength \{name = vocalist
		strength = 1.0}
	Band_SetDrumKitState \{name = Drummer
		state = on}
	Band_SetDrumKitState \{name = drummer2
		state = on}
endscript

script Band_SetArmAnimStrength 
	if CompositeObjectExists name = <name>
		if <name> :Anim_AnimNodeExists id = <target>
			<name> :Anim_Command target = <target> command = Modulate_SetStrength params = {strength = <strength>}
		endif
	endif
endscript

script Band_SetDrumKitState 
	if CompositeObjectExists name = <name>
		<name> :Anim_Command target = drumkit_mod command = Modulate_SetStrength params = {strength = <strength>}
	endif
endscript

script clip_adjust_arm_settings \{override_special = true}
	debug_channel = AnimInfo
	if NOT GotParam \{name}
		printf channel = <debug_channel> qs(0x934fb0a3)
		return
	endif
	if (<override_special> = false)
		if BandManager_IsPlayingSimpleAnim name = <name>
			return
		endif
	endif
	if StructureContains Structure = <arm_settings> name = <name>
		IK_TargetL = (<arm_settings>.<name>.IK_TargetL)
		if (<IK_TargetL> = guitar)
			Band_SetIKChainTarget name = <name> index = 1 target = Bone_IK_Hand_Guitar_L
		elseif (<IK_TargetL> = slave)
			Band_SetIKChainTarget name = <name> index = 1 target = Bone_IK_Hand_Slave_L
		else
		endif
		IK_TargetR = (<arm_settings>.<name>.IK_TargetR)
		if (<IK_TargetR> = guitar)
			Band_SetIKChainTarget name = <name> index = 0 target = Bone_IK_Hand_Guitar_R
		elseif (<IK_TargetR> = slave)
			Band_SetIKChainTarget name = <name> index = 0 target = Bone_IK_Hand_Slave_R
		else
		endif
		if (<name> != Drummer)
			if StructureContains Structure = (<arm_settings>.<name>) name = strum
				strum = (<arm_settings>.<name>.strum)
				if (<strum> = on)
					Band_EnableAutoStrums name = <name>
				else
					Band_DisableAutoStrums name = <name>
				endif
			endif
			if StructureContains Structure = (<arm_settings>.<name>) name = fret
				fret = (<arm_settings>.<name>.fret)
				if (<fret> = on)
					Band_EnableAutoFret name = <name>
				else
					Band_DisableAutoFret name = <name>
				endif
			endif
			if StructureContains Structure = (<arm_settings>.<name>) name = chord
				chord = (<arm_settings>.<name>.chord)
				if (<chord> = on)
					Band_EnableAutoChords name = <name>
				else
					Band_DisableAutoChords name = <name>
				endif
			endif
		endif
	endif
endscript
display_clip_info = true

script wait_one_frame_if_its_an_even_frame 
	GetLogicFrame
	Mod a = <LogicFrame> b = 2
	if (<Mod> = 0)
		Wait \{1
			gameframe}
	endif
endscript

script wait_one_frame_if_its_an_odd_frame 
	GetLogicFrame
	Mod a = <LogicFrame> b = 2
	if (<Mod> = 1)
		Wait \{1
			gameframe}
	endif
endscript

script wait_after_anim_before_position_update 
	wait_one_frame_if_its_an_even_frame
	Wait \{2
		gameframes}
endscript

script Band_ApplyClipCamera 
	CameraCut_GenericWait
	if StructureContains Structure = $<clip> name = cameras
		GetArraySize ($<clip>.cameras)
		if (<array_size> > 0)
			index = 0
			begin
			node_name = ($<clip>.cameras [<index>].name)
			camera_anim = ($<clip>.cameras [<index>].Anim)
			if ($display_clip_info = true)
				printf channel = <debug_channel> qs(0x24f52fd4) a = <node_name> b = <camera_anim> DoNotResolve
			endif
			SetSearchAllAssetContexts \{on}
			if Anim_AnimExists Anim = <camera_anim>
				anim_Getanimlength Anim = <camera_anim>
				if (<length> != 0)
					start = (<StartTime> / <length>)
					if (<start> < 0.0)
						start = 0.0
					elseif (<start> > 1.0)
						start = 1.0
					endif
					FormatText TextName = cam_index '_0%i' i = (<index> + 1)
					ExtendCRC moment_cam_lock_target <cam_index> out = lock_target
					MomentCamera_PlayAnim lock_target = <lock_target> Anim = <camera_anim> node = <node_name> start = <start> BlendDuration = 0.0
				else
					printf channel = <debug_channel> qs(0x08d5b7a8) a = <camera_anim>
				endif
			else
				printf channel = <debug_channel> qs(0x9f76a970) a = <camera_anim>
			endif
			SetSearchAllAssetContexts \{off}
			index = (<index> + 1)
			if (<index> = <array_size>)
				break
			endif
			repeat
		endif
	endif
endscript

script band_playclip \{startFrame = 0.0
		override_intro = true}
	if (<clip> != Generic_Intro)
		if NOT (SongHasMoments)
			return
		endif
	endif
	if NOT GotParam \{AllGameModes}
		if ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle)
			return
		endif
	endif
	GetSongTimeMs
	CastToInteger \{time}
	debug_channel = clip
	if ($playing_group_starpower_anim = true)
		printf channel = <debug_channel> qs(0x2bdb104c)
		return
	endif
	KillSpawnedScript \{name = return_characters_to_idle_after_delay}
	KillSpawnedScript \{name = return_characters_to_idle_at_song_time}
	if ($display_clip_info = true)
		clip_get_time_and_frame
		if NOT GotParam \{EndFrame}
			printf channel = <debug_channel> qs(0xdbaf3242) a = <clip> b = <startFrame> c = <time_string> DoNotResolve
		else
			printf channel = <debug_channel> qs(0xa3d7fd20) a = <clip> b = <startFrame> d = <EndFrame> c = <time_string> DoNotResolve
		endif
	endif
	if NOT GotParam \{clip}
		printf channel = <debug_channel> qs(0x1381e774)
		return
	endif
	if NOT GlobalExists name = <clip> type = Structure
		printf channel = <debug_channel> qs(0x91cfadb7)
		return
	endif
	StartTime = 0.0
	if StructureContains Structure = $<clip> name = startFrame
		startFrame = ($<clip>.startFrame)
	endif
	if GotParam \{startFrame}
		StartTime = (<startFrame> / 30.0)
	endif
	if StructureContains Structure = $<clip> name = TempoMatching
		TempoMatching = ($<clip>.TempoMatching)
	endif
	enable_ik = true
	if StructureContains Structure = $<clip> name = DisableIK
		disable_ik = ($<clip>.DisableIK)
		if (<disable_ik> = true)
			enable_ik = false
		endif
	endif
	spawnscriptnow Band_ApplyClipCamera params = {<...>}
	if ($display_clip_info = true)
		printf \{channel = clip
			qs("\L ")}
	endif
	if StructureContains Structure = $<clip> name = anims
		anims = ($<clip>.anims)
		clip_animate_character name = Guitarist disable_arms = 0 enable_ik = <enable_ik> <...>
		clip_animate_character name = bassist disable_arms = 0 enable_ik = <enable_ik> <...>
		clip_animate_character name = vocalist <...>
		clip_animate_character name = Drummer <...>
	else
		if ($display_clip_info = true)
			printf channel = <debug_channel> qs(0xcf107e2e)
		endif
	endif
	if StructureContains Structure = $<clip> name = Arms
		arm_settings = ($<clip>.Arms)
		clip_adjust_arm_settings name = Guitarist <...>
		clip_adjust_arm_settings name = bassist <...>
		clip_adjust_arm_settings name = vocalist <...>
		clip_adjust_arm_settings name = Drummer <...>
	endif
	if ($display_clip_info = true)
		printf \{channel = clip
			qs("\L ")}
	endif
	if NOT GotParam \{no_wait}
		wait_after_anim_before_position_update
	endif
	if StructureContains Structure = $<clip> name = startnodes
		start_nodes = ($<clip>.startnodes)
		clip_position_character name = Guitarist <...>
		clip_position_character name = bassist <...>
		clip_position_character name = Drummer <...>
		clip_position_character name = vocalist <...>
	else
		Band_MoveToStartNode \{name = Guitarist}
		Band_MoveToStartNode \{name = bassist}
		Band_MoveToStartNode \{name = vocalist}
		Band_MoveToStartNode \{name = Drummer}
	endif
	if GotParam \{EndFrame}
		endtime = (<EndFrame> / 30.0)
		clip_length = (<endtime> - <StartTime>)
		delay_ms = (<clip_length> * 1000)
		return_to_idle_time = (<delay_ms> + <event_time>)
		spawnscriptnow return_characters_to_idle_after_delay params = {delay = <clip_length>}
		spawnscriptnow return_characters_to_idle_at_song_time params = {time = <return_to_idle_time>}
	endif
endscript

script Band_ForceToIdle 
	if GotParam \{name}
		if CompositeObjectExists name = <name>
			BandManager_ChangeIK name = <name> enabled = true
			band_playidle name = <name> BlendDuration = 0.0 random_start_time = true no_wait
		endif
	endif
endscript

script Band_ForceAllToIdle 
	Band_ForceToIdle name = Guitarist <...>
	Band_ForceToIdle name = bassist <...>
	Band_ForceToIdle name = vocalist <...>
	Band_ForceToIdle name = Drummer <...>
endscript

script Band_MoveAllToStartNodes 
	Band_MoveToStartNode \{name = Guitarist}
	Band_MoveToStartNode \{name = bassist}
	Band_MoveToStartNode \{name = vocalist}
	Band_MoveToStartNode \{name = Drummer}
endscript
tempo_for_anims = -1
tempo_for_drum_anims = -1

script Band_SetAnimTempo 
	change tempo_for_anims = <tempo>
	if ($tempo_for_drum_anims = -1)
		change tempo_for_drum_anims = <tempo>
	endif
endscript

script Band_ClearAnimTempo 
	change \{tempo_for_anims = -1}
	change \{tempo_for_drum_anims = -1}
endscript

script Band_IsFemale 
	if NOT GotParam \{name}
		printf \{qs("\LBand_IsFemale called without name param")}
		return
	endif
	if NOT CompositeObjectExists name = <name>
		printf qs("\LBand_IsFemale: Unable to find object %a") a = <name>
		return
	endif
	<name> :GetSingleTag is_female
	if (<is_female> = 1)
		return \{true}
	else
		return \{false}
	endif
endscript

script return_characters_to_idle_after_delay 
	Wait <delay> seconds
	clip_get_time_and_frame
	GetLogicFrame
	Band_ForceAllToIdle
	wait_after_anim_before_position_update
	Band_MoveAllToStartNodes
endscript

script return_characters_to_idle_at_song_time 
	return_to_idle_time = <time>
	begin
	GetSongTimeMs \{time_offset = $time_gem_offset}
	if (<time> >= <return_to_idle_time>)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	Band_ForceAllToIdle
	wait_after_anim_before_position_update
	Band_MoveAllToStartNodes
endscript

script clip_position_character 
	if NOT GotParam \{name}
		return
	endif
	if StructureContains Structure = <start_nodes> name = <name>
		if ($display_clip_info = true)
			printf channel = clip qs(0xddcfbec2) a = <name> b = (<start_nodes>.<name>)
		endif
		Band_MoveToNode name = <name> node = (<start_nodes>.<name>) allow_in_2player = true
	else
		Band_MoveToStartNode name = <name>
	endif
endscript

script clip_animate_character \{disable_arms = 2
		override_special = true}
	debug_channel = clip
	if NOT GotParam \{name}
		printf channel = <debug_channel> qs(0x934fb0a3)
		return
	endif
	if (<override_special> = false)
		if BandManager_IsPlayingSimpleAnim name = <name>
			printf channel = <debug_channel> qs(0x6b3bdd8c)
			return
		endif
	endif
	if StructureContains Structure = <anims> name = <name>
		Anim = (<anims>.<name>)
		SetSearchAllAssetContexts \{on}
		if NOT Anim_AnimExists Anim = <Anim>
			printf channel = <debug_channel> qs(0x2845c534) a = <Anim> b = <name> DoNotResolve
			SetSearchAllAssetContexts \{off}
			return
		endif
		anim_Getanimlength Anim = <Anim>
		if ($display_clip_info = true)
			printf channel = <debug_channel> qs(0x9b1ff9cb) a = <name> b = <Anim> c = <length> DoNotResolve
		endif
		Band_PlaysimpleAnim {
			name = <name>
			Anim = <Anim>
			start = <StartTime>
			disable_arms = <disable_arms>
			TempoMatching = <TempoMatching>
			BlendDuration = 0.0
			BlendOutDuration = 0.0
		}
		SetSearchAllAssetContexts \{off}
		BandManager_ChangeIK name = <name> enabled = <enable_ik>
	else
		Band_ForceToIdle name = <name>
	endif
endscript

script clip_adjust_arm_settings \{override_special = true}
	debug_channel = AnimInfo
	if NOT GotParam \{name}
		printf channel = <debug_channel> qs(0x934fb0a3)
		return
	endif
	if (<override_special> = false)
		if BandManager_IsPlayingSimpleAnim name = <name>
			return
		endif
	endif
	if StructureContains Structure = <arm_settings> name = <name>
		IK_TargetL = (<arm_settings>.<name>.IK_TargetL)
		if (<IK_TargetL> = guitar)
			Band_SetIKChainTarget name = <name> index = 1 target = Bone_IK_Hand_Guitar_L
		elseif (<IK_TargetL> = slave)
			Band_SetIKChainTarget name = <name> index = 1 target = Bone_IK_Hand_Slave_L
		else
		endif
		IK_TargetR = (<arm_settings>.<name>.IK_TargetR)
		if (<IK_TargetR> = guitar)
			Band_SetIKChainTarget name = <name> index = 0 target = Bone_IK_Hand_Guitar_R
		elseif (<IK_TargetR> = slave)
			Band_SetIKChainTarget name = <name> index = 0 target = Bone_IK_Hand_Slave_R
		else
		endif
		if (<name> != Drummer)
			if StructureContains Structure = (<arm_settings>.<name>) name = strum
				strum = (<arm_settings>.<name>.strum)
				if (<strum> = on)
					printf channel = anim_info qs(0x2e000f66) s = <name>
					Band_EnableAutoStrums name = <name>
				else
					printf channel = anim_info qs(0x2ba87509) s = <name>
					Band_DisableAutoStrums name = <name>
				endif
			endif
			if StructureContains Structure = (<arm_settings>.<name>) name = fret
				fret = (<arm_settings>.<name>.fret)
				if (<fret> = on)
					printf channel = anim_info qs(0xe7a61420) s = <name>
					Band_EnableAutoFret name = <name>
				else
					printf channel = anim_info qs(0x07ee9dc0) s = <name>
					Band_DisableAutoFret name = <name>
				endif
			endif
			if StructureContains Structure = (<arm_settings>.<name>) name = chord
				chord = (<arm_settings>.<name>.chord)
				if (<chord> = on)
					printf channel = anim_info qs(0xdb8ab070) s = <name>
					Band_EnableAutoChords name = <name>
				else
					printf channel = anim_info qs(0x6cee9b49) s = <name>
					Band_DisableAutoChords name = <name>
				endif
			endif
		endif
	endif
endscript

script clip_get_time_and_frame 
	GetSongTimeMs \{time_offset = $time_gem_offset}
	seconds = (<time> / 1000.0)
	if (<seconds> < 0)
		seconds = 0
	endif
	minutes = (<seconds> / 60.0)
	CastToInteger \{minutes}
	seconds = (<seconds> - (<minutes> * 60))
	seconds_float = <seconds>
	CastToInteger \{seconds}
	fps = 30
	fraction_of_second = (<seconds_float> - <seconds>)
	frame = (<fraction_of_second> * <fps>)
	CastToInteger \{frame}
	if (<seconds> < 10)
		if (<frame> < 10)
			FormatText TextName = time_string qs(0xd21fc967) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			FormatText TextName = time_string qs(0xcd43fe76) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	else
		if (<frame> < 10)
			FormatText TextName = time_string qs(0x50aa287c) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			FormatText TextName = time_string qs(0x656bb486) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	endif
	return time_string = <time_string>
endscript

script debug_print_frame_time 
	seconds = (<time> / 1000.0)
	if (<seconds> < 0)
		seconds = 0
	endif
	minutes = (<seconds> / 60.0)
	CastToInteger \{minutes}
	seconds = (<seconds> - (<minutes> * 60))
	seconds_float = <seconds>
	CastToInteger \{seconds}
	fps = 30
	fraction_of_second = (<seconds_float> - <seconds>)
	frame = (<fraction_of_second> * <fps>)
	CastToInteger \{frame}
	if (<seconds> < 10)
		if (<frame> < 10)
			FormatText TextName = time_string qs(0xd21fc967) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			FormatText TextName = time_string qs(0xcd43fe76) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	else
		if (<frame> < 10)
			FormatText TextName = time_string qs(0x50aa287c) a = <minutes> b = <seconds> c = <frame> d = <time>
		else
			FormatText TextName = time_string qs(0x656bb486) a = <minutes> b = <seconds> c = <frame> d = <time>
		endif
	endif
	printf channel = AnimInfo <time_string>
endscript

script test_all_cameras 
	test_cameras \{name = Guitarist}
	test_cameras \{name = bassist}
	test_cameras \{name = vocalist}
endscript

script test_cameras 
	printf \{channel = testcameras
		qs("\L---------------------------------")}
	if NOT GotParam \{name}
		printf \{channel = testcameras
			qs("\Ltest_cameras script requires 'name' parameter")}
		return
	endif
	print_obj_info name = <name>
	ExtendCRC <name> '_mocap_lock_target_01' out = camera1
	print_obj_info name = <camera1> name_string = <name_string>
	ExtendCRC <name> '_mocap_lock_target_02' out = camera2
	print_obj_info name = <camera2> name_string = <name_string>
	printf \{channel = testcameras
		qs("\L---------------------------------")}
endscript

script print_obj_info 
	if NOT CompositeObjectExists name = <name>
		printf channel = testcameras qs("\Lcould not find %a") a = <name>
		return
	endif
	printf channel = testcameras qs("\L%a") a = <name>
	if <name> :Anim_AnimNodeExists id = BodyTimer
		<name> :Anim_Command target = BodyTimer command = Timer_GetFrameFactor
		<name> :Anim_Command target = BodyTimer command = Timer_GetAnimDuration
		printf channel = testcameras qs("\L length %bs           ...... time %cs (%a)  ") a = (<framefactor>) b = <duration> c = (<framefactor> * <duration>)
	else
		printf \{channel = testcameras
			qs("\L missing bodytimer!")}
	endif
	<name> :Obj_GetPosition
	printf channel = testcameras qs("\L  position %a") a = <pos>
	<name> :Obj_GetOrientation
	dir = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
	printf channel = testcameras qs("\L  orientation %a") a = <dir>
endscript

script Band_ShowMic \{name = Guitarist}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :show_mic
endscript

script Band_HideMic \{name = Guitarist}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :hide_mic
endscript

script Band_ShowMic_Stand \{name = Guitarist}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :show_mic_stand
endscript

script Band_HideMic_stand \{name = Guitarist}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :hide_mic_stand
endscript

script Band_ShowMic_microphone \{name = Guitarist}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :show_mic_microphone
endscript

script Band_HideMic_microphone \{name = Guitarist}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :hide_mic_microphone
endscript

script Band_ShowDrumkit \{name = Drummer}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :show_Drumkit
endscript

script Band_HideDrumkit \{name = Drummer}
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :hide_Drumkit
endscript

script Band_Hide 
	if CompositeObjectExists name = <name>
		<name> :hide
	endif
endscript

script Band_UnHide 
	if CompositeObjectExists name = <name>
		<name> :unhide
	endif
endscript
enable_guitarist_camera_swapping = false

script Band_EnableGuitaristCameraSwapping 
	change \{enable_guitarist_camera_swapping = true}
endscript

script Band_DisableGuitaristCameraSwapping 
	change \{enable_guitarist_camera_swapping = false}
endscript

script Transition_ChangeIK 
	BandManager_ChangeIK <...>
endscript

script BandManager_StopFacialAnims 
	<name> :Obj_KillSpawnedScript name = play_special_facial_anim
	<name> :Obj_KillSpawnedScript name = facial_anim_loop
	<name> :hero_clear_facial_anim
endscript

script BandManager_StartFacialAnims 
	if NOT CompositeObjectExists name = <name>
		return
	endif
	<name> :Obj_KillSpawnedScript name = play_special_facial_anim
	<name> :Obj_KillSpawnedScript name = facial_anim_loop
	<name> :Obj_SpawnScriptNow facial_anim_loop
endscript

script BandManager_StartAllFacialAnims 
	BandManager_StartFacialAnims \{name = Guitarist}
	BandManager_StartFacialAnims \{name = guitarist2}
	BandManager_StartFacialAnims \{name = bassist}
	BandManager_StartFacialAnims \{name = vocalist}
	BandManager_StartFacialAnims \{name = vocalist2}
	BandManager_StartFacialAnims \{name = Drummer}
endscript

script BandManager_AirGuitarCheat 
	if ($Cheat_AirInstruments = 1)
		BandManager_HideAllInstruments
	endif
endscript

script BandManager_InvisibleCharactersCheat 
	if ($Cheat_InvisibleCharacters = 1)
		BandManager_HideAllMusicians
	endif
endscript

script BandManager_HideInstrument 
	if CompositeObjectExists <name>
		<name> :HideInstrument
	endif
endscript

script BandManager_HideAllInstruments 
	BandManager_HideInstrument \{name = Guitarist}
	BandManager_HideInstrument \{name = guitarist2}
	BandManager_HideInstrument \{name = bassist}
	BandManager_HideInstrument \{name = vocalist}
	BandManager_HideInstrument \{name = vocalist2}
	BandManager_HideInstrument \{name = Drummer}
endscript

script BandManager_HideMusician 
	if CompositeObjectExists <name>
		<name> :HideMusician
	endif
endscript

script BandManager_HideAllMusicians 
	BandManager_HideMusician \{name = Guitarist}
	BandManager_HideMusician \{name = guitarist2}
	BandManager_HideMusician \{name = bassist}
	BandManager_HideMusician \{name = vocalist}
	BandManager_HideMusician \{name = vocalist2}
	BandManager_HideMusician \{name = Drummer}
endscript
