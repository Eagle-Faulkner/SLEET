UpdateNewFullCommandDisplayer:
	Gui, 4: Submit, Nohide
	If NewQuoteAround=1
		{
		NewRomPath = "C:\path\to\your\rom.iso"
		}
	Else If NewQuoteAround=0
		{
		NewRomPath = C:\path\to\your\rom.iso
		}
	If NewEmuCMDFScrnPos=1
		{
		FullCommandDisplay = %NewEmulatorDir% %NewEmuCMD2% %NewEmuCMDFScrn% %NewEmuCMDLoad% %NewRomPath% %NewEmuCMD3%
		}
	Else If NewEmuCMDFScrnPos=2
		{
		FullCommandDisplay = %NewEmulatorDir% %NewEmuCMD2% %NewEmuCMDLoad% %NewRomPath% %NewEmuCMDFScrn% %NewEmuCMD3%
		}
	
	GuiControl, 4:, NewFullCommandDisplayer, %FullCommandDisplay%
Return


BrowseForNewEmulator:
	FileSelectFile, NewEmulatorDir, 1 , %DefaultEmuDir%, Select the emulator
	GuiControl,4:, NewEmulatorDir, %NewEmulatorDir%
	GoSub, UpdateNewFullCommandDisplayer
Return

SaveNewEmu:
	;submit the info from the GUI
	Gui, 4:Submit, nohide
	;Save all the info to a new INI file with the name the user provided
	IniWrite, %NewEmuCMD2%, %A_AppData%\SLEET\EmulatorINIs\%NewEmuName%.ini, BasicCommands, MidCMD
	IniWrite, %NewEmuCMDLoad%, %A_AppData%\SLEET\EmulatorINIs\%NewEmuName%.ini, BasicCommands, LoadCMD
	IniWrite, %NewEmuCMD3%, %A_AppData%\SLEET\EmulatorINIs\%NewEmuName%.ini, BasicCommands, EndCMD
	
	IniWrite, %NewEmuCMDFScrn%, %A_AppData%\SLEET\EmulatorINIs\%NewEmuName%.ini, AdvCommands, FullScreenCommand
	IniWrite, %NewEmuCMDFScrnPos%, %A_AppData%\SLEET\EmulatorINIs\%NewEmuName%.ini, AdvCommands, FullScreenCommandLocation
	IniWrite, %NewQuoteAround%, %A_AppData%\SLEET\EmulatorINIs\%NewEmuName%.ini, AdvCommands, HasQuotes
	
	IniWrite, %NewEmulatorDir%, %A_AppData%\SLEET\EmulatorINIs\%NewEmuName%.ini, EmuInfo, EmulatorLocation
	;Tell the user it was completed
	MsgBox, %NewEmuName% has been added!
	;Close the GUI
	Gui, 4: Cancel
	Gui, 1:-Disabled
	;Clear the list of supported Emulators
	SupportedEmus = 
	;Update the list of supported emulators
	LoadSupportedEmus(SupportedEmus)
	;update all the lists in the GUIs
	GuiControl, 1:, EmulatorChoice, |%SupportedEmus%
	GuiControl, 1: Choose, EmulatorChoice, %DefaultEmu%
	GuiControl, 3:, DefaultEmu, |%SupportedEmus%
	GuiControl, 3: Choose, DefaultEmu, %DefaultEmu%
	GuiControl, 5:, EditEmuName, |%SupportedEmus%
Return
