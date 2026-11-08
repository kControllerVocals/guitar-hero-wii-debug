uidesc_notification_box = {
	DescVersion = 1
	name = uidesc_notification_box
	rect = [
		-50.0
		-156.0
		993.0418
		600.0
	]
	aliases = [
	]
	props = [
	]
	materials = [
	]
	FormatVersion = 2
	elements = {
		props = {
			local_id = notification_box_cont
			type = ContainerElement
			dims = (100.0, 100.0)
			pos = (0.0, 0.0)
			z_priority = 10000.0
		}
		children = [
			{
				props = {
					texture = notification_box
					local_id = notification_box
					type = SpriteElement
					dims = (600.0, 600.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (640.0, 144.0)
					z_priority = 10001.0
				}
			}
			{
				props = {
					local_id = notification_text
					type = TextBlockElement
					dims = (500.0, 80.0)
					pos_anchor = [
						0.0
						0.0
					]
					pos = (640.0, 360.0)
					z_priority = 10002.0
					scale = (1.2, 1.2)
					rot_angle = -5.0
					rgba = [
						0
						0
						0
						255
					]
					text = qs("FOR THE OPTIMAL DRUMMING EXPERIENCE, USE AN OFFICIAL GUITAR HERO DRUM CONTROLLER")
					font = fontgrid_title_a1
					fit_width = wrap
					fit_height = `scale down if larger`
					scale_mode = proportional
					text_case = Original
					internal_just = [
						0.0
						0.0
					]
					shadow_offs = (3.0, 3.0)
				}
			}
		]
	}
}
uidesc_notification_box_nxgui = {
	WorkspaceForm = {
		ExpansionState = [
		]
	}
	EditMaterialForm = {
	}
}
