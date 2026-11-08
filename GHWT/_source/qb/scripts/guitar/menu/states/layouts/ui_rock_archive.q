RA_Current_Menu = 'Left'
RA_Canceling = 0
RA_LoadingDots = 0
SD_Card_Active = 0
RA_Left_Song_Count = 0
RA_Right_Song_Count = 0
RA_We_Disabled_HB = 0
RA_Confirming_Local_Delete = 0
DLC_Ignore_Max_SD_Songs = 0
DLC_Max_Songs_On_SD = 120
DLC_Max_Songs_In_Setlist = 140

script ui_create_rock_archive 
	change \{SD_Card_Active = 1}
	CreateScreenElement {
		parent = root_window
		id = RA_Base_Interface
		type = DescInterface
		desc = 'Rock_Archive'
		exclusive_device = ($primary_controller)
		Wii_Header_text = $wii_RA_Left_Header
		SD_Header_text = $wii_RA_Right_Header
		Wii_Size_Text = qs("")
		SD_Size_Text = qs("")
	}
	CNTSDCardWasEjected
	RA_SD_Spawn_Poller
	if RA_Base_Interface :Desc_ResolveAlias \{name = alias_Left_Menu}
		AssignAlias id = <resolved_id> alias = RA_Left_Menu
	endif
	if RA_Base_Interface :Desc_ResolveAlias \{name = alias_Right_Menu}
		AssignAlias id = <resolved_id> alias = RA_Right_Menu
	endif
	if RA_Base_Interface :Desc_ResolveAlias \{name = alias_Left_Menu_Highlight}
		AssignAlias id = <resolved_id> alias = RA_Left_Menu_Highlight
		RA_Left_Menu_Highlight :SE_SetProps \{alpha = 0}
	endif
	if RA_Base_Interface :Desc_ResolveAlias \{name = alias_Right_Menu_Highlight}
		AssignAlias id = <resolved_id> alias = RA_Right_Menu_Highlight
		RA_Right_Menu_Highlight :SE_SetProps \{alpha = 0}
	endif
	if RA_Base_Interface :Desc_ResolveAlias \{name = alias_Rock_Archive}
		AssignAlias id = <resolved_id> alias = RA_Main_Container
		if RA_Base_Interface :Desc_ResolveAlias \{name = alias_SelectionHighlight}
			AssignAlias id = <resolved_id> alias = RA_SelectionHighlight
			RA_SelectionHighlight :SE_SetProps \{parent = RA_Main_Container
				pos = (0.0, 0.0)
				alpha = 0}
		endif
	endif
	RA_Left_Menu :SE_SetProps \{event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
			}
			{
				pad_down
				generic_menu_up_or_down_sound
			}
			{
				pad_back
				generic_event_back
			}
			{
				pad_option2
				RA_Swap_Menu
				params = {
					from = 'Left'
					to = 'Right'
				}
			}
			{
				pad_option
				RA_Backup_All
			}
		]}
	RA_Right_Menu :SE_SetProps \{event_handlers = [
			{
				pad_up
				generic_menu_up_or_down_sound
			}
			{
				pad_down
				generic_menu_up_or_down_sound
			}
			{
				pad_back
				generic_event_back
			}
			{
				pad_option2
				RA_Swap_Menu
				params = {
					from = 'Right'
					to = 'Left'
				}
			}
			{
				pad_option
				RA_Backup_All
			}
		]}
	RA_Refresh
endscript

script ui_destroy_rock_archive 
	DestroyScreenElement \{id = RA_Base_Interface}
	change \{SD_Card_Active = 0}
	clean_up_user_control_helpers
endscript

script RA_Clear_Menu 
	ExtendCRC <id> '_Highlight' out = highlight_id
	<highlight_id> :SE_SetProps alpha = 0
	if GetScreenElementChildren id = <id>
		GetArraySize <children>
		LaunchEvent type = unfocus target = <id>
		if NOT (<array_size> = 0)
			i = 0
			begin
			DestroyScreenElement id = (<children> [<i>])
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script RA_SD_Spawn_Poller 
	if CNTSDIsCardPresent
		RunScriptOnScreenElement \{id = RA_Base_Interface
			RA_SD_Remove_Poller}
	else
		RunScriptOnScreenElement \{id = RA_Base_Interface
			RA_SD_Insert_Poller}
	endif
endscript

script RA_SD_Insert_Poller 
	begin
	if CNTSDIsCardPresent
		CNTSDCardWasEjected
		spawnscriptnow \{RA_SD_Spawn_Poller}
		spawnscriptnow \{SD_Card_Inserted}
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script RA_SD_Remove_Poller 
	begin
	if CNTSDCardWasEjected
		spawnscriptnow \{RA_SD_Spawn_Poller}
		spawnscriptnow \{SD_Card_Removed}
		break
	endif
	WaitOneGameFrame
	repeat
