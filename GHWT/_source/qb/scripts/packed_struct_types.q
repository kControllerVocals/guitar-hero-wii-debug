
script init_packed_structs \{globaltag_sets = 1}
	GetArraySize ($gh_songlist)
	num_songs = (<array_size> + 256)
	num_parts = 5
	num_diffs = 5
	num_completetags = 64
	num_unlockedtags = (<num_songs> * <num_parts> * <num_diffs> * 2)
	num_se_gig_tags = 128
	num_gigtags = 1200
	num_charactertags = 16
	num_songtags_scores = (<num_songs> * <num_parts> * <num_diffs>)
	num_songtags_lean = (<num_songs>)
	GetArraySize ($Preset_Musician_Profiles_Modifiable)
	num_preset_profiles = <array_size>
	packed_compression = 1.0
	PushMemProfile \{'packedstructs'}
	SetupPackedStructTypes {
		types =
		[
			{
				name = createarocker
				pool_size = (<globaltag_sets> * ($max_num_create_a_rockers))
				buffer_size = ((5000) * <packed_compression>)
			}
			{
				name = presetcars
				pool_size = (<globaltag_sets> * <num_preset_profiles>)
				buffer_size = (5000 * <packed_compression>)
			}
			{
				name = logos
				pool_size = (<globaltag_sets> * ($max_num_logo_saves))
				buffer_size = (10 * ((2 * 4) + (2 * 32) + (8 * 4) + (4 * 4) + 32) * <packed_compression>)
			}
			{
				name = guitars
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = (358 * <packed_compression>)
			}
			{
				name = basses
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = (358 * <packed_compression>)
			}
			{
				name = Drums
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = (134 * <packed_compression>)
			}
			{
				name = Vocals
				pool_size = (<globaltag_sets> * ($max_num_instrument_saves))
				buffer_size = (52 * <packed_compression>)
			}
			{
				name = completetags
				pool_size = (<num_completetags> * <globaltag_sets>)
				fields =
				[
					{
						name = complete
						type = bool
					}
				]
			}
			{
				name = unlockedtags
				pool_size = (<num_unlockedtags> * <globaltag_sets>)
				fields =
				[
					{
						name = unlocked
						type = bool
					}
				]
			}
			{
				name = gigtags
				pool_size = (<num_gigtags> * <globaltag_sets>)
				fields =
				[
					{
						name = cash_earned
						type = int
						low_limit = 0
						high_limit = 1500000
					}
					{
						name = unlocked
						type = bool
					}
					{
						name = first_time_unlocked
						type = bool
					}
					{
						name = completed
						type = int
						low_limit = -1
						high_limit = 3
						default_value = 0
					}
					{
						name = started
						type = bool
					}
					{
						name = encore_unlocked
						type = bool
					}
					{
						name = boss_unlocked
						type = bool
					}
					{
						name = gig_progress
						type = int
						low_limit = 0
						high_limit = 10
						default_value = 0
					}
				]
			}
			{
				name = charactertags
				pool_size = (<num_charactertags> * <globaltag_sets>)
				fields =
				[
					{
						name = unlocked
						type = bool
					}
				]
			}
			{
				name = songtags_scores
				pool_size = (<num_songtags_scores> * <globaltag_sets>)
				fields =
				[
					{
						name = names
						type = wstring
						max_length = ($tr_max_band_characters)
						array_size = 3
					}
					{
						name = scores
						type = int
						low_limit = 0
						high_limit = 6000000
						array_size = 3
					}
					{
						name = tr_stars
						type = int
						low_limit = 0
						high_limit = 5
						array_size = 3
					}
					{
						name = bestscore
						type = int
						low_limit = 0
						high_limit = 6000000
					}
					{
						name = beststars
						type = int
						low_limit = 0
						high_limit = 5
					}
					{
						name = tr_percent100
						type = bool
					}
					{
						name = stars
						type = int
						low_limit = 0
						high_limit = 5
					}
					{
						name = score
						type = int
						low_limit = 0
						high_limit = 6000000
					}
					{
						name = percent100
						type = bool
					}
					{
						name = unlocked
						type = bool
					}
				]
			}
			{
				name = songtags_lean
				pool_size = (<num_songtags_lean> * <globaltag_sets>)
				fields =
				[
					{
						name = unlocked
						type = bool
					}
					{
						name = available_on_other_client
						type = int
						low_limit = 0
						high_limit = 8
					}
				]
			}
		]
	}
	PopMemProfile
endscript
