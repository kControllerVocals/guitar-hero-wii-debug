uidesc_song_summary_2p = {
	DescVersion = 5
	name = uidesc_song_summary_2p
	rect = [
		0.18145801
		-0.146301
		1280.0
		764.0865
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = song_summary_2p_container
				}
				{
					index = 12
					validateLocalID = collumns_container
					includeParentOwned = false
				}
			]
			name = alias_collumns_container
		}
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = song_summary_2p_container
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (100.0, 101.45433)
		}
		children = [
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
					pos = (540.18146, 258.45428)
					z_priority = 1.0
				}
			}
			{
				props = {
					texture = song_summary_rip02
					local_id = song_summary_rip02
					type = SpriteElement
					dims = (45.0, 720.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (542.708, 258.39938)
					z_priority = 2.0
				}
			}
			{
				props = {
					local_id = boxes_p1
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (211.01617, 101.70792)
					z_priority = 4.0
				}
				children = [
					{
						props = {
							texture = song_summary_line
							local_id = song_summary_line
							type = SpriteElement
							dims = (240.0, 16.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (121.9513, -15.731031)
							z_priority = 3.0
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
							texture = song_summary_box
							local_id = song_summary_box
							type = SpriteElement
							dims = (242.0, 52.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (125.61911, 100.460266)
							z_priority = 3.0
							rgba = [
								255
								255
								255
								175
							]
						}
					}
					{
						props = {
							texture = song_summary_box_score
							local_id = song_summary_box_score
							type = SpriteElement
							dims = (256.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (149.5303, 154.11444)
							z_priority = 5.0
							rgba = [
								255
								255
								255
								180
							]
						}
					}
					{
						props = {
							texture = song_summary_bigbox
							local_id = song_summary_bigbox
							type = SpriteElement
							dims = (142.0, 120.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (110.5397, 282.79416)
							z_priority = 5.0
							rgba = [
								255
								255
								255
								200
							]
						}
					}
				]
			}
			{
				props = {
					local_id = boxes_p2
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (649.9572, 101.70798)
					z_priority = 4.0
				}
				children = [
					{
						props = {
							texture = song_summary_line
							local_id = song_summary_line
							type = SpriteElement
							dims = (240.0, 16.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (130.4908, -14.43898)
							z_priority = 3.0
							rot_angle = 2.0
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
							texture = song_summary_box
							local_id = song_summary_box
							type = SpriteElement
							dims = (242.0, 52.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (93.168175, 96.752304)
							z_priority = 3.0
							rot_angle = 180.0
							rgba = [
								255
								255
								255
								175
							]
						}
					}
					{
						props = {
							texture = song_summary_box_score
							local_id = song_summary_box_score
							type = SpriteElement
							dims = (256.0, 64.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (65.84117, 138.45079)
							z_priority = 5.0
							rot_angle = 181.0
							rgba = [
								255
								255
								255
								180
							]
						}
					}
					{
						props = {
							texture = song_summary_bigbox
							local_id = song_summary_bigbox
							type = SpriteElement
							dims = (150.0, 120.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (111.5397, 281.79416)
							z_priority = 5.0
							rot_angle = 180.0
							rgba = [
								255
								255
								255
								200
							]
						}
					}
				]
			}
			{
				props = {
					texture = song_summary_lightning
					local_id = song_summary_lightning
					type = SpriteElement
					dims = (64.0, 512.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (151.75749, 242.3203)
					z_priority = 4.0
					rot_angle = -4.0
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
					dims = (76.0, 76.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (184.4577, 536.2939)
					z_priority = 4.0
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
					flip_h = false
					flip_v = true
					local_id = song_summary_lightning
					type = SpriteElement
					dims = (64.0, 520.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (474.93683, 237.2526)
					z_priority = 4.0
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
					pos = (457.72842, 534.58594)
					z_priority = 4.0
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
					dims = (64.0, 512.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (612.9017, 269.64734)
					z_priority = 4.0
					rot_angle = -4.0
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
					flip_h = false
					flip_v = true
					local_id = song_summary_lightning
					type = SpriteElement
					dims = (64.0, 500.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (918.00165, 244.08432)
					z_priority = 8.0
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
					dims = (76.0, 76.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (604.61145, 548.24945)
					z_priority = 4.0
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
					dims = (80.0, 80.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (929.12036, 534.5861)
					z_priority = 4.0
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
					local_id = collumns_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (100.0, 100.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							local_id = song_summary_2p_collumn_P1
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (346.0708, 704.68066)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (19.249004, -93.4486)
							z_priority = 4.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							desc = 'song_summary_4p_collumn'
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
							local_id = song_summary_2p_collumn_P2
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (346.0708, 704.68066)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (461.59378, -92.19487)
							z_priority = 4.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							desc = 'song_summary_4p_collumn'
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
				]
			}
		]
	}
}
uidesc_song_summary_2p_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
