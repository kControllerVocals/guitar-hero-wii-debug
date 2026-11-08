times_in_freestyle_play_reward_anim = 0

script freestyle_play_reward_anim 
	if NOT ($times_in_freestyle_play_reward_anim = 0)
		return
	endif
	change \{times_in_freestyle_play_reward_anim = 1}
	Guitarist :Anim_Command \{target = Ik
		command = IK_SetChainStrength
		params = {
			strength = 0.0
			BlendDuration = 0.25
			chain = Bone_IK_Hand_Guitar_L
		}}
	Guitarist :Anim_Command \{target = Ik
		command = IK_SetChainStrength
		params = {
			strength = 0.0
			BlendDuration = 0.25
			chain = Bone_IK_Hand_Guitar_R
		}}
	GetRandomArrayElement \{$Freestyle_Guitarist_Reward_Anims}
	Guitarist :hero_play_anim Anim = (<element>)
	Guitarist :hero_wait_until_anim_finished
	Guitarist :Anim_Command \{target = Ik
		command = IK_SetChainStrength
		params = {
			strength = 1.0
			BlendDuration = 0.25
			chain = Bone_IK_Hand_Guitar_L
		}}
	Guitarist :Anim_Command \{target = Ik
		command = IK_SetChainStrength
		params = {
			strength = 1.0
			BlendDuration = 0.25
			chain = Bone_IK_Hand_Guitar_R
		}}
	transition_anim = GH4_Guitarist_mii_Reward_to_Metal
	switch ($freestyle_music_type)
		case metal
		<transition_anim> = GH4_Guitarist_mii_Reward_to_Metal
		case Rock
		<transition_anim> = GH4_Guitarist_mii_Reward_to_Rock
		case Blues
		<transition_anim> = GH4_Guitarist_mii_Reward_to_Blues
		default
		ScriptAssert \{qs(0x80a13847)
			a = $freestyle_music_type}
	endswitch
	Guitarist :hero_play_anim Anim = (<transition_anim>)
	Guitarist :hero_wait_until_anim_finished
	change \{times_in_freestyle_play_reward_anim = 0}
	switch ($freestyle_music_type)
		case metal
		freestyle_change_stance \{stance = Metal_Idle_Verse}
		case Rock
		freestyle_change_stance \{stance = Rock_Idle_Verse}
		case Blues
		freestyle_change_stance \{stance = Blues_Idle_Verse}
		default
		ScriptAssert \{qs(0x80a13847)
			a = $freestyle_music_type}
	endswitch
endscript

script freestyle_play_outro_anim \{Anim = GH4_Gutiarist_mii_blue_outro}
	Guitarist :Anim_Command \{target = Ik
		command = IK_SetChainStrength
		params = {
			strength = 0.0
			BlendDuration = 0.25
			chain = Bone_IK_Hand_Guitar_L
		}}
	Guitarist :Anim_Command \{target = Ik
		command = IK_SetChainStrength
		params = {
			strength = 0.0
			BlendDuration = 0.25
			chain = Bone_IK_Hand_Guitar_R
		}}
	Guitarist :hero_play_anim Anim = (<Anim>)
	Guitarist :hero_wait_until_anim_finished
	Guitarist :Anim_Command \{target = Ik
		command = IK_SetChainStrength
		params = {
			strength = 1.0
			BlendDuration = 0.25
			chain = Bone_IK_Hand_Guitar_L
		}}
	Guitarist :Anim_Command \{target = Ik
		command = IK_SetChainStrength
		params = {
			strength = 1.0
			BlendDuration = 0.25
			chain = Bone_IK_Hand_Guitar_R
		}}
endscript

script freestyle_update_guitarist_hands \{player = 0}
	GetGuitarInputProperties player = <player>
	if (<pattern_changed> = true)
		freestyle_try_fret_anims event_triggered = <pattern_held>
	endif
	if ((<strum_changed> = true) && ((<strum_held> = strum_up) || (<strum_held> = strum_down)))
		freestyle_guitarist_strum \{Blendtime = 0.0}
	endif
endscript

script freestyle_change_stance \{stance = Stance_A
		player = Guitarist}
	ExtendCRC <player> '_Info' out = player_info
	begin
	if MetronomeBeatThisFrame
		break
	else
		WaitOneGameFrame
	endif
	repeat
	change structurename = <player_info> next_stance = <stance>
	Band_ChangeStance name = <player> stance = <stance> no_wait
endscript

script freestyle_drummer_play_anim \{anim_target = kick
		Anim = GH4_Drummer_mii_BassDrum
		Hand = 'None'}
	FormatText checksumname = branch_name 'mii_drummer_play_drum_branch_%a' a = <Hand>
	Drummer :Anim_Command {
		target = <anim_target>
		command = DegenerateBlend_AddBranch
		params = {
			Tree = $<branch_name>
			BlendDuration = 0.0
			params = {
				drum_anim = <Anim>
			}
		}
	}
	if GotParam \{kill_idle}
		FormatText checksumname = script_name 'freestyle_drummer_play_idle_%a_hand' a = <Hand>
		KillSpawnedScript name = <script_name>
		SpawnScriptLater <script_name>
	endif
