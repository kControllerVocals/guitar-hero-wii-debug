
script apply_band_logo_to_venue 
	venue_texture_name = `tex\zones\Z_RecordStore\JG_RS_LOGOTemp_D_dnc.png`
	printf 'apply_band_logo_to_venue %s' s = <step> DoNotResolve
	if ($is_attract_mode = 0)
		GetPakManCurrentName \{map = zones}
		if NOT GotParam \{pakname}
			ScriptAssert \{'Zone not found'}
		endif
		if (<step> = build)
		elseif (<step> = apply)
			UpdateVenueLogoTexture {
				src = cag_workspace
				dest = <venue_texture_name>
			}
		else
			ScriptAssert \{'Unknown step type'}
		endif
	else
		printf \{'No band logos in attract mode'}
	endif
endscript
