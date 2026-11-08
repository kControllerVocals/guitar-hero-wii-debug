musician_heaps = [
	heap_musician1
	heap_musician2
	heap_musician3
	heap_musician4
]
character_pak_loadpak_fired = 1
character_pak_loadpak_lock = 0
character_pak_loadpak_done = 0
character_pak_loadpak_failed = 0

script LoadPakAsync 
	printf qs("\LLoadPakAsync : %s on heap %a async=%i") s = <pak_name> a = <heap> i = <async>
	begin
	if ($character_pak_loadpak_lock = 0)
		break
	endif
	Wait \{1
		gameframe}
	repeat
	change \{character_pak_loadpak_lock = 1}
	change \{character_pak_loadpak_done = 0}
	change \{character_pak_loadpak_failed = 0}
	change \{character_pak_loadpak_fired = 0}
	OnExitRun \{check_character_pak_loadpak_lock}
	GetContentFolderIndexFromFile <pak_name>
	if (<device> = content)
		printf \{qs(0x9491118b)}
		if NOT Downloads_OpenContentFolder content_index = <content_index>
			printf \{qs("\LDownloads_OpenContentFolder FAILED")}
			change \{character_pak_loadpak_lock = 0}
			change \{character_pak_loadpak_done = 0}
			return \{false}
		endif
	endif
	if (<async> = 0)
		if (GotParam no_vram)
			if NOT LoadPak <pak_name> heap = <heap> device = <device> no_vram
				change \{character_pak_loadpak_failed = 1}
			endif
		else
			if NOT LoadPak <pak_name> heap = <heap> device = <device>
				change \{character_pak_loadpak_failed = 1}
			endif
		endif
		change \{character_pak_loadpak_done = 1}
	else
		if (GotParam no_vram)
			LoadPak <pak_name> heap = <heap> load_callback = LoadPakAsync_callback callback_data = none device = <device> no_vram
		else
			LoadPak <pak_name> heap = <heap> load_callback = LoadPakAsync_callback callback_data = none device = <device>
		endif
	endif
	begin
	if ($character_pak_loadpak_done = 1)
		break
	endif
	BCSND_UpdateSound
	Wait \{1
		gameframe}
	repeat
	if (<device> = content)
		Downloads_CloseContentFolder content_index = <content_index>
		if ($character_pak_loadpak_failed = 1)
			change \{character_pak_loadpak_lock = 0}
			change \{character_pak_loadpak_done = 0}
			return \{false}
		endif
	endif
	change \{character_pak_loadpak_lock = 0}
	change \{character_pak_loadpak_done = 0}
	return \{true}
endscript

script check_character_pak_loadpak_lock 
	if ($character_pak_loadpak_lock = 1)
		ScriptAssert \{qs("\LLock left on LoadPakAsync")}
	endif
endscript

script LoadPakAsync_callback 
	printf \{qs("\LLoadPakAsync_callback")}
	if NOT (<result> = 0)
		change \{character_pak_loadpak_done = 1}
		change \{character_pak_loadpak_failed = 1}
	endif
	if GotParam \{end}
		change \{character_pak_loadpak_done = 1}
	endif
	change \{character_pak_loadpak_fired = 1}
endscript
