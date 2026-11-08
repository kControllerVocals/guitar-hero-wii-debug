lightshow_enabled = 1
lightshow_debug = 0
lightvolume_flarecutoff_low = 0.2
lightvolume_flarecutoff_high = 0.35000002
lightvolume_flarematerialcrc = FlareMaterial_FlareMaterial
lightvolume_flaresaturate = 1.0
lightvolume_follow = {
	allowedRadius = {
		amplitude = 0.2
		center = 1.0
		periodBase = 0.0065
		periodMultiples = [
			1
			3
			4
			7
		]
	}
	driftLerpMap = [
		(0.0, 0.4)
		(0.2, 0.7)
	]
}
lightshow_spotlightoverrides = {
	fade_time = 0.5
	snapshot_names_to_search = [
		solo01
	]
	default_params = {
		StartRadius = 0.3
		EndRadius = 1.5
		InnerRadius = 0.0
		range = 7.36
		VolumeDensity = 0.6442
		ProjectorColorRed = 170.0
		ProjectorColorGreen = 170.0
		ProjectorColorBlue = 170.0
		VolumeColorRed = 255.0
		VolumeColorGreen = 255.0
		VolumeColorBlue = 255.0
	}
}
lightshow_defaultblendtime = 0.15
lightshow_coloroverrideblend = 0.4
lightshow_offset_ms = 100
Lightshow_ProjectorTargetNames = {
	Z_ArtDeco_GFX_TRG_LH_stageHSAccent = Z_ArtDeco_SPOTLIGHT_stageHSAccent
	Z_ArtDeco_GFX_TRG_LH_GuitaristHotSpot01 = Z_ArtDeco_SPOTLIGHT_GuitaristHotSpot01
	Z_ArtDeco_GFX_TRG_LH_BassistHotSpot01 = Z_ArtDeco_SPOTLIGHT_Bassist
	Z_ArtDeco_GFX_TRG_LH_stageHSAccent01 = Z_ArtDeco_SPOTLIGHT_Vocalist
	Z_Budokan_GFX_TRG_LH_HotSpot01 = Z_Budokan_SPOTLIGHT_HotSpot01
	Z_Budokan_GFX_TRG_LH_HotSpot02 = Z_Budokan_SPOTLIGHT_HotSpot02
	Z_Budokan_GFX_TRG_LH_HotSpot03 = Z_Budokan_SPOTLIGHT_HotSpot03
	Z_Budokan_GFX_TRG_LH_Guitarist_HotSpot01 = Z_Budokan_SPOTLIGHT_GuitaristHotSpot01
	Z_Dive_GFX_TRG_LH_HotSpot01 = Z_Dive_SPOTLIGHT_HotSpot01
	Z_Dive_GFX_TRG_LH_HotSpot02 = Z_Dive_SPOTLIGHT_HotSpot02
	Z_Dive_GFX_TRG_LH_Dancer_HotSpot01 = Z_Dive_SPOTLIGHT_Dancer_HotSpot01
	Z_Dive_GFX_TRG_LH_Dancer_HotSpot02 = Z_Dive_SPOTLIGHT_Dancer_HotSpot02
	Z_Dive_GFX_TRG_LH_Guitarist_HotSpot01 = Z_Dive_SPOTLIGHT_Guitarist_HotSpot01
	Z_Hell_GFX_TRG_LH_HotSpot01 = Z_Hell_SPOTLIGHT_HotSpot01
	Z_Hell_GFX_TRG_LH_HotSpot02 = Z_Hell_SPOTLIGHT_HotSpot02
	Z_Hell_GFX_TRG_LH_Guitarist_HotSpot01 = Z_Hell_SPOTLIGHT_GuitaristHotSpot01
	Z_Party_GFX_TRG_LH_HotSpot01 = Z_Party_SPOTLIGHT_HotSpot01
	Z_Party_GFX_TRG_LH_HotSpot02 = Z_Party_SPOTLIGHT_HotSpot02
	Z_Party_GFX_TRG_LH_Guitarist_HotSpot01 = Z_Party_SPOTLIGHT_Guitarist_HotSpot01
	Z_Prison_GFX_TRG_LH_HotSpot01 = Z_Prison_SPOTLIGHT_HotSpot01
	Z_Prison_GFX_TRG_LH_HotSpot02 = Z_Prison_SPOTLIGHT_HotSpot02
	Z_Prison_GFX_TRG_LH_Guitarist_HotSpot01 = Z_Prison_SPOTLIGHT_Guitarist_HotSpot01
	Z_Video_GFX_TRG_LH_HotSpot01 = Z_Video_SPOTLIGHT_HotSpot01
	Z_Wikker_GFX_TRG_LH_Vocalist_HotSpot01 = Z_Wikker_SPOTLIGHT_Vocalist_HotSpot01
	Z_Wikker_GFX_TRG_LH_Bassist_HotSpot01 = Z_Wikker_SPOTLIGHT_Bassist_HotSpot01
	Z_Wikker_GFX_TRG_LH_Bassist_HotSpot01a = Z_Wikker_SPOTLIGHT_Bassist_HotSpot01a
	Z_Wikker_GFX_TRG_LH_Guitarist_HotSpot01 = Z_Wikker_SPOTLIGHT_Guitarist_HotSpot01
	Z_Wikker_GFX_TRG_LH_Guitarist_HotSpot01a = Z_Wikker_SPOTLIGHT_Guitarist_HotSpot01a
}
Lightshow_BlobShadowTargetNames = {
	Guitarist = [
		Z_ArtDeco_SHADOW_Guitarist
		Z_Budokan_SHADOW_Guitarist
		Z_Dive_SHADOW_Guitarist
		Z_Hell_SHADOW_Guitarist
		Z_Party_SHADOW_Guitarist
		Z_Prison_SHADOW_Guitarist
		Z_Video_SHADOW_Guitarist
		Z_Wikker_SHADOW_Guitarist
	]
	Guitarist01 = [
		Z_ArtDeco_SHADOW_Guitarist01
		Z_Budokan_SHADOW_Guitarist01
		Z_Dive_SHADOW_Guitarist2
		Z_Hell_SHADOW_Guitarist01
		Z_Party_SHADOW_Guitarist01
		Z_Prison_SHADOW_Guitarist01
		Z_Video_SHADOW_Guitarist01
		Z_Wikker_SHADOW_Guitarist01
	]
	vocalist = [
		Z_ArtDeco_SHADOW_Vocalist
		Z_Budokan_SHADOW_Vocalist
		Z_Dive_SHADOW_Vocalist
		Z_Hell_SHADOW_Vocalist
		Z_Party_SHADOW_Vocalist
		Z_Prison_SHADOW_Vocalist
		Z_Video_SHADOW_Vocalist
		Z_Wikker_SHADOW_Vocalist
	]
	bassist = [
		Z_ArtDeco_SHADOW_Bassist
		Z_Budokan_SHADOW_Bassist
		Z_Hell_SHADOW_Bassist
		Z_Party_SHADOW_Bassist
		Z_Prison_SHADOW_Bassist
		Z_Video_SHADOW_Bassist
		Z_Wikker_SHADOW_Bassist
	]
	Dancer01 = [
		Z_Dive_SHADOW_Dancer01
	]
	Dancer02 = [
		Z_Dive_SHADOW_Dancer02
	]
}
lightshow_spotlights = [
	Z_ArtDeco_GFX_L_Band_Guitarist_Spot01
	Z_Budokan_GFX_L_Band_Guitarist_Spot01
	Z_Dive_GFX_L_Band_Guitarist_Spot01
	Z_Hell_GFX_L_Band_Guitarist_Spot01
	Z_Party_GFX_L_Band_Guitarist_Spot01
	Z_Prison_GFX_L_Band_Guitarist_Spot01
	Z_Video_GFX_L_Band_Guitarist_Spot01
	Z_Wikker_GFX_L_Band_Guitarist_Spot01
	Z_Dive_GFX_L_Band_Dancer_Spot01
	Z_Dive_GFX_L_Band_Dancer_Spot02
]
lightshow_customweights = [
	{
		Z_ArtDeco_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Budokan_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Dive_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Hell_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Prison_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Video_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Wikker_GFX_L_Band_Guitarist_Spot01
		10.0
	}
	{
		Z_Dive_GFX_L_Band_Dancer_Spot01
		10.0
	}
	{
		Z_Dive_GFX_L_Band_Dancer_Spot02
		10.0
	}
	{
		Z_Party_GFX_L_Stage_Center_Direct01
		0.1
	}
	{
		Z_Video_GFX_VC_Cola_Omni01
		0.1
	}
	{
		Z_Video_GFX_VC_Exit_Omni01
		0.1
	}
	{
		Z_Video_GFX_VC_Exit_Omni02
		0.1
	}
	{
		Z_Video_GFX_VC_Exit_Omni03
		0.1
	}
	{
		Z_Video_GFX_VC_Exit_Omni04
		0.1
	}
	{
		Z_Video_GFX_VC_Periph_Left_Direct01
		0.1
	}
	{
		Z_Video_GFX_VC_Periph_Right_Direct01
		0.1
	}
]
lightshow_groupremap = {
	Band = [
		Band
		Alt_Band
		Guitarist
		bassist
		vocalist
		Drummer
	]
}
LightShow_DebugLightGroupPriorities = 0
LightShow_TweakParams = {
	`default` = {
		LightShow_AmbientDefault = 20
		LightShow_AmbientLightFactor = 0.5
		LightShow_SectorColorSaturate = 0.8
		LightShow_CharacterLightWeights = [
			1.3
			0.5
			0.1
			0.04
		]
		LightShow_CharacterAmbientWeight = 1.8
		LightShow_DisabledLights = [
		]
	}
	z_soundcheck = {
		LightShow_AmbientDefault = 20
		LightShow_AmbientLightFactor = 1.0
		LightShow_SectorColorSaturate = 0.8
		LightShow_CharacterLightWeights = [
			1.3
			0.5
			0.1
			0.04
		]
		LightShow_CharacterAmbientWeight = 1.8
	}
	z_wikker = {
		LightShow_AmbientDefault = 40
		LightShow_AmbientLightFactor = 0.6
		LightShow_SectorColorSaturate = 0.9
		LightShow_CharacterLightWeights = [
			1.0
			0.5
			0.2
			0.04
		]
		LightShow_CharacterAmbientWeight = 1.2
		LightShow_DisabledLights = [
		]
	}
	z_budokan = {
		LightShow_AmbientDefault = 40
		LightShow_AmbientLightFactor = 0.6
		LightShow_SectorColorSaturate = 0.9
		LightShow_CharacterLightWeights = [
			1.3
			0.4
			0.2
			0.04
		]
		LightShow_CharacterAmbientWeight = 1.3
		LightShow_DisabledLights = [
		]
	}
	z_HOF = {
		LightShow_DisabledLights = [
		]
	}
}
lightshow_housingmodels = [
]