endscript

script RA_Refresh \{selection_offset = 0}
	KillSpawnedScript \{name = RA_Refresh_Spawned}
	spawnscriptnow RA_Refresh_Spawned params = <...>
endscript

script RA_Refresh_Spawned \{selection_offset = 0}
	begin
	if NOT ScriptIsRunning \{RA_Choose_Confirmed}
		break
	endif
	WaitOneGameFrame
	repeat
	begin
	if NOT ScreenElementExists \{id = Generic_PopupElement}
		break
	endif
	WaitOneGameFrame
	repeat
	RA_SelectionHighlight :SE_SetProps \{parent = RA_Main_Container
		pos = (0.0, 0.0)
		alpha = 0}
	RA_Clear_Menu \{id = RA_Left_Menu}
	RA_Clear_Menu \{id = RA_Right_Menu}
	GetLocalSongStatusArray
	GetArraySize \{GH4_download_songlist
		GlobalArray}
	<max_catalog_index> = (<array_size> + 1)
	GetArraySize <song_status_array>
	<added> = 0
	<count> = 0
	if (<array_size> > 0)
		<i> = 0
		begin
		if ((<song_status_array> [<i>]) = PRESENT)
			if (<i> > 1)
				<count> = (<count> + 1)
			endif
			if (<i> > <max_catalog_index>)
				<cannot_list_local> = 1
				<song_status_array> = []
				<array_size> = 0
				<count> = 0
				break
			endif
		endif
		<i> = (<i> + 1)
		repeat <array_size>
	endif
	if (<count> > 195)
		<cannot_list_local> = 1
		<song_status_array> = []
		<array_size> = 0
	endif
	<start_index> = (1 + ($DLC_Hide_Catalog))
	if (<array_size> > <start_index>)
		<index> = <start_index>
		begin
		if ((<song_status_array> [<index>]) = PRESENT)
			<added> = (<added> + 1)
			RA_Get_Song_Name index = <index>
			CreateScreenElement {
				parent = RA_Left_Menu
				type = DescInterface
				desc = 'Rock_Archive_Row'
				song_text = <song_name>
				autoSizeDims = true
				event_handlers = [
					{focus RA_Focus}
					{unfocus RA_Unfocus}
					{pad_choose RA_Choose params = {local index = <index>}}
				]
			}
		endif
		<index> = (<index> + 1)
		repeat (<array_size> - <start_index>)
	endif
	change RA_Left_Song_Count = <added>
	RA_Make_Helpers
	if (<added> = 0)
		change \{RA_Current_Menu = 'Right'}
		if GotParam \{cannot_list_local}
			CreateScreenElement {
				parent = RA_Left_Menu
				type = TextBlockElement
				text = ($wii_RVLCNTSD_CANNOT_LIST_LOCAL_CONTENT)
				font = fontgrid_text_a3
				dims = (310.0, 250.0)
				internal_just = [center , center]
				focusable = false
				use_shadow = true
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				rgba = [127 127 127 255]
				internal_scale = (0.5, 0.5)
			}
		else
			CreateScreenElement {
				parent = RA_Left_Menu
				type = TextBlockElement
				text = ($wii_RA_no_songs)
				font = fontgrid_text_a3
				dims = (310.0, 250.0)
				internal_just = [center , center]
				focusable = false
				use_shadow = true
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				rgba = [127 127 127 255]
				internal_scale = (0.5, 0.5)
			}
		endif
	endif
	DLCGetFreeBlocks
	if (<num_blocks> = 1)
		FormatText TextName = wii_blocks qs(0x262ba243) d = <num_blocks> b = ($wii_DLC_block)
	else
		FormatText TextName = wii_blocks qs(0x262ba243) d = <num_blocks> b = ($wii_DLC_blocks)
	endif
	RA_Base_Interface :SE_SetProps Wii_Size_Text = <wii_blocks>
	GetStartTime
	RA_Edge_Case_Script_From_Hell <...>
	GetElapsedTime StartTime = <StartTime>
	printf qs(0x11b7d6a0) d = <ElapsedTime>
	if GotParam \{error}
		<index> = 1
		RA_Format_Error_Text <...>
		change \{RA_Current_Menu = 'Left'}
		CreateScreenElement {
			parent = RA_Right_Menu
			type = TextBlockElement
			text = <errorText>
			font = fontgrid_text_a3
			dims = (180.0, 225.0)
			internal_just = [center , center]
			use_shadow = true
			focusable = false
			shadow_offs = (3.0, 3.0)
			shadow_rgba = [0 0 0 255]
			rgba = [127 127 127 255]
			internal_scale = (0.5, 0.5)
		}
		RA_Base_Interface :SE_SetProps \{SD_Size_Text = qs("")}
		change \{RA_Right_Song_Count = 0}
	else
		GetArraySize <index_array>
		change RA_Right_Song_Count = <array_size>
		if (<array_size> = 0)
			change \{RA_Current_Menu = 'Left'}
			CreateScreenElement {
				parent = RA_Right_Menu
				type = TextBlockElement
				text = ($wii_RA_no_songs)
				font = fontgrid_text_a3
				dims = (180.0, 225.0)
				internal_just = [center , center]
				use_shadow = true
				focusable = false
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [0 0 0 255]
				rgba = [127 127 127 255]
				internal_scale = (0.5, 0.5)
			}
		elseif (<array_size> > 198)
			change \{RA_Current_Menu = 'Left'}
			CreateScreenElement \{parent = RA_Right_Menu
				type = TextBlockElement
				text = $wii_RVLCNTSD_CANNOT_LIST_SD_CONTENT
				font = fontgrid_text_a3
				dims = (180.0, 225.0)
				internal_just = [
					center
					center
				]
				use_shadow = true
				focusable = false
				shadow_offs = (3.0, 3.0)
				shadow_rgba = [
					0
					0
					0
					255
				]
				rgba = [
					127
					127
					127
					255
				]
				internal_scale = (0.5, 0.5)}
			RA_Base_Interface :SE_SetProps \{SD_Size_Text = qs("")}
			change \{RA_Right_Song_Count = 0}
		else
			<index> = 0
			begin
			<song_index> = (<index_array> [<index>])
			if NOT ((<song_index> < 2) && (($DLC_Hide_Catalog) = 1))
				RA_Get_Song_Name index = <song_index>
				CreateScreenElement {
					parent = RA_Right_Menu
					type = DescInterface
					desc = 'Rock_Archive_Row'
					song_text = <song_name>
					autoSizeDims = true
					event_handlers = [
						{focus RA_Focus}
						{unfocus RA_Unfocus}
						{pad_choose RA_Choose params = {sd index = <song_index>}}
					]
				}
			endif
			<index> = (<index> + 1)
			repeat <array_size>
		endif
		CNTSDGetAvailableBytes
		if GotParam \{error}
			RA_Refresh
			return
		endif
		CNTSDBytesToBlocks
		if (<SD_Card_Blocks> = 1)
			FormatText TextName = sd_blocks qs(0x262ba243) d = <SD_Card_Blocks> b = ($wii_DLC_block)
		else
			FormatText TextName = sd_blocks qs(0x262ba243) d = <SD_Card_Blocks> b = ($wii_DLC_blocks)
		endif
		RA_Base_Interface :SE_SetProps SD_Size_Text = <sd_blocks>
	endif
	FormatText checksumname = menu 'RA_%m_Menu' m = ($RA_Current_Menu) AddToStringLookup
	if ($RA_Current_Menu = 'Left')
		other_menu = RA_Right_Menu
	else
		other_menu = RA_Left_Menu
	endif
	ExtendCRC <menu> '_Highlight' out = highlight_id
	<highlight_id> :SE_SetProps alpha = 1
	AssignAlias id = <menu> alias = current_menu
	if NOT ScreenElementExists \{id = Generic_PopupElement}
		current_menu :GetTags
		<selection_index> = 0
		if GotParam \{tag_selected_index}
			<selection_index> = (<tag_selected_index> + <selection_offset>)
		endif
		if GetScreenElementChildren id = <menu>
			GetArraySize <children>
			if (<selection_index> >= <array_size>)
				<selection_index> = (<array_size> - 1)
			endif
			if ((<selection_index> + 7) > <array_size>)
				if (<array_size> > 0)
					<zero_out_index> = 0
					if ((<array_size> - 7) > 0)
						<zero_out_index> = (<array_size> - 7)
					endif
					printf qs(0x7d1a0577) d = <zero_out_index>
					LaunchEvent type = focus target = <menu> data = {child_index = <zero_out_index>}
					LaunchEvent type = unfocus target = <menu>
				endif
			endif
		endif
		if (<selection_index> < 0)
			<selection_index> = 0
		endif
		LaunchEvent type = focus target = <other_menu>
		LaunchEvent type = unfocus target = <other_menu>
		LaunchEvent type = focus target = <menu> data = {child_index = <selection_index>}
	endif
	if NOT GotParam \{error}
		if NOT ScreenElementExists \{id = Generic_PopupElement}
			CNTSDCountSDSongs
			RemoveParameter \{error}
			if (<SD_Song_Count> > $DLC_Max_Songs_On_SD)
				FormatText \{TextName = warning_text
					$wii_DLC_SD_Too_Many_Songs_Warning
					d = $DLC_Max_Songs_On_SD}
				create_new_generic_popup {
					popup_type = error_menu
					text = <warning_text>
					title = $wii_freestyle_warning
					error_func = RA_Destroy_Popup_And_Remake_Helpers
					add_user_control_helpers
				}
			endif
		endif
	endif
	if GotParam \{do_catalog_restore}
		RemoveParameter \{error}
		DLCGetLocalTitleInfo
		if NOT GotParam \{error}
			if (<isOnDevice> = true)
				RA_Spawn_Choose_Confirmed \{sd
					index = 1
					move = 0}
			else
				create_new_generic_popup \{popup_type = yes_no_menu
					title = $wii_freestyle_warning
					title_effect
					text = $wii_RA_confirm_catalog_restore
					yes_func = RA_Spawn_Choose_Confirmed
					yes_func_params = {
						sd
						index = 1
						move = 0
					}
					no_func = RA_Destroy_Popup_And_Remake_Helpers
					add_user_control_helpers
					priority = 10}
			endif
		endif
	elseif GotParam \{do_catalog_backup}
		RA_Spawn_Choose_Confirmed \{local
			index = 1
			move = 0}
	endif
