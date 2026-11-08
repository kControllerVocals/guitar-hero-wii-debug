
script ui_create_atom_unlock 
	if NOT GotParam \{atom}
		make_generic_menu \{title = qs("Atom Unlock")}
		add_generic_menu_text_item \{text = qs("Progression")
			choose_state = uistate_atom_unlock
			choose_state_data = {
				atom = Progression
			}}
		add_generic_menu_text_item \{text = qs("Unlockable Content")
			choose_state = uistate_atom_unlock
			choose_state_data = {
				atom = unlock
			}}
	else
		switch (<atom>)
			case Progression
			make_generic_menu \{title = qs("Progression Atoms")
				scrolling
				selection_width = 625
				bg_scale = (1.5, 1.0)
				bg_pos = (-200.0, 0.0)}
			get_progression_globals game_mode = ($game_mode) <...> ($current_progression_flag)
			if NOT (<progression_global> = none)
				GetArraySize $<progression_global>
				if (<array_size> > 0)
					i = 0
					begin
					FormatText TextName = name qs("\L%a") a = ($<progression_global> [<i>].name) DontAssertForChecksums
					add_generic_menu_text_item {
						text = <name>
						pad_choose_script = ui_atom_unlock
						pad_choose_params = {name = Progression atom = ($<progression_global> [<i>].name)}
						additional_focus_script = ui_atom_unlock_focus
						additional_focus_params = {atom = ($<progression_global> [<i>])}
					}
					i = (<i> + 1)
					repeat <array_size>
				endif
			endif
			case unlock
			make_generic_menu \{title = qs("Unlockable Content Atoms")
				scrolling
				selection_width = 625
				bg_scale = (1.5, 1.0)
				bg_pos = (-200.0, 0.0)}
			GetArraySize \{$Unlock_Atoms}
			if (<array_size> > 0)
				i = 0
				begin
				FormatText TextName = name qs("\L%a") a = ($Unlock_Atoms [<i>].name) DontAssertForChecksums
				add_generic_menu_text_item {
					text = <name>
					pad_choose_script = ui_atom_unlock
					pad_choose_params = {name = Progression atom = ($Unlock_Atoms [<i>].name)}
					additional_focus_script = ui_atom_unlock_focus
					additional_focus_params = {atom = ($Unlock_Atoms [<i>])}
				}
				i = (<i> + 1)
				repeat <array_size>
			endif
		endswitch
	endif
	menu_finish
endscript

script ui_destroy_atom_unlock 
	generic_ui_destroy
endscript

script ui_atom_unlock 
	DebugForceAtomUnlock name = <name> atom = <atom>
endscript

script ui_atom_unlock_focus 
endscript
