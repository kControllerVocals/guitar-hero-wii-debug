guitar_hero_cheat_index = [
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
	0
]
guitar_hero_cheats = [
	{
		name = 'AlwaysSlide'
		name_text = qs("ALWAYS SLIDE")
		var = Cheat_AlwaysSlide
		unlock_pattern = [
			green
			green
			red
			red
			Yellow
			red
			Yellow
			Blue
		]
		options = [
			{
				text = qs("ALWAYS SLIDE:\nOFF")
				globals = [
					{
						set = Cheat_AlwaysSlide
						value = 2
					}
				]
			}
			{
				text = qs("ALWAYS SLIDE:\nON")
				globals = [
					{
						set = Cheat_AlwaysSlide
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'BestBuyKid'
		name_text = qs("NICK!")
		var = Cheat_BestBuyKid
		unlock_pattern = [
			green
			red
			Blue
			green
			red
			Blue
			Blue
			green
		]
		not_toggle
		options = [
			{
				text = qs("NICK!")
				globals = [
					{
						set = Cheat_BestBuyKid
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'EuroContestWinner'
		name_text = qs("JOHNNY VIPER!")
		var = Cheat_EuroContestWinner
		unlock_pattern = [
			Blue
			red
			Blue
			Blue
			Yellow
			Yellow
			Yellow
			green
		]
		not_toggle
		options = [
			{
				text = qs("JOHNNY VIPER!")
				globals = [
					{
						set = Cheat_EuroContestWinner
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'Rina'
		name_text = qs("RINA!")
		var = Cheat_Rina
		unlock_pattern = [
			Blue
			red
			green
			green
			Yellow
			Yellow
			Yellow
			green
		]
		not_toggle
		options = [
			{
				text = qs("RINA!")
				globals = [
					{
						set = Cheat_Rina
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'Aaron'
		name_text = qs("AARON STEELE!")
		var = Cheat_AARON
		unlock_pattern = [
			Blue
			red
			Yellow
			Yellow
			Yellow
			Yellow
			Yellow
			green
		]
		not_toggle
		options = [
			{
				text = qs("AARON STEELE!")
				globals = [
					{
						set = Cheat_AARON
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'AirInstruments'
		name_text = qs("AIR INSTRUMENTS")
		var = Cheat_AirInstruments
		unlock_pattern = [
			red
			red
			Blue
			Yellow
			green
			green
			green
			Yellow
		]
		options = [
			{
				text = qs("AIR INSTRUMENTS:\nOFF")
				globals = [
					{
						set = Cheat_AirInstruments
						value = 2
					}
					{
						set = AirInstruments
						value = 2
					}
				]
			}
			{
				text = qs("AIR INSTRUMENTS:\nON")
				exclude = [
					Cheat_InvisibleCharacters
				]
				globals = [
					{
						set = Cheat_AirInstruments
						value = 1
					}
					{
						set = AirInstruments
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'InvisibleCharacters'
		name_text = qs("INVISIBLE ROCKER")
		var = Cheat_InvisibleCharacters
		unlock_pattern = [
			green
			red
			Yellow
			Yellow
			Yellow
			Blue
			Blue
			green
		]
		options = [
			{
				text = qs("INVISIBLE ROCKER:\nOFF")
				globals = [
					{
						set = Cheat_InvisibleCharacters
						value = 2
					}
					{
						set = InvisibleCharacters
						value = 2
					}
				]
			}
			{
				text = qs("INVISIBLE ROCKER:\nON")
				exclude = [
					Cheat_AirInstruments
				]
				globals = [
					{
						set = Cheat_InvisibleCharacters
						value = 1
					}
					{
						set = InvisibleCharacters
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'PerformanceMode'
		name_text = qs("PERFORMANCE MODE")
		var = Cheat_PerformanceMode
		unlock_pattern = [
			Yellow
			Yellow
			Blue
			red
			Blue
			green
			red
			red
		]
		options = [
			{
				text = qs("PERFORMANCE MODE:\nOFF")
				globals = [
					{
						set = Cheat_PerformanceMode
						value = 2
					}
				]
			}
			{
				text = qs("PERFORMANCE MODE:\nON")
				globals = [
					{
						set = Cheat_PerformanceMode
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'Hyperspeed'
		name_text = qs("HYPERSPEED")
		var = Cheat_Hyperspeed
		unlock_pattern = [
			green
			Blue
			red
			Yellow
			Yellow
			red
			green
			green
		]
		options = [
			{
				text = qs("HYPERGUITAR:\nOFF")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Guitar
						value = 1.0
					}
				]
			}
			{
				text = qs("HYPERGUITAR:\nON 1")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Guitar
						value = 0.88
					}
				]
			}
			{
				text = qs("HYPERGUITAR:\nON 2")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Guitar
						value = 0.83
					}
				]
			}
			{
				text = qs("HYPERGUITAR:\nON 3")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Guitar
						value = 0.78
					}
				]
			}
			{
				text = qs("HYPERGUITAR:\nON 4")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Guitar
						value = 0.72999996
					}
				]
			}
			{
				text = qs("HYPERSGUITAR:\nON 5")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Guitar
						value = 0.68
					}
				]
			}
		]
	}
	{
		name = 'Hyperspeed'
		name_text = qs("HYPERSPEED")
		var = Cheat_Hyperspeed
		unlock_pattern = [
			green
			Blue
			red
			Yellow
			Yellow
			red
			green
			green
		]
		options = [
			{
				text = qs("HYPERBASS:\nOFF")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Bass
						value = 1.0
					}
				]
			}
			{
				text = qs("HYPERBASS:\nON 1")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Bass
						value = 0.88
					}
				]
			}
			{
				text = qs("HYPERBASS:\nON 2")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Bass
						value = 0.83
					}
				]
			}
			{
				text = qs("HYPERBASS:\nON 3")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Bass
						value = 0.78
					}
				]
			}
			{
				text = qs("HYPERBASS:\nON 4")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Bass
						value = 0.72999996
					}
				]
			}
			{
				text = qs("HYPERBASS:\nON 5")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Bass
						value = 0.68
					}
				]
			}
		]
	}
	{
		name = 'Hyperspeed'
		name_text = qs("HYPERSPEED")
		var = Cheat_Hyperspeed
		unlock_pattern = [
			green
			Blue
			red
			Yellow
			Yellow
			red
			green
			green
		]
		options = [
			{
				text = qs("HYPERDRUMS:\nOFF")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Drum
						value = 1.0
					}
				]
			}
			{
				text = qs("HYPERDRUMS:\nON 1")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Drum
						value = 0.88
					}
				]
			}
			{
				text = qs("HYPERDRUMS:\nON 2")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Drum
						value = 0.83
					}
				]
			}
			{
				text = qs("HYPERDRUMS:\nON 3")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Drum
						value = 0.78
					}
				]
			}
			{
				text = qs("HYPERDRUMS:\nON 4")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Drum
						value = 0.72999996
					}
				]
			}
			{
				text = qs("HYPERDRUMS:\nON 5")
				globals = [
					{
						set = Cheat_Hyperspeed
						value = 1
					}
					{
						set = Hyperspeed_Drum
						value = 0.68
					}
				]
			}
		]
	}
	{
		name = 'AutoKick'
		name_text = qs("AUTO KICK")
		var = Cheat_AutoKick
		unlock_pattern = [
			Yellow
			green
			red
			Blue
			Blue
			Blue
			Blue
			red
		]
		options = [
			{
				text = qs("AUTO KICK:\nOFF")
				globals = [
					{
						set = Cheat_AutoKick
						value = 2
					}
				]
			}
			{
				text = qs("AUTO KICK:\nON")
				globals = [
					{
						set = Cheat_AutoKick
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'UnlockQuickplay'
		name_text = qs("QUICKPLAY SONGS")
		var = Cheat_UnlockQuickplay
		unlock_pattern = [
			Blue
			Blue
			red
			green
			green
			Blue
			Blue
			Yellow
		]
		options = [
			{
				text = qs("QUICKPLAY SONGS:\nOFF")
				globals = [
					{
						set = Cheat_UnlockQuickplay
						value = 2
					}
				]
			}
			{
				text = qs("QUICKPLAY SONGS:\nON")
				globals = [
					{
						set = Cheat_UnlockQuickplay
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'UnlockATTBallpark'
		name_text = qs("AT&T BALLPARK")
		var = Cheat_UnlockATTBallpark
		unlock_pattern = [
			Yellow
			green
			red
			red
			green
			Blue
			red
			Yellow
		]
		options = [
			{
				text = qs("AT&T BALLPARK:\nOFF")
				globals = [
					{
						set = Cheat_UnlockATTBallpark
						value = 2
					}
				]
			}
			{
				text = qs("AT&T BALLPARK:\nON")
				globals = [
					{
						set = Cheat_UnlockATTBallpark
						value = 1
					}
				]
			}
		]
	}
	{
		name = 'GemColor'
		name_text = qs("GEM COLOR")
		var = Cheat_GemColor
		unlock_pattern = [
			Blue
			red
			red
			green
			red
			green
			red
			Yellow
		]
		options = [
			{
				text = qs("GEM COLOR:\nNORMAL")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = standard_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nPINK")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = pink_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nSTEALTH")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = stealth_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nEGGS & BACON")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = Eggs_N_Bacon_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nOLD GLORY")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = old_glory_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nSOLID GOLD")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = solid_gold_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nPLATINUM")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = platinum_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nDIABOLIC")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = diabolic_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nTOXIC WASTE")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = toxic_waste_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nBLACK")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = black_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nPASTEL")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = pastel_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nDARK")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = dark_gems
					}
				]
			}
			{
				text = qs("GEM COLOR:\nOUTLINE")
				globals = [
					{
						set = Cheat_GemColor
						value = 1
					}
					{
						set = gem_set
						value = outline_gems
					}
				]
			}
		]
	}
	{
		name = 'FlameColor'
		name_text = qs("FLAME COLOR")
		var = Cheat_FlameColor
		unlock_pattern = [
			green
			red
			green
			Blue
			red
			red
			Yellow
			Blue
		]
		options = [
			{
				text = qs("FLAME COLOR:\nNORMAL")
				globals = [
					{
						set = Cheat_FlameColor
						value = 1
					}
					{
						set = FX_Set
						value = standard_fx
					}
				]
			}
			{
				text = qs("FLAME COLOR:\nPINK")
				globals = [
					{
						set = Cheat_FlameColor
						value = 1
					}
					{
						set = FX_Set
						value = pink_fx
					}
				]
			}
			{
				text = qs("FLAME COLOR:\nSTEALTH")
				globals = [
					{
						set = Cheat_FlameColor
						value = 1
					}
					{
						set = FX_Set
						value = stealth_fx
					}
				]
			}
			{
				text = qs("FLAME COLOR:\nEGGS & BACON")
				globals = [
					{
						set = Cheat_FlameColor
						value = 1
					}
					{
						set = FX_Set
						value = Eggs_N_Bacon_fx
					}
				]
			}
			{
				text = qs("FLAME COLOR:\nOLD GLORY")
				globals = [
					{
						set = Cheat_FlameColor
						value = 1
					}
					{
						set = FX_Set
						value = Old_Glory_fx
					}
				]
			}
			{
				text = qs("FLAME COLOR:\nDIABOLIC")
				globals = [
					{
						set = Cheat_FlameColor
						value = 1
					}
					{
						set = FX_Set
						value = Diabolic_fx
					}
				]
			}
			{
				text = qs("FLAME COLOR:\nTOXIC WASTE")
				globals = [
					{
						set = Cheat_FlameColor
						value = 1
					}
					{
						set = FX_Set
						value = Toxic_Waste_fx
					}
				]
			}
		]
	}
	{
		name = 'StarColor'
		name_text = qs("STAR COLOR")
		var = Cheat_StarColor
		unlock_pattern = [
			red
			red
			Yellow
			red
			Blue
			red
			red
			Blue
		]
		options = [
			{
				text = qs("STAR COLOR:\nNORMAL")
				globals = [
					{
						set = Cheat_StarColor
						value = 1
					}
					{
						set = Star_Set
						value = standard_stars
					}
				]
			}
			{
				text = qs("STAR COLOR:\nGOLD")
				globals = [
					{
						set = Cheat_StarColor
						value = 1
					}
					{
						set = Star_Set
						value = gold_stars
					}
				]
			}
		]
	}
	{
		name = 'VocalFireball'
		name_text = qs("VOCAL FIREBALL")
		var = Cheat_VocalFireball
		unlock_pattern = [
			red
			green
			green
			Yellow
			Blue
			green
			Yellow
			green
		]
		options = [
			{
				text = qs("VOCAL FIREBALL:\nNORMAL")
				globals = [
					{
						set = Cheat_VocalFireball
						value = 1
					}
				]
			}
			{
				text = qs("VOCAL FIREBALL:\nPINK")
				globals = [
					{
						set = Cheat_VocalFireball
						value = 2
					}
				]
			}
		]
	}
]
guitar_hero_debug_cheats = [
	{
		name = 'UnlockAll'
		name_text = qs("UNLOCK ALL")
		var = Cheat_UnlockAll
		unlock_pattern = [
			green
			green
			green
			green
			green
			green
			green
			Yellow
		]
	}
	{
		name = 'UnlockAllEverything'
		name_text = qs("UNLOCK ALL EVERYTHING")
		var = Cheat_UnlockAll_Everything
		unlock_pattern = [
			green
			green
			green
			green
			green
			green
			green
			red
		]
	}
]
guitar_hero_hidden_cheats = [
	{
		name = 'SuperUser'
		name_text = qs("Superuser")
		var = Cheat_SuperUser
		unlock_pattern = [
			green
			Blue
			red
			Yellow
			Yellow
			red
			Blue
			green
		]
		global = Cheat_SuperUser
		value = 1
	}
]
ui_cheats_settings = {
}

