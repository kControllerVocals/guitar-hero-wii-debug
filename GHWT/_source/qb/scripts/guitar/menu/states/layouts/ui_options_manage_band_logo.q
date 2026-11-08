
script ui_create_options_manage_band_logo 
	FormatText checksumname = bandname_id 'band%i_info' i = ($current_band)
	GetGlobalTags <bandname_id>
	FormatText TextName = the_bands_name qs(0xb213c4fe) n = <name>
	spawnscriptnow \{menu_manage_band_edit_logo_focus}
	make_generic_menu \{title = $wii_band_info
		pad_back_script = band_logo_backout
		vmenu_id = create_options_manage_band_vmenu}
	setup_cas_menu_handlers_restricted \{vmenu_id = create_options_manage_band_vmenu}
	add_generic_menu_text_item {
		text = <the_bands_name>
		text_just = [center center]
		child_anchor = [center center]
		text_offset = (0.0, 0.0)
		heading
	}
	add_generic_menu_text_item \{text = $wii_edit_logo_lc
		choose_state = UIstate_cap_main
		choose_state_data = {
			text = qs("Edit Band Logo")
			part = CAS_Band_Logo
			cam_name = 'options_manage_band_logo'
			num_icons = 0
		}}
	add_generic_menu_text_item \{text = $wii_rename_band_lc
		choose_state = uistate_band_name_enter
		choose_state_data = {
			from_band_logo = from_band_logo
		}}
	menu_finish
endscript

script ui_destroy_options_manage_band_logo 
	destroy_generic_menu
endscript

script init_band_logo 
	CASBlockForLoading
	cas_load_and_setup_resources \{no_cam
		no_bink
		band_logo}
	change \{cas_editing_new_character = false}
	ensure_band_logo_object_created
	SetCASAppearance \{appearance = {
			CAS_Band_Logo = {
				desc_id = CAS_Band_Logo_id
			}
		}}
	change \{cas_override_object = BandLogoObject}
	get_current_band_info
	GetGlobalTags <band_info>
	if GotParam \{band_logo}
		SetCASAppearanceCAP part = CAS_Band_Logo cap = <band_logo>
		cas_update_band_logo <...>
	endif
endscript

script ui_init_options_manage_band_logo 
	return
	init_band_logo
	BandLogoObject :Obj_SetPosition \{position = (-33.45, -1.42, 21.9)}
	BandLogoObject :Obj_SetOrientation \{dir = (0.0, 0.0, -1.0)}
	BandLogoObject :SwitchOnAtomic \{CAS_Band_Logo}
	BandLogoObject :Obj_ApplyScaling \{scale = 1.0}
endscript

script ui_deinit_options_manage_band_logo 
	change \{cas_override_object = none}
	BandLogoObject :SwitchOffAtomic \{CAS_Band_Logo}
	cas_free_resources \{no_bink
		no_loading_screen
		band_logo}
endscript

script ensure_band_logo_object_created 
	return
	if NOT CompositeObjectExists \{name = BandLogoObject}
		lightgroup = [Band Alt_Band]
		CreateCompositeObject {
			params = {
				name = BandLogoObject
				pos = (0.0, 0.0, 0.0)
				assetcontext = ($CAS_Band_Logo_Details.assetcontext)
			}
			Components = [
				{
					Component = skeleton
					SkeletonName = GH_Rocker_Female_original
				}
				{
					Component = SetDisplayMatrix
				}
				{
					Component = AnimTree
				}
				{
					Component = Model
					lightgroup = <lightgroup>
				}
				{
					Component = ModelBuilder
					global_storage = band_logo_block
				}
			]
		}
		BandLogoObject :SetTags {
			no_bone_work
			instrument = none
			lightgroup = <lightgroup>
		}
		params = {
			async = 0
			buildscriptparams = {
				lightgroup = <lightgroup>
				temporary_heap = heap_cas
			}
			appearance = {
				CAS_Band_Logo = {desc_id = CAS_Band_Logo_id}
			}
		}
		BandLogoObject :ModelBuilder_Preload <params>
		BandLogoObject :ModelBuilder_LoadAssets <params>
		BandLogoObject :ModelBuilder_Build <params>
		BandLogoObject :SwitchOffAtomic \{CAS_Band_Logo}
	endif
	return \{object_name = BandLogoObject}
endscript

script cas_update_band_logo 
	get_current_band_info
	GetGlobalTags <band_info> param = <band_logo>
	if GotParam \{album_art}
		band_logo = ($editable_jam_album_cover [0].layers)
		if IsArray <band_logo>
			GetArraySize <band_logo>
			if ((<array_size>) > 0)
				if NOT StructureContains Structure = (<band_logo> [0]) layer_id
					band_logo = ($default_album_cover [0].layers)
				endif
			else
				band_logo = ($default_album_cover [0].layers)
			endif
		else
			band_logo = ($default_album_cover [0].layers)
		endif
	endif
	if NOT GotParam \{band_logo}
		printf \{'No band logo to build!'}
		return
	endif
	GetArraySize <band_logo>
	if ((<array_size>) > 0)
		change edit_graphic_layer_infos = <band_logo>
	endif
	GetArraySize ($edit_graphic_layer_infos)
	if ((<array_size>) <= 0)
		return
	endif
	edit_graphic_prepare_sprite_infos
	GenerateCAGTexture info_array = <sprite_infos> slow_path = 1
	if NOT GotParam \{no_wait}
		Wait \{1
			gameframes}
	endif
endscript

script band_logo_backout 
	if NOT GetCASAppearance
		ScriptAssert \{qs("\LUnable to retrieve appearance in band logo management")}
	endif
	if StructureContains Structure = (<appearance>.CAS_Band_Logo) cap
		get_current_band_info
		GetGlobalTags <band_info>
		if GotParam \{band_logo}
			GenerateChecksumFromArray \{ArrayName = band_logo}
			old_save_checksum = <array_checksum>
			new_cap = ((<appearance>.CAS_Band_Logo).cap)
			GenerateChecksumFromArray \{ArrayName = new_cap}
			if ChecksumEquals a = <old_save_checksum> b = <array_checksum>
				generic_event_back
			else
				SetGlobalTags <band_info> params = {band_logo = ((<appearance>.CAS_Band_Logo).cap)}
				ui_memcard_autosave \{event = menu_back
					data = {
						num_states = 2
					}}
			endif
		else
			SetGlobalTags <band_info> params = {band_logo = ((<appearance>.CAS_Band_Logo).cap)}
			ui_memcard_autosave \{event = menu_back
				data = {
					num_states = 2
				}}
		endif
	else
		generic_event_back
	endif
endscript
