
script ui_create_leaderboard_load 
	printstruct <...>
	NetSessionFunc \{func = stats_uninit}
	NetSessionFunc \{func = stats_init}
	spawnscriptnow ui_create_leaderboard_load_spawned params = <...>
endscript

script ui_create_leaderboard_load_spawned 
	printf \{qs(0xf6576946)}
	printstruct <...>
	RemoveParameter \{base_name}
	RemoveParameter \{focus_id}
	CreateScreenElement \{type = ContainerElement
		parent = root_window
		id = leaderboard_load
		dims = (1280.0, 720.0)
		just = [
			left
			top
		]
		z_priority = 1000000}
	ui_leaderboard_get_headers
	if GotParam \{my_status}
		CreateScreenElement \{parent = leaderboard_load
			type = DescInterface
			desc = 'leaderboard'
			z_priority = -100}
		<id> :obj_spawnscript ui_leaderboard_load_spin
		ui_event_wait_for_safe
		change \{LeaderboardSearchValue = 0}
		change \{LeaderboardDiffValue = 3}
		change \{lb_list_type = 0}
		change \{lb_offset = 1}
		if ($current_leaderboard_group = song)
			change lb_rating_value = (($LeaderboardDiffValue) + 1)
		else
			change \{lb_rating_value = 0}
		endif
		if isXenon
			controller_index = ($lb_controller)
		endif
		NetSessionFunc {
			obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = ui_leaderboard_load_callback_me
				offset = 1
				columns = <columns>
				num_rows = 1
				listtype = me
				controller_index = <controller_index>
			}
		}
		leaderboard_load :obj_spawnscript \{ui_leaderboard_load_timeout
			params = {
				callback = ui_leaderboard_load_callback_me
			}}
	elseif GotParam \{offset}
		LeaderboardInterface :obj_spawnscript \{ui_leaderboard_load_spin}
		leaderboard_load :SetTags offset = <prev_offset>
		if ($lb_list_type = friends)
			listtype = friends
		endif
		NetSessionFunc {
			obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = ui_leaderboard_load_callback
				offset = ($lb_offset)
				columns = <columns>
				num_rows = 10
				listtype = <listtype>
			}
		}
		leaderboard_load :obj_spawnscript \{ui_leaderboard_load_timeout
			params = {
				callback = ui_leaderboard_load_callback
			}}
	else
		LeaderboardInterface :obj_spawnscript \{ui_leaderboard_load_spin}
		if ((IsPs3) && ($lb_list_type = friends))
			change \{lb_list_type = 0}
		elseif ($lb_list_type = me)
			leaderboard_load :SetTags \{my_leaderboard = 1}
		endif
		printf \{qs(0x8201f16a)}
		printstruct <...>
		NetSessionFunc {
			obj = stats
			func = get_stats
			params = {
				leaderboard_id = ($current_leaderboard_id)
				callback = ui_leaderboard_load_callback
				offset = ($lb_offset)
				columns = <columns>
				num_rows = 10
				listtype = ($lb_list_type)
				rating_val = ($lb_rating_value)
			}
		}
		leaderboard_load :obj_spawnscript \{ui_leaderboard_load_timeout
			params = {
				callback = ui_leaderboard_load_callback
			}}
	endif
endscript

script ui_destroy_leaderboard_load 
	destroy_menu_backdrop
	KillSpawnedScript \{name = ui_leaderboard_load_spin}
	DestroyScreenElement \{id = leaderboard_load}
	if ScreenElementExists \{id = LeaderboardInterface}
		LeaderboardInterface :SE_SetProps \{loading_alpha = 0.0
			time = 0.1}
	endif
	if NOT GotParam \{my_status}
	endif
endscript

script ui_leaderboard_load_callback_me 
	printf \{qs("\Lui_leaderboard_load_callback_me")
		channel = leaderboard}
	printstruct <...>
	KillSpawnedScript \{name = ui_leaderboard_load_timeout}
	GetArraySize \{leaderboard_data}
	if (<array_size> > 0)
		my_data = (<leaderboard_data> [0].data)
		leaderboard_load :SetTags my_data = <my_data>
		leaderboard_load :SetTags my_xuid = (<leaderboard_data> [0].player_xuid)
		my_cash = (<my_data> [3])
	endif
	if ($current_leaderboard_group = Cash)
		spawnscriptnow ui_leaderboard_load_callback_me_continue params = {my_data = <my_data> my_cash = <my_cash>}
	else
		leaderboard_load :obj_spawnscript \{ui_leaderboard_load_cash_me}
	endif