endscript

script RA_Swap_Menu 
	if NOT CNTSDIsCardPresent
		return
	endif
	FormatText checksumname = new_count 'RA_%m_Song_Count' m = <to>
	if (($<new_count>) = 0)
		return
	endif
	FormatText checksumname = old_id 'RA_%m_Menu' m = <from>
	FormatText checksumname = new_id 'RA_%m_Menu' m = <to>
	ExtendCRC <old_id> '_Highlight' out = old_highlight_id
	ExtendCRC <new_id> '_Highlight' out = new_highlight_id
	<old_highlight_id> :SE_SetProps alpha = 0 time = 0.075
	<new_highlight_id> :SE_SetProps alpha = 1 time = 0.075
	LaunchEvent type = unfocus target = <old_id>
	LaunchEvent type = focus target = <new_id>
	AssignAlias id = <new_id> alias = current_menu
	change RA_Current_Menu = <to>
endscript

script RA_Get_Song_Name 
	if (<index> = 0)
		<song_title> = qs(0xe33eb047)
	elseif (<index> = 1)
		<song_title> = $wii_RA_catalog_name
	else
		GetArraySize \{GH4_download_songlist
			GlobalArray}
		if ((<index> - 1) > <array_size>)
			FormatText TextName = song_title qs(0x34f7b79d) d = <index>
		else
			FormatText checksumname = song 'dlc%d' d = <index>
			get_song_title song = <song>
		endif
	endif
	return song_name = <song_title>
