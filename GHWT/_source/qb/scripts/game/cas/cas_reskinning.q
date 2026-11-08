ReskinTree = {
	type = DegenerateBlend
	id = RootNode
}
ReskinAnimBranch = {
	type = param_timer_type
	id = TimerNode
	Speed = param_speed
	start = param_start
	Anim = param_anim
	[
		{
			type = TweakBones
			id = TweakBonesNode
			[
				{
					type = Source
					id = SourceNode
					Anim = param_anim
				}
			]
		}
	]
}

script cas_get_bone_slider_value 
	RequireParams \{[
			part
			group_name
		]
		all}
	if NOT GetCASAppearancePart part = <part>
		ScriptAssert 'Part %s not found' s = <part>
	else
		if GotParam \{bones}
			if StructureContains Structure = <bones> <group_name>
				slider = (<bones>.<group_name>)
			else
				printf 'Bone %s missing in part, will devise a default setting' s = <group_name>
			endif
		else
		endif
	endif
	if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = <part> t = <desc_id>
	endif
	GetArraySize <deform_bones> GlobalArray
	i = 0
	begin
	deform_info = ($<deform_bones> [<i>])
	if (<group_name> = (<deform_info>.group_name))
		if NOT GotParam \{slider}
			cas_get_default_slider_value deform_info = <deform_info>
		endif
		cas_get_min_bone_slider deform_info = <deform_info>
		cas_get_max_bone_slider deform_info = <deform_info>
		if (<slider> < <min_slider>)
			slider = (<min_slider>)
		endif
		if (<slider> > <max_slider>)
			slider = (<max_slider>)
		endif
		break
	endif
	i = (<i> + 1)
	repeat <array_size>
	if NOT GotParam \{slider}
		slider = 0.0
	endif
	return {slider = <slider> min_slider = <min_slider> max_slider = <max_slider>}
endscript

script cas_set_bone_slider 
	RequireParams \{[
			part
			group_name
			slider
		]
		all}
	GetCASAppearancePart part = <part>
	if NOT GotParam \{bones}
		bones = {}
	endif
	UpdateStructElement struct = <bones> element = <group_name> value = <slider>
	SetCASAppearanceBones part = <part> bones = <newstruct>
endscript

script cas_part_reskin_create_object 
	if CompositeObjectExists name = <id>
		if ($cas_reskin_preview = none)
			ScriptAssert 'Name clash on %s when reskinning' s = <id> DoNotResolve
		else
			return
		endif
	endif
	if NOT GotParam \{deform_mesh}
		ScriptAssert \{'deform_mesh missing'}
	endif
	if NOT GotParam \{deform_skel}
		ScriptAssert \{'deform_mesh missing'}
	endif
	ExtendCRC <deform_skel> '_default' out = deform_anim
	MemPushContext \{TopDownHeap}
	FormatText checksumname = modelcsum '%s' s = <deform_mesh>
	if ($cas_reskin_debug = 1)
		if GetCurrentCASObject
			<cas_object> :Obj_GetPosition
		endif
		pos = (<pos> + (-0.45000002, 0.0, 0.0))
	endif
	CreateCompositeObject {
		params = {
			name = <id>
			SkeletonName = <deform_skel>
			ModelChecksum = <modelcsum>
			geomname = <part>
			pos = <pos>
			allow_reset
		}
		Components = [
			{Component = skeleton}
			{Component = Model}
			{Component = AnimTree}
		]
	}
	<id> :Anim_InitTree {
		Tree = $ReskinTree
		NodeIdDeclaration = [
			RootNode
			TimerNode
			SourceNode
			FlipNode
			TweakBonesNode
		]
	}
	<id> :Anim_Command {
		target = RootNode
		command = DegenerateBlend_AddBranch
		params = {
			BlendDuration = 0.0
			Tree = $ReskinAnimBranch
			params = {
				param_timer_type = Cycle
				param_anim = <deform_anim>
				param_speed = 1.0
			}
		}
	}
	if ($cas_reskin_debug = 0)
		<id> :hide
	endif
	MemPopContext
endscript

