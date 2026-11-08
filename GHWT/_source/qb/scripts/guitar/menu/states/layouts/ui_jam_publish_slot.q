jam_ghtunes_normal_num_slots = 5
jam_ghtunes_upgrade1_num_slots = 10
jam_ghtunes_max_num_slots = 15
ghtunes_num_rated_upgrade1 = 20
ghtunes_num_rated_upgrade2 = 50

script ui_create_jam_publish_slot 
	if GotParam \{delete_only}
		make_generic_menu \{title = qs("Manage GHTunes")
			vmenu_id = jam_publish_slot_vmenu}
	else
		make_generic_menu \{title = qs("Upload To GHTunes")
			vmenu_id = jam_publish_slot_vmenu}
	endif
	if GotParam \{delete_only}
		num_slots = ($jam_ghtunes_max_num_slots)
	else
		GetGlobalTags \{user_options
			param = ghtunes_num_songs_rated}
		printf channel = jam_mode qs("\LUSER Rated %a songs, %b needed to upgrade") a = <ghtunes_num_songs_rated> b = ($ghtunes_num_rated_to_upgrade)
		if (<ghtunes_num_songs_rated> >= ($ghtunes_num_rated_upgrade2))
			num_slots = ($jam_ghtunes_max_num_slots)
		elseif (<ghtunes_num_songs_rated> >= ($ghtunes_num_rated_upgrade1))
			num_slots = ($jam_ghtunes_upgrade1_num_slots)
		else
			num_slots = ($jam_ghtunes_normal_num_slots)
		endif
	endif
	i = 0
	begin
	has_content = 0
	if ((<slot_array> [<i>].has_content) = 1)
		GetArraySize \{$jam_genre_list}
		genre_count = 0
		genre_text = qs("")
		begin
		if (($jam_genre_list [<genre_count>].checksum) = (<slot_array> [<i>].genre))
			genre_text = ($jam_genre_list [<genre_count>].name_text)
			break
		endif
		<genre_count> = (<genre_count> + 1)
		repeat <array_size>
		FormatText TextName = slot_text qs("Slot %s: %n") s = (<i> + 1) n = (<slot_array> [<i>].filename)
		if GotParam \{delete_only}
			add_generic_menu_text_item {
				text = <slot_text>
				pad_start_script = jam_remove_song_from_slot_check
				pad_start_params = {slot = <i> genre_chk = (<slot_array> [<i>].genre)}
				additional_focus_script = ui_jam_slot_draw_helpers
				additional_focus_params = {has_content = 1 delete_only = 1}
			}
		else
			add_generic_menu_text_item {
				not_focusable
				text = <slot_text>
			}
		endif
	else
		FormatText TextName = slot_text qs("Slot %s: empty") s = (<i> + 1)
		if GotParam \{delete_only}
			add_generic_menu_text_item {
				not_focusable
				text = <slot_text>
			}
		else
			add_generic_menu_text_item {
				text = <slot_text>
				pad_choose_script = <choose_script>
				pad_choose_params = {slot = <i> genre = <genre> filename = <filename> newfilename = <newfilename>}
				additional_focus_script = ui_jam_slot_draw_helpers
				additional_focus_params = {has_content = 0}
			}
		endif
	endif
	if GotParam \{delete_only}
		if (<i> = 4)
			add_generic_menu_text_item \{text = qs("Bonus slots")
				heading}
		endif
	endif
	i = (<i> + 1)
	repeat <num_slots>
	if (<num_slots> < ($jam_ghtunes_max_num_slots))
		add_generic_menu_text_item \{text = qs("Rate more songs to")
			heading}
		add_generic_menu_text_item \{text = qs("unlock more slots!")
			heading}
	endif
	menu_finish
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100000}
	startrendering
endscript

script ui_jam_slot_draw_helpers 
	clean_up_user_control_helpers
	if (<has_content> = 1)
		add_user_control_helper \{text = qs("REMOVE")
			button = start
			z = 100000}
	else
		add_user_control_helper \{text = qs("SELECT")
			button = green
			z = 100000}
	endif
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100000}
endscript

