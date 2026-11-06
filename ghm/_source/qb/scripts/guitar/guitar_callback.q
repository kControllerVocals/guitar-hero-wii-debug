
script pre_gameserver_callback 
	script_callback_script_cfunc
endscript

script script_callback_script 
endscript

script script_postcallback_script 
	updateguitarfuncs
	if NOT gameispaused
		getdeltatime
		update2dparticlesystems delta_time = <delta_time>
		runqueuedpulseevents
		checkbosscutoff
		if ($output_gpu_log = 1)
			ngc_getgputimems
		endif
	endif
	change current_frame_toggle = (1 - $current_frame_toggle)
endscript

script screenelement_postcallback_script 
endscript