script ui_create_options_cheats 
	GetGlobalTags \{user_options}
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 0 newvalue = <cheat_index0>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 1 newvalue = <cheat_index1>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 2 newvalue = <cheat_index2>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 3 newvalue = <cheat_index3>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 4 newvalue = <cheat_index4>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 5 newvalue = <cheat_index5>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 6 newvalue = <cheat_index6>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 7 newvalue = <cheat_index7>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 8 newvalue = <cheat_index8>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 9 newvalue = <cheat_index9>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 10 newvalue = <cheat_index10>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 11 newvalue = <cheat_index11>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 12 newvalue = <cheat_index12>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 13 newvalue = <cheat_index13>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 14 newvalue = <cheat_index14>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 15 newvalue = <cheat_index15>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 16 newvalue = <cheat_index16>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 17 newvalue = <cheat_index17>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 18 newvalue = <cheat_index18>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 19 newvalue = <cheat_index19>
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = 20 newvalue = <cheat_index20>
	make_menu_frontend \{screen = Guitarist
		title = qs("CHEATS")
		item_scale = 1.75
		pad_back_script = ui_options_cheats_back
		pos = (0.0, 0.0)
		title_pos = (-20.0, 20.0)
		force_menu_pos = (0.0, 110.0)
		force_height = 550
		spacing_between = 20}
	CreateScreenElement {
		type = SpriteElement
		parent = <window_id>
		texture = triangle
		pos = (465.0, 41.0)
		rot_angle = -90
		just = [center center]
		id = cheat_tri_top
	}
	CreateScreenElement {
		type = SpriteElement
		parent = <window_id>
		texture = triangle
		pos = (1052.0, 60.0)
		rot_angle = 90
		just = [center center]
		id = cheat_tri_bot
	}
	add_menu_frontend_item \{text = qs("Enter new cheat")
		pad_choose_script = generic_event_choose
		pad_choose_params = {
			state = uistate_options_cheats_new
		}
		pos = (0.0, 20.0)
		item_height = 50}
	<item_container_id> :SE_GetParentId
	<parent_id> :SE_SetProps {
		event_handlers = [
			{focus ui_options_cheats_update_helper}
		]
		tags = {
			unlocked = 1
			toggle = 0
		}
	}
	GetArraySize \{$guitar_hero_cheats}
	i = 0
	begin
	FormatText checksumname = cheat_unlocked 'unlock_Cheat_%a' a = ($guitar_hero_cheats [<i>].name)
	if GotParam <cheat_unlocked>
		<text> = qs("locked")
		unlocked = 0
		toggle = 1
		pad_choose_script = nullscript
		item_height = 40
		if ((<...>.<cheat_unlocked>) > 0)
			name = ($guitar_hero_cheats [<i>].name)
			var = ($guitar_hero_cheats [<i>].var)
			cheat_index = ($guitar_hero_cheat_index [<i>])
			option_struct = ($guitar_hero_cheats [<i>].options [<cheat_index>])
			text = (<option_struct>.text)
			pad_choose_params = {}
			if StructureContains Structure = ($guitar_hero_cheats [<i>]) pad_choose_script
				pad_choose_script = ($guitar_hero_cheats [<i>].pad_choose_script)
				if StructureContains Structure = ($guitar_hero_cheats [<i>]) pad_choose_params
					pad_choose_params = ($guitar_hero_cheats [<i>].pad_choose_params)
				endif
			else
				pad_choose_script = ui_options_cheat_toggle
			endif
			item_height = 70
			if StructureContains Structure = ($guitar_hero_cheats [<i>]) not_toggle
				toggle = 0
				item_height = 40
			endif
			unlocked = 1
		endif
		add_menu_frontend_item {
			text = <text>
			pad_choose_script = <pad_choose_script>
			pad_choose_params = <pad_choose_params>
			pos = (0.0, 10.0)
			item_height = <item_height>
		}
		<item_container_id> :SE_GetParentId
		<parent_id> :SE_SetProps {
			event_handlers = [
				{focus ui_options_cheats_update_helper}
			]
			tags = {
				name = <name>
				var = <var>
				index = <i>
				unlocked = <unlocked>
				toggle = <toggle>
			}
		}
	endif
	i = (<i> + 1)
	repeat <array_size>
	<item_container_id> :SE_SetProps {
		event_handlers = [
			{focus ui_options_cheats_update_helper}
		]
	}
	menu_finish
	if NOT CompareStructs \{struct1 = $ui_cheats_settings
			struct2 = {
			}}
		current_menu :SetTags \{user_options = $ui_cheats_settings}
	else
		ui_options_set_settings
		current_menu :GetSingleTag \{user_options}
		change ui_cheats_settings = <user_options>
	endif