script LightShow_SetVenueTweakParams 
	if GotParam \{zone}
		if StructureContains Structure = $LightShow_TweakParams <zone>
			printf qs(0x87764a54) s = <zone>
			LightShow_UpdateLightingTweaks ($LightShow_TweakParams.<zone>)
			return
		else
			printf qs(0x395cf574) s = <zone>
		endif
	endif
	printf \{qs(0xc38c4a0e)}
	LightShow_UpdateLightingTweaks ($LightShow_TweakParams.`default`)
endscript

script LightShow_CreatePermModels 
endscript

script LS_AllOff 
	KillSpawnedScript \{id = LightShow}
endscript

script LS_SetupVenueLights 
endscript

script LS_ResetVenueLights 
	LS_AllOff
	LS_KillFX
	GetPakManCurrent \{map = zones}
endscript

script LS_KillFX 
endscript
lightshow_SpotlightFollowNames = [
	Guitarist
	vocalist
	bassist
	Drummer
]
LightShow_ColorOverrides = {
	red = (255.0, 0.0, 0.0)
	Blue = (20.0, 132.0, 247.0)
	Yellow = (252.0, 227.0, 61.0)
	white = (255.0, 255.0, 255.0)
	Magenta = (240.0, 79.0, 255.0)
	green = (66.0, 228.0, 97.0)
	Purple = (162.0, 80.0, 232.0)
	Orange = (248.0, 142.0, 56.0)
}
LightShow_ColorOverrideExcludeLights = [
	Z_Budokan_GFX_L_Band_Ambient01
	Z_Budokan_GFX_L_Band_Guitarist_Spot01
	Z_Budokan_GFX_L_Band_Up_Direct01
	Z_Budokan_GFX_L_Crowd_Ambient01
	Z_Budokan_GFX_L_NeonSigns_Ambient01
	Z_Budokan_GFX_L_Periph_Ambient01
	Z_Budokan_GFX_L_Periph_Up_Direct01
	Z_Budokan_GFX_L_Stage_Ambient01
	Z_Budokan_GFX_L_Stage_Up_Direct01
	Z_Budokan_GFX_VC_Flames_Omni01
	Z_Budokan_GFX_VC_Flames_Omni02
	Z_Budokan_GFX_VC_Flames_Omni03
	Z_Budokan_GFX_VC_Flames_Omni04
	Z_Dive_GFX_L_Ambient01
	Z_Dive_GFX_L_Band_Ambient01
	Z_Dive_GFX_L_Band_Dancer_Spot01
	Z_Dive_GFX_L_Band_Dancer_Spot02
	Z_Dive_GFX_L_Band_Guitarist_Spot01
	Z_Dive_GFX_L_Band_Up_Direct01
	Z_Dive_GFX_L_Crowd_Ambient01
	Z_Dive_GFX_L_Stage_Dancer_Omni01
	Z_Dive_GFX_L_Stage_Up_Direct01
	Z_Dive_GFX_TRG_LH_Dancer_HotSpot01
	Z_Dive_GFX_TRG_LH_Dancer_HotSpot02
	Z_Dive_GFX_TRG_LH_Guitarist_HotSpot01
	Z_Dive_GFX_VC_Arcade_Omni01
	Z_Dive_GFX_VC_Bathroom_Omni01
	Z_Dive_GFX_VC_Bathroom_Omni02
	Z_Dive_GFX_VC_Corner_Omni01
	Z_Dive_GFX_VC_Exit_Omni01
	Z_Dive_GFX_VC_Exit_Omni02
	Z_Dive_GFX_VC_Fill_Omni01
	Z_Dive_GFX_VC_Neon_Omni01
	Z_Dive_GFX_VC_Periph_Back_Direct01
	Z_Dive_GFX_VC_Periph_Back_Direct02
	Z_Hell_GFX_L_Band_Ambient01
	Z_HEll_GFX_L_Band_Fire_Direct01
	Z_Hell_GFX_L_Band_Guitarist_Spot01
	Z_Hell_GFX_L_Band_Up_Direct01
	Z_Hell_GFX_L_Crowd_Ambient01
	Z_Hell_GFX_L_Stage_Ambient01
	Z_Hell_GFX_L_Stage_Up_Direct01
	Z_Hell_GFX_TRG_LH_Guitarist_HotSpot01
	Z_Party_GFX_L_Band_Back_Direct01
	Z_Party_GFX_L_Band_Center_Direct01
	Z_Party_GFX_L_Stage_Back_Direct01
	Z_Party_GFX_L_Stage_Center_Direct01
	Z_Party_GFX_TRG_Flare_Back01
	Z_Party_GFX_TRG_Flare_Center01
	Z_Party_GFX_TRG_Flare_Chimney01
	Z_Party_GFX_TRG_Flare_Chimney02
	Z_Party_GFX_TRG_Flare_Chimney03
	Z_Party_GFX_VC_Viewer_Ambient01
	Z_Party_GFX_VC_Viewer_Center_Direct01
	Z_Party_GFX_VC_Viewer_Left_Direct01
	Z_Party_GFX_VC_Viewer_Left_Direct02
	Z_Party_GFX_VC_Viewer_Right_Direct01
	Z_Party_GFX_VC_Viewer_Right_Direct02
	Z_Party_GFX_VC_Viewer_Up_Direct01
	Z_Prison_GFX_L_Band_Ambient01
	Z_Prison_GFX_L_Band_Guitarist_Spot01
	Z_Prison_GFX_L_Band_Sky_FDirect01
	Z_Prison_GFX_L_Band_Up_Direct01
	Z_Prison_GFX_L_Crowd_Ambient01
	Z_Prison_GFX_L_Crowd_Sky_FDirect01
	Z_Prison_GFX_L_Stage_Ambient01
	Z_Prison_GFX_L_Stage_Sky_FDirect01
	Z_Prison_GFX_L_Stage_Sky_FDirect02
	Z_Prison_GFX_L_Stage_Up_Direct01
	Z_Video_GFX_L_BackDrop_Ambient01
	Z_Video_GFX_L_Band_Ambient01
	Z_Video_GFX_L_Band_Guitarist_Spot01
	Z_Video_GFX_L_Band_Up_Direct01
	Z_Video_GFX_L_Crowd_Ambient01
	Z_Video_GFX_L_Stage_Ambient01
	Z_Video_GFX_L_Stage_Up_Direct01
	Z_Video_GFX_VC_Cola_Omni01
	Z_Video_GFX_VC_Exit_Omni01
	Z_Video_GFX_VC_Exit_Omni02
	Z_Video_GFX_VC_Exit_Omni03
	Z_Video_GFX_VC_Exit_Omni04
	Z_Video_GFX_VC_Periph_Left_Direct01
	Z_Video_GFX_VC_Periph_Right_Direct01
	Z_Wikker_GFX_L_Ambient01
	Z_Wikker_GFX_L_Band_Ambient01
	Z_Wikker_GFX_L_Band_Guitarist_Spot01
	Z_Wikker_GFX_L_Band_Up_Direct01
	Z_Wikker_GFX_L_Crowd_Ambient01
	Z_Wikker_GFX_L_Stage_Up_Direct01
]
LightShow_StateNodeFlags = [
	LS_PERF_POOR
	LS_PERF_MEDIUM
	LS_PERF_GOOD
	LS_PERF_POOR_MEDIUM
	LS_PERF_MEDIUM_GOOD
	LS_PERF_POOR_MEDIUM_GOOD
	LS_PERF_POOR_NOBLACKOUT
	LS_PERF_MEDIUM_NOBLACKOUT
	LS_PERF_GOOD_NOBLACKOUT
	LS_PERF_POOR_MEDIUM_NOBLACKOUT
	LS_PERF_MEDIUM_GOOD_NOBLACKOUT
	LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
	LS_MOOD_INTRO
	LS_MOOD_BLACKOUT
	LS_MOOD_FLARE
	LS_MOOD_STROBE
	LS_MOOD_WASH
	LS_MOOD_PRELUDE
	LS_MOOD_EXPOSITION
	LS_MOOD_RISING
	LS_MOOD_TENSION
	LS_MOOD_CLIMAX
	LS_MOOD_FALLING
	LS_MOOD_RESOLUTION
	LS_MOOD_PYRO
	LS_MOOD_SILHOUETTE
]
LightShow_StateNodeFlagMapping = {
	performance = {
		poor = [
			{
				LS_PERF_POOR
				1
			}
			{
				LS_PERF_POOR_MEDIUM
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_POOR_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
				1
			}
		]
		medium = [
			{
				LS_PERF_POOR_MEDIUM
				1
			}
			{
				LS_PERF_MEDIUM
				1
			}
			{
				LS_PERF_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_POOR_MEDIUM_NOBLACKOUT
				1
			}
			{
				LS_PERF_MEDIUM_NOBLACKOUT
				1
			}
			{
				LS_PERF_MEDIUM_GOOD_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
				1
			}
		]
		good = [
			{
				LS_PERF_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_GOOD
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				1
			}
			{
				LS_PERF_MEDIUM_GOOD_NOBLACKOUT
				1
			}
			{
				LS_PERF_GOOD_NOBLACKOUT
				1
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD_NOBLACKOUT
				1
			}
		]
	}
	mood = {
		intro = [
			{
				LS_MOOD_INTRO
				1
			}
		]
		blackout = [
			{
				LS_MOOD_BLACKOUT
				1
			}
			{
				LS_PERF_POOR
				0
			}
			{
				LS_PERF_MEDIUM
				0
			}
			{
				LS_PERF_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM
				0
			}
			{
				LS_PERF_MEDIUM_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				0
			}
		]
		flare = [
			{
				LS_MOOD_FLARE
				1
			}
			{
				LS_PERF_POOR
				0
			}
			{
				LS_PERF_MEDIUM
				0
			}
			{
				LS_PERF_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM
				0
			}
			{
				LS_PERF_MEDIUM_GOOD
				0
			}
			{
				LS_PERF_POOR_MEDIUM_GOOD
				0
			}
		]
		strobe = [
			{
				LS_MOOD_STROBE
				1
			}
		]
		wash = [
			{
				LS_MOOD_WASH
				1
			}
		]
		prelude = [
			{
				LS_MOOD_PRELUDE
				1
			}
		]
		exposition = [
			{
				LS_MOOD_EXPOSITION
				1
			}
		]
		risingAction = [
			{
				LS_MOOD_RISING
				1
			}
		]
		tension = [
			{
				LS_MOOD_TENSION
				1
			}
		]
		climax = [
			{
				LS_MOOD_CLIMAX
				1
			}
		]
		fallingAction = [
			{
				LS_MOOD_FALLING
				1
			}
		]
		resolution = [
			{
				LS_MOOD_RESOLUTION
				1
			}
		]
		pyro = [
			{
				LS_MOOD_PYRO
				1
			}
		]
		silhouette = [
			{
				LS_MOOD_SILHOUETTE
				1
			}
		]
	}
}
LightShow_NoteMapping = [
	{
		MidiNote = 105
		Scr = LightShow_SpotlightColor
		params = {
			color = red
		}
	}
	{
		MidiNote = 104
		Scr = LightShow_SpotlightColor
		params = {
			color = Orange
		}
	}
	{
		MidiNote = 103
		Scr = LightShow_SpotlightColor
		params = {
			color = Yellow
		}
	}
	{
		MidiNote = 102
		Scr = LightShow_SpotlightColor
		params = {
			color = green
		}
	}
	{
		MidiNote = 101
		Scr = LightShow_SpotlightColor
		params = {
			color = Blue
		}
	}
	{
		MidiNote = 100
		Scr = LightShow_SpotlightColor
		params = {
			color = Purple
		}
	}
	{
		MidiNote = 99
		Scr = LightShow_SpotlightColor
		params = {
			color = Magenta
		}
	}
	{
		MidiNote = 98
		Scr = LightShow_SpotlightColor
		params = {
			color = white
		}
	}
	{
		MidiNote = 97
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = true
			spots = [
				vocalist
			]
		}
	}
	{
		MidiNote = 96
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = false
			spots = [
				vocalist
			]
		}
	}
	{
		MidiNote = 95
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = true
			spots = [
				Guitarist
			]
		}
	}
	{
		MidiNote = 94
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = false
			spots = [
				Guitarist
			]
		}
	}
	{
		MidiNote = 93
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = true
			spots = [
				bassist
			]
		}
	}
	{
		MidiNote = 92
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = false
			spots = [
				bassist
			]
		}
	}
	{
		MidiNote = 91
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = true
			spots = [
				Drummer
			]
		}
	}
	{
		MidiNote = 90
		Scr = LightShow_EnableSpotlights
		params = {
			enabled = false
			spots = [
				Drummer
			]
		}
	}
	{
		MidiNote = 88
		Scr = LightShow_SetParams
		params = {
			ResetCycleOnMoodChange = true
		}
	}
	{
		MidiNote = 87
		Scr = LightShow_SetParams
		params = {
			ResetCycleOnMoodChange = false
		}
	}
	{
		MidiNote = 84
		Scr = LightShow_SetParams
		params = {
			mood = intro
		}
	}
	{
		MidiNote = 83
		Scr = LightShow_SetParams
		params = {
			mood = blackout
		}
	}
	{
		MidiNote = 82
		Scr = LightShow_SetParams
		params = {
			mood = flare
		}
	}
	{
		MidiNote = 81
		Scr = LightShow_SetParams
		params = {
			mood = strobe
		}
	}
	{
		MidiNote = 80
		Scr = LightShow_SetParams
		params = {
			mood = wash
		}
	}
	{
		MidiNote = 79
		Scr = LightShow_SetParams
		params = {
			mood = prelude
		}
	}
	{
		MidiNote = 78
		Scr = LightShow_SetParams
		params = {
			mood = exposition
		}
	}
	{
		MidiNote = 77
		Scr = LightShow_SetParams
		params = {
			mood = risingAction
		}
	}
	{
		MidiNote = 76
		Scr = LightShow_SetParams
		params = {
			mood = tension
		}
	}
	{
		MidiNote = 75
		Scr = LightShow_SetParams
		params = {
			mood = climax
		}
	}
	{
		MidiNote = 74
		Scr = LightShow_SetParams
		params = {
			mood = fallingAction
		}
	}
	{
		MidiNote = 73
		Scr = LightShow_SetParams
		params = {
			mood = resolution
		}
	}
	{
		MidiNote = 72
		Scr = LightShow_SetParams
		params = {
			mood = pyro
		}
	}
	{
		MidiNote = 71
		Scr = LightShow_SetParams
		params = {
			mood = silhouette
		}
	}
	{
		MidiNote = 69
		Scr = LightShow_OverrideColor
		params = {
			color = red
		}
	}
	{
		MidiNote = 68
		Scr = LightShow_OverrideColor
		params = {
			color = Orange
		}
	}
	{
		MidiNote = 67
		Scr = LightShow_OverrideColor
		params = {
			color = Yellow
		}
	}
	{
		MidiNote = 66
		Scr = LightShow_OverrideColor
		params = {
			color = green
		}
	}
	{
		MidiNote = 65
		Scr = LightShow_OverrideColor
		params = {
			color = Blue
		}
	}
	{
		MidiNote = 64
		Scr = LightShow_OverrideColor
		params = {
			color = Purple
		}
	}
	{
		MidiNote = 63
		Scr = LightShow_OverrideColor
		params = {
			color = Magenta
		}
	}
	{
		MidiNote = 62
		Scr = LightShow_OverrideColor
		params = {
			color = white
		}
	}
	{
		MidiNote = 61
		Scr = LightShow_OverrideColor
		params = {
			off
		}
	}
	{
		MidiNote = 60
		event = strobetoggle
		params = {
			UseSnapshotPositions = false
		}
	}
	{
		MidiNote = 58
		event = snapshotchange
		params = {
			UseSnapshotPositions = true
		}
	}
	{
		MidiNote = 57
		event = snapshotchange
		params = {
			UseSnapshotPositions = false
		}
	}
	{
		MidiNote = 53
		Scr = LightShow_SetTime
		params = {
			time = 1.0
		}
	}
	{
		MidiNote = 52
		Scr = LightShow_SetTime
		params = {
			time = 0.9
		}
	}
	{
		MidiNote = 51
		Scr = LightShow_SetTime
		params = {
			time = 0.8
		}
	}
	{
		MidiNote = 50
		Scr = LightShow_SetTime
		params = {
			time = 0.7
		}
	}
	{
		MidiNote = 49
		Scr = LightShow_SetTime
		params = {
			time = 0.6
		}
	}
	{
		MidiNote = 48
		Scr = LightShow_SetTime
		params = {
			time = 0.5
		}
	}
	{
		MidiNote = 47
		Scr = LightShow_SetTime
		params = {
			time = 0.4
		}
	}
	{
		MidiNote = 46
		Scr = LightShow_SetTime
		params = {
			time = 0.3
		}
	}
	{
		MidiNote = 45
		Scr = LightShow_SetTime
		params = {
			time = 0.25
		}
	}
	{
		MidiNote = 44
		Scr = LightShow_SetTime
		params = {
			time = 0.2
		}
	}
	{
		MidiNote = 43
		Scr = LightShow_SetTime
		params = {
			time = 0.15
		}
	}
	{
		MidiNote = 42
		Scr = LightShow_SetTime
		params = {
			time = 0.1
		}
	}
	{
		MidiNote = 41
		Scr = LightShow_SetTime
		params = {
			time = 0.05
		}
	}
	{
		MidiNote = 40
		Scr = LightShow_SetTime
		params = {
			time = 0.0
		}
	}
	{
		MidiNote = 39
		Scr = LightShow_SetTime
		params = {
			`default`
		}
	}
	{
		MidiNote = 37
		Scr = LightShow_PyroEvent
		params = {
			type = generic
		}
	}
	{
		MidiNote = 35
		Scr = LightShow_PyroEvent
		params = {
			type = front_1
		}
	}
	{
		MidiNote = 34
		Scr = LightShow_PyroEvent
		params = {
			type = front_2
		}
	}
	{
		MidiNote = 33
		Scr = LightShow_PyroEvent
		params = {
			type = front_3
		}
	}
	{
		MidiNote = 32
		Scr = LightShow_PyroEvent
		params = {
			type = front_4
		}
	}
	{
		MidiNote = 31
		Scr = LightShow_PyroEvent
		params = {
			type = top_1
		}
	}
	{
		MidiNote = 30
		Scr = LightShow_PyroEvent
		params = {
			type = top_2
		}
	}
	{
		MidiNote = 29
		Scr = LightShow_PyroEvent
		params = {
			type = top_3
		}
	}
	{
		MidiNote = 28
		Scr = LightShow_PyroEvent
		params = {
			type = top_4
		}
	}
	{
		MidiNote = 27
		Scr = LightShow_PyroEvent
		params = {
			type = mid_1
		}
	}
	{
		MidiNote = 26
		Scr = LightShow_PyroEvent
		params = {
			type = mid_2
		}
	}
	{
		MidiNote = 25
		Scr = LightShow_PyroEvent
		params = {
			type = mid_3
		}
	}
	{
		MidiNote = 24
		Scr = LightShow_PyroEvent
		params = {
			type = mid_4
		}
	}
	{
		MidiNote = 23
		Scr = LightShow_PyroEvent
		params = {
			type = back_1
		}
	}
	{
		MidiNote = 22
		Scr = LightShow_PyroEvent
		params = {
			type = back_2
		}
	}
	{
		MidiNote = 21
		Scr = LightShow_PyroEvent
		params = {
			type = back_3
		}
	}
	{
		MidiNote = 20
		Scr = LightShow_PyroEvent
		params = {
			type = back_4
		}
	}
]
LightShow_SharedProcessors = [
	{
		name = Default_Generic
		ScrEnter = LightShow_GenericMood_Enter
		ScrEvent = LightShow_GenericMood_Event
		ScrExit = LightShow_GenericMood_Exit
	}
	{
		name = Poor_Generic
		ScrEnter = LightShow_Poor_Enter
		ScrEvent = LightShow_Poor_Event
		ScrExit = LightShow_Poor_Exit
	}
	{
		name = Blackout_Generic
		ScrEnter = LightShow_Blackout_Enter
		ScrEvent = LightShow_Blackout_Event
		ScrExit = LightShow_Blackout_Exit
	}
	{
		name = Flare_Generic
		ScrEnter = LightShow_Flare_Enter
		ScrEvent = LightShow_Flare_Event
		ScrExit = LightShow_Flare_Exit
	}
	{
		name = Strobe_Generic
		ScrEnter = LightShow_Strobe_Enter
		ScrEvent = LightShow_Strobe_Event
		ScrExit = LightShow_Strobe_Exit
	}
]

