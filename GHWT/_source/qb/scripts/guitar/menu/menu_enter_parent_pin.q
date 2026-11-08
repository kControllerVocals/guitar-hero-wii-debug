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
		text = $wii_next
		z = 1500}
	add_user_control_helper \{button = red
		text = $wii_back
		z = 1500}
	add_user_control_helper \{button = start
		text = $wii_DLC_PIN_confirm
		z = 1500}
	AssignAlias id = <helper_pill_ID> alias = confirm_pin_text
	SetScreenElementProps \{id = confirm_pin_text
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
	Generic_PopupElement :GetTags
	destroy_generic_popup
	clean_up_user_control_helpers
	spawnscriptnow <pin_callback> params = {PIN = <pin_text>}
endscript

script get_parent_pin_entry_center_pos 
	return pos = (((25 * ((2 * <index>) - 3)) * (1.0, 0.0)) + (0.0, 200.0))
endscript

script enter_parent_pin_change_character 
	if GotParam \{device_num}
		if IsGuitarController controller = <device_num>
			if GotParam \{up}
				change_parent_pin_character \{dir = -1}
			else
				change_parent_pin_character \{dir = 1}
			endif
		else
			if GotParam \{up}
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
	SetArrayElement ArrayName = parent_pin_values GlobalArray index = $parent_pin_index newvalue = ($parent_pin_values [$parent_pin_index] + <dir>)
	if ($parent_pin_values [$parent_pin_index] > 9)
		SetArrayElement \{ArrayName = parent_pin_values
			GlobalArray
			index = $parent_pin_index
			newvalue = 0}
	elseif ($parent_pin_values [$parent_pin_index] < 0)
		SetArrayElement \{ArrayName = parent_pin_values
			GlobalArray
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
	FormatText TextName = parent_pin_text '%p%n' p = <parent_pin_text> n = ($parent_pin_values [<index>])
	<index> = (<index> + 1)
	repeat ($parent_pin_numbers)
	return pin_text = <parent_pin_text>
endscript

script menu_epp_refresh_parent_pin 
	if (($parent_pin_index + 1) = $parent_pin_numbers)
		SetScreenElementProps \{id = confirm_pin_text
			helper_description_rgba = [
				0
				192
				0
				255
			]}
	else
		SetScreenElementProps \{id = confirm_pin_text
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
	ResolveScreenElementId id = {pu_warning_vmenu child = {<i> child = num}}
	if (<i> = <index>)
		FormatText TextName = num_text qs("%n") n = ($parent_pin_values [<i>])
	else
		<num_text> = qs(0xd14d2128)
	endif
	<resolved_id> :SE_SetProps text = <num_text>
	<i> = (<i> + 1)
	repeat ($parent_pin_numbers)
	menu_epp_update_marker
endscript

script menu_epp_update_marker 
	<index> = ($parent_pin_index)
	ResolveScreenElementId id = {pu_warning_vmenu child = <index>}
	alias_arrow_container :SE_SetProps parent = <resolved_id> pos = (0.0, 0.0) pos_anchor = [center center] just = [center center]
endscript
