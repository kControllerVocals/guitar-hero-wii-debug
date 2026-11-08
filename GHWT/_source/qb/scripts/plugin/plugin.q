
script Plugin_Quickview 
	spawnscriptnow Plugin_Quickview_Spawned params = <...>
endscript

script Plugin_Quickview_Spawned 
	printstruct <...>
	stoprendering
	FinishRendering
	Wait \{3
		gameframes}
	KillTextureSplats \{all}
	switch <export_type>
		case scene
		ScriptAssert \{qs("\LScene type exports are no longer supported. Use Zone type instead")}
		case Sky
		switch <project>
			case gun2
			TOD_Change_Sky Sky = <Sky>
			default
			Change_Sky Sky = <Sky>
		endswitch
		case zone
		switch <project>
			case gh3c
			printf \{qs(0x20cdf397)}
			GetPakManCurrentName \{map = zones}
			SetPakManCurrentBlock \{map = zones
				pak = none}
			RefreshPakManSizes \{map = zones}
			SetPakManCurrentBlock map = zones pakname = <pakname>
			printf \{qs(0x833f0879)}
			case gun2
			GetPakManCurrentName \{map = zones}
			zone_name = <pakname>
			FormatText TextName = zone qs("\L%z") z = <zone> DontAssertForChecksums
			if NOT (<zone_name> = <zone>)
				JumpToZone zone = <zone>
			else
				BlockPendingPakManLoads \{map = zones}
				RefreshCurrentZones
			endif
			default
			if NOT (<zone> = viewer)
				FormatText checksumname = zone 'load_%z' z = <zone> DontAssertForChecksums
			endif
			GetCurrentLevel
			if NOT (<level> = <zone>)
				SetPakManCurrentBlock \{map = zones
					pak = none}
				change_level level = <zone>
			else
				BlockPendingPakManLoads \{map = zones}
				RefreshCurrentZones
			endif
		endswitch
		case viewer
		switch <project>
			case gh3c
			printf \{qs(0x20cdf397)}
			GetPakManCurrentName \{map = zones}
			SetPakManCurrentBlock \{map = zones
				pak = none}
			RefreshPakManSizes \{map = zones}
			SetPakManCurrentBlock map = zones pakname = <pakname>
			printf \{qs(0x833f0879)}
			case gun2
			GetMissionName
			if NOT (<mission> = viewer)
				load_new_mission mission_pak = <viewer> reload_zones
			else
				BlockPendingPakManLoads \{map = zones}
				RefreshCurrentZones
			endif
			case gh3
			printf \{qs("\LGh3 viewer refresh")}
			select_venue \{norestart
				level = viewer}
			printf \{qs("\LGh3 viewer refresh done")}
			case gh3_demo
			printf \{qs("\LGh3 Demo viewer refresh")}
			select_venue \{norestart
				level = viewer}
			printf \{qs("\LGh3 Demo viewer refresh done")}
			case gh4
			printf \{qs("\LGh4 viewer refresh")}
			select_venue \{norestart
				level = viewer}
			printf \{qs("\LGh4 viewer refresh done")}
			default
			GetCurrentLevel
			if NOT (<level> = viewer)
				SetPakManCurrentBlock \{map = zones
					pak = none}
				change_level \{level = viewer}
			else
				BlockPendingPakManLoads \{map = zones}
				RefreshCurrentZones
			endif
		endswitch
		case mission
		switch <project>
			case gun2
			printf \{qs("\L######################### loading new mission")}
			load_new_mission mission_pak = <mission> reload_zones
			default
			BlockPendingPakManLoads \{map = zones}
			RefreshCurrentZones
		endswitch
		case Model
		change \{view_mode = 0}
		ToggleViewMode
		ToggleViewMode
		ToggleViewMode
		exit_view_models_menu
		toggle_model_viewer
		view_model modelName = <Model>
		case skin
		change \{view_mode = 0}
		ToggleViewMode
		ToggleViewMode
		ToggleViewMode
		exit_view_models_menu
		toggle_model_viewer
		view_model \{profile = Ped_BatMasterson
			animLoadScript = animload_ped_male
			extraAnim = animload_ped_male
			defaultAnim = MV_Idle_Denton
			SkeletonName = gun}
		default
	endswitch
	if NodeFlagExists \{NODEFLAG_VIEWERLIGHTS}
		ChangeNodeFlag \{NODEFLAG_VIEWERLIGHTS
			0}
		ChangeNodeFlag \{NODEFLAG_VIEWERLIGHTS
			1}
	endif
	startrendering
	kill_panel_message_if_it_exists \{id = quickview}
endscript
