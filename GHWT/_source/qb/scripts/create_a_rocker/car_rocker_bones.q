CAR_Bones_Female_Face = [
	{
		frontend_desc = qs("Head")
		group_name = HeadSize
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Bone_Trans_Eye_L
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Eye_R
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Nosebridge
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = Bone_Scale_Nose_Tip
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = Bone_Jaw
				scaling = {
					from = -0.05
					to = 0.09
					no_propagate
				}
			}
			{
				bone = Bone_Head
				scaling = {
					from = -0.025
					to = 0.05
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Face Fullness")
		group_name = FaceFullness
		bones = [
			{
				bone = Bone_Head
				scaling = {
					from = (0.0, 0.0, -0.003)
					to = (0.0, 0.0, 0.085)
					no_propagate
				}
			}
			{
				bone = Bone_Jaw
				scaling = {
					from = (0.0, 0.0, -0.3)
					to = (0.0, 0.0, 0.2)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Jaw Scale")
		group_name = JawScale
		bones = [
			{
				bone = Bone_Jaw
				scaling = {
					from = -0.1
					to = 0.09
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Nose Size")
		group_name = NoseSize
		bones = [
			{
				bone = Bone_Trans_Nosebridge
				scaling = {
					from = -0.3
					to = 0.4
					no_propagate
				}
			}
			{
				bone = Bone_Scale_Nose_Tip
				scaling = {
					from = -0.3
					to = 0.4
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Nose Tip")
		group_name = NoseTip
		bones = [
			{
				bone = Bone_Scale_Nose_Tip
				scaling = {
					from = (-0.2, 0.0, -0.2)
					to = (0.3, 0.0, 0.2)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Nose Width")
		group_name = NoseWidth
		bones = [
			{
				bone = Bone_Trans_Nosebridge
				scaling = {
					from = (-0.1, 0.0, -0.0025000002)
					to = (0.3, 0.0, 0.0015)
					no_propagate
				}
			}
			{
				bone = Bone_Scale_Nose_Tip
				scaling = {
					from = (-0.2, 0.0, -0.006)
					to = (0.7, 0.0, 0.004)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Nose Angle")
		group_name = NoseAngle
		bones = [
			{
				bone = Bone_Scale_Nose_Tip
				rotation = {
					from = (10.0, 0.0, 0.0)
					to = (-10.0, 0.0, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Nose Bridge")
		group_name = NoseBridge
		bones = [
			{
				bone = Bone_Trans_Nosebridge
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.008, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Upper Lip Thickness")
		group_name = UpperLipThickness
		bones = [
			{
				bone = Bone_Lip_Upper_Corner_L
				scaling = {
					from = (-0.2, 0.0, -0.1)
					to = (0.3, 0.05, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Upper_Corner_R
				scaling = {
					from = (-0.2, 0.0, -0.1)
					to = (0.3, 0.05, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Upper_Mid
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.4, 0.1, 0.4)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Lower Lip Thickness")
		group_name = LowerLipThickness
		bones = [
			{
				bone = Bone_Lip_Lower_Corner_L
				scaling = {
					from = (-0.2, 0.0, -0.1)
					to = (0.3, 0.05, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Lower_Corner_R
				scaling = {
					from = (-0.2, 0.0, -0.1)
					to = (0.3, 0.05, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Lower_Mid
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.6, 0.1, 0.3)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Eye Position")
		group_name = EyePosition
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Bone_Trans_Eye_R
				translation = {
					from = (0.005, 0.0, 0.0)
					to = (-0.005, 0.0, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Eye_L
				translation = {
					from = (0.005, 0.0, 0.0)
					to = (-0.005, 0.0, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Eye Depth")
		group_name = EyeDepth
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Bone_Trans_Eye_R
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.001, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Eye_L
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.001, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Eye Scale")
		group_name = EyeScale
		bones = [
			{
				bone = Bone_Trans_Eye_R
				scaling = {
					from = -0.25
					to = 0.25
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Eye_L
				scaling = {
					from = -0.25
					to = 0.25
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Eye Distance")
		group_name = EyeDistance
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Bone_Trans_Eye_R
				translation = {
					from = (0.0, 0.0, 0.0015)
					to = (0.0, 0.0, -0.002)
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Eye_L
				translation = {
					from = (0.0, 0.0, -0.0015)
					to = (0.0, 0.0, 0.002)
					no_propagate
				}
			}
		]
	}
]
CAR_Bones_Male_Face = [
	{
		frontend_desc = qs("Head")
		group_name = HeadSize
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Bone_Trans_Eye_L
				scaling = {
					from = -0.05
					to = 0.09
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Eye_R
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Nosebridge
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = Bone_Scale_Nose_Tip
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = Bone_Jaw
				scaling = {
					from = -0.05
					to = 0.1
					no_propagate
				}
			}
			{
				bone = Bone_Head
				scaling = {
					from = -0.025
					to = 0.05
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Face Fullness")
		group_name = FaceFullness
		bones = [
			{
				bone = Bone_Head
				scaling = {
					from = (0.0, 0.0, -0.002)
					to = (0.0, 0.0, 0.095000006)
					no_propagate
				}
			}
			{
				bone = Bone_Jaw
				scaling = {
					from = (0.0, 0.0, -0.15)
					to = (0.0, 0.0, 0.15)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Jaw Scale")
		group_name = JawScale
		bones = [
			{
				bone = Bone_Jaw
				scaling = {
					from = -0.05
					to = 0.08
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Nose Size")
		group_name = NoseSize
		bones = [
			{
				bone = Bone_Trans_Nosebridge
				scaling = {
					from = -0.3
					to = 0.4
					no_propagate
				}
			}
			{
				bone = Bone_Scale_Nose_Tip
				scaling = {
					from = -0.3
					to = 0.4
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Nose Tip")
		group_name = NoseTip
		bones = [
			{
				bone = Bone_Scale_Nose_Tip
				scaling = {
					from = (-0.2, 0.0, -0.2)
					to = (0.3, 0.0, 0.2)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Nose Width")
		group_name = NoseWidth
		bones = [
			{
				bone = Bone_Trans_Nosebridge
				scaling = {
					from = (-0.2, 0.0, -0.006)
					to = (0.3, 0.0, 0.0015)
					no_propagate
				}
			}
			{
				bone = Bone_Scale_Nose_Tip
				scaling = {
					from = (-0.2, 0.0, -0.006)
					to = (0.7, 0.0, 0.004)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Nose Angle")
		group_name = NoseAngle
		bones = [
			{
				bone = Bone_Scale_Nose_Tip
				rotation = {
					from = (20.0, 0.0, 0.0)
					to = (-20.0, 0.0, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Nose Bridge")
		group_name = NoseBridge
		bones = [
			{
				bone = Bone_Trans_Nosebridge
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.005, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Upper Lip Thickness")
		group_name = UpperLipThickness
		bones = [
			{
				bone = Bone_Lip_Upper_Corner_L
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.3, 0.1, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Upper_Corner_R
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.3, 0.1, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Upper_Mid
				scaling = {
					from = (-0.5, 0.0, -0.25)
					to = (0.4, 0.15, 0.4)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Lower Lip Thickness")
		group_name = LowerLipThickness
		bones = [
			{
				bone = Bone_Lip_Lower_Corner_L
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.7, 0.2, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Lower_Corner_R
				scaling = {
					from = (-0.4, 0.0, -0.2)
					to = (0.7, 0.2, 0.3)
					no_propagate
				}
			}
			{
				bone = Bone_Lip_Lower_Mid
				scaling = {
					from = (-0.35000002, 0.0, -0.2)
					to = (0.35000002, 0.1, 0.35000002)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Eye Position")
		group_name = EyePosition
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Bone_Trans_Eye_R
				translation = {
					from = (0.005, 0.0, 0.0)
					to = (-0.005, 0.0, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Eye_L
				translation = {
					from = (0.005, 0.0, 0.0)
					to = (-0.005, 0.0, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Eye Depth")
		group_name = EyeDepth
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Bone_Trans_Eye_R
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.001, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Eye_L
				translation = {
					from = (0.0, 0.005, 0.0)
					to = (0.0, -0.001, 0.0)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Eye Scale")
		group_name = EyeScale
		bones = [
			{
				bone = Bone_Trans_Eye_R
				scaling = {
					from = -0.25
					to = 0.25
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Eye_L
				scaling = {
					from = -0.25
					to = 0.25
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Eye Distance")
		group_name = EyeDistance
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Bone_Trans_Eye_R
				translation = {
					from = (0.0, 0.0, 0.0015)
					to = (0.0, 0.0, -0.002)
					no_propagate
				}
			}
			{
				bone = Bone_Trans_Eye_L
				translation = {
					from = (0.0, 0.0, -0.0015)
					to = (0.0, 0.0, 0.002)
					no_propagate
				}
			}
		]
	}
]
CAR_Bones_Female_Body = [
	{
		frontend_desc = qs("Physique")
		group_name = Physique
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Bone_Pelvis
				scaling = {
					from = (0.0, -0.2, -0.15)
					to = (0.0, 0.2, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Upper
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Chest
				scaling = {
					from = (0.0, -0.05, -0.0125)
					to = (0.0, 0.05, 0.05)
					no_propagate
				}
			}
			{
				bone = Bone_Neck
				scaling = {
					from = (0.0, 0.2, 0.2)
					to = (0.0, -0.4, -0.4)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_R
				scaling = {
					from = (-0.2, -0.2, -0.2)
					to = (0.35000002, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_L
				scaling = {
					from = (-0.2, -0.2, -0.2)
					to = (0.35000002, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_L
				scaling = {
					from = (0.0, -0.3, -0.3)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_R
				scaling = {
					from = (0.0, -0.3, -0.3)
					to = (0.0, 0.1, 0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_R
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_L
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_R
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_L
				scaling = {
					from = (0.0, -0.05, -0.05)
					to = (0.0, 0.05, 0.05)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Height")
		group_name = Height
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Control_Root
				scaling = {
					from = (-0.025, -0.025, -0.025)
					to = (0.025, 0.025, 0.025)
				}
			}
		]
	}
	{
		frontend_desc = qs("Chest")
		group_name = Chest
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Bone_Chest
				scaling = {
					from = (-0.015, -0.15, 0.0)
					to = (0.015, 0.1, 0.0)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.0015, 0.0)
					no_propagate
				}
			}
		]
	}
]
CAR_Bones_Male_Body = [
	{
		frontend_desc = qs("Physique")
		group_name = Physique
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Bone_Pelvis
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Lower
				scaling = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, -0.1, -0.1)
					no_propagate
				}
			}
			{
				bone = Bone_Stomach_Upper
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.0, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Chest
				scaling = {
					from = (0.0, -0.2, -0.05)
					to = (0.15, 0.2, 0.2)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0, 0.005, 0.0)
					no_propagate
				}
			}
			{
				bone = Bone_Neck
				scaling = {
					from = (0.0, -0.4, -0.4)
					to = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_R
				scaling = {
					from = (-0.2, -0.2, -0.35000002)
					to = (0.2, 0.5, 0.75)
					no_propagate
				}
				translation = {
					from = (0.0, 0.0, 0.0)
					to = (0.0025000002, 0.0, -0.005)
					no_propagate
				}
			}
			{
				bone = Bone_Twist_Bicep_Top_L
				scaling = {
					from = (-0.2, -0.2, -0.35000002)
					to = (0.2, 0.5, 0.75)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_L
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Bicep_R
				scaling = {
					from = (0.0, -0.1, -0.1)
					to = (0.0, 0.2, 0.2)
					no_propagate
				}
			}
			{
				bone = Bone_Forearm_L
				scaling = {
					from = (0.0, -0.2, -0.2)
					to = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = Bone_Forearm_R
				scaling = {
					from = (0.0, -0.2, -0.2)
					to = (0.0, 0.25, 0.25)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_R
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Thigh_L
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_R
				scaling = {
					from = (0.0, -0.15, -0.15)
					to = (0.0, 0.15, 0.15)
					no_propagate
				}
			}
			{
				bone = Bone_Knee_L
				scaling = {
					from = (0.0, -0.05, -0.05)
					to = (0.0, 0.05, 0.05)
					no_propagate
				}
			}
		]
	}
	{
		frontend_desc = qs("Height")
		group_name = Height
		min = -1.0
		max = 1.0
		bones = [
			{
				bone = Control_Root
				scaling = {
					from = (-0.025, -0.025, -0.025)
					to = (0.025, 0.025, 0.025)
				}
			}
		]
	}
]
