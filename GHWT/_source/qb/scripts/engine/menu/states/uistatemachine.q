ui_task_menu_default_focus_id = current_menu
ui_task_menu_default_anim_in_script = task_menu_default_anim_in
ui_task_menu_default_anim_out_script = task_menu_default_anim_out

script UI_InitializeStateMachine 
	if ObjectExists \{id = ui}
		return
	endif
	<com_disabled> = 0
	if NOT IsCompositeObjectManagerEnabled
		<com_disabled> = 1
		CompositeObjectManagerSetEnable \{on}
	endif
	CreateCompositeObject \{params = {
			name = ui
			permanent
		}
		Components = [
			{
				Component = EventCache
			}
			{
				Component = StateMachineManager
			}
			{
				Component = MenuStack
			}
		]
		heap = FrontEnd}
	CreateCompositeObject \{params = {
			name = UI_object2
			permanent
		}
		Components = [
			{
				Component = EventCache
			}
			{
				Component = StateMachineManager
			}
			{
				Component = MenuStack
			}
		]
		heap = FrontEnd}
	if (<com_disabled> = 1)
		CompositeObjectManagerSetEnable \{off}
	endif
	RegisterUIStates
	MemPushContext \{heap_ui_pak_slot}
	CreatePakManMap \{map = ui_paks
		links = UIPaks
		folder = 'Pak/ui/'}
	MemPopContext
	ui :Fsm_Set \{state = UIstate_Null
		replacement = this
		params = {
			object = 1
			base_name = 'null'
		}}
endscript

script ui_print_states \{object = 1}
	ui :UnPause
	ui :FSM_PrintStateMachine
	ui :MenuStack_PrintContents
endscript

script Is_ui_event_running 
	if ScriptIsRunning \{ui_event_block}
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
			if Is_ui_event_running
				return
			endif
		endif
		spawnscriptnow ui_event_block params = <...>
	else
		ui_event_spawned <...>
	endif
endscript
is_event_dialogue_on = 0

script ui_get_dialogue 
	if ($is_event_dialogue_on = 1)
		return \{true}
	endif
	return \{false}
endscript

script ui_set_dialogue \{value = 0}
	change is_event_dialogue_on = <value>
endscript

script ui_event_spawned \{object = 1
		event = menu_change
		data = {
		}}
	if StructureContains \{Structure = data
			name = state}
		printf qs("\Lui_event object=%p event=%e state=%s") p = <object> e = <event> s = (<data>.state) channel = ui_event
	else
		printf qs("\Lui_event object=%p event=%e") p = <object> e = <event> channel = ui_event
	endif
	if StructureContains \{Structure = data
			name = set_dialogue}
		ui_set_dialogue \{value = 1}
	endif
	<data> = {object = <object> <data>}
	if (<object> = 1)
		ui :UnPause
		ui :EventCache_Add event_id = <event> event_data = <data>
	elseif (<object> = 2)
		UI_object2 :UnPause
		UI_object2 :EventCache_Add event_id = <event> event_data = <data>
	endif
endscript

script ui_event_add_params \{object = 1}
	ui_event event = menu_add_data data = <...>
endscript

script ui_event_remove_params \{object = 1}
	ui_event event = menu_remove_data data = <...>
endscript

script ui_event_add_continue \{event = menu_change
		object = 1}
	ui_event event = menu_add data = <add_state_data> object = <object>
	begin
	if NOT Is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
	ui_event event = <event> data = <continue_state_data> object = <object>
	begin
	if NOT Is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_event_block \{object = 1
		event = menu_change
		data = {
		}}
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	ui_event_spawned event = <event> data = <data> object = <object>
	Block \{type = TaskMenu_Callback}
endscript

script ui_event_wait \{object = 1
		event = menu_change
		data = {
		}}
	spawnscriptnow ui_event_wait_spawned params = {<...>}
endscript

script ui_event_wait_spawned 
	ui_event_wait_for_safe
	if GotParam \{state}
		data = {<data> state = <state>}
	endif
	spawnscriptnow ui_event_block params = <...>
endscript

script ui_event_wait_for_safe 
	Wait \{1
		gameframe}
	begin
	if NOT Is_ui_event_running
		break
	endif
	Wait \{1
		gameframe}
	repeat
endscript

script ui_event_exists_in_stack 
	RequireParams \{[
			name
		]
		all}
	ui :MenuStack_GetStackContents
	i = 0
	begin
	if ((<stack> [<i>].base_name) = <name>)
		return \{true}
	endif
	if GotParam \{above}
		if ((<stack> [<i>].base_name) = <above>)
			return \{false}
		endif
	endif
	i = (<i> + 1)
	repeat <stack_size>
	return \{false}
endscript

script ui_event_get_stack 
	ui :MenuStack_GetStackContents
	return {<...>}
endscript

script ui_state_pak_load 
	printf channel = TaskMenu 'UI: Loading pak "%s"' s = <pakname>
	SetPakManCurrent map = ui_paks pakname = <pakname>
endscript

script ui_state_anim_in_done 
	ui_event event = menu_anim_in_done object = <object>
endscript

script ui_state_anim_out_done 
	ui_event event = menu_anim_out_done object = <object>
endscript

script ui_event_get_top 
	ui_event_get_stack
	GetArraySize <stack>
	if (<array_size> > 0)
		return (<stack> [0])
	endif
endscript
