cas_randomized_parts = [
	{
		part = CAS_Torso
	}
	{
		part = CAS_Legs
	}
	{
		part = CAS_Shoes
	}
	{
		part = CAS_Hat
	}
	{
		part = CAS_Hair
	}
	{
		part = CAS_Acc_Left
	}
	{
		part = CAS_Acc_Right
	}
	{
		part = CAS_Acc_Face
	}
	{
		part = CAS_Acc_Ears
	}
	{
		part = CAS_Intro_Anim
	}
	{
		part = CAS_Win_Anim
	}
	{
		part = CAS_Lose_Anim
	}
	{
		part = CAS_Eyes
	}
	{
		part = CAS_Drums_Highway
	}
	{
		part = CAS_Guitar_Highway
	}
	{
		part = CAS_Bass_Highway
	}
]
cas_randomized_presets_car = [
	{
		part = CAS_Body
		female_array = cas_preset_face_skin_female
		male_array = cas_preset_face_skin_male
	}
]
cas_randomized_presets_cpu_band = [
	{
		part = CAS_Body
		female_array = cas_preset_face_skin_female
		male_array = cas_preset_face_skin_male
	}
	{
		part = cas_physique
		female_array = cas_preset_body_female
		male_array = cas_preset_body_male
	}
	{
		part = CAS_Body
		female_array = cas_preset_tattoo_female
		male_array = cas_preset_tattoo_male
	}
]
cas_randomized_instruments = {
	guitar = {
		array = cas_preset_guitars
	}
	Bass = {
		array = cas_preset_basses
	}
	drum = {
		array = cas_preset_drums
	}
	Vocals = {
		male_array = cas_preset_male_vocals
		female_array = cas_preset_female_vocals
	}
}
cas_band_used_parts = {
}
cpu_random_character = 0

script cas_set_random_appearance 
	RequireParams \{[
			genre
		]
		all}
	if GotParam \{make_unique_band}
		band_builder_get_used_parts make_unique_band = <make_unique_band>
		change cas_band_used_parts = <used_parts>
	else
		change \{cas_band_used_parts = {
			}}
	endif
	if GotParam \{cpu_band}
		change \{cpu_random_character = 1}
	else
		change \{cpu_random_character = 0}
	endif
	stars
	GetRandomSeeds
	printf 'Generating random appearance - Seed=[%s,%t,%u,%v,%w,%x] genre=%g' s = <seed1> t = <seed2> u = <seed3> v = <seed4> w = <seed5> x = <seed6> g = <genre>
	stars
	GetArraySize \{$cas_randomized_parts}
	i = 0
	begin
	cas_set_random_appearance_part part_struct = ($cas_randomized_parts [<i>]) genre = <genre>
	i = (<i> + 1)
	repeat <array_size>
	GetArraySize \{$cas_randomized_parts}
	i = 0
	begin
	cas_set_random_color_part part_struct = ($cas_randomized_parts [<i>]) genre = <genre>
	i = (<i> + 1)
	repeat <array_size>
	cas_propogate_hair_color
	get_is_female_from_appearance \{appearance = $cas_current_appearance}
	if (<is_female> = 1)
		EditCASAppearance \{target = SetPart
			targetParams = {
				part = CAS_Female_Base_Torso
				desc_id = female_full
			}}
	else
		EditCASAppearance \{target = SetPart
			targetParams = {
				part = CAS_Male_Base_Torso
				desc_id = male_full
			}}
	endif
	if GotParam \{cpu_band}
		ForEachIn $cas_randomized_presets_cpu_band do = cas_do_randomize_presets params = {is_female = <is_female> genre = <genre>}
		cas_set_random_physique
	elseif GotParam \{new_car_character}
		ForEachIn $cas_randomized_presets_car do = cas_do_randomize_presets params = {is_female = <is_female> genre = <genre>}
	endif
	cas_propogate_color_to_other_parts \{part = CAS_Body
		other_parts = $ps2_fleshy_parts_array}
	if GotParam \{random_instruments}
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.guitar) is_female = <is_female> genre = <genre>
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.Bass) is_female = <is_female> genre = <genre>
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.drum) is_female = <is_female> genre = <genre>
		cas_merge_in_random_entry entry = ($cas_randomized_instruments.Vocals) is_female = <is_female> genre = <genre>
	endif
	old_appearance = ($cas_current_appearance)
	change cas_current_appearance = {<old_appearance> genre = <genre>}
