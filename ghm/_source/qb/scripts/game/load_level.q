fake_net = 0
assertonmissingscripts = 0
assertonmissingassets = 1
alwaysdump = 0
next_level_script = nullscript
dont_call_zone_init_hack = 0

script zone_init 
	printf qs(0x24c35764) s = <zone_string_name>
	if (<zone_string_name> = 'z_viewer')
		printf \{qs(0xae81ca89)}
		change \{assertonmissingscripts = 0}
	endif
	mempushcontext \{topdownheap}
	formattext textname = zone_editable_text checksumname = zone_editable_list '%a%b' a = <zone_string_name> b = '_editable_list'
	if globalexists name = <zone_editable_list> type = array
		addeditablelist <zone_editable_list>
	endif
	parsenodearray {
		queue
		zone_name = <zone_name>
		array_name = <array_name>
	}
	if gotparam \{sfx_array_name}
		parsenodearray {
			queue
			zone_name = <sfx_zone_name>
			array_name = <sfx_array_name>
		}
	endif
	if gotparam \{gfx_array_name}
		parsenodearray {
			queue
			zone_name = <gfx_zone_name>
			array_name = <gfx_array_name>
		}
	endif
	if gotparam \{lfx_array_name}
		parsenodearray {
			queue
			zone_name = <lfx_zone_name>
			array_name = <lfx_array_name>
		}
	endif
	if gotparam \{mfx_array_name}
		parsenodearray {
			queue
			zone_name = <mfx_zone_name>
			array_name = <mfx_array_name>
		}
	endif
	if NOT ($disable_global_pedestrians = 1)
		if NOT innetgame
			if iscoiminited
			endif
		endif
	endif
	mempopcontext
	if NOT infrontend
		formattext checksumname = zone_setup_script '%a_Setup' a = <zone_string_name>
		printf qs(0x88cf9523) s = (($levelzones.$current_level).name)
		if scriptexists <zone_setup_script>
			printf \{qs(0xa3028d0e)}
			spawnscriptnow zone_init_wait_run_setup params = {zone_setup_script = <zone_setup_script>}
		endif
	endif
endscript

script zone_init_wait_run_setup 
	begin
	if NOT nodearraybusy
		break
	endif
	waitonegameframe
	repeat
	if scriptexists <zone_setup_script>
		printf \{qs(0xc8955180)}
		<zone_setup_script>
	endif
endscript

script zone_deinit 
	printf qs(0xb9052920) s = <zone_string_name>
	parsenodearray abort array_name = <array_name>
	if gotparam \{sfx_array_name}
		parsenodearray abort array_name = <sfx_array_name>
	endif
	if gotparam \{gfx_array_name}
		parsenodearray abort array_name = <gfx_array_name>
	endif
	if gotparam \{lfx_array_name}
		parsenodearray abort array_name = <lfx_array_name>
	endif
	if gotparam \{mfx_array_name}
		parsenodearray abort array_name = <mfx_array_name>
	endif
	formattext textname = zone_editable_text checksumname = zone_editable_list '%a%b' a = <zone_string_name> b = '_editable_list'
	if globalexists name = <zone_editable_list> type = array
		removeeditablelist <zone_editable_list>
	endif
endscript

script setupcoim 
	pushmemprofile \{'COIM'}
	initcoim {
		size = <size>
		blockalign = $generic_coim_blockalign
		coim_min_scratch_blocks
		$generic_coim_params
	}
	popmemprofile
endscript
