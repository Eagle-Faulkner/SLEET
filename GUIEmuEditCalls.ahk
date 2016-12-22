EditEmuData:
	;submit the info from the GUI
	Gui, 5:Submit, nohide
	;Save the edits
	IniWrite, %EditEmuCMD1%, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, BasicCommands, StartCMD
	IniWrite, %EditEmuCMD2%, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, BasicCommands, MidCMD
	IniWrite, %EditEmuCMDLoad%, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, BasicCommands, LoadCMD
	IniWrite, %EditEmuCMD3%, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, BasicCommands, EndCMD
	IniWrite, %EditEmuCMDFScrn%, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, AdvCommands, FullScreenCommand
	IniWrite, %EditEmuCMDFScrnPos%, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, AdvCommands, FullScreenCommandLocation
	IniWrite, %EditEmulatorDir%, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, EmuInfo, EmulatorLocation
	;alert the user
	MsgBox, %EditEmuName% has been updated!
	;close the GUI
	Gui, 5: Cancel
Return


DeleteEmuData:
	;Deletes the INI of the selected emulator
	FileDelete, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini
	;updates all the lists
	GuiControl, 1:, EmulatorChoice, |%SupportedEmus%
	GuiControl, 1: Choose, EmulatorChoice, %DefaultEmu%
	GuiControl, 3:, DefaultEmu, |%SupportedEmus%
	GuiControl, 3: Choose, DefaultEmu, %DefaultEmu%
	GuiControl, 5:, EditEmuName, |%SupportedEmus%
	MsgBox %EditEmuName% Has been deleted!
Return


UpdateEditEmuGUI:
	Gui, 5: Submit, Nohide
	IniRead, EditEmuCMD1, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, BasicCommands, StartCMD
	GuiControl, 5:, EditEmuCMD1, %EditEmuCMD1%
	IniRead, EditEmuCMD2, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, BasicCommands, MidCMD
	GuiControl, 5:, EditEmuCMD2, %EditEmuCMD2%
	IniRead, EditEmuCMDLoad, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, BasicCommands, LoadCMD
	GuiControl, 5:, EditEmuCMDLoad, %EditEmuCMDLoad%
	IniRead, EditEmuCMD3, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, BasicCommands, EndCMD
	GuiControl, 5:, EditEmuCMD3, %EditEmuCMD3%
	IniRead, EditEmuCMDFScrn, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, AdvCommands, FullScreenCommand
	GuiControl, 5:, EditEmuCMDFScrn, %EditEmuCMDFScrn%
	IniRead, EditEmuCMDFScrnPos, %A_WorkingDir%\EmulatorINIs\%EditEmuName%.ini, AdvCommands, FullScreenCommandLocation
	GuiControl, 5: Choose, EditEmuCMDFScrnPos, %EditEmuCMDFScrnPos%
Return