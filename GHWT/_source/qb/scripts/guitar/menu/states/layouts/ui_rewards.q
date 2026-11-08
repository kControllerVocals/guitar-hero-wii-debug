
script ui_create_rewards 
	progression_get_new_unlocks
	GetArraySize \{new_unlocks}
	new_unlocks_size = <array_size>
	printstruct channel = mychannel <...>
	if (<new_unlocks_size> > 3)
		<new_unlocks_size> = 3
	endif
	names_array = []
	textures_array = []
	cntr = 0
	if (<array_size> > 0)
		begin
		this_item = (<new_unlocks> [<cntr>])
		name = qs("unknown")
		texture = unknown
		if ((<this_item>.type) = car_piece)
			part = ((<this_item>.item).part)
			desc_id = ((<this_item>.item).desc_id)
			ps2_load_car_part_script \{heap = BottomUpHeap}
			if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
				ScriptAssert '%s %t not found' s = <part> t = <desc_id>
			endif
			ps2_unload_car_part_script \{heap = BottomUpHeap}
			name = <frontend_desc>
			if GotParam \{polaroid}
				texture = <polaroid>
			else
				texture = rewards_image_placeholder
			endif
			printf \{channel = mychannel
				qs("\Lafter polariod has been set")}
			printstruct channel = mychannel <...>
		elseif ((<this_item>.type) = car_pieces)
			list_of_pieces = (<this_item>.char_pieces)
			GetArraySize \{list_of_pieces}
			if (<array_size> > 0)
				my_item = (<list_of_pieces> [0])
				part = (<my_item>.part)
				desc_id = (<my_item>.desc_id)
				ps2_load_car_part_script \{heap = BottomUpHeap}
				if NOT GetActualCASOptionStruct part = <part> desc_id = <desc_id>
					ScriptAssert '%s %t not found' s = <part> t = <desc_id>
				endif
				ps2_unload_car_part_script \{heap = BottomUpHeap}
				if StructureContains \{Structure = this_item
						group_name}
					name = (<this_item>.group_name)
				else
					name = <frontend_desc>
				endif
				if GotParam \{polaroid}
					texture = <polaroid>
				else
					texture = rewards_image_placeholder
				endif
			endif
		elseif ((<this_item>.type) = character)
			printf \{channel = mychannel
				qs("\Lwe got a character")}
			get_musician_profile_struct_by_id id = (<this_item>.item) savegame = 0
			name = (<profile_struct>.fullname)
			texture = (<profile_struct>.polaroid)
			RemoveParameter \{profile_struct}
		endif
		AddArrayElement array = <names_array> element = <name>
		names_array = <array>
		AddArrayElement array = <textures_array> element = <texture>
		textures_array = <array>
		cntr = (<cntr> + 1)
		repeat <new_unlocks_size>
	endif
	GetArraySize <names_array>
	num_unlocks = <array_size>
	if ScreenElementExists \{id = my_rewards_id}
		DestroyScreenElement \{id = my_rewards_id}
	endif
	printf \{channel = mychannel
		qs("\Lall items should be ready")}
	get_all_exclusive_devices
	CreateScreenElement {
		parent = root_window
		id = my_rewards_id
		type = DescInterface
		desc = 'rewards'
		rewards_image_placeholder_texture = (<textures_array> [(<num_unlocks> -1)])
		exclusive_device = <exclusive_device>
	}
	SoundEvent \{event = Unlock_New_Item}
	if my_rewards_id :Desc_ResolveAlias \{name = alias_list_menu}
	else
		ScriptAssert \{qs("\LProblem resolving alias in UIState_rewards")}
	endif
	i = 0
	if (<num_unlocks> > 0)
		if (<num_unlocks> > 1)
			<add_sound_event> = true
		else
			<add_sound_event> = false
		endif
		begin
		CreateScreenElement {
			parent = <resolved_id>
			type = DescInterface
			desc = 'rewards_unlockable'
			autoSizeDims = true
			unlockable_text = (<names_array> [<i>])
			unlockable_control_pos = {(-300.0, 0.0) relative}
			rewards_checkbox_alpha = 0
			unlockable_alpha = 0
		}
		SetScreenElementProps {
			id = <id>
			event_handlers = [
				{pad_choose rewards_continue_to_next_screen}
				{focus my_menu_focus params = {id = <id> item_textures = <textures_array> item_index = <i> add_sound_event = <add_sound_event>}}
				{unfocus my_menu_unfocus params = {id = <id>}}
			]
		}
		<id> :obj_spawnscript anim_reward params = {index = <i> item_textures = <textures_array>}
		i = (<i> + 1)
		repeat <num_unlocks>
	endif
	t = ((<num_unlocks> * 0.5) + 1.0)
	spawnscriptnow set_focus_to_menu params = {w_time = <t> menu_id = <resolved_id>}
endscript

script ui_destroy_rewards 
	clean_up_user_control_helpers
	DestroyScreenElement \{id = my_rewards_id}
endscript

script ui_deinit_rewards 
	progression_reset_new_unlocks
	printf \{channel = mychannel
		qs("\L**DEINIT UNLOCK REWARDS PAGE**")}
endscript

script rewards_continue_to_next_screen 
	printf \{channel = test
		qs("\LContinuing to next page from unlock screen")}
	ui_att_ballpark_should_i_show_ad
	printstruct channel = mychannel <...>
	if (<show_att_ad> = 1)
		generic_event_choose \{state = uistate_att_ballpark}
	else
		ui_win_song_continue_next_menu
	endif
endscript

script my_menu_focus \{add_sound_event = true}
	SetScreenElementProps {
		id = <id>
		unlockable_rgba = (($g_menu_colors).brick)
		scale = 1.04
	}
	SetScreenElementProps {
		id = my_rewards_id
		rewards_image_placeholder_texture = (<item_textures> [<item_index>])
	}
	if (<add_sound_event> = true)
		if NOT ScriptIsRunning \{set_focus_to_menu}
			generic_menu_up_or_down_sound
		endif
	endif
endscript

script my_menu_unfocus 
	SetScreenElementProps {
		id = <id>
		unlockable_rgba = (($g_menu_colors).black)
		scale = 1.0
	}
endscript

script anim_reward 
	GetArraySize <item_textures>
	w_time = ((<array_size> - <index>) * 0.5)
	Wait <w_time> second
	SetScreenElementProps {
		id = my_rewards_id
		rewards_image_placeholder_texture = (<item_textures> [<index>])
	}
	SoundEvent \{event = Unlock_Item_Text_Appear}
	SE_SetProps \{unlockable_control_pos = {
			(300.0, 0.0)
			relative
		}
		unlockable_alpha = 1
		time = 0.2
		Anim = gentle}
	Wait \{0.3
		second}
	SE_SetProps \{rewards_checkbox_alpha = 1
		time = 0.2
		Anim = gentle}
endscript

script set_focus_to_menu 
	Wait <w_time> second
	LaunchEvent type = focus target = <menu_id>
	add_user_control_helper \{text = qs("CONTINUE")
		button = green
		z = 100000}
endscript
