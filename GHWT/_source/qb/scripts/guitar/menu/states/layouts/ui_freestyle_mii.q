mii_start_position = (576.0, 168.0)
mii_spacing = 64
mii_stagger = 128
num_miis_per_page = 5
current_mii_page = 0
current_actual_mii_index = -1

script ui_create_freestyle_mii 
	make_menu \{menu_id = freestyle_mii_select_menu_container
		title = $wii_freestyle_select_mii_title
		title_rgba = text_color
		noTitleBG
		noBG
		use_all_controllers
		title_pos = (700.0, 120.0)
		rot_angle = 2
		pos = (450.0, 400.0)
		pad_back_params = {
			event = menu_replace
			data = {
				state = UIstate_freestyle
			}
		}}
	CreateScreenElement \{id = freestyle_mii_menu_container
		type = ContainerElement
		parent = freestyle_mii_select_menu_container
		rgba = [
			255
			255
			255
			255
		]
		pos = (70.0, 170.0)
		scale = 0.9
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		internal_just = [
			center
			center
		]}
	GetMiiCount
	num_miis_on_page = ((<mii_count> + 1) - ($num_miis_per_page * $current_mii_page))
	mii_index = 0
	begin
	if (<num_miis_on_page> > 0 && <mii_index> < <num_miis_on_page>)
		vertical_position = (($mii_spacing * <mii_index>) * (0.0, 1.0))
		horizontal_position = (($mii_stagger * (<mii_index> - ((<mii_index> / 2) * 2))) * (1.0, 0.0))
		actual_mii_index = ((<mii_index> + ($num_miis_per_page * $current_mii_page)) - 1)
		add_menu_item {
			text = qs("")
			pad_choose_script = {freestyle_mii_chosen}
			pad_choose_params = {mii_index = <actual_mii_index>}
			additional_focus_script = freestyle_mii_highlight
			additional_focus_params = {mii_index = <mii_index>}
			additional_unfocus_script = freestyle_mii_unhighlight
			additional_unfocus_params = {mii_index = <mii_index>}
		}
		FormatText checksumname = mii_name 'freestyle_mii_%n' n = <mii_index> AddToStringLookup = true
		if (<actual_mii_index> >= 0)
			CreateScreenElement {
				type = MiiIconElement
				parent = freestyle_mii_menu_container
				id = <mii_name>
				just = [center center]
				pos = ($mii_start_position + <horizontal_position> + <vertical_position>)
				z_priority = 100
				mii_index = <actual_mii_index>
				mii_expression = Normal
				mii_bgcolor = [70 , 70 , 70]
				mii_dims = (128.0, 128.0)
			}
		else
			CreateScreenElement {
				type = SpriteElement
				parent = freestyle_mii_menu_container
				id = <mii_name>
				just = [center center]
				internal_just = [center center]
				pos = (($mii_start_position + <horizontal_position> + <vertical_position>))
				z_priority = 100
				dims = (128.0, 128.0)
				texture = FreestyleMiiRandomOff
			}
		endif
		CreateScreenElement {
			type = SpriteElement
			pos = (($mii_start_position + <horizontal_position> + <vertical_position>))
			just = [center center]
			parent = freestyle_mii_menu_container
			dims = (128.0, 128.0)
			texture = FreestyleMiiFrameOff
			z_priority = 101
		}
		<mii_index> = (<mii_index> + 1)
	else
		break
	endif
	repeat $num_miis_per_page
	CreateScreenElement {
		type = SpriteElement
		parent = freestyle_mii_menu_container
		id = freestyle_highlight_mii
		texture = FreestyleMiiFrameHighlight
		just = [center center]
		pos = ($mii_start_position)
		dims = (128.0, 128.0)
		z_priority = 105
	}
	add_menu_item {
		text = qs("")
		pad_choose_script = {freestyle_mii_next}
		additional_focus_script = freestyle_mii_highlight
		additional_focus_params = {mii_index = (-1) next}
		additional_unfocus_script = freestyle_mii_unhighlight
		additional_unfocus_params = {mii_index = (-1) next}
	}
	add_menu_item {
		text = qs("")
		pad_choose_script = {freestyle_mii_prev}
		additional_focus_script = freestyle_mii_highlight
		additional_focus_params = {mii_index = (-1) prev}
		additional_unfocus_script = freestyle_mii_unhighlight
		additional_unfocus_params = {mii_index = (-1) prev}
	}
	vertical_position = (($mii_spacing * <mii_index>) * (0.0, 1.0))
	horizontal_position = (($mii_stagger * (<mii_index> - ((<mii_index> / 2) * 2))) * (1.0, 0.0))
	CreateScreenElement {
		type = SpriteElement
		parent = freestyle_mii_menu_container
		id = freestyle_mii_down_arrow
		texture = FreestyleMiiArrowOff
		flip_h
		just = [center center]
		pos = ($mii_start_position + <horizontal_position> + <vertical_position> - (0.0, 32.0))
		dims = (128.0, 64.0)
		z_priority = 105
	}
	CreateScreenElement {
		type = SpriteElement
		parent = freestyle_mii_menu_container
		id = freestyle_mii_up_arrow
		texture = FreestyleMiiArrowOff
		just = [center center]
		pos = ($mii_start_position + ($mii_stagger * (1.0, 0.0)) - (0.0, 32.0))
		dims = (128.0, 64.0)
		z_priority = 105
	}
	menu_finish
