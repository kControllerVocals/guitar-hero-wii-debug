jowBlue = 717488127
jowGreen = 771697407
jowOrange = -6149377
jowRed = -15061505
jowYellow = -3267073

script JOW_Stars 
	printf \{qs("\L*******************************************************************")}
	printf <...>
	printf \{qs("\L*******************************************************************")}
endscript

script SafeGetUniqueCompositeObjectID \{preferredID = safeFXID01}
	if NOT GotParam \{ObjID}
		GetUniqueCompositeObjectID preferredID = <preferredID>
		return uniqueID = <uniqueID>
	endif
	i = 0
	FormatText TextName = index '%i' i = <i>
	ExtendCRC <preferredID> <index> out = preferredID
	begin
	MangleChecksums a = <preferredID> b = <ObjID>
	if NOT ObjectExists id = <mangled_ID>
		return uniqueID = <preferredID>
	else
		i = (<i> + 1)
		FormatText TextName = index '%i' i = <i>
		ExtendCRC <preferredID> <index> out = preferredID
	endif
	repeat
endscript

script SetLightIntensityOverTime \{i = 1.0
		time = 2.0
		stepTime = 0.05}
	targetI = <i>
	GetLightIntensity name = <name>
	numSteps = (<time> / <stepTime>)
	CastToInteger \{numSteps}
	stepSize = ((<targetI> - <i>) / <numSteps>)
	begin
	i = (<i> + <stepSize>)
	SetLightIntensity name = <name> intensity = <i>
	Wait <stepTime> seconds
	repeat (<numSteps> -1)
	SetLightIntensity name = <name> intensity = <targetI>
endscript

script anim_key 
	Obj_MoveToPos (<mov>) time = <time>
	Obj_Rotate absolute = <rot> time = <time>
	Obj_WaitMove
endscript

script ChangePassColor \{parameter = m_psPass0MaterialColor
		time = 1.0
		stepTime = 0.05}
	numSteps = (<time> / <stepTime>)
	CastToInteger \{numSteps}
	stepR = ((<endcolor> [0] - <startcolor> [0]) / <numSteps>)
	stepG = ((<endcolor> [1] - <startcolor> [1]) / <numSteps>)
	stepB = ((<endcolor> [2] - <startcolor> [2]) / <numSteps>)
	stepA = ((<endcolor> [3] - <startcolor> [3]) / <numSteps>)
	begin
	SetArrayElement ArrayName = startcolor index = 0 newvalue = (<startcolor> [0] + <stepR>)
	SetArrayElement ArrayName = startcolor index = 1 newvalue = (<startcolor> [1] + <stepG>)
	SetArrayElement ArrayName = startcolor index = 2 newvalue = (<startcolor> [2] + <stepB>)
	SetArrayElement ArrayName = startcolor index = 3 newvalue = (<startcolor> [3] + <stepA>)
	UpdateMaterialProperty {
		object = <ObjID>
		material = <material>
		parameter = <parameter>
		value = <startcolor>
	}
	Wait <stepTime> seconds
	repeat (<numSteps> -1)
	UpdateMaterialProperty {
		object = <ObjID>
		material = <material>
		parameter = <parameter>
		value = <endcolor>
	}
endscript

script Light_UpdatePosition \{offset = (0.0, 0.0, 0.0)}
	Obj_GetID
	begin
	if NOT IsCreated <attachObjID>
		Die
	endif
	<attachObjID> :Obj_GetPosition
	MoveLight name = <ObjID> pos = (<pos> + <offset>)
	Wait \{1
		frame}
	repeat
endscript
