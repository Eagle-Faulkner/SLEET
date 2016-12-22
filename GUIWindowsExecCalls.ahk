;Function that creates the exectuable.  This first creates an AHK at the output address that will launch the game, then converts it to a standalone executable windows file, then deletes the AHK file
CreateFile:
	;Submit the information from the GUI form
	Gui, 1: Submit, NoHide
	Gui, 7: Submit, Nohide
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
	FileAppend , %AHKScript%, %A_WorkingDir%\Resources\%ShortcutName%.ahk
	;run ahk2exe to make it a standalone executable
	RunWait, %A_WorkingDir%\Resources\Ahk2Exe.exe /in "%A_WorkingDir%\Resources\%ShortcutName%.ahk" /icon "%IconChoice%"
	;delete the AHK file that was created initially
	FileDelete, %A_WorkingDir%\Resources\%ShortcutName%.ahk
	;Move the new file to output directory
	FileMove, %A_WorkingDir%\Resources\%ShortcutName%.exe, %OutputDir%
	;Alert the user that the file has been created
	MsgBox, Done!
Return

BrowseForSave:
	FileSelectFolder, OutputDir, , %DefaultSaveDir%, Choose where you want to save the exe
	GuiControl,7:, OutputDir, %OutputDir%
Return

BrowseForIcon:
	FileSelectFile, IconChoice, , , Choose your icon, Icon (*.ico)
	GuiControl, 7:, IconChoice, %IconChoice%
Return
