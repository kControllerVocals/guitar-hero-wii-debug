
script ui_create_tutorial_prompt 
	if GotParam \{continue_to_gigs}
		choose_skip_tutorials
	else
		GetGlobalTags \{training}
		player_status = player1_status
		switch ($<player_status>.part)
			case guitar
			if (<has_prompt_guitar_tutorial> = complete)
				choose_skip_tutorials
				return
			else
				SetGlobalTags \{training
					params = {
						has_prompt_guitar_tutorial = complete
					}}
			endif
			text = qs("You are starting a new Guitar Career. You'll encounter new stuff such as Extended Sustains and Tapping Solo Sections. Would you like to check out the Guitar Tutorials?")
			case Bass
			if (<has_prompt_bass_tutorial> = complete)
				choose_skip_tutorials
				return
			else
				SetGlobalTags \{training
					params = {
						has_prompt_bass_tutorial = complete
					}}
			endif
			text = qs("You are starting a new Bass Career. You'll encounter new stuff such as Extended Sustains and Open Notes. Would you like to check out the Bass Tutorials?")
			case drum
			if (<has_prompt_drum_tutorial> = complete)
				choose_skip_tutorials
				return
			else
				SetGlobalTags \{training
					params = {
						has_prompt_drum_tutorial = complete
					}}
			endif
			text = qs("You are starting a new Drum Career. To play drums you'll need to know how to use the drums and kick pedal, and trigger star power.  Would you like to check out the Drum Tutorials?")
			case Vocals
			if (<has_prompt_vocal_tutorial> = complete)
				choose_skip_tutorials
				return
			else
				SetGlobalTags \{training
					params = {
						has_prompt_vocal_tutorial = complete
					}}
			endif
			text = qs("You are starting a new Vocal Career. You'll need to know how to match the pitch, sing freeform sections, and trigger Star Power. Would you like to check out the Vocals Tutorials?")
			default
			choose_skip_tutorials
			return
		endswitch
		create_popup_warning_menu {
			title = qs("NEW CAREER")
			textblock = {
				text = <text>
			}
			options = [
				{
					func = choose_skip_tutorials
					text = qs("CONTINUE")
				}
				{
					func = choose_view_tutorials
					text = qs("VIEW TUTORIAL")
				}
			]
			no_background
			popup_event_handlers = [
				{pad_up generic_menu_up_or_down_sound params = {up}}
				{pad_down generic_menu_up_or_down_sound params = {down}}
			]
		}
		clean_up_user_control_helpers
		add_user_control_helper \{text = qs("SELECT")
			button = green
			z = 100000}
	endif
endscript

script ui_destroy_tutorial_prompt 
	destroy_popup_warning_menu
endscript

script ui_deinit_tutorial_prompt 
	destroy_popup_warning_menu
endscript

script choose_view_tutorials 
	spawnscriptnow \{choose_view_tutorials_worker}
endscript

script choose_view_tutorials_worker 
	destroy_popup_warning_menu
	Menu_Music_Off
	BG_Crowd_Front_End_Silence
	do_training_loading
	destroy_loading_screen
	startrendering
	ui_event_wait \{event = menu_replace
		data = {
			state = uistate_select_tutorial
			from_career = 1
		}}
endscript

script choose_skip_tutorials 
	if (($player1_status.difficulty) = easy_rhythm)
		GetGlobalTags \{training}
		if GotParam \{has_prompt_easy_tutorial}
			ui_event_wait \{event = menu_replace
				data = {
					state = UIstate_tutorial_prompt_easy
					is_popup
				}}
		else
			create_loading_screen \{spawn
				force_predisplay = 1}
			ui_event_wait \{event = menu_replace
				data = {
					state = uistate_gig_posters
				}}
		endif
	else
		create_loading_screen \{spawn
			force_predisplay = 1}
		ui_event_wait \{event = menu_replace
			data = {
				state = uistate_gig_posters
			}}
	endif
endscript