endscript

script RA_Format_Error_Text 
	if GotParam \{error_SD_Corrupt_From_Usable}
		if GotParam \{local}
			error = $wii_RVLCNTSD_MESSAGE_0011
		else
			error = $wii_RVLCNTSD_MESSAGE_0003
		endif
	endif
	if GotParam \{error_include_blocks}
		FormatText TextName = error <error> d = <blocks>
	elseif GotParam \{error_include_name}
		if NOT GotParam \{index}
			<index> = 1
		endif
		RA_Get_Song_Name index = <index>
		FormatText TextName = error <error> s = <song_name>
	endif
	return errorText = <error>
endscript

script RA_Handle_Error 
	if NOT GotParam \{error_canceled}
		RA_Format_Error_Text <...>
		RA_Make_Error_Menu text = <errorText> priority = 7
	endif
endscript

script RA_DoWait 
	if GotParam \{error}
		return
	endif
	get_home_button_allowed
	change RA_We_Disabled_HB = (1 - <disabled>)
	set_home_button_notallowed
	popup_params = {
		popup_type = DLC_Wait
		title = ($wii_RA_transfering)
		text = <text>
		priority = 8
		title_effect
		title_effect_index = 1
		add_user_control_helpers
	}
	if GotParam \{progress_bar}
		<popup_params> = ((<popup_params>) + ({progress_bar}))
	endif
	if NOT GotParam \{nocancel}
		cancel_params = {
			can_cancel
			back_script = RA_Cancel
			cancel_func = RA_Cancel
		}
		<popup_params> = ((<popup_params>) + (<cancel_params>))
	endif
	create_new_generic_popup <popup_params>
	if GotParam \{long_text}
		Generic_PopupElement :Desc_ResolveAlias \{name = alias_loading_text_menu}
		<resolved_id> :SE_SetProps alpha = 0
		Generic_PopupElement :Desc_ResolveAlias \{name = alias_long_wait_label}
		<resolved_id> :SE_SetProps alpha = 1 text = <long_text>
	endif
	printf \{'BEGINING WAIT:'}
	printstruct <...>
	begin
	CNTSDGetTransferProgress
	if ((GotParam transfer_done) || (GotParam error))
		break
	endif
	if GotParam \{progress_bar}
		RA_Update_Loading text = <text> Progress = <transfer_progress>
	else
		RA_Update_Loading text = <text>
	endif
	if (($RA_Canceling) = 1)
		RemoveParameter \{progress_bar}
		RA_Reset_Loading
		RA_DoWait text = ($wii_DLC_canceling_text) nocancel
		break
	endif
	WaitOneGameFrame
	repeat
	printf \{'DONE TRANSFER:'}
	printstruct <...>
	RA_Reset_Loading
	if GotParam \{error}
		return <...>
	endif
