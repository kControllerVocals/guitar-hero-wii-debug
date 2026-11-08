
script ui_create_leaderboard_me 
	current_menu :GetSingleTag \{my_data}
	if GotParam \{my_data}
		CreateScreenElement {
			parent = root_window
			id = leaderboard_popup
			type = DescInterface
			desc = 'leaderboard_info_desc'
			exclusive_device = ($lb_controller)
			z_priority = 10000
			event_handlers = [
				{pad_back generic_event_back}
			]
			alpha = 0.0
		}
		current_menu :GetSingleTag \{my_cash}
		if GotParam \{my_cash}
			FormatText TextName = earnings '%e' e = <my_cash>
			StringToInteger \{earnings}
			cash_get_info_from_earnings earnings = <earnings>
			FormatText TextName = rank qs("\L%r") r = <rank>
		endif
		GetArraySize <my_data>
		data_index = (<array_size> - 1)
		if (($current_leaderboard_instrument) = Band)
			data_index = 2
		endif
		leaderboard_popup :SE_SetProps {
			rank_text = (<my_data> [0])
			nametag_text = (<my_data> [1])
			score_text = (<my_data> [<data_index>])
			cash_icon_texture = <cash_icon_id>
			cash_rank_text = <rank>
		}
		if ($current_leaderboard_group = song)
			if NOT (($current_leaderboard_instrument) = Band)
				ui_leaderboard_get_difficulty_icon num = (<my_data> [2])
				leaderboard_popup :SE_SetProps {
					icon_texture = <difficulty_icon>
					icon_alpha = <difficulty_alpha>
				}
			else
			endif
		elseif ($current_leaderboard_group = Cash)
			leaderboard_popup :SE_SetProps \{score_desc_text = qs("Cash:")}
		endif
	else
		ui_event_wait \{event = menu_back}
		return
	endif
	clean_up_user_control_helpers
	if should_use_all_buttons
		all_button_params = {all_buttons}
	endif
	add_user_control_helper text = qs("BACK") button = red <all_button_params> z = 100000
endscript

script ui_destroy_leaderboard_me 
	DestroyScreenElement \{id = leaderboard_popup}
endscript

script ui_leaderboard_popup_anim_in 
	if ScreenElementExists \{id = leaderboard_popup}
		startrendering \{reason = menu_transition}
		leaderboard_popup :SE_SetProps \{alpha = 1.0
			time = 0.1}
		leaderboard_popup :SE_WaitProps
	endif
endscript

script ui_leaderboard_popup_anim_out 
	if ScreenElementExists \{id = leaderboard_popup}
		leaderboard_popup :SE_SetProps \{alpha = 0.0
			time = 0.1}
		leaderboard_popup :SE_WaitProps
	endif
endscript