script cas_apply_bone_group_settings 
	RequireParams \{[
			bone_settings
			deform_bones
		]
		all}
	GetArraySize <deform_bones> GlobalArray
	num_groups = <array_size>
	iGroup = 0
	begin
	deform_info = ($<deform_bones> [<iGroup>])
	group_name = (<deform_info>.group_name)
	if StructureContains Structure = <bone_settings> <group_name>
		slider = (<bone_settings>.<group_name>)
		GetArraySize (<deform_info>.bones)
		iBone = 0
		begin
		if (<array_size> < 1)
			break
		endif
		cas_apply_bone_transforms {
			bone_info = (<deform_info>.bones [<iBone>])
			slider = <slider>
			deform_info = <deform_info>
			main_skeleton = <main_skeleton>
			lowres_rig = <lowres_rig>
			deform_skel = <deform_skel>
		}
		iBone = (<iBone> + 1)
		repeat <array_size>
	endif
	iGroup = (<iGroup> + 1)
	repeat <num_groups>
endscript

script cas_apply_bone_transforms_lowres 
	if Skeleton_HasBone bone = <bone_name>
		<transform_script> transform_data = <transform_data> amount = <amount> bone_name = <bone_name>
	endif
endscript

script cas_apply_bone_transforms 
	if GetBoneMappedValue \{name = scaling}
		if GotParam \{lowres_rig}
			cas_apply_bone_transforms_lowres {
				transform_script = cas_bone_scaling
				transform_data = (<bone_info>.scaling)
				amount = <mapped_value>
				bone_name = (<bone_info>.bone)
				deform_skel = <deform_skel>
				no_recurse
			}
		else
			cas_bone_scaling transform_data = (<bone_info>.scaling) amount = <mapped_value> bone_name = (<bone_info>.bone)
		endif
	endif
	if GetBoneMappedValue \{name = translation}
		if GotParam \{lowres_rig}
			cas_apply_bone_transforms_lowres {
				transform_script = cas_bone_translation
				transform_data = (<bone_info>.translation)
				amount = <mapped_value>
				bone_name = (<bone_info>.bone)
				deform_skel = <deform_skel>
			}
		else
			cas_bone_translation transform_data = (<bone_info>.translation) amount = <mapped_value> bone_name = (<bone_info>.bone)
		endif
	endif
	if GetBoneMappedValue \{name = rotation}
		if GotParam \{lowres_rig}
			cas_apply_bone_transforms_lowres {
				transform_script = cas_bone_rotation
				transform_data = (<bone_info>.rotation)
				amount = <mapped_value>
				bone_name = (<bone_info>.bone)
				deform_skel = <deform_skel>
			}
		else
			cas_bone_rotation transform_data = (<bone_info>.rotation) amount = <mapped_value> bone_name = (<bone_info>.bone)
		endif
	endif
endscript

script cas_bone_translation 
	if StructureContains Structure = <transform_data> bone_space
		amount = (<amount>.(1.0, 0.0, 0.0))
	endif
	if StructureContains Structure = <transform_data> no_propagate
		if StructureContains Structure = <transform_data> model_space
			flags = {model_space}
		endif
		Obj_AddBoneTranslation bone = <bone_name> <amount> <flags>
	else
		Anim_Command {
			target = TweakBonesNode
			command = TweakBones_TranslateBone
			params = {
				bone = <bone_name>
				<amount>
			}
		}
	endif
endscript

script cas_bone_scaling 
	RequireParams \{[
			transform_data
			amount
			bone_name
		]}
	if NOT StructureContains Structure = <transform_data> no_propagate
		flags = {propagate}
	endif
	if StructureContains Structure = <transform_data> stop_propagate
		flags = {stop_propagate}
	endif
	Obj_AddBoneScale bone = <bone_name> <amount> <flags>
endscript

script cas_bone_rotation 
	if StructureContains Structure = <transform_data> no_propagate
		if StructureContains Structure = <transform_data> model_space
			flags = {model_space}
		endif
		Obj_AddBoneRotation bone = <bone_name> <amount> <flags>
	else
		Anim_Command {
			target = TweakBonesNode
			command = TweakBones_RotateBone
			params = {
				bone = <bone_name>
				<amount>
			}
		}
	endif
endscript

script cas_reset_bones 
	Obj_ResetBones
	if Anim_AnimNodeExists \{id = TweakBonesNode}
		Anim_Command \{target = TweakBonesNode
			command = TweakBones_Reset}
	endif
