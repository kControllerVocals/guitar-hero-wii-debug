transition_playing = false
current_playing_transition = none
finalbandintro_transition_playing = 0
Transition_Types = {
	intro = {
		textnl = 'intro'
	}
	fastintro = {
		textnl = 'fastintro'
	}
	fastintrotutorial = {
		textnl = 'fastintrotutorial'
	}
	practice = {
		textnl = 'practice'
	}
	preencore = {
		textnl = 'preencore'
	}
	encore = {
		textnl = 'encore'
	}
	restartencore = {
		textnl = 'restartencore'
	}
	preboss = {
		textnl = 'preboss'
	}
	boss = {
		textnl = 'boss'
	}
	restartboss = {
		textnl = 'restartboss'
	}
	songwon = {
		textnl = 'songwon'
	}
	songlost = {
		textnl = 'songlost'
	}
	loading = {
		textnl = 'loading'
	}
	loadingintro = {
		textnl = 'loadingintro'
	}
	FinalBandIntro = {
		textnl = 'finalbandintro'
	}
	FinalBandOutro = {
		textnl = 'finalbandoutro'
	}
}
Celeb_Intro_Transitions = [
	{
		intro = 'intro_ozzy'
		song = mrcrowley
		venue = load_z_metalfest
		part = Vocals
	}
	{
		intro = 'intro_zakk'
		song = bosszakk
		venue = load_z_bayou
		part = guitar_vocals
		boss_song = true
		show_boss_helper_screen
	}
	{
		intro = 'intro_zakk'
		song = stillborn
		venue = load_z_bayou
		part = guitar_vocals
		boss_song = false
	}
	{
		intro = 'intro_hayley'
		song = miserybusiness
		venue = load_z_recordstore
		part = Vocals
	}
	{
		intro = 'intro_ted'
		song = bossted
		venue = load_z_fairgrounds
		part = guitar
		boss_song = true
		show_boss_helper_screen
	}
	{
		intro = 'intro_ted'
		song = stranglehold
		venue = load_z_fairgrounds
		part = guitar
		boss_song = false
	}
	{
		intro = 'intro_billy'
		song = Today
		venue = load_z_cathedral
		part = guitar_vocals
	}
	{
		intro = 'intro_travis'
		song = Dammit
		venue = load_z_military
		part = Drums
	}
	{
		intro = 'intro_jimi'
		song = windcriesmary
		venue = load_z_Ballpark
		part = no_replacements
	}
	{
		intro = 'intro_sting'
		song = DemolitionMan
		venue = load_z_castle
		part = bass_vocals
	}
]
StreamNames = {
	intro_billy = 'Other\\Intro\\intro_billy'
	Intro_FinalGig = 'Other\\Intro\\intro_finalgig'
	intro_hayley = 'Other\\Intro\\intro_hayley'
	intro_jimi = 'Other\\Intro\\intro_jimi'
	intro_ozzy = 'Other\\Intro\\intro_ozzy'
	intro_sting = 'Other\\Intro\\intro_sting'
	intro_ted = 'Other\\Intro\\intro_ted'
	intro_travis = 'Other\\Intro\\intro_travis'
	intro_zakk = 'Other\\Intro\\intro_zakk'
	Encore_FinalGig = 'Other\\Encore\\encore_finalgig'
	z_ballpark_encore = 'Other\\Encore\\z_ballpark_encore'
	z_bayou_encore = 'Other\\Encore\\z_bayou_encore'
	z_castle_encore = 'Other\\Encore\\z_castle_encore'
	z_cathedral_encore = 'Other\\Encore\\z_cathedral_encore'
	z_fairgrounds_encore = 'Other\\Encore\\z_fairgrounds_encore'
	z_frathouse_encore = 'Other\\Encore\\z_frathouse_encore'
	z_goth_encore = 'Other\\Encore\\z_goth_encore'
	z_harbor_encore = 'Other\\Encore\\z_harbor_encore'
	z_hob_encore = 'Other\\Encore\\z_hob_encore'
	z_metalfest_encore = 'Other\\Encore\\z_metalfest_encore'
	z_military_encore = 'Other\\Encore\\z_military_encore'
	z_newyork_encore = 'Other\\Encore\\z_newyork_encore'
	z_recordstore_encore = 'Other\\Encore\\z_recordstore_encore'
	outro_ted = 'other\\outro\\outro_ted'
	outro_zakk = 'other\\outro\\outro_zakk'
}
Default_Immediate_Transition = {
	time = 0
	ScriptTable = [
	]
}
Common_Immediate_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras'
				changenow
			}
		}
		{
			time = 0
			Scr = BandManager_SetPlayingIntroAnims
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
}
Default_FastIntro_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_FastIntro_Transition = {
	s
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = BandManager_SetPlayingIntroAnims
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				Fast
			}
		}
		{
			time = 0
			Scr = Band_PlayTransitionIdles
			params = {
				from_restart = true
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = enable_tutorial_pause
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_FastIntroTutorial_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_FastIntroTutorial_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = BandManager_SetPlayingIntroAnims
		}
		{
			time = 0
			Scr = training_setup_camera
			params = {
				name = CameraCutCam
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				Fast
			}
		}
		{
			time = 0
			Scr = Band_PlayTransitionIdles
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = enable_tutorial_pause
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_RestartEncore_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_RestartEncore_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = BandManager_SetPlayingIntroAnims
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				Fast
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_RestartBoss_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_RestartBoss_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = BandManager_SetPlayingIntroAnims
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				Fast
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_Practice_Transition = {
	time = 5000
	ScriptTable = [
	]
}
Common_Practice_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = BandManager_SetPlayingIntroAnims
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				practice
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_Intro_Transition = {
	time = 20000
	ScriptTable = [
	]
}
Common_Intro_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Start_Preloaded_Celeb_Intro_Stream
		}
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 1
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
		{
			time = 100
			Scr = GH_SFX_Intro_WarmUp
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_FinalBandIntro_Transition = {
	time = 20000
	ScriptTable = [
	]
}
Common_FinalBandIntro_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Start_Preloaded_Celeb_Intro_Stream
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_finalbandintro'
				changenow
			}
		}
		{
			time = 60
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreEncore_Transition = {
	time = 10000
	ScriptTable = [
		{
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = good
			}
		}
	]
}
Common_PreEncore_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				Anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_preencore'
				changenow
			}
		}
		{
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = good
			}
		}
	]
	EndWithDefaultCamera
}
Default_Encore_Transition = {
	time = 5000
	ScriptTable = [
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 0
			Scr = StopEncoreStreamSFX
			params = {
			}
		}
	]
}
Common_Encore_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				Anim = Idle
			}
		}
		{
			time = 0
			Scr = Start_Preloaded_Encore_Event_Stream
		}
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_encore'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 1
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_PreBoss_Transition = {
	time = 10000
	ScriptTable = [
	]
}
Common_PreBoss_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				Anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_preboss'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_Boss_Transition = {
	time = 8000
	ScriptTable = [
	]
}
Common_Boss_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				Anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_StopRendering
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_boss'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
			}
		}
		{
			time = 1
			Scr = play_intro_anims
			params = {
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}
Default_SongWon_Transition = {
	time = 9900
	ScriptTable = [
	]
}
Common_SongWon_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_win_anims
			params = {
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				Anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_win'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_SongLost_Transition = {
	time = 7900
	ScriptTable = [
	]
}
Common_SongLost_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = play_lose_anims
			params = {
			}
		}
		{
			time = 0
			Scr = Change_Crowd_Looping_SFX
			params = {
				crowd_looping_state = Bad
			}
		}
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
				song_failed_pitch_streams = 1
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				Anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_lose'
				changenow
			}
		}
	]
	EndWithDefaultCamera
}
Default_FinalBandOutro_Transition = {
	time = 10000
	ScriptTable = [
	]
}
Common_FinalBandOutro_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = kill_gem_scroller
			params = {
				type = outro
				kill_cameracuts_iterator
			}
		}
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				Anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_finalbandoutro'
				changenow
			}
		}
		{
			time = 0
			Scr = Start_Preloaded_FinalBandOutro_Stream
		}
	]
	EndWithDefaultCamera
}
Default_Loading_Transition = {
	time = 10000
	ScriptTable = [
	]
}
Common_Loading_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				Anim = Idle
			}
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_no_band'
				changenow
			}
		}
		{
			time = 0
			Scr = CreateInVenueLoadingScreen
			params = {
			}
		}
		{
			time = 9900
			Scr = PauseInVenueLoadingScreen
			params = {
			}
		}
	]
	EndWithDefaultCamera
}
Default_LoadingIntro_Transition = {
	time = 3000
	ScriptTable = [
	]
}
Common_LoadingIntro_Transition = {
	ScriptTable = [
		{
			time = 0
			Scr = Crowd_AllPlayAnim
			params = {
				Anim = Idle
			}
		}
		{
			time = 0
			Scr = BandManager_SetPlayingIntroAnims
		}
		{
			time = 0
			Scr = Transition_CameraCut
			params = {
				prefix = 'cameras_fastintro'
				changenow
			}
		}
		{
			time = 0
			Scr = play_intro
			params = {
				Fast
			}
		}
		{
			time = 100
			Scr = Transition_StartRendering
		}
	]
	EndWithDefaultCamera
	SyncWithNoteCameras
}

