freestyle_drum_z_bg = 5.0
freestyle_drum_z_autoloop = 9.0
freestyle_drum_z_selected = 6.0
freestyle_drum_z_hit = 7.0
freestyle_drum_z_recorder = 8.0
freestyle_drum_pos = (325.0, 600.0)
freestyle_drum_dims = (256.0, 256.0)
freestyle_drum_selected_dims = [
	(256.0, 256.0)
	(64.0, 64.0)
	(256.0, 256.0)
	(256.0, 256.0)
	(256.0, 256.0)
	(256.0, 256.0)
]
freestyle_drum_selected_pos = [
	(0.0, 0.0)
	(-60.0, -34.0)
	(0.0, 0.0)
	(0.0, 0.0)
	(0.0, 0.0)
	(0.0, 0.0)
]
freestyle_drum_hit_dims = [
	(128.0, 128.0)
	(128.0, 128.0)
	(128.0, 128.0)
	(128.0, 128.0)
	(128.0, 128.0)
	(256.0, 128.0)
]
freestyle_drum_hit_pos = [
	(-90.0, -20.0)
	(-47.0, -70.0)
	(0.0, -30.0)
	(47.0, -70.0)
	(75.0, -10.0)
	(0.0, 35.0)
]
freestyle_drum_selected_id = [
	freestyle_drum_1
	freestyle_drum_2
	freestyle_drum_3
	freestyle_drum_4
	freestyle_drum_5
	freestyle_drum_6
]
freestyle_drum_selected_texture = [
	FreestyleDrumRedSelected
	FreestyleDrumYellowSelected
	FreestyleDrumBlueSelected
	FreestyleDrumOrangeSelected
	FreestyleDrumGreenSelected
	FreestyleDrumPurpleSelected
]
freestyle_drum_texture_yellow_selected = [
	FreestyleDrumYellowSelected
	FreestyleDrumYellowOpen
	FreestyleDrumYellowRide
	FreestyleDrumYellowCowbell
]
freestyle_drum_texture_yellow_off = [
	FreestyleDrumYellowOff
	FreestyleDrumYellowOffOpen
	FreestyleDrumYellowOffRide
	FreestyleDrumYellowOffCowbell
]
freestyle_drum_texture_yellow_off_kit = [
	FreestyleDrumKitYellowOff
	FreestyleDrumKitYellowOffOpen
	FreestyleDrumKitYellowOffRide
	FreestyleDrumKitYellowOffCowbell
]
freestyle_drum_hat_sound = 0
freestyle_drum_kit = invalid
freestyle_drum_hit_id = [
	freestyle_drum_hit_1
	freestyle_drum_hit_2
	freestyle_drum_hit_3
	freestyle_drum_hit_4
	freestyle_drum_hit_5
	freestyle_drum_hit_6
]
freestyle_drum_hit_texture = [
	FreestyleDrumRedHit
	FreestyleDrumYellowHit
	FreestyleDrumBlueHit
	FreestyleDrumOrangeHit
	FreestyleDrumGreenHit
	FreestyleDrumPurpleHit
]
freestyle_num_drums = 6
freestyle_drum_fade = [
	0.0
	0.0
	0.0
	0.0
	0.0
	0.0
]
freestyle_drum_left_hand_pos = 0
freestyle_drum_right_hand_pos = 0
freestyle_drum_alpha_hover = 1.0
freestyle_drum_alpha_hit = 1.0
freestyle_drum_hit_length = 10.0
freestyle_drum_recorder_pos = (325.0, 600.0)
freestyle_drum_recorder_dims = (256.0, 256.0)
freestyle_drum_recorder_beat_width = 40.0
freestyle_drum_recorder_beat_start = 90.0
freestyle_drum_recorder_track_height = 18
freestyle_drum_recorder_track_start = -36.0
freestyle_drum_recorder_visible_time = 30.0
freestyle_drum_recorder_timer = 0.0
freestyle_drum_recorder_fade_time = 0.2
freestyle_num_beats = 4
freestyle_blues_divisions = 6
freestyle_rock_divisions = 4
freestyle_metal_divisions = 4
freestyle_drum_card_name_equivalence = [
	-1
	2
	3
	4
	5
	1
	0
]

