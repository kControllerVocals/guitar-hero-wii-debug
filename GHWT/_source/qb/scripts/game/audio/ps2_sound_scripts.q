
script GetVenueCrowdSize 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_ballpark
		return \{VenueSize = 'Medium_EXT'}
		case z_bayou
		return \{VenueSize = 'Small_INT'}
		case z_castle
		return \{VenueSize = 'Medium_EXT'}
		case z_cathedral
		return \{VenueSize = 'Medium_EXT'}
		case z_fairgrounds
		return \{VenueSize = 'Medium_EXT'}
		case z_frathouse
		return \{VenueSize = 'Small_INT'}
		case z_goth
		return \{VenueSize = 'Medium_EXT'}
		case z_harbor
		return \{VenueSize = 'Medium_EXT'}
		case z_hotel
		return \{VenueSize = 'Small_INT'}
		case z_metalfest
		return \{VenueSize = 'Large_EXT'}
		case z_military
		return \{VenueSize = 'Medium_EXT'}
		case z_newyork
		return \{VenueSize = 'Large_EXT'}
		case z_recordstore
		return \{VenueSize = 'Small_INT'}
		default
		return \{VenueSize = 'Medium_EXT'}
	endswitch
endscript

script GetAltVenueSizeString \{VenueSize = 'Medium_EXT'}
	switch <VenueSize>
		case 'Large_EXT'
		return \{VenueSizeAlt = 'EXT_LG'}
		case 'Large_INT'
		return \{VenueSizeAlt = 'EXT_LG'}
		case 'Medium_EXT'
		return \{VenueSizeAlt = 'EXT_MD'}
		case 'Small_INT'
		return \{VenueSizeAlt = 'INT_SM'}
		default
		return \{VenueSizeAlt = 'EXT_MD'}
	endswitch
endscript

script LoadTutorialSFXWithPrefix \{Sound = 'none'}
	training_get_language_prefix
	FormatText TextName = sound_id '%a_%b' a = <Sound> b = <language_prefix>
	LoadSound <sound_id> heap = <heap>
endscript
g_current_sfx_mode = none
CheatSFXLoaded = 0
jam_lead_sample_list = [
	'sg_b_pk_a2_s1_f5_01'
	'sg_b_pk_a4_s6_f5_01'
	'sg_b_pk_ab3_s1_f16_01'
	'sg_b_pk_ab5_s6_f16_01'
	'sg_b_pk_b4_s4_f16_01'
	'sg_b_pk_c4_s4_f5_01'
	'sg_b_pk_d3_s2_f5_01'
	'sg_b_pk_db4_s2_f16_01'
	'sg_b_pk_e4_s5_f5_01'
	'sg_b_pk_eb5_s5_f16_01'
	'sg_b_pk_g3_s3_f5_01'
	'sg_b_pk_gb4_s3_f16_01'
	'sg_b_pm_a2_s1_f5_01'
	'sg_b_pm_a4_s6_f5_01'
	'sg_b_pm_ab3_s1_f16_01'
	'sg_b_pm_ab5_s6_f16_01'
	'sg_b_pm_b4_s4_f16_01'
	'sg_b_pm_c4_s4_f5_01'
	'sg_b_pm_d3_s2_f5_01'
	'sg_b_pm_db4_s2_f16_01'
	'sg_b_pm_e4_s5_f5_01'
	'sg_b_pm_eb5_s5_f16_01'
	'sg_b_pm_g3_s3_f5_01'
	'sg_b_pm_gb4_s3_f16_01'
]
jam_rhythm_sample_list = [
	'sg_b_chrd_down_c5_s2_f3_01'
	'sg_b_chrd_down_g5_s1_f3_01'
	'sg_b_chrd_down_gb5_s2_f9_01'
	'sg_b_chrd_down_cmaj_s2_f3_01'
	'sg_b_chrd_down_gmaj_s1_f3_01'
	'sg_b_chrd_down_gbmaj_s2_f9_01'
	'sg_b_chrd_down_cmin_s2_f3_01'
	'sg_b_chrd_down_gmin_s1_f3_01'
	'sg_b_chrd_down_gbmin_s2_f9_01'
	'sg_b_divebomb_down'
	'sg_b_divebomb_updown'
	'sg_b_fingerslide'
	'sg_b_hrm_s1_f12'
	'sg_b_hrm_s2_f12'
	'sg_b_hrm_s3_f12'
	'sg_b_hrm_s4_f12'
	'sg_b_hrm_s5_f12'
	'sg_b_hrm_s6_f12'
	'sg_b_pkslidefast'
	'sg_b_pkslideslow'
	'sg_b_stringmute_down'
]
g_prev_jam_ingame = 0
g_current_lead_samples = [
]
g_current_rhythm_samples = [
]

script unload_sample_list 
	GetArraySize <sample_list>
	if (<array_size> > 0)
		<i> = 0
		begin
		UnloadSound (<sample_list> [<i>])
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script LoadJamRhythmGuitarSamples \{heap = fmod_heap}
	if ($Last_Rhythm_Jam_Set = $Rhythm_Jam_Set)
		printf \{'Rhythm effect sample set already loaded. Skip.'}
		return
	endif
	printf \{qs(0x7c437490)
		a = $Rhythm_Jam_Set}
	unload_sample_list \{sample_list = $g_current_rhythm_samples}
	GetArraySize \{$jam_rhythm_sample_list}
	rhythm_list_size = <array_size>
	<i> = 0
	<array> = []
	begin
	FormatText TextName = sample_text '%p_%s' p = $Rhythm_Jam_Set s = ($jam_rhythm_sample_list [<i>])
	LoadSound <sample_text> heap = <heap>
	AddArrayElement array = <array> element = <sample_text>
	<i> = (<i> + 1)
	repeat <rhythm_list_size>
	change g_current_rhythm_samples = <array>
	change Last_Rhythm_Jam_Set = ($Rhythm_Jam_Set)
endscript

script LoadJamLeadGuitarSamples \{heap = fmod_heap}
	if ($Last_Lead_Jam_Set = $Lead_Jam_Set)
		printf \{'Lead effect sample set already loaded. Skip.'}
		return
	endif
	printf \{qs(0x6ab968d9)
		b = $Lead_Jam_Set}
	unload_sample_list \{sample_list = $g_current_lead_samples}
	GetArraySize \{$jam_lead_sample_list}
	lead_list_size = <array_size>
	<i> = 0
	<array> = []
	begin
	FormatText TextName = sample_text '%p_%s' p = $Lead_Jam_Set s = ($jam_lead_sample_list [<i>])
	LoadSound <sample_text> heap = <heap>
	AddArrayElement array = <array> element = <sample_text>
	<i> = (<i> + 1)
	repeat <lead_list_size>
	change g_current_lead_samples = <array>
	change Last_Lead_Jam_Set = ($Lead_Jam_Set)
endscript