script lightshow_iterator 
	printf qs("\LLightShow Iterator started with time %d") d = <time_offset>
	LightShow_SetActive \{active = false}
	if NOT CD
		DestroyScreenElement \{id = LightShow_DebugAnchor}
		if ($lightshow_debug = 1)
			LightShow_DisplayDebugInfo
		endif
	endif
	if ($lightshow_enabled = 0)
		printf \{qs("\LLIGHTSHOW DISABLED: By script variable")}
		return
	endif
	get_song_prefix song = <song_name>
	FormatText checksumname = event_array '%s_lightshow_notes' s = <song_prefix> AddToStringLookup
	if NOT GlobalExists name = <event_array> type = array
		printf \{qs("\LLIGHTSHOW DISABLED: No midi events found for this song")}
		return
	endif
	array_entry = 0
	fretbar_count = 0
	GetArraySize $<event_array>
	array_size = (<array_size> / 2)
	if (<array_size> = 0)
		printf \{qs(0x9b4c934b)}
		return
	endif
	if NOT LightShow_InitEventMappings
		return
	endif
	GetSongTimeMs time_offset = <time_offset>
	if NOT (<array_size> = 0)
		begin
		if ((<time> - <skipleadin>) < $<event_array> [<array_entry>])
			break
		endif
		<array_entry> = (<array_entry> + 2)
		repeat <array_size>
		array_size = (<array_size> - (<array_entry> / 2))
		if NOT (<array_size> = 0)
			begin
			TimeMarkerReached_SetParams time_offset = <time_offset> array = <event_array> array_entry = <array_entry>
			begin
			LightShow_Update
			if TimeMarkerReached
				GetSongTimeMs time_offset = <time_offset>
				break
			endif
			WaitOneGameFrame
			repeat
			TimeMarkerReached_ClearParams
			DecompressNoteValue note_value = ($<event_array> [(<array_entry> + 1)])
			if LightShow_BeginProcessBlock {time = ($<event_array> [<array_entry>])
					note = <note>
					length = <length>}
				switch <process_mode>
					case event
					LightShow_PassEvent
					case Scr
					<eventscr> <eventparams>
				endswitch
				LightShow_EndProcessBlock
			endif
			<array_entry> = (<array_entry> + 2)
			repeat <array_size>
		endif
	endif
