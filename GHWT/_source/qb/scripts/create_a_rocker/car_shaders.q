cas_shader_default = $cas_shader_skin
cas_shader_skin = {
	variable_mappings = {
		diffuse = {
			shader_var = m_psPass0MaterialColor
			type = vector
		}
		transition = {
			shader_var = m_psTansitionColor
			type = vector
		}
		transition_width = {
			shader_var = m_psTansitionWidth
			type = float
		}
		transition_position = {
			shader_var = m_psTansitionPosition
			type = float
		}
		dark = {
			shader_var = m_psDarkColor
			type = vector
		}
		edge = {
			shader_var = m_psEdgeColor
			type = vector
		}
		edge_power = {
			shader_var = m_psEdgePower
			type = float
		}
		edge_amount = {
			shader_var = m_psEdgeAmount
			type = float
		}
		spec_power = {
			shader_var = m_psSpecularPower
			type = vector
		}
		spec_color = {
			shader_var = m_psPass0SpecularColor
			type = vector
		}
		envmap_intensity = {
			shader_var = m_envMapIntensity
			type = float
		}
		normal_map = {
			shader_var = m_normalMapBumpinessPass0
			type = float
		}
	}
}
cas_shader_hair = {
	variable_mappings = {
		diffuse = {
			shader_var = m_psDiffuseColor
			type = vector
		}
		edge = {
			shader_var = m_psEdgeColor
			type = vector
		}
		edge_specular_start = {
			shader_var = m_psEdgeSpecularStart
			type = float
		}
		edge_specular_end = {
			shader_var = m_psEdgeSpecularEnd
			type = float
		}
		edge_specular_power = {
			shader_var = m_psEdgeSpecularPower
			type = float
		}
		edge_mix = {
			shader_var = m_psEdgeMix
			type = float
		}
		primary = {
			shader_var = m_psRColor
			type = vector
		}
		primary_spec_power = {
			shader_var = m_psRSpecWidth
			type = float
		}
		secondary = {
			shader_var = m_psTRTColor
			type = vector
		}
		secondary_spec_power = {
			shader_var = m_psTRTSpecWidth
			type = float
		}
		normal_map = {
			shader_var = m_psMapInfluence
			type = float
		}
		light_wrapping = {
			shader_var = m_psLightWrapping
			type = float
		}
		ambient_cutoff = {
			shader_var = m_psAmbientCutoff
			type = float
		}
	}
}
