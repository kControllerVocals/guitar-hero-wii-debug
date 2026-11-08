
script LB_Default_Is_Header 
	return \{false}
endscript

script LB_Get_Selection_Info 
	<id> :GetTags
	if NOT GotParam \{tag_selected_index}
		<tag_selected_index> = 0
	endif
	if NOT GotParam \{selected_element}
		<selected_element> = 0
	endif
	return selected_index = <tag_selected_index> selected_element = <selected_element>
endscript

script create_LB_Menu \{start_index = 0
		selected_index = 0
		is_header_script = LB_Default_Is_Header}
	RequireParams \{[
			row_script
			empty_row_props
			choose_script
			focus_script
			unfocus_script
		]
		all}
	if NOT GotParam \{event_handlers}
		event_handlers = []
	endif
	<scroll_handlers> = [
		{scroll_reached_start LB_Menu_Start_Reached}
		{scroll_reached_end LB_Menu_End_Reached}
	]
	<event_handlers> = (<event_handlers> + <scroll_handlers>)
	CreateScreenElement {
		type = VMenu
		parent = <parent>
		event_handlers = <event_handlers>
		dont_allow_wrap
		allow_wrap = false
		fit_major = `keep dims`
		<menu_props>
	}
	<menu_id> = <id>
	if (<menu_array_size> < <window_size>)
		<window_size> = <menu_array_size>
	endif
	<bottom_offset_adjust> = (<menu_array_size> - (<start_index> + <window_size>))
	if (<bottom_offset_adjust> < 0)
		<start_index> = (<start_index> + <bottom_offset_adjust>)
		<selected_index> = (<selected_index> - <bottom_offset_adjust>)
	endif
	<id> :SetTags {
		menu_array_size = <menu_array_size>
		selected_element = 0
		window_size = <window_size>
		row_create_script = <row_script>
		focus_script = <focus_script>
		unfocus_script = <unfocus_script>
		is_header_script = <is_header_script>
	}
	<index> = 0
	<myText> = qs("")
	row_event_handlers = [
		{focus LB_Menu_Item_Focus}
		{unfocus LB_Menu_Item_Unfocus}
		{pad_choose <choose_script>}
	]
	if GotParam \{option_script}
		<tmp> = [{pad_option <option_script>}]
		<row_event_handlers> = (<row_event_handlers> + <tmp>)
	endif
	begin
	FormatText checksumname = myId 'LB_Row_%d' d = <index> AddToStringLookup = true
	CreateScreenElement {
		id = <myId>
		parent = <menu_id>
		event_handlers = <row_event_handlers>
		<empty_row_props>
	}
	<index> = (<index> + 1)
	repeat <window_size>
	LaunchEvent type = focus target = <menu_id>
	LB_Menu_Redraw menu = <menu_id> start_index = <start_index> selected_index = <selected_index>
	return LB_menu_id = <menu_id>
endscript

script LB_Menu_Redraw \{selected_index = 0}
	<menu> :GetTags
	<max_index> = (<menu_array_size> - 1)
	<end_index> = (<start_index> + (<window_size> - 1))
	if (<end_index> > <max_index>)
		<end_index> = <max_index>
	endif
	GetScreenElementChildren id = <menu>
	<menu_index> = 0
	<array_index> = <start_index>
	begin
	<child> = (<children> [<menu_index>])
	<row_create_script> index = <array_index>
	<child> :SE_SetProps <params>
	<child> :SetTags element_num = <array_index>
	<menu_index> = (<menu_index> + 1)
	<array_index> = (<array_index> + 1)
	if (<array_index> > <end_index>)
		break
	endif
	repeat
	LaunchEvent type = unfocus target = <menu>
	LaunchEvent type = focus target = <menu> data = {child_index = <selected_index>}
endscript

script LB_Menu_Start_Reached 
	<menu> :GetTags
	if NOT <menu> :Menu_SelectedIndexIs first
		<selected_element> = (<selected_element> - 1)
	endif
	if (<selected_element> <= 0)
		<start_index> = (<menu_array_size> - <window_size>)
		<selected_index> = (<window_size> -1)
	else
		<start_index> = (<selected_element> - 1)
		<selected_index> = 0
	endif
	LB_Menu_Redraw menu = <menu> start_index = <start_index> selected_index = <selected_index>
endscript

script LB_Menu_End_Reached 
	<menu> :GetTags
	if NOT <menu> :Menu_SelectedIndexIs last
		<selected_element> = (<selected_element> + 1)
	endif
	<max_index> = (<menu_array_size> - 1)
	if (<selected_element> >= <max_index>)
		<start_index> = 0
		<selected_index> = 0
	else
		if <is_header_script> index = (<selected_element> + 1)
			<selected_element> = (<selected_element> + 1)
		endif
		<start_index> = ((<selected_element> + 2) - <window_size>)
		<selected_index> = (<window_size> - 1)
	endif
	LB_Menu_Redraw menu = <menu> start_index = <start_index> selected_index = <selected_index>
endscript

script LB_Menu_Item_Focus 
	GetTags
	SE_GetParentId
	<parent_id> :SetTags selected_element = <element_num>
	<parent_id> :GetTags
	if <parent_id> :Menu_SelectedIndexIs first
		if NOT (<element_num> = 0)
			if <is_header_script> index = (<element_num> - 1)
				SpawnScriptLater LB_Menu_Redraw params = {menu = <parent_id> start_index = (<element_num> -1) selected_index = 1}
				return
			endif
		endif
	endif
	<parent_id> :GetTags
	<focus_script>
endscript

script LB_Menu_Item_Unfocus 
	SE_GetParentId
	<parent_id> :GetTags
	<unfocus_script>
endscript