endscript

script cas_set_random_appearance_part 
	part = (<part_struct>.part)
	ResolveBodySpecificPartInAppearance part = <part>
	part_array = ($<part>)
	GetArraySize <part_array>
	if cas_pick_random_part part_name = <part> genre = <genre>
		desc_id = (<random_part>.desc_id)
		cas_handle_disqualifications part = <part> desc_id = <desc_id>
		if GotParam \{new_desc_id}
			desc_id = <new_desc_id>
		endif
		EditCASAppearance target = SetPart targetParams = {part = <part> desc_id = <desc_id>}
	endif
endscript

script cas_random_should_include_part 
	if StructureContains Structure = ($<part_name> [<i>]) hidden
		return \{false}
	endif
	random_weight = 1.0
	if StructureContains Structure = ($<part_name> [<i>]) random_weight
		random_weight = (($<part_name> [<i>]).random_weight)
	endif
	if ($cpu_random_character = 1)
		if StructureContains Structure = ($<part_name> [<i>]) random_weight_cpu
			random_weight = (($<part_name> [<i>]).random_weight_cpu)
		endif
	endif
	if (<random_weight> = 0.0)
		return \{false}
	endif
	if NOT (<genre> = any)
		if StructureContains Structure = ($<part_name> [<i>]) genre
			if NOT ArrayContains array = (($<part_name> [<i>]).genre) contains = <genre>
				return \{false}
			endif
		endif
	endif
	desc_id = ((($<part_name>) [<i>]).desc_id)
	if ($cpu_random_character = 0)
		if NOT is_part_unlocked part = <part_name> desc_id = <desc_id> savegame = ($cas_current_savegame)
			return \{false}
		endif
		if NOT is_part_purchased part = <part_name> desc_id = <desc_id> savegame = ($cas_current_savegame)
			return \{false}
		endif
	endif
	if (<make_unique> = 1)
		if StructureContains Structure = $cas_band_used_parts <part_name>
			if NOT (<desc_id> = none)
				if ArrayContains array = ($cas_band_used_parts.<part_name>) contains = <desc_id>
					return \{false}
				endif
			endif
		endif
	endif
	return true new_part = {
		desc_id = <desc_id>
		random_weight = <random_weight>
	}
endscript

script cas_create_filtered_parts_array 
	RequireParams \{[
			part_name
			genre
			make_unique
		]
		all}
	filtered_array = []
	GetArraySize $<part_name>
	i = 0
	begin
	if cas_random_should_include_part {
			part_name = <part_name>
			i = <i>
			make_unique = <make_unique>
			genre = <genre>
		}
		new_entry = [{<new_part>}]
		filtered_array = (<filtered_array> + <new_entry>)
	endif
	i = (<i> + 1)
	repeat <array_size>
	return filtered_array = <filtered_array>
endscript

script cas_pick_random_part 
	cas_create_filtered_parts_array part_name = <part_name> genre = <genre> make_unique = 1
	GetArraySize <filtered_array>
	if (<array_size> = 0)
		cas_create_filtered_parts_array part_name = <part_name> genre = <genre> make_unique = 0
		GetArraySize <filtered_array>
		if (<array_size> = 0)
			cas_create_filtered_parts_array part_name = <part_name> genre = any make_unique = 0
		endif
	endif
	if cas_pick_from_weighted_array weighted_array = <filtered_array> cas_pieces = 1
		return true random_part = (<filtered_array> [<random_index>])
	endif
	return \{false}
endscript

script cas_pick_from_weighted_array 
	GetArraySize <weighted_array>
	if (<array_size> > 0)
		cas_get_total_random_weight array = <weighted_array> cas_pieces = <cas_pieces>
		GetRandomValue name = rand_val a = 0.0 b = <total_weight> resolution = 10000
		i = 0
		begin
		if GotParam \{cas_pieces}
			random_weight = ((<weighted_array> [<i>]).random_weight)
		else
			cas_get_random_weight part = (<weighted_array> [<i>])
		endif
		if (<random_weight> > 0.0)
			if (<rand_val> <= <random_weight>)
				break
			endif
		endif
		rand_val = (<rand_val> - <random_weight>)
		i = (<i> + 1)
		repeat <array_size>
		if (<i> = <array_size>)
			i = (<array_size> - 1)
		endif
		return true random_index = <i>
	endif
	return \{false}