endscript

script ui_leaderboard_load_cash_me 
	printf \{qs("\Lui_leaderboard_load_cash_me")}
	Wait \{0.5
		second}
	GetSingleTag \{my_xuid}
	if GotParam \{my_xuid}
		array = []
		AddArrayElement array = <array> element = <my_xuid>
		NetSessionFunc {
			obj = stats
			func = get_stats
			params = {
				leaderboard_id = lb_career_cash
				callback = ui_leaderboard_load_callback_xuid_me
				listtype = custom_list
				num_rows = 1
				columns = [1]
				uid_array = <array>
			}
		}
	else
		NetSessionFunc \{obj = stats
			func = get_stats
			params = {
				leaderboard_id = lb_career_cash
				callback = ui_leaderboard_load_callback_xuid_me
				offset = 1
				listtype = me
				num_rows = 1
			}}
	endif
	leaderboard_load :obj_spawnscript \{ui_leaderboard_load_timeout
		params = {
			callback = ui_leaderboard_load_callback_xuid_me
		}}
endscript

script ui_leaderboard_load_callback_xuid_me 
	printf \{qs("\Lui_leaderboard_load_callback_xuid_me")}
	printstruct <...>
	KillSpawnedScript \{name = ui_leaderboard_load_timeout}
	leaderboard_load :GetSingleTag \{my_data}
	GetArraySize \{leaderboard_data}
	if (<array_size> > 0)
		my_cash = (<leaderboard_data> [0].data [3])
	endif
	spawnscriptnow ui_leaderboard_load_callback_me_continue params = {my_data = <my_data> my_cash = <my_cash>}
endscript

script ui_leaderboard_load_callback_me_continue 
	printf \{qs(0x2157ab4c)}
	ui_event_wait_for_safe
	mark_unsafe_for_shutdown
	ui_event_block event = menu_replace data = {state = UIstate_leaderboard my_data = <my_data> my_cash = <my_cash>}
	ui_event_block \{event = menu_change
		data = {
			state = UIstate_leaderboard_load
			is_popup
		}}
	mark_safe_for_shutdown
endscript

script ui_leaderboard_load_callback 
	printf \{qs("\Lui_leaderboard_load_callback")
		channel = leaderboard}
	printstruct <...>
	KillSpawnedScript \{name = ui_leaderboard_load_timeout}
	if NOT ($lb_list_type = friends)
		if GotParam \{offset}
			printf \{qs(0xa764a2bc)}
			change lb_offset = <offset>
		endif
	endif
	printstruct <...>
	leaderboard_load :SetTags song_data = <leaderboard_data>
	if ($current_leaderboard_group = Cash)
		spawnscriptnow ui_leaderboard_load_callback_xuid params = {leaderboard_data = <leaderboard_data>}
	else
		leaderboard_load :obj_spawnscript \{ui_leaderboard_load_cash}
	endif
endscript

script ui_leaderboard_load_cash 
	printf \{qs("\Lui_leaderboard_load_cash")}
	printstruct <...>
	Wait \{0.5
		second}
	GetSingleTag \{song_data}
	GetArraySize <song_data>
	controller = ($lb_controller)
	<live_enabled> = 0
	if IsNgc
		controller = ($primary_controller)
		if CheckForSignIn <signin_params> controller_index = <controller>
			<live_enabled> = 1
		else
			array_size = 0
		endif
	endif
	if (<array_size> > 0)
		array = []
		i = 0
		begin
		AddArrayElement array = <array> element = (<song_data> [<i>].data [2])
		i = (<i> + 1)
		repeat <array_size>
	endif
	if GotParam \{array}
		GetArraySize <array>
		NetSessionFunc {
			obj = stats
			func = get_stats
			params = {
				leaderboard_id = lb_career_cash
				callback = ui_leaderboard_load_callback_xuid
				listtype = custom_list
				columns = [1]
				num_rows = <array_size>
				uid_array = <array>
			}
		}
	elseif (<live_enabled> = 0)
		if ui_event_exists_in_stack \{name = 'leaderboard'}
			ui_event \{event = menu_back}
		endif
		ui_event_wait \{event = menu_replace
			data = {
				state = UIstate_leaderboard_timeout
			}}
		return
	else
		if ui_event_exists_in_stack \{name = 'leaderboard'}
			ui_event \{event = menu_back}
		endif
		leaderboard_load :GetSingleTag \{offset}
		if NOT GotParam \{offset}
			leaderboard_load :obj_spawnscript \{ui_leaderboard_load_empty}
		else
			change lb_offset = <offset>
		endif
		return
	endif
	leaderboard_load :obj_spawnscript \{ui_leaderboard_load_timeout
		params = {
			callback = ui_leaderboard_load_callback_xuid
		}}