endscript

script RA_Cancel 
	if (CNTSDCancelTransfer)
		change \{RA_Canceling = 1}
	endif
endscript

script RA_Reset_Loading 
	change \{RA_Canceling = 0}
	change \{RA_LoadingDots = 0}
	DLC_Destroy_Popup
	if (($RA_We_Disabled_HB) = 1)
		set_home_button_allowed
	endif
endscript

script RA_Update_Loading 
	dotText = qs("\L")
	change RA_LoadingDots = (($RA_LoadingDots) + 1)
	if (($RA_LoadingDots) > 79)
		change \{RA_LoadingDots = 0}
	else
		count = (($RA_LoadingDots) / 20)
		if (<count> > 0)
			begin
			FormatText TextName = dotText qs(0xf606f43e) t = <dotText>
			repeat <count>
		endif
	endif
	if ScreenElementExists \{id = Generic_PopupElement}
		Generic_PopupElement :SE_SetProps wait_dots_text = <dotText>
	endif
	if GotParam \{Progress}
		if ScreenElementExists \{id = Generic_PopupElement}
			Generic_PopupElement :SE_SetProps bar_sprite_dims = ((<Progress> * (4.2, 0.0)) + (0.0, 25.0))
		endif
	endif
endscript

script RA_Make_Helpers 
	clean_up_user_control_helpers
	add_user_control_helper text = ($wii_RA_select) button = green z = 100
	add_user_control_helper text = ($wii_back) button = red z = 100
	add_user_control_helper text = ($wii_RA_switch_menu) button = Yellow z = 100
	if ($RA_Left_Song_Count > 0)
		add_user_control_helper text = ($wii_RA_Move_All) button = Blue z = 100
	endif
endscript

script RA_Post_Error 
	RA_Make_Helpers
	DLC_Destroy_Popup
endscript

script RA_Make_Error_Menu \{priority = 11}
	create_new_generic_popup {
		popup_type = error_menu
		error_func = RA_Post_Error
		text = <text>
		priority = <priority>
		add_user_control_helpers
	}
endscript

script RA_Delete_Canceled 
	RA_Destroy_Popup_And_Remake_Helpers
	change \{RA_Confirming_Local_Delete = 0}
endscript

script RA_Delete_Confirmed 
	if GotParam \{sd}
		CNTSDDeleteBackup index = <index>
	else
		CNTSDDeleteLocal index = <index>
		UpdateContentIndex index = <index>
	endif
	if GotParam \{error}
		RA_Handle_Error <...>
		RA_Refresh
	else
		RA_Refresh \{selection_offset = -1}
	endif
endscript

