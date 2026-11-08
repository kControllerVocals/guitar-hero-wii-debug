cas_reskin_materials = [
	CAR_female_head
	CAR_Female_Mouth
	CAR_Female_Eye
	CAR_Female_Eyebrows
	CAR_Female_Eyelashes
	CAR_Female_EyeShell
	CAR_Female_Lips
	CAR_Female_BODY
	CAR_Male_Head
	CAR_Male_Mouth
	CAR_Male_Eye
	CAR_Male_Eyebrows
	CAR_Male_Eyelashes
	CAR_Male_Shell
	CAR_Male_Body
]
ps2_colorable_skin_materials = [
	{
		car_base_mesh_torso
		0
	}
	{
		car_base_mesh_arml
		0
	}
	{
		car_base_mesh_legs
		0
	}
	{
		car_base_mesh_hands
		0
	}
	{
		car_base_mesh_armr
		0
	}
	{
		car_base_mesh_head1
		0
	}
	{
		car_base_mesh_head2
		0
	}
	{
		car_base_mesh_lips
		0
	}
]
cas_create_a_rocker_female = {
	skeleton = GH_Rocker_Female
	skeleton_path = 'skeletons/GH_Rocker_Female.ske'
	ik_params = Hero_Ik_params
	ik_params_guitar = Hero_Ik_params
	ik_params_drum = CAR_IK_Params
	ik_params_vocals = CAR_IK_Params
	ik_params_frontend = CAR_IK_Params
	is_female = 1
	anim_struct = car_female_anim_struct
	deform_bones = CAR_Bones_Female_Face
	deform_main_skeleton
	body_specific_parts = {
		CAS_Base_Face = CAS_Female_Base_Face
		CAS_Base_Arms = CAS_Female_Base_Arms
		CAS_Base_Hands = CAS_Female_Base_Hands
		CAS_Base_Legs = CAS_Female_Base_Legs
		CAS_Base_Shoes = CAS_Female_Base_Shoes
		CAS_Base_Torso = CAS_Female_Base_Torso
		CAS_Hair = CAS_Female_Hair
		CAS_Hat_Hair = CAS_Female_Hat_Hair
		CAS_Hat = CAS_Female_Hat
		CAS_Torso = CAS_Female_Torso
		CAS_Legs = CAS_Female_Legs
		CAS_Shoes = CAS_Female_Shoes
		CAS_Acc_Left = CAS_Female_Acc_Left
		CAS_Acc_Right = CAS_Female_Acc_Right
		CAS_Acc_Face = CAS_Female_Acc_Face
		CAS_Acc_Ears = CAS_Female_Acc_Ears
		CAS_Age = CAS_Female_Age
		CAS_Intro_Anim = CAS_Female_Intro_Anim
		CAS_Win_Anim = CAS_Female_Win_Anim
		CAS_Lose_Anim = CAS_Female_Lose_Anim
	}
}
cas_create_a_rocker_male = {
	skeleton = GH_Rocker_Male
	skeleton_path = 'skeletons/GH_Rocker_Male.ske'
	ik_params = Hero_Ik_params
	ik_params_guitar = Hero_Ik_params
	ik_params_drum = CAR_IK_Params
	ik_params_vocals = CAR_IK_Params
	ik_params_frontend = CAR_IK_Params
	is_female = 0
	anim_struct = car_male_anim_struct
	deform_bones = CAR_Bones_Male_Face
	deform_main_skeleton
	body_specific_parts = {
		CAS_Hair = CAS_Male_Hair
		CAS_Hat_Hair = CAS_Male_Hat_Hair
		CAS_Hat = CAS_Male_Hat
		CAS_Facial_Hair = CAS_Male_Facial_Hair
		CAS_Base_Face = CAS_Male_Base_Face
		CAS_Base_Arms = CAS_Male_Base_Arms
		CAS_Base_Hands = CAS_Male_Base_Hands
		CAS_Base_Legs = CAS_Male_Base_Legs
		CAS_Base_Shoes = CAS_Male_Base_Shoes
		CAS_Base_Torso = CAS_Male_Base_Torso
		CAS_Torso = CAS_Male_Torso
		CAS_Legs = CAS_Male_Legs
		CAS_Socks = CAS_Male_Socks
		CAS_Shoes = CAS_Male_Shoes
		CAS_Acc_Left = CAS_Male_Acc_Left
		CAS_Acc_Right = CAS_Male_Acc_Right
		CAS_Acc_Face = CAS_Male_Acc_Face
		CAS_Acc_Ears = CAS_Male_Acc_Ears
		CAS_Age = CAS_Male_Age
		CAS_Intro_Anim = CAS_Male_Intro_Anim
		CAS_Win_Anim = CAS_Male_Win_Anim
		CAS_Lose_Anim = CAS_Male_Lose_Anim
	}
}
CAS_Body = [
	{
		$cas_create_a_rocker_female
		desc_id = GH4_CAR_Female
		frontend_desc = qs("FEMALE")
		icon = icon_gender_Female
	}
	{
		$cas_create_a_rocker_male
		desc_id = GH4_CAR_Male
		frontend_desc = qs("MALE")
		icon = icon_gender_Male
	}
	{
		desc_id = NoBody
		hidden
		skeleton = GH_Rocker_Female
		skeleton_path = 'skeletons/GH_Rocker_Female.ske'
		ragdoll = ragdoll_Rocker_Female
		ragdoll_path = 'Ragdolls/CAR/Female/GH_Rocker_Female_Ragdoll.rag'
		accessory_bones = Rocker_accessory_bones
		ragdoll_collision_group = RagdollCollisionGroups_Rocker_Female
		ik_params_guitar = Hero_Ik_params
		ik_params_drum = drummer_IK_params
		ik_params_vocals = singer_IK_Params
		ik_params_frontend = CAR_IK_Params
		is_female = 1
		anim_struct = car_female_anim_struct
		body_specific_parts = {
			CAS_Intro_Anim = CAS_Female_Intro_Anim
			CAS_Win_Anim = CAS_Female_Win_Anim
			CAS_Lose_Anim = CAS_Female_Lose_Anim
		}
	}
	{
		$cas_create_a_rocker_female
		desc_id = GH4_CAR_Pandora
		hidden
		replace = 'tex/models/Characters/car/female/car_female_head_d.dds'
		with = 'tex/models/Characters/car/female/car_female_headB_d.dds'
	}
	{
		$cas_create_a_rocker_female
		desc_id = GH4_CAR_Casey
		hidden
		replace = 'tex\\models\\Characters\\CAR\\female\\CAR_female_body_tat_o_dnc.dds'
		with = 'tex\\models\\Characters\\CAR\\female\\CAR_Casey_TorsoTattoo_D_dnc.dds'
	}
	{
		$cas_create_a_rocker_female
		desc_id = GH4_CAR_Midori
		hidden
		replace = 'tex/models/Characters/car/female/car_female_head_d.dds'
		with = 'tex/models/Characters/car/female/car_female_head_Midori_d.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = GH4_CAR_Izzy
		hidden
		replace = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with = 'tex/models/Characters/car/male/car_male_headB_d.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = GH4_CAR_Lars
		hidden
		replace = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with = 'tex/models/Characters/car/male/car_male_headC_d.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_Body_N.dds'
		with2 = 'tex/models/Characters/car/male/car_male_BodyB_N.dds'
		replace3 = 'tex/models/Characters/car/male/car_male_Head_N.dds'
		with3 = 'tex/models/Characters/car/male/car_male_HeadB_N.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = GH4_CAR_Eddie
		hidden
		replace = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
		with = 'tex\\models\\Characters\\CAR\\Male\\CAR_male_EddieTatR_D_dnc.dds'
		replace2 = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
		with2 = 'tex\\models\\Characters\\CAR\\Male\\CAR_male_EddieTatL_D_dnc.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = GH4_CAR_Johnny
		hidden
		replace = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARMR_tat_O_dnc.dds'
		with = 'tex\\models\\Characters\\CAR\\Male\\CAR_male_JohnnyTatR_D_dnc.dds'
		replace2 = 'tex\\models\\Characters\\CAR\\female\\CAR_female_ARML_tat_O_dnc.dds'
		with2 = 'tex\\models\\Characters\\CAR\\Male\\CAR_male_JohnnyTatL_D_dnc.dds'
		replace3 = 'tex\\models\\Characters\\CAR\\female\\CAR_female_body_tat_o_dnc.dds'
		with3 = 'tex\\models\\Characters\\CAR\\Male\\CAR_male_JohnnyTatChest_D_dnc.dds'
		replace4 = 'tex/models/Characters/car/male/car_male_head_d.dds'
		with4 = 'tex/models/Characters/car/male/car_male_head_johnny_d.dds'
		replace5 = 'tex/models/Characters/car/male/car_male_head_n.dds'
		with5 = 'tex/models/Characters/car/male/car_male_head_johnny_n.dds'
	}
	{
		$cas_create_a_rocker_female
		desc_id = GH4_CAR_Judy
		hidden
		replace = 'tex/models/Characters/car/female/car_female_head_d.dds'
		with = 'tex/models/Characters/car/female/car_female_head_Judy_d.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = `BestBuy Kid`
		hidden
		replace = 'tex/models/Characters/car/male/car_male_head_N.dds'
		with = 'tex\\models\\Characters\\CAR\\Male\\car_male_BestBuy_N.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_head_D.dds'
		with2 = 'tex/models/Characters/car/male/car_male_BestBuy_D.dds'
		replace3 = 'tex/models/Characters/car/male/car_male_brow_D.dds'
		with3 = 'tex/models/Characters/car/male/car_male_brow_D2.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = AaronSteele
		hidden
		replace = 'tex/models/Characters/car/male/car_male_head_N.dds'
		with = 'tex\\models\\Characters\\CAR\\Male\\car_male_Aaron_N.dds'
	}
	{
		$cas_create_a_rocker_male
		desc_id = GH4_CAR_Winner
		hidden
		replace = 'tex/models/Characters/car/male/car_male_HEAD_D.dds'
		with = 'tex/models/Characters/car/male/car_male_HEADCW_D.dds'
		replace2 = 'tex/models/Characters/car/male/car_male_head_n.dds'
		with2 = 'tex/models/Characters/car/male/car_male_headCW_n.dds'
	}
	{
		desc_id = gh4_mii
		frontend_desc = qs(0x0fea2f89)
		skeleton = gh4_mii
		ragdoll = none
		ragdoll_collision_group = none
		ik_params = Hero_Ik_params
		skeleton = gh4_mii
		skeleton_path = 'skeletons/GH4_Mii.ske'
		ragdoll = none
		ragdoll_path = ''
		accessory_bones = none
		ragdoll_collision_group = none
		ik_params_guitar = mii_IK_Params
		ik_params_drum = CAR_IK_Params
		ik_params_vocals = CAR_IK_Params
		ik_params_frontend = CAR_IK_Params
		anim_struct = mii_anim_struct
		deform_bones = none
		hidden
	}
	{
		desc_id = gh4_mii_drummer
		frontend_desc = qs(0x8fe042e4)
		skeleton = gh4_mii_drummer
		ragdoll = none
		ragdoll_collision_group = none
		ik_params = Hero_Ik_params
		skeleton = gh4_mii_drummer
		skeleton_path = 'skeletons/GH4_Mii_Drummer.ske'
		ragdoll = none
		ragdoll_path = ''
		accessory_bones = none
		ragdoll_collision_group = none
		ik_params_guitar = empty_ik_params
		ik_params_drum = empty_ik_params
		ik_params_vocals = empty_ik_params
		ik_params_frontend = empty_ik_params
		anim_struct = mii_drummer_anim_struct
		deform_bones = none
		hidden
	}
]
cas_physique = [
	{
		desc_id = FemalePhysique
		deform_bones = CAR_Bones_Female_Body
		deform_main_skeleton
		preset_builds = [
			{
				additional_bone_transforms = [
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.0, -0.1, -0.025)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, -0.07, -0.07)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
						translation = {
							value = (0.0, 0.01, 0.0)
						}
					}
					{
						bone = Bone_Collar_R
						translation = {
							value = (0.0, 0.01, 0.0)
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.0, -0.15, -0.05)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, -0.08, -0.08)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (-0.01, -0.01, -0.01)
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, 0.015, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.0, -0.05, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Head
						scaling = {
							value = (0.06, 0.06, 0.06)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (-0.005, -0.005, -0.005)
						}
					}
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.0, 0.0, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.35000002, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.25, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Head
						scaling = {
							value = (0.06, 0.06, 0.06)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, 0.25, 0.25)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.05, 0.3, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.5, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.4, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.0, 0.0, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.05)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.0, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.05)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Head
						scaling = {
							value = (0.06, 0.06, 0.06)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.2, 0.2, 0.2)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.2, 0.2, 0.2)
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, 0.35000002, 0.35000002)
							no_propagate
						}
					}
				]
			}
		]
	}
	{
		desc_id = MalePhysique
		deform_bones = CAR_Bones_Male_Body
		deform_main_skeleton
		preset_builds = [
			{
				additional_bone_transforms = [
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.0, 0.0)
							stop_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.0, 0.0)
							stop_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.0, 0.1, 0.2)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.0, 0.1, 0.2)
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.03, -0.03)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.03, -0.03)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Head
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (-0.0, -0.05, -0.05)
							stop_propagate
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (-0.0, -0.15, -0.125)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.01, 0.01, 0.01)
							stop_propagate
						}
					}
					{
						bone = Bone_Hand_Thumb_Base_R
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Index_Base_R
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Middle_Base_R
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Ring_Base_R
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Pinkey_Base_R
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.01, 0.01, 0.01)
							stop_propagate
						}
					}
					{
						bone = Bone_Hand_Thumb_Base_L
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Index_Base_L
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Middle_Base_L
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Ring_Base_L
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Hand_Pinkey_Base_L
						scaling = {
							value = (0.0, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.15, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.15, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Chest
						scaling = {
							value = (0.075, 0.075, 0.075)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.2, 0.1, 0.1)
							no_propagate
						}
						translation = {
							value = (0.0, -0.015, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.2, 0.1, 0.1)
							no_propagate
						}
						translation = {
							value = (0.0, -0.015, 0.0)
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.2, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Knee_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (-0.2, -0.2, -0.2)
							no_propagate
						}
						translation = {
							value = (-0.01, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (-0.005, -0.005, -0.005)
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, 0.1, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.1, 0.1, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.1, 0.2, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Head
						scaling = {
							value = (0.05, 0.05, 0.05)
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.1, 0.3, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						rotation = {
							value = (0.0, -6.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						rotation = {
							value = (0.0, 6.0, 0.0)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.0, 0.25, 0.25)
						}
					}
					{
						bone = Bone_Hand_Thumb_Base_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Index_Base_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Middle_Base_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Ring_Base_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Pinkey_Base_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.3, -0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.0, 0.25, 0.25)
						}
					}
					{
						bone = Bone_Hand_Thumb_Base_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Index_Base_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Middle_Base_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Ring_Base_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Hand_Pinkey_Base_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Neck
						scaling = {
							value = (0.25, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.1, 0.4, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.1, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.1, 0.25, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.07, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.07, 0.0)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.65000004, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.5, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.5, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.0, 0.3, 0.3)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.13, 0.0, 0.3)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.13, 0.0, 0.3)
						}
					}
				]
			}
			{
				random_weight = 0.0
				additional_bone_transforms = [
					{
						bone = Bone_Head
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Neck
						scaling = {
							value = (0.3, 0.3, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.0, 0.65000004, 0.4)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.05, 0.0)
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 1.0, 0.65000004)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.8, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 1.0, 0.65000004)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.8, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.7, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.7, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.1, 0.1, 0.1)
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.45000002, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (-0.1, -0.1, -0.1)
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (-0.1, -0.1, -0.1)
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.6, 0.75)
							no_propagate
						}
						translation = {
							value = (-0.0, 0.0, 0.0)
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.7, 0.75)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
				]
			}
		]
	}
]