endscript

script LightShow_ToggleDebugInfo 
	if ($lightshow_debug = 1)
		change \{lightshow_debug = 0}
		DestroyScreenElement \{id = LightShow_DebugAnchor}
	else
		change \{lightshow_debug = 1}
		LightShow_DisplayDebugInfo
	endif
endscript

script LightShow_DisplayDebugInfo 
endscript

script LightShow_PyroEvent 
	if LightShow_GetPyroScript
		if StructureContains Structure = pyro_scripts <type>
			<Scr> = (<pyro_scripts>.<type>)
			if LightShow_GetParams
				if ScriptExists <Scr>
					spawnscriptnow <Scr> id = LightShow params = {performance = <performance>}
				endif
			endif
		else
			printf 'lightshow - pyro event skipped due to missing venue type %s' s = <type>
		endif
	else
		printf \{'lightshow - pyro event skipped due to missing venue definitions'}
	endif
endscript

script LightShow_Poor_Enter 
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = true
		save = true}
endscript

script LightShow_Poor_Exit 
endscript

script LightShow_Poor_Event 
	begin
	LightShow_WaitForNextEvent \{events = [
			snapshotchange
		]}
	repeat
endscript

script LightShow_GenericMood_Enter 
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = true
		save = true}
endscript

script LightShow_GenericMood_Exit 
endscript

