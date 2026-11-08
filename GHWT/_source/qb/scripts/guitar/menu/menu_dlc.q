DLC_Content_Cache_Size = 200
DLC_Content_Cache_Inodes = 8
DLC_Sort_Mode = 0
DLC_Selected_Song_Status = none
DLC_Selection_Alpha = 1
DLC_LoadingDots = 0
DLC_Canceling = 0
DLC_Canceled = 0
DLC_Song_Index_PIN = 0
DLC_Last_Focus_Id = 0
DLC_Last_Focus_Song_Index = -1
DLC_Initialization_Complete = 0
DLC_Min_Title_Width_To_Scroll = 400
DLC_Timeout_MS = 120000
ui_DLC_min_RGB_val = 128
ui_DLC_min_Wait_Time = 0.05
ui_DLC_max_Wait_Time = 0.1
ui_DLC_min_Morph_Time = 0.5
ui_DLC_max_Morph_Time = 1
ui_DLC_Set_List_RGBA = [
	1
	51
	51
	255
]
ui_DLC_Store_RGBA = [
	102
	41
	0
	255
]
ui_DLC_New_Releases_RGBA = [
	92
	2
	33
	255
]
ui_DLC_Blue_Gradient_RGBA = [
	56
	219
	226
	255
]
ui_DLC_Orange_Gradient_RGBA = [
	227
	138
	59
	255
]
DLC_Hide_Catalog = 1

script DLC_handle_error 
	if NOT GotParam \{error_canceled}
		if GotParam \{error_support_code}
			FormatText TextName = Error_text qs(0xd6d8029e) t = <Error_text> s = <error_support_code>
		endif
		if GotParam \{error_include_blocks}
			FormatText TextName = Error_text <Error_text> d = <blocks>
		endif
		if GotParam \{fatal}
			DLC_make_error_menu text = <Error_text> fatal
		else
			DLC_make_error_menu text = <Error_text>
		endif
	elseif GotParam \{fatal}
		generic_event_back
	elseif GotParam \{special_post_purchase_cancel}
		DLC_make_error_menu \{text = $wii_DLC_post_purchase_cancel_text}
	endif
endscript

script DLC_Post_Error 
	DLC_Destroy_Popup_And_Remake_Helpers
	if (<fatal> = 1)
		generic_event_back
	endif
endscript

script DLC_Popup_Make_Scrolling_Title \{scroll_speed = 80}
	if Generic_PopupElement :Desc_ResolveAlias \{name = alias_dialog_text}
		<container_id> = <resolved_id>
		ResolveScreenElementId id = {<resolved_id> child = dlog_title}
		DLC_Get_Real_Width item_id = <resolved_id>
		if (<real_width> < ($DLC_Min_Title_Width_To_Scroll))
			return
		endif
		CreateScreenElement {
			parent = <container_id>
			type = WindowElement
			id = DLC_Popup_Scrolling_Title_Window
			pos = (0.0, 15.0)
			dims = (400.0, 100.0)
			just = [center center]
			pos_anchor = [center center]
			z_priority = 525
		}
		<resolved_id> :SE_SetProps {
			parent = <id>
			just = [left top]
			pos_anchor = [left top]
			pos = (40.0, 15.0)
			single_line = true
			fit_width = expand_dims
		}
		<distance> = (<real_width> - 320)
		<time> = (<distance> / <scroll_speed>)
		<end_x> = (40 - <distance>)
		<end_pos> = ((<end_x> * (1.0, 0.0)) + (0.0, 15.0))
		RunScriptOnScreenElement id = <resolved_id> DLC_Scroll_Text params = {start_pos = (40.0, 15.0) end_pos = <end_pos> scroll_time = <time>}
	endif
endscript

script DLC_Scroll_Text 
	begin
	SE_SetProps pos = <start_pos>
	Wait \{1
		seconds}
	SE_SetProps pos = <end_pos> time = <scroll_time>
	SE_WaitProps
	Wait \{1
		seconds}
	repeat
endscript

script DLC_Get_Real_Width 
	<item_id> :SE_GetProps
	<saved_fit_witdh> = <fit_width>
	<saved_dims> = <dims>
	<saved_pos> = <pos>
	<item_id> :SE_SetProps single_line = true fit_width = `expand dims`
	<item_id> :SE_GetProps
	<real_dims> = <dims>
	<item_id> :SE_SetProps single_line = false fit_width = `scale each line if larger` dims = <saved_dims> pos = <saved_pos>
	<item_id> :SE_GetProps
	return real_width = ((<real_dims>).(1.0, 0.0))
endscript
DLC_Current_Popup_Priority = 11

script DLC_Destroy_Popup \{refocus = 1}
	destroy_generic_popup
endscript

script DLC_Destroy_Popup_And_Remake_Helpers 
	destroy_generic_popup
	DLC_Make_Helpers
endscript

script DLC_make_error_menu 
	printf 'Making error menu with message: %m' m = <text>
	if GotParam \{fatal}
		is_fatal = 1
	else
		is_fatal = 0
	endif
	create_new_generic_popup {
		popup_type = error_menu
		error_func = DLC_Post_Error
		error_func_params = {fatal = <is_fatal>}
		text = <text>
		add_user_control_helpers
	}
endscript