script LoadJamEffectPreviews \{heap = fmod_heap}
	printf \{'Load music studio effects previews'}
	effects_array = $jam_lead_effects
	GetArraySize <effects_array>
	i = 0
	begin
	FormatText TextName = preview_sample '%a_preview' a = (<effects_array> [<i>].ps2_prefix)
	LoadSound <preview_sample> heap = <heap>
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script LoadKeyboardSamples 
	if ($Melody_Jam_Set = $Last_Melody_Jam_Set)
		printf \{qs(0xb6b0a523)
			a = $Melody_Jam_Set}
		return
	endif
	if NOT ($Last_Melody_Jam_Set = '')
		printf \{qs(0x5fe902a8)
			a = $Last_Melody_Jam_Set}
		UnloadSound \{$Last_Melody_Jam_Set}
	endif
	printf \{qs(0xebcded6e)
		a = $Melody_Jam_Set}
	LoadSound \{$Melody_Jam_Set}
	change Last_Melody_Jam_Set = ($Melody_Jam_Set)
endscript

script ReloadSfx \{mode = oogame
		noreset = 0
		force = 0
		jam_ingame = 0}
	if NOT (<noreset> = 1)
		StopAllSounds
	endif
	printf \{'-- LOADING SOUNDS --'}
	printf '-- mode = %d --' d = <mode>
	<dont_reload> = 0
	if NOT (<force> = 1)
		if ($g_current_sfx_mode = <mode>)
			if ((<mode> != jammode) && (<mode> != tutorials))
				<dont_reload> = 1
			elseif ((<mode> = jammode) && ($g_prev_jam_ingame = <jam_ingame>))
				LoadDrumKitAll drum_kit = ($last_drum_kit_set) percussion_kit = ($last_percussion_kit_set)
				LoadJamDynamicSounds jam_ingame = <jam_ingame>
				<dont_reload> = 1
			endif
		endif
	endif
	if (<dont_reload> = 1)
		printf \{'Already in sound mode! Exit load.'}
		return
	endif
	if ($g_in_tutorial = 1)
		if NOT (<mode> = tutorials)
			printf \{'In tutorial.  Reload aborted.'}
			return
		endif
	endif
	change g_current_sfx_mode = <mode>
	if (<mode> = FrontEnd)
		UnLoadDrumKitAll
	endif
	printf \{'== UnloadAllSFX =='}
	UnloadAllSFX
	if NOT (<mode> = FrontEnd)
		printf \{'Load drums onto fmod heap'}
		<MyActionFunc> = LoadSoundOnBottomUpHeap
		if NOT ($LoadedDrumKitPaks_cymbal = 'none')
			printf \{'Load cymbals'}
			($LoadedDrumKitPaks_cymbal) ActionFunc = <MyActionFunc>
		endif
		if NOT ($LoadedDrumKitPaks_floortom = 'none')
			printf \{'Load floortom'}
			($LoadedDrumKitPaks_floortom) ActionFunc = <MyActionFunc>
		endif
		if NOT ($LoadedDrumKitPaks_hihat = 'none')
			printf \{'Load hihat'}
			($LoadedDrumKitPaks_hihat) ActionFunc = <MyActionFunc>
		endif
		if NOT ($LoadedDrumKitPaks_hitom = 'none')
			printf \{'Load hitom'}
			($LoadedDrumKitPaks_hitom) ActionFunc = <MyActionFunc>
		endif
		if NOT ($LoadedDrumKitPaks_kick = 'none')
			printf \{'Load kick'}
			($LoadedDrumKitPaks_kick) ActionFunc = <MyActionFunc>
		endif
		if NOT ($LoadedDrumKitPaks_snare = 'none')
			printf \{'Load snare'}
			($LoadedDrumKitPaks_snare) ActionFunc = <MyActionFunc>
		endif
		if NOT ($LoadedDrumKitPaks_cymbal_percussion = 'none')
			printf \{'Load cymbal_percussion'}
			($LoadedDrumKitPaks_cymbal_percussion) ActionFunc = <MyActionFunc>
		endif
		if NOT ($LoadedDrumKitPaks_floortom_percussion = 'none')
			printf \{'Load floortom_percussion'}
			($LoadedDrumKitPaks_floortom_percussion) ActionFunc = <MyActionFunc>
		endif
		if NOT ($LoadedDrumKitPaks_hihat_percussion = 'none')
			printf \{'Load hihat_percussion'}
			($LoadedDrumKitPaks_hihat_percussion) ActionFunc = <MyActionFunc>
		endif
		if NOT ($LoadedDrumKitPaks_hitom_percussion = 'none')
			printf \{'Load hitom_percussion'}
			($LoadedDrumKitPaks_hitom_percussion) ActionFunc = <MyActionFunc>
		endif
		if NOT ($LoadedDrumKitPaks_kick_percussion = 'none')
			printf \{'Load kick_percussion'}
			($LoadedDrumKitPaks_kick_percussion) ActionFunc = <MyActionFunc>
		endif
		if NOT ($LoadedDrumKitPaks_snare_percussion = 'none')
			printf \{'Load snare_percussion'}
			($LoadedDrumKitPaks_snare_percussion) ActionFunc = <MyActionFunc>
		endif
		printf \{'Drums loaded'}
	endif
	change \{Last_Lead_Jam_Set = none}
	change \{Last_Rhythm_Jam_Set = none}
	change \{g_current_lead_samples = [
		]}
	change \{g_current_rhythm_samples = [
		]}
	change \{Last_Melody_Jam_Set = ''}
	change \{CheatSFXLoaded = 0}
	if ($g_current_sfx_mode = none)
		return
	endif
	crowd_heap = fmod_heap
	LoadSound \{'GH3_Beat_Sound'}
	LoadSound \{'UI_Sound_05'}
	LoadSound \{'UI_Sound_09'}
	LoadSound \{'Menu_Scroll_Down'}
	LoadSound \{'Menu_Scroll_Up'}
	LoadSound \{'Menu_Into_PauseMenu'}
	switch <mode>
		case oogame
		printf \{'Reloading SFX for oogame'}
		LoadSound \{'bad_note1'}
		LoadSound \{'bad_note2'}
		LoadSound \{'bad_note3'}
		LoadSound \{'bad_note4'}
		LoadSound \{'bad_note6'}
		LoadSound \{'bad_note_bass1'}
		LoadSound \{'bad_note_bass2'}
		LoadSound \{'bad_note_bass4'}
		LoadSound \{'bad_note_bass6'}
		LoadSound \{'Highway_Rise'}
		LoadSound \{'UI_Song_Intro_Kick'}
		LoadSound \{'notes_ripple_up_01'}
		LoadSound \{'StickClickLarge'}
		LoadSound \{'StickClickMed'}
		LoadSound \{'StickClickSmall'}
		LoadSound \{'HiHatClosed01'}
		LoadSound \{'Menu_Options_Sound_Fader_Move'}
		LoadSound \{'Menu_Scroll_Up'}
		LoadSound \{'Menu_Scroll_Down'}
		LoadSound \{'UI_SFX_50_Note_Streak'
			heap = heap_bottom_up}
		if NOT ($game_mode = training)
			LoadSound \{'UI_Lose_Multiplier'}
			LoadSound \{'Crowd_Group_Clap_01'}
			LoadSound \{'Crowd_Group_Clap_02'}
			LoadSound \{'Crowd_Group_Clap_03'}
			LoadSound \{'Crowd_Group_Clap_04'}
			LoadSound \{'Crowd_Group_Clap_05'}
			LoadSound \{'Crowd_Group_Clap_06'}
			LoadSound \{'sp_awarded1'}
			LoadSound \{'sp_awarded2'
				heap = heap_bottom_up}
			LoadSound \{'sp_available1'
				heap = heap_bottom_up}
			LoadSound \{'sp_cheer1'
				heap = heap_bottom_up}
			LoadSound \{'You_Rock'
				heap = heap_bottom_up}
			LoadSound \{'You_Rock_Explosion'
				heap = heap_bottom_up}
			LoadSound \{'Crowd_Fail_Song'
				heap = heap_bottom_up}
			LoadSound \{'sp_deployed'
				heap = heap_bottom_up}
			LoadSound \{'Star_Available'
				heap = heap_bottom_up}
			LoadSound \{'Star_Deployed_LFE'
				heap = heap_bottom_up}
			LoadSound \{'Star_Release_Center'
				heap = heap_bottom_up}
			LoadSound \{'Star_Release_Front'
				heap = heap_bottom_up}
		endif
		LoadSound \{'Bad_Note_Tom1'
			heap = heap_bottom_up}
		LoadSound \{'Bad_Note_HiHat1'
			heap = heap_bottom_up}
		LoadSound \{'Bad_Note_Kick1'
			heap = heap_bottom_up}
		case oogamevs
		printf \{'Reloading SFX for oogame'}
		LoadSound \{'bad_note1'}
		LoadSound \{'bad_note2'}
		LoadSound \{'bad_note3'}
		LoadSound \{'bad_note4'}
		LoadSound \{'bad_note6'}
		LoadSound \{'bad_note_bass1'}
		LoadSound \{'bad_note_bass2'}
		LoadSound \{'bad_note_bass4'}
		LoadSound \{'bad_note_bass6'}
		LoadSound \{'notes_ripple_up_01'}
		LoadSound \{'Multiplayer_Win_Screen'}
		LoadSound \{'Highway_Rise'}
		LoadSound \{'UI_Song_Intro_Kick'}
		LoadSound \{'Crowd_Group_Clap_01'}
		LoadSound \{'Crowd_Group_Clap_02'}
		LoadSound \{'Crowd_Group_Clap_03'}
		LoadSound \{'Crowd_Group_Clap_04'}
		LoadSound \{'Crowd_Group_Clap_05'}
		LoadSound \{'Crowd_Group_Clap_06'}
		LoadSound \{'StickClickLarge'}
		LoadSound \{'StickClickMed'}
		LoadSound \{'StickClickSmall'}
		LoadSound \{'HiHatClosed01'}
		LoadSound \{'UI_Lose_Multiplier'}
		LoadSound \{'sp_available1'
			heap = heap_bottom_up}
		LoadSound \{'sp_awarded1'
			heap = heap_bottom_up}
		LoadSound \{'sp_awarded2'
			heap = heap_bottom_up}
		LoadSound \{'UI_SFX_50_Note_Streak'
			heap = heap_bottom_up}
		LoadSound \{'sp_deployed'
			heap = heap_bottom_up}
		LoadSound \{'Star_Available'
			heap = heap_bottom_up}
		LoadSound \{'Star_Deployed_LFE'
			heap = heap_bottom_up}
		LoadSound \{'Star_Release_Center'
			heap = heap_bottom_up}
		LoadSound \{'Star_Release_Front'
			heap = heap_bottom_up}
		LoadSound \{'Crowd_Fail_Song'
			heap = heap_bottom_up}
		LoadSound \{'sp_cheer1'
			heap = heap_bottom_up}
		LoadSound \{'Menu_Options_Sound_Fader_Move'}
		LoadSound \{'Menu_Scroll_Up'}
		LoadSound \{'Menu_Scroll_Down'}
		LoadSound \{'You_Rock'
			heap = heap_bottom_up}
		LoadSound \{'You_Rock_Explosion'
			heap = heap_bottom_up}
		LoadSound \{'Bad_Note_Tom1'
			heap = heap_bottom_up}
		LoadSound \{'Bad_Note_HiHat1'
			heap = heap_bottom_up}
		LoadSound \{'Bad_Note_Kick1'
			heap = heap_bottom_up}
		case battle
		printf \{'Reloading SFX for battle'}
		LoadSound \{'bad_note1'}
		LoadSound \{'bad_note2'}
		LoadSound \{'bad_note3'}
		LoadSound \{'bad_note4'}
		LoadSound \{'bad_note6'}
		LoadSound \{'notes_ripple_up_01'}
		LoadSound \{'GH3_Battle_DifficultyRampUp'}
		LoadSound \{'GH3_BattleMode_Attack_Over'}
		LoadSound \{'GH3_BattleMode_DoubleNoteAttack'}
		LoadSound \{'GH3_BattleMode_LeftyAttack'}
		LoadSound \{'GH3_BattleMode_Lightning'}
		LoadSound \{'GH3_BattleMode_StealPowerup'}
		LoadSound \{'GH3_BattleMode_StringBreakAttack'}
		LoadSound \{'GH3_BattleMode_WhammyAttack'}
		LoadSound \{'Highway_Rise'}
		LoadSound \{'GH3_BattleMode_StringTune_2'}
		LoadSound \{'UI_Song_Intro_Kick'}
		LoadSound \{'UI_Lose_Multiplier'}
		LoadSound \{'UI_SFX_50_Note_Streak'}
		LoadSound \{'Multiplayer_Win_Screen'}
		LoadSound \{'bad_note_bass4'}
		LoadSound \{'StickClickMed'}
		LoadSound \{'sp_awarded1'
			heap = heap_bottom_up}
		LoadSound \{'You_Rock'
			heap = heap_bottom_up}
		LoadSound \{'You_Rock_Explosion'
			heap = heap_bottom_up}
		LoadSound \{'GH3_Sudden_Death'
			heap = heap_bottom_up}
		LoadSound \{'Menu_Options_Sound_Fader_Move'}
		LoadSound \{'Menu_Scroll_Up'}
		LoadSound \{'Menu_Scroll_Down'}
		LoadSound \{'Bad_Note_Tom1'
			heap = heap_bottom_up}
		LoadSound \{'Bad_Note_HiHat1'
			heap = heap_bottom_up}
		LoadSound \{'Bad_Note_Kick1'
			heap = heap_bottom_up}
		case tutorials
		printf 'Reloading SFX for tutorial %s' s = <tutorial>
		<load_static_sounds> = 0
		<load_dynamic_sounds> = 0
		switch <tutorial>
			case Band
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Intro_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Intro_02_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Play_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Star_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Star_02_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Star_03_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Star_04_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Star_05_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Star_06_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Star_07_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Star_08_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Star_09_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Star_10_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Band_Vs_01_BAS'}
			case drum_basic
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Accents_01_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Accents_02_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Accents_03_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Accents_04_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Accents_05_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Accents_06_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Accents_10_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_01_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_02_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_03_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_04_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_05_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_06_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_10_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_DrumTest_01_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_DrumTest_02_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_DrumTest_03_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_DrumTest_04_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_DrumTest_05_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_DrumTest_06_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_DrumTest_07_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_DrumTest_08_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_HoldSticks_01_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_HoldSticks_02_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_HoldSticks_03_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Impro_01_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Impro_02_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickPedal_01_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickPedal_02_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickPedal_03_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickPedal_04_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickPedal_05_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickPedal_06_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickSong_01_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickSong_02_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickSong_03_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickSong_04_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickSong_05_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_KickSong_09_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_OneHand_01_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_OneHand_02_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_OneHand_03_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_OneHand_04_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_OneHand_05_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_OneHand_06_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_OneHand_07_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_OneHand_08_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_OneHand_12_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_01_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_02_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_03_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_04_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_05_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_06_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_07_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_08_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Twohands_01_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Twohands_02_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Twohands_03_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Twohands_04_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Twohands_05_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Twohands_06_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Twohands_07_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Twohands_08_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Twohands_10_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_UI_01_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_UI_02_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_UI_03_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_UI_04_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_UI_05_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_UI_06_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_UI_07_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_UI_08_DRM'
				heap = heap_bottom_up}
			LoadTutorialDrums
			case drum_int
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_ActStarPow_01_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_ActStarPow_02_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_ActStarPow_03_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_ActStarPow_04_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_ActStarPow_05_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_ActStarPow_06_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_ActStarPow_07_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_ActStarPow_08_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_ActStarPow_09_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_ActStarPow_10_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddDrum_01_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddDrum_02_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddDrum_03_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddDrum_04_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddDrum_08_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_01_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_02_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_03_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_04_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_05_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_06_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_AddKick_10_DRM'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_FirstDrum_01_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_FirstDrum_02_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_FirstDrum_03_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_FirstDrum_04_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_FirstDrum_05_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_FirstDrum_06_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_FirstDrum_07_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_FirstDrum_11_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_01_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_02_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_03_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_04_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_05_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_06_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_07_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_Positive_08_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_StarCombo_01_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_StarCombo_02_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_StarCombo_03_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_StarCombo_04_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_StarCombo_05_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_StarCombo_06_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_StarCombo_08_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_StarCombo_09_DRM'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Dru_StarCombo_10_DRM'
				heap = heap_bottom_up}
			LoadTutorialDrums
			case guitar_advanced
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HamOns_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HamOns_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HamOns_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HamOns_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HamOns_09_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HamOns_10_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HOfinger_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HOfinger_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HOfinger_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HOfinger_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HOfinger_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HOfinger_06_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HOfinger_07_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HOfinger_08_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HOfinger_13_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HOfinger_14_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_HOfinger_15_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_POFinger_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_POFinger_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_POFinger_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_POFinger_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_POFinger_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_POFinger_06_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_POFinger_07_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_POFinger_08_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_POFinger_09_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_POFinger_10_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_POFinger_15_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_06_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_07_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_08_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_PullOffs_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_PullOffs_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_PullOffs_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_PullOffs_08_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_PullOffs_09_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StringBasics_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StringBasics_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StringBasics_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StringBasics_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StringBasics_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StringBasics_06_GTR'}
			LoadSound \{'Tutorial_Missed_HOPO_Free'}
			LoadSound \{'Tutorial_String_1_HOPO_Free'}
			LoadSound \{'Tutorial_String_1_Strum_Free'}
			LoadSound \{'Tutorial_String_2_HOPO_Free'}
			LoadSound \{'Tutorial_String_2_Strum_Free'}
			LoadSound \{'Tutorial_String_3_HOPO_Free'}
			LoadSound \{'Tutorial_String_3_Strum_Free'}
			case guitar_basic
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_HoldGuitar_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_HoldGuitar_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_HoldGuitar_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_HoldGuitar_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_HoldGuitar_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_HoldGuitar_06_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_HoldGuitar_07_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_HoldGuitar_08_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_HoldGuitar_09_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_HoldGuitar_10_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_GuitarTune_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_GuitarTune_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_GuitarTune_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_GuitarTune_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_GuitarTune_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_GuitarTune_10_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_PlayNotes_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_PlayNotes_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_PlayNotes_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_PlayNotes_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_PlayNotes_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_PlayNotes_10_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_PlayNotes_11_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_PlayNotes_12_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_PlayNotes_13_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_06_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_07_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Positive_08_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_02_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_03_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_04_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_05_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_06_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_07_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_08_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_09_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_10_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_11_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_12_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_13_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_LongNotes_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_LongNotes_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_LongNotes_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_LongNotes_08_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_LongNotes_09_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_LongNotes_10_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_LongNotes_11_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_LongNotes_12_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_LongNotes_13_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Chords_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Chords_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Chords_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Chords_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Chords_09_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Chords_10_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Chords_11_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_Chords_12_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_DiffNotes_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_DiffNotes_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_DiffNotes_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_DiffNotes_08_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_DiffNotes_09_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_DiffNotes_10_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_DiffNotes_11_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_UI_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_UI_02_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_UI_03_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_UI_04_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_UI_05_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_UI_06_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_UI_07_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_UI_08_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_UI_09_BAS'}
			LoadSound \{'A_String'}
			LoadSound \{'A_Tuning'}
			LoadSound \{'B_String'}
			LoadSound \{'B_Tuning'}
			LoadSound \{'D_String'}
			LoadSound \{'D_Tuning'}
			LoadSound \{'E_String'}
			LoadSound \{'E_Tuning'}
			LoadSound \{'G_String'}
			LoadSound \{'G_Tuning'}
			case guitar_new
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_06_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_07_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_08_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_09_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_14_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_15_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_17_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_SliderTap_18_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_06_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_07_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_08_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_09_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_10_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_11_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_12_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Sustains_13_GTR'}
			case guitar_starpower
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_ActivatingSP_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_ActivatingSP_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_ActivatingSP_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_ActivatingSP_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_ActivatingSP_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_ActivatingSP_06_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_ActivatingSP_07_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_ActivatingSP_08_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_ActivatingSP_09_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StarPower_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StarPower_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StarPower_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StarPower_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StarPower_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StarPower_06_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StarPower_07_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StarPower_12_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StarPower_13_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_StarPower_14_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Whammy_01_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Whammy_02_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Whammy_03_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Whammy_04_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Whammy_05_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Whammy_06_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Whammy_07_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Whammy_12_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Whammy_13_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Whammy_14_GTR'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_GTR_Whammy_15_GTR'}
			case versus
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_Battle_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_Battle_02_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_Battle_03_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_Battle_04_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_BattleTilt_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_BattleTilt_02_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_BattleTilt_03_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_BattleTilt_04_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_DiffAttacks_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_DiffAttacks_02_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_DiffAttacks_03_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_DiffAttacks_04_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_DoOrDie_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_DoOrDie_02_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_DoOrDie_03_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_FaceOff_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_FaceOff_02_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_FaceOff_03_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_FaceOff_04_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_Modes_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_Multiples_01_BAS'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_Multiples_02_BAS'}
			case Vocals
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Freeform_01_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Freeform_02_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Freeform_03_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Freeform_04_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Freeform_05_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Freeform_06_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Freeform_07_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Freeform_08_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Freeform_09_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Freeform_10_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Highway_01_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Highway_02_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Highway_03_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Highway_04_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Highway_05_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Highway_06_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Highway_07_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_HitNotes_01_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_HitNotes_02_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_HitNotes_03_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_HitNotes_04_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_HitNotes_05_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_HitNotes_06_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_HitNotes_07_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_HitNotes_08_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_HitNotes_09_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_HitNotes_10_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_HitNotes_11_VOX'}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Intro_01_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Intro_02_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Intro_03_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Meter_01_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Meter_02_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Meter_03_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Meter_04_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Starpower_01_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Starpower_02_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Starpower_03_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Starpower_04_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Starpower_05_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Starpower_06_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Starpower_07_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Starpower_08_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Starpower_09_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Starpower_10_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Words_01_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Words_02_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Words_03_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Words_04_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Words_05_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Words_06_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Words_07_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Words_08_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Words_09_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Words_10_VOX'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vox_Words_11_VOX'
				heap = heap_bottom_up}
			case rs_introduction_lesson
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_QuickStart_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_QuickStart_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_QuickStart_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_QuickStart_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_QuickStart_05_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_QuickStart_06_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_QuickStart_07_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_QuickStart_08_BAS'
				heap = heap_bottom_up}
			<load_static_sounds> = 1
			<load_dynamic_sounds> = 1
			case rs_lead_and_bass_lesson
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_LeadBass_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_LeadBass_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_LeadBass_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_OpenStrum_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_OpenStrum_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_OpenStrum_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Gtr_OpenNotes_11_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Scale_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Scale_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Scale_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Scale_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Scale_05_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Octave_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Octave_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Octave_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Octave_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Octave_05_BAS'
				heap = heap_bottom_up}
			<load_static_sounds> = 1
			<load_dynamic_sounds> = 1
			case rs_rhythm_lesson
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Rhythm_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Rhythm_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Rhythm_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Rhythm_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Rhythm_05_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Effects_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Effects_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Effects_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Effects_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Effects_05_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Effects_06_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Effects_07_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_StepRec_04_BAS'
				heap = heap_bottom_up}
			<load_static_sounds> = 1
			<load_dynamic_sounds> = 1
			case rs_drums_lesson
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_05_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_06_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_07_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_08_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_09_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_10_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_11_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_12_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_13_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_14_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_15_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_Vs_BattleTilt_04_BAS'
				heap = heap_bottom_up}
			<load_static_sounds> = 1
			<load_dynamic_sounds> = 1
			case rs_melody_lesson
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Melody_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Melody_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Melody_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Melody_04_BAS'
				heap = heap_bottom_up}
			<load_static_sounds> = 1
			<load_dynamic_sounds> = 1
			case rs_recording_lesson
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_18_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_10_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_17_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_05_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_19_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_20_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_21_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_14_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_12_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_07_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_08_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_09_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_22_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_11_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_13_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_15_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Record_16_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_10_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_GHTunes_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_GHTunes_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_GHTunes_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_GHTunes_04_BAS'
				heap = heap_bottom_up}
			<load_static_sounds> = 1
			<load_dynamic_sounds> = 1
			case rs_pro_guitar_lesson
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_05_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_06_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_07_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_08_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_09_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_10_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_11_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_12_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_13_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_14_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_15_BAS'
				heap = heap_bottom_up}
			<load_static_sounds> = 1
			<load_dynamic_sounds> = 1
			case rs_advanced_tools_lesson
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Arpeg_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Arpeg_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Arpeg_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Drums_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_DrumMach_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_DrumMach_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_DrumMach_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_07_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_AdvGtr_10_BAS'
				heap = heap_bottom_up}
			<load_static_sounds> = 1
			<load_dynamic_sounds> = 1
			case rs_ghmix_editing_lesson
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_GHMix_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_GHMix_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_LiveRec_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_LiveRec_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_LiveRec_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_LiveRec_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_LiveRec_05_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_StepRec_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_StepRec_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_StepRec_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_StepRec_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_StepRec_05_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_StepRec_06_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Del_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Del_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Del_03_BAS'
				heap = heap_bottom_up}
			<load_static_sounds> = 1
			<load_dynamic_sounds> = 1
			case rs_ghmix_pro_techniques_tools_lesson
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Copy_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Copy_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Copy_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Copy_04_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Loop_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Loop_02_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Loop_03_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Nudge_01_BAS'
				heap = heap_bottom_up}
			LoadTutorialSFXWithPrefix \{Sound = 'Tut_RS_Nudge_02_BAS'
				heap = heap_bottom_up}
			<load_static_sounds> = 1
			<load_dynamic_sounds> = 1
		endswitch
		if (<load_static_sounds> = 1)
			LoadJamStaticSounds \{jam_ingame = 0}
		else
			LoadTutorialGeneric
		endif
		if (<load_dynamic_sounds> = 1)
			LoadJamDynamicSounds
		endif
		return
		case firstboot
		printf \{'Reloading SFX for firstboot'}
		LoadSound \{'checkbox_check_sfx'}
		LoadSound \{'checkbox_sfx'}
		LoadSound \{'Cash'}
		LoadSound \{'Purchase_Item'}
		LoadSound \{'Menu_Warning_01'}
		LoadSound \{'Menu_Intro_Lick_02'}
		LoadSound \{'Menu_Intro_Lick_03'}
		LoadSound \{'Menu_Intro_Lick_05'}
		LoadSound \{'Menu_Intro_Lick_06'}
		LoadSound \{'Menu_ZoomIn_Career'}
		LoadSound \{'Menu_ZoomOut_Career'}
		LoadSound \{'Menu_ZoomIn_Options'}
		LoadSound \{'Menu_ZoomOut_Options'}
		LoadSound \{'Menu_ZoomIn_HeadToHead'}
		LoadSound \{'Menu_ZoomOut_HeadToHead'}
		LoadSound \{'Menu_Options_Sound_Select'}
		LoadSound \{'Menu_Options_Sound_Back'}
		LoadSound \{'Menu_Options_Sound_Fader_Move'}
		LoadSound \{'Menu_Options_Sound_EQKnob_Move'}
		LoadSound \{'Menu_Options_Sound_DolbyDigitalDisable'}
		LoadSound \{'Menu_Options_Sound_DolbyDigitalEnable'}
		LoadSound \{'Menu_Select_Negative'}
		LoadSound \{'Menu_EnterName_Select'}
		LoadSound \{'Menu_EnterName_Scroll_1'}
		LoadSound \{'Menu_EnterName_Scroll_3'}
		LoadSound \{'Menu_EnterName_Finish'}
		LoadSound \{'Menu_EnterName_Back'}
		LoadSound \{'Menu_ColorWheel_GradientSelect'}
		LoadSound \{'Menu_ColorWheel_Rotate'}
		LoadSound \{'Menu_ColorWheel_HighLight_Up_Down_3'}
		LoadSound \{'Menu_ColorWheel_Deselect_PiePiece'}
		LoadSound \{'Menu_Cheat_Red'}
		LoadSound \{'Menu_Cheat_Yellow'}
		LoadSound \{'Menu_Cheat_Blue'}
		LoadSound \{'Menu_Cheat_Green'}
		LoadSound \{'Menu_Main_Intro'}
		LoadSound \{'Guitar_Select_Affirmation_1'}
		LoadSound \{'EXT_MD_Crowd_Good_Loop'}
		LoadSound \{'Menu_QuickPlay_SelectSong'}
		LoadSound \{'Menu_QuickPlay_RemoveAllSongs'}
		LoadSound \{'Menu_QuickPlay_RemoveSong'}
		LoadSound \{'Song_Affirmation_01'}
		LoadSound \{'Song_Affirmation_02'}
		LoadSound \{'Song_Affirmation_03'}
		LoadSound \{'Song_Affirmation_04'}
		LoadSound \{'Song_Affirmation_05'}
		LoadSound \{'Song_Affirmation_06'}
		LoadSound \{'Mic_Select_Affirmation_01'}
		LoadSound \{'Drum_Select_Affirmation_01'}
		LoadSound \{'Bass_Select_Affirmation_02'}
		LoadSound \{'Silence_Front_End_Crowd_Loop'}
		change \{g_current_sfx_mode = FrontEnd}
		return
		case FrontEnd
		printf \{'Reloading SFX for frontend'}
		LoadSound \{'checkbox_check_sfx'}
		LoadSound \{'checkbox_sfx'}
		LoadSound \{'Cash'}
		LoadSound \{'Purchase_Item'}
		LoadSound \{'Menu_Warning_01'}
		LoadSound \{'Menu_Intro_Lick_02'}
		LoadSound \{'Menu_Intro_Lick_03'}
		LoadSound \{'Menu_Intro_Lick_05'}
		LoadSound \{'Menu_Intro_Lick_06'}
		LoadSound \{'Menu_ZoomIn_Career'}
		LoadSound \{'Menu_ZoomOut_Career'}
		LoadSound \{'Menu_ZoomIn_Options'}
		LoadSound \{'Menu_ZoomOut_Options'}
		LoadSound \{'Menu_ZoomIn_HeadToHead'}
		LoadSound \{'Menu_ZoomOut_HeadToHead'}
		LoadSound \{'Menu_Options_Sound_Select'}
		LoadSound \{'Menu_Options_Sound_Back'}
		LoadSound \{'Menu_Options_Sound_Fader_Move'}
		LoadSound \{'Menu_Options_Sound_EQKnob_Move'}
		LoadSound \{'Menu_Options_Sound_DolbyDigitalDisable'}
		LoadSound \{'Menu_Options_Sound_DolbyDigitalEnable'}
		LoadSound \{'Menu_Select_Negative'}
		LoadSound \{'Menu_EnterName_Select'}
		LoadSound \{'Menu_EnterName_Scroll_1'}
		LoadSound \{'Menu_EnterName_Scroll_3'}
		LoadSound \{'Menu_EnterName_Finish'}
		LoadSound \{'Menu_EnterName_Back'}
		LoadSound \{'Menu_ColorWheel_GradientSelect'}
		LoadSound \{'Menu_ColorWheel_Rotate'}
		LoadSound \{'Menu_ColorWheel_HighLight_Up_Down_3'}
		LoadSound \{'Menu_ColorWheel_Deselect_PiePiece'}
		LoadSound \{'Menu_Cheat_Red'}
		LoadSound \{'Menu_Cheat_Yellow'}
		LoadSound \{'Menu_Cheat_Blue'}
		LoadSound \{'Menu_Cheat_Green'}
		LoadSound \{'Menu_Main_Intro'}
		LoadSound \{'EXT_MD_Crowd_Good_Loop'}
		LoadSound \{'Guitar_Select_Affirmation_1'}
		LoadSound \{'Menu_QuickPlay_SelectSong'}
		LoadSound \{'Menu_QuickPlay_RemoveAllSongs'}
		LoadSound \{'Menu_QuickPlay_RemoveSong'}
		LoadSound \{'Song_Affirmation_01'}
		LoadSound \{'Song_Affirmation_02'}
		LoadSound \{'Song_Affirmation_03'}
		LoadSound \{'Song_Affirmation_04'}
		LoadSound \{'Song_Affirmation_05'}
		LoadSound \{'Song_Affirmation_06'}
		LoadSound \{'Mic_Select_Affirmation_01'}
		LoadSound \{'Drum_Select_Affirmation_01'}
		LoadSound \{'Bass_Select_Affirmation_02'}
		return
		case jammode
		printf \{'Reloading SFX for Music Studio'}
		LoadJamStaticSounds jam_ingame = <jam_ingame>
		LoadJamDynamicSounds
		change g_prev_jam_ingame = <jam_ingame>
		if (<jam_ingame> = 0)
			printf \{'Do not load crowd sounds'}
			return
		endif
		crowd_heap = heap_bottom_up
		case freestyle
		LoadSound \{'You_Rock'}
		LoadSound \{'You_Rock_Explosion'}
		LoadSound \{'EXT_MD_Crowd_Good_Loop'}
		return
		default
		printf \{'**************************************'}
		printf \{'**************************************'}
		printf \{'**************************************'}
		printf \{'*** Reloading SFX for unknown mode ***'}
		printf \{'**************************************'}
		printf \{'**************************************'}
		printf \{'**************************************'}
	endswitch
	GetVenueCrowdSize
	GetAltVenueSizeString VenueSize = <VenueSize>
	LoadCrowdSounds parts = [{val = 'Crowd_Clap'} , {val = <VenueSize>}] max_num = 6 heap = heap_bottom_up
	LoadCrowdSounds parts = [{val = <VenueSizeAlt>} , {val = 'Crowd_Whistle'}] max_num = 20 heap = heap_bottom_up
	LoadCrowdSounds parts = [{val = 'Crowd_Cheer'} , {val = <VenueSizeAlt>} , {val = 'SG'}] max_num = 10 heap = heap_bottom_up
	LoadCrowdSounds parts = [{val = 'Crowd_Cheer'} , {val = <VenueSizeAlt>} , {val = 'GR'}] max_num = 10 heap = heap_bottom_up
	switch <VenueSize>
		case 'Small_INT'
		printf \{'Gathering a small group'}
		LoadSound 'INT_SM_Crowd_Applause_01' heap = <crowd_heap>
		LoadSound 'INT_SM_Crowd_Swell_SH_03' heap = <crowd_heap>
		LoadSound 'INT_SM_Crowd_Swell_MD_01' heap = <crowd_heap>
		LoadSound 'INT_SM_Crowd_Swell_LG_02' heap = <crowd_heap>
		LoadSound 'SM_Crowd_Neutral_To_Good_03' heap = <crowd_heap>
		LoadSound 'SM_Crowd_Good_To_Neutral_03' heap = <crowd_heap>
		LoadSound 'SM_Crowd_Bad_To_Neutral_01' heap = <crowd_heap>
		LoadSound 'INT_SM_Crowd_Bad_Loop' heap = <crowd_heap>
		LoadSound 'INT_SM_Crowd_Good_Loop' heap = <crowd_heap>
		LoadSound 'INT_SM_Crowd_Neutral_Loop' heap = <crowd_heap>
		LoadSound \{'SM_Crowd_Neutral_To_Bad_03'
			heap = heap_bottom_up}
		case 'Medium_EXT'
		printf \{'Filling the area with a crowd'}
		LoadSound 'EXT_MD_Crowd_Applause_02' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Swell_SH_01' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Swell_MD_02' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Swell_LG_02' heap = <crowd_heap>
		LoadSound 'MD_Crowd_Neutral_To_Good_01' heap = <crowd_heap>
		LoadSound 'MD_Crowd_Good_To_Neutral_01' heap = <crowd_heap>
		LoadSound 'MD_Crowd_Bad_To_Neutral_01' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Bad_Loop' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Good_Loop' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Neutral_Loop' heap = <crowd_heap>
		LoadSound \{'MD_Crowd_Neutral_To_Bad_02'
			heap = heap_bottom_up}
		case 'Large_EXT'
		printf \{'Gathering the masses'}
		LoadSound 'EXT_LG_Crowd_Applause_01' heap = <crowd_heap>
		LoadSound 'EXT_LG_Crowd_Swell_SH_01' heap = <crowd_heap>
		LoadSound 'EXT_LG_Crowd_Swell_MD_01' heap = <crowd_heap>
		LoadSound 'EXT_LG_Crowd_Swell_LG_02' heap = <crowd_heap>
		LoadSound 'LG_Crowd_Neutral_To_Good_01' heap = <crowd_heap>
		LoadSound 'LG_Crowd_Good_To_Neutral_01' heap = <crowd_heap>
		LoadSound 'LG_Crowd_Bad_To_Neutral_01' heap = <crowd_heap>
		LoadSound 'EXT_LG_Crowd_Bad_Loop' heap = <crowd_heap>
		LoadSound 'EXT_LG_Crowd_Good_Loop' heap = <crowd_heap>
		LoadSound 'EXT_LG_Crowd_Neutral_Loop' heap = <crowd_heap>
		LoadSound \{'LG_Crowd_Neutral_To_Bad_01'
			heap = heap_bottom_up}
		default
		printf 'Waiting for anyone to gather' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Applause_02' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Swell_SH_01' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Swell_MD_02' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Swell_LG_02' heap = <crowd_heap>
		LoadSound 'MD_Crowd_Neutral_To_Good_01' heap = <crowd_heap>
		LoadSound 'MD_Crowd_Good_To_Neutral_01' heap = <crowd_heap>
		LoadSound 'MD_Crowd_Bad_To_Neutral_01' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Bad_Loop' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Good_Loop' heap = <crowd_heap>
		LoadSound 'EXT_MD_Crowd_Neutral_Loop' heap = <crowd_heap>
		LoadSound \{'MD_Crowd_Neutral_To_Bad_02'
			heap = heap_bottom_up}
	endswitch