script CreateInVenueLoadingScreen 
	printf \{qs(0xf9229695)}
	GameMode_GetType
	if (($is_network_game = 1 && <type> = career) || $is_network_game = 0)
		ui_event \{event = menu_change
			data = {
				state = uistate_song_breakdown
			}}
	endif
endscript

script PauseInVenueLoadingScreen 
	if ($is_network_game = 1)
		GameMode_GetType
		if (<type> = career)
			change \{songtime_paused = 1}
			ClearGameOver
			SyncAndLaunchNetGame
			BroadcastEvent \{type = done_loading}
			begin
			if ($net_ready_to_start)
				printf \{qs("\LReady to start let's fire")}
				break
			endif
			Wait \{1
				gameframe}
			repeat
			change \{songtime_paused = 0}
		endif
		return
	endif
	change \{songtime_paused = 1}
	ui_song_breakdown_show_continue_button
endscript

script Common_Loading_TransitionEnd 
	GameMode_GetType
	if (($is_network_game = 1 && <type> = career) || $is_network_game = 0)
		ui_event \{event = menu_back
			data = {
				state = uistate_gameplay
			}}
		if CompositeObjectExists \{name = vocalist}
			vocalist :unhide
		endif
	endif
endscript

script Transition_SelectTransition \{practice_intro = 0
		force_encore = 0}
	change \{finalbandintro_transition_playing = 0}
	if ($encoreforce_enabled = 1)
		change \{current_transition = encore}
		return
	endif
	if ($celebforce_enabled = 1)
		Transition_SelectCelebTransition
		return
	endif
	if (<practice_intro> = 1)
		return
	endif
	if ($current_transition = debugintro)
		change \{current_transition = intro}
		return
	endif
	if ($coop_dlc_active = 1)
		change \{current_transition = intro}
		return
	endif
	if ($game_mode = p1_career ||
			$game_mode = p2_career ||
			$game_mode = p3_career ||
			$game_mode = p4_career)
		get_progression_globals ($current_progression_flag) use_current_tab = 1
		Career_Songs = <tier_global>
		tier = ($current_gig_number)
		FormatText checksumname = tier_checksum 'tier%s' s = <tier>
		if NOT StructureContains Structure = ($<Career_Songs>) <tier_checksum>
			change \{current_transition = intro}
			return
		endif
		if ($is_network_game = 0)
			if StructureContains Structure = ($<Career_Songs>.<tier_checksum>) play_finalbandintro_transition_type
				if ($current_level = load_z_newyork)
					FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
					type = ($<Career_Songs>.<tier_checksum>.play_finalbandintro_transition_type)
					GetGlobalTags <bandname_id> param = <type>
					if (<...>.<type> = 0)
						AddParam structure_name = new_params name = <type> value = 1
						SetGlobalTags <bandname_id> params = <new_params>
						change \{current_transition = intro}
						change \{finalbandintro_transition_playing = 1}
						return
					endif
				endif
			endif
		endif
		if Progression_IsEncoreSong tier_global = <tier_global> tier = <tier> song = ($current_song)
			change \{current_transition = encore}
			mark_encore_started
			return
		endif
		if (<force_encore> = 1)
			change \{current_transition = encore}
			return
		endif
		if Transition_SelectCelebTransition
			return
		endif
	endif
	if ($game_mode = p1_quickplay || $game_mode = p2_quickplay)
		get_progression_globals game_mode = ($game_mode) use_current_tab = 1
		SetList_Songs = <tier_global>
		tier = ($setlist_selection_tier)
		FormatText checksumname = tier_checksum 'tier%s' s = <tier>
		if NOT StructureContains Structure = ($<SetList_Songs>) <tier_checksum>
			change \{current_transition = intro}
			return
		endif
	endif
	change \{current_transition = intro}