script RA_Choose_Confirmed 
	if NOT CNTSDIsCardPresent
		RA_Handle_Error \{error = $wii_RVLCNTSD_MESSAGE_0001}
		return
	endif
	CNTSDIsCardUsable
	if GotParam \{error}
		RA_Handle_Error <...>
		return
	endif
	CNTSDGetCatalogStatus
	if (<catalog_status> = wrong_wii)
		RA_Handle_Error error = ($wii_CNTSD_RESULT_INCORRECT_DEVICE_catalog)
		return
	endif
	RA_Get_Song_Name index = <index>
	if GotParam \{sd}
		if (<index> > 1)
			if NOT SD_CacheSizeCheck
				RA_Handle_Error <...>
				return
			endif
		endif
		CNTSDGetSizeToRestore index = <index>
		if GotParam \{error}
			RA_Handle_Error <...>
			return
		endif
		DisableReset
		CNTSDRestoreContent index = <index>
		FormatText TextName = long_text $wii_RVLCNTSD_MESSAGE_0002 s = <song_name>
		if NOT GotParam \{error}
			if (<index> = 1)
				RA_DoWait text = qs("") long_text = <long_text> progress_bar index = <index> nocancel
			else
				RA_DoWait text = qs("") long_text = <long_text> progress_bar index = <index>
			endif
		endif
		UpdateContentIndex index = <index>
	else
		CNTSDGetBytesToBackup index = <index>
		CNTSDGetAvailableBytes
		if GotParam \{error}
			RA_Handle_Error <...>
			return
		endif
		if (<index> > 1)
			CNTSDCountSDSongs exclude_index = <index>
			if GotParam \{error}
				RA_Handle_Error <...>
				return
			endif
			if ((<SD_Song_Count> + 1) > $DLC_Max_Songs_On_SD)
				FormatText \{TextName = tmpError
					$wii_DLC_SD_Too_Many_Songs
					d = $DLC_Max_Songs_On_SD}
				FormatText TextName = error $wii_DLC_SD_Transfer_Too_Many_Songs s = <tmpError>
				RA_Handle_Error <...>
				return
			endif
		endif
		if (<SD_Card_Bytes_Available> < <SD_Card_Bytes_Needed>)
			if (<index> > 1)
				RA_Handle_Error <...> error_include_blocks error = ($wii_RVLCNTSD_MESSAGE_0009)
			endif
			return
		endif
		DisableReset
		printf \{'BEGINING TRANSFER:'}
		CNTSDBackupContent index = <index>
		printstruct <...>
		if (<move> = 1)
			<message> = $wii_RVLCNTSD_MESSAGE_0007
		else
			<message> = $wii_RVLCNTSD_MESSAGE_0008
		endif
		FormatText TextName = long_text <message> s = <song_name>
		if NOT GotParam \{error}
			if (<index> = 1)
				RA_DoWait text = qs("") long_text = <long_text> progress_bar index = <index> nocancel
			else
				RA_DoWait text = qs("") long_text = <long_text> progress_bar index = <index>
			endif
		endif
	endif
	if GotParam \{error}
		RA_Handle_Error <...>
		if (<index> = 1)
			RA_Refresh error = ($wii_RVLCNTSD_CANNOT_LIST_CONTENT)
		else
			RA_Refresh
		endif
	elseif (<move> = 1)
		RA_Delete_Confirmed <...>
	else
		if (<index> = 1)
			Downloads_EnumContent \{from_EC = 1}
		endif
		RA_Refresh
	endif
	EnableReset
endscript

script RA_Spawn_Delete_Confirmed 
	DLC_Destroy_Popup \{refocus = 0}
	change \{RA_Confirming_Local_Delete = 0}
	spawnscriptnow RA_Delete_Confirmed params = <params>
endscript

script RA_Spawn_Choose_Confirmed 
	spawnscriptnow RA_Choose_Confirmed params = <...>
endscript

script RA_Destroy_Popup_And_Remake_Helpers 
	DLC_Destroy_Popup <...>
	RA_Make_Helpers
endscript

script RA_Delete_Confirm 
	DLC_Destroy_Popup
	if GotParam \{local}
		FormatText TextName = text $wii_RA_message_delete_popup_local s = <song_name>
	else
		FormatText TextName = text $wii_RA_message_delete_popup_SD s = <song_name>
	endif
	create_new_generic_popup {
		popup_type = message_options
		back_script = RA_Destroy_Popup_And_Remake_Helpers
		title = $wii_RA_title_delete_popup
		text = <text>
		force_big_vmenu
		options = [
			{
				func = RA_Spawn_Delete_Confirmed
				func_params = {params = <...>}
				text = ($wii_DLC_option_delete)
			}
			{
				func = RA_Destroy_Popup_And_Remake_Helpers
				func_params = {}
				text = ($wii_DLC_option_cancel)
			}
		]
		title_effect
		add_user_control_helpers
	}
endscript

script RA_Choose 
	RA_Get_Song_Name index = <index>
	if GotParam \{local}
		FormatText TextName = text $wii_RA_message_transfer_popup_local s = <song_name>
	else
		FormatText TextName = text $wii_RA_message_transfer_popup_SD s = <song_name>
	endif
	create_new_generic_popup {
		popup_type = message_options
		back_script = RA_Destroy_Popup_And_Remake_Helpers
		title = <song_name>
		text = <text>
		options = [
			{
				func = RA_Spawn_Choose_Confirmed
				func_params = ((<...>) + ({move = 1}))
				text = ($wii_RA_option_move)
			}
			{
				func = RA_Delete_Confirm
				func_params = <...>
				text = ($wii_DLC_option_delete)
			}
			{
				func = RA_Destroy_Popup_And_Remake_Helpers
				func_params = {}
				text = ($wii_DLC_option_cancel)
			}
		]
		title_effect
		add_user_control_helpers
	}
