uidesc_dialog_box = {
	DescVersion = 9
	name = uidesc_dialog_box
	rect = [
		0.0
		-17.185623
		1280.0
		737.1856
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 5
					validateLocalID = dlog_vmenu_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dlog_vmenu
					includeParentOwned = false
				}
			]
			name = alias_dlog_vmenu
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 3
					validateLocalID = title_text_container
					includeParentOwned = false
				}
			]
			name = alias_dialog_text
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 3
					validateLocalID = title_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dlog_title
					includeParentOwned = false
				}
			]
			name = PopupTitle_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 4
					validateLocalID = dlog_message
					includeParentOwned = false
				}
			]
			name = PopupBody_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 3
					validateLocalID = title_text_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = dlog_title
					includeParentOwned = false
				}
			]
			name = PopupTitle_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = dlog_master_container
				}
				{
					index = 2
					validateLocalID = glints_container
					includeParentOwned = false
				}
				{
					index = 0
					validateLocalID = mixer_glow_64
					includeParentOwned = false
				}
			]
			name = glint_alpha_1
			target = alpha
			type = float
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = dlog_master_container
			type = ContainerElement
			dims = (1280.0, 720.0)
			just = [
				-1.0
				-1.0
			]
			pos = (0.0, 0.0)
			z_priority = 496.0
		}
		children = [
			{
				props = {
					local_id = dlog_BG_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.0, 0.0)
					z_priority = 497.0
				}
				children = [
					{
						props = {
							material = 0x00000000
							texture = dialog_bg
							local_id = dialog_bg
							type = SpriteElement
							dims = (720.0, 670.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -23.0)
							z_priority = 495.0
						}
					}
					{
						props = {
							local_id = alert_frame
							type = ContainerElement
							hiddenLocal = true
							dims = (100.0, 100.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -210.0)
							z_priority = 496.0
						}
						children = [
							{
								props = {
									local_id = alert_frame_container
									type = ContainerElement
									hiddenLocal = true
									dims = (100.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (0.0, 20.0)
									z_priority = 497.0
								}
								children = [
									{
										props = {
											texture = dialog_side_chain
											flip_v = true
											local_id = dialog_side_chain
											type = SpriteElement
											hiddenLocal = true
											dims = (512.0, 512.0)
											just = [
												-1.0
												-1.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, -69.99996)
											z_priority = 515.0
										}
									}
									{
										props = {
											texture = dialog_side_chain
											local_id = dialog_side_chain
											type = SpriteElement
											hiddenLocal = true
											dims = (512.0, 512.0)
											just = [
												1.0
												-1.0
											]
											pos_anchor = [
												0.0
												0.0
											]
											pos = (0.0, -69.99999)
											z_priority = 515.0
										}
									}
								]
							}
							{
								props = {
									local_id = alert_frame_bottom
									type = ContainerElement
									hiddenLocal = true
									dims = (100.0, 100.0)
									pos_anchor = [
										0.0
										0.0
									]
									pos = (10.0, 391.0)
									z_priority = 498.0
								}
								children = [
									{
										props = {
											local_id = alert_frame_bottom
											type = ContainerElement
											hiddenLocal = true
											dims = (100.0, 100.0)
											pos_anchor = [
												0.0
												0.0
											]
											pos = (2.7356572, -0.89648795)
											z_priority = 500.0
										}
										children = [
											{
												props = {
													texture = dialog_chain
													flip_v = true
													local_id = dialog_chain
													type = SpriteElement
													hiddenLocal = true
													dims = (64.0, 64.0)
													just = [
														-1.0
														-1.0
													]
													pos = (316.5634, 64.96212)
													z_priority = 497.0
													rot_angle = -5.0
												}
												children = [
													{
														props = {
															texture = dialog_chain
															flip_v = true
															local_id = dialog_chain
															type = SpriteElement
															hiddenLocal = true
															dims = (64.0, 64.0)
															just = [
																-1.0
																-1.0
															]
															pos = (-46.109367, 4.3988295)
															z_priority = 498.0
															rot_angle = 1.0
														}
														children = [
															{
																props = {
																	texture = dialog_chain
																	flip_v = true
																	local_id = dialog_chain
																	type = SpriteElement
																	hiddenLocal = true
																	dims = (64.0, 64.0)
																	just = [
																		-1.0
																		-1.0
																	]
																	pos = (-44.649536, 3.129708)
																	z_priority = 499.0
																	rot_angle = 2.0
																}
																children = [
																	{
																		props = {
																			texture = dialog_chain
																			flip_v = true
																			local_id = dialog_chain
																			type = SpriteElement
																			hiddenLocal = true
																			dims = (64.0, 64.0)
																			just = [
																				-1.0
																				-1.0
																			]
																			pos = (-43.23491, 1.8105379)
																			z_priority = 500.0
																			rot_angle = 3.0
																		}
																		children = [
																			{
																				props = {
																					texture = dialog_chain
																					flip_v = true
																					local_id = dialog_chain
																					type = SpriteElement
																					hiddenLocal = true
																					dims = (64.0, 64.0)
																					just = [
																						-1.0
																						-1.0
																					]
																					pos = (-43.211037, 3.1781278)
																					z_priority = 501.0
																					rot_angle = 3.0
																				}
																				children = [
																					{
																						props = {
																							texture = dialog_chain
																							flip_v = true
																							local_id = dialog_chain
																							type = SpriteElement
																							hiddenLocal = true
																							dims = (64.0, 64.0)
																							just = [
																								-1.0
																								-1.0
																							]
																							pos = (-43.99934, 6.240577)
																							z_priority = 502.0
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
											{
												props = {
													texture = dialog_chain
													flip_v = true
													local_id = dialog_chain
													type = SpriteElement
													hiddenLocal = true
													dims = (64.0, 64.0)
													just = [
														-1.0
														-1.0
													]
													pos = (52.6814, 89.38587)
													z_priority = 503.0
													rot_angle = 7.0
												}
												children = [
													{
														props = {
															texture = dialog_chain
															flip_v = true
															local_id = dialog_chain
															type = SpriteElement
															hiddenLocal = true
															dims = (64.0, 64.0)
															just = [
																-1.0
																-1.0
															]
															pos = (-44.246635, 5.3547244)
															z_priority = 504.0
															rot_angle = 1.0
														}
														children = [
															{
																props = {
																	texture = dialog_chain
																	flip_v = true
																	local_id = dialog_chain
																	type = SpriteElement
																	hiddenLocal = true
																	dims = (64.0, 64.0)
																	just = [
																		-1.0
																		-1.0
																	]
																	pos = (-42.40527, 4.08611)
																	z_priority = 505.0
																	rot_angle = 1.0
																}
																children = [
																	{
																		props = {
																			texture = dialog_chain
																			flip_v = true
																			local_id = dialog_chain
																			type = SpriteElement
																			hiddenLocal = true
																			dims = (64.0, 64.0)
																			just = [
																				-1.0
																				-1.0
																			]
																			pos = (-42.352116, 4.985229)
																			z_priority = 506.0
																			rot_angle = 1.0
																		}
																		children = [
																			{
																				props = {
																					texture = dialog_chain
																					flip_v = true
																					local_id = dialog_chain
																					type = SpriteElement
																					hiddenLocal = true
																					dims = (64.0, 64.0)
																					just = [
																						-1.0
																						-1.0
																					]
																					pos = (-43.302498, 5.153116)
																					z_priority = 507.0
																					rot_angle = 1.0
																				}
																				children = [
																					{
																						props = {
																							texture = dialog_chain
																							flip_v = true
																							local_id = dialog_chain
																							type = SpriteElement
																							hiddenLocal = true
																							dims = (64.0, 64.0)
																							just = [
																								-1.0
																								-1.0
																							]
																							pos = (-43.68412, 3.1898618)
																							z_priority = 508.0
																							rot_angle = 2.0
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
											{
												props = {
													texture = dialog_chain
													flip_v = true
													local_id = dialog_chain
													type = SpriteElement
													hiddenLocal = true
													dims = (64.0, 64.0)
													just = [
														-1.0
														-1.0
													]
													pos = (-207.8204, 73.522354)
													z_priority = 509.0
													rot_angle = 13.0
												}
												children = [
													{
														props = {
															texture = dialog_chain
															flip_v = true
															local_id = dialog_chain
															type = SpriteElement
															hiddenLocal = true
															dims = (64.0, 64.0)
															just = [
																-1.0
																-1.0
															]
															pos = (-42.151337, 1.371693)
															z_priority = 510.0
															rot_angle = 4.0
														}
														children = [
															{
																props = {
																	texture = dialog_chain
																	flip_v = true
																	local_id = dialog_chain
																	type = SpriteElement
																	hiddenLocal = true
																	dims = (64.0, 64.0)
																	just = [
																		-1.0
																		-1.0
																	]
																	pos = (-42.151337, 1.371693)
																	z_priority = 511.0
																	rot_angle = 4.0
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
					texture = gradient_256
					blend = subtract
					flip_h = true
					local_id = gradient_256
					type = SpriteElement
					alpha = 0.5
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 494.0
				}
			}
			{
				props = {
					local_id = glints_container
					type = ContainerElement
					hiddenLocal = true
					dims = (1280.0, 720.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 550.0
				}
				children = [
					{
						props = {
							texture = mixer_glow_64
							blend = Add
							local_id = mixer_glow_64
							type = SpriteElement
							hiddenLocal = true
							alpha = 0.2
							dims = (250.0, 250.0)
							pos = (596.66235, 107.81438)
							z_priority = 526.0
							rgba = [
								255
								128
								0
								255
							]
						}
					}
				]
			}
			{
				props = {
					local_id = title_text_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos = (640.0, 106.0)
					z_priority = 496.0
				}
				children = [
					{
						props = {
							local_id = dlog_title
							type = TextBlockElement
							dims = (300.0, 80.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, 15.0)
							z_priority = 525.0
							rgba = [
								200
								200
								200
								255
							]
							text = qs("OVERWRITTEN")
							font = fontgrid_text_a11_large
							fit_width = `scale each line if larger`
							fit_height = `clip top lines`
							scale_mode = proportional
							text_case = upper
							internal_just = [
								0.0
								0.0
							]
							internal_scale = (1.5, 1.5)
							use_shadow = true
							shadow_offs = (-3.0, -3.0)
						}
					}
				]
			}
			{
				props = {
					local_id = dlog_message
					type = TextBlockElement
					dims = (561.8959, 180.0)
					just = [
						0.0
						-1.0
					]
					pos = (640.0, 211.0)
					z_priority = 525.0
					rot_angle = -1.0
					rgba = [
						128
						128
						128
						255
					]
					text = qs("MESSAGE")
					font = fontgrid_text_a6
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = upper
					internal_just = [
						0.0
						0.0
					]
					internal_scale = (0.7, 0.7)
					shadow_offs = (3.0, 3.0)
				}
			}
			{
				props = {
					local_id = dlog_vmenu_container
					type = ContainerElement
					dims = (300.0, 140.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (0.13092, 185.7532)
					z_priority = 520.0
				}
				children = [
					{
						props = {
							local_id = dlog_vmenu
							type = MenuElement
							dims = (280.0, 120.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (0.0, -42.0)
							z_priority = 525.0
							rot_angle = -1.0
							internal_just = [
								0.0
								0.0
							]
							spacing_between = -10
							fit_major = `expand if content larger`
							fit_minor = `keep dims`
							scale_mode = proportional
						}
					}
				]
			}
			{
				props = {
					local_id = dlog_menu_container
					type = ContainerElement
					dims = (100.0, 100.0)
					pos = (640.0, 571.2609)
					z_priority = 520.0
				}
				children = [
					{
						props = {
							texture = dialog_corner_studs
							local_id = dialog_corner_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (128.0, 128.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-237.902, -100.000015)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_corner_studs
							flip_v = true
							local_id = dialog_corner_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (128.0, 128.0)
							just = [
								-1.0
								-1.0
							]
							pos = (215.16284, -98.00003)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_corner_studs
							flip_h = true
							local_id = dialog_corner_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (128.0, 128.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-238.08676, 34.000015)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_corner_studs
							flip_h = true
							flip_v = true
							local_id = dialog_corner_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (128.0, 128.0)
							just = [
								-1.0
								-1.0
							]
							pos = (215.53236, 33.99997)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_studs
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-41.99997, -64.000015)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_studs
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (24.0, -68.000015)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_studs
							flip_v = true
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (84.0, -66.000046)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_studs
							flip_h = true
							flip_v = true
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-50.0, 61.999954)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_studs
							flip_v = false
							flip_h = true
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (18.0, 61.999954)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_studs
							flip_h = true
							flip_v = false
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (82.0, 63.999954)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_studs
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-106.694954, -68.000015)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_studs
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (149.24957, -66.18483)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_studs
							flip_v = false
							flip_h = true
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (146.88, 61.999954)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_studs
							flip_v = false
							flip_h = true
							local_id = dialog_studs
							type = SpriteElement
							hiddenLocal = true
							dims = (64.0, 64.0)
							just = [
								-1.0
								-1.0
							]
							pos = (-112.694954, 63.815136)
							z_priority = 520.0
						}
					}
					{
						props = {
							texture = dialog_bg_menu
							local_id = dialog_bg_menu
							type = SpriteElement
							alpha = 0.9
							dims = (512.0, 250.0)
							pos_anchor = [
								0.0
								0.0
							]
							pos = (1.0, -53.260925)
							z_priority = 519.0
						}
					}
				]
			}
		]
	}
}
uidesc_dialog_box_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
			3
			4
			7
			9
			15
			21
		]
	}
	EditMaterialForm = {
	}
}