endscript

script Transition_SelectCelebTransition 
	GetArraySize ($Celeb_Intro_Transitions)
	if ($celebforce_enabled = 1)
		celebindex = 0
		begin
		celebvalid = 1
		if StructureContains Structure = ($Celeb_Intro_Transitions [<celebindex>]) venue
			if NOT ($current_level = $Celeb_Intro_Transitions [<celebindex>].venue)
				celebvalid = 0
			endif
		else
			celebvalid = 0
		endif
		if (<celebvalid> = 1)
			FormatText checksumname = transition '%s' s = ($Celeb_Intro_Transitions [<celebindex>].intro) AddToStringLookup = true
			change current_transition = <transition>
			printf qs(0xe4e33a9a) a = <transition>
			return \{true}
		endif
		celebindex = (<celebindex> + 1)
		repeat <array_size>
	endif
	index = 0
	begin
	valid = 1
	if StructureContains Structure = ($Celeb_Intro_Transitions [<index>]) song
		if NOT ($current_song = $Celeb_Intro_Transitions [<index>].song)
			valid = 0
		endif
	else
		valid = 0
	endif
	if StructureContains Structure = ($Celeb_Intro_Transitions [<index>]) venue
		if NOT ($current_level = $Celeb_Intro_Transitions [<index>].venue)
			valid = 0
		endif
	else
		valid = 0
	endif
	GameMode_GetNumPlayersShown
	if (<num_players_shown> > 1)
		part = ($Celeb_Intro_Transitions [<index>].part)
		switch <part>
			case guitar
			if is_any_player_on_part \{part = guitar}
				valid = 0
			endif
			case guitar_vocals
			if is_any_player_on_part \{part = guitar}
				if is_any_player_on_part \{part = Vocals}
					valid = 0
				endif
			endif
			case bass_vocals
			if is_any_player_on_part \{part = Bass}
				if is_any_player_on_part \{part = Vocals}
					valid = 0
				endif
			endif
			case Vocals
			if is_any_player_on_part \{part = Vocals}
				valid = 0
			endif
			case Drums
			if is_any_player_on_part \{part = drum}
				valid = 0
			endif
			case no_replacements
			valid = <valid>
			default
			valid = 0
		endswitch
	endif
	if StructureContains Structure = ($Celeb_Intro_Transitions [<index>]) boss_song
		boss_song = ($Celeb_Intro_Transitions [<index>].intro)
		GameMode_GetNumPlayersShown
		if ((<num_players_shown> = 1) && ($player1_status.part = guitar))
			if (<boss_song> = false)
				valid = 0
			endif
		else
			if (<boss_song> = true)
				valid = 0
			endif
		endif
	endif
	if (<valid> = 1)
		FormatText checksumname = transition '%s' s = ($Celeb_Intro_Transitions [<index>].intro) AddToStringLookup = true
		change current_transition = <transition>
		if StructureContains Structure = ($Celeb_Intro_Transitions [<index>]) show_boss_helper_screen
			change \{show_boss_helper_screen = 1}
		endif
		return \{true}
	endif
	index = (<index> + 1)
	repeat <array_size>
	return \{false}
