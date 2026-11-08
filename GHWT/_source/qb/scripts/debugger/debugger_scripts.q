
script OnDebuggerStartup 
	printf \{qs("\LStarting up debugger scripts...")}
	SendScriptFunctionsToDebugger
	DebuggerSendModeText
endscript

script OnDebuggerQuit 
endscript

script DebuggerSendModeText 
	DebuggerGetModeText
	RunRemoteScript {
		ObjID = mouse_window
		ScriptName = SetTitle
		params = {
			('Mouse window: ' + <mode_text>)
		}
	}
endscript

script GetGameScriptFunctionList 
	ScriptFunctions = [
		{text = 'Send Camera to Clipboard' , ScriptName = CopyCameraLocationToClipboard}
	]
	return <...>
endscript

script GetAndCombineScriptFunctionLists 
	GetGameScriptFunctionList
	if ScriptExists \{GetUserScriptFunctionList}
		GetUserScriptFunctionList
		if GotParam \{UserScriptFunctions}
			return {
				FunctionSets = [
					{SetName = 'User Scripts' Functions = <UserScriptFunctions>}
					{SetName = 'Game Scripts' Functions = <ScriptFunctions>}
				]
				title = 'Script Function List'
				id = scriptfuncs
				ButtonScript = RunRemoteScript
			}
		endif
	endif
	return {
		FunctionSets = [
			{SetName = 'Game Scripts' Functions = <ScriptFunctions>}
		]
		title = 'Script Function List'
		id = scriptfuncs
		ButtonScript = RunRemoteScript
	}
endscript

script SendScriptFunctionsToDebugger 
	GetAndCombineScriptFunctionLists
	RunRemoteScript ScriptName = CreateFunctionListWindow params = <...>
endscript