endscript

script freestyle_drummer_play_idle_right_hand 
	Drummer :Anim_Command \{target = DrumTimerRight
		command = Timer_WaitAnimComplete}
	begin
	freestyle_drummer_play_anim \{anim_target = RightArmPartial
		Anim = GH4_Drummer_mii_RightHand_Idle
		Hand = 'right'}
	Drummer :Anim_Command \{target = DrumTimerRight
		command = Timer_WaitAnimComplete}
	repeat
endscript

script freestyle_drummer_play_idle_left_hand 
	Drummer :Anim_Command \{target = DrumTimerLeft
		command = Timer_WaitAnimComplete}
	begin
	freestyle_drummer_play_anim \{anim_target = LeftArmPartial
		Anim = GH4_Drummer_mii_LeftHand_Idle
		Hand = 'left'}
	Drummer :Anim_Command \{target = DrumTimerLeft
		command = Timer_WaitAnimComplete}
	repeat
endscript

script freestyle_update_auto_drummer 
	if ($freestyle_enable_backing_streams = 0)
		return
	endif
	if MetronomeBeatThisFrame
		GetMetronomeBeatsSinceStart
		CastToInteger \{beats_since_start}
		Mod a = <beats_since_start> b = 2
		if (<Mod> = 0)
			freestyle_drummer_play_anim \{anim_target = kick
				Anim = GH4_Drummer_mii_BassDrum}
			freestyle_drummer_play_anim \{anim_target = hihat
				Anim = GH4_Drummer_mii_Hihat}
			freestyle_drummer_play_anim \{anim_target = LeftArmPartial
				Anim = GH4_Drummer_mii_LeftHand_Hihat
				Hand = 'left'
				kill_idle}
		else
			freestyle_drummer_play_anim \{anim_target = snare
				Anim = GH4_Drummer_mii_Snare}
			freestyle_drummer_play_anim \{anim_target = RightArmPartial
				Anim = GH4_Drummer_mii_RightHand_Snare
				Hand = 'right'
				kill_idle}
			freestyle_drummer_play_anim \{anim_target = hihat
				Anim = GH4_Drummer_mii_Hihat}
			freestyle_drummer_play_anim \{anim_target = LeftArmPartial
				Anim = GH4_Drummer_mii_LeftHand_Hihat
				Hand = 'left'
				kill_idle}
		endif
	endif
endscript

script freestyle_try_fret_anims \{event_triggered = 0}
	highest_gem = -1
	gem = 0
	begin
	gem_mask = ($freestyle_highway_gem_masks [<gem>])
	add_gem = 0
	if ((<gem_mask> = 0) && (<event_triggered> = 0))
		add_gem = 1
	elseif (<gem_mask> && <event_triggered>)
		add_gem = 1
		highest_gem = <gem>
	endif
	<gem> = (<gem> + 1)
	repeat 6
	switch <highest_gem>
		case -1
		freestyle_guitarist_play_fret \{fret_anim = GH4_Guitarist_mii_fret_Open}
		case 0
		freestyle_guitarist_play_fret \{fret_anim = GH4_Guitarist_mii_fret_Green}
		case 1
		freestyle_guitarist_play_fret \{fret_anim = GH4_Guitarist_mii_fret_Red}
		case 2
		freestyle_guitarist_play_fret \{fret_anim = GH4_Guitarist_mii_fret_Yellow}
		case 3
		freestyle_guitarist_play_fret \{fret_anim = GH4_Guitarist_mii_fret_Blue}
		case 4
		freestyle_guitarist_play_fret \{fret_anim = GH4_Guitarist_mii_fret_Orange}
		default
		ScriptAssert \{qs(0xb0a2f962)}
	endswitch
endscript

script freestyle_guitarist_strum \{Blendtime = 0.0}
	Guitarist :Anim_Command {
		target = LeftArm
		command = DegenerateBlend_AddBranch
		params = {
			Tree = $mii_guitarist_play_hand_branch
			BlendDuration = <Blendtime>
			params = {
				hand_anim = GH4_Guitarist_mii_strum
			}
		}
	}
endscript

script freestyle_guitarist_play_fret \{Blendtime = 0.1
		fret_anim = GH4_Guitarist_mii_fret_Open}
	Guitarist :Anim_Command {
		target = RightArm
		command = DegenerateBlend_AddBranch
		params = {
			Tree = $mii_guitarist_play_hand_branch
			BlendDuration = <Blendtime>
			params = {
				hand_anim = <fret_anim>
			}
		}
	}
endscript

script freestyle_kill_anim_scripts 
	KillSpawnedScript \{name = freestyle_drummer_play_idle_right_hand}
	KillSpawnedScript \{name = freestyle_drummer_play_idle_left_hand}
	KillSpawnedScript \{name = freestyle_play_reward_anim}
endscript
