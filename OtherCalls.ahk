NoUse:
	MsgBox Nothing here just yet! Sorry!
Return

;function to update the list of supported emulators.  I'll probably condense all the GUI updates for changes to this list within this function in the future
LoadSupportedEmus(ByRef SupportedEmus)
	{
	Loop, Files, %A_WorkingDir%\EmulatorINIs\*.ini
		{
		;Add each .ini stored in the Resources directory as an emulator option
		SupportedEmus = %SupportedEmus%|%A_LoopFileName%
		;Trim off the ".ini" part of each emulator
		StringTrimRight, SupportedEmus, SupportedEmus, 4
		}
	;Trim off the initial | to prevent a blank option
	StringTrimLeft, SupportedEmus, SupportedEmus, 1
	}

;Function to fill the variables needed for what will be executed in the command line of the exe
MakeCMD(ByRef CMD1, ByRef CMD2, ByRef CMDLoad, ByRef CMD3, ByRef CMDFScrn, ByRef CMDFScrnPos, ByRef EmulatorChoice, ByRef EmulatorDir,ByRef RomDir)
	{
	;Read the commands from the emulator's INI
	IniRead, CMD1, %A_WorkingDir%\EmulatorINIs\%EmulatorChoice%.ini, BasicCommands, StartCMD
	IniRead, CMD2, %A_WorkingDir%\EmulatorINIs\%EmulatorChoice%.ini, BasicCommands, MidCMD
	IniRead, CMDLoad, %A_WorkingDir%\EmulatorINIs\%EmulatorChoice%.ini, BasicCommands, LoadCMD
	IniRead, CMD3, %A_WorkingDir%\EmulatorINIs\%EmulatorChoice%.ini, BasicCommands, EndCMD
	IniRead, CMDFScrn, %A_WorkingDir%\EmulatorINIs\%EmulatorChoice%.ini, AdvCommands, FullScreenCommand
	IniRead, CMDFScrnPos, %A_WorkingDir%\EmulatorINIs\%EmulatorChoice%.ini, AdvCommands, FullScreenCommandLocation
	;Logic to determine where the fullscreen command would be located
	If (CMDFScrnPos=1)
		{
		CMD1 = %CMD1% %CMDFScrn%
		}
	If (CMDFScrnPos=2)
		{
		CMD2 = %CMD2% %CMDFScrn%
		}
	If (CMDFScrnPos=3)
		{
		CMD3 = %CMD3% %CMDFScrn%
		}
	;special line of code for setting up MAME exes because MAME's commands don't fit the standard format that the rest of the emulators fit
	If (EmulatorChoice="MAME")
		{
		SplitPath, RomDir, CMD3, RomDir
		;RomDir = %RomDir%
		;CMD3 = CMD3
		}
	;Send all the values back
	Return, CMD1, CMD2, CMDLoad, CMD3, CMDFScrn, CMDFScrnPos, RomDir
	}