script LightShow_GenericMood_Event 
	begin
	LightShow_WaitForNextEvent \{events = [
			snapshotchange
		]}
	LightShow_CycleNextSnapshot UseSnapshotPositions = <UseSnapshotPositions> save = true
	repeat
endscript

script LightShow_Blackout_Enter 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{intensity = 0.25
			SpecularIntensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = false
		UseSnapshotPositions = true}
endscript

script LightShow_Blackout_Event 
endscript

script LightShow_Blackout_Exit 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{Clear}
	endswitch
endscript

script LightShow_Flare_Enter 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{intensity = 0.25
			SpecularIntensity = 0.25}
	endswitch
	LightShow_CycleNextSnapshot \{save = false
		UseSnapshotPositions = true}
endscript

script LightShow_Flare_Event 
endscript

script LightShow_Flare_Exit 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_soundcheck
		case z_training
		case z_viewer
		LightShow_AppendSnapshotParams \{Clear}
	endswitch
endscript

script LightShow_Strobe_Enter 
	LightShow_SetTime \{enable = false}
endscript

script LightShow_Strobe_Event 
	LightShow_GetParams
	<original_snapshot> = <previous_snapshot>
	begin
	LightShow_CycleNextSnapshot \{UseSnapshotPositions = false
		save = false}
	LightShow_WaitForNextEvent \{events = [
			strobetoggle
		]}
	LightShow_AppendSnapshotParams \{intensity = 1.0}
	if GotParam \{original_snapshot}
		LightShow_PlaySnapshot name = <original_snapshot> save = false UseSnapshotPositions = false
	else
		LightShow_CycleNextSnapshot \{UseSnapshotPositions = false
			save = true}
	endif
	LightShow_WaitForNextEvent \{events = [
			strobetoggle
		]}
	repeat