endscript

script ui_destroy_options_cheats 
	generic_ui_destroy
endscript

script ui_deinit_options_cheats 
	change \{ui_cheats_settings = {
		}}
	check_CAR_unlocks
endscript

script ui_options_cheats_back 
	SetSpawnInstanceLimits \{max = 1
		management = ignore_spawn_request}
	if Is_ui_event_running
		return
	endif
	ui_options_check_settings
endscript

script ui_options_cheat_toggle 
	GetTags
	cheat_index = ($guitar_hero_cheat_index [<index>])
	<cheat_index> = (<cheat_index> + 1)
	option_array = ($guitar_hero_cheats [<index>].options)
	GetArraySize <option_array>
	if (<cheat_index> >= <array_size>)
		<cheat_index> = 0
	endif
	SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = <index> newvalue = <cheat_index>
	GetGlobalTags \{user_options}
	FormatText checksumname = cheat_idx 'cheat_index%a' a = <index>
	AddParam structure_name = params name = <cheat_idx> value = <cheat_index>
	SetGlobalTags user_options params = <params>
	option_struct = (<option_array> [<cheat_index>])
	globals = (<option_struct>.globals)
	cheat_set_globals globals = <globals>
	text = (<option_struct>.text)
	SE_SetProps item_text = <text>
	exclude_option option_struct = <option_struct>
