uidesc_encore = {
	DescVersion = 3
	name = uidesc_encore
	rect = [
		0.0
		-80.0
		1280.0
		750.8929
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = encore_master_container
				}
				{
					index = 0
					validateLocalID = encore_bg_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = encore_content
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = `horizontal stack`
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = stars_stack
					includeParentOwned = false
				}
			]
			name = alias_stars_stack
		}
		{
			path = [
				{
					validateLocalID = encore_master_container
				}
				{
					index = 0
					validateLocalID = encore_bg_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = encore_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_title_offset
					includeParentOwned = false
				}
			]
			name = alias_encore_title_offset
		}
		{
			path = [
				{
					validateLocalID = encore_master_container
				}
				{
					index = 0
					validateLocalID = encore_bg_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = encore_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_title_offset
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_title
					includeParentOwned = false
				}
			]
			name = alias_encore_title
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = encore_master_container
				}
				{
					index = 0
					validateLocalID = encore_bg_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = encore_content
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = `horizontal stack`
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_money_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_money
					includeParentOwned = false
				}
			]
			name = encore_money_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = encore_master_container
				}
				{
					index = 0
					validateLocalID = encore_bg_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = encore_content
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = `horizontal stack`
					includeParentOwned = false
				}
				{
					index = 2
					validateLocalID = encore_points_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_points
					includeParentOwned = false
				}
			]
			name = encore_score_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = encore_master_container
				}
				{
					index = 0
					validateLocalID = encore_bg_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = encore_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_title_offset
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_title
					includeParentOwned = false
				}
			]
			name = encore_title_dims
			target = dims
			type = pair
		}
		{
			path = [
				{
					validateLocalID = encore_master_container
				}
				{
					index = 0
					validateLocalID = encore_bg_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = encore_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_title_offset
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_title
					includeParentOwned = false
				}
			]
			name = encore_title_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = encore_master_container
				}
				{
					index = 0
					validateLocalID = encore_bg_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = encore_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_title_offset
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_title
					includeParentOwned = false
				}
			]
			name = encore_title_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = encore_master_container
				}
				{
					index = 0
					validateLocalID = encore_bg_container
					includeParentOwned = false
				}
				{
					index = 1
					validateLocalID = encore_content
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_title_offset
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = encore_title
					includeParentOwned = false
				}
			]
			name = encore_title_font
			target = font
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = encore_master_container
				}
			]
			name = encore_master_container_scale
			target = scale
			type = pair
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = encore_master_container
			type = ContainerElement
			dims = (1280.0, 720.0)
			pos = (640.0, 280.0)
			z_priority = -1.0
		}
		children = [
			{
				props = {
					local_id = encore_bg_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 1.0
				}
				children = [
					{
						props = {
							texture = encore_4_bg
							local_id = encore_bg
							type = SpriteElement
							dims = (512.0, 256.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 147.0)
							z_priority = 1.0
							scale = (1.5, 1.5)
						}
					}
					{
						props = {
							local_id = encore_content
							type = MenuElement
							dims = (550.0, 250.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 190.0)
							z_priority = 2.0
							internal_just = [
								0.0
								0.0
							]
							spacing_between = 0
							fit_major = `fit content if larger`
							fit_minor = `fit content if larger`
							scale_mode = proportional
						}
						children = [
							{
								props = {
									local_id = encore_title_offset
									type = ContainerElement
									dims = (400.0, 100.0)
									pos = (275.0, 44.642857)
									z_priority = 3.0
									scale = (0.89285696, 0.89285696)
								}
								children = [
									{
										props = {
											local_id = encore_title
											type = TextBlockElement
											dims = (475.0, 125.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, -10.0)
											z_priority = 3.0
											rot_angle = -3.0
											rgba = [
												170
												70
												70
												255
											]
											text = qs("ENCORE!")
											font = fontgrid_title_a1
											fit_width = wrap
											fit_height = `scale down if larger`
											scale_mode = proportional
											text_case = upper
											internal_just = [
												0.0
												0.0
											]
											internal_scale = (1.5, 1.5)
											shadow_offs = (3.0, 3.0)
										}
									}
								]
							}
							{
								props = {
									local_id = `horizontal stack`
									type = MenuElement
									dims = (550.0, 100.0)
									pos = (275.0, 133.92857)
									z_priority = 3.0
									scale = (0.89285696, 0.89285696)
									isVertical = false
									internal_just = [
										0.0
										0.0
									]
									spacing_between = 15
									fit_major = `fit content if larger`
									fit_minor = `keep dims`
									scale_mode = proportional
								}
								children = [
									{
										props = {
											local_id = encore_money_container
											type = ContainerElement
											dims = (200.0, 50.0)
											pos = (81.12093, 50.0)
											z_priority = 4.0
											scale = (0.81120896, 0.81120896)
										}
										children = [
											{
												props = {
													local_id = encore_money
													type = TextBlockElement
													dims = (230.0, 100.0)
													just = [
														1.0
														0.0
													]
													pos_anchor = [
														1.0
														0.0
													]
													pos = (0.0, 0.85803604)
													z_priority = 4.0
													rot_angle = -2.0
													rgba = [
														192
														255
														192
														255
													]
													text = qs("$999,999")
													font = fontgrid_text_a11_large
													fit_width = `scale each line if larger`
													fit_height = `scale down if larger`
													scale_mode = `per axis`
													text_case = Original
													internal_just = [
														1.0
														0.0
													]
													internal_scale = (1.3, 1.3)
													shadow_offs = (3.0, 3.0)
												}
											}
										]
									}
									{
										props = {
											local_id = stars_stack
											type = MenuElement
											dims = (248.0, 100.0)
											pos = (275.0, 50.0)
											z_priority = 3.0
											scale = (0.81120896, 0.81120896)
											isVertical = false
											internal_just = [
												0.0
												0.0
											]
											spacing_between = -70
											fit_major = `fit content if larger`
											fit_minor = `keep dims`
											scale_mode = proportional
										}
										children = [
											{
												props = {
													texture = encore_4_star
													local_id = encore_4_star
													type = SpriteElement
													dims = (128.0, 128.0)
													pos = (44.08889, 50.0)
													z_priority = 3.1
													scale = (0.688889, 0.688889)
												}
											}
											{
												props = {
													texture = encore_4_star
													local_id = encore_4_star
													type = SpriteElement
													dims = (128.0, 128.0)
													pos = (84.04444, 50.0)
													z_priority = 3.2
													scale = (0.688889, 0.688889)
												}
											}
											{
												props = {
													texture = encore_4_star
													local_id = encore_4_star
													type = SpriteElement
													dims = (128.0, 128.0)
													pos = (124.0, 50.0)
													z_priority = 3.3
													scale = (0.688889, 0.688889)
												}
											}
											{
												props = {
													texture = encore_4_star
													local_id = encore_4_star
													type = SpriteElement
													dims = (128.0, 128.0)
													pos = (163.95557, 50.0)
													z_priority = 3.4
													scale = (0.688889, 0.688889)
												}
											}
											{
												props = {
													texture = encore_4_star
													local_id = encore_4_star
													type = SpriteElement
													dims = (128.0, 128.0)
													pos = (203.91113, 50.0)
													z_priority = 3.5
													scale = (0.688889, 0.688889)
												}
											}
										]
									}
									{
										props = {
											local_id = encore_points_container
											type = ContainerElement
											dims = (200.0, 50.0)
											pos = (468.87906, 50.0)
											z_priority = 4.0
											scale = (0.81120896, 0.81120896)
										}
										children = [
											{
												props = {
													local_id = encore_points
													type = TextBlockElement
													alpha = 0.8
													dims = (230.0, 100.0)
													just = [
														-1.0
														0.0
													]
													pos_anchor = [
														-1.0
														0.0
													]
													pos = (0.0, -8.806544)
													z_priority = 4.0
													rot_angle = 2.0
													rgba = [
														224
														224
														224
														255
													]
													text = qs("999,999")
													font = fontgrid_text_a11
													fit_width = `scale each line if larger`
													fit_height = `scale down if larger`
													scale_mode = `per axis`
													text_case = Original
													internal_just = [
														-1.0
														0.0
													]
													internal_scale = (1.3, 1.3)
													font_spacing = 1
													shadow_offs = (3.0, 3.0)
												}
											}
										]
									}
								]
							}
							{
								props = {
									local_id = contine_stack
									type = MenuElement
									dims = (460.0, 80.0)
									pos = (275.0, 214.2857)
									z_priority = 3.0
									scale = (0.89285696, 0.89285696)
									isVertical = false
									internal_just = [
										0.0
										0.0
									]
									spacing_between = 10
									fit_major = `expand if content larger`
									fit_minor = `keep dims`
									scale_mode = proportional
								}
							}
							{
								props = {
									local_id = continue_container
									type = ContainerElement
									hiddenLocal = true
									dims = (0.0, 0.0)
									pos = (275.0, 250.0)
									z_priority = 4.0
									scale = (0.89285696, 0.89285696)
								}
								children = [
									{
										props = {
											local_id = `continue offset`
											type = ContainerElement
											hiddenLocal = true
											dims = (50.0, 50.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, 50.0)
											z_priority = 5.0
										}
										children = [
											{
												props = {
													local_id = continue_stacker
													type = MenuElement
													hiddenLocal = true
													dims = (375.09988, 50.0)
													pos_anchor = [
														0.0
														0.0
													]
													pos = (0.0, 0.0)
													z_priority = 5.0
													isVertical = false
													internal_just = [
														0.0
														0.0
													]
													spacing_between = 10
													fit_major = `expand if content larger`
													fit_minor = `keep dims`
													scale_mode = proportional
												}
												children = [
													{
														props = {
															texture = circle
															material = 0x00000000
															local_id = `circle outer`
															type = SpriteElement
															hiddenLocal = true
															dims = (70.0, 70.0)
															pos = (82.54994, 25.0)
															z_priority = 4.0
															rgba = [
																200
																120
																30
																255
															]
														}
														children = [
															{
																props = {
																	texture = circle
																	material = 0x00000000
																	local_id = `circle inner`
																	type = SpriteElement
																	hiddenLocal = true
																	dims = (60.0, 60.0)
																	pos_anchor = [
																		0.0
																		0.0
																	]
																	pos = (0.0, 0.0)
																	z_priority = 4.5
																	rgba = [
																		0
																		0
																		0
																		255
																	]
																}
															}
															{
																props = {
																	local_id = button_green
																	type = TextBlockElement
																	hiddenLocal = true
																	dims = (50.0, 52.0)
																	pos_anchor = [
																		0.0
																		0.0
																	]
																	pos = (0.0, 0.0)
																	z_priority = 5.0
																	text = qs("\b4")
																	font = fontgrid_text_a3
																	fit_width = `expand dims`
																	fit_height = `expand dims`
																	scale_mode = proportional
																	text_case = Original
																	internal_just = [
																		0.0
																		0.0
																	]
																	shadow_offs = (3.0, 3.0)
																}
															}
														]
													}
													{
														props = {
															local_id = continue_offset
															type = ContainerElement
															hiddenLocal = true
															dims = (200.0, 50.0)
															pos = (227.54994, 25.0)
															z_priority = 6.0
														}
														children = [
															{
																props = {
																	local_id = encore_continue
																	type = TextBlockElement
																	hiddenLocal = true
																	dims = (200.0, 50.0)
																	just = [
																		-1.0
																		0.0
																	]
																	pos_anchor = [
																		-1.0
																		0.0
																	]
																	pos = (0.0, 7.0)
																	z_priority = 3.0
																	rgba = [
																		200
																		120
																		30
																		255
																	]
																	text = qs("LET'S ROCK!")
																	font = fontgrid_title_a1
																	fit_width = `scale each line to fit`
																	fit_height = `scale down if larger`
																	scale_mode = `per axis`
																	text_case = upper
																	internal_just = [
																		-1.0
																		0.0
																	]
																	internal_scale = (0.7, 0.7)
																	shadow_offs = (3.0, 3.0)
																}
															}
														]
													}
												]
											}
										]
									}
								]
							}
						]
					}
				]
			}
			{
				props = {
					texture = Encore_Flash
					blend = Add
					local_id = Encore_Flash
					type = SpriteElement
					alpha = 0.0
					dims = (128.0, 128.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, -100.0)
					z_priority = 0.0
					scale = (2.0, 2.0)
				}
			}
		]
	}
}
uidesc_encore_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			18
			19
			20
			21
			24
		]
	}
	EditMaterialForm = {
	}
}