script DLC_Setup 
	change \{DLC_Initialization_Complete = 0}
	DLC_Initialize
	if GotParam \{error}
		return
	endif
	change \{DLC_Initialization_Complete = 1}
	DLC_Connect
	if GotParam \{error}
		return
	endif
	DLC_Handle_Title_Info
	if GotParam \{error}
		return
	endif
	DLC_Compile_Song_List
	if GotParam \{error}
		return
	endif
	DLC_Handle_Catalog_Problems
	if GotParam \{error}
		return
	endif
	change \{ui_DLC_Needs_Setup = 0}
	NetSessionFunc \{func = dlc_manifest_init}
	if NOT NetSessionFunc \{func = is_lobby_available}
		Wait \{1
			gameframe}
		<timeout> = 10.0
		ResetTimer
		begin
		if NetSessionFunc \{func = is_lobby_available}
			break
		endif
		if TimeGreaterThan <timeout>
			break
		endif
		Wait \{1
			gameframe}
		repeat
	endif
	NetSessionFunc \{obj = dlc_manifest
		func = get_demonware_DLCManifest}
	clean_up_user_control_helpers
	add_user_control_helper \{text = $wii_RA_select
		button = green
		z = 100}
	add_user_control_helper \{text = $wii_back
		button = red
		z = 100}
	add_user_control_helper \{text = $wii_DLC_visit_RA
		button = Orange
		z = 100}
endscript

script DLC_Handle_Catalog_Problems 
	DLC_Maybe_Purchase_Catalog text = ($wii_DLC_getting_catalog)
	if GotParam \{error}
		return \{error}
	endif
	<song_index> = 1
	if DLCHaveTitle
		DLCGetSongDetails \{song_index = 1}
		if (<song_status> = corrupt)
			DLCDeleteSong \{song_index = 1}
			DLCGetSongDetails \{song_index = 1}
		endif
		if (<song_status> = OWNED)
			DLCCanDownloadSong \{song_index = 1}
			if GotParam \{error}
				DLC_handle_error <...>
				return
			endif
			DisableReset
			DLCDownloadSongAsync \{song_index = 1}
			DLC_DoWait <...> text = ($wii_DLC_getting_catalog) nocancel
			if GotParam \{error}
				EnableReset
				DLC_handle_error <...>
				return
			endif
			DLCPostDownloadSong \{song_index = 1}
			UpdateContentIndex \{index = 1}
			Downloads_EnumContent \{from_EC = 1}
			EnableReset
		endif
	endif
endscript

script DLC_Initialize 
	DLCInitialize
	if GotParam \{error}
		DLC_handle_error <...> fatal = 1
		return \{error}
	endif
endscript

script DLC_Connect 
	force_fatal_cancel = 1
	DLCConnectAsync
	DLC_DoWait <...> text = ($wii_DLC_connecting_text)
	if GotParam \{error}
		DLC_handle_error <...> fatal = 1
		return \{error}
	endif
endscript

script DLC_Handle_Title_Info 
	force_fatal_cancel = 1
	fatal = 1
	DLCGrabTitleInfoAsync
	DLC_DoWait <...> text = ($wii_DLC_check_update_text)
	if GotParam \{error}
		DLC_handle_error <...>
		return \{error}
	endif
	DLCPostGrabTitleInfo
	if GotParam \{no_songs}
		DLC_handle_error Error_text = ($wii_DLC_no_songs_found) fatal
		return \{error}
	endif
	if GotParam \{update_available}
		begin
		DLCUpdateTitleLoopAsync
		if GotParam \{need_space}
			DLCPostUpdateTitleLoop
			<Error_text> = <update_error_text>
			DLC_handle_error <...>
			return \{error}
		endif
		DLC_DoWait <...> text = ($wii_DLC_get_update_text) progress_bar nocancel
		if GotParam \{error}
			DLCPostUpdateTitleLoop
			DLC_handle_error <...>
			return \{error}
		endif
		if GotParam \{done_loop}
			break
		endif
		repeat
		DLCPostUpdateTitleLoop
	endif
endscript

script DLC_Handle_Backup_Update 
	if CNTSDIsCardPresent
		CNTSDGetCatalogStatus
		if (<catalog_status> = need_backup)
			CNTSDGetBytesToBackup \{index = 1}
			CNTSDGetAvailableBytes
			if NOT GotParam \{error}
				if (<SD_Card_Bytes_Available> >= <SD_Card_Bytes_Needed>)
					DisableReset
					CNTSDBackupContent \{index = 1}
					FormatText \{TextName = long_text
						$wii_RVLCNTSD_MESSAGE_0008
						s = $wii_RA_catalog_name}
					if NOT GotParam \{error}
						RA_DoWait text = qs("") long_text = <long_text> progress_bar index = 1 nocancel
					endif
					EnableReset
				endif
			endif
			if GotParam \{error}
				DLC_handle_error <...> song_index = 1
			endif
		endif
	endif
endscript
DLC_Keep_Dots = 0

script DLC_Compile_Song_List 
	force_fatal_cancel = 1
	fatal = 1
	start_index = 0
	change \{DLC_Keep_Dots = 1}
	begin
	DLCGrabSongListAsync start_index = <start_index>
	DLC_DoWait <...> text = ($wii_DLC_getting_song_list_text)
	if GotParam \{error}
		change \{DLC_Keep_Dots = 0}
		change \{DLC_LoadingDots = 0}
		DLC_handle_error <...> fatal
		return \{error}
	endif
	DLCPostGrabSongList
	if GotParam \{done_songs}
		change \{DLC_Keep_Dots = 0}
		change \{DLC_LoadingDots = 0}
		if NOT DLCHaveTMD
			printf \{'LACKING TMD!!!'}
			begin
			DLCCheckServerTMDLoopAsync
			DLC_DoWait <...> text = ($wii_DLC_getting_song_list_text)
			if GotParam \{error}
				DLCPostCheckServerTMDLoop
				DLC_handle_error <...>
				return \{error}
			endif
			if GotParam \{done_loop}
				break
			endif
			repeat
			DLCPostCheckServerTMDLoop
		endif
		break
	endif
	repeat
endscript