script freestyle_init_drums 
	CreateScreenElement \{id = freestyle_drum_container
		type = ContainerElement
		parent = freestyle_hud
		rgba = [
			255
			255
			255
			255
		]
		pos = (0.0, 0.0)
		internal_just = [
			center
			center
		]}
	CreateScreenElement \{id = freestyle_drum_gui_container
		type = ContainerElement
		pos = $freestyle_drum_pos
		parent = freestyle_drum_container
		internal_just = [
			center
			center
		]}
	CreateScreenElement \{id = freestyle_drum_bg
		type = SpriteElement
		parent = freestyle_drum_gui_container
		texture = FreestyleDrumBG
		rgba = [
			255
			255
			255
			255
		]
		dims = $freestyle_drum_dims
		pos = (0.0, 0.0)
		alpha = 1
		just = [
			center
			center
		]
		internal_just = [
			center
			center
		]
		z_priority = $freestyle_drum_z_bg}
	CreateScreenElement {
		id = freestyle_drum_recorder_bg_off
		type = SpriteElement
		parent = freestyle_drum_gui_container
		texture = FreestyleDrumRecordBGOff
		rgba = [255 255 255 255]
		dims = $freestyle_drum_recorder_dims
		pos = (0.0, 0.0)
		z_priority = ($freestyle_drum_z_recorder)
		internal_just = [center center]
		just = [center center]
	}
	CreateScreenElement \{id = freestyle_drum_autoloop
		type = SpriteElement
		parent = freestyle_drum_recorder_bg_off
		texture = DrumAutoloop2
		dims = (64.0, 64.0)
		pos = (18.0, 73.0)
		z_priority = $freestyle_drum_z_autoloop}
	i = 1
	begin
	CreateScreenElement {
		id = ($freestyle_drum_selected_id [<i> - 1])
		type = SpriteElement
		parent = freestyle_drum_gui_container
		texture = ($freestyle_drum_selected_texture [<i> - 1])
		rgba = [255 255 255 255]
		dims = ($freestyle_drum_selected_dims [<i> - 1])
		pos = ($freestyle_drum_selected_pos [<i> - 1])
		alpha = 0
		just = [center center]
		z_priority = ($freestyle_drum_z_selected)
	}
	CreateScreenElement {
		type = SpriteElement
		id = ($freestyle_drum_hit_id [<i> - 1])
		parent = freestyle_drum_gui_container
		material = ($freestyle_drum_hit_texture [<i> - 1])
		blend = Add
		use_animated_uvs = true
		top_down_v
		frame_length = 0.04
		num_uv_frames = (2.0, 2.0)
		rgba = [255 255 255 255]
		pos = ($freestyle_drum_hit_pos [(<i> -1)])
		dims = ($freestyle_drum_hit_dims [(<i> -1)])
		z_priority = ($freestyle_drum_z_hit)
		just = [center center]
		loop_animated_uvs = false
		hide
	}
	SpawnScriptLater freestyle_drum_hit_animation params = {drum = <i>}
	i = (<i> + 1)
	repeat $freestyle_num_drums
	CreateScreenElement {
		id = freestyle_drum_hatsound
		type = SpriteElement
		parent = freestyle_drum_gui_container
		texture = FreestyleDrumYellowOff
		rgba = [255 255 255 255]
		dims = (64.0, 64.0)
		just = [center center]
		z_priority = ($freestyle_drum_z_bg + 0.1)
		pos = ($freestyle_drum_selected_pos [1])
	}
	freestyle_init_drum_recorder
	change \{freestyle_drum_kit = invalid}
endscript

script freestyle_init_drum_recorder_bg 
	if ScreenElementExists \{id = freestyle_drum_recorder_bg}
		DestroyScreenElement \{id = freestyle_drum_recorder_bg}
	endif
	CreateScreenElement {
		id = freestyle_drum_recorder_bg
		type = SpriteElement
		parent = freestyle_drum_gui_container
		texture = FreestyleDrumRecordBG
		rgba = [255 255 255 255]
		dims = $freestyle_drum_recorder_dims
		pos = (0.0, 0.0)
		z_priority = ($freestyle_drum_z_recorder + 0.1)
		internal_just = [center center]
		just = [center center]
		use_animated_uvs = true
		loop_animated_uvs = false
		top_down_v
		frame_length = 0.04
		num_uv_frames = (2.0, 2.0)
		alpha = 1.0
	}
endscript

