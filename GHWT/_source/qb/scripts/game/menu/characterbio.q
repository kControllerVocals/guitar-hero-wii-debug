
script add_character_bio 
	if ScreenElementExists \{id = Character_Bio}
		update_character_bio title = <title> bio = <bio> name = <name>
	else
		CreateScreenElement {
			type = DescInterface
			parent = root_window
			desc = 'character_bio'
			id = Character_Bio
			character_bio_name_material = sys_fontgrid_title_A2_sys_fontgrid_title_A2
			character_bio_name_text = <name>
			character_bio_bio_text = <bio>
			character_bio_title_text = <title>
			character_bio_control_pos = {(0.0, -1000.0) relative}
		}
		spawnscriptnow \{animate_character_bio}
	endif
endscript

script destroy_character_bio 
	if ScreenElementExists \{id = Character_Bio}
		DestroyScreenElement \{id = Character_Bio}
	endif
endscript

script animate_character_bio 
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	if ScreenElementExists \{id = Character_Bio}
		Character_Bio :SE_SetProps \{character_bio_control_pos = {
				(0.0, 1030.0)
				relative
			}
			time = 0.2
			Anim = gentle}
	else
		return
	endif
	Wait \{0.22
		second}
	if ScreenElementExists \{id = Character_Bio}
		Character_Bio :SE_SetProps \{character_bio_control_pos = {
				(0.0, -30.0)
				relative
			}
			time = 0.1
			Anim = gentle}
	else
		return
	endif
	animate_character_bio_wiggle id = <id>
endscript

script animate_character_bio_wiggle 
	SetSpawnInstanceLimits \{max = 1
		management = kill_oldest}
	if (RandomInteger (0.0, 1.0) = 1)
		swing_direction = 1
	else
		swing_direction = -1
	endif
	swing_direction = (<swing_direction> * RandomFloat (0.3, 1.0))
	if ScreenElementExists \{id = Character_Bio}
		Character_Bio :SE_SetProps character_bio_control_rot_angle = (<swing_direction> * 2) Anim = gentle time = 0.15
	else
		return
	endif
	Wait \{0.2
		second}
	if ScreenElementExists \{id = Character_Bio}
		Character_Bio :SE_SetProps character_bio_control_rot_angle = (<swing_direction> * -1.5) Anim = gentle time = 0.275
	else
		return
	endif
	Wait \{0.35000002
		second}
	if ScreenElementExists \{id = Character_Bio}
		Character_Bio :SE_SetProps character_bio_control_rot_angle = (<swing_direction> * 0.5) Anim = gentle time = 0.2
	else
		return
	endif
	Wait \{0.25
		second}
	if ScreenElementExists \{id = Character_Bio}
		Character_Bio :SE_SetProps character_bio_control_rot_angle = (<swing_direction> * -0.25) Anim = gentle time = 0.15
	else
		return
	endif
	Wait \{0.2
		second}
	if ScreenElementExists \{id = Character_Bio}
		Character_Bio :SE_SetProps \{character_bio_control_rot_angle = 0
			Anim = gentle
			time = 0.1}
	else
		return
	endif
endscript

script update_character_bio 
	if ScreenElementExists \{id = Character_Bio}
		Character_Bio :SE_SetProps character_bio_title_text = <title>
	endif
	if ScreenElementExists \{id = Character_Bio}
		Character_Bio :SE_SetProps character_bio_name_text = <name>
	endif
	if ScreenElementExists \{id = Character_Bio}
		Character_Bio :SE_SetProps character_bio_bio_text = <bio>
	endif
	animate_character_bio_wiggle
endscript
