nx_signincomplete = 0
nx_signedin = 0

script startnetworkplatform 
endscript

script networkplatformcomplete 
	printf \{qs(0x2dc218ad)}
	change \{nx_signincomplete = 1}
	if gotparam \{signedin}
		change \{nx_signedin = 1}
	endif
endscript
