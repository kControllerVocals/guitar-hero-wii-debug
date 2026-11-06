
script lb_default_is_header 
	return \{false}
endscript

script lb_get_selection_info 
	<id> :gettags
	if NOT gotparam \{tag_selected_index}
		<tag_selected_index> = 0
	endif
	if NOT gotparam \{selected_element}
		<selected_element> = 0
	endif
	return selected_index = <tag_selected_index> selected_element = <selected_element>
endscript

script create_lb_menu \{start_index = 0
		selected_index = 0
		is_header_script = lb_default_is_header}
	requireparams \{[
			row_script
			empty_row_props
			choose_script
			focus_script
			unfocus_script
		]
		all}
	if NOT gotparam \{event_handlers}
		event_handlers = []
	endif
	<scroll_handlers> = [
		{scroll_reached_start lb_menu_start_reached}
		{scroll_reached_end lb_menu_end_reached}
	]
	<event_handlers> = (<event_handlers> + <scroll_handlers>)
	createscreenelement {
		type = vmenu
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
	<id> :settags {
		menu_array_size = <menu_array_size>
		selected_element = 0
		window_size = <window_size>
		row_create_script = <row_script>
		focus_script = <focus_script>
		unfocus_script = <unfocus_script>
		is_header_script = <is_header_script>
	}
	<index> = 0
	<mytext> = qs(0x00000000)
	row_event_handlers = [
		{focus lb_menu_item_focus}
		{unfocus lb_menu_item_unfocus}
		{pad_choose <choose_script>}
	]
	if gotparam \{option_script}
		<tmp> = [{pad_option <option_script>}]
		<row_event_handlers> = (<row_event_handlers> + <tmp>)
	endif
	begin
	formattext checksumname = myid 'LB_Row_%d' d = <index> addtostringlookup = true
	createscreenelement {
		id = <myid>
		parent = <menu_id>
		event_handlers = <row_event_handlers>
		<empty_row_props>
	}
	<index> = (<index> + 1)
	repeat <window_size>
	launchevent type = focus target = <menu_id>
	lb_menu_redraw menu = <menu_id> start_index = <start_index> selected_index = <selected_index>
	return lb_menu_id = <menu_id>
endscript

script lb_menu_redraw \{selected_index = 0}
	<menu> :gettags
	<max_index> = (<menu_array_size> - 1)
	<end_index> = (<start_index> + (<window_size> - 1))
	if (<end_index> > <max_index>)
		<end_index> = <max_index>
	endif
	getscreenelementchildren id = <menu>
	<menu_index> = 0
	<array_index> = <start_index>
	begin
	<child> = (<children> [<menu_index>])
	<row_create_script> index = <array_index>
	<child> :se_setprops <params>
	<child> :settags element_num = <array_index>
	<menu_index> = (<menu_index> + 1)
	<array_index> = (<array_index> + 1)
	if (<array_index> > <end_index>)
		break
	endif
	repeat
	launchevent type = unfocus target = <menu>
	launchevent type = focus target = <menu> data = {child_index = <selected_index>}
endscript

script lb_menu_start_reached 
	<menu> :gettags
	if NOT <menu> :menu_selectedindexis first
		<selected_element> = (<selected_element> - 1)
	endif
	if (<selected_element> <= 0)
		<start_index> = (<menu_array_size> - <window_size>)
		<selected_index> = (<window_size> -1)
	else
		<start_index> = (<selected_element> - 1)
		<selected_index> = 0
	endif
	lb_menu_redraw menu = <menu> start_index = <start_index> selected_index = <selected_index>
endscript

script lb_menu_end_reached 
	<menu> :gettags
	if NOT <menu> :menu_selectedindexis last
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
	lb_menu_redraw menu = <menu> start_index = <start_index> selected_index = <selected_index>
endscript

script lb_menu_item_focus 
	gettags
	se_getparentid
	<parent_id> :settags selected_element = <element_num>
	<parent_id> :gettags
	if <parent_id> :menu_selectedindexis first
		if NOT (<element_num> = 0)
			if <is_header_script> index = (<element_num> - 1)
				spawnscriptlater lb_menu_redraw params = {menu = <parent_id> start_index = (<element_num> -1) selected_index = 1}
				return
			endif
		endif
	endif
	<parent_id> :gettags
	<focus_script>
endscript

script lb_menu_item_unfocus 
	se_getparentid
	<parent_id> :gettags
	<unfocus_script>
endscript
