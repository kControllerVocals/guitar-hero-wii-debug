
script pre_gameserver_callback 
	script_callback_script_cfunc
endscript

script script_callback_script 
endscript

script script_postcallback_script 
	UpdateGuitarFuncs
	if NOT GameIsPaused
		GetDeltaTime
		Update2DParticleSystems delta_time = <delta_time>
		RunQueuedPulseEvents
		CheckBossCutoff
		if ($output_gpu_log = 1)
			if IsNgc
				Ngc_GetGpuTimeMs
				milliseconds = <GpuTime>
			else
				GetProfileData \{cpu = 1
					name = gpu}
			endif
			if NOT (IsNgc)
			endif
			GetSongTime
			FormatText TextName = text qs("\LGPU Time; %s; %m") s = <songtime> m = <milliseconds> DontAssertForChecksums
			TextOutput text = <text>
		endif
	endif
	change current_frame_toggle = (1 - $current_frame_toggle)
endscript

script screenelement_postcallback_script 
endscript
