

EditSteamDir:
	GuiControlGet, SteamDir, , , 
Return


DetectSteamUsers:
	Gui, 6:Submit, NoHide
	If HasDetectedUsers
		{
		Return
		}
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
	CurrentLine = 11
	StringTrimRight, AliasList, AliasList, 1
	If !(AliasList = "")
		{
		HasDetectedUsers = 1
		}
	GuiControl,6:, AliasChoice, |%AliasList%
	GuiControl, 6:Choose, AliasChoice, 1
Return

CreateShortcut:
	Gui, 1:Submit, Nohide
	Gui, 6:Submit, Nohide
	GuiControlGet, CurrentNameChoice, , AliasChoice, text
	Guicontrolget, AliasChoice, , AliasChoice,
	UserNameChoice := UserName%AliasChoice%
	UserIDChoice := UserID%AliasChoice%
	VDFDir = %SteamDir%\userdata\%UserIDChoice%
	File := FileOpen(VDFDir . "\config\Shortcuts.vdf","a")
	GoSub, AddQuotesCMD
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
	File.Write(ShortcutName) ;name that is shown in Steam
	File.WriteChar(0)
	File.WriteChar(1)
	File.Write("exe") ;filetype being pointed to, don't change
	File.WriteChar(0)
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
