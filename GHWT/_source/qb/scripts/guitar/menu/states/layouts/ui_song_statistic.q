
script ui_create_song_statistic 
	switch ($current_num_players)
		case 1
		pos = [(640.0, 360.0)]
		case 2
		pos = [(440.0, 360.0) , (840.0, 360.0)]
		case 3
		pos = [(640.0, 260.0) , (440.0, 460.0) , (840.0, 460.0)]
		case 4
		pos = [(640.0, 200.0) , (380.0, 500.0) , (640.0, 500.0) , (900.0, 500.0)]
	endswitch
	array = []
	AddArrayElement array = <array> element = ($player1_status.difficulty)
	AddArrayElement array = <array> element = ($player2_status.difficulty)
	AddArrayElement array = <array> element = ($player3_status.difficulty)
	AddArrayElement array = <array> element = ($player4_status.difficulty)
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = song_statistic_container}
	i = 1
	begin
	GetPlayerInfo <i> part
	GetPlayerInfo <i> best_run
	GetPlayerInfo <i> score
	GetPlayerInfo <i> max_notes
	GetPlayerInfo <i> notes_hit
	GetPlayerInfo <i> stars
	get_difficulty_text_nl difficulty = (<array> [(<i> - 1)])
	if (<max_notes> = 0)
		max_notes = 1
	endif
	if (<stars> < 3)
		stars = 3
	endif
	FormatText TextName = player_text qs("Player %p") p = <i>
	FormatText TextName = score_text qs("%s") s = <score> DecimalPlaces = 0 usecommas
	FormatText TextName = difficulty_text qs("%d") d = <difficulty_text_nl>
	FormatText TextName = percent_text qs("%p\% Notes Hit") p = (<notes_hit> / (<max_notes> * 1.0)) DecimalPlaces = 0
	FormatText TextName = streak_text qs("%n Note Streak") n = <best_run> DecimalPlaces = 0 usecommas
	switch (<part>)
		case guitar
		icon_texture = guitar_stat
		case Bass
		icon_texture = bass_stat
		case drum
		icon_texture = drum_stat
		case Vocals
		icon_texture = vocal_stat
	endswitch
	CreateScreenElement {
		parent = song_statistic_container
		type = DescInterface
		desc = 'song_statistic'
		pos = (<pos> [(<i> - 1)])
		autoSizeDims = true
		just = [center center]
		player_text = <player_text>
		score_text = <score_text>
		difficulty_text = <difficulty_text>
		percent_text = <percent_text>
		streak_text = <streak_text>
		icon_textur = <icon_texture>
	}
	stars = 3
	if <id> :Desc_ResolveAlias name = alias_stars
		if GetScreenElementChildren id = <resolved_id>
			GetArraySize <children>
			j = 0
			begin
			<current> = (<children> [<j>])
			alpha = 0.5
			if (<j> < <stars>)
				alpha = 1.0
			endif
			<current> :SE_SetProps {
				alpha = <alpha>
			}
			j = (<j> + 1)
			repeat <array_size>
		endif
	endif
	i = (<i> + 1)
	repeat ($current_num_players)
endscript

script ui_destroy_song_statistic 
	song_statistic_container :Die
endscript
