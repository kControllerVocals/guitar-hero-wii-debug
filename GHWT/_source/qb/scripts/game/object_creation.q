proximobj_composite_structure = [
	{
		Component = Sound
	}
]
particle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = particle
	}
]
moving_particle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = motion
	}
	{
		Component = particle
	}
]
flexparticle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = flexibleparticle
	}
]
moving_flexparticle_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = motion
	}
	{
		Component = flexibleparticle
	}
]
viewercam_composite_structure = [
	{
		Component = camera
		far_clip = $camera_default_far_clip
	}
]
levellight_composite_structure = [
	{
		Component = dynamiclight
	}
]
igc_camera_structure = [
	{
		Component = CinematicCamera
		UpdateWhenCameraInactive = false
	}
	{
		Component = camera
	}
]
gridobj_composite_structure = [
	{
		Component = Suspend
	}
]
GeometryObject_structure = [
	{
		Component = GeometryObject
	}
]
master_node_composite_structure = [
	{
		Component = EventCache
	}
	{
		Component = StateMachineManager
	}
]
gameobj_composite_structure = [
	{
		Component = lockobj
		off
	}
	{
		Component = motion
	}
]
constraint_composite_structure = [
	{
		Component = constraint
	}
]
bouncy_composite_structure = [
	{
		Component = Suspend
	}
	{
		Component = rigidbody
	}
	{
		Component = Sound
	}
]

script ProcessorGroup_RegisterDefault 
	RegisterProcessorGroupDesc \{name = ProcessorGroup_CompositeSystem
		processors = [
			{
				name = Processor_Default
				task = {
					name = PTask_Default
				}
			}
		]}
	ProcessorMgr_Init \{group = ProcessorGroup_CompositeSystem}
endscript

script PassGroup_RegisterDefault 
	RegisterPassGroupDesc \{name = PassGroup_CompositeSystem
		passes = [
			{
				name = Pass_Default
				processors = [
					Processor_Default
				]
			}
			{
				name = Pass_Move
				processors = [
					Processor_Default
				]
			}
		]}
	PassMgr_Init \{group = PassGroup_CompositeSystem}
endscript

script CompositeObjects_RegisterDefault 
	AdObject_components = [{name = Model}
		{name = motion}
	]
endscript
