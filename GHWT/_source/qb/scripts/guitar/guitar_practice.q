Practice_NoteMapping = [
	{
		MidiNote = 60
		Scr = play_drum_sample
		params = {
			pad = kick
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 61
		Scr = play_drum_sample
		params = {
			pad = floortom
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 62
		Scr = play_drum_sample
		params = {
			pad = floortom
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 63
		Scr = play_drum_sample
		params = {
			pad = hitom
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 64
		Scr = play_drum_sample
		params = {
			pad = snare
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 65
		Scr = play_drum_sample
		params = {
			pad = hihat
			buss = PracticeMode_Drums
			velocity = 50
		}
	}
	{
		MidiNote = 66
		Scr = play_drum_sample
		params = {
			pad = hihat
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 67
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = PracticeMode_Drums
			velocity = 50
		}
	}
	{
		MidiNote = 68
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = PracticeMode_Drums
		}
	}
	{
		MidiNote = 69
		Scr = play_drum_sample
		params = {
			pad = cymbal
			buss = PracticeMode_Drums
			velocity = 90
		}
	}
]

script Practice_DummyFunction 
	printf \{qs("\LPractice_DummyFunction")}
endscript

script create_practice_play_song_menu 
	show_highway
	if ScreenElementExists \{id = practice_sectiontext}
		SetScreenElementProps \{id = practice_sectiontext
			unhide}
	endif
endscript

script destroy_practice_play_song_menu 
	hide_highway
	if ScreenElementExists \{id = practice_sectiontext}
		SetScreenElementProps \{id = practice_sectiontext
			hide}
	endif
endscript
practice_font = fontgrid_title_a1

script practicemode_init 
	<start_index> = $practice_start_index
	if (<start_index> > 0)
		change \{structurename = player1_status
			gem_filler_first_note = 1}
	endif
	if NOT ($current_speedfactor = 1.0)
		if NOT PlayerInfoEquals \{1
				part = drum}
			SetNoteMappings \{section = Drums
				mapping = $Practice_NoteMapping}
		endif
	endif
	hide_band
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = practice_container
		pos = (0.0, 0.0)}
	CreateScreenElement {
		type = TextElement
		parent = practice_container
		id = practice_sectiontext
		scale = (1.1, 0.9)
		pos = (640.0, 160.0)
		font = ($practice_font)
		rgba = [255 255 255 255]
		alpha = 0
		just = [center top]
		z_priority = 3
	}
	spawnscriptnow \{practicemode_section}
endscript

script practicemode_section 
	if ($special_event_stage != 0)
		return
	endif
	if PlayerInfoEquals \{1
			part = Vocals}
		return
	endif
	current_section_index = 0
	begin
	GetSongTimeMs
	if (<time> > $current_starttime)
		practice_sectiontext :SE_SetProps text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :LegacyDoMorph \{alpha = 1.0
			time = 0.5}
		current_section_index = ($current_section_array_entry)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	begin
	GetSongTimeMs
	if (<time> > $current_endtime)
		practice_sectiontext :LegacyDoMorph \{alpha = 0.0
			time = 0.5}
		break
	elseif NOT (<current_section_index> = ($current_section_array_entry))
		practice_sectiontext :LegacyDoMorph \{alpha = 0.0
			time = 0.5}
		Wait \{0.5
			second}
		practice_sectiontext :SE_SetProps text = ($current_section_array [($current_section_array_entry)].marker)
		practice_sectiontext :LegacyDoMorph \{alpha = 1.0
			time = 0.5}
		current_section_index = ($current_section_array_entry)
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script practicemode_deinit 
	ClearNoteMappings \{section = practice}
	KillSpawnedScript \{name = practicemode_section}
	if ScreenElementExists \{id = practice_container}
		DestroyScreenElement \{id = practice_container}
	endif
	StopSoundsByBuss \{PracticeMode_Drums}
endscript