endscript

script cas_get_random_weight 
	if ($cpu_random_character = 1)
		if StructureContains Structure = <part> random_weight_cpu
			printf \{'random_weight_cpu'}
			return random_weight = (<part>.random_weight_cpu)
		endif
	endif
	if StructureContains Structure = <part> random_weight
		return random_weight = (<part>.random_weight)
	endif
	return \{random_weight = 1.0}
endscript

script cas_get_total_random_weight 
	total = 0.0
	GetArraySize <array>
	i = 0
	if GotParam \{cas_pieces}
		begin
		total = (<total> + ((<array> [<i>]).random_weight))
		i = (<i> + 1)
		repeat <array_size>
	else
		begin
		cas_get_random_weight part = (<array> [<i>])
		total = (<total> + <random_weight>)
		i = (<i> + 1)
		repeat <array_size>
	endif
	return total_weight = <total>
endscript

script cas_set_random_color_part 
	part = (<part_struct>.part)
	if (<part> = CAS_Facial_Hair)
		return
	endif
	ResolveBodySpecificPartInAppearance part = <part>
	if GetCASAppearancePart part = <part>
		if GetCASPartMaterials part = <part>
			GetArraySize <part_materials>
			i = 0
			begin
			if cas_pick_random_color part = <part> desc_id = <desc_id> genre = <genre>
				SetCASAppearanceMaterial part = <part> material = (<part_materials> [<i>]) value = <color>
				if (<part> = CAS_Male_Hair)
					set_facial_hair_color part = CAS_Male_Facial_Hair color = <color>
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script set_facial_hair_color 
	if GetCASAppearancePart part = <part>
		if GetCASPartMaterials part = <part>
			GetArraySize <part_materials>
			i = 0
			begin
			SetCASAppearanceMaterial part = <part> material = (<part_materials> [<i>]) value = <color>
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
endscript

script cas_can_pick_random_color 
	if GotParam \{desc_id}
		GetActualCASOptionStruct part = <part> desc_id = <desc_id>
		if GotParam \{random_colors}
			return true rand_colors = (<random_colors>)
		elseif GotParam \{force_random}
			GetArraySize \{$cas_randomized_parts}
			i = 0
			begin
			if ChecksumEquals a = (($cas_randomized_parts [<i>]).part) b = <part>
				if StructureContains Structure = ($cas_randomized_parts [<i>]) force_random_colors
					return true rand_colors = (($cas_randomized_parts [<i>]).force_random_colors)
				endif
				return \{false}
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	return \{false}
endscript

script cas_pick_random_color 
	if cas_can_pick_random_color <...>
		cas_filter_random_presets_by_genre array = <rand_colors> genre = <genre>
		if cas_pick_from_weighted_array weighted_array = <filtered_array>
			color_entry = (<filtered_array> [<random_index>])
			if StructureContains Structure = <color_entry> color
				printf 'Set Random color for %s' s = <part> DoNotResolve
				return true color = (<color_entry>.color)
			endif
		endif
	endif
	return \{false}
endscript

script cas_random_handle_exclusions 
endscript

script cas_random_handle_exclusions_scanner 
endscript

script cas_random_find_exclusion 
endscript

script cas_filter_random_presets_by_genre 
	RequireParams \{[
			array
			genre
		]
		all}
	filtered_array = []
	GetArraySize <array>
	if (<array_size> > 0)
		i = 0
		begin
		okay = 1
		if NOT (<genre> = any)
			if StructureContains Structure = (<array> [<i>]) genre
				if NOT ArrayContains array = ((<array> [<i>]).genre) contains = <genre>
					okay = 0
				endif
			endif
		endif
		if (<okay> = 1)
			new_part = (<array> [<i>])
			new_entry = [{<new_part>}]
			filtered_array = (<filtered_array> + <new_entry>)
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return filtered_array = <filtered_array>
endscript