endscript

script LightShow_Strobe_Exit 
	LightShow_AppendSnapshotParams \{Clear}
	LightShow_SetTime \{enable = true}
endscript

script LightShow_AddNodeFlags 
	GetArraySize \{$LightShow_StateNodeFlags}
	<i> = 0
	begin
	CreateNodeFlag ($LightShow_StateNodeFlags [<i>])
	<i> = (<i> + 1)
	repeat <array_size>
	CreateNodeFlag \{LS_ALWAYS}
	CreateNodeFlag \{LS_3_5_PRE}
	CreateNodeFlag \{LS_3_5_POST}
	CreateNodeFlag \{LS_ENCORE_PRE}
	CreateNodeFlag \{LS_ENCORE_POST}
	CreateNodeFlag \{LS_SPOTLIGHT_GUITARIST}
	CreateNodeFlag \{LS_SPOTLIGHT_BASSIST}
endscript

script LightShow_InitEventMappings 
	LightShow_AppendSnapshotParams \{Clear}
	LightShow_OverrideColor \{off}
	LightShow_SetTime \{`default`
		enable = true}
	ChangeNodeFlag \{LS_SPOTLIGHT_GUITARIST
		1}
	if ($current_num_players = 1)
		ChangeNodeFlag \{LS_SPOTLIGHT_BASSIST
			0}
	else
		ChangeNodeFlag \{LS_SPOTLIGHT_BASSIST
			1}
	endif
	GetPakManCurrentName \{map = zones}
	FormatText checksumname = event_struct '%s_lightshow_mapping' s = <pakname> AddToStringLookup
	FormatText checksumname = snapshot_struct '%s_snapshots' s = <pakname> AddToStringLookup
	FormatText checksumname = processors_struct '%s_lightshow_processors' s = <pakname> AddToStringLookup
	if NOT GlobalExists name = <event_struct> type = Structure
		printf \{qs("\LLIGHTSHOW DISABLED: No event mapping found for this venue")}
		printstruct <...>
		return \{false}
	endif
	if NOT GlobalExists name = <snapshot_struct> type = Structure
		printf \{qs("\LLIGHTSHOW DISABLED: No snapshots found for this venue")}
		printstruct <...>
		return \{false}
	endif
	if GlobalExists name = <processors_struct> type = array
		printf \{qs("\LLIGHTSHOW: Adding venue processor definitions")}
		LightShow_SetProcessors venue = $<processors_struct>
	endif
	LightShow_SetMapping ($<event_struct>)
	LightShow_SetActive \{active = true}
	LightShow_SetParams {
		performance = medium
		mood = intro
		VenueSnapshots = $<snapshot_struct>
	}
	LightShow_SpotlightColor \{color = white}
	if NOT ($debug_forcescore = off)
		CrowdIncrease \{player_status = player1_status}
	endif
	FormatText checksumname = venue_setup_scr '%s_SetupLightShow' s = <pakname> AddToStringLookup
	if ScriptExists <venue_setup_scr>
		spawnscriptnow <venue_setup_scr> id = LightShow
	endif
	return \{true}
