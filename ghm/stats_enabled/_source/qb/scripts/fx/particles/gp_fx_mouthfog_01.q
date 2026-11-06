gp_fx_mouthfog_01 = {
	pos = (0.0, 0.0, -0.0)
	angles = (0.0, 0.0, 0.0)
	class = particleobject
	particletype = flexparticle
	type = flat
	active
	createdatstart
	attach
	applypositionoffset
	bone = bone_tongue
	emitrangedims = (0.0, 0.0, 0.0)
	emit_target = (0.0, 0.0, 1.0)
	emitangle = (0.0, 0.0, 0.0)
	force = (0.0, 0.05, 0.0)
	windcoeff = 0.0
	localwindcoeff = 0.0
	emittervelocityweight = 0.0
	anglespread = 1.0
	liferange = (0.8, 1.2)
	emit_rate = 3.0
	emitterindependent = 1
	max = 2
	timeseed = 0.0
	lifetime = 0.0
	emitnum = 0
	followemitter = 0.0
	emitfunction = onoff
	sizerange = [
		(0.06, 0.06)
		(0.2, 0.2)
	]
	speedrange = (0.1, 0.3)
	rotvel = (1.0, -1.0)
	rotveltimescale = 0.5
	emitdelaystart = 0.0
	pathfollowtime = 0.0
	history = 2
	historylistcoordinatespace = world
	color = -1143800040
	lod_default
	quickmaterial = {
		diffusetextureenabled
		diffusetexture = ph_smoke_singlepuff_blend_02
		specularpower = 0
		alphacutoff = 1
		blendmode = blend
		softedge
		softedgescale = 1.0
		burn
		burnvalue = 0.8
		quadanimationfps = 0
	}
	particlecolor = [
		-256
		-256
		-1
		-1
		-1
		-1
		-256
		-256
	]
	vertexweight = [
		0.054329004
		0.27441105
		1.0
	]
}
