generic_widget_scale_params = {
	step = 0.1
	fill_type = `Center Out`
	icon = widget_scale
	pad_direction = vert
}
generic_widget_spread_horiz_params = {
	step = 0.1
	fill_type = `Center Left/Right`
	icon = widget_spread
	pad_direction = horiz
}
generic_widget_spread_vert_params = {
	step = 0.1
	fill_type = `Center Up/Down`
	icon = widget_spread
	icon_rot = 90
	pad_direction = vert
}
generic_widget_move_vert_params = {
	step = 0.1
	fill_type = `Center Up/Down`
	icon = widget_uni_move
	pad_direction = vert
}
generic_widget_move_horz_params = {
	step = 0.1
	fill_type = `Center Left/Right`
	icon = widget_uni_move
	icon_rot = 90
	pad_direction = horiz
}
cas_head_bone_options = [
	{
		text = qs("SIZE")
		group_name = HeadSize
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs("FULLNESS")
		group_name = FaceFullness
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs("JAW SCALE")
		group_name = JawScale
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs("CHIN SIZE")
		$generic_widget_spread_horiz_params
		group_name = ChinSize
		bonemenu
	}
	{
		text = qs("CHIN WIDTH")
		$generic_widget_spread_horiz_params
		group_name = ChinWidth
		bonemenu
	}
	{
		text = qs("CHEEKBONE")
		group_name = CheekboneShape
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs("EAR ANGLE")
		group_name = EarAngle
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs("EAR TIP")
		group_name = EarTip
		$generic_widget_spread_vert_params
		bonemenu
	}
]
cas_nose_bone_options = [
	{
		text = qs("SIZE")
		group_name = NoseSize
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs("TIP")
		group_name = NoseTip
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs("WIDTH")
		group_name = NoseWidth
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs("ANGLE")
		group_name = NoseAngle
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs("DEPTH")
		group_name = NoseDepth
		$generic_widget_move_horz_params
		bonemenu
	}
	{
		text = qs("POSITION")
		group_name = NosePosition
		$generic_widget_move_vert_params
		invert = {
			invert
		}
		bonemenu
	}
	{
		text = qs("BRIDGE")
		group_name = NoseBridge
		$generic_widget_move_horz_params
		bonemenu
	}
	{
		text = qs("BROKEN")
		group_name = NoseBroken
		$generic_widget_spread_horiz_params
		bonemenu
	}
]
cas_mouth_bone_options = [
	{
		text = qs("SIZE")
		group_name = MouthScale
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs("ANGLE")
		group_name = MouthAngle
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs("DEPTH")
		group_name = MouthDepth
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs("POSITION")
		group_name = MouthPosition
		$generic_widget_move_vert_params
		invert = {
			invert
		}
		bonemenu
	}
	{
		text = qs("LIP SHAPE")
		group_name = LipShape
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs("UPPER LIP")
		group_name = UpperLipThickness
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs("LOWER LIP")
		group_name = LowerLipThickness
		$generic_widget_scale_params
		bonemenu
	}
]
cas_eye_bone_options = [
	{
		text = qs("ANGLE")
		group_name = EyeAngle
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs("SHAPE")
		group_name = EyeShape
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs("POSITION")
		group_name = EyePosition
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs("DEPTH")
		group_name = EyeDepth
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs("SCALE")
		group_name = EyeScale
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs("DISTANCE")
		group_name = EyeDistance
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs("COLOR")
		desc_id = EyeColor
		hist_tex = icon_iris
		part = CAS_Eyes
		stance = Stance_Select_Head
		replacemenu
	}
]
cas_brow_bone_options = [
	{
		text = qs("SHAPE")
		group_name = EyebrowShape
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs("SIZE")
		group_name = EyebrowSize
		$generic_widget_scale_params
		bonemenu
	}
	{
		text = qs("ANGLE")
		group_name = EyebrowAngle
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs("DISTANCE")
		group_name = EyebrowDistance
		$generic_widget_spread_horiz_params
		bonemenu
	}
	{
		text = qs("POSITION")
		group_name = BrowPosition
		$generic_widget_move_vert_params
		bonemenu
	}
	{
		text = qs("DEPTH")
		group_name = BrowDepth
		$generic_widget_spread_horiz_params
		bonemenu
	}
]
cas_physique_bone_options = [
	{
		text = qs("HEIGHT")
		group_name = Height
		step = 0.1
		fill_type = `Bottom to Top`
		icon = widget_uni_scale
		bonemenu
	}
]
cag_instruments = [
	{
		text = qs("GUITAR")
		icon = icon_cag_guitar
		desc_id = guitar
		instrument_name = guitar
		body_part = CAS_Guitar_Body
		neck_part = CAS_Guitar_Neck
		head_part = CAS_Guitar_Head
		pick_guard_part = CAS_Guitar_Pickguards
		pickups_part = CAS_Guitar_Pickups
		knobs_part = CAS_Guitar_Knobs
		bridge_part = CAS_Guitar_Bridges
		string_part = CAS_Guitar_Strings
		highway_part = CAS_Guitar_Highway
		detail_part = CAS_Guitar_Body_Detail
		finish_part = CAS_Guitar_Finish
		logo_part = cas_guitar_logo
		head_finish_part = CAS_Guitar_Head_Finish
		head_detail_part = CAS_Guitar_Head_Detail
		neck_finish_part = CAS_Guitar_Neck_Finish
		pickgaurd_finish_part = CAS_Guitar_Pickguard_Finish
	}
	{
		text = qs("BASS")
		icon = icon_cag_bass
		desc_id = Bass
		instrument_name = Bass
		body_part = CAS_Bass_Body
		neck_part = CAS_Bass_Neck
		head_part = CAS_Bass_Head
		pick_guard_part = CAS_Bass_Pickguards
		pickups_part = CAS_Bass_Pickups
		knobs_part = CAS_Bass_Knobs
		bridge_part = CAS_Bass_Bridges
		string_part = CAS_Bass_Strings
		highway_part = CAS_Bass_Highway
		detail_part = CAS_Bass_Body_Detail
		finish_part = CAS_Bass_Finish
		logo_part = CAS_Bass_Logo
		head_finish_part = CAS_Bass_Head_Finish
		neck_finish_part = CAS_Bass_Neck_Finish
		pickgaurd_finish_part = cas_bass_pickguard_finish
	}
	{
		text = qs("DRUM")
		desc_id = drum
		instrument_name = drum
		body_part = CAS_Drums
		highway_part = CAS_Drums_Highway
		stick_part = CAS_Drums_Sticks
		detail_part = CAS_Drum_Detail
		finish_part = CAS_Drum_Finish
	}
	{
		text = qs("MIC")
		desc_id = mic
		instrument_name = mic
		body_part = CAS_Mic
		stand_part = CAS_Mic_Stand
	}
]
Genre_List = [
	{
		frontend_desc = qs("ROCK")
		desc_id = Rock
		icon = icon_genre_Rock
	}
	{
		frontend_desc = qs("PUNK")
		desc_id = Punk
		icon = icon_genre_Punk
	}
	{
		frontend_desc = qs("METAL")
		desc_id = `Heavy Metal`
		icon = icon_genre_HeavyMetal
	}
	{
		frontend_desc = qs("GLAM")
		desc_id = `Glam Rock`
		icon = icon_genre_Glam
	}
	{
		frontend_desc = qs("BLACK METAL")
		desc_id = `Black Metal`
		icon = icon_genre_BlackMetal
	}
	{
		frontend_desc = qs("CLASSIC")
		desc_id = `Classic Rock`
		icon = icon_genre_Classic
	}
	{
		frontend_desc = qs("GOTH")
		desc_id = Goth
		icon = icon_genre_Goth
	}
	{
		frontend_desc = qs("POP")
		desc_id = Pop
		icon = icon_genre_Pop
	}
	{
		frontend_desc = qs("MIXED")
		desc_id = any
		icon = icon_genre_Mix
	}
]
