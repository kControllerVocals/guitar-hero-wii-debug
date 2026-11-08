uidesc_cash_milestones_mp = {
	DescVersion = 13
	name = uidesc_cash_milestones_mp
	rect = [
		0.0
		0.0
		1280.0
		726.23926
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
					index = 3
					validateLocalID = cash_milestones_list
					includeParentOwned = false
				}
			]
			name = alias_cash_milestones_list
		}
	]
	props = [
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
					validateLocalID = cash_milestone_player_name
					includeParentOwned = false
				}
			]
			name = cash_milestone_player_name_text
			target = text
			type = string_wchar
		}
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
							dims = (870.0, 6.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-22.566013, -158.05284)
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
							local_id = cash_milestone_player_name
							type = TextBlockElement
							dims = (500.0, 70.0)
							pos = (-150.7639, -197.35878)
							z_priority = 3.0
							rgba = [
								64
								64
								0
								255
							]
							text = qs("PlayerNameHere")
							font = fontgrid_text_a3
							fit_width = `scale each line if larger`
							fit_height = `scale to fit`
							scale_mode = proportional
							text_case = Original
							shadow_offs = (3.0, 3.0)
						}
					}
					{
						props = {
							local_id = cash_milestones_line
							type = SpriteElement
							dims = (870.0, 6.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-19.511307, -277.88678)
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
							pos = (-194.70557, -106.96872)
							z_priority = 1.0
							internal_just = [
								0.0
								-1.0
							]
							spacing_between = -25
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
							allow_wrap = false
						}
					}
					{
						props = {
							local_id = `table header`
							type = DescInterface
							hiddenLocal = false
							alpha = 1.0
							dims = (810.8051, 90.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (-387.64548, -183.80215)
							z_priority = 2.0
							scale = (1.0, 1.0)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							desc = 'cash_stats_row_mp'
							autoSizeDims = true
							name_text = qs("")
							name_rgba = [
								64
								64
								0
								255
							]
							gig_cash_text = qs("GIG")
							gig_cash_rgba = [
								128
								0
								0
								255
							]
							sponsor_bonus_text = qs("Sponsor")
							sponsor_bonus_rgba = [
								128
								0
								0
								255
							]
							total_text = qs("Total")
							total_rgba = [
								128
								0
								0
								255
							]
							cash_icon_alpha = 0.0
							inst_icon_alpha = 0.0
						}
					}
				]
			}
		]
	}
}
uidesc_cash_milestones_mp_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