script DLC_Make_Helpers 
	clean_up_user_control_helpers
	switch ($DLC_Selected_Song_Status)
		case corrupt
		<green_text> = ($wii_RA_delete)
		case PRESENT
		<green_text> = ($wii_RA_delete)
		case OWNED
		<green_text> = ($wii_DLC_redownload)
		case ARCHIVED
		<green_text> = ($wii_DLC_archived)
		case NOT_OWNED
		<green_text> = ($wii_DLC_buy)
	endswitch
	if GotParam \{green_text}
		add_user_control_helper text = <green_text> button = green z = 100
	endif
	add_user_control_helper text = ($wii_back) button = red z = 100
	add_user_control_helper text = ($wii_DLC_tabs) button = Yellow z = 100
	add_user_control_helper text = ($wii_DLC_preview) button = Blue z = 100
	add_user_control_helper text = ($wii_DLC_visit_RA) button = Orange z = 100
endscript

script DLC_Menu_Clear_Current_Menu 
	current_menu :SE_GetParentId
	SelectionHighlight :SE_SetProps alpha = 0 parent = <parent_id>
	DestroyScreenElement \{id = current_menu}
endscript

script DLC_Toggle_Sort_Mode 
	spawnscriptnow \{DLC_Toggle_Sort_Mode_Spawned}
endscript

script DLC_Toggle_Sort_Mode_Spawned 
	change DLC_Sort_Mode = (($DLC_Sort_Mode) + 1)
	if (($DLC_Sort_Mode) > 3)
		change \{DLC_Sort_Mode = 0}
	endif
	DLC_Refresh_Song_List
	DLC_Set_Sort_Mode_Text
endscript

script DLC_Set_Sort_Mode_Text 
	switch ($DLC_Sort_Mode)
		case 0
		<sort_text> = ($wii_DLC_sorting_name)
		case 1
		<sort_text> = ($wii_DLC_sorting_artist)
		case 2
		<sort_text> = ($wii_DLC_sorting_year)
		case 3
		<sort_text> = ($wii_DLC_sorting_genre)
	endswitch
	FormatText TextName = sort_text qs(0x4dd8ab86) s = ($wii_DLC_sorting_label) m = <sort_text>
	DLC_SubMenu :SE_SetProps {
		SortText_text = <sort_text>
	}
endscript

script DLC_Refresh_Song_List \{resort = 0}
	LB_Get_Selection_Info \{id = current_menu}
	<search_song_index> = ($DLC_Last_Focus_Song_Index)
	DLC_Menu_Clear_Current_Menu
	DLCGetSongListSorted resort = <resort>
	if (($DLC_Current_Secondary_Menu) < 2)
		DLC_Update_Wii_Points
	else
		DLC_Update_Blocks
	endif
	menu_props = {
		dims = (490.0, 370.0)
		just = [left top]
		internal_just = [left top]
		pos = (0.0, 0.0)
		z_priority = 4
		spacing_between = 2
	}
	if GotParam \{no_songs}
		CreateScreenElement {
			parent = DLC_Menu_Container
			type = VMenu
			<menu_props>
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound}
				{pad_down generic_menu_up_or_down_sound}
				{pad_back ui_DLC_Menu_Setup_First_Menu}
				{pad_option2 ui_DLC_Menu_Toggle_Secondary_Menu}
				{pad_l1 ui_DLC_Goto_Rock_Archive}
				{pad_select DLC_Toggle_Sort_Mode}
			]
		}
		AssignAlias id = <id> alias = current_menu
		if (($DLC_Current_Secondary_Menu) < 2)
			<text> = $wii_DLC_no_songs_found
		else
			<text> = $wii_DLC_no_songs_found_setlist
		endif
		CreateScreenElement {
			parent = current_menu
			type = DescInterface
			desc = 'DLC_NoSongs'
			autoSizeDims = true
			NoSongMessage_text = <text>
		}
		DLC_SubMenu :SE_SetProps \{SongInfoArtist_text = qs("")
			SongInfoName_text = qs("")
			SongInfoLeft_text = qs("")
			SongInfoRight_text = qs("")
			GenreHeader_text = qs("")
			GenreInfo_text = qs("")
			SongInfoContainer_alpha = 0}
		change \{DLC_Selected_Song_Status = 'none'}
		DLC_Make_Helpers
		change \{DLC_Last_Focus_Id = 0}
		LaunchEvent \{type = focus
			target = current_menu}
	else
		if (($DLC_Current_Secondary_Menu) < 2)
			DLC_SubMenu :SE_SetProps {
				SongInfoLeft_text = ($wii_DLC_song_info_buying_left_text)
				GenreHeader_text = ($wii_DLC_sorting_genre)
				SongInfoContainer_alpha = 1
			}
		else
			DLC_SubMenu :SE_SetProps {
				SongInfoLeft_text = ($wii_DLC_song_info_purchased_left_text)
				GenreHeader_text = ($wii_DLC_sorting_genre)
				SongInfoContainer_alpha = 1
			}
		endif
		<search_index> = 0
		if DLCFindRowIndexMatchingSongIndex song_index = <search_song_index>
			<start_index> = (<index> - <selected_index>)
			if (<start_index> < 0)
				<selected_index> = (<selected_index> + <start_index>)
				<start_index> = 0
			endif
		else
			<start_index> = 0
			<selected_index> = 0
		endif
		create_LB_Menu {
			start_index = <start_index>
			selected_index = <selected_index>
			parent = DLC_Menu_Container
			window_size = 9
			menu_props = <menu_props>
			menu_array_size = <num_rows>
			empty_row_props = {
				type = DescInterface
				desc = 'DLC_Empty_Row'
				dims = (490.0, 40.0)
			}
			row_script = DLC_LB_Row_Script
			choose_script = DLC_LB_Choose_Script
			option_script = DLC_LB_Option_Script
			event_handlers = [
				{pad_up generic_menu_up_or_down_sound}
				{pad_down generic_menu_up_or_down_sound}
				{pad_back ui_DLC_Menu_Setup_First_Menu}
				{pad_option2 ui_DLC_Menu_Toggle_Secondary_Menu}
				{pad_l1 ui_DLC_Goto_Rock_Archive}
				{pad_select DLC_Toggle_Sort_Mode}
			]
			focus_script = DLC_focus_song
			unfocus_script = DLC_unfocus_song
			is_header_script = DLC_LB_Is_Header
		}
		AssignAlias id = <LB_menu_id> alias = current_menu
	endif
	if (($DLC_Current_Secondary_Menu) = 2)
		DLC_SD_Spawn_Poller
	endif
