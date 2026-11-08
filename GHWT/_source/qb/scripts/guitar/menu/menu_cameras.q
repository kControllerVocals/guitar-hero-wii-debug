default_camera_transition_time = 0.3
default_camera_transition_params = {
	LockTo = world
	ScreenOffset = (0.0, 0.0)
	motion = smooth
	FOV = 72.0
}
ui_boot_iis_camera = {
	params = {
		pos = (-28.344543, 0.47631302, 7.1957684)
		Quat = (-0.00071999995, -0.99706, -0.07604)
	}
	time = 0.0
	bloom = $Default_tod_manager_bloomOff
}
ui_mainmenu_camera = {
	params = {
		pos = (-28.344543, 0.47631302, 7.1957684)
		Quat = (-0.00071999995, -0.99706, -0.07604)
	}
	video_name = menu
	TransitionDOF = $DOF_mainmenublur_tod_manager
}
ui_band_name_logo_camera = $ui_mainmenu_camera
ui_guitarhero_com_camera = $ui_mainmenu_camera
ui_band_name_logo_edit_camera = {
	params = {
		pos = (-28.854452, 0.47631302, 7.1957684)
		Quat = (-0.00071999995, -0.99706, -0.07604)
	}
}
ui_game_mode_camera = {
	params = {
		pos = (-30.0, -0.15, 5.25)
		Quat = (-0.00071999995, -0.99706, -0.07604)
	}
	time = 0.35000002
	TransitionDOF = $DOF_CloseUp02_tod_manager
	dof = $DOF_UIblur_tod_manager
}
ui_game_mode_no_time_camera = {
	params = {
		pos = (-29.75, -0.05, 5.2)
		Quat = (-0.00071999995, -0.99706, -0.07604)
	}
	time = 0.0
	TransitionDOF = $DOF_CloseUp02_tod_manager
	dof = $DOF_UIblur_tod_manager
}
ui_select_difficulty_camera = $ui_game_mode_camera
ui_select_instrument_camera = $ui_game_mode_camera
ui_band_logo_choose_camera = $ui_options_camera
ui_group_play_camera = $ui_game_mode_camera
ui_select_mp_mode_camera = $ui_game_mode_camera
ui_band_logo_choose_edit_camera = {
	params = {
		pos = (-30.006302, 0.150134, 5.2766047)
		Quat = (-0.016580999, -0.99825096, 0.013075999)
	}
	time = 0.35000002
	TransitionDOF = $DOF_CloseUp02_tod_manager
	dof = $DOF_UIblur_tod_manager
}
ui_options_camera = {
	params = {
		pos = (-27.071413, 0.245, 4.9675922)
		Quat = (-0.002024, 0.99504197, 0.09725501)
	}
	time = 0.35000002
	TransitionDOF = $DOF_CloseUp02_tod_manager
	dof = $DOF_UIblur_tod_manager
}
ui_top_rockers_mode_camera = $ui_options_camera
ui_motd_camera = {
	params = {
		pos = (-28.0003, 0.086454, 3.453506)
		Quat = (-0.00375, 0.9962319, 0.064155)
	}
	time = 0.35000002
	TransitionDOF = $DOF_CloseUp02_tod_manager
	dof = $DOF_UIblur_tod_manager
}
ui_downloads_camera = $ui_motd_camera
ui_bonus_videos_camera = {
	params = {
		pos = (2.7469783, 2.72618, -4.499031)
		Quat = (0.002382, 0.83286697, -0.003583)
	}
	time = 0
}
ui_gig_posters_camera = {
	params = {
		pos = (2.059494, 1.2361621, 3.563647)
		Quat = (0.004165, -0.91177493, 0.009250999)
		FOV = 73.0
	}
	time = 0
}
ui_band_hub_camera = {
	params = {
		pos = (0.444145, 1.6750801, 5.6426005)
		Quat = (0.09144401, -0.74900204, 0.105756)
	}
	time = 0
	video_name = bandselect
}
ui_character_hub_camera = {
	params = {
		pos = (0.444145, 1.6750801, 5.6426005)
		Quat = (0.09144401, -0.74900204, 0.105756)
	}
	time = 0
	video_name = viplounge
}
ui_manage_band_camera = {
	params = {
		pos = (0.646733, 1.5153971, -4.602089)
		Quat = (0.000177, -0.9993379, 0.036047995)
	}
	time = 0
}
ui_options_manage_band_logo_camera = {
	params = {
		pos = (-33.2, -0.0385, 20.7)
		Quat = (0.0, 0.0, -0.0)
	}
	time = 0
}
ui_select_controller_camera = {
	params = {
		pos = (-28.0003, -0.28645402, 3.453506)
		Quat = (-0.00375, 0.9962319, 0.064155)
	}
	time = 0.35000002
	TransitionDOF = $DOF_CloseUp02_tod_manager
	dof = $DOF_UIblur_tod_manager
}
ui_select_practice_mode_camera = {
	params = {
		pos = (-4.3706923, 1.6603589, 13.46266)
		Quat = (0.015245, 0.9728369, -0.067448005)
	}
	time = 0
}
ui_select_tutorial_camera = $ui_select_practice_mode_camera
ui_practice_select_part_camera = $ui_select_practice_mode_camera
ui_practice_select_speed_camera = $ui_select_practice_mode_camera
ui_select_song_section_camera = $ui_select_practice_mode_camera
ui_special_events_camera = $ui_select_practice_mode_camera
ui_character_selection_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (0.0, 1.873141, 5.258747)
		Quat = (0.088123, -0.82403696, 0.13362099)
		FOV = 60
	}
	time = 0
	video_name = CharSelect
}
ui_customize_character_body_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (2.45, 1.2775071, 0.0)
		Quat = (0.000221, 0.998518, -0.053729)
		FOV = 72
	}
	time = 0.4
	video_name = carmenu
}
ui_create_character_gender_camera = $ui_customize_character_body_camera
ui_create_character_genre_camera = $ui_create_character_gender_camera
ui_customize_character_camera = $ui_create_character_gender_camera
ui_customize_character_head_camera = {
	params = {
		LockTo = cas_player1
		pos = (0.5, 1.6, 1.2)
		Quat = (0.0051659998, -1.0, -0.01)
		FOV = 32
		LookAt = cas_player1
		LookAtBone = Bone_Neck
		ScreenOffset = (0.2, 0.65000004)
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
	video_name = headfocus
}
ui_customize_character_head_L_camera = {
	params = {
		LockTo = cas_player1
		pos = (-1.0, 1.6, 0.55)
		Quat = (-0.0075000003, 0.75, -0.01)
		FOV = 32.0
		LookAt = cas_player1
		LookAtBone = Bone_Neck
		ScreenOffset = (0.05, 0.65000004)
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
}
ui_customize_character_head_R_camera = {
	params = {
		LockTo = cas_player1
		pos = (1.3, 1.6, 0.127701)
		Quat = (-0.0075000003, -0.75, 0.0)
		FOV = 32.0
		LookAt = cas_player1
		LookAtBone = Bone_Neck
		ScreenOffset = (0.3, 0.65000004)
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
}
ui_customize_character_head_B_camera = {
	params = {
		LockTo = cas_player1
		pos = (-0.00301, 1.6, -1.2)
		Quat = (0.0051659998, -1.0, -0.01)
		FOV = 32
		LookAt = cas_player1
		LookAtBone = Bone_Neck
		ScreenOffset = (0.2, 0.65000004)
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
}
ui_customize_tat_torso_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.85, 1.577357, -1.0)
		Quat = (0.002092, 0.997189, -0.068486996)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
	video_name = bodyfocus
}
ui_customize_tat_torso_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (0.987154, 1.586909, -2.764546)
		Quat = (0.052789003, 0.79899293, -0.070923)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_tat_torso_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (4.3706474, 1.664935, -2.625755)
		Quat = (0.059632998, -0.77193093, 0.073159)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_tat_torso_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.083645, 1.437092, -4.571922)
		Quat = (-0.007211, -0.009102999, 4.6999998E-05)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_character_body_art_camera = $ui_customize_tat_torso_camera
ui_customize_tat_left_arm_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (3.4303842, 1.52186, -1.279151)
		Quat = (0.041360997, -0.953241, 0.15332001)
		FOV = 72.0
	}
	time = 1
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Tat_L_tod_manager
}
ui_customize_tat_left_arm_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (1.6916201, 1.4483941, -2.422022)
		Quat = (0.065292, 0.73549694, -0.071779)
		FOV = 72.0
	}
	time = 1
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Tat_L_tod_manager
}
ui_customize_tat_left_arm_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (4.0632067, 1.4019221, -2.066564)
		Quat = (0.09559201, -0.70725, 0.097049005)
		FOV = 72.0
	}
	time = 1
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Tat_L_tod_manager
}
ui_customize_tat_left_arm_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (3.544405, 1.3581529, -2.9804041)
		Quat = (0.073348, -0.31130698, 0.024151001)
		FOV = 100
	}
	time = 1
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Tat_L_tod_manager
}
ui_customize_tat_right_arm_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (2.408536, 1.3553499, -1.041427)
		Quat = (0.027535997, 0.97087795, -0.137715)
		FOV = 72.0
	}
	time = 1
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Tat_R_tod_manager
}
ui_customize_tat_right_arm_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (1.913538, 1.395221, -2.191275)
		Quat = (0.06547099, 0.776162, -0.081232004)
		FOV = 72.0
	}
	time = 1
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Tat_R_tod_manager
}
ui_customize_tat_right_arm_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (4.1939325, 1.541618, -2.375696)
		Quat = (0.109372, -0.60758305, 0.084747)
		FOV = 72.0
	}
	time = 1
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Tat_R_tod_manager
}
ui_customize_tat_right_arm_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (3.302931, 1.1622629, -2.737759)
		Quat = (0.060427, -0.192728, 0.0116759995)
		FOV = 100.0
	}
	time = 1
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Tat_R_tod_manager
}
ui_customize_character_stage_presence_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (3.4, 1.398296, 0.5071111)
		Quat = (0.009319, -0.984142, 0.053426)
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Select_Far_tod_manager
}
ui_customize_character_stage_presence_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (-0.45000002, 1.396427, -2.0)
		Quat = (0.031855, 0.805513, -0.043750998)
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelChar_tod_manager
}
ui_customize_character_stage_presence_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (6.3, 1.4930321, -1.9)
		Quat = (0.038818996, -0.69654, 0.037425)
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelChar_tod_manager
}
ui_customize_character_stage_presence_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (3.5610158, 1.112193, -5.65)
		Quat = (0.020193998, -0.025877, 0.000342)
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelChar_tod_manager
}
ui_customize_character_outfit_camera = {
	params = {
		LockTo = world
		pos = (3.9, 0.96028095, 0.15)
		Quat = (0.000778, -0.956392, 0.002553)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Main_tod_manager
}
ui_customize_character_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (0.65000004, 1.2039571, -2.7)
		Quat = (0.029352, 0.73020095, -0.031156)
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_SelGender_tod_manager
	dof = $DOF_CAR_SelGender_tod_manager
}
ui_customize_character_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (5.25, 0.91979396, -1.5)
		Quat = (0.00020099999, -0.73142993, 0.00033500002)
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_SelGender_tod_manager
	dof = $DOF_CAR_SelGender_tod_manager
}
ui_customize_character_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (3.0, 1.228203, -4.65)
		Quat = (0.048579, 0.078579, -0.0037170001)
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_SelGender_tod_manager
	dof = $DOF_CAR_SelGender_tod_manager
}
ui_customize_character_Zoom_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (2.553012, 1.3557069, 0.51200795)
		Quat = (0.00050300005, -0.998549, 0.053712)
		LookAt = world
	}
	time = 0
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelChar_tod_manager
}
ui_customize_Presence_Zoom_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		pos = (3.9392712, 1.483641, 1.2132651)
		Quat = (0.010019, -0.983898, 0.057528)
	}
	time = 0
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Drums_tod_manager
}
ui_customize_torso_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.7, 1.6107371, -0.9)
		Quat = (0.002092, 0.997189, -0.068486996)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
	video_name = bodyfocus
}
ui_customize_torso_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (1.4, 1.575858, -2.0)
		Quat = (0.037047997, 0.833772, -0.056533)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_torso_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (4.3500004, 1.608268, -1.9)
		Quat = (0.050649, -0.76214397, 0.059878998)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_torso_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.3062832, 1.651783, -3.6499999)
		Quat = (0.066957004, -0.015912, 0.00090399996)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_pants_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.6499999, 0.4, -1.0)
		Quat = (-0.0024020001, 0.9972879, 0.04294)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Select_Far_tod_manager
	video_name = legfocus
}
ui_customize_pants_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (1.6, 0.4, -2.2)
		Quat = (-0.026466997, 0.7952429, 0.034964)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_pants_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (4.5, 0.4, -2.2)
		Quat = (-0.032204997, -0.662159, -0.028399998)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_pants_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.6499999, 0.4, -3.6499999)
		Quat = (-0.042502, -0.126972, -0.0051929997)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_shoes_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.75, 0.2, -0.25)
		Quat = (0.005938, -0.99366695, 0.068270996)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Select_mShoes_tod_manager
	video_name = shoefocus
}
ui_customize_shoes_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (1.4499999, 0.2, -1.25)
		Quat = (0.037774, 0.83067095, -0.056380004)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_shoes_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.8, 0.2, -0.75)
		Quat = (0.029408999, -0.845578, 0.046866)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_shoes_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.254224, 0.2, -2.5)
		Quat = (0.092681, -0.035655, 0.003591)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_female_shoes_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.8, 0.25, -0.65000004)
		Quat = (0.005938, -0.99366695, 0.068270996)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Select_fShoes_tod_manager
	video_name = shoefocus
}
ui_customize_female_shoes_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.0, 0.15, -1.75)
		Quat = (0.037774, 0.83067095, -0.056380004)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_female_shoes_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.75, 0.15, -1.25)
		Quat = (0.029408999, -0.845578, 0.046866)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_female_shoes_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.2, 0.15, -3.0)
		Quat = (0.092681, -0.035655, 0.003591)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_SelectTorso_tod_manager
}
ui_customize_character_outfit_accessories_camera = $ui_customize_character_outfit_camera
ui_customize_left_arm_camera = {
	params = {
		LockTo = world
		pos = (3.2, 1.317094, -1.0)
		Quat = (-0.048584003, -0.886823, -0.096260004)
		FOV = 72.0
	}
	time = 0.8
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_armACCL_tod_manager
	video_name = leftarmfocus
}
ui_customize_left_arm_L_camera = {
	params = {
		LockTo = world
		pos = (2.1, 1.4, -1.25)
		Quat = (-0.037729003, 0.89221597, 0.07549301)
		FOV = 72.0
	}
	time = 0.8
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_armACCL_tod_manager
}
ui_customize_left_arm_R_camera = {
	params = {
		LockTo = world
		pos = (3.603169, 1.306352, -1.55)
		Quat = (-0.083031, -0.633057, -0.068790995)
		FOV = 72.0
	}
	time = 0.8
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_ACCL_tod_manager
}
ui_customize_left_arm_B_camera = {
	params = {
		LockTo = world
		pos = (2.25, 1.4895729, -2.2)
		Quat = (0.0054889997, 0.45031303, -0.0029580002)
		FOV = 72.0
	}
	time = 0.8
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_ACCL_tod_manager
}
ui_customize_right_arm_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.6499999, 1.542038, -0.45000002)
		Quat = (0.00024, -0.99931896, 0.0064509995)
		FOV = 72.0
	}
	time = 0.8
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_ACCL_tod_manager
	video_name = rightarmfocus
}
ui_customize_right_arm_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.0, 1.5397909, -1.2)
		Quat = (0.015379, 0.845384, -0.024394998)
		FOV = 72.0
	}
	time = 0.8
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_ACCL_tod_manager
}
ui_customize_right_arm_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.786987, 1.540694, -1.3499999)
		Quat = (0.015225, -0.639398, 0.012697)
		FOV = 72.0
	}
	time = 0.8
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_ACCL_tod_manager
}
ui_customize_right_arm_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.6, 1.543215, -2.0)
		Quat = (0.020177, -0.25, 0.0011489999)
		FOV = 72.0
	}
	time = 0.8
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_ACCL_tod_manager
}
ui_customize_face_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.940826, 1.65, -1.3281509)
		Quat = (0.001947, -0.9968769, 0.027490998)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
	video_name = headfocus
}
ui_customize_hat_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.1408257, 1.5142471, -1.3281509)
		Quat = (-0.005829, -0.98906994, -0.040585)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
	video_name = hatfocus
}
ui_customize_piercings_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.1408257, 1.6543466, -1.4281509)
		Quat = (0.001947, -0.9968769, 0.027490998)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
	video_name = headfocus
}
ui_customize_character_hair_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.2, 1.7, -1.5)
		Quat = (0.0016050001, -0.99083996, 0.0117029995)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
	video_name = headfocus
}
ui_customize_character_hair_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.2, 1.7, -2.35)
		Quat = (0.01416, 0.75107694, -0.016181)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
}
ui_customize_character_hair_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (4.0, 1.7, -2.2)
		Quat = (0.00946, -0.648634, 0.008011)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
}
ui_customize_character_hair_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.1499999, 1.7, -3.1)
		Quat = (-0.005748, 0.11969901, 0.00070599996)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
}
ui_customize_character_face_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.940826, 1.5346599, -1.3281509)
		Quat = (0.001947, -0.9968769, 0.027490998)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
	video_name = headfocus
}
ui_customize_character_face_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.2, 1.5346599, -2.35)
		Quat = (0.01416, 0.75107694, -0.016181)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
}
ui_customize_character_face_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (4.0, 1.5346599, -2.2)
		Quat = (0.00946, -0.648634, 0.008011)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
}
ui_customize_character_face_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.1499999, 1.5346599, -3.1)
		Quat = (-0.005748, 0.11969901, 0.00070599996)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
}
ui_customize_character_hat_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.1408257, 1.5142471, -1.3281509)
		Quat = (-0.005829, -0.98906994, -0.040585)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
	video_name = hatfocus
}
ui_customize_character_hat_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.2, 1.5142471, -2.35)
		Quat = (0.01416, 0.75107694, -0.016181)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
}
ui_customize_character_hat_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (4.0, 1.5142471, -2.2)
		Quat = (0.00946, -0.648634, 0.008011)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
}
ui_customize_character_hat_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.1499999, 1.5142471, -3.1)
		Quat = (-0.005748, 0.11969901, 0.00070599996)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
}
ui_customize_character_piercings_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.1408257, 1.5434659, -1.4281509)
		Quat = (0.001947, -0.9968769, 0.027490998)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
	video_name = headfocus
}
ui_customize_character_piercings_L_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (2.2, 1.5434659, -2.35)
		Quat = (0.01416, 0.75107694, -0.016181)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
}
ui_customize_character_piercings_R_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (4.0, 1.5434659, -2.2)
		Quat = (0.00946, -0.648634, 0.008011)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
}
ui_customize_character_piercings_B_camera = {
	controlscript = CameraCuts_HandCam
	params = {
		LockTo = world
		pos = (3.1499999, 1.5434659, -3.1)
		Quat = (-0.005748, 0.11969901, 0.00070599996)
		FOV = 72.0
	}
	time = 0.4
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Glasses_tod_manager
}
ui_customize_character_instrument_camera = {
	params = {
		LockTo = world
		pos = (0.515432, 1.5286509, -5.3907733)
		Quat = (-0.0057320003, 0.467209, 0.003029)
		FOV = 72.0
	}
	time = 0.5
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Instr_tod_manager
	video_name = guitarcenter
}
ui_cag_main_camera = {
	params = {
		LockTo = world
		pos = (7.75, 1.6, 4.92)
		Quat = (0.055, 0.7828869, -0.02)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
	video_name = guitarfocus
}
ui_cag_main_L_camera = {
	params = {
		LockTo = world
		pos = (8.650001, 1.6, 3.5)
		Quat = (0.05, 0.21649201, 0.019901)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_main_R_camera = {
	params = {
		LockTo = world
		pos = (8.650001, 1.75, 6.2)
		Quat = (0.0, 0.9856969, -0.125)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_main_B_camera = {
	params = {
		LockTo = world
		pos = (10.45, 1.75, 5.0)
		Quat = (0.05, -0.73661494, 0.1)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_customize_cag_zoom_camera = {
	params = {
		LockTo = world
		pos = (7.538249, 1.026929, 5.046952)
		Quat = (-0.069049, 0.79575497, 0.092419)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_custom_camera = $ui_cag_main_camera
ui_cag_custom_body_camera = {
	params = {
		LockTo = world
		pos = (7.9195194, 1.1188589, 4.9365726)
		Quat = (-0.012337, 0.77234495, 0.0150069995)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_custom_body_L_camera = {
	params = {
		LockTo = world
		pos = (8.4622755, 1.1188589, 3.7561781)
		Quat = (-0.018462999, 0.31114197, 0.006046)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_custom_body_R_camera = {
	params = {
		LockTo = world
		pos = (8.497575, 1.1134471, 5.8785853)
		Quat = (-0.0025310002, 0.983809, 0.013935999)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_custom_body_B_camera = {
	params = {
		LockTo = world
		pos = (10.297553, 1.106879, 4.7939787)
		Quat = (-0.011357, -0.64336306, -0.009546)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_custom_head_camera = {
	params = {
		LockTo = world
		pos = (8.1813755, 1.874804, 4.858207)
		Quat = (-0.030912, 0.78604895, 0.039436)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_custom_head_L_camera = {
	params = {
		LockTo = world
		pos = (8.4547615, 1.874804, 4.009616)
		Quat = (-0.046817996, 0.35588104, 0.017854)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_custom_head_R_camera = {
	params = {
		LockTo = world
		pos = (8.7150545, 1.8762481, 5.6441674)
		Quat = (-0.0062320004, 0.99099195, 0.049717996)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_custom_head_B_camera = {
	params = {
		LockTo = world
		pos = (9.851452, 1.85373, 4.773564)
		Quat = (-0.038969, -0.62783206, -0.031499)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_custom_basshead_camera = {
	params = {
		LockTo = world
		pos = (8.282441, 1.961865, 5.097465)
		Quat = (-0.027128998, 0.83970696, 0.042128)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_select_fretboard_camera = {
	params = {
		LockTo = world
		pos = (8.11587, 1.416816, 4.8338785)
		Quat = (-0.045152, 0.749616, 0.051410995)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_select_fretboard_L_camera = {
	params = {
		LockTo = world
		pos = (8.597752, 1.416816, 3.9841957)
		Quat = (-0.065262, 0.299759, 0.020558)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_select_fretboard_R_camera = {
	params = {
		LockTo = world
		pos = (8.508895, 1.393021, 5.5539145)
		Quat = (-0.017724998, 0.963602, 0.066087)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_select_fretboard_B_camera = {
	params = {
		LockTo = world
		pos = (8.11587, 1.416816, 4.8338785)
		Quat = (-0.045152, 0.749616, 0.051410995)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_tod_manager
}
ui_cag_custom_hardware_camera = {
	params = {
		LockTo = world
		pos = (8.279569, 1.1110431, 4.858363)
		Quat = (0.006996, 0.75294393, -0.008007)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_Hardware_tod_manager
	video_name = guitarfocus
}
ui_cag_custom_hardware_L_camera = {
	params = {
		LockTo = world
		pos = (8.74328, 1.1110431, 4.033134)
		Quat = (-0.023586, 0.226384, 0.0054829996)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_Hardware_tod_manager
}
ui_cag_custom_hardware_R_camera = {
	params = {
		LockTo = world
		pos = (8.706615, 1.1110431, 5.4357634)
		Quat = (0.0021130003, 0.9799749, -0.010421)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_Hardware_tod_manager
}
ui_cag_custom_hardware_B_camera = {
	params = {
		LockTo = world
		pos = (9.930282, 1.1095569, 4.830355)
		Quat = (-0.0187, -0.66112906, -0.016489)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Guitar_Hardware_tod_manager
}
ui_cag_custom_strings_camera = {
	params = {
		pos = (8.998475, 0.811528, 0.427562)
		Quat = (-0.044728, 0.516153, 0.027003998)
	}
	time = 0.3
}
ui_cadrm_main_camera = {
	params = {
		pos = (7.626858, 1.7709501, -0.81576604)
		Quat = (0.053464, 0.81314903, -0.075652)
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Drums_tod_manager
	video_name = drumfocus
}
ui_cadrm_hub_camera = $ui_cadrm_main_camera
ui_cad_select_size_camera = {
	params = {
		LockTo = world
		pos = (8.118747, 2.481081, 0.393139)
		Quat = (0.083954, 0.89098793, -0.184011)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Main_tod_manager
}
ui_cad_select_shell_camera = {
	params = {
		LockTo = world
		pos = (9.453998, 1.686456, -3.396493)
		Quat = (0.120521, 0.38282603, -0.05045)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Drums_tod_manager
}
ui_cad_select_skin_camera = {
	params = {
		LockTo = world
		pos = (8.21873, 0.94351107, -1.3301979)
		Quat = (0.015362, 0.76230294, -0.018103)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Drums_tod_manager
}
ui_cad_select_drumsticks_camera = {
	params = {
		LockTo = world
		pos = (9.933798, 1.5534699, -1.1540959)
		Quat = (-0.00371, 0.79761297, 0.00491)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_sel_drumsticks_tod_manager
}
ui_cadrm_zoom_camera = {
	params = {
		pos = (6.751408, 1.945275, -0.505685)
		Quat = (0.056385003, 0.790026, -0.073501)
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Drums_tod_manager
}
ui_customize_character_mic_camera = {
	params = {
		LockTo = world
		pos = (5.3300505, 1.3349129, 6.237978)
		Quat = (0.011565001, 0.56542206, -0.007929001)
		FOV = 72.0
	}
	time = 0.3
	video_name = micfocus
}
ui_customize_character_mic_main_camera = $ui_customize_character_mic_camera
ui_customize_character_mic_L_camera = {
	params = {
		LockTo = world
		pos = (9.456195, 1.3247498, 5.195224)
		Quat = (0.013668, -0.223131, 0.003129)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_MicStand_tod_manager
}
ui_customize_character_mic_R_camera = {
	params = {
		LockTo = world
		pos = (5.964231, 1.326442, 8.741877)
		Quat = (0.015261999, 0.897932, -0.031233998)
		FOV = 80.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_MicStand_tod_manager
}
ui_customize_character_mic_B_camera = {
	params = {
		LockTo = world
		pos = (9.441744, 1.3240888, 8.4572525)
		Quat = (0.017733, -0.844683, 0.028038999)
		FOV = 90.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_MicStand_tod_manager
}
ui_customize_mic_zoom_camera = {
	params = {
		LockTo = world
		pos = (4.5162563, 1.3593869, 5.923488)
		Quat = (0.011565001, 0.56542206, -0.007929001)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_MicStand_tod_manager
}
ui_customize_microphone_camera = {
	params = {
		LockTo = world
		pos = (7.382661, 1.8387159, 6.485554)
		Quat = (0.025770001, 0.264277, -0.007062)
		FOV = 72.0
	}
	time = 0.0
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Microphone_tod_manager
}
ui_customize_microphone_F_camera = {
	params = {
		LockTo = world
		pos = (7.482661, 1.8387159, 6.485554)
		Quat = (0.025770001, 0.264277, -0.007062)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Microphone_tod_manager
}
ui_customize_microphone_L_camera = {
	params = {
		LockTo = world
		pos = (7.9191303, 1.8349569, 6.603429)
		Quat = (0.009803999, -0.14385399, 0.0014270002)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Microphone_tod_manager
}
ui_customize_microphone_R_camera = {
	params = {
		LockTo = world
		pos = (7.052484, 1.8387129, 7.1684747)
		Quat = (0.016017, 0.783572, -0.020215)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Microphone_tod_manager
}
ui_customize_microphone_B_camera = {
	params = {
		LockTo = world
		pos = (7.5951033, 1.818718, 7.7118473)
		Quat = (0.000405, -0.995362, 0.0042160004)
		FOV = 72.0
	}
	time = 0.3
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_Sel_Microphone_tod_manager
}
ui_Mocap_01_camera = {
	params = {
		LockTo = frontend_mocap_lock_target_01
		LockToBone = bone_camera
		pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	time = 0.8
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_ACCL_tod_manager
}
ui_Mocap_02_camera = {
	params = {
		LockTo = frontend_mocap_lock_target_02
		LockToBone = bone_camera
		pos = (0.0, 0.0, 0.0)
		Quat = (0.0, 0.0, 0.0)
		FOV = 72.0
	}
	time = 0.8
	TransitionDOF = $DOF_CAR_Main_tod_manager
	dof = $DOF_CAR_ACCL_tod_manager
}