endscript

script LoadTutorialGeneric 
	LoadSound \{'bad_note1'}
	LoadSound \{'bad_note2'}
	LoadSound \{'bad_note3'}
	LoadSound \{'bad_note4'}
	LoadSound \{'bad_note6'}
	LoadSound \{'notes_ripple_up_01'}
	LoadSound \{'Highway_Rise'}
	LoadSound \{'UI_Song_Intro_Kick'}
	LoadSound \{'You_Rock'}
	LoadSound \{'sp_awarded1'}
	LoadSound \{'sp_awarded2'}
	LoadSound \{'Finish_Chord'}
endscript

script LoadTutorialDrums 
	LoadSound \{'heavyrockcrash_lvl_10_01'}
	LoadSound \{'heavyrockcrash_lvl_6_01'}
	LoadSound \{'heavyrockcrash_lvl_8_01'}
	LoadSound \{'heavyrockfltom_lvl_10_01'}
	LoadSound \{'heavyrockfltom_lvl_4_01'}
	LoadSound \{'heavyrockfltom_lvl_6_01'}
	LoadSound \{'heavyrockfltom_lvl_8_01'}
	LoadSound \{'heavyrockhhclosed_lvl_4_01'}
	LoadSound \{'heavyrockhhclosed_lvl_6_01'}
	LoadSound \{'heavyrockhhclosed_lvl_8_01'}
	LoadSound \{'heavyrockhhopen_lvl_10_01'}
	LoadSound \{'heavyrockhhopen_lvl_9_01'}
	LoadSound \{'heavyrockhitom_lvl_10_01'}
	LoadSound \{'heavyrockhitom_lvl_4_01'}
	LoadSound \{'heavyrockhitom_lvl_6_01'}
	LoadSound \{'heavyrockhitom_lvl_8_01'}
	LoadSound \{'heavyrockkick_lvl_10_01'}
	LoadSound \{'heavyrockride_lvl_10_01'}
	LoadSound \{'heavyrockride_lvl_6_01'}
	LoadSound \{'heavyrockride_lvl_8_01'}
	LoadSound \{'heavyrocksnare_lvl_10_01'}
	LoadSound \{'heavyrocksnare_lvl_12_03'}
	LoadSound \{'heavyrocksnare_lvl_2_01'}
	LoadSound \{'heavyrocksnare_lvl_4_01'}
	LoadSound \{'heavyrocksnare_lvl_6_01'}
	LoadSound \{'heavyrocksnare_lvl_8_01'}