script cas_do_randomize_presets 
	if (<is_female> = 1)
		array_name = <female_array>
	else
		array_name = <male_array>
	endif
	cas_filter_random_presets_by_genre array = $<array_name> genre = <genre>
	if cas_pick_from_weighted_array weighted_array = <filtered_array>
		existing_part = {}
		if StructureContains Structure = $cas_current_appearance <part>
			existing_part = ($cas_current_appearance.<part>)
		endif
		merge_in = (<filtered_array> [<random_index>])
		if StructureContains Structure = <merge_in> cap_merge
			cas_merge_in_cap existing_part = <existing_part> cap_merge = (<merge_in>.cap_merge)
		endif
		existing_part = {<existing_part> <merge_in>}
		UpdateStructElement struct = $cas_current_appearance element = <part> value = <existing_part>
		change cas_current_appearance = <newstruct>
	endif
endscript

script cas_merge_in_cap 
	existing_cap = []
	if StructureContains Structure = <existing_part> cap
		existing_cap = (<existing_part>.cap)
	endif
	i = 0
	GetArraySize <cap_merge>
	if (<array_size> > 0)
		begin
		cas_merge_in_cap_foreach existing_cap = <existing_cap> cap_entry = (<cap_merge> [<i>])
		i = (<i> + 1)
		repeat <array_size>
	endif
	GetArraySize <existing_cap>
	if (<array_size> = 0)
		RemoveParameter \{existing_cap}
	endif
	return merge_in = {<existing_part> cap = <existing_cap>}
endscript

script cas_merge_in_cap_foreach 
	if StructureContains Structure = <cap_entry> base_tex
		new_base_tex = (<cap_entry>.base_tex)
		i = 0
		GetArraySize <existing_cap>
		if (<array_size> > 0)
			begin
			if StructureContains Structure = (<existing_cap> [<i>]) base_tex
				if ((<existing_cap> [<i>].base_tex) = <new_base_tex>)
					return
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
		AddArrayElement array = <existing_cap> element = <cap_entry>
		return existing_cap = <array>
	endif
endscript

script cas_merge_in_random_entry 
	if StructureContains Structure = <entry> female_array
		if (<is_female> = 1)
			chosen_array = (<entry>.female_array)
		else
			chosen_array = (<entry>.male_array)
		endif
	else
		chosen_array = (<entry>.array)
	endif
	cas_filter_random_presets_by_genre array = $<chosen_array> genre = <genre>
	if cas_pick_from_weighted_array weighted_array = <filtered_array>
		merge_in = (<filtered_array> [<random_index>])
		RemoveComponent \{structure_name = merge_in
			name = random_weight}
		RemoveComponent \{structure_name = merge_in
			name = random_weight_cpu}
		RemoveComponent \{structure_name = merge_in
			name = genre}
		old_appearance = ($cas_current_appearance)
		change cas_current_appearance = {<old_appearance> <merge_in>}
	endif
endscript

script cas_random_band_name 
	GetRandomArrayElement ($gh_random_band_names)
	return random_name = <element>
endscript

script cas_random_band_logo 
	GetRandomArrayElement ($cas_preset_bandlogo)
	return cap = (<element>.cap)
endscript

script cas_set_random_physique 
	if NOT GetCASAppearancePart \{part = cas_physique}
		ScriptAssert \{'%s not found'
			s = cas_physique}
	endif
	if NOT GetActualCASOptionStruct part = cas_physique desc_id = <desc_id>
		ScriptAssert '%s %t not found' s = cas_physique t = <desc_id>
	endif
	cas_pick_from_weighted_array weighted_array = <preset_builds>
	chosen = (<preset_builds> [<random_index>])
	SetCASAppearanceAdditionalBones part = cas_physique additional_bone_transforms = (<chosen>.additional_bone_transforms)
endscript

