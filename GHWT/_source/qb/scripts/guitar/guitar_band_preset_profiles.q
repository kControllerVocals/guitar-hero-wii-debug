preset_musician_instrument_hack = {
	CAS_Guitar_Body = {
		desc_id = guitar_body01
	}
	CAS_Guitar_Neck = {
		desc_id = guitar_neck_01
	}
	CAS_Guitar_Head = {
		desc_id = Guitar_Head_01
	}
	CAS_Guitar_Pickguards = {
		desc_id = guitar_pickg_body01_01
	}
	CAS_Guitar_Pickups = {
		desc_id = guitar_Pickups01a_03
	}
	CAS_Guitar_Knobs = {
		desc_id = guitar_Knobs_body01_02_02
	}
	CAS_Guitar_Bridges = {
		desc_id = guitar_bridges_01
	}
	CAS_Bass_Body = {
		desc_id = bass_Body_arcos_01
	}
	CAS_Bass_Neck = {
		desc_id = bass_Neck_01
	}
	CAS_Bass_Head = {
		desc_id = bass_Head_01
	}
	CAS_Bass_Pickguards = {
		desc_id = bass_PickG_01
	}
	CAS_Bass_Pickups = {
		desc_id = bass_pickups_01
	}
	CAS_Bass_Knobs = {
		desc_id = CAB_Knob_Unos01
	}
	CAS_Bass_Bridges = {
		desc_id = bass_bridges_01
	}
	CAS_Mic = {
		desc_id = mic_standard
	}
	CAS_Mic_Stand = {
		desc_id = mic_stand_female
	}
	CAS_Drums = {
		desc_id = singlebasskit
	}
}
preset_male_base_parts = {
	CAS_Male_Base_Torso = {
		desc_id = car_male_torso
	}
}
preset_female_base_parts = {
	CAS_Female_Base_Torso = {
		desc_id = car_female_torso
	}
}
worst_male_appearance_hack = {
	cas_physique = {
		desc_id = MalePhysique
		bones = {
			Height = 1.0
			Physique = 1.0
		}
	}
	CAS_Highway = {
		desc_id = highway
	}
	CAS_Gems = {
		desc_id = gem_set_01
	}
}
worst_female_appearance_hack = {
	cas_physique = {
		desc_id = FemalePhysique
		bones = {
			Height = 1.0
			Physique = 1.0
			Chest = 1.0
		}
	}
	CAS_Highway = {
		desc_id = AxelHighway
	}
	CAS_Gems = {
		desc_id = gem_set_01
	}
}
Preset_Musician_Profiles_Modifiable = [
	{
		name = axel
		fullname = qs("\LAxel Steel")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_axel
		blurb = qs("After attaining genuine superstar status, Axel retreated to hometown bonfire parties and barnyard jam sessions.")
		appearance = {
			genre = `Classic Rock`
			CAS_Body = {
				desc_id = GH4_CAR_Male
				random_weight = 1.5
			}
			cas_physique = {
				desc_id = MalePhysique
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
							value = (0.1, 0.4, 0.55)
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
							value = (0.0, -0.09, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
						translation = {
							value = (0.0, -0.09, 0.0)
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
			CAS_Male_Hair = {
				desc_id = M_Metl_Hair_Axel
			}
			CAS_Male_Facial_Hair = {
				desc_id = none
			}
			CAS_Male_Torso = {
				desc_id = m_metl_torso_axel2
			}
			CAS_Male_Legs = {
				desc_id = m_metl_legs_axel2
			}
			CAS_Male_Shoes = {
				desc_id = m_rock_shoe_canvas_d1
			}
			CAS_Male_Acc_Left = {
				desc_id = M_Punk_Acc_LLeather
			}
			CAS_Male_Acc_Right = {
				desc_id = M_Punk_Acc_RLeather
			}
			CAS_Male_Acc_Face = {
				desc_id = none
			}
			CAS_Male_Acc_Ears = {
				desc_id = none
			}
			CAS_Male_Intro_Anim = {
				desc_id = Intro_Pointing
			}
			CAS_Male_Win_Anim = {
				desc_id = Win_Kick
			}
			CAS_Male_Lose_Anim = {
				desc_id = Lose_AngryAtCrowd
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body04
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body04_04
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_ornate1
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_05
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock05_Dtl_06
				chosen_materials = {
					material1 = red_3
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = guitar_pickg_body04_01
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_05
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body04_04_04
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups01c_03
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body_hacken08_01
			}
			CAS_Bass_Finish = {
				desc_id = bass_finish_generic_white
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = CAB_Body_Bach_DTL_Pin
				chosen_materials = {
					material1 = yellow_5guitar
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_Neck_01
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_wedgeshigh
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_03
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_bh7a_white
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_pickg_hacken02
			}
			cas_bass_pickguard_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = yellow_4
				}
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_12
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridge_hack
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_hack01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_06
				chosen_materials = {
					material1 = yellow_orange_4
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_DS_64
			}
			CAS_Mic = {
				desc_id = mic_sixties
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_sixties
			}
			CAS_Male_Base_Face = {
				desc_id = m_head_axel
			}
		}
	}
	{
		name = Casey
		fullname = qs("\LCasey Lynch")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_casey
		blurb = qs("Finally embracing her feminine appeal, Casey has risen to the status of 'Goddess of Rock'.  When asked by a reporter if she had sold out, Casey replied with a roundhouse to the face.  'Don't worry, I'll pay the medical bill.'")
		appearance = {
			CAS_Body = {
				desc_id = GH4_CAR_Casey
			}
			cas_physique = {
				desc_id = FemalePhysique
			}
			CAS_Female_Hair = {
				desc_id = F_Metl_Hair_Ponytail
				chosen_materials = {
					material1 = yellow_4
				}
			}
			CAS_Female_Hat = {
				desc_id = none
			}
			CAS_Female_Facial_Hair = {
				desc_id = none
			}
			CAS_Female_Torso = {
				desc_id = f_rock_torso_jjacket
			}
			CAS_Female_Legs = {
				desc_id = f_rock_legs_leather
			}
			CAS_Female_Shoes = {
				desc_id = F_Rock_Shoes_Canvas
			}
			CAS_Female_Acc_Left = {
				desc_id = F_Rock_Acc_LStrap
			}
			CAS_Female_Acc_Right = {
				desc_id = F_Punk_Acc_RGlvwatch
			}
			CAS_Female_Acc_Face = {
				desc_id = none
			}
			CAS_Female_Acc_Ears = {
				desc_id = none
			}
			CAS_Female_Win_Anim = {
				desc_id = Win_Hype
			}
			CAS_Female_Lose_Anim = {
				desc_id = Lose_AngryAtCrowd
			}
			CAS_Female_Intro_Anim = {
				desc_id = Intro_Hype
			}
			CAS_Bass_Highway = {
				desc_id = CaseyHighway
			}
			CAS_Guitar_Highway = {
				desc_id = CaseyHighway
			}
			CAS_Drums_Highway = {
				desc_id = CaseyHighway
			}
			CAS_Female_Base_Face = {
				desc_id = f_head_casey
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body02
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = yellow_green_3guitar
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body02_06
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_01
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_vine
				chosen_materials = {
					material1 = blue_5
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_02
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = yellow_green_3guitar
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock02_Dtl_02
				chosen_materials = {
					material1 = yellow_green_1guitar
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_10
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body02_04_09
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups02_03
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body_pred
			}
			CAS_Bass_Finish = {
				desc_id = bass_finish_generic_white
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = gtr_detail_body16_05
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_03
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_birds
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_05
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_05
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Phunq05
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_30
				chosen_materials = {
					material1 = purple_blue_3
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_RM_02
				chosen_materials = {
					material1 = purple_blue_3
				}
			}
			CAS_Mic = {
				desc_id = mic_glam
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		name = Izzy
		fullname = qs("\LIzzy Sparks")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_izzy
		blurb = qs("Daughters, lock up your mothers... Sunset has not fallen upon the strip!  Izzy returns with the flair and the hair, and isn't stopping 'til your ears bleed pure rock.  Glam never tasted so good.")
		appearance = {
			CAS_Body = {
				desc_id = GH4_CAR_Izzy
			}
			cas_physique = {
				desc_id = MalePhysique
			}
			CAS_Male_Hair = {
				desc_id = M_Metl_Hair_MidHigh
				chosen_materials = {
					material1 = yellow_orange_3
				}
			}
			CAS_Male_Hat = {
				desc_id = none
			}
			CAS_Male_Facial_Hair = {
				desc_id = none
			}
			CAS_Male_Torso = {
				desc_id = M_Glam_Torso_Rags
				chosen_materials = {
					material1 = red_2
				}
			}
			CAS_Male_Legs = {
				desc_id = M_Glam_Legs_Stripes
				chosen_materials = {
					material1 = grey_4
					material2 = red_3
				}
			}
			CAS_Male_Shoes = {
				desc_id = m_glam_shoe_eightysixed
			}
			CAS_Male_Acc_Left = {
				desc_id = M_Goth_Acc_LStraps
			}
			CAS_Male_Acc_Right = {
				desc_id = M_Punk_Acc_RLeather
			}
			CAS_Male_Acc_Face = {
				desc_id = none
			}
			CAS_Male_Acc_Ears = {
				desc_id = none
			}
			CAS_Bass_Highway = {
				desc_id = IzzyHighway
			}
			CAS_Guitar_Highway = {
				desc_id = IzzyHighway
			}
			CAS_Drums_Highway = {
				desc_id = IzzyHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = Intro_Hype
			}
			CAS_Male_Win_Anim = {
				desc_id = Win_KungFu
			}
			CAS_Male_Lose_Anim = {
				desc_id = Lose_Tantrum
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body03
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = red_2
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body03_10
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_02
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_shards
				chosen_materials = {
					material1 = blue_5
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_10
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = red_2
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock10_DTL_05
				chosen_materials = {
					material1 = orange_2
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_10
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body03_03_10
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups03b_03
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body_pred
			}
			CAS_Bass_Finish = {
				desc_id = finish_generic_18b
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = GTR_Body_Style_Predikt_Ray2
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_02
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_lightning
				chosen_materials = {
					material1 = navy_1
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_flay_rev
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_01_maple_silverknob_white
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_flay_detail03
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_pickg_pred02
			}
			cas_bass_pickguard_finish = {
				desc_id = shell
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_12
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_phunq04
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_46
				chosen_materials = {
					material1 = red_4
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_ds_47
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Mic = {
				desc_id = mic_glam
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_glam
			}
			CAS_Male_Base_Face = {
				desc_id = m_head_izzy
			}
		}
	}
	{
		name = judy
		fullname = qs("\LJudy Nails")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_judy
		blurb = qs("After realizing that the majority of her fans were 14 year old boys, Judy dropped her label like a bad habit.  In her debut solo effort 'Punkagothic Rockabillica', Judy brings her own style.")
		appearance = {
			CAS_Body = {
				desc_id = GH4_CAR_Judy
			}
			cas_physique = {
				desc_id = FemalePhysique
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (-0.06, -0.06, -0.06)
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
							value = (0.11, 0.11, 0.11)
						}
					}
					{
						bone = Bone_Ankle_L
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Ankle_R
						scaling = {
							value = (0.2, 0.2, 0.2)
							no_propagate
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
			CAS_Female_Hair = {
				desc_id = F_Punk_Hair_Judy01
				chosen_materials = {
					material1 = red_1
					material2 = purple_blue_1
				}
			}
			CAS_Female_Torso = {
				desc_id = f_punk_torso_stripe
				chosen_materials = {
					material2 = grey_4
					material1 = grey_5
				}
			}
			CAS_Female_Legs = {
				desc_id = f_punk_legs_skirt
				chosen_materials = {
					material1 = red_2
					material2 = grey_5
				}
			}
			CAS_Female_Shoes = {
				desc_id = f_punk_shoe_army
				chosen_materials = {
					material1 = red_1
					material2 = grey_4
				}
			}
			CAS_Female_Acc_Left = {
				desc_id = f_rock_acc_lwatch
			}
			CAS_Female_Acc_Right = {
				desc_id = F_Punk_Acc_Rbands
			}
			CAS_Bass_Highway = {
				desc_id = JudyHighway
			}
			CAS_Guitar_Highway = {
				desc_id = JudyHighway
			}
			CAS_Drums_Highway = {
				desc_id = JudyHighway
			}
			CAS_Female_Win_Anim = {
				desc_id = Win_Hype
			}
			CAS_Female_Lose_Anim = {
				desc_id = Lose_AngryAtCrowd
			}
			CAS_Female_Intro_Anim = {
				desc_id = Intro_Hype
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body14
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = violet_3
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body14_03
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_stars
				chosen_materials = {
					material1 = blue_4
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_06
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = guitar_pickg_body14_02
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_10
				chosen_materials = {
					material1 = purple_blue_5
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body14_04_02
				chosen_materials = {
					material1 = violet_3
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups01b_02
				chosen_materials = {
					material1 = violet_1
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body_kelly
			}
			CAS_Bass_Finish = {
				desc_id = finish_generic_23b
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = CAB_Body_Kelly_DTL_Tri
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_02
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_fl_stars
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_guppy
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_maple_generic_white
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_guppy_detail01
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_11
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridge_mls
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_grmbl03
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = Drumshell_DS_33
			}
			CAS_Drum_Detail = {
				desc_id = none
			}
			CAS_Mic = {
				desc_id = mic_standard
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
			CAS_Female_Base_Face = {
				desc_id = f_head_judy
			}
		}
	}
	{
		name = Johnny
		fullname = qs("\LJohnny Napalm")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Johnny
		blurb = qs("'I love the smell of napalm in the morning.'  Whoever said that never met Johnny.  Up all night thrashing and partying, there is no sleeping for Johnny, just blacking out.  'I eat disco and $#!! emo.'")
		appearance = {
			genre = Punk
			CAS_Body = {
				desc_id = GH4_CAR_Johnny
			}
			cas_physique = {
				desc_id = MalePhysique
				additional_bone_transforms = [
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.2, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.2, -0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.1, -0.1)
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
			CAS_Male_Hair = {
				desc_id = M_Punk_Hair_LSpike
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			CAS_Male_Facial_Hair = {
				desc_id = none
			}
			CAS_Male_Torso = {
				desc_id = m_punk_torso_johnny1
			}
			CAS_Male_Legs = {
				desc_id = m_punk_legs_johnny1
			}
			CAS_Male_Shoes = {
				desc_id = M_Punk_Shoes_Johnny2
			}
			CAS_Bass_Highway = {
				desc_id = JohnnyHighway
			}
			CAS_Guitar_Highway = {
				desc_id = JohnnyHighway
			}
			CAS_Drums_Highway = {
				desc_id = JohnnyHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = Intro_Generic1
			}
			CAS_Male_Win_Anim = {
				desc_id = Win_Kick
			}
			CAS_Male_Lose_Anim = {
				desc_id = Lose_kick
			}
			CAS_Guitar_Body = {
				desc_id = Guitar_Body12
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body12_06
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_ironcross
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_12
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_06
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body12_04_05
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups01b_03
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body03
			}
			CAS_Bass_Finish = {
				desc_id = bass_finish_generic_white
				chosen_materials = {
					material1 = orange_1
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = CAB_Body_chndr_DTL_Trash
				chosen_materials = {
					material1 = green_4guitar
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_02
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_fl_stars
				chosen_materials = {
					material1 = green_1guitar
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_sixtease
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_sixtease_white
				chosen_materials = {
					material1 = green_1guitar
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_six_detail02
				chosen_materials = {
					material1 = orange_2
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_pickg_chndr04
			}
			cas_bass_pickguard_finish = {
				desc_id = shell
				chosen_materials = {
					material1 = blue_4
				}
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_12
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridge_hack
				chosen_materials = {
					material1 = green_4guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_chndr08
				chosen_materials = {
					material1 = green_2guitar
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_43
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_ds_04
				chosen_materials = {
					material1 = yellow_green_1guitar
				}
			}
			CAS_Mic = {
				desc_id = mic_punk
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_glam
			}
			CAS_Male_Base_Face = {
				desc_id = m_head_johnny
			}
		}
	}
	{
		name = Lars
		fullname = qs("\LLars Umlaut")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Lars
		blurb = qs("After an overwhelmingly warm debut a year ago, Lars needed time to cool off.  Ready the longboats and crank up the metal.  Lars is prepared to reverse the effects of global warming with his icy world tour.")
		appearance = {
			genre = `Black Metal`
			$preset_musician_instrument_hack
			CAS_Body = {
				desc_id = GH4_CAR_Lars
				set_materials = {
					skin = {
						diffuse = [
							249
							247
							247
						]
					}
				}
			}
			cas_physique = {
				desc_id = MalePhysique
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
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, 0.5, 0.65000004)
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
							value = (0.0, 0.45000002, 0.35000002)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, 0.45000002, 0.35000002)
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
							value = (0.0, 0.7, 0.75)
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
			CAS_Male_Hair = {
				desc_id = m_bmtl_hair_lars
			}
			CAS_Male_Hat = {
				desc_id = none
			}
			CAS_Male_Torso = {
				desc_id = m_bmtl_torso_lars
			}
			CAS_Male_Legs = {
				desc_id = m_bmtl_legs_lars
			}
			CAS_Male_Shoes = {
				desc_id = m_bmtl_shoes_lars
			}
			CAS_Male_Acc_Left = {
				desc_id = m_bmtl_acc_llars
			}
			CAS_Male_Acc_Right = {
				desc_id = M_Bmtl_Acc_RLars
			}
			CAS_Male_Acc_Face = {
				desc_id = none
			}
			CAS_Male_Acc_Ears = {
				desc_id = none
			}
			CAS_Bass_Highway = {
				desc_id = LarsHighway
			}
			CAS_Guitar_Highway = {
				desc_id = LarsHighway
			}
			CAS_Drums_Highway = {
				desc_id = LarsHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = Intro_Scary
			}
			CAS_Male_Win_Anim = {
				desc_id = Win_Scary
			}
			CAS_Male_Lose_Anim = {
				desc_id = Lose_AngryAtCrowd
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body07
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body07_01
				chosen_materials = {
					material1 = teal_4
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_skulls
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_09
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock09_DTL_05
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = guitar_pickg_body07_03
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body07_03_04
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups01b_03
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body_pred
			}
			CAS_Bass_Finish = {
				desc_id = finish_generic_05b
				chosen_materials = {
					material1 = teal_4
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = gtr_detail_body16_04
				chosen_materials = {
					material1 = teal_3
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_03
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_barbed
				chosen_materials = {
					material1 = teal_4
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_05
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_bh5a_white
				chosen_materials = {
					material1 = teal_3
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_head05_detail01
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_emg03
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Phunq05
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_48
				chosen_materials = {
					material1 = teal_3
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_DS_70
				chosen_materials = {
					material1 = teal_1
				}
			}
			CAS_Mic = {
				desc_id = mic_sixties
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
			CAS_Male_Base_Face = {
				desc_id = m_head_lars
			}
		}
	}
	{
		name = Midori
		fullname = qs("\LMidori")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Midori
		blurb = qs("Hailing from Japan, Midori is both sweet and sour.  Classically trained on violin and performing at the age of 3, Midori dropped the bow, grabbed the axe, and never looked back.  School's out forever!")
		appearance = {
			CAS_Body = {
				desc_id = GH4_CAR_Midori
			}
			cas_physique = {
				desc_id = FemalePhysique
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (-0.075, -0.075, -0.075)
						}
					}
					{
						bone = Bone_Head
						scaling = {
							value = (0.05, 0.05, 0.05)
						}
					}
				]
			}
			CAS_Female_Hair = {
				desc_id = F_Pop_Hair_Midori
				chosen_materials = {
					material1 = purple_blue_1
					material2 = red_1
				}
			}
			CAS_Female_Torso = {
				desc_id = F_Pop_Torso_Midori
				chosen_materials = {
					material1 = purple_blue_1
					material2 = violet_2
				}
			}
			CAS_Female_Legs = {
				desc_id = f_pop_legs_skirt
				chosen_materials = {
					material1 = green_1
					material2 = purple_blue_1
				}
			}
			CAS_Female_Shoes = {
				desc_id = F_Pop_Shoe_Platforms
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			CAS_Bass_Highway = {
				desc_id = MidoriHighway
			}
			CAS_Guitar_Highway = {
				desc_id = MidoriHighway
			}
			CAS_Drums_Highway = {
				desc_id = MidoriHighway
			}
			CAS_Female_Intro_Anim = {
				desc_id = Intro_Hype
			}
			CAS_Female_Win_Anim = {
				desc_id = Win_Hype
			}
			CAS_Female_Lose_Anim = {
				desc_id = Lose_AngryAtCrowd
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body15
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body15_03
				chosen_materials = {
					material1 = violet_1
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_02
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_stars
				chosen_materials = {
					material1 = violet_5
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_10
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock10_DTL_05
				chosen_materials = {
					material1 = violet_3
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body15_03_03
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups02_04
			}
			CAS_Bass_Body = {
				desc_id = bass_body_bandera
			}
			CAS_Bass_Finish = {
				desc_id = bass_finish_generic_white
				chosen_materials = {
					material1 = green_2guitar
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = gtr_detail_body17_01
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_06
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_seahorse
				chosen_materials = {
					material1 = purple_blue_3
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_07
				chosen_materials = {
					material1 = purple_blue_3
				}
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_01_maple_d_mls_white
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_head07_detail03
				chosen_materials = {
					material1 = green_3guitar
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_06
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_03
				chosen_materials = {
					material1 = purple_blue_3
				}
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_phunq10
				chosen_materials = {
					material1 = purple_blue_2
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Mic = {
				desc_id = mic_sixties
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
			CAS_Female_Base_Face = {
				desc_id = f_head_midori
			}
		}
	}
	{
		name = Clive
		fullname = qs("\LClive Winston")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Clive
		blurb = qs("Inspired by the 70's British guitar gods, Clive Winston is a precious session commodity - everything he plays on goes gold.  He's a virtuoso with a unique guitar style, and knows just how far you can bend a string before it breaks.")
		appearance = {
			CAS_Body = {
				desc_id = GH4_CAR_Male
				random_weight = 15.0
			}
			cas_physique = {
				desc_id = MalePhysique
				additional_bone_transforms = [
					{
						bone = Bone_Head
						scaling = {
							value = (0.01, 0.01, 0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, -0.5, -0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.0, -0.2, -0.15)
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
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, -0.3, -0.25)
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
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, -0.3, -0.25)
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
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.2, -0.2)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						translation = {
							value = (0.0, 0.02, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						translation = {
							value = (0.0, 0.02, 0.0)
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.4, -0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.4, -0.4)
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
				]
			}
			CAS_Male_Hair = {
				desc_id = M_Clsc_Hair_Country
			}
			CAS_Male_Hat = {
				desc_id = none
			}
			CAS_Male_Facial_Hair = {
				desc_id = m_clsc_fhair_stache02
			}
			CAS_Male_Torso = {
				desc_id = m_clsc_torso_clrdjakt
				chosen_materials = {
					material1 = red_orange_1
				}
			}
			CAS_Male_Legs = {
				desc_id = M_Clsc_Legs_whtbells
				chosen_materials = {
					material1 = grey_1
				}
			}
			CAS_Male_Shoes = {
				desc_id = m_clsc_shoe_whtboot
			}
			CAS_Male_Acc_Face = {
				desc_id = M_Clsc_Glasses_Avtr
			}
			CAS_Male_Acc_Ears = {
				desc_id = none
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = Intro_Generic3
			}
			CAS_Male_Win_Anim = {
				desc_id = Win_Generic2
			}
			CAS_Male_Lose_Anim = {
				desc_id = Lose_Generic
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body05
			}
			CAS_Guitar_Finish = {
				desc_id = finish_generic_17
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body05_03
				chosen_materials = {
					material1 = violet_1
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_02
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_99
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body04_04_10
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups04_02
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body_sixtease
			}
			CAS_Bass_Finish = {
				desc_id = bass_finish_generic_white
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = CAB_Body_6tease_DTL_Tri
				chosen_materials = {
					material1 = violet_1
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_06
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_moon
				chosen_materials = {
					material1 = blue_4
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_grumbel01
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_grumbel01_white
				chosen_materials = {
					material1 = orange_2
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_grumb_detail04
				chosen_materials = {
					material1 = violet_2
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_pickg_6tz04
			}
			cas_bass_pickguard_finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = yellow_5
				}
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_emg02
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_03
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knobs_6tz01
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_rm_03
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_ds_01
				chosen_materials = {
					material1 = blue_4
				}
			}
			CAS_Mic = {
				desc_id = mic_sixties
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
			CAS_Male_Base_Face = {
				desc_id = m_head_clive
			}
		}
	}
	{
		name = Pandora
		fullname = qs("\LPandora")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Pandora
		blurb = qs("The girl scouts didn't want her, the ballet school couldn't handle her, but the world can't get enough of her.  The Dark Princess of Rock is back better than ever.")
		appearance = {
			CAS_Body = {
				desc_id = GH4_CAR_Pandora
			}
			cas_physique = {
				desc_id = FemalePhysique
				bones = {
					Physique = -1.0
				}
			}
			CAS_Female_Hair = {
				desc_id = f_goth_hair_updo
				chosen_materials = {
					material1 = navy_3
					material2 = blue_3
				}
			}
			CAS_Female_Hat = {
				desc_id = none
			}
			CAS_Female_Torso = {
				desc_id = f_goth_torso_frillybodice
			}
			CAS_Female_Legs = {
				desc_id = f_goth_legs_frillydress
			}
			CAS_Female_Shoes = {
				desc_id = f_goth_shoes_maryjanes
			}
			CAS_Female_Acc_Left = {
				desc_id = none
			}
			CAS_Female_Acc_Right = {
				desc_id = none
			}
			CAS_Female_Acc_Face = {
				desc_id = none
			}
			CAS_Female_Acc_Ears = {
				desc_id = none
			}
			CAS_Bass_Highway = {
				desc_id = JudyHighway
			}
			CAS_Guitar_Highway = {
				desc_id = JudyHighway
			}
			CAS_Drums_Highway = {
				desc_id = JudyHighway
			}
			CAS_Female_Intro_Anim = {
				desc_id = Intro_Hype
			}
			CAS_Female_Win_Anim = {
				desc_id = Win_Hype
			}
			CAS_Female_Lose_Anim = {
				desc_id = Lose_AngryAtCrowd
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body08
			}
			CAS_Guitar_Finish = {
				desc_id = finish_generic_15
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body08_04
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_diamonds
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_08
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock08_DTL_04
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body08_03_01
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups05_03
				chosen_materials = {
					material1 = purple_blue_1
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body_bandera
			}
			CAS_Bass_Finish = {
				desc_id = finish_generic_24b
				chosen_materials = {
					material1 = violet_5
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_06
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_ornate02
				chosen_materials = {
					material1 = violet_1
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_07
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_01_maple_d_mls_white
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_head07_detail01
				chosen_materials = {
					material1 = violet_2
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_02
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridge_hack
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_phunq02
				chosen_materials = {
					material1 = violet_1
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_41
				chosen_materials = {
					material1 = navy_2
				}
			}
			CAS_Mic = {
				desc_id = mic_blackmetal
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
			CAS_Female_Base_Face = {
				desc_id = f_head_pandora
			}
		}
	}
	{
		name = Eddie
		fullname = qs("\LEddie Knox")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Eddie
		blurb = qs("When he's not cruisin' in his '55 hot rod, Knox brings his hard-working rock to any stage he sets foot on. A real road dog, Knox claims that as long as he's got his hollow body and his pomade, he ain't too far from home.")
		appearance = {
			CAS_Body = {
				desc_id = GH4_CAR_Eddie
			}
			cas_physique = {
				desc_id = MalePhysique
				bones = {
					Height = 1.0
				}
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
			CAS_Male_Hair = {
				desc_id = M_Pop_Hair_Pomp
			}
			CAS_Male_Hat = {
				desc_id = none
			}
			CAS_Male_Facial_Hair = {
				desc_id = none
			}
			CAS_Male_Torso = {
				desc_id = m_punk_torso_bowling
				chosen_materials = {
					material2 = grey_5
				}
			}
			CAS_Male_Legs = {
				desc_id = M_Punk_Legs_Cuff
			}
			CAS_Male_Shoes = {
				desc_id = m_punk_shoes_johnny01
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = Intro_Elvis
			}
			CAS_Male_Win_Anim = {
				desc_id = Win_Elvis
			}
			CAS_Male_Lose_Anim = {
				desc_id = Lose_kick
			}
			CAS_Guitar_Body = {
				desc_id = Guitar_Body12
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body12_01
				chosen_materials = {
					material1 = yellow_orange_4
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_notes
				chosen_materials = {
					material1 = blue_5
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_13
				chosen_materials = {
					material1 = orange_5
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = red_2
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock13_DTL_05
				chosen_materials = {
					material1 = yellow_orange_4
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = guitar_pickg_body12_01
			}
			CAS_Guitar_Pickguard_Finish = {
				desc_id = shell
				chosen_materials = {
					material1 = red_orange_1
				}
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_06
				chosen_materials = {
					material1 = orange_5
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body12_04_06
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups03a_02
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body04
			}
			CAS_Bass_Finish = {
				desc_id = finish_generic_24b
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = CAB_Body_Grumbel_DTL_Pin
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_stneck_ebony
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_tribal01
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_03
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_bh7a_white
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_head08_detail05
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_04
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_02
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Grmbl09
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_55
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_ds_11
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			CAS_Mic = {
				desc_id = mic_standard
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
			CAS_Male_Base_Face = {
				desc_id = m_head_eddie
			}
		}
	}
	{
		name = Drummer
		fullname = qs("\LMatty Cannz")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Drummer
		blurb = qs("Matty's a man of action and motion who has never wasted time saying in words what he can pound out on any one thing with any other thing. Drumming comes naturally, and beating and breaking things are a way of life. If you can beat it, he can beat it in time... better than you.")
		appearance = {
			genre = `Classic Rock`
			CAS_Body = {
				desc_id = GH4_CAR_Male
				bones = {
					EyeScale = 0.3
					NoseWidth = 0.7
					EyePosition = -0.0
					EyeDepth = 1.0
					UpperLipThickness = 0.01
					LowerLipThickness = 0.01
					FaceFullness = 0.9
					JawScale = 0.2
					EyeDistance = -0.83
					NoseAngle = 0.9
					NoseTip = 0.252
					NoseBridge = 0.33900002
					NoseDepth = 0.565
				}
			}
			cas_physique = {
				desc_id = MalePhysique
				bones = {
					Height = 1.0
				}
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
			CAS_Male_Hair = {
				desc_id = M_Rock_Hair_Drummer
			}
			CAS_Male_Torso = {
				desc_id = M_Rock_Torso_RipShirt
			}
			CAS_Male_Legs = {
				desc_id = M_Clsc_Legs_Ltjeans
			}
			CAS_Male_Shoes = {
				desc_id = M_Punk_Shoe_BuckleB
			}
			CAS_Male_Acc_Left = {
				desc_id = M_Metl_AccL_Zakk
			}
			CAS_Male_Acc_Right = {
				desc_id = m_metl_accr_zakk
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = Intro_Waving
			}
			CAS_Male_Win_Anim = {
				desc_id = Win_Generic2
			}
			CAS_Male_Lose_Anim = {
				desc_id = Lose_Generic
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body01
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_01
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_dots
			}
			CAS_Guitar_Head = {
				desc_id = Guitar_Head_01
			}
			CAS_Guitar_Pickguards = {
				desc_id = guitar_pickg_body01_01
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_Pickups01a_03
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_Knobs_body01_02_02
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
			}
			CAS_Bass_Body = {
				desc_id = bass_body_pred
			}
			CAS_Bass_Finish = {
				desc_id = finish_generic_23b
				chosen_materials = {
					material1 = red_orange_4
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = gtr_detail_body16_01
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_03
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_fl_dots
				chosen_materials = {
					material1 = blue_4
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_Head_01
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_01_maple_d_mls_white
				chosen_materials = {
					material1 = orange_1
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_03
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_03
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Phunq05
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = Drumshell_DS_02
				chosen_materials = {
					material1 = red_orange_4
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_ds_47
				chosen_materials = {
					material1 = violet_1
				}
			}
			CAS_Mic = {
				desc_id = mic_sixties
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
			CAS_Male_Base_Face = {
				desc_id = m_head_drummer
			}
		}
	}
	{
		name = bassist
		fullname = qs("\LShirley Crowley")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Bassist
		blurb = qs("Shirley's not a simple gal. She likes fancy teas and espresso, aromatherapy, hydrotherapy , meditation and wild flowers. She also likes to do all this with Lacuna Coil blasting a hole in her ear drums. She's a tough gal with a soft side, but don't take that for weakness. As one of the most motivated and talented people in her field, she's currently recording her debut solo album in which she plays all the instruments. Shirts with skulls are also awesome.")
		appearance = {
			genre = `Classic Rock`
			CAS_Body = {
				desc_id = GH4_CAR_Female
				random_weight = 2.0
			}
			cas_physique = {
				desc_id = FemalePhysique
				bones = {
					Physique = -1.0
					Height = -1.0
				}
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (-0.05, -0.05, -0.05)
						}
					}
					{
						bone = Bone_Head
						scaling = {
							value = (0.025, 0.025, 0.025)
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.02, 0.02, 0.15)
							no_propagate
						}
						translation = {
							value = (-0.015, 0.0, 0.0)
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
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.05, 0.05, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.015)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.05, 0.05, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.015)
							no_propagate
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.15, 0.15, 0.15)
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, 0.15, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.1, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.1, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.15, 0.25, 0.25)
							no_propagate
						}
						translation = {
							value = (0.015, 0.0, 0.0)
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
				]
			}
			CAS_Female_Hair = {
				desc_id = F_Rock_Hair_Bass
			}
			CAS_Female_Hat = {
				desc_id = none
			}
			CAS_Female_Facial_Hair = {
				desc_id = none
			}
			CAS_Female_Torso = {
				desc_id = f_rock_torso_bass
			}
			CAS_Female_Legs = {
				desc_id = f_rock_legs_jeans
			}
			CAS_Female_Shoes = {
				desc_id = F_Rock_Shoes_Canvas
			}
			CAS_Female_Acc_Left = {
				desc_id = f_bmtl_acc_ltripleband
			}
			CAS_Female_Acc_Right = {
				desc_id = none
			}
			CAS_Female_Acc_Face = {
				desc_id = none
			}
			CAS_Female_Acc_Ears = {
				desc_id = none
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Female_Win_Anim = {
				desc_id = Win_Waving
			}
			CAS_Female_Lose_Anim = {
				desc_id = Lose_Generic
			}
			CAS_Female_Intro_Anim = {
				desc_id = Intro_Generic1
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body06
			}
			CAS_Guitar_Finish = {
				desc_id = finish_generic_27
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_02
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_dragon
				chosen_materials = {
					material1 = blue_5
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_13
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = red_2
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock13_DTL_05
				chosen_materials = {
					material1 = teal_1
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body06_03_01
				chosen_materials = {
					material1 = yellow_green_1guitar
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups02_03
				chosen_materials = {
					material1 = yellow_green_1guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body03
			}
			CAS_Bass_Finish = {
				desc_id = bass_finish_generic_white
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_02
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_dots
				chosen_materials = {
					material1 = grey_1
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_06
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_pickg_chndr04
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_04
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_02
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_chndr09
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_28
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_ds_81
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			CAS_Mic = {
				desc_id = mic_standard
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
			CAS_Female_Base_Face = {
				desc_id = f_head_bassist
			}
		}
	}
	{
		name = Guitarist
		fullname = qs("\LMarcus Fretshreder")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Guitarist
		blurb = qs("Born Marcus Fjorn Frettenshredder to Swedish Hippies, Marcus moved to the US as a young kid. His journey into the world of rock 'n' roll came as a vision to him after a fall from a tree - As he lay there, he saw spirited visions of stages and exotic locations, followed by the image of a white and gold glowing guitar. Since then he's studied the more metaphysical and hypernatural aspects of music and guitar playing in particular. It's been his life's pursuit to attain the status of Rock God.")
		appearance = {
			genre = `Classic Rock`
			CAS_Body = {
				desc_id = GH4_CAR_Male
				bones = {
					JawScale = 0.5
					FaceFullness = 0.4
				}
			}
			cas_physique = {
				desc_id = MalePhysique
				bones = {
					Height = -1.0
				}
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (0.01, 0.01, 0.01)
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.025, 0.025)
							no_propagate
						}
					}
					{
						bone = Bone_Neck
						scaling = {
							value = (0.0, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Head
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.0, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						translation = {
							value = (0.0, -0.02, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.0, 0.15, 0.3)
							no_propagate
						}
						translation = {
							value = (0.0, -0.02, 0.0)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
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
							value = (0.0, 0.2, 0.2)
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
							value = (0.0, 0.2, 0.2)
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
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_L
						scaling = {
							value = (0.0, -0.15, -0.15)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.01)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, -0.2, 0.01)
							no_propagate
						}
					}
				]
			}
			CAS_Male_Hair = {
				desc_id = M_Rock_Hair_Guitarist
			}
			CAS_Male_Torso = {
				desc_id = M_Rock_Torso_RolledSlvs
			}
			CAS_Male_Legs = {
				desc_id = M_Bmtl_Legs_Plate
			}
			CAS_Male_Shoes = {
				desc_id = M_Punk_Shoe_BuckleB
			}
			CAS_Male_Acc_Left = {
				desc_id = m_metl_acc_lhole
			}
			CAS_Male_Acc_Right = {
				desc_id = M_Metl_Acc_RStuds
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = Intro_Waving
			}
			CAS_Male_Win_Anim = {
				desc_id = Win_Waving
			}
			CAS_Male_Lose_Anim = {
				desc_id = Lose_Fearful
			}
			CAS_Male_Base_Torso = {
				desc_id = male_full
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body09
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body09_01
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_tribal1
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_10
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock10_DTL_05
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body09_03_02
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups01b_03
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body_pred
			}
			CAS_Bass_Finish = {
				desc_id = finish_generic_02b
				chosen_materials = {
					material1 = purple_blue_2
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = gtr_detail_body16_04
				chosen_materials = {
					material1 = blue_3
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_03
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_fl_axes
				chosen_materials = {
					material1 = yellow_4guitar
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_guppy
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_maple_generic_white
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_guppy_detail01
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_01
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Phunq08
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_40
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_DS_56
				chosen_materials = {
					material1 = navy_4
				}
			}
			CAS_Mic = {
				desc_id = mic_blackmetal
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		name = singer
		fullname = qs("\LRiki Lee")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Singer
		blurb = qs("Formerly known as child star Riki Lee Landslide, Riki's foray into the world of music began as a 10 year old boy in the family singing group, The Dodsons. After a few hard years which he often refers to as his 'Black Years' Riki Lee Landslide emerged simply as Riki Lee, with a style all his own and a voice that could shatter glass... at will.")
		appearance = {
			genre = `Classic Rock`
			CAS_Body = {
				desc_id = GH4_CAR_Male
			}
			cas_physique = {
				desc_id = MalePhysique
				bones = {
					Height = 0.1
					Physique = -1.0
				}
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
							value = (-0.05, -0.05, -0.05)
							stop_propagate
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (-0.25, -0.15, -0.125)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						scaling = {
							value = (0.0, -0.2, -0.2)
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
							value = (0.0, -0.2, -0.2)
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
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Forearm_R
						scaling = {
							value = (0.0, -0.1, -0.1)
							no_propagate
						}
					}
				]
			}
			CAS_Male_Hair = {
				desc_id = M_Glam_Hair_Seagull
			}
			CAS_Male_Hat = {
				desc_id = none
			}
			CAS_Male_Facial_Hair = {
				desc_id = none
			}
			CAS_Male_Torso = {
				desc_id = M_Torso_TasselVest
			}
			CAS_Male_Legs = {
				desc_id = m_glam_legs_spandex
			}
			CAS_Male_Shoes = {
				desc_id = M_Clsc_shoe_drkboot
			}
			CAS_Male_Acc_Left = {
				desc_id = m_pop_acc_lband
			}
			CAS_Male_Acc_Face = {
				desc_id = M_Clsc_Glasses_Avtr
			}
			CAS_Male_Acc_Ears = {
				desc_id = none
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = Intro_Pretentious
			}
			CAS_Male_Win_Anim = {
				desc_id = Win_Pretentious
			}
			CAS_Male_Lose_Anim = {
				desc_id = Lose_Pretentious
			}
			CAS_Male_Base_Face = {
				desc_id = m_head_singer
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body11
			}
			CAS_Guitar_Finish = {
				desc_id = finish_generic_04
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body11_03
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_04
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_shards
				chosen_materials = {
					material1 = blue_5
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_12
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = red_orange_2
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock12_DTL_05
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = grey_3guitar
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body11_03_04
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups01c_02
				chosen_materials = {
					material1 = orange_2
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_Body_arcos_01
			}
			CAS_Bass_Finish = {
				desc_id = bass_finish_generic_white
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_Neck_01
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_blocks01
				chosen_materials = {
					material1 = blue_4
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_04
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_PickG_01
			}
			cas_bass_pickguard_finish = {
				desc_id = shell
				chosen_materials = {
					material1 = blue_4
				}
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_06
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_unos03
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_09
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_DS_46
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			CAS_Mic = {
				desc_id = mic_sixties
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		name = Elroy
		fullname = qs(0x3256d6c9)
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Elroy
		blurb = qs(0x219f5824)
		appearance = {
			genre = `Classic Rock`
			CAS_Body = {
				desc_id = GH4_CAR_Winner
				chosen_materials = {
					skin = skin_tan_2
				}
				bones = {
					FaceFullness = 0.6
				}
			}
			cas_physique = {
				desc_id = MalePhysique
				bones = {
					Height = 0.2
				}
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
							value = (0.0, 0.3, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.1, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.1, 0.1, 0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.2, 0.3, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (0.0, 1.0, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (0.0, 0.5, 0.5)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (0.0, 1.0, 0.4)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (0.0, 0.5, 0.5)
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
							value = (0.1, 0.3, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.25, 0.6, 0.5)
							no_propagate
						}
					}
				]
			}
			CAS_Male_Hair = {
				desc_id = M_Clsc_Hair_Elroy
				chosen_materials = {
					material1 = yellow_orange_1
					material2 = yellow_orange_1
				}
			}
			CAS_Male_Facial_Hair = {
				desc_id = M_Clsc_FHair_Elroy
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			CAS_Male_Torso = {
				desc_id = M_Clsc_Torso_Elroy
			}
			CAS_Male_Legs = {
				desc_id = M_Clsc_Legs_Elroy
			}
			CAS_Male_Shoes = {
				desc_id = m_clsc_shoe_jimi
			}
			CAS_Male_Acc_Face = {
				desc_id = M_Clsc_Glasses_Elroy
			}
			CAS_Highway = {
				desc_id = AxelHighway
			}
			CAS_Gems = {
				desc_id = gem_set_01
			}
			CAS_Male_Base_Face = {
				desc_id = m_head_elroy
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body05
			}
			CAS_Guitar_Finish = {
				desc_id = finish_generic_17
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body05_04
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_dots
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_99
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = black_1
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock99_DTL_06
			}
			CAS_Guitar_Pickguards = {
				desc_id = guitar_pickg_body05_01
			}
			CAS_Guitar_Pickguard_Finish = {
				desc_id = shell
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body04_03_01
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_Pickups01a_03
			}
			CAS_Bass_Body = {
				desc_id = bass_body03
			}
			CAS_Bass_Finish = {
				desc_id = bass_finish_generic_white
				chosen_materials = {
					material1 = orange_1
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = CAB_Body_Chndr_DTL_Tri
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_03
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_dots
			}
			CAS_Bass_Head = {
				desc_id = bass_head_grumbel01
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_grumbel01_white
				chosen_materials = {
					material1 = black_1
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_grumb_detail05
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_pickg_chndr01
			}
			cas_bass_pickguard_finish = {
				desc_id = shell
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_10
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_03
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Chndr03
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_11
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_DS_86
			}
			CAS_Mic = {
				desc_id = mic_sixties
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
		}
	}
]
Preset_Musician_Profiles_Locked = [
	{
		name = NickArnold
		fullname = qs("\LNick")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_BestBuyKid
		blurb = qs("Nick")
		locked
		appearance = {
			genre = `Glam Rock`
			CAS_Body = {
				desc_id = `BestBuy Kid`
				random_weight = 1.5
				bones = {
					HeadSize = 0.2
					FaceFullness = 0.0
					JawScale = -0.0
				}
			}
			cas_physique = {
				desc_id = MalePhysique
				additional_bone_transforms = [
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (-0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (-0.0, -0.1, -0.1)
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
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
				]
				bones = {
					Height = -1.0
				}
			}
			CAS_Male_Hair = {
				desc_id = M_BBKid_Hair_Beanie
			}
			CAS_Male_Hat = {
				desc_id = none
			}
			CAS_Male_Facial_Hair = {
				desc_id = none
			}
			CAS_Male_Torso = {
				desc_id = M_Torso_TShirt
			}
			CAS_Male_Legs = {
				desc_id = M_Pop_Legs_Pants
			}
			CAS_Male_Shoes = {
				desc_id = m_rock_shoe_skulls
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Base_Face = {
				desc_id = m_head_bbk
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body03
			}
			CAS_Guitar_Finish = {
				desc_id = finish_generic_03
				chosen_materials = {
					material1 = blue_3
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_blocks2
				chosen_materials = {
					material1 = grey_4guitar
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_12
				chosen_materials = {
					material1 = blue_5
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = navy_1
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock12_DTL_05
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = blue_5
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body03_03_02
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups02_04
				chosen_materials = {
					material1 = navy_1
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body03
			}
			CAS_Bass_Finish = {
				desc_id = finish_generic_03b
				chosen_materials = {
					material1 = blue_3
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = CAB_Body_Chndr_DTL_Fin
				chosen_materials = {
					material1 = navy_1
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_Neck_01
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_fl_stars
				chosen_materials = {
					material1 = navy_4
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_02
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_bh6a_white
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_trad_detail05
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_04
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_chndr01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = drumshell_ds_46
				chosen_materials = {
					material1 = yellow_3guitar
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_DS_09
				chosen_materials = {
					material1 = yellow_2guitar
				}
			}
			CAS_Mic = {
				desc_id = mic_sixties
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		name = `Aaron Steele`
		fullname = qs("\LAaron Steele")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Steele
		blurb = qs("Aaron Steele")
		locked
		appearance = {
			genre = Rock
			CAS_Body = {
				desc_id = AaronSteele
				chosen_materials = {
					skin = skin_tan_2
				}
				bones = {
					NoseSize = 0.3
					NoseWidth = 0.621
					EyeScale = 0.267
					HeadSize = 0.2
					JawScale = -2.0
					FaceFullness = 0.2
					NoseAngle = 0.077
					NoseBridge = 0.294
					NoseTip = 0.9
					EyeDepth = 1.0
					EyeDistance = -0.7
					LowerLipThickness = 0.5
				}
			}
			cas_physique = {
				desc_id = MalePhysique
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (-0.08, -0.08, -0.08)
						}
					}
					{
						bone = Bone_Head
						scaling = {
							value = (0.02, 0.02, 0.02)
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_L
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Twist_Bicep_Top_R
						scaling = {
							value = (-0.1, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_L
						scaling = {
							value = (-0.0, -0.1, -0.1)
							no_propagate
						}
					}
					{
						bone = Bone_Bicep_R
						scaling = {
							value = (-0.0, -0.1, -0.1)
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
					{
						bone = Bone_Forearm_L
						scaling = {
							value = (0.0, -0.25, -0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.0, 0.15)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.0, 0.0)
							no_propagate
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, 0.0, 0.15)
						}
					}
				]
			}
			CAS_Male_Hair = {
				desc_id = M_Clsc_Hair_Contest
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			CAS_Male_Hat = {
				desc_id = none
			}
			CAS_Male_Facial_Hair = {
				desc_id = none
			}
			CAS_Male_Torso = {
				desc_id = M_Torso_Layered
				chosen_materials = {
					material1 = red_1
					material2 = grey_5
				}
			}
			CAS_Male_Legs = {
				desc_id = M_Pop_Legs_Jeans
				chosen_materials = {
					material1 = grey_3
					material2 = grey_3
				}
			}
			CAS_Male_Shoes = {
				desc_id = m_punk_shoe_canvas
			}
			CAS_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Base_Torso = {
				desc_id = male_full
			}
			$preset_musician_instrument_hack
		}
	}
	{
		name = rina
		fullname = qs("\LRina")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Rina
		blurb = qs("Rina")
		locked
		appearance = {
			genre = Rock
			CAS_Body = {
				desc_id = GH4_CAR_Female
				chosen_materials = {
					skin = skin_tan_1
				}
				cap = [
					{
						base_tex = `tex/models/Characters/Global/Global_Blank_Head_dnc.dds`
						material = CAR_female_head
						Cas_1
						pre_layer = [
							{
								texture = `tex/models/Characters/Layers/CAR/Female/Makeup/CAR_female_Makeup03.img`
								flags = 4
							}
						]
					}
				]
			}
			cas_physique = {
				desc_id = FemalePhysique
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (-0.075, -0.075, -0.075)
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.0, 0.0, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.0, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.0, 0.0, 0.2)
							no_propagate
						}
					}
				]
			}
			CAS_Female_Hair = {
				desc_id = F_Metl_Hair_Ponytail
				chosen_materials = {
					material1 = orange_1
				}
			}
			CAS_Female_Hat = {
				desc_id = none
			}
			CAS_Female_Torso = {
				desc_id = f_rock_torso_bass
				chosen_materials = {
					material1 = blue_4
				}
			}
			CAS_Female_Legs = {
				desc_id = f_rock_legs_jeans
				chosen_materials = {
					material1 = grey_3
				}
			}
			CAS_Female_Shoes = {
				desc_id = f_pop_shoes_hayleyshoes
			}
			CAS_Female_Acc_Left = {
				desc_id = F_Rock_Acc_LChainStud
			}
			CAS_Female_Acc_Right = {
				desc_id = f_goth_acc_laceglv_r
				chosen_materials = {
					material1 = grey_1
				}
			}
			CAS_Highway = {
				desc_id = JudyHighway
			}
			CAS_Female_Base_Torso = {
				desc_id = female_full
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body01
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_01
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_dots
			}
			CAS_Guitar_Head = {
				desc_id = Guitar_Head_01
			}
			CAS_Guitar_Pickguards = {
				desc_id = guitar_pickg_body01_01
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_Pickups01a_03
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_Knobs_body01_02_02
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
			}
			CAS_Bass_Body = {
				desc_id = bass_body_bandera
			}
			CAS_Bass_Finish = {
				desc_id = finish_generic_18b
				chosen_materials = {
					material1 = red_orange_3
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = gtr_detail_body17_04
				chosen_materials = {
					material1 = teal_1
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_Neck_01
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_fl_arrows
				chosen_materials = {
					material1 = yellow_green_2guitar
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_04
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_01_maple_silverknob_white
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_02
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
				chosen_materials = {
					material1 = red_orange_5
				}
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_phunq02
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = Drumshell_DS_32
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_ds_78
			}
			CAS_Mic = {
				desc_id = mic_standard
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		name = GH4_CAR_Winner
		fullname = qs("\LJohnny Viper Thorne")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_GH4_CAR_Winner
		blurb = qs("22 year old Johnny Viper Thorne hails from Wiltshire England and was chosen by Motörhead's Lemmy & Neversoft's Joel as Winner of the 2008 Rock Icon Contest.  An avid Guitar Hero fan, this postman by day, rockstar by night joins the veteran Guitar Heroes and intends to make an impact!")
		locked
		appearance = {
			genre = Rock
			CAS_Body = {
				desc_id = GH4_CAR_Winner
				chosen_materials = {
					skin = skin_tan_2
				}
			}
			cas_physique = {
				desc_id = MalePhysique
				bones = {
					Height = 0.2
				}
				additional_bone_transforms = [
				]
			}
			CAS_Male_Hair = {
				desc_id = m_rock_hair_slash
			}
			CAS_Male_Hat = {
				desc_id = none
			}
			CAS_Male_Facial_Hair = {
				desc_id = none
			}
			CAS_Male_Torso = {
				desc_id = m_metl_torso_lthrjkt
				chosen_materials = {
					material2 = grey_2
					material1 = grey_2
				}
			}
			CAS_Male_Legs = {
				desc_id = m_glam_legs_spandex
			}
			CAS_Male_Shoes = {
				desc_id = M_Punk_Shoe_BuckleB
			}
			CAS_Male_Acc_Left = {
				desc_id = m_pop_acc_lband
			}
			CAS_Male_Acc_Right = {
				desc_id = m_metl_accr_zakk
			}
			CAS_Male_Acc_Face = {
				desc_id = none
			}
			CAS_Male_Acc_Ears = {
				desc_id = none
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = Intro_Generic1
			}
			CAS_Male_Win_Anim = {
				desc_id = Win_Generic3
			}
			CAS_Male_Lose_Anim = {
				desc_id = Lose_AngryAtCrowd
			}
			CAS_Male_Base_Face = {
				desc_id = m_head_contest
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body04
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body04_09
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_highwedges
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_05
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = orange_1
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock05_DTL_05
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body04_04_07
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_Pickups01a_03
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_Body_arcos_01
			}
			CAS_Bass_Finish = {
				desc_id = bass_finish_generic_white
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = CAB_Body_Unos_Ray02
				chosen_materials = {
					material1 = orange_2
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_Neck_01
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_wedgeshigh
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_grumbel01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_grumbel01_white
				chosen_materials = {
					material1 = orange_2
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_grumb_detail05
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_04
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_unos05
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = Drumshell_DS_14
				chosen_materials = {
					material1 = orange_2
				}
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_DS_17
				chosen_materials = {
					material1 = orange_2
				}
			}
			CAS_Mic = {
				desc_id = mic_sixties
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		name = Jimi
		fullname = qs("\LJimi Hendrix")
		allowed_parts = [
			guitar
		]
		preset_icon = photo_Jimi
		blurb = qs("Jimi Hendrix is one of the greatest and most influential rock guitarists in music history.  He pioneered many innovations on the electric guitar such as his artistic use of feedback and phase effects.")
		locked
		price = 500000
		appearance = {
			genre = `Classic Rock`
			CAS_Full_Body = {
				desc_id = Jimi
			}
			cas_physique = {
				desc_id = MalePhysique
			}
			CAS_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = G_Jimi_intro
			}
			CAS_Male_Win_Anim = {
				desc_id = G_Jimi_win
			}
			CAS_Male_Lose_Anim = {
				desc_id = G_Jimi_lose
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body06
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = grey_5guitar
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body06_06
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_04
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_dots
				chosen_materials = {
					material1 = yellow_orange_1
				}
			}
			CAS_Guitar_Head = {
				desc_id = Guitar_Head_01
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = orange_3
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = guitar_pickg_body06_01
			}
			CAS_Guitar_Pickguard_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = yellow_5
				}
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridge06
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body06_03_09
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups02_03
			}
			CAS_Bass_Body = {
				desc_id = bass_Body_arcos_01
			}
			CAS_Bass_Neck = {
				desc_id = bass_Neck_01
			}
			CAS_Bass_Head = {
				desc_id = bass_Head_01
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_PickG_01
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_01
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Unos01
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
			}
			CAS_Mic = {
				desc_id = mic_standard
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_female
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
		}
	}
	{
		name = Hayley
		fullname = qs("\LHayley Williams")
		allowed_parts = [
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Hayley
		blurb = qs("As the high energy front woman of the band Paramore, Hayley Williams has been touring the globe for years now.  Paramore's engaging stage performances have helped the band take it to the next level.")
		locked
		polaroid = Star_Hayley
		price = 5000
		appearance = {
			genre = Rock
			CAS_Full_Body = {
				desc_id = Hayley
			}
			cas_physique = {
				desc_id = FemalePhysique
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Female_Intro_Anim = {
				desc_id = s_haley_intro
			}
			CAS_Female_Win_Anim = {
				desc_id = s_haley_win
			}
			CAS_Female_Lose_Anim = {
				desc_id = s_haley_lose
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body01
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_01
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_dots
			}
			CAS_Guitar_Head = {
				desc_id = Guitar_Head_01
			}
			CAS_Guitar_Pickguards = {
				desc_id = guitar_pickg_body01_01
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_Pickups01a_03
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_Knobs_body01_02_02
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
			}
			CAS_Bass_Body = {
				desc_id = bass_Body_arcos_01
			}
			CAS_Bass_Neck = {
				desc_id = bass_Neck_01
			}
			CAS_Bass_Head = {
				desc_id = bass_Head_01
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_PickG_01
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_01
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Unos01
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
			}
			CAS_Mic = {
				desc_id = mic_paramore2
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
		}
	}
	{
		name = TedNugent
		fullname = qs("\LTed Nugent")
		allowed_parts = [
			guitar
			Bass
		]
		preset_icon = photo_TedNugent
		blurb = qs("The Motor City Madman, Great White Buffalo, and his many other nicknames can hardly describe the intensity The 'Nuge brings when he comes to town.  Wanna believe?  Pick up a vinyl copy of 'Double Live Gonzo', and you will.")
		locked
		polaroid = Star_Nugent
		price = 10000
		appearance = {
			genre = `Heavy Metal`
			CAS_Full_Body = {
				desc_id = TedNugent
			}
			cas_physique = {
				desc_id = MalePhysique
			}
			CAS_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = g_ted_intro
			}
			CAS_Male_Win_Anim = {
				desc_id = g_ted_win
			}
			CAS_Male_Lose_Anim = {
				desc_id = g_ted_lose
			}
			CAS_Guitar_Body = {
				desc_id = Guitar_Body12
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = black_1
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_nugent
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_nugent
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_06
				chosen_materials = {
					material1 = grey_5
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body12_04_09
				chosen_materials = {
					material1 = grey_1
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups03b_02
				chosen_materials = {
					material1 = grey_1
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_Body_arcos_01
			}
			CAS_Bass_Neck = {
				desc_id = bass_Neck_01
			}
			CAS_Bass_Head = {
				desc_id = bass_Head_01
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_PickG_01
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_01
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Unos01
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
			}
			CAS_Mic = {
				desc_id = mic_standard
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_female
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
		}
	}
	{
		name = skeleton
		fullname = qs("\LSkeleton")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Skeleton
		blurb = qs("Boo! HAHA! Gotcha!")
		locked
		polaroid = M_Fun_Skeleton
		price = 6000
		appearance = {
			genre = `Heavy Metal`
			CAS_Full_Body = {
				desc_id = skeleton
			}
			cas_physique = {
				desc_id = MalePhysique
				additional_bone_transforms = [
					{
						bone = Bone_Palm_L
						scaling = {
							value = (0.5, 0.5, 0.5)
						}
					}
					{
						bone = Bone_Palm_R
						scaling = {
							value = (0.5, 0.5, 0.5)
						}
					}
				]
			}
			CAS_Highway = {
				desc_id = AxelHighway
			}
			$preset_musician_instrument_hack
		}
	}
	{
		name = travis
		fullname = qs("\LTravis Barker")
		allowed_parts = [
			drum
		]
		preset_icon = photo_Travis
		blurb = qs("Travis gained fame as drummer for Blink-182, but he's also displayed his expert drumming technique in bands such as +44, Box Car Racer, Transplants, and The Aquabats! to name a few.  He also founded the Famous Stars and Straps clothing company in 1999.")
		locked
		polaroid = Star_Travis
		price = 5000
		appearance = {
			genre = `Heavy Metal`
			CAS_Full_Body = {
				desc_id = travis
			}
			cas_physique = {
				desc_id = MalePhysique
			}
			CAS_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = d_travis_intro
			}
			CAS_Male_Win_Anim = {
				desc_id = d_travis_win
			}
			CAS_Male_Lose_Anim = {
				desc_id = d_travis_lose
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body01
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_01
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_dots
			}
			CAS_Guitar_Head = {
				desc_id = Guitar_Head_01
			}
			CAS_Guitar_Pickguards = {
				desc_id = guitar_pickg_body01_01
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_Pickups01a_03
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_Knobs_body01_02_02
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
			}
			CAS_Bass_Body = {
				desc_id = bass_Body_arcos_01
			}
			CAS_Bass_Neck = {
				desc_id = bass_Neck_01
			}
			CAS_Bass_Head = {
				desc_id = bass_Head_01
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_PickG_01
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_01
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Unos01
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
			}
			CAS_Mic = {
				desc_id = mic_standard
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_female
			}
			CAS_Drums = {
				desc_id = quadbasskit
			}
			CAS_Drum_Finish = {
				desc_id = Drumshell_DS_OC1
			}
			CAS_Drum_Detail = {
				desc_id = bass_skin_DS_OC1
			}
		}
	}
	{
		name = Sting
		fullname = qs("\LSting")
		allowed_parts = [
			Vocals
			Bass
			guitar
		]
		preset_icon = photo_Sting
		icon_off = character_mug_axel_a
		icon_on = character_mug_axel_b
		blurb = qs("Prior to becoming an Academy Award nominated and Grammy Award winning solo artist, Sting made a name for himself as the principal songwriter, lead singer and bassist of the rock band The Police.")
		locked
		polaroid = Star_Sting
		price = 10000
		appearance = {
			genre = `Heavy Metal`
			CAS_Full_Body = {
				desc_id = Sting
			}
			cas_physique = {
				desc_id = MalePhysique
			}
			CAS_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = s_billy_intro
			}
			CAS_Male_Win_Anim = {
				desc_id = s_billy_win
			}
			CAS_Male_Lose_Anim = {
				desc_id = s_billy_lose
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body01
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_01
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_dots
			}
			CAS_Guitar_Head = {
				desc_id = Guitar_Head_01
			}
			CAS_Guitar_Pickguards = {
				desc_id = guitar_pickg_body01_01
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_Pickups01a_03
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_Knobs_body01_02_02
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
			}
			CAS_Bass_Body = {
				desc_id = bass_body03
			}
			CAS_Bass_Finish = {
				desc_id = finish_sting
				chosen_materials = {
					material1 = yellow_orange_4
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_02
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_fl_dots
				chosen_materials = {
					material1 = grey_2guitar
				}
			}
			CAS_Bass_Head = {
				desc_id = bass_head_02
			}
			CAS_Bass_Pickguards = {
				desc_id = cab_pguard_sting
			}
			CAS_Bass_Pickups = {
				desc_id = cab_pickup_sting
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_02
			}
			CAS_Bass_Knobs = {
				desc_id = cab_knob_sting
			}
			CAS_Mic = {
				desc_id = mic_standard
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
		}
	}
	{
		name = ZakkWylde
		fullname = qs("\LZakk Wylde")
		allowed_parts = [
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_ZakkWylde
		blurb = qs("Best known as the guitarist for Ozzy Osbourne for over 20 years and as the founder of Black Label Society, Zakk Wylde is one of the premiere guitar gods of the modern age.  His blistering guitar playing is characterized by his signature use of pinch harmonics, and his distinctive guitars are instantly recognizable from the 'bulls eye' finish.")
		locked
		polaroid = Star_Zakk
		price = 5000
		appearance = {
			genre = `Heavy Metal`
			CAS_Full_Body = {
				desc_id = ZakkWylde
			}
			cas_physique = {
				desc_id = MalePhysique
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (0.05, 0.05, 0.05)
						}
					}
					{
						bone = Bone_Collar_R
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, -0.03)
						}
					}
					{
						bone = Bone_Collar_L
						scaling = {
							value = (0.0, 0.05, 0.05)
							no_propagate
						}
						translation = {
							value = (0.0, 0.0, 0.03)
						}
					}
					{
						bone = Bone_Chest
						scaling = {
							value = (0.0, 0.03, 0.03)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.0, 0.015, 0.015)
							no_propagate
						}
					}
				]
			}
			CAS_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = g_zakk_intro
			}
			CAS_Male_Win_Anim = {
				desc_id = g_zakk_win
			}
			CAS_Male_Lose_Anim = {
				desc_id = g_zakk_lose
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body05
			}
			CAS_Guitar_Finish = {
				desc_id = finish_wylde
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_blockbinding
				chosen_materials = {
					material1 = yellow_orange_5
				}
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_wylde
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = orange_1
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridges_01
				chosen_materials = {
					material1 = orange_4
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body04_04_04
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups06_02
			}
			CAS_Bass_Body = {
				desc_id = bass_Body_arcos_01
			}
			CAS_Bass_Neck = {
				desc_id = bass_Neck_01
			}
			CAS_Bass_Head = {
				desc_id = bass_Head_01
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_PickG_01
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_01
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Unos01
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
			}
			CAS_Mic = {
				desc_id = mic_standard
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_female
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
		}
	}
	{
		name = Ozzy
		fullname = qs("\LOzzy Osbourne")
		allowed_parts = [
			Vocals
		]
		preset_icon = photo_Ozzy
		blurb = qs("The 'Prince of Darkness' helped invent the music genre known as 'Heavy Metal' as the lead vocalist of metal gods Black Sabbath.  And as a solo artist, Ozzy continues to tear up the globe with his own tour 'Ozzfest'.")
		locked
		polaroid = Star_Ozzy
		price = 10000
		appearance = {
			genre = `Heavy Metal`
			CAS_Full_Body = {
				desc_id = Ozzy
			}
			cas_physique = {
				desc_id = MalePhysique
				bones = {
					Height = 1
				}
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = s_ozzy_intro
			}
			CAS_Male_Win_Anim = {
				desc_id = s_ozzy_win
			}
			CAS_Male_Lose_Anim = {
				desc_id = s_ozzy_lose
			}
			$preset_musician_instrument_hack
		}
	}
	{
		name = Billy
		fullname = qs("\LBilly Corgan")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_BILLY
		blurb = qs("As the vocalist and guitarist for the alternative rock band The Smashing Pumpkins, Billy has helped push the limits of modern rock music with his complex and layered songwriting.")
		locked
		polaroid = Star_Billy
		appearance = {
			genre = Rock
			CAS_Full_Body = {
				desc_id = Billy
			}
			cas_physique = {
				desc_id = MalePhysique
				bones = {
					Height = 1.0
				}
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (0.05, 0.05, 0.05)
						}
					}
				]
			}
			CAS_Highway = {
				desc_id = AxelHighway
			}
			CAS_Male_Intro_Anim = {
				desc_id = s_billy_intro
			}
			CAS_Male_Win_Anim = {
				desc_id = s_billy_win
			}
			CAS_Male_Lose_Anim = {
				desc_id = s_billy_lose
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body06
			}
			CAS_Guitar_Finish = {
				desc_id = custom_color
				chosen_materials = {
					material1 = black_1
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body04_09
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_corgan
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_31
				chosen_materials = {
					material1 = grey_3
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = black_1
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock31_DTL_01
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridge06
				chosen_materials = {
					material1 = grey_3
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body06_03_04
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups01b_02
				chosen_materials = {
					material1 = black_1
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_Body_arcos_01
			}
			CAS_Bass_Neck = {
				desc_id = bass_Neck_01
			}
			CAS_Bass_Head = {
				desc_id = bass_Head_01
			}
			CAS_Bass_Pickguards = {
				desc_id = bass_PickG_01
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_01
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Unos01
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_01
			}
			CAS_Mic = {
				desc_id = mic_standard
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_female
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
		}
	}
	{
		name = Metalhead
		fullname = qs(0x6fae039b)
		allowed_parts = [
			drum
			guitar
			Bass
		]
		preset_icon = photo_vvbot
		blurb = qs(0x6cec1c19)
		price = 5000
		appearance = {
			genre = `Classic Rock`
			CAS_Full_Body = {
				desc_id = Metalhead
			}
			cas_physique = {
				desc_id = MalePhysique
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (0.06, 0.06, 0.06)
						}
					}
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
							value = (0.0, 0.0, 0.45000002)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Upper
						scaling = {
							value = (0.2, 0.25, 0.3)
							no_propagate
						}
					}
					{
						bone = Bone_Stomach_Lower
						scaling = {
							value = (0.2, 0.25, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Pelvis
						scaling = {
							value = (0.0, 0.05, 0.25)
							no_propagate
						}
					}
					{
						bone = Bone_Thigh_R
						translation = {
							value = (0.0, 0.0, -0.1)
						}
					}
					{
						bone = Bone_Thigh_L
						translation = {
							value = (0.0, 0.0, -0.1)
						}
					}
					{
						bone = Bone_Collar_R
						translation = {
							value = (0.0, -0.11, 0.0)
						}
					}
					{
						bone = Bone_Collar_L
						translation = {
							value = (0.0, -0.11, 0.0)
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
			CAS_Highway = {
				desc_id = AxelHighway
			}
			CAS_Gems = {
				desc_id = gem_set_01
			}
			CAS_Guitar_Body = {
				desc_id = guitar_body15
			}
			CAS_Guitar_Finish = {
				desc_id = finish_generic_15
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Guitar_Body_Detail = {
				desc_id = gtr_detail_body15_04
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Neck = {
				desc_id = guitar_neck_03
			}
			CAS_Guitar_Neck_Finish = {
				desc_id = neck_inlay_lightning2
			}
			CAS_Guitar_Head = {
				desc_id = guitar_head_02
				chosen_materials = {
					material1 = yellow_1guitar
				}
			}
			CAS_Guitar_Head_Finish = {
				desc_id = color
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Guitar_Head_Detail = {
				desc_id = GTR_Headtock02_DTL_05
				chosen_materials = {
					material3 = black_1
				}
			}
			CAS_Guitar_Pickguards = {
				desc_id = none
			}
			CAS_Guitar_Bridges = {
				desc_id = guitar_bridge07
				chosen_materials = {
					material1 = orange_1
				}
			}
			CAS_Guitar_Knobs = {
				desc_id = guitar_knobs_body15_03_09
				chosen_materials = {
					material1 = orange_1
				}
			}
			CAS_Guitar_Pickups = {
				desc_id = guitar_pickups02_04
				chosen_materials = {
					material1 = orange_1
				}
			}
			CAS_Bass_Body = {
				desc_id = bass_body_kelly
			}
			CAS_Bass_Finish = {
				desc_id = finish_generic_03b
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Bass_Body_Detail = {
				desc_id = CAB_Body_Kelly_DTL_Tri
				chosen_materials = {
					material1 = black_1
				}
			}
			CAS_Bass_Neck = {
				desc_id = bass_neck_03
			}
			CAS_Bass_Neck_Finish = {
				desc_id = neck_inlay_scallops02
			}
			CAS_Bass_Head = {
				desc_id = bass_head_04
			}
			CAS_Bass_Head_Finish = {
				desc_id = cab_head_01_maple_silverknob_white
				chosen_materials = {
					material1 = red_1
				}
			}
			CAS_Bass_Head_Detail = {
				desc_id = cab_flay_detail04
				chosen_materials = {
					material1 = black_1
				}
			}
			CAS_Bass_Pickguards = {
				desc_id = none
			}
			CAS_Bass_Pickups = {
				desc_id = bass_pickups_03
			}
			CAS_Bass_Bridges = {
				desc_id = bass_bridges_03
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Bass_Knobs = {
				desc_id = CAB_Knob_Grmbl10
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Drums = {
				desc_id = singlebasskit
			}
			CAS_Drum_Finish = {
				desc_id = Drumshell_DS_32
			}
			CAS_Drum_Detail = {
				desc_id = none
				chosen_materials = {
					material1 = Black_1guitar
				}
			}
			CAS_Mic = {
				desc_id = mic_sixties
			}
			CAS_Mic_Stand = {
				desc_id = mic_stand_rock
			}
		}
	}
	{
		name = Rockbot
		fullname = qs("\LRockubot")
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		preset_icon = photo_Rockbot
		blurb = qs("Rockubot's origins are shrouded in mystery. Some say that it was created by a master guitarist to perform as a substitute when he couldn't find the motivation to get on stage, and others say it comes from a planet of android shredders. Whatever Rockubot is, he's fast, he's furious, and he's unstoppable!")
		locked
		polaroid = M_Fun_Rockbot
		price = 15000
		appearance = {
			genre = Rock
			CAS_Full_Body = {
				desc_id = Rockbot
			}
			cas_physique = {
				desc_id = MalePhysique
				bones = {
					Height = 1.0
				}
				additional_bone_transforms = [
					{
						bone = Control_Root
						scaling = {
							value = (0.05, 0.05, 0.05)
						}
					}
				]
			}
			CAS_Male_Intro_Anim = {
				desc_id = Intro_Robot
			}
			CAS_Male_Win_Anim = {
				desc_id = Win_Robot
			}
			CAS_Male_Lose_Anim = {
				desc_id = Lose_Fearful
			}
			CAS_Highway = {
				desc_id = AxelHighway
			}
			CAS_Gems = {
				desc_id = gem_set_01
			}
			$preset_musician_instrument_hack
		}
	}
	{
		name = RandomAppearance0
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
		}
	}
	{
		name = RandomAppearance1
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
		}
	}
	{
		name = RandomAppearance2
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
		}
	}
	{
		name = RandomAppearance3
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		random_appearance_lookup
		appearance = {
		}
	}
	{
		name = WorstFemaleVocalist
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_vocals_appearance
			$worst_female_appearance_hack
		}
	}
	{
		name = WorstFemaleDrummer
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_drum_appearance
			$worst_female_appearance_hack
		}
	}
	{
		name = WorstFemaleGuitarist
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_guitar_appearance
			$worst_female_appearance_hack
		}
	}
	{
		name = WorstFemaleBassist
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		appearance = {
			$worst_female_bass_appearance
			$worst_female_appearance_hack
		}
	}
	{
		name = WorstmaleVocalist
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_vocals_appearance
			$worst_male_appearance_hack
		}
	}
	{
		name = WorstmaleDrummer
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_drum_appearance
			$worst_male_appearance_hack
		}
	}
	{
		name = WorstmaleGuitarist
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_guitar_appearance
			$worst_male_appearance_hack
		}
	}
	{
		name = WorstmaleBassist
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		appearance = {
			$worst_male_bass_appearance
			$worst_male_appearance_hack
		}
	}
	{
		name = EmptyGuy
		allowed_parts = [
			drum
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		appearance = {
			CAS_Body = {
				desc_id = NoBody
			}
			CAS_Bass_Highway = {
				desc_id = AxelHighway
			}
			CAS_Guitar_Highway = {
				desc_id = AxelHighway
			}
			CAS_Drums_Highway = {
				desc_id = AxelHighway
			}
			CAS_Female_Win_Anim = {
				desc_id = Win_Hype
			}
			CAS_Female_Lose_Anim = {
				desc_id = Lose_AngryAtCrowd
			}
			CAS_Female_Intro_Anim = {
				desc_id = Intro_Hype
			}
		}
	}
	{
		name = mii
		fullname = qs(0x80b85738)
		allowed_parts = [
			Vocals
			Vocals
			guitar
			Bass
		]
		selection_not_allowed
		appearance = {
			CAS_Body = {
				desc_id = gh4_mii
			}
			CAS_Male_Base_Torso = {
				desc_id = mii_body
			}
			CAS_Guitar_Body = {
				desc_id = mii_guitar
			}
		}
	}
	{
		name = Mii_Drummer
		fullname = qs(0x04c7925b)
		allowed_parts = [
			Vocals
			Drums
			guitar
			Bass
		]
		selection_not_allowed
		appearance = {
			CAS_Body = {
				desc_id = gh4_mii_drummer
			}
			CAS_Male_Base_Torso = {
				desc_id = mii_drummer_body
			}
			CAS_Drums = {
				desc_id = Mii_Drums
			}
		}
	}
]
