uidesc_song_summary_1p = {
	DescVersion = 6
	name = uidesc_song_summary_1p
	rect = [
		0.18145801
		-1.545715
		1280.0
		748.187
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = sum_container
				}
				{
					index = 2
					validateLocalID = song_summary_1p_collumn
					includeParentOwned = false
				}
			]
			name = alias_1p_collumn
		}
		{
			path = [
				{
					validateLocalID = sum_container
				}
				{
					index = 2
					validateLocalID = song_summary_1p_collumn
					includeParentOwned = false
				}
			]
			name = alias_song_summary_1p_collumn
		}
		{
			path = [
				{
					validateLocalID = sum_container
				}
				{
					index = 11
					validateLocalID = my_menu
					includeParentOwned = false
				}
			]
			name = alias_my_menu
		}
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = sum_container
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (100.0, 108.0)
		}
		children = [
			{
				props = {
					texture = song_summary_line
					local_id = song_summary_line
					type = SpriteElement
					dims = (652.0, 12.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (405.07242, 313.8)
					z_priority = 1.0
					rot_angle = 84.0
					rgba = [
						255
						255
						255
						155
					]
				}
			}
			{
				props = {
					texture = song_summary_4pl_bkgd
					local_id = song_summary_4pl_bkgd
					type = SpriteElement
					dims = (1280.0, 720.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (540.18146, 250.45427)
					z_priority = 1.0
				}
			}
			{
				props = {
					local_id = song_summary_1p_collumn
					type = DescInterface
					hiddenLocal = false
					alpha = 1.0
					dims = (613.3182, 602.1177)
					just = [
						-1.0
						-1.0
					]
					pos_anchor = [
						-1.0
						-1.0
					]
					pos = (226.20837, 30.751572)
					z_priority = 1.0
					scale = (1.0, 1.0)
					rot_angle = -6.0
					rgba = [
						255
						255
						255
						255
					]
					events_blocked = 0
					preserve_local_orientation = false
					desc = 'song_summary_1p_collumn'
					autoSizeDims = true
					char_headshot_4pl_texture = char_headshot_4pl_placeholder
					name_text = qs("NameGoesHere")
					title_text = qs("Placeholder")
					score_text = qs("Score")
					score_number_value_text = qs("000,000")
					note_streak_text = qs("Note Streak")
					note_streak_value_text = qs("000")
					notes_hit_value_text = qs("100%")
					notes_hit_text = qs("Notes Hit")
					song_summary_star_empty01_texture = song_summary_star_empty
					song_summary_star_empty02_texture = song_summary_star_empty
					song_summary_star_empty03_texture = song_summary_star_empty
					song_summary_star_empty04_texture = song_summary_star_empty
					song_summary_star_empty05_texture = song_summary_star_empty
				}
			}
			{
				props = {
					texture = song_summary_box
					flip_v = true
					local_id = song_summary_box
					type = SpriteElement
					dims = (510.0, 76.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (593.5952, 147.40631)
					z_priority = 2.0
					rot_angle = -6.0
					rgba = [
						255
						255
						255
						205
					]
				}
			}
			{
				props = {
					texture = song_summary_box_score
					flip_v = true
					local_id = song_summary_box_score
					type = SpriteElement
					dims = (506.0, 80.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (512.61365, 234.55623)
					z_priority = 2.0
					rot_angle = -6.0
					rgba = [
						255
						255
						255
						150
					]
				}
			}
			{
				props = {
					texture = song_summary_bigbox
					local_id = song_summary_bigbox
					type = SpriteElement
					dims = (250.0, 108.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (574.80817, 362.89923)
					z_priority = 2.0
					rot_angle = -6.0
					rgba = [
						255
						255
						255
						200
					]
				}
			}
			{
				props = {
					texture = song_summary_lightning
					local_id = song_summary_lightning
					type = SpriteElement
					dims = (64.0, 602.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (142.6985, 275.9178)
					z_priority = 2.0
					rot_angle = -3.0
					rgba = [
						255
						255
						255
						200
					]
				}
			}
			{
				props = {
					texture = song_summary_lightning
					flip_v = true
					local_id = song_summary_lightning
					type = SpriteElement
					dims = (64.0, 480.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (914.6882, 229.8036)
					z_priority = 2.0
					rot_angle = 3.0
					rgba = [
						255
						255
						255
						200
					]
				}
			}
			{
				props = {
					texture = song_summary_skull
					local_id = song_summary_skull
					type = SpriteElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (236.6354, 523.56964)
					z_priority = 2.0
					rgba = [
						255
						255
						255
						200
					]
				}
			}
			{
				props = {
					texture = song_summary_skull
					local_id = song_summary_skull
					type = SpriteElement
					dims = (120.0, 120.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (815.6275, 501.3665)
					z_priority = 2.0
					rot_angle = -15.999997
					rgba = [
						255
						255
						255
						200
					]
				}
			}
			{
				props = {
					texture = song_summary_skull
					flip_v = true
					local_id = song_summary_skull
					type = SpriteElement
					dims = (70.0, 70.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (899.31665, 537.2332)
					z_priority = 2.0
					rot_angle = 20.0
					rgba = [
						255
						255
						255
						200
					]
				}
			}
			{
				props = {
					local_id = my_menu
					type = MenuElement
					dims = (100.0, 100.0)
					just = [
						-1.0
						-1.0
					]
					pos = (278.73303, 330.76932)
					z_priority = 1.0
					rot_angle = -6.0
					internal_just = [
						0.0
						0.0
					]
					fit_major = `expand if content larger`
					fit_minor = `keep dims`
					scale_mode = proportional
				}
			}
		]
	}
}
uidesc_song_summary_1p_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
