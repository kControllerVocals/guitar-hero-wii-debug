freestyle_you_rock_pos = (640.0, 280.0)
freestyle_lightning_offset = 500
freestyle_lightning_scale = 1.0
freestyle_lightning_frame_length = 0.033
freestyle_spark_start_scale = 0.5
freestyle_spark_end_scale = 1.8
freestyle_spark_rotation1 = 360
freestyle_spark_time1 = 0.3
freestyle_spark_rotation2 = 540
freestyle_spark_time2 = 0.1
freestyle_you_rock_playing = 0

script freestyle_destroy_you_rock 
	if ScreenElementExists \{id = freestyle_you_rock}
		DestroyScreenElement \{id = freestyle_you_rock}
	endif
	KillSpawnedScript \{name = freestyle_you_rock_effect}
	KillSpawnedScript \{name = create_exploding_text}
	KillSpawnedScript \{name = freestyle_you_rock_lightning_script}
	KillSpawnedScript \{name = freestyle_you_rock_spark_script}
	destroy_all_exploding_text
	change \{freestyle_you_rock_playing = 0}
endscript

script freestyle_you_rock_effect 
	change \{freestyle_you_rock_playing = 1}
	if NOT ScreenElementExists \{id = freestyle_you_rock}
		CreateScreenElement \{type = ContainerElement
			id = freestyle_you_rock
			parent = freestyle_root
			pos = $freestyle_you_rock_pos
			just = [
				center
				center
			]
			internal_just = [
				center
				center
			]}
	endif
	spawnscriptnow {
		create_exploding_text
		params = {
			parent = 'you_rock_physics'
			text = ($wii_freestyle_you_rock)
			font_color_1 = [250 240 220 255]
			font_color_2 = [115 185 205 255]
			font_color_3 = [0 0 0 255]
		}
	}
	SoundEvent \{event = You_Rock_End_SFX}
	SoundEvent \{event = Freestyle_Applause}
	Wait \{2
		seconds}
	freestyle_create_you_rock_spark \{alpha = 1.0}
	freestyle_create_you_rock_lightning \{Angle = 45}
	freestyle_create_you_rock_lightning \{Angle = 225}
	Wait \{1
		second}
	freestyle_create_you_rock_spark \{alpha = 1.0}
	freestyle_create_you_rock_lightning \{Angle = 135}
	freestyle_create_you_rock_lightning \{Angle = 315}
	Wait \{0.5
		seconds}
	freestyle_create_you_rock_spark \{alpha = 1.0}
	freestyle_create_you_rock_lightning \{Angle = 90}
	freestyle_create_you_rock_lightning \{Angle = 270}
	Wait \{0.3
		seconds}
	SoundEvent \{event = You_Rock_Explosion}
	Wait \{4
		seconds}
	destroy_all_exploding_text
	change \{freestyle_you_rock_playing = 0}
endscript

script freestyle_create_you_rock_lightning 
	cos (<Angle> - 180)
	sin (<Angle> - 180)
	pos = (0.0, 0.0)
	SetPairComponents {
		pos
		x = (<cos> * $freestyle_lightning_offset)
		y = (<sin> * $freestyle_lightning_offset)
	}
	CreateScreenElement {
		type = SpriteElement
		parent = freestyle_you_rock
		texture = YouRockLightning
		just = [center center]
		pos = <pos>
		rot_angle = <Angle>
		use_animated_uvs = true
		frame_length = $freestyle_lightning_frame_length
		num_uv_frames = (2.0, 4.0)
		scale = $freestyle_lightning_scale
		top_down_v
		loop_animated_uvs = false
		blend = Add
	}
	SpawnScriptLater freestyle_you_rock_lightning_script params = {id = <id>}
endscript

script freestyle_you_rock_lightning_script 
	wait_for_animation id = <id>
	if ScreenElementExists id = <id>
		DestroyScreenElement id = <id>
	endif
endscript

script freestyle_create_you_rock_spark 
	spark_texture = Random (@ YouRockSpark1 @ YouRockSpark2 @ YouRockSpark3 @ YouRockSpark4 )
	CreateScreenElement {
		type = SpriteElement
		parent = freestyle_you_rock
		texture = <spark_texture>
		just = [center center]
		pos = (0.0, 0.0)
		blend = Add
		scale = $freestyle_spark_start_scale
		alpha = <alpha>
	}
	RunScriptOnScreenElement freestyle_you_rock_spark_script id = <id> params = {}
endscript

script freestyle_you_rock_spark_script 
	SE_SetProps \{scale = $freestyle_spark_end_scale
		rot_angle = $freestyle_spark_rotation1
		time = $freestyle_spark_time1}
	SE_WaitProps
	SE_SetProps \{scale = 0.0
		alpha = 0.0
		rot_angle = $freestyle_spark_rotation2
		time = $freestyle_spark_time2}
	SE_WaitProps
	Die
endscript
