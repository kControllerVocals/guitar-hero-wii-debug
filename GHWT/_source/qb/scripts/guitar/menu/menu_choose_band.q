
script menu_choose_band_make_selection 
	change current_band = <band_index>
	NetSessionFunc func = SetActivePlayer params = {profile = ($current_band)}
	CreateProfile
	FormatText checksumname = bandname_id 'band%i_info' i = <band_index>
	GetGlobalTags <bandname_id> param = name
	if (<name> = qs("\L"))
		hide_glitch \{num_frames = 5}
		generic_event_choose \{state = uistate_band_name_logo
			data = {
				from_boot
				skip_destroy
			}}
	else
		if GotParam \{from_options}
			generic_event_choose \{no_sound
				state = UIstate_band_logo_choose
				data = {
					from_band_info = 1
				}}
			if GotParam \{band_info}
				ui_band_mode_choose_sound instrument = `default` controller = <controller>
			elseif GotParam \{band_index}
				ui_band_mode_choose_sound controller = <controller>
			endif
		else
			ui_event \{event = menu_replace
				data = {
					state = uistate_boot_download_scan
				}}
		endif
	endif
endscript