endscript

script LightShow_DummyLoop 
	spawnscriptnow \{LightShow_DummyLoop_Spawned
		id = LightShow}
endscript

script LightShow_DummyLoop_Spawned 
	begin
	LightShow_Update
	Wait \{1
		gameframes}
	repeat
endscript

script LightShow_Shutdown 
	printf \{qs("\LLightShow_Shutdown starting")}
	LightShow_SetActive \{active = false}
	LightShow_SetProcessors \{Clear}
	LightShow_SetMapping \{Clear}
	KillSpawnedScript \{name = lightshow_iterator}
	KillSpawnedScript \{id = LightShow}
	KillSpawnedScript \{id = ScreenFlash}
	KillSpawnedScript \{id = LightShow_DummyLoop_Spawned}
	printf \{qs("\LLightShow_Shutdown finished")}
endscript

script Kill_LightShow_FX 
	GetPakManCurrent \{map = zones}
	switch <pak>
		case z_wikker
		DestroyParticlesByGroupID \{groupID = Z_Wikker_FX}
	endswitch
endscript

script LightShow_WaitAndEnableSpotlights 
	RequireParams \{[
			enable
			time
		]
		all}
	printf qs(0xb54b8925) s = <enable>
	Wait <time> seconds
	LightShow_EnableSpotlights <enable>
