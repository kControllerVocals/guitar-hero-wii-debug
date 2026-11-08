
script hud_create_message \{priority = 0
		style_script = hud_message_wait_and_die
		font = fontgrid_text_a6}
	if NOT ScreenElementExists \{id = hud_root}
		return
	endif
	if NOT GotParam \{Band}
		if (<player> = 2)
			if ($boss_battle = 1)
				return
			endif
		endif
		if NOT GetHUDMessageParent player = <player>
			return
		endif
	else
		if NOT ScreenElementExists \{id = hud_band_messages}
			CreateScreenElement \{type = ContainerElement
				id = hud_band_messages
				parent = hud_root
				pos = (640.0, 280.0)
				dims = (640.0, 100.0)
				just = [
					center
					center
				]}
		endif
		message_parent = hud_band_messages
	endif
	RunScriptOnScreenElement id = <message_parent> hud_wait_and_create_message params = <...>
endscript

script hud_wait_and_create_message 
	begin
	if ResolveScreenElementId id = {<message_parent> child = 0}
		<resolved_id> :GetSingleTag message_priority
		if (<priority> = -1)
			if (<message_priority> = -1)
				break
			else
				return
			endif
		else
			if (<priority> <= <message_priority>)
				begin
				if NOT ScreenElementExists id = <resolved_id>
					break
				endif
				Wait \{1
					gameframe}
				repeat
			else
				break
			endif
		endif
	else
		break
	endif
	Wait \{2
		gameframes}
	repeat
	DestroyScreenElement id = <message_parent> preserve_parent
	GetScreenElementDims id = <message_parent>
	<dims> = ((<width> * (1.0, 0.0)) + (<Height> * (0.0, 1.0)))
	CreateScreenElement {
		parent = <message_parent>
		type = TextBlockElement
		font = <font>
		text = <text>
		rgba = [223 223 223 255]
		pos = (0.0, 0.0)
		pos_anchor = [center top]
		just = [center top]
		internal_just = [center top]
		dims = <dims>
		internal_scale = 0.5
		fit_width = `scale each line if larger`
		z_priority = 50
		shadow
		shadow_offs = (2.0, 2.0)
		shadow_rgba = [0 0 0 255]
		allow_expansion
		tags = {message_priority = <priority>}
	}
	RunScriptOnScreenElement id = <id> <style_script> params = <style_script_params>
endscript

script test_hud_messages 
	<i> = 1
	begin
	spawnscriptnow test_hud_messages_2 params = {player = <i>}
	<i> = (<i> + 1)
	repeat 2
endscript

script test_hud_messages_2 
	spawnscriptnow hud_create_message params = {player = <player> text = qs("\L50 Note\_Streak!")}
	Wait \{0.25
		second}
	spawnscriptnow hud_create_message params = {player = <player> text = qs("\L100 Note\_Streak!")}
	Wait \{0.25
		second}
	spawnscriptnow hud_create_message params = {player = <player> text = qs("\L150 Note\_Streak!")}
	Wait \{0.25
		second}
	spawnscriptnow hud_create_message params = {player = <player> text = qs("\LStar Power Ready!") priority = 2}
	Wait \{0.25
		second}
	spawnscriptnow hud_create_message params = {player = <player> text = qs("\L200 Note\_Streak!")}
endscript

script hud_message_wait_and_die 
	SE_SetProps \{alpha = 0}
	SE_SetProps \{alpha = 1.0
		time = 0.1}
	SE_WaitProps
	Wait \{2
		seconds
		ignoreslomo}
	Die
endscript

script hud_message_band_streak_style 
	Obj_GetID
	GameMode_GetNumPlayersShown
	streak_players = 0
	<i> = 0
	begin
	if (<players> [<i>] = 1)
		streak_players = (<streak_players> + 1)
	endif
	<i> = (<i> + 1)
	repeat <num_players_shown>
	<i> = 0
	<icons_displayed> = 0
	begin
	if (<players> [<i>] = 1)
		p = (<i> + 1)
		GetPlayerInfo <p> part
		switch <part>
			case Vocals
			texture = band_HUD_microphone
			case Bass
			texture = band_HUD_bass
			case drum
			texture = band_HUD_drums
			case guitar
			default
			texture = band_HUD_guitar
		endswitch
		<center> = ((<streak_players> / 2.0) * (36.0, 0.0))
		<offs> = ((<icons_displayed> + 0.5) * (36.0, 0.0))
		CreateScreenElement {
			type = SpriteElement
			parent = <ObjID>
			pos = ((320.0, 28.0) + <offs> - <center>)
			dims = (64.0, 64.0)
			pos_anchor = [center top]
			just = [center top]
			internal_just = [center top]
			texture = <texture>
			rgba = [255 172 64 255]
		}
		<icons_displayed> = (<icons_displayed> + 1)
	endif
	<i> = (<i> + 1)
	repeat <num_players_shown>
	SE_SetProps \{alpha = 0
		scale = 0
		rgba = [
			255
			172
			0
			0
		]}
	SE_SetProps \{alpha = 1.0
		scale = 1.0
		rgba = [
			255
			172
			64
			255
		]
		time = 0.5}
	SE_WaitProps
	Wait \{2
		seconds
		ignoreslomo}
	SE_SetProps \{alpha = 0.0
		scale = 1.1
		rgba = [
			255
			172
			0
			0
		]
		time = 0.5}
	SE_WaitProps
	Die