endscript

script cas_get_default_slider_value 
	slider_sum = 0.0
	sliders_checked = 0.0
	if StructureContains Structure = <deform_info> bones
		GetArraySize (<deform_info>.bones)
		i = 0
		if (<array_size> > 0)
			begin
			cas_get_default_slider_value_struct {
				deform_info = <deform_info>
				deform_map = ((<deform_info>.bones) [<i>])
				group_name = (<deform_info>.group_name)
			}
			slider_sum = (<slider_sum> + <slider>)
			sliders_checked = (<sliders_checked> + 1.0)
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if (<sliders_checked> > 0.0)
		slider_sum = (<slider_sum> / <sliders_checked>)
	endif
	printf 'avg of %s %v' s = (<deform_info>.group_name) v = <slider_sum>
	return slider = <slider_sum>
endscript

script cas_get_default_slider_value_struct 
	slider_sum = 0.0
	sliders_checked = 0.0
	if StructureContains Structure = <deform_map> rotation
		cas_get_default_slider_value_entry deform_info = <deform_info> map = (<deform_map>.rotation)
		slider_sum = (<slider_sum> + <slider>)
		sliders_checked = (<sliders_checked> + 1.0)
	endif
	if StructureContains Structure = <deform_map> translation
		cas_get_default_slider_value_entry deform_info = <deform_info> map = (<deform_map>.translation)
		slider_sum = (<slider_sum> + <slider>)
		sliders_checked = (<sliders_checked> + 1.0)
	endif
	if StructureContains Structure = <deform_map> scaling
		cas_get_default_slider_value_entry deform_info = <deform_info> map = (<deform_map>.scaling)
		slider_sum = (<slider_sum> + <slider>)
		sliders_checked = (<sliders_checked> + 1.0)
	endif
	if (<sliders_checked> > 0.0)
		slider_sum = (<slider_sum> / <sliders_checked>)
	endif
	return slider = <slider_sum>
endscript

script cas_get_default_slider_value_entry 
	cas_get_slider_linearmap_values map = <map> deform_info = <deform_info>
	if IsVector <from_bone>
		LinearMap result = x from = <min_slider> to = <max_slider> basedOn = 0.0 lowerBound = (<from_bone>.(1.0, 0.0, 0.0)) upperBound = (<to_bone>.(1.0, 0.0, 0.0))
		LinearMap result = y from = <min_slider> to = <max_slider> basedOn = 0.0 lowerBound = (<from_bone>.(0.0, 1.0, 0.0)) upperBound = (<to_bone>.(0.0, 1.0, 0.0))
		LinearMap result = z from = <min_slider> to = <max_slider> basedOn = 0.0 lowerBound = (<from_bone>.(0.0, 0.0, 1.0)) upperBound = (<to_bone>.(0.0, 0.0, 1.0))
		return slider = ((<x> + <y> + <z>) / 3.0)
	else
		LinearMap result = slider from = <min_slider> to = <max_slider> basedOn = 0.0 lowerBound = <from_bone> upperBound = <to_bone>
		return slider = <slider>
	endif
endscript

script cas_get_slider_linearmap_values 
	RequireParams \{[
			map
			deform_info
		]
		all}
	if NOT StructureContains Structure = <map> to
		printf 'Missing \'to\' entry for %s-%t!' s = (<deform_info>.frontend_desc) t = (<deform_info>.group_name) DoNotResolve
		return \{from_bone = 0.0
			to_bone = 0.0
			min_slider = 0.0
			max_slider = 1.0}
	endif
	if StructureContains Structure = <map> from
		from_bone = (<map>.from)
	else
		if IsVector (<map>.to)
			from_bone = (0.0, 0.0, 0.0)
		else
			from_bone = 0
		endif
	endif
	to_bone = (<map>.to)
	if StructureContains Structure = <map> min
		min_slider = (<map>.min)
	else
		cas_get_min_bone_slider deform_info = <deform_info>
	endif
	if StructureContains Structure = <map> max
		max_slider = (<map>.max)
	else
		cas_get_max_bone_slider deform_info = <deform_info>
	endif
	return from_bone = <from_bone> to_bone = <to_bone> min_slider = <min_slider> max_slider = <max_slider>
endscript

