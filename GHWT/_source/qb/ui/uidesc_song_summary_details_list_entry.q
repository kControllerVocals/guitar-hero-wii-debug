uidesc_song_summary_details_list_entry = {
	DescVersion = 1
	name = uidesc_song_summary_details_list_entry
	rect = [
		1.7079471
		-2.6752918
		980.0
		35.0
	]
	aliases = [
	]
	props = [
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 0
					validateLocalID = verse
					includeParentOwned = false
				}
			]
			name = verse_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 1
					validateLocalID = percent_p1
					includeParentOwned = false
				}
			]
			name = percent_p1_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 2
					validateLocalID = percent_p2
					includeParentOwned = false
				}
			]
			name = percent_p2_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 3
					validateLocalID = percent_p3
					includeParentOwned = false
				}
			]
			name = percent_p3_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 4
					validateLocalID = percent_p4
					includeParentOwned = false
				}
			]
			name = percent_p4_text
			target = text
			type = string_wchar
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 1
					validateLocalID = percent_p1
					includeParentOwned = false
				}
			]
			name = percent_p1_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 2
					validateLocalID = percent_p2
					includeParentOwned = false
				}
			]
			name = percent_p2_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 3
					validateLocalID = percent_p3
					includeParentOwned = false
				}
			]
			name = percent_p3_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 4
					validateLocalID = percent_p4
					includeParentOwned = false
				}
			]
			name = percent_p4_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 3
					validateLocalID = percent_p3
					includeParentOwned = false
				}
			]
			name = percent_p3_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 4
					validateLocalID = percent_p4
					includeParentOwned = false
				}
			]
			name = percent_p4_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 2
					validateLocalID = percent_p2
					includeParentOwned = false
				}
			]
			name = percent_p2_alpha
			target = alpha
			type = float
		}
		{
			path = [
				{
					validateLocalID = verse_entry
				}
				{
					index = 0
					validateLocalID = verse
					includeParentOwned = false
				}
			]
			name = verse_rgba
			target = rgba
			type = array_color
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = verse_entry
			type = MenuElement
			dims = (980.0, 35.0)
			just = [
				-1.0
				-1.0
			]
			pos = (1.7079471, -2.6752918)
			z_priority = 1.0
			isVertical = false
			internal_just = [
				-1.0
				-1.0
			]
			spacing_between = 65
			position_children = false
			fit_major = `expand if content larger`
			fit_minor = `keep dims`
			scale_mode = proportional
		}
		children = [
			{
				props = {
					local_id = verse
					type = TextBlockElement
					dims = (400.0, 35.0)
					just = [
						-1.0
						-1.0
					]
					pos = (0.0, 0.0)
					z_priority = 2.0
					rgba = [
						64
						64
						64
						255
					]
					text = qs("Verse Name Goes Here")
					font = fontgrid_text_a8
					fit_width = `scale each line if larger`
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
				}
			}
			{
				props = {
					local_id = percent_p1
					type = TextBlockElement
					dims = (90.0, 35.0)
					just = [
						0.0
						-1.0
					]
					pos = (461.0, 0.0)
					z_priority = 2.0
					rgba = [
						59
						62
						52
						255
					]
					text = qs("100%")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						-1.0
					]
				}
			}
			{
				props = {
					local_id = percent_p2
					type = TextBlockElement
					dims = (90.0, 35.0)
					just = [
						0.0
						-1.0
					]
					pos = (597.0, 0.0)
					z_priority = 2.0
					rgba = [
						59
						62
						52
						255
					]
					text = qs("100%")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						-1.0
					]
				}
			}
			{
				props = {
					local_id = percent_p3
					type = TextBlockElement
					dims = (90.0, 35.0)
					just = [
						0.0
						-1.0
					]
					pos = (741.0, 0.0)
					z_priority = 2.0
					rgba = [
						59
						62
						52
						255
					]
					text = qs("100%")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						-1.0
					]
				}
			}
			{
				props = {
					local_id = percent_p4
					type = TextBlockElement
					dims = (90.0, 35.0)
					just = [
						0.0
						-1.0
					]
					pos = (880.0, 0.0)
					z_priority = 2.0
					rgba = [
						59
						62
						52
						255
					]
					text = qs("100%")
					font = fontgrid_text_a8
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						1.0
						-1.0
					]
				}
			}
		]
	}
}
uidesc_song_summary_details_list_entry_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
