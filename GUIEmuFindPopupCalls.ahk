;#######
;NOTE: gBrowseForEmulator is contained in GUIMainCalls.ahk!
;#######


SaveEmuDir:
	Gui, 2: Submit, nohide
	IniWrite, %EmulatorDir%, %A_AppData%\SLEET\EmulatorINIs\%EmulatorChoice%.ini, EmuInfo, EmulatorLocation
	Gui, 2: Destroy
Return

BrowseForEmulator:
	FileSelectFile, EmulatorDir, 1 , %DefaultEmuDir%, Select your emulator
	GuiControl,1:, EmulatorDir, %EmulatorDir%
	GuiControl,2:, EmulatorDir, %EmulatorDir%
Return