script cas_get_min_bone_slider 
	if StructureContains Structure = <deform_info> min
		return min_slider = (<deform_info>.min)
	else
		return \{min_slider = 0.0}
	endif
endscript

script cas_get_max_bone_slider 
	if StructureContains Structure = <deform_info> max
		return max_slider = (<deform_info>.max)
	else
		return \{max_slider = 1.0}
	endif
endscript

script cas_part_reskin 
	if NOT GotParam \{bone_settings}
		bone_settings = {}
	endif
	cas_part_reskin_create_object id = <reskin_object> part = <part> pos = (0.0, 0.0, 0.0) deform_mesh = <deform_mesh> deform_skel = <deform_skel>
	<reskin_object> :cas_reset_bones
	if GotParam \{bone_settings}
		<reskin_object> :cas_apply_bone_group_settings bone_settings = <bone_settings> deform_bones = <deform_bones>
	endif
	if GotParam \{additional_bone_transforms}
		printf 'Doing additional transforms for %s' s = <part> DoNotResolve
		<reskin_object> :cas_apply_additional_bone_transforms additional_bone_transforms = <additional_bone_transforms>
	endif
	<reskin_object> :Anim_UpdatePose
	return \{true}
endscript

script cas_main_skel_scale 
	if NOT GotParam \{bone_settings}
		bone_settings = {}
	endif
	if GotParam \{bone_settings}
		cas_apply_bone_group_settings bone_settings = <bone_settings> deform_bones = <deform_bones> main_skeleton = 1
	endif
	if GotParam \{additional_bone_transforms}
		printf 'Doing additional transforms for %s' s = <part> DoNotResolve
		cas_apply_additional_bone_transforms additional_bone_transforms = <additional_bone_transforms> main_skeleton = 1
	endif
endscript

script cas_apply_additional_bone_transforms 
	GetArraySize <additional_bone_transforms>
	i = 0
	if (<array_size> > 0)
		begin
		transform = (<additional_bone_transforms> [<i>])
		cas_apply_bone_transforms {
			bone_info = <transform>
			slider = value_only
			main_skeleton = <main_skeleton>
			lowres_rig = <lowres_rig>
			deform_skel = <deform_skel>
			deform_info = <deform_info>
		}
		i = (<i> + 1)
		repeat <array_size>
	endif
endscript

script cas_lowres_rig_reskin 
	if GotParam \{bone_settings}
		cas_apply_bone_group_settings bone_settings = <bone_settings> deform_bones = <deform_bones> deform_skel = <deform_skel> lowres_rig = 1
	endif
	if GotParam \{additional_bone_transforms}
		cas_apply_additional_bone_transforms additional_bone_transforms = <additional_bone_transforms> deform_skel = <deform_skel> lowres_rig = 1
	endif
	Anim_UpdatePose
	return \{true}
endscript