endscript

script hud_message_starpower_ready_style 
	SE_SetProps \{rgba = [
			145
			215
			235
			250
		]
		alpha = 0}
	if NOT ($is_attract_mode = 1)
		SoundEvent \{event = Star_Power_Available_GH4}
	endif
	SE_SetProps \{alpha = 1.0
		time = 0.1}
	SE_WaitProps
	Wait \{2
		seconds
		ignoreslomo}
	Die
endscript

script hud_message_flame_style_note_streak 
	hud_message_flame_style {notestreak = 1 highway_num = <highway_num>}
endscript

script hud_message_flame_style_starpower_ready 
	hud_message_flame_style2 {starpower = 1 highway_num = <highway_num>}
endscript

script hud_message_flame_style 
	SE_SetProps \{alpha = 0
		scale = (0.5, 0.5)
		z_priority = 0.01
		pos = (0.0, 70.0)
		rgba = [
			255
			128
			64
			0
		]}
	HUD_move_flame_container {pos = (0.0, -60.0) scale = (0.5, 0.0) starpower = <starpower> notestreak = <notestreak> highway_num = <highway_num>}
	Wait \{0.3
		seconds}
	if GotParam \{starpower}
		if NOT ($is_attract_mode = 1)
			SoundEvent \{event = Star_Power_Available_GH4}
		endif
	endif
	HUD_move_flame_container {scale = (0.9, 1.0) pos = (0.0, 10.0) time = 0.5 highway_num = <highway_num>}
	SE_SetProps \{alpha = 1
		scale = (0.5, 0.5)
		rgba = [
			255
			128
			0
			255
		]
		pos = (0.0, 70.0)
		time = 0.1}
	Wait \{0.1
		seconds}
	SE_SetProps \{alpha = 1
		scale = (0.75, 0.75)
		pos = (0.0, 0.0)
		rgba = [
			255
			200
			64
			255
		]
		time = 0.5}
	Wait \{0.75
		seconds}
	HUD_move_flame_container {scale = (1.0, 0.0) pos = (0.0, -40.0) time = 0.2 highway_num = <highway_num>}
	SE_SetProps \{alpha = 0
		scale = (0.78999996, 0.78999996)
		pos = (0.0, 0.0)
		rgba = [
			255
			200
			64
			0
		]
		time = 1.0}
	Wait \{1.0
		seconds
		ignoreslomo}
	Die
endscript

script hud_message_flame_style2 
	SE_SetProps \{alpha = 0
		scale = (0.5, 0.5)
		z_priority = 0.01
		pos = (0.0, 70.0)
		rgba = [
			0
			255
			255
			0
		]}
	HUD_move_flame_container {pos = (0.0, -60.0) scale = (0.5, 0.0) starpower = <starpower> notestreak = <notestreak> highway_num = <highway_num>}
	Wait \{0.3
		seconds}
	if GotParam \{starpower}
		if NOT ($is_attract_mode = 1)
			SoundEvent \{event = Star_Power_Available_GH4}
		endif
	endif
	HUD_move_flame_container {scale = (0.9, 1.0) pos = (0.0, 10.0) time = 0.5 highway_num = <highway_num>}
	SE_SetProps \{alpha = 1
		scale = (0.5, 0.5)
		rgba = [
			0
			255
			255
			255
		]
		pos = (0.0, 70.0)
		time = 0.1}
	Wait \{0.1
		seconds}
	SE_SetProps \{alpha = 1
		scale = (0.75, 0.75)
		pos = (0.0, 0.0)
		rgba = [
			255
			255
			255
			255
		]
		time = 0.5}
	Wait \{0.75
		seconds}
	HUD_move_flame_container {scale = (1.0, 0.0) pos = (0.0, -40.0) time = 0.2 highway_num = <highway_num>}
	SE_SetProps \{alpha = 0
		scale = (0.78999996, 0.78999996)
		pos = (0.0, 0.0)
		rgba = [
			128
			255
			255
			0
		]
		time = 1.0}
	Wait \{1.0
		seconds
		ignoreslomo}
	Die
endscript