endscript

script cheat_set_globals 
	GetGlobalTags \{user_options}
	GetArraySize <globals>
	<idx> = 0
	begin
	<entry> = (<globals> [<idx>])
	<set> = (<entry>.set)
	if StructureContains Structure = <entry> value
		<set_value> = (<entry>.value)
	elseif StructureContains Structure = <entry> global
		<global> = (<entry>.global)
		<value> = ($<global>)
		if StructureContains Structure = <entry> scale
			<scale> = (<entry>.scale)
			<set_value> = (<value> * <scale>)
		else
			<set_value> = <value>
		endif
	endif
	if GotParam <set>
		AddParam structure_name = params name = <set> value = <set_value>
	else
		change globalname = <set> newvalue = <set_value>
	endif
	<idx> = (<idx> + 1)
	repeat <array_size>
	if GotParam \{params}
		SetGlobalTags user_options params = <params>
	endif
endscript

script cheat_turnoffall 
	GetArraySize \{$guitar_hero_cheats}
	<idx> = 0
	begin
	<var> = ($guitar_hero_cheats [<idx>].var)
	change globalname = <var> newvalue = 0
	<idx> = (<idx> + 1)
	repeat <array_size>
endscript

script cheat_turnoffalllocked 
	GetArraySize \{$guitar_hero_cheats}
	<idx> = 0
	begin
	<var> = ($guitar_hero_cheats [<idx>].var)
	savegame = 0
	unlocked = 0
	begin
	GetGlobalTags savegame = <savegame> user_options
	FormatText checksumname = cheat_idx 'cheat_index%a' a = <idx>
	if NOT (<...>.<cheat_idx> = 0)
		unlocked = 1
	endif
	savegame = (<savegame> + 1)
	repeat 4
	if (<unlocked> = 0)
		change globalname = <var> newvalue = 0
	endif
	<idx> = (<idx> + 1)
	repeat <array_size>