endscript

script Transition_KillAll 
	KillSpawnedScript \{id = Transitions}
	change \{transition_playing = false}
	change \{current_playing_transition = none}
endscript

script Transition_GetPrefix \{type = intro}
	celeb_intro = 0
	if (<type> = forceintro)
		type = fastintro
	endif
	if StructureContains Structure = $Transition_Types <type>
		printstruct <...>
		type_textnl = ($Transition_Types.<type>.textnl)
	else
		GetArraySize ($Celeb_Intro_Transitions)
		index = 0
		begin
		FormatText checksumname = transition '%s' s = ($Celeb_Intro_Transitions [<index>].intro)
		if (<type> = <transition>)
			type_textnl = ($Celeb_Intro_Transitions [<index>].intro)
			celeb_intro = 1
			break
		endif
		index = (<index> + 1)
		repeat <array_size>
	endif
	if NOT GotParam \{type_textnl}
		printstruct <...>
		ScriptAssert \{qs("\LUnknown transition type")}
	endif
	printf \{qs(0x66f60383)}
	return type_textnl = <type_textnl> celeb_intro = <celeb_intro>
endscript

script Transition_GetProps 
	Transition_GetPrefix <...>
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = Transition_Props '%s_%p_Transition' p = <type_textnl> s = <pakname>
	if NOT GlobalExists name = <Transition_Props>
		FormatText checksumname = Transition_Props 'default_%p_Transition' p = <type_textnl> s = <pakname>
	endif
	if (<celeb_intro> = 1)
		if NOT GlobalExists name = <Transition_Props>
			Transition_Props = Default_Intro_Transition
		endif
	endif
	FormatText checksumname = Common_Transition_Props 'Common_%p_Transition' p = <type_textnl>
	common_type_textnl = <type_textnl>
	if (<celeb_intro> = 1)
		common_type_textnl = 'intro'
		if NOT GlobalExists name = <Common_Transition_Props>
			Common_Transition_Props = Common_Intro_Transition
		endif
	endif
	return type_textnl = <type_textnl> common_type_textnl = <common_type_textnl> Transition_Props = <Transition_Props> Common_Transition_Props = <Common_Transition_Props>
endscript

script Transition_GetTime \{type = intro}
	Transition_GetProps type = <type>
	return transition_time = ($<Transition_Props>.time)
endscript

script Transition_Play \{type = intro}
	printf 'Transition_Play type=%t' t = <type>
	Transition_KillAll
	change current_playing_transition = <type>
	Transition_GetProps type = <type>
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = event 'Common_%p_TransitionSetup' p = <common_type_textnl> s = <pakname>
	if ScriptExists <event>
		<event>
	endif
	FormatText checksumname = event '%s_%p_TransitionSetup' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		spawnscriptnow <event>
	endif
	spawnscriptnow Transition_Play_Spawned id = Transitions params = {<...>}
	FormatText checksumname = event 'GuitarEvent_Transition%s' s = <type_textnl>
	if ScriptExists <event>
		spawnscriptnow <event>
	endif
endscript

