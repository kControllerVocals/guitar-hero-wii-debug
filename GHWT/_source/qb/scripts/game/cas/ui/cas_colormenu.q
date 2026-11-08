colormenu_bar_scale = (2.4, 2.0)
colormenu_bar_focus_rgba = [
	200
	200
	200
	255
]
colormenu_bar_unfocus_rgba = [
	200
	200
	200
	128
]
colormenu_bar_pos = (300.0, 0.0)
colormenu_text_pos = (220.0, 2.0)
colormenu_arrow_pos_up = (280.0, 10.0)
colormenu_arrow_pos_down = (280.0, -10.0)
colormenu_arrow_rgba = [
	100
	90
	80
	255
]
colormenu_arrow_scale = 0.5
colormenu_wrap_arrow_left = -53.0
colormenu_wrap_arrow_right = 95.0
default_cas_hue = 0
default_cas_sat = 0
default_cas_value = 50

script colormenu_set_hsv \{use_default_diffuse = 0}
	SetCASAppearanceColor part = <part> h = <h> s = <s> v = <v> use_default_diffuse = <use_default_diffuse>
	if ((<part> = CAS_Female_Hair) || (<part> = CAS_Male_Hair))
		if GetCASAppearancePart part = <part>
			cas_propogate_hair_color
		endif
	endif
	RemoveParameter \{h}
	RemoveParameter \{s}
	RemoveParameter \{v}
	if GetCASAppearancePart \{part = CAS_Body}
		if GotParam \{h}
			change ps2_body_color_h = (<h>)
			change ps2_body_color_s = (<s>)
			change ps2_body_color_v = (<v>)
			change ps2_body_color_use_default_diffuse = (<use_default_diffuse>)
			ForEachIn ($master_editable_list) do = ps2_propegate_body_color
		endif
	endif
	cas_propogate_color_to_other_parts \{part = CAS_Body
		other_parts = $ps2_fleshy_parts_array}
	UpdateCurrentCASModel \{buildScript = color_model_from_appearance}
endscript
