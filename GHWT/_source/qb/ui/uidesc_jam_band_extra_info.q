uidesc_jam_band_extra_info = {
	DescVersion = 4
	name = uidesc_jam_band_extra_info
	rect = [
		-50.0
		-50.0
		320.0
		320.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = helper_cont
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = helper
					includeParentOwned = false
				}
			]
			name = alias_helper
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = helper_cont
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = title
					includeParentOwned = false
				}
			]
			name = title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = helper_cont
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = info1
					includeParentOwned = false
				}
			]
			name = info1_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = helper_cont
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = info2
					includeParentOwned = false
				}
			]
			name = info2_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = helper_cont
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = info3
					includeParentOwned = false
				}
			]
			name = info3_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = NewElement1
				}
				{
					index = 0
					validateLocalID = helper_cont
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = NewElement1
					includeParentOwned = false
				}
				{
					index = 3
					validateLocalID = info4
					includeParentOwned = false
				}
			]
			name = info4_text
			target = text
			type = string_wchar
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = NewElement1
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (0.0, 0.0)
		}
		children = [
			{
				props = {
					texture = arpeggiator_frame
					local_id = helper_cont
					type = SpriteElement
					dims = (256.0, 256.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
					scale = (1.25, 1.25)
				}
				children = [
					{
						props = {
							local_id = title
							type = TextBlockElement
							dims = (150.0, 30.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.259804, -65.4359)
							z_priority = 2.0
							scale = (0.76923096, 0.76923096)
							rgba = [
								192
								192
								192
								255
							]
							text = qs("ARPEGGIATOR")
							font = fontgrid_text_a3
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
							local_id = helper
							type = DescInterface
							hiddenLocal = true
							alpha = 1.0
							dims = (0.0, 0.0)
							just = [
								-1.0
								-1.0
							]
							pos_anchor = [
								-1.0
								-1.0
							]
							pos = (128.17422, 167.11786)
							z_priority = 2.0
							scale = (0.5, 0.5)
							rot_angle = 0.0
							rgba = [
								255
								255
								255
								255
							]
							events_blocked = 0
							preserve_local_orientation = false
							desc = 'helper_pill'
							autoSizeDims = false
							[
								192
								192
								192
								255
							]
							[
								128
								128
								128
								155
							]
						}
					}
					{
						props = {
							local_id = NewElement1
							type = MenuElement
							dims = (100.0, 100.0)
							just = [
								-1.0
								-1.0
							]
							pos = (80.196815, 78.85086)
							z_priority = 2.0
							internal_just = [
								0.0
								0.0
							]
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = info1
									type = TextBlockElement
									dims = (173.0, 30.0)
									pos = (50.0, 15.384605)
									z_priority = 2.0
									scale = (0.76923096, 0.76923096)
									rgba = [
										192
										192
										192
										255
									]
									text = qs("ARPEGGIATOR")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										1.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = info2
									type = TextBlockElement
									dims = (173.0, 30.0)
									pos = (50.0, 38.46154)
									z_priority = 2.0
									scale = (0.76923096, 0.76923096)
									rgba = [
										192
										192
										192
										255
									]
									text = qs("ARPEGGIATOR")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										1.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = info3
									type = TextBlockElement
									dims = (173.0, 30.0)
									pos = (50.0, 61.538464)
									z_priority = 2.0
									scale = (0.76923096, 0.76923096)
									rgba = [
										192
										192
										192
										255
									]
									text = qs("ARPEGGIATOR")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										1.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
							{
								props = {
									local_id = info4
									type = TextBlockElement
									dims = (173.0, 30.0)
									pos = (50.0, 84.615395)
									z_priority = 2.0
									scale = (0.76923096, 0.76923096)
									rgba = [
										192
										192
										192
										255
									]
									text = qs("ARPEGGIATOR")
									font = fontgrid_text_a3
									fit_width = `scale each line if larger`
									fit_height = `scale down if larger`
									scale_mode = proportional
									text_case = Original
									internal_just = [
										-1.0
										1.0
									]
									shadow_offs = (3.0, 3.0)
								}
							}
						]
					}
				]
			}
		]
	}
}
uidesc_jam_band_extra_info_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
