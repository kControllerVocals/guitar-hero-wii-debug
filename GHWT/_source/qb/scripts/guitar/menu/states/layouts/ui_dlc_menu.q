ui_DLC_Should_Restore_Network_Game = 0
ui_DLC_Needs_Setup = 0
ui_DLC_Menu_SubMenu = first
ui_DLC_We_Disabled_HB = 0

script ui_init_DLC_menu 
	SpawnScriptLater \{Menu_Music_Off}
	change \{ui_DLC_Menu_SubMenu = first}
	change \{ui_DLC_Needs_Setup = 1}
	change ui_DLC_Should_Restore_Network_Game = ($is_network_game)
	get_home_button_allowed
	change ui_DLC_We_Disabled_HB = (1 - <disabled>)
	set_home_button_notallowed
	change \{is_network_game = 0}
endscript

script ui_deinit_DLC_menu 
	SpawnScriptLater \{menu_music_on}
	SpawnScriptLater \{DLC_Deinitialize}
endscript
ui_DLC_DWC_Check_Popup_Frame_Count = 0

script ui_DLC_Poll_DWC 
	Wait \{4
		gameframes}
	begin
	if ScreenElementExists \{id = Generic_PopupElement}
		change \{ui_DLC_DWC_Check_Popup_Frame_Count = 0}
	elseif ($ui_DLC_DWC_Check_Popup_Frame_Count < 4)
		change ui_DLC_DWC_Check_Popup_Frame_Count = ($ui_DLC_DWC_Check_Popup_Frame_Count + 1)
	elseif NOT DLCIsDWCOkay
		DLC_handle_error Error_text = ($wii_DLC_Timeout_error) fatal = 1
		return
	endif
	WaitOneGameFrame
	repeat
endscript

script ui_create_DLC_menu 
	GetActiveProfileName
	FormatText TextName = profile_name_text qs("%s") s = <profile_name>
	CreateScreenElement {
		parent = root_window
		id = DLC_Base_Interface
		type = DescInterface
		desc = 'DLC_Base_Menu'
		exclusive_device = ($primary_controller)
		UserName_text = <profile_name_text>
		AlbumCover_texture = DLC_Generic_Album
		MusicStore_text = $wii_DLC_MusicStore_Text
		AvailableText_text = qs("")
		AvailableLabel_text = qs("")
		SubMenu_Label_text = qs("")
		Notebook_BG_texture = DLC_Notebook_BG_Main
	}
	RunScriptOnScreenElement \{id = DLC_Base_Interface
		ui_DLC_Poll_DWC}
	if DLC_Base_Interface :Desc_ResolveAlias \{name = alias_PatchSplat}
		AssignAlias id = <resolved_id> alias = DLC_PatchSplat
	endif
	if DLC_Base_Interface :Desc_ResolveAlias \{name = alias_SubMenuDesc}
		AssignAlias id = <resolved_id> alias = DLC_SubMenu
		if ($ui_DLC_Menu_SubMenu = first)
			ui_DLC_Menu_Setup_First_Menu
		else
			ui_DLC_Menu_Setup_Second_Menu num = ($DLC_Current_Secondary_Menu)
		endif
	endif
	if (($ui_DLC_Needs_Setup) = 1)
		SpawnScriptLater \{DLC_Setup}
	endif
endscript

script ui_DLC_Menu_Setup_First_Menu 
	change \{ui_DLC_Menu_SubMenu = first}
	spawnscriptnow ui_DLC_Menu_Setup_First_Menu_Spawned params = <...>
endscript

