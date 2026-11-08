
script ui_create_customize_character_genre 
	make_generic_menu \{title = qs("Select Genre")
		vmenu_id = create_customize_character_genre_vmenu}
	create_ui_history_header \{text = qs("Select Genre")
		num_icons = 1}
	setup_cas_menu_handlers_restricted \{vmenu_id = create_customize_character_genre_vmenu}
	GetArraySize ($Genre_List)
	i = 0
	begin
	add_generic_menu_text_item {
		text = (($Genre_List) [<i>].frontend_desc)
		pad_choose_script = <choose_script>
		additional_focus_script = select_genre
		additional_focus_params = {genre = (($Genre_List) [<i>].desc_id)}
	}
	i = (<i> + 1)
	repeat <array_size>
	menu_finish \{car_helper_text}
endscript

script ui_destroy_customize_character_genre 
	generic_ui_destroy
endscript

script select_genre 
	RequireParams \{[
			genre
		]
		all}
	EditCASAppearance target = SetGenre targetParams = {genre = <genre>}
endscript