script generate_random_instrument 
	change \{cpu_random_character = 0}
	change \{cas_band_used_parts = {
		}}
	Randomize
	switch <type>
		case guitar
		array = [
			{part = CAS_Guitar_Body}
			{part = CAS_Guitar_Highway}
			{part = CAS_Guitar_Strings}
			{part = CAS_Guitar_Neck inc = CAS_Guitar_Body}
			{part = CAS_Guitar_Head inc = CAS_Guitar_Body}
			{part = CAS_Guitar_Pickguards inc = CAS_Guitar_Body}
			{part = CAS_Guitar_Bridges inc = CAS_Guitar_Body}
			{part = CAS_Guitar_Knobs inc = CAS_Guitar_Body}
			{part = CAS_Guitar_Pickups inc = CAS_Guitar_Body}
			{part = CAS_Guitar_Finish inc = CAS_Guitar_Body}
			{part = CAS_Guitar_Body_Detail inc = CAS_Guitar_Body}
			{part = CAS_Guitar_Neck_Finish inc = CAS_Guitar_Neck}
			{part = CAS_Guitar_Head_Finish inc = CAS_Guitar_Head}
			{part = CAS_Guitar_Head_Detail inc = CAS_Guitar_Head}
			{part = CAS_Guitar_Pickguard_Finish inc = CAS_Guitar_Pickguards}
			{part = cas_guitar_logo inc = CAS_Guitar_Body}
		]
		case Bass
		array = [
			{part = CAS_Bass_Body}
			{part = CAS_Bass_Highway}
			{part = CAS_Bass_Strings}
			{part = CAS_Bass_Neck inc = CAS_Bass_Body}
			{part = CAS_Bass_Head inc = CAS_Bass_Body}
			{part = CAS_Bass_Pickguards inc = CAS_Bass_Body}
			{part = CAS_Bass_Bridges inc = CAS_Bass_Body}
			{part = CAS_Bass_Knobs inc = CAS_Bass_Body}
			{part = CAS_Bass_Pickups inc = CAS_Bass_Body}
			{part = CAS_Bass_Finish inc = CAS_Bass_Body}
			{part = CAS_Bass_Body_Detail inc = CAS_Bass_Body}
			{part = CAS_Bass_Neck_Finish inc = CAS_Bass_Neck}
			{part = CAS_Bass_Head_Finish inc = CAS_Bass_Head}
			{part = CAS_Bass_Head_Detail inc = CAS_Bass_Head}
			{part = cas_bass_pickguard_finish inc = CAS_Bass_Pickguards}
			{part = cas_guitar_logo inc = CAS_Bass_Body}
		]
		case drum
		array = [
			{part = CAS_Drums}
			{part = CAS_Drums_Sticks}
			{part = CAS_Drums_Highway}
			{part = CAS_Drum_Finish}
			{part = CAS_Drum_Detail}
		]
		case Vocals
		array = [
			{part = CAS_Mic}
			{part = CAS_Mic_Stand}
		]
	endswitch
	ForEachIn <array> do = random_instrument_piece
	if GotParam \{rebuild}
		RebuildCurrentCASModel
	endif
endscript