script ui_DLC_Menu_Setup_First_Menu_Spawned 
	clean_up_user_control_helpers
	ui_DLC_Move_Splat
	DLC_Base_Interface :SE_SetProps \{Notebook_BG_texture = DLC_Notebook_BG_Main
		AvailableText_text = qs("")
		AvailableLabel_text = qs("")
		SubMenu_Label_text = qs("")}
	DLC_SubMenu :SE_SetProps {
		desc = 'DLC_First_Menu'
		MOTD_Header_text = $wii_DLC_MOTD_header
		MOTD_Message_text = ($message_of_the_day)
		License_Message_text = $wii_DLC_licensed_by_nintendo
		SetList_Label_text = $wii_DLC_SetList_Label_Text
		Store_Label_text = $wii_DLC_Store_Label_Text
		NewReleases_Label_text = $wii_DLC_NewReleases_Label_Text
	}
	add_user_control_helper \{text = $wii_RA_select
		button = green
		z = 100}
	add_user_control_helper \{text = $wii_back
		button = red
		z = 100}
	add_user_control_helper \{text = $wii_DLC_visit_RA
		button = Orange
		z = 100}
	if DLC_SubMenu :Desc_ResolveAlias \{name = alias_SelectionHighlight}
		AssignAlias id = <resolved_id> alias = SelectionHighlight
	endif
	if DLC_SubMenu :Desc_ResolveAlias \{name = alias_MainMenu}
		AssignAlias id = <resolved_id> alias = current_menu
		current_menu :SE_SetProps \{event_handlers = [
				{
					pad_back
					generic_event_back
				}
				{
					pad_up
					generic_menu_up_or_down_sound
				}
				{
					pad_down
					generic_menu_up_or_down_sound
				}
				{
					pad_l1
					ui_DLC_Goto_Rock_Archive
				}
			]}
		AssignAlias \{alias = tmpRowItem
			id = {
				current_menu
				child = 0
			}}
		tmpRowItem :SE_SetProps \{event_handlers = [
				{
					pad_choose
					ui_DLC_Menu_Setup_Second_Menu
					params = {
						num = 0
					}
				}
				{
					focus
					ui_First_menu_focus
				}
				{
					unfocus
					ui_First_menu_unfocus
				}
			]}
		AssignAlias \{alias = tmpRowItem
			id = {
				current_menu
				child = 1
			}}
		tmpRowItem :SE_SetProps \{event_handlers = [
				{
					pad_choose
					ui_DLC_Menu_Setup_Second_Menu
					params = {
						num = 1
					}
				}
				{
					focus
					ui_First_menu_focus
				}
				{
					unfocus
					ui_First_menu_unfocus
				}
			]}
		AssignAlias \{alias = tmpRowItem
			id = {
				current_menu
				child = 2
			}}
		tmpRowItem :SE_SetProps \{event_handlers = [
				{
					pad_choose
					ui_DLC_Menu_Setup_Second_Menu
					params = {
						num = 2
					}
				}
				{
					focus
					ui_First_menu_focus
				}
				{
					unfocus
					ui_First_menu_unfocus
				}
			]}
	endif
	change \{DLC_Last_Focus_Id = 0}
	DLC_ResetPreview
	LaunchEvent \{type = focus
		target = current_menu
		data = {
			child_index = $DLC_Current_Secondary_Menu
		}}
endscript

script ui_DLC_Goto_Rock_Archive 
	if (($ui_DLC_Needs_Setup) = 1)
		return
	endif
	generic_event_choose \{state = UIstate_Rock_Archive}
endscript

script ui_First_menu_focus 
	Obj_GetID
	AssignAlias alias = tmpTextItem id = {<ObjID> child = 0}
	SelectionHighlight :SE_SetProps alpha = 1 pos = (0.0, 0.0) parent = <ObjID> just = [left , center] pos_anchor = [left , center]
endscript

script ui_First_menu_unfocus 
endscript

script ui_DLC_Menu_Setup_Second_Menu 
	change \{ui_DLC_Menu_SubMenu = second}
	spawnscriptnow ui_DLC_Menu_Setup_Second_Menu_Spawned params = <...>
endscript
DLC_Menu_List = [
	'New_Releases'
	'Store'
	'Set_List'
]
DLC_Splat_Pos_List = [
	(-94.0, -5.0)
	(11.0, -0.5)
	(85.0, 0.0)
]
DLC_Splat_Rot_List = [
	0
	165
	-5
]
DLC_Current_Secondary_Menu = -1