endscript

script DLC_focus_song 
	Obj_GetID
	GetTags
	DLCGetSongDetails song_index = <song_index>
	if (<song_status> = OWNED)
		FormatText checksumname = DLCChecksum 'DLC%d' d = <song_index>
		if StructureContains Structure = $DLC_Menu_SD_Indices name = <DLCChecksum>
			<song_status> = ARCHIVED
		endif
	endif
	SelectionHighlight :SE_SetProps alpha = 1 pos = (0.0, 0.0) parent = <ObjID> just = [left , center] pos_anchor = [left , center]
	if NOT (<song_status> = ($DLC_Selected_Song_Status))
		change DLC_Selected_Song_Status = <song_status>
		DLC_Make_Helpers
	endif
	if (($DLC_Current_Secondary_Menu) < 2)
		if (<song_price> = 0)
			<song_price> = ($wii_DLC_Free)
		endif
		FormatText TextName = song_info qs(0x5e815e3c) y = <song_year> p = <song_price> b = <song_blocks_needed>
	else
		<status_txt> = qs("")
		switch (<song_status>)
			case NOT_OWNED
			<status_txt> = ($wii_DLC_status_not_owned)
			case OWNED
			<status_txt> = ($wii_DLC_status_missing)
			case ARCHIVED
			<status_txt> = ($wii_DLC_status_archived)
			case PRESENT
			<status_txt> = ($wii_DLC_status_present)
			case corrupt
			<status_txt> = ($wii_DLC_status_corrupt)
		endswitch
		FormatText TextName = song_info qs(0xb5b6e53f) y = <song_year> s = <status_txt> b = <song_blocks_needed>
	endif
	<caption_alpha> = 1
	if (<song_show_caption> = false)
		<caption_alpha> = 0
	endif
	DLC_SubMenu :SE_SetProps {
		SongInfoArtist_text = <song_artist>
		SongInfoName_text = <song_name>
		SongInfoRight_text = <song_info>
		GenreInfo_text = <song_genre>
		Photo_Caption_Container_alpha = <caption_alpha>
	}
	change DLC_Last_Focus_Song_Index = <song_index>
	change DLC_Last_Focus_Id = <ObjID>
endscript

script DLC_unfocus_song 
	DLC_ResetPreview
endscript

script DLC_ResetPreview 
	SongStopPreview
	DLC_Base_Interface :SE_SetProps \{AlbumCover_texture = DLC_Generic_Album}
endscript

script DLC_LB_Row_Script 
	DLCGetRowInfo index = <index>
	if StructureContains \{Structure = row_params
			header}
		params = {
			desc = 'DLC_Header_Row'
			focusable = false
			Header_Left_text = (<row_params>.header)
			Header_Right_text = (<row_params>.Header_Right)
		}
	else
		if (($DLC_Current_Secondary_Menu) < 2)
			if ((<row_params>.Song_Right) = 0)
				<song_right_txt> = ($wii_DLC_Free)
			else
				FormatText TextName = song_right_txt qs("%t") t = (<row_params>.Song_Right)
			endif
		else
			FormatText TextName = song_right_txt qs("%t") t = (<row_params>.Song_Right)
		endif
		params = {
			desc = 'DLC_Song_Row'
			focusable = true
			Song_Left_text = (<row_params>.song_name)
			Song_Right_text = <song_right_txt>
			tags = {
				song_index = (<row_params>.song_index)
			}
		}
	endif
	return params = <params>
endscript

script DLC_LB_Is_Header 
	DLCGetRowInfo index = <index>
	if StructureContains \{Structure = row_params
			header}
		return \{true}
	else
		return \{false}
	endif
endscript

script DLC_LB_Option_Script 
	GetTags
	DLC_ResetPreview
	if NOT DLCPreviewDownloadAsync song_index = <song_index>
		DLC_handle_error \{Error_text = $wii_DLC_preview_no_connect}
		return
	endif
	if NOT GotParam \{opDone}
		DLC_DoWait preview text = ($wii_DLC_get_preview_text) progress_bar
		if GotParam \{error}
			if GotParam \{error_canceled}
				DLC_Refresh_Song_List
			endif
			DLC_handle_error <...>
			DLC_Make_Helpers
			return
		endif
	endif
	DLC_Make_Helpers
	DLCPostPreviewDownload
	DLC_Base_Interface :SE_SetProps \{AlbumCover_texture = album_cover_image}
endscript

script DLC_LB_Choose_Script 
	GetTags
	DLC_choose_song song_index = <song_index>
endscript

