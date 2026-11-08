credits_menu_font = fontgrid_text_a8
credits_menu_scroll = horizontal
credits_scroll_rate = 0

script ui_create_end_credits 
	printf \{'ui_create_end_credits'}
	spawnscriptnow ui_create_end_credits_spawned params = {<...>}
endscript

script ui_create_end_credits_spawned 
	kill_gem_scroller
	Progression_EndCredits
endscript

script ui_destroy_end_credits 
endscript

script create_credits_menu 
	if ($shutdown_game_for_signin_change_flag = 1)
		return
	endif
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = credits_backdrop_container
		pos = (0.0, 0.0)
		just = [
			left
			top
		]}
	if NOT ($end_credits = 1)
		change \{pause_enabled = 1}
		CreateScreenElement \{type = SpriteElement
			id = credits_backdrop
			parent = credits_backdrop_container
			texture = credits_bg
			rgba = [
				255
				255
				255
				255
			]
			pos = (640.0, 360.0)
			dims = (2560.0, 720.0)
			just = [
				center
				center
			]
			z_priority = 0
			alpha = 1}
		TileSprite \{parent = credits_backdrop_container
			texture = credits_bg
			tile_dims = (5120.0, 720.0)
			dims = (2560.0, 720.0)
			pos = (-2560.0, 0.0)}
		RunScriptOnScreenElement TileSpriteLoop id = <id> params = {move_x = 5 move_y = 0}
		event_handlers = [
			{pad_back end_credits_button params = <...>}
		]
		new_menu scrollid = mc_scroll vmenuid = current_menu event_handlers = <event_handlers>
		add_user_control_helper \{text = qs("BACK")
			button = red
			z = 1001}
		menu_music_on
	else
		new_menu \{scrollid = mc_scroll
			vmenuid = current_menu}
	endif
	RunScriptOnScreenElement \{id = credits_backdrop_container
		scrolling_list_begin}
	LaunchEvent \{target = current_menu
		type = focus}
endscript

script end_credits_button 
	destroy_credits_menu
	if GotParam \{soundcheck}
		frontend_load_soundcheck \{loadingscreen}
	endif
	generic_event_back
endscript

script destroy_credits_menu 
	if ($shutdown_game_for_signin_change_flag = 1)
		KillSpawnedScript \{name = create_credits_menu}
		if ScreenElementExists \{id = credits_list_container}
			DestroyScreenElement \{id = credits_list_container}
		endif
		KillSpawnedScript \{name = scrolling_list_begin}
	endif
	clean_up_user_control_helpers
	KillSpawnedScript \{name = TileSpriteLoop}
	if ScreenElementExists \{id = credits_backdrop_container}
		DestroyScreenElement \{id = credits_backdrop_container}
	endif
	if ScreenElementExists \{id = mc_scroll}
		DestroyScreenElement \{id = mc_scroll}
	endif
	if NOT ($end_credits = 1)
		change \{pause_enabled = 0}
	endif
endscript

script scrolling_list_begin 
	if ($end_credits = 1)
		Wait \{2
			seconds}
		CreateScreenElement \{type = ContainerElement
			parent = root_window
			id = credits_backdrop_container
			pos = (0.0, 0.0)
			just = [
				left
				top
			]}
	endif
	scrolling_list_init_credits
	scrolling_list_add_item <...>
endscript

script scrolling_list_add_item \{i = 0}
	if (<i> = 0)
		if NOT ($end_credits = 1)
			<i> = 6
		endif
	endif
	GetArraySize ($credits)
	if (<i> = <array_size>)
		printf \{qs("\L** END OF CREDITS **")}
		Wait <time> seconds
		if ScreenElementExists \{id = credits_list_container}
			DestroyScreenElement \{id = credits_list_container}
		endif
		if NOT ($end_credits = 1)
			end_credits_button \{soundcheck}
		endif
		return
	endif
	if StructureContains Structure = ($credits [<i>]) item
		text = (($credits [<i>]).item)
	else
		text = qs(" ")
	endif
	if StructureContains Structure = ($credits [<i>]) heading
		scale = <scale_head>
		color = <color_head>
		color_shadow = [20 10 5 90]
		shadow_offs = (3.0, 3.0)
	elseif StructureContains Structure = ($credits [<i>]) title
		scale = <scale_title>
		color = <color_title>
		color_shadow = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
	elseif StructureContains Structure = ($credits [<i>]) small
		scale = 0.5
		color = <color_body>
		color_shadow = [0 0 0 255]
		shadow_offs = (1.0, 1.0)
	else
		scale = <scale_body>
		color = <color_body>
		color_shadow = [0 0 0 255]
		shadow_offs = (3.0, 3.0)
	endif
	if StructureContains Structure = ($credits [<i>]) centered
		internal_just = [center center]
	else
		internal_just = <just>
	endif
	if StructureContains Structure = ($credits [<i>]) scroll_rate
		if ($end_credits = 1)
			change credits_scroll_rate = ($credits [<i>].scroll_rate)
		endif
	endif
	FormatText checksumname = item_id 'item_%n' n = <i>
	if ScreenElementExists id = <item_id>
		DestroyScreenElement id = <item_id>
	endif
	if ($credits_menu_scroll = vertical)
		<fit_width> = `scale each line if larger`
		<fit_height> = `expand dims`
	else
		<fit_width> = `expand dims`
		<fit_height> = `scale down if larger`
	endif
	CreateScreenElement {
		type = TextBlockElement
		id = <item_id>
		parent = credits_list_container
		font = fontgrid_text_a8
		dims = <our_dims>
		fit_width = <fit_width>
		fit_height = <fit_height>
		font_spacing = 1
		pos = (0.0, 0.0)
		internal_scale = <scale>
		text = <text>
		just = <just>
		internal_just = <internal_just>
		rgba = <color>
		alpha = 1
		shadow
		shadow_offs = <shadow_offs>
		shadow_rgba = <color_shadow>
		z_priority = <z_priority_credits>
	}
	GetScreenElementDims id = <item_id>
	if ($credits_menu_scroll = vertical)
		<item_height> = (<Height> + <spacer>)
		<item_pos> = (<base_pos> + (<item_height> * (0.0, 1.0)))
	else
		<item_width> = (<width> + <spacer>)
		if GotParam \{prev_dim_x}
			<item_pos> = (<base_pos> + ((<prev_dim_x> + <spacer>) * (1.0, 0.0)))
		else
			<item_pos> = (<base_pos> + (<item_width> * (1.0, 0.0)))
		endif
	endif
	<item_id> :SE_SetProps pos = <item_pos>
	if ($credits_menu_scroll = vertical)
		<distance> = (<screen_height> + ((<item_pos>.(0.0, 1.0)) - <screen_height>))
	else
		<distance> = (<screen_width> + ((<item_pos>.(1.0, 0.0)) - <screen_width> + <width>))
	endif
	<time> = (<distance> / $credits_scroll_rate)
	if ScreenElementExists id = <item_id>
		RunScriptOnScreenElement id = <item_id> scrolling_list_move_item params = {<...>}
	endif
endscript

script scrolling_list_move_item 
	RunScriptOnScreenElement id = credits_backdrop_container scrolling_list_queue_next_item params = {<...>}
	if ($credits_menu_scroll = vertical)
		<target_pos> = (<item_pos> - ((0.0, 1.0) * <distance>))
	else
		<target_pos> = (<item_pos> - ((1.0, 0.0) * <distance>))
	endif
	SE_SetProps time = <time> pos = <target_pos>
	SE_WaitProps
	if ScreenElementExists id = <item_id>
		DestroyScreenElement id = <item_id>
	endif
endscript

script scrolling_list_queue_next_item 
	begin
	if ScreenElementExists id = <item_id>
		GetScreenElementProps id = <item_id>
	endif
	if ($credits_menu_scroll = vertical)
		pos_y = (<pos>.(0.0, 1.0))
		if (<pos_y> < <screen_height>)
			<i> = (<i> + 1)
			scrolling_list_add_item <...>
			return
		endif
	else
		pos_x = (<pos>.(1.0, 0.0))
		if (<pos_x> < <screen_width>)
			<i> = (<i> + 1)
			<prev_dim_x> = (<dims>.(1.0, 0.0))
			scrolling_list_add_item <...>
			return
		endif
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script scrolling_list_init_credits 
	if ($end_credits = 1)
		z_priority_credits = 100
	else
		z_priority_credits = 1000
	endif
	if ($end_credits = 1)
		change \{credits_scroll_rate = 300.0}
		<screen_height> = 280.0
		<scale_head> = 0.9
		<color_head> = [180 165 120 255]
		<scale_body> = 0.65000004
		<color_body> = [180 200 200 255]
		<scale_title> = 0.65000004
		<color_title> = [204 0 0 255]
	else
		change \{credits_scroll_rate = 140.0}
		<screen_height> = 690
		<scale_head> = 0.9
		<color_head> = [180 165 120 255]
		<scale_body> = 0.65000004
		<color_body> = [180 200 200 255]
		<scale_title> = 0.65000004
		<color_title> = [204 0 0 255]
	endif
	<screen_width> = 1280
	if ($credits_menu_scroll = vertical)
		<just> = [center bottom]
		<base_pos> = ((640.0, 0.0) + ((0.0, 1.0) * <screen_height>))
		<column_width> = 450
		<our_dims> = (<column_width> * (1.0, 0.0))
		<spacer> = 5
	else
		<just> = [left center]
		<base_pos> = ((0.0, 320.0) + ((1.0, 0.0) * <screen_width>))
		<column_height> = 180
		<our_dims> = ((<column_height> * (0.0, 1.0)) + (70.0, 0.0))
		<spacer> = 15
	endif
	if ScreenElementExists \{id = credits_list_container}
		DestroyScreenElement \{id = credits_list_container}
	endif
	CreateScreenElement \{type = ContainerElement
		parent = credits_backdrop_container
		id = credits_list_container
		pos = (0.0, 0.0)}
	return <...>
