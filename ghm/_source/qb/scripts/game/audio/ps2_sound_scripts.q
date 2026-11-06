0xf7bea20b = none

script 0x8882d576 
	getpakmancurrent \{map = zones}
	switch <pak>
		case z_ballpark
		return \{venuesize = 'Medium_EXT'}
		case z_bayou
		return \{venuesize = 'Small_INT'}
		case z_castle
		return \{venuesize = 'Medium_EXT'}
		case z_cathedral
		return \{venuesize = 'Medium_EXT'}
		case z_fairgrounds
		return \{venuesize = 'Medium_EXT'}
		case z_frathouse
		return \{venuesize = 'Small_INT'}
		case z_goth
		return \{venuesize = 'Medium_EXT'}
		case z_harbor
		return \{venuesize = 'Medium_EXT'}
		case z_hotel
		return \{venuesize = 'Small_INT'}
		case z_metalfest
		return \{venuesize = 'Large_EXT'}
		case z_military
		return \{venuesize = 'Medium_EXT'}
		case z_newyork
		return \{venuesize = 'Large_EXT'}
		case z_recordstore
		return \{venuesize = 'Small_INT'}
		case z_tool
		return \{venuesize = 'z_TOOL'}
		default
		return \{venuesize = 'Medium_EXT'}
	endswitch
endscript

script 0xa755e7bd \{venuesize = 'Medium_EXT'}
	switch <venuesize>
		case 'Large_EXT'
		return \{0x191b609a = 'EXT_LG'}
		case 'Large_INT'
		return \{0x191b609a = 'EXT_LG'}
		case 'Medium_EXT'
		return \{0x191b609a = 'EXT_MD'}
		case 'Small_INT'
		return \{0x191b609a = 'INT_SM'}
		default
		return \{0x191b609a = 'EXT_MD'}
	endswitch
endscript

script 0xf6523eff \{sound = 'none'}
	training_get_language_prefix
	formattext textname = sound_id '%a_%b' a = <sound> b = <language_prefix>
	loadsound <sound_id> heap = <heap>