script DLC_choose_song 
	DLCGetSongDetails song_index = <song_index>
	song_params = <...>
	if (<song_status> = OWNED)
		FormatText checksumname = DLCChecksum 'DLC%d' d = <song_index>
		if StructureContains Structure = $DLC_Menu_SD_Indices name = <DLCChecksum>
			<song_status> = ARCHIVED
		endif
	endif
	switch <song_status>
		case corrupt
		FormatText TextName = text qs(0x69bb6554) s = <song_description> m = $wii_DLC_opt_corrupt_text
		options = [
			{
				func = DLC_delete_song
				func_params = <song_params>
				text = ($wii_DLC_option_delete)
			}
			{
				func = DLC_Destroy_Popup_And_Remake_Helpers
				func_params = {}
				text = ($wii_DLC_option_cancel)
			}
		]
		case PRESENT
		FormatText TextName = text qs(0x69bb6554) s = <song_description> m = $wii_DLC_opt_deleting_text
		options = [
			{
				func = DLC_delete_song
				func_params = <song_params>
				text = ($wii_DLC_option_delete)
			}
			{
				func = DLC_Destroy_Popup_And_Remake_Helpers
				func_params = {}
				text = ($wii_DLC_option_cancel)
			}
		]
		case OWNED
		FormatText TextName = text qs(0x69bb6554) s = <song_description> m = $wii_DLC_opt_redownloading_text
		options = [
			{
				func = DLC_confirm_download_song
				func_params = ((<song_params>) + ({purchase = 0}))
				text = ($wii_DLC_option_redownload)
			}
			{
				func = DLC_Destroy_Popup_And_Remake_Helpers
				func_params = {}
				text = ($wii_DLC_option_cancel)
			}
		]
		case ARCHIVED
		FormatText TextName = text qs(0x69bb6554) s = <song_description> m = $wii_DLC_opt_archived_text
		options = [
			{
				func = DLC_Destroy_Popup_And_Remake_Helpers
				func_params = {}
				text = ($wii_ok)
			}
		]
		case NOT_OWNED
		FormatText TextName = text qs(0x69bb6554) s = <song_description> m = $wii_DLC_opt_purchasing_text
		options = [
			{
				func = DLC_confirm_download_song
				func_params = ((<song_params>) + ({purchase = 1}))
				text = ($wii_DLC_option_purchase)
			}
			{
				func = DLC_Destroy_Popup_And_Remake_Helpers
				func_params = {}
				text = ($wii_DLC_option_cancel)
			}
		]
	endswitch
	create_new_generic_popup {
		popup_type = message_options
		back_script = DLC_Destroy_Popup_And_Remake_Helpers
		title = <song_name>
		text = <text>
		options = <options>
		title_effect
		add_user_control_helpers
	}
endscript

script DLC_DoWait 
	if ((GotParam error) || (GotParam opDone))
		return
	endif
	<last_progress> = -1.0
	<timed_out> = 0
	GetStartTime
	popup_params = {
		title = ($wii_DLC_wait_header_text)
		popup_type = DLC_Wait
		text = <text>
		title_effect
		title_effect_index = 1
		add_user_control_helpers
	}
	if GotParam \{progress_bar}
		<popup_params> = ((<popup_params>) + ({progress_bar}))
	endif
	if NOT GotParam \{nocancel}
		<cancel_op> = DLC_Cancel_Op
		if GotParam \{preview}
			<cancel_op> = DLC_Cancel_Preview
		endif
		cancel_params = {
			can_cancel
			back_script = <cancel_op>
			cancel_func = <cancel_op>
		}
		<popup_params> = ((<popup_params>) + (<cancel_params>))
	endif
	create_new_generic_popup <popup_params>
	RemoveParameter \{cancel_op}
	RemoveParameter \{cancel_params}
	RemoveParameter \{popup_params}
	begin
	if NOT GotParam \{preview}
		DLCCheckAsyncOp opId = <opId>
	else
		DLCPreviewDownloadCheck
	endif
	if ((GotParam opDone) || (GotParam error))
		break
	endif
	if GotParam \{progress_bar}
		DLC_Update_loading opProgress = <opProgress>
	else
		DLC_Update_loading
	endif
	if (<timed_out> = 0)
		if (<opProgress> != <last_progress>)
			GetStartTime
			<last_progress> = <opProgress>
		endif
		GetElapsedTime StartTime = <StartTime>
		if (<ElapsedTime> > $DLC_Timeout_MS)
			if NOT DLCIsDWCOkay
				<timed_out> = 1
				if NOT GotParam \{preview}
					DLCCancelOp
				else
					DLCCancelPreview
				endif
			endif
		endif
		if (<timed_out> = 0)
			if (($DLC_Canceling) = 1)
				RemoveParameter \{progress_bar}
				DLC_Reset_Loading
				if NOT GotParam \{preview}
					DLC_DoWait text = ($wii_DLC_canceling_text) nocancel opId = <opId>
				else
					DLC_DoWait text = ($wii_DLC_canceling_text) nocancel preview
				endif
				if GotParam \{force_fatal_cancel}
					if (<force_fatal_cancel> = 1)
						if NOT GotParam \{error}
							printf \{'FORCED A CANCEL ERROR!!!'}
							error = 1
							error_canceled = 1
						endif
					endif
				endif
				break
			endif
		endif
	endif
	WaitOneGameFrame
	repeat
	DLC_Reset_Loading
	if (<timed_out> = 1)
		RemoveParameter \{error_canceled}
		error = $wii_DLC_Timeout_error
		Error_text = $wii_DLC_Timeout_error
		fatal = 1
	endif
	if GotParam \{error}
		return <...>
	endif
endscript

script DLC_Cancel_Preview 
	if NOT ($DLC_Canceling = 1)
		change \{DLC_Canceling = 1}
		DLCCancelPreview
	endif
endscript

script DLC_Cancel_Op 
	if NOT ($DLC_Canceling = 1)
		change \{DLC_Canceling = 1}
		DLCCancelOp
	endif
