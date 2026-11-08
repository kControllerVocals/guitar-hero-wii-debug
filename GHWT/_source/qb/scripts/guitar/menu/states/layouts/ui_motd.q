
script ui_create_motd 
	make_menu_frontend \{screen = bassist
		title = qs("Message of the Day")
		no_menu
		use_all_controllers}
	if <desc_id> :Desc_ResolveAlias name = alias_body
		RemoveParameter \{exclusive_device}
		get_all_exclusive_devices
		GetScreenElementDims id = <resolved_id>
		CreateScreenElement {
			type = TextBlockElement
			parent = <resolved_id>
			dims = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * <Height>))
			just = [left top]
			pos_anchor = [left top]
			internal_just = [center center]
			font = fontgrid_text_a8
			rgba = ($menu_focus_color)
			fit_width = `scale down if larger`
			fit_height = `scale each line if larger`
			text = qs(0x0fef1c9b)
			event_handlers = [
				{pad_back generic_event_back}
			]
		}
		AssignAlias id = <id> alias = current_menu
	endif
	add_user_control_helper \{text = qs("BACK")
		button = red
		z = 100000}
endscript

script ui_destroy_motd 
	generic_ui_destroy
endscript