script freestyle_init_drum_recorder 
	CreateScreenElement {
		id = freestyle_drum_recorder_container
		type = SpriteElement
		parent = freestyle_drum_container
		pos = $freestyle_drum_recorder_pos
		z_priority = ($freestyle_drum_z_recorder)
		alpha = 0
	}
	switch $freestyle_music_type
		case Blues
		divisions_per_beat = $freestyle_blues_divisions
		case Rock
		divisions_per_beat = $freestyle_rock_divisions
		case metal
		divisions_per_beat = $freestyle_metal_divisions
		default
		divisions_per_beat = 2
	endswitch
	space_between_divisions = ($freestyle_drum_recorder_beat_width / <divisions_per_beat>)
	num_divisions = ($freestyle_num_beats * <divisions_per_beat>)
	i = 0
	begin
	j = 1
	begin
	FormatText checksumname = gem_name 'freestyle_drum_recorder_%a_%b' a = <j> b = <i> AddToStringLookup = true
	pos = (($freestyle_drum_recorder_beat_start * (0.0, 1.0)) - ((<i> * <space_between_divisions>) * (0.0, 1.0)))
	if (<j> < 6)
		pos = (<pos> + (($freestyle_drum_recorder_track_start * (1.0, 0.0)) + (($freestyle_drum_recorder_track_height * (<j> - 1)) * (1.0, 0.0))))
	else
		pos = (<pos> + (($freestyle_drum_recorder_track_start * (1.0, 0.0)) + (($freestyle_drum_recorder_track_height * 2) * (1.0, 0.0))))
	endif
	FormatText checksumname = gem_texture 'DrumGem%a' a = ($freestyle_card_gem_names [($freestyle_drum_card_name_equivalence [<j>])]) AddToStringLookup = true
	CreateScreenElement {
		id = <gem_name>
		type = SpriteElement
		parent = freestyle_drum_recorder_container
		pos = <pos>
		texture = <gem_texture>
		rot_angle = <rot_angle>
		z_priority = ($freestyle_drum_z_recorder + 8 - <j>)
		hide
	}
	j = (<j> + 1)
	repeat $freestyle_num_drums
	i = (<i> + 1)
	repeat <num_divisions>
	CreateScreenElement {
		id = freestyle_drum_recorder_sweeper
		type = SpriteElement
		parent = freestyle_drum_recorder_container
		pos = (($freestyle_drum_recorder_beat_start * (1.0, 0.0)) + (($freestyle_drum_recorder_track_start * (0.0, 1.0)) + (($freestyle_drum_recorder_track_height * 2) * (0.0, 1.0))))
		texture = FreestyleDrumRecordBar
		z_priority = ($freestyle_drum_z_recorder + 2)
		alpha = 1.0
	}
endscript

script freestyle_update_drums 
	if NOT ($freestyle_player_data [1].instrument = $freestyle_drum_kit)
		change \{freestyle_drum_hat_sound = 0}
		if ($freestyle_player_data [1].instrument = DrumKit)
			SetScreenElementProps \{id = freestyle_drum_recorder_bg_off
				alpha = 0}
			SetScreenElementProps \{id = freestyle_drum_bg
				texture = FreestyleDrumKitBG}
		else
			SetScreenElementProps \{id = freestyle_drum_bg
				texture = FreestyleDrumBG}
		endif
		freestyle_drum_set_hat_sound hat = ($freestyle_drum_hat_sound)
		change freestyle_drum_kit = ($freestyle_player_data [1].instrument)
	endif
	drum = 0
	begin
	drum_name = ($freestyle_drum_selected_id [<drum>])
	alpha = ($freestyle_drum_alpha_hit * (($freestyle_drum_fade [<drum>]) / $freestyle_drum_hit_length))
	if NOT ($freestyle_player_data [1].instrument = DrumKit)
		if (($freestyle_drum_left_hand_pos = (<drum> + 1)) || ($freestyle_drum_right_hand_pos = (<drum> + 1)))
			alpha = ($freestyle_drum_alpha_hover + (($freestyle_drum_alpha_hit - $freestyle_drum_alpha_hover) * (($freestyle_drum_fade [<drum>]) / $freestyle_drum_hit_length)))
		endif
	endif
	SetScreenElementProps id = <drum_name> alpha = <alpha>
	if (($freestyle_drum_fade [<drum>]) > 0)
		SetArrayElement ArrayName = freestyle_drum_fade index = <drum> newvalue = (($freestyle_drum_fade [<drum>]) -1.0) GlobalArray
	endif
	drum = (<drum> + 1)
	repeat $freestyle_num_drums
	if NOT ($freestyle_player_data [1].instrument = DrumKit)
		change freestyle_drum_recorder_timer = (($freestyle_drum_recorder_timer) - 1)
		if (($freestyle_drum_recorder_timer) = 0)
			SetScreenElementProps {
				id = freestyle_drum_recorder_container
				time = ($freestyle_drum_recorder_fade_time)
				alpha = 0
			}
			if ScreenElementExists \{id = freestyle_drum_recorder_bg}
				SetScreenElementProps {
					id = freestyle_drum_recorder_bg
					time = ($freestyle_drum_recorder_fade_time)
					alpha = 0
				}
			endif
		endif
		if (($freestyle_drum_recorder_timer) = -60)
			SetScreenElementProps {
				id = freestyle_drum_recorder_bg_off
				time = ($freestyle_drum_recorder_fade_time)
				alpha = 0.6
			}
		endif
		GetMetronomeLengthOfBeat
		if (<length_of_beat> != 0)
			GetMetronomeBeatsSinceStart
			beats_since_start = (<beats_since_start> * 1000)
			CastToInteger \{beats_since_start}
			Mod a = (<beats_since_start>) b = 1000
			completion_percent = ((1.0 * <Mod>) / 1000.0)
			Mod a = (<beats_since_start> / 1000) b = 4
			current_beat = <Mod>
			offset = (<completion_percent> + <current_beat>)
			y_pos = ($freestyle_drum_recorder_beat_start - ($freestyle_drum_recorder_beat_width * <offset>))
			x_pos = ($freestyle_drum_recorder_track_start + ($freestyle_drum_recorder_track_height * 2))
			SetScreenElementProps {
				id = freestyle_drum_recorder_sweeper
				pos = ((<x_pos> * (1.0, 0.0)) + (<y_pos> * (0.0, 1.0)))
				alpha = (1.2 - <completion_percent> * 0.8)
			}
		else
			SetScreenElementProps \{id = freestyle_drum_recorder_sweeper
				alpha = 0}
		endif
	endif