endscript

script DLC_Reset_Loading 
	change \{DLC_Canceling = 0}
	if ($DLC_Keep_Dots = 0)
		change \{DLC_LoadingDots = 0}
	endif
	DLC_Destroy_Popup
endscript

script DLC_Update_loading 
	change DLC_LoadingDots = (($DLC_LoadingDots) + 1)
	dotText = qs("\L")
	if (($DLC_LoadingDots) > 79)
		change \{DLC_LoadingDots = 0}
	else
		count = (($DLC_LoadingDots) / 20)
		if (<count> > 0)
			begin
			FormatText TextName = dotText qs(0xf606f43e) t = <dotText>
			repeat <count>
		endif
	endif
	if ScreenElementExists \{id = Generic_PopupElement}
		Generic_PopupElement :SE_SetProps wait_dots_text = <dotText>
	endif
	if GotParam \{opProgress}
		if ScreenElementExists \{id = Generic_PopupElement}
			Generic_PopupElement :SE_SetProps bar_sprite_dims = ((<opProgress> * (4.2, 0.0)) + (0.0, 25.0))
		endif
	endif
endscript

script DLC_Update_Wii_Points 
	DLCGetWiiPoints
	if GotParam \{error}
		DLC_handle_error <...>
		return
	endif
	<scale> = (1.0, 1.0)
	<rgba> = [255 126 0 255]
	FormatText TextName = pts_text qs("%p") p = <wii_points>
	DLC_Base_Interface :SE_SetProps AvailableLabel_text = ($wii_DLC_available_points) AvailableText_text = <pts_text> AvailableText_rgba = <rgba> AvailableText_scale = <scale>
endscript

script DLC_Update_Blocks 
	DLCGetFreeBlocks
	if GotParam \{error}
		DLC_handle_error <...>
		return
	endif
	<scale> = (1.0, 1.0)
	<rgba> = [255 126 0 255]
	if (<num_blocks> < ($DLC_Content_Cache_Size))
		<scale> = (1.1, 1.1)
		<rgba> = [149 33 33 255]
	endif
	FormatText TextName = blocks_text qs("%b") b = <num_blocks>
	DLC_Base_Interface :SE_SetProps AvailableLabel_text = ($wii_DLC_available_blocks) AvailableText_text = <blocks_text> AvailableText_rgba = <rgba> AvailableText_scale = <scale>
endscript

script DLC_confirm_download_song 
	DLC_Destroy_Popup
	DLCGetWiiPoints
	DLCGetFreeBlocks
	DLCCanDownloadSong song_index = <song_index>
	if GotParam \{error}
		DLC_handle_error <...>
		return
	endif
	DLCGetSongDetails song_index = <song_index>
	if (<purchase> = 0)
		<song_price> = 0
	endif
	FormatText {
		TextName = middle_text
		qs(0x6e833162)
		a = ($wii_DLC_Wii_Points)
		b = <wii_points>
		c = <song_price>
		d = (<wii_points> - <song_price>)
	}
	FormatText {
		TextName = right_text
		qs(0x6e833162)
		a = ($wii_DLC_blocks)
		b = <num_blocks>
		c = <song_blocks_needed>
		d = <song_blocks_after_download>
	}
	create_new_generic_popup {
		popup_type = DLC_Confirmation
		title = ($wii_DLC_purchase_confirm_header)
		left_text = $wii_DLC_confirm_label_column_text
		middle_text = <middle_text>
		right_text = <right_text>
		confirm_func = DLC_Download_Song
		confirm_params = {song_index = <song_index> purchase = <purchase>}
		back_script = DLC_Cancel_At_Confirm
		cancel_func = DLC_Cancel_At_Confirm
		title_effect
		add_user_control_helpers
	}
endscript

script DLC_Cancel_At_Confirm 
	DLCClearPin
	DLC_Destroy_Popup_And_Remake_Helpers
endscript

script DLC_pin_callback 
	if (<PIN> = '')
		DLC_Make_Helpers
		return
	endif
	DLCEnterPin PIN = <PIN>
	if GotParam \{error}
		DLC_handle_error <...>
		return
	endif
	DLC_Make_Helpers
	DLC_Download_Song song_index = ($DLC_Song_Index_PIN) purchase = 1
endscript

script DLC_Maybe_Purchase_Catalog text = ($wii_DLC_purchasing_text)
	if NOT (DLCTitlePurchased)
		return
	endif
	DLCGetSongDetails \{song_index = 1}
	if (<song_status> = NOT_OWNED)
		DLCPurchaseSongAsync \{song_index = 1}
		if GotParam \{error}
			return <...>
		endif
		DLC_DoWait <...> nocancel
		if GotParam \{error}
			return <...> fatal
		endif
		DLCPostPurchaseSong \{song_index = 1}
		UpdateContentIndex \{index = 1}
	endif
endscript