endscript

script RA_Focus 
	Obj_GetID
	RA_SelectionHighlight :SE_SetProps parent = <ObjID> alpha = 1 pos = (-9.0, 4.0) just = [left , center] pos_anchor = [left , center]
endscript

script RA_Unfocus 
endscript

script RA_Backup_All 
	if ($RA_Left_Song_Count = 0)
		return
	endif
	if NOT CNTSDIsCardPresent
		RA_Handle_Error \{error = $wii_RVLCNTSD_MESSAGE_0001}
		return
	endif
	CNTSDIsCardUsable
	if GotParam \{error}
		RA_Handle_Error <...> local
		return
	endif
	CNTSDGetCatalogStatus
	if (<catalog_status> = wrong_wii)
		RA_Handle_Error error = ($wii_CNTSD_RESULT_INCORRECT_DEVICE_catalog)
		return
	endif
	CNTSDGetAvailableBytes
	if GotParam \{error}
		RA_Handle_Error <...>
		return
	endif
	create_new_generic_popup \{title = $wii_DLC_wait_header_text
		text = $wii_RA_Transfer_all_calc_text
		title_effect}
	WaitOneGameFrame
	GetLocalSongStatusArray
	GetArraySize <song_status_array>
	<array> = []
	if (<array_size> > 2)
		<i> = 2
		begin
		if ((<song_status_array> [<i>]) = PRESENT)
			AddArrayElement array = <array> element = <i>
		endif
		<i> = (<i> + 1)
		repeat (<array_size> - 2)
	endif
	CNTSDCountSDSongs exclude_array = <array>
	if GotParam \{error}
		RA_Handle_Error <...>
		return
	endif
	GetArraySize <array>
	if ((<SD_Song_Count> + <array_size>) > $DLC_Max_Songs_On_SD)
		FormatText \{TextName = tmpError
			$wii_DLC_SD_Too_Many_Songs
			d = $DLC_Max_Songs_On_SD}
		FormatText TextName = error $wii_DLC_SD_Transfer_Too_Many_Songs s = <tmpError>
		RA_Handle_Error <...>
		return
	endif
	CNTSDGetTransferAllSize index_array = <array>
	destroy_generic_popup
	if GotParam \{error}
		RA_Handle_Error <...>
		return
	endif
	if (<SD_Card_Bytes_Available> < <SD_Card_Bytes_Needed>)
		RA_Handle_Error blocks = <blocks> error_include_blocks = 1 error = $wii_RA_transfer_all_needs_space
		return
	endif
	FormatText TextName = transfer_text $wii_RA_transfer_all_message d = <blocks>
	create_new_generic_popup {
		popup_type = yes_no_menu
		title = $wii_DLC_purchase_confirm_header
		text = <transfer_text>
		yes_func = RA_Do_Backup_All
		yes_func_params = {index_array = <array>}
		no_func = destroy_generic_popup
		title_effect
	}
endscript

script RA_Do_Backup_All 
	spawnscriptnow RA_Do_Backup_All_Spawned params = <...>
endscript

script RA_Do_Backup_All_Spawned 
	GetArraySize <index_array>
	<i> = 0
	DisableReset
	begin
	<index> = ((<index_array>) [<i>])
	RA_Get_Song_Name index = <index>
	CNTSDGetBytesToBackup index = <index>
	CNTSDGetAvailableBytes
	if GotParam \{error}
		break
	endif
	if (<SD_Card_Bytes_Available> < <SD_Card_Bytes_Needed>)
		<error_include_blocks> = 1
		<error> = ($wii_RVLCNTSD_MESSAGE_0009)
		break
	endif
	CNTSDBackupContent index = <index>
	FormatText TextName = long_text $wii_RVLCNTSD_MESSAGE_0007 s = <song_name>
	if NOT GotParam \{error}
		RA_DoWait text = qs("") long_text = <long_text> progress_bar index = <index>
	endif
	if GotParam \{error}
		break
	endif
	CNTSDDeleteLocal index = <index>
	UpdateContentIndex index = <index>
	if GotParam \{error}
		break
	endif
	<i> = (<i> + 1)
	repeat <array_size>
	EnableReset
	if GotParam \{error}
		RA_Handle_Error <...>
	endif
	RA_Refresh
endscript
SD_Card_Present = 0

script SD_Card_Inserted 
	if ScreenElementExists \{id = RA_Base_Interface}
		printf \{'SD_Card_Inserted'}
		if ScreenElementExists \{id = Generic_PopupElement}
			RA_Make_Error_Menu \{text = $wii_RA_message_SD_Card_Inserted
				priority = 9}
		endif
		RA_Refresh
	endif