script Transition_Play_Spawned 
	change \{transition_playing = true}
	GetPakManCurrentName \{map = zones}
	transition_time = ($<Transition_Props>.time)
	spawnscriptnow Transition_Play_Iterator id = Transitions params = {<...>}
	spawnscriptnow Transition_Play_Iterator id = Transitions params = {<...> Transition_Props = <Common_Transition_Props>}
	GetSongTimeMs
	time_offset = (0 - <time>)
	begin
	GetSongTimeMs time_offset = <time_offset>
	if (<transition_time> <= <time>)
		change \{transition_playing = false}
		break
	endif
	WaitOneGameFrame
	repeat
	if StructureContains Structure = ($<Common_Transition_Props>) EndWithDefaultCamera
		if ($finalbandintro_transition_playing = 1)
			if ($current_playing_transition = FinalBandIntro)
				change \{finalbandintro_transition_playing = 0}
			else
				stoprendering
			endif
		elseif ($game_mode = p2_faceoff || $game_mode = p2_pro_faceoff || $game_mode = p2_battle || $boss_battle = 1)
			CameraCuts_SetArrayPrefix \{prefix = 'cameras_headtohead'
				changenow}
		elseif ($current_song = jamsession)
			CameraCuts_SetArrayPrefix \{prefix = 'cameras_jam_mode'
				changenow}
		else
			if StructureContains Structure = ($<Common_Transition_Props>) SyncWithNoteCameras
				CameraCuts_GetNextNoteCameraTime
				GetSongTimeMs
				if (<camera_time> >= 0 &&
						<camera_time> - <time> < 2000)
					CameraCuts_EnableChangeCam \{enable = false}
				else
					if NOT ($game_mode = training)
						CameraCuts_SetArrayPrefix \{prefix = 'cameras'
							changenow}
					else
						CameraCuts_EnableChangeCam \{enable = false}
					endif
				endif
			else
				if NOT ($game_mode = training)
					CameraCuts_SetArrayPrefix \{prefix = 'cameras'
						changenow}
				else
					CameraCuts_EnableChangeCam \{enable = false}
				endif
			endif
		endif
	endif
	FormatText checksumname = event 'Common_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		spawnscriptnow <event>
	endif
	FormatText checksumname = event '%s_%p_TransitionEnd' p = <type_textnl> s = <pakname>
	if ScriptExists <event>
		spawnscriptnow <event>
	endif
	change \{current_playing_transition = none}
endscript

script IsTransitionPlaying 
	if GotParam \{type}
		if (<type> = $current_playing_transition)
			return \{true}
		endif
	else
		if NOT (<type> = none)
			return \{true}
		endif
	endif
	return \{false}
endscript

script Transition_Play_Iterator 
	GetSongTimeMs
	time_offset = (0 - <time>)
	GetArraySize ($<Transition_Props>.ScriptTable)
	if (<array_size> = 0)
		return
	endif
	GetSongTimeMs time_offset = <time_offset>
	array_count = 0
	begin
	begin
	GetSongTimeMs time_offset = <time_offset>
	if ($<Transition_Props>.ScriptTable [<array_count>].time <= <time>)
		break
	endif
	WaitOneGameFrame
	repeat
	if ScriptExists ($<Transition_Props>.ScriptTable [<array_count>].Scr)
		spawnscriptnow ($<Transition_Props>.ScriptTable [<array_count>].Scr) id = Transitions params = {transition_time = <transition_time> ($<Transition_Props>.ScriptTable [<array_count>].params)}
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script Transition_Wait 
	begin
	if ($transition_playing = false)
		return
	endif
	WaitOneGameFrame
	repeat
endscript
debug_y_line = 0

script MomentCamera_PlayAnim \{Cycle = 0
		start = 0.0
		BlendDuration = 0.0}
	if NOT CompositeObjectExists name = <lock_target>
		return
	endif
	SetSearchAllAssetContexts
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	if GotParam \{start_node}
		ExtendCRC <pak> <start_node> out = start_node_id
		GetWaypointPos name = <start_node_id>
		GetWaypointDir name = <start_node_id>
		<lock_target> :Obj_SetPosition position = <pos>
		<lock_target> :Obj_SetOrientation dir = <dir>
	else
		suffix = ('_' + <node>)
		AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
		if CompositeObjectExists name = <appended_id>
			<appended_id> :Obj_GetPosition
			<lock_target> :Obj_SetPosition position = <pos>
			<appended_id> :Obj_GetOrientation
			dir = ((1.0, 0.0, 0.0) * <x> + (0.0, 1.0, 0.0) * <y> + (0.0, 0.0, 1.0) * <z>)
			<lock_target> :Obj_SetOrientation dir = <dir>
		else
			printf channel = anim_info qs("\Lunable to move camera to node %a") a = <appended_id>
		endif
	endif
	if NOT GotParam \{tempo_anim}
		tempo_anim = <Anim>
	endif
	printf channel = moment qs(0xf56f6cf9) a = <Anim> b = <tempo_anim>
	<lock_target> :Obj_SwitchScript SpecialCamera_PlayAnim_Spawned params = {Anim = <Anim> TempoAnim = <tempo_anim> Cycle = <Cycle> start = <start> BlendDuration = <BlendDuration>}
	if (($debug_camanimdebug) = 1)
		switch <lock_target>
			case moment_cam_lock_target_01
			change \{debug_y_line = 1}
			case moment_cam_lock_target_02
			change \{debug_y_line = 2}
			case moment_cam_lock_target_03
			change \{debug_y_line = 3}
			case moment_cam_lock_target_04
			change \{debug_y_line = 4}
			case guitarist_mocap_lock_target_01
			change \{debug_y_line = 5}
			case guitarist_mocap_lock_target_02
			change \{debug_y_line = 6}
			case bassist_mocap_lock_target_01
			change \{debug_y_line = 7}
			case bassist_mocap_lock_target_02
			change \{debug_y_line = 8}
			case drummer_mocap_lock_target_01
			change \{debug_y_line = 9}
			case drummer_mocap_lock_target_02
			change \{debug_y_line = 10}
			case drummer2_mocap_lock_target_01
			change \{debug_y_line = 11}
			case drummer2_mocap_lock_target_02
			change \{debug_y_line = 12}
			case vocalist_mocap_lock_target_01
			change \{debug_y_line = 13}
			case vocalist_mocap_lock_target_02
			change \{debug_y_line = 14}
			case vocalist2_mocap_lock_target_01
			change \{debug_y_line = 15}
			case vocalist2_mocap_lock_target_02
			change \{debug_y_line = 16}
		endswitch
		FormatText TextName = debug_line_text '%t:' t = <lock_target> DoNotResolve DontAssertForChecksums
		PrintDebugText x = 3 y = ($debug_y_line) str = <debug_line_text>
		FormatText TextName = debug_line_text '%a.ska' a = <Anim> DontAssertForChecksums
		PrintDebugText x = 40 y = ($debug_y_line) str = <debug_line_text>
	endif
	SetSearchAllAssetContexts \{off}
