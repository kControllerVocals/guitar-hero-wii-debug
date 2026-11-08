freestyle_guitar_pos = (970.0, 600.0)
freestyle_guitar_z_bg = 5.0
freestyle_guitar_z_fg = 6.0
freestyle_guitar_gui_gem_start_x = -39
freestyle_guitar_gui_gem_start_y = 25
freestyle_guitar_gui_gem_spacing_x = 21
freestyle_guitar_stop_loop_button_pos = (-120.0, 56.0)
freestyle_guitar_gui_section_pos = (-3.0, -11.0)
freestyle_guitar_gui_section_scale = 0.8

script freestyle_init_guitar 
	CreateScreenElement \{id = freestyle_guitar_container
		type = ContainerElement
		parent = freestyle_hud
		rgba = [
			255
			255
			255
			255
		]
		pos = (0.0, 0.0)}
	CreateScreenElement \{id = freestyle_guitar_gui_container
		type = ContainerElement
		pos = $freestyle_guitar_pos
		parent = freestyle_guitar_container}
	CreateScreenElement \{id = freestyle_guitar_gui_bg
		type = SpriteElement
		parent = freestyle_guitar_gui_container
		texture = FreestyleGuitarBG
		rgba = [
			255
			255
			255
			255
		]
		pos = (0.0, 0.0)
		just = [
			center
			center
		]
		z_priority = $freestyle_guitar_z_bg}
	CreateScreenElement \{id = freestyle_guitar_gui_section
		type = TextElement
		parent = freestyle_guitar_gui_container
		text = qs("Chorus 1")
		rgba = [
			255
			255
			255
			255
		]
		font = grid_title_A1
		pos = $freestyle_guitar_gui_section_pos
		scale = $freestyle_guitar_gui_section_scale
		z_priority = $freestyle_guitar_z_fg}
	i = 0
	begin
	FormatText checksumname = element_id 'freestyle_guitar_gui_gem_%n' n = <i> AddToStringLookup = true
	FormatText checksumname = element_texture 'CardGem%a' a = ($freestyle_card_gem_names [(<i> + 1)]) AddToStringLookup = true
	xpos = ($freestyle_guitar_gui_gem_start_x + ($freestyle_guitar_gui_gem_spacing_x * <i>))
	ypos = ($freestyle_guitar_gui_gem_start_y)
	element_pos = ((<xpos> * (1.0, 0.0)) + (<ypos> * (0.0, 1.0)))
	CreateScreenElement {
		id = <element_id>
		type = SpriteElement
		parent = freestyle_guitar_gui_container
		texture = <element_texture>
		rgba = [255 255 255 255]
		pos = <element_pos>
		just = [center center]
		z_priority = $freestyle_guitar_z_fg
		hide
	}
	i = (<i> + 1)
	repeat 5
	freestyle_hud_create_button_prompt \{id = freestyle_guitar_gui_stop_loop_button
		pos = $freestyle_guitar_stop_loop_button_pos
		text = $wii_freestyle_stop_loop
		buttonchar = qs("\L\b9")
		parent = freestyle_guitar_gui_container
		z_priority = $freestyle_guitar_z_fg}
endscript

script freestyle_destroy_guitar 
	DestroyScreenElement \{id = freestyle_guitar_container}
endscript

script freestyle_update_guitar_gui_lefty \{lefty = false}
	if (<lefty> = false)
		<flip> = 0
	else
		<flip> = 1
	endif
	i = 0
	begin
	FormatText checksumname = element_id 'freestyle_guitar_gui_gem_%n' n = <i> AddToStringLookup = true
	if (<lefty> = false)
		xpos = ($freestyle_guitar_gui_gem_start_x + ($freestyle_guitar_gui_gem_spacing_x * <i>))
	else
		xpos = ($freestyle_guitar_gui_gem_start_x + ($freestyle_guitar_gui_gem_spacing_x * (4 - <i>)))
	endif
	ypos = ($freestyle_guitar_gui_gem_start_y)
	element_pos = ((<xpos> * (1.0, 0.0)) + (<ypos> * (0.0, 1.0)))
	SetScreenElementProps {
		id = <element_id>
		pos = <element_pos>
	}
	i = (<i> + 1)
	repeat 5
endscript

script freestyle_hide_guitar_ui 
	freestyle_hide_card_effects
	SetScreenElementProps \{id = $freestyle_card_container_id
		hide}
	SetScreenElementProps \{id = freestyle_tilt_meter
		hide}
	SetScreenElementProps \{id = freestyle_tilt_meter2
		hide}
	SetScreenElementProps \{id = freestyle_highway_container
		hide}
	SetScreenElementProps \{id = freestyle_guitar_gui_container
		hide}
	SetScreenElementProps \{id = freestyle_guitar_signin
		unhide}
endscript

script freestyle_show_guitar_ui 
	SetScreenElementProps \{id = freestyle_tilt_meter
		unhide}
	SetScreenElementProps \{id = freestyle_tilt_meter2
		unhide}
	SetScreenElementProps \{id = freestyle_highway_container
		unhide}
	SetScreenElementProps \{id = freestyle_guitar_gui_container
		unhide}
	SetScreenElementProps \{id = freestyle_guitar_signin
		hide}
endscript

script freestyle_update_loops 
	button = 0
	if (<event_mask> = -1)
		begin
		FormatText checksumname = name_hud 'freestyle_guitar_gui_gem_%n' n = <button> AddToStringLookup = true
		SetScreenElementProps id = <name_hud> hide
		<button> = (<button> + 1)
		repeat 5
		SetScreenElementProps \{id = freestyle_guitar_gui_stop_loop_button
			hide}
	else
		begin
		button_mask = ($freestyle_highway_gem_masks [<button>])
		FormatText checksumname = name_hud 'freestyle_guitar_gui_gem_%n' n = <button> AddToStringLookup = true
		if (<button_mask> && <event_mask>)
			SetScreenElementProps id = <name_hud> unhide
		else
			SetScreenElementProps id = <name_hud> hide
		endif
		<button> = (<button> + 1)
		repeat 5
		SetScreenElementProps \{id = freestyle_guitar_gui_stop_loop_button
			unhide}
	endif
endscript
