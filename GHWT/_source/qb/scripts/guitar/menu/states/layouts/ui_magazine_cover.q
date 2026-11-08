
script ui_create_magazine_cover 
	ui_magazine_page_should_i_show_mag_page
	if (<show_page> = 0)
		SpawnScript \{ui_magazine_page_continue_to_next_screen}
	else
		get_current_band_info
		GetGlobalTags <band_info>
		bandname = <name>
		get_all_exclusive_devices
		CreateScreenElement {
			parent = root_window
			id = my_magazine_container
			type = ContainerElement
			pos = (640.0, 360.0)
			dims = (1280.0, 720.0)
			just = [center center]
			exclusive_device = <exclusive_device>
		}
		CreateScreenElement {
			parent = my_magazine_container
			id = my_magazine_id
			type = DescInterface
			desc = 'song_summary_magazine'
			magazine_band_text = <bandname>
			event_handlers = [
				{pad_choose ui_magazine_page_continue_to_next_screen}
			]
		}
		ui_magazine_page_show_stuff_based_on_venu
		AssignAlias \{id = my_magazine_id
			alias = current_menu}
		add_user_control_helper \{text = qs("CONTINUE")
			button = green
			z = 100000}
	endif
endscript

script ui_destroy_magazine_cover 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_magazine_container}
endscript

script ui_magazine_cover_anim_in 
	printf \{channel = mychannel
		qs("\Lmagazine cover anim in")}
	ui_magazine_page_should_i_show_mag_page
	if (<show_page> = 0)
		return
	else
		startrendering \{reason = menu_transition}
		SoundEvent \{event = GigComplete_Magazine_In}
		if ScreenElementExists \{id = my_magazine_id}
			my_magazine_id :SE_SetProps \{magazine_pos = (800.0, 630.0)
				magazine_rot = 45
				magazine_scale = 1.5}
			my_magazine_id :SE_SetProps \{magazine_pos = (35.0, 0.0)
				magazine_rot = 0
				magazine_scale = 1
				time = 0.2
				motion = ease_in}
			my_magazine_id :SE_WaitProps
			my_magazine_id :SE_SetProps \{magazine_pos = (15.0, 0.0)
				time = 0.1
				magazine_scale = 1.05
				motion = ease_out}
			my_magazine_id :SE_WaitProps
			my_magazine_id :SE_SetProps \{magazine_pos = (5.0, 0.0)
				time = 0.2
				magazine_scale = 1
				motion = ease_out}
			my_magazine_id :SE_WaitProps
			my_magazine_id :SE_SetProps \{magazine_pos = (0.0, 0.0)
				time = 0.1
				motion = ease_out}
			my_magazine_id :SE_WaitProps
		endif
	endif
endscript

script ui_magazine_cover_anim_out 
	printf \{channel = mychannel
		qs("\Lmagazine cover anim out")}
	ui_magazine_page_should_i_show_mag_page
	if (<show_page> = 0)
		return
	else
		clean_up_user_control_helpers
		if ScreenElementExists \{id = my_magazine_id}
			SoundEvent \{event = GigComplete_Magazine_Out}
			my_magazine_id :SE_SetProps \{magazine_pos = (-1000.0, 630.0)
				magazine_rot = -45
				magazine_scale = 0.8
				time = 0.2
				motion = ease_in}
			my_magazine_id :SE_WaitProps
		endif
	endif
endscript

script ui_magazine_page_should_i_show_mag_page 
	lvl = ($current_level)
	show_mag_page = 0
	GetGlobalTags \{Progression
		params = career_using_createagig}
	if (<career_using_createagig> = 1)
		return \{show_page = 0}
	endif
	switch <lvl>
		case load_z_hob
		case load_z_Frathouse
		case load_z_harbor
		case load_z_cathedral
		case load_z_bayou
		case load_z_recordstore
		case load_z_goth
		case load_z_fairgrounds
		case load_z_military
		case load_z_castle
		case load_z_Ballpark
		case load_z_metalfest
		case load_z_newyork
		show_mag_page = 1
	endswitch
	return show_page = <show_mag_page>
endscript

script ui_magazine_page_continue_to_next_screen 
	ui_event_wait_for_safe
	printf \{channel = mychannel
		'continue on from magazine page'}
	progression_get_new_unlocks
	GetArraySize <new_unlocks>
	GameMode_GetType
	if (($got_sponsored_last_gig) = 1)
		generic_event_choose state = uistate_sponsor_new data = {tier_number = ($got_sponsored_tier_number) tier_catagory = ($got_sponsored_tier_catagory)}
	elseif (<array_size> > 0)
		generic_event_choose \{state = uistate_rewards}
	else
		ui_att_ballpark_should_i_show_ad
		if (<show_att_ad> = 1)
			generic_event_choose \{state = uistate_att_ballpark}
		else
			ui_win_song_continue_next_menu
		endif
	endif
endscript

