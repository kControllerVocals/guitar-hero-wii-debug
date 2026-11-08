freestyle_card_container_id = card_parent
freestyle_card_gem_count = 6
freestyle_card_area = (130.0, 170.0)
freestyle_card_gem_area = (120.0, 138.0)
freestyle_card_gem_area_offset = (0.0, 0.0)
freestyle_card_max_gems = 8
freestyle_card_name_pos = (65.0, -25.0)
freestyle_z_card = 6
freestyle_z_name = 10
freestyle_card_gem_bar_dim = (5.0, 21.0)
freestyle_display_card_names = 0
freestyle_card_gem_masks = [
	0
	65536
	4096
	256
	16
	1
]
freestyle_card_gem_names = [
	qs(0x3c2dbacd)
	qs(0x6e84c19c)
	qs(0x05be5b04)
	qs(0xf14e3f70)
	qs(0x334e873d)
	qs(0xbc94011b)
]
freestyle_card_gem_pos = [
	60
	12
	36
	60
	84
	108
]
freestyle_active_card_ids = [
	active_card_1
	active_card_2
	active_card_3
]
freestyle_card_pos = [
	(460.0, 183.0)
	(640.0, 135.0)
	(820.0, 183.0)
]
freestyle_active_card_textures = [
	cardTiltUp
	cardTiltMid
	cardTiltDown
]
freestyle_active_card_angles = [
	-30
	0
	30
]
freestyle_lefty_swap_indices = [
	0
	5
	4
	3
	2
	1
]

script freestyle_init_card_visuals 
	CreateScreenElement \{type = ContainerElement
		id = $freestyle_card_container_id
		parent = freestyle_root
		pos = (0.0, 0.0)
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		internal_just = [
			left
			top
		]
		z_priority = 0}
endscript

script freestyle_destroy_card_visuals 
	if ScreenElementExists \{id = $freestyle_card_container_id}
		DestroyScreenElement \{id = $freestyle_card_container_id}
	endif
endscript

script freestyle_create_card_visuals \{slots_played = 0}
	if ScreenElementExists id = <card_id>
		DestroyScreenElement id = <card_id>
	endif
	lefty_flip = ($freestyle_player_data [$freestyle_card_player].lefty)
	CreateScreenElement {
		type = ContainerElement
		id = <card_id>
		parent = $freestyle_card_container_id
		pos = (0.0, 0.0)
		just = [center center]
		z_priority = $freestyle_z_card
		dims = $freestyle_card_area
	}
	switch <card_type>
		case transition
		texture = cardTransition
		case Blank
		texture = emptyCard
		default
		texture = ($freestyle_active_card_textures [$freestyle_card_tilt_showing])
	endswitch
	CreateScreenElement {
		type = SpriteElement
		parent = <card_id>
		local_id = background
		texture = <texture>
		just = [center center]
		pos = ($freestyle_card_area * 0.5)
		flip_v = <lefty_flip>
		relative_z_priority = -1
	}
	if ($freestyle_display_card_names = 1)
		if GotParam \{card_name}
			CreateScreenElement {
				type = TextElement
				parent = <card_id>
				local_id = card_name_text
				text = <card_name>
				just = [center center]
				pos = $freestyle_card_name_pos
				font = fontgrid_title_gh3
				z_priority = $freestyle_z_name
				rgba = [255 0 0 255]
				internal_scale = (0.7, 0.7)
				shadow
			}
		endif
	endif
	gem_area_pos = (($freestyle_card_area * 0.5) + ($freestyle_card_gem_area_offset))
	CreateScreenElement {
		type = ContainerElement
		parent = <card_id>
		local_id = gem_area
		dims = $freestyle_card_gem_area
		just = [center center]
		pos = <gem_area_pos>
	}
	gem_area_id = <id>
	if (<card_type> != Blank)
		freestyle_card_create_gems {
			card = <card>
			card_id = <card_id>
			gem_effect = played
			gem_slot_begin = 0
			gem_slot_end = <slots_played>
		}
		freestyle_card_create_gems {
			card = <card>
			card_id = <card_id>
			gem_effect = none
			gem_slot_begin = <slots_played>
			gem_slot_end = $freestyle_card_max_gems
		}
	endif
	if (<card_type> = transition)
		freestyle_add_transition_card_fx card_id = <card_id>
	endif
endscript