endscript

script freestyle_destroy_drums 
	if ScreenElementExists \{id = freestyle_drum_container}
		DestroyScreenElement \{id = freestyle_drum_container}
	endif
	KillSpawnedScript \{name = freestyle_drum_hit_animation}
endscript

script freestyle_drum_left_hand \{drum = 0}
	change freestyle_drum_left_hand_pos = <drum>
endscript

script freestyle_drum_right_hand \{drum = 0}
	change freestyle_drum_right_hand_pos = <drum>
endscript
freestyle_drummer_anims_right = [
	{
		target = RightArmPartial
		Anim = GH4_Drummer_mii_RightHand_Snare
		Hand = 'right'
	}
	{
		target = RightArmPartial
		Anim = GH4_Drummer_mii_RightHand_Hihat
		Hand = 'right'
	}
	{
		target = RightArmPartial
		Anim = GH4_Drummer_mii_RightHand_Tom02
		Hand = 'right'
	}
	{
		target = RightArmPartial
		Anim = GH4_Drummer_mii_RightHand_Cymbal01
		Hand = 'right'
	}
	{
		target = RightArmPartial
		Anim = GH4_Drummer_mii_RightHand_Tom01
		Hand = 'right'
	}
	{
	}
]
freestyle_drummer_anims_left = [
	{
		target = LeftArmPartial
		Anim = GH4_Drummer_mii_LeftHand_Snare
		Hand = 'left'
	}
	{
		target = LeftArmPartial
		Anim = GH4_Drummer_mii_LeftHand_Hihat
		Hand = 'left'
	}
	{
		target = LeftArmPartial
		Anim = GH4_Drummer_mii_LeftHand_Tom02
		Hand = 'left'
	}
	{
		target = LeftArmPartial
		Anim = GH4_Drummer_mii_LeftHand_Cymbal02
		Hand = 'left'
	}
	{
		target = LeftArmPartial
		Anim = GH4_Drummer_mii_LeftHand_Tom01
		Hand = 'left'
	}
	{
	}
]
freestyle_drumkit_anims_left = [
	{
		target = snare
		Anim = GH4_Drummer_mii_Snare
	}
	{
		target = hihat
		Anim = GH4_Drummer_mii_Hihat
	}
	{
		target = tom2
		Anim = GH4_Drummer_mii_Tom02
	}
	{
		target = crash2
		Anim = GH4_Drummer_mii_Cymbal02
	}
	{
		target = tom1
		Anim = GH4_Drummer_mii_Tom01
	}
	{
		target = kick
		Anim = GH4_Drummer_mii_BassDrum
	}
]
freestyle_drumkit_anims_right = [
	{
		target = snare
		Anim = GH4_Drummer_mii_Snare
	}
	{
		target = hihat
		Anim = GH4_Drummer_mii_Hihat
	}
	{
		target = tom2
		Anim = GH4_Drummer_mii_Tom02
	}
	{
		target = crash1
		Anim = GH4_Drummer_mii_Cymbal01
	}
	{
		target = tom1
		Anim = GH4_Drummer_mii_Tom01
	}
	{
		target = kick
		Anim = GH4_Drummer_mii_BassDrum
	}
]
freestyle_drum_light_table = [
	1
	2
	3
	4
	0
	5
]

