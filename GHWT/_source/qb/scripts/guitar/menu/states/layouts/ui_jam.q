
script ui_create_jam 
	change \{respond_to_signin_changed = 1}
	spawnscriptnow \{do_jam_loading}
	spawnscriptnow create_jam_menu params = <...>
endscript

script ui_destroy_jam 
	destroy_jam_menu
endscript

script ui_init_jam 
endscript

script ui_deinit_jam 
	destroy_band
	destroy_bandname_viewport
	ReloadSfx \{mode = FrontEnd
		noreset = 1}
	KillCamAnim \{name = jam_view_cam}
	change \{jam_view_cam_created = 0}
	jamsession_unload \{song_prefix = 'editable'}
	ClearJamSession
	jam_clear_clipboards
	FormatText \{checksumname = undo_clipboard_array
		'undo_clipboard'}
	if GlobalExists name = <undo_clipboard_array> type = array
		printf \{channel = jam_mode
			qs("\Ldestroy undo clipboard")}
		DestroyScriptArray name = <undo_clipboard_array>
	endif
	deinit_jam_audio
	change \{cas_override_object = none}
endscript

script deinit_jam_audio 
	DestroySoundBussEffects \{JamMode_RhythmGuitar = [
			all
		]
		JamMode_LeadGuitar = [
			all
		]}
	StopSoundsByBuss \{Guitar_JamMode}
	StopSoundsByBuss \{Drums_JamMode}
	StopSoundsByBuss \{Bass_JamMode}
	StopSoundsByBuss \{JamMode_Vox}
	jam_deinit_reverb
	if NOT GotParam \{keep_drumkit}
		UnLoadDrumKitAll
	endif
	UnLoadMelodyKit
endscript
