
script apply_band_logo_to_venue 
	venue_texture_name = 0xeb0543ff
	printf 'apply_band_logo_to_venue %s' s = <step> donotresolve
	if ($is_attract_mode = 0)
		getpakmancurrentname \{map = zones}
		if NOT gotparam \{pakname}
			scriptassert \{'Zone not found'}
		endif
		if (<step> = build)
		elseif (<step> = apply)
			updatevenuelogotexture {
				src = cag_workspace
				dest = <venue_texture_name>
			}
		else
			scriptassert \{'Unknown step type'}
		endif
	else
		printf \{'No band logos in attract mode'}
	endif
endscript