script random_instrument_piece 
	printf 'random_instrument_piece %p' p = <part> DoNotResolve
	if NOT random_instrument_piece_do_inclusions inc = <inc> part = <part>
		cas_set_random_appearance_part part_struct = {part = <part>} genre = any
	endif
	GetCASAppearancePart part = <part>
	GetActualCASOptionStruct part = <part> desc_id = <desc_id>
	if GotParam \{sections}
		num_found = 0
		printf 'Found sections in instrument piece %p' p = <part> DoNotResolve
		GetArraySize <sections>
		if (<array_size> > 0)
			i = 0
			begin
			desc_id = (<sections> [<i>].desc_id)
			if ((<desc_id> = Finishes) || (<desc_id> = Details))
				num_found = (<num_found> + 1)
				if (<num_found> > 2)
					ScriptAssert \{'this only handles two layers, logic needs to be more complex for more'}
				endif
				printf 'Found %d section in instrument piece' d = <desc_id> DoNotResolve
				mask = (<sections> [<i>].mask)
				if cas_pick_from_weighted_array weighted_array = <mask>
					printf 'Picked index %i' i = <random_index> DoNotResolve
					FormatText checksumname = base_tex '%s' s = (<sections> [<i>].base_tex)
					chosen_mask = (<mask> [<random_index>])
					printf 'Frontend desc is %s' s = (<chosen_mask>.frontend_desc) DoNotResolve
					if NOT StructureContains Structure = (<sections> [<i>]) diffuse
						ScriptAssert \{'Instrument defs all need to be on diffuse'}
					endif
					if NOT StructureContains Structure = (<sections> [<i>]) pre_userlayer
						ScriptAssert \{'Instrument defs all need to be pre_userlayer'}
					endif
					FixImagePath path = (<chosen_mask>.pattern)
					material = (<sections> [<i>].material)
					new_cap_entry = 1
					if GotParam \{last_base_tex}
						if (<last_base_tex> = <base_tex>)
							new_cap_entry = 0
							if NOT (<last_material> = <material>)
								ScriptAssert 'material mismatch %a != %b' a = <last_material> b = <material> DoNotResolve
							endif
						endif
					endif
					if StructureContains Structure = <chosen_mask> no_color
						RemoveParameter \{color}
					else
						cas_pick_random_colorwheel
					endif
					set_cap_flags mask = <chosen_mask>
					new_entry = {
						texture = <name>
						flags = <flags>
						color = <color>
					}
					if (<new_cap_entry> = 0)
						CAP_array = [
							{
								base_tex = <base_tex>
								material = <material>
								diffuse
								pre_layer = [
									{
										<last_entry>
									}
									{
										<new_entry>
									}
								]
							}
						]
					else
						cap_entry = [
							{
								base_tex = <base_tex>
								material = <material>
								diffuse
								pre_layer = [
									{
										<new_entry>
									}
								]
							}
						]
						if GotParam \{CAP_array}
							CAP_array = (<CAP_array> + <cap_entry>)
						else
							CAP_array = <cap_entry>
						endif
					endif
					last_base_tex = <base_tex>
					last_material = <material>
					last_entry = <new_entry>
				endif
			endif
			i = (<i> + 1)
			repeat <array_size>
		endif
	endif
	if GotParam \{CAP_array}
		SetCASAppearanceCAP part = <part> cap = <CAP_array>
	else
		SetCASAppearanceCAP part = <part>
	endif
	printf \{''}
endscript

script random_instrument_piece_do_inclusions 
	if GotParam \{inc}
		GetCASAppearancePart part = <inc>
		GetActualCASOptionStruct part = <inc> desc_id = <desc_id>
		if GotParam \{inclusion}
			printf 'Inclusion list for %i->%d...' i = <inc> d = <part> DoNotResolve
			GetArraySize <inclusion>
			if (<array_size> > 0)
				i = 0
				begin
				if (<inclusion> [<i>].part = <part>)
					printf \{'Found!'}
					array = (<inclusion> [<i>].valid)
					trim_inclusion_array inclusion_array = <array> part = <part>
					if random_instrument_pick_from_array array = <array>
						EditCASAppearance target = SetPart targetParams = {part = <part> desc_id = <element>}
						return \{true}
					endif
				endif
				i = (<i> + 1)
				repeat <array_size>
			endif
		endif
	endif
	return \{false}
endscript

script random_instrument_pick_from_array 
	GetArraySize <array>
	if (<array_size> = 0)
		return \{false}
	endif
	GetRandomArrayElement <array>
	return true element = <element>
endscript

script cas_piece_exists 
	if GetActualCASOptionStruct part = <part> desc_id = <desc_id> dont_assert
		return \{true}
	endif
	return \{false}
endscript

script trim_inclusion_array 
	array = []
	GetArraySize <inclusion_array>
	if (<array_size> > 0)
		i = 0
		begin
		valid_part = (<inclusion_array> [<i>])
		if cas_piece_exists part = <part> desc_id = <valid_part>
			if is_part_unlocked part = <part> desc_id = <valid_part> savegame = ($cas_current_savegame)
				if is_part_purchased part = <part> desc_id = <valid_part> savegame = ($cas_current_savegame)
					AddArrayElement array = <array> element = <valid_part>
				endif
			endif
		endif
		i = (<i> + 1)
		repeat <array_size>
	endif
	return array = <array>
endscript

script cas_pick_random_colorwheel \{wheel = $guitar_colorwheel}
	GetArraySize <wheel>
	GetRandomValue name = index Integer a = 0 b = (<array_size> -1)
	wheel_entry = (<wheel> [<index>])
	GetRandomArrayElement <wheel_entry>
	return color = <element>
endscript
