parent_pin_index = 0
parent_pin_numbers = 4
parent_pin_values = [
	0
	0
	0
	0
]

script parent_pin_make_helpers 
	add_user_control_helper \{button = green
		text = qs(0x2931d48b)
		z = 1500}
	add_user_control_helper \{button = red
		text = qs(0xaf4d5dd2)
		z = 1500}
	add_user_control_helper \{button = start
		text = qs(0xd0b08141)
		z = 1500}
	assignalias id = <helper_pill_id> alias = confirm_pin_text
	setscreenelementprops \{id = confirm_pin_text
		helper_description_rgba = [
			192
			0
			0
			255
		]}
endscript

script destroy_enter_parent_pin_menu 
	destroy_generic_popup
endscript

script confirm_parent_pin 
	if (($parent_pin_index + 1) = $parent_pin_numbers)
		parent_pin_post_confirm
	endif
endscript

script parent_pin_post_confirm 
	menu_epp_get_parent_pin_text
	parent_pin_done pin_text = <pin_text>
endscript

script parent_pin_done \{pin_text = ''}
	generic_popupelement :gettags
	destroy_generic_popup
	clean_up_user_control_helpers
	spawnscriptnow <pin_callback> params = {pin = <pin_text>}
endscript

script get_parent_pin_entry_center_pos 
	return pos = (((25 * ((2 * <index>) - 3)) * (1.0, 0.0)) + (0.0, 200.0))
endscript

script enter_parent_pin_change_character 
	if gotparam \{device_num}
		if isguitarcontroller controller = <device_num>
			if gotparam \{up}
				change_parent_pin_character \{dir = -1}
			else
				change_parent_pin_character \{dir = 1}
			endif
		else
			if gotparam \{up}
				change_parent_pin_character \{dir = 1}
			else
				change_parent_pin_character \{dir = -1}
			endif
		endif
	endif
endscript

script change_parent_pin_character 
	if (<dir> > 0)
		generic_menu_up_or_down_sound \{up}
	else
		generic_menu_up_or_down_sound \{down}
	endif
	setarrayelement arrayname = parent_pin_values globalarray index = $parent_pin_index newvalue = ($parent_pin_values [$parent_pin_index] + <dir>)
	if ($parent_pin_values [$parent_pin_index] > 9)
		setarrayelement \{arrayname = parent_pin_values
			globalarray
			index = $parent_pin_index
			newvalue = 0}
	elseif ($parent_pin_values [$parent_pin_index] < 0)
		setarrayelement \{arrayname = parent_pin_values
			globalarray
			index = $parent_pin_index
			newvalue = 9}
	endif
	menu_epp_refresh_parent_pin
endscript

script parent_pin_advance_pointer 
	if (($parent_pin_index + 1) < $parent_pin_numbers)
		generic_menu_pad_choose_sound
		change parent_pin_index = ($parent_pin_index + 1)
		menu_epp_refresh_parent_pin
	endif
endscript

script parent_pin_retreat_pointer 
	if ($parent_pin_index = 0)
		parent_pin_done \{pin_text = ''}
		return
	endif
	if (($parent_pin_index -1) > -1)
		generic_menu_pad_back_sound
		change parent_pin_index = ($parent_pin_index -1)
		menu_epp_refresh_parent_pin
	endif
endscript

script menu_epp_get_parent_pin_text 
	parent_pin_text = ''
	index = 0
	begin
	formattext textname = parent_pin_text '%p%n' p = <parent_pin_text> n = ($parent_pin_values [<index>])
	<index> = (<index> + 1)
	repeat ($parent_pin_numbers)
	return pin_text = <parent_pin_text>
endscript

script menu_epp_refresh_parent_pin 
	if (($parent_pin_index + 1) = $parent_pin_numbers)
		setscreenelementprops \{id = confirm_pin_text
			helper_description_rgba = [
				0
				192
				0
				255
			]}
	else
		setscreenelementprops \{id = confirm_pin_text
			helper_description_rgba = [
				192
				0
				0
				255
			]}
	endif
	index = ($parent_pin_index)
	i = 0
	begin
	resolvescreenelementid id = {pu_warning_vmenu child = {<i> child = num}}
	if (<i> = <index>)
		formattext textname = num_text qs(0xb22939c6) n = ($parent_pin_values [<i>])
	else
		<num_text> = qs(0xd14d2128)
	endif
	<resolved_id> :se_setprops text = <num_text>
	<i> = (<i> + 1)
	repeat ($parent_pin_numbers)
	menu_epp_update_marker
endscript

script menu_epp_update_marker 
	<index> = ($parent_pin_index)
	resolvescreenelementid id = {pu_warning_vmenu child = <index>}
	alias_arrow_container :se_setprops parent = <resolved_id> pos = (0.0, 0.0) pos_anchor = [center center] just = [center center]
endscript