endscript

script ui_leaderboard_load_callback_xuid 
	printf \{qs("\Lui_leaderboard_load_callback_xuid")
		channel = leaderboard}
	KillSpawnedScript \{name = ui_leaderboard_load_timeout}
	leaderboard_load :GetSingleTag \{song_data}
	leaderboard_load :GetSingleTag \{my_leaderboard}
	GetArraySize <song_data>
	controller = ($lb_controller)
	<live_enabled> = 0
	if IsNgc
		controller = ($primary_controller)
		if CheckForSignIn <signin_params> controller_index = <controller>
			<live_enabled> = 1
		else
			array_size = 0
		endif
	endif
	if (<array_size> > 0)
		ui_leaderboard_update_rows leaderboard_data = <song_data> cash_data = <leaderboard_data> my_leaderboard = <my_leaderboard>
	elseif (<live_enabled> = 0)
		if ui_event_exists_in_stack \{name = 'leaderboard'}
			ui_event \{event = menu_back}
		endif
		ui_event_wait \{event = menu_replace
			data = {
				state = UIstate_leaderboard_timeout
			}}
	else
		if ui_event_exists_in_stack \{name = 'leaderboard'}
			ui_event \{event = menu_back}
		endif
		leaderboard_load :GetSingleTag \{offset}
		if NOT GotParam \{offset}
			leaderboard_load :obj_spawnscript \{ui_leaderboard_load_empty}
		else
			change lb_offset = <offset>
		endif
		return
	endif
endscript

script ui_leaderboard_load_timeout 
	if NOT GotParam \{no_wait}
		Wait \{15
			seconds}
	endif
	if (<callback> = ui_leaderboard_load_callback_me)
		leaderboard_load :obj_spawnscript <callback> params = {leaderboard_data = []}
		return
	endif
	printf \{qs("\Lui_leaderboard_load_timeout timing out --- ")
		channel = leaderboard}
	if ($lb_list_type = friends)
		ui_event_wait \{event = menu_replace
			data = {
				state = UIstate_leaderboard
			}}
		return
	endif
	if ui_event_exists_in_stack \{name = 'leaderboard'}
		ui_event \{event = menu_back}
	endif
	leaderboard_load :GetSingleTag \{offset}
	if NOT GotParam \{offset}
		ui_event_wait \{event = menu_replace
			data = {
				state = UIstate_leaderboard_timeout
			}}
	else
		change lb_offset = <offset>
	endif
endscript

script ui_leaderboard_load_empty 
	ui_event_wait \{event = menu_replace
		data = {
			state = UIstate_leaderboard_empty
		}}
endscript

script ui_leaderboard_load_spin 
	SE_SetProps spin_rot_angle = RandomFloat (0.0, 360.0)
	SE_SetProps \{loading_alpha = 1.0}
	GetDisplaySettings
	if Desc_ResolveAlias \{name = alias_globe}
		<resolved_id> :SE_SetProps no_squishy = true
		if (<widescreen> = false)
			<resolved_id> :SE_SetProps pos = {(-30.0, 0.0) relative}
		endif
	endif
	if Desc_ResolveAlias \{name = alias_spin}
		<resolved_id> :SE_SetProps no_squishy = true
		if (<widescreen> = false)
			<resolved_id> :SE_SetProps pos = {(-30.0, 0.0) relative}
		endif
		begin
		<resolved_id> :SE_GetProps
		<resolved_id> :SE_SetProps rot_angle = (<rot_angle> - 360.0) time = 1.0
		<resolved_id> :SE_WaitProps
		repeat
	endif
endscript
