character_head_viewport_props = {
	viewport = character_head_viewport
	camera = character_head_camera
	style = character_head_rendering
}
character_head_viewport_props_ps3 = {
	viewport = character_head_viewport
	camera = character_head_camera
	style = character_head_rendering_ps3
}

script begin_car_capture \{test = 0}
	kill_car_capture
	if cas_player_has_character_object player = ($cas_current_player)
		if IsPs3
			AddParams ($character_head_viewport_props_ps3)
		else
			AddParams ($character_head_viewport_props)
		endif
		if ViewportExists id = <viewport>
			ScriptAssert \{'Viewport still hanging around'}
		endif
		CreateViewport {
			priority = 6
			id = <viewport>
			style = <style>
		}
		if (<test> = 1)
			CreateScreenElement {
				id = photo_test
				type = ViewportElement
				parent = root_window
				texture = white
				scale = (128.0, 128.0)
				pos = (50.0, 50.0)
				just = [left top]
				z_priority = 15
				existing_viewport_id = <viewport>
			}
			SetViewportProperties viewport = <viewport> active = true
			SetActiveCamera id = viewer_cam viewport = <viewport>
			viewer_cam :SetHFov \{hfov = 45}
		else
			SetViewportProperties viewport = <viewport> active = false
		endif
		fxParam = $DOF_CAR_Photo_tod_manager
		ScreenFX_ClearFXInstances viewport = <viewport>
		if StructureContains \{Structure = fxParam
				screen_fx}
			begin
			if GetNextArrayElement (<fxParam>.screen_fx)
				ScreenFX_AddFXInstance {
					viewport = <viewport>
					<element>
				}
			else
				break
			endif
			repeat
		endif
		destroy_popup_warning_menu
		destroy_band_money_display
		Wait \{2
			gameframes}
	endif
endscript

script kill_car_capture 
	if ScreenElementExists \{id = photo_test}
		DestroyScreenElement \{id = photo_test}
	endif
	if cas_player_has_character_object player = ($cas_current_player)
		AddParams ($character_head_viewport_props)
		if ViewportExists id = <viewport>
			ScreenFX_ClearFXInstances {
				viewport = <viewport>
			}
			DestroyViewport id = <viewport>
			KillCamAnim name = <camera>
		endif
	endif
endscript

script car_capture_place_camera 
	if cas_player_has_character_object player = ($cas_current_player)
		AddParams ($character_head_viewport_props)
		param_sets = [
			{
				LookAt = <character_object>
				LookAtBone = Bone_Head
				pos = (-0.894, 1.7, 1.789)
			}
			{
				LookAt = <character_object>
				LookAtBone = Bone_Head
				pos = (0.894, 1.7, 1.789)
			}
			{
				LookAt = <character_object>
				LookAtBone = Bone_Head
				pos = (0.0, 1.5, 2.0)
			}
		]
		GetArraySize <param_sets>
		GetRandomValue a = 0 b = (<array_size> - 1) name = index Integer
		chosen_param = (<param_sets> [<index>])
		PlayIGCCam {
			name = <camera>
			viewport = bg_viewport
			LockTo = <character_object>
			<chosen_param>
			Play_hold = 1
			interrupt_current
		}
	endif
endscript

script do_car_capture 
	printf \{qs("\L------------------------------------------------------------CAPTURE SCREEN")}
	if cas_player_has_character_object player = ($cas_current_player)
		AddParams ($character_head_viewport_props)
		car_capture_move_away_character
		Wait \{1
			gameframes}
		car_capture_place_camera
		Wait \{1
			gameframes}
		FinishRendering
		SetViewportProperties viewport = <viewport> active = true
		Photo_PrepareRenderBuffer
		Wait \{2
			gameframes}
		FinishRendering
		SetViewportProperties viewport = <viewport> active = false
		car_capture_move_back_character
		Wait \{1
			gameframes}
		Photo_CreateFromViewport name = car viewport = <viewport> saveshot = <saveshot>
	endif
endscript
car_capture_moved_char = 0
car_capture_moved_old_pos = (0.0, 0.0, 0.0)
car_capture_moved_old_quat = (0.0, 0.0, 0.0)

script car_capture_move_away_character 
	pos_dir = [
		{
			pos = (0.0, 0.0, 0.0)
			Quat = (0.0, 0.0, 0.0)
		}
	]
	GetArraySize <pos_dir>
	GetRandomValue a = 0 b = (<array_size> - 1) name = index Integer
	chosen_pos_dir = (<pos_dir> [<index>])
	car_capture_move_back_character
	if cas_player_has_character_object player = ($cas_current_player)
		<character_object> :Obj_GetPosition
		<character_object> :Obj_GetQuat
		change car_capture_moved_old_pos = <pos>
		change car_capture_moved_old_quat = <Quat>
		change \{car_capture_moved_char = 1}
		<character_object> :Obj_SetPosition position = (<chosen_pos_dir>.pos)
		<character_object> :Obj_SetOrientation Quat = (<chosen_pos_dir>.Quat)
	endif
endscript

script car_capture_move_back_character 
	if ($car_capture_moved_char = 1)
		if cas_player_has_character_object player = ($cas_current_player)
			<character_object> :Obj_SetPosition position = ($car_capture_moved_old_pos)
			<character_object> :Obj_SetOrientation Quat = ($car_capture_moved_old_quat)
		endif
		change \{car_capture_moved_char = 0}
	endif
endscript

script show_photo_cam 
	if cas_player_has_character_object player = ($cas_current_player)
		showcamoffset name = <character_object> bone = Bone_Head
	endif
endscript

script photograb_preset_profiles 
	get_musician_profile_size \{savegame = 0}
	i = 0
	begin
	get_musician_profile_struct_by_index index = <i> savegame = 0
	this_id = (<profile_struct>.name)
	FormatText TextName = saveshot 'photo_%d' d = <this_id> DontAssertForChecksums DoNotResolve
	if is_selectable_profile profile_struct = <profile_struct>
		cas_queue_new_character_profile player = 1 id = <this_id> savegame = 0
		cas_queue_wait
		begin_car_capture
		Wait \{2
			gameframes}
		do_car_capture saveshot = <saveshot>
		Photo_Delete \{name = car}
		Wait \{2
			gameframes}
		kill_car_capture
	endif
	i = (<i> + 1)
	repeat <array_size>
endscript

script cas_save_photo_of_car 
	return
	begin_car_capture
	Wait \{2
		gameframes}
	do_car_capture
	if cas_player_has_character_object player = ($cas_current_player)
		PhotoPutInGlobalTags character_name = <character_name> photo_name = car savegame = <savegame>
		Photo_Delete \{name = car}
	endif
	Wait \{2
		gameframes}
	kill_car_capture
endscript

script ui_create_car_capture 
endscript