endscript
credits = [
	{
		item = qs("You've unlocked")
	}
	{
		heading
		item = qs("\LPull Me Under\nDream Theater, 1992")
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		centered
		item = qs(0x86562060)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xd146f080)
	}
	{
		item = qs(0xff18bcae)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xd9afec81)
	}
	{
		item = qs(0x9a67331b)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xd21ef2f0)
	}
	{
		item = qs(0x5f2510e3)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xe6245068)
	}
	{
		item = qs(0x69d53a47)
	}
	{
		item = qs(0xc94ccbdf)
	}
	{
		item = qs(0x075cb609)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xd057b5fd)
	}
	{
		item = qs(0xde5ee189)
	}
	{
		item = qs(0xc09aac64)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x0e3b822d)
	}
	{
		item = qs(0xb338f459)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x81ed158c)
	}
	{
		item = qs(0x203e344a)
	}
	{
		item = qs(0xc2a3240a)
	}
	{
		item = qs(0xcde2ddb8)
	}
	{
		item = qs(0xb7b2af31)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x3cb55c67)
	}
	{
		item = qs(0xf7f29802)
	}
	{
		item = qs(0x18f6ef03)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x8640d41c)
	}
	{
		item = qs(0x745de921)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x3db1ccd1)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x1817597e)
	}
	{
		item = qs(0x62260437)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xb679ca74)
	}
	{
		item = qs(0xe5d8b3ca)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xe6245068)
	}
	{
		item = qs(0x315335c1)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x494a538c)
	}
	{
		item = qs(0xbb307be0)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x105de242)
	}
	{
		item = qs(0xf982db00)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x9fd5303e)
	}
	{
		item = qs(0x565c4ed2)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x8e091b79)
	}
	{
		item = qs(0x67c9347e)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xe5e1a210)
	}
	{
		item = qs(0xaa168a50)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x2377100a)
	}
	{
		item = qs(0xa1e4cb89)
	}
	{
		item = qs(0x6a5ce07a)
	}
	{
		item = qs(0xc3511d49)
	}
	{
		emptyspace
	}
	{
		item = qs(0x49cb0d57)
	}
	{
		item = qs(0x66f5891e)
	}
	{
		item = qs(0x9ca82c02)
	}
	{
		item = qs(0xf508ac1d)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x7ae92be4)
	}
	{
		item = qs(0xe0df8009)
	}
	{
		item = qs(0x96f8d70e)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x36830ff1)
	}
	{
		item = qs(0x462a4c5b)
	}
	{
		item = qs(0xfe85a38d)
	}
	{
		item = qs(0x83823b34)
	}
	{
		item = qs(0xaab3a34b)
	}
	{
		item = qs(0xdd9c451f)
	}
	{
		item = qs(0x6989dbb1)
	}
	{
		item = qs(0x2dc35168)
	}
	{
		item = qs(0xa13cc3ed)
	}
	{
		item = qs(0xc2369f03)
	}
	{
		item = qs(0xc133a623)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x83039cd7)
	}
	{
		item = qs(0x4d4286d1)
	}
	{
		item = qs(0x0db1b2ae)
	}
	{
		item = qs(0x82a6224e)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x3f201283)
	}
	{
		item = qs(0x74f80837)
	}
	{
		item = qs(0x3d213e41)
	}
	{
		item = qs(0xd8c060c8)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0xb8b6c0bb)
		scroll_rate = 600.0
	}
	{
		item = qs(0x53e14db0)
	}
	{
		emptyspace
	}
	{
		item = qs(0x0630987d)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs(0x480b85b5)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0x255472b6)
	}
	{
		item = qs(0x33501c64)
	}
	{
		item = qs(0x49c4b9ca)
	}
	{
		item = qs(0x305fbdd6)
	}
	{
		item = qs(0x2efe00a4)
	}
	{
		item = qs(0xe4e93213)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xd057b5fd)
	}
	{
		item = qs(0x29529326)
	}
	{
		item = qs(0x788cdeb5)
	}
	{
		item = qs(0xfcee3251)
	}
	{
		item = qs(0x00650d04)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xd9afec81)
	}
	{
		item = qs(0x37ba8cdb)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xbf406256)
	}
	{
		item = qs(0xa53de758)
	}
	{
		item = qs(0xbac926e5)
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xb435573e)
	}
	{
		item = qs(0x4ebcb6e7)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		title
		item = qs(0xbc491f79)
	}
	{
		item = qs(0x7fb85357)
	}
	{
		item = qs(0x32ee76b6)
	}
	{
		item = qs(0x7c8bbcd6)
	}
	{
		item = qs(0x26f1473b)
	}
	{
		item = qs(0x1ed46f80)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		title
		item = qs("\LSpecial Thanks To")
	}
	{
		item = qs(0xda756452)
	}
	{
		item = qs(0x6e92a999)
	}
	{
		item = qs(0x0f18e845)
	}
	{
		item = qs(0x11cc665b)
	}
	{
		item = qs(0x00544fd2)
	}
	{
		item = qs(0xfd73dd06)
	}
	{
		item = qs(0x211e984c)
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		emptyspace
	}
	{
		heading
		item = qs("\LNeversoft")
	}
	{
		item = qs("\LAaron Habibipour\nAaron Williams\nAdam Micciulla\nAlan Flores")
	}
	{
		item = qs("\LAllen Freese\nAndy Gentile\nAndy Lee\nAndy Marchal")
	}
	{
		item = qs("\LAndy Warwick\nAnet Hambarsumian\nAnthony Campos\nAnthony Carotenuto")
	}
	{
		item = qs("\LAnthony Pesch\nAnthony Saunders\nBenjamin Kutcher\nBernard Corrigan")
	}
	{
		item = qs("\LBeth Cowling\nByeong Gyu Park\nBill Buckley\nBrad Bulkley")
	}
	{
		item = qs("\LBrandon Riggs\nBrendan Wiuff\nBrian Bright\nBrian Marvin")
	}
	{
		item = qs("\LBrian Oles\nCameron Davis\nChad Findley\nChad Sundman")
	}
	{
		item = qs("\LChris Barnes\nChristopher George\nChris Myers\nChris Parise")
	}
	{
		item = qs("\LChris Vance\nChris Ward\nClark Wen\nClive Burdon")
	}
	{
		item = qs("\LCody Pierson\nColin Crenshaw\nDana Delalla\nDaniel Nelson")
	}
	{
		item = qs("\LDan Savage\nDaryl Kimoto\nDave Cowling\nDave Hernandez")
	}
	{
		item = qs("\LDavid Hind\nDave Rowe\nDavid Nilsen\nDavid Stowater")
	}
	{
		item = qs("\Ldavidicus\nDonovan Keele\nDongWoo Thomas Shin\nFrancisco Mora")
	}
	{
		item = qs("\LGarrett Jost\nGary Jesdanun\nGavin Pugh\nGenna Habibipour")
	}
	{
		item = qs("\LGeoffrey Inkel\nGiancarlo Surla\nGideon Stocek\nGreg Lopez")
	}
	{
		item = qs("\LGregory Kopina\nHari Khalsa\nIli Chiang\nJake Geiger")
	}
	{
		item = qs("\LJason Greenberg\nJason Maynard\nJason Uyeda\nJeff Morgan")
	}
	{
		item = qs("\LJeff Swenty\nJeremiah Roa\nJeremy Page\nJeremy Rogers")
	}
	{
		item = qs("\LJiwon Son\nJody Coglianese\nJoe Pease\nJoe Kirchoff")
	}
	{
		item = qs("\LJoel Jewett\nJohn ''Bunny'' Knutson\nJohn Sahas\nJohn Webb")
	}
	{
		item = qs("\LJohn Zagorski\nJohnny Ow\nJon Bailey\nJordan Leckner")
	}
	{
		item = qs("\LJosh Lord\nJun Hyuck Chang\nJun Park\nJustin Rote")
	}
	{
		item = qs("\LJustin Parish\nKarl Drown\nKen Moodie\nKendall Harrison")
	}
	{
		item = qs("\LKevin Chung\nKevin Mulhall\nKristin Gallagher\nKristina Adelmeyer")
	}
	{
		item = qs("\LKyle Johnson\nLars Kendall\nLee Ross\nLisa Davies-Perissi")
	}
	{
		item = qs("\LLisa Perez\nLucy Andonian\nMarc DePeo\nMario Sanchez")
	}
	{
		item = qs("\LMark L. Scott\nMark Storie\nMark Wojtowicz\nMatt Canale")
	}
	{
		item = qs("\LMatthew Jackowski\nMax Davidian\nMichael Bilodeau\nMichael Esposito")
	}
	{
		item = qs("\LMichael Friedrich\nMichael Velasquez\nNathan Sisler\nNolan Nelson")
	}
	{
		item = qs("\LOlin Georgescu\nOmar Kendall\nOrion Brown\nPam Detrich")
	}
	{
		item = qs("\LPat Connole\nPatrick Hagar\nPaul Robinson\nPeter Day")
	}
	{
		item = qs("\LPeter Pon\nRandy Guillote\nRandy Mills\nRH Shih")
	}
	{
		item = qs("\LRiley Jewett\nRob T. Miller\nRobert Espinoza\nRock Gropper")
	}
	{
		item = qs("\LRulon Raymond\nRyan Ligon\nRyan Magid\nRyan Palser")
	}
	{
		item = qs("\LSam Ware\nSandy Jewett\nScott Pease\nSean Watson")
	}
	{
		item = qs("\LSergio Gil\nShane Calnan\nSimon Ebejer\nSimon Ko")
	}
	{
		item = qs("\LSivarak ''Kai'' Tawarotip\nSkye Kang\nStuart Scandrett\nTakashi Matsubara")
	}
	{
		item = qs("\LTed Barber\nThai Tran\nTim Stasica\nTimothy Rapp")
	}
	{
		item = qs("\LTina Stevenson\nTom Parker\nThomas Gawrys\nTony Solis")
	}
	{
		item = qs("\LTravis Chen\nWeichen Wu\nZac Drake\nZach Parr")
	}
	{
		heading
		item = qs("\LAdditional Development:")
	}
	{
		item = qs("\LArt Usher\nAlex Leffelman\nJames Barker\nJohn Dobbie\nMichelle Pierson")
	}
	{
		item = qs("\LRobert Kim\nSteve Gallacher\nTae Kuen Kim\nNick Covington\nRob Rampley")
	}
	{
		heading
		item = qs("\LHardcore Testers:")
	}
	{
		item = qs("\LAdam Nelson\nAdry Walsh\nAlexander Taubman\nAndrew Lee\nBrandon Tepezano")
	}
	{
		item = qs("\LBrandyn Betton\nChris Self\nChris Watkins\nClint Baptiste\nCurt Markwardt")
	}
	{
		item = qs("\LDaniel Bancroft\nDaniel Farina\nDaniel Lopez\nDanny Wapner\nDavid Delanty")
	}
	{
		item = qs("\LDavid Hyatt\nErica Travers\nEvan Bereny\nGareth Davies\nJacob Karesh")
	}
	{
		item = qs("\LJames Gobert\nJarod Long\nJeff Brys\nJennifer Sills\nJermaine Shockley")
	}
	{
		item = qs("\LJessie Reimer\nJonathan Green\nJoseph Arco\nJustin Hiscocks\nKami Talebi")
	}
	{
		item = qs("\LKenneth Ellis\nKyle Leonard\nKyle Novelli\nKyle Thompson\nLee Ware")
	}
	{
		item = qs("\LMatthew Bravos\nMatthew Cutting\nMaxwell Lewin\nMichael Winte\nNathan Makaryk")
	}
	{
		item = qs("\LNeil Cortez\nPat O'Riley\nRobert Keating\nRobert Byrd\nRon Williams")
	}
	{
		item = qs("\LSean Nagasawa\nSergio Pacheco\nTiffani Burkett\nTristan Clark\nWilliam Widger")
	}
	{
		heading
		item = qs("Special Thanks:")
	}
	{
		item = qs(0x5539481e)
	}
	{
		heading
		item = qs("\LData Capture Performers:")
	}
	{
		item = qs("\LAdam Jennings\nAlex Rodriquez\nAlla Garkusha\nKris Lezetc")
	}
	{
		item = qs("\LJosh Ballard\nDan Ballard\nDaniel Dempsey\nSam Gallagher")
	}
	{
		item = qs("\LJoe Hursley\nJoe Robinson\nJoe Stiteler\nPatrick Hursley")
	}
	{
		item = qs("\LNatalie Bolanos\nClaudia Rossi\nGinger Reyes\nJudita Wignall")
	}
	{
		item = qs("\LRob 'RA' Arvizu\nSonny Mayo\nJimi Taylor\nMatthias Kraneiss")
	}
	{
		heading
		item = qs("\LVO Actors:")
	}
	{
		item = qs("\LLiam O'Brien\nTroy Baker\nMichelle Ruff\nJulian Stone")
	}
	{
		item = qs("\L\c5Voice Casting:\n\c0PCB Productions\n\c5Talent Coordination:\n\c0Keith Arem")
	}
	{
		heading
		item = qs("\LPartners:")
	}
	{
		heading
		item = qs("\LAT&T")
	}
	{
		item = qs("\LAT&T, AT&T Park\nand the AT&T logo\nare trademarks\nof AT&T Intellectual Property")
	}
	{
		heading
		item = qs("\LCoca-Cola")
	}
	{
		item = qs("\L2008 The Coca-Cola Company.\n''Coca-Cola classic'', ''Sprite'',\n''Coke Side of Life'',the Contour Bottle design,\nthe Dynamic Ribbon are trademarks of The Coca-Cola Company.")
	}
	{
		heading
		item = qs("\LKFC")
	}
	{
		item = qs("\LThe image of\nColonel Sanders\nand KFC are registered\nof KFC Corporation (C) 2008.")
	}
	{
		heading
		item = qs("\LWrigley's")
	}
	{
		item = qs("\L5TM is a\ntrademark of\nthe Wm. Wrigley Jr.\nCompany")
	}
	{
		heading
		item = qs("\LAmoeba")
	}
	{
		item = qs(0xcc200999)
	}
	{
		heading
		item = qs("\LAmpeg")
	}
	{
		item = qs("\L''Ampeg'', ''SVT''\nand the Ampeg Logo are\nregistered trademarks of\nLOUD, Technologies, Inc.")
	}
	{
		heading
		item = qs("\LAudio-Technica")
	}
	{
		item = qs("\L©2008 Audio-Technica U.S., Inc.,\nthe Audio-Technica name and logo are\ntrademarks of  Audio-Technica U.S., Inc.\nAll Rights Reserved.")
	}
	{
		heading
		item = qs("\LEMG Pick-up")
	}
	{
		item = qs("\LEMG is a\nregistered\ntrademark\nof EMG Inc.\n")
	}
	{
		heading
		item = qs("\LErnie Ball")
	}
	{
		item = qs("\LErnie Ball\nis a registered\ntrademark of\nErnie Ball Inc.\n")
	}
	{
		heading
		item = qs("\LEvans Drum Heads")
	}
	{
		item = qs("\LEvans is a registered trademark\nof D'Addario & company, Inc.\nor its affiliates in the United States\nand/or other countries.")
	}
	{
		heading
		item = qs("\LGuitar Center")
	}
	{
		item = qs("\LGuitar Center® and the Guitar Center® logo\nare registered trademarks of Guitar Center, Inc.\nand are used by permission,\nall rights reserved")
	}
	{
		heading
		item = qs("\LKrank")
	}
	{
		item = qs("\LKrank Amplification is\na registered\ntrademark of\nKrank Amplification L.L.C.")
	}
	{
		heading
		item = qs("\LLive Nation")
	}
	{
		item = qs("\LHouse of Blues and the Flaming Heart logo are\nregistered trademarks of House of Blues Brands Corp.\nLive Nation and The Fillmore are registered\ntrademarks of Live Nation Worldwide, Inc.")
	}
	{
		heading
		item = qs("\LMACKIE")
	}
	{
		item = qs(0x62e9d670)
	}
	{
		heading
		item = qs("\LMarshall")
	}
	{
		item = qs("\LMarshall and the Marshall logo\nare trademarks or \nregistered trademarks\nof Marshall Amplification plc.")
	}
	{
		heading
		item = qs("\LPork Pie")
	}
	{
		item = qs("\LPork Pie\nis a registered\ntrademark of Pork Pie\nPercussion Incorporated.\n")
	}
	{
		heading
		item = qs("\LRegal Tip")
	}
	{
		item = qs("\LRegal Tip\nis a registered\ntrademark inc.\n")
	}
	{
		heading
		item = qs("\LVOX")
	}
	{
		item = qs("\LVOX is a\nregistered trademark of\nVOX R&D Limited,\nMilton Keynes, England")
	}
	{
		heading
		item = qs("\LZildjian")
	}
	{
		item = qs("\LZildjian, and the stylized\nZildjian logo are registered\ntrademarks of the\nAvedis Zildjian Company")
	}
	{
		heading
		item = qs("\LSabian")
	}
	{
		heading
		item = qs("\LSennheiser")
	}
	{
		heading
		item = qs("\LOC Drums")
	}
	{
		heading
		item = qs("\LActivision Production:")
	}
	{
		item = qs("\L\c5Senior Producer\n\c0Jeremiah Maza\n\n")
	}
	{
		item = qs("\L\c5Associate Producers\n\c0Patrick Bowman\nTed Lange\n")
	}
	{
		item = qs("\L\c5Production Coordinators\n\c0Casimero Agustin\nAndrew Hoffacker\nJames Norris")
	}
	{
		item = qs("\LAlex Ortiz\nRaul Renteria\n\n")
	}
	{
		item = qs("\L\c5Production Interns\n\c0Billy Kaplan\nAntonio Villaraigosa Jr.\n")
	}
	{
		item = qs("\L\c5Producer\n\c0Chuck Park\n\n")
	}
	{
		item = qs("\L\c5Executive Producer\n\c0Jeff Matsushita\n\n")
	}
	{
		item = qs("\L\c5Vice President Production\n\c0Steve Ackrich\n\n")
	}
	{
		item = qs("\L\c5Sr. Vice President Production\n\c0Laird Malamed\n\n")
	}
	{
		heading
		item = qs("\LRedOctane Marketing:")
	}
	{
		item = qs("\L\c5Sr. Director\nGBM\n\c0Tom Silk\n")
	}
	{
		item = qs("\L\c5Senior GBMs\n\c0Ryan Wener\nDoug McCracken\n")
	}
	{
		item = qs("\L\c5Associate Brand Managers\n\c0Emily Uyehara\nChris Enock\nBrandon Zien")
	}
	{
		item = qs("\L\c5Marketing Associates\n\c0Jesse Wan\n\n")
	}
	{
		item = qs("\L\c5Marketing Coordinator\n\c0Letty Cadena\n\n")
	}
	{
		heading
		item = qs("\LPR:")
	}
	{
		item = qs("\L\c5PR Director\n\c0Ryh-Ming C. Poon\n\n")
	}
	{
		item = qs("\L\c5PR Manager\n\c0Aaron Grant\n\n")
	}
	{
		item = qs("\L\c5PR Coordinators\n\c0Jordan Dodge\nAndrew Meyer\n")
	}
	{
		item = qs("\L\c5Global Asset Manager\n\c0Karen Yi\n\n")
	}
	{
		heading
		item = qs("\LBrand Activation:")
	}
	{
		item = qs("\L\c5VP, Brand Activation\n\c0Stacey Hirata\n\n")
	}
	{
		item = qs("\L\c5Sr. Brand Activation Manager\n\c0Jon Estanislao\n\n")
	}
	{
		item = qs("\L\c5Brand Activation Assistant\n\c0Kyle Rechsteiner\n\n")
	}
	{
		item = qs("\L\c5Brand Activation Associate\n\c0Megan Ferguson\n\n")
	}
	{
		heading
		item = qs("\LCreative Services:")
	}
	{
		item = qs("\L\c5Creative Services Manager\n\c0Mike Doan\n\n")
	}
	{
		item = qs("\L\c5Graphic Designers\n\c0Maly Bun\nMinna Hu\n")
	}
	{
		item = qs("\L\c5Web Designer\n\c0Jennifer Nakamura\n\n")
	}
	{
		heading
		item = qs("\LRedOctane:")
	}
	{
		item = qs("\L\c5President\n\c0Kai Huang\n\n")
	}
	{
		item = qs("\L\c5Head of Publishing\n\c0Dusty Welch\n\n")
	}
	{
		item = qs("\L\c5Executive VP\n\c0Charles Huang\n\n")
	}
	{
		item = qs("\L\c5European Marketing Manager\nRedOctane Europe\n\c0Anders Rinaldo\n")
	}
	{
		item = qs("\L\c5Executive Assistant\n\c0Trina Deakin\n\n")
	}
	{
		item = qs("\L\c5Licensing Associate\n\c0Chris Larkin\n\n")
	}
	{
		item = qs("\L\c5VP Finance\n\c0Richard Santiago\n\n")
	}
	{
		item = qs("\L\c5Controller\n\c0Monika Agarwal\n\n")
	}
	{
		item = qs("\L\c5Sr. Financial Analyst\n\c0Kevin Lurie\n\n")
	}
	{
		item = qs("\L\c5Sr. Accountant\n\c0Tina Xu\n\n")
	}
	{
		item = qs("\L\c5Logistics Manager\n\c0Candy Lu\n\n")
	}
	{
		item = qs("\L\c5Inventory Analyst\n\c0Scott Yang\n\n")
	}
	{
		item = qs("\L\c5HR Generalist\n\c0Kathryn Fernandez\n\n")
	}
	{
		heading
		item = qs("\LHardware:")
	}
	{
		item = qs("\L\c5VP Hardware\n\c0Lee Guinchard\n\n")
	}
	{
		item = qs("\L\c5Product Manager, UK\n\c0Steve Withers\n\n")
	}
	{
		item = qs("\L\c5Director of Hardware\n\c0Carter Lee\n\n")
	}
	{
		item = qs("\L\c5Hardware Associate\n\c0Mark Johnson\n\n")
	}
	{
		item = qs("\L\c5Hardware Program Director\n\c0David Dykes\n\n")
	}
	{
		item = qs("\L\c5Production Engineering Manager\n\c0Jared Chan\n\n")
	}
	{
		item = qs("\L\c5Lead Programmer\nDrums\n\c0Tim Clark\n")
	}
	{
		item = qs("\L\c5Programmer\n\c0Tom Perme\n\n")
	}
	{
		item = qs("\L\c5Lead Programmer\nGuitar\n\c0Nozumu Tan\n")
	}
	{
		item = qs("\L\c5Program Manager\nGuitar & Drums\n\c0Yuki Aiyama\n")
	}
	{
		item = qs("\L\c5Lead Programmer\nGuitar\n\c0Koji Kamyia\n")
	}
	{
		item = qs("\L\c5Director\nof R&D\n\c0Jack McCauley\n")
	}
	{
		item = qs("\L\c5Programmer\n\c0Mike Philbin\n\n")
	}
	{
		item = qs("\L\c5Product Designer\n\c0Cody Lee\n\n")
	}
	{
		heading
		item = qs("\LE-Commerce:")
	}
	{
		item = qs("\L\c5E-Commerce Manager\n\c0Michael Pan\n\n")
	}
	{
		item = qs("\L\c5Online\nMarketing Specialist\n\c0David Hsu\n")
	}
	{
		item = qs("\L\c5E-Commerce\nAssistants\n\c0Amanda Amezcua\nHana Sakamoto")
	}
	{
		item = qs("\L\c5Customer Service\nManager\n\c0Joe Mijares\n")
	}
	{
		item = qs("\L\c5Customer Support Team\n\c0Mike Dangerfield\nMasai Davis\nMelanie Porzio")
	}
	{
		item = qs("\L\c5Shipping\n\c0Lincoln Jalique\n\n")
	}
	{
		item = qs("\L\c5Webmaster\n\c0Suky Wong\n\n")
	}
	{
		heading
		item = qs("\LRedOctane Thanks:")
	}
	{
		item = qs("\LLillian Qian\nKaylan Huang\nCharley Huang\nSimon Huang\nLily Huang")
	}
	{
		item = qs("\LEthan Huang\nVictoria Bowman\nSamantha Chien\nJoshua Bowman\nSharon Maza")
	}
	{
		item = qs("\LMadison ''The Monster'' Maza\nSkye Lange\nDream Lange\nDorothy Yang\nThe San Jose Sharks")
	}
	{
		item = qs("\LThe Juco Family\nMB&GB\nDa Bears\nThe Larkin Family\nFreddie Arnott")
	}
	{
		item = qs("\LGrey Hawke\nRed Octane India Crew\nDennis Goh\nEskander Matta\nAlex Mahlke")
	}
	{
		item = qs("\LTom Knudsen\nJen Fox\nIvoline Lee\nJohn Devecka\nSwami Venkat")
	}
	{
		heading
		item = qs("\LActivision Music Department:")
	}
	{
		item = qs("\L\c5Vice President,\nMusic Affairs\n\c0Tim Riley\n")
	}
	{
		item = qs("\L\c5Sr. Manager,\nMusic Affairs\n\c0Brandon Young\n")
	}
	{
		item = qs("\L\c5Music Supervisor\n\c0Scott McDaniel\n\n")
	}
	{
		item = qs("\L\c5Audio\nAsset Specialist\n\c0David Iscove\n")
	}
	{
		item = qs("\L\c5Music and\nLicensing Specialists\n\c0Jeremy Volk\nMike Phegley")
	}
	{
		item = qs("\L\c5Music Coordinator\n\c0Jonathan Bodell\n\n")
	}
	{
		heading
		item = qs("\LMusic Thanks:")
	}
	{
		item = qs("\LIsaiah Abolin\nTyler Arend\nIrving Azoff\nChris Baker\nTravis Barker")
	}
	{
		item = qs("\LJoe Barresi\nCliff Bernstein\nSat Bisla\nMike Boila\nDave Bottrill")
	}
	{
		item = qs("\LKathryn Braddick\nRon Broitman\nThom Cadley\nKevin Carson\nJames Cassidy")
	}
	{
		item = qs("\LAnn Chien\nCarla Clark\nMichael Closter\nMatthew Cohen\nStewart Copeland")
	}
	{
		item = qs("\LBilly Corgan\nRich Costey\nJohn Cuniberti\nEric Custer\nJoe D'Ambrosio")
	}
	{
		item = qs("\LBernie Fischbach\nAnthony Fox\nWolfgang Frank\nMarti Frederiksen\nBrigitte Green")
	}
	{
		item = qs("\LNathan Gregory\nMichael Guarracino\nLauren Haber\nCecilia Harvey\nKrisstina Hawks")
	}
	{
		item = qs("\LWill Hensley\nNancy Jeffries\nAli Johnson\nAdam Jones\nAlan Jones")
	}
	{
		item = qs("\LTamera Kearney\nKato Khandwala\nKeith Koenig\nBob Koszela\nRod Kotler")
	}
	{
		item = qs("\LEddie Kramer\nMargaret Kramer\nWayne Kramer\nRichard Lancaster\nMichael Lutz")
	}
	{
		item = qs("\LMatt Marshall\nHector Martinez\nGabe Mason\nJohn McDermott\nMichael Meisel")
	}
	{
		item = qs("\LPeter Mench\nMark Mercado\nGary Miller\nSteve Morgan\nMelissa Munana")
	}
	{
		item = qs("\LJames Murray\nSteve Nice\nTed Nugent\nOzzy Osbourne\nSharon Osbourne")
	}
	{
		item = qs("\LSteve Ouimette\nJared Paul\nJeanette Perez\nDave Pettigrew\nJon Phillips")
	}
	{
		item = qs("\LMark Pinkus\nLisa Power\nJo Pusateri\nPete Readling\nMarc Reiter")
	}
	{
		item = qs("\LBob Ringe\nJack Rovner\nPaula Salvatore\nDave Sandford\nKathy Schenker")
	}
	{
		item = qs("\LCynthia Sexton\nJohn Silva\nAndie Simon\nTodd Singerman\nSting")
	}
	{
		item = qs("\LMike Swartz\nEli Tirado\nClaus Trelby\nBryan Van Dyk\nKevin Vanbergen")
	}
	{
		item = qs("\LLarry Vavra\nJake Voulgarides\nBrant Weil\nGreg Weisman\nKristen Welsh")
	}
	{
		item = qs("\LJames Willetts\nHayley Williams\nGary Wishik\nMissy Worth\nHenry Wrenn-Meleck")
	}
	{
		item = qs("\LZakk Wylde\nQ-Prime\nDave Steunebrink\nMallory Zumbach\nChad Smith")
	}
	{
		item = qs("\Land anyone\nwe may\nhave missed\n... thank you!\n")
	}
	{
		heading
		item = qs("\LActivision Business\n& Legal Affairs:")
	}
	{
		item = qs("\L\c5VP Business\n& Legal Affairs\n\c0Greg Deutsch\n")
	}
	{
		item = qs("\L\c5Director\nGovernment and\nLegislative Affairs\n\c0Philip Terzian")
	}
	{
		item = qs("\L\c5Transactional Counsel\n\c0Travis Stansbury\n\n")
	}
	{
		item = qs("\L\c5Senior Paralegal\n\c0Kap Kang\n\n")
	}
	{
		item = qs("\L\c5Sr. Director of\nProduction Services\n\c0Suzan Rude\n")
	}
	{
		heading
		item = qs("\LActivision Central Design\nand Playtesting:")
	}
	{
		item = qs("\L\c5Sr. Director,\nGame Design\n\c0Carl Schnurr\n")
	}
	{
		item = qs("\L\c5Manager of\nUser Testing\n\c0Ray Kowalewski\n")
	}
	{
		item = qs("\L\c5Senior Designer\n\c0Derek Daniels\n\n")
	}
	{
		item = qs("\L\c5Senior Designer\n\c0Danny Koo\n\n")
	}
	{
		item = qs("\L\c5Game Design Analyst\n\c0Jeff Chen\n\n")
	}
	{
		item = qs("\L\c5Game Designer\n\c0Thomas Wells\n\n")
	}
	{
		item = qs("\L\c5Sr. Director,\nTechnology\n\c0Matt Wilkinson\n")
	}
	{
		item = qs("\L\c5Sr. VP\nof Technology\n\c0Steve Pearce\n")
	}
	{
		item = qs("\L\c5User Testing Intern\n\c0Henry Liu\n\n")
	}
	{
		heading
		item = qs("\LCentral Audio:")
	}
	{
		item = qs("\L\c5Director,\nCentral Audio\n\c0Adam Levenson\n")
	}
	{
		item = qs("\L\c5Central\nAudio Coordinator\n\c0Noah Sarid\n")
	}
	{
		heading
		item = qs("\LActivision Special Thanks:")
	}
	{
		item = qs("\LMike Griffith\nRon Doornink\nThomas Tippl\nBrian Kelly\nBobby Kotick")
	}
	{
		item = qs("\LRobin Kaminsky\nBrian Ward\nBrian Hodous\nDave Stohl\nMaria Stipp")
	}
	{
		item = qs("\LJoerg Trouvain\nJohn Watts\nSteve Young\nJosh Taub\nLaura Hoegler")
	}
	{
		item = qs("\LJennifer Sullivan\nBeverly Liggett\nWade Pottinger\nSean Dexheimer\nDan Schaffer")
	}
	{
		item = qs("\LMolly Hinchey\nGeorge Rose\nMary Tuck\nDave Anderson\nJohn Dillulo")
	}
	{
		item = qs("\LMaryanne Lataif\nMichelle Schroder\nBlake Hennon\nVic Lopez\nJay Komas")
	}
	{
		item = qs("\LNeil Armstrong\nPeter Oey\nSteve Wereb\nTodd Szalla\nNikunj Dalal")
	}
	{
		item = qs("\LKathryn Murray\nChris Cosby\n''Music Guru Dan Block''\nTina Kwon\n")
	}
	{
		heading
		item = qs("\LQuality\nAssurance:")
	}
	{
		item = qs("\L\c5VP Quality Assurance/\nCustomer Service\n\c0Rich Robinson\n")
	}
	{
		item = qs("\L\c5Director,\nQuality Assurance\n\c0Marilena Morini\n")
	}
	{
		item = qs("\L\c5Manager,\nQA Operations\n\c0Chris Keim\n")
	}
	{
		heading
		item = qs("\LQA, Functionality:")
	}
	{
		item = qs("\L\c5QA Project Lead,\nDayshift\n\c0Mike Ryan\n")
	}
	{
		item = qs("\L\c5QA Project Lead,\nNight Shift\n\c0José Juan Ornelas\n")
	}
	{
		item = qs("\L\c5QA Project Lead,\nMusic Studio\n\c0David Lara\n")
	}
	{
		item = qs("\L\c5QA Project Lead,\nDownloadable Content\n\c0Albert Yao\n")
	}
	{
		item = qs("\L\c5QA Floor Leads, Dayshift\n\c0Ivan Arzate\nLee Cheramie\nRamon Ramirez")
	}
	{
		item = qs("\L\c5QA Floor Leads, Nightshift\n\c0Trevor Page\nJulius Hipolito\nRon Ruhl, Wei Zhao")
	}
	{
		item = qs("\L\c5QA Floor Lead,\nMusic Studio\n\c0Dan Ludwig\n")
	}
	{
		item = qs("\L\c5QA Database\nAdministrator,\nDayshift\n\c0Dong Fan")
	}
	{
		item = qs("\L\c5QA Database\nAdministrator,\nNightshift\n\c0Osvaldo Mejia")
	}
	{
		item = qs("\L\c5QA Testers,\nDayshift\n\c0Alan Garcia\nAlbert Jacobs")
	}
	{
		item = qs("\LAmir Ali\nAndrew Ganzon\nAndrew Linstrom\nAnthony Randolph")
	}
	{
		item = qs("\LBen Muller\nBradley Buller\nBrandon Rojo\nBrandon Willis")
	}
	{
		item = qs("\LBrent Gothold\nBrian Hibbard\nCalvin Mendoza\nCharles Moore")
	}
	{
		item = qs("\LChris Reinhart\nChris Staples\nChristian Velasquez\nCiji Thornton")
	}
	{
		item = qs("\LClarence Weaver\nDaniel Brown\nDanny Reynoso\nDavid Greene")
	}
	{
		item = qs("\LDavid Nordstad\nDavid Oberlin\nDavid Perea\nDavid Storey")
	}
	{
		item = qs("\LDemetrius Hoston\nDillon Chance\nDustin Daves\nElieser Quintero")
	}
	{
		item = qs("\LEnrique Roldan\nEvan Akutagawa\nFrankie Ludena\nGiovanni Funes")
	}
	{
		item = qs("\LGrant Asay\nHector Garcia\nIan Camacho\nIan Whaley")
	}
	{
		item = qs("\LIsmael Camberos\nJacob Goldman\nJames Hooper\nJames Stickley")
	}
	{
		item = qs("\LJason Ralya\nJean Medina\nJebediah Dylan Jester\nJoel Lee")
	}
	{
		item = qs("\LJonathan Ernest\nJonathan Ventura\nJordan Bhondus\nJosh Chandler")
	}
	{
		item = qs("\LJosh Green\nJosh Mendoza\nKeith Dator\nKevin Tucker")
	}
	{
		item = qs("\LKhalin Mikkelsen\nLee Staples\nLola Riverwalker\nLou Studdert")
	}
	{
		item = qs("\LMarc Williams\nMark Todd\nMatt Smith\nMichael Bolduc")
	}
	{
		item = qs("\LMichael Buller\nMichael Stella\nMichael Taing\nMike Cook")
	}
	{
		item = qs("\LMike Hunau\nNathan Kinney\nNicholas Chavez\nOrlando Morales")
	}
	{
		item = qs("\LOscar Arias\nPatrick Garcia\nPedro Aguilar\nPhillip Needham")
	}
	{
		item = qs("\LRichard Dicks\nRichard Reza\nRichard Rodriquez\nRobert Bruce")
	}
	{
		item = qs("\LRobert Chaplan\nRobert Tai\nRoderick Erwin\nRudy Ibarra")
	}
	{
		item = qs("\LRyan Badin\nSam Cividonis\nSam Cohn\nSean Moline")
	}
	{
		item = qs("\LShawn Belew\nT'Challa Dion Jackson\nThomas Sonntag\nTimothy Reichenbach")
	}
	{
		item = qs("\LTodd Carrigan\nTyler Robinson\nValerie Hilgenfeldt\nVince Torres")
	}
	{
		item = qs("\L\c5QA Testers, Nightshift\n\c0Alan Rivas\nAdam Grodin\nAlex Gellerman")
	}
	{
		item = qs("\LAlexander Embray\nAmanda Rose\nAndre Haftevani\nAnthony Bellisario")
	}
	{
		item = qs("\LAnthony Gorski\nBenjamin Deutsch\nBenjamin Johnson\nBenjamin Plunk")
	}
	{
		item = qs("\LBrandon Garrett\nBrandon Ramos\nBryan Chice\nBryan Wilson")
	}
	{
		item = qs("\LChris Gerfen\nChristian Bachman\nChristian Murillo\nChristopher Carnell")
	}
	{
		item = qs("\LColin Tistaert\nDavid Marcus\nDee Kevin\nAce Gibson")
	}
	{
		item = qs("\LDerek Heiland\nDidier Benitez\nDomenique Pineda\nDro Surmenian")
	}
	{
		item = qs("\LEdwin Payen\nElmer De Leon\nEmilio Rossal\nEric Burson")
	}
	{
		item = qs("\LEric Hernandez\nEric Kelly\nEric Valentin\nErik Steinmetz")
	}
	{
		item = qs("\LErika Rodriguez\nGary Davidson\nGerald Becker\nHugo Felix")
	}
	{
		item = qs("\LIan Page\nIan Pepple\nIsara (Jay) Nareesrisawatdi\nIsrael Barco")
	}
	{
		item = qs("\LJaime Segovia\nJake Siegel\nJames Davis\nJames Hass")
	}
	{
		item = qs("\LJeff Hartney\nJeff Mitchell\nJerome Li\nJess Sparks")
	}
	{
		item = qs("\LJimmy Yang\nJoah Ferchak\nJohn Garcia\nJoseph Chaves")
	}
	{
		item = qs("\LJoshua Munson\nJovani Banuelos\nJovany Zuniga\nJuan Arias")
	}
	{
		item = qs("\LJuan Valencia\nJules Lewis\nJustin Huthmacher\nKerwin Munsell")
	}
	{
		item = qs("\LKevin Berger\nKevin Smith\nKhamil Davis\nLa Vonce Ervin")
	}
	{
		item = qs("\LLovely Morata\nLuke Saville\nMarc Hughley\nMatt Hartley")
	}
	{
		item = qs("\LMichael Chinn\nMichael Hustis\nMichael Roberts\nMike Chaja")
	}
	{
		item = qs("\LNeal Nikaido\nOscar Rodriguez\nRigo Garcia\nRoberto Benites")
	}
	{
		item = qs("\LRoberto Dominguez\nScott Williams\nSean Belloso\nSean Urner")
	}
	{
		item = qs("\LSteve Tippett\nTiffany Beh-john Asghary\nVicente Gutierrez\nWilliam Kelly")
	}
	{
		item = qs("\L\c5QA Senior\nProject Lead\nDayshift\n\c0Paul Williams")
	}
	{
		item = qs("\L\c5QA Senior \nProject Lead\nNightshift\n\c0Frank So")
	}
	{
		item = qs("\L\c5QA Manager,\nDayshift\n\c0John Rosser\n")
	}
	{
		item = qs("\L\c5QA Manager,\nNightshift\n\c0Adam Hartsfield\n")
	}
	{
		heading
		item = qs("\LTechnical\nRequirements\nGroup:")
	}
	{
		item = qs("\L\c5TRG Senior Manager\n\c0Christopher Wilson\n\n")
	}
	{
		item = qs("\L\c5TRG Submissions Leads\n\c0Dan Nichols\nChristopher Norman\n")
	}
	{
		item = qs("\L\c5Sr. TRG Platform Leads\n\c0Marc Villanueva\nTeak Holley\n")
	}
	{
		item = qs("\L\c5TRG Platform Leads\n\c0James Rose\nJared Baca\nBenjamin Abel")
	}
	{
		item = qs("\L\c5TRG Testers\n\c0Alex Hirsch\nChristian Haile\nDaniel Fehskens")
	}
	{
		item = qs("\LJacob Zwirn\nJason Garza\nJonathan Butcher\nMark Ruzicka")
	}
	{
		item = qs("\LPisoth Chham\nRhonda Ramirez\nWilliam Camacho\n")
	}
	{
		item = qs("\L\c5Sr. TRG Platform Leads\n\c0Kyle Carey\nJason Harris\n")
	}
	{
		item = qs("\L\c5TRG Platform Leads\n\c0Paul Carrion\nBrian Bensi\nTomo Shikami")
	}
	{
		item = qs("\L\c5TRG Testers\n\c0Alyssa Delhotal\nBrian Baker\nKeith Kodama")
	}
	{
		item = qs("\LColin Kawakami\nStefan Goodreau\nJohn McCurry\nKirt Sanchez")
	}
	{
		item = qs("\LElizabeth Hickey-McCoy\nMelvin Allen\nScott Borakove\nScott Winslow")
	}
	{
		heading
		item = qs("\LQA\nNetwork\nLab:")
	}
	{
		item = qs("\L\c5QA Network Lab\nSenior Project Lead\n\c0Francis Jimenez\n")
	}
	{
		item = qs("\L\c5QA\nNetwork\nLab Testers\n\c0Leonard Rodriguez\nShamen'e Childress\n")
	}
	{
		heading
		item = qs("\LQA\nMultiplayer Lab:")
	}
	{
		item = qs("\L\c5QA-MPL Project Lead\n\c0Garrett Oshiro\n\n")
	}
	{
		item = qs("\L\c5QA-MPL Floor Leads\n\c0Jessie Jones\nMario Ibarra\nJulio Medina")
	}
	{
		item = qs("\L\c5QA-MPL Testers\n\c0Matt Fawbush\nJaemin Kang\nJonathan Mack\nHyun ''Andy'' Kim")
	}
	{
		item = qs("\LBobby Jones\nBrian Lay\nEmmanuel Salva Cruz\nRyan Rigg\n")
	}
	{
		heading
		item = qs("\LQA Audio\nVisual Lab:")
	}
	{
		item = qs("\L\c5QA-AVL Project Lead\n\c0Victor Durling\n\n")
	}
	{
		heading
		item = qs("\LQA\nBurnroom:")
	}
	{
		item = qs("\L\c5Burn Room Supervisor\n\c0Joule Middleton\n\n")
	}
	{
		item = qs("\L\c5Burn Room Technicians\n\c0Danny Feng\nKai Hsu\nSean Kim, Rodrigo Magana")
	}
	{
		heading
		item = qs("\LQA-MIS:")
	}
	{
		item = qs("\L\c5Senior Manager\nQA Technologies\n\c0Indra Yee\n")
	}
	{
		item = qs("\L\c5QA-MIS Manager\n\c0Dave Garcia-Gomez\n\n")
	}
	{
		item = qs("\L\c5QA-MIS Technicians\n\c0Teddy Hwan\nBrian Martin\nJeremy Torres")
	}
	{
		item = qs("\LLawrence Wei\nSean Olson\n\n")
	}
	{
		item = qs("\L\c5QA-MIS\nEquipment Coordinators\n\c0Long Le\nColeman Thaxton\n")
	}
	{
		heading
		item = qs("\LQA Database\nAdministration Group:")
	}
	{
		item = qs("\L\c5QA Lead\nDatabase Administrator\n\c0Jeremy Richards\n")
	}
	{
		item = qs("\L\c5Floor Lead\nDatabase Administrator\n\c0Kelly Huffine\n")
	}
	{
		item = qs("\L\c5DBA Senior Testers\n\c0Timothy Toledo\nChristopher Shanley\nWayne Williams")
	}
	{
		item = qs("\L\c5DBA Tester\n\c0Jon Luce\n\n")
	}
	{
		heading
		item = qs("\LCS/QA\nThanks:")
	}
	{
		item = qs("\LNadine Theuzillot\nRachel Overton\nAileen Paul\nJeremy Shortell")
	}
	{
		item = qs("\LDenise Luce\nMarc Williams\nRichard Pearson\nJake Ryan")
	}
	{
		heading
		item = qs("\LCustomer\nSupport:")
	}
	{
		item = qs("\L\c5Phone Support Manager\n\c0Gary Bolduc\n\n")
	}
	{
		item = qs("\L\c5E-Mail Support Manager\n\c0Michael Hill\n\n")
	}
	{
		heading
		item = qs(0x79ec9844)
	}
	{
		item = qs(0xe6c20259)
	}
	{
		item = qs(0x8222a7d3)
	}
	{
		item = qs(0xadf87fc0)
	}
	{
		item = qs(0x090953ec)
	}
	{
		item = qs(0xbd141a6c)
	}
	{
		item = qs(0xf6704374)
	}
	{
		item = qs(0xa6a65f90)
	}
	{
		heading
		item = qs("\LLocalisation QA Testers")
	}
	{
		item = qs(0xc16d247c)
	}
	{
		item = qs(0x6f8554fd)
	}
	{
		item = qs(0xcc425b32)
	}
	{
		item = qs(0xb6fb867a)
	}
	{
		item = qs(0xf50a7401)
	}
	{
		item = qs(0x1062a88b)
	}
	{
		item = qs(0x46fcdb87)
	}
	{
		item = qs(0x61bb5987)
	}
	{
		item = qs(0x37a97f63)
	}
	{
		item = qs(0x381da364)
	}
	{
		item = qs(0x60d4c9d3)
	}
	{
		item = qs(0x78771b1c)
	}
	{
		heading
		item = qs(0xb5c23879)
	}
	{
		heading
		item = qs("\LDemonWare:")
	}
	{
		item = qs("\LNadia Alramli\nDavid Brennan\nMorgan Brickley\nLuke Burden")
	}
	{
		item = qs("\LAaron Burt\nMichael Collins\nTim Czerniak\nBrendan Dillon")
	}
	{
		item = qs("\LMalcolm Dowse\nEoghan Gaffney\nSteffen Higel\nTony Kelly")
	}
	{
		item = qs("\LJohn Kirk\nCraig McInnes\nEoin O'Fearghail\nByron Pile")
	}
	{
		item = qs("\LRuaidhrí Power\nTilman Schäefer\nAmy Smith\nEmmanuel Stone")
	}
	{
		heading
		item = qs("\LAnimated sequences\nby Titmouse, Inc.:")
	}
	{
		item = qs("\L\c5Creative Producer\n\c0Keith Fay\n\c5Director\n\c0Juno Lee")
	}
	{
		item = qs("\L\c5Background Supervisor\n\c0Antonio Cannobio\n\c5Lead Designer\n\c0Junpei Takayama")
	}
	{
		item = qs("\L\c5Lead Animator\n\c0Jeremy Polgar\n\c5Animator\n\c0Tony Andrade")
	}
	{
		item = qs("\L\c5Animator\n\c0Ryan DeLuca\n\c5Background Paint and Design\n\c0Sung Jin Ahn")
	}
	{
		item = qs("\L\c5Background Painter\n\c0Keyoei Takayama\n\c5Background Painter\n\c0Pam Friend")
	}
	{
		item = qs("\L\c5Background Painter\n\c0Snakebite\n\c5Background Design\n\c0Roger Oda")
	}
	{
		item = qs("\L\c5Background Design\n\c0Rev. Dave Johnson\n\c5Ink & Paint\n\c0Brian Kim")
	}
	{
		item = qs("\L\c5Assistant Character Design\n\c0Gabe Lee\n\c5Digital Compositing\n\c0Keith Kin Yan")
	}
	{
		heading
		item = qs("\LMusic:")
	}
	{
		heading
		item = qs("\L''About A Girl\n(Unplugged)''")
	}
	{
		item = qs("\LWritten by Kurt Cobain\nCourtesy of Geffen Records\nunder license from\nUniversal Music Enterprises")
	}
	{
		item = qs("\LPerformed by Nirvana\nPublished by EMI Virgin Songs,Inc.\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''Aggro''")
	}
	{
		item = qs("\LWritten by Thomas Clarke\nPerformed by The Enemy\nCourtesy of Warner Music UK\nBy arrangement with ")
	}
	{
		item = qs("\LWarner Music Group Video Game Licensing\n(P) 2007 Warner Music UK\nPublished by EMI April Music Inc.\nAll Rights Reserved. Used by Permission.")
	}
	{
		heading
		item = qs("\L''American Woman''")
	}
	{
		item = qs("\LWritten by Randy Bachman, Burton Cummings\nJim Kale, Garry Peterson\nPerformed by The Guess Who\nPublished by SHILLELAGH MUSIC (BMI)")
	}
	{
		item = qs("\Ladministered by Bug Music, Inc.\nCourtesy of The RCA Records Label\nBy arrangement with \nSONY BMG MUSIC ENTERTAINMENT")
	}
	{
		heading
		item = qs("\L''Antisocial''")
	}
	{
		item = qs("\LWritten by Norbert Krief, Bernard Bonvoisin\nPerformed by Trust\nCourtesy of SONY BMG MUSIC ENTERTAINMENT FRANCE, S.A.\nBy arrangement with SONY BMG MUSIC ENTERTAINMENT")
	}
	{
		item = qs("\LPublished by EMI April Music Inc.\nAll Rights Reserved.\nUsed by Permission.\n")
	}
	{
		heading
		item = qs("\L''Are You Gonna Go My Way''")
	}
	{
		item = qs("\LMusic by Lenny Kravitz, Craig Ross\nWords by Lenny Kravitz\nPerformed by Lenny Kravitz\nCourtesy of Virgin Records America, Inc.")
	}
	{
		item = qs("\LUnder license from\nEMI Film & Television Music\nPublished by Miss Bessie Music (ASCAP)\nand Wigged Music (BMI)")
	}
	{
		heading
		item = qs("\L''Assassin''")
	}
	{
		item = qs("\LWritten by Matt Bellamy\nPerformed by Muse\nCourtesy of Warner Music UK\nBy arrangement with Warner Music Group Video Game Licensing")
	}
	{
		item = qs("\L(P) 2006 A&E Records  (C) 2006 LOOSECHORD LIMITED (NS)\nALL RIGHTS ADMINISTERED BY\nWARNER/CHAPPELL MUSIC PUBLISHING LTD\nALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''Band on the Run''")
	}
	{
		item = qs("\LWritten by Paul McCartney, Linda McCartney\nPerformed by Wings\nCourtesy of MPL Communications, Inc\nPublished by MPL Communications, Inc")
	}
	{
		heading
		item = qs("\L''Beat It''")
	}
	{
		item = qs("\LWritten by Michael Jackson\nPerformed by Michael Jackson\nCourtesy of Epic Records\nBy arrangement with SONY BMG MUSIC ENTERTAINMENT")
	}
	{
		item = qs("\L(C) 1982 MIJAC MUSIC (BMI)\nALL RIGHTS ADMINISTERED BY\nWARNER-TAMERLANE PUBLISHING CORP.\nALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''Beautiful Disaster''")
	}
	{
		item = qs("\LWritten by Nick Hexum/311\nPerformed by 311\nCourtesy of\nVolcano Entertainment III, L.L.C.")
	}
	{
		item = qs("\LBy arrangement with\nSONY BMG MUSIC ENTERTAINMENT\nPublished by\nHydroponic Music")
	}
	{
		heading
		item = qs("\L''B.Y.O.B.''")
	}
	{
		item = qs("\LWritten by Daron Malakian, Serj Tankian, Casey Chmielinski\nPerformed by System Of A Down\nCourtesy of Columbia Records By arrangement with\nSONY BMG MUSIC ENTERTAINMENT Published by Sony ATV")
	}
	{
		heading
		item = qs("\L''Crazy Train''")
	}
	{
		item = qs("\LWritten by Bob Daisley, Ozzy Osbourne, Randy Rhoads\nPerformed by Ozzy Osbourne\nCourtesy of Epic Records By arrangement with SONY BMG MUSIC ENTERTAINMENT\nPublished by Blizzard Music Ltd")
	}
	{
		heading
		item = qs("\L''Dammit''")
	}
	{
		item = qs("\LWritten by Tom DeLonge, Mark Hoppus, Scott Raynor\nPerformed by blink-182\nCourtesy of Geffen Records under license from Universal Music Enterprises\nPublished by EMI April Music Inc.All Rights Reserved. Used by Permission.")
	}
	{
		heading
		item = qs("\L''Demolition Man (Live)''")
	}
	{
		item = qs("\LWritten by Sting\nPerformed by Sting\nCourtesy of\nA&M Records under license")
	}
	{
		item = qs("\Lfrom Universal Music Enterprises\nPublished by EMI Blackwood Music Inc.\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''Do It Again''")
	}
	{
		item = qs("\LWritten by Walter Carl Becker, Donald Fagen\nPerformed by Steely Dan\nCourtesy of Geffen Records under license from Universal Music Enterprises\n© 1972 Red Giant, Inc. (ASCAP), ")
	}
	{
		item = qs("\LAmerican Broadcasting Music, Inc. (ASCAP)\nAll rights on behalf of\nRed Giant, Inc.(ASCAP) and\nAmerican Broadcasting Music, Inc.")
	}
	{
		item = qs("\L(ASCAP) administered by\nUniversal Music Corp. (ASCAP)\nAll rights reserved.\nUsed by permission")
	}
	{
		heading
		item = qs("\L''Escuela De Calor''")
	}
	{
		item = qs("\LWritten by Santiago Auseron Marruedo, Luis Gregorio, Auseron Marruedo, Enrique Sierra Egea, Juan Carlos Velazques\nPerformed by Radio Futura\nCourtesy of SONY BMG MUSIC ENTERTAINMENT SPAIN, S.A.\nBy arrangement with SONY BMG MUSIC ENTERTAINMENT")
	}
	{
		item = qs("\L© 1984 Universal Music Publ. MGB Spain S.A. (SGAE)\nNSL Nueva Sociedad Lirica S.L. (SGAE)\nAll rights on behalf of\nUniversal Music Publ. MGB Spain S.A. (SGAE), ")
	}
	{
		item = qs("\LNSL Nueva Sociedad Lirica S.L. (SGAE)\nadministered by Universal Music - MGB Songs (ASCAP)\nAll rights reserved.\nUsed by permission")
	}
	{
		heading
		item = qs("\L''Everlong''")
	}
	{
		item = qs("\LWritten by David Grohl\nPerformed by Foo Fighters\nCourtesy of Roswell Records Published by EMI Virgin Songs, Inc.\nAll Rights Reserved. Used by Permission.")
	}
	{
		heading
		item = qs("\L''Eye of\nthe Tiger''")
	}
	{
		item = qs("\LWritten by Jim Peterik, Frank Sullivan\nPerformed by Survivor\nCourtesy of Volcano Entertainment III, L.L.C.\nBy arrangement with SONY BMG MUSIC ENTERTAINMENT")
	}
	{
		item = qs("\LPublished by Sony ATV and (C) 1982 WB MUSIC CORP. (ASCAP),\nEASY ACTION MUSIC (ASCAP),THREE WISE BOYS MUSIC LLC (BMI)\nAND RUDE MUSIC INC (BMI)\nALL RIGHTS ON BEHALF OF ITSELF")
	}
	{
		item = qs("\LAND EASY ACTION MUSIC\nADMINISTERED BY\nWB MUSIC CORP.\nALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''Feel The Pain''")
	}
	{
		item = qs("\LWritten by J. Mascis, Jr.\nPerformed by Dinosaur Jr.\nCourtesy of Warner Music UK\nBy Arrangement with Warner Music Group Video Game Licensing\n")
	}
	{
		item = qs("\L(P) 1994 Warner Music UK\nPublished by\nChrysalis Songs\no/b/o Spam As The Bread Music (BMI)")
	}
	{
		heading
		item = qs("\L''Float On''")
	}
	{
		item = qs("\LWritten by Isaac Brock, Dann Gallucci, Eric Judy\nPerformed by Modest Mouse\nCourtesy of Epic Records by arrangement\nwith SONY BMG MUSIC ENTERTAINMENT Published by Sony ATV")
	}
	{
		heading
		item = qs("\L''Freak on\na Leash''")
	}
	{
		item = qs("\LWritten by Jonathan Davis, Reginald Arvizu\nJames Shaffer, David Silveria, Brian Welch\nPerformed by Korn\nCourtesy of Epic Records")
	}
	{
		item = qs("\LBy arrangement with SONY BMG MUSIC ENTERTAINMENT\n(C) 1998 WB MUSIC CORP. (ASCAP)\nAND GOATHEAD? MUSIC (ASCAP)\nALL RIGHTS ADMINISTERED BY WB MUSIC CORP. ALL RIGHTS RESERVED ")
	}
	{
		heading
		item = qs("\L''Go Your\nOwn Way''")
	}
	{
		item = qs("\LWritten by Lindsey Buckingham\nPerformed by Fleetwood Mac\nBy arrangement with\nWarner Music Group Video Game Licensing")
	}
	{
		item = qs("\LCourtesy of\nWarner Bros Records Inc.\n(P) 1977 Warner Bros. Records Inc.\nPublished by Now Sounds Music")
	}
	{
		heading
		item = qs("\L''Good God''")
	}
	{
		item = qs("\LWritten by Remon Stotijn, Anouk Teeuwe\nPerformed by Anouk\nCourtesy of EMI Records\nUnder license from EMI Film & Television Music")
	}
	{
		item = qs("\LPublished by\nEMI Blackwood Music Inc.\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''Hail To The Freaks''")
	}
	{
		item = qs("\LWritten by Arnim Teutoburg-Weiss, Peter Baumann Duese\nBernd Kurtzke, Torsten Scholz, Thomas Goetz\nPerformed by Beatsteaks\nCourtesy of Warner Music Germany")
	}
	{
		item = qs("\LBy arrangement with Warner Music Group Video Game Licensing\n(P) 2007 Warner Music Germany\n(C) 2007 ATZE & KEULE MUSIK (NS)\nAND HANSEATIC MUSIKVERLAG GMBH & CO KG (GEMA) ALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''Heartbreaker''")
	}
	{
		item = qs("\LWritten by Geoff Gill, Clint Wade\nPerformed by Pat Benatar\nCourtesy of Capitol Records, Inc.\nUnder license from EMI Film & Television Music")
	}
	{
		item = qs("\L© 1978 G. G. A. Music Ltd. (PRS) All rights on behalf\nof G. G. A. Music Ltd. (PRS) administered by Universal\nPolyGram Int. Publ., Inc. (ASCAP)\nAll rights reserved.  Used by permission ")
	}
	{
		heading
		item = qs("\L''Hey Man, Nice Shot''")
	}
	{
		item = qs("\LWritten by Richard Patrick\nPerformed by Filter\nCourtesy of Warner Bros. Records\nBy arrangement with")
	}
	{
		item = qs("\LWarner Music Group Video Game Licensing\n(P) 1995 Reprise Records\nPublished by EMI Blackwood Music Inc\nAll Rights Reserved. Used by Permission")
	}
	{
		heading
		item = qs("\L''Hollywood Nights''")
	}
	{
		item = qs("\LWritten by Bob Seger\nPerformed by Bob Seger  & The Silver Bullet Band\nCourtesy of Capitol Records, Inc.\nUnder license from EMI Film & Television Music")
	}
	{
		item = qs("\LPublished by\n Hideout Records &\nDistributors, Inc.,\nGear Publishing")
	}
	{
		heading
		item = qs("\L''Hot For Teacher''")
	}
	{
		item = qs("\LWritten by David Lee Roth, Eddie Van Halen, Alex Van Halen\nPerformed by Van Halen\nCourtesy of Warner Bros. Records Inc.\nBy arrangement with Warner Music Group Video Game Licensing")
	}
	{
		item = qs("\LALL RIGHTS\nADMINISTERED BY\nWB MUSIC CORP.\nALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''Hotel California''")
	}
	{
		item = qs("\LWritten by Don Felder, Glenn Frey, Don Henley\nPerformed by The Eagles\nCourtesy of Elektra Entertainment Group\nBy arrangement with Warner Music Group Video Game Licensing")
	}
	{
		item = qs("\L(P) 1976 Elektra Entertainment/\nAsylum Records/Nonesuch Records\nPublished by Cass Country Music (BMI),\nRed Cloud Music (BMI), Fingers Music (ASCAP)")
	}
	{
		heading
		item = qs("\L''The Joker''")
	}
	{
		item = qs("\LWritten by Steven H. Miller, Eddie Curtis, Ahmet Ertegun\nPerformed by Steve Miller Band\nCourtesy of Capitol Records, Inc.\nUnder license from EMI Film & Television Music")
	}
	{
		item = qs("\L© 1973 Sailor Music, Warner-Tamerlane Music,\nJim Rooster Music. Administered Worldwide by\nSailor Music All Rights Reserved.\nUsed by Permission")
	}
	{
		heading
		item = qs("\L''Kick Out\nthe Jams''")
	}
	{
		item = qs("\LWritten by Michael Davis, Wayne Kramer\nFrederick Smith, Dennis Tomich, Robert Derminer\nPerformed by Wayne Kramer, Gilby Clarke,\nJerry Cantrell, Doug Lunn, Eric Gardner")
	}
	{
		item = qs("\LCourtesy of Wayne Kramer\nRob Tyner vocal courtesy of Elektra Entertainment\nBy arrangement with Warner Music Group\nVideo Game Licensing")
	}
	{
		item = qs("\LPublished by Derminer and (C) 1969 (RENEWED)\nWARNER-TAMERLANE PUBLISHING CORP.\n(BMI) AND UNKNOWN PUBLISHER (NS)\nALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''The Kill\n(Bury Me)''")
	}
	{
		item = qs("\LWritten by Jared Leto\nPerformed by 30 Seconds To Mars\nCourtesy of Virgin Records America, Inc.\nUnder license from EMI Film & Television Music")
	}
	{
		item = qs("\L© 2007 Universal Music - Z Tunes (ASCAP)\nApocraphex Music (ASCAP)\nAll rights on behalf of Apocraphex Music (ASCAP)\nadministered by Universal Music- Z Tunes (ASCAP)\nAll rights reserved. Used by permission")
	}
	{
		heading
		item = qs("\L''L'Via\nL'Viaquez''")
	}
	{
		item = qs("\LWritten by Cedric Bixler, Omar Rodriguez\nPerformed by The Mars Volta\nCourtesy of Universal Records under license\nfrom Universal Music Enterprises")
	}
	{
		item = qs("\LPublished by\nEMI April Music Inc.\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''La Bamba''")
	}
	{
		item = qs("\LAdapted and arranged by Ritchie Valens\nPerformed by Los Lobos\nCourtesy of Slash Records\nLondon-Sire Records Ltd.  By arrangement with")
	}
	{
		item = qs("\LWarner Music Group Video Game Licensing\n(P) 1987 Slash Records\nPublished by EMI Virgin Songs, Inc. d/b/a\nEMI Longitude Music in the United States and")
	}
	{
		item = qs("\L(C) 1987 WARNER-TAMERLANE\nPUBLISHING CORP. (BMI)\nAll Rights Reserved.\nUsed by Permission. ")
	}
	{
		heading
		item = qs("\L''Lazy Eye''")
	}
	{
		item = qs("\LWritten by Brian Aubert, Christopher Guanlao, Joseph Lester, Nicole Monninger\nPerformed by Silversun Pickups\nCourtesy of Dangerbird Records\nPublished Silversun Pickups Music (ASCAP)")
	}
	{
		heading
		item = qs("\L''Livin' on\na Prayer''")
	}
	{
		item = qs("\LWritten by Jon Bon Jovi, Desmond Child, Richard Sambora\nPerformed by Bon Jovi\nCourtesy of The Island Def Jam Music Group under license\nfrom Universal Music Enterprises")
	}
	{
		item = qs("\LPublished by Sony ATV, EMI April Music Inc. and\n© 1987 Universal-PolyGram Int. Publ., Inc. (ASCAP)\nBon Jovi Publ. (ASCAP)\nAll rights on behalf of Bon Jovi Publ. (ASCAP)")
	}
	{
		item = qs("\Ladministered by\nUniversal-Polygram Int. Publ., Inc. (ASCAP)\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''Love Me\nTwo Times''")
	}
	{
		item = qs("\LWritten by John Densmore, Robbie Krieger,\nRay Manzarek, Jim Morrison\nPerformed by The Doors\nCourtesy of Elektra Entertainment Group")
	}
	{
		item = qs("\LBy arrangement with\nWarner Music Group Video Game Licensing\n(P) 1967 Elektra Entertainment Group\nPublished by Doors Music Co. c/o Wixen Music Publishing, Inc.")
	}
	{
		heading
		item = qs("\L''Love Removal Machine''")
	}
	{
		item = qs("\LWritten by Ian Astbury, William Duffy\nPerformed by The Cult\n(P) 1987 Beggars Banquet Records Limited\n(C) 1987 TAYMINSTER ASTBURY MUS (NS) AND")
	}
	{
		item = qs("\LSCREEN CHOICE LTD\nALL RIGHTS ADMINISTERED BY\nWARNER/CHAPPELL MUSIC LTD\nALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''Love Spreads''")
	}
	{
		item = qs("\LWritten by John Squire\nPerformed by The Stone Roses\nCourtesy of Geffen Records\nunder license from")
	}
	{
		item = qs("\LUniversal\nMusic Enterprises\nPublished by\nSony ATV")
	}
	{
		heading
		item = qs("\L''The Middle''")
	}
	{
		item = qs("\LWritten by James Adkins, Richard Burch,\nZachary Lind, Thomas Linton\nPerformed by Jimmy Eat World\nCourtesy of Interscope Records under license from")
	}
	{
		item = qs("\LUniversal Music Enterprises\nPublished by\nFSMGI (IMRO), administered by\nState One Songs America.")
	}
	{
		heading
		item = qs("\L''Misery Business''")
	}
	{
		item = qs("\LWritten by Hayley Williams, Josh Farro\nPerformed by Paramore\nCourtesy of Atlantic Recording Corp./ Fueled By Ramen\nBy arrangement with Warner Music Group Video Game Licensing")
	}
	{
		item = qs("\L(P) 2007 Atlantic Recording Group (C) 2007 WB MUSIC CORP. (ASCAP),\n BUT FATHER, I JUST WANT TO SING MUSIC (ASCAP)\nFBR MUSIC (ASCAP) AND JOSH'S MUSIC (ASCAP)\nALL RIGHTS ADMINISTERED BY WB MUSIC CORP. ALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''Monsoon'' a/k/a ''Durch Den Monsun''")
	}
	{
		item = qs("\LWritten by Patrick Benzer, Peter Hoffmann, David Jost, Bill Kaulitz, Dave Roth\nPerformed by Tokio Hotel\nCourtesy of Universal Music GmbH (Austria)\nunder license from Universal Music Enterprises")
	}
	{
		item = qs("\LPublished by EMI Blackwood Music Inc./ Bill Kaulitz/\n© Arabella Musikverlag GmbH (GEMA), Wolffsongs Musikverlag (GEMA)\nAll rights on behalf of Arabella Musikverlag GmbH (GEMA) and\nWolffsongs Musikverlag (GEMA) administered by")
	}
	{
		item = qs("\LUniversal Music - MGB Songs (ASCAP)/ and\nEdition Hotelbar & Capellmeister Musikverlag\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''Mountain Song''")
	}
	{
		item = qs("\LWritten by Eric Avery, Perry Farrell, Dave Navarro, Stephen Perkins\nPerformed by Jane's Addiction\nCourtesy of Warner Bros. Records Inc.\nBy arrangement with Warner Music Group Video Game Licensing")
	}
	{
		item = qs("\L(P) 1988 Warner Bros. Records Inc.\n© 1988 I'll Hit You Back Music (BMI), Embryotic Music (BMI), Swizzlestick Music (BMI)\nAll rights on behalf of I'll Hit You Back Music (BMI),\nEmbryotic Music (BMI), and Swizzlestick Music (BMI)")
	}
	{
		item = qs("\Ladministered by Irving Music, Inc. (BMI)\nEMI Blackwood Music Inc.\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''Mr. Crowley''")
	}
	{
		item = qs("\LWritten by Bob Daisley, Ozzy Osbourne, Randy Rhoads\nPublished by Blizzard Music Ltd\nPerformed by Ozzy Osbourne\nCourtesy of Epic Records")
	}
	{
		item = qs("\LBy arrangement\nwith\nSONY BMG\nMUSIC ENTERTAINMENT\n")
	}
	{
		heading
		item = qs("\L''Never Too Late''")
	}
	{
		item = qs("\LWritten by Cormac Neeson, Michael Waters, James Heatley, Paul Mahon\nPerformed by The Answer\nCourtesy of J Albert & Son UK Limited\nPublished by J Albert & Son UK Limited")
	}
	{
		heading
		item = qs("\L''No Sleep 'Till Brooklyn''")
	}
	{
		item = qs("\LWritten by Michael Diamond, Adam Horovitz, Rick Rubin, Adam Yauch\nPerformed by Beastie Boys\nCourtesy of The Island Def Jam Music Group\nunder license from Universal Music Enterprises")
	}
	{
		item = qs("\LPublished by Sony ATV and © Universal-PolyGram Int. Publ., Inc. (ASCAP),\nBrooklyn Dust Music (ASCAP) All rights on behalf of\nBrooklyn Dust Music (ASCAP) administered by Universal-Polygram Int. Publ., Inc. (ASCAP)\nAll rights reserved. Used by permission")
	}
	{
		heading
		item = qs("\L''Nuvole e Lenzuola''")
	}
	{
		item = qs("\LWritten by Giuliano Sangiorgi\nPerformed by Negramaro\nCourtesy of Sugar S.r.l.\n© & (p) Sugar S.r.l")
	}
	{
		heading
		item = qs("\L''Obstacle 1''")
	}
	{
		item = qs("\LWritten by Paul Julian Banks, Carlos Andres Dengler,\nSamuel J. Fogarino, Daniel Alexander Kessler\nPerformed by Interpol\nLicensed courtesy of Matador Records")
	}
	{
		item = qs("\L(P) 2002\nMatador Records\nPublished by\nKobalt Music Publishing America, Inc.")
	}
	{
		heading
		item = qs("\L''On The\nRoad Again'' (Live)")
	}
	{
		item = qs("\LWritten by Willie Nelson\nPerformed by Willie Nelson\nCourtesy of Columbia Records\nBy arrangement with SONY BMG MUSIC ENTERTAINMENT")
	}
	{
		item = qs("\LPublished by EMI Virgin Songs, Inc.\nd/b/a EMI Longitude Music\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''One Armed Scissor''")
	}
	{
		item = qs("\LWritten by Cedric Bixler, Tony Hajjar,\nPaul Hinojos, Omar Rodriguez, Jim Ward\nPerformed by At the Drive-In\nCourtesy of Fearless Records")
	}
	{
		item = qs("\LPublished by EMI April Music Inc.\nand Foray Music\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''The One\nI Love''")
	}
	{
		item = qs("\LWritten by William Berry, Peter Buck, Mike Mills, Michael Stipe\nPerformed by R.E.M.\nCourtesy of Capitol Records, Inc.\nUnder license from EMI Film & Television Music")
	}
	{
		item = qs("\L(C) 1987 NIGHT GARDEN MUSIC (BMI)\nALL RIGHTS ON BEHALF OF NIGHT GARDEN MUSIC (BMI)\nADMINISTERED BY WARNER-TAMERLANE PUBLISHING CORP. (BMI)\nALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''One Way\nor Another''")
	}
	{
		item = qs("\LWritten by Nigel Harrison, Debbie Harry\nPerformed by Blondie\nCourtesy of Capitol Records, Inc.\nUnder license from EMI Film & Television Music")
	}
	{
		item = qs("\LPublished by\nChrysalis Songs (BMI)\n& Chrysalis Music o/b/o itself\nand Monster Island Music Publishing Corp. (ASCAP)")
	}
	{
		heading
		item = qs("\L''Our Truth''")
	}
	{
		item = qs("\LWritten by Zelati Marco, Cristina Scabbia, Andrea Ferro,\nChristiano Migliore, Biazzi Marco,\nMozzati Cristiano, Waldemar Sorychcta\nPerformed by Lacuna Coil")
	}
	{
		item = qs("\LCourtesy of\nCentury Media Records\nPublished by\nMagic Arts Publishing (ASCAP)")
	}
	{
		heading
		item = qs("\L''Overkill''")
	}
	{
		item = qs("\LWritten by Ian Kilmister, Eddie Clarke, Philip Taylor\nPerformed by Motorhead\nCourtesy of Belle Vue Sunshine Touring Inc Published by EMI Intertrax Music Inc.\nAll Rights Reserved. Used by Permission")
	}
	{
		heading
		item = qs("\L''Parabola''")
	}
	{
		item = qs("\LWritten by Daniel Carey, Justin Chancellor, Adam Jones, Maynard James Keenan\nPerformed by Tool\nCourtesy of Tool Dissectional L.L.C./ Volcano Entertainment III, L.L.C.\nBy arrangement with SONY BMG MUSIC ENTERTAINMENT")
	}
	{
		item = qs("\LPublished by\nEMI Virgin Music, Inc.\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''Pretty Vacant''")
	}
	{
		item = qs("\LWritten by Paul Cook, Steve Jones, Glen Matlock, John Lydon\nPerformed by Sex Pistols\n(c)(P) Sex Pistols Residuals.\nControlled exclusively by Sex Pistols Residuals in US/Canada")
	}
	{
		item = qs("\Lunder exclusive license outside of US/Canada to Virgin Music Ltd.© 1977\nUniversal Music - Careers (BMI) Three Shadows Music c/o Cherry Lane Music\nPublishing, Warner/Chappell Music Publishing (ASCAP)\nAll rights reserved.  Used by permission")
	}
	{
		heading
		item = qs("\L''Prisoner of Society''")
	}
	{
		item = qs("\LWritten by Chris Cheney\nPerformed by The Living End\nCourtesy of Reprise Records\nBy arrangement with Warner Music Group Video Game Licensing")
	}
	{
		item = qs("\L(P) 1999 Reprise Records\nPublished by EMI April Music Inc.\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''Pull Me Under''")
	}
	{
		item = qs("\LWritten by James Labrie, Kevin Moore,\nJohn Myung, John Petrucci, Michael Portnoy\nPerformed by Dream Theater\nCourtesy of Atlantic Recording Corp.")
	}
	{
		item = qs("\LBy arrangement with Warner Music Group\nVideo Game Licensing\n(P) 1992 Atlantic Recording Corp.\n(C) 1992 WB MUSIC CORP. (ASCAP)")
	}
	{
		item = qs("\L& YTSE JAMS, INC. (ASCAP)\nALL RIGHTS ON BEHALF OF YTSE JAMS, INC. (ASCAP)\nADMINISTERED BY WB MUSIC CORP. (ASCAP)\nALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''Purple Haze'' (Live)")
	}
	{
		item = qs("\LWritten by Jimi Hendrix\nPerformed by Jimi Hendrix\nCourtesy of Geffen Records under license from Universal Music Enterprises\nPublished by Experience Hendrix LLC")
	}
	{
		heading
		item = qs("\L''Ramblin' Man''")
	}
	{
		item = qs("\LWritten by Dickey Betts\nPerformed by The Allman Brothers Band\nCourtesy of The Island Def Jam Music Group under\nlicense from Universal Music Enterprises")
	}
	{
		item = qs("\L(C) 1973 (RENEWED) UNICHAPPELL MUSIC INC. (BMI)AND FORREST\nRICHARD BETTS MUSIC (BMI)\nALL RIGHTS ADMINISTERED\nBY UNICHAPPELL MUSIC INC. ALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''Rebel Yell''")
	}
	{
		item = qs("\LWritten by Billy Idol, Steve Stevens\nPerformed by Billy Idol\nCourtesy of  Capitol Records, Inc.\nUnder license from EMI Film & Television Music")
	}
	{
		item = qs("\LPublished by Chrysalis Music o/b/o itself\nand Boneidol Music (ASCAP) and(C) 1983 WB MUSIC CORP. (ASCAP),\nBONEIDOL MUSIC (ASCAP) AND RARE BLUE MUSIC, INC. (ASCAP)\nALL RIGHTS RESERVED")
	}
	{
		heading
		item = qs("\L''Re-Education\nThrough Labor''")
	}
	{
		item = qs("\LWritten by Joe Principe, Tim McIlrath,\nBrandon Barnes, Zach Blair\nPerformed by Rise Against\nCourtesy of Geffen Records")
	}
	{
		item = qs("\Lunder license from\nUniversal Music Enterprises\nPublished by\nSony ATV")
	}
	{
		heading
		item = qs("\L''Rooftops (A Liberation Broadcast)''")
	}
	{
		item = qs("\LWritten by Lee Gaze, Michael Lewis,\nRichard Oliver, Stuart Richardson, Ian Watkins\nPerformed by Lostprophets\nCourtesy of Visible Noise Limited/Columbia Records")
	}
	{
		item = qs("\LBy arrangement with SONY BMG MUSIC ENTERTAINMENT\nPublished by EMI April Music Inc.\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''Santeria''")
	}
	{
		item = qs("\LWritten by Floyd Gaugh, Bradley Nowell, Eric Wilson\nPerformed by Sublime\nCourtesy of Geffen Records under license from\nUniversal Music Enterprises ©1996 Music Corp. Of America, Inc. (BMI)")
	}
	{
		item = qs("\LGasoline Alley Music (BMI),\nLou Dog Publ. (BMI), Floyd I. Gaugh, IIII Publ. (BMI),\nEric John Wilson Publ.\nAll rights on behalf of Music Corp. Of America, Inc. (BMI)")
	}
	{
		item = qs("\LGasoline Alley Music (BMI)\nLou Dog Publ. (BMI), Floyd I. Gaugh, IIII Publ. (BMI), Eric John Wilson Publ.\nadministered by Songs Of Universal, Inc. (BMI)\nAll rights reserved. Used by permission")
	}
	{
		heading
		item = qs("\L''Satch Boogie''")
	}
	{
		item = qs("\LWritten by Joe Satriani\n© 1987 Published by Strange Beautiful Music (ASCAP)\nPerformed by Joe Satriani\nCourtesy of Epic Records")
	}
	{
		item = qs("\LBy arrangement\nwith SONY BMG\nMUSIC ENTERTAINMENT\n")
	}
	{
		heading
		item = qs("\L''Schism''")
	}
	{
		item = qs("\LWritten by Daniel Carey, Justin Chancellor,\nAdam Jones, Maynard James Keenan\nPerformed by Tool\nCourtesy of Tool Dissectional L.L.C./ Volcano Entertainment III, L.L.C.")
	}
	{
		item = qs("\LBy arrangement with SONY BMG MUSIC ENTERTAINMENT\nPublished by EMI Virgin Music, Inc.\nAll Rights Reserved.\nUsed by Permission.")
	}
	{
		heading
		item = qs("\L''Scream Aim Fire''")
	}
	{
		item = qs("\LWritten by Jason James, Michael Paget,\nMichael Thomas, Matthew Tuck\nPerformed by Bullet for My Valentine\nCourtesy of 20-20 Entertainment, L.L.C./Jive Records")
	}
	{
		item = qs("\LBy arrangement with\nSONY BMG MUSIC ENTERTAINMENT\nPublished by EMI Blackwood Music Inc.\nAll Rights Reserved. Used by Permission.")
	}
	{
		heading
		item = qs("\L''Shiver''")
	}
	{
		item = qs("\LWritten by Guy Berryman, Jon Buckland,\nWill Champion, Chris Martin\nPerformed by Coldplay\nCourtesy of EMI Records")
	}
	{
		item = qs("\LUnder license from EMI Film & Television Music\n© Universal Music Publ MGB Ltd. (PRS)\nAll rights on behalf of\nUniversal Music Publ MGB Ltd.")
	}
	{
		item = qs("\L(PRS) administered by Universal Music\n- MGB Songs (ASCAP)\nAll rights reserved. \nUsed by permission")
	}
	{
		heading
		item = qs("\L''Some Might Say''")
	}
	{
		item = qs("\LWritten by Noel Gallagher\nPerformed by Oasis\nCourtesy of SONY BMG\nMUSIC ENTERTAINMENT UK/Epic Records")
	}
	{
		item = qs("\LBy arrangement with SONY BMG\nMUSIC ENTERTAINMENT\nPublished by\nSony ATV")
	}
	{
		heading
		item = qs("\L''Soul Doubt''")
	}
	{
		item = qs("\LWritten by Michael Burkett\nPerformed by NOFX\nCourtesy of Epitaph Records, a California Corporation\n© 1992 Westbeach Music (BMI)")
	}
	{
		item = qs("\LAll rights on behalf of Westbeach Music (BMI)\nadministered by\nSongs Of Universal, Inc. (BMI)\nAll rights reserved. Used by permission")
	}
	{
		heading
		item = qs("\L''Spiderwebs''")
	}
	{
		item = qs("\LWritten by Gwen Stefani, Tony Kanal\nPerformed by No Doubt\nCourtesy of Interscope Records under license\nfrom Universal Music Enterprises")
	}
	{
		item = qs("\L© 1995 Universal Music Corp. (ASCAP),\nKnock Yourself Out Music (ASCAP)\nAll rights on behalf of\nKnock Yourself Out Music (ASCAP)")
	}
	{
		item = qs("\Ladministered by\nUniversal Music Corp. (ASCAP)\nAll rights reserved.\nUsed by permission")
	}
	{
		heading
		item = qs("\L''Stillborn''")
	}
	{
		item = qs("\LWritten by Zachary P. Wylde\nPerformed by Black Label Society\nCourtesy of Black Label Society\nPublished by Bellbottoms and Beer Music (BMI),")
	}
	{
		item = qs("\Ladministered by Reach Global Songs,\na division of Reach Global, Inc.\nUsed by permission.\nAll rights reserved.")
	}
	{
		heading
		item = qs("\L''Stranglehold''")
	}
	{
		item = qs("\LWritten by Ted Nugent\nPerformed by Ted Nugent\nCourtesy of Magicland Music\nPublished by Magicland Music")
	}
	{
		heading
		item = qs("\L''Sweet Home Alabama'' (Live)")
	}
	{
		item = qs("\LWritten by Edward C. King, Gary Rossington, Ronnie Van Zant\nPerformed by Lynyrd Skynyrd\nCourtesy of Geffen Records under license from Universal Music Enterprises\n© 1974 Songs Of Universal, Inc. (BMI), Longitude Music Co. (BMI),")
	}
	{
		item = qs("\LUniversal Music Corp. (ASCAP),\nFull Keel Music Co.(ASCAP)\nAll rights on behalf of Longitude Music Co. (BMI)\nadministered by Songs Of Universal, Inc. (BMI)")
	}
	{
		item = qs("\LAll rights on behalf of Full Keel Music Co. (ASCAP)\nadministered by and Universal Music Corp. (ASCAP)\nAll rights reserved.\nUsed by permission")
	}
	{
		heading
		item = qs("\L''Today''")
	}
	{
		item = qs("\LWritten by William Corgan\nPerformed by The Smashing Pumpkins\nCourtesy of\nVirgin Records America, Inc.")
	}
	{
		item = qs("\LUnder license from\nEMI Film &\nTelevision Music\n©1993 Cinderful Music (BMI)")
	}
	{
		heading
		item = qs("\L''Too Much,\nToo Young, Too Fast''")
	}
	{
		item = qs("\LWritten by Joel O'Keeffe\nPerformed by Airbourne\n(P) 2006 Roadrunner Records, Inc &\nEMI Music Australia Pty Limited (Australia and New Zealand)")
	}
	{
		item = qs("\LLicensed courtesy of\nRoadrunner Records, Inc.\nand EMI Music Australia Pty\nPublished by Mushroom Music")
	}
	{
		heading
		item = qs("\L''Toy Boy''")
	}
	{
		item = qs("\LWritten by Emmanuel Barichasse,\nArnaud Bordas, Francois Ernie,\nJose Fontao, Romain Della Valle\nPerformed by Stuck in the Sound")
	}
	{
		item = qs("\LCourtesy of\nDiscograph\nPublished by\nDiscograph")
	}
	{
		heading
		item = qs("\L''Trapped Under Ice''")
	}
	{
		item = qs("\LWritten by James Hetfield, Kirk Hammett, Lars Ulrich\nPerformed by Metallica\nCourtesy of We're Only In It For The Music and\nElektra Entertainment Group")
	}
	{
		item = qs("\LBy arrangement with\nWarner Music Group Video Game Licensing\n(P) 1988 E/M Ventures\n© 1985 Creeping Death Music (ASCAP)")
	}
	{
		heading
		item = qs("\L''Up Around the Bend''")
	}
	{
		item = qs("\LWritten by John Fogerty\nPerformed by Creedence Clearwater Revival\nCourtesy of Concord Music Group, Inc. o/b/o Jondora Music\nPublished by Concord Music Group, Inc.")
	}
	{
		heading
		item = qs("\L''Vicarious''")
	}
	{
		item = qs("\LWritten by Daniel Carey, Justin Chancellor,\nAdam Jones, Maynard James Keenan\nPerformed by Tool\nCourtesy of Tool Dissectional, L.L.C./ Volcano Entertainment III, L.L.C.")
	}
	{
		item = qs("\LBy arrangement with\nSONY BMG MUSIC ENTERTAINMENT\nPublished by EMI Virgin Music, Inc.\nAll Rights Reserved. Used by Permission.")
	}
	{
		heading
		item = qs("\L''Vinternoll2''")
	}
	{
		item = qs("\LWritten by Joakim Herbert Berg, Harri Kalervo Manty,\nMarkus Mikael Mustonen, Sami Petteri Sirvio, Martin Harry Skold\nPerformed by Kent\nCourtesy of SONY BMG MUSIC ENTERTAINMENT SWEDEN AB")
	}
	{
		item = qs("\LBy arrangement with SONY BMG MUSIC ENTERTAINMENT\n© Cannoli Songs (STIM) All rights on behalf of Cannoli Songs (STIM)\nadministered by Universal Music - MGB Songs (ASCAP)\nAll rights reserved.  Used by permission ")
	}
	{
		heading
		item = qs("\L''Weapon of Choice''")
	}
	{
		item = qs("\LWritten by Robert Been, Peter Hayes\nPerformed by Black Rebel Motorcycle Club\nCourtesy of The RCA Records Label and\nUniversal Music Group Ltd")
	}
	{
		item = qs("\LBy arrangement with\nSONY BMG MUSIC ENTERTAINMENT\nPublished by Chrysalis Music\no/b/o itself and BRMC Music (ASCAP).")
	}
	{
		heading
		item = qs("\L''What I've Done''")
	}
	{
		item = qs("\LWritten by Chester Bennington, Robert Bourdon,\nBrad Delson, David Farrell,\nJoseph Hahn, Mike Shinoda\nPerformed by Linkin Park")
	}
	{
		item = qs("\LCourtesy of Warner Bros. Records Inc.\nBy arrangement with Warner Music Group Video Game Licensing\n(P) 2007 Warner Bros. Records Inc.\n© 2007 Universal Music - Z Songs (BMI)/ ")
	}
	{
		item = qs("\LChesterchaz Publ.(BMI)/ Rob Bourdon Music (BMI)/\n Nondisclosure Agreement Music (BMI)/ Kenji Kobayashi Music (BMI)/\n Pancakey Cakes Music (BMI)/ Big Bad Mr. Hahn Music (BMI)\nElektra Entertainment Group")
	}
	{
		item = qs("\LBy arrangement with\nWarner Music Group Video Game Licensing\n (P) 1988 E/M Ventures\n© 1985 Creeping Death Music (ASCAP)")
	}
	{
		heading
		item = qs("\L''The Wind\nCries Mary''")
	}
	{
		item = qs("\LWritten by Jimi Hendrix\nPerformed by Jimi Hendrix\nCourtesy of\nGeffen Records")
	}
	{
		item = qs("\Lunder license from\nUniversal Music Enterprises\nPublished by\nExperience Hendrix LLC")
	}
	{
		heading
		item = qs("\L''You're Gonna\nSay Yeah!''")
	}
	{
		item = qs("\LWritten and Composed by Oliver Jourdan,\nWilfried Jourdan,Guillaume Le Guen,\nCyrille Sudraud, Franck Pompidor\nPerformed by HushPuppies")
	}
	{
		item = qs("\LCourtesy of\nDiamondtraxx\nPublished by\nChut Le Caniche")
	}
]