script freestyle_card_create_gems \{gem_effect = none}
	if NOT ScreenElementExists id = <card_id>
		return
	endif
	if NOT GotParam \{gem_slot_begin}
		gem_slot_begin = 0
	endif
	if NOT GotParam \{gem_slot_end}
		gem_slot_end = $freestyle_card_max_gems
	endif
	if (<gem_slot_begin> >= <gem_slot_end>)
		return
	endif
	ResolveScreenElementId id = {<card_id> child = gem_area}
	gem_area_id = <resolved_id>
	StringToCharArray string = (<card>.notes)
	GetArraySize <char_array>
	last_event = -1
	gem_slot = (<gem_slot_begin> - 1)
	begin
	if ((<gem_slot> < 0) || (<last_event> >= 0))
		break
	endif
	current_char = (<char_array> [<gem_slot>])
	switch (<current_char>)
		case '.'
		case '-'
		skipthis = 1
		default
		CardCharacterToGuitarEvent char = <current_char>
		<last_event> = <event>
	endswitch
	<gem_slot> = (<gem_slot> - 1)
	repeat
	<gem_slot> = <gem_slot_begin>
	begin
	current_char = (<char_array> [<gem_slot>])
	next_char = ''
	is_last_char = 0
	is_rest = 0
	if ((<gem_slot> + 1) < <array_size>)
		<next_char> = (<char_array> [(<gem_slot> + 1)])
	else
		<is_last_char> = 1
	endif
	switch (<current_char>)
		case '.'
		<is_rest> = 1
		case '-'
		if (<last_event> > 0)
			if ((<next_char> != '-') || (<is_last_char> = 1))
				gem_type = hold_bar_end
			else
				gem_type = hold_bar
			endif
			freestyle_card_create_gems_for_event {
				event_mask = <last_event>
				parent_id = <gem_area_id>
				gem_type = <gem_type>
				gem_slot = <gem_slot>
				gem_effect = <gem_effect>
			}
		endif
		default
		CardCharacterToGuitarEvent char = <current_char>
		if (<event> = 0)
			gem_type = Normal
		elseif (<next_char> = '-')
			gem_type = hold_gem
		else
			gem_type = Normal
		endif
		freestyle_card_create_gems_for_event {
			event_mask = <event>
			parent_id = <gem_area_id>
			gem_type = <gem_type>
			gem_slot = <gem_slot>
			gem_effect = <gem_effect>
		}
		<last_event> = <event>
	endswitch
	<gem_slot> = (<gem_slot> + 1)
	if (<gem_slot> >= <gem_slot_end>)
		break
	endif
	repeat
endscript

script freestyle_card_create_gems_for_event 
	gem = 0
	begin
	if freestyle_card_event_needs_this_gem gem = <gem> event_mask = <event_mask>
		switch (<gem_effect>)
			case played
			case played_now
			switch (<gem_type>)
				case Normal
				if (<gem> = 0)
					gem_sprite = CardGemPurplePlayed
				else
					gem_sprite = GemPlayed
				endif
				case hold_gem
				gem_sprite = HoldGemPlayed
				case hold_bar
				case hold_bar_end
				gem_sprite = HoldBarPlayed
			endswitch
			case none
			case respawn
			switch (<gem_type>)
				case Normal
				sprite_template = 'CardGem%a'
				case hold_gem
				sprite_template = 'HoldGem%a'
				case hold_bar
				case hold_bar_end
				sprite_template = 'HoldBar%a'
			endswitch
			FormatText checksumname = gem_sprite <sprite_template> a = ($freestyle_card_gem_names [<gem>])
			default
			ScriptAssert qs(0xb9483ab8) a = <gem_effect>
		endswitch
		freestyle_calculate_card_gem_pos {
			gem = <gem>
			gem_slot = <gem_slot>
			gem_type = <gem_type>
		}
		freestyle_calculate_card_gem_id {
			gem = <gem>
			gem_slot = <gem_slot>
		}
		if NOT ScreenElementExists id = {<parent_id> child = <gem_id>}
			CreateScreenElement {
				type = SpriteElement
				local_id = <gem_id>
				parent = <parent_id>
				just = [center center]
				relative_z_priority = <gem_slot>
			}
		endif
		SetScreenElementProps {
			id = {<parent_id> child = <gem_id>}
			texture = <gem_sprite>
			pos = <gem_pos>
		}
		switch (<gem_effect>)
			case played_now
			switch (<gem_type>)
				case Normal
				case hold_gem
				SpawnScriptLater {
					freestyle_card_gem_flame_effect
					params = {
						parent_id = <parent_id>
						pos = <gem_pos>
					}
				}
			endswitch
			case respawn
			SetScreenElementProps {
				id = {<parent_id> child = <gem_id>}
				alpha = 0.0
			}
			SetScreenElementProps {
				id = {<parent_id> child = <gem_id>}
				alpha = 1.0
				Anim = fast_in
				time = 0.25
			}
		endswitch
	endif
	<gem> = (<gem> + 1)
	repeat $freestyle_card_gem_count