endscript
0x27707361 = none
0xae697c1f = 0
0x417433a6 = [
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
0x06de2cd8 = [
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
0x055c17e2 = 0
0x267fcbe7 = none
0x33f63f27 = [
]
0x3f1e5881 = [
]

script 0x0d6cc2e7 
	getarraysize <0x070125aa>
	if (<array_size> > 0)
		<i> = 0
		begin
		0xe7b77a42 (<0x070125aa> [<i>])
		<i> = (<i> + 1)
		repeat <array_size>
	endif
endscript

script 0x1d252f54 \{heap = 0xb5d472b2}
	if ($0x0c4737fc = $rhythm_jam_set)
		printf \{'Rhythm effect sample set already loaded. Skip.'}
		return
	endif
	printf \{qs(0x7c437490)
		a = $rhythm_jam_set}
	0x0d6cc2e7 \{0x070125aa = $0x3f1e5881}
	getarraysize \{$0x06de2cd8}
	0x51470282 = <array_size>
	<i> = 0
	<array> = []
	begin
	formattext textname = 0x78427a75 '%p_%s' p = $rhythm_jam_set s = ($0x06de2cd8 [<i>])
	loadsound <0x78427a75> heap = <heap>
	addarrayelement array = <array> element = <0x78427a75>
	<i> = (<i> + 1)
	repeat <0x51470282>
	change 0x3f1e5881 = <array>
	change 0x0c4737fc = ($rhythm_jam_set)
endscript

script 0x4bb67432 \{heap = 0xb5d472b2}
	if ($0x355c9929 = $lead_jam_set)
		printf \{'Lead effect sample set already loaded. Skip.'}
		return
	endif
	printf \{qs(0x6ab968d9)
		b = $lead_jam_set}
	0x0d6cc2e7 \{0x070125aa = $0x33f63f27}
	getarraysize \{$0x417433a6}
	0xd4520644 = <array_size>
	<i> = 0
	<array> = []
	begin
	formattext textname = 0x78427a75 '%p_%s' p = $lead_jam_set s = ($0x417433a6 [<i>])
	loadsound <0x78427a75> heap = <heap>
	addarrayelement array = <array> element = <0x78427a75>
	<i> = (<i> + 1)
	repeat <0xd4520644>
	change 0x33f63f27 = <array>
	change 0x355c9929 = ($lead_jam_set)
endscript

script 0x0ec8e62e \{heap = 0xb5d472b2}
	printf \{'Load music studio effects previews'}
	effects_array = $jam_lead_effects
	getarraysize <effects_array>
	i = 0
	begin
	formattext textname = preview_sample '%a_preview' a = (<effects_array> [<i>].ps2_prefix)
	loadsound <preview_sample> heap = <heap>
	<i> = (<i> + 1)
	repeat <array_size>
endscript

script 0x388acbb7 
	if ($0xe736fc0c = $0x8931f588)
		printf \{qs(0xb6b0a523)
			a = $0xe736fc0c}
		return
	endif
	if NOT ($0x8931f588 = '')
		if NOT ($0x8eb83d8c = $0x8931f588)
			printf \{qs(0x5fe902a8)
				a = $0x8931f588}
			0xe7b77a42 \{$0x8931f588}
		endif
	endif
	printf \{qs(0xebcded6e)
		a = $0xe736fc0c}
	loadsound \{$0xe736fc0c}
	change 0x8931f588 = ($0xe736fc0c)
endscript

script 0x763b2917 
	if (($0x8eb83d8c = $0x874e47d8) || ($0xe736fc0c = $0x8eb83d8c))
		printf \{qs(0x3bca7278)
			a = $0x8eb83d8c}
		return
	endif
	if NOT ($0x874e47d8 = '')
		if NOT ($0x874e47d8 = $0xe736fc0c)
			printf \{qs(0x83c1bcf8)
				a = $0x874e47d8}
			0xe7b77a42 \{$0x874e47d8}
		endif
	endif
	printf \{qs(0xc942b6f5)
		a = $0x8eb83d8c}
	loadsound \{$0x8eb83d8c
		heap = heap_cas}
	change 0x874e47d8 = ($0x8eb83d8c)
endscript

script 0xf7b44917 
	<structure> = $metallica_intro_vo_current_struct
	if structurecontains structure = <structure> rhythm_anim_name
		custom_anim_name = (<structure>.rhythm_anim_name)
	else
		return
	endif
	switch <custom_anim_name>
		case vo_james_generic_03
		loadsound \{'James_VO_Generic_3'}
		case vo_james_generic_05
		loadsound \{'James_VO_Generic_5'}
		case vo_james_generic_06
		loadsound \{'James_VO_Generic_6'}
		case vo_james_generic_07
		loadsound \{'James_VO_Generic_7'}
		case vo_james_generic_08
		loadsound \{'James_VO_Generic_8'}
		case vo_james_generic_13
		loadsound \{'James_VO_Generic_13'}
		case vo_james_generic_09
		loadsound \{'James_VO_Generic_9'}
		case vo_james_generic_04
		loadsound \{'James_VO_Generic_4'}
		case vo_james_generic_16
		loadsound \{'James_VO_Generic_16'}
		case vo_james_generic_02
		loadsound \{'James_VO_Generic_2'}
		case vo_james_generic_10
		loadsound \{'James_VO_Generic_10'}
		case vo_james_generic_11
		loadsound \{'James_VO_Generic_11'}
		case vo_james_generic_12
		loadsound \{'James_VO_Generic_12'}
		case vo_james_generic_14
		loadsound \{'James_VO_Generic_14'}
		case vo_james_generic_15
		loadsound \{'James_VO_Generic_15'}
		case vo_james_generic_17
		loadsound \{'James_VO_Generic_17'}
		case vo_james_generic_19
		loadsound \{'James_VO_Generic_19'}
		case vo_james_generic_18
		loadsound \{'James_VO_Generic_18'}
		case vo_james_generic_20
		loadsound \{'James_VO_Generic_20'}
		case vo_james_encore_02
		loadsound \{'James_VO_Encore_2'}
		case vo_james_song_01
		loadsound \{'James_VO_Song_1'}
		case vo_james_song_02
		loadsound \{'James_VO_Song_2'}
		case vo_james_song_05
		loadsound \{'James_VO_Song_5'}
		case vo_james_song_06
		loadsound \{'James_VO_Song_6'}
	endswitch
endscript

script 0xf301e1c3 
	randomize
	Random (
		@ loadsound \{'Menu_Intro_Lick_02'}
		change \{0xf7bea20b = menu_intro_lick_02}
		@ loadsound \{'Menu_Intro_Lick_03'}
		change \{0xf7bea20b = menu_intro_lick_03}
		@ loadsound \{'Menu_Intro_Lick_05'}
		change \{0xf7bea20b = menu_intro_lick_05}
		@ loadsound \{'Menu_Intro_Lick_06'}
		change \{0xf7bea20b = menu_intro_lick_06}
		@ loadsound \{'Menu_Intro_Lick_07'}
		change \{0xf7bea20b = menu_intro_lick_07}
		@ loadsound \{'Menu_Intro_Lick_09'}
		change \{0xf7bea20b = menu_intro_lick_09}
		@ loadsound \{'Menu_Intro_Lick_11'}
		change \{0xf7bea20b = menu_intro_lick_11}
		@ loadsound \{'Menu_Intro_Lick_13'}
		change \{0xf7bea20b = menu_intro_lick_13}
		)
endscript

script 0xc1c4e84c \{mode = 0xae92eddf
		0xd607e2e6 = 0
		force = 0
		0x044dc3cd = 0}
	pushmemprofile \{'ReloadSFX'}
	if NOT (<0xd607e2e6> = 1)
		stopallsounds
	endif
	printf \{'-- LOADING SOUNDS --'}
	printf '-- mode = %d --' d = <mode>
	<0x2ec5c7a0> = 0
	if NOT (<force> = 1)
		if ($0x27707361 = <mode>)
			if ((<mode> != jammode) && (<mode> != tutorials))
				<0x2ec5c7a0> = 1
			elseif ((<mode> = jammode) && ($0x055c17e2 = 1) && (<0x044dc3cd> = 1) && ($0xe736fc0c = $0x8931f588) && ($0x8eb83d8c = $0x874e47d8))
				loaddrumkitall drum_kit = ($0x11afd57c) percussion_kit = ($0x5c345721)
				0xf2760840 0x044dc3cd = <0x044dc3cd>
				<0x2ec5c7a0> = 1
			endif
		endif
	endif
	if (<0x2ec5c7a0> = 1)
		printf \{'Already in sound mode! Exit load.'}
		popmemprofile
		return
	endif
	if ($g_in_tutorial = 1)
		if NOT (<mode> = tutorials)
			printf \{'In tutorial.  Reload aborted.'}
			popmemprofile
			return
		endif
	endif
	change 0x27707361 = <mode>
	if (<mode> = frontend)
		unloaddrumkitall
	endif
	printf \{'== UnloadAllSFX =='}
	0xc48cfd3c
	if NOT (<mode> = frontend)
		printf \{'Load drums onto fmod heap'}
		<0x66557c7f> = 0xa47d93f4
		if NOT ($loadeddrumkitpaks_cymbal = 'none')
			printf \{'Load cymbals'}
			($loadeddrumkitpaks_cymbal) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_floortom = 'none')
			printf \{'Load floortom'}
			($loadeddrumkitpaks_floortom) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_hihat = 'none')
			printf \{'Load hihat'}
			($loadeddrumkitpaks_hihat) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_hitom = 'none')
			printf \{'Load hitom'}
			($loadeddrumkitpaks_hitom) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_kick = 'none')
			printf \{'Load kick'}
			($loadeddrumkitpaks_kick) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_snare = 'none')
			printf \{'Load snare'}
			($loadeddrumkitpaks_snare) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_cymbal_percussion = 'none')
			printf \{'Load cymbal_percussion'}
			($loadeddrumkitpaks_cymbal_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_floortom_percussion = 'none')
			printf \{'Load floortom_percussion'}
			($loadeddrumkitpaks_floortom_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_hihat_percussion = 'none')
			printf \{'Load hihat_percussion'}
			($loadeddrumkitpaks_hihat_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_hitom_percussion = 'none')
			printf \{'Load hitom_percussion'}
			($loadeddrumkitpaks_hitom_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_kick_percussion = 'none')
			printf \{'Load kick_percussion'}
			($loadeddrumkitpaks_kick_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		if NOT ($loadeddrumkitpaks_snare_percussion = 'none')
			printf \{'Load snare_percussion'}
			($loadeddrumkitpaks_snare_percussion) 0xcd98d3f6 = <0x66557c7f>
		endif
		printf \{'Drums loaded'}
	endif
	change \{0x355c9929 = none}
	change \{0x0c4737fc = none}
	change \{0x33f63f27 = [
		]}
	change \{0x3f1e5881 = [
		]}
	change \{0x8931f588 = ''}
	change \{0x874e47d8 = ''}
	change \{0xae697c1f = 0}
	if ($0x27707361 = none)
		popmemprofile
		return
	endif
	0x6dbf77b0 = 0xb5d472b2
	loadsound \{'GH3_Beat_Sound'}
	loadsound \{'UI_Sound_05'}
	loadsound \{'UI_Sound_09'}
	loadsound \{'Menu_Scroll_Down'}
	loadsound \{'Menu_Scroll_Up'}
	loadsound \{'Menu_Into_PauseMenu'}
	loadsound \{'Menu_Select_Negative'}
	loadsound \{'Menu_QuickPlay_RemoveSong'}
	loadsound \{'Select_Sound_Big'}
	loadsound \{'Select_Sound_Small'}
	switch <mode>
		case 0xae92eddf
		printf \{'Reloading SFX for oogame'}
		loadsound \{'bad_note1'}
		loadsound \{'bad_note2'}
		loadsound \{'bad_note3'}
		loadsound \{'bad_note4'}
		loadsound \{'bad_note6'}
		loadsound \{'bad_note_bass1'}
		loadsound \{'bad_note_bass2'}
		loadsound \{'bad_note_bass4'}
		loadsound \{'bad_note_bass6'}
		loadsound \{'Highway_Rise'}
		loadsound \{'UI_Song_Intro_Kick'}
		loadsound \{'notes_ripple_up_01'}
		loadsound \{'StickClickLarge'}
		loadsound \{'StickClickMed'}
		loadsound \{'StickClickSmall'}
		loadsound \{'HiHatClosed01'}
		loadsound \{'Guitar_Smash_Large_GH4_01'}
		loadsound \{'Guitar_Smash_Medium_GH4_01'}
		loadsound \{'Guitar_Smash_Small_GH4_01'}
		loadsound \{'Menu_Options_Sound_Select'}
		loadsound \{'Menu_Options_Sound_Back'}
		loadsound \{'Menu_Options_Sound_Fader_Move'}
		loadsound \{'Pyro_1'}
		loadsound \{'Pyro_2'}
		loadsound \{'Pyro_3'}
		loadsound \{'UI_SFX_50_Note_Streak'
			heap = 0xc39f2ba1}
		if NOT ($game_mode = training)
			loadsound \{'UI_Lose_Multiplier'}
			loadsound \{'Crowd_Group_Clap_01'}
			loadsound \{'Crowd_Group_Clap_02'}
			loadsound \{'Crowd_Group_Clap_03'}
			loadsound \{'Crowd_Group_Clap_04'}
			loadsound \{'Crowd_Group_Clap_05'}
			loadsound \{'Crowd_Group_Clap_06'}
			loadsound \{'sp_awarded1'}
			loadsound \{'sp_awarded2'
				heap = 0xc39f2ba1}
			loadsound \{'sp_available1'
				heap = 0xc39f2ba1}
			loadsound \{'sp_cheer1'
				heap = 0xc39f2ba1}
			loadsound \{'You_Rock'
				heap = 0xc39f2ba1}
			loadsound \{'Crowd_Fail_Song'
				heap = 0xc39f2ba1}
			loadsound \{'sp_deployed'
				heap = 0xc39f2ba1}
			loadsound \{'Star_Available'
				heap = 0xc39f2ba1}
			loadsound \{'Star_Deployed_LFE'
				heap = 0xc39f2ba1}
			loadsound \{'Star_Release_Center'
				heap = 0xc39f2ba1}
			loadsound \{'Star_Release_Front'
				heap = 0xc39f2ba1}
		endif
		loadsound \{'Bad_Note_Tom1'
			heap = 0xc39f2ba1}
		loadsound \{'Bad_Note_HiHat1'
			heap = 0xc39f2ba1}
		loadsound \{'Bad_Note_Kick1'
			heap = 0xc39f2ba1}
		case 0x07071941
		printf \{qs(0xbb8fd230)}
		loadsound \{'Gig_Complete_Sponsor'}
		loadsound \{'GigComplete_Unlock_Item_Text_Appear'}
		loadsound \{'GigComplete_Unlock_New_Item'}
		loadsound \{'checkbox_check_sfx'}
		loadsound \{'Menu_EnterName_Select'}
		loadsound \{'Menu_EnterName_Scroll_1'}
		loadsound \{'Menu_EnterName_Finish'}
		loadsound \{'Menu_EnterName_Back'}
		loadsound \{'Menu_EnterName_Caps'}
		loadsound \{'Cash'}
		loadsound \{'Purchase_Item'}
		loadsound \{'Pre_Cutscence_SFX'}
		return
		case 0x68721771
		printf \{'Reloading SFX for oogame'}
		loadsound \{'bad_note1'}
		loadsound \{'bad_note2'}
		loadsound \{'bad_note3'}
		loadsound \{'bad_note4'}
		loadsound \{'bad_note6'}
		loadsound \{'bad_note_bass1'}
		loadsound \{'bad_note_bass2'}
		loadsound \{'bad_note_bass4'}
		loadsound \{'bad_note_bass6'}
		loadsound \{'notes_ripple_up_01'}
		loadsound \{'Multiplayer_Win_Screen'}
		loadsound \{'Highway_Rise'}
		loadsound \{'UI_Song_Intro_Kick'}
		loadsound \{'Crowd_Group_Clap_01'}
		loadsound \{'Crowd_Group_Clap_02'}
		loadsound \{'Crowd_Group_Clap_03'}
		loadsound \{'Crowd_Group_Clap_04'}
		loadsound \{'Crowd_Group_Clap_05'}
		loadsound \{'Crowd_Group_Clap_06'}
		loadsound \{'StickClickLarge'}
		loadsound \{'StickClickMed'}
		loadsound \{'StickClickSmall'}
		loadsound \{'HiHatClosed01'}
		loadsound \{'UI_Lose_Multiplier'}
		loadsound \{'Guitar_Smash_Large_GH4_01'}
		loadsound \{'Guitar_Smash_Medium_GH4_01'}
		loadsound \{'Guitar_Smash_Small_GH4_01'}
		loadsound \{'sp_available1'
			heap = 0xc39f2ba1}
		loadsound \{'sp_awarded1'
			heap = 0xc39f2ba1}
		loadsound \{'sp_awarded2'
			heap = 0xc39f2ba1}
		loadsound \{'UI_SFX_50_Note_Streak'
			heap = 0xc39f2ba1}
		loadsound \{'sp_deployed'
			heap = 0xc39f2ba1}
		loadsound \{'Star_Available'
			heap = 0xc39f2ba1}
		loadsound \{'Star_Deployed_LFE'
			heap = 0xc39f2ba1}
		loadsound \{'Star_Release_Center'
			heap = 0xc39f2ba1}
		loadsound \{'Star_Release_Front'
			heap = 0xc39f2ba1}
		loadsound \{'Crowd_Fail_Song'
			heap = 0xc39f2ba1}
		loadsound \{'sp_cheer1'
			heap = 0xc39f2ba1}
		loadsound \{'Menu_Options_Sound_Fader_Move'}
		loadsound \{'Menu_Options_Sound_Select'}
		loadsound \{'Menu_Options_Sound_Back'}
		loadsound \{'You_Rock'
			heap = 0xc39f2ba1}
		loadsound \{'Bad_Note_Tom1'
			heap = 0xc39f2ba1}
		loadsound \{'Bad_Note_HiHat1'
			heap = 0xc39f2ba1}
		loadsound \{'Bad_Note_Kick1'
			heap = 0xc39f2ba1}
		case battle
		printf \{'Reloading SFX for battle'}
		loadsound \{'bad_note1'}
		loadsound \{'bad_note2'}
		loadsound \{'bad_note3'}
		loadsound \{'bad_note4'}
		loadsound \{'bad_note6'}
		loadsound \{'notes_ripple_up_01'}
		loadsound \{'GH3_Battle_DifficultyRampUp'}
		loadsound \{'GH3_BattleMode_Attack_Over'}
		loadsound \{'GH3_BattleMode_DoubleNoteAttack'}
		loadsound \{'GH3_BattleMode_LeftyAttack'}
		loadsound \{'GH3_BattleMode_Lightning'}
		loadsound \{'GH3_BattleMode_StealPowerup'}
		loadsound \{'GH3_BattleMode_StringBreakAttack'}
		loadsound \{'GH3_BattleMode_WhammyAttack'}
		loadsound \{'GH3_BattleMode_WhammyAttack_Received'}
		loadsound \{'GHM_RideTheLightning_Release'}
		loadsound \{'GHM_HitTheLights_Release'}
		loadsound \{'GHM_DamageInc_Attack'}
		loadsound \{'GHM_TrappedUnderIce_Release'}
		loadsound \{'GHM_RideTheLightning_Attack'}
		loadsound \{'GHM_HitTheLights_Attack'}
		loadsound \{'GHM_TrappedUnderIce_Attack'}
		loadsound \{'Highway_Rise'}
		loadsound \{'GH3_BattleMode_StringTune_2'}
		loadsound \{'UI_Song_Intro_Kick'}
		loadsound \{'UI_Lose_Multiplier'}
		loadsound \{'UI_SFX_50_Note_Streak'}
		loadsound \{'Multiplayer_Win_Screen'}
		loadsound \{'bad_note_bass4'}
		loadsound \{'StickClickMed'}
		loadsound \{'sp_awarded1'
			heap = 0xc39f2ba1}
		loadsound \{'You_Rock'
			heap = 0xc39f2ba1}
		loadsound \{'GH3_Sudden_Death'
			heap = 0xc39f2ba1}
		loadsound \{'Menu_Options_Sound_Fader_Move'}
		loadsound \{'Menu_Options_Sound_Select'}
		loadsound \{'Menu_Options_Sound_Back'}
		loadsound \{'Bad_Note_Tom1'
			heap = 0xc39f2ba1}
		loadsound \{'Bad_Note_HiHat1'
			heap = 0xc39f2ba1}
		loadsound \{'Bad_Note_Kick1'
			heap = 0xc39f2ba1}
		case tutorials
		printf 'Reloading SFX for tutorial %s' s = <tutorial>
		<0x8d17cebe> = 0
		<0x9bcc0bca> = 0
		switch <tutorial>
			case band
			0xf6523eff \{sound = 'Tut_Band_Intro_01_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Intro_02_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Play_01_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Star_01_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Star_02_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Star_03_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Star_04_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Star_05_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Star_06_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Star_07_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Star_08_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Star_09_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Star_10_BAS'}
			0xf6523eff \{sound = 'Tut_Band_Vs_01_BAS'}
			case 0xbf7e526d
			0xf6523eff \{sound = 'Tut_Dru_Accents_01_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_Accents_02_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_Accents_03_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_Accents_04_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_Accents_05_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_Accents_06_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_Accents_10_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_01_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_02_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_03_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_04_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_05_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_06_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_10_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_DrumTest_01_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_DrumTest_02_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_DrumTest_03_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_DrumTest_04_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_DrumTest_05_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_DrumTest_06_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_DrumTest_07_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_DrumTest_08_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_HoldSticks_01_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_HoldSticks_02_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_HoldSticks_03_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_Impro_01_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_Impro_02_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_KickPedal_01_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_KickPedal_02_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_KickPedal_03_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_KickPedal_04_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_KickPedal_05_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_KickPedal_06_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_KickSong_01_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_KickSong_02_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_KickSong_03_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_KickSong_04_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_KickSong_05_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_KickSong_09_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_OneHand_01_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_OneHand_02_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_OneHand_03_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_OneHand_04_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_OneHand_05_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_OneHand_06_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_OneHand_07_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_OneHand_08_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_OneHand_12_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_01_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_02_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_03_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_04_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_05_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_06_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_07_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_08_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Twohands_01_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Twohands_02_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Twohands_03_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Twohands_04_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Twohands_05_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Twohands_06_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Twohands_07_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Twohands_08_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Twohands_10_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_UI_01_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_UI_02_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_UI_03_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_UI_04_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_UI_05_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_UI_06_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_UI_07_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_UI_08_DRM'
				heap = 0xc39f2ba1}
			0x04a6251d
			case 0xf7b87c0c
			0xf6523eff \{sound = 'Tut_Dru_ActStarPow_01_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_ActStarPow_02_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_ActStarPow_03_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_ActStarPow_04_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_ActStarPow_05_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_ActStarPow_06_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_ActStarPow_07_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_ActStarPow_08_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_ActStarPow_09_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_ActStarPow_10_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddDrum_01_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddDrum_02_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddDrum_03_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddDrum_04_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddDrum_08_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_01_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_02_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_03_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_04_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_05_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_06_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_AddKick_10_DRM'}
			0xf6523eff \{sound = 'Tut_Dru_FirstDrum_01_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_FirstDrum_02_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_FirstDrum_03_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_FirstDrum_04_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_FirstDrum_05_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_FirstDrum_06_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_FirstDrum_07_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_FirstDrum_11_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_01_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_02_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_03_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_04_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_05_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_06_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_07_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_Positive_08_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_StarCombo_01_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_StarCombo_02_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_StarCombo_03_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_StarCombo_04_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_StarCombo_05_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_StarCombo_06_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_StarCombo_08_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_StarCombo_09_DRM'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Dru_StarCombo_10_DRM'
				heap = 0xc39f2ba1}
			0x04a6251d
			case 0x26542416
			0xf6523eff \{sound = 'Tut_GTR_HamOns_01_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HamOns_02_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HamOns_03_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HamOns_04_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HamOns_09_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HamOns_10_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HOfinger_01_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HOfinger_02_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HOfinger_03_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HOfinger_04_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HOfinger_05_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HOfinger_06_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HOfinger_07_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HOfinger_08_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HOfinger_13_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HOfinger_14_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_HOfinger_15_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_POFinger_01_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_POFinger_02_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_POFinger_03_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_POFinger_04_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_POFinger_05_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_POFinger_06_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_POFinger_07_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_POFinger_08_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_POFinger_09_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_POFinger_10_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_POFinger_15_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_01_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_02_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_03_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_04_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_05_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_06_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_07_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_08_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_PullOffs_01_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_PullOffs_02_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_PullOffs_03_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_PullOffs_08_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_PullOffs_09_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StringBasics_01_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StringBasics_02_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StringBasics_03_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StringBasics_04_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StringBasics_05_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StringBasics_06_GTR'}
			loadsound \{'Tutorial_Missed_HOPO_Free'}
			loadsound \{'Tutorial_String_1_HOPO_Free'}
			loadsound \{'Tutorial_String_1_Strum_Free'}
			loadsound \{'Tutorial_String_2_HOPO_Free'}
			loadsound \{'Tutorial_String_2_Strum_Free'}
			loadsound \{'Tutorial_String_3_HOPO_Free'}
			loadsound \{'Tutorial_String_3_Strum_Free'}
			case 0x1b1da68e
			0xf6523eff \{sound = 'Tut_Gtr_HoldGuitar_01_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_HoldGuitar_02_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_HoldGuitar_03_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_HoldGuitar_04_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_HoldGuitar_05_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_HoldGuitar_06_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_HoldGuitar_07_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_HoldGuitar_08_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_HoldGuitar_09_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_HoldGuitar_10_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_GuitarTune_01_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_GuitarTune_02_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_GuitarTune_03_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_GuitarTune_04_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_GuitarTune_05_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_GuitarTune_10_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_PlayNotes_01_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_PlayNotes_02_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_PlayNotes_03_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_PlayNotes_04_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_PlayNotes_05_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_PlayNotes_10_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_PlayNotes_11_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_PlayNotes_12_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_PlayNotes_13_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_01_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_02_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_03_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_04_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_05_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_06_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_07_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Positive_08_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_01_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_02_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_03_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_04_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_05_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_06_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_07_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_08_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_09_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_10_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_11_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_12_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_13_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_LongNotes_01_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_LongNotes_02_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_LongNotes_03_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_LongNotes_08_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_LongNotes_09_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_LongNotes_10_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_LongNotes_11_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_LongNotes_12_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_LongNotes_13_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Chords_01_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Chords_02_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Chords_03_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Chords_04_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Chords_09_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Chords_10_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Chords_11_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_Chords_12_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_DiffNotes_01_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_DiffNotes_02_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_DiffNotes_03_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_DiffNotes_08_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_DiffNotes_09_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_DiffNotes_10_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_DiffNotes_11_GTR'}
			0xf6523eff \{sound = 'Tut_Gtr_UI_01_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_UI_02_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_UI_03_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_UI_04_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_UI_05_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_UI_06_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_UI_07_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_UI_08_BAS'}
			0xf6523eff \{sound = 'Tut_Gtr_UI_09_BAS'}
			loadsound \{'A_String'}
			loadsound \{'A_Tuning'}
			loadsound \{'B_String'}
			loadsound \{'B_Tuning'}
			loadsound \{'D_String'}
			loadsound \{'D_Tuning'}
			loadsound \{'E_String'}
			loadsound \{'E_Tuning'}
			loadsound \{'G_String'}
			loadsound \{'G_Tuning'}
			case 0x058fac41
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_01_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_02_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_03_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_04_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_05_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_06_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_07_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_08_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_09_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_14_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_15_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_17_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_SliderTap_18_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_01_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_02_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_03_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_04_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_05_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_06_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_07_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_08_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_09_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_10_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_11_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_12_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Sustains_13_GTR'}
			case 0x00f0a8c8
			0xf6523eff \{sound = 'Tut_GTR_ActivatingSP_01_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_ActivatingSP_02_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_ActivatingSP_03_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_ActivatingSP_04_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_ActivatingSP_05_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_ActivatingSP_06_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_ActivatingSP_07_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_ActivatingSP_08_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_ActivatingSP_09_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StarPower_01_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StarPower_02_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StarPower_03_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StarPower_04_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StarPower_05_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StarPower_06_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StarPower_07_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StarPower_12_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StarPower_13_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_StarPower_14_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Whammy_01_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Whammy_02_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Whammy_03_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Whammy_04_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Whammy_05_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Whammy_06_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Whammy_07_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Whammy_12_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Whammy_13_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Whammy_14_GTR'}
			0xf6523eff \{sound = 'Tut_GTR_Whammy_15_GTR'}
			case versus
			0xf6523eff \{sound = 'Tut_Vs_Battle_01_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_Battle_02_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_Battle_03_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_Battle_04_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_BattleTilt_01_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_BattleTilt_02_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_BattleTilt_03_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_BattleTilt_04_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_DiffAttacks_01_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_DiffAttacks_02_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_DiffAttacks_03_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_DiffAttacks_04_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_DoOrDie_01_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_DoOrDie_02_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_DoOrDie_03_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_FaceOff_01_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_FaceOff_02_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_FaceOff_03_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_FaceOff_04_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_Modes_01_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_Multiples_01_BAS'}
			0xf6523eff \{sound = 'Tut_Vs_Multiples_02_BAS'}
			case vocals
			0xf6523eff \{sound = 'Tut_Vox_Freeform_01_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Freeform_02_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Freeform_03_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Freeform_04_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Freeform_05_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Freeform_06_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Freeform_07_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Freeform_08_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Freeform_09_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Freeform_10_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Highway_01_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Highway_02_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Highway_03_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Highway_04_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Highway_05_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Highway_06_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Highway_07_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_HitNotes_01_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_HitNotes_02_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_HitNotes_03_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_HitNotes_04_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_HitNotes_05_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_HitNotes_06_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_HitNotes_07_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_HitNotes_08_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_HitNotes_09_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_HitNotes_10_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_HitNotes_11_VOX'}
			0xf6523eff \{sound = 'Tut_Vox_Intro_01_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Intro_02_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Intro_03_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Meter_01_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Meter_02_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Meter_03_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Meter_04_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Starpower_01_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Starpower_02_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Starpower_03_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Starpower_04_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Starpower_05_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Starpower_06_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Starpower_07_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Starpower_08_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Starpower_09_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Starpower_10_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Words_01_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Words_02_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Words_03_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Words_04_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Words_05_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Words_06_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Words_07_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Words_08_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Words_09_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Words_10_VOX'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vox_Words_11_VOX'
				heap = 0xc39f2ba1}
			case rs_introduction_lesson
			0xf6523eff \{sound = 'Tut_RS_QuickStart_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_QuickStart_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_QuickStart_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_QuickStart_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_QuickStart_05_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_QuickStart_06_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_QuickStart_07_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_QuickStart_08_BAS'
				heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_lead_and_bass_lesson
			0xf6523eff \{sound = 'Tut_RS_LeadBass_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_LeadBass_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_LeadBass_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_OpenStrum_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_OpenStrum_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_OpenStrum_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Gtr_OpenNotes_11_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Scale_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Scale_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Scale_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Scale_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Scale_05_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Octave_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Octave_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Octave_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Octave_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Octave_05_BAS'
				heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_rhythm_lesson
			0xf6523eff \{sound = 'Tut_RS_Rhythm_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Rhythm_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Rhythm_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Rhythm_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Rhythm_05_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Effects_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Effects_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Effects_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Effects_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Effects_05_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Effects_06_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Effects_07_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_StepRec_04_BAS'
				heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_drums_lesson
			0xf6523eff \{sound = 'Tut_RS_Drums_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_05_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_06_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_07_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_08_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_09_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_10_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_11_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_12_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_13_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_14_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_15_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_Vs_BattleTilt_04_BAS'
				heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_melody_lesson
			0xf6523eff \{sound = 'Tut_RS_Melody_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Melody_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Melody_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Melody_04_BAS'
				heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_recording_lesson
			0xf6523eff \{sound = 'Tut_RS_Record_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_18_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_10_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_17_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_05_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_19_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_20_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_21_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_14_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_12_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_07_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_08_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_09_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_22_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_11_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_13_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_15_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Record_16_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_10_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_GHTunes_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_GHTunes_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_GHTunes_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_GHTunes_04_BAS'
				heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_pro_guitar_lesson
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_05_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_06_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_07_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_08_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_09_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_10_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_11_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_12_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_13_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_14_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_15_BAS'
				heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_advanced_tools_lesson
			0xf6523eff \{sound = 'Tut_RS_Arpeg_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Arpeg_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Arpeg_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Drums_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_DrumMach_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_DrumMach_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_DrumMach_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_07_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_AdvGtr_10_BAS'
				heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_ghmix_editing_lesson
			0xf6523eff \{sound = 'Tut_RS_GHMix_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_GHMix_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_LiveRec_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_LiveRec_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_LiveRec_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_LiveRec_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_LiveRec_05_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_StepRec_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_StepRec_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_StepRec_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_StepRec_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_StepRec_05_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_StepRec_06_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Del_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Del_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Del_03_BAS'
				heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
			case rs_ghmix_pro_techniques_tools_lesson
			0xf6523eff \{sound = 'Tut_RS_Copy_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Copy_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Copy_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Copy_04_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Loop_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Loop_02_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Loop_03_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Nudge_01_BAS'
				heap = 0xc39f2ba1}
			0xf6523eff \{sound = 'Tut_RS_Nudge_02_BAS'
				heap = 0xc39f2ba1}
			<0x8d17cebe> = 1
			<0x9bcc0bca> = 1
		endswitch
		if (<0x8d17cebe> = 1)
			0x6057a46c \{0x044dc3cd = 0}
		else
			0x28919004
		endif
		if (<0x9bcc0bca> = 1)
			0xf2760840
		endif
		change 0x267fcbe7 = <tutorial>
		popmemprofile
		return
		case 0x64912155
		printf \{'Reloading SFX for firstboot'}
		loadsound \{'checkbox_check_sfx'}
		loadsound \{'CheckBox_Check_SFX_2'}
		loadsound \{'checkbox_sfx'}
		loadsound \{'Cash'}
		loadsound \{'Purchase_Item'}
		loadsound \{'Menu_Warning_01'}
		loadsound \{'Menu_ZoomIn_Career'}
		loadsound \{'Menu_ZoomOut_Career'}
		loadsound \{'Menu_ZoomIn_Options'}
		loadsound \{'Menu_ZoomOut_Options'}
		loadsound \{'Menu_ZoomIn_HeadToHead'}
		loadsound \{'Menu_ZoomOut_HeadToHead'}
		loadsound \{'Menu_Options_Sound_Select'}
		loadsound \{'Menu_Options_Sound_Back'}
		loadsound \{'Menu_Options_Sound_Fader_Move'}
		loadsound \{'Menu_Options_Sound_EQKnob_Move'}
		loadsound \{'Menu_Options_Sound_DolbyDigitalDisable'}
		loadsound \{'Menu_Options_Sound_DolbyDigitalEnable'}
		loadsound \{'Menu_EnterName_Select'}
		loadsound \{'Menu_EnterName_Scroll_1'}
		loadsound \{'Menu_EnterName_Scroll_3'}
		loadsound \{'Menu_EnterName_Finish'}
		loadsound \{'Menu_EnterName_Back'}
		loadsound \{'Menu_ColorWheel_GradientSelect'}
		loadsound \{'Menu_ColorWheel_Rotate'}
		loadsound \{'Menu_ColorWheel_HighLight_Up_Down_3'}
		loadsound \{'Menu_ColorWheel_Deselect_PiePiece'}
		loadsound \{'Menu_Cheat_Red'}
		loadsound \{'Menu_Cheat_Yellow'}
		loadsound \{'Menu_Cheat_Blue'}
		loadsound \{'Menu_Cheat_Green'}
		loadsound \{'Menu_Main_Intro'}
		loadsound \{'Guitar_Select_Affirmation_1'}
		loadsound \{'EXT_MD_Crowd_Good_Loop'}
		loadsound \{'Menu_QuickPlay_SelectSong'}
		loadsound \{'Menu_QuickPlay_RemoveAllSongs'}
		loadsound \{'Song_Affirmation_01'}
		loadsound \{'Song_Affirmation_02'}
		loadsound \{'Song_Affirmation_03'}
		loadsound \{'Song_Affirmation_04'}
		loadsound \{'Song_Affirmation_05'}
		loadsound \{'Song_Affirmation_06'}
		loadsound \{'Mic_Select_Affirmation_01'}
		loadsound \{'Drum_Select_Affirmation_01'}
		loadsound \{'Bass_Select_Affirmation_02'}
		loadsound \{'Silence_Front_End_Crowd_Loop'}
		loadsound \{'Pre_Cutscence_SFX'}
		loadsound \{'Menu_EnterName_Caps'}
		loadsound \{'Fly_In_Whoosh'}
		loadsound \{'Band_leader_affirmation'}
		0xf301e1c3
		change \{0x27707361 = frontend}
		popmemprofile
		return
		case frontend
		printf \{'Reloading SFX for frontend'}
		loadsound \{'checkbox_check_sfx'}
		loadsound \{'CheckBox_Check_SFX_2'}
		loadsound \{'checkbox_sfx'}
		loadsound \{'Cash'}
		loadsound \{'Purchase_Item'}
		loadsound \{'Menu_Warning_01'}
		loadsound \{'Menu_ZoomIn_Career'}
		loadsound \{'Menu_ZoomOut_Career'}
		loadsound \{'Menu_ZoomIn_Options'}
		loadsound \{'Menu_ZoomOut_Options'}
		loadsound \{'Menu_ZoomIn_HeadToHead'}
		loadsound \{'Menu_ZoomOut_HeadToHead'}
		loadsound \{'Menu_Options_Sound_Select'}
		loadsound \{'Menu_Options_Sound_Back'}
		loadsound \{'Menu_Options_Sound_Fader_Move'}
		loadsound \{'Menu_Options_Sound_EQKnob_Move'}
		loadsound \{'Menu_Options_Sound_DolbyDigitalDisable'}
		loadsound \{'Menu_Options_Sound_DolbyDigitalEnable'}
		loadsound \{'Menu_EnterName_Select'}
		loadsound \{'Menu_EnterName_Scroll_1'}
		loadsound \{'Menu_EnterName_Scroll_3'}
		loadsound \{'Menu_EnterName_Finish'}
		loadsound \{'Menu_EnterName_Back'}
		loadsound \{'Menu_ColorWheel_GradientSelect'}
		loadsound \{'Menu_ColorWheel_Rotate'}
		loadsound \{'Menu_ColorWheel_HighLight_Up_Down_3'}
		loadsound \{'Menu_ColorWheel_Deselect_PiePiece'}
		loadsound \{'Menu_Cheat_Red'}
		loadsound \{'Menu_Cheat_Yellow'}
		loadsound \{'Menu_Cheat_Blue'}
		loadsound \{'Menu_Cheat_Green'}
		loadsound \{'Menu_Main_Intro'}
		loadsound \{'EXT_MD_Crowd_Good_Loop'}
		loadsound \{'Guitar_Select_Affirmation_1'}
		loadsound \{'Menu_QuickPlay_SelectSong'}
		loadsound \{'Menu_QuickPlay_RemoveAllSongs'}
		loadsound \{'Song_Affirmation_01'}
		loadsound \{'Song_Affirmation_02'}
		loadsound \{'Song_Affirmation_03'}
		loadsound \{'Song_Affirmation_04'}
		loadsound \{'Song_Affirmation_05'}
		loadsound \{'Song_Affirmation_06'}
		loadsound \{'Mic_Select_Affirmation_01'}
		loadsound \{'Drum_Select_Affirmation_01'}
		loadsound \{'Bass_Select_Affirmation_02'}
		loadsound \{'Pre_Cutscence_SFX'}
		loadsound \{'Menu_EnterName_Caps'}
		loadsound \{'Fly_In_Whoosh'}
		loadsound \{'Band_leader_affirmation'}
		popmemprofile
		return
		case soundboard
		printf \{'Reloading SFX for soundboard'}
		loadsound \{'SB_hello'}
		loadsound \{'SB_hey'}
		loadsound \{'SB_metallica'}
		loadsound \{'SB_question'}
		loadsound \{'SB_killemall'}
		loadsound \{'SB_feelinggood'}
		loadsound \{'SB_havingfun'}
		loadsound \{'SB_youfeelit'}
		loadsound \{'SB_more1'}
		loadsound \{'SB_more2'}
		loadsound \{'SB_more3'}
		loadsound \{'SB_outthere'}
		loadsound \{'SB_whatdyousay'}
		loadsound \{'SB_areyousure1'}
		loadsound \{'SB_areyousure2'}
		loadsound \{'SB_ohyeah1'}
		loadsound \{'SB_ohyeah2'}
		loadsound \{'SB_ohyeah3'}
		loadsound \{'SB_yeah1'}
		loadsound \{'SB_yeah2'}
		loadsound \{'SB_yeah3'}
		loadsound \{'SB_yeah4'}
		loadsound \{'SB_no1'}
		loadsound \{'SB_no2'}
		loadsound \{'SB_no3'}
		loadsound \{'SB_no4'}
		loadsound \{'SB_goodtohear'}
		loadsound \{'SB_thatsright'}
		popmemprofile
		return
		case jammode
		printf \{'Reloading SFX for Music Studio'}
		loadsound \{'Menu_EnterName_Select'}
		loadsound \{'Menu_EnterName_Scroll_1'}
		loadsound \{'Menu_EnterName_Finish'}
		loadsound \{'Menu_EnterName_Back'}
		loadsound \{'Menu_EnterName_Caps'}
		0x6057a46c 0x044dc3cd = <0x044dc3cd>
		0xf2760840
		change 0x055c17e2 = <0x044dc3cd>
		if (<0x044dc3cd> = 0)
			popmemprofile
			printf \{'Do not load crowd sounds'}
			return
		endif
		default
		printf \{'**************************************'}
		printf \{'**************************************'}
		printf \{'**************************************'}
		printf \{'*** Reloading SFX for unknown mode ***'}
		printf \{'**************************************'}
		printf \{'**************************************'}
		printf \{'**************************************'}
	endswitch
	getpakmancurrent \{map = zones}
	if (<pak> != z_studio && <pak> != z_studio2 && <pak> != z_tool && <pak> != z_credits && <pak> != z_icecave && <pak> != z_soundcheck2)
		0x8882d576
		0xa755e7bd venuesize = <venuesize>
		0x2c42c3a8 parts = [{val = 'Crowd_Clap'} , {val = <venuesize>}] 0x329413dd = 6 heap = 0xc39f2ba1
		0x2c42c3a8 parts = [{val = <0x191b609a>} , {val = 'Crowd_Whistle'}] 0x329413dd = 20 heap = 0xc39f2ba1
		0x2c42c3a8 parts = [{val = 'Crowd_Cheer'} , {val = <0x191b609a>} , {val = 'SG'}] 0x329413dd = 10 heap = 0xc39f2ba1
		0x2c42c3a8 parts = [{val = 'Crowd_Cheer'} , {val = <0x191b609a>} , {val = 'GR'}] 0x329413dd = 10 heap = 0xc39f2ba1
		switch <venuesize>
			case 'Small_INT'
			printf \{'Gathering a small group'}
			loadsound 'INT_SM_Crowd_Applause_01' heap = <0x6dbf77b0>
			loadsound 'INT_SM_Crowd_Swell_SH_03' heap = <0x6dbf77b0>
			loadsound 'INT_SM_Crowd_Swell_MD_01' heap = <0x6dbf77b0>
			loadsound 'INT_SM_Crowd_Swell_LG_02' heap = <0x6dbf77b0>
			loadsound 'SM_Crowd_Neutral_To_Good_03' heap = <0x6dbf77b0>
			loadsound 'SM_Crowd_Good_To_Neutral_03' heap = <0x6dbf77b0>
			loadsound 'SM_Crowd_Bad_To_Neutral_01' heap = <0x6dbf77b0>
			loadsound 'INT_SM_Crowd_Bad_Loop' heap = <0x6dbf77b0>
			loadsound 'INT_SM_Crowd_Good_Loop' heap = <0x6dbf77b0>
			loadsound 'INT_SM_Crowd_Neutral_Loop' heap = <0x6dbf77b0>
			loadsound \{'SM_Crowd_Neutral_To_Bad_03'
				heap = 0xc39f2ba1}
			case 'Medium_EXT'
			printf \{'Filling the area with a crowd'}
			loadsound 'EXT_MD_Crowd_Applause_02' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Swell_SH_01' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Swell_MD_02' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Swell_LG_02' heap = <0x6dbf77b0>
			loadsound 'MD_Crowd_Neutral_To_Good_01' heap = <0x6dbf77b0>
			loadsound 'MD_Crowd_Good_To_Neutral_01' heap = <0x6dbf77b0>
			loadsound 'MD_Crowd_Bad_To_Neutral_01' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Bad_Loop' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Good_Loop' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Neutral_Loop' heap = <0x6dbf77b0>
			loadsound \{'MD_Crowd_Neutral_To_Bad_02'
				heap = 0xc39f2ba1}
			case 'Large_EXT'
			printf \{'Gathering the masses'}
			loadsound 'EXT_LG_Crowd_Applause_01' heap = <0x6dbf77b0>
			loadsound 'EXT_LG_Crowd_Swell_SH_01' heap = <0x6dbf77b0>
			loadsound 'EXT_LG_Crowd_Swell_MD_01' heap = <0x6dbf77b0>
			loadsound 'EXT_LG_Crowd_Swell_LG_02' heap = <0x6dbf77b0>
			loadsound 'LG_Crowd_Neutral_To_Good_01' heap = <0x6dbf77b0>
			loadsound 'LG_Crowd_Good_To_Neutral_01' heap = <0x6dbf77b0>
			loadsound 'LG_Crowd_Bad_To_Neutral_01' heap = <0x6dbf77b0>
			loadsound 'EXT_LG_Crowd_Bad_Loop' heap = <0x6dbf77b0>
			loadsound 'EXT_LG_Crowd_Good_Loop' heap = <0x6dbf77b0>
			loadsound 'EXT_LG_Crowd_Neutral_Loop' heap = <0x6dbf77b0>
			loadsound \{'LG_Crowd_Neutral_To_Bad_01'
				heap = 0xc39f2ba1}
			default
			printf 'Waiting for anyone to gather' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Applause_02' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Swell_SH_01' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Swell_MD_02' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Swell_LG_02' heap = <0x6dbf77b0>
			loadsound 'MD_Crowd_Neutral_To_Good_01' heap = <0x6dbf77b0>
			loadsound 'MD_Crowd_Good_To_Neutral_01' heap = <0x6dbf77b0>
			loadsound 'MD_Crowd_Bad_To_Neutral_01' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Bad_Loop' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Good_Loop' heap = <0x6dbf77b0>
			loadsound 'EXT_MD_Crowd_Neutral_Loop' heap = <0x6dbf77b0>
			loadsound \{'MD_Crowd_Neutral_To_Bad_02'
				heap = 0xc39f2ba1}
		endswitch
	endif
	popmemprofile
endscript

script 0x28919004 
	loadsound \{'bad_note1'}
	loadsound \{'bad_note2'}
	loadsound \{'bad_note3'}
	loadsound \{'bad_note4'}
	loadsound \{'bad_note6'}
	loadsound \{'notes_ripple_up_01'}
	loadsound \{'Highway_Rise'}
	loadsound \{'UI_Song_Intro_Kick'}
	loadsound \{'You_Rock'}
	loadsound \{'sp_awarded1'}
	loadsound \{'sp_awarded2'}
	loadsound \{'Finish_Chord'}
endscript

script 0x04a6251d 
	loadsound \{'heavyrockcrash_lvl_10_01'}
	loadsound \{'heavyrockcrash_lvl_6_01'}
	loadsound \{'heavyrockcrash_lvl_8_01'}
	loadsound \{'heavyrockfltom_lvl_10_01'}
	loadsound \{'heavyrockfltom_lvl_4_01'}
	loadsound \{'heavyrockfltom_lvl_6_01'}
	loadsound \{'heavyrockfltom_lvl_8_01'}
	loadsound \{'heavyrockhhclosed_lvl_4_01'}
	loadsound \{'heavyrockhhclosed_lvl_6_01'}
	loadsound \{'heavyrockhhclosed_lvl_8_01'}
	loadsound \{'heavyrockhhopen_lvl_10_01'}
	loadsound \{'heavyrockhhopen_lvl_9_01'}
	loadsound \{'heavyrockhitom_lvl_10_01'}
	loadsound \{'heavyrockhitom_lvl_4_01'}
	loadsound \{'heavyrockhitom_lvl_6_01'}
	loadsound \{'heavyrockhitom_lvl_8_01'}
	loadsound \{'heavyrockkick_lvl_10_01'}
	loadsound \{'heavyrockride_lvl_10_01'}
	loadsound \{'heavyrockride_lvl_6_01'}
	loadsound \{'heavyrockride_lvl_8_01'}
	loadsound \{'heavyrocksnare_lvl_10_01'}
	loadsound \{'heavyrocksnare_lvl_12_03'}
	loadsound \{'heavyrocksnare_lvl_2_01'}
	loadsound \{'heavyrocksnare_lvl_4_01'}
	loadsound \{'heavyrocksnare_lvl_6_01'}
	loadsound \{'heavyrocksnare_lvl_8_01'}
endscript

script 0x6057a46c 
	printf \{'Loading general gameplay sfx'}
	loadsound \{'Menu_Options_Sound_Select'}
	loadsound \{'Menu_Options_Sound_Fader_Move'}
	loadsound \{'JamMode_DPad_Play'}
	loadsound \{'JamMode_DPad_RecordingStart'}
	loadsound \{'JamMode_DPad_RecordingStop'}
	loadsound \{'JamMode_DPad_Stop'}
	loadsound \{'bad_note1'}
	loadsound \{'bad_note2'}
	loadsound \{'bad_note3'}
	loadsound \{'bad_note4'}
	loadsound \{'bad_note6'}
	loadsound \{'bad_note_bass1'}
	loadsound \{'bad_note_bass2'}
	loadsound \{'bad_note_bass4'}
	loadsound \{'bad_note_bass6'}
	loadsound \{'Bad_Note_Tom1'}
	loadsound \{'Bad_Note_HiHat1'}
	loadsound \{'Bad_Note_Kick1'}
	loadsound \{'Jam_Pause_Panel_Out'}
	loadsound \{'Jam_Pause_Panel_In'}
	loadsound \{'Menu_Warning_01'}
	loadsound \{'GHTunes_Back'
		heap = 0xc39f2ba1}
	loadsound \{'GHTunes_Menu_Scroll'
		heap = 0xc39f2ba1}
	loadsound \{'GHTunes_Select'
		heap = 0xc39f2ba1}
	loadsound \{'Menu_JamMode_FXHUD_Off'
		heap = 0xc39f2ba1}
	loadsound \{'Menu_JamMode_FXHUD_On'
		heap = 0xc39f2ba1}
	loadsound \{'Menu_JamMode_SongWizard_OFF'
		heap = 0xc39f2ba1}
	loadsound \{'Menu_JamMode_SongWizard_ON'
		heap = 0xc39f2ba1}
	loadsound \{'Highway_Rise'}
	loadsound \{'UI_Song_Intro_Kick'}
	loadsound \{'notes_ripple_up_01'}
	loadsound \{'StickClickLarge'}
	loadsound \{'StickClickMed'}
	loadsound \{'StickClickSmall'}
	loadsound \{'HiHatClosed01'}
	loadsound \{'UI_SFX_50_Note_Streak'}
	loadsound \{'You_Rock'
		heap = 0xc39f2ba1}
	loadsound \{'Crowd_Fail_Song'
		heap = 0xc39f2ba1}
	loadsound \{'sp_awarded1'
		heap = 0xc39f2ba1}
	loadsound \{'sp_awarded2'
		heap = 0xc39f2ba1}
	loadsound \{'Finish_Chord'
		heap = 0xc39f2ba1}
	printf \{'Loading bass guitar sounds'}
	loadsound \{'fb_b_fingered_A1_s1_f5_01'}
	loadsound \{'fb_b_fingered_Ab2_s1_f16_01'}
	loadsound \{'fb_b_fingered_B3_s4_f16_01'}
	loadsound \{'fb_b_fingered_C3_s4_f5_01'}
	loadsound \{'fb_b_fingered_D2_s2_f5_01'}
	loadsound \{'fb_b_fingered_Db3_s2_f16_01'}
	loadsound \{'fb_b_fingered_G2_s3_f5_01'}
	loadsound \{'fb_b_fingered_Gb3_s3_f16_01'}
	loadsound \{'fj_b_slap_A1_s1_f5_01'}
	loadsound \{'fj_b_slap_Ab2_s1_f16_01'}
	loadsound \{'fj_b_slap_B3_s4_f16_01'}
	loadsound \{'fj_b_slap_C3_s4_f5_01'}
	loadsound \{'fj_b_slap_D2_s2_f5_01'}
	loadsound \{'fj_b_slap_Db3_s2_f16_01'}
	loadsound \{'fj_b_slap_G2_s3_f5_01'}
	loadsound \{'fj_b_slap_Gb3_s3_f16_01'}
	if (<0x044dc3cd> = 0)
		0x0ec8e62e
	endif
endscript

script 0xf2760840 
	printf \{'Music Studio - do selective loading'}
	pushmemprofile \{'LoadJamDynamicSounds'}
	0x4bb67432 \{heap = 0xc39f2ba1}
	0x1d252f54 \{heap = 0xc39f2ba1}
	0x388acbb7
	0x763b2917
	popmemprofile
endscript

script 0x90317422 
	printf \{'Loading remaining cheat SFX'}
	if ($0xae697c1f = 1)
		printf \{'Cheat SFX already loaded, aborting'}
		return
	endif
	change \{0xae697c1f = 1}
	loadsound \{'Cheat_Guitar_Note_01'}
	loadsound \{'Cheat_Guitar_Note_02'}
	loadsound \{'Cheat_Guitar_Note_03'}
	loadsound \{'Cheat_Guitar_Note_04'}
	loadsound \{'Cheat_Guitar_Note_05'}
	loadsound \{'Cheat_Guitar_Chord_01'}
	loadsound \{'Cheat_Guitar_Chord_02'}
	loadsound \{'Cheat_Guitar_Chord_03'}
	loadsound \{'Cheat_Guitar_Chord_04'}
	loadsound \{'Cheat_Guitar_Chord_05'}
	loadsound \{'Cheat_Guitar_Chord_06'}
	loadsound \{'Cheat_Guitar_Chord_07'}
	loadsound \{'Cheat_Guitar_Chord_08'}
	loadsound \{'Cheat_Guitar_Chord_09'}
	loadsound \{'Cheat_Guitar_Chord_10'}
	loadsound \{'Cheat_Guitar_Chord_11'}
	loadsound \{'Cheat_Guitar_Chord_12'}
endscript

script 0x2c42c3a8 \{0x329413dd = 0
		heap = 0xb5d472b2}
	pushmemprofile \{'LoadCrowdSounds'}
	<0x69153c11> = '%a0%b'
	<0x07093dc6> = '%a%b'
	getarraysize <parts>
	i = 1
	begin
	<0x3a649032> = <0x69153c11>
	if (<i> >= 10)
		<0x3a649032> = <0x07093dc6>
	endif
	formattext textname = sound_id '%a_' a = (<parts> [0].val)
	<0xe198751a> = 1
	begin
	formattext textname = sound_id '%a%b_' a = <sound_id> b = (<parts> [<0xe198751a>].val)
	<0xe198751a> = (<0xe198751a> + 1)
	repeat (<array_size> -1)
	formattext textname = sound_id <0x3a649032> a = <sound_id> b = <i>
	loadsound <sound_id> heap = <heap>
	i = (<i> + 1)
	repeat <0x329413dd>
	popmemprofile
endscript