endscript

script SD_Card_Removed 
	if ScreenElementExists \{id = RA_Base_Interface}
		printf \{'SD_Card_Removed'}
		if ScreenElementExists \{id = Generic_PopupElement}
			RA_Make_Error_Menu \{text = $wii_RA_message_SD_Card_Removed
				priority = 9}
		endif
		RA_Refresh
	endif
endscript

script RA_Edge_Case_Script_From_Hell 
	if NOT GotParam \{error}
		CNTSDIsCardUsable
		if NOT GotParam \{error}
			CNTSDGetContentIndices
			if NOT GotParam \{error}
				GetArraySize <index_array>
				<index_array_size> = <array_size>
				if (<index_array_size> = 0)
					return <...>
				endif
				CNTSDGetCatalogStatus
				<can_list_content> = 1
				if (<catalog_status> = wrong_wii)
					<can_list_content> = 0
					<index_array> = []
					<array_size> = 0
					<index_array_size> = 0
				endif
				<index_array_size> = <array_size>
				<catalog_on_SD> = 0
				<banner_on_SD> = 0
				<any_song_on_SD> = 0
				if (<index_array_size> > 0)
					<index> = 0
					GetArraySize \{GH4_download_songlist
						GlobalArray}
					<max_catalog_index> = (<array_size> + 1)
					begin
					<song_index> = (<index_array> [<index>])
					if (<song_index> > <max_catalog_index>)
						<can_list_content> = 0
						break
					endif
					if (<song_index> = 0)
						<banner_on_SD> = 1
					elseif (<song_index> = 1)
						<catalog_on_SD> = 1
					else
						<any_song_on_SD> = 1
					endif
					<index> = (<index> + 1)
					repeat <index_array_size>
				endif
				if (<catalog_status> = need_restore)
					CNTSDGetSizeToRestore \{index = 1}
					if NOT GotParam \{error}
						<error> = ($wii_RVLCNTSD_CANNOT_LIST_SD_CONTENT)
						<error_include_name> = 1
						<do_catalog_restore> = 1
						<can_list_content> = 1
					else
						<blocks> = ($DLC_Content_Cache_Size)
						RA_Handle_Error <...>
						RemoveParameter \{error}
						RemoveParameter \{error_include_name}
						RemoveParameter \{error_incluce_blocks}
					endif
				endif
				if (<can_list_content> = 0)
					if (<catalog_status> = SD_missing)
						RA_Handle_Error error = ($wii_RVLCNTSD_MESSAGE_0013_catalog)
					elseif (<catalog_status> = wrong_wii)
						RA_Handle_Error error = ($wii_CNTSD_RESULT_INCORRECT_DEVICE_catalog)
					elseif (<catalog_status> = no_ticket)
						RA_Handle_Error error = ($wii_RVLCNTSD_MESSAGE_0013_catalog)
					endif
					<index_array> = []
					<index_array_size> = 0
					<error> = ($wii_RVLCNTSD_CANNOT_LIST_SD_CONTENT)
				endif
				if NOT GotParam \{error}
					if (<index_array_size> > 0)
						if (<any_song_on_SD> = 0)
							if (<banner_on_SD> = 1)
								CNTSDDeleteBackup \{index = 0}
							endif
							if (<catalog_on_SD> = 1)
								CNTSDDeleteBackup \{index = 1}
							endif
							<index_array> = []
							<index_array_size> = 0
						else
							CNTGetFlags \{index = 1}
							if (<flag_owned> = true && <flag_present> = true && <flag_corrupt> = false)
								CNTSDGetBytesToBackup \{index = 1}
								CNTSDGetAvailableBytes
								if NOT GotParam \{error}
									if (<SD_Card_Bytes_Available> >= <SD_Card_Bytes_Needed>)
										if ((<catalog_status> = need_backup) || (<catalog_status> = SD_missing))
											<error> = ($wii_RVLCNTSD_MESSAGE_0008)
											<error_include_name> = 1
											<do_catalog_backup> = 1
										endif
									endif
								else
									RemoveParameter \{error}
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
	return <...>
endscript

script SD_CacheSizeCheck 
	DLCGetFreeBlocks
	if (<num_blocks> < ($DLC_Content_Cache_Size - 2))
		return false blocks = ($DLC_Content_Cache_Size) error = $wii_RVLCNTSD_MESSAGE_0005 error_include_blocks = 1
	endif
	if (<num_inodes> < ($DLC_Content_Cache_Inodes - 2))
		return \{false
			error = $wii_RVLCNTSD_MESSAGE_0006}
	endif
	return \{true}
endscript