endscript

script exclude_option 
	if StructureContains Structure = <option_struct> exclude
		<exclude_array> = (<option_struct>.exclude)
		<exclude_index> = 0
		GetArraySize <exclude_array>
		<exclude_array_size> = <array_size>
		GetGlobalTags \{user_options}
		begin
		<exclude> = (<exclude_array> [<exclude_index>])
		GetArraySize \{$guitar_hero_cheats}
		<idx> = 0
		begin
		<var> = ($guitar_hero_cheats [<idx>].var)
		if (<var> = <exclude>)
			<name> = ($guitar_hero_cheats [<idx>].name)
			FormatText checksumname = cheat_checksum 'unlock_Cheat_%a' a = <name>
			if NOT ((<...>.<cheat_checksum>) = 0)
				exclude_array = ($guitar_hero_cheats [<idx>].options)
				SetArrayElement ArrayName = guitar_hero_cheat_index GlobalArray index = <idx> newvalue = 0
				GetGlobalTags \{user_options}
				FormatText checksumname = cheat_idx 'cheat_index%a' a = <idx>
				AddParam structure_name = params name = <cheat_idx> value = 0
				SetGlobalTags user_options params = <params>
				exclude_struct = (<exclude_array> [0])
				if NOT GotParam \{no_menu_update}
					text = (<exclude_struct>.text)
					SetScreenElementProps id = {current_menu child = (<idx> + 1)} item_text = <text>
				endif
				globals = (<exclude_struct>.globals)
				cheat_set_globals globals = <globals>
			endif
			break
		endif
		<idx> = (<idx> + 1)
		repeat <array_size>
		<exclude_index> = (<exclude_index> + 1)
		repeat <exclude_array_size>
	endif
