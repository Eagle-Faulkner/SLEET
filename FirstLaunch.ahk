FileCreateDir, %A_AppData%\SLEET\EmulatorINIs
FileMove, %A_WorkingDir%\EmulatorINIs\*.ini, %A_AppData%\SLEET\EmulatorINIs
FileMove, %A_WorkingDir%\UserData.ini, %A_AppData%\SLEET\
IfExist C:\Program Files\Steam
	{
	SteamDir = C:\Program Files\Steam
	MsgBox Steam installation located at:`r`n%SteamDir%
	IniWrite, %SteamDir%, %A_AppData%\SLEET\UserData.ini, UserPrefs, SteamDirectory
	}
Else IfExist C:\Program Files (x86)\Steam
	{
	SteamDir = C:\Program Files (x86)\Steam
	MsgBox Steam installation located at:`r`n%SteamDir%
	IniWrite, %SteamDir%, %A_AppData%\SLEET\UserData.ini, UserPrefs, SteamDirectory
	}
Else
	{
	MsgBox Uh oh!  We couldn't find your Steam install
	}