script freestyle_drum_lights \{drum = 0}
	freestyle_do_drummer_lights index = ($freestyle_drum_light_table [<drum> - 1])
endscript

script freestyle_drum_anim \{drum = 0}
	if (<Hand> = 0)
		drummer_anim = ($freestyle_drummer_anims_right [<drum> -1])
		drumkit_anim = ($freestyle_drumkit_anims_right [<drum> -1])
	else
		drummer_anim = ($freestyle_drummer_anims_left [<drum> -1])
		drumkit_anim = ($freestyle_drumkit_anims_left [<drum> -1])
	endif
	if StructureContains Structure = (<drummer_anim>) target
		freestyle_drummer_play_anim {
			anim_target = (<drummer_anim>.target)
			Anim = (<drummer_anim>.Anim)
			Hand = (<drummer_anim>.Hand)
			kill_idle
		}
	endif
	if StructureContains Structure = (<drumkit_anim>) target
		freestyle_drummer_play_anim {
			anim_target = (<drumkit_anim>.target)
			Anim = (<drumkit_anim>.Anim)
		}
	endif
endscript

script freestyle_drum_hit \{drum = 0}
	SetArrayElement ArrayName = freestyle_drum_fade index = (<drum> - 1) newvalue = $freestyle_drum_hit_length GlobalArray
	element_id = ($freestyle_drum_hit_id [<drum> - 1])
	if (ScreenElementExists id = <element_id>)
		restart_animation id = <element_id>
		SetScreenElementProps id = <element_id> unhide
	endif
	freestyle_mii_notify_note_played player = <player>
	freestyle_stats_drum_note_played player = <player> note_name = <note>
	freestyle_auto_help_notify_drum_hit player = <player> drum = <drum>
endscript

script freestyle_drum_record_show_ui 
	if ($freestyle_drum_recorder_timer <= 0)
		freestyle_init_drum_recorder_bg
		SetScreenElementProps \{id = freestyle_drum_recorder_bg_off
			alpha = 1.0}
		SetScreenElementProps \{id = freestyle_drum_recorder_container
			alpha = 1.0
			time = 0.2}
	endif
	change freestyle_drum_recorder_timer = ($freestyle_drum_recorder_visible_time)
endscript

script freestyle_drum_set_hat_sound 
	SetScreenElementProps id = freestyle_drum_2 texture = ($freestyle_drum_texture_yellow_selected [<hat>])
	if ($freestyle_player_data [1].instrument = DrumKit)
		SetScreenElementProps id = freestyle_drum_hatsound texture = ($freestyle_drum_texture_yellow_off_kit [<hat>])
	else
		SetScreenElementProps id = freestyle_drum_hatsound texture = ($freestyle_drum_texture_yellow_off [<hat>])
	endif
	change freestyle_drum_hat_sound = (<hat>)
endscript

script freestyle_drum_set_hat 
	printf qs(0x3eeafc05) d = <hat>
	SetScreenElementProps \{id = freestyle_drum_recorder_bg_off
		alpha = 1.0}
	if ($freestyle_drum_recorder_timer < 0)
		change \{freestyle_drum_recorder_timer = 0}
	else
		change freestyle_drum_recorder_timer = ($freestyle_drum_recorder_visible_time)
	endif
	switch <hat>
		case 0
		SetScreenElementProps \{id = freestyle_drum_autoloop
			texture = DrumAutoloop0}
		case 1
		SetScreenElementProps \{id = freestyle_drum_autoloop
			texture = DrumAutoloop1}
		case 2
		SetScreenElementProps \{id = freestyle_drum_autoloop
			texture = DrumAutoloop2}
		case 3
		SetScreenElementProps \{id = freestyle_drum_autoloop
			texture = DrumAutoloop3}
		default
		SetScreenElementProps \{id = freestyle_drum_autoloop
			texture = DrumAutoloop0}
	endswitch
endscript

script freestyle_drum_record_hide_ui 
	SetScreenElementProps \{id = freestyle_drum_recorder_container
		hide}