endscript

script freestyle_mii_chosen 
	SetStructureParam array_name = freestyle_player_data array_index = $freestyle_active_mii param = mii_index value = <mii_index>
	if (mii_index = -1)
		SetStructureParam \{array_name = freestyle_player_data
			array_index = $freestyle_active_mii
			param = mii_is_random
			value = 1}
	else
		SetStructureParam \{array_name = freestyle_player_data
			array_index = $freestyle_active_mii
			param = mii_is_random
			value = 0}
	endif
	ui_event \{event = menu_replace
		data = {
			state = UIstate_freestyle
		}}
endscript

script freestyle_mii_highlight 
	if (<mii_index> = -1)
		SetScreenElementProps \{id = freestyle_highlight_mii
			z_priority = 0}
		if (GotParam next)
			SetScreenElementProps \{id = freestyle_mii_down_arrow
				texture = FreestyleMiiArrowHighlight}
		elseif (GotParam prev)
			SetScreenElementProps \{id = freestyle_mii_up_arrow
				texture = FreestyleMiiArrowHighlight}
		endif
	else
		vertical_position = (($mii_spacing * <mii_index>) * (0.0, 1.0))
		horizontal_position = (($mii_stagger * (<mii_index> - ((<mii_index> / 2) * 2))) * (1.0, 0.0))
		SetScreenElementProps id = freestyle_highlight_mii pos = ($mii_start_position + <horizontal_position> + <vertical_position>) z_priority = 105
		actual_mii_index = ((<mii_index> + ($num_miis_per_page * $current_mii_page)) - 1)
		FormatText checksumname = mii_name 'freestyle_mii_%n' n = <mii_index> AddToStringLookup = true
		if (<actual_mii_index> >= 0)
			SetScreenElementProps id = <mii_name> mii_bgcolor = [93 , 95 , 108]
		else
			SetScreenElementProps id = <mii_name> texture = FreestyleMiiRandomHighlight
		endif
	endif
endscript

script freestyle_mii_unhighlight 
	actual_mii_index = ((<mii_index> + ($num_miis_per_page * $current_mii_page)) - 1)
	FormatText checksumname = mii_name 'freestyle_mii_%n' n = <mii_index> AddToStringLookup = true
	if (<mii_index> = -1)
		if (GotParam next)
			SetScreenElementProps \{id = freestyle_mii_down_arrow
				texture = FreestyleMiiArrowOff}
		elseif (GotParam prev)
			SetScreenElementProps \{id = freestyle_mii_up_arrow
				texture = FreestyleMiiArrowOff}
		endif
	else
		if (<actual_mii_index> >= 0)
			SetScreenElementProps id = <mii_name> mii_bgcolor = [70 , 70 , 70]
		else
			SetScreenElementProps id = <mii_name> texture = FreestyleMiiRandomOff
		endif
	endif
endscript

script freestyle_mii_next 
	GetMiiCount
	num_miis_on_page = ((<mii_count> + 1) - ($num_miis_per_page * $current_mii_page))
	if (<num_miis_on_page> > $num_miis_per_page)
		change current_mii_page = ($current_mii_page + 1)
	else
		change \{current_mii_page = 0}
	endif
	ui_event \{event = menu_replace
		data = {
			state = UIstate_freestyle_mii
		}}
endscript

script freestyle_mii_prev 
	GetMiiCount
	if ($current_mii_page > 0)
		change current_mii_page = ($current_mii_page - 1)
	else
		change current_mii_page = (((<mii_count> + 1) / $num_miis_per_page))
	endif
	ui_event \{event = menu_replace
		data = {
			state = UIstate_freestyle_mii
		}}
endscript

script ui_destroy_freestyle_mii 
	if ScreenElementExists \{id = freestyle_mii_menu_container}
		DestroyScreenElement \{id = freestyle_mii_menu_container}
	endif
	generic_ui_destroy
endscript