endscript

script ui_options_cheats_update_helper 
	GetTags
	clean_up_user_control_helpers
	add_gamertag_helper \{exclusive_device = $primary_controller}
	if GotParam \{unlocked}
		if (<unlocked> = 1)
			if (<toggle> = 0)
				<green_text> = qs("SELECT")
			else
				<green_text> = qs("TOGGLE")
			endif
			add_user_control_helper text = <green_text> button = green z = 100000
			add_user_control_helper \{text = qs("BACK")
				button = red
				z = 100000}
		else
			add_user_control_helper \{text = qs("BACK")
				button = red
				z = 100000}
		endif
	else
		menu_finish
	endif
endscript

script check_CAR_unlocks 
	get_savegame_from_controller controller = ($primary_controller)
	GetGlobalTags savegame = <savegame> user_options
	if (<unlock_Cheat_BestBuyKid> = 1)
		unlock_profile id = NickArnold savegame = <savegame>
	endif
	if (<unlock_Cheat_EuroContestWinner> = 1)
		unlock_profile id = GH4_CAR_Winner savegame = <savegame>
	endif
	if (<unlock_Cheat_Rina> = 1)
		unlock_profile id = rina savegame = <savegame>
	endif
	if (<unlock_Cheat_Aaron> = 1)
		unlock_profile id = `Aaron Steele` savegame = <savegame>
	endif
endscript

script cheats_load 
	GetGlobalTags \{user_options}
	GetArraySize \{$guitar_hero_cheats}
	i = 0
	begin
	FormatText checksumname = cheat_unlocked 'unlock_Cheat_%a' a = ($guitar_hero_cheats [<i>].name)
	if GotParam <cheat_unlocked>
		if ((<...>.<cheat_unlocked>) > 0)
			FormatText checksumname = cheat_index_checksum 'cheat_index%a' a = <i>
			if GotParam <cheat_index_checksum>
				cheat_index = (<...>.<cheat_index_checksum>)
				cheat_set_globals globals = ($guitar_hero_cheats [<i>].options [<cheat_index>].globals)
			endif
		endif
	endif
	<i> = (<i> + 1)
	repeat <array_size>
endscript