endscript

script freestyle_display_new_card \{effect = none}
	freestyle_get_tilt_cards
	freestyle_get_current_card_index card = <card> tilt = $freestyle_card_tilt_showing
	mini_deck = ($freestyle_current_cards [<current_card_index>].mini_deck)
	index = ($freestyle_current_cards [<current_card_index>].index)
	blank_card = ($freestyle_current_cards [<current_card_index>].blank_card)
	card_type = Normal
	if (<blank_card> = 1)
		<card_type> = Blank
	else
		if StructureContains Structure = ($<tilt_cards_ptr> [<mini_deck>]) transition_deck
			<card_type> = transition
		endif
	endif
	if ($freestyle_display_card_names = 1)
		mini_deck_name = qs(0x26e3bd2e)
		if (<blank_card> = 0)
			if StructureContains Structure = ($<tilt_cards_ptr> [<mini_deck>]) name
				<mini_deck_name> = ($<tilt_cards_ptr> [<mini_deck>].name)
			endif
			FormatText TextName = card_name qs(0xd255bff9) a = <mini_deck_name> b = (<index> + 1)
		endif
	endif
	old_texture = $freestyle_default_card_transition_bg
	if ScreenElementExists id = ($freestyle_active_card_ids [<card>])
		GetScreenElementProps id = {($freestyle_active_card_ids [<card>]) child = background}
		old_texture = <texture>
	endif
	freestyle_destroy_card_line_burn_effect card_id = ($freestyle_active_card_ids [<card>])
	freestyle_create_card_visuals {
		card = (($freestyle_current_cards [<current_card_index>]).card)
		card_id = ($freestyle_active_card_ids [<card>])
		card_type = <card_type>
		card_name = <card_name>
		slots_played = ($freestyle_current_cards [<current_card_index>].slots_played)
	}
	SetScreenElementProps {
		id = ($freestyle_active_card_ids [<card>])
		pos = ($freestyle_card_pos [<card>])
		rot_angle = ($freestyle_active_card_angles [<card>])
		alpha = 1.0
		unhide
	}
	GetScreenElementProps id = {($freestyle_active_card_ids [<card>]) child = background}
	new_texture = <texture>
	if (<effect> != none)
		freestyle_play_card_effect {
			card = <card>
			effect = <effect>
			out_texture = <old_texture>
			in_texture = <new_texture>
		}
	endif
endscript

script freestyle_destroy_active_card_visuals 
	freestyle_hide_card_effects
	card = 0
	begin
	if ScreenElementExists id = ($freestyle_active_card_ids [<card>])
		DestroyScreenElement id = ($freestyle_active_card_ids [<card>])
	endif
	<card> = (<card> + 1)
	repeat $freestyle_active_card_count
endscript

script freestyle_refresh_card_visuals 
	if ($freestyle_card_mode_state = playing)
		freestyle_hide_card_effects
		card = 0
		begin
		if ScreenElementExists id = ($freestyle_active_card_ids [<card>])
			freestyle_display_new_card card = <card> transition = none
		endif
		<card> = (<card> + 1)
		repeat $freestyle_active_card_count
	endif
endscript

script freestyle_calculate_card_gem_pos 
	step_size = ($freestyle_card_gem_area [1] / ($freestyle_card_max_gems - 1))
	lefty_flip = ($freestyle_player_data [$freestyle_card_player].lefty)
	pos_index = <gem>
	if (<lefty_flip> = true)
		<pos_index> = ($freestyle_lefty_swap_indices [<gem>])
	endif
	pos_x = ($freestyle_card_gem_pos [<pos_index>])
	pos_y = (($freestyle_card_gem_area [1]) - (<step_size> * <gem_slot>))
	gem_pos = (0.0, 0.0)
	SetPairComponents gem_pos x = <pos_x> y = <pos_y>
	return gem_pos = <gem_pos>
endscript

script freestyle_calculate_card_gem_id 
	FormatText checksumname = gem_id 'gem_%a_%b' a = <gem_slot> b = <gem>
	return gem_id = <gem_id>
endscript

script freestyle_card_event_needs_this_gem 
	gem_mask = ($freestyle_card_gem_masks [<gem>])
	if ((<gem_mask> = 0) && (<event_mask> = 0))
		return \{true}
	elseif (<gem_mask> && <event_mask>)
		return \{true}
	endif
	return \{false}
endscript