script ui_destroy_jam_publish_slot 
	if ScreenElementExists \{id = ghtunes_legal_dialog_box}
		DestroyScreenElement \{id = ghtunes_legal_dialog_box}
	endif
	stoprendering
	destroy_generic_menu
endscript
csa_ghtunes_num_results = 10
csa_ghtunes_curr_start_at = 0
csa_ghtunes_max_start_at = 999999999
csa_ghtunes_on_last_page = 0

script ghtunes_show_submission_agreement \{start_at = 1
		num_results = 0}
	clean_up_user_control_helpers
	printf \{qs(0x8931adb2)}
	printf \{qs(0xa09e3728)}
	printf qs(0x3466483d) a = <start_at> b = <num_results>
	printf \{qs(0x8931adb2)}
	if ScreenElementExists \{id = ghtunes_legal_dialog_box}
		DestroyScreenElement \{id = ghtunes_legal_dialog_box}
	endif
	CreateScreenElement {
		parent = root_window
		type = DescInterface
		id = ghtunes_legal_dialog_box
		desc = 'ghtunes_legal_dialog'
		pos = (10.0, -6.0)
		scale = 1
		z_priority = 1000
		event_handlers = [
			{pad_up ghtunes_submission_scroll params = {up}}
			{pad_down ghtunes_submission_scroll params = {down}}
			{pad_option2 ghtunes_csa_previous_page params = {parent_menu = <parent_menu> slot = <slot> filename = <filename> newfilename = <newfilename> genre = <genre>}}
			{pad_option ghtunes_csa_next_page params = {parent_menu = <parent_menu> slot = <slot> filename = <filename> newfilename = <newfilename> genre = <genre>}}
			{pad_choose ghtunes_submission_accept params = {slot = <slot> filename = <filename> newfilename = <newfilename> genre = <genre>}}
			{pad_back ghtunes_submission_decline params = {}}
		]
	}
	ghtunes_legal_dialog_box :SetProps legal_title_text = ($ghtunes_submission_agreement_array [0])
	if ghtunes_legal_dialog_box :Desc_ResolveAlias \{name = alias_text_menu}
		GetArraySize ($ghtunes_submission_agreement_array)
		Mod a = <array_size> b = $csa_ghtunes_num_results
		change csa_ghtunes_max_start_at = (<array_size> - <Mod>)
		<i> = <start_at>
		if (((<start_at>) + ($csa_ghtunes_num_results)) < (<array_size> -1))
			<repeat_for> = ($csa_ghtunes_num_results)
		else
			<repeat_for> = (<array_size> - <start_at>)
		endif
		printf \{qs(0x8931adb2)}
		printf qs(0x8ad2fa44) a = <i> b = <repeat_for>
		printf \{qs(0x8931adb2)}
		begin
		printf '%b' b = <i>
		CreateScreenElement {
			type = TextBlockElement
			parent = <resolved_id>
			font = fontgrid_text_a3
			just = [left top]
			internal_just = [left top]
			scale = 1
			internal_scale = 0.6
			rgba = [200 200 200 255]
			dims = (900.0, 30.0)
			text = ($ghtunes_submission_agreement_array [<i>])
			z_priority = 35
			fit_width = wrap
			fit_height = `expand dims`
			scale_mode = proportional
			text_case = Original
		}
		<i> = (<i> + 1)
		repeat (<repeat_for>)
	endif
	LaunchEvent \{type = focus
		target = ghtunes_legal_dialog_box}
	clean_up_user_control_helpers
	add_user_control_helper \{text = qs("I AGREE")
		button = green
		z = 100000}
	add_user_control_helper \{text = qs("I DECLINE")
		button = red
		z = 100000}
	if ((($csa_ghtunes_curr_start_at / $csa_ghtunes_num_results) + 1) > 1)
		add_user_control_helper \{text = qs("PREVIOUS")
			button = Yellow
			z = 10000}
	endif
	if (($csa_ghtunes_curr_start_at + <repeat_for>) != <array_size>)
		add_user_control_helper \{text = qs("NEXT")
			button = Blue
			z = 10000}
		change \{csa_ghtunes_on_last_page = 0}
	else
		change \{csa_ghtunes_on_last_page = 1}
	endif
