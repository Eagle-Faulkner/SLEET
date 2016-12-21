Return

SaveEmuDir:
	Gui, 2: Submit, nohide
	IniWrite, %EmulatorDir%, %A_WorkingDir%\EmulatorINIs\%EmulatorChoice%.ini, EmuInfo, EmulatorLocation
	Gui, 2: Destroy
Return

Return
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


;This function only exists t update the Edit Emulator GUI
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

;Function that creates the exectuable.  This first creates an AHK at the output address that will launch the game, then converts it to a standalone executable windows file, then deletes the AHK file
CreateFile:
	;Submit the information from the GUI form
	Gui, 1: Submit, NoHide
	IfNotExist, %EmulatorDir%
		{
		MsgBox Uh oh!`r`nLooks like your emulator is missing!
		Return
		}
	IfNotExist, %RomDir%
		{
		MsgBox Uh oh!`r`nLooks like your rom is missing!
		Return
		}
	IfNotExist, %IconChoice%
		{
		IconChoice = %A_WorkingDir%\Resources\sleet.ico
		MsgBox Icon doesn't exist!
		}
	;Choose the commands to run in CMD with the executable
	MakeCMD(CMD1, CMD2, CMDLoad, CMD3, CMDFScrn, CMDFScrnPos, EmulatorChoice, EmulatorDir, RomDir)
	;Create the AHK script
	AHKScript = #SingleInstance off`r`nRunWait, %CMD1% "%EmulatorDir%" %CMD2% %CMDLoad% "%RomDir%" %CMD3%
	;Create the AHK
	FileAppend , %AHKScript%, %A_WorkingDir%\Resources\%ExeName%.ahk
	;run ahk2exe to make it a standalone executable
	RunWait, %A_WorkingDir%\Resources\Ahk2Exe.exe /in "%A_WorkingDir%\Resources\%ExeName%.ahk" /icon "%IconChoice%"
	;delete the AHK file that was created initially
	FileDelete, %A_WorkingDir%\Resources\%ExeName%.ahk
	;Move the new file to output directory
	FileMove, %A_WorkingDir%\Resources\%ExeName%.exe, %OutputDir%
	;Alert the user that the file has been created
	MsgBox, Done!
Return

EditPrefs:
	Gui, 3: Show, autosize, SLEET | %Version%
Return

EmuSupportAdd:
	Gui, 4: Show, autosize, SLEET | %Version%
Return

EmuSupportEdit:
	Gui, 5: Show, autosize, SLEET | %Version%
Return

;Various browse buttons below
BrowseForEmulator:
	FileSelectFile, EmulatorDir, 1 , %DefaultEmuDir%, Select your emulator
	GuiControl,1:, EmulatorDir, %EmulatorDir%
	GuiControl,2:, EmulatorDir, %EmulatorDir%
Return

BrowseForIcon:
	FileSelectFile, IconChoice, , , Choose your icon, Icon (*.ico)
	GuiControl, 1:, IconChoice, %IconChoice%
Return

BrowseForRom:
	FileSelectFile, RomDir, ,%DefaultRomDir%, Select your rom for %EmulatorChoice%
	GuiControl,1:, RomDir, %RomDir%
Return

BrowseForSteamDir:
	FileSelectFolder, SteamDir, , , Locate your Steam Install 
	GuiControl,1:, SteamDir, %SteamDir%
Return

BrowseForSave:
	FileSelectFolder, OutputDir, , %DefaultSaveDir%, Choose where you want to save the exe
	GuiControl,1:, OutputDir, %OutputDir%
Return

;Function to check for the location of an emulator when it is selected in the Basic tab of the main GUI
;This exists so that you'll only ever need to tell it where your emulator is once
CheckEmuDir:
	;Submit the information from the form
	Gui, 1: Submit, Nohide
	;Load the address of the emulator's directory
	IniRead, EmulatorDir, %A_WorkingDir%\EmulatorINIs\%EmulatorChoice%.ini, EmuInfo, EmulatorLocation
	;Check if the address exists and if it doesn't, ask the user for the address of the emulator
	IfNotExist, %EmulatorDir%
		{
		Gui, 2: Show, autosize, SLEET | %Version%
		}
	GuiControl,1:, EmulatorDir, %EmulatorDir%
	;IniWrite, %DefaultSaveDir%, UserData.ini, UserPrefs, DefaultSaveDirectory
Return

;placeholder call
NoUse:
	MsgBox Nothing here just yet! Sorry!
Return


