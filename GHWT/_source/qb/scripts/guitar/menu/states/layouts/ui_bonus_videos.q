
script ui_create_bonus_videos 
	change \{rich_presence_context = presence_videos}
	make_generic_menu \{title = qs("Bonus Videos")
		scrolling}
	add_generic_menu_text_item {
		text = ($Bonus_Videos [0].text)
		choose_state = uistate_bonus_videos_credits
	}
	GetArraySize ($Bonus_Videos)
	i = 1
	begin
	if NOT ui_bonus_videos_is_locked id = ($Bonus_Videos [<i>].id)
		if (($Bonus_Videos [<i>].id) = GHMetallica)
			movie = ($Bonus_Videos [<i>].movie)
			GetTerritory
			if GotParam \{territory}
				if NOT (<territory> = territory_us)
					movie = 'gh_metallica_noesrb'
				endif
			endif
			add_generic_menu_text_item {
				text = ($Bonus_Videos [<i>].text)
				pad_choose_script = ui_bonus_videos_play_video
				pad_choose_params = {($Bonus_Videos [<i>]) movie = <movie>}
			}
		else
			add_generic_menu_text_item {
				text = ($Bonus_Videos [<i>].text)
				pad_choose_script = ui_bonus_videos_play_video
				pad_choose_params = {($Bonus_Videos [<i>])}
			}
		endif
	else
		add_generic_menu_text_item \{text = qs("LOCKED")
			pad_choose_script = ui_bonus_videos_negative_sfx}
	endif
	<i> = (<i> + 1)
	repeat (<array_size> - 1)
	menu_finish
endscript

script ui_destroy_bonus_videos 
	destroy_generic_menu
endscript

script ui_bonus_videos_play_video \{movie = 'atvi'}
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	current_menu :SE_SetProps \{block_events}
	if ui_bonus_videos_is_locked id = <id>
	else
		Menu_Music_Off
		spawnscriptnow \{BG_Crowd_Front_End_Silence
			params = {
				immediate = 1
			}}
		fadetoblack \{on
			alpha = 1.0
			time = 0
			z_priority = 200}
		clean_up_user_control_helpers
		NetSessionFunc \{func = RemoveAllControllers}
		PlayMovieAndWait noblack movie = <movie>
		if ($invite_controller = -1)
			NetSessionFunc func = AddControllers params = {controller = ($primary_controller)}
		else
			NetSessionFunc func = AddControllers params = {controller = ($invite_controller)}
		endif
		menu_finish
		fadetoblack \{off
			time = 0}
		spawnscriptnow \{Skate8_SFX_Backgrounds_New_Area
			params = {
				BG_SFX_Area = FrontEnd_Menu_Music
			}}
		menu_music_on
	endif
	current_menu :SE_SetProps \{unblock_events}
endscript

script ui_bonus_videos_is_locked 
	GetArraySize ($Bonus_Videos)
	i = 0
	begin
	if GotParam \{id}
		if (<id> = ($Bonus_Videos [<i>].id))
			GetGlobalTags ($Bonus_Videos [<i>].id)
			if (<unlocked> = 0)
				return \{true}
			else
				return \{false}
			endif
		endif
	elseif GotParam \{movie}
		if (<movie> = ($Bonus_Videos [<i>].movie))
			GetGlobalTags ($Bonus_Videos [<i>].id)
			if (<unlocked> = 0)
				return \{true}
			else
				return \{false}
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script get_movie_id_by_name 
	GetArraySize ($Bonus_Videos)
	i = 0
	begin
	if (($Bonus_Videos [<i>].movie) = <movie>)
		return id = ($Bonus_Videos [<i>].id)
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	ScriptAssert \{qs("\LMovie not found in get_movie_id_by_name!")}
endscript

script ui_bonus_videos_negative_sfx 
	SoundEvent \{event = UI_SFX_Negative_Select}
endscript
