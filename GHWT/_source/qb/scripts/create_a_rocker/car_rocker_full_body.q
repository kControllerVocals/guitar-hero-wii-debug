CAS_Full_Body = [
	{
		desc_id = ZakkWylde
		frontend_desc = qs("\LZakkWylde")
		mesh = 'models/CAR/Male/ZakkWylde.skin'
		pak = 'pak/car/characters/Zakk_Wylde.pak'
		skeleton = GH_Rocker_Male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		pointing_anim_set = zakk_pointing_anims
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			CAS_Intro_Anim = CAS_Male_Intro_Anim
			CAS_Win_Anim = CAS_Male_Win_Anim
			CAS_Lose_Anim = CAS_Male_Lose_Anim
		}
	}
	{
		desc_id = TedNugent
		frontend_desc = qs("\LTed Nugent")
		mesh = 'models/car/talent/TedNugent.skin'
		pak = 'pak/car/characters/TedNugent.pak'
		skeleton = GH_Rocker_Male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		pointing_anim_set = ted_pointing_anims
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			CAS_Intro_Anim = CAS_Male_Intro_Anim
			CAS_Win_Anim = CAS_Male_Win_Anim
			CAS_Lose_Anim = CAS_Male_Lose_Anim
		}
	}
	{
		desc_id = Ozzy
		frontend_desc = qs("\LOzzy")
		mesh = 'models/car/talent/Ozzy.skin'
		pak = 'pak/car/characters/Ozzy.pak'
		skeleton = gh_rocker_male_ozzy
		skeleton_path = 'skeletons/GH_Rocker_Male_Ozzy.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		pointing_anim_set = ozzy_pointing_anims
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			CAS_Intro_Anim = CAS_Male_Intro_Anim
			CAS_Win_Anim = CAS_Male_Win_Anim
			CAS_Lose_Anim = CAS_Male_Lose_Anim
		}
	}
	{
		desc_id = Billy
		frontend_desc = qs("\LBILLY")
		mesh = 'models/car/Talent/BILLY.skin'
		pak = 'pak/car/characters/Billy.pak'
		skeleton = GH_Rocker_Male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			CAS_Intro_Anim = CAS_Male_Intro_Anim
			CAS_Win_Anim = CAS_Male_Win_Anim
			CAS_Lose_Anim = CAS_Male_Lose_Anim
		}
	}
	{
		desc_id = travis
		frontend_desc = qs("\LTravis")
		mesh = 'models/car/male/TravisBarker.skin'
		pak = 'pak/car/characters/TravisBarker.pak'
		skeleton = GH_Rocker_Male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		pointing_anim_set = travis_pointing_anims
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			CAS_Intro_Anim = CAS_Male_Intro_Anim
			CAS_Win_Anim = CAS_Male_Win_Anim
			CAS_Lose_Anim = CAS_Male_Lose_Anim
		}
	}
	{
		desc_id = Sting
		frontend_desc = qs("\LSting")
		mesh = 'models/car/talent/Sting.skin'
		pak = 'pak/car/characters/Sting.pak'
		shadow_pak = 'Pak\\models\\shadows\\TravisBarker_shadow.pak'
		shadow_models = [
			'TravisBarker_Shadow_Asset'
		]
		skeleton = GH_Rocker_Male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		pointing_anim_set = Sting_pointing_anims
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			CAS_Intro_Anim = CAS_Male_Intro_Anim
			CAS_Win_Anim = CAS_Male_Win_Anim
			CAS_Lose_Anim = CAS_Male_Lose_Anim
		}
	}
	{
		desc_id = skeleton
		frontend_desc = qs("\LSkeleton")
		mesh = 'models/car/talent/Skeleton.skin'
		pak = 'pak/car/characters/Skeleton.pak'
		shadow_pak = 'Pak\\models\\shadows\\Ozzy_shadow.pak'
		shadow_models = [
			'Ozzy_Shadow_Asset'
		]
		skeleton = GH_Rocker_Male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			CAS_Intro_Anim = CAS_Male_Intro_Anim
			CAS_Win_Anim = CAS_Male_Win_Anim
			CAS_Lose_Anim = CAS_Male_Lose_Anim
		}
	}
	{
		desc_id = Hayley
		frontend_desc = qs("\LHayley")
		mesh = 'models/car/talent/HayleyWilliams.skin'
		pak = 'pak/car/characters/HayleyWilliams.pak'
		skeleton = GH_Rocker_Female
		skeleton_path = 'skeletons/GH_Rocker_Female.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		pointing_anim_set = Haley_pointing_anims
		is_female = 1
		anim_struct = car_female_anim_struct
		body_specific_parts = {
			CAS_Intro_Anim = CAS_Female_Intro_Anim
			CAS_Win_Anim = CAS_Female_Win_Anim
			CAS_Lose_Anim = CAS_Female_Lose_Anim
		}
	}
	{
		desc_id = Jimi
		frontend_desc = qs("\LJimi")
		mesh = 'models/car/talent/JIMI.skin'
		pak = 'pak/car/characters/JIMI.pak'
		skeleton = GH_Rocker_Male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			CAS_Intro_Anim = CAS_Male_Intro_Anim
			CAS_Win_Anim = CAS_Male_Win_Anim
			CAS_Lose_Anim = CAS_Male_Lose_Anim
		}
	}
	{
		desc_id = Metalhead
		frontend_desc = qs(0x6fae039b)
		mesh = 'models/car/talent/metalhead.skin'
		pak = 'pak/car/characters/metalhead.pak'
		shadow_pak = 'Pak\\models\\shadows\\male_shadow.pak'
		shadow_models = [
			'male_shadow_asset'
		]
		skeleton = GH_Rocker_Male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		is_female = 0
		anim_struct = car_male_anim_struct
	}
	{
		desc_id = Rockbot
		frontend_desc = qs("\LRockbot")
		mesh = 'models/car/talent/RockBot.skin'
		pak = 'pak/car/characters/RockBot.pak'
		shadow_pak = 'Pak\\models\\shadows\\male_shadow.pak'
		shadow_models = [
			'male_shadow_asset'
		]
		skeleton = GH_Rocker_Male
		skeleton_path = 'skeletons/GH_Rocker_Male.ske'
		ik_params = Hero_Ik_params
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		is_female = 0
		anim_struct = car_male_anim_struct
		body_specific_parts = {
			CAS_Intro_Anim = CAS_Male_Intro_Anim
			CAS_Win_Anim = CAS_Male_Win_Anim
			CAS_Lose_Anim = CAS_Male_Lose_Anim
		}
	}
]