endscript

script LoadJamStaticSounds 
	printf \{'Loading general gameplay sfx'}
	LoadSound \{'Menu_Options_Sound_Select'}
	LoadSound \{'Menu_Options_Sound_Fader_Move'}
	LoadSound \{'JamMode_DPad_Play'}
	LoadSound \{'JamMode_DPad_RecordingStart'}
	LoadSound \{'JamMode_DPad_RecordingStop'}
	LoadSound \{'JamMode_DPad_Stop'}
	LoadSound \{'bad_note1'}
	LoadSound \{'bad_note2'}
	LoadSound \{'bad_note3'}
	LoadSound \{'bad_note4'}
	LoadSound \{'bad_note6'}
	LoadSound \{'bad_note_bass1'}
	LoadSound \{'bad_note_bass2'}
	LoadSound \{'bad_note_bass4'}
	LoadSound \{'bad_note_bass6'}
	LoadSound \{'Bad_Note_Tom1'}
	LoadSound \{'Bad_Note_HiHat1'}
	LoadSound \{'Bad_Note_Kick1'}
	LoadSound \{'Jam_Pause_Panel_Out'}
	LoadSound \{'Jam_Pause_Panel_In'}
	LoadSound \{'Menu_Warning_01'}
	LoadSound \{'GHTunes_Back'
		heap = heap_bottom_up}
	LoadSound \{'GHTunes_Menu_Scroll'
		heap = heap_bottom_up}
	LoadSound \{'GHTunes_Select'
		heap = heap_bottom_up}
	LoadSound \{'Menu_JamMode_FXHUD_Off'
		heap = heap_bottom_up}
	LoadSound \{'Menu_JamMode_FXHUD_On'
		heap = heap_bottom_up}
	LoadSound \{'Menu_JamMode_SongWizard_OFF'
		heap = heap_bottom_up}
	LoadSound \{'Menu_JamMode_SongWizard_ON'
		heap = heap_bottom_up}
	LoadSound \{'Highway_Rise'}
	LoadSound \{'UI_Song_Intro_Kick'}
	LoadSound \{'notes_ripple_up_01'}
	LoadSound \{'StickClickLarge'}
	LoadSound \{'StickClickMed'}
	LoadSound \{'StickClickSmall'}
	LoadSound \{'HiHatClosed01'}
	LoadSound \{'UI_SFX_50_Note_Streak'}
	LoadSound \{'You_Rock'
		heap = heap_bottom_up}
	LoadSound \{'You_Rock_Explosion'
		heap = heap_bottom_up}
	LoadSound \{'Crowd_Fail_Song'
		heap = heap_bottom_up}
	LoadSound \{'sp_awarded1'
		heap = heap_bottom_up}
	LoadSound \{'sp_awarded2'
		heap = heap_bottom_up}
	LoadSound \{'Finish_Chord'
		heap = heap_bottom_up}
	printf \{'Loading bass guitar sounds'}
	LoadSound \{'fb_b_fingered_A1_s1_f5_01'}
	LoadSound \{'fb_b_fingered_Ab2_s1_f16_01'}
	LoadSound \{'fb_b_fingered_B3_s4_f16_01'}
	LoadSound \{'fb_b_fingered_C3_s4_f5_01'}
	LoadSound \{'fb_b_fingered_D2_s2_f5_01'}
	LoadSound \{'fb_b_fingered_Db3_s2_f16_01'}
	LoadSound \{'fb_b_fingered_G2_s3_f5_01'}
	LoadSound \{'fb_b_fingered_Gb3_s3_f16_01'}
	LoadSound \{'fj_b_slap_A1_s1_f5_01'}
	LoadSound \{'fj_b_slap_Ab2_s1_f16_01'}
	LoadSound \{'fj_b_slap_B3_s4_f16_01'}
	LoadSound \{'fj_b_slap_C3_s4_f5_01'}
	LoadSound \{'fj_b_slap_D2_s2_f5_01'}
	LoadSound \{'fj_b_slap_Db3_s2_f16_01'}
	LoadSound \{'fj_b_slap_G2_s3_f5_01'}
	LoadSound \{'fj_b_slap_Gb3_s3_f16_01'}
	LoadSound \{'StickClickMed'}
	LoadSound \{'Menu_Options_Sound_Fader_Move'}
	LoadSound \{'Menu_Scroll_Up'}
	LoadSound \{'Menu_Scroll_Down'}
	if (<jam_ingame> = 0)
		LoadJamEffectPreviews
	endif