endscript

script freestyle_drum_record_focus_ui 
	SetScreenElementProps \{id = freestyle_drum_recorder_container
		alpha = 1}
endscript

script freestyle_drum_record_unfocus_ui 
	SetScreenElementProps \{id = freestyle_drum_recorder_container
		alpha = 0.5}
endscript

script freestyle_drum_record_add_note \{beat = 0
		division = 0
		drum = 0
		volume = 1.0}
	if (<drum> = 0)
		return
	endif
	switch $freestyle_music_type
		case Blues
		divisions_per_beat = $freestyle_blues_divisions
		case Rock
		divisions_per_beat = $freestyle_rock_divisions
		case metal
		divisions_per_beat = $freestyle_metal_divisions
		default
		divisions_per_beat = 2
	endswitch
	FormatText checksumname = gem_name 'freestyle_drum_recorder_%a_%b' a = <drum> b = ((<beat> * <divisions_per_beat>) + <division>) AddToStringLookup = true
	SetScreenElementProps id = <gem_name> unhide
	if (<drum> < 6)
		dims = ((10.0, 32.0) + ((<volume>) * (22.0, 0.0)))
		SetScreenElementProps id = <gem_name> dims = <dims>
	endif
endscript

script freestyle_drum_record_remove_track \{drum = 0}
	if (<drum> = 0)
		return
	endif
	switch $freestyle_music_type
		case Blues
		divisions_per_beat = $freestyle_blues_divisions
		case Rock
		divisions_per_beat = $freestyle_rock_divisions
		case metal
		divisions_per_beat = $freestyle_metal_divisions
		default
		divisions_per_beat = 2
	endswitch
	num_divisions = ($freestyle_num_beats * <divisions_per_beat>)
	i = 0
	begin
	FormatText checksumname = gem_name 'freestyle_drum_recorder_%a_%b' a = <drum> b = <i> AddToStringLookup = true
	SetScreenElementProps id = <gem_name> hide
	i = (<i> + 1)
	repeat <num_divisions>
endscript

script freestyle_drum_record_focus_track \{drum = 0}
	if (<drum> = 0)
		return
	endif
	switch $freestyle_music_type
		case Blues
		divisions_per_beat = $freestyle_blues_divisions
		case Rock
		divisions_per_beat = $freestyle_rock_divisions
		case metal
		divisions_per_beat = $freestyle_metal_divisions
		default
		divisions_per_beat = 2
	endswitch
	num_divisions = ($freestyle_num_beats * <divisions_per_beat>)
	i = 0
	begin
	FormatText checksumname = gem_name 'freestyle_drum_recorder_%a_%b' a = <drum> b = <i> AddToStringLookup = true
	SetScreenElementProps id = <gem_name> alpha = 1
	i = (<i> + 1)
	repeat <num_divisions>
endscript

script freestyle_drum_record_unfocus_track \{drum = 0}
	if (<drum> = 0)
		return
	endif
	switch $freestyle_music_type
		case Blues
		divisions_per_beat = $freestyle_blues_divisions
		case Rock
		divisions_per_beat = $freestyle_rock_divisions
		case metal
		divisions_per_beat = $freestyle_metal_divisions
		default
		divisions_per_beat = 2
	endswitch
	num_divisions = ($freestyle_num_beats * <divisions_per_beat>)
	i = 0
	begin
	FormatText checksumname = gem_name 'freestyle_drum_recorder_%a_%b' a = <drum> b = <i> AddToStringLookup = true
	SetScreenElementProps id = <gem_name> alpha = 0.8
	i = (<i> + 1)
	repeat <num_divisions>
endscript

script freestyle_drum_hit_animation \{drum = 0}
	if ((<drum> <= 0) || (<drum> > 6))
		ScriptAssert \{qs(0x7ea64d74)}
		return
	endif
	element_id = ($freestyle_drum_hit_id [<drum> - 1])
	begin
	wait_for_animation id = <element_id>
	SetScreenElementProps id = <element_id> hide
	Wait \{1
		frame}
	repeat
endscript

script freestyle_hide_drum_ui 
	SetScreenElementProps \{id = freestyle_drum_container
		hide}
	SetScreenElementProps \{id = freestyle_drum_signin
		unhide}
endscript

script freestyle_show_drum_ui 
	SetScreenElementProps \{id = freestyle_drum_container
		unhide}
	SetScreenElementProps \{id = freestyle_drum_signin
		hide}
endscript
