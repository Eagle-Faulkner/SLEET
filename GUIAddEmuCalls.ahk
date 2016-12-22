SaveNewEmu:
	;submit the info from the GUI
	Gui, 4:Submit, nohide
	;Save all the info to a new INI file with the name the user provided
	IniWrite, %NewEmuCMD1%, %A_WorkingDir%\EmulatorINIs\%NewEmuName%.ini, BasicCommands, StartCMD
	IniWrite, %NewEmuCMD2%, %A_WorkingDir%\EmulatorINIs\%NewEmuName%.ini, BasicCommands, MidCMD
	IniWrite, %NewEmuCMDLoad%, %A_WorkingDir%\EmulatorINIs\%NewEmuName%.ini, BasicCommands, LoadCMD
	IniWrite, %NewEmuCMD3%, %A_WorkingDir%\EmulatorINIs\%NewEmuName%.ini, BasicCommands, EndCMD
	IniWrite, %NewEmuCMDFScrn%, %A_WorkingDir%\EmulatorINIs\%NewEmuName%.ini, AdvCommands, FullScreenCommand
	IniWrite, %NewEmuCMDFScrnPos%, %A_WorkingDir%\EmulatorINIs\%NewEmuName%.ini, AdvCommands, FullScreenCommandLocation
	;Tell the user it was completed
	MsgBox, %NewEmuName% has been added!
	;Close the GUI
	Gui, 4: Cancel
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
