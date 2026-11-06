ui_task_menu_default_focus_id = current_menu
ui_task_menu_default_anim_in_script = task_menu_default_anim_in
ui_task_menu_default_anim_out_script = task_menu_default_anim_out
0x86fdcfea = {
	enable = true
	active = false
	0xd77d3b61 = false
}
0x8e314709 = true

script 0x31956c10 
	if gotparam \{true}
		change \{structurename = 0x86fdcfea
			enable = true}
	elseif gotparam \{false}
		if 0x16cc1b60
			0xd8bd876f
		endif
		change \{structurename = 0x86fdcfea
			enable = false}
	else
		0x93d8d5cf \{qs(0x76a9f1b5)}
	endif
endscript

script ui_initializestatemachine 
	if objectexists \{id = ui}
		return
	endif
	<com_disabled> = 0
	if NOT iscompositeobjectmanagerenabled
		<com_disabled> = 1
		compositeobjectmanagersetenable \{on}
	endif
	createcompositeobject \{params = {
			name = ui
			permanent
		}
		components = [
			{
				component = eventcache
			}
			{
				component = statemachinemanager
			}
			{
				component = menustack
			}
		]
		heap = frontend}
	if (<com_disabled> = 1)
		compositeobjectmanagersetenable \{off}
	endif
	registeruistates
	mempushcontext \{heap_ui_pak_slot}
	createpakmanmap \{map = ui_paks
		links = uipaks
		folder = 'Pak/ui/'}
	mempopcontext
	ui :fsm_set \{state = uistate_null
		replacement = this
		params = {
			base_name = 'null'
		}}
endscript

script ui_print_states 
	ui :unpause
	ui :fsm_printstatemachine
	ui :menustack_printcontents
endscript

script is_ui_event_running 
	if scriptisrunning \{ui_event_block}
		return \{true}
	endif
	return \{false}
endscript

script ui_event_if_camera_finished 
	if is_menu_camera_finished
		ui_event <...>
	endif
endscript

script ui_event \{force_event = false}
	if NOT ((<event> = menu_anim_in_done) || (<event> = menu_anim_out_done) || (<event> = menu_add_data) || (<event> = menu_remove_data))
		if (<force_event> = false)
			if is_ui_event_running
				return
			endif
		endif
		spawnscriptnow ui_event_block params = <...>
	else
		ui_event_spawned <...>
	endif
endscript

script ui_event_spawned \{event = menu_change
		data = {
		}}
	if structurecontains \{structure = data
			name = state}
		0x8dbdaee4 qs(0xd6e589bd) e = <event> s = (<data>.state) channel = ui_event
	else
		0x8dbdaee4 qs(0xde330243) e = <event> channel = ui_event
	endif
	if gotparam \{0x1c97beb0}
		change \{structurename = 0x86fdcfea
			0xd77d3b61 = true}
	else
		<0xc6361ec6> = uistate_null
		if gotparam \{state}
			<0xc6361ec6> = <state>
		endif
		if structurecontains \{structure = data
				name = state}
			<0xc6361ec6> = (<data>.state)
		endif
		switch <0xc6361ec6>
			case uistate_boot_iis
			case uistate_signin
			case uistate_mainmenu_intro
			case uistate_gameplay
			case uistate_pausemenu
			case uistate_song_unpause
			change \{structurename = 0x86fdcfea
				0xd77d3b61 = true}
		endswitch
	endif
	ui :unpause
	ui :eventcache_add event_id = <event> event_data = <data>
endscript

script ui_event_add_params 
	ui_event event = menu_add_data data = <...>
endscript

script ui_event_remove_params 
	ui_event event = menu_remove_data data = <...>
endscript

script ui_event_add_continue \{event = menu_change}
	ui_event event = menu_add data = <add_state_data>
	begin
	if NOT is_ui_event_running
		break
	endif
	wait \{1
		gameframe}
	repeat
	ui_event event = <event> data = <continue_state_data>
	begin
	if NOT is_ui_event_running
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ui_event_block \{event = menu_change
		data = {
		}}
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	ui_event_spawned event = <event> data = <data>
	block \{type = taskmenu_callback}
endscript

script ui_event_wait \{event = menu_change
		data = {
		}}
	spawnscriptnow ui_event_wait_spawned params = {<...>}
endscript

script ui_event_wait_spawned 
	ui_event_wait_for_safe
	if gotparam \{state}
		data = {<data> state = <state>}
	endif
	spawnscriptnow ui_event_block params = <...>
endscript

script ui_event_wait_for_safe 
	wait \{1
		gameframe}
	begin
	if NOT is_ui_event_running
		break
	endif
	wait \{1
		gameframe}
	repeat
endscript

script ui_event_exists_in_stack 
	requireparams \{[
			name
		]
		all}
	ui :menustack_getstackcontents
	if (<stack_size> < 1)
		return \{false}
	endif
	i = 0
	begin
	if ((<stack> [<i>].base_name) = <name>)
		return \{true}
	endif
	if gotparam \{above}
		if ((<stack> [<i>].base_name) = <above>)
			return \{false}
		endif
	endif
	i = (<i> + 1)
	repeat <stack_size>
	return \{false}
endscript

script ui_event_get_stack 
	ui :menustack_getstackcontents
	return {<...>}
endscript

script ui_state_pak_load 
	printf channel = taskmenu 'UI: Loading pak "%s"' s = <pakname>
	setpakmancurrent map = ui_paks pakname = <pakname>
endscript

script ui_state_anim_in_done 
	if ($0x86fdcfea.active = true)
		change \{structurename = 0x86fdcfea
			active = false}
		printf \{'ui_event: pop_mini_loading_screen'}
		printstruct <...>
		0xdf9f604d
	endif
	ui_event \{event = menu_anim_in_done}
endscript

script ui_state_anim_out_done 
	hide_glitch
	if ($0x86fdcfea.enable = true)
		if ($0x86fdcfea.active = false)
			if ($0x86fdcfea.0xd77d3b61 = true)
				change \{structurename = 0x86fdcfea
					0xd77d3b61 = false}
			else
				change \{structurename = 0x86fdcfea
					active = true}
				printf \{'ui_event: push_mini_loading_screen'}
				printstruct <...>
				0x10b35a47
			endif
		endif
	endif
	ui_event \{event = menu_anim_out_done}
endscript

script ui_event_get_top 
	ui_event_get_stack
	getarraysize <stack>
	if (<array_size> > 0)
		return (<stack> [0])
	endif
endscript
