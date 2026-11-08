uidesc_cash_milestones_mp_band = {
	DescVersion = 16
	name = uidesc_cash_milestones_mp_band
	rect = [
		0.0
		0.0
		1280.0
		720.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = cash_milestones_container
				}
				{
					index = 1
					validateLocalID = cash_milestone_stuff
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = cash_milestones_list
					includeParentOwned = false
				}
			]
			name = alias_cash_milestones_mp_list
		}
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = cash_milestones_container
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					texture = cash_milestones_bkgd
					local_id = cash_milestones_bkgd
					type = SpriteElement
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
			}
			{
				props = {
					local_id = cash_milestone_stuff
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (95.0, 82.0)
					z_priority = 1.0
					rot_angle = -10.7
				}
				children = [
					{
						props = {
							local_id = cash_milestones_line
							type = SpriteElement
							dims = (900.0, 6.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-27.004925, -228.94139)
							z_priority = 3.0
							rgba = [
								77
								81
								41
								170
							]
						}
					}
					{
						props = {
							local_id = cash_milestones_list
							type = MenuElement
							dims = (425.0, 400.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-206.01454, -183.40417)
							z_priority = 1.0
							internal_just = [
								0.0
								-1.0
							]
							spacing_between = -20
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = false
						}
					}
					{
						props = {
							local_id = cash_milestones_title
							type = TextBlockElement
							dims = (880.0, 70.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-30.947002, -302.0194)
							z_priority = 4.0
							rgba = [
								128
								0
								0
								255
							]
							text = qs("GIG COMPLETE!")
							font = fontgrid_text_a6
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								0.0
								0.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							texture = cash_milestone_seal
							local_id = cash_milestone_seal
							type = SpriteElement
							dims = (200.0, 200.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (329.59918, 146.86441)
							z_priority = 2.0
						}
					}
				]
			}
			{
				props = {
					local_id = cash_milestones_row_titles
					type = ContainerElement
					dims = (425.0, 80.0)
					pos = (405.09146, 250.43799)
					rot_angle = -10.7
				}
				children = [
					{
						props = {
							local_id = player_name_title
							type = TextBlockElement
							dims = (330.0, 34.0)
							pos = (328.1344, 37.57793)
							z_priority = 4.0
							rgba = [
								77
								81
								41
								255
							]
							text = qs("NAME")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							use_shadow = true
							shadow_offs = (2.0, 2.0)
						}
					}
					{
						props = {
							local_id = gig_cash_title
							type = TextBlockElement
							dims = (180.0, 34.0)
							pos = (649.7544, 38.883785)
							z_priority = 4.0
							rgba = [
								77
								81
								41
								255
							]
							text = qs("GIG")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							use_shadow = true
							shadow_offs = (2.0, 2.0)
						}
					}
					{
						props = {
							local_id = career_earnings_title
							type = TextBlockElement
							dims = (180.0, 34.0)
							pos = (806.56537, 39.395172)
							z_priority = 4.0
							rgba = [
								77
								81
								41
								255
							]
							text = qs("CAREER")
							font = fontgrid_text_a8
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = proportional
							text_case = Original
							internal_just = [
								-1.0
								0.0
							]
							use_shadow = true
							shadow_offs = (2.0, 2.0)
						}
					}
				]
			}
		]
	}
}
uidesc_cash_milestones_mp_band_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