script ui_magazine_page_show_stuff_based_on_venu 
	lvl = ($current_level)
	printstruct channel = mychannel <...>
	switch <lvl>
		case load_z_hob
		printf \{channel = mychannel
			qs("\Lbuilding magazine page for house of blues")}
		my_magazine_id :SE_SetProps \{mag_masthead_Revolver_alpha = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				140
				212
				213
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("PACKED HOUSE OF BLUES LOS ANGELES")}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				245
				183
				108
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_cover_HOB = 1}
		case load_z_Frathouse
		printf \{channel = mychannel
			qs("\Lbuilding magazine page for frathouse")}
		my_magazine_id :SE_SetProps \{mag_masthead_Decibel_alpha = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				168
				161
				221
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = $wii_magazine_text_frat_house}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				220
				220
				220
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_cover_FRAT = 1}
		case load_z_harbor
		printf \{channel = mychannel
			qs("\Lbuilding magazine page for hong kong harbor")}
		my_magazine_id :SE_SetProps \{mag_masthead_kerrang_alpha = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				200
				200
				200
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("EARS RANG AT PANG TANG!")}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				255
				169
				66
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				162
				181
				141
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_cover_HONGKONG = 1}
		case load_z_cathedral
		printf \{channel = mychannel
			qs("\Lbuilding magazine page for cathedral")}
		my_magazine_id :SE_SetProps \{mag_masthead_NME_alpha = 1}
		my_magazine_id :SE_SetProps \{mag_photo_billy = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				220
				220
				220
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("BILLY CORGAN THINKS THEY'RE OUT OF THIS WORLD")}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				220
				220
				220
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				175
				51
				56
				255
			]}
		case load_z_bayou
		printf \{channel = mychannel
			qs("\Lbuilding magazine page for bayou")}
		my_magazine_id :SE_SetProps \{mag_masthead_MetalEdge_alpha = 1}
		my_magazine_id :SE_SetProps \{mag_photo_zakk = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				158
				1
				58
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("ZAKK'S WILD ABOUT THE ''NEXT BIG THING''")}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				212
				170
				25
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				0
				0
				0
				255
			]}
		case load_z_recordstore
		printf \{channel = mychannel
			qs("\Lbuilding magazine page for recordstore")}
		my_magazine_id :SE_SetProps \{mag_masthead_SPIN_alpha = 1}
		my_magazine_id :SE_SetProps \{mag_photo_haley = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				0
				70
				98
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("HAYLEY HAS ALL THEIR ALBUMS!")}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				175
				35
				55
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				200
				200
				200
				255
			]}
		case load_z_goth
		printf \{channel = mychannel
			qs("\Lbuilding magazine page for goth bar")}
		my_magazine_id :SE_SetProps \{mag_masthead_Q_alpha = 1}
		my_magazine_id :SE_SetProps \{mag_photo_goth = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				172
				218
				227
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				100
				100
				100
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("ROCKED THE GOTHS LAST NIGHT!")}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				185
				37
				60
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				224
				182
				230
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				100
				100
				100
				255
			]}
		case load_z_fairgrounds
		printf \{channel = mychannel
			qs("\Lbuilding magazine page for fairgrounds")}
		my_magazine_id :SE_SetProps \{mag_masthead_GuitarWorld_alpha = 1}
		my_magazine_id :SE_SetProps \{mag_photo_nugent = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				166
				124
				82
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				57
				45
				85
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("HAVE TED NUGENT'S SPIRIT, ATTITUDE AND FIRE!")}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				220
				220
				220
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				57
				45
				85
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				77
				45
				85
				255
			]}
		case load_z_military
		printf \{channel = mychannel
			qs("\Lbuilding magazine page for aircraft")}
		my_magazine_id :SE_SetProps \{mag_masthead_AP_alpha = 1}
		my_magazine_id :SE_SetProps \{mag_photo_travis = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				152
				205
				60
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("RISING BAND PULLS OUT THE BIG GUNS!")}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				216
				95
				49
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				94
				147
				155
				255
			]}
		case load_z_castle
		printf \{channel = mychannel
			qs("\Lbuilding magazine page castle")}
		my_magazine_id :SE_SetProps \{mag_masthead_mojo_alpha = 1}
		my_magazine_id :SE_SetProps \{mag_photo_sting = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				200
				200
				200
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("THEY STING LIKE A BEE")}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				158
				1
				75
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				0
				0
				0
				255
			]}
		case load_z_Ballpark
		printf \{channel = mychannel
			qs("\Lbuilding magazine page forball park")}
		my_magazine_id :SE_SetProps \{mag_masthead_Hits_alpha = 1}
		my_magazine_id :SE_SetProps \{mag_photo_jimi = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				200
				200
				200
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("VISIONS OF HENDRIX!")}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				206
				80
				85
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				49
				23
				45
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				49
				23
				45
				255
			]}
		case load_z_metalfest
		printf \{channel = mychannel
			qs("\Lbuilding magazine page for ozzfest")}
		my_magazine_id :SE_SetProps \{mag_masthead_Revolver_alpha = 1}
		my_magazine_id :SE_SetProps \{mag_photo_ozzy = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				224
				215
				235
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("OZZY: ''IT'S FRIGHTENING HOW MUCH I LIKE THEM''")}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				157
				178
				189
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				110
				87
				122
				255
			]}
		case load_z_newyork
		printf \{channel = mychannel
			qs("\Lbuilding magazine page for new york")}
		my_magazine_id :SE_SetProps \{mag_masthead_RollingStone_alpha = 1}
		my_magazine_id :SE_SetProps \{magazine_statement_rgba = [
				200
				200
				200
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_statement_text = $wii_magazine_text_new_york}
		my_magazine_id :SE_SetProps \{magazine_band_rgba = [
				225
				91
				110
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_band_shadow_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_bg_rgba = [
				0
				0
				0
				255
			]}
		my_magazine_id :SE_SetProps \{magazine_cover_NEWYORK = 1}
		case `default`
		my_magazine_id :SE_SetProps \{magazine_statement_text = qs("default case: This is bad")}
	endswitch
endscript