script cas_apply_bone_settings 
	ScriptAssert \{qs(0x3438b486)}
	RequireParams \{[
			part
			desc_id
			bone_settings
		]
		all}
	if NOT GotParam \{deform_bones}
		if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
			ScriptAssert '%s %t not found' s = <part> t = <desc_id>
		endif
	endif
	GetArraySize <deform_bones> GlobalArray
	num_groups = <array_size>
	deform_array = (<deform_bones>)
	printscriptinfo \{qs(0x719ceeee)}
	printstruct (<deform_array>)
	iGroup = 0
	begin
	printf qs(0x6bcb5182) a = (<iGroup>)
	group_info = (<deform_array> [<iGroup>])
	group_name = (<group_info>.group_name)
	if StructureContains Structure = <bone_settings> <group_name>
		slider = (<bone_settings>.<group_name>)
		GetArraySize (<group_info>.bones)
		if ((<array_size>) > 0)
			iBone = 0
			begin
			bone_info = (<group_info>.bones [<iBone>])
			bone_name = (<bone_info>.bone)
			if StructureContains Structure = <bone_info> scaling
				cas_get_bone_mapped_value {
					map = (<bone_info>.scaling)
					slider = <slider>
					deform_info = <group_info>
				}
				flags = {}
				if NOT StructureContains Structure = (<bone_info>.scaling) no_propagate
					flags = {propagate}
				endif
				if StructureContains Structure = (<bone_info>.scaling) propagate_reverse
					flags = {propagate_reverse}
				endif
				if StructureContains Structure = (<bone_info>.scaling) stop_propagate
					flags = {<flags> stop_propagate}
				endif
				Obj_AddBoneScale bone = <bone_name> <mapped_value> <flags>
			endif
			if StructureContains Structure = <bone_info> translation
				cas_get_bone_mapped_value {
					map = (<bone_info>.translation)
					slider = <slider>
					deform_info = <group_info>
				}
				if StructureContains Structure = (<bone_info>.translation) no_propagate
					flags = {}
					if StructureContains Structure = (<bone_info>.translation) model_space
						flags = {model_space}
					endif
					Obj_AddBoneTranslation bone = <bone_name> <mapped_value> <flags>
				else
					flags = {propagate}
					if StructureContains Structure = <transform_data> model_space
						flags = {propagate model_space}
					endif
					Obj_AddBoneTranslation bone = <bone_name> <amount> <flags>
				endif
			endif
			if StructureContains Structure = <bone_info> rotation
				cas_get_bone_mapped_value {
					map = (<bone_info>.rotation)
					slider = <slider>
					deform_info = <group_info>
				}
				if StructureContains Structure = (<bone_info>.rotation) no_propagate
					flags = {}
					if StructureContains Structure = (<bone_info>.rotation) model_space
						flags = {model_space}
					endif
					Obj_AddBoneRotation bone = <bone_name> <mapped_value> <flags>
				else
					if Anim_AnimNodeExists \{id = TweakBonesNode}
						Anim_Command {
							target = TweakBonesNode
							command = TweakBones_RotateBone
							params = {
								bone = <bone_name>
								<mapped_value>
							}
						}
					else
						Obj_GetID
						printf 'TweakBonesNode not found on %s' s = <ObjID>
					endif
				endif
			endif
			iBone = (<iBone> + 1)
			repeat <array_size>
		endif
	endif
	iGroup = (<iGroup> + 1)
	repeat <num_groups>
	if GotParam \{additional_bone_transforms}
		GetArraySize <additional_bone_transforms>
		iAddBone = 0
		begin
		bone_info = (<additional_bone_transforms> [<iAddBone>])
		bone_name = (<bone_info>.bone)
		if StructureContains Structure = <bone_info> scaling
			mapped_value = (<bone_info>.scaling.value)
			flags = {}
			if NOT StructureContains Structure = (<bone_info>.scaling) no_propagate
				flags = {propagate}
			endif
			if StructureContains Structure = (<bone_info>.scaling) propagate_reverse
				flags = {propagate_reverse}
			endif
			if StructureContains Structure = (<bone_info>.scaling) stop_propagate
				flags = {<flags> stop_propagate}
			endif
			Obj_AddBoneScale bone = <bone_name> <mapped_value> <flags>
		endif
		if StructureContains Structure = <bone_info> translation
			mapped_value = (<bone_info>.translation.value)
			if StructureContains Structure = (<bone_info>.translation) no_propagate
				flags = {}
				if StructureContains Structure = (<bone_info>.translation) model_space
					flags = {model_space}
				endif
				Obj_AddBoneTranslation bone = <bone_name> <mapped_value> <flags>
			else
				flags = {propagate}
				if StructureContains Structure = <transform_data> model_space
					flags = {propagate model_space}
				endif
				Obj_AddBoneTranslation bone = <bone_name> <amount> <flags>
			endif
		endif
		if StructureContains Structure = <bone_info> rotation
			mapped_value = (<bone_info>.rotation.value)
			if StructureContains Structure = (<bone_info>.rotation) no_propagate
				flags = {}
				if StructureContains Structure = (<bone_info>.rotation) model_space
					flags = {model_space}
				endif
				Obj_AddBoneRotation bone = <bone_name> <mapped_value> <flags>
			else
				if Anim_AnimNodeExists \{id = TweakBonesNode}
					Anim_Command {
						target = TweakBonesNode
						command = TweakBones_RotateBone
						params = {
							bone = <bone_name>
							<mapped_value>
						}
					}
				else
					Obj_GetID
					printf 'TweakBonesNode not found on %s' s = <ObjID>
				endif
			endif
		endif
		iAddBone = (<iAddBone> + 1)
		repeat <array_size>
	endif
endscript
