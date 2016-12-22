BrowseForDefaultEmuDir:
	FileSelectFolder, DefaultEmuDir ,, %DefaultEmuDir%
	GuiControl,3:, DefaultEmuDir, %DefaultEmuDir%
Return

BrowseForDefaultRomDir:
	FileSelectFolder, DefaultRomDir ,, %DefaultRomDir%
	GuiControl,3:, DefaultRomDir, %DefaultRomDir%
Return

BrowseForDefaultSaveDir:
	FileSelectFolder, DefaultSaveDir ,, %DefaultSaveDir%
	GuiControl,3:, DefaultSaveDir, %DefaultSaveDir%
Return

;Function for the "Save Preferences" button
SavePrefs:
	;Submit contents of the form
	Gui, 3: Submit, Nohide
	;Write default emulator choice to prefs
	IniWrite, %DefaultEmu%, UserData.ini, UserPrefs, DefaultEmulator
	;Write default emulator library to prefs
	IniWrite, %DefaultEmuDir%, UserData.ini, UserPrefs, DefaultEmulatorDirectory
	;Write default rom library to prefs
	IniWrite, %DefaultRomDir%, UserData.ini, UserPrefs, DefaultRomDirectory
	;Write default save directory to prefs
	IniWrite, %DefaultSaveDir%, UserData.ini, UserPrefs, DefaultSaveDirectory
	;Tell user settings are saved
	MsgBox, Your preferences have been saved!
	Gui, 3: Cancel
Return