script DLC_Download_Song 
	DLC_Destroy_Popup
	DLCCanDownloadSong song_index = <song_index>
	if GotParam \{error}
		DLCClearPin
		DLC_handle_error <...>
		return
	endif
	DisableReset
	if (<purchase> = 1)
		DLCPurchaseSongAsync song_index = <song_index>
		if GotParam \{error}
			EnableReset
			if GotParam \{error_PIN}
				change DLC_Song_Index_PIN = <song_index>
				create_new_generic_popup {
					popup_type = dlc_pin
					callback = DLC_pin_callback
					text = <Error_text>
					title = $wii_DLC_PIN_title
					title_effect
				}
			else
				DLCClearPin
				DLC_handle_error <...>
			endif
			return
		endif
		DLC_DoWait <...> text = ($wii_DLC_purchasing_text) nocancel
		if GotParam \{error_PIN}
			EnableReset
			printf \{'PIN needed (2)'}
			change DLC_Song_Index_PIN = <song_index>
			create_new_generic_popup {
				popup_type = dlc_pin
				callback = DLC_pin_callback
				text = <Error_text>
				title = $wii_DLC_PIN_title
				title_effect
			}
			return
		elseif GotParam \{error}
			EnableReset
			DLCClearPin
			DLC_handle_error <...> fatal
			return
		endif
		DLCPostPurchaseSong song_index = <song_index>
		if (($DLC_Hide_Catalog) = 0)
			DLC_Maybe_Purchase_Catalog \{text = $wii_DLC_purchasing_catalog}
		else
			DLC_Maybe_Purchase_Catalog
		endif
		if GotParam \{error}
			EnableReset
			DLCClearPin
			DLC_handle_error <...>
			return
		endif
		DLCClearPin
	endif
	if NOT DLCHaveTitle
		DLCDownloadTitleAsync song_index = <song_index>
		DLC_DoWait <...> text = ($wii_DLC_downloading_text) nocancel
		if GotParam \{error}
			EnableReset
			DLC_handle_error <...>
			return
		endif
		DLCPostDownloadTitle song_index = <song_index>
	endif
	DLCDownloadSongAsync song_index = <song_index>
	DLC_DoWait <...> text = ($wii_DLC_downloading_text) progress_bar
	if GotParam \{error}
		EnableReset
		if GotParam \{error_canceled}
			if (<purchase> = 1)
				<special_post_purchase_cancel> = 1
			endif
			DLC_Refresh_Song_List \{resort = 1}
			DLC_handle_error <...>
			DLC_Make_Helpers
		else
			DLC_handle_error <...>
		endif
		return
	endif
	EnableReset
	DLCPostDownloadSong song_index = <song_index>
	DLCGetSongDetails song_index = <song_index>
	if (<song_status> = corrupt)
		DLC_handle_error \{Error_text = $wii_DLC_post_download_corruption}
	endif
	UpdateContentIndex \{index = 1}
	Downloads_EnumContent \{from_EC = 1}
	CNTSDCardWasEjected
	if CNTSDIsCardPresent
		DLC_Handle_SD_Post_Download song_index = <song_index>
	else
		DLC_Refresh_Song_List \{resort = 1}
	endif
endscript

script DLC_Post_Download_Backup 
	DLCGetSongDetails song_index = <song_index>
	if (<song_index> > 1)
		CNTSDCountSDSongs exclude_index = <song_index>
		if GotParam \{error}
			create_new_generic_popup {
				popup_type = error_menu
				text = <error>
				error_func = DLC_Post_Download_No_Backup
				add_user_control_helpers
			}
			return
		endif
		if ((<SD_Song_Count> + 1) > $DLC_Max_Songs_On_SD)
			FormatText \{TextName = tmpError
				$wii_DLC_SD_Too_Many_Songs
				d = $DLC_Max_Songs_On_SD}
			FormatText TextName = error $wii_DLC_SD_Transfer_Too_Many_Songs s = <tmpError>
			create_new_generic_popup {
				popup_type = error_menu
				text = <error>
				error_func = DLC_Post_Download_No_Backup
				add_user_control_helpers
			}
			return
		endif
	endif
	DisableReset
	CNTSDBackupContent index = <song_index>
	FormatText TextName = long_text $wii_RVLCNTSD_MESSAGE_0008 s = <song_name>
	if NOT GotParam \{error}
		RA_DoWait text = qs("") long_text = <long_text> progress_bar index = <song_index>
	endif
	EnableReset
	if GotParam \{error}
		FormatText TextName = errorText qs(0x69ff815a) a = <error> b = $wii_DLC_backup_post_error
		FormatText TextName = errorText <errorText> s = <song_name>
		create_new_generic_popup {
			popup_type = error_menu
			text = <errorText>
			error_func = DLC_Post_Download_No_Backup
			add_user_control_helpers
		}
		return
	endif
	FormatText checksumname = DLCChecksum 'DLC%d' d = (<song_index>)
	change DLC_Menu_SD_Indices = (($DLC_Menu_SD_Indices) + {<DLCChecksum>})
	DLC_delete_song song_index = <song_index>
endscript

script DLC_Post_Download_No_Backup 
	DLC_Destroy_Popup_And_Remake_Helpers
	DLC_Refresh_Song_List \{resort = 1}
endscript

script DLC_SD_Post_Download_Ejected 
	destroy_generic_popup
	DLCGetSongDetails song_index = <song_index>
	FormatText \{TextName = Error_text
		qs(0x69ff815a)
		a = $wii_RA_message_SD_Card_Removed
		b = $wii_DLC_backup_post_error}
	FormatText TextName = Error_text <Error_text> s = <song_name>
	create_new_generic_popup {
		popup_type = error_menu
		text = <Error_text>
		error_func = DLC_Post_Download_No_Backup
		add_user_control_helpers
	}
endscript

script DLC_SD_Post_Download_Eject_Poller 
	DLCGetSongDetails song_index = <song_index>
	begin
	if CNTSDCardWasEjected
		spawnscriptnow DLC_SD_Post_Download_Ejected params = {song_index = <song_index>}
		return
	endif
	WaitOneGameFrame
	repeat
endscript