endscript

script SpecialCamera_PlayAnim \{Cycle = 0
		start = 0.0}
	SetSearchAllAssetContexts
	GetPakManCurrent \{map = zones}
	GetPakManCurrentName \{map = zones}
	FormatText TextName = suffix '_%s' s = <obj>
	AppendSuffixToChecksum Base = <pak> SuffixString = <suffix>
	cameraname = (<pakname> + <suffix>)
	if CompositeObjectExists name = <appended_id>
		<appended_id> :Obj_SwitchScript SpecialCamera_PlayAnim_Spawned params = {Anim = <Anim> Cycle = <Cycle> start = <start> BlendDuration = <BlendDuration>}
	else
		printf qs("\LUnable to find SpecialCamera %s....") s = <cameraname>
	endif
	SetSearchAllAssetContexts \{off}
endscript

script SpecialCamera_PlayAnim_Spawned \{start = 0.0
		Speed = 1.0
		BlendDuration = -1.0}
	begin
	SetSearchAllAssetContexts
	if NOT GotParam \{Anim}
		Anim_GetDefaultAnimName
		Anim = <DefaultAnimName>
	endif
	if NOT GotParam \{TempoAnim}
		TempoAnim = Anim
	endif
	printf qs("\Lfiring specialcamera command... anim %a tempo %b") a = <Anim> b = <TempoAnim>
	RemoveTags \{[
			AnimRequestedFOVRadians
		]}
	Anim_Enable
	Anim_Command target = Body command = DegenerateBlend_AddBranch params = {
		Tree = $SpecialCamera_StandardAnimBranch
		BlendDuration = <BlendDuration>
		params = {
			Anim = <Anim>
			Speed = <Speed>
			TimerType = Play
			start = <start>
			AnimEvents = on
			TempoAnim = <TempoAnim>
			AllowBeatSkipping = true
		}
	}
	SetSearchAllAssetContexts \{off}
	SpecialCamera_WaitAnimFinished
	if (<Cycle> = 0)
		break
	endif
	repeat
endscript

script SpecialCamera_WaitAnimFinished \{Timer = BodyTimer}
	Anim_Command target = <Timer> command = Timer_WaitAnimComplete
endscript
SpecialCamera_StandardAnimBranch = {
	type = TimerType
	id = BodyTimer
	Anim = Anim
	tempo_anim = TempoAnim
	anim_events = AnimEvents
	allow_beat_skipping = AllowBeatSkipping
	Speed = Speed
	start = start
	[
		{
			type = Source
			Anim = Anim
		}
	]
}

script Transition_PlayAnim \{Cycle = 0}
	<obj> :Obj_SwitchScript Transition_PlayAnim_Spawned params = {Anim = <Anim> Cycle = <Cycle> BlendDuration = <BlendDuration>}
endscript

script Transition_PlayAnim_Spawned \{Cycle = 0}
	begin
	GameObj_PlayAnim Anim = <Anim> BlendDuration = <BlendDuration>
	GameObj_WaitAnimFinished
	if (<Cycle> = 0)
		break
	endif
	repeat
endscript

