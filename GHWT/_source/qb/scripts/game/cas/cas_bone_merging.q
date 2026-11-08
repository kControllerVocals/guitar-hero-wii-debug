cas_all_merged_skeleton_bones = [
	Bone_ACC_Head_01
	Bone_ACC_Head_02
	Bone_ACC_Head_03
	Bone_ACC_Head_04
	Bone_ACC_Head_05
	Bone_ACC_Head_06
	Bone_ACC_Head_07
	Bone_ACC_Head_08
	Bone_ACC_Head_09
	Bone_ACC_Torso_01
	Bone_ACC_Torso_02
	Bone_ACC_Torso_03
	Bone_ACC_Torso_04
	Bone_ACC_Legs_01
	Bone_ACC_Legs_02
	Bone_ACC_Legs_03
	Bone_ACC_Legs_04
	Bone_Guitar_Body
	Bone_Guitar_Fret_Pos
	Bone_IK_Hand_Guitar_L
	Bone_IK_Hand_Guitar_R
	Bone_Guitar_String_1
	Bone_Guitar_String_2
	Bone_Guitar_String_3
	Bone_Guitar_String_4
	Bone_Guitar_String_5
	Bone_Guitar_String_6
	Bone_Mic_Stand
	Bone_Mic_Adjust_Height
	Bone_Mic_Adjust_Angle
	Bone_Mic_Microphone
	Bone_IK_Hand_Slave_L
	Bone_IK_Hand_Slave_R
]
cas_all_merged_radgoll_bones = [
	Bone_ACC_Head_01
	Bone_ACC_Head_02
	Bone_ACC_Head_03
	Bone_ACC_Head_04
	Bone_ACC_Head_05
	Bone_ACC_Head_06
	Bone_ACC_Head_07
	Bone_ACC_Head_08
	Bone_ACC_Head_09
	Bone_ACC_Torso_01
	Bone_ACC_Torso_02
	Bone_ACC_Torso_03
	Bone_ACC_Torso_04
	Bone_ACC_Legs_01
	Bone_ACC_Legs_02
	Bone_ACC_Legs_03
	Bone_ACC_Legs_04
]
cas_drummer_bones = [
	Bone_Guitar_Body
	Bone_Guitar_Fret_Pos
	Bone_IK_Hand_Guitar_L
	Bone_IK_Hand_Guitar_R
	Bone_Guitar_String_1
	Bone_Guitar_String_2
	Bone_Guitar_String_3
	Bone_Guitar_String_4
	Bone_Guitar_String_5
	Bone_Guitar_String_6
	Bone_Mic_Stand
	Bone_Mic_Adjust_Height
	Bone_Mic_Adjust_Angle
	Bone_Mic_Microphone
	Bone_IK_Hand_Slave_L
	Bone_IK_Hand_Slave_R
]

script cas_update_accessory_bones \{do_ragdoll = 1}
	printf \{qs(0x4aac6374)}
endscript

script cas_skeleton_reset 
	printf \{qs(0xc275fdac)}
endscript

script cas_ragdoll_reset 
	printf \{qs(0x85a9d6c1)}
endscript

script cas_process_accessory_part 
	GetActualCASOptionStruct part = <part> desc_id = <desc_id>
	if GotParam \{acc_bones}
		printf 'cas_process_accessory_part %p' p = <desc_id> DoNotResolve
		MemPushContext \{TopDownHeap}
		PushAssetContext
		UnpackRawSkeleton asset = <acc_skeleton>
		PopAssetContext
		MemPopContext
		if GotParam \{acc_skeleton}
			Skeleton_MergeSkeleton SkeletonName = <acc_skeleton> bones = <acc_bones>
		else
			ScriptAssert \{'acc_skeleton missing from part!'}
		endif
		if (<do_ragdoll> = 1)
			MemPushContext \{TopDownHeap}
			PushAssetContext
			UnpackRawRagdoll asset = <acc_ragdoll>
			PopAssetContext
			MemPopContext
			if GotParam \{acc_ragdoll}
				Ragdoll_MergeRagdoll SkeletonName = <acc_skeleton> ragdollName = <acc_ragdoll> bones = <acc_bones>
			else
				ScriptAssert \{'acc_ragdoll missing from part. Comment out this assert if it\'s okay to leave out the ragdoll'}
			endif
		endif
	endif
endscript

script cas_merge_in_guitar_ragdoll 
	return
	printf \{'cas_merge_in_guitar_ragdoll'}
	Ragdoll_MergeRagdoll SkeletonName = <skeleton> ragdollName = GH_Rocker_Guitar_Ragdoll bones = ($cas_drummer_bones)
endscript

script cas_merge_in_drummer_bones 
	printf \{qs(0x4b116f56)}
endscript
