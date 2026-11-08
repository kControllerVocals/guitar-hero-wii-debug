uidesc_container_gamer_invite = {
	DescVersion = 3
	name = uidesc_container_gamer_invite
	rect = [
		-231.99974
		-75.0
		436.49976
		158.0
	]
	aliases = [
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = Gamerinvite_container
			type = ContainerElement
			dims = (100.0, 100.0)
			pos_anchor = [
				0.0
				0.0
			]
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					local_id = text
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (12.0, 3.0)
					z_priority = 3.0
				}
				children = [
					{
						props = {
							local_id = text_popup
							type = TextBlockElement
							dims = (330.0002, 50.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-11.639034, 0.5853729)
							z_priority = 3.0
							text = qs("Invite Sent")
							font = fontgrid_text_a6
							fit_width = `scale each line if larger`
							fit_height = `scale down if larger`
							scale_mode = `per axis`
							text_case = Original
							internal_just = [
								0.0
								-1.0
							]
							shadow_offs = (3.0, 3.0)
						}
					}
				]
			}
			{
				props = {
					local_id = container_graphics
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (16.0, 0.0)
					z_priority = 1.0
					scale = (1.5, 1.5)
				}
				children = [
					{
						props = {
							texture = gamerinvite_top
							local_id = gamerinvite_top
							type = SpriteElement
							dims = (256.0, 32.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-10.0, -31.33333)
							z_priority = 2.0
						}
					}
					{
						props = {
							texture = gamerinvite_bottom
							local_id = gamerinvite_bottom
							type = SpriteElement
							dims = (256.0, 32.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-10.0, 29.33333)
							z_priority = 2.0
						}
					}
					{
						props = {
							texture = gamerinvite_side
							local_id = gamerinvite_side
							type = SpriteElement
							dims = (32.0, 67.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (109.666664, 0.0)
							z_priority = 2.0
						}
					}
					{
						props = {
							local_id = bg_tile
							type = ContainerElement
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-115.333176, 5.333333)
							z_priority = 2.0
						}
						children = [
							{
								props = {
									texture = gamerinvite_bg
									local_id = gamerinvite_bg
									type = SpriteElement
									dims = (33.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = gamerinvite_bg
									local_id = gamerinvite_bg
									type = SpriteElement
									dims = (33.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (23.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = gamerinvite_bg
									local_id = gamerinvite_bg
									type = SpriteElement
									dims = (33.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (46.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = gamerinvite_bg
									local_id = gamerinvite_bg
									type = SpriteElement
									dims = (33.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (69.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = gamerinvite_bg
									local_id = gamerinvite_bg
									type = SpriteElement
									dims = (33.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (92.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = gamerinvite_bg
									local_id = gamerinvite_bg
									type = SpriteElement
									dims = (33.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (115.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = gamerinvite_bg
									local_id = gamerinvite_bg
									type = SpriteElement
									dims = (33.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (138.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = gamerinvite_bg
									local_id = gamerinvite_bg
									type = SpriteElement
									dims = (33.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (161.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = gamerinvite_bg
									local_id = gamerinvite_bg
									type = SpriteElement
									dims = (33.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (184.0, 0.0)
									z_priority = 3.0
								}
							}
							{
								props = {
									texture = gamerinvite_bg
									local_id = gamerinvite_bg
									type = SpriteElement
									dims = (33.0, 64.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (207.0, 0.0)
									z_priority = 3.0
								}
							}
						]
					}
					{
						props = {
							texture = gamerinvite_side
							flip_v = true
							local_id = gamerinvite_side
							type = SpriteElement
							dims = (32.0, 67.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (-130.0, 0.0)
							z_priority = 4.0
						}
					}
				]
			}
		]
	}
}
uidesc_container_gamer_invite_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