endscript

script Venue_PulseOnEvents \{amount = 1.12
		time = 0.1}
	if GotParam \{delay}
		RequireParams \{[
				events
			]
			all}
		Obj_EnableScaling
		Obj_GetScaling
		<start_scale> = <scaling>
		<end_scale> = (<scaling> * <amount>)
		begin
		Block anytypes = <events>
		Wait <delay> seconds
		Obj_ApplyScaling scale = <end_scale>
		WaitOneGameFrame
		Obj_MorphScaling target_scale = <start_scale> blend_duration = <time>
		repeat
	else
		AddPulseEvent events = <events> amount = <amount> time = <time>
	endif
endscript

script Venue_PulseGreen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
		]}
endscript

script Venue_PulseRed 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
		]}
endscript

script Venue_PulseYellow 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
		]}
endscript

script Venue_PulseBlue 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
		]}
endscript

script Venue_PulseOrange 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Orange
		]}
endscript

script Venue_PulseOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
endscript

script Venue_PulseDrumLeft 
	SetSpawnInstanceLimits \{max = 2
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Left
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumRight 
	SetSpawnInstanceLimits \{max = 2
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Right
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script Venue_PulseDrumBoth 
	SetSpawnInstanceLimits \{max = 4
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			DrumKick_Left
			DrumKick_Right
		]
		amount = 1.1
		delay = $drum_kick_anim_delay}
endscript

script Venue_PulseAny 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Red
			HitNote_Yellow
			HitNote_Blue
			HitNote_Orange
		]}
endscript

script Venue_PulseGreenRed 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Red
		]}
endscript

script Venue_PulseGreenYellow 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Yellow
		]}
endscript

script Venue_PulseGreenBlue 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Blue
		]}
endscript

script Venue_PulseGreenOrange 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
			HitNote_Orange
		]}
endscript

script Venue_PulseGreenOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Green
		]}
endscript

script Venue_PulseRedYellow 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Yellow
		]}
endscript

script Venue_PulseRedBlue 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Blue
		]}
endscript

script Venue_PulseRedOrange 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
			HitNote_Orange
		]}
endscript

script Venue_PulseRedOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Red
		]}
endscript

script Venue_PulseYellowBlue 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
			HitNote_Blue
		]}
endscript

script Venue_PulseYellowOrange 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
			HitNote_Orange
		]}
endscript

script Venue_PulseYellowOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Yellow
		]}
endscript

script Venue_PulseBlueOrange 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
			HitNote_Orange
		]}
endscript

script Venue_PulseBlueOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Blue
		]}
endscript

script Venue_PulseOrangeOpen 
	SetSpawnInstanceLimits \{max = 8
		management = ignore_spawn_request}
	Venue_PulseOnEvents \{events = [
			HitNote_Orange
		]}
endscript

script LightShow_SpotlightColor 
endscript