endscript

script ghtunes_csa_next_page 
	printstruct <...>
	if (($csa_ghtunes_on_last_page) = 1)
		return
	endif
	if ($csa_ghtunes_curr_start_at = 0)
		change csa_ghtunes_curr_start_at = ($csa_ghtunes_num_results + 1)
	else
		change csa_ghtunes_curr_start_at = ($csa_ghtunes_curr_start_at + $csa_ghtunes_num_results)
	endif
	SoundEvent \{event = GHTunes_UI_Select}
	ghtunes_show_submission_agreement parent_menu = <parent_menu> start_at = $csa_ghtunes_curr_start_at num_results = $csa_ghtunes_num_results slot = <slot> filename = <filename> newfilename = <newfilename> genre = <genre>
endscript

script ghtunes_csa_previous_page 
	if NOT ((($csa_ghtunes_curr_start_at / $csa_ghtunes_num_results) + 1) > 1)
		return
	endif
	change csa_ghtunes_curr_start_at = ($csa_ghtunes_curr_start_at - $csa_ghtunes_num_results)
	if ($csa_ghtunes_curr_start_at < 1)
		change \{csa_ghtunes_curr_start_at = 1}
		return
	endif
	SoundEvent \{event = GHTunes_UI_Back}
	ghtunes_show_submission_agreement parent_menu = <parent_menu> start_at = $csa_ghtunes_curr_start_at num_results = $csa_ghtunes_num_results slot = <slot> filename = <filename> newfilename = <newfilename> genre = <genre>
endscript

script ghtunes_destroy_submission_agreement 
	if ScreenElementExists \{id = ghtunes_legal_dialog_box}
		DestroyScreenElement \{id = ghtunes_legal_dialog_box}
	endif
endscript

script ghtunes_submission_scroll 
	ui_menu_scroll_sfx
	<scroll_speed> = (0.0, 20.0)
	if ghtunes_legal_dialog_box :Desc_ResolveAlias \{name = alias_text_menu}
		GetScreenElementProps id = <resolved_id>
		<up_limit> = 0
		<down_limit> = (((<dims> [1]) * -1) + 400)
		if GotParam \{up}
			if ((<pos> [1]) < <up_limit>)
				<new_pos> = (<pos> + <scroll_speed>)
			else
				<new_pos> = (1.0, 0.0)
			endif
		elseif GotParam \{down}
			if ((<pos> [1]) > <down_limit>)
				<new_pos> = (<pos> - <scroll_speed>)
			else
				<new_pos> = ((1.0, 0.0) + (<down_limit> * (0.0, 1.0)))
			endif
		endif
		<ratio> = (360.0 / (<down_limit> * -1))
		<scroll_pos_y> = (((<new_pos> [1] * -1) * <ratio>) + 42)
		<scroll_pos> = ((1.0, 0.0) + ((<scroll_pos_y>) * (0.0, 1.0)))
		ghtunes_legal_dialog_box :SetProps scrollbar_pos = <scroll_pos>
		<resolved_id> :SetProps pos = <new_pos>
	endif
endscript

script ghtunes_submission_accept 
	change \{csa_ghtunes_curr_start_at = 1}
	change \{csa_ghtunes_on_last_page = 0}
	ui_menu_select_sfx
	clean_up_user_control_helpers
	ghtunes_destroy_submission_agreement
	jam_upload_song_to_slot_check slot = <slot> filename = <filename> newfilename = <newfilename> genre = <genre>
endscript

script ghtunes_submission_decline 
	change \{csa_ghtunes_curr_start_at = 1}
	change \{csa_ghtunes_on_last_page = 0}
	generic_menu_pad_back_sound
	clean_up_user_control_helpers
	ghtunes_destroy_submission_agreement
	LaunchEvent \{type = focus
		target = current_menu}
endscript
