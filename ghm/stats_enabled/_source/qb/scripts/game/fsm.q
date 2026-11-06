
script fsm_set \{replacement = child}
	fsm_replace {
		hierarchy = current
		replacement = <replacement>
		state = <state>
		params = <params>
	}
endscript

script register_fsm_states 
endscript