DetectSteamUsers:
	Gui, 6:Submit, NoHide
	HasDetected = 1
	ConfigDir = %SteamDir%\Config\config.vdf
	Loop
		{
		FileReadLine, name, %SteamDir%\Config\Config.vdf, CurrentLine
		FileReadLine, UID, %SteamDir%\Config\Config.vdf, CurrentLine+2
		StringTrimLeft, name, name, 6
		StringTrimRight, name, name, 1
		StringTrimLeft, UID, UID, 18
		StringTrimRight, UID, UID, 1
		UID := 76561197960265728-UID
		Transform, UID, Abs, UID
		If name is not Integer
			{
			If UID is Integer
				{
				UserNames = %UserNames%%name%,
				UserIDs = %UserIDs%%UID%,
				
				CurrentLine := CurrentLine+4
				}
			}
		If name is not Integer
			{
			If UID is not Integer
				{
				Break
				}
			}
		}
	StringTrimRight, UserNames, UserNames, 1
	StringTrimRight, UserIDs, UserIDs, 1

	Loop, Parse, UserNames, `,
		{
		UserName%A_Index% = %A_LoopField%
		}
	Loop, Parse, UserIDs, `,
		{
		UserID%A_Index% = %A_LoopField%
		}
	
	Loop
		{
		UserDataDir := UserID%A_Index%
		IfExist %SteamDir%\UserData\%UserDataDir%\config\localconfig.vdf
			{
			Loop
				{
				FileReadLine, Line, %SteamDir%\UserData\%UserDataDir%\config\localconfig.vdf, %A_Index%
				FileReadLine, Alias, %SteamDir%\UserData\%UserDataDir%\config\localconfig.vdf, %A_Index%
				StringTrimLeft Alias, Alias, 18
				StringTrimRight Alias, Alias, 1
				StringTrimLeft, Line, Line, 3
				Loop, Parse, Line
					{
					If A_Loopfield = %A_Tab%
					Break
					result .= A_Loopfield
					}
				
				StringTrimRight, Line, Result, 1
				Result = 
				
				If (Line="PersonaName")
					{
					AliasList = %AliasList%%Alias%|
					Break
					}
				}
			}
		IfNotExist %SteamDir%\UserData\%UserDataDir%\config\localconfig.vdf
			{
			Break
			}
		}
	StringTrimRight, AliasList, AliasList, 1
	MsgBox Steam users have been detected!
	GuiControl,1:, AliasChoice, |%AliasList%
	GuiControl, 1:Choose, AliasChoice, 1
Return

EditSteamDir:
	GuiControlGet, SteamDir, , , 
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

CreateShortcut:
	Gui, 1:Submit, Nohide
	GuiControlGet, CurrentNameChoice, , AliasChoice, text
	Guicontrolget, AliasChoice, , AliasChoice,
	If (HasDetected=0)
		{
		MsgBox You haven't chosen a Steam user!
		Return
		}
	UserNameChoice := UserName%AliasChoice%
	UserIDChoice := UserID%AliasChoice%
	VDFDir = %SteamDir%\userdata\%UserIDChoice%
	File := FileOpen(VDFDir . "\config\Shortcuts.vdf","a")
	If !IsObject(File)
		{
		MsgBox VDF ERROR`r`nFile not found!
		Return
		}
	FileLen := file.Length
	File.Tell(FileLen-2)
	File.WriteChar(0)
	File.Write("0") ;just a number that steam will fix
	File.WriteChar(0)
	File.WriteChar(1)
	File.Write("appname") ;Don't change this, it tells steam that the next part is the name of the app
	File.WriteChar(0)
	File.Write(ExeName) ;name that is shown in Steam
	File.WriteChar(0)
	File.WriteChar(1)
	File.Write("exe") ;filetype being pointed to, don't change
	File.WriteChar(0)
	RomDir = "%RomDir%"
	EmulatorDir = "%EmulatorDir%"
	File.Write(EmulatorDir " " CMD2 " " CMDLoad " " RomDir " " CMD3) ;path to the exe along with any commands needed
	File.WriteChar(0)
	File.WriteChar(1)
	File.Write("StartDir") ;Required, don't change
	File.WriteChar(0)
	SplitPath, EmulatorDir, ,EmulatorTopDir
	File.Write(EmulatorTopDir) ;points to the folder that the exe is in
	File.WriteChar(0)
	File.WriteChar(1)
	File.Write("icon") ;Required field, don't change
	File.WriteChar(0)
	File.Write(EmulatorDir) ;path to an icon
	File.WriteChar(0)
	File.WriteChar(1)
	File.Write("ShortcutPath") ;Required field, don't change
	File.WriteChar(0)
	File.WriteChar(0)
	File.WriteChar(2)
	File.Write("hidden") ;Required Field, don't change
	File.WriteChar(0)
	File.WriteChar(1)
	File.WriteChar(0)
	File.WriteChar(0)
	File.WriteChar(0)
	File.WriteChar(0)
	File.Write("tags") ;Required Field, don't change
	File.WriteChar(0)
	;Tag fields start here
	;File.WriteChar(1)
	;File.Write("0")
	;File.WriteChar(0)
	;File.Write("favorite")
	;File.WriteChar(0)
	;File.WriteChar(1)
	;File.Write("1")
	;File.WriteChar(0)
	;File.Write("test_tag")
	;File.WriteChar(0)
	;File.WriteChar(1)
	;File.Write("2")
	;File.WriteChar(0)
	;File.Write("test_tag2")
	;File.WriteChar(0)
	File.WriteChar(8)
	File.WriteChar(8)
	File.WriteChar(8)
	File.WriteChar(8)
	File.Close()
	MsgBox Successfully added shortcut to Steam!`r`nPlease note that if Steam was open during this process you will`r`nhave to exit Steam and reopen it for the shortcut`r`nto be loaded into your library
Return