script Transition_CameraCut 
	printf \{qs(0xa2dc4a86)}
	if GotParam \{prefix}
		CameraCuts_SetArrayPrefix <...> length = <transition_time>
	else
		printf \{qs(0x89f11945)}
		if NOT ($current_playing_transition = none)
			Transition_GetPrefix type = ($current_playing_transition)
		else
			Transition_GetPrefix \{type = intro}
		endif
		GetPakManCurrentName \{map = zones}
		printf \{qs(0x90ea2804)}
		FormatText checksumname = Cameras_Array 'default_cameras_%t' t = <type_textnl>
		FormatText TextName = prefix 'cameras_%t' t = <type_textnl>
		if NOT GlobalExists name = <Cameras_Array>
			printf \{qs(0xdfabbec3)}
			FormatText checksumname = Cameras_Array '%s_cameras_%t' s = <pakname> t = <type_textnl>
			if NOT GlobalExists name = <Cameras_Array>
				printf \{qs(0xc6b08f82)}
				prefix = 'cameras_intro'
			endif
		endif
		printf \{qs(0xed9ddc41)}
		CameraCuts_SetArrayPrefix <...> length = <transition_time>
	endif
endscript

script Transition_StopRendering 
	printf \{qs("\LTransition_StopRendering")}
	stoprendering
endscript

script Transition_StartRendering 
	printf \{qs("\LTransition_StartRendering")}
	startrendering
	change \{is_changing_levels = 0}
	if ($blade_active = 1)
		change \{blade_active = 0}
		gh3_start_pressed
	endif
endscript

script Transition_Printf 
	printf <...>
endscript

script Transitions_ResetZone 
	printf \{qs("\LTransitions_ResetZone")}
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = reset_func '%s_ResetTransition' s = <pakname>
	if ScriptExists <reset_func>
		<reset_func>
	endif
	FormatText checksumname = nodearray_checksum '%s_NodeArray' s = <pakname>
	if NOT GlobalExists name = <nodearray_checksum> type = array
		return
	endif
	GetArraySize $<nodearray_checksum>
	array_count = 0
	begin
	resetvalid = true
	if GotParam \{profile}
		resetvalid = false
		if StructureContains Structure = ($<nodearray_checksum> [<array_count>]) profile
			if CompareStructs struct1 = ($<nodearray_checksum> [<array_count>].profile) struct2 = (<profile>)
				resetvalid = true
			endif
		endif
	endif
	if StructureContains Structure = ($<nodearray_checksum> [<array_count>]) CreatedFromVariable
		resetvalid = false
	endif
	if StructureContains Structure = ($<nodearray_checksum> [<array_count>]) CreatedOnProgress
		resetvalid = false
	endif
	if StructureContains Structure = ($<nodearray_checksum> [<array_count>]) Class
		if NOT ($<nodearray_checksum> [<array_count>].Class = GameObject ||
				$<nodearray_checksum> [<array_count>].Class = levelgeometry)
			resetvalid = false
		endif
	else
		resetvalid = false
	endif
	if (<resetvalid> = true)
		printf qs("\LResetting %s") s = ($<nodearray_checksum> [<array_count>].name)
		kill name = ($<nodearray_checksum> [<array_count>].name)
		if StructureContains Structure = ($<nodearray_checksum> [<array_count>]) CreatedAtStart
			create name = ($<nodearray_checksum> [<array_count>].name)
		endif
	endif
	array_count = (<array_count> + 1)
	repeat <array_size>
endscript

script Common_Intro_TransitionSetup 
	printf \{channel = sfx
		qs("\L##############################  Common_Intro_TransitionSetup")}
	Preload_Celeb_Intro_Stream
endscript

script Common_PreEncore_TransitionSetup 
	Change_Crowd_Looping_SFX \{crowd_looping_state = good}
endscript

script Common_PreEncore_TransitionEnd 
endscript

script FinalBandIntro_TransitionSetup 
	printf \{channel = sfx
		qs("\L##############################  Common_FinalBandIntro_TransitionSetup")}
	Transition_GetPrefix type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = none)
		StopSound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	PreloadSoundStream filename = ($StreamNames.Intro_FinalGig)
	change celeb_intro_stream_id = <unique_id>
endscript

script Common_FinalBandOutro_TransitionSetup 
	printf \{channel = sfx
		qs("\L##############################  Common_FinalBandOutro_TransitionSetup")}
	if NOT ($celeb_intro_stream_id = none)
		StopSound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	PreloadSoundStream filename = ($StreamNames.Encore_FinalGig)
	change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs("\LWaiting for final band outro stream")}
	if PreLoadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script Common_Encore_TransitionSetup 
	printf \{channel = sfx
		qs("\L##############################  Common_Encore_TransitionSetup")}
	Preload_Encore_Event_Stream
endscript

script Common_Boss_TransitionSetup 
endscript

script Common_Encore_TransitionEnd 
endscript

script Preload_Encore_Bink_Audio \{movie_name = 'z_artdeco_encore_audio'}
	return
endscript