script ui_DLC_Menu_Setup_Second_Menu_Spawned 
	if (($ui_DLC_Needs_Setup) = 1)
		return
	endif
	change \{DLC_Last_Focus_Song_Index = -1}
	DLC_Make_Helpers
	DLC_SubMenu :SE_SetProps \{desc = 'DLC_Second_Menu'
		SongInfoLeft_text = qs("")
		SongInfoRight_text = qs("")
		SortText_text = qs("")
		SongInfoName_text = qs("")
		SongInfoArtist_text = qs("")}
	DLC_Set_Sort_Mode_Text
	if DLC_SubMenu :Desc_ResolveAlias \{name = alias_Menu_Container}
		AssignAlias id = <resolved_id> alias = DLC_Menu_Container
	endif
	if DLC_SubMenu :Desc_ResolveAlias \{name = alias_SelectionHighlight}
		AssignAlias id = <resolved_id> alias = SelectionHighlight
	endif
	change DLC_Current_Secondary_Menu = <num>
	ui_DLC_Move_Splat num = <num>
	ExtendCRC ui_DLC_Menu_Setup_ ($DLC_Menu_List [<num>]) out = setup_Func
	ExtendCRC DLC_Notebook_BG_ ($DLC_Menu_List [<num>]) out = bg_texture
	DLC_Base_Interface :SE_SetProps {
		Notebook_BG_texture = <bg_texture>
	}
	<setup_Func>
	DLC_ResetPreview
	DLC_Refresh_Song_List
endscript

script ui_DLC_Menu_Toggle_Secondary_Menu 
	change \{DLC_Last_Focus_Song_Index = -1}
	DLC_ResetPreview
	<num> = ($DLC_Current_Secondary_Menu + 1)
	if (<num> > 2)
		<num> = 0
	endif
	change DLC_Current_Secondary_Menu = <num>
	change \{DLC_Last_Focus_Id = 0}
	ui_DLC_Move_Splat num = <num>
	ExtendCRC ui_DLC_Menu_Setup_ ($DLC_Menu_List [<num>]) out = setup_Func
	ExtendCRC DLC_Notebook_BG_ ($DLC_Menu_List [<num>]) out = bg_texture
	DLC_Base_Interface :SE_SetProps {
		Notebook_BG_texture = <bg_texture>
	}
	<setup_Func>
	DLC_Refresh_Song_List
endscript

script ui_DLC_Menu_Setup_New_Releases 
	DLC_Base_Interface :SE_SetProps \{SubMenu_Label_text = $wii_DLC_NewReleases_Label_Text}
	DLC_SubMenu :SE_SetProps {
		SongInfoLeft_text = ($wii_DLC_song_info_buying_left_text)
	}
endscript

script ui_DLC_Menu_Setup_Store 
	DLC_Base_Interface :SE_SetProps \{SubMenu_Label_text = $wii_DLC_Store_Label_Text}
	DLC_SubMenu :SE_SetProps {
		SongInfoLeft_text = ($wii_DLC_song_info_buying_left_text)
	}
endscript

script ui_DLC_Menu_Setup_Set_List 
	DLC_Base_Interface :SE_SetProps \{SubMenu_Label_text = $wii_DLC_SetList_Label_Text}
	DLC_SubMenu :SE_SetProps {
		SongInfoLeft_text = ($wii_DLC_song_info_purchased_left_text)
	}
	if CNTSDIsCardPresent
		CNTSDCardWasEjected
		if DLC_Enumerate_SD
			change \{DLC_Menu_SD_Indices_Valid = 1}
		else
			change \{DLC_Menu_SD_Indices_Valid = 0}
			change \{DLC_Menu_SD_Indices = {
				}}
		endif
	else
		CNTSDCardWasEjected
		change \{DLC_Menu_SD_Indices_Valid = 0}
		change \{DLC_Menu_SD_Indices = {
			}}
	endif
endscript

script ui_destroy_DLC_menu 
	DLC_ResetPreview
	DLC_Destroy_Popup
	DestroyScreenElement \{id = DLC_Base_Interface}
	clean_up_user_control_helpers
endscript

script ui_DLC_Move_Splat \{num = -1}
	if ScreenElementExists \{id = DLC_PatchSplat}
		RunScriptOnScreenElement id = DLC_PatchSplat ui_DLC_Move_Splat_Spawned params = {num = <num>}
	endif
endscript

script ui_DLC_Move_Splat_Spawned 
	SE_SetProps \{scale = (0.25, 0.25)
		time = 0.075}
	SE_WaitProps
	if (<num> < 0)
		SE_SetProps \{alpha = 0}
		return
	endif
	SE_SetProps {
		pos = ($DLC_Splat_Pos_List [<num>])
		rot_angle = ($DLC_Splat_Rot_List [<num>])
		alpha = 1
	}
	SE_SetProps \{scale = (1.0, 1.0)
		time = 0.075}
	SE_WaitProps
endscript