endscript

script LoadJamDynamicSounds 
	printf \{'Music Studio - do selective loading'}
	LoadJamLeadGuitarSamples \{heap = heap_bottom_up}
	LoadJamRhythmGuitarSamples \{heap = heap_bottom_up}
	LoadKeyboardSamples
endscript

script LoadCheatSFX 
	printf \{'Loading remaining cheat SFX'}
	if ($CheatSFXLoaded = 1)
		printf \{'Cheat SFX already loaded, aborting'}
		return
	endif
	change \{CheatSFXLoaded = 1}
	LoadSound \{'Cheat_Guitar_Note_01'}
	LoadSound \{'Cheat_Guitar_Note_02'}
	LoadSound \{'Cheat_Guitar_Note_03'}
	LoadSound \{'Cheat_Guitar_Note_04'}
	LoadSound \{'Cheat_Guitar_Note_05'}
	LoadSound \{'Cheat_Guitar_Chord_01'}
	LoadSound \{'Cheat_Guitar_Chord_02'}
	LoadSound \{'Cheat_Guitar_Chord_03'}
	LoadSound \{'Cheat_Guitar_Chord_04'}
	LoadSound \{'Cheat_Guitar_Chord_05'}
	LoadSound \{'Cheat_Guitar_Chord_06'}
	LoadSound \{'Cheat_Guitar_Chord_07'}
	LoadSound \{'Cheat_Guitar_Chord_08'}
	LoadSound \{'Cheat_Guitar_Chord_09'}
	LoadSound \{'Cheat_Guitar_Chord_10'}
	LoadSound \{'Cheat_Guitar_Chord_11'}
	LoadSound \{'Cheat_Guitar_Chord_12'}
endscript

script LoadCrowdSounds \{max_num = 0
		heap = fmod_heap}
	<formatText01> = '%a0%b'
	<formatText10> = '%a%b'
	GetArraySize <parts>
	i = 1
	begin
	<current_format_text> = <formatText01>
	if (<i> >= 10)
		<current_format_text> = <formatText10>
	endif
	FormatText TextName = sound_id '%a_' a = (<parts> [0].val)
	<part_num> = 1
	begin
	FormatText TextName = sound_id '%a%b_' a = <sound_id> b = (<parts> [<part_num>].val)
	<part_num> = (<part_num> + 1)
	repeat (<array_size> -1)
	FormatText TextName = sound_id <current_format_text> a = <sound_id> b = <i>
	LoadSound <sound_id> heap = <heap>
	i = (<i> + 1)
	repeat <max_num>
endscript
