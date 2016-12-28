UpdateEditFullCommandDisplayer:
	Gui, 5: Submit, Nohide
	If EditQuoteAround=1
		{
		EditRomPath = "C:\path\to\your\rom.iso"
		}
	Else If EditQuoteAround=0
		{
		EditRomPath = C:\path\to\your\rom.iso
		}
	If EditEmuCMDFScrnPos=1
		{
		FullCommandDisplay = %EditEmulatorDir% %EditEmuCMD2% %EditEmuCMDFScrn% %EditEmuCMDLoad% %EditRomPath% %EditEmuCMD3%
		}
	Else If EditEmuCMDFScrnPos=2
		{
		FullCommandDisplay = %EditEmulatorDir% %EditEmuCMD2% %EditEmuCMDLoad% %EditRomPath% %EditEmuCMDFScrn% %EditEmuCMD3%
		}
	
	GuiControl, 5:, EditFullCommandDisplayer, %FullCommandDisplay%
Return

LoadIniData:
	GuiControlGet, EditEmuName
	IfNotExist %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini
		{
		EditEmuName = %EmulatorChoice%
		}
	IniRead, EditEmuCMD2, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, BasicCommands, MidCMD
	IniRead, EditEmuCMDLoad, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, BasicCommands, LoadCMD
	IniRead, EditEmuCMD3, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, BasicCommands, EndCMD
	
	IniRead, EditEmuCMDFScrn, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, AdvCommands, FullScreenCommand
	IniRead, EditEmuCMDFScrnPos, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, AdvCommands, FullScreenCommandLocation
	IniRead, EditQuoteAround, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, AdvCommands, HasQuotes
	
	IniRead, EditEmulatorDir, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, EmuInfo, EmulatorLocation
Return

UpdateEditFields:
	GoSub, LoadIniData
	GuiControl, 5:, EditEmulatorDir, %EditEmulatorDir%
	GuiControl, 5:, EditEmuCMD2, %EditEmuCMD2%
	GuiControl, 5:, EditEmuCMDLoad, %EditEmuCMDLoad%
	GuiControl, 5:, EditEmuCMD3, %EditEmuCMD3%
	GuiControl, 5:, EditQuoteAround, %EditQuoteAround%
	GuiControl, 5:, EditEmuCMDFScrn, %EditEmuCMDFScrn%
	GuiControl, 5:Choose, EditEmuCMDFScrnPos, %EditEmuCMDFScrnPos%
	GoSub, UpdateEditFullCommandDisplayer
Return

BrowseForEditEmulator:
	FileSelectFile, EditEmulatorDir, 1 , %DefaultEmuDir%, Select the emulator
	GuiControl,5:, EditEmulatorDir, %EditEmulatorDir%
	GoSub, UpdateEditFullCommandDisplayer
Return

SaveEditEmu:
	;submit the info from the GUI
	Gui, 5:Submit, nohide
	;Save all the info to a Edit INI file with the name the user provided
	IniWrite, %EditEmuCMD2%, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, BasicCommands, MidCMD
	IniWrite, %EditEmuCMDLoad%, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, BasicCommands, LoadCMD
	IniWrite, %EditEmuCMD3%, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, BasicCommands, EndCMD
	
	IniWrite, %EditEmuCMDFScrn%, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, AdvCommands, FullScreenCommand
	IniWrite, %EditEmuCMDFScrnPos%, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, AdvCommands, FullScreenCommandLocation
	IniWrite, %EditQuoteAround%, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, AdvCommands, HasQuotes
	
	IniWrite, %EditEmulatorDir%, %A_AppData%\SLEET\EmulatorINIs\%EditEmuName%.ini, EmuInfo, EmulatorLocation
	;Tell the user it was completed
	MsgBox, %EditEmuName% has been Updated!
	;Close the GUI
	Gui, 5: 
	Gui, 1:-Disabled
Return
