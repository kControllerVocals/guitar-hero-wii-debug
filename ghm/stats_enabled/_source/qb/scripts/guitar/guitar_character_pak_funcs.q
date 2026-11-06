musician_heaps = [
	heap_musician1
	heap_musician2
	heap_musician3
	heap_musician4
]
0x652da952 = 1
character_pak_loadpak_lock = 0
character_pak_loadpak_done = 0
character_pak_loadpak_failed = 0

script loadpakasync \{is_raw = false}
	finalprintf 'LoadPakAsync : %s on heap %a async=%i' s = <pak_name> a = <heap> i = <async>
	<timeout_counter> = 0
	<timeout> = (60 * 60)
	begin
	if ($character_pak_loadpak_lock = 0)
		break
	endif
	<timeout_counter> = (<timeout_counter> + 1)
	if (<timeout_counter> > <timeout>)
		finalprintf \{'LoadPakAsync timed out waiting for lock!'}
		break
	endif
	wait \{1
		gameframe}
	repeat
	change \{character_pak_loadpak_lock = 1}
	change \{character_pak_loadpak_done = 0}
	change \{character_pak_loadpak_failed = 0}
	change \{0x652da952 = 0}
	onexitrun \{check_character_pak_loadpak_lock}
	getcontentfolderindexfromfile <pak_name>
	if (<device> = content)
		if NOT downloads_opencontentfolder content_index = <content_index>
			printf \{qs(0xb4c2c4ea)}
			change \{character_pak_loadpak_lock = 0}
			change \{character_pak_loadpak_done = 0}
			return \{false}
		endif
	endif
	if (<async> = 0)
		if (gotparam no_vram)
			if NOT loadpak <pak_name> heap = <heap> device = <device> no_vram is_raw = <is_raw>
				change \{character_pak_loadpak_failed = 1}
			endif
		else
			if NOT loadpak <pak_name> heap = <heap> device = <device> is_raw = <is_raw>
				change \{character_pak_loadpak_failed = 1}
			endif
		endif
		change \{character_pak_loadpak_done = 1}
	else
		if (gotparam no_vram)
			loadpak <pak_name> heap = <heap> load_callback = loadpakasync_callback callback_data = none device = <device> no_vram is_raw = <is_raw>
		else
			loadpak <pak_name> heap = <heap> load_callback = loadpakasync_callback callback_data = none device = <device> is_raw = <is_raw>
		endif
	endif
	<timeout_counter> = 0
	begin
	if ($character_pak_loadpak_done = 1)
		break
	endif
	<timeout_counter> = (<timeout_counter> + 1)
	if (<timeout_counter> > <timeout>)
		finalprintf \{'LoadPakAsync timed out waiting for done!'}
		break
	endif
	wait \{1
		gameframe}
	repeat
	if (<device> = content)
		downloads_closecontentfolder content_index = <content_index>
		if ($character_pak_loadpak_failed = 1)
			change \{character_pak_loadpak_lock = 0}
			change \{character_pak_loadpak_done = 0}
			return \{false}
		endif
	endif
	change \{character_pak_loadpak_lock = 0}
	change \{character_pak_loadpak_done = 0}
	return {
		true
		loadpak_alloc_size = <loadpak_alloc_size>
		loadpak_alloc_size_vram = <loadpak_alloc_size_vram>
	}
endscript

script check_character_pak_loadpak_lock 
	if ($character_pak_loadpak_lock = 1)
		finalprintf \{'Lock left on LoadPakAsync!'}
		scriptassert \{'Lock left on LoadPakAsync'}
	endif
endscript

script loadpakasync_callback 
	if NOT (<result> = 0)
		change \{character_pak_loadpak_done = 1}
		change \{character_pak_loadpak_failed = 1}
	endif
	if gotparam \{end}
		finalprintf \{'LoadPakAsync_callback end'}
		change \{character_pak_loadpak_done = 1}
	else
		finalprintf \{'LoadPakAsync_callback NOT end'}
	endif
	change \{0x652da952 = 1}
endscript
