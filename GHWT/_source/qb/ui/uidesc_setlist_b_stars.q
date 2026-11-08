uidesc_Setlist_B_stars = {
	DescVersion = 2
	name = uidesc_Setlist_B_stars
	rect = [
		-35.0
		58.0
		150.0
		30.0
	]
	aliases = [
		{
			path = [
				{
					validateLocalID = stars
				}
			]
			name = alias_stars
		}
	]
	props = [
		{
			path = [
				{
					validateLocalID = stars
				}
				{
					index = 0
					validateLocalID = song_complete_star01
					includeParentOwned = false
				}
			]
			name = star_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = stars
				}
				{
					index = 1
					validateLocalID = song_complete_star02
					includeParentOwned = false
				}
			]
			name = star_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = stars
				}
				{
					index = 2
					validateLocalID = song_complete_star03
					includeParentOwned = false
				}
			]
			name = star_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = stars
				}
				{
					index = 3
					validateLocalID = song_complete_star04
					includeParentOwned = false
				}
			]
			name = star_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = stars
				}
				{
					index = 4
					validateLocalID = song_complete_star05
					includeParentOwned = false
				}
			]
			name = star_texture
			target = texture
			type = checksum
		}
		{
			path = [
				{
					validateLocalID = stars
				}
				{
					index = 0
					validateLocalID = song_complete_star01
					includeParentOwned = false
				}
			]
			name = star_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = stars
				}
				{
					index = 1
					validateLocalID = song_complete_star02
					includeParentOwned = false
				}
			]
			name = star_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = stars
				}
				{
					index = 2
					validateLocalID = song_complete_star03
					includeParentOwned = false
				}
			]
			name = star_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = stars
				}
				{
					index = 3
					validateLocalID = song_complete_star04
					includeParentOwned = false
				}
			]
			name = star_rgba
			target = rgba
			type = array_color
		}
		{
			path = [
				{
					validateLocalID = stars
				}
				{
					index = 4
					validateLocalID = song_complete_star05
					includeParentOwned = false
				}
			]
			name = star_rgba
			target = rgba
			type = array_color
		}
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = stars
			type = MenuElement
			dims = (150.0, 30.0)
			pos = (40.0, 73.0)
			z_priority = 10.0
			isVertical = false
			internal_just = [
				0.0
				0.0
			]
			spacing_between = -5
			position_children = true
			fit_major = `expand if content larger`
			fit_minor = `keep dims`
			scale_mode = proportional
		}
		children = [
			{
				props = {
					texture = song_complete_star
					local_id = song_complete_star01
					type = SpriteElement
					dims = (20.0, 20.0)
					pos = (45.0, 15.0)
					z_priority = 11.0
					rgba = [
						0
						0
						0
						255
					]
				}
			}
			{
				props = {
					texture = song_complete_star
					local_id = song_complete_star02
					type = SpriteElement
					dims = (20.0, 20.0)
					pos = (60.0, 15.0)
					z_priority = 11.0
					rgba = [
						0
						0
						0
						255
					]
				}
			}
			{
				props = {
					texture = song_complete_star
					local_id = song_complete_star03
					type = SpriteElement
					dims = (20.0, 20.0)
					pos = (75.0, 15.0)
					z_priority = 11.0
					rgba = [
						0
						0
						0
						255
					]
				}
			}
			{
				props = {
					texture = song_complete_star
					local_id = song_complete_star04
					type = SpriteElement
					dims = (20.0, 20.0)
					pos = (90.0, 15.0)
					z_priority = 11.0
					rgba = [
						0
						0
						0
						255
					]
				}
			}
			{
				props = {
					texture = song_complete_star
					local_id = song_complete_star05
					type = SpriteElement
					dims = (20.0, 20.0)
					pos = (105.0, 15.0)
					z_priority = 11.0
					rgba = [
						0
						0
						0
						255
					]
				}
			}
		]
	}
}
uidesc_Setlist_B_stars_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