script DLC_Handle_SD_Post_Download 
	CNTSDGetCatalogStatus
	if ((<catalog_status> = wrong_wii) || (GotParam error))
		DLC_Post_Download_No_Backup
		return
	endif
	DLCGetSongDetails song_index = <song_index>
	CNTSDGetBytesToBackup index = <song_index>
	CNTSDGetAvailableBytes
	if NOT GotParam \{error}
		if (<SD_Card_Bytes_Available> < <SD_Card_Bytes_Needed>)
			<error> = 1
		endif
	endif
	if CNTSDCardWasEjected
		<error> = 1
	endif
	if GotParam \{error}
		DLC_Post_Download_No_Backup
		return
	endif
	FormatText TextName = text $wii_DLC_backup_text s = <song_name>
	create_new_generic_popup {
		popup_type = yes_no_menu
		yes_func = DLC_Post_Download_Backup
		yes_func_params = {song_index = <song_index>}
		no_func = DLC_Post_Download_No_Backup
		back_script = DLC_Post_Download_No_Backup
		title = $wii_DLC_backup_title
		text = <text>
		title_effect
		add_user_control_helpers
	}
	RunScriptOnScreenElement id = Generic_PopupElement DLC_SD_Post_Download_Eject_Poller params = {song_index = <song_index>}
endscript

script DLC_delete_song 
	DLC_Destroy_Popup
	DLCDeleteSong song_index = <song_index>
	DLC_Refresh_Song_List \{resort = 1}
	if GotParam \{error}
		DLC_handle_error <...>
		return
	endif
endscript

script DLC_Deinitialize 
	if (($DLC_Initialization_Complete) = 1)
		Downloads_EnumContent \{from_EC = 1
			no_catalog_popup}
	endif
	change \{DLC_Initialization_Complete = 0}
	DLCShutdown
	change is_network_game = ($ui_DLC_Should_Restore_Network_Game)
	if ($ui_DLC_We_Disabled_HB = 1)
		set_home_button_allowed
	endif
endscript
DLC_Menu_SD_Indices = {
}
DLC_Menu_SD_Indices_Valid = 0

script DLC_SD_Spawn_Poller 
	if CNTSDIsCardPresent
		RunScriptOnScreenElement \{id = current_menu
			DLC_SD_Remove_Poller}
	elseif ($DLC_Menu_SD_Indices_Valid = 1)
		RunScriptOnScreenElement \{id = current_menu
			DLC_SD_Remove_Poller}
	else
		RunScriptOnScreenElement \{id = current_menu
			DLC_SD_Insert_Poller}
	endif
endscript

script DLC_SD_Insert_Poller 
	WaitOneGameFrame
	begin
	if ScreenElementExists \{id = Generic_PopupElement}
		Wait \{4
			gameframes}
	else
		if CNTSDIsCardPresent
			CNTSDCardWasEjected
			if DLC_Enumerate_SD
				change \{DLC_Menu_SD_Indices_Valid = 1}
				spawnscriptnow \{DLC_Refresh_Song_List}
			else
				change \{DLC_Menu_SD_Indices_Valid = 0}
				change \{DLC_Menu_SD_Indices = {
					}}
				DLC_SD_Spawn_Poller
			endif
			break
		endif
		WaitOneGameFrame
	endif
	repeat
endscript

script DLC_SD_Remove_Poller 
	WaitOneGameFrame
	begin
	if CNTSDCardWasEjected
		if (($DLC_Menu_SD_Indices_Valid) = 1)
			change \{DLC_Menu_SD_Indices_Valid = 0}
			change \{DLC_Menu_SD_Indices = {
				}}
			spawnscriptnow \{DLC_Refresh_Song_List}
		else
			DLC_SD_Spawn_Poller
		endif
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script DLC_Enumerate_SD 
	<index_array_size> = 0
	change \{DLC_Menu_SD_Indices = {
		}}
	CNTSDIsCardUsable
	if NOT GotParam \{error}
		CNTSDGetContentIndices
		if NOT GotParam \{error}
			GetArraySize <index_array>
			<index_array_size> = <array_size>
			if (<index_array_size> = 0)
				return \{false}
			endif
			CNTSDGetCatalogStatus
			if (<catalog_status> = wrong_wii)
				return \{false}
			endif
			<i> = 0
			begin
			FormatText checksumname = DLCChecksum 'DLC%d' d = (<index_array> [<i>])
			change DLC_Menu_SD_Indices = (($DLC_Menu_SD_Indices) + {<DLCChecksum>})
			<i> = (<i> + 1)
			repeat <index_array_size>
		else
			return \{false}
		endif
	else
		return \{false}
	endif
	if CNTSDCardWasEjected
		return \{false}
	endif
	return \{true}
endscript

script DLC_DebugSetProps \{node = DLC_Base_Interface}
	params = <...>
	if NOT GotParam \{item}
		printf \{'Missing "item" parameter...'}
		return
	endif
	if DLCDebugFindItem item = <item> node = <node>
		RemoveComponent \{name = item
			structure_name = params}
		RemoveComponent \{name = node
			structure_name = params}
		if NOT StructureContains Structure = $DLC_Debug_Change_Struct name = <local_id>
			AppendStruct struct = DLC_Debug_Change_Struct field = <local_id> params = <params> globalstruct
		else
			<struct> = (($DLC_Debug_Change_Struct).<local_id>)
			UpdateStructElement struct = $DLC_Debug_Change_Struct element = <local_id> value = ((<struct>) + (<params>))
			change DLC_Debug_Change_Struct = <newstruct>
		endif
		<found_id> :SE_SetProps <params>
		DLC_DebugPrintProps item = <found_id>
		AssignAlias alias = Last_Found_Item id = <found_id>
	else
		printf \{'Failed to find item'}
	endif
endscript

script DLC_DebugPrintProps 
	<item> :SE_GetProps
	RemoveParameter \{item}
	printstruct <...>
endscript
DLC_Debug_Change_Struct = {
}

script DLC_DumpChanges 
	printstruct ($DLC_Debug_Change_Struct)
endscript