script Common_Loading_TransitionSetup 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_metalfest
		SoundEvent \{event = Large_EXT_Crowd_Song_Transition}
		case z_newyork
		SoundEvent \{event = Large_EXT_Crowd_Song_Transition}
		case z_goth
		SoundEvent \{event = Medium_INT_Crowd_Song_Transition}
		case z_cathedral
		SoundEvent \{event = Medium_INT_Crowd_Song_Transition}
		case z_fairgrounds
		SoundEvent \{event = Medium_INT_Crowd_Song_Transition}
		case z_ballpark
		SoundEvent \{event = Medium_INT_Crowd_Song_Transition}
		case z_castle
		SoundEvent \{event = Medium_INT_Crowd_Song_Transition}
		case z_military
		SoundEvent \{event = Medium_INT_Crowd_Song_Transition}
		case z_harbor
		SoundEvent \{event = Medium_INT_Crowd_Song_Transition}
		case z_scifi
		SoundEvent \{event = Medium_INT_Crowd_Song_Transition}
		case z_submarine
		SoundEvent \{event = Medium_INT_Crowd_Song_Transition}
		default
		printf \{channel = sfx
			qs("\LNo Surge, Small Crowd")}
	endswitch
	SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent_L}
	SoundEvent \{event = $Current_Crowd_Swell_Short_SoundEvent_R}
	SoundEvent \{event = $Current_Crowd_Swell_Med_SoundEvent_L}
	SoundEvent \{event = $Current_Crowd_Swell_Med_SoundEvent_R}
	SoundEvent \{event = $Current_Crowd_Swell_Long_SoundEvent_L}
	SoundEvent \{event = $Current_Crowd_Swell_Long_SoundEvent_R}
	SoundEvent \{event = OneShotsBetweenSongs}
	SoundEvent \{event = SurgeBetweenSongs}
endscript
celeb_intro_stream_id = none

script Preload_Celeb_Intro_Stream 
	printf \{channel = sfx
		qs("\L################################ Preload_Celeb_Intro_Stream")}
	Transition_GetPrefix type = ($current_playing_transition)
	if NOT ($celeb_intro_stream_id = none)
		StopSound unique_id = ($celeb_intro_stream_id)
		change \{celeb_intro_stream_id = none}
	endif
	if (<celeb_intro> = 0)
		Preload_Zone_Intro_Stream
		return
	endif
	celeb_intro_checksum = ($current_playing_transition)
	PreloadSoundStream filename = ($StreamNames.<celeb_intro_checksum>)
	change celeb_intro_stream_id = <unique_id>
	begin
	printf \{qs("\LWaiting for celeb intro stream")}
	if PreLoadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script Start_Preloaded_Celeb_Intro_Stream 
	printf \{channel = sfx
		qs("\L################################ Start_Preloaded_Celeb_Intro_Stream")}
	if NOT ($celeb_intro_stream_id = none)
		StartPreloadedStream \{$celeb_intro_stream_id
			buss = Encore_Events
			forcesafepreload = 1
			pitch = 100}
		change \{celeb_intro_stream_id = none}
	endif
endscript
encore_event_stream_id = none

script Preload_Encore_Event_Stream 
	printf \{channel = sfx
		qs("\L################################ Preload_Encore_Event_Stream")}
	if NOT ($encore_event_stream_id = none)
		StopSound unique_id = ($encore_event_stream_id)
		change \{encore_event_stream_id = none}
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = encore_stream_name '%s_encore' s = <pakname> AddToStringLookup = true
	PreloadSoundStream filename = ($StreamNames.<encore_stream_name>)
	change encore_event_stream_id = <unique_id>
	begin
	printf \{qs("\LWaiting for encore stream")}
	if PreLoadStreamDone <unique_id>
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script Start_Preloaded_Encore_Event_Stream 
	printf \{channel = sfx
		qs("\L################################ Start_Preloaded_Encore_Event_Stream")}
	if NOT ($encore_event_stream_id = none)
		StopSoundEvent \{$Current_Crowd_Encore
			fade_time = 2.5
			fade_type = log_slow}
		printf \{channel = sfx
			qs("\L$$$$$$$$$$$$$$$$$  PLAYING!!!!")}
		StartPreloadedStream \{$encore_event_stream_id
			buss = Encore_Events
			forcesafepreload = 1
			pitch = 100}
		change \{encore_event_stream_id = none}
	endif
endscript

script Start_Preloaded_FinalBandOutro_Stream 
	printf \{channel = sfx
		qs("\L################################ Start_Preloaded_FinalBandOutro_Event_Stream")}
	if NOT ($celeb_intro_stream_id = none)
		StopSoundEvent \{$Current_Crowd_Encore
			fade_time = 2.5
			fade_type = log_slow}
		StartPreloadedStream \{$celeb_intro_stream_id
			buss = Encore_Events
			forcesafepreload = 1
			pitch = 100}
		change \{celeb_intro_stream_id = none}
	endif
endscript

script Kill_Transition_Preload_Streams 
	KillSpawnedScript \{name = Preload_Encore_Event_Stream}
	KillSpawnedScript \{name = Preload_Celeb_Intro_Stream}
	change \{encore_event_stream_id = none}
	change \{celeb_intro_stream_id = none}
endscript
